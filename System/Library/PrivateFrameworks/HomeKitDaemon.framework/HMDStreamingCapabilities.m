@implementation HMDStreamingCapabilities

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  HMDStreamingTierTypeAsString(-[HMDStreamingCapabilities streamingTierType](self, "streamingTierType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDStreamingCapabilities supportedAudioCodecs](self, "supportedAudioCodecs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDStreamingCapabilities supportedVideoCodecs](self, "supportedVideoCodecs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDStreamingCapabilities supportedVideoResolutions](self, "supportedVideoResolutions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDStreamingCapabilities supportsComfortNoise](self, "supportsComfortNoise");
  HMFBooleanToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Streaming Tier: %@, Supported Audio Codecs : %@, Supported Video Codecs : %@, Supported Video Resolutions : %@, Supports Comfort Noise : %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMDStreamingCapabilities)initWithStreamPreference:(id)a3
{
  id v4;
  HMDStreamingCapabilities *v5;
  uint64_t v6;
  NSSet *supportedVideoResolutions;
  void *v8;
  void *v9;
  uint64_t v10;
  NSSet *supportedH264Profiles;
  void *v12;
  void *v13;
  uint64_t v14;
  NSSet *supportedH264Levels;
  void *v16;
  void *v17;
  uint64_t v18;
  NSSet *supportedPacketizationModes;
  void *v20;
  void *v21;
  uint64_t v22;
  NSSet *supportedBitRateSettings;
  void *v24;
  void *v25;
  uint64_t v26;
  NSSet *supportedAudioSampleRates;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HMDStreamingCapabilities;
  v5 = -[HMDStreamingCapabilities init](&v29, sel_init);
  if (v5)
  {
    if (initWithStreamPreference__onceToken != -1)
      dispatch_once(&initWithStreamPreference__onceToken, &__block_literal_global_90328);
    objc_storeStrong((id *)&v5->_supportedVideoCodecs, (id)supportedHMDVideoCodecs);
    objc_storeStrong((id *)&v5->_supportedAudioCodecs, (id)supportedHMDAudioCodecs);
    -[HMDStreamingCapabilities _supportedResolutionsWithOverrides](v5, "_supportedResolutionsWithOverrides");
    v6 = objc_claimAutoreleasedReturnValue();
    supportedVideoResolutions = v5->_supportedVideoResolutions;
    v5->_supportedVideoResolutions = (NSSet *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    +[HMDH264Profile arrayWithProfiles:](HMDH264Profile, "arrayWithProfiles:", &unk_24E970E38);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    supportedH264Profiles = v5->_supportedH264Profiles;
    v5->_supportedH264Profiles = (NSSet *)v10;

    v12 = (void *)MEMORY[0x24BDBCF20];
    +[HMDH264Level arrayWithLevels:](HMDH264Level, "arrayWithLevels:", &unk_24E970E50);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    supportedH264Levels = v5->_supportedH264Levels;
    v5->_supportedH264Levels = (NSSet *)v14;

    v16 = (void *)MEMORY[0x24BDBCF20];
    +[HMDPacketizationMode arrayWithModes:](HMDPacketizationMode, "arrayWithModes:", &unk_24E970E68);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    supportedPacketizationModes = v5->_supportedPacketizationModes;
    v5->_supportedPacketizationModes = (NSSet *)v18;

    v20 = (void *)MEMORY[0x24BDBCF20];
    +[HMDBitRateSetting arrayWithSettings:](HMDBitRateSetting, "arrayWithSettings:", &unk_24E970E80);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    supportedBitRateSettings = v5->_supportedBitRateSettings;
    v5->_supportedBitRateSettings = (NSSet *)v22;

    v24 = (void *)MEMORY[0x24BDBCF20];
    +[HMDAudioSampleRate arrayWithRates:](HMDAudioSampleRate, "arrayWithRates:", &unk_24E970E98);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setWithArray:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    supportedAudioSampleRates = v5->_supportedAudioSampleRates;
    v5->_supportedAudioSampleRates = (NSSet *)v26;

    v5->_supportsComfortNoise = !isWatch();
    -[HMDStreamingCapabilities _updateWithStreamPreference:](v5, "_updateWithStreamPreference:", v4);
  }

  return v5;
}

- (id)_supportedResolutionsWithOverrides
{
  void *v2;
  _BOOL4 v3;
  HMDVideoResolution *v4;
  HMDVideoResolution *v5;
  HMDVideoResolution *v6;
  uint64_t v7;
  uint64_t v8;
  HMDVideoResolution *v9;
  HMDVideoResolution *v10;
  HMDVideoResolution *v11;
  HMDVideoResolution *v12;
  HMDVideoResolution *v13;
  HMDVideoResolution *v14;
  HMDVideoResolution *v15;
  HMDVideoResolution *v16;
  HMDVideoResolution *v17;
  HMDVideoResolution *v18;
  HMDVideoResolution *v19;
  HMDVideoResolution *v20;
  HMDVideoResolution *v21;
  HMDVideoResolution *v22;
  HMDVideoResolution *v23;
  HMDVideoResolution *v24;
  HMDVideoResolution *v25;
  void *v26;

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", supportedHMDVideoResolutions);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = isWatch();
  v4 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 23);
  objc_msgSend(v2, "addObject:", v4);

  v5 = [HMDVideoResolution alloc];
  if (v3)
  {
    v6 = -[HMDVideoResolution initWithResolution:](v5, "initWithResolution:", 11);
    v7 = 27;
    v8 = 7;
  }
  else
  {
    v9 = -[HMDVideoResolution initWithResolution:](v5, "initWithResolution:", 22);
    objc_msgSend(v2, "addObject:", v9);

    v10 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 21);
    objc_msgSend(v2, "addObject:", v10);

    v11 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 20);
    objc_msgSend(v2, "addObject:", v11);

    v12 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 19);
    objc_msgSend(v2, "addObject:", v12);

    v13 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 11);
    objc_msgSend(v2, "addObject:", v13);

    v14 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 12);
    objc_msgSend(v2, "addObject:", v14);

    v15 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 13);
    objc_msgSend(v2, "addObject:", v15);

    v16 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 14);
    objc_msgSend(v2, "addObject:", v16);

    v17 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 17);
    objc_msgSend(v2, "addObject:", v17);

    v18 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 18);
    objc_msgSend(v2, "addObject:", v18);

    v19 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 15);
    objc_msgSend(v2, "addObject:", v19);

    v20 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 16);
    objc_msgSend(v2, "addObject:", v20);

    v21 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 24);
    objc_msgSend(v2, "addObject:", v21);

    v22 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 25);
    objc_msgSend(v2, "addObject:", v22);

    v23 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 26);
    objc_msgSend(v2, "addObject:", v23);

    v6 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 27);
    v7 = 29;
    v8 = 28;
  }
  objc_msgSend(v2, "addObject:", v6);

  v24 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", v8);
  objc_msgSend(v2, "addObject:", v24);

  v25 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", v7);
  objc_msgSend(v2, "addObject:", v25);

  v26 = (void *)objc_msgSend(v2, "copy");
  return v26;
}

