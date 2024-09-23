@implementation MLCategoricalMapping

- (MLCategoricalMapping)initWithMapping:(id)a3 valueOnUnknown:(id)a4 dataTransformerName:(id)a5 inputDescription:(id)a6 outputDescription:(id)a7 orderedInputFeatureNames:(id)a8 orderedOutputFeatureNames:(id)a9 configuration:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  MLCategoricalMapping *v23;
  id *p_isa;
  void *v25;
  BOOL v26;
  void *v27;
  BOOL v28;
  MLCategoricalMapping *v29;
  id v31;
  id v32;
  void *v33;
  objc_super v34;

  v32 = a3;
  v31 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v34.receiver = self;
  v34.super_class = (Class)MLCategoricalMapping;
  v33 = v17;
  v23 = -[MLModelEngine initWithName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:](&v34, sel_initWithName_inputDescription_outputDescription_orderedInputFeatureNames_orderedOutputFeatureNames_configuration_, v17, v18, v19, v20, v21, v22);
  p_isa = (id *)&v23->super.super.isa;
  if (!v23)
    goto LABEL_4;
  objc_storeStrong((id *)&v23->_mapping, a3);
  objc_storeStrong(p_isa + 5, a4);
  objc_msgSend(v18, "allValues");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:](MLModelDescriptionUtils, "validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:", v25, &unk_1E3DA2A98, 1, 1, CFSTR("MLCategoricalMapping Inputs"), 0);

  if (!v26)
    goto LABEL_5;
  objc_msgSend(v19, "allValues");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:](MLModelDescriptionUtils, "validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:", v27, &unk_1E3DA2AB0, 1, 1, CFSTR("MLCategoricalMapping Outputs"), 0);

  if (v28)
LABEL_4:
    v29 = p_isa;
  else
LABEL_5:
    v29 = 0;

  return v29;
}

- (id)mapFeature:(id)a3 error:(id *)a4
{
  MLFeatureValue *v6;
  MLFeatureValue *valueOnUnknown;
  id v8;

  -[NSDictionary objectForKeyedSubscript:](self->_mapping, "objectForKeyedSubscript:", a3);
  v6 = (MLFeatureValue *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    valueOnUnknown = self->_valueOnUnknown;
    if (valueOnUnknown)
    {
      v6 = valueOnUnknown;
    }
    else if (a4)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("MLCategoricalMapping: Unknown input value."));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      *a4 = v8;
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  MLSequence *v31;
  uint64_t v32;
  MLDictionaryFeatureProvider *v33;
  MLDictionaryFeatureProvider *v34;
  void *v36;
  void (**v37)(_QWORD);
  void *v38;
  void *v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD aBlock[7];
  void *v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v41 = a4;
  v8 = -[MLCategoricalMapping predictionTypeForKTrace](self, "predictionTypeForKTrace");
  v9 = -[MLModelEngine signpostID](self, "signpostID");
  v10 = objc_msgSend(v41, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__MLCategoricalMapping_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_56_e5_v8__0l;
  aBlock[4] = v8;
  aBlock[5] = v9;
  aBlock[6] = v10;
  v37 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[MLModelEngine modelDescription](self, "modelDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inputFeatureNames");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLModelEngine modelDescription](self, "modelDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "outputFeatureNames");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "featureValueForName:", v39);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "type") == 7)
  {
    objc_msgSend(v15, "sequenceValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "featureValues");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v36, "count"));
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v18 = v36;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v43;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v43 != v20)
            objc_enumerationMutation(v18);
          -[MLCategoricalMapping mapFeature:error:](self, "mapFeature:error:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i), a5, v36);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (!v22)
          {

            v34 = 0;
            goto LABEL_14;
          }
          objc_msgSend(v22, "objectValue");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v24);

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
        if (v19)
          continue;
        break;
      }
    }

    -[MLModelEngine modelDescription](self, "modelDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "outputDescriptionsByName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", v38);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sequenceConstraint");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "valueDescription");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "type");

    v31 = -[MLSequence initWithArray:type:]([MLSequence alloc], "initWithArray:type:", v17, v30);
    +[MLFeatureValue featureValueWithSequence:](MLFeatureValue, "featureValueWithSequence:", v31);
    v32 = objc_claimAutoreleasedReturnValue();

    v18 = (id)v32;
  }
  else
  {
    -[MLCategoricalMapping mapFeature:error:](self, "mapFeature:error:", v15, a5);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v34 = 0;
      goto LABEL_15;
    }
  }
  v33 = [MLDictionaryFeatureProvider alloc];
  v47 = v38;
  v48 = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v33, "initWithDictionary:error:", v17, a5);
