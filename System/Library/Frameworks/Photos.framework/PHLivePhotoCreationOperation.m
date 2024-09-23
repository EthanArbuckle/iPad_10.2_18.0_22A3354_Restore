@implementation PHLivePhotoCreationOperation

- (PHLivePhotoCreationOperation)initWithResourceURLs:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 prefersHDR:(BOOL)a6 resultHandler:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  PHLivePhotoCreationOperation *v15;
  uint64_t v16;
  NSArray *resourceURLs;
  uint64_t v18;
  id resultHandler;
  objc_super v21;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PHLivePhotoCreationOperation;
  v15 = -[PHLivePhotoCreationOperation init](&v21, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v13, "copy");
    resourceURLs = v15->_resourceURLs;
    v15->_resourceURLs = (NSArray *)v16;

    v15->_contentMode = a5;
    v18 = objc_msgSend(v14, "copy");
    resultHandler = v15->_resultHandler;
    v15->_resultHandler = (id)v18;

    v15->_targetSize.width = width;
    v15->_targetSize.height = height;
    v15->_prefersHDR = a6;
  }

  return v15;
}

- (void)main
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD);
  _BOOL4 v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _BOOL4 v15;
  PHLivePhoto *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void **v21;
  const __CFString **v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27[2];
  id v28;
  id v29;
  id v30;
  const __CFString *v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[2];
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  -[PHLivePhotoCreationOperation resourceURLs](self, "resourceURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHLivePhotoCreationOperation resultHandler](self, "resultHandler");
  v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = 0;
  v28 = 0;
  v5 = +[PHLivePhoto _identifyResourceURLs:outImageURL:outVideoURL:error:](PHLivePhoto, "_identifyResourceURLs:outImageURL:outVideoURL:error:", v3, &v30, &v29, &v28);
  v6 = v30;
  v7 = v29;
  v8 = v28;
  v9 = 0;
  if (v5)
  {
    if ((-[PHLivePhotoCreationOperation isCancelled](self, "isCancelled") & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      -[PHLivePhotoCreationOperation _createImageOnlyLivePhotoWithImageURL:](self, "_createImageOnlyLivePhotoWithImageURL:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("PHLivePhotoInfoIsDegradedKey");
      v36[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *, _QWORD))v4)[2](v4, v10, v11, 0);

      if ((-[PHLivePhotoCreationOperation isCancelled](self, "isCancelled") & 1) != 0)
      {
        v9 = 0;
      }
      else
      {
        v26 = v10;
        objc_msgSend(v7, "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v27[1] = 0;
        PFVideoComplementMetadataForVideoAtPath();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 0;

        v27[0] = v14;
        v15 = +[PHLivePhoto _canCreateLivePhotoWithURLs:videoComplementMetadata:outError:](PHLivePhoto, "_canCreateLivePhotoWithURLs:videoComplementMetadata:outError:", v3, v13, v27);
        v25 = v27[0];

        v9 = 0;
        if (v15)
        {
          if ((-[PHLivePhotoCreationOperation isCancelled](self, "isCancelled", v25) & 1) != 0)
          {
            v9 = 0;
          }
          else
          {
            v16 = [PHLivePhoto alloc];
            -[PHLivePhotoCreationOperation targetSize](self, "targetSize");
            v9 = -[PHLivePhoto _initWithImageURL:videoURL:videoComplementMetadata:targetSize:contentMode:prefersHDR:](v16, "_initWithImageURL:videoURL:videoComplementMetadata:targetSize:contentMode:prefersHDR:", v6, v7, v13, -[PHLivePhotoCreationOperation contentMode](self, "contentMode"), -[PHLivePhotoCreationOperation prefersHDR](self, "prefersHDR"), v17, v18);
          }
        }

        v10 = v26;
      }

    }
  }
  if (v8)
  {
    v33[0] = CFSTR("PHLivePhotoInfoCancelledKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHLivePhotoCreationOperation isCancelled](self, "isCancelled"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = CFSTR("PHLivePhotoInfoErrorKey");
    v34[0] = v19;
    v34[1] = v8;
    v20 = (void *)MEMORY[0x1E0C99D80];
    v21 = (void **)v34;
    v22 = (const __CFString **)v33;
    v23 = 2;
  }
  else
  {
    v31 = CFSTR("PHLivePhotoInfoCancelledKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHLivePhotoCreationOperation isCancelled](self, "isCancelled"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v19;
    v20 = (void *)MEMORY[0x1E0C99D80];
    v21 = &v32;
    v22 = &v31;
    v23 = 1;
  }
  objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, v23, v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, id, void *, uint64_t))v4)[2](v4, v9, v24, 1);
}

- (id)_createImageOnlyLivePhotoWithImageURL:(id)a3
{
  id v4;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v15;
  PHLivePhoto *v16;
  uint64_t v17;
  uint64_t v18;
  PHLivePhoto *v19;
  __int128 v21;
  uint64_t v22;

  v4 = a3;
  v5 = -[PHLivePhotoCreationOperation contentMode](self, "contentMode");
  -[PHLivePhotoCreationOperation targetSize](self, "targetSize");
  v7 = v6;
  v9 = v8;
  -[PHLivePhotoCreationOperation prefersHDR](self, "prefersHDR");
  DCIM_newPLImageWithContentsOfFileURL();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  DCIM_sizeFromPLImage();
  if ((v7 != *MEMORY[0x1E0C9D820] || v9 != *(double *)(MEMORY[0x1E0C9D820] + 8)) && (v11 > v7 || v12 > v9))
  {
    if (v5 == 1)
      DCIM_sizeScaleToFillSize();
    else
      DCIM_sizeScaleToFitSize();
    DCIM_sizeScale();
    MEMORY[0x19AEBDA80](v10);
    DCIM_scaleImageFromURL();
    v15 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v15;
  }
  v16 = [PHLivePhoto alloc];
  v17 = DCIM_CGImageRefFromPLImage();
  v18 = MEMORY[0x19AEBDA80](v10);
  v21 = *MEMORY[0x1E0CA2E18];
  v22 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v19 = -[PHLivePhoto initWithImage:uiOrientation:videoAsset:photoTime:asset:](v16, "initWithImage:uiOrientation:videoAsset:photoTime:asset:", v17, v18, 0, &v21, 0);

  return v19;
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (NSArray)resourceURLs
{
  return self->_resourceURLs;
}

- (BOOL)prefersHDR
{
  return self->_prefersHDR;
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_resourceURLs, 0);
}

@end
