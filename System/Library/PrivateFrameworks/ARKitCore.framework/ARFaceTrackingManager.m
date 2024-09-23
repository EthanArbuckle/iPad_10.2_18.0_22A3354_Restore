@implementation ARFaceTrackingManager

+ (void)initialize
{
  if (+[ARFaceTrackingManager initialize]::onceToken[0] != -1)
    dispatch_once(+[ARFaceTrackingManager initialize]::onceToken, &__block_literal_global_53);
}

void __35__ARFaceTrackingManager_initialize__block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;

  v0 = dispatch_semaphore_create(1);
  v1 = (void *)s_faceTrackingSemaphore;
  s_faceTrackingSemaphore = (uint64_t)v0;

}

- (ARFaceTrackingManager)initWithOptions:(id)a3
{
  return -[ARFaceTrackingManager initWithMaximumNumberOfTrackedFaces:options:](self, "initWithMaximumNumberOfTrackedFaces:options:", 1, a3);
}

- (ARFaceTrackingManager)initWithMaximumNumberOfTrackedFaces:(int64_t)a3 options:(id)a4
{
  ARFaceTrackingManager *v6;
  uint64_t v7;
  NSUUID *singleUserAnchorIdentifier;
  ARFaceTrackingManager *v9;
  int v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  ARFaceTrackingManager *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!+[ARFaceTrackingManager isSupported](ARFaceTrackingManager, "isSupported", a3, a4))
  {
    v9 = 0;
    goto LABEL_8;
  }
  v15.receiver = self;
  v15.super_class = (Class)ARFaceTrackingManager;
  v6 = -[ARFaceTrackingManager init](&v15, sel_init);
  if (!v6)
    goto LABEL_6;
  dispatch_semaphore_wait((dispatch_semaphore_t)s_faceTrackingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  ++s_instanceCount;
  if (s_faceTracking || (v11 = CVAFaceTrackingCreate()) == 0)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)s_faceTrackingSemaphore);
    v6->_maximumNumberOfTrackedFaces = a3;
    if (a3 == 1)
    {
      v7 = objc_opt_new();
      singleUserAnchorIdentifier = v6->_singleUserAnchorIdentifier;
      v6->_singleUserAnchorIdentifier = (NSUUID *)v7;

    }
LABEL_6:
    self = v6;
    v9 = self;
    goto LABEL_8;
  }
  _ARLogGeneral();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v17 = v14;
    v18 = 2048;
    v19 = v6;
    v20 = 1024;
    v21 = v11;
    _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error creating face kit instance: %i", buf, 0x1Cu);

  }
  dispatch_semaphore_signal((dispatch_semaphore_t)s_faceTrackingSemaphore);
  v9 = 0;
  self = v6;
LABEL_8:

  return v9;
}

- (ARFaceTrackingManager)init
{
  return -[ARFaceTrackingManager initWithOptions:](self, "initWithOptions:", 0);
}

- (void)dealloc
{
  BOOL v3;
  objc_super v4;

  dispatch_semaphore_wait((dispatch_semaphore_t)s_faceTrackingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (--s_instanceCount)
    v3 = 1;
  else
    v3 = s_faceTracking == 0;
  if (!v3)
  {
    CFRelease((CFTypeRef)s_faceTracking);
    s_faceTracking = 0;
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)s_faceTrackingSemaphore);
  v4.receiver = self;
  v4.super_class = (Class)ARFaceTrackingManager;
  -[ARFaceTrackingManager dealloc](&v4, sel_dealloc);
}

+ (BOOL)isSupported
{
  if ((ARRGBFaceTrackingEnabled() & 1) != 0)
    return 1;
  else
    return ARPearlCameraSupported();
}

