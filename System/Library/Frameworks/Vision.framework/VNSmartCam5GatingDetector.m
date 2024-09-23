@implementation VNSmartCam5GatingDetector

- (id)supportedClassificationIdentifiersWithOptions:(id)a3 error:(id *)a4
{
  -[VNImageAnalyzerBasedDetector supportedClassificationIdentifiersAcceptedByBlock:error:](self, "supportedClassificationIdentifiersAcceptedByBlock:error:", 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)supportedDocumentElementIdentifiers
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("VNRecognizeDocumentElementIdentifierDocument");
  v3[1] = CFSTR("VNRecognizeDocumentElementIdentifierText");
  v3[2] = CFSTR("VNRecognizeDocumentElementIdentifierQRCode");
  v3[3] = CFSTR("VNRecognizeDocumentElementIdentifierAppCode");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  VisionCoreSmartCam5InferenceNetworkDescriptor *v8;
  VisionCoreSmartCam5InferenceNetworkDescriptor *inferenceNetworkDescriptor;
  NSDictionary *v10;
  NSDictionary *documentIdentifierToSceneLabels;
  uint64_t v12;
  VNSaliencyOHeatmapBoundingBoxGenerator **p_boundingBoxGenerator;
  VNSaliencyOHeatmapBoundingBoxGenerator *v14;
  BOOL v15;
  objc_super v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[VNDetector configurationOptions](self, "configurationOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_inferenceNetworkDescriptorForConfiguration:error:", v7, a4);
  v8 = (VisionCoreSmartCam5InferenceNetworkDescriptor *)objc_claimAutoreleasedReturnValue();
  inferenceNetworkDescriptor = self->_inferenceNetworkDescriptor;
  self->_inferenceNetworkDescriptor = v8;

  if (self->_inferenceNetworkDescriptor
    && (v17.receiver = self,
        v17.super_class = (Class)VNSmartCam5GatingDetector,
        -[VNImageAnalyzerBasedDetector completeInitializationForSession:error:](&v17, sel_completeInitializationForSession_error_, v6, a4)))
  {
    v18[0] = CFSTR("VNRecognizeDocumentElementIdentifierDocument");
    v18[1] = CFSTR("VNRecognizeDocumentElementIdentifierText");
    v19[0] = &unk_1E459E0D8;
    v19[1] = &unk_1E459E0F0;
    v18[2] = CFSTR("VNRecognizeDocumentElementIdentifierQRCode");
    v18[3] = CFSTR("VNRecognizeDocumentElementIdentifierAppCode");
    v19[2] = &unk_1E459E108;
    v19[3] = &unk_1E459E120;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    documentIdentifierToSceneLabels = self->_documentIdentifierToSceneLabels;
    self->_documentIdentifierToSceneLabels = v10;

    objc_msgSend(v6, "detectorOfType:configuredWithOptions:error:", CFSTR("VNObjectnessBasedSaliencyHeatmapBoundingBoxGeneratorType"), v7, a4);
    v12 = objc_claimAutoreleasedReturnValue();
    p_boundingBoxGenerator = &self->_boundingBoxGenerator;
    v14 = *p_boundingBoxGenerator;
    *p_boundingBoxGenerator = (VNSaliencyOHeatmapBoundingBoxGenerator *)v12;

    v15 = *p_boundingBoxGenerator != 0;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)defaultImageCropAndScaleOption
{
  return 2;
}

- (BOOL)configureImageAnalyzerOptions:(void *)a3 error:(id *)a4
{
  _BOOL4 v6;
  id v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VNSmartCam5GatingDetector;
  v6 = -[VNImageAnalyzerBasedDetector configureImageAnalyzerOptions:error:](&v10, sel_configureImageAnalyzerOptions_error_, a3, a4);
  if (v6)
  {
    -[VisionCoreSmartCam5InferenceNetworkDescriptor sceneLabelsOutputBlobName](self->_inferenceNetworkDescriptor, "sceneLabelsOutputBlobName");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::__assign_external((std::string *)a3 + 5, (const std::string::value_type *)objc_msgSend(v7, "UTF8String"));

    -[VisionCoreSmartCam5InferenceNetworkDescriptor sceneSegmentationOutputBlobName](self->_inferenceNetworkDescriptor, "sceneSegmentationOutputBlobName");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::__assign_external((std::string *)a3 + 12, (const std::string::value_type *)objc_msgSend(v8, "UTF8String"));

  }
  return v6;
}

- (unsigned)analysisTypesForProcessOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v11;
  char v12;
  void *v13;
  char v14;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_ClassificationEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "BOOLValue") & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_DocumentRegionGatingEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
  {
LABEL_5:

LABEL_6:
LABEL_7:
    v7 = 2;
    goto LABEL_8;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_TextRegionGatingEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "BOOLValue"))
  {

    goto LABEL_5;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_MachineReadableCodesGatingEnabled"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if ((v14 & 1) != 0)
    goto LABEL_7;
  v7 = 0;
LABEL_8:
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_DocumentRegionGatingGenerateSegmentationMask"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "BOOLValue") & 1) == 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_TextRegionGatingGenerateSegmentationMask"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "BOOLValue"))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_MachineReadableCodesGatingGenerateSegmentationMask"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");

      if ((v12 & 1) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }

  }
