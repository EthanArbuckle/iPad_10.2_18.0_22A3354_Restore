@implementation HMDCameraVideoParameterSelection

- (HMDCameraVideoParameterSelection)initWithSessionID:(id)a3 videoTierParameters:(id)a4 supportedVideoConfiguration:(id)a5 supportedRTPConfiguration:(id)a6 streamingCapabilities:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMDCameraVideoParameterSelection *v17;
  HMDCameraVideoParameterSelection *v18;
  uint64_t v19;
  NSArray *videoCodecsPreference;
  uint64_t v21;
  NSArray *h264ProfilesPreference;
  uint64_t v23;
  NSArray *h264LevelsPreference;
  uint64_t v25;
  NSArray *h264PacketizationPreference;
  objc_super v28;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)HMDCameraVideoParameterSelection;
  v17 = -[HMDCameraParameterSelection initWithSessionID:](&v28, sel_initWithSessionID_, a3);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_supportedVideoStreamConfiguration, a5);
    objc_storeStrong((id *)&v18->_rtpConfiguration, a6);
    objc_storeStrong((id *)&v18->_streamingCapabilities, a7);
    +[HMDVideoCodec arrayWithCodecTypes:](HMDVideoCodec, "arrayWithCodecTypes:", &unk_1E8B32058);
    v19 = objc_claimAutoreleasedReturnValue();
    videoCodecsPreference = v18->_videoCodecsPreference;
    v18->_videoCodecsPreference = (NSArray *)v19;

    +[HMDH264Profile arrayWithProfiles:](HMDH264Profile, "arrayWithProfiles:", &unk_1E8B32070);
    v21 = objc_claimAutoreleasedReturnValue();
    h264ProfilesPreference = v18->_h264ProfilesPreference;
    v18->_h264ProfilesPreference = (NSArray *)v21;

    +[HMDH264Level arrayWithLevels:](HMDH264Level, "arrayWithLevels:", &unk_1E8B32088);
    v23 = objc_claimAutoreleasedReturnValue();
    h264LevelsPreference = v18->_h264LevelsPreference;
    v18->_h264LevelsPreference = (NSArray *)v23;

    +[HMDPacketizationMode arrayWithModes:](HMDPacketizationMode, "arrayWithModes:", &unk_1E8B320A0);
    v25 = objc_claimAutoreleasedReturnValue();
    h264PacketizationPreference = v18->_h264PacketizationPreference;
    v18->_h264PacketizationPreference = (NSArray *)v25;

    objc_storeStrong((id *)&v18->_videoTierParameters, a4);
    -[HMDCameraVideoParameterSelection _generateAllCombinations](v18, "_generateAllCombinations");
    -[HMDCameraVideoParameterSelection _setVideoResolutionPreference](v18, "_setVideoResolutionPreference");
  }

  return v18;
}

- (void)_setVideoResolutionPreference
{
  void *v3;
  void *v4;
  HMDVideoResolution *v5;
  HMDVideoResolution *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  NSArray *videoResolutionsPreference;
  void *v22;
  HMDCameraVideoParameterSelection *v23;
  NSObject *v24;
  void *v25;
  NSArray *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  NSArray *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    v5 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 29);
    objc_msgSend(v3, "addObject:", v5);
    v6 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 28);
    objc_msgSend(v4, "addObject:", v6);

  }
  +[HMDVideoResolution arrayWithResolutions:](HMDVideoResolution, "arrayWithResolutions:", &unk_1E8B320B8);
  v7 = objc_claimAutoreleasedReturnValue();
  +[HMDVideoResolution arrayWithResolutions:](HMDVideoResolution, "arrayWithResolutions:", &unk_1E8B320D0);
  v8 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v7;
  objc_msgSend(v3, "addObjectsFromArray:", v7);
  v27 = (void *)v8;
  objc_msgSend(v4, "addObjectsFromArray:", v8);
  +[HMDVideoResolution arrayWithResolutions:](HMDVideoResolution, "arrayWithResolutions:", &unk_1E8B320E8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDVideoResolution arrayWithResolutions:](HMDVideoResolution, "arrayWithResolutions:", &unk_1E8B32100);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDVideoResolution arrayWithResolutions:](HMDVideoResolution, "arrayWithResolutions:", &unk_1E8B32118);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraVideoParameterSelection streamingCapabilities](self, "streamingCapabilities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "streamingTierType");

  v15 = v14 == 0;
  if (v14)
    v16 = v3;
  else
    v16 = v9;
  if (v14)
    v17 = v9;
  else
    v17 = v10;
  v29 = v3;
  if (v14)
    v18 = v4;
  else
    v18 = v3;
  if (v15)
    v19 = v4;
  else
    v19 = v10;
  objc_msgSend(v12, "addObjectsFromArray:", v16);
  objc_msgSend(v12, "addObjectsFromArray:", v17);
  objc_msgSend(v12, "addObjectsFromArray:", v18);
  objc_msgSend(v12, "addObjectsFromArray:", v19);
  objc_msgSend(v12, "addObjectsFromArray:", v11);
  v20 = (NSArray *)objc_msgSend(v12, "copy");
  videoResolutionsPreference = self->_videoResolutionsPreference;
  self->_videoResolutionsPreference = v20;

  v22 = (void *)MEMORY[0x1D17BA0A0]();
  v23 = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = self->_videoResolutionsPreference;
    *(_DWORD *)buf = 138543618;
    v31 = v25;
    v32 = 2112;
    v33 = v26;
    _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Setting the video resolution preference order to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v22);

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