- (id)processData:(id)a3
{
  dispatch_semaphore_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  ARFaceTrackingData *v25;
  void *v26;
  ARFaceTrackingData *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  dispatch_semaphore_t dsema;
  void *v33;
  void *v34;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[4];
  dispatch_semaphore_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  objc_msgSend(v36, "timestamp");
  kdebug_trace();
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__2;
  v51 = __Block_byref_object_dispose__2;
  v52 = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __37__ARFaceTrackingManager_processData___block_invoke;
  v44[3] = &unk_1E66744D8;
  v46 = &v47;
  dsema = v3;
  v45 = dsema;
  -[ARFaceTrackingManager faceTrackingOptionsFromImageData:withCallback:](self, "faceTrackingOptionsFromImageData:withCallback:", v36, v44);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait((dispatch_semaphore_t)s_faceTrackingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v31 = (void *)v5;
  LODWORD(v5) = CVAFaceTrackingProcess();
  dispatch_semaphore_signal((dispatch_semaphore_t)s_faceTrackingSemaphore);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!(_DWORD)v5)
  {
    v6 = (void *)v48[5];
    if (v6)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD88]);
      v7 = objc_claimAutoreleasedReturnValue();

      v37 = (void *)v7;
    }
  }
  objc_msgSend(v37, "count");
  kdebug_trace();
  v34 = (void *)objc_opt_new();
  if (objc_msgSend(v37, "count"))
  {
    v42[0] = v4;
    v42[1] = 3221225472;
    v42[2] = __37__ARFaceTrackingManager_processData___block_invoke_2;
    v42[3] = &unk_1E6674500;
    v42[4] = self;
    v43 = v34;
    objc_msgSend(v37, "enumerateObjectsUsingBlock:", v42);
    v33 = (void *)objc_msgSend((id)v48[5], "mutableCopy");
    v8 = (void *)objc_opt_new();
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v30 = *MEMORY[0x1E0CFCD88];
    objc_msgSend(v33, "objectForKeyedSubscript:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v39;
      v12 = *MEMORY[0x1E0CFCCC0];
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v39 != v11)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v13), "mutableCopy");
          objc_msgSend(v14, "objectForKeyedSubscript:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15 == 0;

          if (!v16)
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", v12);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (void *)objc_msgSend(v17, "mutableCopy");

            objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA70], CFSTR("rgb_crop"));
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, v12);

          }
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
      }
      while (v10);
    }

    objc_msgSend(v33, "setObject:forKeyedSubscript:", v8, v30);
    objc_msgSend(v36, "faceData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFaceMeshPayload:", v33);

  }
  objc_msgSend(v36, "faceData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "faceMeshPayload");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD88]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count") == 0;

  if (v23)
  {
    objc_msgSend(v36, "timestamp");
    kdebug_trace();
  }
  if (-[ARFaceTrackingManager maximumNumberOfTrackedFaces](self, "maximumNumberOfTrackedFaces") == 1)
  {
    objc_msgSend(v34, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v34, "removeAllObjects");
      v25 = [ARFaceTrackingData alloc];
      objc_msgSend(v24, "trackingData");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[ARFaceTrackingData initWithTrackingData:anchorIdentifier:](v25, "initWithTrackingData:anchorIdentifier:", v26, self->_singleUserAnchorIdentifier);

      objc_msgSend(v34, "addObject:", v27);
    }

  }
  v28 = (void *)objc_opt_new();
  objc_msgSend(v28, "setTrackedFaces:", v34);

  _Block_object_dispose(&v47, 8);
  return v28;
}

intptr_t __37__ARFaceTrackingManager_processData___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __37__ARFaceTrackingManager_processData___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  ARFaceTrackingData *v15;
  unint64_t v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD00]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
