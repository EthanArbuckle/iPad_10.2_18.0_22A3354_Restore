@implementation NTKCompanionResourceDirectoryEditor

- (NTKCompanionResourceDirectoryEditor)initWithResourceDirectory:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  NTKCompanionResourceDirectoryEditor *v8;
  NTKCompanionResourceDirectoryEditor *v9;
  uint64_t v10;
  void *v11;
  NSString *resourceDirectory;
  NSString *galleryPreviewResourceDirectory;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NTKCompanionResourceDirectoryEditor;
  v8 = -[NTKCompanionResourceDirectoryEditor init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a4);
    if (v6)
    {
      NTKNewUniqueTeporaryResourceDirectory();
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "linkItemAtPath:toPath:error:", v6, v10, 0);

      resourceDirectory = v9->_resourceDirectory;
      v9->_resourceDirectory = (NSString *)v10;

      v9->_resourceDirectoryIsHardLink = 1;
    }
    galleryPreviewResourceDirectory = v9->_galleryPreviewResourceDirectory;
    v9->_galleryPreviewResourceDirectory = 0;

    v9->_state = 0;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NTKCompanionResourceDirectoryEditor _deleteResourceDirectoryHardLinkIfNecessary](self, "_deleteResourceDirectoryHardLinkIfNecessary");
  v3.receiver = self;
  v3.super_class = (Class)NTKCompanionResourceDirectoryEditor;
  -[NTKCompanionResourceDirectoryEditor dealloc](&v3, sel_dealloc);
}

- (void)setResourceDirectory:(id)a3
{
  id v5;

  v5 = a3;
  if (self->_resourceDirectoryIsHardLink || (NTKEqualStrings(v5, self->_resourceDirectory) & 1) == 0)
  {
    -[NTKCompanionResourceDirectoryEditor _deleteResourceDirectoryHardLinkIfNecessary](self, "_deleteResourceDirectoryHardLinkIfNecessary");
    objc_storeStrong((id *)&self->_resourceDirectory, a3);
  }

}

- (void)_deleteResourceDirectoryHardLinkIfNecessary
{
  void *v3;
  NSString *resourceDirectory;

  if (self->_resourceDirectoryIsHardLink)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItemAtPath:error:", self->_resourceDirectory, 0);

    resourceDirectory = self->_resourceDirectory;
    self->_resourceDirectory = 0;

    self->_resourceDirectoryIsHardLink = 0;
  }
}

- (void)generateGalleryPreviewResourceDirectoryWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  self->_state = 3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __93__NTKCompanionResourceDirectoryEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke;
  v6[3] = &unk_1E6BD00B0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __93__NTKCompanionResourceDirectoryEditor_generateGalleryPreviewResourceDirectoryWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)finalizeWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  self->_state = 4;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__NTKCompanionResourceDirectoryEditor_finalizeWithCompletion___block_invoke;
  v6[3] = &unk_1E6BD00B0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __62__NTKCompanionResourceDirectoryEditor_finalizeWithCompletion___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)finalizeWithProgress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__NTKCompanionResourceDirectoryEditor_finalizeWithProgress_completion___block_invoke;
  block[3] = &unk_1E6BD5EE0;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __71__NTKCompanionResourceDirectoryEditor_finalizeWithProgress_completion___block_invoke(_QWORD *a1)
{
  *(_QWORD *)(a1[4] + 32) = 0;
  (*(void (**)(double))(a1[5] + 16))(0.0);
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

+ (id)_linkPhoto:(id)a3 to:(id)a4 previewOnly:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "imageURL");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = "NO";
    if (v5)
      v12 = "YES";
    v19 = 138412546;
    v20 = v10;
    v21 = 2080;
    v22 = v12;
    _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "_linkPhoto: linking existing photo %@ into the new resource directory; preview == %s",
      (uint8_t *)&v19,
      0x16u);

  }
  v13 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "imageURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NTKPhotosLinkURL(v14, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v13, "setImageURL:", v15);
    if (v5)
    {
      objc_msgSend(v13, "setIsIris:", 0);
      objc_msgSend(v13, "setIrisVideoURL:", 0);
      objc_msgSend(v13, "setIrisDuration:", 0.0);
      objc_msgSend(v13, "setIrisStillDisplayTime:", 0.0);
LABEL_12:
      v16 = v13;
      goto LABEL_13;
    }
    if (!objc_msgSend(v7, "isIris"))
      goto LABEL_12;
    objc_msgSend(v7, "irisVideoURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NTKPhotosLinkURL(v17, v8);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v13, "setIrisVideoURL:", v16);

      goto LABEL_12;
    }
  }
  else
  {
    v16 = 0;
  }
