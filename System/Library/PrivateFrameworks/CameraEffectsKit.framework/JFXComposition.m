@implementation JFXComposition

- (float)JFX_preferredRenderScale
{
  void *v3;
  char v4;
  BOOL v5;
  float v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  int v27;
  double v28;
  double v29;

  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isExporting");

  v5 = -[JFXComposition JFX_hasEffectThatRequiresCustomRendering](self, "JFX_hasEffectThatRequiresCustomRendering");
  v6 = 1.0;
  if ((v4 & 1) == 0 && !v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerForKey:", CFSTR("VideoScaling"));

    if ((unint64_t)(v8 - 1) <= 3)
      v6 = flt_226AB70D0[v8 - 1];
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerForKey:", CFSTR("PVVideoCompositingContextProxyModeKey"));

    if (!v10)
    {
      -[JFXComposition viewSize](self, "viewSize");
      v12 = v11;
      v14 = v13;
      -[JFXComposition clipsDataSource](self, "clipsDataSource");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "imageScale");
      v17 = v12 * v16;
      -[JFXComposition previousRenderSize](self, "previousRenderSize");
      v19 = v17 / v18;

      -[JFXComposition clipsDataSource](self, "clipsDataSource");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "imageScale");
      v22 = v14 * v21;
      -[JFXComposition previousRenderSize](self, "previousRenderSize");
      v24 = v22 / v23;

      if (v19 >= v24)
        v19 = v24;
      if (v19 > 1.0)
      {
        -[JFXComposition clipsDataSource](self, "clipsDataSource");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v25, "screenCanShow2160P") & 1) != 0)
        {
          -[JFXComposition clipsDataSource](self, "clipsDataSource");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "use2160Pcontent:", 0);

          v28 = fmin(v19, 2.0);
          if (v27)
            v19 = v28;
          else
            v19 = 1.0;
        }
        else
        {

          v19 = 1.0;
        }
      }
      v29 = 0.35;
      if (v19 > 0.35)
        v29 = v19;
      return v29 * v6;
    }
  }
  return v6;
}

- (void)setRenderScale
{
  int v3;
  int v4;
  double v5;
  id v6;

  -[JFXComposition JFX_preferredRenderScale](self, "JFX_preferredRenderScale");
  v4 = v3;
  -[JFXComposition videoComposition](self, "videoComposition");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = v4;
  objc_msgSend(v6, "setRenderScale:", v5);

}

- (BOOL)JFX_hasEffectThatRequiresCustomRendering
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;

  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "playableElementAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "hasPlayableEffectOfType:", 7);
  if ((v5 & 1) != 0)
    return 1;
  v8 = 1;
  do
  {
    v9 = v8;
    if (v4 == v8)
      break;
    -[JFXComposition clipsDataSource](self, "clipsDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playableElementAtIndex:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v10) = objc_msgSend(v11, "hasPlayableEffectOfType:", 7);
    v8 = v9 + 1;
  }
  while (!(_DWORD)v10);
  return v9 < v4;
}

- (JFXComposition)initWithClipsDataSource:(id)a3
{
  id v5;
  JFXComposition *v6;
  JFXComposition *v7;
  id v8;
  id v9;
  id v10;
  JFXCompositionTrackGroup *v11;
  void *v12;
  JFXCompositionTrackGroup *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  JFXCompositionTrackGroup *v27;
  void *v28;
  JFXCompositionTrackGroup *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  double v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSMapTable *clipCustomRendererMap;
  uint64_t v48;
  NSMapTable *clipFaceTrackingPlaybackDelegates;
  __int128 v51;
  _OWORD v52[3];
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  CMTime v58;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  __int128 v63;
  uint64_t v64;
  __int128 v65;
  uint64_t v66;
  objc_super v67;

  v5 = a3;
  v67.receiver = self;
  v67.super_class = (Class)JFXComposition;
  v6 = -[JFXComposition init](&v67, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clipsDataSource, a3);
    -[JFXComposition markDirty](v7, "markDirty");
    v8 = objc_alloc_init(MEMORY[0x24BDB25B0]);
    -[JFXComposition setAvComposition:](v7, "setAvComposition:", v8);

    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[JFXComposition setVideoCompositionInstructions:](v7, "setVideoCompositionInstructions:", v9);

    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[JFXComposition setAudioMixParameters:](v7, "setAudioMixParameters:", v10);

    v11 = [JFXCompositionTrackGroup alloc];
    -[JFXComposition clipsDataSource](v7, "clipsDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[JFXCompositionTrackGroup initWithLabel:timeScale:](v11, "initWithLabel:timeScale:", CFSTR("A"), objc_msgSend(v12, "timeScale"));
    -[JFXComposition setTrackGroupA:](v7, "setTrackGroupA:", v13);

    -[JFXComposition avComposition](v7, "avComposition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x24BDB1D50];
    objc_msgSend(v14, "addMutableTrackWithMediaType:preferredTrackID:", *MEMORY[0x24BDB1D50], 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXComposition trackGroupA](v7, "trackGroupA");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setVideoTrack:", v16);

    -[JFXComposition avComposition](v7, "avComposition");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x24BDB1CF0];
    objc_msgSend(v18, "addMutableTrackWithMediaType:preferredTrackID:", *MEMORY[0x24BDB1CF0], 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXComposition trackGroupA](v7, "trackGroupA");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAudioTrack:", v20);

    -[JFXComposition avComposition](v7, "avComposition");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXComposition trackGroupA](v7, "trackGroupA");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setComposition:", v22);

    -[JFXComposition trackGroupA](v7, "trackGroupA");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = *MEMORY[0x24BDC0D88];
    v51 = v65;
    v66 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    v25 = v66;
    objc_msgSend(v24, "setFadeOutStart:", &v65);

    -[JFXComposition trackGroupA](v7, "trackGroupA");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v51;
    v64 = v25;
    objc_msgSend(v26, "setFadeOutDuration:", &v63);

    v27 = [JFXCompositionTrackGroup alloc];
    -[JFXComposition clipsDataSource](v7, "clipsDataSource");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[JFXCompositionTrackGroup initWithLabel:timeScale:](v27, "initWithLabel:timeScale:", CFSTR("B"), objc_msgSend(v28, "timeScale"));
    -[JFXComposition setTrackGroupB:](v7, "setTrackGroupB:", v29);

    -[JFXComposition avComposition](v7, "avComposition");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addMutableTrackWithMediaType:preferredTrackID:", v15, 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXComposition trackGroupB](v7, "trackGroupB");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setVideoTrack:", v31);

    -[JFXComposition avComposition](v7, "avComposition");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addMutableTrackWithMediaType:preferredTrackID:", v19, 4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXComposition trackGroupB](v7, "trackGroupB");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setAudioTrack:", v34);

    -[JFXComposition avComposition](v7, "avComposition");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXComposition trackGroupB](v7, "trackGroupB");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setComposition:", v36);

    -[JFXComposition trackGroupB](v7, "trackGroupB");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v51;
    v62 = v25;
    objc_msgSend(v38, "setFadeOutStart:", &v61);

    -[JFXComposition trackGroupB](v7, "trackGroupB");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v51;
    v60 = v25;
    objc_msgSend(v39, "setFadeOutDuration:", &v59);

    v40 = objc_alloc_init(MEMORY[0x24BDB25C8]);
    -[JFXComposition setVideoComposition:](v7, "setVideoComposition:", v40);

    v41 = objc_alloc_init(MEMORY[0x24BDB25A0]);
    -[JFXComposition setAudioMix:](v7, "setAudioMix:", v41);

    LODWORD(v42) = 1.0;
    -[JFXComposition setGlobalAudioVolume:](v7, "setGlobalAudioVolume:", v42);
    v43 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[JFXComposition setAssetsUsed:](v7, "setAssetsUsed:", v43);

    -[JFXComposition videoComposition](v7, "videoComposition");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXComposition clipsDataSource](v7, "clipsDataSource");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMake(&v58, 1, objc_msgSend(v45, "timeScale"));
    objc_msgSend(v44, "setFrameDuration:", &v58);

    v7->_viewSize = (CGSize)*MEMORY[0x24BDBF148];
    -[JFXComposition setPreviousRenderSize:](v7, "setPreviousRenderSize:", v7->_viewSize.width, v7->_viewSize.height);
    -[JFXComposition markDirty](v7, "markDirty");
    -[JFXComposition setLiveTransformClip:](v7, "setLiveTransformClip:", 0);
    PVTransformAnimationInfoIdentity();
    v52[0] = v54;
    v52[1] = v55;
    v52[2] = v56;
    v53 = v57;
    -[JFXComposition setLiveCompositionTransform:](v7, "setLiveCompositionTransform:", v52);
    v46 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 2);
    clipCustomRendererMap = v7->_clipCustomRendererMap;
    v7->_clipCustomRendererMap = (NSMapTable *)v46;

    v48 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 2);
    clipFaceTrackingPlaybackDelegates = v7->_clipFaceTrackingPlaybackDelegates;
    v7->_clipFaceTrackingPlaybackDelegates = (NSMapTable *)v48;

    v7->_parentCode = -1;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  -[JFXComposition setAudioMix:](self, "setAudioMix:", 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDB1FA8];
  -[JFXComposition avPlayerItem](self, "avPlayerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  -[JFXComposition setAvPlayerItem:](self, "setAvPlayerItem:", 0);
  -[JFXComposition setAssetsUsed:](self, "setAssetsUsed:", 0);
  v6.receiver = self;
  v6.super_class = (Class)JFXComposition;
  -[JFXComposition dealloc](&v6, sel_dealloc);
}

- (void)markDirty
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  if (!-[JFXComposition needsUpdate](self, "needsUpdate"))
  {
    v3 = (void *)MEMORY[0x2276A1DB0]();
    -[JFXComposition setNeedsUpdate:](self, "setNeedsUpdate:", 1);
    -[JFXComposition audioMixParameters](self, "audioMixParameters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllObjects");

    -[JFXComposition videoCompositionInstructions](self, "videoCompositionInstructions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

    -[JFXComposition assetsUsed](self, "assetsUsed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllObjects");

    -[JFXComposition trackGroupA](self, "trackGroupA");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markDirty");

    -[JFXComposition trackGroupB](self, "trackGroupB");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markDirty");

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x24BDB1FA8];
    -[JFXComposition avPlayerItem](self, "avPlayerItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:name:object:", self, v10, v11);

    -[JFXComposition setAvPlayerItem:](self, "setAvPlayerItem:", 0);
    -[JFXComposition clipCustomRendererMap](self, "clipCustomRendererMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");

    -[JFXComposition clipFaceTrackingPlaybackDelegates](self, "clipFaceTrackingPlaybackDelegates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeAllObjects");

    objc_autoreleasePoolPop(v3);
  }
}