- (BOOL)selectVideoParameters
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
  unint64_t v13;
  HMDCameraVideoParameterSelection *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t j;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t k;
  void *v66;
  void *v67;
  int v68;
  _BOOL4 v69;
  int v70;
  void *v71;
  void *v72;
  HMDCameraVideoParameterSelection *v73;
  NSObject *v74;
  void *v75;
  char v77;
  id obj;
  uint64_t v79;
  uint64_t v80;
  HMDCameraVideoParameterSelection *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint8_t buf[4];
  void *v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  void *v114;
  __int16 v115;
  void *v116;
  __int16 v117;
  id v118;
  __int16 v119;
  void *v120;
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  -[HMDCameraVideoParameterSelection videoCodecsPreference](self, "videoCodecsPreference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraVideoParameterSelection streamingCapabilities](self, "streamingCapabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "supportedVideoCodecs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = self;
  -[HMDCameraVideoParameterSelection supportedVideoStreamConfiguration](self, "supportedVideoStreamConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codecConfigurations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (supportedVideoCodecs)
  {
    +[HMDVideoCodec arrayWithCodecTypes:](HMDVideoCodec, "arrayWithCodecTypes:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v3, "selectedParametersFromPreferredParameters:deviceSupportedParameters:cameraSupportedParameters:overriddenParameters:parameterDescription:", v4, v7, v10, v11, CFSTR("Video-Codecs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  obj = v12;
  v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v124, 16);
  if (v80)
  {
    v77 = 0;
    v79 = *(_QWORD *)v106;
    v13 = 0x1E0C99000uLL;
    v14 = self;
LABEL_6:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v106 != v79)
        objc_enumerationMutation(obj);
      v83 = v15;
      v16 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * v15);
      -[HMDCameraVideoParameterSelection supportedVideoStreamConfiguration](v14, "supportedVideoStreamConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "codecConfigurations");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "codecParameters");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDCameraVideoParameterSelection supportedVideoStreamConfiguration](v14, "supportedVideoStreamConfiguration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "codecConfigurations");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v16;
      objc_msgSend(v22, "objectForKeyedSubscript:", v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "videoAttributes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)objc_opt_class();
      -[HMDCameraVideoParameterSelection h264ProfilesPreference](v14, "h264ProfilesPreference");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraVideoParameterSelection streamingCapabilities](v14, "streamingCapabilities");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "supportedH264Profiles");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "allObjects");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "h264Profiles");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "selectedParametersFromPreferredParameters:deviceSupportedParameters:cameraSupportedParameters:overriddenParameters:parameterDescription:", v26, v29, v30, 0, CFSTR("H264-Profile"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = (void *)objc_opt_class();
      -[HMDCameraVideoParameterSelection h264LevelsPreference](v14, "h264LevelsPreference");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraVideoParameterSelection streamingCapabilities](v14, "streamingCapabilities");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "supportedH264Levels");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "allObjects");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "levels");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "selectedParametersFromPreferredParameters:deviceSupportedParameters:cameraSupportedParameters:overriddenParameters:parameterDescription:", v32, v35, v36, 0, CFSTR("H264-Level"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = (void *)objc_opt_class();
      -[HMDCameraVideoParameterSelection h264PacketizationPreference](v14, "h264PacketizationPreference");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraVideoParameterSelection streamingCapabilities](v14, "streamingCapabilities");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "supportedPacketizationModes");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "allObjects");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = v20;
      objc_msgSend(v20, "packetizationModes");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "selectedParametersFromPreferredParameters:deviceSupportedParameters:cameraSupportedParameters:overriddenParameters:parameterDescription:", v38, v41, v42, 0, CFSTR("H264-Packetization"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(v13 + 3560), "array");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = 0u;
      v102 = 0u;
      v103 = 0u;
      v104 = 0u;
      v92 = v24;
      v44 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v101, v123, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v102;
        do
        {
          for (i = 0; i != v45; ++i)
          {
            if (*(_QWORD *)v102 != v46)
              objc_enumerationMutation(v92);
            v48 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
            objc_msgSend(v48, "videoResolution");
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            if (v49)
            {
              objc_msgSend(v48, "videoResolution");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "addObject:", v50);

            }
          }
          v45 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v101, v123, 16);
        }
        while (v45);
      }

      v51 = (void *)objc_opt_class();
      -[HMDCameraVideoParameterSelection videoResolutionsPreference](v14, "videoResolutionsPreference");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraVideoParameterSelection streamingCapabilities](v14, "streamingCapabilities");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "supportedVideoResolutions");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "allObjects");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (supportedResolutions)
      {
        +[HMDVideoResolution arrayWithResolutions:](HMDVideoResolution, "arrayWithResolutions:");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v56 = 0;
      }
      v84 = v43;
      objc_msgSend(v51, "selectedParametersFromPreferredParameters:deviceSupportedParameters:cameraSupportedParameters:overriddenParameters:parameterDescription:", v52, v55, v43, v56, CFSTR("Resolution"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(v13 + 3560), "array");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = 0u;
      v98 = 0u;
      v99 = 0u;
      v100 = 0u;
      v89 = v57;
      v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v97, v122, 16);
      if (v91)
      {
        v90 = *(_QWORD *)v98;
        do
        {
          for (j = 0; j != v91; ++j)
          {
            if (*(_QWORD *)v98 != v90)
              objc_enumerationMutation(v89);
            v60 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * j);
            v93 = 0u;
            v94 = 0u;
            v95 = 0u;
            v96 = 0u;
            v61 = v92;
            v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v93, v121, 16);
            if (v62)
            {
              v63 = v62;
              v64 = *(_QWORD *)v94;
              do
              {
                for (k = 0; k != v63; ++k)
                {
                  if (*(_QWORD *)v94 != v64)
                    objc_enumerationMutation(v61);
                  v66 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * k);
                  objc_msgSend(v66, "videoResolution");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  v68 = objc_msgSend(v60, "isEqual:", v67);

                  if (v68)
                    objc_msgSend(v58, "addObject:", v66);
                }
                v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v93, v121, 16);
              }
              while (v63);
            }

          }
          v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v97, v122, 16);
        }
        while (v91);
      }

      if (objc_msgSend(v86, "count")
        && objc_msgSend(v85, "count")
        && objc_msgSend(v88, "count")
        && objc_msgSend(v58, "count"))
      {
        v14 = v81;
        v69 = -[HMDCameraVideoParameterSelection _selectParametersFromCodec:profiles:levels:packetizationModes:videoAttributes:](v81, "_selectParametersFromCodec:profiles:levels:packetizationModes:videoAttributes:", v82, v86, v85, v88, v58);
        v77 |= v69;
        v70 = v69 ? 2 : 0;
        v13 = 0x1E0C99000;
        v71 = v87;
      }
      else
      {
        v72 = (void *)MEMORY[0x1D17BA0A0]();
        v14 = v81;
        v73 = v81;
        HMFGetOSLogHandle();
        v74 = objc_claimAutoreleasedReturnValue();
        v13 = 0x1E0C99000;
        v71 = v87;
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v110 = v75;
          v111 = 2112;
          v112 = v86;
          v113 = 2112;
          v114 = v85;
          v115 = 2112;
          v116 = v88;
          v117 = 2112;
          v118 = v89;
          v119 = 2112;
          v120 = v58;
          _os_log_impl(&dword_1CD062000, v74, OS_LOG_TYPE_INFO, "%{public}@One of the intersected candidates is empty: candidateProfiles: %@, candidateLevels: %@, candidatePacketModes: %@, candidateVideoResolutions: %@, candidateAttributes: %@", buf, 0x3Eu);

        }
        objc_autoreleasePoolPop(v72);
        v70 = 3;
      }

      if (v70 != 3)
      {
        if (v70)
          break;
      }
      v15 = v83 + 1;
      if (v83 + 1 == v80)
      {
        v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v124, 16);
        if (v80)
          goto LABEL_6;
        break;
      }
    }
  }
  else
  {
    v77 = 0;
  }

  return v77 & 1;
}