LABEL_13:

  return v16;
}

+ (id)_transcodeAsset:(id)a3 withCrop:(CGRect)a4 into:(id)a5 previewOnly:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  int v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v6 = a6;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v32 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "localIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = "NO";
    if (v6)
      v18 = "YES";
    v28 = 138412546;
    v29 = v16;
    v30 = 2080;
    v31 = v18;
    _os_log_impl(&dword_1B72A3000, v15, OS_LOG_TYPE_DEFAULT, "_transcodeAsset: transcoding new asset %@ into the new resource directory; preview == %s",
      (uint8_t *)&v28,
      0x16u);

  }
  v19 = (void *)objc_opt_new();
  objc_msgSend(v13, "localIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLocalIdentifier:", v20);

  objc_msgSend(v13, "modificationDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setModificationDate:", v21);

  objc_msgSend(v19, "setOriginalCrop:", x, y, width, height);
  v22 = x / (double)(unint64_t)objc_msgSend(v13, "pixelWidth");
  v23 = y / (double)(unint64_t)objc_msgSend(v13, "pixelHeight");
  v24 = width / (double)(unint64_t)objc_msgSend(v13, "pixelWidth");
  v25 = height / (double)(unint64_t)objc_msgSend(v13, "pixelHeight");
  if (objc_msgSend(a1, "_transcodeStillImageOf:forPhoto:withCrop:into:", v13, v19, v14, v22, v23, v24, v25)&& objc_msgSend(a1, "_transcodeIrisVideoOf:forPhoto:withCrop:into:previewOnly:", v13, v19, v14, v6, v22, v23, v24,
                       v25))
  {
    v26 = v19;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

+ (BOOL)_transcodeStillImageOf:(id)a3 forPhoto:(id)a4 withCrop:(CGRect)a5 into:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  id v15;
  dispatch_semaphore_t v16;
  uint64_t v17;
  NSObject *v18;
  unint64_t v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NTKCompanionImageDataScaler *v29;
  NTKCompanionImageDataScaler *v30;
  NSObject *v31;
  int v32;
  _QWORD v34[4];
  NSObject *v35;
  id v36;
  id v37;
  uint64_t *v38;
  double v39;
  double v40;
  CGAffineTransform v41;
  _QWORD v42[4];
  NSObject *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  CGRect v60;
  CGRect v61;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__36;
  v54 = __Block_byref_object_dispose__36;
  v55 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v16 = dispatch_semaphore_create(0);
  v17 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __85__NTKCompanionResourceDirectoryEditor__transcodeStillImageOf_forPhoto_withCrop_into___block_invoke;
  v42[3] = &unk_1E6BD5F08;
  v44 = &v50;
  v45 = &v46;
  v18 = v16;
  v43 = v18;
  objc_msgSend(a1, "_imageDataForAsset:completion:", v13, v42);
  dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  if (v51[5])
  {
    v19 = objc_msgSend(v13, "pixelWidth");
    v20 = objc_msgSend(v13, "pixelHeight");
    CGAffineTransformMakeScale(&v41, (double)(unint64_t)objc_msgSend(v13, "pixelWidth"), (double)(unint64_t)objc_msgSend(v13, "pixelHeight"));
    v60.origin.x = x;
    v60.origin.y = y;
    v60.size.width = width;
    v60.size.height = height;
    v61 = CGRectApplyAffineTransform(v60, &v41);
    v21 = v61.origin.x;
    v22 = v61.origin.y;
    v23 = v61.size.width;
    v24 = v61.size.height;
    objc_msgSend(a1, "_watchPhotoImageSize");
    v26 = v25;
    v28 = v27;
    v29 = [NTKCompanionImageDataScaler alloc];
    v30 = -[NTKCompanionImageDataScaler initWithSize:crop:data:orientation:outputSize:](v29, "initWithSize:crop:data:orientation:outputSize:", v51[5], v47[3], (double)v19, (double)v20, v21, v22, v23, v24, v26, v28);
    v34[0] = v17;
    v34[1] = 3221225472;
    v34[2] = __85__NTKCompanionResourceDirectoryEditor__transcodeStillImageOf_forPhoto_withCrop_into___block_invoke_2;
    v34[3] = &unk_1E6BD5F58;
    v31 = v18;
    v35 = v31;
    v36 = v14;
    v39 = v26;
    v40 = v28;
    v37 = v15;
    v38 = &v56;
    -[NTKCompanionImageDataScaler cropAndScaleWithCompletion:](v30, "cropAndScaleWithCompletion:", v34);
    dispatch_semaphore_wait(v31, 0xFFFFFFFFFFFFFFFFLL);
    v32 = *((unsigned __int8 *)v57 + 24);

  }
  else
  {
    v32 = *((unsigned __int8 *)v57 + 24);
  }

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  return v32 != 0;
}

