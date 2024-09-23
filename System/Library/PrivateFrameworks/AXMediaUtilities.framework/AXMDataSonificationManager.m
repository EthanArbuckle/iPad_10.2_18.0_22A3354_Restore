@implementation AXMDataSonificationManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AXMDataSonificationManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager__SharedSonificationManager;
}

void __43__AXMDataSonificationManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager__SharedSonificationManager;
  sharedManager__SharedSonificationManager = (uint64_t)v1;

  if ((AXDeviceIsAudioAccessory() & 1) == 0)
  {
    +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addPlaybackObserver:", sharedManager__SharedSonificationManager);

  }
}

- (AXMDataSonificationManager)init
{
  AXMDataSonificationManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dataSonifierAccessQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXMDataSonificationManager;
  v2 = -[AXMDataSonificationManager init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.accessibility.vot.DataSonifierAccess", 0);
    dataSonifierAccessQueue = v2->_dataSonifierAccessQueue;
    v2->_dataSonifierAccessQueue = (OS_dispatch_queue *)v3;

    v2->_hapticsEnabled = 1;
  }
  return v2;
}

- (void)beginLiveModeSession
{
  id v2;

  +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginLiveContinuousToneSession");

}

- (void)endLiveModeSession
{
  id v2;

  +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endLiveContinuousToneSession");

}

- (void)setLiveModeValue:(double)a3
{
  id v4;

  +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLiveContinuousToneNormalizedFrequency:", a3);

}

- (void)setCurrentChartDescriptor:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_currentChartDescriptor, a3);
  v5 = a3;
  +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurrentChartDescriptor:", self->_currentChartDescriptor);

  +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "renderSonification");
}

- (BOOL)isPlaying
{
  NSObject *dataSonifierAccessQueue;
  char v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dataSonifierAccessQueue = self->_dataSonifierAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__AXMDataSonificationManager_isPlaying__block_invoke;
  block[3] = &unk_1E625C4E8;
  block[4] = &v6;
  dispatch_sync(dataSonifierAccessQueue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __39__AXMDataSonificationManager_isPlaying__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isPlaying"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "isInLiveContinuousToneSession");

  }
}

