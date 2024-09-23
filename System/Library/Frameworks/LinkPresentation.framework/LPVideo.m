@implementation LPVideo

- (LPVideo)init
{

  return 0;
}

- (id)_initWithVideo:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  id *v10;
  objc_super v12;

  v4 = (id *)a3;
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "MIMEType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)LPVideo;
  v9 = -[LPVisualMedia _initWithData:fileURL:MIMEType:properties:](&v12, sel__initWithData_fileURL_MIMEType_properties_, v5, v6, v7, v8);

  if (v9)
  {
    objc_storeStrong(v9 + 14, v4[14]);
    objc_storeStrong(v9 + 15, v4[15]);
    v10 = v9;
  }

  return v9;
}

- (LPVideo)initWithData:(id)a3 MIMEType:(id)a4 hasAudio:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  LPVideoProperties *v10;
  LPVideo *v11;
  LPVideo *v12;
  LPVideo *v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(LPVideoProperties);
  -[LPVideoProperties setHasAudio:](v10, "setHasAudio:", v5);
  v11 = -[LPVideo initWithData:MIMEType:properties:](self, "initWithData:MIMEType:properties:", v8, v9, v10);
  v12 = v11;
  if (v11)
    v13 = v11;

  return v12;
}

- (id)initByReferencingFileURL:(id)a3 MIMEType:(id)a4 hasAudio:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  LPVideoProperties *v10;
  id v11;
  void *v12;
  id v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(LPVideoProperties);
  -[LPVideoProperties setHasAudio:](v10, "setHasAudio:", v5);
  v11 = -[LPVisualMedia _initByReferencingFileURL:MIMEType:properties:](self, "_initByReferencingFileURL:MIMEType:properties:", v8, v9, v10);
  v12 = v11;
  if (v11)
    v13 = v11;

  return v12;
}

- (id)initByReferencingFileURL:(id)a3 MIMEType:(id)a4 properties:(id)a5
{
  id v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LPVideo;
  v5 = -[LPVisualMedia _initByReferencingFileURL:MIMEType:properties:](&v9, sel__initByReferencingFileURL_MIMEType_properties_, a3, a4, a5);
  v6 = v5;
  if (v5)
    v7 = v5;

  return v6;
}

- (LPVideo)initWithData:(id)a3 MIMEType:(id)a4 properties:(id)a5
{
  LPVideo *v5;
  LPVideo *v6;
  LPVideo *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LPVideo;
  v5 = -[LPVisualMedia _initWithData:MIMEType:properties:](&v9, sel__initWithData_MIMEType_properties_, a3, a4, a5);
  v6 = v5;
  if (v5)
    v7 = v5;

  return v6;
}

- (LPVideo)initWithStreamingURL:(id)a3 hasAudio:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  LPVideoProperties *v7;
  LPVideo *v8;
  LPVideo *v9;
  LPVideo *v10;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init(LPVideoProperties);
  -[LPVideoProperties setHasAudio:](v7, "setHasAudio:", v4);
  v8 = -[LPVideo initWithStreamingURL:properties:](self, "initWithStreamingURL:properties:", v6, v7);
  v9 = v8;
  if (v8)
    v10 = v8;

  return v9;
}

- (LPVideo)initWithStreamingURL:(id)a3 properties:(id)a4
{
  id v7;
  LPVideo *v8;
  LPVideo *v9;
  LPVideo *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPVideo;
  v8 = -[LPVisualMedia initWithProperties:](&v12, sel_initWithProperties_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_streamingURL, a3);
    v10 = v9;
  }

  return v9;
}

- (LPVideo)initWithYouTubeURL:(id)a3
{
  id v4;
  LPVideoProperties *v5;
  LPVideo *v6;
  LPVideo *v7;
  LPVideo *v8;

  v4 = a3;
  v5 = objc_alloc_init(LPVideoProperties);
  -[LPVideoProperties setHasAudio:](v5, "setHasAudio:", 1);
  v6 = -[LPVideo initWithYouTubeURL:properties:](self, "initWithYouTubeURL:properties:", v4, v5);
  v7 = v6;
  if (v6)
    v8 = v6;

  return v7;
}