- (BOOL)_selectParametersFromCodec:(id)a3 profiles:(id)a4 levels:(id)a5 packetizationModes:(id)a6 videoAttributes:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  HMDCameraVideoParameterCombination *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDCameraVideoParameterCombination *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  HMDCameraVideoParameterSelection *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v42;
  void *v43;
  void *v44;
  HMDCameraVideoParameterSelection *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  id obj;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  void *v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v17 = v13;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v81;
    v65 = v14;
    v66 = v12;
    v63 = v17;
    v64 = v15;
    v62 = v16;
    v57 = *(_QWORD *)v81;
    do
    {
      v20 = 0;
      v56 = v18;
      do
      {
        if (*(_QWORD *)v81 != v19)
          objc_enumerationMutation(v17);
        v59 = v20;
        v70 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * v20);
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v21 = v14;
        v60 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
        if (v60)
        {
          v22 = *(_QWORD *)v77;
          v67 = v21;
          v58 = *(_QWORD *)v77;
          do
          {
            v23 = 0;
            do
            {
              if (*(_QWORD *)v77 != v22)
                objc_enumerationMutation(v21);
              v61 = v23;
              v71 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v23);
              v72 = 0u;
              v73 = 0u;
              v74 = 0u;
              v75 = 0u;
              obj = v16;
              v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
              if (v24)
              {
                v25 = v24;
                v69 = *(_QWORD *)v73;
                while (2)
                {
                  for (i = 0; i != v25; ++i)
                  {
                    if (*(_QWORD *)v73 != v69)
                      objc_enumerationMutation(obj);
                    v27 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
                    v28 = [HMDCameraVideoParameterCombination alloc];
                    -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "videoTierCombinations");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "videoResolution");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "objectForKeyedSubscript:", v31);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    v33 = -[HMDCameraVideoParameterCombination initWithProfile:level:videoTier:](v28, "initWithProfile:level:videoTier:", v70, v71, v32);

                    -[HMDCameraVideoParameterSelection validVideoParameterCombinations](self, "validVideoParameterCombinations");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v35 = objc_msgSend(v34, "indexOfObject:", v33);

                    if (v35 != 0x7FFFFFFFFFFFFFFFLL)
                    {
                      -[HMDCameraVideoParameterSelection validVideoParameterCombinations](self, "validVideoParameterCombinations");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v42, "objectAtIndex:", v35);
                      v43 = (void *)objc_claimAutoreleasedReturnValue();

                      v44 = (void *)MEMORY[0x1D17BA0A0]();
                      v45 = self;
                      HMFGetOSLogHandle();
                      v46 = objc_claimAutoreleasedReturnValue();
                      v15 = v64;
                      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
                      {
                        HMFGetLogIdentifier();
                        v47 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543618;
                        v85 = v47;
                        v86 = 2112;
                        v87 = v43;
                        _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_INFO, "%{public}@Selected video parameter combination: %@", buf, 0x16u);

                      }
                      objc_autoreleasePoolPop(v44);
                      v12 = v66;
                      -[HMDCameraVideoParameterSelection setSelectedCodecType:](v45, "setSelectedCodecType:", v66);
                      -[HMDCameraVideoParameterSelection setSelectedProfile:](v45, "setSelectedProfile:", v70);
                      -[HMDCameraVideoParameterSelection setSelectedLevel:](v45, "setSelectedLevel:", v71);
                      -[HMDCameraVideoParameterCombination videoTier](v33, "videoTier");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      -[HMDCameraVideoParameterSelection setSelectedVideoTier:](v45, "setSelectedVideoTier:", v48);

                      objc_msgSend(v43, "videoTier");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v49, "framerate");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      -[HMDCameraVideoParameterSelection setSelectedFramerate:](v45, "setSelectedFramerate:", v50);

                      objc_msgSend(v64, "objectAtIndex:", 0);
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      -[HMDCameraVideoParameterSelection setSelectedPacketizationMode:](v45, "setSelectedPacketizationMode:", v51);

                      -[HMDCameraVideoParameterSelection videoTierParameters](v45, "videoTierParameters");
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v52, "updateTierOrder:", obj);

                      -[HMDCameraVideoParameterSelection videoTierParameters](v45, "videoTierParameters");
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      -[HMDCameraVideoParameterSelection selectedVideoTier](v45, "selectedVideoTier");
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v53, "updateFirstPickedTier:", v54);

                      v41 = 1;
                      v14 = v65;
                      v16 = v62;
                      v17 = v63;
                      goto LABEL_30;
                    }
                    v36 = (void *)MEMORY[0x1D17BA0A0]();
                    v37 = self;
                    HMFGetOSLogHandle();
                    v38 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                    {
                      HMFGetLogIdentifier();
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v27, "videoResolution");
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v85 = v39;
                      v86 = 2112;
                      v87 = v40;
                      _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_INFO, "%{public}@Combination does not exist for video resolution: %@", buf, 0x16u);

                    }
                    objc_autoreleasePoolPop(v36);

                  }
                  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
                  if (v25)
                    continue;
                  break;
                }
              }

              v23 = v61 + 1;
              v14 = v65;
              v12 = v66;
              v17 = v63;
              v15 = v64;
              v16 = v62;
              v21 = v67;
              v22 = v58;
            }
            while (v61 + 1 != v60);
            v60 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
          }
          while (v60);
        }

        v20 = v59 + 1;
        v19 = v57;
      }
      while (v59 + 1 != v56);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
      v19 = v57;
      v41 = 0;
    }
    while (v18);
  }
  else
  {
    v41 = 0;
  }