- (BOOL)CARenderingRequiredForClip:(id)a3
{
  return 0;
}

- (float)volumeForClip:(id)a3
{
  void *v4;
  int v5;
  float result;

  objc_msgSend(a3, "mediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasAudibleCharacteristic");

  if (!v5)
    return 0.0;
  -[JFXComposition globalAudioVolume](self, "globalAudioVolume");
  return result;
}

- ($70930193D4F448A53BB9343C0237EB5F)compositionItemsForState:(SEL)a3 compositionItem:(id)a4 backfillCompositionItem:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  JFXCompositionItem *v12;
  void *v13;
  JFXCompositionItem *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  JFXCompositionItem *v23;
  void *v24;
  void *v25;
  $70930193D4F448A53BB9343C0237EB5F *result;
  void *v29;
  CMTime v30;
  CMTimeRange v31;
  CMTimeRange v32;
  CMTime v33;
  CMTime duration;
  CMTime rhs;
  CMTime lhs;
  CMTime v37;
  CMTime v38;
  CMTime v39;
  _OWORD v40[3];
  _OWORD v41[3];
  __int128 v42;
  _BYTE v43[32];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v44;

  v8 = a4;
  objc_msgSend(v8, "clip");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXCompositionItem compositionItemWithClip:timeScale:](JFXCompositionItem, "compositionItemWithClip:timeScale:", v9, objc_msgSend(v10, "timeScale"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [JFXCompositionItem alloc];
  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[JFXCompositionItem initWithClip:timeScale:](v12, "initWithClip:timeScale:", v9, objc_msgSend(v13, "timeScale"));

  v15 = objc_msgSend(v8, "isLastClip");
  -[JFXCompositionItem setIsFinalClip:](v14, "setIsFinalClip:", v15);
  objc_msgSend(v11, "setIsFinalClip:", v15);
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  memset(&v44, 0, sizeof(v44));
  LODWORD(v15) = objc_msgSend(v9, "duration");
  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  DurationCMTimeFromFrameTime(v15, objc_msgSend(v16, "timeScale"), (CMTime *)&v44);

  v29 = v9;
  LODWORD(v15) = objc_msgSend(v9, "mediaStartOffset");
  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  DurationCMTimeFromFrameTime(v15, objc_msgSend(v17, "timeScale"), (CMTime *)&v42);
  memset(&v43[8], 0, 24);

  *($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v43[8] = v44;
  v41[0] = v42;
  v41[1] = *(_OWORD *)v43;
  v41[2] = *(_OWORD *)&v44.var1;
  objc_msgSend(v11, "setSourceTimeRange:", v41);
  *($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v43[8] = v44;
  v40[0] = v42;
  v40[1] = *(_OWORD *)v43;
  v40[2] = *(_OWORD *)&v44.var1;
  -[JFXCompositionItem setSourceTimeRange:](v14, "setSourceTimeRange:", v40);
  if ((int)objc_msgSend(v8, "overlapLeft") > 0 || (int)objc_msgSend(v8, "overlapRight") >= 1)
  {
    memset(&v39, 0, sizeof(v39));
    v18 = objc_msgSend(v8, "overlapLeft");
    -[JFXComposition clipsDataSource](self, "clipsDataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeFromFrameTime(v18, objc_msgSend(v19, "timeScale"), &v39);

    memset(&v38, 0, sizeof(v38));
    v20 = objc_msgSend(v8, "overlapRight");
    -[JFXComposition clipsDataSource](self, "clipsDataSource");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeFromFrameTime(v20, objc_msgSend(v21, "timeScale"), &v38);

    memset(&v37, 0, sizeof(v37));
    *(_OWORD *)&lhs.value = v42;
    lhs.epoch = *(_QWORD *)v43;
    rhs = v39;
    CMTimeAdd(&v37, &lhs, &rhs);
    memset(&lhs, 0, sizeof(lhs));
    rhs = *(CMTime *)&v43[8];
    duration = v39;
    CMTimeSubtract(&lhs, &rhs, &duration);
    duration = lhs;
    v33 = v38;
    CMTimeSubtract(&rhs, &duration, &v33);
    lhs = rhs;
    rhs = v37;
    duration = lhs;
    CMTimeRangeMake(&v32, &rhs, &duration);
    v31 = v32;
    -[JFXCompositionItem setSourceTimeRange:](v14, "setSourceTimeRange:", &v31);
    v30 = lhs;
    -[JFXCompositionItem setDestinationDuration:](v14, "setDestinationDuration:", &v30);
  }
  v22 = objc_retainAutorelease(v11);
  *a5 = v22;
  v23 = objc_retainAutorelease(v14);
  *a6 = v23;
  objc_msgSend(v8, "currentTrackGroup");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
    objc_msgSend(v24, "cursor");
  else
    memset(&v39, 0, sizeof(v39));
  retstr->var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v39;

  retstr->var1 = v44;
  return result;
}

- (id)instructionToHideTrackID:(int)a3 whileHidingTrackID:(int)a4 timeRange:(id *)a5 requiresCARendering:(BOOL)a6
{
  _BOOL8 v6;
  id v8;
  __int128 v9;
  _OWORD v11[3];

  v6 = a6;
  v8 = objc_alloc_init(MEMORY[0x24BE790E0]);
  v9 = *(_OWORD *)&a5->var0.var3;
  v11[0] = *(_OWORD *)&a5->var0.var0;
  v11[1] = v9;
  v11[2] = *(_OWORD *)&a5->var1.var1;
  objc_msgSend(v8, "setTimeRange:", v11);
  objc_msgSend(v8, "setEnablePostProcessing:", v6);
  return v8;
}

- (id)instructionToShowClip:(id)a3 withTrackID:(int)a4 withTransform:(CGAffineTransform *)a5 timeRange:(id *)a6 requiresCARendering:(BOOL)a7
{
  _BOOL8 v7;
  uint64_t v10;
  objc_class *v12;
  id v13;
  id v14;
  __int128 v15;
  id v16;
  __int128 v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  unsigned __int8 v22;

  v7 = a7;
  v10 = *(_QWORD *)&a4;
  v12 = (objc_class *)MEMORY[0x24BE790E0];
  v13 = a3;
  v14 = objc_alloc_init(v12);
  v22 = 0;
  v15 = *(_OWORD *)&a5->c;
  v19 = *(_OWORD *)&a5->a;
  v20 = v15;
  v21 = *(_OWORD *)&a5->tx;
  v16 = -[JFXComposition newInstructionGraphNodeForClip:clipTransform:compositionTrackID:requiresTweening:isContainedClip:](self, "newInstructionGraphNodeForClip:clipTransform:compositionTrackID:requiresTweening:isContainedClip:", v13, &v19, v10, &v22, 0);

  objc_msgSend(v14, "setOutputNode:", v16);
  objc_msgSend(v14, "setContainsTweening:", v22);
  objc_msgSend(v14, "setIsFreezeFrame:", 0);
  v17 = *(_OWORD *)&a6->var0.var3;
  v19 = *(_OWORD *)&a6->var0.var0;
  v20 = v17;
  v21 = *(_OWORD *)&a6->var1.var1;
  objc_msgSend(v14, "setTimeRange:", &v19);
  objc_msgSend(v14, "setEnablePostProcessing:", v7);

  return v14;
}

- (id)instructionToShowImageWithClip:(id)a3 withTransform:(CGAffineTransform *)a4 timeRange:(id *)a5 requiresCARendering:(BOOL)a6
{
  _BOOL8 v6;
  __int128 v8;
  id v9;
  id v10;
  __int128 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  unsigned __int8 v16;

  v6 = a6;
  v16 = 0;
  v8 = *(_OWORD *)&a4->c;
  v13 = *(_OWORD *)&a4->a;
  v14 = v8;
  v15 = *(_OWORD *)&a4->tx;
  v9 = -[JFXComposition newInstructionGraphNodeForClip:clipTransform:compositionTrackID:requiresTweening:isContainedClip:](self, "newInstructionGraphNodeForClip:clipTransform:compositionTrackID:requiresTweening:isContainedClip:", a3, &v13, 0, &v16, 0);
  v10 = objc_alloc_init(MEMORY[0x24BE790E0]);
  objc_msgSend(v10, "setOutputNode:", v9);
  v11 = *(_OWORD *)&a5->var0.var3;
  v13 = *(_OWORD *)&a5->var0.var0;
  v14 = v11;
  v15 = *(_OWORD *)&a5->var1.var1;
  objc_msgSend(v10, "setTimeRange:", &v13);
  objc_msgSend(v10, "setEnablePostProcessing:", v6);
  objc_msgSend(v10, "setContainsTweening:", v16);

  return v10;
}

- (id)updateVideoAndAudioInstructionForState:(id)a3 previousInstructions:(id)a4 waitingForResource:(BOOL)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  float v15;
  float v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  int64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  _OWORD v41[3];
  CMTimeRange v42;
  CMTime v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  CMTime v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  CMTime duration;
  CMTime v57;
  CMTime start;
  CMTimeRange v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  CMTimeRange v63;
  _OWORD v64[6];

  v6 = a3;
  objc_msgSend(v6, "clip");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mediaType");
  memset(&v64[3], 0, 48);
  objc_msgSend(v6, "clip");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXComposition clipTransform:](self, "clipTransform:", v9);

  switch(v8)
  {
    case 9:
      goto LABEL_4;
    case 2:
      if (v6)
        objc_msgSend(v6, "videoCompTimeRange");
      else
        memset(v41, 0, sizeof(v41));
      v21 = objc_msgSend(v6, "clipRequiresCA");
      v63 = *(CMTimeRange *)&v64[3];
      -[JFXComposition instructionToShowImageWithClip:withTransform:timeRange:requiresCARendering:](self, "instructionToShowImageWithClip:withTransform:timeRange:requiresCARendering:", v7, &v63, v41, v21);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentTrackGroup");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v6, "videoCompTimeRange");
      }
      else
      {
        v37 = 0u;
        v38 = 0u;
        v36 = 0u;
      }
      HIDWORD(v28) = DWORD1(v36);
      v39 = v36;
      v40 = v37;
      LODWORD(v28) = 0;
      objc_msgSend(v22, "requestVolume:atTime:", &v39, v28);

      objc_msgSend(v6, "alternateTrackGroup");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v6, "videoCompTimeRange");
      }
      else
      {
        v32 = 0u;
        v33 = 0u;
        v31 = 0u;
      }
      HIDWORD(v29) = DWORD1(v31);
      v34 = v31;
      v35 = v32;
      LODWORD(v29) = 0;
      objc_msgSend(v26, "requestVolume:atTime:", &v34, v29, v31, v32, v33);
      goto LABEL_32;
    case 1:
LABEL_4:
      objc_msgSend(v6, "currentTrackGroup");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "actualVideoTrackID");
      if (v6)
        objc_msgSend(v6, "videoCompTimeRange");
      else
        memset(v64, 0, 48);
      v14 = objc_msgSend(v6, "clipRequiresCA");
      v63 = *(CMTimeRange *)&v64[3];
      -[JFXComposition instructionToShowClip:withTrackID:withTransform:timeRange:requiresCARendering:](self, "instructionToShowClip:withTrackID:withTransform:timeRange:requiresCARendering:", v7, v11, &v63, v64, v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[JFXComposition volumeForClip:](self, "volumeForClip:", v7);
      v16 = v15;
      if (v15 <= 0.0)
      {
        objc_msgSend(v6, "currentTrackGroup");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
LABEL_17:
          objc_msgSend(v6, "audioCompTimeRange");
          goto LABEL_23;
        }
      }
      else
      {
        if (v6)
        {
          objc_msgSend(v6, "audioCompTimeRange");
          objc_msgSend(v6, "currentTrackGroup");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (*((uint64_t *)&v61 + 1) >= 3)
          {
            objc_msgSend(v6, "audioCompTimeRange");
            start = v57;
            -[JFXComposition clipsDataSource](self, "clipsDataSource");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            CMTimeMake(&duration, 1, objc_msgSend(v18, "timeScale"));
            CMTimeRangeMake(&v59, &start, &duration);
            LODWORD(v19) = 0;
            *(float *)&v20 = v16;
            objc_msgSend(v17, "requestVolumeRampFromStartVolume:toEndVolume:timeRange:", &v59, v19, v20);

            memset(&v63, 0, sizeof(v63));
            goto LABEL_24;
          }
          goto LABEL_17;
        }
        v61 = 0u;
        v62 = 0u;
        v60 = 0u;
        objc_msgSend(0, "currentTrackGroup");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v52 = 0u;
      v53 = 0u;
      v51 = 0u;
LABEL_23:
      v54 = v51;
      v55 = v52;
      objc_msgSend(v17, "requestVolume:atTime:", &v54, COERCE_DOUBLE(__PAIR64__(DWORD1(v51), LODWORD(v16))));

      memset(&v63, 0, sizeof(v63));
      if (!v6)
      {
        v48 = 0uLL;
        v49 = 0uLL;
        v46 = 0uLL;
        v47 = 0uLL;
        v44 = 0uLL;
        v45 = 0uLL;
        v23 = -1;
        goto LABEL_26;
      }
LABEL_24:
      objc_msgSend(v6, "audioCompTimeRange");
      objc_msgSend(v6, "audioCompTimeRange");
      v23 = v47 + *((_QWORD *)&v45 + 1) - 1;
LABEL_26:
      -[JFXComposition clipsDataSource](self, "clipsDataSource");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      CMTimeMake(&v50, v23, objc_msgSend(v24, "timeScale"));
      -[JFXComposition clipsDataSource](self, "clipsDataSource");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      CMTimeMake(&v43, 1, objc_msgSend(v25, "timeScale"));
      CMTimeRangeMake(&v63, &v50, &v43);

      v63.start.value = v63.duration.value + v63.start.value - 1;
      objc_msgSend(v6, "currentTrackGroup");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      HIDWORD(v27) = HIDWORD(v63.start.epoch);
      v42 = v63;
      LODWORD(v27) = 0;
      objc_msgSend(v26, "requestVolumeRampFromStartVolume:toEndVolume:timeRange:", &v42, COERCE_DOUBLE(__PAIR64__(v63.duration.flags, LODWORD(v16))), v27);
LABEL_32:

      goto LABEL_33;
  }
  JFXLog_playback();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[JFXComposition updateVideoAndAudioInstructionForState:previousInstructions:waitingForResource:].cold.1();

  v13 = 0;
