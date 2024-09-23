@implementation VNANFDMultiDetectorANODv4

void __66__VNANFDMultiDetectorANODv4_detectedObjectRequestKeyToRequestInfo__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  VNANFDMultiDetectorOriginalRequestInfo *v3;
  objc_class *v4;
  void *v5;
  VNANFDMultiDetectorOriginalRequestInfo *v6;
  objc_class *v7;
  void *v8;
  VNANFDMultiDetectorOriginalRequestInfo *v9;
  id v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v16;

  v16.receiver = *(id *)(a1 + 32);
  v16.super_class = (Class)&OBJC_METACLASS___VNANFDMultiDetectorANODv4;
  objc_msgSendSuper2(&v16, sel_detectedObjectRequestKeyToRequestInfo);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v3 = -[VNMultiDetectorOriginalRequestInfo initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:]([VNANFDMultiDetectorOriginalRequestInfo alloc], "initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:", CFSTR("VNANFDMultiDetectorProcessingOption_AnimalHeadsRecognitionOriginatingRequestSpecifier"), 5);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v5);

  v6 = -[VNMultiDetectorOriginalRequestInfo initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:]([VNANFDMultiDetectorOriginalRequestInfo alloc], "initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:", CFSTR("VNANFDMultiDetectorProcessingOption_SportBallsRecognitionOriginatingRequestSpecifier"), 6);
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, v8);

  v9 = -[VNMultiDetectorOriginalRequestInfo initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:]([VNANFDMultiDetectorOriginalRequestInfo alloc], "initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:", CFSTR("VNANFDMultiDetectorProcessingOption_HumanDetectorOriginatingRequestSpecifier"), 7);
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@%@%@"), v12, CFSTR("_"), MEMORY[0x1E0C9AAA0]);
  objc_msgSend(v2, "setObject:forKey:", v9, v13);

  v14 = objc_msgSend(v2, "copy");
  v15 = (void *)+[VNANFDMultiDetectorANODv4 detectedObjectRequestKeyToRequestInfo]::detectedObjectRequestKeyToRequestInfo;
  +[VNANFDMultiDetectorANODv4 detectedObjectRequestKeyToRequestInfo]::detectedObjectRequestKeyToRequestInfo = v14;

}

+ (Class)detectorClass
{
  return (Class)objc_opt_class();
}

+ (id)detectedObjectClassToRequestKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__VNANFDMultiDetectorANODv4_detectedObjectClassToRequestKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNANFDMultiDetectorANODv4 detectedObjectClassToRequestKey]::onceToken != -1)
    dispatch_once(&+[VNANFDMultiDetectorANODv4 detectedObjectClassToRequestKey]::onceToken, block);
  return (id)+[VNANFDMultiDetectorANODv4 detectedObjectClassToRequestKey]::detectedObjectClassToRequestKey;
}

+ (id)detectedObjectRequestKeyToRequestInfo
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__VNANFDMultiDetectorANODv4_detectedObjectRequestKeyToRequestInfo__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNANFDMultiDetectorANODv4 detectedObjectRequestKeyToRequestInfo]::onceToken != -1)
    dispatch_once(&+[VNANFDMultiDetectorANODv4 detectedObjectRequestKeyToRequestInfo]::onceToken, block);
  return (id)+[VNANFDMultiDetectorANODv4 detectedObjectRequestKeyToRequestInfo]::detectedObjectRequestKeyToRequestInfo;
}

+ (NSDictionary)recognizedAnimalHeadObjectClassToAnimalHeadCategoryName
{
  if (+[VNANFDMultiDetectorANODv4 recognizedAnimalHeadObjectClassToAnimalHeadCategoryName]::onceToken != -1)
    dispatch_once(&+[VNANFDMultiDetectorANODv4 recognizedAnimalHeadObjectClassToAnimalHeadCategoryName]::onceToken, &__block_literal_global_105);
  return (NSDictionary *)(id)+[VNANFDMultiDetectorANODv4 recognizedAnimalHeadObjectClassToAnimalHeadCategoryName]::recognizedAnimalHeadObjectClassToAnimalHeadCategoryName;
}

+ (NSArray)knownAnimalHeadIdentifiers
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__VNANFDMultiDetectorANODv4_knownAnimalHeadIdentifiers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNANFDMultiDetectorANODv4 knownAnimalHeadIdentifiers]::onceToken != -1)
    dispatch_once(&+[VNANFDMultiDetectorANODv4 knownAnimalHeadIdentifiers]::onceToken, block);
  return (NSArray *)(id)+[VNANFDMultiDetectorANODv4 knownAnimalHeadIdentifiers]::knownAnimalHeadIdentifiers;
}

