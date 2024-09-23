@implementation JFXVideoMediaItem

- (void)loadAVAssetWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  int v16;
  int v17;
  double v18;
  dispatch_time_t v19;
  _QWORD v20[4];
  NSObject *v21;
  void (**v22)(_QWORD, _QWORD);
  void (**v23)(_QWORD);
  _QWORD v24[5];

  v4 = (void (**)(_QWORD))a3;
  -[JFXMediaItem delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaItemWillLoad:", self);

  v6 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __54__JFXVideoMediaItem_loadAVAssetWithCompletionHandler___block_invoke;
  v24[3] = &unk_24EE5C0A8;
  v24[4] = self;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x2276A1F6C](v24);
  -[JTAssetMediaItem asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v4)
      v9 = 0;
    else
      v9 = dispatch_semaphore_create(0);
    -[JFXVideoMediaItem videoMediaItemUtils](self, "videoMediaItemUtils");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[JTAssetMediaItem asset](self, "asset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[JFXVideoMediaItem needsDerivativeMedia](self, "needsDerivativeMedia");
    -[JFXVideoMediaItem frameRate](self, "frameRate");
    v17 = v16;
    v20[0] = v6;
    v20[1] = 3221225472;
    v20[2] = __54__JFXVideoMediaItem_loadAVAssetWithCompletionHandler___block_invoke_2;
    v20[3] = &unk_24EE5C0D0;
    v22 = v7;
    v23 = v4;
    v12 = v9;
    v21 = v12;
    LODWORD(v18) = v17;
    objc_msgSend(v13, "requestAVAssetAsyncWithAsset:needsDerivativeMedia:frameRate:completion:", v14, v15, v20, v18);

    if (v12)
    {
      v19 = dispatch_time(0, 5000000000);
      dispatch_semaphore_wait(v12, v19);
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDB2378];
    -[JTLocalAssetMediaItem localFileURL](self, "localFileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetWithURL:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, NSObject *))v7)[2](v7, v12);
    if (v4)
      v4[2](v4);
  }

}

void __54__JFXVideoMediaItem_loadAVAssetWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setAvAsset:", v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "URL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAssetLocalURL:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "cacheAssetInformation");
  if (+[CFXVideoSettings canDecodeHEVC2160P](CFXVideoSettings, "canDecodeHEVC2160P"))
  {
    objc_msgSend(*(id *)(a1 + 32), "videoMediaItemUtils");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 114) = objc_msgSend(v4, "isOriginalHEVC4k");

  }
  objc_msgSend(*(id *)(a1 + 32), "setMediaLoadState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaItemDidLoad:error:", *(_QWORD *)(a1 + 32), 0);

}

NSObject *__54__JFXVideoMediaItem_loadAVAssetWithCompletionHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  NSObject *result;

  (*(void (**)(void))(a1[5] + 16))();
  v2 = a1[6];
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  result = a1[4];
  if (result)
    return dispatch_semaphore_signal(result);
  return result;
}

+ (void)videoMediaItemWithLocalURL:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  id v11;
  void *v12;
  objc_super v13;

  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___JFXVideoMediaItem;
  v10 = a3;
  v11 = objc_msgSendSuper2(&v13, sel_alloc);
  v12 = (void *)objc_msgSend(v11, "initWithURL:", v10, v13.receiver, v13.super_class);

  if (v12)
  {
    objc_msgSend(v12, "setDelegate:", v8);
    objc_msgSend(v12, "commonInit");
    objc_msgSend(v12, "setMediaState:", 0);
    objc_msgSend(v12, "setMediaLoadState:", 0);
    objc_msgSend(v12, "checkIfAssetIsMissing");
    objc_msgSend(v12, "loadAVAssetWithCompletionHandler:", 0);
    v9[2](v9, v12, 0);
  }

}

