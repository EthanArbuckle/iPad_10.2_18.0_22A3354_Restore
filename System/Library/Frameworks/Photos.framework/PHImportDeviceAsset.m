@implementation PHImportDeviceAsset

- (PHImportDeviceAsset)initWithSource:(id)a3 cameraFile:(id)a4 type:(id)a5 supportedMediaType:(unsigned __int8)a6
{
  uint64_t v6;
  id v11;
  id v12;
  PHImportDeviceAsset *v13;
  PHImportDeviceAsset *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  objc_super v30;

  v6 = a6;
  v11 = a4;
  v12 = a5;
  v30.receiver = self;
  v30.super_class = (Class)PHImportDeviceAsset;
  v13 = -[PHImportAsset initWithSource:](&v30, sel_initWithSource_, a3);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_cameraFile, a4);
    objc_msgSend(v11, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImportAsset setFileName:](v14, "setFileName:", v15);

    objc_msgSend(v11, "createdFilename");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImportAsset setCreatedFileName:](v14, "setCreatedFileName:", v16);

    -[PHImportAsset setFileSize:](v14, "setFileSize:", objc_msgSend(v11, "fileSize"));
    objc_msgSend(v11, "fileCreationDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[PHImportAsset setFileCreationDate:](v14, "setFileCreationDate:", v17);
    }
    else
    {
      objc_msgSend(v11, "creationDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHImportAsset setFileCreationDate:](v14, "setFileCreationDate:", v18);

    }
    objc_msgSend(v11, "fileModificationDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[PHImportAsset setFileModificationDate:](v14, "setFileModificationDate:", v19);
    }
    else
    {
      objc_msgSend(v11, "modificationDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHImportAsset setFileModificationDate:](v14, "setFileModificationDate:", v20);

    }
    objc_msgSend(v11, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pathExtension");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImportAsset setFileExtension:](v14, "setFileExtension:", v22);

    objc_msgSend(v11, "UTI");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    if (v12)
      v26 = v12;
    else
      v26 = (id)v24;
    if (-[PHImportAsset configureWithContentType:supportedMediaType:](v14, "configureWithContentType:supportedMediaType:", v26, v6))
    {
      -[PHImportAsset uuid](v14, "uuid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "userData");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, CFSTR("uuid"));

    }
    else
    {
      v27 = v14;
      v14 = 0;
    }

  }
  return v14;
}

- (BOOL)containsDateKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CBCB50]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CBD090]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *MEMORY[0x1E0CBD088];
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CBD088]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(v4, "objectForKey:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CBCB40]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v11 = *MEMORY[0x1E0CBCB38];
          v12 = v4;
LABEL_18:
          objc_msgSend(v12, "objectForKey:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v14 != 0;

          v10 = 0;
          goto LABEL_19;
        }
        goto LABEL_16;
      }
      goto LABEL_14;
    }
  }
  else if (v5)
  {
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CBD088]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(v6, "objectForKey:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CBCB40]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v11 = *MEMORY[0x1E0CBCB38];
          v12 = v6;
          goto LABEL_18;
        }
LABEL_16:
        v13 = 1;
LABEL_19:

        v9 = 0;
        goto LABEL_20;
      }
LABEL_14:
      v13 = 1;
LABEL_20:

      v8 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CBD088]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(v3, "objectForKey:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CBCB40]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v11 = *MEMORY[0x1E0CBCB38];
          v12 = v3;
          goto LABEL_18;
        }
        goto LABEL_16;
      }
      goto LABEL_14;
    }
  }
  v13 = 1;
LABEL_21:

  return v13;
}

- (id)representedObject
{
  return self->_cameraFile;
}

- (BOOL)canPreserveFolderStructure
{
  return 0;
}