+ (NSDictionary)recognizedSportBallObjectClassToSportBallCategoryName
{
  if (+[VNANFDMultiDetectorANODv4 recognizedSportBallObjectClassToSportBallCategoryName]::onceToken != -1)
    dispatch_once(&+[VNANFDMultiDetectorANODv4 recognizedSportBallObjectClassToSportBallCategoryName]::onceToken, &__block_literal_global_36);
  return (NSDictionary *)(id)+[VNANFDMultiDetectorANODv4 recognizedSportBallObjectClassToSportBallCategoryName]::recognizedSportBallObjectClassToSportBallCategoryName;
}

+ (NSArray)knownSportBallIdentifiers
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__VNANFDMultiDetectorANODv4_knownSportBallIdentifiers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNANFDMultiDetectorANODv4 knownSportBallIdentifiers]::onceToken != -1)
    dispatch_once(&+[VNANFDMultiDetectorANODv4 knownSportBallIdentifiers]::onceToken, block);
  return (NSArray *)(id)+[VNANFDMultiDetectorANODv4 knownSportBallIdentifiers]::knownSportBallIdentifiers;
}

+ (BOOL)shouldAlignFacesForRequestWithSpecifier:(id)a3
{
  return objc_msgSend(a3, "requestRevision") != 3737841669;
}

void __54__VNANFDMultiDetectorANODv4_knownSportBallIdentifiers__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "recognizedSportBallObjectClassToSportBallCategoryName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)+[VNANFDMultiDetectorANODv4 knownSportBallIdentifiers]::knownSportBallIdentifiers;
  +[VNANFDMultiDetectorANODv4 knownSportBallIdentifiers]::knownSportBallIdentifiers = v2;

}

void __82__VNANFDMultiDetectorANODv4_recognizedSportBallObjectClassToSportBallCategoryName__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = &unk_1E459C3D0;
  v3[0] = CFSTR("GenericSportBall");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNANFDMultiDetectorANODv4 recognizedSportBallObjectClassToSportBallCategoryName]::recognizedSportBallObjectClassToSportBallCategoryName;
  +[VNANFDMultiDetectorANODv4 recognizedSportBallObjectClassToSportBallCategoryName]::recognizedSportBallObjectClassToSportBallCategoryName = v0;

}

void __55__VNANFDMultiDetectorANODv4_knownAnimalHeadIdentifiers__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "recognizedAnimalHeadObjectClassToAnimalHeadCategoryName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)+[VNANFDMultiDetectorANODv4 knownAnimalHeadIdentifiers]::knownAnimalHeadIdentifiers;
  +[VNANFDMultiDetectorANODv4 knownAnimalHeadIdentifiers]::knownAnimalHeadIdentifiers = v2;

}

void __84__VNANFDMultiDetectorANODv4_recognizedAnimalHeadObjectClassToAnimalHeadCategoryName__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E459C3A0;
  v2[1] = &unk_1E459C3B8;
  v3[0] = CFSTR("CatHead");
  v3[1] = CFSTR("DogHead");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNANFDMultiDetectorANODv4 recognizedAnimalHeadObjectClassToAnimalHeadCategoryName]::recognizedAnimalHeadObjectClassToAnimalHeadCategoryName;
  +[VNANFDMultiDetectorANODv4 recognizedAnimalHeadObjectClassToAnimalHeadCategoryName]::recognizedAnimalHeadObjectClassToAnimalHeadCategoryName = v0;

}

