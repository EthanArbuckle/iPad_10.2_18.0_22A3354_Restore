@implementation ARImageRotationTechnique

- (ARImageRotationTechnique)initWithRotation:(int64_t)a3 mirror:(int64_t)a4
{
  ARImageRotationTechnique *v6;
  VTSessionRef *p_isa;
  OSStatus v8;
  OSStatus v9;
  NSObject *v10;
  objc_class *v11;
  NSObject *v12;
  _QWORD *v13;
  OSStatus v14;
  OSStatus v15;
  objc_class *v16;
  NSObject *v17;
  ARImageRotationTechnique *v18;
  objc_super v20;
  uint8_t buf[4];
  NSObject *v22;
  __int16 v23;
  VTSessionRef *v24;
  __int16 v25;
  OSStatus v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)ARImageRotationTechnique;
  v6 = -[ARTechnique init](&v20, sel_init);
  p_isa = (VTSessionRef *)&v6->super.super.isa;
  if (!v6)
    goto LABEL_16;
  v6->_vtPixelRotationSession = 0;
  v6->_rotationAngle = a3;
  v6->_mirrorMode = a4;
  v8 = VTPixelRotationSessionCreate(0, &v6->_vtPixelRotationSession);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", kVTRotationFromARRotationAngle(a3), *MEMORY[0x1E0CED7A0]);
    if (a4 == 1)
    {
      v13 = (_QWORD *)MEMORY[0x1E0CED778];
    }
    else
    {
      if (a4 != 2)
      {
LABEL_10:
        v14 = VTSessionSetProperties(p_isa[7], (CFDictionaryRef)v10);
        if (v14)
        {
          v15 = v14;
          _ARLogTechnique_6();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v16 = (objc_class *)objc_opt_class();
            NSStringFromClass(v16);
            v17 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v22 = v17;
            v23 = 2048;
            v24 = p_isa;
            v25 = 1024;
            v26 = v15;
            _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Configuration of VTPixelRotationSession failed with error %d", buf, 0x1Cu);

          }
          goto LABEL_13;
        }

LABEL_16:
        v18 = p_isa;
        goto LABEL_17;
      }
      v13 = (_QWORD *)MEMORY[0x1E0CED780];
    }
    -[NSObject setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *v13);
    goto LABEL_10;
  }
  v9 = v8;
  _ARLogTechnique_6();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v12;
    v23 = 2048;
    v24 = p_isa;
    v25 = 1024;
    v26 = v9;
    _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Creation of VTPixelRotationSession failed with error %d", buf, 0x1Cu);
LABEL_13:

  }
  v18 = 0;
LABEL_17:

  return v18;
}

- (void)dealloc
{
  OpaqueVTPixelRotationSession *vtPixelRotationSession;
  __CVPixelBufferPool *bufferPool;
  objc_super v5;

  vtPixelRotationSession = self->_vtPixelRotationSession;
  if (vtPixelRotationSession)
  {
    VTPixelRotationSessionInvalidate(vtPixelRotationSession);
    CFRelease(self->_vtPixelRotationSession);
    self->_vtPixelRotationSession = 0;
  }
  bufferPool = self->_bufferPool;
  if (bufferPool)
  {
    CVPixelBufferPoolRelease(bufferPool);
    self->_bufferPool = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)ARImageRotationTechnique;
  -[ARImageRotationTechnique dealloc](&v5, sel_dealloc);
}

- (unint64_t)requiredSensorDataTypes
{
  return 1;
}

- (int)_rotateAccelerate:(__CVBuffer *)a3 pOutputBuffer:(__CVBuffer *)a4
{
  signed int PixelFormatType;
  int v8;
  int v9;
  int v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  const char *v14;
  int v15;
  OSType v16;
  int64_t v17;
  uint8_t v18;
  objc_class *v19;
  uint64_t v21;
  vImage_Error v22;
  objc_class *v23;
  vImage_Buffer v24;
  vImage_Buffer buf;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4)
  {
    _ARLogTechnique_6();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.data) = 138543618;
      *(void **)((char *)&buf.data + 4) = v13;
      WORD2(buf.height) = 2048;
      *(vImagePixelCount *)((char *)&buf.height + 6) = (vImagePixelCount)self;
      v14 = "%{public}@ <%p>: Arguments can't be nil";
LABEL_28:
      _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&buf, 0x16u);

    }
