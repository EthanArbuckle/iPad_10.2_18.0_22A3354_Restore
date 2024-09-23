@implementation HFMediaPlaybackActionBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFMediaPlaybackActionBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  void *v4;
  id v7;
  HFMediaPlaybackActionBuilder *v8;
  HFMediaPlaybackActionBuilder *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSNumber *targetVolume;
  void *v22;
  void *v23;
  HFPlaybackArchive *v24;
  HFPlaybackArchive *v25;
  _QWORD v27[4];
  id v28;
  objc_super v29;

  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)HFMediaPlaybackActionBuilder;
  v8 = -[HFItemBuilder initWithExistingObject:inHome:](&v29, sel_initWithExistingObject_inHome_, a3, v7);
  v9 = v8;
  if (v8)
  {
    -[HFActionBuilder action](v8, "action");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mediaProfiles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __62__HFMediaPlaybackActionBuilder_initWithExistingObject_inHome___block_invoke;
    v27[3] = &unk_1EA72CDB8;
    v12 = v7;
    v28 = v12;
    objc_msgSend(v11, "na_map:", v27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;

    -[HFMediaPlaybackActionBuilder mediaProfileContainersForAccessories:home:](v9, "mediaProfileContainersForAccessories:home:", v16, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v9->_accessories, v16);
    objc_storeStrong((id *)&v9->_mediaProfiles, v17);
    -[HFActionBuilder action](v9, "action");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_targetPlayState = objc_msgSend(v18, "state");

    -[HFActionBuilder action](v9, "action");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "volume");
    v20 = objc_claimAutoreleasedReturnValue();
    targetVolume = v9->_targetVolume;
    v9->_targetVolume = (NSNumber *)v20;

    -[HFActionBuilder action](v9, "action");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "playbackArchive");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = [HFPlaybackArchive alloc];
      -[HFActionBuilder action](v9, "action");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "playbackArchive");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[HFPlaybackArchive initWithMediaPlayerPlaybackArchive:](v24, "initWithMediaPlayerPlaybackArchive:", v4);
    }
    else
    {
      v25 = 0;
    }
    objc_storeStrong((id *)&v9->_playbackArchive, v25);
    if (v23)
    {

    }
  }

  return v9;
}

id __62__HFMediaPlaybackActionBuilder_initWithExistingObject_inHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__HFMediaPlaybackActionBuilder_initWithExistingObject_inHome___block_invoke_2;
  v8[3] = &unk_1EA727840;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __62__HFMediaPlaybackActionBuilder_initWithExistingObject_inHome___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "mediaProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  return v6;
}

- (BOOL)canUpdateWithActionBuilder:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)updateWithActionBuilder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  char v28;

  v4 = a3;
  if (-[HFMediaPlaybackActionBuilder canUpdateWithActionBuilder:](self, "canUpdateWithActionBuilder:", v4))
  {
    v5 = v4;
    -[HFMediaPlaybackActionBuilder accessories](self, "accessories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v5, "accessories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unionSet:", v8);

    -[HFMediaPlaybackActionBuilder accessories](self, "accessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToSet:", v9);

    if ((v10 & 1) == 0)
      -[HFMediaPlaybackActionBuilder setAccessories:](self, "setAccessories:", v7);
    v11 = v10 ^ 1;
    -[HFMediaPlaybackActionBuilder accessories](self, "accessories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemBuilder home](self, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaPlaybackActionBuilder mediaProfileContainersForAccessories:home:](self, "mediaProfileContainersForAccessories:home:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFMediaPlaybackActionBuilder mediaProfiles](self, "mediaProfiles");
    v15 = objc_claimAutoreleasedReturnValue();
    if ((void *)v15 == v14)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[HFMediaPlaybackActionBuilder mediaProfiles](self, "mediaProfiles");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToSet:", v14);

      if ((v18 & 1) == 0)
      {
        -[HFMediaPlaybackActionBuilder setMediaProfiles:](self, "setMediaProfiles:", v14);
        v11 = 1;
      }
    }
    v19 = -[HFMediaPlaybackActionBuilder targetPlayState](self, "targetPlayState");
    if (v19 != objc_msgSend(v5, "targetPlayState"))
    {
      -[HFMediaPlaybackActionBuilder setTargetPlayState:](self, "setTargetPlayState:", objc_msgSend(v5, "targetPlayState"));
      v11 = 1;
    }
    -[HFMediaPlaybackActionBuilder playbackArchive](self, "playbackArchive");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playbackArchive");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20 != v21)
    {
      objc_msgSend(v5, "playbackArchive");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFMediaPlaybackActionBuilder setPlaybackArchive:](self, "setPlaybackArchive:", v22);

      v11 = 1;
    }
    -[HFMediaPlaybackActionBuilder targetVolume](self, "targetVolume");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "targetVolume");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v23;
    v26 = v24;
    if (v25 == v26)
    {

    }
    else
    {
      v27 = v26;
      if (v25)
      {
        v28 = objc_msgSend(v25, "isEqual:", v26);

        if ((v28 & 1) != 0)
          goto LABEL_21;
      }
      else
      {

      }
      objc_msgSend(v5, "targetVolume");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      -[HFMediaPlaybackActionBuilder setTargetVolume:](self, "setTargetVolume:", v25);
      v11 = 1;
    }