- (id)parentFolderPath
{
  void *v2;
  void *v3;

  -[ICCameraFile parentFolder](self->_cameraFile, "parentFolder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canReference
{
  return 0;
}

- (BOOL)canDelete
{
  int v3;
  void *v4;

  if ((-[ICCameraFile isLocked](self->_cameraFile, "isLocked") & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[ICCameraFile device](self->_cameraFile, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "iCloudPhotosEnabled") ^ 1;

  }
  return v3;
}

- (BOOL)isRAW
{
  return -[ICCameraFile isRaw](self->_cameraFile, "isRaw");
}

- (BOOL)isLivePhoto
{
  objc_super v4;

  -[PHImportAsset loadSidecarFiles](self, "loadSidecarFiles");
  v4.receiver = self;
  v4.super_class = (Class)PHImportDeviceAsset;
  return -[PHImportAsset isLivePhoto](&v4, sel_isLivePhoto);
}

- (BOOL)hasAudioAttachment
{
  objc_super v4;

  -[PHImportAsset loadSidecarFiles](self, "loadSidecarFiles");
  v4.receiver = self;
  v4.super_class = (Class)PHImportDeviceAsset;
  return -[PHImportAsset hasAudioAttachment](&v4, sel_hasAudioAttachment);
}

- (BOOL)isSloMo
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (!-[PHImportAsset isMovie](self, "isMovie"))
    return 0;
  v3 = -[ICCameraFile highFramerate](self->_cameraFile, "highFramerate");
  -[ICCameraFile device](self->_cameraFile, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && v5)
  {
    if ((int)objc_msgSend(v5, "intValue") > 7)
    {
      v3 = 0;
    }
    else
    {
      -[PHImportAsset loadSidecarFiles](self, "loadSidecarFiles");
      -[PHImportAsset slmSidecar](self, "slmSidecar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v6 != 0;

    }
  }

  return v3;
}

- (BOOL)isRender
{
  void *v2;
  void *v4;
  int v5;
  BOOL v6;
  objc_super v8;

  -[PHImportAsset source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAppleDevice");
  if (v5
    && (-[ICCameraFile relatedUUID](self->_cameraFile, "relatedUUID"),
        (v2 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PHImportDeviceAsset;
    v6 = -[PHImportAsset isRender](&v8, sel_isRender);
    if (!v5)
      goto LABEL_7;
  }

LABEL_7:
  return v6;
}

- (BOOL)isSpatialOverCapture
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[ICCameraFile spatialOverCaptureGroupID](self->_cameraFile, "spatialOverCaptureGroupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)PHImportDeviceAsset;
    v4 = -[PHImportAsset isSpatialOverCapture](&v6, sel_isSpatialOverCapture);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isBase
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHImportDeviceAsset;
  return -[PHImportAsset isBase](&v3, sel_isBase);
}

- (BOOL)performAdditionalLivePhotoChecksWithImageAsset:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[ICCameraFile device](self->_cameraFile, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAppleDevice");

  if (v6)
  {
    objc_msgSend(v4, "representedObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sidecarFiles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "containsObject:", self->_cameraFile) & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      -[ICCameraFile sidecarFiles](self->_cameraFile, "sidecarFiles");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "representedObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "containsObject:", v11);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isTagged
{
  return -[ICCameraFile isLocked](self->_cameraFile, "isLocked");
}

- (BOOL)isViewable
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[PHImportAsset isImage](self, "isImage"))
    return 1;
  -[PHImportAsset url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)PHImportDeviceAsset;
  return -[PHImportAsset isViewable](&v6, sel_isViewable);
}

- (id)securityScopedURL
{
  dispatch_semaphore_t v3;
  ICCameraFile *cameraFile;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  PHImportDeviceAsset *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__21392;
  v29 = __Block_byref_object_dispose__21393;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__21392;
  v23 = __Block_byref_object_dispose__21393;
  v24 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = dispatch_semaphore_create(0);
    cameraFile = self->_cameraFile;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __40__PHImportDeviceAsset_securityScopedURL__block_invoke;
    v15[3] = &unk_1E35DB610;
    v17 = &v25;
    v18 = &v19;
    v5 = v3;
    v16 = v5;
    -[ICCameraFile requestSecurityScopedURLWithCompletion:](cameraFile, "requestSecurityScopedURLWithCompletion:", v15);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  }
  if (!v26[5] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0C99E98];
    -[ICCameraFile valueForKey:](self->_cameraFile, "valueForKey:", CFSTR("fileSystemPath"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURLWithPath:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v26[5];
    v26[5] = v8;

  }
  v10 = (void *)v26[5];
  if (!v10)
  {
    PLImportGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = v20[5];
      *(_DWORD *)buf = 138412546;
      v32 = self;
      v33 = 2112;
      v34 = v12;
      _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_ERROR, "Failed to get a security-scoped URL for %@ (Error: %@)", buf, 0x16u);
    }

    v10 = (void *)v26[5];
  }
  v13 = v10;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v13;
}

- (id)creationDate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  PLImportGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImportAsset metadata](self, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14.receiver = self;
    v14.super_class = (Class)PHImportDeviceAsset;
    -[PHImportAsset creationDate](&v14, sel_creationDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraFile creationDate](self->_cameraFile, "creationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v16 = v4;
    v17 = 2048;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "Getting creation date from ICCameraFile for '%@': super.creationDate (_metadata == %p): %@, creationDate: %@", buf, 0x2Au);

  }
  v13.receiver = self;
  v13.super_class = (Class)PHImportDeviceAsset;
  -[PHImportAsset creationDate](&v13, sel_creationDate);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[ICCameraFile creationDate](self->_cameraFile, "creationDate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (unsigned)orientation
{
  unsigned int result;
  objc_super v4;

  result = -[ICCameraFile orientation](self->_cameraFile, "orientation");
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)PHImportDeviceAsset;
    return -[PHImportAsset orientation](&v4, sel_orientation);
  }
  return result;
}

- (CGSize)exifPixelSize
{
  ICEXIFOrientationType v3;
  ICCameraFile *cameraFile;
  double v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;
  CGSize result;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[ICCameraFile width](self->_cameraFile, "width") && -[ICCameraFile height](self->_cameraFile, "height"))
  {
    v3 = -[ICCameraFile orientation](self->_cameraFile, "orientation");
    cameraFile = self->_cameraFile;
    if (v3 < ICEXIFOrientation5)
    {
      v5 = (double)-[ICCameraFile width](cameraFile, "width");
      v6 = -[ICCameraFile height](self->_cameraFile, "height");
    }
    else
    {
      v5 = (double)-[ICCameraFile height](cameraFile, "height");
      v6 = -[ICCameraFile width](self->_cameraFile, "width");
    }
    v9 = (double)v6;
  }
  else
  {
    PLImportGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v8;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "ICCameraFile for %{public}@ has a zero width/height", buf, 0xCu);

    }
    v12.receiver = self;
    v12.super_class = (Class)PHImportDeviceAsset;
    -[PHImportAsset exifPixelSize](&v12, sel_exifPixelSize);
    v5 = v10;
  }
  v11 = v5;
  result.height = v9;
  result.width = v11;
  return result;
}

