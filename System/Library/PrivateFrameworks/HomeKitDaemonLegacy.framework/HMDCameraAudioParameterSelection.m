@implementation HMDCameraAudioParameterSelection

- (HMDCameraAudioParameterSelection)initWithSessionID:(id)a3 supportedAudioConfiguration:(id)a4 supportedRTPConfiguration:(id)a5 streamingCapabilities:(id)a6
{
  id v11;
  id v12;
  id v13;
  HMDCameraAudioParameterSelection *v14;
  HMDCameraAudioParameterSelection *v15;
  uint64_t v16;
  NSArray *audioCodecsPreference;
  uint64_t v18;
  NSArray *bitrateSettingsPreference;
  uint64_t v20;
  NSArray *sampleRatesPreference;
  objc_super v23;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)HMDCameraAudioParameterSelection;
  v14 = -[HMDCameraParameterSelection initWithSessionID:](&v23, sel_initWithSessionID_, a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_supportedAudioStreamConfiguration, a4);
    objc_storeStrong((id *)&v15->_rtpConfiguration, a5);
    objc_storeStrong((id *)&v15->_streamingCapabilities, a6);
    +[HMDAudioCodecGroup arrayWithCodecs:](HMDAudioCodecGroup, "arrayWithCodecs:", &unk_1E8B31C20);
    v16 = objc_claimAutoreleasedReturnValue();
    audioCodecsPreference = v15->_audioCodecsPreference;
    v15->_audioCodecsPreference = (NSArray *)v16;

    +[HMDBitRateSetting arrayWithSettings:](HMDBitRateSetting, "arrayWithSettings:", &unk_1E8B31C38);
    v18 = objc_claimAutoreleasedReturnValue();
    bitrateSettingsPreference = v15->_bitrateSettingsPreference;
    v15->_bitrateSettingsPreference = (NSArray *)v18;

    +[HMDAudioSampleRate arrayWithRates:](HMDAudioSampleRate, "arrayWithRates:", &unk_1E8B31C50);
    v20 = objc_claimAutoreleasedReturnValue();
    sampleRatesPreference = v15->_sampleRatesPreference;
    v15->_sampleRatesPreference = (NSArray *)v20;

    -[HMDCameraAudioParameterSelection _generateAllCombinations:](v15, "_generateAllCombinations:", v13);
  }

  return v15;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraParameterSelection sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)selectAudioParameters
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
  id v13;
  __int128 v14;
  HMDCameraAudioParameterSelection *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  HMDCameraAudioParameterSelection *v38;
  NSObject *v39;
  void *v40;
  BOOL v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  __int128 v47;
  id obj;
  uint64_t v49;
  HMDCameraAudioParameterSelection *v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  -[HMDCameraAudioParameterSelection audioCodecsPreference](self, "audioCodecsPreference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraAudioParameterSelection streamingCapabilities](self, "streamingCapabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "supportedAudioCodecs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = self;
  -[HMDCameraAudioParameterSelection supportedAudioStreamConfiguration](self, "supportedAudioStreamConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codecConfigurations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (supportedAudioCodecs)
  {
    +[HMDAudioCodecGroup arrayWithCodecs:](HMDAudioCodecGroup, "arrayWithCodecs:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v3, "selectedParametersFromPreferredParameters:deviceSupportedParameters:cameraSupportedParameters:overriddenParameters:parameterDescription:", v4, v7, v10, v11, CFSTR("Audio-Codec"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v13 = v12;
  v51 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  if (v51)
  {
    obj = v13;
    v49 = *(_QWORD *)v53;
    *(_QWORD *)&v14 = 138543874;
    v47 = v14;
    v15 = self;
LABEL_6:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v53 != v49)
        objc_enumerationMutation(obj);
      v17 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v16);
      -[HMDCameraAudioParameterSelection supportedAudioStreamConfiguration](v15, "supportedAudioStreamConfiguration", v47);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "codecConfigurations");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "audioCodecParameters");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)objc_opt_class();
      -[HMDCameraAudioParameterSelection bitrateSettingsPreference](v15, "bitrateSettingsPreference");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraAudioParameterSelection bitrateSettingsPreference](v15, "bitrateSettingsPreference");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bitRateSettings");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "selectedParametersFromPreferredParameters:deviceSupportedParameters:cameraSupportedParameters:overriddenParameters:parameterDescription:", v23, v24, v25, 0, CFSTR("Bit-Rate"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDCameraAudioParameterSelection streamingCapabilities](v15, "streamingCapabilities");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "supportedAudioCodecs");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", v17);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = (void *)objc_opt_class();
      -[HMDCameraAudioParameterSelection sampleRatesPreference](v15, "sampleRatesPreference");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "allObjects");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "audioSampleRates");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "selectedParametersFromPreferredParameters:deviceSupportedParameters:cameraSupportedParameters:overriddenParameters:parameterDescription:", v31, v32, v33, 0, CFSTR("Sample-Rate"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v26, "count") && objc_msgSend(v34, "count"))
      {
        objc_msgSend(v21, "audioChannelCount");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v50;
        v36 = -[HMDCameraAudioParameterSelection _selectParametersFromCodec:bitRateSettings:sampleRates:audioChannelCount:](v50, "_selectParametersFromCodec:bitRateSettings:sampleRates:audioChannelCount:", v17, v26, v34, v35);

        if (v36)
        {

          -[HMDCameraAudioParameterSelection setComfortNoiseSupported:](v50, "setComfortNoiseSupported:", MEMORY[0x1E0C9AAA0]);
          -[HMDCameraAudioParameterSelection streamingCapabilities](v50, "streamingCapabilities");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "supportsComfortNoise");

          if ((v43 & 1) != 0)
          {
            -[HMDCameraAudioParameterSelection supportedAudioStreamConfiguration](v50, "supportedAudioStreamConfiguration");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "supportsComfortNoise");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDCameraAudioParameterSelection setComfortNoiseSupported:](v50, "setComfortNoiseSupported:", v45);

            v41 = 1;
            v13 = obj;
            goto LABEL_23;
          }
          v41 = 1;
          v13 = obj;
          goto LABEL_25;
        }
      }
      else
      {
        v37 = (void *)MEMORY[0x1D17BA0A0]();
        v15 = v50;
        v38 = v50;
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v47;
          v57 = v40;
          v58 = 2112;
          v59 = v26;
          v60 = 2112;
          v61 = v34;
          _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@One of the intersected candidates is empty: candidateBitrateSettings: %@, candidateSampleRates: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v37);
      }

      if (v51 == ++v16)
      {
        v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
        if (v51)
          goto LABEL_6;
        v41 = 0;
        v13 = obj;
        goto LABEL_22;
      }
    }
  }
  v41 = 0;