void __85__NTKCompanionResourceDirectoryEditor__transcodeStillImageOf_forPhoto_withCrop_into___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v6 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __85__NTKCompanionResourceDirectoryEditor__transcodeStillImageOf_forPhoto_withCrop_into___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  NSObject *v28;
  uint64_t v29;
  id v30;

  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1BCCA7FA8]();
    objc_msgSend(*(id *)(a1 + 40), "irisVideoURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0CB3940];
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "irisVideoURL");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v6, "stringWithUTF8String:", objc_msgSend(v7, "fileSystemRepresentation"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "stringByDeletingPathExtension");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v10 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v10;
    }
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.jpg"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "stringByAppendingPathComponent:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v3, "writeToFile:options:error:", v13, 0, &v30);
    v14 = v30;
    if (v14)
    {
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __85__NTKCompanionResourceDirectoryEditor__transcodeStillImageOf_forPhoto_withCrop_into___block_invoke_2_cold_1((uint64_t)v12, (uint64_t)v14, v15);
    }
    else
    {
      v23 = v12;
      v24 = v4;
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setImageURL:", v16);

      objc_msgSend(*(id *)(a1 + 40), "setCrop:", 0.0, 0.0, *(double *)(a1 + 64), *(double *)(a1 + 72));
      v25 = v3;
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:scale:", v3, 1.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      v19 = 1;
      v20 = MEMORY[0x1E0C809B0];
      do
      {
        v21 = v19;
        v22 = (void *)MEMORY[0x1E0C944B0];
        v26[0] = v20;
        v26[1] = 3221225472;
        v26[2] = __85__NTKCompanionResourceDirectoryEditor__transcodeStillImageOf_forPhoto_withCrop_into___block_invoke_3;
        v26[3] = &unk_1E6BD5F30;
        v27 = *(id *)(a1 + 40);
        v29 = v18;
        v15 = v17;
        v28 = v15;
        objc_msgSend(v22, "enumerateSizeClasses:", v26);

        v19 = 0;
        v18 = 1;
      }
      while ((v21 & 1) != 0);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      v4 = v24;
      v3 = v25;
      v12 = v23;
      v14 = 0;
    }

    objc_autoreleasePoolPop(v4);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __85__NTKCompanionResourceDirectoryEditor__transcodeStillImageOf_forPhoto_withCrop_into___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "analysisForAlignment:deviceSizeClass:", *(_QWORD *)(a1 + 48), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = *(void **)(a1 + 32);
    +[NTKPhotoAnalysis analysisWithImage:alignment:deviceSizeClass:](NTKPhotoAnalysis, "analysisWithImage:alignment:deviceSizeClass:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnalysis:alignment:deviceSizeClass:", v6, *(_QWORD *)(a1 + 48), a2);

  }
}

