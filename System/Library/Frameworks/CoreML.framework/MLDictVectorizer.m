@implementation MLDictVectorizer

- (MLDictVectorizer)initWith:(id)a3 dataTransformerName:(id)a4 inputDescription:(id)a5 outputDescription:(id)a6 orderedInputFeatureNames:(id)a7 orderedOutputFeatureNames:(id)a8 configuration:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  MLDictVectorizer *v22;
  uint64_t v23;
  NSOrderedSet *categoryName;
  void *v25;
  BOOL v26;
  void *v27;
  BOOL v28;
  MLDictVectorizer *v29;
  void *v31;
  id v32;
  objc_super v33;

  v32 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v33.receiver = self;
  v33.super_class = (Class)MLDictVectorizer;
  v31 = v16;
  v22 = -[MLModelEngine initWithName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:](&v33, sel_initWithName_inputDescription_outputDescription_orderedInputFeatureNames_orderedOutputFeatureNames_configuration_, v16, v17, v18, v19, v20, v21);
  if (!v22)
    goto LABEL_4;
  v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v32);
  categoryName = v22->_categoryName;
  v22->_categoryName = (NSOrderedSet *)v23;

  objc_msgSend(v17, "allValues");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:](MLModelDescriptionUtils, "validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:", v25, &unk_1E3DA2A38, 1, -1, CFSTR("MLDictVectorizer Inputs"), a10);

  if (!v26)
    goto LABEL_5;
  objc_msgSend(v18, "allValues");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:](MLModelDescriptionUtils, "validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:", v27, &unk_1E3DA2A50, 1, 1, CFSTR("MLDictVectorizer Outputs"), a10);

  if (v28)
LABEL_4:
    v29 = v22;
  else
LABEL_5:
    v29 = 0;

  return v29;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  MLDictionaryFeatureProvider *v22;
  void *v23;
  MLDictionaryFeatureProvider *v24;
  id v26;
  _QWORD aBlock[7];
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v8 = a4;
  v9 = -[MLDictVectorizer predictionTypeForKTrace](self, "predictionTypeForKTrace");
  v10 = -[MLModelEngine signpostID](self, "signpostID");
  v11 = objc_msgSend(v8, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__MLDictVectorizer_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_56_e5_v8__0l;
  aBlock[4] = v9;
  aBlock[5] = v10;
  aBlock[6] = v11;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[MLModelEngine modelDescription](self, "modelDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inputFeatureNames");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLModelEngine modelDescription](self, "modelDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "outputFeatureNames");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "featureValueForName:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[MLDictVectorizer constructDictionary:error:](self, "constructDictionary:error:", v19, a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      +[MLFeatureValue featureValueWithDictionary:error:](MLFeatureValue, "featureValueWithDictionary:error:", v20, a5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = [MLDictionaryFeatureProvider alloc];
      v28 = v18;
      v29[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v22, "initWithDictionary:error:", v23, a5);

    }
    else
    {
      v24 = 0;
    }

  }
  else if (a5)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Expected input column '%@ not present."), v15);
    v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  v12[2](v12);
  return v24;
}

- (unint64_t)predictionTypeForKTrace
{
  return 16;
}

- (id)constructDictionary:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSUInteger v14;
  void *v15;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "dictionaryValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v6;
  if (v6)
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count", v6));
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[NSOrderedSet indexOfObject:](self->_categoryName, "indexOfObject:", v12);
          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKey:", v13, v15);

          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

  }
  else if (a4)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Type of input not dictionary as expected."), 0);
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (NSOrderedSet)categoryName
{
  return self->_categoryName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryName, 0);
}