LABEL_22:
  v44 = v13;
LABEL_23:

LABEL_25:
  return v41;
}

- (BOOL)_selectParametersFromCodec:(id)a3 bitRateSettings:(id)a4 sampleRates:(id)a5 audioChannelCount:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  HMDCameraAudioParameterCombination *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  HMDCameraAudioParameterSelection *v27;
  NSObject *v28;
  void *v29;
  BOOL v30;
  void *v31;
  HMDCameraAudioParameterCombination *v32;
  void *v33;
  HMDCameraAudioParameterSelection *v34;
  NSObject *v35;
  void *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id obj;
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
  HMDCameraAudioParameterCombination *v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v14 = v11;
  v39 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v39)
  {
    v15 = *(_QWORD *)v51;
    v44 = v10;
    v42 = v13;
    v43 = v12;
    v41 = v14;
    v38 = *(_QWORD *)v51;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v51 != v15)
          objc_enumerationMutation(v14);
        v40 = v16;
        v17 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v16);
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        obj = v12;
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v47;
          while (2)
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v47 != v20)
                objc_enumerationMutation(obj);
              v22 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
              v23 = -[HMDCameraAudioParameterCombination initWithCodecGroup:bitrateSetting:sampleRate:]([HMDCameraAudioParameterCombination alloc], "initWithCodecGroup:bitrateSetting:sampleRate:", v10, v17, v22);
              -[HMDCameraAudioParameterSelection validAudioParameterCombinations](self, "validAudioParameterCombinations");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "indexOfObject:", v23);

              if (v25 != 0x7FFFFFFFFFFFFFFFLL)
              {
                -[HMDCameraAudioParameterSelection validAudioParameterCombinations](self, "validAudioParameterCombinations");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "objectAtIndex:", v25);
                v32 = (HMDCameraAudioParameterCombination *)objc_claimAutoreleasedReturnValue();

                v33 = (void *)MEMORY[0x1D17BA0A0]();
                v34 = self;
                HMFGetOSLogHandle();
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v55 = v36;
                  v56 = 2112;
                  v57 = v32;
                  _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@Using audio parameter combination: %@", buf, 0x16u);

                  v10 = v44;
                }

                objc_autoreleasePoolPop(v33);
                -[HMDCameraAudioParameterSelection setSelectedCodecGroupType:](v34, "setSelectedCodecGroupType:", v10);
                -[HMDCameraAudioParameterSelection setSelectedBitRateSetting:](v34, "setSelectedBitRateSetting:", v17);
                -[HMDCameraAudioParameterSelection setSelectedSampleRate:](v34, "setSelectedSampleRate:", v22);
                v13 = v42;
                -[HMDCameraAudioParameterSelection setSelectedAudioChannelCount:](v34, "setSelectedAudioChannelCount:", v42);
                -[HMDCameraAudioParameterSelection setSelectedAudioParameterCombination:](v34, "setSelectedAudioParameterCombination:", v32);

                v30 = 1;
                v12 = v43;
                v14 = v41;
                goto LABEL_23;
              }
              v26 = (void *)MEMORY[0x1D17BA0A0]();
              v27 = self;
              HMFGetOSLogHandle();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v55 = v29;
                v56 = 2112;
                v57 = v23;
                _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Could not find audio parameter combination: %@", buf, 0x16u);

                v10 = v44;
              }

              objc_autoreleasePoolPop(v26);
            }
            v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
            if (v19)
              continue;
            break;
          }
        }

        v16 = v40 + 1;
        v13 = v42;
        v12 = v43;
        v14 = v41;
        v15 = v38;
      }
      while (v40 + 1 != v39);
      v30 = 0;
      v39 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v39);
  }
  else
  {
    v30 = 0;
  }