- (void)commonInit
{
  JTVideoMediaUtils *v3;
  id v4;

  -[JFXMediaItem setMediaType:](self, "setMediaType:", 1);
  -[JFXVideoMediaItem setMediaStartOffset:](self, "setMediaStartOffset:", 0);
  v3 = objc_alloc_init(JTVideoMediaUtils);
  -[JFXVideoMediaItem setVideoMediaItemUtils:](self, "setVideoMediaItemUtils:", v3);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_mediaserverdCrashed, CFSTR("mediaserverdCrashed"), 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("mediaserverdCrashed"), 0);

  v4.receiver = self;
  v4.super_class = (Class)JFXVideoMediaItem;
  -[JTAssetMediaItem dealloc](&v4, sel_dealloc);
}

- (void)reloadAVAsset
{
  void *v3;

  -[JFXVideoMediaItem videoMediaItemUtils](self, "videoMediaItemUtils");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateCachedAssetInformation");

  -[JFXVideoMediaItem loadAVAssetWithCompletionHandler:](self, "loadAVAssetWithCompletionHandler:", 0);
}

- (void)mediaserverdCrashed
{
  -[JFXMediaItem setMediaLoadState:](self, "setMediaLoadState:", 0);
  -[JFXVideoMediaItem setAvAsset:](self, "setAvAsset:", 0);
  -[JFXVideoMediaItem loadAVAssetWithCompletionHandler:](self, "loadAVAssetWithCompletionHandler:", 0);
}

- (id)assetURL
{
  void *v3;

  -[JTAssetMediaItem assetIdentifier](self, "assetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[JTAssetMediaItem assetLocalURL](self, "assetLocalURL");
  else
    -[JTLocalAssetMediaItem localFileURL](self, "localFileURL");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  JTVideoMediaUtils *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)JFXVideoMediaItem;
  v4 = -[JTAssetMediaItem copyWithZone:](&v9, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 15, self->_avAsset);
  *((_BYTE *)v4 + 113) = self->_capturedByInAppCamera;
  v5 = objc_alloc_init(JTVideoMediaUtils);
  v6 = v4[16];
  v4[16] = v5;

  *((_BYTE *)v4 + 114) = self->_originalIsHEVC4k;
  objc_msgSend(v4, "cacheAssetInformation");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel_mediaserverdCrashed, CFSTR("mediaserverdCrashed"), 0);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)JFXVideoMediaItem;
  return -[JTAssetMediaItem isEqual:](&v4, sel_isEqual_, a3);
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JFXVideoMediaItem;
  return -[JTAssetMediaItem hash](&v3, sel_hash);
}

- (void)cacheAssetInformation
{
  void *v3;
  id v4;

  -[JFXVideoMediaItem videoMediaItemUtils](self, "videoMediaItemUtils");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXVideoMediaItem avAsset](self, "avAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheTrackInformationWithAVAsset:", v3);

}

- (BOOL)canBeAddedToSequence
{
  return 1;
}

- (BOOL)hasVisualCharacteristic
{
  return 1;
}

- (BOOL)hasAudibleCharacteristic
{
  uint64_t v3;
  void *v4;

  v3 = -[JFXMediaItem mediaState](self, "mediaState") == 2;
  -[JFXVideoMediaItem videoMediaItemUtils](self, "videoMediaItemUtils");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "hasAudibleCharacteristicWithIsMissing:", v3);

  return v3;
}

- (CGSize)naturalSize
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v3 = -[JFXMediaItem mediaState](self, "mediaState") == 2;
  -[JFXVideoMediaItem videoMediaItemUtils](self, "videoMediaItemUtils");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[JTAssetMediaItem asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "naturalSizeWithIsMissing:asset:", v3, v5);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGAffineTransform)transform
{
  void *v4;
  CGAffineTransform *result;
  void *v6;

  -[JFXVideoMediaItem videoMediaItemUtils](self, "videoMediaItemUtils");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "transform");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (CGSize)naturalSizeWithTransform
{
  double v3;
  double v4;
  float64x2_t v5;
  double v6;
  double v7;
  double v8;
  float64x2_t v9;
  float64x2_t v10;
  CGSize result;

  -[JFXVideoMediaItem naturalSize](self, "naturalSize");
  v7 = v4;
  v8 = v3;
  -[JFXVideoMediaItem transform](self, "transform");
  v5 = vabsq_f64(vmlaq_n_f64(vmulq_n_f64(v10, v7), v9, v8));
  v6 = v5.f64[1];
  result.width = v5.f64[0];
  result.height = v6;
  return result;
}

