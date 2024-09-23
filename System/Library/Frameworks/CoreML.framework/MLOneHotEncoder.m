@implementation MLOneHotEncoder

- (MLOneHotEncoder)initWith:(id)a3 dataTransformerName:(id)a4 ouputSparse:(BOOL)a5 handleUnknown:(BOOL)a6 inputDescription:(id)a7 outputDescription:(id)a8 orderedInputFeatureNames:(id)a9 orderedOutputFeatureNames:(id)a10 configuration:(id)a11
{
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  MLOneHotEncoder *v28;
  MLOneHotEncoder *v29;
  void *v30;
  BOOL v31;
  void *v32;
  BOOL v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  unint64_t v39;
  MLOneHotEncoder *v40;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v17 = a4;
  v18 = a7;
  v19 = a8;
  v20 = v17;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v51.receiver = self;
  v51.super_class = (Class)MLOneHotEncoder;
  v45 = v22;
  v46 = v18;
  v24 = v18;
  v25 = v19;
  v44 = v21;
  v26 = v22;
  v27 = v23;
  v28 = -[MLModelEngine initWithName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:](&v51, sel_initWithName_inputDescription_outputDescription_orderedInputFeatureNames_orderedOutputFeatureNames_configuration_, v20, v24, v19, v21, v26, v23);
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_featureEncoding, a3);
    v29->_ouputSparse = a5;
    v29->_handleUnknown = a6;
    objc_msgSend(v46, "allValues");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:](MLModelDescriptionUtils, "validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:", v30, &unk_1E3DA2AC8, 1, 1, CFSTR("MLOneHotEncoder Inputs"), 0);

    if (!v31
      || (objc_msgSend(v25, "allValues"),
          v32 = (void *)objc_claimAutoreleasedReturnValue(),
          v33 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:](MLModelDescriptionUtils, "validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:", v32, &unk_1E3DA2AE0, 1, 1, CFSTR("MLOneHotEncoder Outputs"), 0), v32, !v33))
    {
LABEL_22:
      v40 = 0;
      goto LABEL_23;
    }
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v25, "allKeys");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v48;
      while (2)
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v48 != v36)
            objc_enumerationMutation(v34);
          objc_msgSend(v25, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "type");
          if (v39 <= 8)
          {
            if (v39 == 5)
            {
              if (v29->_ouputSparse)
                goto LABEL_21;
            }
            else if (v39 == 6)
            {
              if (!v29->_ouputSparse)
                goto LABEL_21;
            }
            else if (((1 << v39) & 0x195) != 0)
            {
LABEL_21:
              NSLog(CFSTR("%@: Output description type must be MLTypeDictionary (ouputSparse On) or                       MLFeatureTypeMultiArray (ouputSparse Off) "), v20);

              goto LABEL_22;
            }
          }

        }
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        if (v35)
          continue;
        break;
      }
    }

  }
  v40 = v29;
LABEL_23:

  return v40;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void (**v13)(_QWORD);
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
  _QWORD aBlock[7];
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = -[MLOneHotEncoder predictionTypeForKTrace](self, "predictionTypeForKTrace");
  v11 = -[MLModelEngine signpostID](self, "signpostID");
  v12 = objc_msgSend(v9, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__MLOneHotEncoder_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_56_e5_v8__0l;
  aBlock[4] = v10;
  aBlock[5] = v11;
  aBlock[6] = v12;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[MLModelEngine modelDescription](self, "modelDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "inputFeatureNames");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLModelEngine modelDescription](self, "modelDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "outputFeatureNames");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "featureValueForName:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLOneHotEncoder encodeFeatureValue:](self, "encodeFeatureValue:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = [MLDictionaryFeatureProvider alloc];
    v27 = v19;
    v28[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v22, "initWithDictionary:error:", v23, a5);
  }
  else
  {
    if (!a5)
    {
      v24 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v8, "featureValueForName:", v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("MLOneHotEncoder: unknown category %@, expected one of %@"), v23, self->_featureEncoding);
    v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  v13[2](v13);

  return v24;
}

- (unint64_t)predictionTypeForKTrace
{
  return 12;
}