LABEL_33:

  return v13;
}

- (void)assetUsed:(id)a3
{
  void *v4;
  id v5;
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
  id v17;

  v17 = a3;
  objc_msgSend(v17, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(v5, "URL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[JFXComposition assetsUsed](self, "assetsUsed");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
          -[JFXComposition assetsUsed](self, "assetsUsed");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v5, v6);

        }
      }
      objc_msgSend(v17, "audioAssetOverwrite");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v17, "audioAssetOverwrite");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "URL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[JFXComposition assetsUsed](self, "assetsUsed");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            -[JFXComposition assetsUsed](self, "assetsUsed");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "audioAssetOverwrite");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKey:", v16, v12);

          }
        }
      }
      else
      {
        v11 = v5;
        v12 = v6;
      }

    }
  }

}

- (BOOL)emptySegments:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "sourceURL", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (void)removeTrackFromAudioMix:(int)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[JFXComposition audioMixParameters](self, "audioMixParameters", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "trackID") == a3)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    -[JFXComposition audioMixParameters](self, "audioMixParameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectsInArray:", v5);

  }
}

- (BOOL)removeTrackIfEmpty:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  int v9;

  v4 = a3;
  objc_msgSend(v4, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[JFXComposition emptySegments:](self, "emptySegments:", v5);

  if (v6)
  {
    -[JFXComposition avComposition](self, "avComposition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeTrack:", v4);

    objc_msgSend(v4, "setSegments:", 0);
    objc_msgSend(v4, "mediaType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDB1CF0]);

    if (v9)
      -[JFXComposition removeTrackFromAudioMix:](self, "removeTrackFromAudioMix:", objc_msgSend(v4, "trackID"));
  }

  return v6;
}

- (void)removeEmptyTracks
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  id v20;

  -[JFXComposition trackGroupA](self, "trackGroupA");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "audioTrack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[JFXComposition removeTrackIfEmpty:](self, "removeTrackIfEmpty:", v4);

  if (v5)
  {
    -[JFXComposition trackGroupA](self, "trackGroupA");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "audioTrack");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXComposition logRemovedTrack:trackID:](self, "logRemovedTrack:trackID:", CFSTR("movie A audio"), objc_msgSend(v7, "trackID"));

    -[JFXComposition trackGroupA](self, "trackGroupA");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAudioTrack:", 0);

  }
  -[JFXComposition trackGroupB](self, "trackGroupB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "videoTrack");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[JFXComposition removeTrackIfEmpty:](self, "removeTrackIfEmpty:", v10);

  if (v11)
  {
    -[JFXComposition trackGroupB](self, "trackGroupB");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "audioTrack");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXComposition logRemovedTrack:trackID:](self, "logRemovedTrack:trackID:", CFSTR("movie B video"), objc_msgSend(v13, "trackID"));

    -[JFXComposition trackGroupB](self, "trackGroupB");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setVideoTrack:", 0);

  }
  -[JFXComposition trackGroupB](self, "trackGroupB");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "audioTrack");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[JFXComposition removeTrackIfEmpty:](self, "removeTrackIfEmpty:", v16);

  if (v17)
  {
    -[JFXComposition trackGroupB](self, "trackGroupB");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "audioTrack");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXComposition logRemovedTrack:trackID:](self, "logRemovedTrack:trackID:", CFSTR("movie B audio"), objc_msgSend(v19, "trackID"));

    -[JFXComposition trackGroupB](self, "trackGroupB");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAudioTrack:", 0);

  }
}

- (void)setViewSize:(CGSize)a3
{
  double height;
  double width;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  height = a3.height;
  width = a3.width;
  v35 = *MEMORY[0x24BDAC8D0];
  if (self->_viewSize.width != a3.width || self->_viewSize.height != a3.height)
  {
    self->_viewSize = a3;
    -[JFXComposition videoComposition](self, "videoComposition");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[JFXComposition avPlayerItem](self, "avPlayerItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[JFXComposition videoComposition](self, "videoComposition");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "instructions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v13 = v11;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v31 != v16)
                objc_enumerationMutation(v13);
              v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "copy", (_QWORD)v30);
              objc_msgSend(v12, "addObject:", v18);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          }
          while (v15);
        }

        -[JFXComposition avPlayerItem](self, "avPlayerItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "videoComposition");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v20, "mutableCopy");
        -[JFXComposition setVideoComposition:](self, "setVideoComposition:", v21);

        -[JFXComposition videoComposition](self, "videoComposition");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setInstructions:", v12);

        -[JFXComposition avPlayerItem](self, "avPlayerItem");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[JFXComposition videoComposition](self, "videoComposition");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setVideoComposition:", v24);

      }
    }
    -[JFXComposition previousRenderSize](self, "previousRenderSize", (_QWORD)v30);
    v26 = *(double *)(MEMORY[0x24BDBF148] + 8);
    if ((v27 != *MEMORY[0x24BDBF148] || v25 != v26) && (width != *MEMORY[0x24BDBF148] || height != v26))
      -[JFXComposition setRenderScale](self, "setRenderScale");
  }
}

- (void)addBackTracksIfRemoved
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  _QWORD v26[4];
  NSObject *v27;
  id v28;
  id location[2];

  objc_initWeak(location, self);
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  -[JFXComposition avComposition](self, "avComposition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXComposition trackGroupA](self, "trackGroupA");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "audioTrack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "trackID");
  v8 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __40__JFXComposition_addBackTracksIfRemoved__block_invoke;
  v26[3] = &unk_24EE57E78;
  objc_copyWeak(&v28, location);
  v9 = v3;
  v27 = v9;
  objc_msgSend(v4, "loadTrackWithTrackID:completionHandler:", v7, v26);

  dispatch_group_enter(v9);
  -[JFXComposition avComposition](self, "avComposition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXComposition trackGroupB](self, "trackGroupB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "videoTrack");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "trackID");
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __40__JFXComposition_addBackTracksIfRemoved__block_invoke_2;
  v23[3] = &unk_24EE57E78;
  objc_copyWeak(&v25, location);
  v14 = v9;
  v24 = v14;
  objc_msgSend(v10, "loadTrackWithTrackID:completionHandler:", v13, v23);

  dispatch_group_enter(v14);
  -[JFXComposition avComposition](self, "avComposition");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXComposition trackGroupB](self, "trackGroupB");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "audioTrack");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "trackID");
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __40__JFXComposition_addBackTracksIfRemoved__block_invoke_3;
  v20[3] = &unk_24EE57E78;
  objc_copyWeak(&v22, location);
  v19 = v14;
  v21 = v19;
  objc_msgSend(v15, "loadTrackWithTrackID:completionHandler:", v18, v20);

  dispatch_group_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v28);

  objc_destroyWeak(location);
}