LABEL_12:
  v7 |= 0x20u;
LABEL_13:

  return v7;
}

- (id)observationsForLastAnalysisOfImageAnalyzer:(void *)a3 processOptions:(id)a4 originatingRequestSpecifier:(id)a5 qosClass:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8;
  id v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  float v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t *LabelsList;
  id v35;
  uint64x2_t *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  uint64x2_t *v41;
  id v42;
  id v43;
  id v44;
  int v45;
  uint64x2_t *v46;
  id v47;
  id v48;
  id v49;
  int v50;
  void *v51;
  id v52;
  uint64x2_t *v54;
  int v55;
  int v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  unsigned int v63;
  id v64;
  _OWORD v65[10];
  void *v66;
  std::vector<std::string> v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  void *v78[2];
  void *v79[9];
  _QWORD v80[7];

  v8 = *(_QWORD *)&a6;
  v11 = a4;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_ClassificationEnabled"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (v14)
  {
    v15 = v11;
    if (!self)
      goto LABEL_58;
    +[VNValidationUtilities originatingRequestSpecifierForKey:inOptions:error:](VNValidationUtilities, "originatingRequestSpecifierForKey:inOptions:error:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_ClassificationOriginatingRequestSpecifier"), v15, a7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNSmartCam5GatingDetectorProcessingOption_ClassificationObservationsArray"), v15, a7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        -[VNImageAnalyzerBasedDetector observationsForSceneLabelsFromLastAnalysisOfImageAnalyzer:identifierAcceptingBlock:operationPointsProvider:originatingRequestSpecifier:qosClass:error:](self, "observationsForSceneLabelsFromLastAnalysisOfImageAnalyzer:identifierAcceptingBlock:operationPointsProvider:originatingRequestSpecifier:qosClass:error:", a3, 0, 0, v16, v8, a7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v17, "addObjectsFromArray:", v18);
          v19 = v18;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

    if (!v18)
      goto LABEL_59;
    objc_msgSend(v12, "addObjectsFromArray:", v18);

  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_DocumentRegionGatingEnabled"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "BOOLValue");

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_TextRegionGatingEnabled"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "BOOLValue");

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_MachineReadableCodesGatingEnabled"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "BOOLValue");

  if ((v21 | v23 | v25) == 1)
  {
    v63 = v8;
    v15 = v11;
    if (self)
    {
      +[VNValidationUtilities requiredSessionInOptions:error:](VNValidationUtilities, "requiredSessionInOptions:error:", v15, a7);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        v31 = 0;
        goto LABEL_55;
      }
      v64 = v26;
      +[VNValidationUtilities originatingRequestSpecifierForKey:inOptions:error:](VNValidationUtilities, "originatingRequestSpecifierForKey:inOptions:error:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_GatingOriginatingRequestSpecifier"), v15, a7);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v27)
      {
        v31 = 0;
LABEL_54:

        v26 = v64;
LABEL_55:

        if (v31)
        {
          objc_msgSend(v12, "addObjectsFromArray:", v31);

          goto LABEL_57;
        }
LABEL_59:
        v52 = 0;
        goto LABEL_60;
      }
      v62 = v27;
      +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNSmartCam5GatingDetectorProcessingOption_GatingObservationsArray"), v15, a7);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v61)
      {
        v31 = 0;
        v32 = 0;
LABEL_53:

        v27 = v62;
        goto LABEL_54;
      }
      vision::mod::ImageAnalyzer::getSceneLabelsConfidences((vision::mod::ImageAnalyzer *)v80, v28, (uint64_t)a3);
      memset(v79, 0, sizeof(v79));
      v77 = 0u;
      *(_OWORD *)v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v68 = 0u;
      memset(&v67, 0, sizeof(v67));
      if (v21)
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_DocumentRegionGatingGenerateSegmentationMask"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v29, "BOOLValue");

        if (!v23)
          goto LABEL_20;
      }
      else
      {
        v57 = 0;
        if (!v23)
        {
LABEL_20:
          v56 = 0;
          if (v25)
          {
LABEL_21:
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_MachineReadableCodesGatingGenerateSegmentationMask"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v30, "BOOLValue");

            goto LABEL_28;
          }
LABEL_27:
          v55 = 0;
LABEL_28:
          if (((v57 | v56) & 1) != 0 || v55)
          {
            vision::mod::ImageAnalyzer::getSceneSegmentation((vision::mod::ImageAnalyzer *)v65, (uint64_t)a3);
            free(v78[1]);
            v78[1] = 0;
            free(v79[1]);
            memset(&v79[1], 0, 32);
            free(v79[5]);
            memset(&v79[5], 0, 32);
            v76 = v65[8];
            v77 = v65[9];
            v78[0] = v66;
            v72 = v65[4];
            v73 = v65[5];
            v74 = v65[6];
            v75 = v65[7];
            v68 = v65[0];
            v69 = v65[1];
            v70 = v65[2];
            v71 = v65[3];
            vision::mod::ImageAnalyzer_Tensor3D::~ImageAnalyzer_Tensor3D((vision::mod::ImageAnalyzer_Tensor3D *)v65);
            LabelsList = vision::mod::ImageAnalyzer::getLabelsList((uint64_t)a3, 0x20u);
            if (&v67 != (std::vector<std::string> *)LabelsList)
              std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string*,std::string*>(&v67, (std::string *)*LabelsList, (__int128 *)LabelsList[1], 0xAAAAAAAAAAAAAAABLL * ((LabelsList[1] - *LabelsList) >> 3));
          }
          v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v60 = v35;
          if (!v21)
            goto LABEL_63;
          v36 = (uint64x2_t *)&v68;
          if (!v57)
            v36 = 0;
          v54 = v36;
          v37 = v35;
          v38 = v62;
          v39 = v64;
          v58 = v37;
          LOBYTE(v37) = -[VNSmartCam5GatingDetector _recordRecognizedObjectObservationsWithIdentifier:inObservationsArray:sceneLabelToConfidenceMap:segmentationTensor:segmentationChannelLabels:originatingRequestSpecifier:qosClass:session:error:]((uint64_t)self, CFSTR("VNRecognizeDocumentElementIdentifierDocument"), v37, v80, v54, (uint64_t *)&v67, v38, v63, v39, a7);

          v40 = v60;
          if ((v37 & 1) != 0)
          {
LABEL_63:
            if (v23)
            {
              v41 = v56 ? (uint64x2_t *)&v68 : 0;
              v42 = v60;
              v43 = v62;
              v44 = v64;
              v45 = -[VNSmartCam5GatingDetector _recordRecognizedObjectObservationsWithIdentifier:inObservationsArray:sceneLabelToConfidenceMap:segmentationTensor:segmentationChannelLabels:originatingRequestSpecifier:qosClass:session:error:]((uint64_t)self, CFSTR("VNRecognizeDocumentElementIdentifierText"), v42, v80, v41, (uint64_t *)&v67, v43, v63, v44, a7);

              if (!v45)
              {
                v31 = 0;
                v40 = v60;
                v32 = v61;
                goto LABEL_51;
              }
            }
            v40 = v60;
            if (!v25)
            {
LABEL_47:
              v32 = v61;
              objc_msgSend(v61, "addObjectsFromArray:", v60);
              v31 = v60;
              goto LABEL_51;
            }
            if (v55)
              v46 = (uint64x2_t *)&v68;
            else
              v46 = 0;
            v47 = v60;
            v48 = v62;
            v49 = v64;
            v59 = v47;
            if ((-[VNSmartCam5GatingDetector _recordRecognizedObjectObservationsWithIdentifier:inObservationsArray:sceneLabelToConfidenceMap:segmentationTensor:segmentationChannelLabels:originatingRequestSpecifier:qosClass:session:error:]((uint64_t)self, CFSTR("VNRecognizeDocumentElementIdentifierQRCode"), v47, v80, v46, (uint64_t *)&v67, v48, v63, v49, a7) & 1) != 0)
            {
              v50 = -[VNSmartCam5GatingDetector _recordRecognizedObjectObservationsWithIdentifier:inObservationsArray:sceneLabelToConfidenceMap:segmentationTensor:segmentationChannelLabels:originatingRequestSpecifier:qosClass:session:error:]((uint64_t)self, CFSTR("VNRecognizeDocumentElementIdentifierAppCode"), v47, v80, v46, (uint64_t *)&v67, v48, v63, v49, a7);

              if (v50)
                goto LABEL_47;
            }
            else
            {

            }
          }
          v31 = 0;
          v32 = v61;
LABEL_51:

          *(_QWORD *)&v65[0] = &v67;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v65);
          vision::mod::ImageAnalyzer_Tensor3D::~ImageAnalyzer_Tensor3D((vision::mod::ImageAnalyzer_Tensor3D *)&v68);
          std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node((void **)v80[2]);
          v51 = (void *)v80[0];
          v80[0] = 0;
          if (v51)
            operator delete(v51);
          goto LABEL_53;
        }
      }
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_TextRegionGatingGenerateSegmentationMask"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v33, "BOOLValue");

      if (v25)
        goto LABEL_21;
      goto LABEL_27;
    }
