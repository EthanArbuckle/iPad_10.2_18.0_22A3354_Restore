@implementation ARODTHandleManager

- (int64_t)maximumNumberOfTrackedImages
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_options, "objectForKey:", *MEMORY[0x1E0CFC8D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)continuousDetection
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_options, "objectForKey:", *MEMORY[0x1E0CFC8C8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)deterministicMode
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_options, "objectForKey:", *MEMORY[0x1E0CFC8C0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (int64_t)actualNumberOfImagesTracked:(int64_t)a3
{
  int64_t v3;
  NSObject *v4;
  NSObject *v5;
  int v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3 < 0)
  {
    _ARLogSession();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_DEFAULT, "Warning: Maximum number of tracked images cannot be negative. Using a value of zero instead", (uint8_t *)&v7, 2u);
    }

    CV3DODTGetMaxSupportedNumberImagesToTrack();
    return 0;
  }
  else
  {
    v3 = a3;
    if (CV3DODTGetMaxSupportedNumberImagesToTrack() < (unint64_t)a3)
    {
      v3 = CV3DODTGetMaxSupportedNumberImagesToTrack();
      _ARLogSession();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 134217984;
        v8 = v3;
        _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEFAULT, "Warning: Maximum number of tracked images exceeds the maximum. Using a value of %ld instead.", (uint8_t *)&v7, 0xCu);
      }

    }
  }
  return v3;
}

- (ARODTHandleManager)initWithMaximumNumberOfTrackedImages:(int64_t)a3
{
  return -[ARODTHandleManager initWithMaximumNumberOfTrackedImages:continuousDetection:deterministicMode:](self, "initWithMaximumNumberOfTrackedImages:continuousDetection:deterministicMode:", a3, 0, 0);
}

- (ARODTHandleManager)initWithMaximumNumberOfTrackedImages:(int64_t)a3 continuousDetection:(BOOL)a4 deterministicMode:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  ARODTHandleManager *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CV3DMLModel *v14;
  int v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  ARODTHandleManager *v19;
  dispatch_semaphore_t v20;
  OS_dispatch_semaphore *odtHandleSemaphore;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  ARODTHandleManager *v27;
  __int16 v28;
  int v29;
  _QWORD v30[3];
  _QWORD v31[4];

  v5 = a5;
  v6 = a4;
  v31[3] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)ARODTHandleManager;
  v8 = -[ARODTHandleManager init](&v23, sel_init);
  if (!v8)
    goto LABEL_7;
  v9 = objc_msgSend((id)objc_opt_class(), "actualNumberOfImagesTracked:", a3);
  v30[0] = *MEMORY[0x1E0CFC8D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v10;
  v30[1] = *MEMORY[0x1E0CFC8C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v11;
  v30[2] = *MEMORY[0x1E0CFC8C8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&v8->_options, v13);
  if (!v15)
  {
    v20 = dispatch_semaphore_create(1);
    odtHandleSemaphore = v8->_odtHandleSemaphore;
    v8->_odtHandleSemaphore = (OS_dispatch_semaphore *)v20;

    v8->_odtCounter = 0;
    v8->_odtPowerUsage = 0;

LABEL_7:
    v19 = v8;
    goto LABEL_8;
  }
  _ARLogTechnique();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v18;
    v26 = 2048;
    v27 = v8;
    v28 = 1024;
    v29 = v15;
    _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create AppleCV3D handle for image detection. Failed with error %d", buf, 0x1Cu);

  }
  v19 = 0;
LABEL_8:

  return v19;
}

