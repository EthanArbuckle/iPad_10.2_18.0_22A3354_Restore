@implementation AFAnalyticsContextCreateForCrossDeviceCommandNearbyDevices

void __AFAnalyticsContextCreateForCrossDeviceCommandNearbyDevices_block_invoke(void **a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  id obj;
  void **v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = a1;
  v37 = v5;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v5);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  v38 = v7;
  if (v8)
  {
    v9 = v8;
    v41 = *(_QWORD *)v43;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v43 != v41)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "contextMetadataForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("playbackState")))
        {
          objc_msgSend(v6, "playbackStateSnapshot");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "playbackState");
          objc_msgSend(v14, "nowPlayingTimestamp");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          AFAnalyticsBucketizedDurationForStartDateAndEndDate((uint64_t)v16, v40[5], 1, 1800.0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("recency"));

          v18 = CFSTR("(unknown)");
          if (v15 <= 5)
            v18 = *(&off_1E3A325B8 + v15);
          v19 = v18;
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("playstate"));

          objc_msgSend(v14, "mediaType");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("media_type"));
          v7 = v38;
LABEL_10:

          goto LABEL_12;
        }
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("heardVoiceTrigger")) & 1) == 0)
        {
          if (objc_msgSend(v11, "isEqualToString:", CFSTR("homeAnnouncement")))
          {
            objc_msgSend(v6, "homeAnnouncementSnapshot");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            AFHomeAnnouncementStateGetNames(objc_msgSend(v14, "state"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("announce_state"));

            objc_msgSend(v14, "lastPlayedAnnouncement");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "startedDate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              AFAnalyticsBucketizedDurationForStartDateAndEndDate((uint64_t)v20, v40[5], 1, 1800.0);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("recency"));

            }
          }
          else
          {
            objc_msgSend(v13, "deliveryDate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            AFAnalyticsBucketizedDurationForStartDateAndEndDate((uint64_t)v14, v40[5], 1, 1800.0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("recency"));
          }
          goto LABEL_10;
        }
LABEL_12:
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("context_type"));
        objc_msgSend(v7, "addObject:", v12);

        ++v10;
      }
      while (v9 != v10);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      v9 = v24;
    }
    while (v24);
  }
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v40[6], "objectForKeyedSubscript:", v37);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "integerValue");

    objc_msgSend(v6, "deviceInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "productType");
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      if (v26 == 4000)
        v28 = (__CFString *)MGCopyAnswer();
      else
        v28 = CFSTR("Unknown");
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v28)
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, CFSTR("product_type"));
    v31 = CFSTR("near");
    v32 = CFSTR("immediate");
    v33 = CFSTR("primary");
    if (v26 != 4000)
      v33 = 0;
    if (v26 != 3000)
      v32 = v33;
    if (v26 != 2000)
      v31 = (__CFString *)v32;
    v34 = CFSTR("unknown");
    v35 = CFSTR("far");
    if (v26 != 1000)
      v35 = 0;
    if (v26)
      v34 = v35;
    if (v26 <= 1999)
      v31 = (__CFString *)v34;
    v36 = v31;
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v36, CFSTR("proximity"));

    if (objc_msgSend(v38, "count"))
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v38, CFSTR("contexts"));
    objc_msgSend(v40[7], "addObject:", v30);

    v7 = v38;
  }

}

@end
