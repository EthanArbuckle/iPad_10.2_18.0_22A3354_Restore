@implementation MPCModelMediaClipAVItem

+ (id)requiredMediaClipProperties
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  uint64_t v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDDCB30]);
  v3 = *MEMORY[0x24BDDBE80];
  v16[0] = *MEMORY[0x24BDDBE88];
  v16[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BDDC318];
  v5 = (void *)MEMORY[0x24BDDCB30];
  v6 = *MEMORY[0x24BDDC1A0];
  v13[0] = *MEMORY[0x24BDDC190];
  v13[1] = v6;
  v7 = *MEMORY[0x24BDDC198];
  v13[2] = *MEMORY[0x24BDDC1A8];
  v13[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertySetWithProperties:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v2, "initWithProperties:relationships:", v4, v10);

  return v11;
}

- (MPCModelMediaClipAVItem)initWithMediaClip:(id)a3
{
  id v5;
  MPCModelMediaClipAVItem *v6;
  MPCModelMediaClipAVItem *v7;

  v5 = a3;
  v6 = -[MPCModelMediaClipAVItem init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mediaClip, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)MPCModelMediaClipAVItem;
  -[MPCModelMediaClipAVItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelMediaClipAVItem mainTitle](self, "mainTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)durationFromExternalMetadata
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[MPModelMediaClip staticAssets](self->_mediaClip, "staticAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "duration");
  v5 = v4;

  return v5;
}

- (BOOL)isAssetURLValid
{
  void *v3;
  int IsCellular;

  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "networkType");

  if ((ICEnvironmentNetworkTypeIsWiFi() & 1) != 0 || (ICEnvironmentNetworkTypeIsWired() & 1) != 0)
  {
    LOBYTE(IsCellular) = 1;
  }
  else
  {
    IsCellular = ICEnvironmentNetworkTypeIsCellular();
    if (IsCellular)
      LOBYTE(IsCellular) = -[MPCModelMediaClipAVItem _allowsCellularPlayback](self, "_allowsCellularPlayback");
  }
  return IsCellular;
}

- (BOOL)isStreamable
{
  return 1;
}

- (BOOL)isValidPlayerSubstituteForItem:(id)a3
{
  MPCModelMediaClipAVItem *v4;
  uint64_t v5;
  BOOL v6;
  MPModelMediaClip *mediaClip;
  MPModelMediaClip *v8;

  v4 = (MPCModelMediaClipAVItem *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      mediaClip = self->_mediaClip;
      -[MPCModelMediaClipAVItem mediaClip](v4, "mediaClip");
      v8 = (MPModelMediaClip *)objc_claimAutoreleasedReturnValue();
      v6 = mediaClip == v8;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)loadAssetAndPlayerItemWithTask:(id)a3 completion:(id)a4
{
  void *v5;
  _BOOL8 v6;
  int IsCellular;
  int IsWired;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (**v22)(id, uint64_t, _QWORD);

  v22 = (void (**)(id, uint64_t, _QWORD))a4;
  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "networkType");

  v6 = -[MPCModelMediaClipAVItem _allowsCellularPlayback](self, "_allowsCellularPlayback");
  IsCellular = ICEnvironmentNetworkTypeIsCellular();
  if ((ICEnvironmentNetworkTypeIsWiFi() & 1) != 0
    || (IsWired = ICEnvironmentNetworkTypeIsWired(), IsCellular ^ 1 | v6)
    || IsWired)
  {
    -[MPCModelMediaClipAVItem _currentPreferredStaticAsset](self, "_currentPreferredStaticAsset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v11, *MEMORY[0x24BDB2108]);

      v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      -[MPCModelMediaClipAVItem rtcReportingServiceIdentifier](self, "rtcReportingServiceIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_msgSend(v12, "setObject:forKey:", v13, *MEMORY[0x24BDB2138]);
      objc_msgSend(v10, "setObject:forKey:", v12, *MEMORY[0x24BDB2130]);
      objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_24CB169E0, *MEMORY[0x24BDB21F0]);
      v14 = (void *)MEMORY[0x24BDB26C8];
      objc_msgSend(v9, "url");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URLAssetWithURL:options:", v15, v10);
      v16 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v17 = (int)*MEMORY[0x24BDDCD08];
      v18 = *(Class *)((char *)&self->super.super.isa + v17);
      *(Class *)((char *)&self->super.super.isa + v17) = v16;

      objc_msgSend(MEMORY[0x24BDB2618], "playerItemWithAsset:", *(Class *)((char *)&self->super.super.isa + v17));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAudioTimePitchAlgorithm:", *MEMORY[0x24BDB1A00]);
      -[MPCModelMediaClipAVItem setPlayerItem:](self, "setPlayerItem:", v19);

    }
  }
  v20 = (int)*MEMORY[0x24BDDCD10];
  v21 = *(uint64_t *)((char *)&self->super.super.isa + v20);
  if (!v21)
  {
    -[MPCModelMediaClipAVItem setItemError:](self, "setItemError:", 0);
    v21 = *(uint64_t *)((char *)&self->super.super.isa + v20);
  }
  v22[2](v22, v21, 0);

}

- (id)mainTitle
{
  return (id)-[MPModelMediaClip title](self->_mediaClip, "title");
}

- (id)modelGenericObject
{
  MPModelGenericObject *modelGenericObject;
  id v4;
  void *v5;
  MPModelGenericObject *v6;
  MPModelGenericObject *v7;
  _QWORD v9[5];

  modelGenericObject = self->_modelGenericObject;
  if (!modelGenericObject)
  {
    v4 = objc_alloc(MEMORY[0x24BDDC890]);
    objc_msgSend(MEMORY[0x24BDDC758], "emptyIdentifierSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __45__MPCModelMediaClipAVItem_modelGenericObject__block_invoke;
    v9[3] = &unk_24CABA0E0;
    v9[4] = self;
    v6 = (MPModelGenericObject *)objc_msgSend(v4, "initWithIdentifiers:block:", v5, v9);
    v7 = self->_modelGenericObject;
    self->_modelGenericObject = v6;

    modelGenericObject = self->_modelGenericObject;
  }
  return modelGenericObject;
}

- (BOOL)prefersSeekOverSkip
{
  return 1;
}

- (void)reevaluateType
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPCModelMediaClipAVItem;
  -[MPCModelMediaClipAVItem reevaluateType](&v3, sel_reevaluateType);
  -[MPCModelMediaClipAVItem _applyLoudnessInfo](self, "_applyLoudnessInfo");
}

- (BOOL)supportsRateChange
{
  return 0;
}

- (BOOL)allowsAirPlayFromCloud
{
  return 1;
}

- (BOOL)allowsExternalPlayback
{
  return 1;
}

- (id)artworkCatalogBlock
{
  MPModelMediaClip *v2;
  MPModelMediaClip *v3;
  void *v4;
  _QWORD aBlock[4];
  MPModelMediaClip *v7;

  v2 = self->_mediaClip;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__MPCModelMediaClipAVItem_artworkCatalogBlock__block_invoke;
  aBlock[3] = &unk_24CABA1A8;
  v7 = v2;
  v3 = v2;
  v4 = _Block_copy(aBlock);

  return v4;
}

- (id)rtcReportingServiceIdentifier
{
  return CFSTR("app.music.media-clip");
}

- (BOOL)_allowsCellularPlayback
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = -[MPCModelMediaClipAVItem _isVideoAsset](self, "_isVideoAsset");
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = objc_msgSend(v3, "preferredVideoLowBandwidthResolution");
  else
    v5 = objc_msgSend(v3, "preferredMusicLowBandwidthResolution");
  v6 = v5;

  return v6 > 0;
}

