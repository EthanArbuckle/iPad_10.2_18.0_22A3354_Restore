@implementation MLArrayFeatureExtractor

- (MLArrayFeatureExtractor)initWith:(id)a3 indices:(id)a4 dataTransformerName:(id)a5 inputDescription:(id)a6 outputDescription:(id)a7 orderedInputFeatureNames:(id)a8 orderedOutputFeatureNames:(id)a9 configuration:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  MLArrayFeatureExtractor *v23;
  MLArrayFeatureExtractor *v24;
  void *v25;
  BOOL v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  MLArrayFeatureExtractor *v32;
  void *v34;
  id v35;
  id v36;
  objc_super v37;

  v36 = a3;
  v35 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v37.receiver = self;
  v37.super_class = (Class)MLArrayFeatureExtractor;
  v34 = v17;
  v23 = -[MLModel initWithName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:](&v37, sel_initWithName_inputDescription_outputDescription_orderedInputFeatureNames_orderedOutputFeatureNames_configuration_, v17, v18, v19, v20, v21, v22);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_arrayColumnName, a3);
    objc_storeStrong((id *)&v24->_extractIndices, a4);
    objc_msgSend(v18, "allValues");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:](MLModelDescriptionUtils, "validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:", v25, &unk_1E3DA2B10, 1, -1, CFSTR("MLArrayFeatureExtractor Inputs"), 0);

    if (!v26
      || (objc_msgSend(v19, "allValues"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          v28 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:](MLModelDescriptionUtils, "validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:", v27, &unk_1E3DA2B28, 1, 1, CFSTR("MLArrayFeatureExtractor Outputs"), 0), v27, !v28))
    {
      v32 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v19, "allKeys");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v24->_outputType = objc_msgSend(v31, "type");

  }
  v32 = v24;
LABEL_7:

  return v32;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  MLPredictionEvent *v8;
  unint64_t v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  int64_t outputType;
  void *v15;
  unint64_t i;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  MLDictionaryFeatureProvider *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  MLDictionaryFeatureProvider *v36;
  id v39;
  _QWORD aBlock[6];
  id v41[7];
  void *v42;
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v7 = a4;
  -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
  -[MLModel predictionEvent](self, "predictionEvent");
  v8 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v41, v8, 14, -[MLModel signpostID](self, "signpostID"), objc_msgSend(v7, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  v9 = -[MLModel signpostID](self, "signpostID");
  v10 = objc_msgSend(v7, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__MLArrayFeatureExtractor_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v9;
  aBlock[5] = v10;
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v39, "featureValueForName:", self->_arrayColumnName);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "multiArrayValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    if (a5)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("got nil array input to MLArrayFeatureExtractor predict:error:"));
      v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
      v36 = 0;
      *a5 = v19;
      goto LABEL_22;
    }
LABEL_21:
    v36 = 0;
    goto LABEL_22;
  }
  outputType = self->_outputType;
  switch(outputType)
  {
    case 1:
      -[NSArray objectAtIndexedSubscript:](self->_extractIndices, "objectAtIndexedSubscript:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", (int)objc_msgSend(v20, "intValue"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "doubleValue");
      v23 = v22;

      if (v23 != (double)(uint64_t)v23)
      {
        if (a5)
        {
          +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Lossy cast to integer by ArrayFeatureExtractor; use double as output type."));
          v19 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_20;
        }
        goto LABEL_21;
      }
      +[MLFeatureValue featureValueWithInt64:](MLFeatureValue, "featureValueWithInt64:", (uint64_t)v23);
      v24 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[NSArray objectAtIndexedSubscript:](self->_extractIndices, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", (int)objc_msgSend(v25, "intValue"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "doubleValue");
      v28 = v27;

      +[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:", v28);
      v24 = objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_extractIndices, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; i < -[NSArray count](self->_extractIndices, "count"); ++i)
      {
        -[NSArray objectAtIndexedSubscript:](self->_extractIndices, "objectAtIndexedSubscript:", i);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", (int)objc_msgSend(v17, "intValue"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "addObject:", v18);
      }
      +[MLMultiArray doubleVectorWithValues:](MLMultiArray, "doubleVectorWithValues:", v15);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v30);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
    default:
      if (a5)
      {
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Invalid output type of ArrayFeatureExtractor."));
        v19 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      goto LABEL_21;
  }
  v29 = (void *)v24;
LABEL_17:
  v31 = [MLDictionaryFeatureProvider alloc];
  -[MLModel modelDescription](self, "modelDescription");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "outputFeatureNames");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v34;
  v43[0] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v31, "initWithDictionary:error:", v35, a5);

LABEL_22:
  v11[2](v11);

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v41);
  return v36;
}

- (NSString)arrayColumnName
{
  return self->_arrayColumnName;
}