- (BOOL)isPaused
{
  NSObject *dataSonifierAccessQueue;
  char v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dataSonifierAccessQueue = self->_dataSonifierAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AXMDataSonificationManager_isPaused__block_invoke;
  block[3] = &unk_1E625C4E8;
  block[4] = &v6;
  dispatch_sync(dataSonifierAccessQueue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __38__AXMDataSonificationManager_isPaused__block_invoke(uint64_t a1)
{
  id v2;

  +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "isPaused");

}

- (BOOL)isScrubbing
{
  NSObject *dataSonifierAccessQueue;
  char v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dataSonifierAccessQueue = self->_dataSonifierAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__AXMDataSonificationManager_isScrubbing__block_invoke;
  block[3] = &unk_1E625C4E8;
  block[4] = &v6;
  dispatch_sync(dataSonifierAccessQueue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __41__AXMDataSonificationManager_isScrubbing__block_invoke(uint64_t a1)
{
  id v2;

  +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "isScrubbing");

}

- (double)currentPlaybackPosition
{
  NSObject *dataSonifierAccessQueue;
  double v3;
  _QWORD block[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  dataSonifierAccessQueue = self->_dataSonifierAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__AXMDataSonificationManager_currentPlaybackPosition__block_invoke;
  block[3] = &unk_1E625C4E8;
  block[4] = &v6;
  dispatch_sync(dataSonifierAccessQueue, block);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __53__AXMDataSonificationManager_currentPlaybackPosition__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPlaybackPosition");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;

}

- (void)play
{
  dispatch_sync((dispatch_queue_t)self->_dataSonifierAccessQueue, &__block_literal_global_23);
}

void __34__AXMDataSonificationManager_play__block_invoke()
{
  id v0;

  +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "play");

}

- (void)pause
{
  dispatch_sync((dispatch_queue_t)self->_dataSonifierAccessQueue, &__block_literal_global_19);
}

void __35__AXMDataSonificationManager_pause__block_invoke()
{
  id v0;

  +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pause");

}

- (void)stopPlaying
{
  dispatch_sync((dispatch_queue_t)self->_dataSonifierAccessQueue, &__block_literal_global_20);
}

void __41__AXMDataSonificationManager_stopPlaying__block_invoke()
{
  id v0;

  +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stopPlaying");

}

- (void)beginScrubbingSession
{
  -[AXMDataSonificationManager setLastScrubbingValueAnnouncementPosition:](self, "setLastScrubbingValueAnnouncementPosition:", 1.79769313e308);
  dispatch_sync((dispatch_queue_t)self->_dataSonifierAccessQueue, &__block_literal_global_21);
}

void __51__AXMDataSonificationManager_beginScrubbingSession__block_invoke()
{
  id v0;

  +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "beginScrubbing");

}

- (void)scrubToPosition:(double)a3
{
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *dataSonifierAccessQueue;
  _QWORD block[5];
  _QWORD v19[6];

  -[AXMDataSonificationManager currentPlaybackPosition](self, "currentPlaybackPosition");
  v6 = vabdd_f64(a3, v5);
  -[AXMDataSonificationManager lastScrubbingValueAnnouncementPosition](self, "lastScrubbingValueAnnouncementPosition");
  if (vabdd_f64(a3, v7) > 0.1)
  {
    -[AXMDataSonificationManager stopSpeaking](self, "stopSpeaking");
    +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "masterVolume");
    v10 = v9;

    if (v10 < 1.0)
    {
      +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setMasterVolume:fadeDuration:", 1.0, 0.5);

    }
  }
  v12 = MEMORY[0x1E0C809B0];
  if (v6 >= 0.025
    || (-[AXMDataSonificationManager lastScrubbingValueAnnouncementPosition](self, "lastScrubbingValueAnnouncementPosition"), vabdd_f64(v13, a3) <= 0.025))
  {
    -[AXMDataSonificationManager scrubbingValueAnnouncementTimer](self, "scrubbingValueAnnouncementTimer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invalidate");

    -[AXMDataSonificationManager setScrubbingValueAnnouncementTimer:](self, "setScrubbingValueAnnouncementTimer:", 0);
  }
  else
  {
    -[AXMDataSonificationManager scrubbingValueAnnouncementTimer](self, "scrubbingValueAnnouncementTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "invalidate");

    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __46__AXMDataSonificationManager_scrubToPosition___block_invoke;
    v19[3] = &unk_1E625EA80;
    v19[4] = self;
    *(double *)&v19[5] = a3;
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v19, 0.5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDataSonificationManager setScrubbingValueAnnouncementTimer:](self, "setScrubbingValueAnnouncementTimer:", v15);

  }
  -[AXMDataSonificationManager setLastPlayheadPosition:](self, "setLastPlayheadPosition:", a3);
  dataSonifierAccessQueue = self->_dataSonifierAccessQueue;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __46__AXMDataSonificationManager_scrubToPosition___block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  *(double *)&block[4] = a3;
  dispatch_sync(dataSonifierAccessQueue, block);
}

uint64_t __46__AXMDataSonificationManager_scrubToPosition___block_invoke(uint64_t a1)
{
  void *v2;

  +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMasterVolume:fadeDuration:", 0.4, 0.5);

  objc_msgSend(*(id *)(a1 + 32), "announceValueForPlayheadPosition");
  return objc_msgSend(*(id *)(a1 + 32), "setLastScrubbingValueAnnouncementPosition:", *(double *)(a1 + 40));
}

void __46__AXMDataSonificationManager_scrubToPosition___block_invoke_2(uint64_t a1)
{
  id v2;

  +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPlaybackPosition:", *(double *)(a1 + 32));

}

- (void)endScrubbingSession
{
  dispatch_sync((dispatch_queue_t)self->_dataSonifierAccessQueue, &__block_literal_global_24);
}