- (void)_applyLoudnessInfo
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[MPCModelMediaClipAVItem isAssetLoaded](self, "isAssetLoaded"))
  {
    -[MPCModelMediaClipAVItem asset](self, "asset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "statusOfValueForKey:error:", CFSTR("tracks"), 0);

    if (v4 == 2)
    {
      v5 = *MEMORY[0x24BE0AA98];
      v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v7 = v6;
      if (v5)
        objc_msgSend(v6, "setObject:forKey:", v5, *MEMORY[0x24BE0AA78]);
      -[MPCModelMediaClipAVItem playerItem](self, "playerItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tracks");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v15;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v15 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "setLoudnessInfo:", v7);
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v11);
      }

    }
  }
}

- (id)_currentPreferredStaticAsset
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  int v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "networkType");

  if (CFPreferencesGetAppBooleanValue(CFSTR("AlwaysUse64kbpsQuality"), CFSTR("com.apple.mobileipod"), 0))
    goto LABEL_2;
  if (CFPreferencesGetAppBooleanValue(CFSTR("AlwaysUse256kbpsQuality"), CFSTR("com.apple.mobileipod"), 0))
    goto LABEL_4;
  if ((ICEnvironmentNetworkTypeIsBluetooth() & 1) == 0)
  {
    if (!-[MPCModelMediaClipAVItem _isVideoAsset](self, "_isVideoAsset"))
    {
      if ((ICEnvironmentNetworkTypeIsWired() & 1) == 0)
      {
        if (ICEnvironmentNetworkTypeIsWiFi())
        {
          objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "isNetworkConstrained");

          if ((v25 & 1) != 0)
            goto LABEL_2;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v27, "preferredVideoLowBandwidthResolution") >= 256)
          {

            if (v4 <= 2)
              goto LABEL_2;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "isCurrentNetworkLinkExpensive");

            if ((v29 & 1) != 0 || v4 < 3)
              goto LABEL_2;
          }
          objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "isNetworkConstrained");

          if (v31)
            goto LABEL_2;
        }
      }