LABEL_21:
    goto LABEL_22;
  }
  v11 = 0;
LABEL_22:

  return v11;
}

- (BOOL)requiresDeviceUnlock
{
  return 0;
}

- (BOOL)isAffectedByEndEvents
{
  return -[HFMediaPlaybackActionBuilder targetPlayState](self, "targetPlayState") == 1;
}

- (id)createNewAction
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[HFMediaPlaybackActionBuilder _ensureConsistency](self, "_ensureConsistency");
  v3 = 0;
  if (-[HFMediaPlaybackActionBuilder isMediaActionValid:](self, "isMediaActionValid:", 0))
  {
    -[HFMediaPlaybackActionBuilder accessories](self, "accessories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_map:", &__block_literal_global_113);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count"))
    {
      v6 = objc_alloc(MEMORY[0x1E0CBA648]);
      v7 = -[HFMediaPlaybackActionBuilder targetPlayState](self, "targetPlayState");
      -[HFMediaPlaybackActionBuilder targetVolume](self, "targetVolume");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFMediaPlaybackActionBuilder playbackArchive](self, "playbackArchive");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mediaPlayerPlaybackArchive");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)objc_msgSend(v6, "initWithMediaProfiles:playbackState:volume:playbackArchive:", v5, v7, v8, v10);

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

uint64_t __47__HFMediaPlaybackActionBuilder_createNewAction__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mediaProfile");
}

- (void)setMediaProfiles:(id)a3
{
  void *v4;
  void *v5;
  NSSet *v6;
  NSSet *mediaProfiles;
  id v8;

  if (self->_mediaProfiles != a3)
  {
    objc_msgSend(a3, "na_flatMap:", &__block_literal_global_115_1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaPlaybackActionBuilder setAccessories:](self, "setAccessories:", v4);

    -[HFMediaPlaybackActionBuilder accessories](self, "accessories");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[HFItemBuilder home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaPlaybackActionBuilder mediaProfileContainersForAccessories:home:](self, "mediaProfileContainersForAccessories:home:", v8, v5);
    v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    mediaProfiles = self->_mediaProfiles;
    self->_mediaProfiles = v6;

  }
}

uint64_t __49__HFMediaPlaybackActionBuilder_setMediaProfiles___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessories");
}

- (id)mediaProfileContainersForAccessories:(id)a3 home:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = a4;
  if (!v5)
    NSLog(CFSTR("Accessories should not be nil"));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__HFMediaPlaybackActionBuilder_mediaProfileContainersForAccessories_home___block_invoke;
  v10[3] = &unk_1EA72CE68;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v5, "na_map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __74__HFMediaPlaybackActionBuilder_mediaProfileContainersForAccessories_home___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(a2, "mediaProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mediaSystems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__HFMediaPlaybackActionBuilder_mediaProfileContainersForAccessories_home___block_invoke_2;
  v10[3] = &unk_1EA72CE40;
  v11 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = v5;
  v8 = v7;

  return v8;
}