- (CGSize)orientedPixelSize
{
  double v3;
  double v4;
  CGSize result;

  -[PHImportDeviceAsset orientation](self, "orientation");
  -[PHImportDeviceAsset exifPixelSize](self, "exifPixelSize");
  PFOrientationTransformImageSize();
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)burstUUID
{
  void *v3;
  objc_super v5;

  if (-[PHImportAsset isImage](self, "isImage"))
  {
    v5.receiver = self;
    v5.super_class = (Class)PHImportDeviceAsset;
    -[PHImportAsset burstUUID](&v5, sel_burstUUID);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[ICCameraFile burstUUID](self->_cameraFile, "burstUUID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (int)burstPickType
{
  int result;
  int v4;
  _BOOL4 v5;
  int v6;

  result = -[PHImportAsset isBurst](self, "isBurst");
  if (result)
  {
    if (-[ICCameraFile burstFavorite](self->_cameraFile, "burstFavorite"))
      v4 = 8;
    else
      v4 = 0;
    if (-[ICCameraFile burstPicked](self->_cameraFile, "burstPicked"))
      v4 |= 4u;
    v5 = -[ICCameraFile firstPicked](self->_cameraFile, "firstPicked");
    v6 = v4 | 0x20;
    if (!v5)
      v6 = v4;
    if (v6)
      return v6;
    else
      return 2;
  }
  return result;
}

- (id)livePhotoPairingIdentifier
{
  void *v3;
  objc_super v5;

  -[ICCameraFile groupUUID](self->_cameraFile, "groupUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PHImportDeviceAsset;
    -[PHImportAsset livePhotoPairingIdentifier](&v5, sel_livePhotoPairingIdentifier);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)spatialOverCaptureIdentifier
{
  void *v3;
  objc_super v5;

  -[ICCameraFile spatialOverCaptureGroupID](self->_cameraFile, "spatialOverCaptureGroupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PHImportDeviceAsset;
    -[PHImportAsset spatialOverCaptureIdentifier](&v5, sel_spatialOverCaptureIdentifier);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)durationTimeInterval
{
  double v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[ICCameraFile duration](self->_cameraFile, "duration");
  if (v3 == 0.0)
  {
    v7.receiver = self;
    v7.super_class = (Class)PHImportDeviceAsset;
    -[PHImportAsset durationTimeInterval](&v7, sel_durationTimeInterval);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[ICCameraFile duration](self->_cameraFile, "duration");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)createMetadataFromProperties:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    PLImportGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v14;
      _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_ERROR, "Didn't get metadata for %{public}@", (uint8_t *)&v20, 0xCu);

    }
    goto LABEL_20;
  }
  v4 = objc_msgSend(a3, "mutableCopy");
  if (!-[PHImportDeviceAsset containsDateKey:](self, "containsDateKey:", v4))
  {
    -[ICCameraFile exifCreationDate](self->_cameraFile, "exifCreationDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
      -[ICCameraFile fileCreationDate](self->_cameraFile, "fileCreationDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PFStringFromDateTimeZoneFormat();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    if (v8)
      -[NSObject setObject:forKey:](v4, "setObject:forKey:", v8, *MEMORY[0x1E0CBD088]);

  }
  if (!-[PHImportAsset isImage](self, "isImage"))
  {
    if (-[PHImportAsset isMovie](self, "isMovie"))
    {
      v15 = objc_alloc(MEMORY[0x1E0D75140]);
      -[PHImportAsset contentType](self, "contentType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHImportAsset source](self, "source");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeZoneLookup");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v15, "initWithImageCaptureMovieProperties:contentType:timeZoneLookup:", v4, v10, v12);
      goto LABEL_16;
    }
    PLImportGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v18;
      _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "Unexpected asset type for ICC properties (%{public}@)", (uint8_t *)&v20, 0xCu);

    }
LABEL_20:
    v16 = 0;
    goto LABEL_21;
  }
  v9 = objc_alloc(MEMORY[0x1E0D75140]);
  -[PHImportAsset contentType](self, "contentType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportAsset source](self, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeZoneLookup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "initWithImageProperties:contentType:timeZoneLookup:", v4, v10, v12);
LABEL_16:
  v16 = (void *)v13;

LABEL_21:
  return v16;
}

- (void)loadMetadataSync
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  NSObject *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__PHImportDeviceAsset_loadMetadataSync__block_invoke;
  v8[3] = &unk_1E35DF110;
  v4 = v3;
  v9 = v4;
  -[PHImportDeviceAsset loadMetadataAsync:](self, "loadMetadataAsync:", v8);
  v5 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v4, v5))
  {
    PLImportGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "Timed out getting metadata for %{public}@ from ImageCapture", buf, 0xCu);

    }
  }

}

