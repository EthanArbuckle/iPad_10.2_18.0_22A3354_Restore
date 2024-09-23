@implementation MLAppleImageFeatureExtractor

- (MLAppleImageFeatureExtractor)initWithParameters:(id)a3 modelDescription:(id)a4 featureExtractorType:(int)a5 configuration:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  MLAppleImageFeatureExtractor *v16;
  MLAppleImageFeatureExtractor *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *inputFeatureName;
  void *v22;
  uint64_t v23;
  NSArray *outputFeatureName;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  MLAppleImageFeatureExtractor *v29;
  objc_super v31;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  if (v13)
  {
    v31.receiver = self;
    v31.super_class = (Class)MLAppleImageFeatureExtractor;
    v16 = -[MLModel initWithDescription:configuration:](&v31, sel_initWithDescription_configuration_, v14, v15);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_parameters, a3);
      objc_msgSend(v14, "inputDescriptionsByName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "allKeys");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
      v20 = objc_claimAutoreleasedReturnValue();
      inputFeatureName = v17->_inputFeatureName;
      v17->_inputFeatureName = (NSString *)v20;

      objc_msgSend(v14, "outputDescriptionsByName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "allKeys");
      v23 = objc_claimAutoreleasedReturnValue();
      outputFeatureName = v17->_outputFeatureName;
      v17->_outputFeatureName = (NSArray *)v23;

      objc_msgSend(v14, "outputDescriptionsByName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "allValues");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "multiArrayConstraint");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v17->_outputDataType = objc_msgSend(v28, "dataType");

      v17->_extractorType = a5;
    }
    self = v17;
    v29 = self;
  }
  else if (a7)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Invalid parameters for vision feature print"));
    v29 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)featureValueFromScenePrint:(id)a3 elementSize:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  MLMultiArray *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  MLMultiArray *v16;
  MLMultiArray *v17;
  MLMultiArray *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v24;
  _QWORD aBlock[5];
  _QWORD v26[5];
  id v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a4 <= 4)
    v7 = 65568;
  else
    v7 = 65600;
  v8 = objc_msgSend(v5, "length");
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__16273;
  v26[4] = __Block_byref_object_dispose__16274;
  v9 = v6;
  v27 = v9;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__MLAppleImageFeatureExtractor_featureValueFromScenePrint_elementSize___block_invoke;
  aBlock[3] = &unk_1E3D66D00;
  aBlock[4] = v26;
  v24 = _Block_copy(aBlock);
  v10 = [MLMultiArray alloc];
  v11 = objc_retainAutorelease(v9);
  v12 = objc_msgSend(v11, "bytes");
  v13 = v8 / a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](v10, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v12, v15, v7, &unk_1E3DA29A8, v24, 0);

  if (self->_outputDataType == v7)
  {
    v17 = v16;
  }
  else
  {
    v18 = [MLMultiArray alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MLMultiArray initWithShape:dataType:error:](v18, "initWithShape:dataType:error:", v20, self->_outputDataType, 0);

    -[MLMultiArray copyIntoMultiArray:error:](v16, "copyIntoMultiArray:error:", v17, 0);
  }
  +[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v26, 8);
  return v21;
}