void __49__AXMDataSonificationManager_endScrubbingSession__block_invoke()
{
  void *v0;
  id v1;

  +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "endScrubbing");

  +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setMasterVolume:", 1.0);

}

- (void)setCurrentSeriesIndex:(int64_t)a3
{
  NSObject *dataSonifierAccessQueue;
  _QWORD block[5];

  dataSonifierAccessQueue = self->_dataSonifierAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AXMDataSonificationManager_setCurrentSeriesIndex___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_sync(dataSonifierAccessQueue, block);
}

void __52__AXMDataSonificationManager_setCurrentSeriesIndex___block_invoke(uint64_t a1)
{
  id v2;

  +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCurrentSeriesIndex:", *(_QWORD *)(a1 + 32));

}

- (int64_t)currentSeriesIndex
{
  void *v2;
  int64_t v3;

  +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentSeriesIndex");

  return v3;
}

- (id)categoryNameForXAxisPosition:(double)a3
{
  return 0;
}

- (unint64_t)playbackStatus
{
  void *v3;
  int v4;

  if (-[AXMDataSonificationManager isScrubbing](self, "isScrubbing"))
  {
    +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEndingScrubbing");

    if (!v4)
      return 3;
  }
  if (-[AXMDataSonificationManager isPlaying](self, "isPlaying"))
    return 1;
  if (-[AXMDataSonificationManager isPaused](self, "isPaused"))
    return 2;
  return 0;
}

- (id)valueDescriptionForPlayheadPosition
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  double v29;
  unint64_t v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  unint64_t v54;
  double v55;
  double v56;
  double v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t i;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t j;
  void *v87;
  void *v88;
  double v89;
  double v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  id obj;
  id obja;
  void *v120;
  void *v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  void *v145;
  _BYTE v146[128];
  _BYTE v147[128];
  _QWORD v148[3];

  v148[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPlaybackPosition");
  v6 = v5;

  if (-[AXMDataSonificationManager currentSeriesIndex](self, "currentSeriesIndex") < 1)
  {
    v106 = 0;
  }
  else
  {
    -[AXMDataSonificationManager currentChartDescriptor](self, "currentChartDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "series");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", -[AXMDataSonificationManager currentSeriesIndex](self, "currentSeriesIndex") - 1);
    v106 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[AXMDataSonificationManager currentChartDescriptor](self, "currentChartDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "xAxis");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isCategoricalAxis");

  if (!v11)
  {
    if (v106)
    {
      v145 = v106;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v145, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[AXMDataSonificationManager currentChartDescriptor](self, "currentChartDescriptor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "series");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[AXMDataSonificationManager currentChartDescriptor](self, "currentChartDescriptor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "xAxis");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v47, "upperBound");
    v49 = v48;
    objc_msgSend(v47, "lowerBound");
    v51 = v50;
    objc_msgSend(v47, "lowerBound");
    v53 = v52;
    v130 = 0u;
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    v17 = v15;
    v115 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v130, v144, 16);
    if (!v115)
    {
      v18 = 0;
      v13 = v17;
      goto LABEL_78;
    }
    v54 = 0;
    v55 = v49 - v51;
    v56 = v53 + v6 * (v49 - v51);
    v109 = v47;
    v111 = *(_QWORD *)v131;
    v57 = v55 * 0.05;
    obja = v17;
    v113 = v3;
LABEL_37:
    v58 = 0;
    while (1)
    {
      v59 = v3;
      if (*(_QWORD *)v131 != v111)
        objc_enumerationMutation(v17);
      v60 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * v58);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "name");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "name");
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      if (v63)
      {
        v121 = v62;
      }
      else
      {
        v64 = objc_msgSend(v17, "indexOfObject:", v60);
        v65 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("audiograph.series.number"), &stru_1E6260C18, CFSTR("Accessibility"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = v65;
        v17 = obja;
        objc_msgSend(v68, "localizedStringWithFormat:", v67, v64);
        v69 = objc_claimAutoreleasedReturnValue();

        v121 = (void *)v69;
      }
      v3 = v59;
      if (objc_msgSend(v60, "isContinuous"))
      {
        v128 = 0uLL;
        v129 = 0uLL;
        v126 = 0uLL;
        v127 = 0uLL;
        objc_msgSend(v60, "dataPoints");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v126, v143, 16);
        if (!v71)
          goto LABEL_69;
        v72 = v71;
        v117 = v58;
        v73 = 0;
        v74 = *(_QWORD *)v127;
        do
        {
          for (i = 0; i != v72; ++i)
          {
            v76 = v73;
            if (*(_QWORD *)v127 != v74)
              objc_enumerationMutation(v70);
            v77 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * i);
            if (v76)
            {
              objc_msgSend(v76, "xValue");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "number");
              if (v56 <= v79)
              {

              }
              else
              {
                objc_msgSend(v77, "xValue");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "number");
                v82 = v81;

                if (v56 < v82)
                {
                  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v94, "localizedStringForKey:value:table:", CFSTR("audiograph.datapoint"), &stru_1E6260C18, CFSTR("Accessibility"));
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v61, "addObject:", v95);

                  objc_msgSend(v76, "valueDescription");
                  v96 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v61, "addObject:", v96);

                  ++v54;
                  goto LABEL_67;
                }
              }
            }
            v73 = v77;

          }
          v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v126, v143, 16);
        }
        while (v72);
        v76 = v73;