- (LPVideo)initWithYouTubeURL:(id)a3 properties:(id)a4
{
  id v7;
  id v8;
  LPVideo *v9;
  LPVideo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LPVideo;
  v9 = -[LPVisualMedia initWithProperties:](&v12, sel_initWithProperties_, v8);
  if (v9
    && +[LPPresentationSpecializations isYouTubeEmbedURL:](LPPresentationSpecializations, "isYouTubeEmbedURL:", v7))
  {
    objc_storeStrong((id *)&v9->_youTubeURL, a3);
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (LPVideo)initWithItemProvider:(id)a3 properties:(id)a4
{
  id v7;
  LPVideo *v8;
  LPVideo *v9;
  LPVideo *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPVideo;
  v8 = -[LPVisualMedia initWithProperties:](&v12, sel_initWithProperties_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_itemProvider, a3);
    v10 = v9;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[LPVideo _uninstallMediaServicesResetNotificationHandler](self, "_uninstallMediaServicesResetNotificationHandler");
  v3.receiver = self;
  v3.super_class = (Class)LPVideo;
  -[LPVideo dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPVideo)initWithCoder:(id)a3
{
  id v4;
  LPVideoProperties *v5;
  void *v6;
  LPVideo *v7;
  uint64_t v8;
  NSURL *streamingURL;
  uint64_t v10;
  NSURL *youTubeURL;
  LPVideo *v12;
  objc_super v14;

  v4 = a3;
  v5 = objc_alloc_init(LPVideoProperties);
  -[LPVideoProperties setHasAudio:](v5, "setHasAudio:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAudio")));
  objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("overlappingControlsColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPVideoProperties _setOverlappingControlsColor:](v5, "_setOverlappingControlsColor:", v6);

  v14.receiver = self;
  v14.super_class = (Class)LPVideo;
  v7 = -[LPVisualMedia initWithCoder:properties:](&v14, sel_initWithCoder_properties_, v4, v5);
  if (v7)
  {
    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("streamingURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    streamingURL = v7->_streamingURL;
    v7->_streamingURL = (NSURL *)v8;

    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("youTubeURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    youTubeURL = v7->_youTubeURL;
    v7->_youTubeURL = (NSURL *)v10;

    v12 = v7;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[16];

  v4 = a3;
  if (-[LPVideo needsAsynchronousLoad](self, "needsAsynchronousLoad"))
  {
    if (objc_msgSend(v4, "_lp_coderType") != 1)
    {
      v5 = LPLogChannelSerialization();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0C41000, v5, OS_LOG_TYPE_DEFAULT, "Trying to encode an LPVideo with an unloaded item provider.", buf, 2u);
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)LPVideo;
  -[LPVisualMedia encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_streamingURL, CFSTR("streamingURL"));
  objc_msgSend(v4, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_youTubeURL, CFSTR("youTubeURL"));
  -[LPVisualMedia properties](self, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v6, "hasAudio"), CFSTR("hasAudio"));

  -[LPVisualMedia properties](self, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_overlappingControlsColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", v8, CFSTR("overlappingControlsColor"));

}

- (BOOL)_canEncodeWithoutComputation
{
  void *v3;
  BOOL v4;
  void *v6;

  -[LPVisualMedia fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  if (self->_streamingURL || self->_youTubeURL)
    return 1;
  -[LPVisualMedia _cachedData](self, "_cachedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6 != 0;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void **v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPVideo;
  if (-[LPVisualMedia isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_1(v6[14], self->_streamingURL) & 1) != 0)
        v5 = objectsAreEqual_1(v6[15], self->_youTubeURL);
      else
        v5 = 0;

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)setFileURL:(id)a3
{
  id v4;
  objc_super *v5;
  id v6;
  LPVideo *v7;
  objc_super v8;

  v4 = a3;
  if ((objc_msgSend(v4, "isFileURL") & 1) != 0)
  {
    v7 = self;
    v5 = (objc_super *)&v7;
    v6 = v4;
  }
  else
  {
    v6 = 0;
    v8.receiver = self;
    v5 = &v8;
  }
  v5->super_class = (Class)LPVideo;
  -[objc_super setFileURL:](v5, sel_setFileURL_, v6, v7);

}

- (BOOL)hasAudio
{
  void *v2;
  char v3;

  -[LPVisualMedia properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasAudio");

  return v3;
}

- (BOOL)_isSubstitute
{
  return 0;
}

- (CGSize)_intrinsicSizeIfKnown
{
  double width;
  double height;
  CGSize result;

  width = self->_intrinsicSize.width;
  height = self->_intrinsicSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_intrinsicSizeWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD, __n128, __n128);
  __n128 v5;
  __n128 v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  LPVideo *v17;
  void (**v18)(_QWORD, __n128, __n128);
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD, __n128, __n128))a3;
  if (*(_OWORD *)&self->_streamingURL != 0)
    goto LABEL_2;
  -[LPVisualMedia fileURL](self, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    -[LPVisualMedia data](self, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
LABEL_2:
      v5.n128_u64[0] = *MEMORY[0x1E0C9D820];
      v6.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D820] + 8);
LABEL_3:
      v4[2](v4, v5, v6);
      goto LABEL_4;
    }
  }
  v5.n128_u64[0] = *(_QWORD *)&self->_intrinsicSize.width;
  v6.n128_u64[0] = *(_QWORD *)&self->_intrinsicSize.height;
  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v5.n128_f64[0] != *MEMORY[0x1E0C9D820] || v6.n128_f64[0] != v10)
    goto LABEL_3;
  -[LPVideo _asset](self, "_asset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && !self->_startedFetchingIntrinsicSize)
  {
    self->_startedFetchingIntrinsicSize = 1;
    v19 = CFSTR("tracks");
    v20[0] = &unk_1E44F02B8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __47__LPVideo__intrinsicSizeWithCompletionHandler___block_invoke;
    v14[3] = &unk_1E44A94D0;
    v15 = v12;
    v17 = self;
    v18 = v4;
    v16 = &unk_1E44F02B8;
    objc_msgSend(v15, "loadValuesAsynchronouslyForKeys:keysForCollectionKeys:completionHandler:", &unk_1E44F02D0, v13, v14);

  }
  else
  {
    ((void (*)(void (**)(_QWORD, __n128, __n128), double, double))v4[2])(v4, v9, v10);
  }

LABEL_4:
}

void __47__LPVideo__intrinsicSizeWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v11;
  double v12;
  double v13;
  float64x2_t v14;
  float64x2_t v15;
  id v16;
  double v17;
  double v18;
  _QWORD v19[5];
  id v20;
  float64x2_t v21;
  float64x2_t v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD block[4];
  id v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "statusOfValueForKey:error:", CFSTR("tracks"), 0) == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v2 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v31 != v4)
            objc_enumerationMutation(v2);
          v6 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v7 = *(id *)(a1 + 40);
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
          if (v8)
          {
            v9 = *(_QWORD *)v27;
            while (2)
            {
              for (j = 0; j != v8; ++j)
              {
                if (*(_QWORD *)v27 != v9)
                  objc_enumerationMutation(v7);
                if (objc_msgSend(v6, "statusOfValueForKey:error:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j), 0) != 2)
                {
                  v24[0] = MEMORY[0x1E0C809B0];
                  v24[1] = 3221225472;
                  v24[2] = __47__LPVideo__intrinsicSizeWithCompletionHandler___block_invoke_3;
                  v24[3] = &unk_1E44A8418;
                  v25 = *(id *)(a1 + 56);
                  dispatch_async(MEMORY[0x1E0C80D38], v24);

                  goto LABEL_22;
                }
              }
              v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
              if (v8)
                continue;
              break;
            }
          }

          if (objc_msgSend(v6, "isPlayable") && objc_msgSend(v6, "isEnabled"))
          {
            v11 = *(_QWORD *)(a1 + 48);
            objc_msgSend(v6, "naturalSize");
            v17 = v13;
            v18 = v12;
            if (v6)
            {
              objc_msgSend(v6, "preferredTransform");
              v14 = v21;
              v15 = v22;
            }
            else
            {
              v14 = 0uLL;
              v22 = 0u;
              v23 = 0u;
              v21 = 0u;
              v15 = 0uLL;
            }
            *(float64x2_t *)(v11 + 72) = vmlaq_n_f64(vmulq_n_f64(v15, v17), v14, v18);
            *(float64x2_t *)(*(_QWORD *)(a1 + 48) + 72) = vabsq_f64(*(float64x2_t *)(*(_QWORD *)(a1 + 48) + 72));
            v19[0] = MEMORY[0x1E0C809B0];
            v19[1] = 3221225472;
            v19[2] = __47__LPVideo__intrinsicSizeWithCompletionHandler___block_invoke_4;
            v19[3] = &unk_1E44A7E78;
            v16 = *(id *)(a1 + 56);
            v19[4] = *(_QWORD *)(a1 + 48);
            v20 = v16;
            dispatch_async(MEMORY[0x1E0C80D38], v19);
            v7 = v20;
LABEL_22:

            goto LABEL_23;
          }
        }
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_23:

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__LPVideo__intrinsicSizeWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E44A8418;
    v35 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v2 = v35;
  }

}