LABEL_29:

    return -1;
  }
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v8 = PixelFormatType;
  v9 = 1;
  if (PixelFormatType <= 1278226533)
  {
    if (PixelFormatType <= 1111970368)
    {
      if (PixelFormatType == 32)
        goto LABEL_20;
      v10 = 1094862674;
      goto LABEL_12;
    }
    if (PixelFormatType == 1111970369)
      goto LABEL_20;
    v15 = 1278226488;
    goto LABEL_18;
  }
  if (PixelFormatType > 1380410944)
  {
    if (PixelFormatType != 1380410945)
    {
      v15 = 1717855600;
LABEL_18:
      if (PixelFormatType != v15)
      {
LABEL_42:
        _ARLogTechnique_6();
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          goto LABEL_29;
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.data) = 138543618;
        *(void **)((char *)&buf.data + 4) = v13;
        WORD2(buf.height) = 2048;
        *(vImagePixelCount *)((char *)&buf.height + 6) = (vImagePixelCount)self;
        v14 = "%{public}@ <%p>: Accelerate currently only supports kCVPixelFormatType_32BGRA, kCVPixelFormatType_32ARGB f"
              "ormats or kCVPixelFormatType_128RGBAFloat, kCVPixelFormatType_DepthFloat32, kCVPixelFormatType_OneComponen"
              "t32Float and kCVPixelFormatType_OneComponent8";
        goto LABEL_28;
      }
    }
LABEL_19:
    v9 = 0;
    goto LABEL_20;
  }
  if (PixelFormatType == 1278226534)
    goto LABEL_19;
  v10 = 1380401729;
LABEL_12:
  if (PixelFormatType != v10)
    goto LABEL_42;
LABEL_20:
  v16 = CVPixelBufferGetPixelFormatType(a3);
  if (v16 != CVPixelBufferGetPixelFormatType(*a4))
  {
    _ARLogTechnique_6();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.data) = 138543618;
      *(void **)((char *)&buf.data + 4) = v13;
      WORD2(buf.height) = 2048;
      *(vImagePixelCount *)((char *)&buf.height + 6) = (vImagePixelCount)self;
      v14 = "%{public}@ <%p>: Input and output pixel buffer format need to match.";
      goto LABEL_28;
    }
    goto LABEL_29;
  }
  CVPixelBufferLockBaseAddress(a3, 0);
  CVPixelBufferLockBaseAddress(*a4, 0);
  memset(&buf, 0, sizeof(buf));
  ARWrapCVPixelBufferVImage(a3, &buf.data);
  memset(&v24, 0, sizeof(v24));
  ARWrapCVPixelBufferVImage(*a4, &v24.data);
  v17 = -[ARImageRotationTechnique rotationAngle](self, "rotationAngle");
  if (v17 == 180)
  {
    v18 = 2;
    if (v9)
      goto LABEL_38;
    goto LABEL_33;
  }
  if (v17 == 90)
  {
    v18 = 3;
    if (!v9)
      goto LABEL_33;
    goto LABEL_38;
  }
  if (v17 != -90)
  {
    v18 = 0;
    if (!v9)
      goto LABEL_33;
LABEL_38:
    v22 = vImageRotate90_ARGB8888(&buf, &v24, v18, _rotateAccelerate_pOutputBuffer___bgColor, 0x10u);
LABEL_46:
    v21 = v22;
    goto LABEL_47;
  }
  v18 = 1;
  if (v9)
    goto LABEL_38;
LABEL_33:
  v21 = -21778;
  if (v8 > 1380410944)
  {
    if (v8 != 1717855600)
    {
      if (v8 != 1380410945)
        goto LABEL_47;
      v22 = vImageRotate90_ARGBFFFF(&buf, &v24, v18, _rotateAccelerate_pOutputBuffer___bgColor_3, 0x10u);
      goto LABEL_46;
    }
LABEL_44:
    v22 = vImageRotate90_PlanarF(&buf, &v24, v18, 0.0, 0x10u);
    goto LABEL_46;
  }
  if (v8 == 1278226488)
  {
    v22 = vImageRotate90_Planar8(&buf, &v24, v18, 0, 0x10u);
    goto LABEL_46;
  }
  if (v8 == 1278226534)
    goto LABEL_44;