void __40__JFXComposition_addBackTracksIfRemoved__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!a2)
  {
    objc_msgSend(WeakRetained, "avComposition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addMutableTrackWithMediaType:preferredTrackID:", *MEMORY[0x24BDB1CF0], 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "trackGroupA");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAudioTrack:", v5);

    objc_msgSend(WeakRetained, "logAddedTrack:trackID:", CFSTR("movie A audio"), 2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __40__JFXComposition_addBackTracksIfRemoved__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!a2)
  {
    objc_msgSend(WeakRetained, "avComposition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addMutableTrackWithMediaType:preferredTrackID:", *MEMORY[0x24BDB1D50], 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "trackGroupB");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVideoTrack:", v5);

    objc_msgSend(WeakRetained, "logAddedTrack:trackID:", CFSTR("movie B video"), 3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __40__JFXComposition_addBackTracksIfRemoved__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!a2)
  {
    objc_msgSend(WeakRetained, "avComposition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addMutableTrackWithMediaType:preferredTrackID:", *MEMORY[0x24BDB1CF0], 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "trackGroupB");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAudioTrack:", v5);

    objc_msgSend(WeakRetained, "logAddedTrack:trackID:", CFSTR("movie B audio"), 4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (CGAffineTransform)clipTransform:(SEL)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  CGAffineTransform *result;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v5 = a4;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  if (objc_msgSend(v5, "mediaType") == 1 || objc_msgSend(v5, "mediaType") == 9)
  {
    objc_msgSend(v5, "mediaItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "transform");
    }
    else
    {
      v12 = 0u;
      v13 = 0u;
      v11 = 0u;
    }
    *(_OWORD *)&retstr->a = v11;
    *(_OWORD *)&retstr->c = v12;
    *(_OWORD *)&retstr->tx = v13;

  }
  else
  {
    v8 = MEMORY[0x24BDBD8B8];
    v9 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&retstr->c = v9;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v8 + 32);
  }

  return result;
}

- (id)buildClipList
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      -[JFXComposition clipsDataSource](self, "clipsDataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "playableElementAtIndex:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "addObject:", v8);
    }
  }
  return v3;
}

- (id)dissolveGraphNode:(id *)a3 from:(id)a4 to:(id)a5
{
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  __int128 v12;
  void *v13;
  void *v14;
  void *v15;
  _OWORD v17[3];
  CGPoint v18;

  v7 = *MEMORY[0x24BE79550];
  v8 = (void *)MEMORY[0x24BE79010];
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_msgSend(v8, "newEffectWithID:", v7);
  v12 = *(_OWORD *)&a3->var0.var3;
  v17[0] = *(_OWORD *)&a3->var0.var0;
  v17[1] = v12;
  v17[2] = *(_OWORD *)&a3->var1.var1;
  objc_msgSend(v11, "setEffectRange:", v17);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18.x = 0.0;
  v18.y = 1.0;
  NSStringFromCGPoint(v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE79598]);

  objc_msgSend(v11, "setInspectableProperties:", v13);
  v15 = (void *)objc_msgSend(MEMORY[0x24BE79038], "newEffectNodeToTransitionFrom:to:effect:", v10, v9, v11);

  return v15;
}

- (void)update
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  EditListCompositionState *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL8 v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  int v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _BOOL8 v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  CMTimeRange v87;
  CMTime v88;
  CMTimeRange v89;
  _OWORD v90[3];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  CMTimeRange v94;
  CMTimeRange v95;
  CMTime duration;
  CMTime start;
  CMTime v98;
  __int128 v99;
  _OWORD v100[2];
  CMTime v101;
  CMTime rhs;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  CMTime lhs;
  CMTime v107;
  CMTimeRange v108;
  CMTime v109;
  CMTime v110;
  CMTime v111;
  CMTime v112;
  CMTimeRange v113;
  _OWORD v114[3];
  id v115;
  id v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  CMTime v120;

  v3 = (void *)MEMORY[0x2276A1DB0](self, a2);
  -[JFXComposition buildClipList](self, "buildClipList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXComposition addBackTracksIfRemoved](self, "addBackTracksIfRemoved");
  v5 = *MEMORY[0x24BDB1A10];
  -[JFXComposition trackGroupB](self, "trackGroupB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreferredAudioTimePitchAlgorithm:", v5);

  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isExporting");
  -[JFXComposition trackGroupA](self, "trackGroupA");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsExporting:", v8);

  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isExporting");
  -[JFXComposition trackGroupB](self, "trackGroupB");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIsExporting:", v11);

  v13 = objc_alloc_init(EditListCompositionState);
  -[JFXComposition trackGroupA](self, "trackGroupA");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EditListCompositionState setCurrentTrackGroup:](v13, "setCurrentTrackGroup:", v14);

  -[JFXComposition trackGroupB](self, "trackGroupB");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EditListCompositionState setAlternateTrackGroup:](v13, "setAlternateTrackGroup:", v15);

  memset(&v120, 0, sizeof(v120));
  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v16, "duration");
  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeFromFrameTime(v11, objc_msgSend(v17, "timeScale"), &v120);

  v18 = objc_msgSend(v4, "count");
  objc_msgSend(v4, "lastObject");
  v82 = v18;
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_45;
  v80 = v3;
  v81 = v4;
  v19 = 0;
  v20 = 0;
  do
  {
    objc_msgSend(v4, "objectAtIndex:", v19, v80);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EditListCompositionState setClip:](v13, "setClip:", v21);

    -[EditListCompositionState clip](v13, "clip");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXComposition JFX_updatePlaybackDelegatesForClip:](self, "JFX_updatePlaybackDelegatesForClip:", v22);

    -[EditListCompositionState clip](v13, "clip");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[EditListCompositionState setClipRequiresCA:](v13, "setClipRequiresCA:", -[JFXComposition CARenderingRequiredForClip:](self, "CARenderingRequiredForClip:", v23));

    -[EditListCompositionState clip](v13, "clip");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[EditListCompositionState setIsLastClip:](v13, "setIsLastClip:", v24 == v83);

    if (v19
      && (objc_msgSend(v4, "objectAtIndex:", v19 - 1), (v25 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v26 = v25;
      v27 = objc_msgSend(v25, "presentationTime");
      v85 = v26;
      LODWORD(v26) = objc_msgSend(v26, "duration") + v27;
      -[EditListCompositionState clip](v13, "clip");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[EditListCompositionState setOverlapLeft:](v13, "setOverlapLeft:", v26 - objc_msgSend(v28, "presentationTime"));

    }
    else
    {
      -[EditListCompositionState setOverlapLeft:](v13, "setOverlapLeft:", 0);
      v85 = 0;
    }
    if (-[EditListCompositionState isLastClip](v13, "isLastClip")
      || (objc_msgSend(v4, "objectAtIndex:", v19 + 1), (v29 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[EditListCompositionState setOverlapRight:](v13, "setOverlapRight:", 0);
    }
    else
    {
      v30 = (void *)v29;
      -[EditListCompositionState clip](v13, "clip");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "presentationTime");
      -[EditListCompositionState clip](v13, "clip");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[EditListCompositionState setOverlapRight:](v13, "setOverlapRight:", objc_msgSend(v33, "duration") + v32 - objc_msgSend(v30, "presentationTime"));

    }
    v115 = 0;
    v116 = 0;
    -[JFXComposition compositionItemsForState:compositionItem:backfillCompositionItem:](self, "compositionItemsForState:compositionItem:backfillCompositionItem:", v13, &v116, &v115);
    v34 = v116;
    v35 = v115;
    v114[0] = v117;
    v114[1] = v118;
    v114[2] = v119;
    -[EditListCompositionState setVideoCompTimeRange:](v13, "setVideoCompTimeRange:", v114);
    memset(&v113, 0, sizeof(v113));
    if (v13)
      -[EditListCompositionState videoCompTimeRange](v13, "videoCompTimeRange");
    -[EditListCompositionState setAudioStartOffset:](v13, "setAudioStartOffset:", 0);
    -[EditListCompositionState setAudioEndOffset:](v13, "setAudioEndOffset:", 0);
    -[JFXComposition clipsDataSource](self, "clipsDataSource");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMake(&v112, 0, objc_msgSend(v36, "timeScale"));
    v111 = v112;
    objc_msgSend(v34, "setAudioStartOffset:", &v111);

    -[JFXComposition clipsDataSource](self, "clipsDataSource");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMake(&v110, 0, objc_msgSend(v37, "timeScale"));
    v109 = v110;
    objc_msgSend(v34, "setAudioEndOffset:", &v109);

    v108 = v113;
    -[EditListCompositionState setAudioCompTimeRange:](v13, "setAudioCompTimeRange:", &v108);
    -[EditListCompositionState clip](v13, "clip");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "mediaType") == 2;

    -[EditListCompositionState currentTrackGroup](v13, "currentTrackGroup");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "applyCompositionItem:skipAudio:", v34, v39);

    -[EditListCompositionState alternateTrackGroup](v13, "alternateTrackGroup");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "applyCompositionItem:skipAudio:", v35, 1);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[JFXComposition assetUsed:](self, "assetUsed:", v34);
    -[JFXComposition clipsDataSource](self, "clipsDataSource");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v35;
    if ((objc_msgSend(v42, "isExporting") & 1) != 0)
    {

LABEL_19:
      v44 = 0;
      goto LABEL_20;
    }
    v43 = objc_msgSend(v34, "hasVideoContent");

    if (!v43)
      goto LABEL_19;
    v44 = objc_msgSend(v34, "isWaitingForResource");