- (id)computeScenePrintFeatures:(__CVBuffer *)a3 handle:(id)a4 useCPUOnly:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v17;

  v7 = a5;
  v10 = a4;
  -[MLAppleImageFeatureExtractorParameters featureExtractorParameters](self->_parameters, "featureExtractorParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v10, "scenePrintsFromPixelBuffers:version:augmentationOptions:useCPUOnly:error:", a3, objc_msgSend(v11, "scenePrintVersion"), 0, v7, &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v17;
  if (v13 || !objc_msgSend(v12, "count"))
  {
    v14 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v13);
  }
  else
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLAppleImageFeatureExtractor featureValueFromScenePrint:elementSize:](self, "featureValueFromScenePrint:elementSize:", v15, objc_msgSend(v15, "length")/ (unint64_t)objc_msgSend(v10, "elementCountForScenePrintRequestRevision:", objc_msgSend(v11, "scenePrintVersion")));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)featureValueFromObjectPrint:(id)a3 key:(id)a4 shape:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  MLMultiArray *v14;
  uint64_t v15;
  void *v16;
  MLMultiArray *v17;
  void *v18;
  _QWORD aBlock[5];
  _QWORD v21[5];
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__16273;
    v21[4] = __Block_byref_object_dispose__16274;
    v12 = v10;
    v22 = v12;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__MLAppleImageFeatureExtractor_featureValueFromObjectPrint_key_shape___block_invoke;
    aBlock[3] = &unk_1E3D66D00;
    aBlock[4] = v21;
    v13 = _Block_copy(aBlock);
    v14 = [MLMultiArray alloc];
    v15 = objc_msgSend(objc_retainAutorelease(v12), "bytes");
    +[MLDataConversionUtils stridesForShape:](MLDataConversionUtils, "stridesForShape:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](v14, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v15, v9, 65568, v16, v13, 0);

    +[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v21, 8);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  MLPredictionEvent *v8;
  unint64_t v9;
  uint64_t v10;
  MLDictionaryFeatureProvider *v11;
  uint64_t v12;
  _BOOL8 v13;
  id v14;
  void *v15;
  int extractorType;
  void *v17;
  void *v18;
  void *v19;
  MLDictionaryFeatureProvider *v20;
  void *v21;
  void *v22;
  unint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void (**v35)(_QWORD);
  void *v37;
  id v38;
  id v39;
  _QWORD aBlock[6];
  id v41[7];
  void *v42;
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v7 = a4;
  -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
  -[MLModel predictionEvent](self, "predictionEvent");
  v8 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v41, v8, 11, -[MLModel signpostID](self, "signpostID"), objc_msgSend(v7, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  v9 = -[MLModel signpostID](self, "signpostID");
  v10 = objc_msgSend(v7, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__MLAppleImageFeatureExtractor_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v9;
  aBlock[5] = v10;
  v35 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (!v7)
  {
    +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[_MLVNFrameworkHandle sharedHandle](_MLVNFrameworkHandle, "sharedHandle");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "featureValueForName:", self->_inputFeatureName);
  v11 = (MLDictionaryFeatureProvider *)objc_claimAutoreleasedReturnValue();
  v12 = -[MLDictionaryFeatureProvider imageBufferValue](v11, "imageBufferValue");

  if (!v12)
  {
    if (!a5)
      goto LABEL_28;
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Expected feature '%@' of type 'image' was not present in input"), self->_inputFeatureName);
    v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
    v11 = 0;
    *a5 = v14;
    goto LABEL_36;
  }
  if ((objc_msgSend(v7, "predictionUsesCPU") & 1) != 0)
  {
    v13 = 1;
  }
  else
  {
    +[MLInternalSettings globalSettings](MLInternalSettings, "globalSettings");
    v11 = (MLDictionaryFeatureProvider *)objc_claimAutoreleasedReturnValue();
    if ((-[MLDictionaryFeatureProvider restrictNeuralNetworksToUseCPUOnly](v11, "restrictNeuralNetworksToUseCPUOnly") & 1) != 0)
    {
      v13 = 1;
    }
    else
    {
      -[MLModel configuration](self, "configuration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v15, "computeUnits") == 0;

    }
  }
  extractorType = self->_extractorType;
  if (!extractorType)
  {
    if (!a5)
      goto LABEL_28;
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Feature extractor type not set"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  if (extractorType != 20)
  {
    if (extractorType != 21)
      goto LABEL_36;
    if ((objc_msgSend(v37, "isValid") & 1) != 0)
    {
      -[MLAppleImageFeatureExtractorParameters featureExtractorParameters](self->_parameters, "featureExtractorParameters");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      objc_msgSend(v37, "detectionPrintsFromPixelBuffers:version:augmentationOptions:useCPUOnly:error:", v12, objc_msgSend(v17, "objectPrintVersion"), 0, v13, &v39);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v39;
      v32 = v18;
      if (v31)
      {
        v11 = 0;
      }
      else
      {
        objc_msgSend(v18, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        for (i = 0; i < -[NSArray count](self->_outputFeatureName, "count"); ++i)
        {
          objc_msgSend(v17, "expectedKeys");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndexedSubscript:", i);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "expectedShapes");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectAtIndexedSubscript:", i);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLAppleImageFeatureExtractor featureValueFromObjectPrint:key:shape:](self, "featureValueFromObjectPrint:key:shape:", v34, v25, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSArray objectAtIndexedSubscript:](self->_outputFeatureName, "objectAtIndexedSubscript:", i);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKey:", v28, v29);

        }
        v11 = -[MLDictionaryFeatureProvider initWithDictionary:error:]([MLDictionaryFeatureProvider alloc], "initWithDictionary:error:", v33, a5);

      }
      goto LABEL_36;
    }
    if (a5)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Vision framework for object print not available on this OS version"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
LABEL_28:
    v11 = 0;
    goto LABEL_36;
  }
  if ((objc_msgSend(v37, "isValid") & 1) == 0)
  {
    if (a5)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Vision framework for scene print not available on this OS version"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    goto LABEL_28;
  }
  -[MLAppleImageFeatureExtractor computeScenePrintFeatures:handle:useCPUOnly:error:](self, "computeScenePrintFeatures:handle:useCPUOnly:error:", v12, v37, v13, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = [MLDictionaryFeatureProvider alloc];
    -[NSArray objectAtIndexedSubscript:](self->_outputFeatureName, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v21;
    v43[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v20, "initWithDictionary:error:", v22, a5);

  }
  else
  {
    v11 = 0;
  }

LABEL_36:
  v35[2](v35);

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v41);
  return v11;
}

- (MLAppleImageFeatureExtractorParameters)parameters
{
  return (MLAppleImageFeatureExtractorParameters *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_outputFeatureName, 0);
  objc_storeStrong((id *)&self->_inputFeatureName, 0);
}

uint64_t __69__MLAppleImageFeatureExtractor_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

void __70__MLAppleImageFeatureExtractor_featureValueFromObjectPrint_key_shape___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  if (objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)), "bytes") == a2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

void __71__MLAppleImageFeatureExtractor_featureValueFromScenePrint_elementSize___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  if (objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)), "bytes") == a2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *v15;
  CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *v16;
  uint64_t *v17;
  MLAppleImageFeatureExtractor *v18;
  uint64_t v19;
  int v20;
  CoreML::Specification::CoreMLModels::VisionFeaturePrint_Objects *v21;
  CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *v22;
  const CoreML::Specification::CoreMLModels::VisionFeaturePrint_Objects *v23;
  uint64_t v24;
  CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *v29;
  CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *v30;
  uint64_t *v31;
  id v32;
  MLAppleImageFeatureExtractorParameters *v33;
  CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *v34;
  uint64_t *v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  unint64_t v53;
  void *v54;
  unint64_t v55;
  void *v56;
  unint64_t v57;
  void *v59;
  void *v60;
  CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *v61;
  CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *v62;
  uint64_t *v63;
  CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *inited;
  uint64_t i;
  uint64_t *v70;
  void *v71;
  uint64_t *v72;
  uint64_t *v73;
  void *v74;
  void *v75;
  CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *v76;
  CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *v77;
  uint64_t *v78;
  id v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t j;
  void *v85;
  void *v86;
  char v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  unint64_t k;
  void *v95;
  void *v96;
  BOOL v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v108;
  uint64_t v109;
  void *v110;
  int v111;
  void *v112;
  void *v113;
  void *v114;
  unint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  id obj;
  void *v122;
  CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *v123;
  uint64_t v124;
  CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  void (**v130)(CoreML::Specification::CoreMLModels::VisionFeaturePrint *__hidden);
  uint64_t v131;
  uint64_t *v132;
  int v133;
  int v134;
  _BYTE v135[128];
  _QWORD v136[3];

  v136[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) != 2002)
  {
    if (a5)
    {
      +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Model type is not a vision feature print"));
      v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    goto LABEL_115;
  }
  v8 = -[MLModelDescription initFromSingleFunctionModelSpecification:]([MLModelDescription alloc], "initFromSingleFunctionModelSpecification:", a3);
  v9 = v8;
  if (!v8)
  {
LABEL_11:

    if (a5)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Must only have one input image feature"));
      v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    goto LABEL_114;
  }
  objc_msgSend(v8, "inputDescriptionsByName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") != 1)
  {

    goto LABEL_11;
  }
  objc_msgSend(v9, "inputDescriptionsByName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "type");

  if (v14 != 4)
    goto LABEL_11;

  +[_MLVNFrameworkHandle sharedHandle](_MLVNFrameworkHandle, "sharedHandle");
  v15 = (CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 2002)
  {
    v17 = *(uint64_t **)(*(_QWORD *)a3 + 32);
  }
  else
  {
    CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto::InitDefaults(v15);
    v17 = &CoreML::Specification::CoreMLModels::_VisionFeaturePrint_default_instance_;
  }
  v130 = &off_1E3D4D6F0;
  v131 = 0;
  v133 = 0;
  v19 = v17[1];
  if ((v19 & 1) != 0)
    google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v131, v19 & 0xFFFFFFFFFFFFFFFELL);
  v134 = 0;
  v20 = *((_DWORD *)v17 + 7);
  if (v20 == 20)
  {
    v134 = 20;
    v24 = operator new();
    v25 = CoreML::Specification::CoreMLModels::VisionFeaturePrint_Scene::VisionFeaturePrint_Scene((CoreML::Specification::CoreMLModels::VisionFeaturePrint_Scene *)v24);
    v132 = (uint64_t *)v24;
    if (*((_DWORD *)v17 + 7) == 20)
    {
      v26 = (uint64_t *)v17[2];
    }
    else
    {
      CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto::InitDefaults(v25);
      v26 = &CoreML::Specification::CoreMLModels::_VisionFeaturePrint_Scene_default_instance_;
    }
    v27 = v26[1];
    if ((v27 & 1) != 0)
      google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom((uint64_t *)(v24 + 8), v27 & 0xFFFFFFFFFFFFFFFELL);
    v28 = *((_DWORD *)v26 + 4);
    if (v28)
      *(_DWORD *)(v24 + 16) = v28;
  }
  else
  {
    if (v20 != 21)
      goto LABEL_36;
    v134 = 21;
    v21 = (CoreML::Specification::CoreMLModels::VisionFeaturePrint_Objects *)operator new();
    v22 = CoreML::Specification::CoreMLModels::VisionFeaturePrint_Objects::VisionFeaturePrint_Objects(v21);
    v132 = (uint64_t *)v21;
    if (*((_DWORD *)v17 + 7) == 21)
    {
      v23 = (const CoreML::Specification::CoreMLModels::VisionFeaturePrint_Objects *)v17[2];
    }
    else
    {
      CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto::InitDefaults(v22);
      v23 = (const CoreML::Specification::CoreMLModels::VisionFeaturePrint_Objects *)&CoreML::Specification::CoreMLModels::_VisionFeaturePrint_Objects_default_instance_;
    }
    CoreML::Specification::CoreMLModels::VisionFeaturePrint_Objects::MergeFrom((std::string *)v21, v23);
  }
  if (!v134)
  {
LABEL_36:
    if (a5)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Feature extractor type not set"));
      v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:
      v33 = 0;
      v18 = 0;
      *a5 = v32;
      goto LABEL_113;
    }
