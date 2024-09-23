@implementation ARReferenceImage

- (ARReferenceImage)initWithCGImage:(CGImage *)a3 orientation:(unsigned int)a4 physicalWidth:(double)a5 addPadding:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v8;
  void *v11;
  ARReferenceImage *v12;
  CGImageAlphaInfo AlphaInfo;

  v6 = a6;
  v8 = *(_QWORD *)&a4;
  AlphaInfo = CGImageGetAlphaInfo(a3);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCGImage:", a3);
  v12 = -[ARReferenceImage initWithCIImage:orientation:physicalWidth:alphaInfo:addPadding:](self, "initWithCIImage:orientation:physicalWidth:alphaInfo:addPadding:", v11, v8, &AlphaInfo, v6, a5);

  return v12;
}

- (ARReferenceImage)initWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 physicalWidth:(double)a5 addPadding:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v8;
  void *v10;
  ARReferenceImage *v11;

  v6 = a6;
  v8 = *(_QWORD *)&a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCVPixelBuffer:", a3);
  v11 = -[ARReferenceImage initWithCIImage:orientation:physicalWidth:alphaInfo:addPadding:](self, "initWithCIImage:orientation:physicalWidth:alphaInfo:addPadding:", v10, v8, 0, v6, a5);

  return v11;
}

- (ARReferenceImage)initWithCGImage:(CGImageRef)image orientation:(CGImagePropertyOrientation)orientation physicalWidth:(CGFloat)physicalWidth
{
  uint64_t v6;
  void *v9;
  ARReferenceImage *v10;
  CGImageAlphaInfo AlphaInfo;

  v6 = *(_QWORD *)&orientation;
  AlphaInfo = CGImageGetAlphaInfo(image);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCGImage:", image);
  v10 = -[ARReferenceImage initWithCIImage:orientation:physicalWidth:alphaInfo:addPadding:](self, "initWithCIImage:orientation:physicalWidth:alphaInfo:addPadding:", v9, v6, &AlphaInfo, 0, physicalWidth);

  return v10;
}

- (ARReferenceImage)initWithPixelBuffer:(CVPixelBufferRef)pixelBuffer orientation:(CGImagePropertyOrientation)orientation physicalWidth:(CGFloat)physicalWidth
{
  uint64_t v6;
  void *v8;
  ARReferenceImage *v9;

  v6 = *(_QWORD *)&orientation;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCVPixelBuffer:", pixelBuffer);
  v9 = -[ARReferenceImage initWithCIImage:orientation:physicalWidth:alphaInfo:addPadding:](self, "initWithCIImage:orientation:physicalWidth:alphaInfo:addPadding:", v8, v6, 0, 0, physicalWidth);

  return v9;
}

