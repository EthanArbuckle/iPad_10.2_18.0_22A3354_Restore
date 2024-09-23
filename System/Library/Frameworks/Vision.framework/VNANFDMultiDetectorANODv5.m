@implementation VNANFDMultiDetectorANODv5

+ (Class)detectorClass
{
  return (Class)objc_opt_class();
}

+ (id)detectedObjectClassToRequestKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__VNANFDMultiDetectorANODv5_detectedObjectClassToRequestKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNANFDMultiDetectorANODv5 detectedObjectClassToRequestKey]::onceToken != -1)
    dispatch_once(&+[VNANFDMultiDetectorANODv5 detectedObjectClassToRequestKey]::onceToken, block);
  return (id)+[VNANFDMultiDetectorANODv5 detectedObjectClassToRequestKey]::detectedObjectClassToRequestKey;
}

+ (id)detectedObjectRequestKeyToRequestInfo
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__VNANFDMultiDetectorANODv5_detectedObjectRequestKeyToRequestInfo__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNANFDMultiDetectorANODv5 detectedObjectRequestKeyToRequestInfo]::onceToken != -1)
    dispatch_once(&+[VNANFDMultiDetectorANODv5 detectedObjectRequestKeyToRequestInfo]::onceToken, block);
  return (id)+[VNANFDMultiDetectorANODv5 detectedObjectRequestKeyToRequestInfo]::detectedObjectRequestKeyToRequestInfo;
}

+ (NSDictionary)recognizedAnimalFaceObjectClassToAnimalFaceCategoryName
{
  if (+[VNANFDMultiDetectorANODv5 recognizedAnimalFaceObjectClassToAnimalFaceCategoryName]::onceToken != -1)
    dispatch_once(&+[VNANFDMultiDetectorANODv5 recognizedAnimalFaceObjectClassToAnimalFaceCategoryName]::onceToken, &__block_literal_global_32121);
  return (NSDictionary *)(id)+[VNANFDMultiDetectorANODv5 recognizedAnimalFaceObjectClassToAnimalFaceCategoryName]::recognizedAnimalFaceObjectClassToAnimalFaceCategoryName;
}

+ (NSArray)knownAnimalFaceIdentifiers
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__VNANFDMultiDetectorANODv5_knownAnimalFaceIdentifiers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNANFDMultiDetectorANODv5 knownAnimalFaceIdentifiers]::onceToken != -1)
    dispatch_once(&+[VNANFDMultiDetectorANODv5 knownAnimalFaceIdentifiers]::onceToken, block);
  return (NSArray *)(id)+[VNANFDMultiDetectorANODv5 knownAnimalFaceIdentifiers]::knownAnimalFaceIdentifiers;
}

+ (BOOL)shouldAlignFacesForRequestWithSpecifier:(id)a3
{
  return 0;
}

void __55__VNANFDMultiDetectorANODv5_knownAnimalFaceIdentifiers__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "recognizedAnimalFaceObjectClassToAnimalFaceCategoryName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)+[VNANFDMultiDetectorANODv5 knownAnimalFaceIdentifiers]::knownAnimalFaceIdentifiers;
  +[VNANFDMultiDetectorANODv5 knownAnimalFaceIdentifiers]::knownAnimalFaceIdentifiers = v2;

}

void __84__VNANFDMultiDetectorANODv5_recognizedAnimalFaceObjectClassToAnimalFaceCategoryName__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E459D288;
  v2[1] = &unk_1E459D2A0;
  v3[0] = CFSTR("CatFace");
  v3[1] = CFSTR("DogFace");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNANFDMultiDetectorANODv5 recognizedAnimalFaceObjectClassToAnimalFaceCategoryName]::recognizedAnimalFaceObjectClassToAnimalFaceCategoryName;
  +[VNANFDMultiDetectorANODv5 recognizedAnimalFaceObjectClassToAnimalFaceCategoryName]::recognizedAnimalFaceObjectClassToAnimalFaceCategoryName = v0;

}

void __66__VNANFDMultiDetectorANODv5_detectedObjectRequestKeyToRequestInfo__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  VNANFDMultiDetectorOriginalRequestInfo *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___VNANFDMultiDetectorANODv5;
  objc_msgSendSuper2(&v8, sel_detectedObjectRequestKeyToRequestInfo);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v3 = -[VNMultiDetectorOriginalRequestInfo initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:]([VNANFDMultiDetectorOriginalRequestInfo alloc], "initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:", CFSTR("VNANFDMultiDetectorProcessingOption_AnimalFacesRecognitionOriginatingRequestSpecifier"), 8);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v5);

  v6 = objc_msgSend(v2, "copy");
  v7 = (void *)+[VNANFDMultiDetectorANODv5 detectedObjectRequestKeyToRequestInfo]::detectedObjectRequestKeyToRequestInfo;
  +[VNANFDMultiDetectorANODv5 detectedObjectRequestKeyToRequestInfo]::detectedObjectRequestKeyToRequestInfo = v6;

}

