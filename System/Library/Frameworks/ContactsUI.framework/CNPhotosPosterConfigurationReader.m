@implementation CNPhotosPosterConfigurationReader

- (CNPhotosPosterConfigurationReader)initWithPosterConfiguration:(id)a3
{
  id v5;
  CNPhotosPosterConfigurationReader *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  CNPhotosPosterConfigurationReader *v16;
  NSObject *v17;
  void *v19;
  id v20;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CNPhotosPosterConfigurationReader;
  v6 = -[CNPhotosPosterConfigurationReader init](&v21, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "assetDirectory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0D751F0], "loadFromURL:error:", v7, &v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v20;
    if (v8)
    {
      objc_storeStrong((id *)&v6->_photosConfiguration, v8);
      objc_msgSend(v8, "media");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11 != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("CNPhotosPosterConfigurationReader.m"), 70, CFSTR("ERROR: expected the poster config to have exactly one media"));

      }
      objc_msgSend(v8, "media");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = objc_claimAutoreleasedReturnValue();

      -[NSObject subpath](v13, "subpath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URLByAppendingPathComponent:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_storeStrong((id *)&v6->_wallpaperURL, v15);
        v16 = v6;
      }
      else
      {
        CNUILogPosters();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v5;
          _os_log_error_impl(&dword_18AC56000, v17, OS_LOG_TYPE_ERROR, "Error finding wallpaper URL for posterConfig: %@", buf, 0xCu);
        }

        v16 = 0;
      }

    }
    else
    {
      CNUILogPosters();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v7;
        v24 = 2112;
        v25 = v9;
        _os_log_error_impl(&dword_18AC56000, v13, OS_LOG_TYPE_ERROR, "Failed to load photos poster config at %@: error %@", buf, 0x16u);
      }
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSData)fullExtentPreviewImageData
{
  NSData *v3;
  void *v4;
  NSData *v5;
  NSData *fullExtentPreviewImageData;
  CGFloat v7;
  CGFloat v8;

  v3 = self->_fullExtentPreviewImageData;
  if (!v3)
  {
    -[CNPhotosPosterConfigurationReader fullExtentPreviewImageDataFromConfiguration](self, "fullExtentPreviewImageDataFromConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageData");
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    fullExtentPreviewImageData = self->_fullExtentPreviewImageData;
    self->_fullExtentPreviewImageData = v5;

    objc_msgSend(v4, "imageSize");
    self->_fullExtentPreviewImageSize.width = v7;
    self->_fullExtentPreviewImageSize.height = v8;
    v3 = self->_fullExtentPreviewImageData;

  }
  return v3;
}

