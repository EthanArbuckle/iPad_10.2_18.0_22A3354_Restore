@implementation VNFaceprintUpgradeDetector

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v12;
  double height;
  double width;
  double y;
  double x;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  VNFaceprint *v24;
  int v25;
  int v26;
  uint64_t v27;
  double v28;
  VNFaceprint *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  _DWORD *v35;
  objc_super v36;
  _QWORD v37[3];

  v12 = *(_QWORD *)&a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v37[2] = *MEMORY[0x1E0C80C00];
  v19 = a5;
  v36.receiver = self;
  v36.super_class = (Class)VNFaceprintUpgradeDetector;
  -[VNEspressoprintUpgradeDetector processRegionOfInterest:croppedPixelBuffer:options:qosClass:warningRecorder:error:progressHandler:](&v36, sel_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler_, a4, v19, v12, a7, a8, a9, x, y, width, height);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a9) = v20 == 0;

  if ((a9 & 1) != 0)
  {
    v33 = 0;
  }
  else
  {
    +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_msgSend((id)objc_opt_class(), "espressoprintClass"), CFSTR("VNEspressoprintUpgradeDetectorProcessOption_ToEspressoprint"), v19, a8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = objc_msgSend(v21, "elementCount");
      v24 = [VNFaceprint alloc];
      -[VNEspressoprintUpgradeDetector highResolutionNewEspressoprint](self, "highResolutionNewEspressoprint");
      objc_msgSend(v22, "confidence");
      v26 = v25;
      v27 = objc_msgSend(v22, "requestRevision");
      LODWORD(v28) = v26;
      v29 = -[VNFaceprint initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:](v24, "initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", v35, v23, 1, 4 * v23, v27, v28);
      if (v29)
      {
        v30 = (void *)MEMORY[0x1E0CB37E8];
        -[VNEspressoprintUpgradeDetector highResolutionNewEspressoprintSigma](self, "highResolutionNewEspressoprintSigma");
        LODWORD(v31) = *v35;
        objc_msgSend(v30, "numberWithFloat:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v29;
        v37[1] = v32;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else if (a8)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Cannot allocate faceprint"));
        v33 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = 0;
      }

    }
    else
    {
      v33 = 0;
    }

  }
  return v33;
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return CFSTR("fc_md1_from_anfr_3_1_md2_to_4_md2.espresso");
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  return &stru_1E4549388;
}

+ (Class)espressoprintClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)isSupportedUpgradeFromPreviousEspressoprint:(id)a3 toNewLowResolutionEspressoprint:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a3;
  v6 = a4;
  if (+[VNFaceprintUpgradeDetector isSupportedUpgradeFromPreviousEspressoprint:toNewLowResolutionEspressoprint:]::onceToken != -1)
    dispatch_once(&+[VNFaceprintUpgradeDetector isSupportedUpgradeFromPreviousEspressoprint:toNewLowResolutionEspressoprint:]::onceToken, &__block_literal_global_28100);
  v7 = objc_msgSend(v6, "requestRevision");
  v8 = (void *)+[VNFaceprintUpgradeDetector isSupportedUpgradeFromPreviousEspressoprint:toNewLowResolutionEspressoprint:]::versionsUpgradeTable;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "requestRevision"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");
  if (v7 == 3737841668)
    v7 = 3737841669;

  return v7 == v11;
}

void __106__VNFaceprintUpgradeDetector_isSupportedUpgradeFromPreviousEspressoprint_toNewLowResolutionEspressoprint___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = &unk_1E459CF58;
  v3[0] = &unk_1E459CF70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNFaceprintUpgradeDetector isSupportedUpgradeFromPreviousEspressoprint:toNewLowResolutionEspressoprint:]::versionsUpgradeTable;
  +[VNFaceprintUpgradeDetector isSupportedUpgradeFromPreviousEspressoprint:toNewLowResolutionEspressoprint:]::versionsUpgradeTable = v0;

}

@end