- (NSArray)extractIndices
{
  return self->_extractIndices;
}

- (int64_t)outputType
{
  return self->_outputType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractIndices, 0);
  objc_storeStrong((id *)&self->_arrayColumnName, 0);
}

uint64_t __64__MLArrayFeatureExtractor_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  CoreML::Specification::protobuf_ArrayFeatureExtractor_2eproto *v7;
  uint64_t *v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  MLArrayFeatureExtractor *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  MLArrayFeatureExtractor *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  CoreML::Specification::protobuf_ArrayFeatureExtractor_2eproto *v31;
  void (**v32)(CoreML::Specification::ArrayFeatureExtractor *__hidden);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;

  v7 = (CoreML::Specification::protobuf_ArrayFeatureExtractor_2eproto *)a4;
  v31 = v7;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 609)
  {
    v8 = *(uint64_t **)(*(_QWORD *)a3 + 32);
  }
  else
  {
    CoreML::Specification::protobuf_ArrayFeatureExtractor_2eproto::InitDefaults(v7);
    v8 = &CoreML::Specification::_ArrayFeatureExtractor_default_instance_;
  }
  v34 = 0;
  v35 = 0;
  v32 = &off_1E3D52E38;
  v33 = 0;
  v9 = *((_DWORD *)v8 + 4);
  if (v9)
  {
    google::protobuf::RepeatedField<double>::Reserve((unsigned int *)&v34, v9);
    memcpy((void *)(v35 + 8), (const void *)(v8[3] + 8), 8 * *((int *)v8 + 4));
    v10 = *((_DWORD *)v8 + 4);
    LODWORD(v34) = v10;
  }
  else
  {
    v10 = 0;
  }
  v36 = 0;
  v11 = v8[1];
  if ((v11 & 1) != 0)
  {
    google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v33, v11 & 0xFFFFFFFFFFFFFFFELL);
    v10 = v34;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)v34 >= 1)
  {
    v13 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v35 + 8 * v13 + 8));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v14);

      ++v13;
    }
    while (v13 < (int)v34);
  }
  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  v16 = *(uint64_t **)(*(_QWORD *)a3 + 16);
  if (!v16)
    v16 = &CoreML::Specification::_ModelDescription_default_instance_;
  v17 = *(uint64_t **)(*(_QWORD *)(v16[4] + 8) + 16);
  if (*((char *)v17 + 23) < 0)
    v17 = (uint64_t *)*v17;
  v30 = (void *)objc_msgSend(v15, "initWithUTF8String:", v17);
  v29 = -[MLModel initDescriptionOnlyWithSpecification:configuration:error:]([MLModel alloc], "initDescriptionOnlyWithSpecification:configuration:error:", a3, v31, a5);
  v18 = [MLArrayFeatureExtractor alloc];
  objc_msgSend(v29, "modelDescription");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "inputDescriptionsByName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "modelDescription");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "outputDescriptionsByName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "modelDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "inputFeatureNames");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "modelDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "outputFeatureNames");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[MLArrayFeatureExtractor initWith:indices:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:](v18, "initWith:indices:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:", v30, v12, CFSTR("array feature extractor"), v27, v25, v20, v22, v31);

  CoreML::Specification::ArrayFeatureExtractor::~ArrayFeatureExtractor((CoreML::Specification::ArrayFeatureExtractor *)&v32);
  return v23;
}

+ (id)extractArrayElement:(id)a3 indices:(id)a4 inputDescription:(id)a5 outputDescription:(id)a6 orderedInputFeatureNames:(id)a7 orderedOutputFeatureNames:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  MLArrayFeatureExtractor *v19;
  MLModelConfiguration *v20;
  MLArrayFeatureExtractor *v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = [MLArrayFeatureExtractor alloc];
  v20 = objc_alloc_init(MLModelConfiguration);
  v21 = -[MLArrayFeatureExtractor initWith:indices:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:](v19, "initWith:indices:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:", v13, v14, CFSTR("arrayFeatureExtractor"), v15, v16, v17, v18, v20);

  return v21;
}

+ (id)extractArrayElement:(id)a3 indices:(id)a4 dataTransformerName:(id)a5 inputDescription:(id)a6 outputDescription:(id)a7 orderedInputFeatureNames:(id)a8 orderedOutputFeatureNames:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  MLArrayFeatureExtractor *v21;
  MLModelConfiguration *v22;
  MLArrayFeatureExtractor *v23;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = [MLArrayFeatureExtractor alloc];
  v22 = objc_alloc_init(MLModelConfiguration);
  v23 = -[MLArrayFeatureExtractor initWith:indices:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:](v21, "initWith:indices:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:", v14, v15, v16, v17, v18, v19, v20, v22);

  return v23;
}

@end