uint64_t __47__LPVideo__intrinsicSizeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(*MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

uint64_t __47__LPVideo__intrinsicSizeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(*MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

uint64_t __47__LPVideo__intrinsicSizeWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(double *)(*(_QWORD *)(a1 + 32) + 72), *(double *)(*(_QWORD *)(a1 + 32) + 80));
}

- (BOOL)needsAsynchronousLoad
{
  return self->_itemProvider != 0;
}

- (BOOL)hasPlaceholderValueForAsynchronousLoad
{
  return 0;
}

- (void)loadAsynchronouslyWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *itemProviderLoadGroup;
  uint64_t v6;
  OS_dispatch_group *v7;
  OS_dispatch_group *v8;
  NSItemProvider *itemProvider;
  id v10;
  _QWORD block[5];
  id v12;
  _QWORD v13[5];

  v4 = a3;
  itemProviderLoadGroup = self->_itemProviderLoadGroup;
  v6 = MEMORY[0x1E0C809B0];
  if (!itemProviderLoadGroup)
  {
    v7 = (OS_dispatch_group *)dispatch_group_create();
    v8 = self->_itemProviderLoadGroup;
    self->_itemProviderLoadGroup = v7;

    dispatch_group_enter((dispatch_group_t)self->_itemProviderLoadGroup);
    itemProvider = self->_itemProvider;
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __51__LPVideo_loadAsynchronouslyWithCompletionHandler___block_invoke_2;
    v13[3] = &unk_1E44A7F38;
    v13[4] = self;
    -[NSItemProvider _lp_loadFirstDataRepresentationMatchingMIMETypePredicate:completionHandler:](itemProvider, "_lp_loadFirstDataRepresentationMatchingMIMETypePredicate:completionHandler:", &__block_literal_global_15, v13);
    itemProviderLoadGroup = self->_itemProviderLoadGroup;
  }
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __51__LPVideo_loadAsynchronouslyWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E44A7F60;
  block[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_group_notify(itemProviderLoadGroup, MEMORY[0x1E0C80D38], block);

}