LABEL_20:
    memset(&v107, 0, sizeof(v107));
    v45 = -[EditListCompositionState overlapLeft](v13, "overlapLeft");
    -[JFXComposition clipsDataSource](self, "clipsDataSource");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeFromFrameTime(v45, objc_msgSend(v46, "timeScale"), &v107);

    if (-[EditListCompositionState overlapLeft](v13, "overlapLeft") > 0
      || -[EditListCompositionState overlapRight](v13, "overlapRight") >= 1)
    {
      memset(&v89, 0, 24);
      v47 = -[EditListCompositionState overlapRight](v13, "overlapRight");
      -[JFXComposition clipsDataSource](self, "clipsDataSource");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      CMTimeFromFrameTime(v47, objc_msgSend(v48, "timeScale"), &v89.start);

      memset(&v87, 0, 24);
      if (v13)
      {
        -[EditListCompositionState videoCompTimeRange](v13, "videoCompTimeRange");
      }
      else
      {
        v104 = 0u;
        v105 = 0u;
        v103 = 0u;
      }
      *(_OWORD *)&lhs.value = v103;
      lhs.epoch = v104;
      rhs = v107;
      CMTimeAdd(&v87.start, &lhs, &rhs);
      memset(&rhs, 0, sizeof(rhs));
      if (v13)
      {
        -[EditListCompositionState videoCompTimeRange](v13, "videoCompTimeRange");
      }
      else
      {
        memset(v100, 0, sizeof(v100));
        v99 = 0u;
      }
      v101 = *(CMTime *)((char *)v100 + 8);
      start = v107;
      duration = v89.start;
      CMTimeAdd(&v98, &start, &duration);
      CMTimeSubtract(&rhs, &v101, &v98);
      start = v87.start;
      duration = rhs;
      CMTimeRangeMake(&v95, &start, &duration);
      v94 = v95;
      -[EditListCompositionState setVideoCompTimeRange:](v13, "setVideoCompTimeRange:", &v94);
      if (v13)
      {
        -[EditListCompositionState videoCompTimeRange](v13, "videoCompTimeRange");
      }
      else
      {
        v92 = 0u;
        v93 = 0u;
        v91 = 0u;
      }
      v90[0] = v91;
      v90[1] = v92;
      v90[2] = v93;
      -[EditListCompositionState setAudioCompTimeRange:](v13, "setAudioCompTimeRange:", v90);
    }
    v86 = v20;
    -[JFXComposition updateVideoAndAudioInstructionForState:previousInstructions:waitingForResource:](self, "updateVideoAndAudioInstructionForState:previousInstructions:waitingForResource:", v13, v20, v44);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[EditListCompositionState overlapLeft](v13, "overlapLeft") >= 1)
    {
      v50 = objc_alloc_init(MEMORY[0x24BE790E0]);
      memset(&v89, 0, sizeof(v89));
      -[EditListCompositionState clip](v13, "clip");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "presentationTime");
      -[JFXComposition clipsDataSource](self, "clipsDataSource");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      CMTimeFromFrameTime(v52, objc_msgSend(v53, "timeScale"), &v88);
      v87.start = v107;
      CMTimeRangeMake(&v89, &v88, &v87.start);

      v87 = v89;
      objc_msgSend(v50, "setTimeRange:", &v87);
      objc_msgSend(v86, "outputNode");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "outputNode");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = v89;
      -[JFXComposition dissolveGraphNode:from:to:](self, "dissolveGraphNode:from:to:", &v87, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v50, "setOutputNode:", v56);
      v57 = -[EditListCompositionState clipRequiresCA](v13, "clipRequiresCA")
         || -[JFXComposition CARenderingRequiredForClip:](self, "CARenderingRequiredForClip:", v85);
      objc_msgSend(v50, "setContainsTweening:", v57);
      objc_msgSend(v50, "setIsFreezeFrame:", 0);
      -[JFXComposition videoCompositionInstructions](self, "videoCompositionInstructions");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "addObject:", v50);

      v4 = v81;
    }
    if (v49)
    {
      -[JFXComposition videoCompositionInstructions](self, "videoCompositionInstructions");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "addObject:", v49);

    }
    -[JFXComposition videoCompositionInstructions](self, "videoCompositionInstructions");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v60, "count") == 1)
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "BOOLForKey:", CFSTR("burnInExportSettings"));

      if (!v62)
        goto LABEL_43;
      -[JFXComposition videoCompositionInstructions](self, "videoCompositionInstructions");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "objectAtIndexedSubscript:", 0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXComposition burnInPlaybackSettings:](self, "burnInPlaybackSettings:", v63);

    }
LABEL_43:

    -[EditListCompositionState swapTrackGroup](v13, "swapTrackGroup");
    ++v19;
    v20 = v49;
  }
  while (v82 != v19);

  v3 = v80;
LABEL_45:
  memset(&v87, 0, 24);
  -[EditListCompositionState currentTrackGroup](v13, "currentTrackGroup");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v64;
  if (v64)
    objc_msgSend(v64, "cursor");
  else
    memset(&v87, 0, 24);

  memset(&v107, 0, sizeof(v107));
  v113.start = v120;
  *(_OWORD *)&v89.start.value = *(_OWORD *)&v87.start.value;
  v89.start.epoch = v87.start.epoch;
  CMTimeSubtract(&v107, &v113.start, &v89.start);
  if (v107.value >= 1)
  {
    memset(&v113, 0, sizeof(v113));
    *(_OWORD *)&v89.start.value = *(_OWORD *)&v87.start.value;
    v89.start.epoch = v87.start.epoch;
    rhs = v120;
    CMTimeRangeMake(&v113, &v89.start, &rhs);
    -[EditListCompositionState currentTrackGroup](v13, "currentTrackGroup");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v89.start = v120;
    objc_msgSend(v66, "applyPaddingToTime:", &v89);

    -[EditListCompositionState alternateTrackGroup](v13, "alternateTrackGroup");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v89.start = v120;
    objc_msgSend(v67, "applyPaddingToTime:", &v89);

    -[JFXComposition videoCompositionInstructions](self, "videoCompositionInstructions");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[EditListCompositionState currentTrackGroup](v13, "currentTrackGroup");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v69, "usableVideoTrackID");
    -[EditListCompositionState alternateTrackGroup](v13, "alternateTrackGroup");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "usableVideoTrackID");
    v89 = v113;
    -[JFXComposition instructionToHideTrackID:whileHidingTrackID:timeRange:requiresCARendering:](self, "instructionToHideTrackID:whileHidingTrackID:timeRange:requiresCARendering:", v70, v72, &v89, 1);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "addObject:", v73);

  }
  -[EditListCompositionState currentTrackGroup](v13, "currentTrackGroup");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v113.start = v120;
  objc_msgSend(v74, "commitPendingVolumeToTime:", &v113);

  -[EditListCompositionState alternateTrackGroup](v13, "alternateTrackGroup");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v113.start = v120;
  objc_msgSend(v75, "commitPendingVolumeToTime:", &v113);

  -[EditListCompositionState currentTrackGroup](v13, "currentTrackGroup");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXComposition audioMixParameters](self, "audioMixParameters");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "applyAudioMixParameters:", v77);

  -[EditListCompositionState alternateTrackGroup](v13, "alternateTrackGroup");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXComposition audioMixParameters](self, "audioMixParameters");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "applyAudioMixParameters:", v79);

  -[JFXComposition setNeedsUpdate:](self, "setNeedsUpdate:", 0);
  objc_autoreleasePoolPop(v3);
}

- (void)rebuildCompositionInstructionsForVideoStillTitleCard:(id)a3
{
  id v4;
  void *v5;
  int32_t v6;
  void *v7;
  NSObject *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  _BOOL8 v22;
  NSObject *v23;
  NSObject *v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _BOOL8 v30;
  void *v31;
  void *v32;
  void *v33;
  float v34;
  float v35;
  double v36;
  void *v37;
  void *v38;
  _BYTE *v39;
  int v40;
  NSObject *v41;
  id obj;
  uint8_t v43;
  _BYTE v44[7];
  _OWORD v45[3];
  CMTimeRange v46;
  _OWORD v47[3];
  CMTimeRange range;
  CMTimeRange otherRange;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  CMTime duration;
  CMTime start;
  CMTimeRange v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "timeScale");

  -[JFXComposition avPlayerItem](self, "avPlayerItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    memset(&v56, 0, sizeof(v56));
    CMTimeMake(&start, (int)objc_msgSend(v4, "presentationTime"), v6);
    CMTimeMake(&duration, (int)objc_msgSend(v4, "duration"), v6);
    CMTimeRangeMake(&v56, &start, &duration);
    v9 = objc_msgSend(v4, "mediaType");
    -[JFXComposition JFX_updatePlaybackDelegatesForClip:](self, "JFX_updatePlaybackDelegatesForClip:", v4);
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    -[JFXComposition avPlayerItem](self, "avPlayerItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "videoComposition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "instructions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v12;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    if (v13)
    {
      v14 = v13;
      v39 = v44;
      v15 = 0xFFFFFFFFLL;
      v16 = *(_QWORD *)v51;
      v41 = v8;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v51 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v17);
          if (v18)
            objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v17), "timeRange");
          else
            memset(&otherRange, 0, sizeof(otherRange));
          range = v56;
          if (CMTimeRangeContainsTimeRange(&range, &otherRange))
          {
            if ((_DWORD)v15 == -1 && v9 <= 9 && ((1 << v9) & 0x20A) != 0)
            {
              objc_msgSend(v18, "requiredSourceTrackIDs");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "firstObject");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "intValue");

              if (v21)
                v15 = v21;
              else
                v15 = 3;
              v8 = v41;
            }
            memset(&range, 0, sizeof(range));
            -[JFXComposition clipTransform:](self, "clipTransform:", v4, v39);
            switch(v9)
            {
              case 1uLL:
              case 3uLL:
              case 9uLL:
                if (v18)
                  objc_msgSend(v18, "timeRange");
                else
                  memset(v47, 0, sizeof(v47));
                v22 = -[JFXComposition CARenderingRequiredForClip:](self, "CARenderingRequiredForClip:", v4);
                v46 = range;
                -[JFXComposition instructionToShowClip:withTrackID:withTransform:timeRange:requiresCARendering:](self, "instructionToShowClip:withTrackID:withTransform:timeRange:requiresCARendering:", v4, v15, &v46, v47, v22);
                v23 = objc_claimAutoreleasedReturnValue();
                v24 = v23;
                if (v9 == 3)
                  -[NSObject setContainsTweening:](v23, "setContainsTweening:", 1);
                if (!v24)
                  goto LABEL_35;
                goto LABEL_26;
              case 2uLL:
                if (v18)
                  objc_msgSend(v18, "timeRange");
                else
                  memset(v45, 0, sizeof(v45));
                v30 = -[JFXComposition CARenderingRequiredForClip:](self, "CARenderingRequiredForClip:", v4);
                v46 = range;
                -[JFXComposition instructionToShowImageWithClip:withTransform:timeRange:requiresCARendering:](self, "instructionToShowImageWithClip:withTransform:timeRange:requiresCARendering:", v4, &v46, v45, v30);
                v24 = objc_claimAutoreleasedReturnValue();
                if (!v24)
                  goto LABEL_35;
LABEL_26:
                v25 = v9;
                v26 = v4;
                if (!objc_msgSend(v4, "presentationTime"))
                {
                  -[NSObject outputNode](v24, "outputNode");
                  v27 = objc_claimAutoreleasedReturnValue();
                  if (v27)
                  {
                    v28 = (void *)v27;
                    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = objc_msgSend(v29, "BOOLForKey:", CFSTR("burnInExportSettings"));

                    v8 = v41;
                    if (v40)
                      -[JFXComposition burnInPlaybackSettings:](self, "burnInPlaybackSettings:", v24);
                  }
                }
                -[NSObject addObject:](v8, "addObject:", v24);
                v4 = v26;
                v9 = v25;
                break;
              default:
LABEL_35:
                JFXLog_playback();
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                  -[JFXComposition rebuildCompositionInstructionsForVideoStillTitleCard:].cold.2(&v43, v39, v24);
                break;
            }

          }
          else
          {
            -[NSObject addObject:](v8, "addObject:", v18);
          }
          ++v17;
        }
        while (v14 != v17);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
      }
      while (v14);
    }

    -[JFXComposition avPlayerItem](self, "avPlayerItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "videoComposition");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "mutableCopy");

    objc_msgSend(v33, "setInstructions:", v8);
    -[JFXComposition JFX_preferredRenderScale](self, "JFX_preferredRenderScale");
    v35 = v34;
    objc_msgSend(v33, "renderScale");
    if (vabds_f32(v35, *(float *)&v36) >= 0.0001)
    {
      *(float *)&v36 = v35;
      objc_msgSend(v33, "setRenderScale:", v36);
    }
    -[JFXComposition avPlayerItem](self, "avPlayerItem", v39);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setVideoComposition:", v33);

    -[JFXComposition setVideoComposition:](self, "setVideoComposition:", v33);
    -[JFXComposition setVideoCompositionInstructions:](self, "setVideoCompositionInstructions:", v8);
    -[JFXComposition videoComposition](self, "videoComposition");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setInstructions:", v8);

  }
  else
  {
    JFXLog_playback();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[JFXComposition rebuildCompositionInstructionsForVideoStillTitleCard:].cold.1();
  }

}