- (ARReferenceImage)initWithCIImage:(id)a3 orientation:(unsigned int)a4 physicalWidth:(double)a5 alphaInfo:(unsigned int *)a6 addPadding:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  ARReferenceImage *v13;
  BOOL v14;
  CVPixelBufferRef *p_pixelBufferOut;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  _BOOL4 v19;
  double v20;
  double v21;
  int v22;
  const __CFAllocator *v23;
  size_t Width;
  size_t Height;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  NSObject *v35;
  objc_class *v36;
  void *v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  NSObject *v41;
  objc_class *v42;
  void *v43;
  double v44;
  double v45;
  uint64_t v46;
  NSUUID *identifier;
  NSObject *v48;
  dispatch_queue_t v49;
  OS_dispatch_queue *verificationQueue;
  dispatch_semaphore_t v51;
  OS_dispatch_semaphore *verificationQueueSemaphore;
  NSString *resourceGroupName;
  __CVBuffer *v55;
  CVPixelBufferRef pixelBufferOut;
  CVPixelBufferRef pixelBuffer;
  objc_super v58;
  _BYTE v59[12];
  __int16 v60;
  ARReferenceImage *v61;
  vImage_Buffer buf;
  uint64_t v63;

  v7 = a7;
  v63 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v58.receiver = self;
  v58.super_class = (Class)ARReferenceImage;
  v13 = -[ARReferenceImage init](&v58, sel_init);
  if (!v13)
    goto LABEL_54;
  if (!a6 || (*a6 <= 6 ? (v14 = ((1 << *a6) & 0x61) == 0) : (v14 = 1), v14))
  {
    pixelBuffer = 0;
    p_pixelBufferOut = &pixelBufferOut;
  }
  else
  {
    p_pixelBufferOut = 0;
    pixelBuffer = 0;
  }
  pixelBufferOut = 0;
  if (ARCreateDownScaledGrayscaleImageAndMask(v12, 0x280uLL, CFSTR("ARReferenceImage"), &pixelBuffer, p_pixelBufferOut))
  {
    _ARLogGeneral_1();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.data) = 138543618;
      *(void **)((char *)&buf.data + 4) = v18;
      WORD2(buf.height) = 2048;
      *(vImagePixelCount *)((char *)&buf.height + 6) = (vImagePixelCount)v13;
      _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create pixelbuffer and alpha mask", (uint8_t *)&buf, 0x16u);

    }
    goto LABEL_54;
  }
  v19 = CVPixelBufferGetWidth(pixelBuffer) < 0x64 || CVPixelBufferGetHeight(pixelBuffer) < 0x64;
  objc_msgSend(v12, "extent");
  if (v20 == (double)CVPixelBufferGetWidth(pixelBuffer))
  {
    objc_msgSend(v12, "extent");
    v22 = v21 != (double)CVPixelBufferGetHeight(pixelBuffer) || v7;
    if ((v22 & v19 & 1) == 0)
      goto LABEL_44;
LABEL_23:
    if (!pixelBufferOut)
    {
      v23 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      Width = CVPixelBufferGetWidth(pixelBuffer);
      Height = CVPixelBufferGetHeight(pixelBuffer);
      if (CVPixelBufferCreate(v23, Width, Height, 0x4C303038u, 0, &pixelBufferOut))
      {
        _ARLogGeneral_1();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.data) = 138543618;
          *(void **)((char *)&buf.data + 4) = v28;
          WORD2(buf.height) = 2048;
          *(vImagePixelCount *)((char *)&buf.height + 6) = (vImagePixelCount)v13;
          _os_log_impl(&dword_1B3A68000, v26, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create pixelbuffer", (uint8_t *)&buf, 0x16u);

        }
      }
      CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
      buf.data = CVPixelBufferGetBaseAddress(pixelBufferOut);
      buf.height = CVPixelBufferGetHeight(pixelBufferOut);
      buf.width = CVPixelBufferGetWidth(pixelBufferOut);
      buf.rowBytes = CVPixelBufferGetBytesPerRow(pixelBufferOut);
      if (vImageOverwriteChannelsWithScalar_Planar8(0xFFu, &buf, 0))
      {
        _ARLogGeneral_1();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = (objc_class *)objc_opt_class();
          NSStringFromClass(v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v59 = 138543618;
          *(_QWORD *)&v59[4] = v31;
          v60 = 2048;
          v61 = v13;
          _os_log_impl(&dword_1B3A68000, v29, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not fill buffer", v59, 0x16u);

        }
      }
      CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
    }
    *(_QWORD *)v59 = 0;
    if (ARCreatePixelBufferWithPaddingToFillMinimumDimension(pixelBuffer, 0x64uLL, 0, (__CVBuffer **)v59))
    {
      _ARLogGeneral_1();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.data) = 138543618;
        *(void **)((char *)&buf.data + 4) = v34;
        WORD2(buf.height) = 2048;
        *(vImagePixelCount *)((char *)&buf.height + 6) = (vImagePixelCount)v13;
        _os_log_impl(&dword_1B3A68000, v32, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not add padding to pixel buffer", (uint8_t *)&buf, 0x16u);

      }
    }
    else
    {
      CVPixelBufferRelease(pixelBuffer);
      pixelBuffer = *(CVPixelBufferRef *)v59;
    }
    if (pixelBufferOut)
    {
      v55 = 0;
      if (ARCreatePixelBufferWithPaddingToFillMinimumDimension(pixelBufferOut, 0x64uLL, 0, &v55))
      {
        _ARLogGeneral_1();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = (objc_class *)objc_opt_class();
          NSStringFromClass(v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.data) = 138543618;
          *(void **)((char *)&buf.data + 4) = v37;
          WORD2(buf.height) = 2048;
          *(vImagePixelCount *)((char *)&buf.height + 6) = (vImagePixelCount)v13;
          _os_log_impl(&dword_1B3A68000, v35, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not add padding to alpha mask", (uint8_t *)&buf, 0x16u);

        }
      }
      else
      {
        CVPixelBufferRelease(pixelBufferOut);
        pixelBufferOut = v55;
      }
    }
    goto LABEL_44;
  }
  if (v19)
    goto LABEL_23;