LABEL_67:

        v3 = v113;
      }
      else
      {
        v124 = 0uLL;
        v125 = 0uLL;
        v122 = 0uLL;
        v123 = 0uLL;
        objc_msgSend(v60, "dataPoints");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v122, v142, 16);
        if (!v83)
          goto LABEL_69;
        v84 = v83;
        v117 = v58;
        v85 = *(_QWORD *)v123;
        do
        {
          for (j = 0; j != v84; ++j)
          {
            if (*(_QWORD *)v123 != v85)
              objc_enumerationMutation(v70);
            v87 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * j);
            objc_msgSend(v87, "xValue");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "number");
            v90 = v89;

            if (vabdd_f64(v90, v56) < v57)
            {
              objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "localizedStringForKey:value:table:", CFSTR("audiograph.datapoint"), &stru_1E6260C18, CFSTR("Accessibility"));
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "addObject:", v92);

              objc_msgSend(v87, "valueDescription");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "addObject:", v93);

              ++v54;
            }
          }
          v84 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v122, v142, 16);
        }
        while (v84);
      }
      v58 = v117;
      v17 = obja;
LABEL_69:

      if ((unint64_t)objc_msgSend(v17, "count") >= 2 && objc_msgSend(v61, "count"))
        objc_msgSend(v61, "insertObject:atIndex:", v121, 0);
      objc_msgSend(v3, "addObjectsFromArray:", v61);

      if (++v58 == v115)
      {
        v115 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v130, v144, 16);
        if (!v115)
        {
          v13 = v17;
          v18 = v54;
          v47 = v109;
          goto LABEL_78;
        }
        goto LABEL_37;
      }
    }
  }
  -[AXMDataSonificationManager currentChartDescriptor](self, "currentChartDescriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "xAxis");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v106)
  {
    v148[0] = v106;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v148, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AXMDataSonificationManager currentChartDescriptor](self, "currentChartDescriptor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "series");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  v17 = v14;
  v110 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v138, v147, 16);
  if (v110)
  {
    obj = v17;
    v18 = 0;
    v107 = *(_QWORD *)v139;
    v108 = v13;
    v112 = v3;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v139 != v107)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * v19);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          v23 = objc_msgSend(obj, "indexOfObject:", v20);
          v24 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("audiograph.series.number"), &stru_1E6260C18, CFSTR("Accessibility"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "localizedStringWithFormat:", v26, v23);
          v27 = objc_claimAutoreleasedReturnValue();

          v21 = (void *)v27;
        }
        if ((unint64_t)objc_msgSend(obj, "count") >= 2)
          objc_msgSend(v120, "addObject:", v21);
        objc_msgSend(v13, "categoryOrder");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 1.0 / (double)(unint64_t)objc_msgSend(v28, "count");

        v30 = vcvtmd_s64_f64(v6 / v29);
        objc_msgSend(v13, "categoryOrder");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "count");

        v116 = v19;
        if (v32 <= v30)
        {
          v34 = 0;
        }
        else
        {
          objc_msgSend(v13, "categoryOrder");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectAtIndexedSubscript:", v30);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v136 = 0u;
        v137 = 0u;
        v134 = 0u;
        v135 = 0u;
        objc_msgSend(v20, "dataPoints");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v134, v146, 16);
        v114 = v21;
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v135;
          do
          {
            for (k = 0; k != v37; ++k)
            {
              if (*(_QWORD *)v135 != v38)
                objc_enumerationMutation(v35);
              v40 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * k);
              objc_msgSend(v40, "xValue");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "category");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v42, "isEqualToString:", v34);

              if (v43)
              {
                objc_msgSend(v40, "valueDescription");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v120, "addObject:", v44);

                ++v18;
              }
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v134, v146, 16);
          }
          while (v37);
        }

        v3 = v112;
        objc_msgSend(v112, "addObjectsFromArray:", v120);

        v19 = v116 + 1;
        v13 = v108;
      }
      while (v116 + 1 != v110);
      v110 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v138, v147, 16);
    }
    while (v110);
    v17 = obj;
  }
  else
  {
    v18 = 0;
  }
  v47 = v17;