uint64_t __74__HFMediaPlaybackActionBuilder_mediaProfileContainersForAccessories_home___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__HFMediaPlaybackActionBuilder_mediaProfileContainersForAccessories_home___block_invoke_3;
  v6[3] = &unk_1EA727840;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __74__HFMediaPlaybackActionBuilder_mediaProfileContainersForAccessories_home___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "mediaProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_mediaRouteIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hf_mediaRouteIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (BOOL)hasSameTargetAsAction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[HFMediaPlaybackActionBuilder mediaProfiles](self, "mediaProfiles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mediaProfiles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "intersectsSet:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyForCreatingNewAction
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HFPlaybackArchive *v8;
  void *v9;
  void *v10;
  void *v11;
  HFPlaybackArchive *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = objc_alloc((Class)objc_opt_class());
  -[HFItemBuilder home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithHome:", v4);

  objc_msgSend(v5, "setTargetPlayState:", -[HFMediaPlaybackActionBuilder targetPlayState](self, "targetPlayState"));
  -[HFMediaPlaybackActionBuilder targetVolume](self, "targetVolume");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v5, "setTargetVolume:", v7);

  v8 = [HFPlaybackArchive alloc];
  -[HFMediaPlaybackActionBuilder playbackArchive](self, "playbackArchive");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaPlayerPlaybackArchive");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithOptions:", 0);
  v12 = -[HFPlaybackArchive initWithMediaPlayerPlaybackArchive:](v8, "initWithMediaPlayerPlaybackArchive:", v11);
  objc_msgSend(v5, "setPlaybackArchive:", v12);

  -[HFMediaPlaybackActionBuilder accessories](self, "accessories");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v5, "setAccessories:", v14);

  objc_msgSend(v5, "accessories");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaProfileContainersForAccessories:home:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMediaProfiles:", v17);

  return v5;
}

- (NSString)localizedDescription
{
  void *v3;
  __CFString *v4;

  if (-[HFMediaPlaybackActionBuilder targetPlayState](self, "targetPlayState") == 1)
  {
    -[HFMediaPlaybackActionBuilder playbackArchive](self, "playbackArchive");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      v4 = CFSTR("HFMediaActionPlay");
    else
      v4 = CFSTR("HFMediaActionResume");
  }
  else if (-[HFMediaPlaybackActionBuilder targetPlayState](self, "targetPlayState") == 2)
  {
    v4 = CFSTR("HFMediaActionPause");
  }
  else
  {
    v4 = CFSTR("HFMediaSelectionCustomVolumeTitle");
  }
  _HFLocalizedStringWithDefaultValue(v4, v4, 1);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  NSStringFromHMMediaPlaybackState(-[HFMediaPlaybackActionBuilder targetPlayState](self, "targetPlayState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFMediaPlaybackActionBuilder mediaProfiles](self, "mediaProfiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
  {
    -[HFMediaPlaybackActionBuilder mediaProfiles](self, "mediaProfiles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hf_displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu accessories"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<set playback on %@ to %@>"), v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)containedAccessoryRepresentables
{
  void *v2;
  void *v3;
  void *v4;

  -[HFMediaPlaybackActionBuilder mediaProfiles](self, "mediaProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_133);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __64__HFMediaPlaybackActionBuilder_containedAccessoryRepresentables__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1F03F05E0))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)defaultActionIfMediaActionInvalid
{
  void *v3;
  void *v4;
  void *v5;

  if (-[HFMediaPlaybackActionBuilder targetPlayState](self, "targetPlayState") == 1)
  {
    -[HFMediaPlaybackActionBuilder playbackArchive](self, "playbackArchive");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[HFMediaPlaybackActionBuilder playbackArchive](self, "playbackArchive");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mediaPlayerPlaybackArchive");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        -[HFMediaPlaybackActionBuilder setPlaybackArchive:](self, "setPlaybackArchive:", 0);
    }
  }
}

- (BOOL)isMediaActionValid:(id *)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D51980], 2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFMediaPlaybackActionBuilder targetPlayState](self, "targetPlayState");
  switch(v6)
  {
    case 2:
      -[HFMediaPlaybackActionBuilder targetVolume](self, "targetVolume");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 == 0;
      goto LABEL_13;
    case 1:
      -[HFMediaPlaybackActionBuilder playbackArchive](self, "playbackArchive");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[HFMediaPlaybackActionBuilder playbackArchive](self, "playbackArchive");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "mediaPlayerPlaybackArchive");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v11 != 0;

      }
      else
      {
        v8 = 1;
      }

      -[HFMediaPlaybackActionBuilder playbackArchive](self, "playbackArchive");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 && !v8)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:operation:options:", 53, CFSTR("HFOperationMediaSelection"), 0);
        v8 = 0;
        v13 = objc_claimAutoreleasedReturnValue();
        v7 = v5;
        v5 = (void *)v13;
        goto LABEL_13;
      }
      break;
    case 0:
      -[HFMediaPlaybackActionBuilder targetVolume](self, "targetVolume");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 != 0;
LABEL_13:

      break;
    default:
      v8 = 0;
      break;
  }
  if (a3 && !v8)
    *a3 = objc_retainAutorelease(v5);
  -[HFMediaPlaybackActionBuilder mediaProfiles](self, "mediaProfiles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
    v15 = v8;
  else
    v15 = 0;

  return v15;
}