LABEL_44:
  if (ARCorrectCVPixelBufferOrientation(pixelBuffer, a4, &v13->_pixelBuffer))
  {
    _ARLogGeneral_1();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.data) = 138543618;
      *(void **)((char *)&buf.data + 4) = v40;
      WORD2(buf.height) = 2048;
      *(vImagePixelCount *)((char *)&buf.height + 6) = (vImagePixelCount)v13;
      _os_log_impl(&dword_1B3A68000, v38, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not correct orientation of pixelbuffer", (uint8_t *)&buf, 0x16u);

    }
  }
  if (pixelBufferOut && ARCorrectCVPixelBufferOrientation(pixelBufferOut, a4, &v13->_alphaMask))
  {
    _ARLogGeneral_1();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.data) = 138543618;
      *(void **)((char *)&buf.data + 4) = v43;
      WORD2(buf.height) = 2048;
      *(vImagePixelCount *)((char *)&buf.height + 6) = (vImagePixelCount)v13;
      _os_log_impl(&dword_1B3A68000, v41, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not correct orientation of alpha mask", (uint8_t *)&buf, 0x16u);

    }
  }
  CVPixelBufferRelease(pixelBuffer);
  CVPixelBufferRelease(pixelBufferOut);
  objc_msgSend(v12, "extent");
  v13->_physicalSize.width = a5;
  v13->_physicalSize.height = v45 / v44 * a5;
  objc_msgSend(MEMORY[0x1E0CB3A28], "ar_UUIDWithCVPixelBuffer:", -[ARReferenceImage pixelBuffer](v13, "pixelBuffer"));
  v46 = objc_claimAutoreleasedReturnValue();
  identifier = v13->_identifier;
  v13->_identifier = (NSUUID *)v46;

  v13->_estimatedQuality = -1.0;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = dispatch_queue_create("com.apple.arkit.arreference.verificationqueue", v48);
  verificationQueue = v13->_verificationQueue;
  v13->_verificationQueue = (OS_dispatch_queue *)v49;

  v51 = dispatch_semaphore_create(1);
  verificationQueueSemaphore = v13->_verificationQueueSemaphore;
  v13->_verificationQueueSemaphore = (OS_dispatch_semaphore *)v51;

  resourceGroupName = v13->_resourceGroupName;
  v13->_resourceGroupName = 0;

LABEL_54:
  return v13;
}

- (ARReferenceImage)initWithIdentifier:(id)a3
{
  id v5;
  ARReferenceImage *v6;
  ARReferenceImage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARReferenceImage;
  v6 = -[ARReferenceImage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

+ (id)referenceImagesInGroupNamed:(id)a3 catalog:(id)a4
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  ARReferenceImage *v17;
  uint64_t v18;
  void *v19;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  objc_msgSend(a4, "namedRecognitionGroupWithName:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v21 = (id)objc_opt_new();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v5, "namedRecognitionImageImageList");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v5, "recognitionImageWithName:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v12;
            if (v12 && objc_msgSend(v12, "image"))
            {
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v13, "valueForKey:", CFSTR("exifOrientation"));
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v14, "intValue");

              }
              else
              {
                v15 = 1;
              }
              v17 = [ARReferenceImage alloc];
              v18 = objc_msgSend(v13, "image");
              objc_msgSend(v13, "physicalSizeInMeters");
              v16 = -[ARReferenceImage initWithCGImage:orientation:physicalWidth:addPadding:](v17, "initWithCGImage:orientation:physicalWidth:addPadding:", v18, v15, 1);
              objc_msgSend(v13, "name");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setName:](v16, "setName:", v19);

              -[NSObject setResourceGroupName:](v16, "setResourceGroupName:", v22);
              objc_msgSend(v21, "addObject:", v16);
            }
            else
            {
              _ARLogGeneral_1();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_ERROR, "Invalid reference image in catalog", buf, 2u);
              }
            }

          }
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }
  }
  else
  {
    _ARLogGeneral_1();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v22;
      _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_ERROR, "No resource group with name \"%{public}@\" found", buf, 0xCu);
    }
    v21 = 0;
  }

  return v21;
}