+ (id)_createResourceDirectoryWithAsset:(id)a3 assetCollection:(id)a4 forDevice:(id)a5 previewOnly:(BOOL)a6
{
  _BOOL8 v6;
  unint64_t v10;
  unint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a6;
  v10 = (unint64_t)a3;
  v11 = (unint64_t)a4;
  v12 = a5;
  if (v10 | v11)
  {
    NTKPhotosCreateResourceDirectory();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v13 = 0;
LABEL_14:

      goto LABEL_15;
    }
    if (v10)
    {
      NTKPhotosDefaultCropForAsset((void *)v10, v12);
      objc_msgSend(a1, "_transcodeAsset:withCrop:into:previewOnly:", v10, v14, v6);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeItemAtPath:error:", v14, 0);
LABEL_13:

        goto LABEL_14;
      }
      v15 = (void *)objc_opt_new();
      objc_msgSend(v13, "encodeAsDictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v16);

    }
    else
    {
      v15 = (void *)objc_opt_new();
    }
    if ((NTKPhotosWriteImageListForAssetCollection(v15, (void *)v11, v14) & 1) != 0)
    {
      v13 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeItemAtPath:error:", v14, 0);

      v13 = 0;
    }
    goto LABEL_13;
  }
  v13 = 0;
LABEL_15:

  return v13;
}