LABEL_14:

LABEL_15:
  v37[2](v37);

  return v34;
}

- (unint64_t)predictionTypeForKTrace
{
  return 15;
}

- (NSDictionary)mapping
{
  return self->_mapping;
}

- (MLFeatureValue)valueOnUnknown
{
  return self->_valueOnUnknown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueOnUnknown, 0);
  objc_storeStrong((id *)&self->_mapping, 0);
}

uint64_t __61__MLCategoricalMapping_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  CoreML::Specification::protobuf_CategoricalMapping_2eproto *v6;
  CoreML::Specification::protobuf_CategoricalMapping_2eproto *v7;
  uint64_t *v8;
  void *v9;
  int v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  MLCategoricalMapping *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  MLCategoricalMapping *v30;
  uint64_t *v32[3];

  v6 = (CoreML::Specification::protobuf_CategoricalMapping_2eproto *)a4;
  v7 = v6;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 606)
  {
    v8 = *(uint64_t **)(*(_QWORD *)a3 + 32);
  }
  else
  {
    CoreML::Specification::protobuf_CategoricalMapping_2eproto::InitDefaults(v6);
    v8 = &CoreML::Specification::_CategoricalMapping_default_instance_;
  }
  v9 = (void *)objc_opt_new();
  v10 = *((_DWORD *)v8 + 9);
  if (v10 == 1)
  {
    google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::begin(v32, *(_QWORD **)(v8[2] + 40));
    while (v32[0])
    {
      v16 = v32[0][3];
      +[MLFeatureValue featureValueWithInt64:](MLFeatureValue, "featureValueWithInt64:", *(_QWORD *)(v16 + 24));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(char *)(v16 + 23) < 0)
        v16 = *(_QWORD *)v16;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLFeatureValue featureValueWithString:](MLFeatureValue, "featureValueWithString:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v17, v19);

      google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::InnerMap::iterator_base<google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::KeyValuePair const>::operator++((unsigned __int8 **)v32);
    }
  }
  else if (v10 == 2)
  {
    google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::begin(v32, *(_QWORD **)(v8[2] + 40));
    while (v32[0])
    {
      v11 = v32[0][1];
      v12 = (_QWORD *)(v11 + 8);
      if (*(char *)(v11 + 31) < 0)
        v12 = (_QWORD *)*v12;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLFeatureValue featureValueWithString:](MLFeatureValue, "featureValueWithString:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLFeatureValue featureValueWithInt64:](MLFeatureValue, "featureValueWithInt64:", *(_QWORD *)v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v14, v15);

      google::protobuf::Map<long long,double>::InnerMap::iterator_base<google::protobuf::Map<long long,double>::KeyValuePair const>::operator++(v32);
    }
  }
  v20 = *((_DWORD *)v8 + 10);
  if (v20 == 102)
  {
    +[MLFeatureValue featureValueWithInt64:](MLFeatureValue, "featureValueWithInt64:", v8[3]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v20 == 101)
  {
    v21 = v8[3];
    if (*(char *)(v21 + 23) < 0)
      v21 = *(_QWORD *)v21;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLFeatureValue featureValueWithString:](MLFeatureValue, "featureValueWithString:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
  }
  v24 = -[MLModelDescription initFromSingleFunctionModelSpecification:]([MLModelDescription alloc], "initFromSingleFunctionModelSpecification:", a3);
  v25 = [MLCategoricalMapping alloc];
  objc_msgSend(v24, "inputDescriptionsByName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "outputDescriptionsByName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "inputFeatureNames");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "outputFeatureNames");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[MLCategoricalMapping initWithMapping:valueOnUnknown:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:](v25, "initWithMapping:valueOnUnknown:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:", v9, v23, CFSTR("categorical mapping"), v26, v27, v28, v29, v7);

  return v30;
}

@end
