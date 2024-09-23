@implementation MPCReportingPlaybackObserver

- (id)_init
{
  MPCReportingPlaybackObserver *v2;
  NSOperationQueue *v3;
  NSOperationQueue *recordEventOperationQueue;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPCReportingPlaybackObserver;
  v2 = -[MPCReportingPlaybackObserver init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    recordEventOperationQueue = v2->_recordEventOperationQueue;
    v2->_recordEventOperationQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_recordEventOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v2->_recordEventOperationQueue, "setName:", CFSTR("com.apple.MediaPlaybackCore.MPCReportingPlaybackObserver.recordEventOperationQueue"));
    objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerObserver:", v2);
    v2->_offline = objc_msgSend(v5, "networkType") == 0;
    -[NSOperationQueue setQualityOfService:](v2->_recordEventOperationQueue, "setQualityOfService:", 17);

  }
  return v2;
}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__MPCReportingPlaybackObserver_environmentMonitorDidChangeNetworkType___block_invoke;
  v6[3] = &unk_24CABA1D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (id)newPlayActivityEvent
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x24BEC88E8]);
  if (newPlayActivityEvent_sOnceToken != -1)
    dispatch_once(&newPlayActivityEvent_sOnceToken, &__block_literal_global_7_19197);
  objc_msgSend(MEMORY[0x24BEC87B8], "currentDeviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeviceName:", v5);

  objc_msgSend(v3, "setSystemReleaseType:", newPlayActivityEvent_systemReleaseType);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEventDate:", v6);

  objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEventTimeZone:", v7);

  v8 = objc_alloc(MEMORY[0x24BEC89F8]);
  objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithIdentity:", v9);

  objc_msgSend(v10, "userAgent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBuildVersion:", v11);

  objc_msgSend(v3, "setSourceType:", 0);
  objc_msgSend(v3, "setOffline:", self->_offline);

  return v3;
}

- (void)recordPlayActivityEvents:(id)a3 forEventSource:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  unsigned int v54;
  void *v55;
  uint64_t v56;
  BOOL v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t i;
  void *v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  MPCReportingPlaybackObserver *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  unsigned int v86;
  void *v87;
  uint64_t v88;
  int obj;
  id obja;
  uint64_t v91;
  char v92;
  void *v93;
  int v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  _QWORD v99[4];
  id v100;
  id v101;
  MPCReportingPlaybackObserver *v102;
  id v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[4];
  id v109;
  id v110;
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7 || !objc_msgSend(v6, "count"))
    goto LABEL_79;
  objc_msgSend(v7, "identityPropertiesLoader");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventDuration");
  v9 = v8;
  objc_msgSend(v7, "itemGenericObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v7, "overrideItemType");
  objc_msgSend(v7, "trackInfo");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modelPlayEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "featureName");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recommendationData");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "flattenedGenericObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "anyObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v12, "type");
  v80 = v12;
  v81 = self;
  switch(v15)
  {
    case 9:
      obj = 0;
      v18 = 0;
      v92 = 1;
LABEL_9:
      v17 = 1;
      break;
    case 6:
      v92 = 0;
      v18 = 0;
      obj = 1;
      goto LABEL_9;
    case 1:
      objc_msgSend(v12, "song");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "hasVideo");
      v18 = objc_msgSend(v16, "isArtistUploadedContent");

      v92 = 0;
      obj = 0;
      break;
    default:
      v92 = 0;
      obj = 0;
      v18 = 0;
      v17 = 0;
      break;
  }
  v82 = v11;
  v94 = v18;
  switch(objc_msgSend(v11, "itemType"))
  {
    case 1:
      v19 = objc_alloc_init(MEMORY[0x24BEC88F0]);
      objc_msgSend(v11, "album");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifiers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "universalStore");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "subscriptionAdamID");
      if (v23)
      {
        objc_msgSend(v19, "setAdamID:", v23);
      }
      else
      {
        objc_msgSend(v21, "universalStore");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setAdamID:", objc_msgSend(v42, "adamID"));

      }
      objc_msgSend(v14, "personalizedStore");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "cloudAlbumID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setCloudAlbumID:", v43);

      v37 = 0;
      v44 = 4;
      goto LABEL_35;
    case 2:
      v19 = objc_alloc_init(MEMORY[0x24BEC88F0]);
      objc_msgSend(v11, "artist");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifiers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "universalStore");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "subscriptionAdamID");
      if (v25)
      {
        objc_msgSend(v19, "setAdamID:", v25);
      }
      else
      {
        objc_msgSend(v21, "universalStore");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setAdamID:", objc_msgSend(v45, "adamID"));

      }
      v37 = 0;
      v44 = 3;