- (CGSize)fullExtentPreviewImageSize
{
  double width;
  double height;
  void *v6;
  NSData *v7;
  NSData *fullExtentPreviewImageData;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  CGSize result;

  width = self->_fullExtentPreviewImageSize.width;
  height = self->_fullExtentPreviewImageSize.height;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[CNPhotosPosterConfigurationReader fullExtentPreviewImageDataFromConfiguration](self, "fullExtentPreviewImageDataFromConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageData");
    v7 = (NSData *)objc_claimAutoreleasedReturnValue();
    fullExtentPreviewImageData = self->_fullExtentPreviewImageData;
    self->_fullExtentPreviewImageData = v7;

    objc_msgSend(v6, "imageSize");
    width = v9;
    height = v10;
    self->_fullExtentPreviewImageSize.width = v9;
    self->_fullExtentPreviewImageSize.height = v10;

  }
  v11 = width;
  v12 = height;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGRect)fullExtentPreviewImageFaceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (CGRectEqualToRect(self->_fullExtentPreviewImageFaceRect, *MEMORY[0x1E0C9D648]))
  {
    -[CNPhotosPosterConfigurationReader fullExtentPreviewImageFaceRectFromConfiguration](self, "fullExtentPreviewImageFaceRectFromConfiguration");
    self->_fullExtentPreviewImageFaceRect.origin.x = x;
    self->_fullExtentPreviewImageFaceRect.origin.y = y;
    self->_fullExtentPreviewImageFaceRect.size.width = width;
    self->_fullExtentPreviewImageFaceRect.size.height = height;
  }
  else
  {
    width = self->_fullExtentPreviewImageFaceRect.size.width;
    height = self->_fullExtentPreviewImageFaceRect.size.height;
    x = self->_fullExtentPreviewImageFaceRect.origin.x;
    y = self->_fullExtentPreviewImageFaceRect.origin.y;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)fullExtentPreviewImageDataFromConfiguration
{
  void *v3;
  id v4;
  void *v5;
  CGImage *v6;
  id v7;
  __CFData *v8;
  CGImageDestination *v9;
  size_t Width;
  size_t Height;
  CNPhotosPosterConfigurationReaderPreviewImageResult *v12;
  void *v13;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 buf;
  void (*v21)(uint64_t);
  void *v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v3 = (void *)getPISegmentationClass_softClass;
  v19 = getPISegmentationClass_softClass;
  if (!getPISegmentationClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v21 = __getPISegmentationClass_block_invoke;
    v22 = &unk_1E204EBC0;
    v23 = &v16;
    __getPISegmentationClass_block_invoke((uint64_t)&buf);
    v3 = (void *)v17[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v16, 8);
  -[CNPhotosPosterConfigurationReader wallpaperURL](self, "wallpaperURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v6 = (CGImage *)objc_msgSend(v4, "createFullExtentPreviewImageForWallpaperAtURL:error:", v5, &v15);
  v7 = v15;

  if (v6)
  {
    v8 = (__CFData *)objc_opt_new();
    v9 = CGImageDestinationCreateWithData(v8, CFSTR("public.jpeg"), 1uLL, 0);
    CGImageDestinationAddImage(v9, v6, 0);
    CGImageDestinationFinalize(v9);
    if (v9)
      CFRelease(v9);
    Width = CGImageGetWidth(v6);
    Height = CGImageGetHeight(v6);
    CFRelease(v6);
    v12 = objc_alloc_init(CNPhotosPosterConfigurationReaderPreviewImageResult);
    v13 = (void *)-[__CFData copy](v8, "copy");
    -[CNPhotosPosterConfigurationReaderPreviewImageResult setImageData:](v12, "setImageData:", v13);

    -[CNPhotosPosterConfigurationReaderPreviewImageResult setImageSize:](v12, "setImageSize:", (double)Width, (double)Height);
  }
  else
  {
    CNUILogPosters();
    v8 = (__CFData *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_error_impl(&dword_18AC56000, (os_log_t)v8, OS_LOG_TYPE_ERROR, "[PISegmentation createFullSizePreviewImageForWallpaperAtURL:error:] failed: %@", (uint8_t *)&buf, 0xCu);
    }
    v12 = 0;
  }

  return v12;
}

- (CGRect)fullExtentPreviewImageFaceRectFromConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  const __CFDictionary *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect result;

  v3 = (void *)objc_opt_class();
  -[CNPhotosPosterConfigurationReader photosConfiguration](self, "photosConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "facesFromConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
  {
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    v10 = (void *)objc_opt_class();
    -[CNPhotosPosterConfigurationReader wallpaperURL](self, "wallpaperURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "compoundLayerStackFromURL:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "layout");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageSize");
      v15 = v14;
      v17 = v16;
      objc_msgSend(v5, "firstObject");
      v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      memset(&v29, 0, sizeof(v29));
      CGRectMakeWithDictionaryRepresentation(v18, &v29);
      -[CNPhotosPosterConfigurationReader fullExtentPreviewImageSize](self, "fullExtentPreviewImageSize");
      -[CNPhotosPosterConfigurationReader faceRect:forFullExtentImageSize:fromOriginalImageSize:zoomOut:](self, "faceRect:forFullExtentImageSize:fromOriginalImageSize:zoomOut:", 1, *(_OWORD *)&v29.origin, *(_OWORD *)&v29.size, v19, v20, v15, v17);
      v6 = v21;
      v7 = v22;
      v8 = v23;
      v9 = v24;

    }
    else
    {
      v6 = *MEMORY[0x1E0C9D648];
      v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }

  }
  v25 = v6;
  v26 = v7;
  v27 = v8;
  v28 = v9;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)faceRect:(CGRect)a3 forFullExtentImageSize:(CGSize)a4 fromOriginalImageSize:(CGSize)a5 zoomOut:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  v6 = a6;
  height = a5.height;
  width = a5.width;
  v9 = a4.height;
  v10 = a4.width;
  -[CNPhotosPosterConfigurationReader denormalizeFaceRect:toOriginalImageSize:](self, "denormalizeFaceRect:toOriginalImageSize:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.width, a5.height);
  -[CNPhotosPosterConfigurationReader transformFaceRectToTopLeftOrigin:withSize:](self, "transformFaceRectToTopLeftOrigin:withSize:");
  if (width != v10 || height != v9)
  {
    v12 = v10 / width * v12;
    v13 = v10 / width * v13;
    v14 = v10 / width * v14;
    v15 = v10 / width * v15;
  }
  if (v6)
  {
    v14 = v14 * 3.0;
    v17 = v15 * 3.0;
    if (v14 >= v17)
      v14 = v17;
    v12 = v12 - v14 * 0.3;
    v13 = v13 - v14 * 0.3;
    v15 = v14;
  }
  objc_msgSend(MEMORY[0x1E0D13A80], "squareCropRect:toFitSize:", v12, v13, v14, v15, v10, v9);
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)faceRectInPosterSnapshot
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  if (CGRectEqualToRect(self->_faceRectInPosterSnapshot, *MEMORY[0x1E0C9D648]))
  {
    -[CNPhotosPosterConfigurationReader faceRectInPosterSnapshotFromConfiguration](self, "faceRectInPosterSnapshotFromConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "faceRect");
    self->_faceRectInPosterSnapshot.origin.x = v4;
    self->_faceRectInPosterSnapshot.origin.y = v5;
    self->_faceRectInPosterSnapshot.size.width = v6;
    self->_faceRectInPosterSnapshot.size.height = v7;
    objc_msgSend(v3, "percentFromTop");
    self->_faceRectInPosterSnapshotPercentFromTop = v8;
    x = self->_faceRectInPosterSnapshot.origin.x;
    y = self->_faceRectInPosterSnapshot.origin.y;
    width = self->_faceRectInPosterSnapshot.size.width;
    height = self->_faceRectInPosterSnapshot.size.height;

  }
  else
  {
    x = self->_faceRectInPosterSnapshot.origin.x;
    y = self->_faceRectInPosterSnapshot.origin.y;
    width = self->_faceRectInPosterSnapshot.size.width;
    height = self->_faceRectInPosterSnapshot.size.height;
  }
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (double)faceRectInPosterSnapshotPercentFromTop
{
  double faceRectInPosterSnapshotPercentFromTop;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;

  faceRectInPosterSnapshotPercentFromTop = self->_faceRectInPosterSnapshotPercentFromTop;
  if (faceRectInPosterSnapshotPercentFromTop == 0.0)
  {
    -[CNPhotosPosterConfigurationReader faceRectInPosterSnapshotFromConfiguration](self, "faceRectInPosterSnapshotFromConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "faceRect");
    self->_faceRectInPosterSnapshot.origin.x = v5;
    self->_faceRectInPosterSnapshot.origin.y = v6;
    self->_faceRectInPosterSnapshot.size.width = v7;
    self->_faceRectInPosterSnapshot.size.height = v8;
    objc_msgSend(v4, "percentFromTop");
    faceRectInPosterSnapshotPercentFromTop = v9;
    self->_faceRectInPosterSnapshotPercentFromTop = v9;

  }
  return faceRectInPosterSnapshotPercentFromTop;
}

- (BOOL)hasFaceRectInPosterSnapshot
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v7;
  CGRect v8;

  -[CNPhotosPosterConfigurationReader faceRectInPosterSnapshot](self, "faceRectInPosterSnapshot");
  x = v7.origin.x;
  y = v7.origin.y;
  width = v7.size.width;
  height = v7.size.height;
  if (CGRectEqualToRect(v7, *MEMORY[0x1E0C9D648]))
    return 0;
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  return !CGRectIsNull(v8);
}

- (id)faceRectInPosterSnapshotFromConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  CNPhotosPosterConfigurationReaderFaceRectResult *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  __CVBuffer *v16;
  double Width;
  double Height;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  const __CFDictionary *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGRect v46;

  v3 = (void *)objc_opt_class();
  -[CNPhotosPosterConfigurationReader photosConfiguration](self, "photosConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "facesFromConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_opt_class();
    -[CNPhotosPosterConfigurationReader wallpaperURL](self, "wallpaperURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "compoundLayerStackFromURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "portraitLayerStack");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "backgroundLayer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v13 = v12;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
        v15 = v14;

        v16 = (__CVBuffer *)-[NSObject image](v15, "image");
        Width = (double)CVPixelBufferGetWidth(v16);
        Height = (double)CVPixelBufferGetHeight(v16);
        objc_msgSend(v11, "layout");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "imageSize");
        v21 = v20;
        v23 = v22;
        objc_msgSend(v19, "visibleFrame");
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v31 = v30;
        objc_msgSend(v5, "firstObject");
        v32 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        memset(&v46, 0, sizeof(v46));
        CGRectMakeWithDictionaryRepresentation(v32, &v46);
        -[CNPhotosPosterConfigurationReader denormalizeFaceRect:toOriginalImageSize:](self, "denormalizeFaceRect:toOriginalImageSize:", *(_OWORD *)&v46.origin, *(_OWORD *)&v46.size, v21, v23);
        v46.origin.x = Width / v29 * (v33 - v25);
        v46.origin.y = Height / v31 * (v34 - v27);
        v46.size.width = Width / v29 * v35;
        v46.size.height = Height / v31 * v36;
        -[CNPhotosPosterConfigurationReader transformFaceRectToTopLeftOrigin:withSize:](self, "transformFaceRectToTopLeftOrigin:withSize:", *(_OWORD *)&v46.origin, *(_OWORD *)&v46.size);
        objc_msgSend(MEMORY[0x1E0D13A80], "squareCropRect:toFitSize:", v37, v38, v39, v40);
        v46.origin.x = v41;
        v46.origin.y = v42;
        v46.size.width = v43;
        v46.size.height = v44;
        v6 = objc_alloc_init(CNPhotosPosterConfigurationReaderFaceRectResult);
        -[CNPhotosPosterConfigurationReaderFaceRectResult setPercentFromTop:](v6, "setPercentFromTop:", v46.origin.y / Height);
        -[CNPhotosPosterConfigurationReaderFaceRectResult setFaceRect:](v6, "setFaceRect:", *(_OWORD *)&v46.origin, *(_OWORD *)&v46.size);

      }
      else
      {
        CNUILogPosters();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v46.origin.x) = 0;
          _os_log_error_impl(&dword_18AC56000, v13, OS_LOG_TYPE_ERROR, "Could not load portrait layer stack", (uint8_t *)&v46, 2u);
        }
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (CGRect)denormalizeFaceRect:(CGRect)a3 toOriginalImageSize:(CGSize)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v4 = a3.origin.x * a4.width;
  v5 = a3.origin.y * a4.height;
  v6 = a3.size.width * a4.width;
  v7 = a3.size.height * a4.height;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)transformFaceRectToTopLeftOrigin:(CGRect)a3 withSize:(CGSize)a4
{
  double height;
  CGFloat v5;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGRect v12;

  height = a4.height;
  v5 = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeScale(&v11, 1.0, -1.0);
  v9 = v11;
  CGAffineTransformTranslate(&v10, &v9, 0.0, -height);
  v11 = v10;
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = v5;
  return CGRectApplyAffineTransform(v12, &v10);
}