void __60__VNANFDMultiDetectorANODv4_detectedObjectClassToRequestKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  objc_class *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)&OBJC_METACLASS___VNANFDMultiDetectorANODv4;
  objc_msgSendSuper2(&v15, sel_detectedObjectClassToRequestKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, &unk_1E459C3A0);

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, &unk_1E459C3B8);

  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v8, &unk_1E459C3D0);

  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@%@%@"), v11, CFSTR("_"), MEMORY[0x1E0C9AAA0]);
  objc_msgSend(v2, "setObject:forKey:", v12, &unk_1E459C3E8);

  v13 = objc_msgSend(v2, "copy");
  v14 = (void *)+[VNANFDMultiDetectorANODv4 detectedObjectClassToRequestKey]::detectedObjectClassToRequestKey;
  +[VNANFDMultiDetectorANODv4 detectedObjectClassToRequestKey]::detectedObjectClassToRequestKey = v13;

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
  void *v27;
  void *v28;
  int v29;
  VNHumanObservation *v30;
  int v31;
  double v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  double v37;
  void *v38;
  int v39;
  double v40;
  BOOL v41;
  id v43;
  id v44;
  objc_super v45;

  v13 = *(_QWORD *)&a8;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v22 = a3;
  v23 = a4;
  v24 = a6;
  v44 = a7;
  v43 = a9;
  v25 = a10;
  v26 = a11;
  objc_msgSend((id)objc_opt_class(), "recognizedAnimalHeadObjectClassToAnimalHeadCategoryName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "recognizedSportBallObjectClassToSportBallCategoryName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v22, "labelKey");
  if ((v29 - 9) < 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v22, "labelKey"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKey:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "confidence");
    LODWORD(v37) = v36;
    -[VNANFDMultiDetector processRecognizedObjectWithIdentifier:originatingRequestSpecifier:objectBoundingBox:objectGroupId:objectConfidence:detectedObjectResults:](self, "processRecognizedObjectWithIdentifier:originatingRequestSpecifier:objectBoundingBox:objectGroupId:objectConfidence:detectedObjectResults:", v34, v23, v24, v26, x, y, width, height, v37);
  }
  else if (v29 == 11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v22, "labelKey"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKey:", v38);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "confidence");
    LODWORD(v40) = v39;
    -[VNANFDMultiDetector processRecognizedObjectWithIdentifier:originatingRequestSpecifier:objectBoundingBox:objectGroupId:objectConfidence:detectedObjectResults:](self, "processRecognizedObjectWithIdentifier:originatingRequestSpecifier:objectBoundingBox:objectGroupId:objectConfidence:detectedObjectResults:", v34, v23, v24, v26, x, y, width, height, v40);
  }
  else
  {
    if (v29 != 12)
    {
      v45.receiver = self;
      v45.super_class = (Class)VNANFDMultiDetectorANODv4;
      v41 = -[VNANFDMultiDetectorANODv3 processDetectedObject:originatingRequestSpecifier:objectBoundingBox:objectGroupId:imageBuffer:qosClass:session:warningRecorder:detectedObjectResults:error:](&v45, sel_processDetectedObject_originatingRequestSpecifier_objectBoundingBox_objectGroupId_imageBuffer_qosClass_session_warningRecorder_detectedObjectResults_error_, v22, v23, v24, v44, v13, v43, x, y, width, height, v25, v26, a12);
      goto LABEL_11;
    }
    v30 = [VNHumanObservation alloc];
    objc_msgSend(v22, "confidence");
    LODWORD(v32) = v31;
    v33 = -[VNHumanObservation initWithOriginatingRequestSpecifier:boundingBox:upperBodyOnly:confidence:](v30, "initWithOriginatingRequestSpecifier:boundingBox:upperBodyOnly:confidence:", v23, 0, x, y, width, height, v32);
    v34 = (void *)v33;
    if (v24)
      -[VNDetectedObjectObservation setGroupId:](v33, v24);
    objc_msgSend(v26, "addObject:", v34);
  }

  v41 = 1;
LABEL_11:

  return v41;
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
          v12 = -[VNANFDMultiDetector isDetectedObject:ofAGivenObjectSubClass:](self, "isDetectedObject:ofAGivenObjectSubClass:", v11, CFSTR("DogHead"));
          v13 = v5;
          if (!v12)
          {
            v14 = -[VNANFDMultiDetector isDetectedObject:ofAGivenObjectSubClass:](self, "isDetectedObject:ofAGivenObjectSubClass:", v11, CFSTR("CatHead"));
            v13 = v6;
            if (!v14)
            {
              v18.receiver = self;
              v18.super_class = (Class)VNANFDMultiDetectorANODv4;
              -[VNANFDMultiDetectorANODv3 splitDetectedClassResultsIntoSubclasses:](&v18, sel_splitDetectedClassResultsIntoSubclasses_, v7);
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
    v23.super_class = (Class)VNANFDMultiDetectorANODv4;
    -[VNANFDMultiDetectorANODv3 splitDetectedClassResultsIntoSubclasses:](&v23, sel_splitDetectedClassResultsIntoSubclasses_, v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

@end
