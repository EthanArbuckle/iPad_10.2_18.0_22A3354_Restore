@implementation ADFigCameraCalibrationSource

- (uint64_t)initWithPixelSize:(double)a3 gdcModel:(double)a4 cameraToPlatformTransform:(double)a5
{
  id v10;
  ADFigCameraCalibrationSource *v11;
  ADFigCameraCalibrationSource *v12;
  const __CFString **v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  const __CFString **v17;
  const __CFString *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  void *v22;
  ADDynamicPolynomialsLensDistortionModel *v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  ADDynamicPolynomialsLensDistortionModel *distortion;
  ADMutableCameraCalibration *v29;
  ADMutableCameraCalibration *camera;
  ADFigCameraCalibrationSource *v31;
  NSObject *v32;
  const char *v33;
  uint64_t result;
  uint8_t buf[16];
  objc_super v40;

  v10 = a8;
  v40.receiver = a1;
  v40.super_class = (Class)ADFigCameraCalibrationSource;
  v11 = -[ADFigCameraCalibrationSource init](&v40, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_22;
  v11->_rawSensorPixelSize = a2;
  if (CMCaptureLibraryCore() && getkFigCaptureStreamGDCCoefficientsKey_BasePolynomialSymbolLoc())
  {
    v13 = (const __CFString **)getkFigCaptureStreamGDCCoefficientsKey_BasePolynomialSymbolLoc();
    if (!v13)
      goto LABEL_31;
    v14 = *v13;
  }
  else
  {
    v14 = CFSTR("BasePolynomial");
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v19 = MEMORY[0x24BDACB70];
      v20 = "GDC dictionary doesn't contain BasePolynomial key";
LABEL_17:
      _os_log_impl(&dword_236382000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
    }
LABEL_29:

    v31 = 0;
    goto LABEL_30;
  }
  if (objc_msgSend(v15, "length") != 64)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v19 = MEMORY[0x24BDACB70];
      v20 = "GDC dictionary BasePolynomial key is of wrong size";
      goto LABEL_17;
    }
    goto LABEL_29;
  }
  if (!CMCaptureLibraryCore() || !getkFigCaptureStreamGDCCoefficientsKey_DynamicPolynomialSymbolLoc())
  {
    v18 = CFSTR("DynamicPolynomial");
LABEL_19:
    objc_msgSend(v10, "objectForKeyedSubscript:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      if (objc_msgSend(v21, "length") == 64)
      {
        v23 = [ADDynamicPolynomialsLensDistortionModel alloc];
        v24 = objc_retainAutorelease(v16);
        v25 = objc_msgSend(v24, "bytes");
        v26 = objc_retainAutorelease(v22);
        v27 = -[ADDynamicPolynomialsLensDistortionModel initWithDistortionCenter:dynFactor:polynomialsBase:polynomialsDynamic:](v23, "initWithDistortionCenter:dynFactor:polynomialsBase:polynomialsDynamic:", v25, objc_msgSend(v26, "bytes"), 0.0, 0.0, 0.0);
        distortion = v12->_distortion;
        v12->_distortion = (ADDynamicPolynomialsLensDistortionModel *)v27;

        v29 = objc_alloc_init(ADMutableCameraCalibration);
        camera = v12->_camera;
        v12->_camera = v29;

        -[ADMutableCameraCalibration setCameraToPlatformTransform:](v12->_camera, "setCameraToPlatformTransform:", a3, a4, a5, a6);
        -[ADMutableCameraCalibration setDistortionModel:](v12->_camera, "setDistortionModel:", v12->_distortion);

LABEL_22:
        v31 = v12;
LABEL_30:

        return (uint64_t)v31;
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      *(_WORD *)buf = 0;
      v32 = MEMORY[0x24BDACB70];
      v33 = "GDC dictionary DynamicPolynomial key is of wrong size";
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
LABEL_28:

        goto LABEL_29;
      }
      *(_WORD *)buf = 0;
      v32 = MEMORY[0x24BDACB70];
      v33 = "GDC dictionary doesn't contain DynamicPolynomial key";
    }
    _os_log_impl(&dword_236382000, v32, OS_LOG_TYPE_DEFAULT, v33, buf, 2u);
    goto LABEL_28;
  }
  v17 = (const __CFString **)getkFigCaptureStreamGDCCoefficientsKey_DynamicPolynomialSymbolLoc();
  if (v17)
  {
    v18 = *v17;
    goto LABEL_19;
  }
LABEL_31:
  dlerror();
  result = abort_report_np();
  __break(1u);
  return result;
}

- (BOOL)pointFromMetadataField:(id)a3 key:(id)a4 point:(CGPoint *)a5
{
  id v7;
  const __CFDictionary *v8;
  BOOL v9;

  v7 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", v7);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    NSLog(CFSTR("Cannot find %@ dictionary in metadata"), v7);
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  if (!CGPointMakeWithDictionaryRepresentation(v8, a5))
  {
    NSLog(CFSTR("Invalid %@ dictionary in metadata"), v7);
    goto LABEL_6;
  }
  v9 = 1;
LABEL_7:

  return v9;
}

