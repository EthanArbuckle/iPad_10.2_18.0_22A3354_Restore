@implementation MPCLyricsReportingController

- (void)recordLyricsViewEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  MPCReportingPlaybackEventSource *v7;
  _BOOL4 v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  MPCReportingPlaybackEnvironmentPropertiesLoader *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  void *v46;
  void *v47;
  NSObject *v48;
  objc_class *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  id v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  double v81;
  __int16 v82;
  void *v83;
  _QWORD v84[3];

  v84[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "modelSong");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lyrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasStoreLyrics");

  v7 = (MPCReportingPlaybackEventSource *)os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
  v8 = os_log_type_enabled(&v7->super, OS_LOG_TYPE_INFO);
  if ((v6 & 1) != 0)
  {
    v66 = v4;
    if (v8)
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "modelSong");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "identifiers");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "universalStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "subscriptionAdamID");
      objc_msgSend(v3, "modelSong");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "universalStore");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "adamID");
      v17 = objc_msgSend(v3, "displayType");
      objc_msgSend(v3, "visibleDuration");
      *(float *)&v18 = v18;
      *(_DWORD *)buf = 138544642;
      v71 = v10;
      v72 = 2048;
      v73 = v3;
      v74 = 2048;
      v75 = v12;
      v76 = 2048;
      v77 = v16;
      v78 = 2048;
      v79 = v17;
      v80 = 2048;
      v81 = *(float *)&v18;
      _os_log_impl(&dword_210BD8000, &v7->super, OS_LOG_TYPE_INFO, "Beginning report for <%{public}@: %p, (subscriptionAdamId=%lld, adamId=%lld) type=%ld, dur=%f>", buf, 0x3Eu);

      v4 = v66;
    }

    v7 = objc_alloc_init(MPCReportingPlaybackEventSource);
    +[MPCPlaybackRequestEnvironment activeAccountRequestEnvironment](MPCPlaybackRequestEnvironment, "activeAccountRequestEnvironment");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[MPCReportingPlaybackEnvironmentPropertiesLoader initWithPlaybackRequestEnvironment:]([MPCReportingPlaybackEnvironmentPropertiesLoader alloc], "initWithPlaybackRequestEnvironment:", v64);
    -[MPCReportingPlaybackEventSource setIdentityPropertiesLoader:](v7, "setIdentityPropertiesLoader:", v19);
    v20 = objc_alloc(MEMORY[0x24BDDC890]);
    objc_msgSend(MEMORY[0x24BDDC758], "emptyIdentifierSet");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = MEMORY[0x24BDAC760];
    v68[1] = 3221225472;
    v68[2] = __54__MPCLyricsReportingController_recordLyricsViewEvent___block_invoke;
    v68[3] = &unk_24CABA0E0;
    v22 = v4;
    v69 = v22;
    v23 = (void *)objc_msgSend(v20, "initWithIdentifiers:block:", v21, v68);
    -[MPCReportingPlaybackEventSource setItemGenericObject:](v7, "setItemGenericObject:", v23);

    objc_msgSend(v3, "modelPlayEvent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCReportingPlaybackEventSource setModelPlayEvent:](v7, "setModelPlayEvent:", v24);

    objc_msgSend(v3, "featureName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCReportingPlaybackEventSource setFeatureName:](v7, "setFeatureName:", v25);

    objc_msgSend(v3, "recommendationData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCReportingPlaybackEventSource setRecommendationData:](v7, "setRecommendationData:", v26);

    objc_msgSend(v3, "lyricsID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v3, "lyricsID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCReportingPlaybackEventSource setLyricsID:](v7, "setLyricsID:", v28);
    }
    else
    {
      objc_msgSend(v22, "lyrics");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "identifiers");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "lyricsID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCReportingPlaybackEventSource setLyricsID:](v7, "setLyricsID:", v40);

    }
    +[MPCReportingPlaybackObserver sharedReportingPlaybackObserver](MPCReportingPlaybackObserver, "sharedReportingPlaybackObserver");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v41, "newPlayActivityEvent");

    objc_msgSend(v42, "setEventType:", 2);
    objc_msgSend(v3, "visibleDuration");
    objc_msgSend(v42, "setItemEndTime:");
    objc_msgSend(v42, "setLyricsDisplayedCharacterCount:", objc_msgSend(v3, "displayedCharacterCount"));
    objc_msgSend(v3, "language");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setLyricsLanguage:", v43);

    objc_msgSend(v42, "setContinuityCameraUsed:", objc_msgSend(v3, "continuityCameraUsed"));
    objc_msgSend(v42, "setSourceType:", 2 * (objc_msgSend(v3, "sourceType") == 1));
    v44 = objc_msgSend(v3, "displayType");
    if (v44 < 3)
      v45 = v44 + 1;
    else
      v45 = 0;
    objc_msgSend(v42, "setDisplayType:", v45);
    +[MPCReportingPlaybackObserver sharedReportingPlaybackObserver](MPCReportingPlaybackObserver, "sharedReportingPlaybackObserver");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = v42;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "recordPlayActivityEvents:forEventSource:", v47, v7);

    v48 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      v49 = (objc_class *)objc_opt_class();
      NSStringFromClass(v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "modelSong");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "identifiers");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "universalStore");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v58, "subscriptionAdamID");
      objc_msgSend(v3, "modelSong");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "identifiers");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "universalStore");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "adamID");
      v54 = objc_msgSend(v3, "displayType");
      objc_msgSend(v3, "visibleDuration");
      *(float *)&v55 = v55;
      *(_DWORD *)buf = 138544898;
      v71 = v50;
      v72 = 2048;
      v73 = v3;
      v74 = 2048;
      v75 = v56;
      v76 = 2048;
      v77 = v53;
      v78 = 2048;
      v79 = v54;
      v80 = 2048;
      v81 = *(float *)&v55;
      v82 = 2048;
      v83 = v42;
      _os_log_impl(&dword_210BD8000, v48, OS_LOG_TYPE_INFO, "Reported <%{public}@: %p, (subscriptionAdamId=%lld, adamId=%lld) type=%ld, dur=%f> with playActivityEvent: %p", buf, 0x48u);

      v4 = v66;
    }

  }
  else if (v8)
  {
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "modelSong");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "identifiers");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "universalStore");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "subscriptionAdamID");
    objc_msgSend(v3, "modelSong");
    v67 = v4;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "identifiers");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "universalStore");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "adamID");
    v37 = objc_msgSend(v3, "displayType");
    objc_msgSend(v3, "visibleDuration");
    *(float *)&v38 = v38;
    *(_DWORD *)buf = 138544642;
    v71 = v30;
    v72 = 2048;
    v73 = v3;
    v74 = 2048;
    v75 = v32;
    v76 = 2048;
    v77 = v36;
    v78 = 2048;
    v79 = v37;
    v80 = 2048;
    v81 = *(float *)&v38;
    _os_log_impl(&dword_210BD8000, &v7->super, OS_LOG_TYPE_INFO, "Not reporting non store lyrics event for <%{public}@: %p, (subscriptionAdamId=%lld, adamId=%lld) type=%ld, dur=%f>", buf, 0x3Eu);

    v4 = v67;
  }

}

uint64_t __54__MPCLyricsReportingController_recordLyricsViewEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSong:", *(_QWORD *)(a1 + 32));
}

@end
