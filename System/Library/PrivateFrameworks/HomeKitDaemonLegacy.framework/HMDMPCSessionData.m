@implementation HMDMPCSessionData

- (HMDMPCSessionData)initWithMediaProfiles:(id)a3 playbackState:(id)a4 playbackVolume:(id)a5 playbackArchive:(id)a6 source:(id)a7 clientName:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  HMDMPCSessionData *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  HMDMPCSessionData *v24;
  HMDMPCSessionData *v25;
  HMDMPCSessionData *v26;
  uint64_t v27;
  MPPlaybackArchive *playbackArchive;
  void *v29;
  HMDMPCSessionData *v30;
  NSObject *v31;
  void *v32;
  MPPlaybackArchive *v33;
  id v35;
  id v36;
  objc_super v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  MPPlaybackArchive *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v36 = a7;
  v35 = a8;
  if (!objc_msgSend(v15, "count"))
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v22;
      v23 = "%{public}@No media profiles";
      goto LABEL_9;
    }
LABEL_10:

    objc_autoreleasePoolPop(v19);
    v24 = 0;
    goto LABEL_16;
  }
  if (!v16 && !v17 && !v18)
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v22;
      v23 = "%{public}@No action contained in HMDMPCSessionData";
LABEL_9:
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, v23, buf, 0xCu);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v37.receiver = self;
  v37.super_class = (Class)HMDMPCSessionData;
  v25 = -[HMDMPCSessionData init](&v37, sel_init);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_mediaProfiles, a3);
    objc_storeStrong((id *)&v26->_playbackStateNumber, a4);
    objc_storeStrong((id *)&v26->_playbackVolumeNumber, a5);
    v27 = objc_msgSend(v18, "copyWithOptions:", 12);
    playbackArchive = v26->_playbackArchive;
    v26->_playbackArchive = (MPPlaybackArchive *)v27;

    objc_storeStrong((id *)&v26->_source, a7);
    objc_storeStrong((id *)&v26->_clientName, a8);
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v30 = v26;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v26->_playbackArchive;
      *(_DWORD *)buf = 138543618;
      v39 = v32;
      v40 = 2112;
      v41 = v33;
      _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@HMDMPCSessionData initialized with playbackArchive: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
  }
  v20 = v26;
  v24 = v20;
LABEL_16:

  return v24;
}