- (ARODTHandleManager)initWithDeterministicMode:(BOOL)a3
{
  _BOOL8 v3;
  ARODTHandleManager *v4;
  void *v5;
  void *v6;
  CV3DMLModel *v7;
  int v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  ARODTHandleManager *v12;
  dispatch_semaphore_t v13;
  OS_dispatch_semaphore *odtHandleSemaphore;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  ARODTHandleManager *v20;
  __int16 v21;
  int v22;
  uint64_t v23;
  _QWORD v24[2];

  v3 = a3;
  v24[1] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)ARODTHandleManager;
  v4 = -[ARODTHandleManager init](&v16, sel_init);
  if (!v4)
    goto LABEL_7;
  v23 = *MEMORY[0x1E0CFC8C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&v4->_options, v6);
  if (!v8)
  {
    v13 = dispatch_semaphore_create(1);
    odtHandleSemaphore = v4->_odtHandleSemaphore;
    v4->_odtHandleSemaphore = (OS_dispatch_semaphore *)v13;

    v4->_odtCounter = 0;
LABEL_7:
    v12 = v4;
    goto LABEL_8;
  }
  _ARLogTechnique();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v11;
    v19 = 2048;
    v20 = v4;
    v21 = 1024;
    v22 = v8;
    _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create AppleCV3D handle for image detection. Failed with error %d.", buf, 0x1Cu);

  }
  v12 = 0;
LABEL_8:

  return v12;
}

- (ARODTHandleManager)init
{
  ARODTHandleManager *v2;
  CV3DMLModel *v3;
  ARODTHandleManager *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  ARODTHandleManager *v8;
  dispatch_semaphore_t v9;
  OS_dispatch_semaphore *odtHandleSemaphore;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  ARODTHandleManager *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)ARODTHandleManager;
  v2 = -[ARODTHandleManager init](&v12, sel_init);
  v4 = v2;
  if (!v2)
    goto LABEL_7;
  {
    v9 = dispatch_semaphore_create(1);
    odtHandleSemaphore = v4->_odtHandleSemaphore;
    v4->_odtHandleSemaphore = (OS_dispatch_semaphore *)v9;

    v4->_odtCounter = 0;
LABEL_7:
    v8 = v4;
    goto LABEL_8;
  }
  _ARLogTechnique();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v7;
    v15 = 2048;
    v16 = v4;
    _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create AppleCV3D handle for image detection.", buf, 0x16u);

  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (ARODTHandleManager)initWithRegionProposalModelAndDeterministicMode:(BOOL)a3
{
  _BOOL8 v3;
  ARODTHandleManager *v4;
  const void *ObjectRegionProposalModelData;
  int v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  int *mlModel;
  int v17;
  int v18;
  void *v19;
  void *v20;
  CV3DMLModel *v21;
  int v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  ARODTHandleManager *v26;
  dispatch_semaphore_t v27;
  OS_dispatch_semaphore *odtHandleSemaphore;
  objc_super v30;
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  ARODTHandleManager *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v3 = a3;
  v43 = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)ARODTHandleManager;
  v4 = -[ARODTHandleManager init](&v30, sel_init);
  if (!v4)
    goto LABEL_17;
  ObjectRegionProposalModelData = (const void *)CV3DModelsCreateObjectRegionProposalModelData();
  if (ObjectRegionProposalModelData)
  {
    v6 = CV3DMLModelCreate();
    _ARLogTechnique();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v34 = v10;
        v35 = 2048;
        v36 = v4;
        v37 = 1024;
        v38 = v6;
        _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: error creating region proposal model: %i", buf, 0x1Cu);

      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      mlModel = (int *)v4->_mlModel;
      v17 = *mlModel;
      v18 = mlModel[1];
      LODWORD(mlModel) = mlModel[2];
      *(_DWORD *)buf = 138544386;
      v34 = v15;
      v35 = 2048;
      v36 = v4;
      v37 = 1024;
      v38 = v17;
      v39 = 1024;
      v40 = v18;
      v41 = 1024;
      v42 = (int)mlModel;
      _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Region proposal model loaded from AppleCV3DModels-%i.%i.%i", buf, 0x28u);

    }
    CFRelease(ObjectRegionProposalModelData);
  }
  else
  {
    _ARLogTechnique();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v13;
      v35 = 2048;
      v36 = v4;
      _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create object region proposal model", buf, 0x16u);

    }
  }
  v31 = *MEMORY[0x1E0CFC8C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&v4->_options, v20);
  if (!v22)
  {
    v27 = dispatch_semaphore_create(1);
    odtHandleSemaphore = v4->_odtHandleSemaphore;
    v4->_odtHandleSemaphore = (OS_dispatch_semaphore *)v27;

    v4->_odtCounter = 0;
LABEL_17:
    v26 = v4;
    goto LABEL_18;
  }
  _ARLogTechnique();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v34 = v25;
    v35 = 2048;
    v36 = v4;
    v37 = 1024;
    v38 = v22;
    _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create AppleCV3D handle for image detection. Failed with error %d.", buf, 0x1Cu);

  }
  v26 = 0;