LABEL_47:
  CVPixelBufferUnlockBaseAddress(*a4, 0);
  CVPixelBufferUnlockBaseAddress(a3, 0);
  if (v21)
    return -1;
  else
    return 0;
}

- (id)processData:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  id v7;
  unsigned int Width;
  unsigned int Height;
  int64_t rotationAngle;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  __CVPixelBufferPool **p_bufferPool;
  __CVPixelBufferPool *bufferPool;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  unsigned int v20;
  char v21;
  __CVPixelBufferPool *v22;
  id v23;
  OSType PixelFormatType;
  unsigned int New;
  unsigned int v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  const char *v30;
  CVReturn v31;
  CVReturn v32;
  objc_class *v33;
  void *v34;
  void *v35;
  id v36;
  signed int v37;
  signed int v38;
  int v39;
  id v40;
  OpaqueVTPixelRotationSession *vtPixelRotationSession;
  id v42;
  __CVBuffer *v43;
  OSStatus v44;
  NSObject *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  ARModifiedImageData *v51;
  NSObject *v52;
  objc_class *v53;
  void *v54;
  void *v55;
  int v57;
  void *v58;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  ARImageRotationTechnique *v63;
  __int16 v64;
  unsigned int v65;
  __int16 v66;
  unsigned int v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  OSStatus v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (*(_OWORD *)&self->_rotationAngle != 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = v5;
    v23 = v7;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_53;
    Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v7, "pixelBuffer"));
    Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v23, "pixelBuffer"));
    rotationAngle = self->_rotationAngle;
    v11 = Width;
    if (rotationAngle)
    {
      v11 = Width;
      if (rotationAngle != 180)
        v11 = Height;
    }
    if (rotationAngle == 180)
      v12 = Height;
    else
      v12 = Width;
    if (rotationAngle)
      v13 = v12;
    else
      v13 = Height;
    p_bufferPool = &self->_bufferPool;
    bufferPool = self->_bufferPool;
    if (bufferPool)
    {
      v58 = v5;
      CVPixelBufferPoolGetPixelBufferAttributes(bufferPool);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v11;
      if (objc_msgSend(v17, "integerValue") == v11 && objc_msgSend(v18, "integerValue") == v13)
      {
        v20 = v13;
        v21 = 0;
      }
      else
      {
        v20 = v13;
        v21 = 1;
      }

      v22 = *p_bufferPool;
      if ((v21 & 1) == 0 && v22)
      {
        v13 = v20;
        v11 = v19;
        v5 = v58;
        goto LABEL_27;
      }
      v13 = v20;
      v11 = v19;
      v5 = v58;
      if (v22)
      {
        CVPixelBufferPoolRelease(*p_bufferPool);
        *p_bufferPool = 0;
      }
    }
    PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v23, "pixelBuffer"));
    New = ar_pixelBufferPoolCreateNew(v11, v13, PixelFormatType, &self->_bufferPool);
    if (New)
    {
      v26 = New;
      _ARLogTechnique_6();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v61 = v29;
        v62 = 2048;
        v63 = self;
        v64 = 1024;
        v65 = v26;
        v30 = "%{public}@ <%p>: Creation of CVPixelBufferPool failed with error %d";
LABEL_30:
        _os_log_impl(&dword_1B3A68000, v27, OS_LOG_TYPE_ERROR, v30, buf, 0x1Cu);

      }
LABEL_31:

      -[ARTechnique delegate](self, "delegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      ARErrorWithCodeAndUserInfo(151, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "technique:didFailWithError:", self, v35);

      v36 = v23;
LABEL_52:

      v23 = v36;
      goto LABEL_53;
    }
    v22 = *p_bufferPool;
