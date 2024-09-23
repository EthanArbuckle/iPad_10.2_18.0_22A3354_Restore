@implementation ARImageCroppingTechnique

- (ARImageCroppingTechnique)initWithCroppedImageSize:(CGSize)a3 centerCropToTargetResolution:(BOOL)a4
{
  CGFloat height;
  CGFloat width;
  char *v7;
  _QWORD *v8;
  uint64_t *v9;
  CFTypeRef *v10;
  OSStatus v11;
  OSStatus v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  ARImageCroppingTechnique *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  _QWORD *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  height = a3.height;
  width = a3.width;
  v32 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)ARImageCroppingTechnique;
  v7 = -[ARTechnique init](&v23, sel_init);
  v8 = v7;
  if (!v7)
  {
LABEL_11:
    v16 = v8;
    goto LABEL_12;
  }
  v9 = (uint64_t *)(v7 + 112);
  *((CGFloat *)v7 + 14) = width;
  *((CGFloat *)v7 + 15) = height;
  v7[104] = a4;
  v10 = (CFTypeRef *)(v7 + 56);
  v11 = VTPixelTransferSessionCreate(0, (VTPixelTransferSessionRef *)v7 + 7);
  if (!v11)
  {
    _ARLogTechnique_1();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *v9;
      v21 = v8[15];
      *(_DWORD *)buf = 138544130;
      v25 = v19;
      v26 = 2048;
      v27 = v8;
      v28 = 2048;
      v29 = v20;
      v30 = 2048;
      v31 = v21;
      _os_log_impl(&dword_1B3A68000, v17, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Initialized with crop image size: %f, %f)", buf, 0x2Au);

    }
    goto LABEL_11;
  }
  v12 = v11;
  if (*v10)
    CFRelease(*v10);
  *v10 = 0;
  _ARLogTechnique_1();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v15;
    v26 = 2048;
    v27 = v8;
    v28 = 1024;
    LODWORD(v29) = v12;
    _os_log_impl(&dword_1B3A68000, v13, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to create pixel transfer session for image cropping: %i", buf, 0x1Cu);

  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (ARImageCroppingTechnique)initWithCroppedImageSize:(CGSize)a3
{
  return -[ARImageCroppingTechnique initWithCroppedImageSize:centerCropToTargetResolution:](self, "initWithCroppedImageSize:centerCropToTargetResolution:", 0, a3.width, a3.height);
}

- (void)dealloc
{
  OpaqueVTPixelTransferSession *vtPixelTransferSession;
  OpaqueVTPixelTransferSession *v4;
  __CVPixelBufferPool *croppedPixelBufferPool;
  objc_super v6;

  vtPixelTransferSession = self->_vtPixelTransferSession;
  if (vtPixelTransferSession)
  {
    VTPixelTransferSessionInvalidate(vtPixelTransferSession);
    v4 = self->_vtPixelTransferSession;
    if (v4)
      CFRelease(v4);
    self->_vtPixelTransferSession = 0;
  }
  croppedPixelBufferPool = self->_croppedPixelBufferPool;
  if (croppedPixelBufferPool)
  {
    CVPixelBufferPoolRelease(croppedPixelBufferPool);
    self->_croppedPixelBufferPool = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)ARImageCroppingTechnique;
  -[ARImageCroppingTechnique dealloc](&v6, sel_dealloc);
}

- (unint64_t)requiredSensorDataTypes
{
  return 1;
}

- (id)processData:(id)a3
{
  id v4;
  char isKindOfClass;
  ARModifiedImageData *v6;
  ARModifiedImageData *v7;
  ARModifiedImageData *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double width;
  double height;
  __CVPixelBufferPool *croppedPixelBufferPool;
  CVReturn v18;
  CVReturn v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  const char *v23;
  CGRect *p_cropRect;
  double v25;
  double v26;
  double v27;
  double v28;
  OpaqueVTPixelTransferSession *vtPixelTransferSession;
  __CVBuffer *v30;
  float v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGRect *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  BOOL v60;
  double x;
  CGFloat y;
  CFDictionaryRef DictionaryRepresentation;
  OSStatus v64;
  objc_class *v65;
  objc_class *v66;
  void *v67;
  void *v68;
  void *v69;
  OSType PixelFormatType;
  OSStatus v72;
  OSStatus v73;
  objc_class *v74;
  double v75;
  double v76;
  float v77;
  _QWORD v78[4];
  CVPixelBufferRef pixelBufferOut;
  const __CFString *v80;
  void *v81;
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  ARImageCroppingTechnique *v85;
  __int16 v86;
  OSStatus v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = (ARModifiedImageData *)v4;
  v7 = v6;
  v8 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    -[ARImageData imageResolution](v6, "imageResolution");
    v11 = v9;
    v12 = v10;
    width = self->_croppedImageSize.width;
    height = self->_croppedImageSize.height;
    if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
      goto LABEL_34;
    if (width == v9 && height == v10)
      goto LABEL_34;
    pixelBufferOut = 0;
    croppedPixelBufferPool = self->_croppedPixelBufferPool;
    if (!croppedPixelBufferPool)
    {
      p_cropRect = &self->_cropRect;
      if (self->_isCropToTargetResolution)
      {
        v25 = ARGetCroppedRegionCenterCrop(v9, v10, width);
      }
      else
      {
        v55 = width / height;
        if (width / height >= v11 / v10)
        {
          v57 = v10 - v11 / v55;
          v26 = v57 * 0.5;
          v28 = v12 - v57;
          v25 = 0.0;
          v27 = v11;
        }
        else
        {
          v56 = v11 - v10 * v55;
          v25 = v56 * 0.5;
          v27 = v11 - v56;
          v26 = 0.0;
          v28 = v12;
        }
      }
      p_cropRect->origin.x = v25;
      self->_cropRect.origin.y = v26;
      self->_cropRect.size.width = v27;
      self->_cropRect.size.height = v28;
      if (CGRectIsEmpty(*(CGRect *)&v25)
        || ((v58 = self->_cropRect.size.width, v59 = self->_cropRect.size.height, v58 == v11)
          ? (v60 = v59 == v12)
          : (v60 = 0),
            v60))
      {
        _ARLogTechnique_1();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v66 = (objc_class *)objc_opt_class();
          NSStringFromClass(v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v83 = v67;
          v84 = 2048;
          v85 = self;
          _os_log_impl(&dword_1B3A68000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: The cropped image size must be less than source image size and not zero", buf, 0x16u);

        }
        goto LABEL_33;
      }
      x = p_cropRect->origin.x;
      y = self->_cropRect.origin.y;
      DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)(&v58 - 2));
      v64 = VTSessionSetProperty(self->_vtPixelTransferSession, (CFStringRef)*MEMORY[0x1E0CED850], DictionaryRepresentation);
      if (DictionaryRepresentation)
        CFRelease(DictionaryRepresentation);
      if (v64)
      {
        _ARLogTechnique_1();
        v20 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          goto LABEL_33;
        v65 = (objc_class *)objc_opt_class();
        NSStringFromClass(v65);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v83 = v22;
        v84 = 2048;
        v85 = self;
        v86 = 1024;
        v87 = v64;
        v23 = "%{public}@ <%p>: Unable to initialize pixel transfer session for image cropping: %i";
LABEL_14:
        _os_log_impl(&dword_1B3A68000, v20, OS_LOG_TYPE_ERROR, v23, buf, 0x1Cu);

LABEL_33:
        -[ARTechnique delegate](self, "delegate");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        ARErrorWithCodeAndUserInfo(151, 0);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "technique:didFailWithError:", self, v69);

LABEL_34:
        v8 = v7;
        goto LABEL_35;
      }
      PixelFormatType = CVPixelBufferGetPixelFormatType(-[ARImageData pixelBuffer](v7, "pixelBuffer"));
      v72 = ARRecreatePixelBufferPoolOnConfigurationChanges(&self->_croppedPixelBufferPool, PixelFormatType, self->_cropRect.size.width, self->_cropRect.size.height);
      if (v72)
      {
        v73 = v72;
        _ARLogTechnique_1();
        v20 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          goto LABEL_33;
        v74 = (objc_class *)objc_opt_class();
        NSStringFromClass(v74);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v83 = v22;
        v84 = 2048;
        v85 = self;
        v86 = 1024;
        v87 = v73;
        v23 = "%{public}@ <%p>: Unable to create pixel buffer pool for cropping: %i";
        goto LABEL_14;
      }
      croppedPixelBufferPool = self->_croppedPixelBufferPool;
    }
    v18 = CVPixelBufferPoolCreatePixelBuffer(0, croppedPixelBufferPool, &pixelBufferOut);
    if (!v18)
    {
      vtPixelTransferSession = self->_vtPixelTransferSession;
      v30 = -[ARImageData pixelBuffer](v7, "pixelBuffer");
      VTPixelTransferSessionTransferImage(vtPixelTransferSession, v30, pixelBufferOut);
      v8 = -[ARModifiedImageData initWithImageData:]([ARModifiedImageData alloc], "initWithImageData:", v7);
      -[ARImageData setPixelBuffer:](v8, "setPixelBuffer:", pixelBufferOut);
      -[ARImageData cameraIntrinsics](v7, "cameraIntrinsics");
      v76 = v32;
      v77 = v31;
      v75 = v33;
      -[ARImageData imageResolution](v7, "imageResolution");
      v35 = v34;
      v37 = v36;
      -[ARImageData imageResolution](v8, "imageResolution");
      *(float *)&v40 = ARAdjustIntrinsicsForViewportSize(v77, v76, v75, v35, v37, v38, v39);
      -[ARImageData setCameraIntrinsics:](v8, "setCameraIntrinsics:", v40);
      v41 = &self->_cropRect;
      v42 = v41->origin.x;
      -[ARImageData imageResolution](v7, "imageResolution");
      v43 = v41->origin.y;
      v45 = v42 / v44;
      -[ARImageData imageResolution](v7, "imageResolution");
      v46 = v41->size.width;
      v48 = v43 / v47;
      -[ARImageData imageResolution](v7, "imageResolution");
      v49 = v41->size.height;
      v51 = v46 / v50;
      -[ARImageData imageResolution](v7, "imageResolution");
      v80 = CFSTR("croppedRect");
      *(double *)v78 = v45;
      *(double *)&v78[1] = v48;
      *(double *)&v78[2] = v51;
      *(double *)&v78[3] = v49 / v52;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v78, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = v53;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARModifiedImageData setMetaData:](v8, "setMetaData:", v54);

      CVPixelBufferRelease(pixelBufferOut);
LABEL_35:

      goto LABEL_36;
    }
    v19 = v18;
    _ARLogTechnique_1();
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v83 = v22;
    v84 = 2048;
    v85 = self;
    v86 = 1024;
    v87 = v19;
    v23 = "%{public}@ <%p>: Unable to create pixel buffer for cropping: %i";
    goto LABEL_14;
  }
LABEL_36:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ARImageCroppingTechnique;
  if (-[ARTechnique isEqual:](&v16, sel_isEqual_, v4))
  {
    v5 = v4;
    -[ARImageCroppingTechnique croppedImageSize](self, "croppedImageSize");
    v7 = v6;
    v9 = v8;
    objc_msgSend(v5, "croppedImageSize");
    v11 = v10;
    v13 = v12;

    v14 = v9 == v13 && v7 == v11;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (CGSize)croppedImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_croppedImageSize.width;
  height = self->_croppedImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
