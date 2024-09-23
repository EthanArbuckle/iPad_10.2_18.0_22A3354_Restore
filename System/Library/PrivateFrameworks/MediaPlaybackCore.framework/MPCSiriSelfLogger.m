@implementation MPCSiriSelfLogger

+ (void)sendMetrics:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  BOOL v40;
  void *v41;
  void *v42;
  BOOL v43;
  void *v44;
  void *v45;
  BOOL v46;
  void *v47;
  void *v48;
  BOOL v49;
  void *v50;
  void *v51;
  void *v52;
  objc_class *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  void *v61;
  void *v62;
  int v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  unint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  uint64_t v95;
  id v96;
  void *v97;
  uint64_t v98;
  void *v99;
  id v100;
  void *v101;
  uint64_t v102;
  void *v103;
  double v104;
  void *v105;
  double v106;
  void *v107;
  double v108;
  void *v109;
  double v110;
  void *v111;
  double v112;
  void *v113;
  double v114;
  id v115;
  void *v116;
  void *v117;
  uint64_t v118;
  id v119;
  void *v120;
  uint64_t v121;
  NSObject *v122;
  NSObject *v123;
  NSObject *v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t v131;
  _BYTE buf[24];
  void *v133;
  uint64_t *v134;
  uint64_t v135;

  v135 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "siriRefId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  v8 = os_signpost_id_make_with_pointer(v7, v6);

  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SELFLoggerSendMetrics", ", buf, 2u);
  }

  v128 = 0;
  v129 = &v128;
  v130 = 0x2050000000;
  v11 = (void *)getSASelfLoggerClass_softClass;
  v131 = getSASelfLoggerClass_softClass;
  if (!getSASelfLoggerClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getSASelfLoggerClass_block_invoke;
    v133 = &unk_24CAB9A48;
    v134 = &v128;
    __getSASelfLoggerClass_block_invoke((uint64_t)buf);
    v11 = (void *)v129[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v128, 8);
  v13 = objc_alloc_init(v12);
  objc_msgSend(v13, "getSiriRequestUUIDFor:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "siriRefId");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPCSiriSelfLogger.m"), 233, CFSTR("MPCSiriSelfLogger: siriReferenceIdentifier is not recognized by SASelfLogger: %@"), v127);

  }
  objc_msgSend(v13, "emitVMCPUStatsWithStage:requestId:", 5, v14);
  objc_msgSend(v5, "checkpointMRSetQueueBegin");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (!v16)
  {
    objc_msgSend(v5, "checkpointMRSetQueueBegin");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 3, v14, objc_msgSend(v17, "longLongValue"));

  }
  objc_msgSend(v5, "checkpointRateZero");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18 == 0;

  if (!v19)
  {
    objc_msgSend(v5, "checkpointRateZero");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 4, v14, objc_msgSend(v20, "longLongValue"));

  }
  objc_msgSend(v5, "checkpointSetQueueBegin");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21 == 0;

  if (!v22)
  {
    objc_msgSend(v5, "checkpointSetQueueBegin");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 26, v14, objc_msgSend(v23, "longLongValue"));

  }
  objc_msgSend(v5, "checkpointSetQueueEnd");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24 == 0;

  if (!v25)
  {
    objc_msgSend(v5, "checkpointSetQueueEnd");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 6, v14, objc_msgSend(v26, "longLongValue"));

  }
  objc_msgSend(v5, "checkpointMRPlay");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27 == 0;

  if (!v28)
  {
    objc_msgSend(v5, "checkpointMRPlay");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 19, v14, objc_msgSend(v29, "longLongValue"));

  }
  objc_msgSend(v5, "checkpointAssetLoadBegin");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30 == 0;

  if (!v31)
  {
    objc_msgSend(v5, "checkpointAssetLoadBegin");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 7, v14, objc_msgSend(v32, "longLongValue"));

  }
  objc_msgSend(v5, "checkpointAssetLoadEnd");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33 == 0;

  if (!v34)
  {
    objc_msgSend(v5, "checkpointAssetLoadEnd");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 8, v14, objc_msgSend(v35, "longLongValue"));

  }
  objc_msgSend(v5, "checkpointLikelyToKeepUp");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36 == 0;

  if (!v37)
  {
    objc_msgSend(v5, "checkpointLikelyToKeepUp");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 14, v14, objc_msgSend(v38, "longLongValue"));

  }
  objc_msgSend(v5, "checkpointReadyToPlay");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39 == 0;

  if (!v40)
  {
    objc_msgSend(v5, "checkpointReadyToPlay");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 15, v14, objc_msgSend(v41, "longLongValue"));

  }
  objc_msgSend(v5, "checkpointPlay");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42 == 0;

  if (!v43)
  {
    objc_msgSend(v5, "checkpointPlay");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 27, v14, objc_msgSend(v44, "longLongValue"));

  }
  objc_msgSend(v5, "checkpointRateOne");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45 == 0;

  if (!v46)
  {
    objc_msgSend(v5, "checkpointRateOne");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 20, v14, objc_msgSend(v47, "longLongValue"));

  }
  objc_msgSend(v5, "checkpointFirstAudioFrame");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48 == 0;

  if (!v49)
  {
    objc_msgSend(v5, "checkpointFirstAudioFrame");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 28, v14, objc_msgSend(v50, "longLongValue"));

    objc_msgSend(v5, "checkpointFirstAudioFrame");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "emitMWTCheckPointWithMwtCheckpoint:requestId:timeStamp:", 25, v14, objc_msgSend(v51, "longLongValue"));

  }
  v128 = 0;
  v129 = &v128;
  v130 = 0x2050000000;
  v52 = (void *)getSASelfLoggerMWTMusicMetadataClass_softClass;
  v131 = getSASelfLoggerMWTMusicMetadataClass_softClass;
  if (!getSASelfLoggerMWTMusicMetadataClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getSASelfLoggerMWTMusicMetadataClass_block_invoke;
    v133 = &unk_24CAB9A48;
    v134 = &v128;
    __getSASelfLoggerMWTMusicMetadataClass_block_invoke((uint64_t)buf);
    v52 = (void *)v129[3];
  }
  v53 = objc_retainAutorelease(v52);
  _Block_object_dispose(&v128, 8);
  v54 = objc_alloc_init(v53);
  objc_msgSend(v5, "isShuffled");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setIsShuffled:", objc_msgSend(v55, "BOOLValue"));

  v56 = v5;
  objc_msgSend(v56, "assetType");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "integerValue");

  if ((unint64_t)(v58 - 1) > 4)
    v59 = 0;
  else
    v59 = dword_210ED93D0[v58 - 1];

  objc_msgSend(v54, "setStreamingContentType:", v59);
  v60 = v56;
  objc_msgSend(v60, "formatInfo");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("codec"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "integerValue");

  if (v63 > 1634492790)
  {
    if (v63 > 1835623528)
    {
      if (v63 > 1935767393)
      {
        if (v63 <= 1953986160)
        {
          if (v63 == 1935767394)
          {
            v64 = 32;
            goto LABEL_125;
          }
          if (v63 == 1953066341)
          {
            v64 = 19;
            goto LABEL_125;
          }
        }
        else
        {
          switch(v63)
          {
            case 1953986161:
              v64 = 8;
              goto LABEL_125;
            case 1970037111:
              v64 = 11;
              goto LABEL_125;
            case 1970495843:
              v64 = 30;
              goto LABEL_125;
          }
        }
      }
      else if (v63 <= 1836253232)
      {
        if (v63 == 1835623529)
        {
          v64 = 20;
          goto LABEL_125;
        }
        if (v63 == 1836253201)
        {
          v64 = 35;
          goto LABEL_125;
        }
      }
      else
      {
        switch(v63)
        {
          case 1836253233:
            v64 = 36;
            goto LABEL_125;
          case 1869641075:
            v64 = 40;
            goto LABEL_125;
          case 1935764850:
            v64 = 31;
            goto LABEL_125;
        }
      }
    }
    else if (v63 > 1718378850)
    {
      if (v63 <= 1768710754)
      {
        if (v63 == 1718378851)
        {
          v64 = 39;
          goto LABEL_125;
        }
        if (v63 == 1752594531)
        {
          v64 = 7;
          goto LABEL_125;
        }
      }
      else
      {
        switch(v63)
        {
          case 1768710755:
            v64 = 34;
            goto LABEL_125;
          case 1768775988:
            v64 = 4;
            goto LABEL_125;
          case 1819304813:
            v64 = 1;
            goto LABEL_125;
        }
      }
    }
    else if (v63 <= 1667326770)
    {
      if (v63 == 1634492791)
      {
        v64 = 12;
        goto LABEL_125;
      }
      if (v63 == 1634760307)
      {
        v64 = 21;
        goto LABEL_125;
      }
    }
    else
    {
      switch(v63)
      {
        case 1667326771:
          v64 = 3;
          goto LABEL_125;
        case 1667591280:
          v64 = 6;
          goto LABEL_125;
        case 1700998451:
          v64 = 38;
          goto LABEL_125;
      }
    }
    goto LABEL_124;
  }
  if (v63 <= 1633772388)
  {
    if (v63 > 1296122677)
    {
      if (v63 <= 1363430722)
      {
        if (v63 == 1296122678)
        {
          v64 = 10;
          goto LABEL_125;
        }
        if (v63 == 1363430706)
        {
          v64 = 14;
          goto LABEL_125;
        }
      }
      else
      {
        switch(v63)
        {
          case 1363430723:
            v64 = 13;
            goto LABEL_125;
          case 1365470320:
            v64 = 15;
            goto LABEL_125;
          case 1633772320:
            v64 = 5;
            goto LABEL_125;
        }
      }
    }
    else if (v63 <= 778924082)
    {
      if (v63 == 778924081)
      {
        v64 = 16;
        goto LABEL_125;
      }
      if (v63 == 778924082)
      {
        v64 = 17;
        goto LABEL_125;
      }
    }
    else
    {
      switch(v63)
      {
        case 778924083:
          v64 = 18;
          goto LABEL_125;
        case 1096107074:
          v64 = 33;
          goto LABEL_125;
        case 1296122675:
          v64 = 9;
          goto LABEL_125;
      }
    }
    goto LABEL_124;
  }
  if (v63 > 1633889586)
  {
    switch(v63)
    {
      case 1633889587:
        v64 = 2;
        goto LABEL_125;
      case 1634038579:
        v64 = 37;
        goto LABEL_125;
      case 1634492771:
        v64 = 22;
        goto LABEL_125;
    }
LABEL_124:
    v64 = 0;
    goto LABEL_125;
  }
  switch(v63)
  {
    case 1633772389:
      v64 = 25;
      break;
    case 1633772390:
      v64 = 26;
      break;
    case 1633772391:
      v64 = 27;
      break;
    case 1633772392:
      v64 = 23;
      break;
    case 1633772396:
      v64 = 24;
      break;
    case 1633772400:
      v64 = 28;
      break;
    case 1633772403:
      v64 = 29;
      break;
    default:
      goto LABEL_124;
  }