+ (NSSet)referenceImagesInGroupNamed:(NSString *)name bundle:(NSBundle *)bundle
{
  NSBundle *v5;
  NSString *v6;
  void *v7;

  v5 = bundle;
  v6 = name;
  objc_msgSend((id)objc_opt_class(), "referenceImagesInGroupNamed:catalogName:bundle:", v6, CFSTR("Assets"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v7;
}

+ (id)referenceImagesInGroupNamed:(id)a3 catalogName:(id)a4 bundle:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v15 = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1A6A8]), "initWithName:fromBundle:error:", v8, v9, &v15);
  v11 = v15;
  if (v11)
  {
    _ARLogGeneral_1();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v17 = v8;
      v18 = 2114;
      v19 = v9;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_ERROR, "Error while opening catalog named \"%{public}@\" in bundle \"%{public}@\": %@", buf, 0x20u);
    }

    v13 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "referenceImagesInGroupNamed:catalog:", v7, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (id)referenceImagesInGroupNamed:(id)a3 catalogURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v12 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1A6A8]), "initWithURL:error:", v6, &v12);
  v8 = v12;
  if (v8)
  {
    _ARLogGeneral_1();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v14 = v5;
      v15 = 2114;
      v16 = v6;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_ERROR, "Error while opening catalog named \"%{public}@\" from URL \"%{public}@\": %@", buf, 0x20u);
    }

    v10 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "referenceImagesInGroupNamed:catalog:", v5, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_pixelBuffer);
  CVPixelBufferRelease(self->_alphaMask);
  v3.receiver = self;
  v3.super_class = (Class)ARReferenceImage;
  -[ARReferenceImage dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARReferenceImage name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARReferenceImage physicalSize](self, "physicalSize");
  v8 = v7;
  -[ARReferenceImage physicalSize](self, "physicalSize");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p name=\"%@\" physicalSize=(%.03f, %.03f)>"), v5, self, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)shortDebugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ARReferenceImage name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARReferenceImage physicalSize](self, "physicalSize");
  v6 = v5;
  -[ARReferenceImage physicalSize](self, "physicalSize");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<name=\"%@\", physicalSize=(%.03f, %.03f)>"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGSize)imageSize
{
  __CVBuffer *pixelBuffer;
  double Width;
  double Height;
  double v5;
  CGSize result;

  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    Width = (double)CVPixelBufferGetWidth(self->_pixelBuffer);
    Height = (double)CVPixelBufferGetHeight(pixelBuffer);
  }
  else
  {
    Width = *MEMORY[0x1E0C9D820];
    Height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARReferenceImage identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      objc_msgSend(v5, "physicalSize");
      v9 = v8;
      v11 = v10;
      -[ARReferenceImage physicalSize](self, "physicalSize");
      v14 = v11 == v13 && v9 == v12;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_identifier, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[ARReferenceImage physicalSize](self, "physicalSize");
  v5[10] = v6;
  v5[11] = v7;
  -[ARReferenceImage name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copyWithZone:", a3);
  v10 = (void *)v5[3];
  v5[3] = v9;

  v5[7] = CVPixelBufferRetain(self->_pixelBuffer);
  v5[8] = CVPixelBufferRetain(self->_alphaMask);
  -[ARReferenceImage identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copyWithZone:", a3);
  v13 = (void *)v5[9];
  v5[9] = v12;

  -[ARReferenceImage estimatedQuality](self, "estimatedQuality");
  v5[5] = v14;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ARReferenceImage physicalSize](self, "physicalSize");
  objc_msgSend(v7, "encodeSize:forKey:", CFSTR("physicalSize"));
  -[ARReferenceImage name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("name"));

  -[ARReferenceImage identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[ARReferenceImage estimatedQuality](self, "estimatedQuality");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("estimatedQuality"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCVPixelBuffer:", -[ARReferenceImage pixelBuffer](self, "pixelBuffer"));
  if (v6)
    objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("pixelbuffer"));

}

- (ARReferenceImage)initWithCoder:(id)a3
{
  id v4;
  ARReferenceImage *v5;
  CGFloat v6;
  CGFloat v7;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSUUID *identifier;
  double v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ARReferenceImage;
  v5 = -[ARReferenceImage init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeSizeForKey:", CFSTR("physicalSize"));
    v5->_physicalSize.width = v6;
    v5->_physicalSize.height = v7;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v10;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("estimatedQuality"));
    v5->_estimatedQuality = v12;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pixelbuffer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_pixelBuffer = ARPixelBufferWithCIImage(v13);

  }
  return v5;
}

- (void)setResourceGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_resourceGroupName, a3);
}