LABEL_27:
    pixelBufferOut = 0;
    v31 = CVPixelBufferPoolCreatePixelBuffer(0, v22, &pixelBufferOut);
    if (v31)
    {
      v32 = v31;
      _ARLogTechnique_6();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v61 = v29;
        v62 = 2048;
        v63 = self;
        v64 = 1024;
        v65 = v32;
        v30 = "%{public}@ <%p>: Could not create pixel buffer for rotation. (%i)";
        goto LABEL_30;
      }
      goto LABEL_31;
    }
    v37 = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v23, "pixelBuffer"));
    v38 = v37;
    if (v37 > 1111970368)
    {
      if (v37 == 1111970369)
        goto LABEL_38;
      v39 = 1380401729;
    }
    else
    {
      if (v37 == 32)
        goto LABEL_38;
      v39 = 1094862674;
    }
    if (v37 != v39)
    {
      v42 = v23;
      if (v38 > 1380410944)
      {
        if (v38 == 1380410945)
          goto LABEL_39;
        v57 = 1717855600;
      }
      else
      {
        if (v38 == 1278226488)
          goto LABEL_39;
        v57 = 1278226534;
      }
      if (v38 != v57)
      {
        vtPixelRotationSession = self->_vtPixelRotationSession;
        goto LABEL_41;
      }
LABEL_39:
      if (!-[ARImageRotationTechnique _rotateAccelerate:pOutputBuffer:](self, "_rotateAccelerate:pOutputBuffer:", objc_msgSend(v23, "pixelBuffer"), &pixelBufferOut))goto LABEL_45;
      vtPixelRotationSession = self->_vtPixelRotationSession;
      v42 = v23;
LABEL_41:
      v43 = (__CVBuffer *)objc_msgSend(v42, "pixelBuffer");
      v44 = VTPixelRotationSessionRotateImage(vtPixelRotationSession, v43, pixelBufferOut);
      if (v44)
      {
        _ARLogTechnique_6();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v46 = (objc_class *)objc_opt_class();
          NSStringFromClass(v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          AROSTypeToString(v38);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v61 = v47;
          v62 = 2048;
          v63 = self;
          v64 = 1024;
          v65 = v11;
          v66 = 1024;
          v67 = v13;
          v68 = 2112;
          v69 = v48;
          v70 = 1024;
          v71 = v44;
          _os_log_impl(&dword_1B3A68000, v45, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not transform image with size %ix%i and format %@. (%i)", buf, 0x32u);

        }
        -[ARTechnique delegate](self, "delegate");
        v49 = (id)objc_claimAutoreleasedReturnValue();
        ARErrorWithCodeAndUserInfo(151, 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "technique:didFailWithError:", self, v50);
        goto LABEL_50;
      }
LABEL_45:
      v51 = -[ARModifiedImageData initWithImageData:]([ARModifiedImageData alloc], "initWithImageData:", v23);
      v49 = v51;
      if (v51)
      {
        -[ARImageData setPixelBuffer:](v51, "setPixelBuffer:", pixelBufferOut);
        objc_msgSend(v23, "cameraIntrinsics");
        objc_msgSend(v23, "imageResolution");
        ARAdjustIntrincisForOrientation();
        objc_msgSend(v49, "imageResolution");
        ARAdjustIntrincisForMirroring();
        objc_msgSend(v49, "setCameraIntrinsics:");
        objc_msgSend(v49, "setMirrored:", self->_mirrorMode != 0);
        v49 = v49;
        v50 = v23;
        v36 = v49;
LABEL_51:

        CVPixelBufferRelease(pixelBufferOut);
        goto LABEL_52;
      }
      _ARLogTechnique_6();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = (objc_class *)objc_opt_class();
        NSStringFromClass(v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v61 = v54;
        v62 = 2048;
        v63 = self;
        _os_log_impl(&dword_1B3A68000, v52, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not allocated image.", buf, 0x16u);

      }
      -[ARTechnique delegate](self, "delegate");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      ARErrorWithCodeAndUserInfo(151, 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "technique:didFailWithError:", self, v55);

LABEL_50:
      v36 = v23;
      goto LABEL_51;
    }
LABEL_38:
    v40 = v23;
    goto LABEL_39;
  }
  v23 = v4;
LABEL_53:

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4[10] == self->_mirrorMode && v4[9] == self->_rotationAngle;

  return v5;
}

- (id)_fullDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v8.receiver = self;
  v8.super_class = (Class)ARImageRotationTechnique;
  -[ARTechnique _fullDescription](&v8, sel__fullDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("Rotation (%li)\n"), self->_rotationAngle);
  objc_msgSend(v5, "appendFormat:", CFSTR("Mirror (%ld)\n"), self->_mirrorMode);
  CVPixelBufferPoolGetPixelBufferAttributes(self->_bufferPool);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("OutputPixelBufferPool attr: %@\n"), v6);

  return v5;
}

- (int64_t)rotationAngle
{
  return self->_rotationAngle;
}

- (int64_t)mirrorMode
{
  return self->_mirrorMode;
}

@end