- (id)performValidation
{
  BOOL v3;
  id v4;
  void *v5;
  id v7;

  -[HFMediaPlaybackActionBuilder _ensureConsistency](self, "_ensureConsistency");
  v7 = 0;
  v3 = -[HFMediaPlaybackActionBuilder isMediaActionValid:](self, "isMediaActionValid:", &v7);
  v4 = v7;
  if (v3)
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)validationError
{
  BOOL v3;
  id v4;
  void *v5;
  id v6;
  id v8;

  -[HFMediaPlaybackActionBuilder _ensureConsistency](self, "_ensureConsistency");
  v8 = 0;
  v3 = -[HFMediaPlaybackActionBuilder isMediaActionValid:](self, "isMediaActionValid:", &v8);
  v4 = v8;
  v5 = v4;
  v6 = 0;
  if (!v3)
    v6 = v4;

  return v6;
}

- (void)_ensureConsistency
{
  void *v2;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;

  if (-[HFMediaPlaybackActionBuilder targetPlayState](self, "targetPlayState") == 1)
  {
    -[HFMediaPlaybackActionBuilder playbackArchive](self, "playbackArchive");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isRepeatEnabled");
    if (v5)
    {
      -[HFMediaPlaybackActionBuilder playbackArchive](self, "playbackArchive");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v2, "isRepeatSupported");
    }
    else
    {
      v6 = 0;
    }
    -[HFMediaPlaybackActionBuilder playbackArchive](self, "playbackArchive");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRepeatEnabled:", v6);

    if (v5)
    -[HFMediaPlaybackActionBuilder playbackArchive](self, "playbackArchive");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isShuffleEnabled");
    if (v9)
    {
      -[HFMediaPlaybackActionBuilder playbackArchive](self, "playbackArchive");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v2, "isShuffleSupported");
    }
    else
    {
      v10 = 0;
    }
    -[HFMediaPlaybackActionBuilder playbackArchive](self, "playbackArchive");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShuffleEnabled:", v10);

    if (v9)
  }
  else
  {
    -[HFMediaPlaybackActionBuilder setPlaybackArchive:](self, "setPlaybackArchive:", 0);
  }
  if (-[HFMediaPlaybackActionBuilder targetPlayState](self, "targetPlayState") == 2)
    -[HFMediaPlaybackActionBuilder setTargetVolume:](self, "setTargetVolume:", 0);
}