LABEL_111:
    v33 = 0;
    goto LABEL_112;
  }
  if (v134 == 20)
  {
    v34 = (CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *)-[CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto isValid](v16, "isValid");
    if ((v34 & 1) == 0)
    {
      if (a5)
      {
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Vision framework not available for scene print on this OS version"));
        v32 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_38;
      }
      goto LABEL_111;
    }
    if (v134 == 20)
    {
      v35 = v132;
    }
    else
    {
      CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto::InitDefaults(v34);
      v35 = &CoreML::Specification::CoreMLModels::_VisionFeaturePrint_Scene_default_instance_;
    }
    v37 = *((_DWORD *)v35 + 4);
    if (v37 == 2)
      v38 = 3737841671;
    else
      v38 = 2 * (v37 == 1);
    v124 = -[CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto elementCountForScenePrintRequestRevision:](v16, "elementCountForScenePrintRequestRevision:", v38);
    objc_msgSend(v9, "outputDescriptionsByName");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "count") == 1)
    {
      objc_msgSend(v9, "outputDescriptionsByName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "allValues");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "type");

      if (v43 == 5)
      {
        objc_msgSend(v9, "outputDescriptionsByName");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "allValues");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectAtIndexedSubscript:", 0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v122 = v46;
        objc_msgSend(v46, "multiArrayConstraint");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v47;
        if (v47)
        {
          objc_msgSend(v47, "shape");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v49, "count"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v124);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v136[0] = v50;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v136, 1);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v48, "isAllowedShape:error:", v51, 0);

            if ((v52 & 1) == 0)
            {
              if (a5)
              {
                +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Must allow %lu-element vector as output"), v124);
                *a5 = (id)objc_claimAutoreleasedReturnValue();
              }

              goto LABEL_111;
            }
          }
          else
          {

          }
        }
        v108 = -[MLAppleImageFeatureExtractorScenePrintParameters initScenePrintParameters:requestClass:error:]([MLAppleImageFeatureExtractorScenePrintParameters alloc], "initScenePrintParameters:requestClass:error:", v38, CFSTR("VNCreateSceneprintRequest"), a5);
        v33 = -[MLAppleImageFeatureExtractorParameters initWithScenePrintParameters:error:]([MLAppleImageFeatureExtractorParameters alloc], "initWithScenePrintParameters:error:", v108, a5);

        v36 = 20;