LABEL_35:
      v91 = v44;
      goto LABEL_36;
    case 3:
      v86 = v17;
      v26 = v14;
      v27 = v10;
      v28 = objc_alloc_init(MEMORY[0x24BEC88F0]);
      objc_msgSend(v11, "playlist");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "identifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "universalStore");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "globalPlaylistID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "length"))
        objc_msgSend(v28, "setGlobalPlaylistID:", v21);
      objc_msgSend(v20, "personalizedStore");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "cloudID");

      if (v32)
        objc_msgSend(v28, "setCloudPlaylistID:", v32);
      objc_msgSend(v20, "universalStore");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "universalCloudLibraryID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v24, "length") && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v28, "setCloudUniversalLibraryID:", v24);
      v34 = (void *)MEMORY[0x24BDDC928];
      v108[0] = MEMORY[0x24BDAC760];
      v108[1] = 3221225472;
      v108[2] = __72__MPCReportingPlaybackObserver_recordPlayActivityEvents_forEventSource___block_invoke;
      v108[3] = &unk_24CABA1D0;
      v35 = v28;
      v109 = v35;
      v110 = v29;
      v36 = v29;
      objc_msgSend(v34, "performWithoutEnforcement:", v108);

      v37 = 0;
      v91 = 2;
      v10 = v27;
      v14 = v26;
      v19 = v35;
      goto LABEL_29;
    case 4:
      v86 = v17;
      v19 = objc_alloc_init(MEMORY[0x24BEC88F0]);
      objc_msgSend(v11, "radioStation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifiers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "radio");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stationStringID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v24, "length"))
        objc_msgSend(v19, "setStationStringID:", v24);
      objc_msgSend(v21, "radio");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stationHash");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v40, "length"))
        objc_msgSend(v19, "setStationHash:", v40);
      objc_msgSend(v21, "radio");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setStationID:", objc_msgSend(v41, "stationID"));

      v37 = 1;
      v91 = 1;
LABEL_29:
      v17 = v86;
LABEL_36:

      v18 = v94;
      break;
    default:
      v37 = 0;
      v91 = 0;
      v19 = 0;
      break;
  }
  v83 = v10;
  v79 = v14;
  v95 = v19;
  if (v10)
  {
    v46 = objc_alloc_init(MEMORY[0x24BEC88F8]);
    if (v18)
    {
      v47 = v88;
      if (!v88)
        v47 = 6;
      v88 = v47;
      objc_msgSend(v14, "universalStore");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "subscriptionAdamID");
      if (v49)
      {
        objc_msgSend(v46, "setSubscriptionAdamID:", v49);
      }
      else
      {
        objc_msgSend(v14, "universalStore");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setSubscriptionAdamID:", objc_msgSend(v62, "adamID"));

      }
LABEL_65:

LABEL_66:
      v50 = v17;
      objc_msgSend(v7, "lyricsID");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setLyricsID:", v63);

      objc_msgSend(v46, "setEquivalencySourceAdamID:", objc_msgSend(v7, "equivalencySourceAdamID"));
      objc_msgSend(v14, "universalStore");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setReportingAdamID:", objc_msgSend(v64, "reportingAdamID"));

      goto LABEL_67;
    }
    objc_msgSend(v14, "universalStore");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (v37)
    {
      v53 = objc_msgSend(v51, "adamID");
      if (!v53)
      {
        objc_msgSend(v14, "universalStore");
        v54 = v17;
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v55, "subscriptionAdamID");

        v17 = v54;
      }

      objc_msgSend(v46, "setRadioAdamID:", v53);
      v56 = v88;
      if (v88)
        v57 = 1;
      else
        v57 = v53 == 0;
      if (!v57)
        v56 = 1;
      v88 = v56;
      goto LABEL_66;
    }
    objc_msgSend(v46, "setSubscriptionAdamID:", objc_msgSend(v51, "subscriptionAdamID"));

    objc_msgSend(v14, "universalStore");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setPurchasedAdamID:", objc_msgSend(v58, "purchasedAdamID"));

    v59 = 8;
    if (obj)
      v59 = 9;
    if (((v92 | obj) & 1) == 0)
    {
      if (!objc_msgSend(v46, "subscriptionAdamID") && !objc_msgSend(v46, "purchasedAdamID") || v88)
      {
LABEL_61:
        objc_msgSend(v14, "personalizedStore");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setCloudID:", objc_msgSend(v60, "cloudID"));

        objc_msgSend(v14, "universalStore");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "universalCloudLibraryID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v48, "length") && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v46, "setCloudUniversalLibraryID:", v48);
        goto LABEL_65;
      }
      v59 = 1;
    }
    v88 = v59;
    goto LABEL_61;
  }
  v50 = 0;
  v46 = 0;