- (PFPosterConfiguration)photosConfiguration
{
  return self->_photosConfiguration;
}

- (void)setPhotosConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_photosConfiguration, a3);
}

- (NSURL)wallpaperURL
{
  return self->_wallpaperURL;
}

- (void)setWallpaperURL:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperURL, a3);
}

- (void)setFullExtentPreviewImageData:(id)a3
{
  objc_storeStrong((id *)&self->_fullExtentPreviewImageData, a3);
}

- (void)setFullExtentPreviewImageSize:(CGSize)a3
{
  self->_fullExtentPreviewImageSize = a3;
}

- (void)setFullExtentPreviewImageFaceRect:(CGRect)a3
{
  self->_fullExtentPreviewImageFaceRect = a3;
}

- (void)setFaceRectInPosterSnapshot:(CGRect)a3
{
  self->_faceRectInPosterSnapshot = a3;
}

- (void)setFaceRectInPosterSnapshotPercentFromTop:(double)a3
{
  self->_faceRectInPosterSnapshotPercentFromTop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullExtentPreviewImageData, 0);
  objc_storeStrong((id *)&self->_wallpaperURL, 0);
  objc_storeStrong((id *)&self->_photosConfiguration, 0);
}

+ (id)userInfoFromConfiguration:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t v8[16];

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    CNUILogPosters();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_18AC56000, v6, OS_LOG_TYPE_ERROR, "Could not find poster configuration userInfo", v8, 2u);
    }

  }
  return v4;
}