LABEL_30:

  return v41;
}

- (id)createSRTPParamters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[HMDCameraVideoParameterSelection rtpConfiguration](self, "rtpConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "srtpCryptoSuites");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedSRTPParametersFromCryptoSuites:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createSelectedVideoParameters
{
  HMDVideoCodecParameters *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDVideoAttributes *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDSelectedRTPParameters *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDSelectedRTPParameters *v25;
  HMDSelectedVideoParameters *v26;
  void *v27;
  HMDSelectedVideoParameters *v28;
  HMDVideoAttributes *v30;
  HMDVideoCodecParameters *v31;
  void *v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v3 = [HMDVideoCodecParameters alloc];
  -[HMDCameraVideoParameterSelection selectedProfile](self, "selectedProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraVideoParameterSelection selectedLevel](self, "selectedLevel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraVideoParameterSelection selectedPacketizationMode](self, "selectedPacketizationMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[HMDVideoCodecParameters initWithProfiles:levels:packetizationModes:](v3, "initWithProfiles:levels:packetizationModes:", v5, v7, v9);

  v10 = [HMDVideoAttributes alloc];
  -[HMDCameraVideoParameterSelection selectedVideoTier](self, "selectedVideoTier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "videoResolution");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraVideoParameterSelection selectedVideoTier](self, "selectedVideoTier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "framerate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[HMDVideoAttributes initWithResolution:framerate:](v10, "initWithResolution:framerate:", v12, v14);

  v15 = [HMDSelectedRTPParameters alloc];
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDCameraVideoParameterSelection selectedCodecType](self, "selectedCodecType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "codecType");
  objc_msgSend(v16, "numberWithUnsignedInteger:", 99);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraVideoParameterSelection selectedVideoTier](self, "selectedVideoTier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "maxBitRate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraVideoParameterSelection selectedVideoTier](self, "selectedVideoTier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "minBitRate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraVideoParameterSelection selectedVideoTier](self, "selectedVideoTier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "rtcpInterval");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[HMDSelectedRTPParameters initWithPayloadType:maximumBitrate:minimumBitrate:rtcpInterval:comfortNoisePayloadType:](v15, "initWithPayloadType:maximumBitrate:minimumBitrate:rtcpInterval:comfortNoisePayloadType:", v18, v20, v22, v24, 0);

  v26 = [HMDSelectedVideoParameters alloc];
  -[HMDCameraVideoParameterSelection selectedCodecType](self, "selectedCodecType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[HMDSelectedVideoParameters initWithCodec:codecParameter:attribute:rtpParameter:](v26, "initWithCodec:codecParameter:attribute:rtpParameter:", v27, v31, v30, v25);

  return v28;
}

- (id)createReselectedVideoParameters:(id)a3
{
  id v3;
  HMDVideoAttributes *v4;
  void *v5;
  void *v6;
  HMDVideoAttributes *v7;
  HMDReselectedRTPParameters *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDReselectedRTPParameters *v12;
  HMDReselectedVideoParameters *v13;

  v3 = a3;
  v4 = [HMDVideoAttributes alloc];
  objc_msgSend(v3, "videoResolution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "framerate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDVideoAttributes initWithResolution:framerate:](v4, "initWithResolution:framerate:", v5, v6);

  v8 = [HMDReselectedRTPParameters alloc];
  objc_msgSend(v3, "maxBitRate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minBitRate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rtcpInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HMDReselectedRTPParameters initWithMaximumBitrate:minimumBitrate:rtcpInterval:](v8, "initWithMaximumBitrate:minimumBitrate:rtcpInterval:", v9, v10, v11);
  v13 = -[HMDReselectedVideoParameters initWithAttribute:rtpParameter:]([HMDReselectedVideoParameters alloc], "initWithAttribute:rtpParameter:", v7, v12);

  return v13;
}

- (void)_generateAllCombinations
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  HMDCameraVideoParameterCombination *v10;
  HMDH264Profile *v11;
  HMDH264Level *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDCameraVideoParameterCombination *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDCameraVideoParameterCombination *v20;
  HMDH264Profile *v21;
  HMDH264Level *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDCameraVideoParameterCombination *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDCameraVideoParameterCombination *v30;
  HMDH264Profile *v31;
  HMDH264Level *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDCameraVideoParameterCombination *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  HMDCameraVideoParameterCombination *v42;
  HMDH264Profile *v43;
  HMDH264Level *v44;
  void *v45;
  void *v46;
  void *v47;
  HMDCameraVideoParameterCombination *v48;
  void *v49;
  void *v50;
  void *v51;
  HMDCameraVideoParameterCombination *v52;
  HMDH264Profile *v53;
  HMDH264Level *v54;
  void *v55;
  void *v56;
  void *v57;
  HMDCameraVideoParameterCombination *v58;
  void *v59;
  void *v60;
  void *v61;
  HMDCameraVideoParameterCombination *v62;
  HMDH264Profile *v63;
  HMDH264Level *v64;
  void *v65;
  void *v66;
  void *v67;
  HMDCameraVideoParameterCombination *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  HMDCameraVideoParameterCombination *v74;
  HMDH264Profile *v75;
  HMDH264Level *v76;
  void *v77;
  void *v78;
  void *v79;
  HMDCameraVideoParameterCombination *v80;
  void *v81;
  void *v82;
  void *v83;
  HMDCameraVideoParameterCombination *v84;
  HMDH264Profile *v85;
  HMDH264Level *v86;
  void *v87;
  void *v88;
  void *v89;
  HMDCameraVideoParameterCombination *v90;
  void *v91;
  void *v92;
  void *v93;
  HMDCameraVideoParameterCombination *v94;
  HMDH264Profile *v95;
  HMDH264Level *v96;
  void *v97;
  void *v98;
  void *v99;
  HMDCameraVideoParameterCombination *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  HMDCameraVideoParameterCombination *v106;
  HMDH264Profile *v107;
  HMDH264Level *v108;
  void *v109;
  void *v110;
  void *v111;
  HMDCameraVideoParameterCombination *v112;
  void *v113;
  void *v114;
  void *v115;
  HMDCameraVideoParameterCombination *v116;
  HMDH264Profile *v117;
  HMDH264Level *v118;
  void *v119;
  void *v120;
  void *v121;
  HMDCameraVideoParameterCombination *v122;
  void *v123;
  void *v124;
  void *v125;
  HMDCameraVideoParameterCombination *v126;
  HMDH264Profile *v127;
  HMDH264Level *v128;
  void *v129;
  void *v130;
  void *v131;
  HMDCameraVideoParameterCombination *v132;
  NSArray *v133;
  NSArray *validVideoParameterCombinations;
  id obj;
  id obja;
  id objb;
  id objc;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE v166[128];
  uint64_t v167;

  v167 = *MEMORY[0x1E0C80C00];
  +[HMDVideoResolution arrayWithResolutions:](HMDVideoResolution, "arrayWithResolutions:", &unk_1E8B32130);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = 0u;
  v160 = 0u;
  v161 = 0u;
  v162 = 0u;
  obj = v3;
  v143 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v159, v166, 16);
  if (v143)
  {
    v139 = *(_QWORD *)v160;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v160 != v139)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v159 + 1) + 8 * v5);
        -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "videoTierCombinations");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = [HMDCameraVideoParameterCombination alloc];
          v11 = -[HMDH264Profile initWithH264Profile:]([HMDH264Profile alloc], "initWithH264Profile:", 0);
          v12 = -[HMDH264Level initWithH264Level:]([HMDH264Level alloc], "initWithH264Level:", 0);
          -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "videoTierCombinations");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v6);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[HMDCameraVideoParameterCombination initWithProfile:level:videoTier:](v10, "initWithProfile:level:videoTier:", v11, v12, v15);
          objc_msgSend(v4, "addObject:", v16);

        }
        -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "videoTierCombinations");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v6);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v20 = [HMDCameraVideoParameterCombination alloc];
          v21 = -[HMDH264Profile initWithH264Profile:]([HMDH264Profile alloc], "initWithH264Profile:", 1);
          v22 = -[HMDH264Level initWithH264Level:]([HMDH264Level alloc], "initWithH264Level:", 0);
          -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "videoTierCombinations");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v6);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[HMDCameraVideoParameterCombination initWithProfile:level:videoTier:](v20, "initWithProfile:level:videoTier:", v21, v22, v25);
          objc_msgSend(v4, "addObject:", v26);

        }
        -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "videoTierCombinations");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", v6);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          v30 = [HMDCameraVideoParameterCombination alloc];
          v31 = -[HMDH264Profile initWithH264Profile:]([HMDH264Profile alloc], "initWithH264Profile:", 2);
          v32 = -[HMDH264Level initWithH264Level:]([HMDH264Level alloc], "initWithH264Level:", 0);
          -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "videoTierCombinations");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKeyedSubscript:", v6);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = -[HMDCameraVideoParameterCombination initWithProfile:level:videoTier:](v30, "initWithProfile:level:videoTier:", v31, v32, v35);
          objc_msgSend(v4, "addObject:", v36);

        }
        ++v5;
      }
      while (v143 != v5);
      v143 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v159, v166, 16);
    }
    while (v143);
  }

  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  obja = obj;
  v144 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v155, v165, 16);
  if (v144)
  {
    v140 = *(_QWORD *)v156;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v156 != v140)
          objc_enumerationMutation(obja);
        v38 = *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * v37);
        -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "videoTierCombinations");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectForKeyedSubscript:", v38);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          v42 = [HMDCameraVideoParameterCombination alloc];
          v43 = -[HMDH264Profile initWithH264Profile:]([HMDH264Profile alloc], "initWithH264Profile:", 0);
          v44 = -[HMDH264Level initWithH264Level:]([HMDH264Level alloc], "initWithH264Level:", 1);
          -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "videoTierCombinations");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "objectForKeyedSubscript:", v38);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = -[HMDCameraVideoParameterCombination initWithProfile:level:videoTier:](v42, "initWithProfile:level:videoTier:", v43, v44, v47);
          objc_msgSend(v4, "addObject:", v48);

        }
        -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "videoTierCombinations");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectForKeyedSubscript:", v38);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
          v52 = [HMDCameraVideoParameterCombination alloc];
          v53 = -[HMDH264Profile initWithH264Profile:]([HMDH264Profile alloc], "initWithH264Profile:", 1);
          v54 = -[HMDH264Level initWithH264Level:]([HMDH264Level alloc], "initWithH264Level:", 1);
          -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "videoTierCombinations");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "objectForKeyedSubscript:", v38);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = -[HMDCameraVideoParameterCombination initWithProfile:level:videoTier:](v52, "initWithProfile:level:videoTier:", v53, v54, v57);
          objc_msgSend(v4, "addObject:", v58);

        }
        -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "videoTierCombinations");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "objectForKeyedSubscript:", v38);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        if (v61)
        {
          v62 = [HMDCameraVideoParameterCombination alloc];
          v63 = -[HMDH264Profile initWithH264Profile:]([HMDH264Profile alloc], "initWithH264Profile:", 2);
          v64 = -[HMDH264Level initWithH264Level:]([HMDH264Level alloc], "initWithH264Level:", 1);
          -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "videoTierCombinations");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "objectForKeyedSubscript:", v38);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = -[HMDCameraVideoParameterCombination initWithProfile:level:videoTier:](v62, "initWithProfile:level:videoTier:", v63, v64, v67);
          objc_msgSend(v4, "addObject:", v68);

        }
        ++v37;
      }
      while (v144 != v37);
      v144 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v155, v165, 16);
    }
    while (v144);
  }

  v153 = 0u;
  v154 = 0u;
  v151 = 0u;
  v152 = 0u;
  objb = obja;
  v145 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v151, v164, 16);
  if (v145)
  {
    v141 = *(_QWORD *)v152;
    do
    {
      v69 = 0;
      do
      {
        if (*(_QWORD *)v152 != v141)
          objc_enumerationMutation(objb);
        v70 = *(_QWORD *)(*((_QWORD *)&v151 + 1) + 8 * v69);
        -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "videoTierCombinations");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "objectForKeyedSubscript:", v70);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        if (v73)
        {
          v74 = [HMDCameraVideoParameterCombination alloc];
          v75 = -[HMDH264Profile initWithH264Profile:]([HMDH264Profile alloc], "initWithH264Profile:", 0);
          v76 = -[HMDH264Level initWithH264Level:]([HMDH264Level alloc], "initWithH264Level:", 2);
          -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "videoTierCombinations");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "objectForKeyedSubscript:", v70);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = -[HMDCameraVideoParameterCombination initWithProfile:level:videoTier:](v74, "initWithProfile:level:videoTier:", v75, v76, v79);
          objc_msgSend(v4, "addObject:", v80);

        }
        -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "videoTierCombinations");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "objectForKeyedSubscript:", v70);
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        if (v83)
        {
          v84 = [HMDCameraVideoParameterCombination alloc];
          v85 = -[HMDH264Profile initWithH264Profile:]([HMDH264Profile alloc], "initWithH264Profile:", 1);
          v86 = -[HMDH264Level initWithH264Level:]([HMDH264Level alloc], "initWithH264Level:", 2);
          -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "videoTierCombinations");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "objectForKeyedSubscript:", v70);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = -[HMDCameraVideoParameterCombination initWithProfile:level:videoTier:](v84, "initWithProfile:level:videoTier:", v85, v86, v89);
          objc_msgSend(v4, "addObject:", v90);

        }
        -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "videoTierCombinations");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "objectForKeyedSubscript:", v70);
        v93 = (void *)objc_claimAutoreleasedReturnValue();

        if (v93)
        {
          v94 = [HMDCameraVideoParameterCombination alloc];
          v95 = -[HMDH264Profile initWithH264Profile:]([HMDH264Profile alloc], "initWithH264Profile:", 2);
          v96 = -[HMDH264Level initWithH264Level:]([HMDH264Level alloc], "initWithH264Level:", 2);
          -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "videoTierCombinations");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "objectForKeyedSubscript:", v70);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = -[HMDCameraVideoParameterCombination initWithProfile:level:videoTier:](v94, "initWithProfile:level:videoTier:", v95, v96, v99);
          objc_msgSend(v4, "addObject:", v100);

        }
        ++v69;
      }
      while (v145 != v69);
      v145 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v151, v164, 16);
    }
    while (v145);
  }

  v149 = 0u;
  v150 = 0u;
  v147 = 0u;
  v148 = 0u;
  objc = objb;
  v146 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v147, v163, 16);
  if (v146)
  {
    v142 = *(_QWORD *)v148;
    do
    {
      v101 = 0;
      do
      {
        if (*(_QWORD *)v148 != v142)
          objc_enumerationMutation(objc);
        v102 = *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * v101);
        -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "videoTierCombinations");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "objectForKeyedSubscript:", v102);
        v105 = (void *)objc_claimAutoreleasedReturnValue();

        if (v105)
        {
          v106 = [HMDCameraVideoParameterCombination alloc];
          v107 = -[HMDH264Profile initWithH264Profile:]([HMDH264Profile alloc], "initWithH264Profile:", 0);
          v108 = -[HMDH264Level initWithH264Level:]([HMDH264Level alloc], "initWithH264Level:", 3);
          -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "videoTierCombinations");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "objectForKeyedSubscript:", v102);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = -[HMDCameraVideoParameterCombination initWithProfile:level:videoTier:](v106, "initWithProfile:level:videoTier:", v107, v108, v111);
          objc_msgSend(v4, "addObject:", v112);

        }
        -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "videoTierCombinations");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "objectForKeyedSubscript:", v102);
        v115 = (void *)objc_claimAutoreleasedReturnValue();

        if (v115)
        {
          v116 = [HMDCameraVideoParameterCombination alloc];
          v117 = -[HMDH264Profile initWithH264Profile:]([HMDH264Profile alloc], "initWithH264Profile:", 1);
          v118 = -[HMDH264Level initWithH264Level:]([HMDH264Level alloc], "initWithH264Level:", 3);
          -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "videoTierCombinations");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "objectForKeyedSubscript:", v102);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          v122 = -[HMDCameraVideoParameterCombination initWithProfile:level:videoTier:](v116, "initWithProfile:level:videoTier:", v117, v118, v121);
          objc_msgSend(v4, "addObject:", v122);

        }
        -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "videoTierCombinations");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "objectForKeyedSubscript:", v102);
        v125 = (void *)objc_claimAutoreleasedReturnValue();

        if (v125)
        {
          v126 = [HMDCameraVideoParameterCombination alloc];
          v127 = -[HMDH264Profile initWithH264Profile:]([HMDH264Profile alloc], "initWithH264Profile:", 2);
          v128 = -[HMDH264Level initWithH264Level:]([HMDH264Level alloc], "initWithH264Level:", 3);
          -[HMDCameraVideoParameterSelection videoTierParameters](self, "videoTierParameters");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "videoTierCombinations");
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "objectForKeyedSubscript:", v102);
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          v132 = -[HMDCameraVideoParameterCombination initWithProfile:level:videoTier:](v126, "initWithProfile:level:videoTier:", v127, v128, v131);
          objc_msgSend(v4, "addObject:", v132);

        }
        ++v101;
      }
      while (v146 != v101);
      v146 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v147, v163, 16);
    }
    while (v146);
  }

  v133 = (NSArray *)objc_msgSend(v4, "copy");
  validVideoParameterCombinations = self->_validVideoParameterCombinations;
  self->_validVideoParameterCombinations = v133;

}