- (id)commitItem
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HFMediaPlaybackActionBuilder performValidation](self, "performValidation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__HFMediaPlaybackActionBuilder_commitItem__block_invoke;
  v7[3] = &unk_1EA726940;
  v7[4] = self;
  objc_msgSend(v3, "flatMap:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recover:", &__block_literal_global_252);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __42__HFMediaPlaybackActionBuilder_commitItem__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  _QWORD v25[5];
  id v26;

  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_251);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "action");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "setState:", objc_msgSend(*(id *)(a1 + 32), "targetPlayState"));
    objc_msgSend(*(id *)(a1 + 32), "targetVolume");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVolume:", v7);

    objc_msgSend(*(id *)(a1 + 32), "playbackArchive");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mediaPlayerPlaybackArchive");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlaybackArchive:", v9);

    objc_msgSend(v6, "setMediaProfiles:", v3);
    v10 = (void *)MEMORY[0x1E0D519C0];
    v11 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __42__HFMediaPlaybackActionBuilder_commitItem__block_invoke_3;
    v25[3] = &unk_1EA728590;
    v25[4] = *(_QWORD *)(a1 + 32);
    v26 = v6;
    v12 = v6;
    objc_msgSend(v10, "futureWithErrorOnlyHandlerAdapterBlock:", v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = __42__HFMediaPlaybackActionBuilder_commitItem__block_invoke_4;
    v24[3] = &unk_1EA726940;
    v24[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v13, "flatMap:", v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0CBA648]);
    v16 = objc_msgSend(*(id *)(a1 + 32), "targetPlayState");
    objc_msgSend(*(id *)(a1 + 32), "targetVolume");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "playbackArchive");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "mediaPlayerPlaybackArchive");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v15, "initWithMediaProfiles:playbackState:volume:playbackArchive:", v3, v16, v17, v19);
    objc_msgSend(*(id *)(a1 + 32), "setAction:", v20);

    v21 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(*(id *)(a1 + 32), "action");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "futureWithResult:", v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

uint64_t __42__HFMediaPlaybackActionBuilder_commitItem__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mediaProfile");
}

void __42__HFMediaPlaybackActionBuilder_commitItem__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "action");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithAction:completionHandler:", *(_QWORD *)(a1 + 40), v4);

}

id __42__HFMediaPlaybackActionBuilder_commitItem__block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 32), "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __42__HFMediaPlaybackActionBuilder_commitItem__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", a2);
}

- (NSSet)mediaProfiles
{
  return self->_mediaProfiles;
}

- (int64_t)targetPlayState
{
  return self->_targetPlayState;
}

- (void)setTargetPlayState:(int64_t)a3
{
  self->_targetPlayState = a3;
}

- (NSNumber)targetVolume
{
  return self->_targetVolume;
}

- (void)setTargetVolume:(id)a3
{
  objc_storeStrong((id *)&self->_targetVolume, a3);
}

- (HFPlaybackArchive)playbackArchive
{
  return self->_playbackArchive;
}

- (void)setPlaybackArchive:(id)a3
{
  objc_storeStrong((id *)&self->_playbackArchive, a3);
}

- (NSSet)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_playbackArchive, 0);
  objc_storeStrong((id *)&self->_targetVolume, 0);
  objc_storeStrong((id *)&self->_mediaProfiles, 0);
}

- (id)compareToObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  HFPropertyDifference *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HFPropertyDifference *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HFMediaPlaybackActionBuilder;
  -[HFActionBuilder compareToObject:](&v25, sel_compareToObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsCriticalDifference") & 1) == 0)
  {
    -[HFMediaPlaybackActionBuilder mediaProfiles](self, "mediaProfiles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaProfiles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToSet:", v7);

    if ((v8 & 1) == 0)
    {
      v9 = [HFPropertyDifference alloc];
      -[HFMediaPlaybackActionBuilder mediaProfiles](self, "mediaProfiles");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v4, "mediaProfiles");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "copy");
      v14 = -[HFPropertyDifference initWithObjectA:toObjectB:key:priority:](v9, "initWithObjectA:toObjectB:key:priority:", v11, v13, CFSTR("mediaProfiles"), 3);
      objc_msgSend(v5, "add:", v14);

    }
    -[HFMediaPlaybackActionBuilder playbackArchive](self, "playbackArchive");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playbackArchive");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFPropertyDifference compareObjectA:toObjectB:key:priority:](HFPropertyDifference, "compareObjectA:toObjectB:key:priority:", v15, v16, CFSTR("playbackArchive"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "add:", v17);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HFMediaPlaybackActionBuilder targetPlayState](self, "targetPlayState"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "targetPlayState"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFPropertyDifference compareObjectA:toObjectB:key:priority:](HFPropertyDifference, "compareObjectA:toObjectB:key:priority:", v18, v19, CFSTR("targetPlayState"), 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "add:", v20);

    -[HFMediaPlaybackActionBuilder targetVolume](self, "targetVolume");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetVolume");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFPropertyDifference compareObjectA:toObjectB:key:priority:](HFPropertyDifference, "compareObjectA:toObjectB:key:priority:", v21, v22, CFSTR("targetVolume"), 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "add:", v23);

  }
  return v5;
}

@end