- (HMDMPCSessionData)initWithDictionaryRepresentation:(id)a3 profileSource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  HMDMPCSessionData *v30;
  HMDMPCSessionData *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  HMDMPCSessionData *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  HMDMPCSessionData *v41;
  NSObject *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  HMDMPCSessionData *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  HMDMPCSessionData *v56;
  void *v57;
  HMDMPCSessionData *v58;
  void *context;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v66;
  void *v67;
  id v68;
  id obj;
  void *v70;
  void *v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  uint64_t v80;
  uint8_t v81[4];
  void *v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v66 = v5;
  objc_msgSend(v5, "hmf_arrayForKey:", CFSTR("HMDMAR.mediaProfiles"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v7;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v9, "count"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
  v68 = v8;
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v74 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v14);
        objc_msgSend(v8, "mediaProfileWithUUID:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v70, "addObject:", v16);
        }
        else
        {
          v17 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v78 = v19;
            v79 = 2112;
            v80 = v14;
            _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not map profile UUID (%@) to MediaProfile", buf, 0x16u);

            v8 = v68;
          }

          objc_autoreleasePoolPop(v17);
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
    }
    while (v11);
  }

  v67 = (void *)objc_msgSend(v70, "copy");
  objc_msgSend(v66, "hmf_numberForKey:", CFSTR("HMDMAR.state"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "hmf_numberForKey:", CFSTR("HMDMAR.volume"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "hmf_dataForKey:", CFSTR("HMDMAR.archive"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "hmf_stringForKey:", CFSTR("HMDMAR.pbsid"));
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "hmf_numberForKey:", CFSTR("HMDMAR.actionSource"));
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  v24 = &unk_1E8B34080;
  if (v22)
    v24 = (void *)v22;
  v62 = v24;

  objc_msgSend(v66, "hmf_stringForKey:", CFSTR("HMDMAR.actionClientName"));
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  v27 = CFSTR("Unknown");
  if (v25)
    v27 = (__CFString *)v25;
  v28 = v27;

  v71 = (void *)v21;
  if (v20)
  {
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v30 = self;
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v81 = 138543618;
      v82 = v33;
      v83 = 2112;
      v84 = (uint64_t)v20;
      _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_INFO, "%{public}@Decoding playbackArchive in entirety: %@", v81, 0x16u);

      v8 = v68;
    }

    objc_autoreleasePoolPop(v29);
    v72 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v20, &v72);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v72;
    if (!v34)
    {
      v36 = (void *)MEMORY[0x1D17BA0A0]();
      v37 = v31;
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v81 = 138543618;
        v82 = v39;
        v83 = 2112;
        v84 = (uint64_t)v35;
        _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode playbackArchive: %@", v81, 0x16u);

      }
      objc_autoreleasePoolPop(v36);
      v8 = v68;
    }

  }
  else
  {
    v40 = (void *)MEMORY[0x1D17BA0A0]();
    v30 = self;
    v41 = self;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = os_log_type_enabled(v42, OS_LOG_TYPE_INFO);
    if (v21)
    {
      if (v43)
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v81 = 138543618;
        v82 = v44;
        v83 = 2112;
        v84 = v21;
        _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_INFO, "%{public}@Decoding playbackArchive session identifier: %@", v81, 0x16u);

      }
      objc_autoreleasePoolPop(v40);
      objc_msgSend(v8, "home");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "playbackArchiveWithSessionIdentifier:", v21);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        objc_msgSend(v66, "hmf_numberForKey:", CFSTR("HMDMAR.pbao"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "unsignedIntegerValue");

        v47 = 1;
        do
          v48 = objc_msgSend(v34, "setBOOLValue:forOption:", (v46 >> (v47 - 1)) & 1);
        while (v46 >> v47++);
        context = (void *)MEMORY[0x1D17BA0A0](v48);
        v50 = v41;
        HMFGetOSLogHandle();
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = v61;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v46);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v81 = 138543874;
          v82 = v53;
          v83 = 2112;
          v84 = (uint64_t)v34;
          v85 = 2112;
          v86 = v54;
          _os_log_impl(&dword_1CD062000, v51, OS_LOG_TYPE_INFO, "%{public}@Decoding playbackArchive: %@ options: %@", v81, 0x20u);

        }
        v8 = v68;
      }
      else
      {
        context = (void *)MEMORY[0x1D17BA0A0]();
        v56 = v41;
        HMFGetOSLogHandle();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v81 = 138543618;
          v82 = v57;
          v83 = 2112;
          v52 = v61;
          v84 = (uint64_t)v61;
          _os_log_impl(&dword_1CD062000, v51, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode playbackArchive session identifier. home %@", v81, 0x16u);

        }
        else
        {
          v52 = v61;
        }
      }

      objc_autoreleasePoolPop(context);
    }
    else
    {
      if (v43)
      {
        HMFGetLogIdentifier();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v81 = 138543362;
        v82 = v55;
        _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_INFO, "%{public}@Key to playbackArchive not found", v81, 0xCu);

      }
      objc_autoreleasePoolPop(v40);
      v34 = 0;
    }
  }
  v58 = -[HMDMPCSessionData initWithMediaProfiles:playbackState:playbackVolume:playbackArchive:source:clientName:](v30, "initWithMediaProfiles:playbackState:playbackVolume:playbackArchive:source:clientName:", v67, v64, v63, v34, v62, v28);

  return v58;
}

- (HMDMPCSessionData)initWithMediaAction:(id)a3 source:(id)a4 clientName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDMPCSessionData *v15;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if (objc_msgSend(v8, "state"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "state"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v8, "mediaProfiles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "volume");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playbackArchive");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMDMPCSessionData initWithMediaProfiles:playbackState:playbackVolume:playbackArchive:source:clientName:](self, "initWithMediaProfiles:playbackState:playbackVolume:playbackArchive:source:clientName:", v12, v11, v13, v14, v10, v9);

  return v15;
}