- (HMDSupportedVideoStreamConfiguration)supportedVideoStreamConfiguration
{
  return self->_supportedVideoStreamConfiguration;
}

- (HMDSupportedRTPConfiguration)rtpConfiguration
{
  return self->_rtpConfiguration;
}

- (NSNumber)syncSource
{
  return self->_syncSource;
}

- (HMDSelectedVideoParameters)selectedVideoParameters
{
  return self->_selectedVideoParameters;
}

- (void)setSelectedVideoParameters:(id)a3
{
  objc_storeStrong((id *)&self->_selectedVideoParameters, a3);
}

- (HMDStreamingCapabilities)streamingCapabilities
{
  return self->_streamingCapabilities;
}

- (NSArray)videoCodecsPreference
{
  return self->_videoCodecsPreference;
}

- (NSArray)h264ProfilesPreference
{
  return self->_h264ProfilesPreference;
}

- (NSArray)h264LevelsPreference
{
  return self->_h264LevelsPreference;
}

- (NSArray)h264PacketizationPreference
{
  return self->_h264PacketizationPreference;
}

- (NSArray)videoResolutionsPreference
{
  return self->_videoResolutionsPreference;
}

- (NSArray)validVideoParameterCombinations
{
  return self->_validVideoParameterCombinations;
}