- (void)loadMetadataAsync:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PHImportAssetMetadataRequest *v10;
  void *v11;
  _QWORD v12[4];
  void (**v13)(_QWORD);
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  PLImportGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[PHImportAsset fileName](self, "fileName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v16 = "-[PHImportDeviceAsset loadMetadataAsync:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "%s - %@", buf, 0x16u);

  }
  -[PHImportAsset metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    -[PHImportAsset url](self, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v14.receiver = self;
      v14.super_class = (Class)PHImportDeviceAsset;
      -[PHImportAsset loadMetadataAsync:](&v14, sel_loadMetadataAsync_, v4);
    }
    else
    {
      v10 = -[PHImportAssetDataRequest initWithAsset:]([PHImportAssetMetadataRequest alloc], "initWithAsset:", self);
      -[PHImportAssetDataRequest setAsset:](v10, "setAsset:", self);
      -[PHImportAsset source](self, "source");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __41__PHImportDeviceAsset_loadMetadataAsync___block_invoke;
      v12[3] = &unk_1E35DA968;
      v13 = v4;
      objc_msgSend(v11, "fetchMetadataUsingRequest:withCompletion:", v10, v12);

    }
  }

}

- (void)thumbnailUsingRequest:(id)a3 atEnd:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLImportGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v17 = "-[PHImportDeviceAsset thumbnailUsingRequest:atEnd:]";
    v18 = 2112;
    v19 = v9;
    v20 = 2048;
    v21 = objc_msgSend(v6, "longestSide");
    v22 = 2048;
    v23 = v6;
    _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEBUG, "%s - %@ (%lu), <%p>", buf, 0x2Au);

  }
  -[PHImportAsset url](self, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v15.receiver = self;
    v15.super_class = (Class)PHImportDeviceAsset;
    -[PHImportAsset thumbnailUsingRequest:atEnd:](&v15, sel_thumbnailUsingRequest_atEnd_, v6, v7);
  }
  else
  {
    -[PHImportAsset source](self, "source");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__PHImportDeviceAsset_thumbnailUsingRequest_atEnd___block_invoke;
    v13[3] = &unk_1E35DA990;
    v13[4] = self;
    v14 = v7;
    objc_msgSend(v12, "fetchThumbnailDataUsingRequest:withCompletion:", v6, v13);

  }
}