LABEL_43:
        v18 = -[MLAppleImageFeatureExtractor initWithParameters:modelDescription:featureExtractorType:configuration:error:]([MLAppleImageFeatureExtractor alloc], "initWithParameters:modelDescription:featureExtractorType:configuration:error:", v33, v9, v36, v7, a5);
        goto LABEL_113;
      }
    }
    else
    {

    }
    if (a5)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Must only have one output multiarray feature"));
      v32 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    }
    goto LABEL_111;
  }
  if (v134 != 21)
  {
    v36 = 0;
    v33 = 0;
    goto LABEL_43;
  }
  if ((-[CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto isValid](v16, "isValid") & 1) == 0)
  {
    if (a5)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Vision framework not available for object print on this OS version"));
      v32 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    }
    goto LABEL_111;
  }
  -[CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto detectionPrintSupportedRevisions](v16, "detectionPrintSupportedRevisions");
  v29 = (CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v134 == 21)
  {
    v31 = v132;
  }
  else
  {
    CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto::InitDefaults(v29);
    v31 = &CoreML::Specification::CoreMLModels::_VisionFeaturePrint_Objects_default_instance_;
  }
  v53 = *((int *)v31 + 10);
  v123 = v30;
  -[CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto firstObject](v123, "firstObject");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "unsignedIntegerValue");

  -[CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto lastObject](v123, "lastObject");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "unsignedIntegerValue");

  if (v57 >= v53 && v55 <= v53)
    v55 = v53;

  v115 = v55;
  -[CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto detectionPrintShapes:](v16, "detectionPrintShapes:", v55);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v59)
  {
    if (a5)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("ObjectPrint unable to get expected shapes"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_110;
  }
  objc_msgSend(v9, "outputDescriptionsByName");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *)objc_msgSend(v60, "count");
  v62 = v61;
  if (v134 == 21)
  {
    v63 = v132;
  }
  else
  {
    CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto::InitDefaults(v61);
    v63 = &CoreML::Specification::CoreMLModels::_VisionFeaturePrint_Objects_default_instance_;
  }
  v64 = (CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *)*((int *)v63 + 6);

  if (v62 != v64)
  {
    if (a5)
    {
      objc_msgSend(v9, "outputDescriptionsByName");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = (CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *)objc_msgSend(v75, "count");
      v77 = v76;
      if (v134 == 21)
      {
        v78 = v132;
      }
      else
      {
        CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto::InitDefaults(v76);
        v78 = &CoreML::Specification::CoreMLModels::_VisionFeaturePrint_Objects_default_instance_;
      }
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Output count %lu does not match expected %lu from object print"), v77, *((int *)v78 + 6));
      v79 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_109;
    }
LABEL_110:

    goto LABEL_111;
  }
  objc_msgSend(v9, "outputDescriptionsByName");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "count");
  v67 = objc_msgSend(v59, "count");

  if (v66 != v67)
  {
    if (a5)
    {
      objc_msgSend(v9, "outputDescriptionsByName");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Output count %lu does not match expected %lu in the request revision %lu"), objc_msgSend(v75, "count"), objc_msgSend(v59, "count"), v115);
      v79 = (id)objc_claimAutoreleasedReturnValue();
LABEL_109:
      *a5 = v79;

      goto LABEL_110;
    }
    goto LABEL_110;
  }
  v120 = v59;
  inited = (CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *)objc_opt_new();
  v125 = inited;
  for (i = 0; ; ++i)
  {
    if (v134 == 21)
    {
      v70 = v132;
    }
    else
    {
      inited = (CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto *)CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto::InitDefaults(inited);
      v70 = &CoreML::Specification::CoreMLModels::_VisionFeaturePrint_Objects_default_instance_;
    }
    if (i >= *((int *)v70 + 6))
      break;
    v71 = (void *)MEMORY[0x1E0CB3940];
    if (v134 == 21)
    {
      v72 = v132;
    }
    else
    {
      CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto::InitDefaults(inited);
      v72 = &CoreML::Specification::CoreMLModels::_VisionFeaturePrint_Objects_default_instance_;
    }
    v73 = *(uint64_t **)(v72[4] + 8 * i + 8);
    if (*((char *)v73 + 23) < 0)
      v73 = (uint64_t *)*v73;
    objc_msgSend(v71, "stringWithUTF8String:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto addObject:](v125, "addObject:", v74);

  }
  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  objc_msgSend(v9, "outputDescriptionsByName");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "allValues");
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v81;
  v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v126, v135, 16);
  if (!v82)
    goto LABEL_102;
  v83 = *(_QWORD *)v127;
  while (2)
  {
    for (j = 0; j != v82; ++j)
    {
      if (*(_QWORD *)v127 != v83)
        objc_enumerationMutation(obj);
      v85 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * j);
      objc_msgSend(v85, "name");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = -[CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto containsObject:](v125, "containsObject:", v86);

      if ((v87 & 1) == 0)
      {
        if (a5)
        {
          objc_msgSend(v85, "name");
          v109 = objc_claimAutoreleasedReturnValue();
          +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Output name %@ not found in the outputs specified in object print"), v109);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_122:
          v119 = (void *)v109;
          v36 = 0;
          v33 = 0;
          *a5 = v110;
          v111 = 1;

          goto LABEL_130;
        }
LABEL_124:
        v36 = 0;
        v33 = 0;
        v111 = 1;
        goto LABEL_130;
      }
      if (objc_msgSend(v85, "type") != 5)
      {
        if (a5)
        {
          objc_msgSend(v85, "name");
          v109 = objc_claimAutoreleasedReturnValue();
          +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Output %@ is not a MultiArray"), v109);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_122;
        }
        goto LABEL_124;
      }
    }
    v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v126, v135, 16);
    if (v82)
      continue;
    break;
  }