LABEL_23:

  return v30;
}

- (id)createSRTPParamters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[HMDCameraAudioParameterSelection rtpConfiguration](self, "rtpConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "srtpCryptoSuites");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedSRTPParametersFromCryptoSuites:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createSelectedAudioParameters
{
  id v3;
  void *v4;
  HMDAudioCodecParameters *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDSelectedRTPParameters *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDSelectedRTPParameters *v24;
  HMDSelectedAudioParameters *v25;
  void *v26;
  void *v27;
  HMDSelectedAudioParameters *v28;
  void *v30;
  void *v31;
  HMDAudioCodecParameters *v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v3 = (id)rtpPtime;
  if (!v3)
  {
    -[HMDCameraAudioParameterSelection selectedAudioParameterCombination](self, "selectedAudioParameterCombination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rtpPTime");
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  v31 = v3;
  v5 = [HMDAudioCodecParameters alloc];
  -[HMDCameraAudioParameterSelection selectedAudioChannelCount](self, "selectedAudioChannelCount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraAudioParameterSelection selectedBitRateSetting](self, "selectedBitRateSetting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraAudioParameterSelection selectedSampleRate](self, "selectedSampleRate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[HMDAudioCodecParameters initWithChannelCount:bitRateSetting:audioSampleRate:rtpPtime:](v5, "initWithChannelCount:bitRateSetting:audioSampleRate:rtpPtime:", v6, v8, v10, v3);

  v11 = [HMDSelectedRTPParameters alloc];
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDCameraAudioParameterSelection selectedCodecGroupType](self, "selectedCodecGroupType");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v30, "codec");
  v14 = 110;
  if (v13 == 1)
    v14 = 8;
  if (v13)
    v15 = v14;
  else
    v15 = 0;
  objc_msgSend(v12, "numberWithUnsignedInteger:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraAudioParameterSelection selectedAudioParameterCombination](self, "selectedAudioParameterCombination");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "maximumBitrate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraAudioParameterSelection selectedAudioParameterCombination](self, "selectedAudioParameterCombination");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "minimumBitrate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraAudioParameterSelection selectedAudioParameterCombination](self, "selectedAudioParameterCombination");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rtcpInterval");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[HMDSelectedRTPParameters initWithPayloadType:maximumBitrate:minimumBitrate:rtcpInterval:comfortNoisePayloadType:](v11, "initWithPayloadType:maximumBitrate:minimumBitrate:rtcpInterval:comfortNoisePayloadType:", v16, v18, v20, v22, v23);

  v25 = [HMDSelectedAudioParameters alloc];
  -[HMDCameraAudioParameterSelection selectedCodecGroupType](self, "selectedCodecGroupType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraAudioParameterSelection comfortNoiseSupported](self, "comfortNoiseSupported");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[HMDSelectedAudioParameters initWithCodecGroup:codecParameter:rtpParameter:comfortNoiseEnabled:](v25, "initWithCodecGroup:codecParameter:rtpParameter:comfortNoiseEnabled:", v26, v32, v24, v27);

  return v28;
}

- (void)_generateAllCombinations:(id)a3
{
  char v4;
  HMDCameraAudioParameterCombination *v5;
  HMDAudioCodecGroup *v6;
  HMDBitRateSetting *v7;
  HMDAudioSampleRate *v8;
  void *v9;
  HMDCameraAudioParameterCombination *v10;
  HMDCameraAudioParameterCombination *v11;
  HMDAudioCodecGroup *v12;
  HMDBitRateSetting *v13;
  HMDAudioSampleRate *v14;
  void *v15;
  HMDCameraAudioParameterCombination *v16;
  HMDCameraAudioParameterCombination *v17;
  HMDAudioCodecGroup *v18;
  HMDBitRateSetting *v19;
  HMDAudioSampleRate *v20;
  void *v21;
  HMDCameraAudioParameterCombination *v22;
  HMDCameraAudioParameterCombination *v23;
  HMDAudioCodecGroup *v24;
  HMDBitRateSetting *v25;
  HMDAudioSampleRate *v26;
  void *v27;
  HMDCameraAudioParameterCombination *v28;
  uint64_t v29;
  NSArray *validAudioParameterCombinations;
  HMDCameraAudioParameterSelection *v31;
  uint64_t v32;
  id v33;

  if ((objc_msgSend(a3, "streamingTierType") | 4) == 4)
  {
    v4 = 0;
    v32 = 60;
  }
  else
  {
    v32 = 0;
    v4 = 1;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [HMDCameraAudioParameterCombination alloc];
  v6 = -[HMDAudioCodecGroup initWithAudioCodecGroup:]([HMDAudioCodecGroup alloc], "initWithAudioCodecGroup:", 2);
  v7 = -[HMDBitRateSetting initWithBitRateSetting:]([HMDBitRateSetting alloc], "initWithBitRateSetting:", 0);
  v8 = -[HMDAudioSampleRate initWithSampleRate:]([HMDAudioSampleRate alloc], "initWithSampleRate:", 1);
  v31 = self;
  if ((v4 & 1) != 0)
  {
    v9 = &unk_1E8B32760;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = -[HMDCameraAudioParameterCombination initWithCodecGroup:bitrateSetting:sampleRate:maximumBitrate:minimumBitrate:rtcpInterval:rtpPtime:](v5, "initWithCodecGroup:bitrateSetting:sampleRate:maximumBitrate:minimumBitrate:rtcpInterval:rtpPtime:", v6, v7, v8, &unk_1E8B32730, &unk_1E8B32730, &unk_1E8B32748, v9);
  objc_msgSend(v33, "addObject:", v10);

  if ((v4 & 1) == 0)
  v11 = [HMDCameraAudioParameterCombination alloc];
  v12 = -[HMDAudioCodecGroup initWithAudioCodecGroup:]([HMDAudioCodecGroup alloc], "initWithAudioCodecGroup:", 2);
  v13 = -[HMDBitRateSetting initWithBitRateSetting:]([HMDBitRateSetting alloc], "initWithBitRateSetting:", 0);
  v14 = -[HMDAudioSampleRate initWithSampleRate:]([HMDAudioSampleRate alloc], "initWithSampleRate:", 2);
  if ((v4 & 1) != 0)
  {
    v15 = &unk_1E8B32790;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = -[HMDCameraAudioParameterCombination initWithCodecGroup:bitrateSetting:sampleRate:maximumBitrate:minimumBitrate:rtcpInterval:rtpPtime:](v11, "initWithCodecGroup:bitrateSetting:sampleRate:maximumBitrate:minimumBitrate:rtcpInterval:rtpPtime:", v12, v13, v14, &unk_1E8B32778, &unk_1E8B32778, &unk_1E8B32748, v15);
  objc_msgSend(v33, "addObject:", v16);

  if ((v4 & 1) == 0)
  v17 = [HMDCameraAudioParameterCombination alloc];
  v18 = -[HMDAudioCodecGroup initWithAudioCodecGroup:]([HMDAudioCodecGroup alloc], "initWithAudioCodecGroup:", 3);
  v19 = -[HMDBitRateSetting initWithBitRateSetting:]([HMDBitRateSetting alloc], "initWithBitRateSetting:", 0);
  v20 = -[HMDAudioSampleRate initWithSampleRate:]([HMDAudioSampleRate alloc], "initWithSampleRate:", 1);
  if ((v4 & 1) != 0)
  {
    v21 = &unk_1E8B32790;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = -[HMDCameraAudioParameterCombination initWithCodecGroup:bitrateSetting:sampleRate:maximumBitrate:minimumBitrate:rtcpInterval:rtpPtime:](v17, "initWithCodecGroup:bitrateSetting:sampleRate:maximumBitrate:minimumBitrate:rtcpInterval:rtpPtime:", v18, v19, v20, &unk_1E8B32730, &unk_1E8B32730, &unk_1E8B32748, v21);
  objc_msgSend(v33, "addObject:", v22);

  if ((v4 & 1) == 0)
  v23 = [HMDCameraAudioParameterCombination alloc];
  v24 = -[HMDAudioCodecGroup initWithAudioCodecGroup:]([HMDAudioCodecGroup alloc], "initWithAudioCodecGroup:", 3);
  v25 = -[HMDBitRateSetting initWithBitRateSetting:]([HMDBitRateSetting alloc], "initWithBitRateSetting:", 0);
  v26 = -[HMDAudioSampleRate initWithSampleRate:]([HMDAudioSampleRate alloc], "initWithSampleRate:", 2);
  if ((v4 & 1) != 0)
  {
    v27 = &unk_1E8B32790;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = -[HMDCameraAudioParameterCombination initWithCodecGroup:bitrateSetting:sampleRate:maximumBitrate:minimumBitrate:rtcpInterval:rtpPtime:](v23, "initWithCodecGroup:bitrateSetting:sampleRate:maximumBitrate:minimumBitrate:rtcpInterval:rtpPtime:", v24, v25, v26, &unk_1E8B32778, &unk_1E8B32778, &unk_1E8B32748, v27);
  objc_msgSend(v33, "addObject:", v28);

  if ((v4 & 1) == 0)
  v29 = objc_msgSend(v33, "copy");
  validAudioParameterCombinations = v31->_validAudioParameterCombinations;
  v31->_validAudioParameterCombinations = (NSArray *)v29;

}

- (HMDSupportedAudioStreamConfiguration)supportedAudioStreamConfiguration
{
  return self->_supportedAudioStreamConfiguration;
}

- (HMDSupportedRTPConfiguration)rtpConfiguration
{
  return self->_rtpConfiguration;
}

- (HMDSelectedAudioParameters)selectedAudioParameters
{
  return self->_selectedAudioParameters;
}

- (void)setSelectedAudioParameters:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAudioParameters, a3);
}

- (HMDStreamingCapabilities)streamingCapabilities
{
  return self->_streamingCapabilities;
}

- (NSArray)audioCodecsPreference
{
  return self->_audioCodecsPreference;
}

- (NSArray)bitrateSettingsPreference
{
  return self->_bitrateSettingsPreference;
}

- (NSArray)sampleRatesPreference
{
  return self->_sampleRatesPreference;
}

- (NSArray)validAudioParameterCombinations
{
  return self->_validAudioParameterCombinations;
}

- (HMDAudioCodecGroup)selectedCodecGroupType
{
  return self->_selectedCodecGroupType;
}

- (void)setSelectedCodecGroupType:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCodecGroupType, a3);
}

- (HMDBitRateSetting)selectedBitRateSetting
{
  return self->_selectedBitRateSetting;
}

- (void)setSelectedBitRateSetting:(id)a3
{
  objc_storeStrong((id *)&self->_selectedBitRateSetting, a3);
}

- (HMDAudioSampleRate)selectedSampleRate
{
  return self->_selectedSampleRate;
}

- (void)setSelectedSampleRate:(id)a3
{
  objc_storeStrong((id *)&self->_selectedSampleRate, a3);
}

- (NSNumber)selectedAudioChannelCount
{
  return self->_selectedAudioChannelCount;
}

- (void)setSelectedAudioChannelCount:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAudioChannelCount, a3);
}

