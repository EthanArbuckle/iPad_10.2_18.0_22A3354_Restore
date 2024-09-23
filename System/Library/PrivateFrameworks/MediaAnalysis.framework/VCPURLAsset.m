@implementation VCPURLAsset

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (unint64_t)mediaSubtypes
{
  return self->_mediaSubtypes;
}

- (unint64_t)pixelWidth
{
  return self->_pixelWidth;
}

- (unint64_t)pixelHeight
{
  return self->_pixelHeight;
}

- (id)modificationDate
{
  NSURL *v3;
  NSURL *v4;
  id v5;
  id v7;

  if (-[VCPAsset isMovie](self, "isMovie"))
  {
    -[AVURLAsset URL](self->_movie, "URL");
    v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_imageURL;
  }
  v4 = v3;
  v7 = 0;
  -[NSURL getResourceValue:forKey:error:](v3, "getResourceValue:forKey:error:", &v7, *MEMORY[0x1E0C998D8], 0);
  v5 = v7;

  return v5;
}

- (id)mainFileURL
{
  NSURL *v3;

  if (-[VCPAsset isMovie](self, "isMovie"))
  {
    -[AVURLAsset URL](self->_movie, "URL");
    v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_imageURL;
  }
  return v3;
}

- (id)scenes
{
  VCPURLAsset *v2;
  uint64_t v4;
  NSMutableDictionary *cachedScenes;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  BOOL v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSMutableDictionary *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _QWORD v34[3];

  v34[1] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_onceScenes)
  {
    v28 = 0;
LABEL_3:
    objc_sync_exit(v2);

    goto LABEL_4;
  }
  v2->_onceScenes = 1;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = objc_claimAutoreleasedReturnValue();
  cachedScenes = v2->_cachedScenes;
  v2->_cachedScenes = (NSMutableDictionary *)v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1BCCA1B2C]();
  v8 = objc_alloc(MEMORY[0x1E0CEDF70]);
  v9 = (void *)objc_msgSend(v8, "initWithURL:options:", v2->_imageURL, MEMORY[0x1E0C9AA70]);
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CEE020]);
    v11 = v10;
    if (v10
      && (objc_msgSend(v10, "setPreferBackgroundProcessing:", 1),
          objc_msgSend(v11, "setRevision:", 2),
          v34[0] = v11,
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v9, "performRequests:error:", v12, 0),
          v12,
          (v13 & 1) != 0))
    {
      objc_msgSend(v11, "results");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14 == 0;

      if (!v15)
      {
        objc_msgSend(v11, "results");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v16);

      }
      v17 = 0;
      v28 = 0;
    }
    else
    {
      v28 = -18;
      v17 = 4;
    }

  }
  else
  {
    v28 = -108;
    v17 = 4;
  }

  objc_autoreleasePoolPop(v7);
  if (!v17)
  {
    if (objc_msgSend(v6, "count"))
    {
      if ((unint64_t)objc_msgSend(v6, "count") >= 0xB)
      {
        objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_34);
        objc_msgSend(v6, "subarrayWithRange:", 0, 10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "mutableCopy");

        v6 = (id)v19;
      }
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v6 = v6;
      v20 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v30 != v21)
              objc_enumerationMutation(v6);
            v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            v24 = v2->_cachedScenes;
            v25 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v23, "confidence");
            objc_msgSend(v25, "numberWithFloat:");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "identifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v26, v27);

          }
          v20 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v20);
      }

    }
    goto LABEL_3;
  }

  objc_sync_exit(v2);
LABEL_4:
  if (v28)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v2->_cachedScenes);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __21__VCPURLAsset_scenes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  float v10;
  float v11;
  float v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "confidence");
  v7 = v6;
  objc_msgSend(v5, "confidence");
  if (v7 <= v8)
  {
    objc_msgSend(v4, "confidence");
    v11 = v10;
    objc_msgSend(v5, "confidence");
    v9 = v11 < v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedScenes, 0);
  objc_storeStrong((id *)&self->_cachedExif, 0);
  objc_storeStrong((id *)&self->_movie, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
}