LABEL_18:

  return v26;
}

- (int)addReferenceImage:(id)a3 tracking:(BOOL)a4 pObjectID:(unint64_t *)a5
{
  id v7;
  int v8;
  NSObject *odtHandleSemaphore;

  v7 = a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_odtHandleSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v7, "pixelBuffer");
  objc_msgSend(v7, "alphaMask");
  objc_msgSend(v7, "physicalSize");
  v8 = CV3DODTAddPlanarObject();
  *a5 = self->_odtCounter;
  odtHandleSemaphore = self->_odtHandleSemaphore;
  ++self->_odtCounter;
  dispatch_semaphore_signal(odtHandleSemaphore);

  return v8;
}

+ (id)suggestionInvalidImage
{
  void *v2;
  void *v3;

  ARKitCoreBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Make sure that all reference images are greater than 100 pixels and have a positive physical size in meters."), &stru_1E6676798, CFSTR("Localizable_iOS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)suggestionInvalidFeature
{
  void *v2;
  void *v3;

  ARKitCoreBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("One or more images lack sufficient texture and contrast for accurate detection. Image detection works best when an image contains multiple high-contrast regions distributed across its extent."), &stru_1E6676798, CFSTR("Localizable_iOS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)suggestionInternalError
{
  void *v2;
  void *v3;

  ARKitCoreBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("An unknown error occurred while loading ARReferenceImages for detection. Please file a bug report."), &stru_1E6676798, CFSTR("Localizable_iOS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)accumulateReferenceImageErrorsForResult:(int)a3 refImage:(id)a4 objectID:(unint64_t)a5 pReferenceImageMap:(id *)a6 pFailedReferenceImageNames:(id *)a7 pUserErrorType:(int64_t *)a8
{
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = *a6;
  v15 = *a7;
  if (a3 > 0xF)
    goto LABEL_17;
  if (((1 << a3) & 0x6030) != 0)
  {
    _ARLogTechnique();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v13, "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138412546;
      v29 = v17;
      v30 = 1024;
      v31 = a3;
      _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_ERROR, "Could not add planar object for detection: %@ Reason: %i", (uint8_t *)&v28, 0x12u);

    }
    if ((unint64_t)(*a8 + 1) <= 1)
    {
      *a8 = -1;
      objc_msgSend(v13, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v13, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
      }
      else
      {
        ARKitCoreBundle();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("<Unnamed>"), &stru_1E6676798, CFSTR("Localizable_iOS"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "addObject:", v19);
      if (!v18)

LABEL_26:
      goto LABEL_27;
    }
    goto LABEL_27;
  }
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v13, v24);

    goto LABEL_27;
  }
  if (a3 != 15)
  {
LABEL_17:
    _ARLogTechnique();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v13, "description");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138412546;
      v29 = v26;
      v30 = 1024;
      v31 = a3;
      _os_log_impl(&dword_1B3A68000, v25, OS_LOG_TYPE_ERROR, "Could not add planar object for detection: %@ Reason: %i", (uint8_t *)&v28, 0x12u);

    }
    if (!*a8 || *a8 == -3)
    {
      *a8 = -3;
      objc_msgSend(v13, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v13, "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v27;
      }
      else
      {
        ARKitCoreBundle();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("<Unnamed>"), &stru_1E6676798, CFSTR("Localizable_iOS"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "addObject:", v27);
      if (!v18)

      goto LABEL_26;
    }
    goto LABEL_27;
  }
  _ARLogTechnique();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v13, "description");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138412546;
    v29 = v22;
    v30 = 1024;
    v31 = 15;
    _os_log_impl(&dword_1B3A68000, v21, OS_LOG_TYPE_ERROR, "Could not add planar object for detection: %@ Reason: %i", (uint8_t *)&v28, 0x12u);

  }
  if (!*a8 || *a8 == -2)
  {
    *a8 = -2;
    objc_msgSend(v13, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v13, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v23;
    }
    else
    {
      ARKitCoreBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("<Unnamed>"), &stru_1E6676798, CFSTR("Localizable_iOS"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "addObject:", v23);
    if (!v18)

    goto LABEL_26;
  }
LABEL_27:

}