- (id)encodeFeatureValue:(id)a3
{
  id v4;
  NSOrderedSet *featureEncoding;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 1)
  {
    featureEncoding = self->_featureEncoding;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "int64Value"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSOrderedSet indexOfObject:](featureEncoding, "indexOfObject:", v6);

    -[MLOneHotEncoder encodeFeatureValueIntString:](self, "encodeFeatureValueIntString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "type") == 3)
  {
    objc_msgSend(v4, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[MLOneHotEncoder encodeFeatureValueIntString:](self, "encodeFeatureValueIntString:", -[NSOrderedSet indexOfObject:](self->_featureEncoding, "indexOfObject:", v9));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)unknownDenseVector
{
  id v3;
  NSUInteger i;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = -[NSOrderedSet count](self->_featureEncoding, "count"); i; --i)
    objc_msgSend(v3, "addObject:", &unk_1E3DA2698);
  +[MLMultiArray doubleVectorWithValues:](MLMultiArray, "doubleVectorWithValues:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)encodeFeatureValueIntString:(unint64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  NSUInteger v9;
  uint64_t i;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (-[MLOneHotEncoder handleUnknown](self, "handleUnknown"))
    {
      if (self->_ouputSparse)
      {
        return MEMORY[0x1E0C9AA70];
      }
      else
      {
        -[MLOneHotEncoder unknownDenseVector](self, "unknownDenseVector");
        return (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      return 0;
    }
  }
  else if (self->_ouputSparse)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v6;
    v13[0] = &unk_1E3DA26B0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    v8 = (void *)objc_opt_new();
    v9 = -[NSOrderedSet count](self->_featureEncoding, "count");
    if (v9)
    {
      for (i = 0; i != v9; ++i)
        objc_msgSend(v8, "setObject:atIndexedSubscript:", &unk_1E3DA2698, i);
    }
    objc_msgSend(v8, "replaceObjectAtIndex:withObject:", a3, &unk_1E3DA26B0);
    +[MLMultiArray doubleVectorWithValues:](MLMultiArray, "doubleVectorWithValues:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
}

- (NSOrderedSet)featureEncoding
{
  return self->_featureEncoding;
}

- (BOOL)ouputSparse
{
  return self->_ouputSparse;
}

- (BOOL)handleUnknown
{
  return self->_handleUnknown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureEncoding, 0);
}

uint64_t __56__MLOneHotEncoder_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  CoreML::Specification::protobuf_OneHotEncoder_2eproto *v6;
  uint64_t *v7;
  CoreML::Specification::protobuf_DataStructures_2eproto *inited;
  CoreML::Specification::protobuf_DataStructures_2eproto *v9;
  int v10;
  uint64_t j;
  uint64_t *v12;
  void *v13;
  uint64_t *v14;
  uint64_t *v15;
  void *v16;
  uint64_t i;
  uint64_t *v18;
  void *v19;
  uint64_t *v20;
  void *v21;
  id v22;
  CoreML::Specification::protobuf_OneHotEncoder_2eproto *v23;
  uint64_t *v24;
  int v25;
  unint64_t *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  MLOneHotEncoder *v35;
  void *v37;
  void *v38;
  MLOneHotEncoder *v39;
  void *v40;
  void *v41;
  CoreML::Specification::protobuf_OneHotEncoder_2eproto *v42;
  CoreML::Specification::protobuf_OneHotEncoder_2eproto *v43;

  v6 = (CoreML::Specification::protobuf_OneHotEncoder_2eproto *)a4;
  v43 = v6;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 600)
  {
    v7 = *(uint64_t **)(*(_QWORD *)a3 + 32);
  }
  else
  {
    CoreML::Specification::protobuf_OneHotEncoder_2eproto::InitDefaults(v6);
    v7 = &CoreML::Specification::_OneHotEncoder_default_instance_;
  }
  inited = (CoreML::Specification::protobuf_DataStructures_2eproto *)objc_opt_new();
  v9 = inited;
  v10 = *((_DWORD *)v7 + 9);
  if (v10 == 2)
  {
    for (i = 0; ; ++i)
    {
      if (v10 == 2)
      {
        v18 = (uint64_t *)v7[3];
      }
      else
      {
        inited = (CoreML::Specification::protobuf_DataStructures_2eproto *)CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        v18 = &CoreML::Specification::_Int64Vector_default_instance_;
      }
      if (i >= *((int *)v18 + 4))
        break;
      v19 = (void *)MEMORY[0x1E0CB37E8];
      if (*((_DWORD *)v7 + 9) == 2)
      {
        v20 = (uint64_t *)v7[3];
      }
      else
      {
        CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        v20 = &CoreML::Specification::_Int64Vector_default_instance_;
      }
      objc_msgSend(v19, "numberWithLongLong:", *(_QWORD *)(v20[3] + 8 * i + 8));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreML::Specification::protobuf_DataStructures_2eproto addObject:](v9, "addObject:", v21);

      v10 = *((_DWORD *)v7 + 9);
    }
  }
  else if (v10 == 1)
  {
    for (j = 0; ; ++j)
    {
      if (v10 == 1)
      {
        v12 = (uint64_t *)v7[3];
      }
      else
      {
        inited = (CoreML::Specification::protobuf_DataStructures_2eproto *)CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        v12 = &CoreML::Specification::_StringVector_default_instance_;
      }
      if (j >= *((int *)v12 + 6))
        break;
      v13 = (void *)MEMORY[0x1E0CB3940];
      if (*((_DWORD *)v7 + 9) == 1)
      {
        v14 = (uint64_t *)v7[3];
      }
      else
      {
        CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        v14 = &CoreML::Specification::_StringVector_default_instance_;
      }
      v15 = *(uint64_t **)(v14[4] + 8 * j + 8);
      if (*((char *)v15 + 23) < 0)
        v15 = (uint64_t *)*v15;
      objc_msgSend(v13, "stringWithUTF8String:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreML::Specification::protobuf_DataStructures_2eproto addObject:](v9, "addObject:", v16);

      v10 = *((_DWORD *)v7 + 9);
    }
  }
  v22 = -[MLModelDescription initFromSingleFunctionModelSpecification:]([MLModelDescription alloc], "initFromSingleFunctionModelSpecification:", a3);
  v39 = [MLOneHotEncoder alloc];
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v9);
  v23 = (CoreML::Specification::protobuf_OneHotEncoder_2eproto *)objc_claimAutoreleasedReturnValue();
  v42 = v23;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 600)
  {
    v24 = *(uint64_t **)(*(_QWORD *)a3 + 32);
    v25 = *((unsigned __int8 *)v24 + 16);
  }
  else
  {
    v26 = CoreML::Specification::protobuf_OneHotEncoder_2eproto::InitDefaults(v23);
    v25 = byte_1ED002C28;
    if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 600)
    {
      v24 = *(uint64_t **)(*(_QWORD *)a3 + 32);
    }
    else
    {
      CoreML::Specification::protobuf_OneHotEncoder_2eproto::InitDefaults((CoreML::Specification::protobuf_OneHotEncoder_2eproto *)v26);
      v24 = &CoreML::Specification::_OneHotEncoder_default_instance_;
    }
  }
  v27 = *((_DWORD *)v24 + 5);
  objc_msgSend(v22, "inputDescriptionsByName");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "outputDescriptionsByName");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0C99E40];
  v40 = (void *)v28;
  objc_msgSend(v22, "inputDescriptionsByName");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "allKeys");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "orderedSetWithArray:", v37);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(v22, "outputDescriptionsByName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "allKeys");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "orderedSetWithArray:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[MLOneHotEncoder initWith:dataTransformerName:ouputSparse:handleUnknown:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:](v39, "initWith:dataTransformerName:ouputSparse:handleUnknown:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:", v42, CFSTR("one hot encoder"), v25 != 0, v27 != 0, v41, v40, v30, v34, v43);

  return v35;
}