LABEL_5:
    _ARLogGeneral();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v20 = 138543875;
      v21 = v13;
      v22 = 2048;
      v23 = v14;
      v24 = 2113;
      v25 = v8;
      _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Tracking anchor with ID = %{private}@", (uint8_t *)&v20, 0x20u);

    }
    v15 = -[ARFaceTrackingData initWithTrackingData:anchorIdentifier:]([ARFaceTrackingData alloc], "initWithTrackingData:anchorIdentifier:", v6, v8);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);
    v16 = objc_msgSend(*(id *)(a1 + 40), "count");
    *a4 = v16 > objc_msgSend(*(id *)(a1 + 32), "maximumNumberOfTrackedFaces");

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    v20 = objc_msgSend(v9, "intValue");
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v20, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "ar_UUIDWithData:", v10);
    v8 = objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  _ARLogGeneral();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 32);
    v20 = 138543618;
    v21 = v18;
    v22 = 2048;
    v23 = v19;
    _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Encountered invalid face ID", (uint8_t *)&v20, 0x16u);

  }
LABEL_8:

}

- (id)faceTrackingOptionsFromImageData:(id)a3 withCallback:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  Float64 v9;
  CFDictionaryRef v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  __CVBuffer *v25;
  OSType PixelFormatType;
  NSObject *v27;
  objc_class *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v35;
  CMTime time;
  CMTime v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  ARFaceTrackingManager *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[6];
  _QWORD v49[6];
  _QWORD v50[2];
  _QWORD v51[4];

  v51[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v35 = a4;
  v6 = *MEMORY[0x1E0CFCD90];
  v50[0] = *MEMORY[0x1E0CFCD68];
  v50[1] = v6;
  v51[0] = &unk_1E66CEC40;
  v51[1] = &unk_1E66CEC58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __71__ARFaceTrackingManager_faceTrackingOptionsFromImageData_withCallback___block_invoke_2((uint64_t)v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v37, 0, sizeof(v37));
  objc_msgSend(v5, "timestamp");
  CMTimeMakeWithSeconds(&v37, v9, 1000000000);
  time = v37;
  v10 = CMTimeCopyAsDictionary(&time, 0);
  v11 = *MEMORY[0x1E0CFCD80];
  v49[0] = v10;
  v12 = *MEMORY[0x1E0CFCCF0];
  v48[0] = v11;
  v48[1] = v12;
  objc_msgSend(v5, "faceData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "detectedFaces");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __71__ARFaceTrackingManager_faceTrackingOptionsFromImageData_withCallback___block_invoke((uint64_t)v14, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v15;
  v48[2] = *MEMORY[0x1E0CFCC98];
  v16 = *MEMORY[0x1E0CFCCF8];
  v46[0] = *MEMORY[0x1E0CFCD30];
  v46[1] = v16;
  v47[0] = v8;
  v47[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v17;
  v48[3] = *MEMORY[0x1E0CFCCA0];
  v18 = objc_msgSend(v5, "pixelBuffer");
  v19 = *MEMORY[0x1E0CFCC30];
  v49[3] = v18;
  v49[4] = MEMORY[0x1E0C9AAA0];
  v20 = *MEMORY[0x1E0CFCC38];
  v48[4] = v19;
  v48[5] = v20;
  v49[5] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 6);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend((id)v21, "mutableCopy");

  objc_msgSend(v5, "depthData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = v23 == 0;

  if ((v21 & 1) == 0)
  {
    objc_msgSend(v5, "depthData");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v25 = (__CVBuffer *)objc_msgSend(v24, "depthDataMap");

    if (v25)
    {
      PixelFormatType = CVPixelBufferGetPixelFormatType(v25);
      if (PixelFormatType == 1717855600)
      {
        objc_msgSend(v22, "setValue:forKey:", v25, *MEMORY[0x1E0CFCCC8]);
        objc_msgSend(v22, "setValue:forKey:", &unk_1E66CF1D0, *MEMORY[0x1E0CFCCD0]);
        objc_msgSend(v22, "setValue:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CFCD70]);
      }
      else
      {
        if (_ARLogTechnique(void)::onceToken != -1)
          dispatch_once(&_ARLogTechnique(void)::onceToken, &__block_literal_global_54);
        v27 = (id)_ARLogTechnique(void)::logObj;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          v29 = (id)objc_claimAutoreleasedReturnValue();
          AROSTypeToString(0x66646570u);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          AROSTypeToString(PixelFormatType);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v39 = v29;
          v40 = 2048;
          v41 = self;
          v42 = 2112;
          v43 = v30;
          v44 = 2112;
          v45 = v31;
          _os_log_impl(&dword_1B3A68000, v27, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Wrong depth format. Expected %@ but received %@", buf, 0x2Au);

        }
      }
    }
  }
  v32 = (void *)MEMORY[0x1B5E2DF90](v35);
  objc_msgSend(v22, "setValue:forKey:", v32, *MEMORY[0x1E0CFCC90]);

  return v22;
}

id __71__ARFaceTrackingManager_faceTrackingOptionsFromImageData_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  CFDictionaryRef DictionaryRepresentation;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  id obj;
  uint64_t v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[3];
  _QWORD v24[3];
  _BYTE v25[128];
  uint64_t v26;
  CGRect v27;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v2)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v15 = v2;
    obj = v2;
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v3)
    {
      v17 = *(_QWORD *)v20;
      v4 = *MEMORY[0x1E0CFCCD8];
      v5 = *MEMORY[0x1E0CFCCE0];
      v6 = *MEMORY[0x1E0CFCCE8];
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v8, "boundingBox", v15);
          DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v27);
          v23[0] = v4;
          v10 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v8, "rollAngleInDegrees");
          objc_msgSend(v10, "numberWithDouble:");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = v11;
          v23[1] = v5;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v8, "ID"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v23[2] = v6;
          v24[1] = v12;
          v24[2] = DictionaryRepresentation;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          CFRelease(DictionaryRepresentation);
          objc_msgSend(v18, "addObject:", v13);

        }
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v3);
    }

    v2 = v15;
  }

  return v18;
}