- (BOOL)rectFromMetadataField:(id)a3 key:(id)a4 rect:(CGRect *)a5
{
  id v7;
  const __CFDictionary *v8;
  BOOL v9;

  v7 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", v7);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    NSLog(CFSTR("Cannot find %@ dictionary in metadata"), v7);
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  if (!CGRectMakeWithDictionaryRepresentation(v8, a5))
  {
    NSLog(CFSTR("Invalid %@ dictionary in metadata"), v7);
    goto LABEL_6;
  }
  v9 = 1;
LABEL_7:

  return v9;
}

- (BOOL)updateForFrameWithDimensions:(CGSize)a3 metadataDictionary:(id)a4
{
  double height;
  double width;
  id v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  const __CFString *v16;
  void *v17;
  __int128 v18;
  const __CFString *v19;
  const __CFString **v20;
  const __CFString *v21;
  void *v22;
  float v23;
  float v24;
  const __CFString **v25;
  const __CFString *v26;
  void *v27;
  float v28;
  float v29;
  float v30;
  const __CFString **v31;
  const __CFString *v32;
  const __CFString **v33;
  const __CFString *v34;
  unsigned int v35;
  double v36;
  const __CFString **v37;
  const __CFString *v38;
  BOOL v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  BOOL result;
  float64x2_t v44;
  __int128 v45;
  __int128 v46;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_RawSensorWidthSymbolLoc())
    v8 = (const __CFString *)getkFigCaptureStreamMetadata_RawSensorWidth();
  else
    v8 = CFSTR("RawSensorWidth");
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_RawSensorHeightSymbolLoc())
    v11 = (const __CFString *)getkFigCaptureStreamMetadata_RawSensorHeight();
  else
    v11 = CFSTR("RawSensorHeight");
  objc_msgSend(v7, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (double)v10;
  v14 = (double)objc_msgSend(v12, "integerValue");

  -[ADMutableCameraCalibration setReferenceDimensions:](self->_camera, "setReferenceDimensions:", (double)v10, v14);
  *(float *)&v15 = self->_rawSensorPixelSize;
  -[ADMutableCameraCalibration setPixelSize:](self->_camera, "setPixelSize:", v15);
  if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_SensorCropRectSymbolLoc())
    v16 = (const __CFString *)getkFigCaptureStreamMetadata_SensorCropRect();
  else
    v16 = CFSTR("SensorCropRect");
  objc_msgSend(v7, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = *(_OWORD *)(MEMORY[0x24BDBF070] + 16);
    v45 = *MEMORY[0x24BDBF070];
    v46 = v18;
    if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_SensorCropRectSymbolLoc())
      v19 = (const __CFString *)getkFigCaptureStreamMetadata_SensorCropRect();
    else
      v19 = CFSTR("SensorCropRect");
    if (!-[ADFigCameraCalibrationSource rectFromMetadataField:key:rect:](self, "rectFromMetadataField:key:rect:", v7, v19, &v45))goto LABEL_51;
    -[ADMutableCameraCalibration setReferenceDimensions:](self->_camera, "setReferenceDimensions:", v46);
    if (!-[ADMutableCameraCalibration scale:](self->_camera, "scale:", v13, v14))
      goto LABEL_51;
  }
  else
  {
    -[ADMutableCameraCalibration setReferenceDimensions:](self->_camera, "setReferenceDimensions:", v13, v14);
  }
  if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_PinholeCameraFocalLengthSymbolLoc())
  {
    v20 = (const __CFString **)getkFigCaptureStreamMetadata_PinholeCameraFocalLengthSymbolLoc();
    if (!v20)
      goto LABEL_64;
    v21 = *v20;
  }
  else
  {
    v21 = CFSTR("PinholeCameraFocalLength");
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  v24 = v23;

  if (v24 != 0.0)
    goto LABEL_35;
  if (!CMCaptureLibraryCore() || !getkFigCaptureStreamMetadata_PracticalFocalLengthSymbolLoc())
  {
    v26 = CFSTR("PracticalFocalLength");
LABEL_33:
    objc_msgSend(v7, "objectForKeyedSubscript:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "floatValue");
    v24 = v28;

    if (v24 < 1000.0)
      v24 = v24 * 1000.0;
LABEL_35:
    -[ADCameraCalibration pixelSize](self->_camera, "pixelSize");
    v30 = v29;
    if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_DistortionOpticalCenterSymbolLoc())
    {
      v31 = (const __CFString **)getkFigCaptureStreamMetadata_DistortionOpticalCenterSymbolLoc();
      if (!v31)
        goto LABEL_65;
      v32 = *v31;
    }
    else
    {
      v32 = CFSTR("DistortionOpticalCenter");
    }
    if (-[ADFigCameraCalibrationSource pointFromMetadataField:key:point:](self, "pointFromMetadataField:key:point:", v7, v32, &v44))
    {
LABEL_47:
      *(float *)&v35 = v24 / 1000.0 / v30;
      LODWORD(v36) = 0;
      HIDWORD(v36) = v35;
      -[ADMutableCameraCalibration setIntrinsicMatrix:](self->_camera, "setIntrinsicMatrix:", COERCE_DOUBLE((unint64_t)v35), v36, COERCE_DOUBLE(vcvt_f32_f64(v44)));
      -[ADDynamicPolynomialsLensDistortionModel setDynamicFactor:](self->_distortion, "setDynamicFactor:", 0.0);
      if (!CMCaptureLibraryCore() || !getkFigCaptureStreamMetadata_DynamicDistortionFactorSymbolLoc())
      {
        v38 = CFSTR("DynamicDistortionFactor");
        goto LABEL_53;
      }
      v37 = (const __CFString **)getkFigCaptureStreamMetadata_DynamicDistortionFactorSymbolLoc();
      if (v37)
      {
        v38 = *v37;
LABEL_53:
        objc_msgSend(v7, "objectForKeyedSubscript:", v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v40;
        if (v40)
        {
          objc_msgSend(v40, "floatValue");
          -[ADDynamicPolynomialsLensDistortionModel setDynamicFactor:](self->_distortion, "setDynamicFactor:");
        }
        -[ADPolynomialsLensDistortionModel setDistortionCenter:](self->_distortion, "setDistortionCenter:", *(_OWORD *)&v44);
        if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_TotalSensorCropRectSymbolLoc())
          v42 = (const __CFString *)getkFigCaptureStreamMetadata_TotalSensorCropRect();
        else
          v42 = CFSTR("TotalSensorCropRect");
        if (-[ADFigCameraCalibrationSource rectFromMetadataField:key:rect:](self, "rectFromMetadataField:key:rect:", v7, v42, &v45))
        {
          -[ADMutableCameraCalibration crop:](self->_camera, "crop:", v45, v46);
          v39 = -[ADMutableCameraCalibration scale:](self->_camera, "scale:", width, height);
        }
        else
        {
          v39 = 0;
        }

        goto LABEL_63;
      }
      goto LABEL_65;
    }
    if (!CMCaptureLibraryCore() || !getkFigCaptureStreamMetadata_OpticalCenterSymbolLoc())
    {
      v34 = CFSTR("OpticalCenter");
LABEL_46:
      if (!-[ADFigCameraCalibrationSource pointFromMetadataField:key:point:](self, "pointFromMetadataField:key:point:", v7, v34, &v44))
      {
LABEL_51:
        v39 = 0;
LABEL_63:

        return v39;
      }
      goto LABEL_47;
    }
    v33 = (const __CFString **)getkFigCaptureStreamMetadata_OpticalCenterSymbolLoc();
    if (v33)
    {
      v34 = *v33;
      goto LABEL_46;
    }
LABEL_65:
    dlerror();
    result = abort_report_np();
    goto LABEL_66;
  }
  v25 = (const __CFString **)getkFigCaptureStreamMetadata_PracticalFocalLengthSymbolLoc();
  if (v25)
  {
    v26 = *v25;
    goto LABEL_33;
  }
LABEL_64:
  dlerror();
  result = abort_report_np();
LABEL_66:
  __break(1u);
  return result;
}