+ (id)handleAccumulatedErrorType:(int64_t)a3 failedReferenceImageNames:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint8_t buf[8];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[4];

  v36[3] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  switch(a3)
  {
    case -3:
      _ARLogSession();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B3A68000, v15, OS_LOG_TYPE_DEFAULT, "An unknown error occurred while loading ARReferenceImages for detection. Please file a bug report.", buf, 2u);
      }

      v16 = (void *)MEMORY[0x1E0CB3940];
      ARKitCoreBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("One or more reference images could not be loaded due to an unknown error: %@"), &stru_1E6676798, CFSTR("Localizable_iOS"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", v18, v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v32[0] = v5;
      v20 = *MEMORY[0x1E0CB2D80];
      v31[0] = CFSTR("ARErrorItems");
      v31[1] = v20;
      objc_msgSend((id)objc_opt_class(), "suggestionInternalError");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v31[2] = *MEMORY[0x1E0CB2D68];
      v32[1] = v21;
      v32[2] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      ARErrorWithCodeAndUserInfo(300, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      break;
    case -2:
      v22 = (void *)MEMORY[0x1E0CB3940];
      ARKitCoreBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("One or more reference images have insufficient texture: %@"), &stru_1E6676798, CFSTR("Localizable_iOS"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", v24, v25);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v34[0] = v5;
      v26 = *MEMORY[0x1E0CB2D80];
      v33[0] = CFSTR("ARErrorItems");
      v33[1] = v26;
      objc_msgSend((id)objc_opt_class(), "suggestionInvalidFeature");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v33[2] = *MEMORY[0x1E0CB2D68];
      v34[1] = v27;
      v34[2] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      ARErrorWithCodeAndUserInfo(300, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      break;
    case -1:
      v6 = (void *)MEMORY[0x1E0CB3940];
      ARKitCoreBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("One or more reference images have an invalid size: %@"), &stru_1E6676798, CFSTR("Localizable_iOS"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v36[0] = v5;
      v11 = *MEMORY[0x1E0CB2D80];
      v35[0] = CFSTR("ARErrorItems");
      v35[1] = v11;
      objc_msgSend((id)objc_opt_class(), "suggestionInvalidImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2] = *MEMORY[0x1E0CB2D68];
      v36[1] = v12;
      v36[2] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      ARErrorWithCodeAndUserInfo(300, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v28 = 0;
      goto LABEL_11;
  }
  v28 = (void *)v14;

LABEL_11:
  return v28;
}

- (int)waitForAllObjectsAddToFinish
{
  int v3;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_odtHandleSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v3 = CV3DODTWaitForAllObjectsAddToFinish();
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_odtHandleSemaphore);
  return v3;
}

- (int)addReferenceObject:(id)a3 tracking:(BOOL)a4 pObjectID:(unint64_t *)a5
{
  id v7;
  void *v8;
  int v9;
  NSObject *odtHandleSemaphore;

  v7 = a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_odtHandleSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v7, "trackingData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CV3DODTAdd3dObject();

  *a5 = self->_odtCounter;
  odtHandleSemaphore = self->_odtHandleSemaphore;
  ++self->_odtCounter;
  dispatch_semaphore_signal(odtHandleSemaphore);

  return v9;
}

- (int)detectReferenceObjectsForImageData:(id)a3 worldTrackingPose:(id)a4 imageContext:(const void *)a5 pResultArray:(id *)a6
{
  id v9;
  id v10;
  int v11;
  id v12;
  int v13;
  int8x16_t v14;
  int8x16_t v15;
  __n128 v16;
  __n128 v17;
  id v18;
  id v20;
  float64x2_t v21;
  float64x2_t v22[4];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_odtHandleSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v20 = 0;
  v11 = objc_msgSend((id)objc_opt_class(), "_calibrationDataFromImageData:pCalibrationData:", v9, &v20);
  v12 = v20;
  if (v11)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_odtHandleSemaphore);

    v13 = 7;
  }
  else
  {
    objc_msgSend(v10, "visionCameraTransform");
    objc_msgSend(v9, "pixelBuffer", ARMatrix4x4RowMajorRotationAndTranslation(v22, &v21, v14, v15, v16, v17));
    objc_msgSend(v9, "timestamp");
    v13 = CV3DODTDetectWithMetadata();
    v18 = objc_retainAutorelease((id)objc_opt_new());
    *a6 = v18;
    CV3DODTObjectInfoRelease();

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_odtHandleSemaphore);
  }

  return v13;
}

- (int)trackPlanarObjectAndEstimateScaleForImageData:(id)a3 worldTrackingPose:(id)a4 imageContext:(const void *)a5 timeBudget:(double)a6 pResultArray:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  int v16;
  int8x16_t v17;
  int8x16_t v18;
  __n128 v19;
  __n128 v20;
  int v21;
  id v22;
  id *v24;
  id v25;
  float64x2_t v26;
  float64x2_t v27[4];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_odtHandleSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v13 = (void *)objc_opt_new();
  v24 = a7;
  v25 = v13;
  v14 = objc_msgSend((id)objc_opt_class(), "_calibrationDataFromImageData:pCalibrationData:", v11, &v25);
  v15 = v25;

  if (v14)
  {

    v16 = 7;
  }
  else
  {
    if (a6 > 0.0)
      CV3DODTSetMaximumTrackingTime();
    if (v12)
    {
      objc_msgSend(v12, "visionCameraTransform");
      objc_msgSend(v11, "pixelBuffer", ARMatrix4x4RowMajorRotationAndTranslation(v27, &v26, v17, v18, v19, v20));
      objc_msgSend(v11, "timestamp");
      v21 = CV3DODTTrackAndEstimateScale();
    }
    else
    {
      objc_msgSend(v11, "pixelBuffer");
      objc_msgSend(v11, "timestamp");
      v21 = CV3DODTTrack();
    }
    v16 = v21;
    v22 = objc_retainAutorelease((id)objc_opt_new());
    *v24 = v22;
    CV3DODTObjectInfoRelease();

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_odtHandleSemaphore);
  }

  return v16;
}