BOOL __51__LPVideo_loadAsynchronouslyWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[LPMIMETypeRegistry isVideoType:](LPMIMETypeRegistry, "isVideoType:", a2);
}

void __51__LPVideo_loadAsynchronouslyWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  LPVideo *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
  {
    v6 = -[LPVideo initWithData:MIMEType:hasAudio:]([LPVideo alloc], "initWithData:MIMEType:hasAudio:", v9, v5, 1);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 56);
    *(_QWORD *)(v7 + 56) = v6;

  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 64));

}

uint64_t __51__LPVideo_loadAsynchronouslyWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  *(_QWORD *)(v2 + 64) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (NSItemProvider)_itemProvider
{
  NSItemProvider *itemProvider;
  NSItemProvider *v3;
  void *v5;
  void *v6;
  void *v7;

  itemProvider = self->_itemProvider;
  if (itemProvider)
  {
    v3 = itemProvider;
  }
  else
  {
    -[LPVisualMedia data](self, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB36C8];
    -[LPVisualMedia MIMEType](self, "MIMEType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_lp_itemProviderWithData:MIMEType:", v5, v7);
    v3 = (NSItemProvider *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (AVAsset)_asset
{
  id *p_asset;
  AVURLAsset *asset;
  NSURL *streamingURL;
  NSURL *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  OS_dispatch_queue *v29;
  OS_dispatch_queue *mediaLoadingQueue;
  void *v31;
  id v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  p_asset = (id *)&self->_asset;
  asset = self->_asset;
  if (asset)
    return (AVAsset *)asset;
  streamingURL = self->_streamingURL;
  if (streamingURL)
  {
    v7 = streamingURL;
    +[LPTestingOverrides customLoader](LPTestingOverrides, "customLoader");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      +[LPTestingOverrides customLoader](LPTestingOverrides, "customLoader");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "overrideURLForMediaURL:", v7);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (NSURL *)v10;
    }
    objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *p_asset;
    *p_asset = (id)v11;

    +[LPTestingOverrides customLoader](LPTestingOverrides, "customLoader");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      +[LPTestingOverrides customLoader](LPTestingOverrides, "customLoader");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_asset, "resourceLoader");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "installCustomMediaLoader:", v15);

    }
    -[LPVideo _installMediaServicesResetNotificationHandler](self, "_installMediaServicesResetNotificationHandler");
    v16 = *p_asset;

    return (AVAsset *)v16;
  }
  else
  {
    -[LPVisualMedia data](self, "data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0C8B3C0];
      v19 = (void *)MEMORY[0x1E0C99E98];
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("link-presentation-video://video/%@"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "URLWithString:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *MEMORY[0x1E0C8ADC0];
      v33[0] = *MEMORY[0x1E0C8ADA0];
      v33[1] = v25;
      v34[0] = &unk_1E44EEAF8;
      v34[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "URLAssetWithURL:options:", v24, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!self->_mediaLoadingQueue)
      {
        dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.LinkPresentation.MediaFetching", v28);
        mediaLoadingQueue = self->_mediaLoadingQueue;
        self->_mediaLoadingQueue = v29;

      }
      objc_msgSend(v27, "resourceLoader");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setDelegate:queue:", self, self->_mediaLoadingQueue);

      objc_storeStrong(p_asset, v27);
      -[LPVideo _installMediaServicesResetNotificationHandler](self, "_installMediaServicesResetNotificationHandler");
      v32 = *p_asset;

      return (AVAsset *)v32;
    }
    else
    {
      return (AVAsset *)0;
    }
  }
}