- (BOOL)updateForFrame:(__CVBuffer *)a3
{
  size_t Width;
  size_t Height;
  CVAttachmentMode *v7;
  const __CFString **v8;
  const __CFString *v9;
  void *v10;
  BOOL v11;
  _Unwind_Exception *v13;

  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if (CMCaptureLibraryCore() && getkFigCaptureSampleBufferAttachmentKey_MetadataDictionarySymbolLoc())
  {
    v8 = (const __CFString **)getkFigCaptureSampleBufferAttachmentKey_MetadataDictionarySymbolLoc();
    if (!v8)
    {
      dlerror();
      v13 = (_Unwind_Exception *)abort_report_np();

      _Unwind_Resume(v13);
    }
    v9 = *v8;
  }
  else
  {
    v9 = CFSTR("MetadataDictionary");
  }
  v10 = (void *)PixelBufferUtils::copyAttachment(a3, v9, 0, v7);
  v11 = -[ADFigCameraCalibrationSource updateForFrameWithDimensions:metadataDictionary:](self, "updateForFrameWithDimensions:metadataDictionary:", v10, (double)Width, (double)Height);

  return v11;
}

- (ADCameraCalibration)cameraCalibration
{
  return (ADCameraCalibration *)self->_camera;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distortion, 0);
  objc_storeStrong((id *)&self->_camera, 0);
}