- (void)_updateWithStreamPreference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  HMDVideoResolution *v15;
  NSSet *v16;
  NSSet *supportedVideoResolutions;
  void *v18;
  HMDStreamingCapabilities *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  uint64_t v31;
  HMDAudioCodecGroup *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  uint64_t v40;
  NSDictionary *v41;
  NSDictionary *supportedAudioCodecs;
  void *v43;
  HMDStreamingCapabilities *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint8_t v61[128];
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "videoPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resolutions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v8 = v6;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v57 != v12)
            objc_enumerationMutation(v9);
          v14 = objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "videoResolution");
          if ((unint64_t)(v14 - 1) <= 0x1C)
          {
            v15 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", v14);
            objc_msgSend(v7, "addObject:", v15);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
      }
      while (v11);
    }

    v16 = (NSSet *)objc_msgSend(v7, "copy");
    supportedVideoResolutions = self->_supportedVideoResolutions;
    self->_supportedVideoResolutions = v16;

    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v63 = v21;
      v64 = 2112;
      v65 = v7;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Overriding the video resolution capabilities with %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);

    v6 = v8;
  }
  objc_msgSend(v4, "audioPreferences");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "codecs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v23, "count"))
  {
    v47 = v6;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v25 = v23;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    if (!v26)
      goto LABEL_27;
    v27 = v26;
    v28 = *(_QWORD *)v53;
    while (1)
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v53 != v28)
          objc_enumerationMutation(v25);
        v30 = objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "audioCodec");
        if (v30 == 1)
        {
          v31 = 2;
        }
        else
        {
          if (v30 != 2)
            continue;
          v31 = 3;
        }
        v32 = -[HMDAudioCodecGroup initWithAudioCodecGroup:]([HMDAudioCodecGroup alloc], "initWithAudioCodecGroup:", v31);
        objc_msgSend(v24, "addObject:", v32);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      if (!v27)
      {
LABEL_27:

        -[HMDStreamingCapabilities supportedAudioCodecs](self, "supportedAudioCodecs");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v33, "mutableCopy");

        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        -[HMDStreamingCapabilities supportedAudioCodecs](self, "supportedAudioCodecs");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v49;
          do
          {
            for (k = 0; k != v37; ++k)
            {
              if (*(_QWORD *)v49 != v38)
                objc_enumerationMutation(v35);
              v40 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * k);
              if ((objc_msgSend(v24, "containsObject:", v40) & 1) == 0)
                objc_msgSend(v34, "removeObjectForKey:", v40);
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
          }
          while (v37);
        }

        v41 = (NSDictionary *)objc_msgSend(v34, "copy");
        supportedAudioCodecs = self->_supportedAudioCodecs;
        self->_supportedAudioCodecs = v41;

        v43 = (void *)MEMORY[0x227676638]();
        v44 = self;
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        v6 = v47;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v63 = v46;
          v64 = 2112;
          v65 = v34;
          _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@Overriding the audio codec group capabilities with %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v43);

        break;
      }
    }
  }

}