+ (BOOL)_transcodeIrisVideoOf:(id)a3 forPhoto:(id)a4 withCrop:(CGRect)a5 into:(id)a6 previewOnly:(BOOL)a7
{
  _BOOL4 v7;
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  dispatch_semaphore_t v27;
  void *v28;
  void *v29;
  void *v30;
  NTKCompanionIrisVideoExportSession *v31;
  void *v32;
  double v33;
  double v34;
  NTKCompanionIrisVideoExportSession *v35;
  id v36;
  NTKCompanionIrisVideoExportSession *v37;
  id v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *context;
  CMTime v47;
  CMTime time;
  _QWORD v49[4];
  id v50;
  NTKCompanionIrisVideoExportSession *v51;
  id v52;
  NSObject *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;

  v7 = a7;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  if (!NTKPhotosIsPHAssetIris(v15) || v7)
  {
    objc_msgSend(v16, "setIsIris:", 0);
    objc_msgSend(v16, "setIrisVideoURL:", 0);
    objc_msgSend(v16, "setIrisDuration:", 0.0);
    objc_msgSend(v16, "setIrisStillDisplayTime:", 0.0);
    v26 = 1;
  }
  else
  {
    context = (void *)MEMORY[0x1BCCA7FA8]();
    objc_msgSend(v16, "setIsIris:", 1);
    objc_msgSend(v16, "imageURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v16, "imageURL");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v19, "stringWithUTF8String:", objc_msgSend(v20, "fileSystemRepresentation"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v22, "stringByDeletingPathExtension");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@.mov"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "UUIDString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v27 = dispatch_semaphore_create(0);
    v55 = 0;
    v56 = &v55;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__36;
    v59 = __Block_byref_object_dispose__36;
    v60 = 0;
    v28 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v17, "stringByAppendingPathComponent:", v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "fileURLWithPath:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = [NTKCompanionIrisVideoExportSession alloc];
    objc_msgSend(a1, "_videoAssetOf:", v15);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_watchPhotoVideoSize");
    v35 = -[NTKCompanionIrisVideoExportSession initWithVideo:crop:outputSize:bitrate:outputURL:](v31, "initWithVideo:crop:outputSize:bitrate:outputURL:", v32, 300000, v30, x, y, width, height, v33, v34);

    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __96__NTKCompanionResourceDirectoryEditor__transcodeIrisVideoOf_forPhoto_withCrop_into_previewOnly___block_invoke;
    v49[3] = &unk_1E6BD5F80;
    v36 = v30;
    v50 = v36;
    v37 = v35;
    v51 = v37;
    v54 = &v55;
    v38 = v15;
    v52 = v38;
    v39 = v27;
    v53 = v39;
    -[NTKCompanionIrisVideoExportSession exportAsynchronouslyWithCompletion:](v37, "exportAsynchronouslyWithCompletion:", v49);
    dispatch_semaphore_wait(v39, 0xFFFFFFFFFFFFFFFFLL);
    v40 = v56[5];
    v26 = v40 == 0;
    if (!v40)
    {
      objc_msgSend(v16, "setIrisVideoURL:", v36);
      objc_msgSend(v38, "photoIrisProperties");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (v41)
        objc_msgSend(v41, "photoIrisVideoDuration");
      else
        memset(&time, 0, sizeof(time));
      objc_msgSend(v16, "setIrisDuration:", CMTimeGetSeconds(&time));

      objc_msgSend(v38, "photoIrisProperties");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v43;
      if (v43)
        objc_msgSend(v43, "photoIrisStillDisplayTime");
      else
        memset(&v47, 0, sizeof(v47));
      objc_msgSend(v16, "setIrisStillDisplayTime:", CMTimeGetSeconds(&v47));

    }
    _Block_object_dispose(&v55, 8);

    objc_autoreleasePoolPop(context);
  }

  return v26;
}

intptr_t __96__NTKCompanionResourceDirectoryEditor__transcodeIrisVideoOf_forPhoto_withCrop_into_previewOnly___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "transcoded video to %@", (uint8_t *)&v9, 0xCu);
  }

  if (objc_msgSend(*(id *)(a1 + 40), "status") == 4)
  {
    objc_msgSend(*(id *)(a1 + 40), "error");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __96__NTKCompanionResourceDirectoryEditor__transcodeIrisVideoOf_forPhoto_withCrop_into_previewOnly___block_invoke_cold_1(a1, a1 + 64, v7);

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

+ (id)_writeAsset:(id)a3 image:(id)a4 withImageCrop:(CGRect)a5 to:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  UIImage *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  char v42;
  void *v43;
  void *v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  UIImage *v50;
  uint64_t v51;
  id v52[2];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a3;
  v13 = (UIImage *)a4;
  v14 = a6;
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@.jpg"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  UIImageJPEGRepresentation(v13, 0.85);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v14, "stringByAppendingPathComponent:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = 0;
    objc_msgSend(v19, "writeToFile:options:error:", v20, 0, v52);
    v21 = v52[0];
    if (v21)
    {
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        +[NTKCompanionResourceDirectoryEditor _writeAsset:image:withImageCrop:to:].cold.2((uint64_t)v18, v22);

      v23 = 0;
    }
    else
    {
      v31 = (void *)objc_opt_new();
      v46 = v14;
      v47 = v12;
      v45 = v19;
      if (v12)
      {
        objc_msgSend(v12, "localIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setLocalIdentifier:", v32);

        objc_msgSend(v12, "modificationDate");
      }
      else
      {
        v33 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "UUIDString");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("Temp-%@"), v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setLocalIdentifier:", v36);

        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setModificationDate:", v37);

      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v20);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setImageURL:", v38);

      objc_msgSend(v31, "setOriginalCrop:", x, y, width, height);
      objc_msgSend(v31, "setCrop:", x, y, width, height);
      v39 = 0;
      v40 = 1;
      v41 = MEMORY[0x1E0C809B0];
      do
      {
        v42 = v40;
        v43 = (void *)MEMORY[0x1E0C944B0];
        v48[0] = v41;
        v48[1] = 3221225472;
        v48[2] = __74__NTKCompanionResourceDirectoryEditor__writeAsset_image_withImageCrop_to___block_invoke;
        v48[3] = &unk_1E6BD5F30;
        v23 = v31;
        v49 = v23;
        v50 = v13;
        v51 = v39;
        objc_msgSend(v43, "enumerateSizeClasses:", v48);

        v40 = 0;
        v39 = 1;
      }
      while ((v42 & 1) != 0);
      v14 = v46;
      v12 = v47;
      v19 = v45;
      v21 = 0;
    }

  }
  else
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[NTKCompanionResourceDirectoryEditor _writeAsset:image:withImageCrop:to:].cold.1(v21, v24, v25, v26, v27, v28, v29, v30);
    v23 = 0;
  }

  return v23;
}

void __74__NTKCompanionResourceDirectoryEditor__writeAsset_image_withImageCrop_to___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v4;
  id v5;

  v4 = (void *)a1[4];
  +[NTKPhotoAnalysis analysisWithImage:alignment:deviceSizeClass:](NTKPhotoAnalysis, "analysisWithImage:alignment:deviceSizeClass:", a1[5], a1[6], a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnalysis:alignment:deviceSizeClass:", v5, a1[6], a2);

}