+ (double)figExtrinsicsToTransform:(void *)a3
{
  uint64_t v3;
  unint64_t v4;
  int32x4_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  unint64_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  _OWORD v28[4];

  v3 = objc_msgSend(objc_retainAutorelease(a3), "bytes");
  v4 = 0;
  v5 = *(int32x4_t *)(v3 + 16);
  v6 = *(int32x4_t *)(v3 + 32);
  v7 = vzip1q_s32(*(int32x4_t *)v3, v6);
  v8 = vzip2q_s32(*(int32x4_t *)v3, v6);
  v9 = vzip2q_s32(v5, (int32x4_t)0);
  v10 = vzip1q_s32(v7, v5);
  v11 = vzip1q_s32(v8, v9);
  v12 = vzip2q_s32(v7, vdupq_lane_s32(*(int32x2_t *)v5.i8, 1));
  v10.i32[3] = 0;
  v12.i32[3] = 0;
  v13 = vzip2q_s32(v8, v9);
  v11.i32[3] = 0;
  v13.i32[3] = 1.0;
  v17 = *(float32x4_t *)MEMORY[0x24BDAEE00];
  v16 = *(float32x4_t *)(MEMORY[0x24BDAEE00] + 16);
  v14 = *(float32x4_t *)(MEMORY[0x24BDAEE00] + 32);
  v15 = *(float32x4_t *)(MEMORY[0x24BDAEE00] + 48);
  v16.i32[1] = -1.0;
  v17.i32[0] = -1.0;
  v24 = v10;
  v25 = v12;
  v26 = v11;
  v27 = v13;
  do
  {
    v28[v4 / 0x10] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, COERCE_FLOAT(*(_OWORD *)((char *)&v24 + v4))), v16, *(float32x2_t *)&v24.i8[v4], 1), v14, *(float32x4_t *)((char *)&v24 + v4), 2), v15, *(float32x4_t *)((char *)&v24 + v4), 3);
    v4 += 16;
  }
  while (v4 != 64);
  v18 = 0;
  v19 = (float32x4_t)v28[0];
  v20 = (float32x4_t)v28[1];
  v21 = (float32x4_t)v28[2];
  v22 = (float32x4_t)v28[3];
  v24 = (int32x4_t)v17;
  v25 = (int32x4_t)v16;
  v26 = (int32x4_t)v14;
  v27 = (int32x4_t)v15;
  do
  {
    v28[v18 / 0x10] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, COERCE_FLOAT(*(_OWORD *)((char *)&v24 + v18))), v20, *(float32x2_t *)&v24.i8[v18], 1), v21, *(float32x4_t *)((char *)&v24 + v18), 2), v22, *(float32x4_t *)((char *)&v24 + v18), 3);
    v18 += 16;
  }
  while (v18 != 64);
  return *(double *)v28;
}

+ (__n128)getTransformFromStream:(void *)a3 toStream:(void *)a4 usingExtrinsicsDictionary:(void *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int32x4_t v12;
  void *v13;
  void *v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  __int32 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  float32x4_t v29;
  ADCommonUtils *v30;
  int32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int32x4_t v36;
  int32x4_t v37;
  int32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  int32x4_t v44;
  int32x4_t v46;
  int32x4_t v47;
  int32x4_t v48;
  int32x4_t v49;
  float32x4_t v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  id v54;
  uint64_t v55;
  simd_float4x3 v56;
  simd_float4x3 v57;

  v55 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      +[ADFigCameraCalibrationSource figExtrinsicsToTransform:](ADFigCameraCalibrationSource, "figExtrinsicsToTransform:", v14);
      v17 = vzip1q_s32(v15, v16);
      v17.i32[2] = v18;
      v46 = v17;
LABEL_13:

      goto LABEL_14;
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v20, "count") == 1)
    {
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "objectForKeyedSubscript:", v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23 && v25)
      {
        +[ADFigCameraCalibrationSource figExtrinsicsToTransform:](ADFigCameraCalibrationSource, "figExtrinsicsToTransform:", v23);
        v48 = v27;
        v49 = v26;
        v47 = v28;
        v50 = v29;
        v30 = (ADCommonUtils *)+[ADFigCameraCalibrationSource figExtrinsicsToTransform:](ADFigCameraCalibrationSource, "figExtrinsicsToTransform:", v25);
        v31 = vzip1q_s32(v49, v48);
        v57.columns[0] = (simd_float3)vzip1q_s32(v31, v47);
        v32 = (float32x4_t)vtrn2q_s32(v49, v47);
        v32.i32[2] = v48.i32[1];
        v57.columns[2] = (simd_float3)vzip1q_s32(vzip2q_s32(v49, v48), vdupq_laneq_s32(v47, 2));
        v33 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v57.columns[0], v50.f32[0]), v32, *(float32x2_t *)v50.f32, 1), (float32x4_t)v57.columns[2], v50, 2);
        v36 = vzip1q_s32(v34, v35);
        v37 = vzip2q_s32(v34, v35);
        v39 = (float32x4_t)vzip1q_s32(v36, v38);
        v40 = (float32x4_t)vtrn2q_s32(v34, v38);
        v40.i32[2] = v35.i32[1];
        v56.columns[2] = (simd_float3)vzip1q_s32(v37, vdupq_laneq_s32(v38, 2));
        v57.columns[3] = (simd_float3)vnegq_f32(v33);
        v57.columns[3].i32[3] = 0;
        v57.columns[2].i32[3] = 0;
        v57.columns[1] = (simd_float3)vzip2q_s32(v31, vdupq_lane_s32(*(int32x2_t *)v47.i8, 1));
        v57.columns[1].i32[3] = 0;
        v57.columns[0].i32[3] = 0;
        v42 = vmlaq_lane_f32(vmulq_n_f32(v39, v41.f32[0]), v40, *(float32x2_t *)v41.f32, 1);
        v39.i32[3] = 0;
        v56.columns[1] = (simd_float3)vzip2q_s32(v36, vdupq_lane_s32(*(int32x2_t *)v38.i8, 1));
        v56.columns[1].i32[3] = 0;
        v43 = vmlaq_laneq_f32(v42, (float32x4_t)v56.columns[2], v41, 2);
        v56.columns[2].i32[3] = 0;
        v56.columns[3] = (simd_float3)vnegq_f32(v43);
        v56.columns[3].i32[3] = 0;
        v56.columns[0] = (simd_float3)v39;
        *(double *)v44.i64 = ADCommonUtils::computeTransform(v30, v56, v57);
        v46 = v44;