LABEL_125:

  objc_msgSend(v54, "setFormatCodec:", v64);
  objc_msgSend(v60, "formatInfo");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("bitrate"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setFormatBitrate:", objc_msgSend(v66, "integerValue"));

  objc_msgSend(v60, "formatInfo");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("bitDepth"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setFormatBitDepth:", objc_msgSend(v68, "integerValue"));

  objc_msgSend(v60, "formatInfo");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("channelLayout"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setFormatChannels:", (unsigned __int16)objc_msgSend(v70, "integerValue"));

  objc_msgSend(v60, "formatInfo");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("sampleRate"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setFormatSampleRate:", objc_msgSend(v72, "integerValue"));

  v73 = v60;
  objc_msgSend(v73, "formatInfo");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("tier"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v75, "integerValue");

  if (v76 < 5)
    v77 = (v76 + 1);
  else
    v77 = 0;

  objc_msgSend(v54, "setFormatTier:", v77);
  objc_msgSend(v73, "hasAccountInfo");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setIsAccountDataReady:", objc_msgSend(v78, "BOOLValue"));

  objc_msgSend(v73, "hasOnlinePlaybackKeys");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setIsOnlineKeyReady:", objc_msgSend(v79, "BOOLValue"));

  objc_msgSend(v73, "hasOfflinePlaybackKeys");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setIsOfflineKeyReady:", objc_msgSend(v80, "BOOLValue"));

  objc_msgSend(v73, "isReplacingPlayback");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setIsInterruptingPlayback:", objc_msgSend(v81, "BOOLValue"));

  objc_msgSend(v73, "isRemoteSetQueue");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setIsRemoteSetQueue:", objc_msgSend(v82, "BOOLValue"));

  objc_msgSend(v73, "isDelegatedPlayback");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setIsDelegatedPlayback:", objc_msgSend(v83, "BOOLValue"));

  objc_msgSend(v73, "isAutoPlayEnabled");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setIsAutoPlay:", objc_msgSend(v84, "BOOLValue"));

  objc_msgSend(v73, "isFirstPlay");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setIsFirstPlayAfterAppLaunch:", objc_msgSend(v85, "BOOLValue"));

  objc_msgSend(v73, "isSharePlay");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setIsSharePlayPlayback:", objc_msgSend(v86, "BOOLValue"));

  v87 = v73;
  objc_msgSend(v87, "networkType");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v88, "integerValue");

  if (v89 > 99)
  {
    if (v89 > 1000)
    {
      if (v89 == 1001)
      {
        v90 = 13;
        goto LABEL_150;
      }
      if (v89 == 2000)
      {
        v90 = 14;
        goto LABEL_150;
      }
    }
    else
    {
      switch(v89)
      {
        case 100:
          v90 = 10;
          goto LABEL_150;
        case 500:
          v90 = 11;
          goto LABEL_150;
        case 1000:
          v90 = 12;
          goto LABEL_150;
      }
    }
LABEL_138:
    v90 = 0;
    goto LABEL_150;
  }
  v90 = 1;
  switch(v89)
  {
    case 0:
      break;
    case 1:
      v90 = 2;
      break;
    case 2:
      v90 = 3;
      break;
    case 3:
      v90 = 4;
      break;
    case 4:
      v90 = 5;
      break;
    case 5:
      v90 = 6;
      break;
    case 6:
      v90 = 7;
      break;
    case 7:
      v90 = 8;
      break;
    case 8:
      v90 = 9;
      break;
    default:
      goto LABEL_138;
  }
LABEL_150:

  objc_msgSend(v54, "setNetworkConnectionType:", v90);
  objc_msgSend(v87, "isActiveAccount");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setIsPrimaryUser:", objc_msgSend(v91, "BOOLValue"));

  objc_msgSend(v87, "errorSignature");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setErrorResolutionType:", v92);

  v93 = v87;
  objc_msgSend(v93, "assetSource");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v94, "integerValue");

  objc_msgSend(v54, "setAssetSource:", v95);
  v96 = v93;
  objc_msgSend(v96, "assetLocation");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v97, "integerValue");

  objc_msgSend(v54, "setAssetLocation:", v98);
  objc_msgSend(v96, "queueType");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setAudioQueueType:", v99);

  v100 = v96;
  objc_msgSend(v100, "endpointType");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = objc_msgSend(v101, "integerValue");

  objc_msgSend(v54, "setEndPointType:", v102);
  objc_msgSend(v100, "bagWaitTime");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "doubleValue");
  objc_msgSend(v54, "setHasBagWaitTime:", v104 > 0.0);

  objc_msgSend(v100, "leaseWaitTime");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "doubleValue");
  objc_msgSend(v54, "setHasLeaseWaitTime:", v106 > 0.0);

  objc_msgSend(v100, "lookupWaitTime");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "doubleValue");
  objc_msgSend(v54, "setHasLookupWaitTime:", v108 > 0.0);

  objc_msgSend(v100, "mediaRedownloadWaitTime");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "doubleValue");
  objc_msgSend(v54, "setHasMediaRedownloadWaitTime:", v110 > 0.0);

  objc_msgSend(v100, "subscriptionAssetLoadWaitTime");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "doubleValue");
  objc_msgSend(v54, "setHasSubscriptionAssetLoadWaitTime:", v112 > 0.0);

  objc_msgSend(v100, "suzeLeaseWaitTime");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "doubleValue");
  objc_msgSend(v54, "setHasSuzeLeaseWaitTime:", v114 > 0.0);

  v115 = v100;
  objc_msgSend(v115, "routeInfo");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "objectForKeyedSubscript:", CFSTR("type"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = objc_msgSend(v117, "integerValue");

  objc_msgSend(v54, "setRouteType:", v118);
  v119 = v115;
  objc_msgSend(v119, "subscriptionType");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = objc_msgSend(v120, "integerValue");

  objc_msgSend(v54, "setSubscriptionType:", v121);
  objc_msgSend(v13, "emitMWTMusicMetadata:requestId:", v54, v14);
  v122 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  v123 = v122;
  if (v8 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v122))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v123, OS_SIGNPOST_INTERVAL_END, v8, "SELFLoggerSendMetrics", ", buf, 2u);
  }

  v124 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v119, "checkpointFirstAudioFrame");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v125;
    _os_log_impl(&dword_210BD8000, v124, OS_LOG_TYPE_DEFAULT, "Finished sending SELF checkpoints and metadata with siriReferenceIdentifier=%{public}@ firstAudioFrameTimeStamp=%@", buf, 0x16u);

  }
}

@end