LABEL_78:

  if (v18 < 2)
  {
    v100 = 0;
  }
  else
  {
    v97 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "localizedStringForKey:value:table:", CFSTR("audiograph.datapoints.count"), &stru_1E6260C18, CFSTR("Accessibility"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "localizedStringWithFormat:", v99, v18);
    v100 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v101;
  if (v100)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@"), v100, v101);
    v103 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v103 = v101;
  }
  v104 = v103;

  return v104;
}

- (AXMChartDescriptor)currentChartDescriptor
{
  void *v2;
  void *v3;

  +[AXMDataSonifier sharedInstance](AXMDataSonifier, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentChartDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AXMChartDescriptor *)v3;
}

- (BOOL)hapticsEnabled
{
  return self->_hapticsEnabled;
}

- (void)setHapticsEnabled:(BOOL)a3
{
  self->_hapticsEnabled = a3;
}

- (double)lastPlayheadPosition
{
  return self->_lastPlayheadPosition;
}

- (void)setLastPlayheadPosition:(double)a3
{
  self->_lastPlayheadPosition = a3;
}

- (NSArray)xGridlinePositions
{
  return self->_xGridlinePositions;
}

- (NSArray)xCategoryLabels
{
  return self->_xCategoryLabels;
}

- (AXMDataSummary)dataSeriesSummary
{
  return self->_dataSeriesSummary;
}

- (void)setDataSeriesSummary:(id)a3
{
  objc_storeStrong((id *)&self->_dataSeriesSummary, a3);
}

- (BOOL)isDataSeriesRegressionModelLoaded
{
  return self->_isDataSeriesRegressionModelLoaded;
}

- (double)lastScrubbingValueAnnouncementPosition
{
  return self->_lastScrubbingValueAnnouncementPosition;
}

- (void)setLastScrubbingValueAnnouncementPosition:(double)a3
{
  self->_lastScrubbingValueAnnouncementPosition = a3;
}

- (NSTimer)scrubbingValueAnnouncementTimer
{
  return self->_scrubbingValueAnnouncementTimer;
}

- (void)setScrubbingValueAnnouncementTimer:(id)a3
{
  objc_storeStrong((id *)&self->_scrubbingValueAnnouncementTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrubbingValueAnnouncementTimer, 0);
  objc_storeStrong((id *)&self->_dataSeriesSummary, 0);
  objc_storeStrong((id *)&self->_xCategoryLabels, 0);
  objc_storeStrong((id *)&self->_xGridlinePositions, 0);
  objc_storeStrong((id *)&self->_currentChartDescriptor, 0);
  objc_storeStrong((id *)&self->_dataSonifierAccessQueue, 0);
}

@end