uint64_t __57__MLDictVectorizer_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v7;
  CoreML::Specification::protobuf_DictVectorizer_2eproto *inited;
  CoreML::Specification::protobuf_DictVectorizer_2eproto *v9;
  uint64_t *v10;
  int v11;
  uint64_t j;
  uint64_t *v13;
  void *v14;
  uint64_t *v15;
  uint64_t *v16;
  void *v17;
  uint64_t i;
  uint64_t *v19;
  void *v20;
  uint64_t *v21;
  void *v22;
  id v23;
  MLDictVectorizer *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  MLDictVectorizer *v29;

  v7 = a4;
  inited = (CoreML::Specification::protobuf_DictVectorizer_2eproto *)objc_opt_new();
  v9 = inited;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 603)
  {
    v10 = *(uint64_t **)(*(_QWORD *)a3 + 32);
  }
  else
  {
    inited = (CoreML::Specification::protobuf_DictVectorizer_2eproto *)CoreML::Specification::protobuf_DictVectorizer_2eproto::InitDefaults(inited);
    v10 = &CoreML::Specification::_DictVectorizer_default_instance_;
  }
  v11 = *((_DWORD *)v10 + 7);
  if (v11 == 2)
  {
    for (i = 0; ; ++i)
    {
      if (v11 == 2)
      {
        v19 = (uint64_t *)v10[2];
      }
      else
      {
        inited = (CoreML::Specification::protobuf_DictVectorizer_2eproto *)CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        v19 = &CoreML::Specification::_Int64Vector_default_instance_;
      }
      if (i >= *((int *)v19 + 4))
        break;
      v20 = (void *)MEMORY[0x1E0CB37E8];
      if (*((_DWORD *)v10 + 7) == 2)
      {
        v21 = (uint64_t *)v10[2];
      }
      else
      {
        CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        v21 = &CoreML::Specification::_Int64Vector_default_instance_;
      }
      objc_msgSend(v20, "numberWithLongLong:", *(_QWORD *)(v21[3] + 8 * i + 8));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreML::Specification::protobuf_DictVectorizer_2eproto addObject:](v9, "addObject:", v22);

      v11 = *((_DWORD *)v10 + 7);
    }
  }
  else if (v11 == 1)
  {
    for (j = 0; ; ++j)
    {
      if (v11 == 1)
      {
        v13 = (uint64_t *)v10[2];
      }
      else
      {
        inited = (CoreML::Specification::protobuf_DictVectorizer_2eproto *)CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        v13 = &CoreML::Specification::_StringVector_default_instance_;
      }
      if (j >= *((int *)v13 + 6))
        break;
      v14 = (void *)MEMORY[0x1E0CB3940];
      if (*((_DWORD *)v10 + 7) == 1)
      {
        v15 = (uint64_t *)v10[2];
      }
      else
      {
        CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        v15 = &CoreML::Specification::_StringVector_default_instance_;
      }
      v16 = *(uint64_t **)(v15[4] + 8 * j + 8);
      if (*((char *)v16 + 23) < 0)
        v16 = (uint64_t *)*v16;
      objc_msgSend(v14, "stringWithUTF8String:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreML::Specification::protobuf_DictVectorizer_2eproto addObject:](v9, "addObject:", v17);

      v11 = *((_DWORD *)v10 + 7);
    }
  }
  v23 = -[MLModelDescription initFromSingleFunctionModelSpecification:]([MLModelDescription alloc], "initFromSingleFunctionModelSpecification:", a3);
  v24 = [MLDictVectorizer alloc];
  objc_msgSend(v23, "inputDescriptionsByName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "outputDescriptionsByName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "inputFeatureNames");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "outputFeatureNames");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[MLDictVectorizer initWith:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:error:](v24, "initWith:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:error:", v9, CFSTR("dict vectorizer"), v25, v26, v27, v28, v7, a5);

  return v29;
}

+ (id)categoryName:(id)a3 inputDescription:(id)a4 outputDescription:(id)a5 orderedInputFeatureNames:(id)a6 orderedOutputFeatureNames:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  MLDictVectorizer *v18;
  MLModelConfiguration *v19;
  MLDictVectorizer *v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = [MLDictVectorizer alloc];
  v19 = objc_alloc_init(MLModelConfiguration);
  v20 = -[MLDictVectorizer initWith:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:error:](v18, "initWith:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:error:", v13, CFSTR("MLDictVectorizer"), v14, v15, v16, v17, v19, a8);

  return v20;
}

+ (id)categoryName:(id)a3 dataTransformerName:(id)a4 inputDescription:(id)a5 outputDescription:(id)a6 orderedInputFeatureNames:(id)a7 orderedOutputFeatureNames:(id)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  MLDictVectorizer *v20;
  MLModelConfiguration *v21;
  MLDictVectorizer *v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = [MLDictVectorizer alloc];
  v21 = objc_alloc_init(MLModelConfiguration);
  v22 = -[MLDictVectorizer initWith:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:error:](v20, "initWith:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:error:", v14, v15, v16, v17, v18, v19, v21, a9);

  return v22;
}

@end
