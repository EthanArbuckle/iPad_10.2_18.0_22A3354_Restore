@implementation HMDMediaPlaybackActionEvent

- (id)biomeEventsRepresentationForLogObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _BOOL8 v18;
  void *v19;
  unint64_t v20;
  __CFString *v21;
  void *v22;
  HMDMediaPlaybackActionEvent *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
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
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  HMDMediaPlaybackActionEvent *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  HMDMediaPlaybackActionEvent *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  HMDMediaPlaybackActionEvent *v71;
  NSObject *v72;
  void *v73;
  id v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  id obj;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  HMDMediaPlaybackActionEvent *v93;
  _QWORD v94[4];
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint8_t buf[4];
  void *v101;
  __int16 v102;
  void *v103;
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v93 = self;
  -[HMDMediaPlaybackActionEvent accessories](self, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_1450);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v86 = v7;
  if (v7)
  {
    v75 = v4;
    if (v93)
    {
      v8 = (objc_class *)MEMORY[0x24BDD1508];
      v9 = v7;
      v10 = [v8 alloc];
      -[HMMDatedLogEvent startDate](v93, "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMDatedLogEvent endDate](v93, "endDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v10, "initWithStartDate:endDate:", v11, v12);

      v14 = objc_alloc(MEMORY[0x24BE0CBB0]);
      objc_msgSend(v9, "spiClientIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v9, "atHomeLevel");

      v18 = (v17 & 0xFFFFFFFFFFFFFFFELL) == 2;
      -[HMDMediaPlaybackActionEvent sourceNumber](v93, "sourceNumber");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedIntegerValue");
      if (v20 > 9)
        v21 = CFSTR("Unknown");
      else
        v21 = off_24E780100[v20];
      v27 = v21;
      -[HMDMediaPlaybackActionEvent sourceClientName](v93, "sourceClientName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaPlaybackActionEvent clientMetricIdentifier](v93, "clientMetricIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v77 = (void *)objc_msgSend(v14, "initWithDateInterval:homeUniqueIdentifier:homeOccupancy:source:clientName:eventCorrelationIdentifier:", v13, v16, v18, v27, v28, v29);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v91 = v15;
        v30 = v13;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "UUIDString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = (void *)objc_msgSend(v14, "initWithDateInterval:homeUniqueIdentifier:homeOccupancy:source:clientName:eventCorrelationIdentifier:", v30, v16, v18, v27, v28, v32);

        v13 = v30;
        v15 = v91;
      }

    }
    else
    {
      v77 = 0;
    }
    v33 = (void *)MEMORY[0x24BDBCEB8];
    -[HMDMediaPlaybackActionEvent accessories](v93, "accessories");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "arrayWithCapacity:", objc_msgSend(v34, "count"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    -[HMDMediaPlaybackActionEvent accessories](v93, "accessories");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v97;
      v79 = *(_QWORD *)v97;
      do
      {
        v38 = 0;
        v78 = v36;
        do
        {
          if (*(_QWORD *)v97 != v37)
            objc_enumerationMutation(obj);
          v39 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v38);
          objc_msgSend(v39, "room");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (v40)
          {
            objc_msgSend(v39, "accessoryProfiles");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "na_firstObjectPassingTest:", &__block_literal_global_76);
            v42 = objc_claimAutoreleasedReturnValue();

            v92 = (void *)v42;
            if (v42)
            {
              objc_msgSend(v86, "zones");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v94[0] = MEMORY[0x24BDAC760];
              v94[1] = 3221225472;
              v94[2] = __85__HMDMediaPlaybackActionEvent_BiomeLogging__biomeEventsRepresentationForLogObserver___block_invoke_78;
              v94[3] = &unk_24E78F1D0;
              v44 = v40;
              v95 = v44;
              objc_msgSend(v43, "na_filter:", v94);
              v45 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v45, "na_map:", &__block_literal_global_81);
              v89 = objc_claimAutoreleasedReturnValue();
              v90 = v45;
              objc_msgSend(v45, "na_map:", &__block_literal_global_82);
              v87 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDMediaPlaybackActionEvent playbackStateNumber](v93, "playbackStateNumber");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = objc_msgSend(v47, "integerValue");

              if (v48)
              {
                -[HMDMediaPlaybackActionEvent playbackStateNumber](v93, "playbackStateNumber");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "setObject:forKeyedSubscript:", v49, CFSTR("playback-state"));

              }
              -[HMDMediaPlaybackActionEvent volumeNumber](v93, "volumeNumber");
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              if (v50)
              {
                -[HMDMediaPlaybackActionEvent volumeNumber](v93, "volumeNumber");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "setObject:forKeyedSubscript:", v51, CFSTR("volume"));

              }
              v88 = v40;
              if (objc_msgSend(v46, "count"))
              {
                v82 = objc_alloc(MEMORY[0x24BE0CBB8]);
                objc_msgSend(v39, "spiClientIdentifier");
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v84, "UUIDString");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = (void *)objc_msgSend(v46, "copy");
                objc_msgSend(v92, "mediaRouteID");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "spiClientIdentifier");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v83, "UUIDString");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "name");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "name");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v86, "name");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v81 = v46;
                v58 = (void *)v87;
                v59 = (void *)v89;
                v60 = (void *)objc_msgSend(v82, "initWithBase:accessoryUniqueIdentifier:accessoryStateString:accessoryStateNumber:accessoryStateData:accessoryMediaRouteIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:roomName:zoneNames:homeName:", v77, v80, MEMORY[0x24BDBD1B8], v52, MEMORY[0x24BDBD1B8], v53, v89, v54, v55, v56, v87, v57);
                objc_msgSend(v76, "addObject:", v60);

                v36 = v78;
                v61 = v81;

              }
              else
              {
                v61 = v46;
                v70 = (void *)MEMORY[0x227676638]();
                v71 = v93;
                HMFGetOSLogHandle();
                v72 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v101 = v73;
                  v102 = 2112;
                  v103 = v39;
                  _os_log_impl(&dword_2218F0000, v72, OS_LOG_TYPE_ERROR, "%{public}@Unable to log event metadata to biome, no media state for media accessory: %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v70);
                v59 = (void *)v89;
                v58 = (void *)v87;
              }

              v37 = v79;
              v40 = v88;
            }
            else
            {
              v66 = (void *)MEMORY[0x227676638]();
              v67 = v93;
              HMFGetOSLogHandle();
              v68 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v101 = v69;
                v102 = 2112;
                v103 = v39;
                _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_ERROR, "%{public}@Unable to log event metadata to biome, no media profile for media accessory: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v66);
            }

          }
          else
          {
            v62 = (void *)MEMORY[0x227676638]();
            v63 = v93;
            HMFGetOSLogHandle();
            v64 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v101 = v65;
              v102 = 2112;
              v103 = v39;
              _os_log_impl(&dword_2218F0000, v64, OS_LOG_TYPE_ERROR, "%{public}@Unable to log media event metadata to biome, no room for accessory: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v62);
          }

          ++v38;
        }
        while (v36 != v38);
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
      }
      while (v36);
    }

    v26 = (void *)objc_msgSend(v76, "copy");
    v4 = v75;
  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = v93;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v101 = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to log media event metadata to biome, no home", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    v26 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v26;
}