- (void)updateWithRemoteSettings:(id)a3
{
  void *v4;
  NSDictionary *v5;
  NSDictionary *supportedAudioCodecs;
  void *v7;
  NSSet *v8;
  NSSet *supportedVideoCodecs;
  void *v10;
  NSSet *v11;
  NSSet *supportedVideoResolutions;
  void *v13;
  NSSet *v14;
  NSSet *supportedH264Profiles;
  void *v16;
  NSSet *v17;
  NSSet *supportedH264Levels;
  void *v19;
  NSSet *v20;
  NSSet *supportedPacketizationModes;
  void *v22;
  NSSet *v23;
  NSSet *supportedBitRateSettings;
  void *v25;
  NSSet *v26;
  NSSet *supportedAudioSampleRates;
  id v28;

  v28 = a3;
  objc_msgSend(v28, "supportedAudioCodecs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v28, "supportedAudioCodecs");
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    supportedAudioCodecs = self->_supportedAudioCodecs;
    self->_supportedAudioCodecs = v5;

  }
  objc_msgSend(v28, "supportedVideoCodecs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v28, "supportedVideoCodecs");
    v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
    supportedVideoCodecs = self->_supportedVideoCodecs;
    self->_supportedVideoCodecs = v8;

  }
  objc_msgSend(v28, "supportedVideoResolutions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v28, "supportedVideoResolutions");
    v11 = (NSSet *)objc_claimAutoreleasedReturnValue();
    supportedVideoResolutions = self->_supportedVideoResolutions;
    self->_supportedVideoResolutions = v11;

  }
  objc_msgSend(v28, "supportedH264Profiles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v28, "supportedH264Profiles");
    v14 = (NSSet *)objc_claimAutoreleasedReturnValue();
    supportedH264Profiles = self->_supportedH264Profiles;
    self->_supportedH264Profiles = v14;

  }
  objc_msgSend(v28, "supportedH264Levels");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v28, "supportedH264Levels");
    v17 = (NSSet *)objc_claimAutoreleasedReturnValue();
    supportedH264Levels = self->_supportedH264Levels;
    self->_supportedH264Levels = v17;

  }
  objc_msgSend(v28, "supportedPacketizationModes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v28, "supportedPacketizationModes");
    v20 = (NSSet *)objc_claimAutoreleasedReturnValue();
    supportedPacketizationModes = self->_supportedPacketizationModes;
    self->_supportedPacketizationModes = v20;

  }
  objc_msgSend(v28, "supportedBitRateSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v28, "supportedBitRateSettings");
    v23 = (NSSet *)objc_claimAutoreleasedReturnValue();
    supportedBitRateSettings = self->_supportedBitRateSettings;
    self->_supportedBitRateSettings = v23;

  }
  objc_msgSend(v28, "supportedAudioSampleRates");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v28, "supportedAudioSampleRates");
    v26 = (NSSet *)objc_claimAutoreleasedReturnValue();
    supportedAudioSampleRates = self->_supportedAudioSampleRates;
    self->_supportedAudioSampleRates = v26;

  }
  -[HMDStreamingCapabilities setStreamingTierType:](self, "setStreamingTierType:", objc_msgSend(v28, "streamingTierType"));
  -[HMDStreamingCapabilities setSupportsComfortNoise:](self, "setSupportsComfortNoise:", objc_msgSend(v28, "supportsComfortNoise"));

}