- (HMDCameraAudioParameterCombination)selectedAudioParameterCombination
{
  return self->_selectedAudioParameterCombination;
}

- (void)setSelectedAudioParameterCombination:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAudioParameterCombination, a3);
}

- (NSNumber)comfortNoiseSupported
{
  return self->_comfortNoiseSupported;
}

- (void)setComfortNoiseSupported:(id)a3
{
  objc_storeStrong((id *)&self->_comfortNoiseSupported, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comfortNoiseSupported, 0);
  objc_storeStrong((id *)&self->_selectedAudioParameterCombination, 0);
  objc_storeStrong((id *)&self->_selectedAudioChannelCount, 0);
  objc_storeStrong((id *)&self->_selectedSampleRate, 0);
  objc_storeStrong((id *)&self->_selectedBitRateSetting, 0);
  objc_storeStrong((id *)&self->_selectedCodecGroupType, 0);
  objc_storeStrong((id *)&self->_validAudioParameterCombinations, 0);
  objc_storeStrong((id *)&self->_sampleRatesPreference, 0);
  objc_storeStrong((id *)&self->_bitrateSettingsPreference, 0);
  objc_storeStrong((id *)&self->_audioCodecsPreference, 0);
  objc_storeStrong((id *)&self->_streamingCapabilities, 0);
  objc_storeStrong((id *)&self->_selectedAudioParameters, 0);
  objc_storeStrong((id *)&self->_rtpConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedAudioStreamConfiguration, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_8572 != -1)
    dispatch_once(&logCategory__hmf_once_t0_8572, &__block_literal_global_8573);
  return (id)logCategory__hmf_once_v1_8574;
}

void __47__HMDCameraAudioParameterSelection_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_8574;
  logCategory__hmf_once_v1_8574 = v0;

}

@end