+ (id)compoundLayerStackFromURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE buf[24];
  void *v17;
  uint64_t *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v4 = (void *)getPISegmentationLoaderClass_softClass;
  v15 = getPISegmentationLoaderClass_softClass;
  if (!getPISegmentationLoaderClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getPISegmentationLoaderClass_block_invoke;
    v17 = &unk_1E204EBC0;
    v18 = &v12;
    __getPISegmentationLoaderClass_block_invoke((uint64_t)buf);
    v4 = (void *)v13[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v12, 8);
  v11 = 0;
  objc_msgSend(v5, "loadCompoundLayerStackFromWallpaperURL:options:error:", v3, 0, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    CNUILogPosters();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_18AC56000, v9, OS_LOG_TYPE_DEFAULT, "Could not could not load layer stack at %@: error %@", buf, 0x16u);
    }

  }
  return v6;
}

+ (id)faceRectsFromUserInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint8_t v12[16];

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("regions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faces"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *MEMORY[0x1E0D137F8];
  if ((*(unsigned int (**)(_QWORD, void *))(*MEMORY[0x1E0D137F8] + 16))(*MEMORY[0x1E0D137F8], v5))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("regions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("pets"));
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  if ((*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v5))
  {
    CNUILogPosters();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v12 = 0;
      _os_log_debug_impl(&dword_18AC56000, v9, OS_LOG_TYPE_DEBUG, "No face rect found, userInfo contained no faces", v12, 2u);
    }

    v10 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v10 = v5;
  }

  return v10;
}

+ (id)facesFromConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "userInfoFromConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "faceRectsFromUserInfo:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
      v6 = (id)MEMORY[0x1E0C9AA60];
    else
      v6 = v5;

  }
  else
  {
    v6 = (id)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

@end