- (VCPURLAsset)initWithImageURL:(id)a3 isSDOF:(BOOL)a4
{
  _BOOL4 v4;
  const __CFURL *v6;
  CGImageSource *v7;
  VCPURLAsset *v8;
  uint64_t v9;
  NSURL *imageURL;
  double Size;
  unint64_t *p_pixelWidth;
  double v13;
  unint64_t v14;
  unint64_t pixelWidth;
  BOOL v16;
  int v17;
  VCPURLAsset *v18;
  BOOL v19;
  unint64_t *p_pixelHeight;
  unint64_t v21;
  VCPURLAsset *v22;
  objc_super v24;

  v4 = a4;
  v6 = (const __CFURL *)a3;
  v7 = CGImageSourceCreateWithURL(v6, 0);
  if (!v7)
  {
    v18 = 0;
    goto LABEL_23;
  }
  v24.receiver = self;
  v24.super_class = (Class)VCPURLAsset;
  v8 = -[VCPURLAsset init](&v24, sel_init);
  self = v8;
  if (v8)
  {
    v9 = -[__CFURL copy](v6, "copy");
    imageURL = v8->_imageURL;
    v8->_imageURL = (NSURL *)v9;

    v8->_mediaType = 1;
    Size = CGImageSourceGetSize(v7);
    p_pixelWidth = &v8->_pixelWidth;
    v8->_pixelWidth = (unint64_t)Size;
    v14 = (unint64_t)v13;
    v8->_pixelHeight = (unint64_t)v13;
    pixelWidth = v8->_pixelWidth;
    if (pixelWidth)
      v16 = v14 == 0;
    else
      v16 = 1;
    if (v16)
    {
      v17 = 0;
      goto LABEL_20;
    }
    v19 = pixelWidth > v14;
    if (pixelWidth >= v14)
      p_pixelHeight = &v8->_pixelWidth;
    else
      p_pixelHeight = &v8->_pixelHeight;
    v21 = *p_pixelHeight;
    if (v19)
      p_pixelWidth = &v8->_pixelHeight;
    if (v21 > 2 * *p_pixelWidth)
      v8->_mediaSubtypes |= 1uLL;
    if (v4)
      v8->_mediaSubtypes |= 0x10uLL;
  }
  v17 = 1;
LABEL_20:
  CFRelease(v7);
  if (v17)
    v18 = v8;
  else
    v18 = 0;
LABEL_23:
  v22 = v18;

  return v22;
}

+ (id)imageAssetWithURL:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImageURL:isSDOF:", v3, 0);
  else
    v4 = 0;

  return v4;
}

+ (id)sdofImageAssetWithURL:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImageURL:isSDOF:", v3, 1);
  else
    v4 = 0;

  return v4;
}

- (id)exif
{
  VCPURLAsset *v2;
  uint64_t v3;
  NSDictionary *cachedExif;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_onceExif)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "vcp_exifFromImageURL:", v2->_imageURL);
    v3 = objc_claimAutoreleasedReturnValue();
    cachedExif = v2->_cachedExif;
    v2->_cachedExif = (NSDictionary *)v3;

    v2->_onceExif = 1;
  }
  objc_sync_exit(v2);

  return v2->_cachedExif;
}

- (__CVBuffer)imageWithPreferredDimension:(unint64_t)a3
{
  void *v5;
  __CVBuffer *v6;

  +[VCPImageManager sharedImageManager](VCPImageManager, "sharedImageManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (__CVBuffer *)objc_msgSend(v5, "pixelBufferWithFormat:andMaxDimension:fromImageURL:", 875704422, a3, self->_imageURL);

  return v6;
}

- (__CVBuffer)imageWithPreferredDimension:(unint64_t)a3 orientation:(unsigned int *)a4
{
  void *v7;
  __CVBuffer *v8;

  +[VCPImageManager sharedImageManager](VCPImageManager, "sharedImageManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (__CVBuffer *)objc_msgSend(v7, "pixelBufferWithFormat:andMaxDimension:fromImageURL:orientation:", 875704422, a3, self->_imageURL, a4);

  return v8;
}

- (VCPURLAsset)initWithImageURL:(id)a3 andMovieURL:(id)a4
{
  const __CFURL *v6;
  id v7;
  CGImageSource *v8;
  VCPURLAsset *v9;
  uint64_t v10;
  NSURL *imageURL;
  double v12;
  BOOL v13;
  int v14;
  VCPURLAsset *v15;
  uint64_t v16;
  AVURLAsset *movie;
  VCPURLAsset *v18;
  objc_super v20;

  v6 = (const __CFURL *)a3;
  v7 = a4;
  v8 = CGImageSourceCreateWithURL(v6, 0);
  if (v8)
  {
    v20.receiver = self;
    v20.super_class = (Class)VCPURLAsset;
    v9 = -[VCPURLAsset init](&v20, sel_init);
    self = v9;
    if (v9)
    {
      v10 = -[__CFURL copy](v6, "copy");
      imageURL = v9->_imageURL;
      v9->_imageURL = (NSURL *)v10;

      v9->_mediaType = 1;
      v9->_mediaSubtypes = 8;
      v9->_pixelWidth = (unint64_t)CGImageSourceGetSize(v8);
      v9->_pixelHeight = (unint64_t)v12;
      if (v9->_pixelWidth)
        v13 = (unint64_t)v12 == 0;
      else
        v13 = 1;
      if (v13)
      {
        v14 = -50;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v7);
        v16 = objc_claimAutoreleasedReturnValue();
        movie = v9->_movie;
        v9->_movie = (AVURLAsset *)v16;

        if (v9->_movie)
          v14 = 0;
        else
          v14 = -50;
      }
    }
    else
    {
      v14 = 0;
    }
    CFRelease(v8);
    if (v14)
      v15 = 0;
    else
      v15 = v9;
  }
  else
  {
    v15 = 0;
  }
  v18 = v15;

  return v18;
}

+ (id)livePhotoAssetWithImageURL:(id)a3 andMovieURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
    v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImageURL:andMovieURL:", v5, v6);

  return v8;
}