uint64_t __85__HMDMediaPlaybackActionEvent_BiomeLogging__biomeEventsRepresentationForLogObserver___block_invoke_78(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "roomUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsObject:", v5);

  return v6;
}

uint64_t __85__HMDMediaPlaybackActionEvent_BiomeLogging__biomeEventsRepresentationForLogObserver___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

id __85__HMDMediaPlaybackActionEvent_BiomeLogging__biomeEventsRepresentationForLogObserver___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "spiClientIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __85__HMDMediaPlaybackActionEvent_BiomeLogging__biomeEventsRepresentationForLogObserver___block_invoke_74(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

BOOL __85__HMDMediaPlaybackActionEvent_BiomeLogging__biomeEventsRepresentationForLogObserver___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)microLocationMetadataForLogEventObserver:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  -[HMDMediaPlaybackActionEvent accessories](self, "accessories", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDMediaPlaybackActionEvent playbackStateNumber](self, "playbackStateNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v7)
  {
    -[HMDMediaPlaybackActionEvent playbackStateString](self, "playbackStateString");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("playback-state");
  }
  else
  {
    -[HMDMediaPlaybackActionEvent volumeNumber](self, "volumeNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[HMDMediaPlaybackActionEvent volumeNumber](self, "volumeNumber");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringValue");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v9 = CFSTR("volume");
    }
    else
    {
      v9 = CFSTR("media");
      v8 = CFSTR("unknown");
    }
  }
  v12 = (void *)MEMORY[0x24BE66930];
  objc_msgSend(v5, "spiClientIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaPlaybackActionEvent sourceString](self, "sourceString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "room");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "spiClientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "metadataForHomekitAccessoryControlEventWithUUID:stateString:serviceUUID:serviceType:characteristicType:serviceGroupUUID:source:roomUUID:", v14, v8, v9, v9, v9, &stru_24E79DB48, v15, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)shouldTriggerMicroLocationLocalizationScanForLogEventObserver:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  unsigned int v8;

  v4 = -[HMDMediaPlaybackActionEvent numAccessoriesInHome](self, "numAccessoriesInHome", a3);
  v5 = -[HMDMediaPlaybackActionEvent numNonEmptyScenesInHome](self, "numNonEmptyScenesInHome");
  -[HMDMediaPlaybackActionEvent sourceNumber](self, "sourceNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  if (v5 + v4 > 3)
    v8 = (v7 < 7) & (0x67u >> v7);
  else
    LOBYTE(v8) = 0;

  return v8;
}

- (BOOL)shouldTriggerMicroLocationRecordingScanForLogEventObserver:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  unsigned int v8;

  v4 = -[HMDMediaPlaybackActionEvent numAccessoriesInHome](self, "numAccessoriesInHome", a3);
  v5 = -[HMDMediaPlaybackActionEvent numNonEmptyScenesInHome](self, "numNonEmptyScenesInHome");
  -[HMDMediaPlaybackActionEvent sourceNumber](self, "sourceNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  if (v5 + v4 > 3)
    v8 = (v7 < 7) & (0x67u >> v7);
  else
    LOBYTE(v8) = 0;

  return v8;
}