- (HMDCameraVideoTierParameters)videoTierParameters
{
  return self->_videoTierParameters;
}

- (HMDH264Profile)selectedProfile
{
  return self->_selectedProfile;
}

- (void)setSelectedProfile:(id)a3
{
  objc_storeStrong((id *)&self->_selectedProfile, a3);
}

- (HMDH264Level)selectedLevel
{
  return self->_selectedLevel;
}

- (void)setSelectedLevel:(id)a3
{
  objc_storeStrong((id *)&self->_selectedLevel, a3);
}

- (HMDPacketizationMode)selectedPacketizationMode
{
  return self->_selectedPacketizationMode;
}

- (void)setSelectedPacketizationMode:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPacketizationMode, a3);
}

- (NSNumber)selectedFramerate
{
  return self->_selectedFramerate;
}

- (void)setSelectedFramerate:(id)a3
{
  objc_storeStrong((id *)&self->_selectedFramerate, a3);
}

- (HMDCameraVideoTier)selectedVideoTier
{
  return self->_selectedVideoTier;
}

- (void)setSelectedVideoTier:(id)a3
{
  objc_storeStrong((id *)&self->_selectedVideoTier, a3);
}

- (HMDVideoCodec)selectedCodecType
{
  return self->_selectedCodecType;
}