id __71__ARFaceTrackingManager_faceTrackingOptionsFromImageData_withCallback___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  double v6;
  void *v7;
  int v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  int v13;
  double v14;
  void *v15;
  void *v16;
  int v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  double v23;
  void *v24;
  void *v25;
  int v26;
  double v27;
  void *v28;
  void *v29;
  int v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[3];
  _QWORD v42[3];
  uint64_t v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[4];

  v46[3] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "cameraIntrinsics");
  objc_msgSend(v3, "numberWithFloat:");
  v43 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v40 = (void *)v43;
  objc_msgSend(v2, "cameraIntrinsics");
  LODWORD(v6) = v5;
  objc_msgSend(v4, "numberWithFloat:", v6);
  v44 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v38 = (void *)v44;
  objc_msgSend(v2, "cameraIntrinsics");
  LODWORD(v9) = v8;
  objc_msgSend(v7, "numberWithFloat:", v9);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v37;
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "cameraIntrinsics");
  LODWORD(v11) = HIDWORD(v11);
  objc_msgSend(v10, "numberWithFloat:", v11);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v36;
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "cameraIntrinsics");
  LODWORD(v14) = v13;
  objc_msgSend(v12, "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v15;
  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "cameraIntrinsics");
  LODWORD(v18) = v17;
  objc_msgSend(v16, "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v20;
  v21 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "cameraIntrinsics");
  LODWORD(v23) = v22;
  objc_msgSend(v21, "numberWithFloat:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v24;
  v25 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "cameraIntrinsics");
  LODWORD(v27) = v26;
  objc_msgSend(v25, "numberWithFloat:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v28;
  v29 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "cameraIntrinsics");
  LODWORD(v31) = v30;
  objc_msgSend(v29, "numberWithFloat:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARFaceTrackingManager;
  if (-[ARFaceTrackingManager isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = -[ARFaceTrackingManager maximumNumberOfTrackedFaces](self, "maximumNumberOfTrackedFaces");
    v7 = v6 == objc_msgSend(v5, "maximumNumberOfTrackedFaces");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)maximumNumberOfTrackedFaces
{
  return self->_maximumNumberOfTrackedFaces;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singleUserAnchorIdentifier, 0);
}

@end
