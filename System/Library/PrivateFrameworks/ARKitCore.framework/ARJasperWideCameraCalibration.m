@implementation ARJasperWideCameraCalibration

void __ARJasperWideCameraCalibration_block_invoke()
{
  unint64_t v0;
  double v1;
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  v0 = ARCameraToJasperExtrinsics((void *)*MEMORY[0x1E0C89FA0]).n128_u64[0];
  v16 = v1;
  v17 = *(double *)&v0;
  v14 = v3;
  v15 = v2;
  v4 = (void *)MEMORY[0x1E0C99D50];
  ARKitCoreBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ar_pathForPrivateResource:ofType:", CFSTR("Wide_distortion_lookup_table"), CFSTR("hardcoded"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithContentsOfFile:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99D50];
  ARKitCoreBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ar_pathForPrivateResource:ofType:", CFSTR("Wide_inverse_distortion_lookup_table"), CFSTR("hardcoded"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataWithContentsOfFile:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 && v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCDE0]), "initWithDistortionCenter:lensDistortionLookupTable:inverseLensDistortionLookupTable:", v18, v10, 959.341819, 718.244185);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFCDC0]), "initWithIntrinsics:cameraToPlatformTransform:pixelSize:forReferenceDimensions:withDistortionModel:", v11, *(double *)&_PromotedConst_48, unk_1B3BDFFF0, 0.0, v17, v16, v15, v14, 0.00197999994, 0x409E000000000000, 0x4096800000000000);
    v13 = (void *)ARJasperWideCameraCalibration::cameraCalibration;
    ARJasperWideCameraCalibration::cameraCalibration = v12;

  }
}

@end