- (void)setSelectedCodecType:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCodecType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedCodecType, 0);
  objc_storeStrong((id *)&self->_selectedVideoTier, 0);
  objc_storeStrong((id *)&self->_selectedFramerate, 0);
  objc_storeStrong((id *)&self->_selectedPacketizationMode, 0);
  objc_storeStrong((id *)&self->_selectedLevel, 0);
  objc_storeStrong((id *)&self->_selectedProfile, 0);
  objc_storeStrong((id *)&self->_videoTierParameters, 0);
  objc_storeStrong((id *)&self->_validVideoParameterCombinations, 0);
  objc_storeStrong((id *)&self->_videoResolutionsPreference, 0);
  objc_storeStrong((id *)&self->_h264PacketizationPreference, 0);
  objc_storeStrong((id *)&self->_h264LevelsPreference, 0);
  objc_storeStrong((id *)&self->_h264ProfilesPreference, 0);
  objc_storeStrong((id *)&self->_videoCodecsPreference, 0);
  objc_storeStrong((id *)&self->_streamingCapabilities, 0);
  objc_storeStrong((id *)&self->_selectedVideoParameters, 0);
  objc_storeStrong((id *)&self->_syncSource, 0);
  objc_storeStrong((id *)&self->_rtpConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedVideoStreamConfiguration, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_97479 != -1)
    dispatch_once(&logCategory__hmf_once_t1_97479, &__block_literal_global_97480);
  return (id)logCategory__hmf_once_v2_97481;
}

void __47__HMDCameraVideoParameterSelection_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_97481;
  logCategory__hmf_once_v2_97481 = v0;

}

@end