LABEL_4:
      v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
LABEL_5:
      objc_msgSend(v5, "addObject:", &unk_24CB169F8);
      objc_msgSend(v5, "addObject:", &unk_24CB16A10);
      goto LABEL_6;
    }
    if ((ICEnvironmentNetworkTypeIsWiFi() & 1) != 0
      || ICEnvironmentNetworkTypeIsWired()
      || v4 >= 3
      && (objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "isCurrentNetworkLinkExpensive"),
          v18,
          (v19 & 1) == 0))
    {
      objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "preferredVideoHighBandwidthResolution");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "preferredVideoLowBandwidthResolution");

      if (v21 < 1)
        goto LABEL_2;
      objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "preferredVideoLowBandwidthResolution");
    }
    v26 = v23;

    if (v26)
    {
      v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      if (v26 != 1000000)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
LABEL_2:
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
LABEL_6:
  objc_msgSend(v5, "addObject:", &unk_24CB16A28);
  -[MPModelMediaClip staticAssets](self->_mediaClip, "staticAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v7)
    goto LABEL_18;
  v8 = v7;
  v32 = 0;
  v9 = *(_QWORD *)v34;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v34 != v9)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "flavorType"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v5, "indexOfObject:", v13);

      if (v14 != 0x7FFFFFFFFFFFFFFFLL && (v10 == 0x7FFFFFFFFFFFFFFFLL || v14 < v10))
      {
        v15 = v12;

        v32 = v15;
        v10 = v14;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  }
  while (v8);
  v16 = v32;
  if (!v32)
  {
LABEL_18:
    objc_msgSend(v6, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (BOOL)_isVideoAsset
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[MPModelMediaClip staticAssets](self->_mediaClip, "staticAssets");
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "mediaType", (_QWORD)v7) == 2)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (MPModelMediaClip)mediaClip
{
  return self->_mediaClip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaClip, 0);
  objc_storeStrong((id *)&self->_modelGenericObject, 0);
}

uint64_t __46__MPCModelMediaClipAVItem_artworkCatalogBlock__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "previewArtworkCatalog");
}

uint64_t __45__MPCModelMediaClipAVItem_modelGenericObject__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMediaClip:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528));
}

@end