+ (id)featureEncoderFrom:(id)a3 inputDescription:(id)a4 orderedInputFeatureNames:(id)a5
{
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MLOneHotEncoder *v21;
  void *v22;
  void *v23;
  void *v24;
  MLModelConfiguration *v25;
  MLOneHotEncoder *v26;
  id v28;
  void *v29;

  v7 = a3;
  v8 = a4;
  v28 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = v7;
  while (v10 < objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8;
    objc_msgSend(v8, "objectForKeyedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_opt_new();
    objc_msgSend(v14, "multiArrayConstraint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v14, "multiArrayConstraint");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v17);

    }
    objc_msgSend(v14, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLFeatureDescription featureDescriptionWithName:type:optional:constraints:](MLFeatureDescription, "featureDescriptionWithName:type:optional:constraints:", v18, 5, objc_msgSend(v14, "isOptional"), v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKey:", v19, v20);

    ++v10;
    v7 = v11;
    v8 = v13;
  }
  v21 = [MLOneHotEncoder alloc];
  v22 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(v29, "allKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "orderedSetWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_alloc_init(MLModelConfiguration);
  v26 = -[MLOneHotEncoder initWith:dataTransformerName:ouputSparse:handleUnknown:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:](v21, "initWith:dataTransformerName:ouputSparse:handleUnknown:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:", v7, CFSTR("MLOneHotEncoder"), 0, 1, v8, v29, v28, v24, v25);

  return v26;
}

+ (id)featureEncoderFrom:(id)a3 inputDescription:(id)a4 outputDescription:(id)a5 orderedInputFeatureNames:(id)a6 orderedOutputFeatureNames:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  MLOneHotEncoder *v16;
  MLModelConfiguration *v17;
  MLOneHotEncoder *v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = [MLOneHotEncoder alloc];
  v17 = objc_alloc_init(MLModelConfiguration);
  v18 = -[MLOneHotEncoder initWith:dataTransformerName:ouputSparse:handleUnknown:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:](v16, "initWith:dataTransformerName:ouputSparse:handleUnknown:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:", v11, CFSTR("MLOneHotEncoder"), 0, 1, v12, v13, v14, v15, v17);

  return v18;
}

+ (id)featureEncoderFrom:(id)a3 dataTransformerName:(id)a4 ouputSparse:(BOOL)a5 handleUnknown:(BOOL)a6 inputDescription:(id)a7 outputDescription:(id)a8 orderedInputFeatureNames:(id)a9 orderedOutputFeatureNames:(id)a10
{
  _BOOL8 v12;
  _BOOL8 v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  MLOneHotEncoder *v21;
  MLModelConfiguration *v22;
  MLOneHotEncoder *v23;

  v12 = a6;
  v13 = a5;
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v21 = [MLOneHotEncoder alloc];
  v22 = objc_alloc_init(MLModelConfiguration);
  v23 = -[MLOneHotEncoder initWith:dataTransformerName:ouputSparse:handleUnknown:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:](v21, "initWith:dataTransformerName:ouputSparse:handleUnknown:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:", v15, v16, v13, v12, v17, v18, v19, v20, v22);

  return v23;
}

@end