LABEL_58:

    goto LABEL_59;
  }
LABEL_57:
  v52 = v12;
LABEL_60:

  return v52;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundingBoxGenerator, 0);
  objc_storeStrong((id *)&self->_documentIdentifierToSceneLabels, 0);
  objc_storeStrong((id *)&self->_inferenceNetworkDescriptor, 0);
}

- (uint64_t)_recordRecognizedObjectObservationsWithIdentifier:(void *)a3 inObservationsArray:(_QWORD *)a4 sceneLabelToConfidenceMap:(uint64x2_t *)a5 segmentationTensor:(uint64_t *)a6 segmentationChannelLabels:(void *)a7 originatingRequestSpecifier:(unsigned int)a8 qosClass:(void *)a9 session:(_QWORD *)a10 error:
{
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  uint64_t v19;
  void **v20;
  char *v21;
  char **v22;
  float v23;
  float v24;
  char v25;
  CGRect *v26;
  CGRect *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CVPixelBufferRef DeepCopyCVPixelBufferFromVImageBuffer;
  __CVBuffer *v32;
  VNImageBuffer *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t i;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  unint64_t v56;
  __int128 v57;
  CGRect *v58;
  VNPixelBufferObservation *v59;
  VNClassificationObservation *v60;
  double v61;
  VNClassificationObservation *v62;
  CGRect *j;
  double x;
  double y;
  double width;
  double height;
  _BOOL4 v68;
  VNRecognizedObjectObservation *v69;
  void *v70;
  double v71;
  VNPixelBufferObservation *v72;
  VNRecognizedObjectObservation *v73;
  uint64_t v74;
  void **v75;
  void *v76;
  char v77;
  uint64_t v78;
  void *v80;
  uint64_t v81;
  uint64_t v83;
  id v84;
  __CVBuffer *texture;
  void *v86;
  VNImageBuffer *v87;
  id v89;
  id obj;
  uint64_t v92;
  uint64_t v93;
  void *v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  void *__p[2];
  unsigned __int8 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  unsigned int v108;
  int v109;
  int32x2_t v110;
  char v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE v116[128];
  _OWORD v117[2];
  _BYTE v118[128];
  _QWORD v119[4];
  CGRect v120;
  CGRect v121;

  v119[1] = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v96 = a3;
  v97 = a7;
  v98 = a9;
  v81 = a1;
  v95 = v13;
  objc_msgSend(*(id *)(a1 + 104), "objectForKey:", v13);
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v116, 16);
  v83 = 1;
  if (!v14)
    goto LABEL_88;
  v93 = *(_QWORD *)v105;