- (void)JFX_updatePlaybackDelegatesForClip:(id)a3
{
  JFXSharedMediaDataReaderManager *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = -[JFXSharedMediaDataReaderManager initWithPlayableElement:]([JFXSharedMediaDataReaderManager alloc], "initWithPlayableElement:", v11);
  -[JFXComposition clipCustomRendererMap](self, "clipCustomRendererMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("JFXCustomRenderingPropertiesKey_Animoji"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXComposition animojiCustomRendererPropsForClip:currentCustomProperties:sharedMediaDataReaderManager:](self, "animojiCustomRendererPropsForClip:currentCustomProperties:sharedMediaDataReaderManager:", v11, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("JFXCustomRenderingPropertiesKey_Animoji"));
  -[JFXComposition CFX_updateFaceTrackingPlaybackDelegateForClip:sharedMediaDataReaderManager:](self, "CFX_updateFaceTrackingPlaybackDelegateForClip:sharedMediaDataReaderManager:", v11, v4);
  -[JFXComposition clipCustomRendererMap](self, "clipCustomRendererMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v7, v11);

}

- (id)animojiCustomRendererPropsForClip:(id)a3 currentCustomProperties:(id)a4 sharedMediaDataReaderManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  JFXAnimojiPlaybackDelegate *v26;
  id v27;
  _QWORD v29[2];
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "playableEffectsOfType:", 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v8, "playableMediaSizeWithTransform");
    v13 = v12;
    v15 = v14;
    -[JFXComposition clipsDataSource](self, "clipsDataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "renderSize");
    v18 = v17;
    v20 = v19;

    if (v18 < v20)
      v18 = v20;
    if (!CGSizeCouldContainSize(v18, v18, v13, v15))
    {
      v13 = CGSizeFitToAspectInSize(v18, v18, v13, v15);
      v15 = v21;
    }
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v22;
    v30[0] = CFSTR("JFXAnimojiRendererMetadata_Effect");
    v30[1] = CFSTR("JFXAnimojiRendererMetadata_UIInterfaceOrientation");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v22, "captureInterfaceOrientation"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v23;
    v30[2] = CFSTR("JFXAnimojiRendererMetadata_RenderSize");
    *(double *)v29 = v13;
    *(double *)&v29[1] = v15;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v29, "{CGSize=dd}");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9
      && (objc_msgSend(v9, "renderingDelegate"),
          (v26 = (JFXAnimojiPlaybackDelegate *)objc_claimAutoreleasedReturnValue()) != 0)
      || ((objc_msgSend(v8, "isVideo") & 1) != 0 || objc_msgSend(v8, "isStill"))
      && (v26 = -[JFXAnimojiPlaybackDelegate initWithPlayableElement:sharedMediaDataReaderManager:]([JFXAnimojiPlaybackDelegate alloc], "initWithPlayableElement:sharedMediaDataReaderManager:", v8, v10)) != 0)
    {
      v27 = +[JFXCustomRenderProperties newCustomRenderProperties:metadata:](JFXCustomRenderProperties, "newCustomRenderProperties:metadata:", v26, v25);

    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)CFX_updateFaceTrackingPlaybackDelegateForClip:(id)a3 sharedMediaDataReaderManager:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  JFXFaceTrackingPlaybackDelegate *v19;
  void *v20;
  JFXFaceTrackingPlaybackDelegate *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v45 = v6;
  objc_msgSend(v6, "playableEffectsOfType:", 2);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v51;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v51 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "trackingProps");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "currentTrackingType");

        if (v14)
        {
          v15 = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
      if (v10)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  -[JFXComposition clipFaceTrackingPlaybackDelegates](self, "clipFaceTrackingPlaybackDelegates");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v45;
  objc_msgSend(v16, "objectForKey:", v45);
  v18 = objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (v18)
      goto LABEL_20;
    if ((objc_msgSend(v45, "isVideo") & 1) != 0 || objc_msgSend(v45, "isStill"))
    {
      v19 = [JFXFaceTrackingPlaybackDelegate alloc];
      -[JFXComposition clipsDataSource](self, "clipsDataSource");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "renderSize");
      v21 = v19;
      v17 = v45;
      v18 = -[JFXFaceTrackingPlaybackDelegate initWithPlayableElement:sharedMediaDataReaderManager:outputSize:](v21, "initWithPlayableElement:sharedMediaDataReaderManager:outputSize:", v45, v7);

    }
    else
    {
      v18 = 0;
    }
    -[JFXComposition clipFaceTrackingPlaybackDelegates](self, "clipFaceTrackingPlaybackDelegates");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v18, v17);
  }
  else
  {
    -[JFXComposition clipFaceTrackingPlaybackDelegates](self, "clipFaceTrackingPlaybackDelegates");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeObjectForKey:", v45);
  }

LABEL_20:
  v44 = (void *)v18;
  v43 = v7;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v23 = v8;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v47;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v47 != v26)
          objc_enumerationMutation(v23);
        v28 = *(id *)(*((_QWORD *)&v46 + 1) + 8 * v27);
        objc_msgSend(v28, "trackingProps");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "renderEffect");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "removeAllTimedPropertiesDelegates");

        JFXLog_DebugFaceTrackingPlayback();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v28, "renderEffect");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "uuid");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v55 = v39;
          v56 = 2112;
          v57 = v40;
          _os_log_debug_impl(&dword_2269A9000, v31, OS_LOG_TYPE_DEBUG, "remove timedProperties delegate for PVEffect %p on clip %@", buf, 0x16u);

        }
        if (objc_msgSend(v29, "currentTrackingType") && (objc_msgSend(v28, "isEditingFaceTrackingTransforms") & 1) == 0)
        {
          v32 = (void *)objc_opt_new();
          v33 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v45, "mediaItem");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "numberWithInteger:", objc_msgSend(v34, "interfaceOrientationForDisplay"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v35, CFSTR("JFXFaceTrackingKey_InterfaceOrientation"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v29, "currentTrackingType"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v36, CFSTR("JFXFaceTrackingKey_TrackingType"));

          JFXLog_DebugFaceTrackingPlayback();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v28, "renderEffect");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "uuid");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v55 = v44;
            v56 = 2048;
            v57 = v41;
            v58 = 2112;
            v59 = v42;
            _os_log_debug_impl(&dword_2269A9000, v37, OS_LOG_TYPE_DEBUG, "add timedProperties delegate %p for PVEffect %p on clip %@", buf, 0x20u);

          }
          objc_msgSend(v28, "renderEffect");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addTimedPropertiesDelegate:userContext:", v44, v32);

        }
        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
    }
    while (v25);
  }

}

- (void)noteEffectChangeForClip:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "mediaType");
  if (v5 > 9 || ((1 << v5) & 0x20E) == 0)
  {
    JFXLog_playback();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[JFXComposition noteEffectChangeForClip:].cold.1();

  }
  else
  {
    -[JFXComposition rebuildCompositionInstructionsForVideoStillTitleCard:](self, "rebuildCompositionInstructionsForVideoStillTitleCard:", v4);
  }

}

- (void)notifyPlaybackWillBegin
{
  -[JFXComposition JFX_setScrubbingModeForPlaybackDelegates:](self, "JFX_setScrubbingModeForPlaybackDelegates:", 0);
}

- (void)notifyPlaybackDidStopAtTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  -[JFXComposition JFX_setScrubbingModeForPlaybackDelegates:](self, "JFX_setScrubbingModeForPlaybackDelegates:", 1);
  v5 = *a3;
  -[JFXComposition notifyNeedsEffectPropertiesUpdatedForPlaybackTime:](self, "notifyNeedsEffectPropertiesUpdatedForPlaybackTime:", &v5);
}

- (void)notifyNeedsEffectPropertiesUpdatedForPlaybackTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3;

  v3 = *a3;
  -[JFXComposition JFX_updateFaceTrackPropertiesForEffectsAtTime:](self, "JFX_updateFaceTrackPropertiesForEffectsAtTime:", &v3);
}

- (void)JFX_updateFaceTrackPropertiesForEffectsAtTime:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  Float64 Seconds;
  void *v24;
  void *v25;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CMTimeRange range;
  CMTime time;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= 1)
  {
    v7 = 0;
    while (1)
    {
      -[JFXComposition clipsDataSource](self, "clipsDataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "playableElementAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[JFXComposition timeRangeForClip:](self, "timeRangeForClip:", v9);
      time = (CMTime)*a3;
      if (CMTimeRangeContainsTime(&range, &time))
        break;

      if (v6 == ++v7)
        return;
    }
    -[JFXComposition clipFaceTrackingPlaybackDelegates](self, "clipFaceTrackingPlaybackDelegates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v9, "mediaItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "interfaceOrientationForDisplay");

      objc_msgSend(v9, "playableEffectsOfType:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      time = (CMTime)*a3;
      v32 = v13;
      v33 = v11;
      objc_msgSend(v11, "faceTrackingTransformAtTime:forDisplayingMediaAtInterfaceOrientation:", &time, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v16 = v14;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v36;
        v34 = v15;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v36 != v19)
              objc_enumerationMutation(v16);
            v21 = *(id *)(*((_QWORD *)&v35 + 1) + 8 * v20);
            JFXLog_DebugFaceTrackingPlayback();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              time = (CMTime)*a3;
              Seconds = CMTimeGetSeconds(&time);
              objc_msgSend(v21, "renderEffect");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "uuid");
              v25 = v9;
              v26 = a3;
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(time.value) = 134218498;
              *(Float64 *)((char *)&time.value + 4) = Seconds;
              LOWORD(time.flags) = 2048;
              *(_QWORD *)((char *)&time.flags + 2) = v24;
              HIWORD(time.epoch) = 2112;
              v41 = v27;
              _os_log_debug_impl(&dword_2269A9000, v22, OS_LOG_TYPE_DEBUG, "update face tracking properties at time %f for PVEffect %p on clip %@", (uint8_t *)&time, 0x20u);

              a3 = v26;
              v9 = v25;

              v15 = v34;
            }

            if ((objc_msgSend(v21, "isEditingFaceTrackingTransforms") & 1) == 0)
              objc_msgSend(v21, "setFaceTrackingTransform:", v15);

            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
        }
        while (v18);
      }

      time = (CMTime)*a3;
      v11 = v33;
      objc_msgSend(v33, "arDataAtTime:forDisplayingMediaAtInterfaceOrientation:", &time, v32);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v28 = 0;
    }
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setMostRecentARMetadata:", v28);

    objc_msgSend(v28, "faceAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setHasValidFaceData:", v30 != 0);

  }
}