- (NSArray)cameraFiles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = (void *)objc_opt_new();
  -[PHImportDeviceAsset representedObject](self, "representedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[PHImportAsset largeRender](self, "largeRender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PHImportAsset largeRender](self, "largeRender");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cameraFiles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v7);

  }
  -[PHImportAsset rawAsset](self, "rawAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PHImportAsset rawAsset](self, "rawAsset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PHImportAsset videoComplement](self, "videoComplement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_8;
    -[PHImportAsset videoComplement](self, "videoComplement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v9;
  objc_msgSend(v9, "cameraFiles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v12);

LABEL_8:
  -[PHImportAsset audioAsset](self, "audioAsset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PHImportAsset audioAsset](self, "audioAsset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cameraFiles");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v15);

  }
  -[PHImportAsset adjustmentSidecar](self, "adjustmentSidecar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16
    || (-[PHImportAsset slmSidecar](self, "slmSidecar"), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[PHImportAsset xmpSidecar](self, "xmpSidecar"), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v16, "cameraFiles");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v17);

  }
  -[PHImportAsset originalAdjustmentSidecar](self, "originalAdjustmentSidecar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "cameraFiles");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v20);

  }
  return (NSArray *)v3;
}

- (void)copyToURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ICCameraFile *cameraFile;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "URLByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x1E0CBC238];
  v28[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLImportGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    -[PHImportAsset uuid](self, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PHDescriptionsForResourceTypes(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(","));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v24 = v10;
    v25 = 2112;
    v26 = v14;
    _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_DEBUG, "REQUESTING DOWNLOAD: asset: %@, %@", buf, 0x16u);

  }
  cameraFile = self->_cameraFile;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __51__PHImportDeviceAsset_copyToURL_completionHandler___block_invoke;
  v19[3] = &unk_1E35DA9B8;
  v19[4] = self;
  v20 = v7;
  v21 = v6;
  v16 = v6;
  v17 = v7;
  v18 = -[ICCameraFile requestDownloadWithOptions:completion:](cameraFile, "requestDownloadWithOptions:completion:", v8, v19);

}