+ (id)_scaleImage:(id)a3 toLongestEdgeInPixels:(double)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  id v21;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGSize v25;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "size");
    v8 = v7;
    v10 = v9;
    objc_msgSend(v6, "scale");
    v12 = v11;
    objc_msgSend(v6, "scale");
    CGAffineTransformMakeScale(&v24, v12, v13);
    v14 = v10 * v24.c + v24.a * v8;
    v15 = v10 * v24.d + v24.b * v8;
    v16 = a4 / v14;
    if (a4 / v14 >= a4 / v15)
      v16 = a4 / v15;
    if (v16 >= 1.0)
    {
      v21 = v6;
    }
    else
    {
      CGAffineTransformMakeScale(&v23, v16, v16);
      v17 = v15 * v23.c + v23.a * v14;
      v18 = v15 * v23.d + v23.b * v14;
      v19 = *MEMORY[0x1E0C9D538];
      v20 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v25.width = v17;
      v25.height = v18;
      UIGraphicsBeginImageContextWithOptions(v25, 0, 1.0);
      objc_msgSend(v6, "drawInRect:", v19, v20, v17, v18);
      UIGraphicsGetImageFromCurrentImageContext();
      v21 = (id)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)_videoAssetOf:(id)a3
{
  id v3;
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  intptr_t (*v15)(uint64_t, uint64_t);
  void *v16;
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CD1808]);
  objc_msgSend(v4, "setVersion:", 0);
  objc_msgSend(v4, "setDeliveryMode:", 1);
  objc_msgSend(v4, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v4, "setVideoComplementAllowed:", 1);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__36;
  v23 = __Block_byref_object_dispose__36;
  v24 = 0;
  v5 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __53__NTKCompanionResourceDirectoryEditor__videoAssetOf___block_invoke;
  v16 = &unk_1E6BD5FA8;
  v18 = &v19;
  v7 = v5;
  v17 = v7;
  objc_msgSend(v6, "requestURLForVideo:options:resultHandler:", v3, v4, &v13);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "localIdentifier", v13, v14, v15, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v20[5], "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = v9;
    v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "_videoAssetOf: %@ ==> %@", buf, 0x16u);

  }
  v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

intptr_t __53__NTKCompanionResourceDirectoryEditor__videoAssetOf___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)_cropAndScaleUIImage:(id)a3 cropRect:(CGRect)a4 outputSize:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  double y;
  double x;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  NSObject *v25;
  double v27;
  double v28;
  double v29;
  double v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;
  uint64_t v48;
  CGSize v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  height = a5.height;
  width = a5.width;
  v7 = a4.size.height;
  v8 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v48 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v49.width = width;
  v49.height = height;
  UIGraphicsBeginImageContextWithOptions(v49, 0, 1.0);
  if (width / v8 >= height / v7)
    v12 = width / v8;
  else
    v12 = height / v7;
  CGAffineTransformMakeScale(&v33, 1.0 / v12, 1.0 / v12);
  v50.origin.x = 0.0;
  v50.origin.y = 0.0;
  v50.size.width = width;
  v50.size.height = height;
  v51 = CGRectApplyAffineTransform(v50, &v33);
  v29 = v8;
  v30 = v7;
  v27 = x;
  v28 = y;
  v13 = x + fmax((v8 - v51.size.width) * 0.5, 0.0);
  v14 = y + fmax((v7 - v51.size.height) * 0.5, 0.0);
  objc_msgSend(v11, "size");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v11, "scale");
  v20 = v19;
  objc_msgSend(v11, "scale");
  CGAffineTransformMakeScale(&v32, v20, v21);
  v22 = v18 * v32.c + v32.a * v16;
  v23 = v18 * v32.d + v32.b * v16;
  CGAffineTransformMakeScale(&v31, v12, v12);
  v52.origin.x = -v13;
  v52.origin.y = -v14;
  v52.size.width = v22;
  v52.size.height = v23;
  v53 = CGRectApplyAffineTransform(v52, &v31);
  objc_msgSend(v11, "drawInRect:", v53.origin.x, v53.origin.y, v53.size.width, v53.size.height);
  UIGraphicsGetImageFromCurrentImageContext();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  if (!v24)
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413826;
      v35 = v11;
      v36 = 2048;
      v37 = v27;
      v38 = 2048;
      v39 = v28;
      v40 = 2048;
      v41 = v29;
      v42 = 2048;
      v43 = v30;
      v44 = 2048;
      v45 = width;
      v46 = 2048;
      v47 = height;
      _os_log_error_impl(&dword_1B72A3000, v25, OS_LOG_TYPE_ERROR, "Cannot crop and scale image %@, crop { %.2f, %.2f, %.2f, %2.f } to size { %.2f, %.2f }", buf, 0x48u);
    }

  }
  return v24;
}