- (int)trackPlanarObjectForImageData:(id)a3 imageContext:(const void *)a4 timeBudget:(double)a5 pResultArray:(id *)a6
{
  return -[ARODTHandleManager trackPlanarObjectAndEstimateScaleForImageData:worldTrackingPose:imageContext:timeBudget:pResultArray:](self, "trackPlanarObjectAndEstimateScaleForImageData:worldTrackingPose:imageContext:timeBudget:pResultArray:", a3, 0, a4, a6, a5);
}

- (void)dealloc
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  CV3DODTContext *odtHandle;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  ARODTHandleManager *v14;
  __int16 v15;
  CV3DODTContext *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_odtHandle)
  {
    _ARLogTechnique();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      odtHandle = self->_odtHandle;
      *(_DWORD *)buf = 138543874;
      v12 = v5;
      v13 = 2048;
      v14 = self;
      v15 = 2048;
      v16 = odtHandle;
      _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Releasing Image Detection handle: %p …", buf, 0x20u);

    }
    CV3DODTRelease();
    self->_odtHandle = 0;
    _ARLogTechnique();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v9;
      v13 = 2048;
      v14 = self;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: ImageDetectionHandle handle released", buf, 0x16u);

    }
  }
  if (self->_mlModel)
    CV3DMLModelRelease();
  v10.receiver = self;
  v10.super_class = (Class)ARODTHandleManager;
  -[ARODTHandleManager dealloc](&v10, sel_dealloc);
}