LABEL_67:
  objc_msgSend(v7, "requestingBundleIdentifier");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestingBundleVersion");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jingleTimedMetadata");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "isSiriInitiated");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v7;
  objc_msgSend(v7, "isPrivateListeningEnabled");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v85 = v6;
  obja = v6;
  v68 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v104, v111, 16);
  if (v68)
  {
    v69 = v68;
    v70 = *(_QWORD *)v105;
    do
    {
      for (i = 0; i != v69; ++i)
      {
        if (*(_QWORD *)v105 != v70)
          objc_enumerationMutation(obja);
        v72 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
        objc_msgSend(v72, "setTrackInfo:", v98);
        objc_msgSend(v72, "setRequestingBundleIdentifier:", v93);
        objc_msgSend(v72, "setRequestingBundleVersion:", v65);
        objc_msgSend(v72, "setMediaType:", v50);
        objc_msgSend(v72, "setContainerType:", v91);
        objc_msgSend(v72, "setContainerIDs:", v95);
        objc_msgSend(v72, "setFeatureName:", v97);
        objc_msgSend(v72, "setRecommendationData:", v96);
        objc_msgSend(v72, "setItemDuration:", v9);
        v73 = v46;
        objc_msgSend(v72, "setItemIDs:", v46);
        objc_msgSend(v72, "setSiriInitiated:", v66);
        objc_msgSend(v72, "setPrivateListeningEnabled:", v67);
        objc_msgSend(v72, "setRepeatPlayMode:", 0);
        objc_msgSend(v72, "setShufflePlayMode:", 0);
        objc_msgSend(v72, "setAutoPlayMode:", 0);
        objc_msgSend(v72, "timedMetadata");
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v74)
          objc_msgSend(v72, "setTimedMetadata:", v87);
        if (!objc_msgSend(v72, "itemType"))
          objc_msgSend(v72, "setItemType:", v88);
        v46 = v73;
      }
      v69 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v104, v111, 16);
    }
    while (v69);
  }

  v75 = objc_alloc(MEMORY[0x24BDDC6F0]);
  v99[0] = MEMORY[0x24BDAC760];
  v99[1] = 3221225472;
  v99[2] = __72__MPCReportingPlaybackObserver_recordPlayActivityEvents_forEventSource___block_invoke_2;
  v99[3] = &unk_24CAB6E00;
  v100 = v78;
  v101 = obja;
  v102 = v81;
  v7 = v84;
  v103 = v84;
  v76 = v78;
  v77 = (void *)objc_msgSend(v75, "initWithStartHandler:", v99);
  -[NSOperationQueue addOperation:](v81->_recordEventOperationQueue, "addOperation:", v77);

  v6 = v85;
LABEL_79:

}

- (id)_newReportingPlaybackActivityEventForPlayActivityEvent:(id)a3 eventSource:(id)a4
{
  id v5;
  id v6;
  MPCReportingPlaybackActivityEvent *v7;
  char v8;
  _BOOL8 v9;

  v5 = a3;
  if (v5)
  {
    v6 = a4;
    v7 = objc_alloc_init(MPCReportingPlaybackActivityEvent);
    -[MPCReportingPlaybackActivityEvent setPlayActivityEvent:](v7, "setPlayActivityEvent:", v5);
    v8 = objc_msgSend(v6, "shouldReportPlayEventsToStore");

    v9 = (v8 & 1) != 0 || objc_msgSend(v5, "eventType") != 0;
    -[MPCReportingPlaybackActivityEvent setShouldReportToStore:](v7, "setShouldReportToStore:", v9);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordEventOperationQueue, 0);
}