+ (void)_imageDataForAsset:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  dispatch_get_global_queue(25, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__NTKCompanionResourceDirectoryEditor__imageDataForAsset_completion___block_invoke;
  v10[3] = &unk_1E6BD00B0;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __69__NTKCompanionResourceDirectoryEditor__imageDataForAsset_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v3, "setVersion:", 0);
  objc_msgSend(v3, "setDeliveryMode:", 1);
  objc_msgSend(v3, "setNetworkAccessAllowed:", 1);
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__NTKCompanionResourceDirectoryEditor__imageDataForAsset_completion___block_invoke_2;
  v12[3] = &unk_1E6BD5FD0;
  v5 = v2;
  v13 = v5;
  objc_msgSend(v3, "setProgressHandler:", v12);
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __69__NTKCompanionResourceDirectoryEditor__imageDataForAsset_completion___block_invoke_49;
  v9[3] = &unk_1E6BD5FF8;
  v10 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v8 = v5;
  objc_msgSend(v6, "requestImageDataAndOrientationForAsset:options:resultHandler:", v7, v3, v9);

}

void __69__NTKCompanionResourceDirectoryEditor__imageDataForAsset_completion___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  double v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138412802;
      v11 = v8;
      v12 = 2048;
      v13 = a3 * 100.0;
      v14 = 2112;
      v15 = v5;
      _os_log_error_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_ERROR, "Failed to download asset %@, progress: %.0f%%, error: %@", (uint8_t *)&v10, 0x20u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138412546;
    v11 = v9;
    v12 = 2048;
    v13 = a3 * 100.0;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "Downloading asset %@, progress: %.0f%%", (uint8_t *)&v10, 0x16u);
  }

}

void __69__NTKCompanionResourceDirectoryEditor__imageDataForAsset_completion___block_invoke_49(uint64_t a1, void *a2, uint64_t a3, int a4, void *a5)
{
  id v8;
  void *v9;
  NSObject *v10;
  id v11;

  v8 = a2;
  objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __69__NTKCompanionResourceDirectoryEditor__imageDataForAsset_completion___block_invoke_49_cold_1(a1, (uint64_t)v9, v10);

    v11 = 0;
  }
  else
  {
    NTKCGImagePropertyOrientationToUIImageOrientation(a4);
    v11 = v8;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (void)_imageForAsset:(id)a3 forSize:(CGSize)a4 completion:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  CGFloat v16;
  CGFloat v17;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v9 = a5;
  dispatch_get_global_queue(25, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__NTKCompanionResourceDirectoryEditor__imageForAsset_forSize_completion___block_invoke;
  v13[3] = &unk_1E6BD4350;
  v16 = width;
  v17 = height;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __73__NTKCompanionResourceDirectoryEditor__imageForAsset_forSize_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v3, "setVersion:", 0);
  objc_msgSend(v3, "setDeliveryMode:", 1);
  objc_msgSend(v3, "setNetworkAccessAllowed:", 1);
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__NTKCompanionResourceDirectoryEditor__imageForAsset_forSize_completion___block_invoke_2;
  v10[3] = &unk_1E6BD5FD0;
  v11 = v2;
  v5 = v2;
  objc_msgSend(v3, "setProgressHandler:", v10);
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __73__NTKCompanionResourceDirectoryEditor__imageForAsset_forSize_completion___block_invoke_51;
  v8[3] = &unk_1E6BD6020;
  v7 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v6, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v7, 1, v3, v8, *(double *)(a1 + 48), *(double *)(a1 + 56));

}