- (int)predictPlanarObjectsAtTimestamp:(double)a3 worldTrackingPose:(id)a4 timeBudget:(double)a5 pResultArray:(id *)a6
{
  id v9;
  int8x16_t v10;
  int8x16_t v11;
  __n128 v12;
  __n128 v13;
  int v14;
  int v15;
  id v16;
  float64x2_t v18;
  float64x2_t v19[4];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_odtHandleSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (a5 > 0.0)
    CV3DODTSetMaximumTrackingTime();
  if (v9)
  {
    objc_msgSend(v9, "visionCameraTransform");
    ARMatrix4x4RowMajorRotationAndTranslation(v19, &v18, v10, v11, v12, v13);
    v14 = CV3DODTImagePredictInWorld();
  }
  else
  {
    v14 = CV3DODTImagePredict();
  }
  v15 = v14;
  v16 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0));
  *a6 = v16;
  CV3DODTObjectInfoRelease();

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_odtHandleSemaphore);
  return v15;
}

+ (int)verifyReferenceImage:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  objc_msgSend(v3, "pixelBuffer");
  objc_msgSend(v3, "alphaMask");
  objc_msgSend(v3, "physicalSize");
  v4 = CV3DODTVerifyReferenceImage();

  return v4;
}

- (void)updatePowerUsage:(unint64_t)a3
{
  if (self->_odtPowerUsage != a3)
  {
    self->_odtPowerUsage = a3;
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_odtHandleSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    CV3DODTSetPerformanceMode();
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_odtHandleSemaphore);
  }
}

- (void)releaseODTHandle
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  CV3DODTContext *odtHandle;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  ARODTHandleManager *v13;
  __int16 v14;
  CV3DODTContext *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_odtHandleSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (self->_odtHandle)
  {
    _ARLogTechnique();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      odtHandle = self->_odtHandle;
      v10 = 138543874;
      v11 = v5;
      v12 = 2048;
      v13 = self;
      v14 = 2048;
      v15 = odtHandle;
      _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Releasing Image Detection handle: %p …", (uint8_t *)&v10, 0x20u);

    }
    CV3DODTRelease();
    self->_odtHandle = 0;
    _ARLogTechnique();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: ImageDetectionHandle handle released", (uint8_t *)&v10, 0x16u);

    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_odtHandleSemaphore);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSDictionary isEqual:](self->_options, "isEqual:", v4[4]);
  else
    v5 = 0;

  return v5;
}

+ (int)_calibrationDataFromImageData:(id)a3 pCalibrationData:(id *)a4
{
  id v5;
  void *v6;
  float v7;
  float v8;
  uint64_t v9;
  size_t Width;
  size_t Height;
  int v12;
  float v14;
  float v15;
  uint64_t v16;
  _OWORD v17[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  CVPixelBufferLockBaseAddress((CVPixelBufferRef)objc_msgSend(v5, "pixelBuffer"), 0);
  objc_msgSend(v5, "cameraIntrinsics");
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v18 = 0;
  memset(v17, 0, sizeof(v17));
  Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v5, "pixelBuffer"));
  Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v5, "pixelBuffer"));
  if (MEMORY[0x1B5E2CD78](v6, Width, Height, v17, v17, v17, v17, "Perspective", v14, v15, *(float *)&v16, *((float *)&v16 + 1), 0.0))
  {
    CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)objc_msgSend(v5, "pixelBuffer"), 0);
    v12 = 8;
  }
  else
  {
    *a4 = objc_retainAutorelease(v6);
    CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)objc_msgSend(v5, "pixelBuffer"), 0);
    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_odtHandleSemaphore, 0);
}

@end