void __72__MPCReportingPlaybackObserver_recordPlayActivityEvents_forEventSource___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cloudVersionHash");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setPlaylistVersionHash:", v2);

}

void __72__MPCReportingPlaybackObserver_recordPlayActivityEvents_forEventSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v3 = a2;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__MPCReportingPlaybackObserver_recordPlayActivityEvents_forEventSource___block_invoke_3;
  v9[3] = &unk_24CAB6DD8;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v10 = v5;
  v11 = v6;
  v12 = v7;
  v13 = v3;
  v8 = v3;
  objc_msgSend(v4, "loadReportingIdentityPropertiesWithCompletionHandler:", v9);

}

void __72__MPCReportingPlaybackObserver_recordPlayActivityEvents_forEventSource___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__MPCReportingPlaybackObserver_recordPlayActivityEvents_forEventSource___block_invoke_4;
  block[3] = &unk_24CAB6DB0;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v4 = *(void **)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = v4;
  v11 = *(id *)(a1 + 56);
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __72__MPCReportingPlaybackObserver_recordPlayActivityEvents_forEventSource___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 40), "storeFrontID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setStoreFrontID:", v9);

        objc_msgSend(v8, "setStoreAccountID:", objc_msgSend(*(id *)(a1 + 40), "storeAccountID"));
        objc_msgSend(*(id *)(a1 + 40), "enqueuerProperties");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setEnqueuerProperties:", v10);

        objc_msgSend(v8, "setSBEnabled:", objc_msgSend(*(id *)(a1 + 40), "hasSubscriptionPlaybackCapability"));
        objc_msgSend(*(id *)(a1 + 40), "householdID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setHouseholdID:", v11);

        v12 = (void *)objc_msgSend(*(id *)(a1 + 48), "_newReportingPlaybackActivityEventForPlayActivityEvent:eventSource:", v8, *(_QWORD *)(a1 + 56));
        if (v12)
          objc_msgSend(v2, "addObject:", v12);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x24BEC8908], "shared");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "msv_map:", &__block_literal_global_30);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __72__MPCReportingPlaybackObserver_recordPlayActivityEvents_forEventSource___block_invoke_6;
    v15[3] = &unk_24CAB6D88;
    v16 = *(id *)(a1 + 64);
    objc_msgSend(v13, "recordPlayActivityEvents:shouldFlush:withCompletionHandler:", v14, 1, v15);

  }
}

uint64_t __72__MPCReportingPlaybackObserver_recordPlayActivityEvents_forEventSource___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

uint64_t __72__MPCReportingPlaybackObserver_recordPlayActivityEvents_forEventSource___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "playActivityEvent");
}

void __52__MPCReportingPlaybackObserver_newPlayActivityEvent__block_invoke()
{
  uint64_t v0;
  void *v1;
  int v2;
  void *v3;

  v3 = (void *)MGCopyAnswer();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Beta")) & 1) != 0)
  {
    v0 = 3;
LABEL_5:
    v1 = v3;
    goto LABEL_6;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Internal")) & 1) != 0)
  {
    v0 = 4;
    goto LABEL_5;
  }
  v2 = objc_msgSend(v3, "isEqualToString:", CFSTR("Carrier"));
  v1 = v3;
  if (!v2)
    goto LABEL_7;
  v0 = 2;
LABEL_6:
  newPlayActivityEvent_systemReleaseType = v0;
LABEL_7:

}

uint64_t __71__MPCReportingPlaybackObserver_environmentMonitorDidChangeNetworkType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "networkType");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = result == 0;
  return result;
}

+ (MPCReportingPlaybackObserver)sharedReportingPlaybackObserver
{
  if (sharedReportingPlaybackObserver_sSharedReportingPlaybackObserverOnceToken != -1)
    dispatch_once(&sharedReportingPlaybackObserver_sSharedReportingPlaybackObserverOnceToken, &__block_literal_global_19221);
  return (MPCReportingPlaybackObserver *)(id)sharedReportingPlaybackObserver_sSharedReportingPlaybackObserver;
}

void __63__MPCReportingPlaybackObserver_sharedReportingPlaybackObserver__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[MPCReportingPlaybackObserver _init]([MPCReportingPlaybackObserver alloc], "_init");
  v1 = (void *)sharedReportingPlaybackObserver_sSharedReportingPlaybackObserver;
  sharedReportingPlaybackObserver_sSharedReportingPlaybackObserver = (uint64_t)v0;

}

@end