- (id)originatingAssetID
{
  return -[ICCameraFile originatingAssetID](self->_cameraFile, "originatingAssetID");
}

- (id)fingerprint
{
  return (id)-[ICCameraFile fingerprint](self->_cameraFile, "fingerprint");
}

- (id)nameKey
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[PHImportAsset createdFileName](self, "createdFileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PHImportDeviceAsset;
    -[PHImportAsset nameKey](&v8, sel_nameKey);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraFile, 0);
}

void __51__PHImportDeviceAsset_copyToURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  PHImportException *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PHImportException *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  PHImportException *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = [PHImportException alloc];
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "originalFilename");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ (%@)"), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PHImportException initWithType:path:underlyingError:file:line:](v7, "initWithType:path:underlyingError:file:line:", 0, v11, v6, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportDeviceAsset.m", 499);

  }
  else
  {
    if (v5)
    {
      v13 = *(void **)(a1 + 40);
      if (v13)
      {
        objc_msgSend(v13, "URLByAppendingPathComponent:", v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 0;
        goto LABEL_10;
      }
      v15 = CFSTR("ICDownloadsDirectoryURL");
    }
    else
    {
      v15 = CFSTR("ICSavedFilename");
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Options is missing the '%@' key"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = [PHImportException alloc];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PHImportException initWithType:path:underlyingError:file:line:](v17, "initWithType:path:underlyingError:file:line:", 0, v18, v16, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportDeviceAsset.m", 505);

  }
  v14 = 0;
LABEL_10:
  PLImportGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "resourceType"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PHDescriptionsForResourceTypes(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "componentsJoinedByString:", CFSTR(","));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v20;
    v29 = 2112;
    v30 = v24;
    _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_DEBUG, "FINISHED DOWNLOAD: asset: %@, %@", buf, 0x16u);

    v5 = v25;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __51__PHImportDeviceAsset_thumbnailUsingRequest_atEnd___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  const __CFData *v7;
  id v8;
  __CFString *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  const __CFDictionary *v14;
  CGImageSource *v15;
  uint64_t v16;
  const __CFDictionary *v17;
  CGImageRef ThumbnailAtIndex;
  CFTypeRef v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  double v28;
  NSObject *v29;
  void *v30;
  void *v31;
  double v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  int v36;
  uint64_t v37;
  __int16 v38;
  double v39;
  __int16 v40;
  id v41;
  _QWORD v42[2];
  _QWORD v43[2];
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "requestAsset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  if (v7)
  {
    v12 = v11;
    v44 = *MEMORY[0x1E0CBD2A8];
    objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
    v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v15 = CGImageSourceCreateWithData(v7, v14);

    if (!v15)
      goto LABEL_22;
    v16 = *MEMORY[0x1E0CBD180];
    v42[0] = *MEMORY[0x1E0CBD190];
    v42[1] = v16;
    v43[0] = MEMORY[0x1E0C9AAB0];
    v43[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v15, 0, v17);

    if (ThumbnailAtIndex)
    {
      v19 = CFAutorelease(ThumbnailAtIndex);
      objc_msgSend(v10, "exifPixelSize");
      v22 = v21;
      v23 = v20;
      if (v21 == *MEMORY[0x1E0C9D820] && v20 == *(double *)(MEMORY[0x1E0C9D820] + 8))
      {
        PLImportGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "redactedFileNameDescription");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = 138543362;
          v37 = (uint64_t)v25;
          _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_ERROR, "zero image size for %{public}@", (uint8_t *)&v36, 0xCu);

        }
      }
      objc_msgSend(*(id *)(a1 + 32), "removeBlackBarsFromExifThumbnail:fullSize:", v19, v22, v23);
      PLImportGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v10, "redactedFileNameDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v36 = 138543618;
        v37 = (uint64_t)v27;
        v38 = 2048;
        v39 = v28 - v12;
        _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_DEBUG, "Time to make thumbnail for %{public}@: %g", (uint8_t *)&v36, 0x16u);

      }
    }
    else
    {
      if ((objc_msgSend(v8, "isCanceled") & 1) != 0)
      {
LABEL_21:
        CFRelease(v15);
        goto LABEL_22;
      }
      PLImportGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "redactedFileNameDescription");
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v33;
        *(double *)&v35 = COERCE_DOUBLE(CFSTR("Unknown reason"));
        if (v9)
          v35 = v9;
        v36 = 138543618;
        v37 = v33;
        v38 = 2112;
        v39 = *(double *)&v35;
        _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_ERROR, "Didn't get a thumbnail for %{public}@ (%@).", (uint8_t *)&v36, 0x16u);

      }
    }

    goto LABEL_21;
  }
  PLImportGetLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "source");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "name");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "redactedFileNameDescription");
    v32 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    v36 = 138412802;
    v37 = (uint64_t)v31;
    v38 = 2114;
    v39 = v32;
    v40 = 2048;
    v41 = v8;
    _os_log_impl(&dword_1991EC000, v29, OS_LOG_TYPE_ERROR, "%@ returned nil image data for %{public}@ <%p>", (uint8_t *)&v36, 0x20u);

  }