- (void)JFX_setScrubbingModeForPlaybackDelegates:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= 1)
  {
    for (i = 0; i != v6; ++i)
    {
      -[JFXComposition clipsDataSource](self, "clipsDataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "playableElementAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[JFXComposition clipCustomRendererMap](self, "clipCustomRendererMap");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[JFXComposition clipFaceTrackingPlaybackDelegates](self, "clipFaceTrackingPlaybackDelegates");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setIsScrubbing:", v3);
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("JFXCustomRenderingPropertiesKey_Animoji"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "renderingDelegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v16, "setIsScrubbing:", v3);

      }
    }
  }
}

- (id)AVComposition
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;

  -[JFXComposition avComposition](self, "avComposition");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3 || (v4 = (void *)v3, v5 = -[JFXComposition needsUpdate](self, "needsUpdate"), v4, v5))
    -[JFXComposition update](self, "update");
  return -[JFXComposition avComposition](self, "avComposition");
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v7;

  if (-[JFXComposition needsUpdate](self, "needsUpdate"))
    -[JFXComposition update](self, "update");
  -[JFXComposition avComposition](self, "avComposition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    objc_msgSend(v5, "duration");
    v5 = v7;
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (BOOL)validate
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;

  if (-[JFXComposition needsUpdate](self, "needsUpdate"))
    -[JFXComposition update](self, "update");
  -[JFXComposition trackGroupA](self, "trackGroupA");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "validate");

  -[JFXComposition trackGroupB](self, "trackGroupB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "validate");

  JFXLog_DebugComposition();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[JFXComposition validate].cold.6();

  JFXLog_DebugComposition();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[JFXComposition validate].cold.5();

  JFXLog_DebugComposition();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[JFXComposition validate].cold.4(self, v9);

  JFXLog_DebugComposition();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[JFXComposition validate].cold.3(self, v10);

  JFXLog_DebugComposition();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[JFXComposition validate].cold.2();

  JFXLog_DebugComposition();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[JFXComposition validate].cold.1(self, v12);

  return v6 & v4;
}

- (void)updateRenderSizeIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v11;

  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "renderSize");
  v5 = v4;
  v7 = v6;

  -[JFXComposition previousRenderSize](self, "previousRenderSize");
  if (v9 != v5 || v8 != v7)
  {
    -[JFXComposition videoComposition](self, "videoComposition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRenderSize:", v5, v7);

    -[JFXComposition setPreviousRenderSize:](self, "setPreviousRenderSize:", v5, v7);
  }
}

- (void)refreshAVComposition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x2276A1DB0](self, a2);
  -[JFXComposition trackGroupA](self, "trackGroupA");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXComposition assetsUsed](self, "assetsUsed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "apply:", v5);

  -[JFXComposition trackGroupB](self, "trackGroupB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXComposition assetsUsed](self, "assetsUsed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "apply:", v7);

  -[JFXComposition removeEmptyTracks](self, "removeEmptyTracks");
  -[JFXComposition videoComposition](self, "videoComposition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXComposition videoCompositionInstructions](self, "videoCompositionInstructions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInstructions:", v9);

  -[JFXComposition updateRenderSizeIfNeeded](self, "updateRenderSizeIfNeeded");
  -[JFXComposition setRenderScale](self, "setRenderScale");
  objc_autoreleasePoolPop(v3);
}

- (AVPlayerItem)playerItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  if (-[JFXComposition needsUpdate](self, "needsUpdate"))
  {
    -[JFXComposition updateRenderSizeIfNeeded](self, "updateRenderSizeIfNeeded");
    -[JFXComposition update](self, "update");
  }
  -[JFXComposition avPlayerItem](self, "avPlayerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[JFXComposition refreshAVComposition](self, "refreshAVComposition");
    v4 = (void *)MEMORY[0x24BDB2618];
    -[JFXComposition avComposition](self, "avComposition");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend((id)v5, "copy");
    objc_msgSend(v4, "playerItemWithAsset:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXComposition setAvPlayerItem:](self, "setAvPlayerItem:", v7);

    -[JFXComposition avPlayerItem](self, "avPlayerItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSeekingWaitsForVideoCompositionRendering:", 1);

    -[JFXComposition avPlayerItem](self, "avPlayerItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[JFXComposition avPlayerItem](self, "avPlayerItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAppliesPerFrameHDRDisplayMetadata:", 0);

    }
    v11 = *MEMORY[0x24BDB1A08];
    -[JFXComposition avPlayerItem](self, "avPlayerItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAudioTimePitchAlgorithm:", v11);

  }
  return -[JFXComposition avPlayerItem](self, "avPlayerItem");
}

- (void)JFX_applyPropertiesForCustomVideoCompositor:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v4 = a3;
  if (v4)
  {
    if (-[JFXComposition parentCode](self, "parentCode") != -1)
      objc_msgSend(v4, "setParentCode:", -[JFXComposition parentCode](self, "parentCode"));
    -[JFXComposition clipsDataSource](self, "clipsDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isExporting");

    if (v6)
      objc_msgSend(v4, "setImmediatelyCancelPendingRequests:", 1);
    objc_msgSend(v4, "videoCompositingContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContext:", v9);

    -[JFXComposition compositionOutputColorSpace](self, "compositionOutputColorSpace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOutputColorSpace:", v10);

  }
  else
  {
    JFXLog_playback();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[JFXComposition JFX_applyPropertiesForCustomVideoCompositor:].cold.1();

  }
}

- (void)applyExportProperties
{
  -[JFXComposition updateRenderSizeIfNeeded](self, "updateRenderSizeIfNeeded");
  -[JFXComposition update](self, "update");
  -[JFXComposition refreshAVComposition](self, "refreshAVComposition");
  -[JFXComposition JFX_finalizeVideoComposition](self, "JFX_finalizeVideoComposition");
}

- (void)applyPlayerItemProperties
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[JFXComposition JFX_finalizeVideoComposition](self, "JFX_finalizeVideoComposition");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDB1FA8];
  -[JFXComposition avPlayerItem](self, "avPlayerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_playerItemDidReachEnd_, v4, v5);

  -[JFXComposition avPlayerItem](self, "avPlayerItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXComposition videoComposition](self, "videoComposition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVideoComposition:", v7);

  -[JFXComposition avPlayerItem](self, "avPlayerItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "customVideoCompositor");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[JFXComposition JFX_applyPropertiesForCustomVideoCompositor:](self, "JFX_applyPropertiesForCustomVideoCompositor:", v9);
}

- (void)clearPlayerItemProperties
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDB1FA8];
  -[JFXComposition avPlayerItem](self, "avPlayerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  -[JFXComposition markDirty](self, "markDirty");
  -[JFXComposition videoComposition](self, "videoComposition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCustomVideoCompositorClass:", 0);

  v7 = objc_alloc_init(MEMORY[0x24BDB25C8]);
  -[JFXComposition setVideoComposition:](self, "setVideoComposition:", v7);

  -[JFXComposition avPlayerItem](self, "avPlayerItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXComposition videoComposition](self, "videoComposition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVideoComposition:", v8);

}

- (PVColorSpace)compositionOutputColorSpace
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "jfx_supportsHDR") & 1) == 0)
  {

    goto LABEL_6;
  }
  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 < 1)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x24BE78FF8], "rec709GammaColorSpace");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    return (PVColorSpace *)v9;
  }
  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "isExporting");

  if ((_DWORD)v6)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "jfx_displayColorSpace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "jfx_recommendedDisplayColorSpaceForColorSpace:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE78FF8], "jfx_compareAndChooseLesserColorSpace:right:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "jfx_recommendedDisplayColorSpaceForColorSpace:", v14);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (PVColorSpace *)v9;
}

- (void)JFX_finalizeVideoComposition
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_2269A9000, v0, v1, "WARNING: Composition (%p) does not have parentCode which will make it difficult to see rendering associated with composition in Ariadne traces", v2);
  OUTLINED_FUNCTION_4();
}

- (void)playerItemDidReachEnd:(id)a3
{
  void *v3;
  id v4;

  -[JFXComposition avPlayerItem](self, "avPlayerItem", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customVideoCompositor");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "printAndClearStats");
}

- ($70930193D4F448A53BB9343C0237EB5F)timeRangeForClip:(SEL)a3
{
  id v6;
  int v7;
  int v8;
  int64_t v9;
  void *v10;
  void *v11;
  $70930193D4F448A53BB9343C0237EB5F *result;
  CMTime v13;
  CMTime start;

  v6 = a4;
  v7 = objc_msgSend(v6, "presentationTime");
  v8 = objc_msgSend(v6, "duration");

  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  v9 = v7;
  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeMake(&start, v9, objc_msgSend(v10, "timeScale"));
  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeMake(&v13, v8, objc_msgSend(v11, "timeScale"));
  CMTimeRangeMake((CMTimeRange *)retstr, &start, &v13);

  return result;
}

- (int)outputFrameRate
{
  void *v2;
  int v3;

  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "frameRate");

  return v3;
}

- (void)burnInPlaybackSettings:(id)a3
{
  objc_msgSend(a3, "outputNode");

}