- (void)_installMediaServicesResetNotificationHandler
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id mediaServicesResetNotificationHandler;
  _QWORD v10[5];

  -[LPVideo _uninstallMediaServicesResetNotificationHandler](self, "_uninstallMediaServicesResetNotificationHandler");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[LPMediaPlaybackManager shared](LPMediaPlaybackManager, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C89738];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__LPVideo__installMediaServicesResetNotificationHandler__block_invoke;
  v10[3] = &unk_1E44A94F8;
  v10[4] = self;
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v7, v5, v6, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  mediaServicesResetNotificationHandler = self->_mediaServicesResetNotificationHandler;
  self->_mediaServicesResetNotificationHandler = v8;

}

uint64_t __56__LPVideo__installMediaServicesResetNotificationHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 96);
  *(_QWORD *)(v2 + 96) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_uninstallMediaServicesResetNotificationHandler");
}

- (void)_uninstallMediaServicesResetNotificationHandler
{
  void *v3;
  id mediaServicesResetNotificationHandler;

  if (self->_mediaServicesResetNotificationHandler)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_mediaServicesResetNotificationHandler);

    mediaServicesResetNotificationHandler = self->_mediaServicesResetNotificationHandler;
  }
  else
  {
    mediaServicesResetNotificationHandler = 0;
  }
  self->_mediaServicesResetNotificationHandler = 0;

}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  BOOL v29;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVURLAsset URL](self->_asset, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) != 0)
  {
    objc_msgSend(v7, "contentInformationRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[LPVisualMedia MIMEType](self, "MIMEType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[LPMIMETypeRegistry UTIForMIMEType:](LPMIMETypeRegistry, "UTIForMIMEType:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "contentInformationRequest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setContentType:", v14);

      -[LPVisualMedia data](self, "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "length");
      objc_msgSend(v7, "contentInformationRequest");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setContentLength:", v17);

      objc_msgSend(v7, "contentInformationRequest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setByteRangeAccessSupported:", 1);

    }
    objc_msgSend(v7, "dataRequest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v7, "dataRequest");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "requestedOffset");
      -[LPVisualMedia data](self, "data");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "length");
      v25 = v24 - objc_msgSend(v21, "requestedOffset");

      if (!v25)
        goto LABEL_15;
      if ((objc_msgSend(v21, "requestsAllDataToEndOfResource") & 1) == 0)
      {
        v26 = objc_msgSend(v21, "requestedLength");
        if (v26 < v25)
          v25 = v26;
      }
      -[LPVisualMedia data](self, "data");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "subdataWithRange:", v22, v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
LABEL_15:

        v29 = 0;
        goto LABEL_14;
      }
      objc_msgSend(v21, "respondWithData:", v28);

    }
    objc_msgSend(v7, "finishLoading");
  }
  else
  {
    objc_msgSend(v7, "finishLoadingWithError:", 0);
  }
  v29 = 1;
LABEL_14:

  return v29;
}

- (NSURL)streamingURL
{
  return self->_streamingURL;
}

- (NSURL)youTubeURL
{
  return self->_youTubeURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_youTubeURL, 0);
  objc_storeStrong((id *)&self->_streamingURL, 0);
  objc_storeStrong(&self->_mediaServicesResetNotificationHandler, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_itemProviderLoadGroup, 0);
  objc_storeStrong((id *)&self->_videoLoadedFromItemProvider, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_mediaLoadingQueue, 0);
}

@end