void __60__VNANFDMultiDetectorANODv5_detectedObjectClassToRequestKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  objc_class *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)&OBJC_METACLASS___VNANFDMultiDetectorANODv5;
  objc_msgSendSuper2(&v9, sel_detectedObjectClassToRequestKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, &unk_1E459D288);

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, &unk_1E459D2A0);

  v7 = objc_msgSend(v2, "copy");
  v8 = (void *)+[VNANFDMultiDetectorANODv5 detectedObjectClassToRequestKey]::detectedObjectClassToRequestKey;
  +[VNANFDMultiDetectorANODv5 detectedObjectClassToRequestKey]::detectedObjectClassToRequestKey = v7;

}

- (BOOL)updateRuntimeParametersFromOptions:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)processDetectedObject:(id)a3 originatingRequestSpecifier:(id)a4 objectBoundingBox:(CGRect)a5 objectGroupId:(id)a6 imageBuffer:(id)a7 qosClass:(unsigned int)a8 session:(id)a9 warningRecorder:(id)a10 detectedObjectResults:(id)a11 error:(id *)a12
{
  uint64_t v13;
  double height;
  double width;
  double y;
  double x;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  double v32;
  BOOL v33;
  id v35;
  objc_super v36;

  v13 = *(_QWORD *)&a8;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v22 = a3;
  v23 = a4;
  v24 = a6;
  v35 = a7;
  v25 = a9;
  v26 = a10;
  v27 = a11;
  objc_msgSend((id)objc_opt_class(), "recognizedAnimalFaceObjectClassToAnimalFaceCategoryName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "labelKey") - 13 >= 2)
  {
    v36.receiver = self;
    v36.super_class = (Class)VNANFDMultiDetectorANODv5;
    v33 = -[VNANFDMultiDetectorANODv4 processDetectedObject:originatingRequestSpecifier:objectBoundingBox:objectGroupId:imageBuffer:qosClass:session:warningRecorder:detectedObjectResults:error:](&v36, sel_processDetectedObject_originatingRequestSpecifier_objectBoundingBox_objectGroupId_imageBuffer_qosClass_session_warningRecorder_detectedObjectResults_error_, v22, v23, v24, v35, v13, v25, x, y, width, height, v26, v27, a12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v22, "labelKey"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKey:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "confidence");
    LODWORD(v32) = v31;
    -[VNANFDMultiDetector processRecognizedObjectWithIdentifier:originatingRequestSpecifier:objectBoundingBox:objectGroupId:objectConfidence:detectedObjectResults:](self, "processRecognizedObjectWithIdentifier:originatingRequestSpecifier:objectBoundingBox:objectGroupId:objectConfidence:detectedObjectResults:", v30, v23, v24, v27, x, y, width, height, v32);

    v33 = 1;
  }

  return v33;
}

- (id)splitDetectedClassResultsIntoSubclasses:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  id v17;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = v4;
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          v12 = -[VNANFDMultiDetector isDetectedObject:ofAGivenObjectSubClass:](self, "isDetectedObject:ofAGivenObjectSubClass:", v11, CFSTR("DogFace"));
          v13 = v5;
          if (!v12)
          {
            v14 = -[VNANFDMultiDetector isDetectedObject:ofAGivenObjectSubClass:](self, "isDetectedObject:ofAGivenObjectSubClass:", v11, CFSTR("CatFace"));
            v13 = v6;
            if (!v14)
            {
              v18.receiver = self;
              v18.super_class = (Class)VNANFDMultiDetectorANODv5;
              -[VNANFDMultiDetectorANODv4 splitDetectedClassResultsIntoSubclasses:](&v18, sel_splitDetectedClassResultsIntoSubclasses_, v7);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              v4 = v17;
              goto LABEL_14;
            }
          }
          objc_msgSend(v13, "addObject:", v11);
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v8)
          continue;
        break;
      }
    }

    v4 = v17;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v5, v6, 0);
LABEL_14:

  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)VNANFDMultiDetectorANODv5;
    -[VNANFDMultiDetectorANODv4 splitDetectedClassResultsIntoSubclasses:](&v23, sel_splitDetectedClassResultsIntoSubclasses_, v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

@end