LABEL_3:
  v15 = 0;
  v92 = v14;
  while (1)
  {
    if (*(_QWORD *)v105 != v93)
      objc_enumerationMutation(obj);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v104 + 1) + 8 * v15)), "UTF8String"));
    v100 = v95;
    v101 = v96;
    v16 = v97;
    v99 = v98;
    v17 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(a4, (unsigned __int8 *)__p);
    if (!v17)
      goto LABEL_20;
    v18 = v17;
    v19 = 0;
    v20 = (v103 & 0x80u) == 0 ? __p : (void **)__p[0];
    v21 = (v103 & 0x80u) == 0 ? (char *)v103 : (char *)__p[1];
    while (1)
    {
      v22 = &(&-[VNSmartCam5GatingDetector _gatingConfidenceThresholdForSceneLabel:]::identifierThresholds)[v19];
      if ((&-[VNSmartCam5GatingDetector _gatingConfidenceThresholdForSceneLabel:]::identifierThresholds)[v19 + 1] == v21
        && !memcmp(*v22, v20, (size_t)v21))
      {
        break;
      }
      v19 += 3;
      if (v19 == 6)
        goto LABEL_16;
    }
    if (v22 == (char **)&__block_literal_global_22406)
    {
LABEL_16:
      v23 = 0.0;
      goto LABEL_19;
    }
    v23 = *((float *)v22 + 4);