LABEL_12:
        goto LABEL_13;
      }

    }
    v46 = 0u;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v52 = v7;
      v53 = 2112;
      v54 = v8;
      _os_log_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not calculate transform from %@ to %@ out of Fig extrinsics dictionary", buf, 0x16u);
    }
    goto LABEL_12;
  }
  +[ADFigCameraCalibrationSource figExtrinsicsToTransform:](ADFigCameraCalibrationSource, "figExtrinsicsToTransform:", v11);
  v46 = v12;
LABEL_14:

  return (__n128)v46;
}

+ (void)getFrameTransformsFromMetadataDictionary:(id)a3 sensorCropRect:(CGRect *)a4 rawSensorSize:(CGSize *)a5 postReadCropRect:(CGRect *)a6
{
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  const __CFDictionary *v16;
  const __CFString *v17;
  const __CFDictionary *v18;
  id v19;

  v19 = a3;
  if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_RawSensorWidthSymbolLoc())
    v9 = (const __CFString *)getkFigCaptureStreamMetadata_RawSensorWidth();
  else
    v9 = CFSTR("RawSensorWidth");
  objc_msgSend(v19, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  a5->width = (double)(int)objc_msgSend(v10, "intValue");

  if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_RawSensorHeightSymbolLoc())
    v11 = (const __CFString *)getkFigCaptureStreamMetadata_RawSensorHeight();
  else
    v11 = CFSTR("RawSensorHeight");
  objc_msgSend(v19, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  a5->height = (double)(int)objc_msgSend(v12, "intValue");

  if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_SensorCropRectSymbolLoc())
    v13 = (const __CFString *)getkFigCaptureStreamMetadata_SensorCropRect();
  else
    v13 = CFSTR("SensorCropRect");
  objc_msgSend(v19, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_SensorCropRectSymbolLoc())
      v15 = (const __CFString *)getkFigCaptureStreamMetadata_SensorCropRect();
    else
      v15 = CFSTR("SensorCropRect");
    objc_msgSend(v19, "objectForKeyedSubscript:", v15);
    v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CGRectMakeWithDictionaryRepresentation(v16, a4);

  }
  else
  {
    a4->origin.x = 0.0;
    a4->origin.y = 0.0;
    a4->size = *a5;
  }
  if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_TotalSensorCropRectSymbolLoc())
    v17 = (const __CFString *)getkFigCaptureStreamMetadata_TotalSensorCropRect();
  else
    v17 = CFSTR("TotalSensorCropRect");
  objc_msgSend(v19, "objectForKeyedSubscript:", v17);
  v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CGRectMakeWithDictionaryRepresentation(v18, a6);

}