LABEL_102:

  sortShapeKeysByFeatureResolution(v120);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v88 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v9, "outputDescriptionsByName");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "allValues");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "arrayWithCapacity:", objc_msgSend(v90, "count"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  v91 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v9, "outputDescriptionsByName");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "allValues");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "arrayWithCapacity:", objc_msgSend(v93, "count"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  for (k = 0; ; ++k)
  {
    objc_msgSend(v9, "outputDescriptionsByName");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "allValues");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = k < objc_msgSend(v96, "count");

    if (!v97)
    {
      v100 = -[MLAppleImageFeatureExtractorObjectPrintParameters initObjectPrintParameters:expectedShapes:expectedKeys:error:]([MLAppleImageFeatureExtractorObjectPrintParameters alloc], "initObjectPrintParameters:expectedShapes:expectedKeys:error:", v115, v118, v117, a5);
      v33 = -[MLAppleImageFeatureExtractorParameters initWithObjectPrintParameters:error:]([MLAppleImageFeatureExtractorParameters alloc], "initWithObjectPrintParameters:error:", v100, a5);
      v111 = 2;
      v36 = 21;
      goto LABEL_128;
    }
    objc_msgSend(v9, "outputDescriptionsByName");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "allValues");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "objectAtIndexedSubscript:", k);
    v100 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v100, "name");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = -[CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto indexOfObject:](v125, "indexOfObject:", v101);

    objc_msgSend(obj, "objectAtIndex:", v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "objectForKey:", v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "multiArrayConstraint");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v105;
    if (v105)
    {
      if ((objc_msgSend(v105, "isAllowedShape:error:", v104, 0) & 1) == 0)
        break;
    }
    objc_msgSend(v118, "addObject:", v104);
    objc_msgSend(v117, "addObject:", v103);

  }
  if (a5)
  {
    objc_msgSend(v104, "objectAtIndexedSubscript:", 0);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "objectAtIndexedSubscript:", 1);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "objectAtIndexedSubscript:", 2);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "name");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Must allow (%@, %@, %@) vector for output feature %@"), v112, v116, v114, v113);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v36 = 0;
  v33 = 0;
  v111 = 1;
LABEL_128:

LABEL_130:
  if (v111 == 2)
    goto LABEL_43;
LABEL_112:
  v18 = 0;
LABEL_113:

  CoreML::Specification::CoreMLModels::VisionFeaturePrint::~VisionFeaturePrint((CoreML::Specification::CoreMLModels::VisionFeaturePrint *)&v130);
LABEL_114:

LABEL_115:
  return v18;
}

@end