LABEL_19:
    v24 = *((float *)v18 + 10);
    if (v24 < v23)
    {
LABEL_20:
      v25 = 1;
      goto LABEL_69;
    }
    v26 = (CGRect *)operator new(0x20uLL);
    v27 = v26 + 1;
    *v26 = VNNormalizedIdentityRect;
    if (!a5
      || (v28 = *a6,
          v29 = a6[1],
          v30 = std::__find_impl[abi:ne180100]<std::string const*,std::string const*,std::string,std::__identity>(*a6, v29, (unsigned __int8 **)__p), v30 == v29))
    {
      v59 = 0;
      goto LABEL_54;
    }
    v110 = vrev64_s32((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64(a5[5])));
    v109 = 0;
    memset(v117, 0, sizeof(v117));
    vision::mod::ImageAnalyzer_Tensor3D::getVImageBufferFromTensorChannel(v117, (uint64_t)a5, 0xAAAAAAAAAAAAAAABLL * ((v30 - v28) >> 3), (float *)&v110, &v109);
    v108 = 0;
    DeepCopyCVPixelBufferFromVImageBuffer = ImageProcessing_createDeepCopyCVPixelBufferFromVImageBuffer((char **)v117, v109, (int *)&v108);
    if (DeepCopyCVPixelBufferFromVImageBuffer)
    {
      v32 = DeepCopyCVPixelBufferFromVImageBuffer;
      v89 = v16;
      texture = v32;
      v84 = v99;
      v33 = [VNImageBuffer alloc];
      v87 = -[VNImageBuffer initWithCVPixelBuffer:orientation:options:session:](v33, "initWithCVPixelBuffer:orientation:options:session:", v32, 1, MEMORY[0x1E0C9AA70], v84);
      v34 = objc_alloc(MEMORY[0x1E0C99E08]);
      v119[0] = v87;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = (void *)objc_msgSend(v34, "initWithObjectsAndKeys:", v35, CFSTR("VNDetectorProcessOption_InputImageBuffers"), v89, CFSTR("VNDetectorOption_OriginatingRequestSpecifier"), 0);

      objc_msgSend(*(id *)(v81 + 112), "internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", a8, v86, 0, a10, 0, 0.0, 0.0, 1.0, 1.0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v36)
      {
        if (objc_msgSend(v36, "count"))
        {
          v114 = 0u;
          v115 = 0u;
          v113 = 0u;
          v112 = 0u;
          v38 = v37;
          v80 = v37;
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v112, v118, 16);
          if (v39)
          {
            v40 = *(_QWORD *)v113;
            v41 = (char *)v26;
            do
            {
              for (i = 0; i != v39; ++i)
              {
                if (*(_QWORD *)v113 != v40)
                  objc_enumerationMutation(v38);
                objc_msgSend(*(id *)(*((_QWORD *)&v112 + 1) + 8 * i), "boundingBox");
                v47 = v43;
                v48 = v44;
                v49 = v45;
                v50 = v46;
                if (v41 >= (char *)v27)
                {
                  v51 = (v41 - (char *)v26) >> 5;
                  v52 = v51 + 1;
                  if ((unint64_t)(v51 + 1) >> 59)
                    std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                  if (((char *)v27 - (char *)v26) >> 4 > v52)
                    v52 = ((char *)v27 - (char *)v26) >> 4;
                  if ((unint64_t)((char *)v27 - (char *)v26) >= 0x7FFFFFFFFFFFFFE0)
                    v53 = 0x7FFFFFFFFFFFFFFLL;
                  else
                    v53 = v52;
                  if (v53)
                    v53 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vImage_Buffer>>(v53);
                  else
                    v54 = 0;
                  v55 = (_QWORD *)(v53 + 32 * v51);
                  *v55 = v47;
                  v55[1] = v48;
                  v55[2] = v49;
                  v55[3] = v50;
                  if (v41 == (char *)v26)
                  {
                    v58 = (CGRect *)(v53 + 32 * v51);
                  }
                  else
                  {
                    v56 = v53 + 32 * v51;
                    do
                    {
                      v57 = *((_OWORD *)v41 - 1);
                      v58 = (CGRect *)(v56 - 32);
                      *(_OWORD *)(v56 - 32) = *((_OWORD *)v41 - 2);
                      *(_OWORD *)(v56 - 16) = v57;
                      v41 -= 32;
                      v56 -= 32;
                    }
                    while (v41 != (char *)v26);
                  }
                  v27 = (CGRect *)(v53 + 32 * v54);
                  v41 = (char *)(v55 + 4);
                  if (v26)
                    operator delete(v26);
                  v26 = v58;
                }
                else
                {
                  *(_QWORD *)v41 = v43;
                  *((_QWORD *)v41 + 1) = v44;
                  *((_QWORD *)v41 + 2) = v45;
                  *((_QWORD *)v41 + 3) = v46;
                  v41 += 32;
                }
              }
              v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v112, v118, 16);
            }
            while (v39);
          }
          else
          {
            v41 = (char *)v26;
          }

          v27 = (CGRect *)v41;
          v37 = v80;
        }
        else
        {
          *v26 = VNNormalizedIdentityRect;
        }
      }

      if (v37)
      {
        v59 = -[VNPixelBufferObservation initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:]([VNPixelBufferObservation alloc], "initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:", v89, 0, texture);
        v77 = 1;
      }
      else
      {
        v59 = 0;
        v77 = 0;
        v111 = 0;
      }
      CVPixelBufferRelease(texture);
      if ((v77 & 1) == 0)
      {
LABEL_60:

        if (!v26)
          goto LABEL_68;
        goto LABEL_67;
      }