+ (double)getMidExposureTimestampFromMetadataDictionary:(id)a3 timestamp:(double)a4
{
  id v5;
  const __CFString **v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const __CFString **v10;
  const __CFString *v11;
  void *v12;
  double v13;
  double v14;
  double result;

  v5 = a3;
  if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_RollingShutterSkewSymbolLoc())
  {
    v6 = (const __CFString **)getkFigCaptureStreamMetadata_RollingShutterSkewSymbolLoc();
    if (!v6)
      goto LABEL_12;
    v7 = *v6;
  }
  else
  {
    v7 = CFSTR("RollingShutterSkew");
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");

  if (!CMCaptureLibraryCore() || !getkFigCaptureStreamMetadata_ExposureTimeSymbolLoc())
  {
    v11 = CFSTR("ExposureTime");
    goto LABEL_11;
  }
  v10 = (const __CFString **)getkFigCaptureStreamMetadata_ExposureTimeSymbolLoc();
  if (v10)
  {
    v11 = *v10;
LABEL_11:
    objc_msgSend(v5, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    return a4 + ((double)v9 / 1000000.0 - v14) * 0.5;
  }
LABEL_12:
  dlerror();
  abort_report_np();
  __break(1u);
  return result;
}

+ (double)getMidExposureTimestampFromMetadataDictionary:(id)a3
{
  id v3;
  const __CFString **v4;
  const __CFString *v5;
  const __CFDictionary *v6;
  double v7;
  double v8;
  double result;
  CMTime time;
  CMTime v11;

  v3 = a3;
  if (!CMCaptureLibraryCore() || !getkFigCaptureSampleBufferAttachmentKey_OriginalPresentationTimeStampSymbolLoc())
  {
    v5 = CFSTR("_OriginalPresentationTimeStamp");
    goto LABEL_6;
  }
  v4 = (const __CFString **)getkFigCaptureSampleBufferAttachmentKey_OriginalPresentationTimeStampSymbolLoc();
  if (v4)
  {
    v5 = *v4;
LABEL_6:
    objc_msgSend(v3, "objectForKeyedSubscript:", v5);
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    memset(&v11, 0, sizeof(v11));
    CMTimeMakeFromDictionary(&v11, v6);
    time = v11;
    +[ADFigCameraCalibrationSource getMidExposureTimestampFromMetadataDictionary:timestamp:](ADFigCameraCalibrationSource, "getMidExposureTimestampFromMetadataDictionary:timestamp:", v3, CMTimeGetSeconds(&time));
    v8 = v7;

    return v8;
  }
  dlerror();
  abort_report_np();
  __break(1u);
  return result;
}

+ (float)getAngularVelocityFromMetadataDictionary:(id)a3 deviceClock:(double)a4
{
  double v4;
  double v5;
  id v7;
  const __CFString **v8;
  const __CFString *v9;
  id v10;
  uint64_t v11;
  int8x16_t v12;
  __int128 v13;
  float v14;
  uint64_t v15;
  int v16;
  int *v17;
  char v18;
  double v19;
  float64x2_t v20;
  int8x16_t v21;
  double v22;
  double v23;
  double v24;
  unsigned int v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  double v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float result;
  int8x16_t v48;
  float64x2_t v49;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55[2];
  _OWORD v56[7];

  v7 = a3;
  if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_ISPMotionDataSymbolLoc())
  {
    v8 = (const __CFString **)getkFigCaptureStreamMetadata_ISPMotionDataSymbolLoc();
    if (!v8)
    {
      dlerror();
      abort_report_np();
      __break(1u);
      return result;
    }
    v9 = *v8;
  }
  else
  {
    v9 = CFSTR("ISPMotionData");
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = objc_msgSend(v10, "bytes");
  v14 = NAN;
  if (v10 && v11)
  {
    v15 = *(int *)(v11 + 4);
    if ((int)v15 < 1)
      goto LABEL_20;
    v16 = 0;
    v17 = (int *)(v11 + 32);
    v18 = 1;
    v19 = 0.0;
    v21 = (int8x16_t)vdupq_n_s64(0x4066800000000000uLL);
    v54 = (float64x2_t)v21;
    v21.i64[0] = 0x4066800000000000;
    v53 = (float64x2_t)v21;
    v21.i64[0] = 0x400921FB54442D18;
    v50 = (float64x2_t)v21;
    v20 = (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL);
    v21.i64[0] = 0x8000000000000000;
    v48 = v21;
    v49 = v20;
    v22 = 0.0;
    v23 = 0.0;
    do
    {
      v24 = v4;
      v51 = v20;
      v52 = (float64x2_t)v21;
      v25 = *((unsigned __int16 *)v17 - 8);
      *(double *)v21.i64 = (double)*(v17 - 3) * 9.31322575e-10;
      v26 = (double)*(v17 - 2) * 9.31322575e-10;
      v27 = (double)*(v17 - 1) * 9.31322575e-10;
      v28 = (double)*v17 * 9.31322575e-10;
      v29 = *((_QWORD *)v17 - 3);
      *(double *)&v30 = *(double *)v21.i64 * *(double *)v21.i64 - v26 * v26 - v27 * v27 + v28 * v28;
      *(double *)&v13 = -(v26 * v28 - *(double *)v21.i64 * v27) - (v26 * v28 - *(double *)v21.i64 * v27);
      *((double *)&v30 + 1) = v27 * v28 + *(double *)v21.i64 * v26 + v27 * v28 + *(double *)v21.i64 * v26;
      *(double *)&v31 = -(v27 * v28 - *(double *)v21.i64 * v26) - (v27 * v28 - *(double *)v21.i64 * v26);
      *((double *)&v31 + 1) = v26 * v26 - v27 * v27 + v28 * v28 - *(double *)v21.i64 * *(double *)v21.i64;
      *(double *)v12.i64 = *(double *)v21.i64 * v28 + v26 * v27 + *(double *)v21.i64 * v28 + v26 * v27;
      *(double *)&v32 = v26 * v28 + v27 * *(double *)v21.i64 + v26 * v28 + v27 * *(double *)v21.i64;
      *((double *)&v32 + 1) = -(*(double *)v21.i64 * v28 - v26 * v27) - (*(double *)v21.i64 * v28 - v26 * v27);
      v56[0] = v30;
      v56[1] = v13;
      *(double *)v21.i64 = v28 * v28 + v27 * v27 - *(double *)v21.i64 * *(double *)v21.i64 - v26 * v26;
      v56[2] = v31;
      v56[3] = v12;
      v56[4] = v32;
      v56[5] = v21;
      v4 = (double)v29;
      ADCommonUtils::calcRotationAngle((ADCommonUtils *)v56, v55);
      v20 = vdivq_f64(vmulq_f64(v55[1], v53), v50);
      v21 = (int8x16_t)vdivq_f64(vmulq_f64(v55[0], v54), v49);
      if ((v18 & 1) == 0 && (unsigned __int16)(v25 - 1) <= 1u && v5 != 0.0)
      {
        v33.f64[0] = (v4 - v24) / a4;
        *(_QWORD *)&v34.f64[0] = v21.i64[0];
        *(_QWORD *)&v34.f64[1] = vextq_s8(v21, v21, 8uLL).u64[0];
        v35 = vsubq_f64(v34, v52);
        v36 = vsubq_f64(v20, v51);
        v37 = vabdq_f64(v34, v52);
        __asm { FMOV            V18.2D, #1.0 }
        *(_QWORD *)&v43 = *(_OWORD *)&vmulq_f64((float64x2_t)vandq_s8(vorrq_s8(vandq_s8((int8x16_t)v36, v48), _Q18), vorrq_s8((int8x16_t)vcltzq_f64(v36), (int8x16_t)vcgtzq_f64(v36))), vnegq_f64(vsubq_f64(v53, vabdq_f64(v20, v51))));
        v12 = (int8x16_t)vmulq_f64((float64x2_t)vandq_s8(vorrq_s8(vandq_s8((int8x16_t)v35, (int8x16_t)vdupq_n_s64(0x8000000000000000)), _Q18), vorrq_s8((int8x16_t)vcltzq_f64(v35), (int8x16_t)vcgtzq_f64(v35))), vnegq_f64(vsubq_f64((float64x2_t)vdupq_n_s64(0x4076800000000000uLL), v37)));
        *((_QWORD *)&v13 + 1) = *(_QWORD *)&v54.f64[1];
        v44 = (float64x2_t)vcgtq_f64(v37, v54);
        v45 = (float64x2_t)vbslq_s8((int8x16_t)v44, v12, (int8x16_t)v35);
        if (fabs(v36.f64[0]) <= 90.0)
          v44.f64[0] = v36.f64[0];
        else
          v44.f64[0] = v43;
        v46 = vdivq_f64(v45, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v33.f64[0], 0));
        v19 = v19 + v46.f64[0];
        v22 = v22 + v46.f64[1];
        v23 = v23 + vdivq_f64(v44, v33).f64[0];
        ++v16;
      }
      v18 = 0;
      v5 = (double)v25;
      v17 += 10;
      --v15;
    }
    while (v15);
    if (v16 <= 0)
LABEL_20:
      v14 = NAN;
    else
      v14 = sqrt(v23 / (double)v16 * (v23 / (double)v16)+ v22 / (double)v16 * (v22 / (double)v16)+ v19 / (double)v16 * (v19 / (double)v16));
  }

  return v14;
}

+ (CGRect)calcSensorCrop:(CGRect)a3 onImageWithDimensions:(CGSize)a4 metadataDictionary:(id)a5 negativeCropHandling:(int64_t)a6
{
  id v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  double v18;
  double v19;
  int32x2_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  CGFloat x;
  CGFloat y;
  double v34;
  double v35;
  double width;
  double height;
  double v38;
  double v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  uint8_t buf[4];
  CGFloat v46;
  __int16 v47;
  CGFloat v48;
  __int16 v49;
  double v50;
  __int16 v51;
  double v52;
  __int16 v53;
  double v54;
  __int16 v55;
  double v56;
  __int16 v57;
  double v58;
  __int16 v59;
  float64_t v60;
  __int16 v61;
  double v62;
  __int16 v63;
  double v64;
  __int16 v65;
  double v66;
  __int16 v67;
  float64_t v68;
  __int16 v69;
  double v70;
  __int16 v71;
  double v72;
  uint64_t v73;
  CGRect result;

  width = a4.width;
  height = a4.height;
  v34 = a3.size.width;
  v35 = a3.size.height;
  x = a3.origin.x;
  y = a3.origin.y;
  v73 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  +[ADFigCameraCalibrationSource getFrameTransformsFromMetadataDictionary:sensorCropRect:rawSensorSize:postReadCropRect:](ADFigCameraCalibrationSource, "getFrameTransformsFromMetadataDictionary:sensorCropRect:rawSensorSize:postReadCropRect:", v7, &v43, &v42, &v40);
  v8.f64[0] = x;
  v8.f64[1] = y;
  v30 = v40;
  v31 = v43;
  v9 = vdivq_f64(v42, v44);
  v10.f64[0] = v34;
  v10.f64[1] = v35;
  v11 = vmulq_f64(vsubq_f64(v8, v43), v9);
  v12 = vmulq_f64(v10, v9);
  v13 = vsubq_f64(v11, v40);
  v14.f64[0] = width;
  v14.f64[1] = height;
  v29 = v41;
  v15 = vdivq_f64(v14, v41);
  v16 = vmulq_f64(v13, v15);
  v17 = vmulq_f64(v12, v15);
  v18 = v16.f64[1];
  v38 = v16.f64[0];
  v19 = v17.f64[1];
  v39 = v17.f64[0];
  if (v16.f64[0] < 0.0
    || v16.f64[1] < 0.0
    || (v20 = vmovn_s64(vcgtq_f64(vaddq_f64(v16, v17), v14)), (v20.i8[0] & 1) != 0)
    || (v20.i8[4] & 1) != 0)
  {
    if (a6)
    {
      if (a6 == 2)
      {
        v21 = height / (v35 / v34);
        if (width < v21)
          v21 = width;
        v19 = v35 / v34 * v21;
        v39 = v21;
        v38 = (width - v21) * 0.5;
        v18 = (height - v19) * 0.5;
      }
      else
      {
        if (a6 != 1)
          __assert_rtn("+[ADFigCameraCalibrationSource calcSensorCrop:onImageWithDimensions:metadataDictionary:negativeCropHandling:]", "ADFigCameraCalibrationSource.mm", 528, "false");
        v18 = *(double *)(MEMORY[0x24BDBF070] + 8);
        v19 = *(double *)(MEMORY[0x24BDBF070] + 24);
        v38 = *MEMORY[0x24BDBF070];
        v39 = *(double *)(MEMORY[0x24BDBF070] + 16);
      }
    }
  }
  v27 = v42;
  v28 = v44;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v26 = vdivq_f64(v28, v27);
    *(_DWORD *)buf = 134221312;
    v46 = x;
    v47 = 2048;
    v48 = y;
    v49 = 2048;
    v50 = v34;
    v51 = 2048;
    v52 = v35;
    v53 = 2048;
    v54 = width;
    v55 = 2048;
    v56 = height;
    v57 = 2048;
    v58 = v31.f64[0] + (v30.f64[0] + v29.f64[0] / width * 0.0) * v26.f64[0];
    v59 = 2048;
    v60 = v31.f64[1] + vmuld_lane_f64(v30.f64[1] + v29.f64[1] / height * 0.0, v26, 1);
    v61 = 2048;
    v62 = width * (v29.f64[0] / width) * v26.f64[0];
    v63 = 2048;
    v64 = vmuld_lane_f64(height * (v29.f64[1] / height), v26, 1);
    v65 = 2048;
    v66 = v31.f64[0] + (v30.f64[0] + v38 * (v29.f64[0] / width)) * v26.f64[0];
    v67 = 2048;
    v68 = v31.f64[1] + vmuld_lane_f64(v30.f64[1] + v18 * (v29.f64[1] / height), v26, 1);
    v69 = 2048;
    v70 = v39 * (v29.f64[0] / width) * v26.f64[0];
    v71 = 2048;
    v72 = vmuld_lane_f64(v19 * (v29.f64[1] / height), v26, 1);
    _os_log_debug_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "[ADFigCameraCalibrationSource] Translate a crop of (%.2f, %.2f, %.2f, %.2f) on image with dimensions (%.2f, %.2f): Total crop made originally: (%.2f, %.2f, %.2f, %.2f), Final crop to use: (%.2f, %.2f, %.2f, %.2f)", buf, 0x8Eu);
  }

  v22 = v38;
  v23 = v39;
  v24 = v18;
  v25 = v19;
  result.size.height = v25;
  result.size.width = v23;
  result.origin.y = v24;
  result.origin.x = v22;
  return result;
}

@end
