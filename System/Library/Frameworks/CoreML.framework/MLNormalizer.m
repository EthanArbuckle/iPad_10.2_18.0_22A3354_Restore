@implementation MLNormalizer

- (MLNormalizer)initWith:(int)a3 dataTransformerName:(id)a4 inputDescription:(id)a5 outputDescription:(id)a6 orderedInputFeatureNames:(id)a7 orderedOutputFeatureNames:(id)a8 configuration:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  MLNormalizer *v21;
  MLNormalizer *v22;
  void *v23;
  BOOL v24;
  void *v25;
  BOOL v26;
  MLNormalizer *v27;
  objc_super v29;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v29.receiver = self;
  v29.super_class = (Class)MLNormalizer;
  v21 = -[MLModelEngine initWithName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:](&v29, sel_initWithName_inputDescription_outputDescription_orderedInputFeatureNames_orderedOutputFeatureNames_configuration_, v15, v16, v17, v18, v19, v20);
  v22 = v21;
  if (!v21)
    goto LABEL_4;
  v21->_norm = a3;
  objc_msgSend(v16, "allValues");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:](MLModelDescriptionUtils, "validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:", v23, &unk_1E3DA2A68, 1, 1, CFSTR("MLNormalizer Input"), 0);

  if (!v24)
    goto LABEL_5;
  objc_msgSend(v17, "allValues");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:](MLModelDescriptionUtils, "validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:", v25, &unk_1E3DA2A80, 1, 1, CFSTR("MLNormalizer Output"), 0);

  if (v26)
LABEL_4:
    v27 = v22;
  else
LABEL_5:
    v27 = 0;

  return v27;
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
  id v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  int norm;
  uint64_t v28;
  double v29;
  double v30;
  MLDictionaryFeatureProvider *v31;
  void *v32;
  MLDictionaryFeatureProvider *v33;
  _QWORD aBlock[7];
  void *v36;
  id v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = -[MLNormalizer predictionTypeForKTrace](self, "predictionTypeForKTrace");
  v11 = -[MLModelEngine signpostID](self, "signpostID");
  v12 = objc_msgSend(v9, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__MLNormalizer_predictionFromFeatures_options_error___block_invoke;
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

  v38[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLFeatureProviderUtils vectorizeFeaturesProvidedBy:featureNames:error:](MLFeatureProviderUtils, "vectorizeFeaturesProvidedBy:featureNames:error:", v8, v20, a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_retainAutorelease(v21);
  v23 = objc_msgSend(v22, "mutableBytes");
  v24 = 0;
  v25 = 0.0;
  while (v24 < objc_msgSend(v22, "count"))
  {
    if (!self)
      goto LABEL_12;
    v26 = *(double *)(v23 + 8 * v24);
    norm = self->_norm;
    if (norm)
    {
      if (norm == 2)
      {
        v26 = v25 + v26 * v26;
      }
      else
      {
        if (norm != 1)
          goto LABEL_12;
        v26 = v25 + fabs(v26);
      }
LABEL_11:
      v25 = v26;
      goto LABEL_12;
    }
    if (v25 < v26)
      goto LABEL_11;
LABEL_12:
    ++v24;
  }
  v28 = 0;
  v29 = sqrt(v25);
  if (self->_norm != 2)
    v29 = v25;
  if (v29 == 0.0)
    v30 = 1.0;
  else
    v30 = v29;
  while (v28 < objc_msgSend(v22, "count"))
  {
    *(double *)(v23 + 8 * v28) = *(double *)(v23 + 8 * v28) / v30;
    ++v28;
  }
  v31 = [MLDictionaryFeatureProvider alloc];
  v36 = v19;
  v37 = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v31, "initWithDictionary:error:", v32, a5);

  v13[2](v13);
  return v33;
}

- (unint64_t)predictionTypeForKTrace
{
  return 18;
}

- (int)norm
{
  return self->_norm;
}

uint64_t __53__MLNormalizer_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v6;
  MLNormalizer *v7;
  MLNormalizer *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MLNormalizer *v19;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a4;
  v6 = -[MLModelDescription initFromSingleFunctionModelSpecification:]([MLModelDescription alloc], "initFromSingleFunctionModelSpecification:", a3);
  v7 = [MLNormalizer alloc];
  v8 = v7;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 607)
  {
    v9 = *(uint64_t **)(*(_QWORD *)a3 + 32);
  }
  else
  {
    CoreML::Specification::protobuf_Normalizer_2eproto::InitDefaults((CoreML::Specification::protobuf_Normalizer_2eproto *)v7);
    v9 = &CoreML::Specification::_Normalizer_default_instance_;
  }
  v10 = *((unsigned int *)v9 + 4);
  objc_msgSend(v6, "inputDescriptionsByName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "outputDescriptionsByName");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99E40];
  v22 = (void *)v11;
  objc_msgSend(v6, "inputDescriptionsByName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "orderedSetWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(v6, "outputDescriptionsByName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "orderedSetWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[MLNormalizer initWith:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:](v8, "initWith:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:", v10, CFSTR("normalizer"), v23, v22, v14, v18, v24);

  return v19;
}

+ (id)inputDescriptionFrom:(id)a3 outputDescription:(id)a4 orderedInputFeatureNames:(id)a5 orderedOutputFeatureNames:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  MLNormalizer *v13;
  MLModelConfiguration *v14;
  MLNormalizer *v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = [MLNormalizer alloc];
  v14 = objc_alloc_init(MLModelConfiguration);
  v15 = -[MLNormalizer initWith:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:](v13, "initWith:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:", 2, CFSTR("MLNormalizer"), v9, v10, v11, v12, v14);

  return v15;
}

+ (id)normFrom:(int)a3 inputDescription:(id)a4 outputDescription:(id)a5 orderedInputFeatureNames:(id)a6 orderedOutputFeatureNames:(id)a7
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  MLNormalizer *v15;
  MLModelConfiguration *v16;
  MLNormalizer *v17;

  v10 = *(_QWORD *)&a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = [MLNormalizer alloc];
  v16 = objc_alloc_init(MLModelConfiguration);
  v17 = -[MLNormalizer initWith:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:](v15, "initWith:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:", v10, CFSTR("MLNormalizer"), v11, v12, v13, v14, v16);

  return v17;
}

+ (id)normFrom:(int)a3 dataTransformerName:(id)a4 inputDescription:(id)a5 outputDescription:(id)a6 orderedInputFeatureNames:(id)a7 orderedOutputFeatureNames:(id)a8
{
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  MLNormalizer *v18;
  MLModelConfiguration *v19;
  MLNormalizer *v20;

  v12 = *(_QWORD *)&a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = [MLNormalizer alloc];
  v19 = objc_alloc_init(MLModelConfiguration);
  v20 = -[MLNormalizer initWith:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:](v18, "initWith:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:", v12, v13, v14, v15, v16, v17, v19);

  return v20;
}

@end
