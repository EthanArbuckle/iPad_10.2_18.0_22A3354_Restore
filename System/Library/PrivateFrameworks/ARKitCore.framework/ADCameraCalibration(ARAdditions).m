@implementation ADCameraCalibration(ARAdditions)

+ (id)ar_calibrationWithImageData:()ARAdditions adCalibrationData:
{
  id v6;
  id v7;
  __CVBuffer *v8;
  __CVBuffer *v9;
  double Width;
  double Height;
  double v12;
  double v13;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  objc_class *v35;
  void *v36;
  double v38;
  double v39;
  double v40;
  double v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (__CVBuffer *)objc_msgSend(v6, "pixelBuffer");
  if (v8)
  {
    v9 = v8;
    Width = (double)CVPixelBufferGetWidth(v8);
    Height = (double)CVPixelBufferGetHeight(v9);
  }
  else
  {
    Width = *MEMORY[0x1E0C9D820];
    Height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  objc_msgSend(v7, "referenceDimensions");
  if (Width == v13 && Height == v12)
  {
    v33 = v7;
  }
  else
  {
    objc_msgSend(v7, "distortionModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CFCDC0]);
      objc_msgSend(v6, "extrinsicMatrixToDeviceType:", *MEMORY[0x1E0C89F80]);
      v40 = v18;
      v41 = v17;
      v38 = v20;
      v39 = v19;
      objc_msgSend(v7, "pixelSize");
      v22 = v21;
      objc_msgSend(v7, "referenceDimensions");
      v24 = v23;
      v26 = v25;
      objc_msgSend(v15, "distortionCenter");
      v28 = v27;
      v30 = v29;
      objc_msgSend(v15, "lensDistortionLookupTable");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "inverseLensDistortionLookupTable");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ar_initWithImageData:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionCenter:lensDistortionLookupTable:inverseLensDistortionLookupTable:", v6, v31, v32, v41, v40, v39, v38, v22, v24, v26, v28, v30);
      v33 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _ARLogGeneral_33();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v36;
        v44 = 2048;
        v45 = a1;
        _os_log_impl(&dword_1B3A68000, v34, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unsupported distoration model to scale for imageData", buf, 0x16u);

      }
      v33 = 0;
    }

  }
  return v33;
}

+ (id)ar_initWithCVACameraCalibrationData:()ARAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  const char *v32;
  objc_class *v33;
  objc_class *v34;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    _ARLogGeneral_33();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v31;
    v45 = 2048;
    v46 = a1;
    v32 = "%{public}@ <%p>: calibrationData is nil";
LABEL_11:
    _os_log_impl(&dword_1B3A68000, v29, OS_LOG_TYPE_ERROR, v32, buf, 0x16u);

    goto LABEL_12;
  }
  objc_msgSend(v4, "lensDistortionLookupTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    _ARLogGeneral_33();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v31;
    v45 = 2048;
    v46 = a1;
    v32 = "%{public}@ <%p>: lensDistortionLookupTable is nil";
    goto LABEL_11;
  }
  objc_msgSend(v5, "inverseLensDistortionLookupTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    _ARLogGeneral_33();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v31;
      v45 = 2048;
      v46 = a1;
      v32 = "%{public}@ <%p>: inverseLensDistortionLookupTable is nil";
      goto LABEL_11;
    }
LABEL_12:

    v28 = 0;
    goto LABEL_13;
  }
  v8 = objc_alloc(MEMORY[0x1E0CFCDE0]);
  objc_msgSend(v5, "lensDistortionCenter");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v5, "lensDistortionLookupTable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inverseLensDistortionLookupTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v8, "initWithDistortionCenter:lensDistortionLookupTable:inverseLensDistortionLookupTable:", v13, v14, v10, v12);

  v16 = objc_alloc(MEMORY[0x1E0CFCDC0]);
  objc_msgSend(v5, "intrinsicMatrix");
  v42 = v17;
  v40 = v19;
  v41 = v18;
  objc_msgSend(v5, "extrinsicMatrix");
  v38 = v21;
  v39 = v20;
  v36 = v23;
  v37 = v22;
  objc_msgSend(v5, "pixelSize");
  v25 = v24;
  objc_msgSend(v5, "intrinsicMatrixReferenceDimensions");
  v28 = (void *)objc_msgSend(v16, "initWithIntrinsics:cameraToPlatformTransform:pixelSize:forReferenceDimensions:withDistortionModel:", v15, v42, v41, v40, v39, v38, v37, v36, v25, v26, v27);

LABEL_13:
  return v28;
}

- (id)ar_initWithImageData:()ARAdditions calibrationData:
{
  uint64_t v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v27;
  double v28;
  double v29;
  double v30;

  v6 = *MEMORY[0x1E0C89F80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "extrinsicMatrixToDeviceType:", v6);
  v29 = v10;
  v30 = v9;
  v27 = v12;
  v28 = v11;
  objc_msgSend(v7, "pixelSize");
  v14 = v13;
  objc_msgSend(v7, "intrinsicMatrixReferenceDimensions");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v7, "lensDistortionCenter");
  v20 = v19;
  v22 = v21;
  objc_msgSend(v7, "lensDistortionLookupTable");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inverseLensDistortionLookupTable");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "ar_initWithImageData:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionCenter:lensDistortionLookupTable:inverseLensDistortionLookupTable:", v8, v23, v24, v30, v29, v28, v27, v14, v16, v18, v20, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)ar_initWithImageData:()ARAdditions cameraToPlatformTransform:pixelSize:referenceDimensions:distortionCenter:lensDistortionLookupTable:inverseLensDistortionLookupTable:
{
  id v23;
  id v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  double v41;
  double v42;
  double v43;

  v23 = a12;
  v24 = a11;
  v25 = a10;
  objc_msgSend(v25, "imageResolution");
  v27 = v26 / a7;
  v28 = a14 * (v26 / a7);
  objc_msgSend(v25, "imageResolution");
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCDE0]), "initWithDistortionCenter:lensDistortionLookupTable:inverseLensDistortionLookupTable:", v24, v23, v28, -(v29 - a8 * v27) * -0.5 + a15 * v27);

  v31 = a1;
  objc_msgSend(v25, "cameraIntrinsics");
  v42 = v33;
  v43 = v32;
  v41 = v34;
  objc_msgSend(v25, "imageResolution");
  v36 = v35;
  v38 = v37;

  v39 = (void *)objc_msgSend(v31, "initWithIntrinsics:cameraToPlatformTransform:pixelSize:forReferenceDimensions:withDistortionModel:", v30, v43, v42, v41, a2, a3, a4, a5, a6, v36, v38);
  return v39;
}

@end