void __73__NTKCompanionResourceDirectoryEditor__imageForAsset_forSize_completion___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  double v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138412802;
      v11 = v8;
      v12 = 2048;
      v13 = a3 * 100.0;
      v14 = 2112;
      v15 = v5;
      _os_log_error_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_ERROR, "Failed to download asset %@, progress: %.0f%%, error: %@", (uint8_t *)&v10, 0x20u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138412546;
    v11 = v9;
    v12 = 2048;
    v13 = a3 * 100.0;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "Downloading asset %@, progress: %.0f%%", (uint8_t *)&v10, 0x16u);
  }

}

void __73__NTKCompanionResourceDirectoryEditor__imageForAsset_forSize_completion___block_invoke_51(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = 0;
  else
    v6 = v7;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (CGSize)_watchPhotoImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 384.0;
  v3 = 480.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)_watchPhotoVideoSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 320.0;
  v3 = 400.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (unint64_t)_subsampleFactorForScale:(double)a3
{
  uint64_t v3;

  v3 = 2;
  if (a3 > 0.5)
    v3 = 1;
  return v3 << (a3 <= 0.25) << (a3 <= 0.125);
}

+ (id)_subsampledImageWithData:(id)a3 orientation:(int64_t)a4 subsampleFactor:(unint64_t)a5
{
  CGImageSourceRef v7;
  CGImageSource *v8;
  void *v9;
  const __CFDictionary *v10;
  CGImageRef ImageAtIndex;
  CGImageRef v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v7 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  if (v7)
  {
    v8 = v7;
    v30 = *MEMORY[0x1E0CBD290];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    ImageAtIndex = CGImageSourceCreateImageAtIndex(v8, 0, v10);
    if (ImageAtIndex)
    {
      v12 = ImageAtIndex;
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", ImageAtIndex, a4, 1.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v12);
    }
    else
    {
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        +[NTKCompanionResourceDirectoryEditor _subsampledImageWithData:orientation:subsampleFactor:].cold.2(v21, v22, v23, v24, v25, v26, v27, v28);

      v13 = 0;
    }
    CFRelease(v8);
  }
  else
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      +[NTKCompanionResourceDirectoryEditor _subsampledImageWithData:orientation:subsampleFactor:].cold.1(v10, v14, v15, v16, v17, v18, v19, v20);
    v13 = 0;
  }

  return v13;
}

- (CLKDevice)device
{
  return self->_device;
}

- (NSString)resourceDirectory
{
  return self->_resourceDirectory;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)galleryPreviewResourceDirectory
{
  return self->_galleryPreviewResourceDirectory;
}

- (void)setGalleryPreviewResourceDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_galleryPreviewResourceDirectory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryPreviewResourceDirectory, 0);
  objc_storeStrong((id *)&self->_resourceDirectory, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

void __85__NTKCompanionResourceDirectoryEditor__transcodeStillImageOf_forPhoto_withCrop_into___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_2(&dword_1B72A3000, a3, (uint64_t)a3, "cannot save transcoded jpeg to %@, error %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void __96__NTKCompanionResourceDirectoryEditor__transcodeIrisVideoOf_forPhoto_withCrop_into_previewOnly___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 48), "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40);
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_2(&dword_1B72A3000, a3, v7, "failed to transcode iris video for %@, error = %@", (uint8_t *)&v8);

}

+ (void)_writeAsset:(uint64_t)a3 image:(uint64_t)a4 withImageCrop:(uint64_t)a5 to:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "_writeAsset: cannot encode jpeg data", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_1();
}

+ (void)_writeAsset:(uint64_t)a1 image:(NSObject *)a2 withImageCrop:to:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "_writeAsset: cannot save transcoded jpeg to %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __69__NTKCompanionResourceDirectoryEditor__imageDataForAsset_completion___block_invoke_49_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_2(&dword_1B72A3000, a3, (uint64_t)a3, "cannot retrieve data for asset %@, error %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

+ (void)_subsampledImageWithData:(uint64_t)a3 orientation:(uint64_t)a4 subsampleFactor:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "_subsampledImageWithData: Could not create imageSourceRef", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_1();
}

+ (void)_subsampledImageWithData:(uint64_t)a3 orientation:(uint64_t)a4 subsampleFactor:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "_subsampledImageWithData: Could not create imageRef", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_1();
}

@end