- (BOOL)JFX_isContigousSplitClip:(id)a3 nextClip:(id)a4
{
  id v5;
  id v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "mediaStartOffset");
  v8 = objc_msgSend(v5, "mediaStartOffset");
  if (v7 == objc_msgSend(v5, "duration") + v8)
  {
    objc_msgSend(v5, "mediaItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (Class)instructionBuilderClass
{
  return (Class)objc_opt_class();
}

- (id)newInstructionGraphNodeForClip:(id)a3 clipTransform:(CGAffineTransform *)a4 compositionTrackID:(int)a5 requiresTweening:(BOOL *)a6 isContainedClip:(BOOL)a7
{
  uint64_t v7;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  JFXPlayableElement *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  PVTransformAnimationInfo *p_liveCompositionTransform;
  void *v31;
  void *v32;
  __int128 v33;
  void *v34;
  BOOL v35;
  uint64_t v36;
  void *v37;
  float v38;
  float v39;
  void *v40;
  uint64_t v41;
  BOOL v42;
  _OWORD v45[3];
  char v46[48];
  _QWORD v47[4];
  JFXPlayableElement *v48;
  double v49;
  double v50;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "renderSize");
  v13 = v12;
  v15 = v14;

  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frameSize");
  v18 = v17;
  v20 = v19;

  -[JFXComposition compositionOutputColorSpace](self, "compositionOutputColorSpace");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "instructionBuilderClass")), "initWithOutputSize:frameSize:outputColorSpace:", v21, v13, v15, v18, v20);
  -[JFXComposition clipsDataSource](self, "clipsDataSource");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isExporting");

  objc_msgSend(v22, "setRenderingIntent:", v24);
  objc_msgSend(v10, "playableEffectStack");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __115__JFXComposition_newInstructionGraphNodeForClip_clipTransform_compositionTrackID_requiresTweening_isContainedClip___block_invoke;
  v47[3] = &unk_24EE57EA0;
  v49 = v13;
  v50 = v15;
  v26 = (JFXPlayableElement *)v10;
  v48 = v26;
  objc_msgSend(v25, "enumerateObjectsUsingBlock:", v47);

  -[JFXComposition liveTransformClip](self, "liveTransformClip");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27 && self->_liveTransformClip != v26)
  {
    JFXLog_playback();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[JFXComposition newInstructionGraphNodeForClip:clipTransform:compositionTrackID:requiresTweening:isContainedClip:].cold.1();

  }
  -[JFXComposition timeRangeForClip:](self, "timeRangeForClip:", v26);
  -[JFXComposition liveTransformClip](self, "liveTransformClip");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    p_liveCompositionTransform = &self->_liveCompositionTransform;
  else
    p_liveCompositionTransform = 0;
  -[JFXComposition clipCustomRendererMap](self, "clipCustomRendererMap");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKey:", v26);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *(_OWORD *)&a4->c;
  v45[0] = *(_OWORD *)&a4->a;
  v45[1] = v33;
  v45[2] = *(_OWORD *)&a4->tx;
  objc_msgSend(v22, "instructionGraphForPlayableElement:presentationTimeRange:sourceTransform:compositionTrackID:liveTransform:excludingEffectType:customRendererProperties:", v26, v46, v45, v7, p_liveCompositionTransform, 0, v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6)
  {
    if (-[JFXPlayableElement mediaType](v26, "mediaType") == 2)
    {
      v35 = 1;
      goto LABEL_22;
    }
    if (-[JFXPlayableElement mediaType](v26, "mediaType") == 1)
    {
      if ((int)v7 < 1)
      {
        v35 = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v36 = -[JFXPlayableElement mediaType](v26, "mediaType");
      v35 = 0;
      if ((int)v7 < 1 || v36 != 9)
      {
LABEL_22:
        -[JFXPlayableElement playableEffectStack](v26, "playableEffectStack");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "count");

        if (v41)
          v42 = 1;
        else
          v42 = v35;
        *a6 = v42;
        goto LABEL_26;
      }
    }
    -[JFXPlayableElement mediaItem](v26, "mediaItem");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "frameRate");
    v39 = v38 * 1.1;
    v35 = v39 > 0.0 && v39 < (float)-[JFXComposition outputFrameRate](self, "outputFrameRate");

    goto LABEL_22;
  }
LABEL_26:

  return v34;
}

void __115__JFXComposition_newInstructionGraphNodeForClip_clipTransform_compositionTrackID_requiresTweening_isContainedClip___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  id v5;

  v3 = *(double *)(a1 + 40);
  v4 = *(double *)(a1 + 48);
  v5 = a2;
  objc_msgSend(v5, "setRenderSize:", v3, v4);
  objc_msgSend(v5, "setPlayableAspectRatio:", objc_msgSend(*(id *)(a1 + 32), "playableAspectRatio"));
  objc_msgSend(v5, "setPlayableAspectRatioPreservationMode:", objc_msgSend(*(id *)(a1 + 32), "playableAspectRatioPreservationMode"));

}

- (void)setPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_playerItem, a3);
}

- (AVMutableComposition)avComposition
{
  return self->_avComposition;
}

- (void)setAvComposition:(id)a3
{
  objc_storeStrong((id *)&self->_avComposition, a3);
}

- (AVMutableVideoComposition)videoComposition
{
  return self->_videoComposition;
}

- (void)setVideoComposition:(id)a3
{
  objc_storeStrong((id *)&self->_videoComposition, a3);
}

- (AVMutableAudioMix)audioMix
{
  return self->_audioMix;
}

- (void)setAudioMix:(id)a3
{
  objc_storeStrong((id *)&self->_audioMix, a3);
}

- (float)globalAudioVolume
{
  return self->_globalAudioVolume;
}

- (void)setGlobalAudioVolume:(float)a3
{
  self->_globalAudioVolume = a3;
}

- (void)setDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_duration.epoch = a3->var3;
  *(_OWORD *)&self->_duration.value = v3;
}

- (CGSize)viewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewSize.width;
  height = self->_viewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unsigned)parentCode
{
  return self->_parentCode;
}

- (void)setParentCode:(unsigned int)a3
{
  self->_parentCode = a3;
}

- (NSMapTable)clipCustomRendererMap
{
  return self->_clipCustomRendererMap;
}

- (void)setClipCustomRendererMap:(id)a3
{
  objc_storeStrong((id *)&self->_clipCustomRendererMap, a3);
}

- (NSMapTable)clipFaceTrackingPlaybackDelegates
{
  return self->_clipFaceTrackingPlaybackDelegates;
}

- (void)setClipFaceTrackingPlaybackDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_clipFaceTrackingPlaybackDelegates, a3);
}

- (AVPlayerItem)avPlayerItem
{
  return self->_avPlayerItem;
}

- (void)setAvPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_avPlayerItem, a3);
}

- (JFXCompositionTrackGroup)trackGroupA
{
  return self->_trackGroupA;
}

- (void)setTrackGroupA:(id)a3
{
  objc_storeStrong((id *)&self->_trackGroupA, a3);
}

- (JFXCompositionTrackGroup)trackGroupB
{
  return self->_trackGroupB;
}

- (void)setTrackGroupB:(id)a3
{
  objc_storeStrong((id *)&self->_trackGroupB, a3);
}

- (NSMutableArray)audioMixParameters
{
  return self->_audioMixParameters;
}

- (void)setAudioMixParameters:(id)a3
{
  objc_storeStrong((id *)&self->_audioMixParameters, a3);
}

- (JFXCompositionPlayableElementsDataSource)clipsDataSource
{
  return self->_clipsDataSource;
}

- (void)setClipsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_clipsDataSource, a3);
}

- (NSMutableArray)videoCompositionInstructions
{
  return self->_videoCompositionInstructions;
}

- (void)setVideoCompositionInstructions:(id)a3
{
  objc_storeStrong((id *)&self->_videoCompositionInstructions, a3);
}

- (CGSize)previousRenderSize
{
  double width;
  double height;
  CGSize result;

  width = self->_previousRenderSize.width;
  height = self->_previousRenderSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreviousRenderSize:(CGSize)a3
{
  self->_previousRenderSize = a3;
}

- (int64_t)backgroundAudioTrackCount
{
  return self->_backgroundAudioTrackCount;
}

- (void)setBackgroundAudioTrackCount:(int64_t)a3
{
  self->_backgroundAudioTrackCount = a3;
}

- (int64_t)foregroundAudioTrackCount
{
  return self->_foregroundAudioTrackCount;
}

- (void)setForegroundAudioTrackCount:(int64_t)a3
{
  self->_foregroundAudioTrackCount = a3;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (JFXPlayableElement)liveTransformClip
{
  return self->_liveTransformClip;
}

- (void)setLiveTransformClip:(id)a3
{
  objc_storeStrong((id *)&self->_liveTransformClip, a3);
}

- (PVTransformAnimationInfo)liveCompositionTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].time.value;
  *(_OWORD *)&retstr->time.value = *(_OWORD *)&self[3].scale;
  *(_OWORD *)&retstr->time.epoch = v3;
  *(_OWORD *)&retstr->translation.y = *(_OWORD *)&self[4].time.epoch;
  retstr->rotation = self[4].translation.y;
  return self;
}

- (void)setLiveCompositionTransform:(PVTransformAnimationInfo *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->time.value;
  v4 = *(_OWORD *)&a3->time.epoch;
  v5 = *(_OWORD *)&a3->translation.y;
  self->_liveCompositionTransform.rotation = a3->rotation;
  *(_OWORD *)&self->_liveCompositionTransform.time.epoch = v4;
  *(_OWORD *)&self->_liveCompositionTransform.translation.y = v5;
  *(_OWORD *)&self->_liveCompositionTransform.time.value = v3;
}

- (NSMutableDictionary)assetsUsed
{
  return self->_assetsUsed;
}

- (void)setAssetsUsed:(id)a3
{
  objc_storeStrong((id *)&self->_assetsUsed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsUsed, 0);
  objc_storeStrong((id *)&self->_liveTransformClip, 0);
  objc_storeStrong((id *)&self->_videoCompositionInstructions, 0);
  objc_storeStrong((id *)&self->_clipsDataSource, 0);
  objc_storeStrong((id *)&self->_audioMixParameters, 0);
  objc_storeStrong((id *)&self->_trackGroupB, 0);
  objc_storeStrong((id *)&self->_trackGroupA, 0);
  objc_storeStrong((id *)&self->_avPlayerItem, 0);
  objc_storeStrong((id *)&self->_clipFaceTrackingPlaybackDelegates, 0);
  objc_storeStrong((id *)&self->_clipCustomRendererMap, 0);
  objc_storeStrong((id *)&self->_audioMix, 0);
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_avComposition, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
}

- (void)updateVideoAndAudioInstructionForState:previousInstructions:waitingForResource:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_2269A9000, v0, v1, "clip mediaType %ld not implemented...", v2);
  OUTLINED_FUNCTION_4();
}

- (void)rebuildCompositionInstructionsForVideoStillTitleCard:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_2269A9000, v0, v1, "noteEffectChangeForClip called with nil avPlayerItem !", v2);
  OUTLINED_FUNCTION_1();
}

- (void)rebuildCompositionInstructionsForVideoStillTitleCard:(NSObject *)a3 .cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_6(&dword_2269A9000, a3, (uint64_t)a3, "noteEffectChangeForClip: unsuported clipType...", a1);
}

- (void)noteEffectChangeForClip:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_2269A9000, v0, v1, "noteEffectChangeForClip does not understand that clip type: %@", v2);
  OUTLINED_FUNCTION_4();
}

- (void)validate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Composition:\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)JFX_applyPropertiesForCustomVideoCompositor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_2269A9000, v0, v1, "WARNING!!! Trying to update nonexistent customVideoCompositor instance", v2);
  OUTLINED_FUNCTION_1();
}

- (void)newInstructionGraphNodeForClip:clipTransform:compositionTrackID:requiresTweening:isContainedClip:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Oops, liveTransformClip mismatch !", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