- (void)validateWithCompletionHandler:(void *)completionHandler
{
  void (**v4)(void *, void *);
  void *v5;
  void *v6;
  void *v7;
  NSObject *verificationQueue;
  _QWORD v9[5];
  void (**v10)(void *, void *);

  v4 = completionHandler;
  -[ARReferenceImage cachedVerificationError](self, "cachedVerificationError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v4)
    {
      -[ARReferenceImage cachedVerificationError](self, "cachedVerificationError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v7);

    }
  }
  else
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_verificationQueueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    verificationQueue = self->_verificationQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__ARReferenceImage_validateWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E6672288;
    v9[4] = self;
    v10 = v4;
    dispatch_async(verificationQueue, v9);

  }
}

void __50__ARReferenceImage_validateWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  v4 = +[ARODTHandleManager verifyReferenceImage:](ARODTHandleManager, "verifyReferenceImage:", *(_QWORD *)(a1 + 32));
  v15 = v2;
  v16 = 0;
  v5 = *(_QWORD *)(a1 + 32);
  v14 = v3;
  +[ARODTHandleManager accumulateReferenceImageErrorsForResult:refImage:objectID:pReferenceImageMap:pFailedReferenceImageNames:pUserErrorType:](ARODTHandleManager, "accumulateReferenceImageErrorsForResult:refImage:objectID:pReferenceImageMap:pFailedReferenceImageNames:pUserErrorType:", v4, v5, 0, &v15, &v14, &v16);
  v6 = v15;

  v7 = v14;
  v8 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setCachedVerificationError:", v8);

  +[ARODTHandleManager handleAccumulatedErrorType:failedReferenceImageNames:](ARODTHandleManager, "handleAccumulatedErrorType:failedReferenceImageNames:", v16, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cachedVerificationError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setError:", v9);

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedVerificationError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v13);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 16));

}

- (void)estimateQualityWithCompletionHandler:(id)a3
{
  void (**v3)(id, void *, double);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v3 = (void (**)(id, void *, double))a3;
    v8 = (id)objc_opt_new();
    ARKitCoreBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Image detection quality estimation could not be performed"), &stru_1E6676798, CFSTR("Localizable_iOS"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CB2D50]);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SPI has been deprecated."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB2D68]);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.arkit.error"), 1003, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, v7, -1.0);

  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 24);
}

- (CGSize)physicalSize
{
  double width;
  double height;
  CGSize result;

  width = self->_physicalSize.width;
  height = self->_physicalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)resourceGroupName
{
  return self->_resourceGroupName;
}

- (double)estimatedQuality
{
  return self->_estimatedQuality;
}

- (void)setEstimatedQuality:(double)a3
{
  self->_estimatedQuality = a3;
}

- (ARReferenceImageCachedError)cachedVerificationError
{
  return (ARReferenceImageCachedError *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCachedVerificationError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (__CVBuffer)alphaMask
{
  return self->_alphaMask;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_cachedVerificationError, 0);
  objc_storeStrong((id *)&self->_resourceGroupName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_verificationQueueSemaphore, 0);
  objc_storeStrong((id *)&self->_verificationQueue, 0);
}

@end