- (unint64_t)microLocationScanTriggerTypeForLogEventObserver:(id)a3
{
  return 1;
}

- (HMDMediaPlaybackActionEvent)initWithIsPlaybackArchivePresent:(BOOL)a3 playbackStateNumber:(id)a4 volumeNumber:(id)a5 sourceNumber:(id)a6 sourceClientName:(id)a7 accessories:(id)a8
{
  id v15;
  id v16;
  __CFString *v17;
  id v18;
  HMDMediaPlaybackActionEvent *v19;
  void *v20;
  uint64_t v21;
  NSString *clientMetricIdentifier;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  objc_super v33;

  v15 = a4;
  v32 = a5;
  v16 = a6;
  v17 = (__CFString *)a7;
  v18 = a8;
  v33.receiver = self;
  v33.super_class = (Class)HMDMediaPlaybackActionEvent;
  v19 = -[HMMDatedLogEvent init](&v33, sel_init);
  if (v19)
  {
    objc_msgSend(MEMORY[0x24BE3F138], "currentActivity");
    v31 = v15;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "clientMetricIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    clientMetricIdentifier = v19->_clientMetricIdentifier;
    v19->_clientMetricIdentifier = (NSString *)v21;

    v19->_isPlaybackArchivePresent = a3;
    v19->_numberOfMediaProfiles = objc_msgSend(v18, "count");
    objc_storeStrong((id *)&v19->_playbackStateNumber, a4);
    objc_storeStrong((id *)&v19->_volumeNumber, a5);
    objc_storeStrong((id *)&v19->_sourceNumber, a6);
    if (v17)
      v23 = v17;
    else
      v23 = CFSTR("Unknown");
    objc_storeStrong((id *)&v19->_sourceClientName, v23);
    objc_storeStrong((id *)&v19->_accessories, a8);
    objc_msgSend(v18, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "home");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "accessories");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v19->_numAccessoriesInHome = objc_msgSend(v26, "count");

    objc_msgSend(v25, "actionSets");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "copy");

    objc_msgSend(v28, "na_filter:", &__block_literal_global_137077);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v19->_numNonEmptyScenesInHome = objc_msgSend(v29, "count");

    v15 = v31;
  }

  return v19;
}

- (NSString)playbackStateString
{
  void *v3;
  void *v4;
  __CFString *v5;

  -[HMDMediaPlaybackActionEvent playbackStateNumber](self, "playbackStateNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDMediaPlaybackActionEvent playbackStateNumber](self, "playbackStateNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "integerValue");
    playbackStateAsString();
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("Unset");
  }
  return (NSString *)v5;
}

- (NSString)sourceString
{
  void *v2;
  unint64_t v3;
  __CFString *v4;
  NSString *v5;

  -[HMDMediaPlaybackActionEvent sourceNumber](self, "sourceNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");
  if (v3 > 9)
    v4 = CFSTR("Unknown");
  else
    v4 = off_24E780100[v3];
  v5 = v4;

  return v5;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.media.playbackAction");
}

- (NSDictionary)coreAnalyticsEventDictionary
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
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDMediaPlaybackActionEvent isPlaybackArchivePresent](self, "isPlaybackArchivePresent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("playbackArchivePresent"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDMediaPlaybackActionEvent numberOfMediaProfiles](self, "numberOfMediaProfiles"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("numberOfMediaProfiles"));

  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intervalIndexForValue:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("duration"));

  -[HMDMediaPlaybackActionEvent volumeNumber](self, "volumeNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaPlaybackActionEvent volumeNumber](self, "volumeNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "intervalIndexForValue:", objc_msgSend(v10, "unsignedIntegerValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("volume"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24E96BC30, CFSTR("volume"));
  }

  -[HMDMediaPlaybackActionEvent playbackStateString](self, "playbackStateString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("playbackState"));

  -[HMDMediaPlaybackActionEvent sourceString](self, "sourceString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("actionSource"));

  return (NSDictionary *)v3;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (BOOL)isPlaybackArchivePresent
{
  return self->_isPlaybackArchivePresent;
}

- (NSNumber)playbackStateNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (NSNumber)volumeNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (NSNumber)sourceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)sourceClientName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)clientMetricIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (unint64_t)numberOfMediaProfiles
{
  return self->_numberOfMediaProfiles;
}

- (NSArray)accessories
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (unint64_t)numAccessoriesInHome
{
  return self->_numAccessoriesInHome;
}

- (unint64_t)numNonEmptyScenesInHome
{
  return self->_numNonEmptyScenesInHome;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_clientMetricIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceClientName, 0);
  objc_storeStrong((id *)&self->_sourceNumber, 0);
  objc_storeStrong((id *)&self->_volumeNumber, 0);
  objc_storeStrong((id *)&self->_playbackStateNumber, 0);
}

BOOL __139__HMDMediaPlaybackActionEvent_initWithIsPlaybackArchivePresent_playbackStateNumber_volumeNumber_sourceNumber_sourceClientName_accessories___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

@end