- (HMDStreamingCapabilities)initWithCoder:(id)a3
{
  id v4;
  HMDStreamingCapabilities *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSSet *supportedVideoCodecs;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDictionary *supportedAudioCodecs;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSSet *supportedVideoResolutions;
  objc_super v22;
  _QWORD v23[2];
  _QWORD v24[4];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMDStreamingCapabilities;
  v5 = -[HMDStreamingCapabilities init](&v22, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("a"));
    v9 = objc_claimAutoreleasedReturnValue();
    supportedVideoCodecs = v5->_supportedVideoCodecs;
    v5->_supportedVideoCodecs = (NSSet *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    v24[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("b"));
    v14 = objc_claimAutoreleasedReturnValue();
    supportedAudioCodecs = v5->_supportedAudioCodecs;
    v5->_supportedAudioCodecs = (NSDictionary *)v14;

    v16 = (void *)MEMORY[0x24BDBCF20];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("c"));
    v19 = objc_claimAutoreleasedReturnValue();
    supportedVideoResolutions = v5->_supportedVideoResolutions;
    v5->_supportedVideoResolutions = (NSSet *)v19;

    v5->_streamingTierType = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("d"));
    v5->_supportsComfortNoise = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("e"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HMDStreamingCapabilities supportedVideoCodecs](self, "supportedVideoCodecs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("a"));

  -[HMDStreamingCapabilities supportedAudioCodecs](self, "supportedAudioCodecs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("b"));

  -[HMDStreamingCapabilities supportedVideoResolutions](self, "supportedVideoResolutions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("c"));

  objc_msgSend(v7, "encodeInt32:forKey:", -[HMDStreamingCapabilities streamingTierType](self, "streamingTierType"), CFSTR("d"));
  objc_msgSend(v7, "encodeBool:forKey:", -[HMDStreamingCapabilities supportsComfortNoise](self, "supportsComfortNoise"), CFSTR("e"));

}

- (NSDictionary)supportedAudioCodecs
{
  return self->_supportedAudioCodecs;
}

- (NSSet)supportedVideoCodecs
{
  return self->_supportedVideoCodecs;
}

- (NSSet)supportedVideoResolutions
{
  return self->_supportedVideoResolutions;
}

- (NSSet)supportedH264Profiles
{
  return self->_supportedH264Profiles;
}

- (NSSet)supportedH264Levels
{
  return self->_supportedH264Levels;
}

- (NSSet)supportedPacketizationModes
{
  return self->_supportedPacketizationModes;
}

- (NSSet)supportedBitRateSettings
{
  return self->_supportedBitRateSettings;
}

- (NSSet)supportedAudioSampleRates
{
  return self->_supportedAudioSampleRates;
}

- (unint64_t)streamingTierType
{
  return self->_streamingTierType;
}

- (void)setStreamingTierType:(unint64_t)a3
{
  self->_streamingTierType = a3;
}

- (BOOL)supportsComfortNoise
{
  return self->_supportsComfortNoise;
}

- (void)setSupportsComfortNoise:(BOOL)a3
{
  self->_supportsComfortNoise = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedAudioSampleRates, 0);
  objc_storeStrong((id *)&self->_supportedBitRateSettings, 0);
  objc_storeStrong((id *)&self->_supportedPacketizationModes, 0);
  objc_storeStrong((id *)&self->_supportedH264Levels, 0);
  objc_storeStrong((id *)&self->_supportedH264Profiles, 0);
  objc_storeStrong((id *)&self->_supportedVideoResolutions, 0);
  objc_storeStrong((id *)&self->_supportedVideoCodecs, 0);
  objc_storeStrong((id *)&self->_supportedAudioCodecs, 0);
}

void __53__HMDStreamingCapabilities_initWithStreamPreference___block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDFD9D8], "capabilities");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v3;
    v11 = 2112;
    v12 = v0;
    _os_log_impl(&dword_2218F0000, v2, OS_LOG_TYPE_INFO, "%{public}@Audio streaming capabilities as reported by AVCAudioStream: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v1);
  objc_msgSend(MEMORY[0x24BDFDA40], "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Video streaming capabilities as reported by AVCVideoStream: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v8 = (void *)objc_msgSend(v0, "mutableCopy");
  objc_msgSend(v8, "addEntriesFromDictionary:", v4);
  +[HMDStreamingCapabilities translateCapabilities:](HMDStreamingCapabilities, "translateCapabilities:", v8);

}

+ (void)translateCapabilities:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_QWORD *, uint64_t, uint64_t);
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  HMDVideoCodec *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  HMDVideoResolution *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  HMDVideoResolution *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD aBlock[4];
  id v58;
  _BYTE v59[128];
  HMDVideoResolution *v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDFDA68]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__HMDStreamingCapabilities_translateCapabilities___block_invoke;
  aBlock[3] = &unk_24E7821B8;
  v6 = v4;
  v58 = v6;
  v7 = _Block_copy(aBlock);
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v54;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v54 != v11)
          objc_enumerationMutation(v8);
        switch(objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v12), "unsignedIntegerValue"))
        {
          case 0:
            v13 = (void (*)(_QWORD *, uint64_t, uint64_t))v7[2];
            v14 = v7;
            v15 = 5;
            goto LABEL_12;
          case 1:
            v13 = (void (*)(_QWORD *, uint64_t, uint64_t))v7[2];
            v14 = v7;
            v15 = 6;
            goto LABEL_17;
          case 2:
            v13 = (void (*)(_QWORD *, uint64_t, uint64_t))v7[2];
            v14 = v7;
            v15 = 0;
            goto LABEL_12;
          case 3:
            v13 = (void (*)(_QWORD *, uint64_t, uint64_t))v7[2];
            v14 = v7;
            v15 = 1;
LABEL_12:
            v16 = 0;
            goto LABEL_18;
          case 4:
            v13 = (void (*)(_QWORD *, uint64_t, uint64_t))v7[2];
            v14 = v7;
            v15 = 2;
            goto LABEL_17;
          case 5:
            v13 = (void (*)(_QWORD *, uint64_t, uint64_t))v7[2];
            v14 = v7;
            v15 = 2;
            goto LABEL_14;
          case 9:
            v13 = (void (*)(_QWORD *, uint64_t, uint64_t))v7[2];
            v14 = v7;
            v15 = 3;
LABEL_14:
            v16 = 2;
            goto LABEL_18;
          case 10:
            v13 = (void (*)(_QWORD *, uint64_t, uint64_t))v7[2];
            v14 = v7;
            v15 = 3;
LABEL_17:
            v16 = 1;
LABEL_18:
            v13(v14, v15, v16);
            break;
          default:
            break;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    }
    while (v10);
  }

  v43 = v6;
  v17 = objc_msgSend(v6, "copy");
  v18 = (void *)supportedHMDAudioCodecs;
  supportedHMDAudioCodecs = v17;

  v44 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDFDA70]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v19, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v21 = v19;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v50;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v50 != v24)
          objc_enumerationMutation(v21);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v25), "unsignedIntegerValue"))
        {
          v26 = -[HMDVideoCodec initWithCodec:]([HMDVideoCodec alloc], "initWithCodec:", 0);
          objc_msgSend(v20, "addObject:", v26);

        }
        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    }
    while (v23);
  }

  v27 = objc_msgSend(v20, "copy");
  v28 = (void *)supportedHMDVideoCodecs;
  supportedHMDVideoCodecs = v27;

  if (isWatch())
  {
    v29 = (void *)MEMORY[0x24BDBCF20];
    v30 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 1);
    v60 = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v60, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setWithArray:", v31);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v44;
  }
  else
  {
    v42 = v8;
    objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x24BDFDA78]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v34, "count"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v30 = v34;
    v35 = -[HMDVideoResolution countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v46;
      do
      {
        v38 = 0;
        do
        {
          if (*(_QWORD *)v46 != v37)
            objc_enumerationMutation(v30);
          v39 = objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v38), "unsignedIntegerValue");
          if (v39 <= 9)
          {
            v40 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", v39 + 1);
            objc_msgSend(v31, "addObject:", v40);

          }
          ++v38;
        }
        while (v36 != v38);
        v36 = -[HMDVideoResolution countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
      }
      while (v36);
    }

    v32 = objc_msgSend(v31, "copy");
    v33 = v44;
    v8 = v42;
  }
  v41 = (void *)supportedHMDVideoResolutions;
  supportedHMDVideoResolutions = v32;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)aspectRatioOfResolution:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "resolutionType") - 1;
  if (v5 >= 0x1D)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      v16 = 2112;
      v17 = CFSTR("HMDVideoResolutionAspectRatio16x9");
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Resolution: %@ is not handled, returning default aspect ratio: %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v6 = 1;
  }
  else
  {
    v6 = qword_2226A0A18[v5];
  }

  return v6;
}

void __50__HMDStreamingCapabilities_translateCapabilities___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  HMDAudioSampleRate *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAudioCodecGroup *v10;

  v10 = -[HMDAudioCodecGroup initWithAudioCodecGroup:]([HMDAudioCodecGroup alloc], "initWithAudioCodecGroup:", a2);
  v5 = -[HMDAudioSampleRate initWithSampleRate:]([HMDAudioSampleRate alloc], "initWithSampleRate:", a3);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v8, "addObject:", v5);
    v9 = (void *)objc_msgSend(v8, "copy");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v5);
    v9 = (void *)objc_msgSend(v8, "copy");
  }

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v10);
}

@end