- (float)frameRate
{
  void *v2;
  float v3;
  float v4;

  -[JFXVideoMediaItem videoMediaItemUtils](self, "videoMediaItemUtils");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frameRate");
  v4 = v3;

  return v4;
}

- (id)colorSpace
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[JFXVideoMediaItem videoMediaItemUtils](self, "videoMediaItemUtils");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE78FF8], "rec709GammaColorSpace");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (BOOL)hasVideoTracks
{
  void *v2;
  char v3;

  -[JFXVideoMediaItem videoMediaItemUtils](self, "videoMediaItemUtils");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasVideoTracks");

  return v3;
}

- (int)durationAt30fps
{
  void *v3;
  void *v4;
  int v5;

  -[JFXVideoMediaItem videoMediaItemUtils](self, "videoMediaItemUtils");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[JTAssetMediaItem asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "duration");
  v5 = objc_msgSend(v3, "durationAt30fpsWithAssetDuration:");

  return v5;
}

- (BOOL)needsDerivativeMedia
{
  if (self->_originalIsHEVC4k)
    return !+[CFXVideoSettings canDecodeHEVC2160P](CFXVideoSettings, "canDecodeHEVC2160P");
  else
    return 0;
}

- (BOOL)isUnsupportedAudio
{
  void *v2;
  char v3;

  -[JFXVideoMediaItem videoMediaItemUtils](self, "videoMediaItemUtils");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnsupportedAudio");

  return v3;
}

- (void)setAssetIs4kHEVC:(BOOL)a3
{
  if (self->_originalIsHEVC4k != a3)
    self->_originalIsHEVC4k = a3;
}

- (CGAffineTransform)transform:(SEL)a3 fillDest:(CGSize)a4
{
  uint64_t v5;
  __int128 v6;

  v5 = MEMORY[0x24BDBD8B8];
  v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  return self;
}

- (BOOL)hasAudioTracks
{
  void *v2;
  char v3;

  -[JFXVideoMediaItem videoMediaItemUtils](self, "videoMediaItemUtils");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasAudioTracks");

  return v3;
}

- (id)info
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v10.receiver = self;
  v10.super_class = (Class)JFXVideoMediaItem;
  -[JTAssetMediaItem info](&v10, sel_info);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_capturedByInAppCamera);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, kRecordedWithInAppCamera);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_mediaStartOffset);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, kMediaStartOffset);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_originalIsHEVC4k);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, kOriginalIsHEVC4kAsset);

  return v5;
}

- (AVAsset)avAsset
{
  return self->_avAsset;
}

- (void)setAvAsset:(id)a3
{
  objc_storeStrong((id *)&self->_avAsset, a3);
}

- (int)mediaStartOffset
{
  return self->_mediaStartOffset;
}

- (void)setMediaStartOffset:(int)a3
{
  self->_mediaStartOffset = a3;
}

- (BOOL)isHighFrameRate
{
  return self->_isHighFrameRate;
}

- (BOOL)capturedByInAppCamera
{
  return self->_capturedByInAppCamera;
}

- (void)setCapturedByInAppCamera:(BOOL)a3
{
  self->_capturedByInAppCamera = a3;
}

- (JTVideoMediaUtils)videoMediaItemUtils
{
  return self->_videoMediaItemUtils;
}

- (void)setVideoMediaItemUtils:(id)a3
{
  objc_storeStrong((id *)&self->_videoMediaItemUtils, a3);
}

- (BOOL)originalIsHEVC4k
{
  return self->_originalIsHEVC4k;
}

- (void)setOriginalIsHEVC4k:(BOOL)a3
{
  self->_originalIsHEVC4k = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoMediaItemUtils, 0);
  objc_storeStrong((id *)&self->_avAsset, 0);
}

@end