LABEL_54:
      v60 = [VNClassificationObservation alloc];
      *(float *)&v61 = v24;
      v62 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v60, "initWithOriginatingRequestSpecifier:identifier:confidence:", v16, v100, v61);
      for (j = v26; j != v27; ++j)
      {
        x = j->origin.x;
        y = j->origin.y;
        width = j->size.width;
        height = j->size.height;
        v121.origin.x = 0.0;
        v121.origin.y = 0.0;
        v121.size.width = 1.0;
        v121.size.height = 1.0;
        v120.origin.x = j->origin.x;
        v120.origin.y = y;
        v120.size.width = width;
        v120.size.height = height;
        v68 = CGRectEqualToRect(v120, v121);
        v69 = [VNRecognizedObjectObservation alloc];
        *(_QWORD *)&v117[0] = v62;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 1);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        if (v68)
          v72 = 0;
        else
          v72 = v59;
        *(float *)&v71 = v24;
        v73 = -[VNRecognizedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:](v69, "initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:", v16, v70, v72, 0, x, y, width, height, v71);

        objc_msgSend(v101, "addObject:", v73);
      }
      v111 = 1;

      goto LABEL_60;
    }
    if (a10)
    {
      v74 = v108;
      v75 = __p;
      if ((v103 & 0x80u) != 0)
        v75 = (void **)__p[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to create segmentation image for %s"), v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForOSStatus:localizedDescription:](VNError, "errorForOSStatus:localizedDescription:", v74, v76);
      *a10 = (id)objc_claimAutoreleasedReturnValue();

    }
    v111 = 0;
LABEL_67:
    operator delete(v26);
LABEL_68:
    v25 = v111;
LABEL_69:

    if ((v25 & 1) == 0)
      break;
    if ((char)v103 < 0)
      operator delete(__p[0]);
    if (++v15 == v92)
    {
      v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v116, 16);
      v14 = v78;
      if (!v78)
      {
        v83 = 1;
        goto LABEL_88;
      }
      goto LABEL_3;
    }
  }
  if ((char)v103 < 0)
    operator delete(__p[0]);
  v83 = 0;