LABEL_22:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __41__PHImportDeviceAsset_loadMetadataAsync___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

intptr_t __39__PHImportDeviceAsset_loadMetadataSync__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __40__PHImportDeviceAsset_securityScopedURL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)assetFileForFile:(id)a3 source:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  PHImportDeviceAsset *v15;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D752F0];
  objc_msgSend(v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resourceModelTypeForFilenameExtension:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = +[PHValidator mediaTypeForContentType:](PHValidator, "mediaTypeForContentType:", v10);
  if ((_DWORD)v11 == 1)
    goto LABEL_6;
  v12 = v11;
  if (!(_DWORD)v11)
  {
    objc_msgSend(v5, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = +[PHImportAsset isValidAsSidecar:](PHImportAsset, "isValidAsSidecar:", v13);

    if (v14)
    {
      v12 = 64;
      goto LABEL_5;
    }
LABEL_6:
    v15 = 0;
    goto LABEL_7;
  }
LABEL_5:
  v15 = -[PHImportDeviceAsset initWithSource:cameraFile:type:supportedMediaType:]([PHImportDeviceAsset alloc], "initWithSource:cameraFile:type:supportedMediaType:", v6, v5, v10, v12);
LABEL_7:

  return v15;
}

+ (void)validateCameraFile:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  NSObject *v13;
  double v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  const __CFString *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  const __CFString *v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  const __CFString *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLImportGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v48 = "+[PHImportDeviceAsset validateCameraFile:]";
    v49 = 2112;
    v50 = v3;
    _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_DEBUG, "%s - %@", buf, 0x16u);
  }

  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    PLImportGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
LABEL_33:

      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    v19 = "ERROR: name == nil";
    v20 = v16;
    v21 = 2;