- (id)dictionaryRepresentation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDMPCSessionData *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDMPCSessionData *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v39;
  HMDMPCSessionData *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  HMDMPCSessionData *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v3 = a3;
  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMPCSessionData mediaProfiles](self, "mediaProfiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", &__block_literal_global_126179);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("HMDMAR.mediaProfiles"));
  -[HMDMPCSessionData playbackStateNumber](self, "playbackStateNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("HMDMAR.state"));

  -[HMDMPCSessionData playbackVolumeNumber](self, "playbackVolumeNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("HMDMAR.volume"));

  -[HMDMPCSessionData source](self, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("HMDMAR.actionSource"));

  -[HMDMPCSessionData clientName](self, "clientName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("HMDMAR.actionClientName"));

  -[HMDMPCSessionData playbackArchive](self, "playbackArchive");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMPCSessionData playbackArchive](v15, "playbackArchive");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v17;
      v53 = 2112;
      v54 = v18;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Encoding playbackArchive: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = v15;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v22)
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v52 = v23;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Encoding playbackArchive in entirety", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      v24 = (void *)MEMORY[0x1E0CB36F8];
      -[HMDMPCSessionData playbackArchive](v20, "playbackArchive");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0;
      objc_msgSend(v24, "archivedDataWithRootObject:requiringSecureCoding:error:", v25, 1, &v50);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v50;

      if (v26)
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("HMDMAR.archive"));
      }
      else
      {
        v44 = (void *)MEMORY[0x1D17BA0A0]();
        v45 = v20;
        HMFGetOSLogHandle();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v52 = v47;
          v53 = 2112;
          v54 = v27;
          _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_ERROR, "%{public}@Couldn't encode playbackArchive: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v44);
      }

    }
    else
    {
      if (v22)
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDMPCSessionData playbackArchive](v20, "playbackArchive");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v28;
        v53 = 2112;
        v54 = v29;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Encoding playbackArchive session identifier: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      -[HMDMPCSessionData playbackArchive](v20, "playbackArchive");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "playbackSessionIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, CFSTR("HMDMAR.pbsid"));

      -[HMDMPCSessionData playbackArchive](v20, "playbackArchive");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "supportedOptions");

      v34 = 0;
      v35 = 1;
      do
      {
        -[HMDMPCSessionData playbackArchive](v20, "playbackArchive");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "BOOLValueForOption:", v35 - 1);

        v34 |= v37 << (v35 - 1);
      }
      while (v33 >> v35++);
      v39 = (void *)MEMORY[0x1D17BA0A0]();
      v40 = v20;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v42;
        v53 = 2112;
        v54 = v43;
        _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_INFO, "%{public}@Encoding playbackArchive options: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v39);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("HMDMAR.pbao"));
    }

  }
  v48 = (void *)objc_msgSend(v5, "copy");

  return v48;
}

- (BOOL)playbackArchiveTargetsSystemMediaApplication
{
  void *v2;
  void *v3;
  char v4;

  -[HMDMPCSessionData playbackArchive](self, "playbackArchive");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.Music"));
  else
    v4 = 1;

  return v4;
}

- (NSSet)mediaProfiles
{
  return self->_mediaProfiles;
}

- (NSNumber)playbackStateNumber
{
  return self->_playbackStateNumber;
}

- (NSNumber)playbackVolumeNumber
{
  return self->_playbackVolumeNumber;
}

- (MPPlaybackArchive)playbackArchive
{
  return self->_playbackArchive;
}

- (NSNumber)source
{
  return self->_source;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_playbackArchive, 0);
  objc_storeStrong((id *)&self->_playbackVolumeNumber, 0);
  objc_storeStrong((id *)&self->_playbackStateNumber, 0);
  objc_storeStrong((id *)&self->_mediaProfiles, 0);
}

id __46__HMDMPCSessionData_dictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