LABEL_88:

  return v83;
}

+ (id)_inferenceNetworkDescriptorForConfiguration:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;

  +[VNFrameworkManager manager](VNFrameworkManager, "manager", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detectorDescriptorsCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForIdentifier:creationBlock:error:", CFSTR("VNSmartCam5GatingDetector"), &__block_literal_global_11919, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)modelPathForConfiguration:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "_inferenceNetworkDescriptorForConfiguration:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "VisionCoreFileSystemPathAndReturnError:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)providesSceneLabelsForConfiguration:(id)a3
{
  return 1;
}

+ (id)sceneLabelsFilePathForConfiguration:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "_inferenceNetworkDescriptorForConfiguration:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "sceneLabelConfidencesOutput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "labelsFileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "VisionCoreFileSystemPathAndReturnError:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)inputImageBlobNameForConfiguration:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_inferenceNetworkDescriptorForConfiguration:error:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "onlyInputImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (unsigned)analysisPixelFormatTypeForConfiguration:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;

  objc_msgSend(a1, "_inferenceNetworkDescriptorForConfiguration:error:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "onlyInputImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "pixelFormatType");

  return v5;
}

+ (BOOL)providesSegmentationLabelsForConfiguration:(id)a3
{
  return 1;
}

+ (id)segmentationLabelsFilePathForConfiguration:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "_inferenceNetworkDescriptorForConfiguration:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "segmentationLabelsFileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "VisionCoreFileSystemPathAndReturnError:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __79__VNSmartCam5GatingDetector__inferenceNetworkDescriptorForConfiguration_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0DC6CE0], "descriptorAndReturnError:", a2);
}

@end