LABEL_32:
    _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_DEBUG, v19, buf, v21);
    goto LABEL_33;
  }
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[PHValidator isSupportedImageAtPath:](PHValidator, "isSupportedImageAtPath:", v6);

  if (v7)
  {
    if (!objc_msgSend(v3, "width"))
    {
      PLImportGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEBUG, "ERROR: width == 0", buf, 2u);
      }

    }
    if (!objc_msgSend(v3, "height"))
    {
      PLImportGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_DEBUG, "ERROR: height == 0", buf, 2u);
      }

    }
  }
  objc_msgSend(v3, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[PHValidator isSupportedMovieAtPath:](PHValidator, "isSupportedMovieAtPath:", v10);

  if (v11)
  {
    if (!objc_msgSend(v3, "width"))
    {
      PLImportGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEBUG, "ERROR: width == 0", buf, 2u);
      }

    }
    if (!objc_msgSend(v3, "height"))
    {
      PLImportGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_DEBUG, "ERROR: height == 0", buf, 2u);
      }

    }
    objc_msgSend(v3, "duration");
    if (v14 == 0.0)
    {
      PLImportGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEBUG, "ERROR: duration == 0", buf, 2u);
      }

    }
    PLImportGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      goto LABEL_33;
    v17 = objc_msgSend(v3, "highFramerate");
    v18 = CFSTR("NO");
    if (v17)
      v18 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v48 = (const char *)v18;
    v19 = "highFramerate: %@";
    v20 = v16;
    v21 = 12;
    goto LABEL_32;
  }
LABEL_34:
  objc_msgSend(v3, "originalFilename");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    PLImportGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_DEBUG, "ERROR: originalFilename == nil", buf, 2u);
    }

  }
  objc_msgSend(v3, "createdFilename");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    PLImportGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_DEBUG, "INFO: createdFilename == nil", buf, 2u);
    }

  }
  if (!objc_msgSend(v3, "fileSize"))
  {
    PLImportGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_DEBUG, "ERROR: fileSize == 0", buf, 2u);
    }

  }
  objc_msgSend(v3, "creationDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    PLImportGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v28, OS_LOG_TYPE_DEBUG, "ERROR: creationDate == nil", buf, 2u);
    }

  }
  objc_msgSend(v3, "modificationDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    PLImportGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_DEBUG, "ERROR: modificationDate == nil", buf, 2u);
    }

  }
  objc_msgSend(v3, "UTI");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
  {
    PLImportGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v32, OS_LOG_TYPE_DEBUG, "ERROR: UTI == nil", buf, 2u);
    }

  }
  objc_msgSend(v3, "parentFolder");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v33)
  {
    PLImportGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v34, OS_LOG_TYPE_DEBUG, "ERROR: parentFolder == nil", buf, 2u);
    }

  }
  objc_msgSend(v3, "device");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
  {
    PLImportGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v36, OS_LOG_TYPE_DEBUG, "ERROR: device == nil", buf, 2u);
    }

  }
  PLImportGetLog();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    v46 = objc_msgSend(v3, "orientation");
    objc_msgSend(v3, "burstUUID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "burstFavorite"))
      v39 = CFSTR("YES");
    else
      v39 = CFSTR("NO");
    if (objc_msgSend(v3, "burstPicked"))
      v40 = CFSTR("YES");
    else
      v40 = CFSTR("NO");
    if (objc_msgSend(v3, "firstPicked"))
      v41 = CFSTR("YES");
    else
      v41 = CFSTR("NO");
    if (objc_msgSend(v3, "timeLapse"))
      v42 = CFSTR("YES");
    else
      v42 = CFSTR("NO");
    objc_msgSend(v3, "originatingAssetID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "groupUUID");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "relatedUUID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134220034;
    v48 = (const char *)v46;
    v49 = 2112;
    v50 = v38;
    v51 = 2112;
    v52 = v39;
    v53 = 2112;
    v54 = v40;
    v55 = 2112;
    v56 = v41;
    v57 = 2112;
    v58 = v42;
    v59 = 2112;
    v60 = v43;
    v61 = 2112;
    v62 = v44;
    v63 = 2112;
    v64 = v45;
    _os_log_impl(&dword_1991EC000, v37, OS_LOG_TYPE_DEBUG, "orientation: %lu, burstUUID: %@, burstFavorite: %@, burstPicked: %@, firstPicked: %@, timeLapse: %@, originatingAssetID: %@, groupUUID: %@, relatedUUID: %@", buf, 0x5Cu);

  }
}

@end