- (float)photoOffsetSeconds
{
  _BOOL4 v3;
  double v4;
  AVURLAsset *movie;
  objc_super v7;
  CMTime time;
  CMTime v9;

  v3 = -[VCPAsset isLivePhoto](self, "isLivePhoto");
  LODWORD(v4) = 0;
  if (v3)
  {
    memset(&v9, 0, sizeof(v9));
    movie = self->_movie;
    if (movie
      && (-[AVURLAsset vcp_livePhotoStillDisplayTime](movie, "vcp_livePhotoStillDisplayTime", v4), (v9.flags & 1) != 0))
    {
      time = v9;
      *(float *)&v4 = CMTimeGetSeconds(&time);
    }
    else
    {
      v7.receiver = self;
      v7.super_class = (Class)VCPURLAsset;
      -[VCPAsset photoOffsetSeconds](&v7, sel_photoOffsetSeconds, v4);
    }
  }
  return *(float *)&v4;
}

- (VCPURLAsset)initWithMovieURL:(id)a3
{
  id v4;
  VCPURLAsset *v5;
  VCPURLAsset *v6;
  uint64_t v7;
  AVURLAsset *movie;
  AVURLAsset *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  int v17;
  float v18;
  VCPURLAsset *v19;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)VCPURLAsset;
  v5 = -[VCPURLAsset init](&v25, sel_init);
  if (!v5)
    goto LABEL_12;
  v6 = (VCPURLAsset *)MEMORY[0x1BCCA1B2C]();
  v5->_mediaType = 2;
  objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v4);
  v7 = objc_claimAutoreleasedReturnValue();
  movie = v5->_movie;
  v5->_movie = (AVURLAsset *)v7;

  v9 = v5->_movie;
  if (v9)
  {
    -[AVURLAsset vcp_firstEnabledTrackWithMediaType:](v9, "vcp_firstEnabledTrackWithMediaType:", *MEMORY[0x1E0C8A808]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "naturalSize");
      v13 = v12;
      v15 = v14;
      objc_msgSend(v11, "preferredTransform");
      v5->_pixelWidth = (unint64_t)fabs(v15 * v23 + v21 * v13);
      v5->_pixelHeight = (unint64_t)fabs(v15 * v24 + v22 * v13);
      objc_msgSend(v11, "nominalFrameRate");
      v16 = 0;
      v17 = 0;
      if (v18 >= 120.0)
        v5->_mediaSubtypes |= 0x20000uLL;
    }
    else
    {
      v17 = -18;
      v16 = 4;
    }

  }
  else
  {
    v17 = -50;
    v16 = 4;
  }
  objc_autoreleasePoolPop(v6);
  if ((v16 | 4) == 4)
  {
    if (v17)
    {
      v19 = 0;
LABEL_13:
      v6 = v19;
      goto LABEL_14;
    }
LABEL_12:
    v19 = v5;
    goto LABEL_13;
  }
LABEL_14:

  return v6;
}

+ (id)movieAssetWithURL:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMovieURL:", v3);

  return v4;
}

- (double)duration
{
  AVURLAsset *movie;
  CMTime time;

  movie = self->_movie;
  if (movie)
    -[AVURLAsset duration](movie, "duration");
  else
    memset(&time, 0, sizeof(time));
  return CMTimeGetSeconds(&time);
}

- (float)slowmoRate
{
  float v3;
  void *v4;
  float v5;

  v3 = 1.0;
  if (-[VCPAsset isSlowmo](self, "isSlowmo"))
  {
    -[AVURLAsset vcp_firstEnabledTrackWithMediaType:](self->_movie, "vcp_firstEnabledTrackWithMediaType:", *MEMORY[0x1E0C8A808]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nominalFrameRate");
    v3 = 30.0 / v5;

  }
  return v3;
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)slomoRange
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0CA2E40];
  v4 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&retstr->var0.var3 = v4;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v3 + 32);
  return self;
}

- (id)movie
{
  return self->_movie;
}

- (BOOL)isMovieResourceLocalAvailable
{
  return 1;
}

- (id)originalMovie
{
  return self->_movie;
}

@end
