@implementation ARSessionMetrics

- (ARSessionMetrics)init
{
  void *v3;
  ARSessionMetrics *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ARSessionMetrics initWithReporter:](self, "initWithReporter:", v3);

  return v4;
}

- (ARSessionMetrics)initWithReporter:(id)a3
{
  id v5;
  ARSessionMetrics *v6;
  ARSessionMetrics *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ARSessionMetrics;
  v6 = -[ARSessionMetrics init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_reporter, a3);
    v7->_sessionWasThrottled = 0;
    s_isSessionStopped = 1;
    v8 = (void *)s_replayStats;
    s_replayStats = 0;

    v7->_sessionDidFailWithError = 0;
    v7->_coachingOverlayGoal = 0;
    v7->_coachingOverlayActivationCount = 0;
  }

  return v7;
}

+ (void)setRenderType:(unint64_t)a3
{
  __CFString *v3;
  void *v4;

  if (a3 - 1 > 2)
    v3 = 0;
  else
    v3 = off_1E6673630[a3 - 1];
  v4 = (void *)s_reportedRendererString;
  s_reportedRendererString = (uint64_t)v3;

}

+ (void)recordHitTest:(unint64_t)a3
{
  NSObject *v4;
  _QWORD block[5];

  reportingQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__ARSessionMetrics_recordHitTest___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(v4, block);

}

void __34__ARSessionMetrics_recordHitTest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if ((s_isSessionStopped & 1) == 0)
  {
    hitTestReportingMap();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "intValue") + 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = &unk_1E66CC370;
    }
    v7 = v5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v7, v6);

  }
}

+ (void)recordReplayMetrics:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  reportingQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ARSessionMetrics_recordReplayMetrics___block_invoke;
  block[3] = &unk_1E6672168;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __40__ARSessionMetrics_recordReplayMetrics___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)&s_replayStats, *(id *)(a1 + 32));
}

+ (void)recordAltitudeLookupAttemptWithDuration:(double)a3 andResult:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  double v10;

  v5 = a4;
  reportingQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__ARSessionMetrics_recordAltitudeLookupAttemptWithDuration_andResult___block_invoke;
  v8[3] = &unk_1E6673378;
  v10 = a3;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __70__ARSessionMetrics_recordAltitudeLookupAttemptWithDuration_andResult___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();

}

id __70__ARSessionMetrics_recordAltitudeLookupAttemptWithDuration_andResult___block_invoke_2(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("duration");
  v2 = *(double *)(a1 + 40);
  *(float *)&v2 = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("bundleID");
  bundleID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = CFSTR("result");
  v5 = *(_QWORD *)(a1 + 32);
  v9[1] = v4;
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)recordTrueNorthUnavailable
{
  NSObject *v3;
  _QWORD block[5];

  reportingQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__ARSessionMetrics_recordTrueNorthUnavailable__block_invoke;
  block[3] = &unk_1E6672168;
  block[4] = self;
  dispatch_async(v3, block);

}

void __46__ARSessionMetrics_recordTrueNorthUnavailable__block_invoke(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 241) = 1;
  _ARLogSession();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v4;
    v8 = 2048;
    v9 = v5;
    _os_log_impl(&dword_1B3A68000, v2, OS_LOG_TYPE_INFO, "%{public}@ <%p>: True North was not available during the session - as reported by CoreMotion", (uint8_t *)&v6, 0x16u);

  }
}

+ (id)getRenderEngineString:(id)a3
{
  id v3;
  uint64_t isKindOfClass;
  Class v5;
  int32_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = a3;
  isKindOfClass = (uint64_t)NSClassFromString(CFSTR("FAppleARKitSessionDelegate"));
  v5 = NSClassFromString(CFSTR("UnityARSession"));
  v6 = NSVersionOfRunTimeLibrary("RealityKit");
  if (isKindOfClass)
  {
    objc_msgSend(v3, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v8 = CFSTR("Unreal");
      goto LABEL_14;
    }
  }
  if (v5)
  {
    objc_msgSend(v3, "delegate");
    isKindOfClass = objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

LABEL_10:
      v8 = CFSTR("Unity3d");
      goto LABEL_14;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.unity3d.framework"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  if (v9)
    goto LABEL_10;
  if (v6 == -1)
    v8 = CFSTR("Unknown");
  else
    v8 = CFSTR("RealityKit");
LABEL_14:

  return (id)v8;
}

- (void)sessionStarted:(id)a3 withConfiguration:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  reportingQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ARSessionMetrics_sessionStarted_withConfiguration___block_invoke;
  block[3] = &unk_1E66733C8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __53__ARSessionMetrics_sessionStarted_withConfiguration___block_invoke(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD block[4];
  id v24;

  s_isSessionStopped = 0;
  *((_BYTE *)a1[4] + 202) = 0;
  v2 = *((_QWORD *)a1[4] + 7);
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = v4;
  if (v2)
    v6 = v3 == v4;
  else
    v6 = 1;
  if (v6)
  {
    if (!v2)
      objc_msgSend(*((id *)a1[4] + 1), "postDarwinNotification:", CFSTR("com.apple.arkit.session.run"));
  }
  else
  {
    objc_msgSend(a1[4], "_recordSessionEnd");
  }
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ARSessionMetrics_sessionStarted_withConfiguration___block_invoke_2;
  block[3] = &unk_1E6672168;
  v24 = a1[6];
  if (s_rendererString_block_invoke_onceToken != -1)
    dispatch_once(&s_rendererString_block_invoke_onceToken, block);
  if (objc_msgSend(a1[5], "isKindOfConfiguration:", objc_opt_class()))
  {
    objc_msgSend(a1[5], "getAsKindOfConfiguration:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "initialWorldMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

    v11 = a1[4];
    if (*((unsigned __int8 *)v11 + 200) != v10)
    {
      if (*((_BYTE *)v11 + 200))
      {
        v12 = (void *)v11[1];
        v22[0] = v7;
        v22[1] = 3221225472;
        v22[2] = __53__ARSessionMetrics_sessionStarted_withConfiguration___block_invoke_3;
        v22[3] = &unk_1E66733A0;
        v22[4] = v11;
        objc_msgSend(v12, "sendEvent:dictionary:", CFSTR("com.apple.arkit.ARWorldMap.loading"), v22);
        v11 = a1[4];
      }
      *((_BYTE *)v11 + 200) = v10;
    }

  }
  if (v3 != v5)
  {
    *((_QWORD *)a1[4] + 5) = objc_opt_class();
    v13 = objc_msgSend(a1[5], "copy");
    v14 = a1[4];
    v15 = (void *)v14[6];
    v14[6] = v13;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = a1[4];
    v18 = (void *)v17[7];
    v17[7] = v16;

    objc_storeStrong((id *)a1[4] + 8, *((id *)a1[4] + 7));
    *((_QWORD *)a1[4] + 9) = 0;
    *((_QWORD *)a1[4] + 11) = 0;
    *((_QWORD *)a1[4] + 12) = 0;
    *((_BYTE *)a1[4] + 112) = 0;
    *((_QWORD *)a1[4] + 26) = 0;
    *((_QWORD *)a1[4] + 27) = 0;
    *((_BYTE *)a1[4] + 240) = 0;
    *((_BYTE *)a1[4] + 241) = 0;
    *((_QWORD *)a1[4] + 33) = 0;
    *((_QWORD *)a1[4] + 34) = 0;
    *((_QWORD *)a1[4] + 35) = 0;
    *((_QWORD *)a1[4] + 37) = 0;
    *((_QWORD *)a1[4] + 31) = 0;
    *((_QWORD *)a1[4] + 32) = 0;
    *((_QWORD *)a1[4] + 38) = 0;
    *((_QWORD *)a1[4] + 39) = 0;
    *((_QWORD *)a1[4] + 40) = 0;
    *((_QWORD *)a1[4] + 41) = 0;
    *((_QWORD *)a1[4] + 42) = 0;
    *((_QWORD *)a1[4] + 43) = 0;
    *((_QWORD *)a1[4] + 44) = 0;
    *((_QWORD *)a1[4] + 45) = 0;
    *((_QWORD *)a1[4] + 46) = 0;
    *((_QWORD *)a1[4] + 47) = 0;
    *((_QWORD *)a1[4] + 48) = 0;
    *((_QWORD *)a1[4] + 49) = 0;
    *((_QWORD *)a1[4] + 50) = 0;
    *((_QWORD *)a1[4] + 51) = 0;
    hitTestReportingMap();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeAllObjects");
    *((_BYTE *)a1[4] + 16) = 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      *((_BYTE *)a1[4] + 16) = objc_msgSend(a1[5], "performSelector:", sel_isAutoFocusEnabled) != 0;
    if (objc_msgSend(a1[5], "isKindOfConfiguration:", objc_opt_class()))
    {
      objc_msgSend(a1[5], "getAsKindOfConfiguration:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "initialWorldMap");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)a1[4] + 200) = v21 != 0;

    }
  }

}

void __53__ARSessionMetrics_sessionStarted_withConfiguration___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  if (!s_reportedRendererString)
  {
    +[ARSessionMetrics getRenderEngineString:](ARSessionMetrics, "getRenderEngineString:", *(_QWORD *)(a1 + 32));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)s_rendererString;
    s_rendererString = v1;

  }
}

id __53__ARSessionMetrics_sessionStarted_withConfiguration___block_invoke_3(uint64_t a1)
{
  void *v1;
  double v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v8[0] = MEMORY[0x1E0C9AAA0];
  v7[0] = CFSTR("success");
  v7[1] = CFSTR("duration");
  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "timeIntervalSinceNow");
  *(float *)&v2 = v2;
  *(float *)&v2 = -*(float *)&v2;
  objc_msgSend(v1, "numberWithFloat:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("bundleID");
  bundleID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)sessionDidUpdateFrame:(id)a3
{
  id v4;
  ARSessionMetricsFrameProperties *v5;

  v4 = a3;
  v5 = -[ARSessionMetricsFrameProperties initWithFrame:]([ARSessionMetricsFrameProperties alloc], "initWithFrame:", v4);

  -[ARSessionMetrics _processFrameProperties:](self, "_processFrameProperties:", v5);
}

- (void)_processFrameProperties:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  reportingQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__ARSessionMetrics__processFrameProperties___block_invoke;
  v7[3] = &unk_1E6672118;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __44__ARSessionMetrics__processFrameProperties___block_invoke(uint64_t a1)
{
  id *v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BYTE *v10;
  double v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  NSObject *v22;
  objc_class *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  double v29;
  NSObject *v30;
  objc_class *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  float32x4_t v38;
  float32x4_t *v39;
  float32x4_t v40;
  float v41;
  float v42;
  float32x4_t v43;
  float v44;
  float v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  NSObject *v52;
  objc_class *v53;
  id v54;
  id v55;
  uint64_t v56;
  double v57;
  double v58;
  double v59;
  double v60;
  NSObject *v61;
  objc_class *v62;
  id v63;
  id v64;
  uint64_t v65;
  int v66;
  double v67;
  NSObject *v68;
  objc_class *v69;
  id v70;
  id v71;
  uint64_t v72;
  float v73;
  double v74;
  _BOOL4 v75;
  _BOOL4 v76;
  id *v77;
  double v78;
  double v79;
  NSObject *v80;
  objc_class *v81;
  id v82;
  id v83;
  uint64_t v84;
  double v85;
  _BOOL4 v86;
  double v87;
  NSObject *v88;
  objc_class *v89;
  id v90;
  id v91;
  uint64_t v92;
  void *v93;
  int v94;
  uint64_t v95;
  double v96;
  NSObject *v97;
  objc_class *v98;
  id v99;
  id v100;
  uint64_t v101;
  int v102;
  double v103;
  NSObject *v104;
  objc_class *v105;
  id v106;
  id v107;
  uint64_t v108;
  int v109;
  double v110;
  NSObject *v111;
  objc_class *v112;
  id v113;
  id v114;
  uint64_t v115;
  int v116;
  double v117;
  NSObject *v118;
  objc_class *v119;
  id v120;
  id v121;
  uint64_t v122;
  char v123;
  double v124;
  NSObject *v125;
  objc_class *v126;
  id v127;
  id v128;
  uint64_t v129;
  BOOL v130;
  double v131;
  NSObject *v132;
  objc_class *v133;
  id v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  id *v139;
  double v140;
  double v141;
  NSObject *v142;
  objc_class *v143;
  id v144;
  id v145;
  uint64_t v146;
  double v147;
  id *v148;
  double v149;
  NSObject *v150;
  objc_class *v151;
  id v152;
  id v153;
  uint64_t v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  NSObject *v160;
  objc_class *v161;
  id v162;
  id v163;
  uint64_t v164;
  void *v165;
  void *v166;
  _QWORD v167[5];
  uint8_t buf[4];
  id v169;
  __int16 v170;
  id v171;
  __int16 v172;
  uint64_t v173;
  __int16 v174;
  double v175;
  __int16 v176;
  double v177;
  uint64_t v178;

  v178 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "anchors");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 160);
    *(_QWORD *)(v4 + 160) = v3;

    objc_msgSend(*(id *)(a1 + 40), "location");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 168);
    *(_QWORD *)(v7 + 168) = v6;

    objc_msgSend(*(id *)(a1 + 40), "camera");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isKindOfConfiguration:", objc_opt_class()) & 1) != 0
      || objc_msgSend(*((id *)*v1 + 6), "isKindOfConfiguration:", objc_opt_class()))
    {
      if (!objc_msgSend(v9, "trackingState")
        || objc_msgSend(v9, "trackingState") == 1 && objc_msgSend(v9, "trackingStateReason") == 1)
      {
        *((_BYTE *)*v1 + 80) = 1;
        *((_BYTE *)*v1 + 201) = 1;
LABEL_146:

        return;
      }
      v10 = *v1;
      if (*((_BYTE *)*v1 + 80))
      {
        v10[80] = 0;
        objc_msgSend(*((id *)*v1 + 7), "timeIntervalSinceNow");
        *((double *)*v1 + 13) = -v11;
        _ARLogSession();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v13 = (objc_class *)objc_opt_class();
          NSStringFromClass(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = *v1;
          v16 = *((_QWORD *)*v1 + 13);
          *(_DWORD *)buf = 138543874;
          v169 = v14;
          v170 = 2048;
          v171 = v15;
          v172 = 2048;
          v173 = v16;
          _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: It took %f seconds to initialize vio", buf, 0x20u);

        }
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)*((_QWORD *)*v1 + 8);
        *((_QWORD *)*v1 + 8) = v17;

        v10 = *v1;
      }
      if (v10[200])
      {
        if (objc_msgSend(v9, "trackingState") == 1 && objc_msgSend(v9, "trackingStateReason") == 4)
        {
          *((_BYTE *)*v1 + 201) = 1;
        }
        else if (objc_msgSend(v9, "trackingState") == 2 && *((_BYTE *)*v1 + 201))
        {
          *((_BYTE *)*v1 + 201) = 0;
          v36 = *v1;
          v37 = (void *)*((_QWORD *)*v1 + 1);
          v167[0] = MEMORY[0x1E0C809B0];
          v167[1] = 3221225472;
          v167[2] = __44__ARSessionMetrics__processFrameProperties___block_invoke_325;
          v167[3] = &unk_1E66733A0;
          v167[4] = v36;
          objc_msgSend(v37, "sendEvent:dictionary:", CFSTR("com.apple.arkit.ARWorldMap.loading"), v167);
        }
      }
      objc_msgSend(v9, "transform");
      v39 = (float32x4_t *)*v1;
      if (!*((_BYTE *)*v1 + 112))
      {
        v39[8] = v38;
        *((float32x4_t *)*v1 + 9) = v38;
        *((_BYTE *)*v1 + 112) = 1;
        v39 = (float32x4_t *)*v1;
      }
      v40 = v39[8];
      if ((vmovn_s32(vcgtq_f32(v38, v40)).u8[0] & 1) == 0)
        v40.f32[0] = v38.f32[0];
      v39[8].i32[0] = v40.i32[0];
      v41 = *((float *)*v1 + 33);
      if (v41 >= v38.f32[1])
        v41 = v38.f32[1];
      *((float *)*v1 + 33) = v41;
      v42 = *((float *)*v1 + 34);
      if (v42 >= v38.f32[2])
        v42 = v38.f32[2];
      *((float *)*v1 + 34) = v42;
      v43 = *((float32x4_t *)*v1 + 9);
      if ((vmovn_s32(vcgtq_f32(v38, v43)).u8[0] & 1) != 0)
        v43.f32[0] = v38.f32[0];
      *((_DWORD *)*v1 + 36) = v43.i32[0];
      v44 = *((float *)*v1 + 37);
      if (v44 < v38.f32[1])
        v44 = v38.f32[1];
      *((float *)*v1 + 37) = v44;
      v45 = *((float *)*v1 + 38);
      if (v45 < v38.f32[2])
        v45 = v38.f32[2];
      *((float *)*v1 + 38) = v45;
    }
    else if (objc_msgSend(*((id *)*v1 + 6), "isKindOfConfiguration:", objc_opt_class()))
    {
      objc_msgSend(*(id *)(a1 + 40), "geoTrackingStatus");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        if (*((double *)*v1 + 31) == 0.0 && objc_msgSend(v19, "state") != 1 && objc_msgSend(v20, "state"))
        {
          objc_msgSend(*((id *)*v1 + 7), "timeIntervalSinceNow");
          *((double *)*v1 + 31) = -v21;
          _ARLogSession();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v23 = (objc_class *)objc_opt_class();
            NSStringFromClass(v23);
            v24 = (id)objc_claimAutoreleasedReturnValue();
            v25 = *v1;
            v26 = *((_QWORD *)*v1 + 31);
            *(_DWORD *)buf = 138543874;
            v169 = v24;
            v170 = 2048;
            v171 = v25;
            v172 = 2048;
            v173 = v26;
            _os_log_impl(&dword_1B3A68000, v22, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Attempting to localize geo tracking after %f seconds", buf, 0x20u);

          }
        }
        v27 = objc_msgSend(v20, "state");
        v28 = *v1;
        if (v27 == 3)
        {
          if (!v28[240])
          {
            v28[240] = 1;
            ++*((_QWORD *)*v1 + 36);
            if (*((double *)*v1 + 32) == 0.0)
            {
              objc_msgSend(*((id *)*v1 + 7), "timeIntervalSinceNow");
              *((double *)*v1 + 32) = -v29;
              _ARLogSession();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                v31 = (objc_class *)objc_opt_class();
                NSStringFromClass(v31);
                v32 = (id)objc_claimAutoreleasedReturnValue();
                v33 = *v1;
                v34 = *((_QWORD *)*v1 + 32);
                *(_DWORD *)buf = 138543874;
                v169 = v32;
                v170 = 2048;
                v171 = v33;
                v172 = 2048;
                v173 = v34;
                _os_log_impl(&dword_1B3A68000, v30, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Geo tracking successful localized after %f seconds", buf, 0x20u);

              }
            }
          }
          v35 = objc_msgSend(v20, "accuracy");
          switch(v35)
          {
            case 3:
              ++*((_QWORD *)*v1 + 35);
              break;
            case 2:
              ++*((_QWORD *)*v1 + 34);
              break;
            case 1:
              ++*((_QWORD *)*v1 + 33);
              break;
          }
        }
        else
        {
          v28[240] = 0;
        }
        if (objc_msgSend(v20, "state") == 2 || objc_msgSend(v20, "state") == 1)
          *((_QWORD *)*v1 + 37) |= objc_msgSend(v20, "failureReasons");
        else
          *((_QWORD *)*v1 + 37) = objc_msgSend(v20, "failureReasons");
        objc_msgSend(*(id *)(a1 + 40), "location");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v46;
        if (*(double *)(*(_QWORD *)(a1 + 32) + 304) == 0.0)
        {
          objc_msgSend(v46, "horizontalAccuracy");
          v49 = v48;
          objc_msgSend(MEMORY[0x1E0DC6F58], "maximumHorizontalAccuracyThreshold");
          if (v49 < v50 && objc_msgSend(v47, "type") == 1)
          {
            objc_msgSend(*((id *)*v1 + 7), "timeIntervalSinceNow");
            *((double *)*v1 + 38) = -v51;
            _ARLogSession();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            {
              v53 = (objc_class *)objc_opt_class();
              NSStringFromClass(v53);
              v54 = (id)objc_claimAutoreleasedReturnValue();
              v55 = *v1;
              v56 = *((_QWORD *)*v1 + 38);
              *(_DWORD *)buf = 138543874;
              v169 = v54;
              v170 = 2048;
              v171 = v55;
              v172 = 2048;
              v173 = v56;
              _os_log_impl(&dword_1B3A68000, v52, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CL first GPS %f seconds", buf, 0x20u);

            }
          }
        }
        if (*((double *)*v1 + 39) == 0.0)
        {
          objc_msgSend(v47, "horizontalAccuracy");
          v58 = v57;
          objc_msgSend(MEMORY[0x1E0DC6F58], "maximumHorizontalAccuracyThreshold");
          if (v58 < v59
            && objc_msgSend(v47, "type") != 6
            && objc_msgSend(v47, "type") != 10)
          {
            objc_msgSend(*((id *)*v1 + 7), "timeIntervalSinceNow");
            *((double *)*v1 + 39) = -v60;
            _ARLogSession();
            v61 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
            {
              v62 = (objc_class *)objc_opt_class();
              NSStringFromClass(v62);
              v63 = (id)objc_claimAutoreleasedReturnValue();
              v64 = *v1;
              v65 = *((_QWORD *)*v1 + 39);
              v66 = objc_msgSend(v47, "type");
              *(_DWORD *)buf = 138544130;
              v169 = v63;
              v170 = 2048;
              v171 = v64;
              v172 = 2048;
              v173 = v65;
              v174 = 1024;
              LODWORD(v175) = v66;
              _os_log_impl(&dword_1B3A68000, v61, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CL first non-GPS %f seconds, type %i", buf, 0x26u);

            }
          }
        }
        if (*((double *)*v1 + 40) == 0.0
          && +[ARLocationData isAltitudeValid:](ARLocationData, "isAltitudeValid:", v47))
        {
          objc_msgSend(*((id *)*v1 + 7), "timeIntervalSinceNow");
          *((double *)*v1 + 40) = -v67;
          _ARLogSession();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
          {
            v69 = (objc_class *)objc_opt_class();
            NSStringFromClass(v69);
            v70 = (id)objc_claimAutoreleasedReturnValue();
            v71 = *v1;
            v72 = *((_QWORD *)*v1 + 40);
            *(_DWORD *)buf = 138543874;
            v169 = v70;
            v170 = 2048;
            v171 = v71;
            v172 = 2048;
            v173 = v72;
            _os_log_impl(&dword_1B3A68000, v68, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CL first DEM value %f seconds", buf, 0x20u);

          }
        }
        objc_msgSend(v9, "transform");
        v74 = acosf(-v73) * 0.318309886 * 180.0;
        *(float *)&v74 = v74;
        v75 = +[ARGeoTrackingTechnique isCameraUp:](ARGeoTrackingTechnique, "isCameraUp:", v74);
        v76 = v75;
        v77 = (id *)*v1;
        v78 = *((double *)*v1 + 41);
        if (v78 == 0.0 && v75)
        {
          objc_msgSend(v77[7], "timeIntervalSinceNow");
          *((double *)*v1 + 41) = -v79;
          _ARLogSession();
          v80 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
          {
            v81 = (objc_class *)objc_opt_class();
            NSStringFromClass(v81);
            v82 = (id)objc_claimAutoreleasedReturnValue();
            v83 = *v1;
            v84 = *((_QWORD *)*v1 + 41);
            *(_DWORD *)buf = 138543874;
            v169 = v82;
            v170 = 2048;
            v171 = v83;
            v172 = 2048;
            v173 = v84;
            _os_log_impl(&dword_1B3A68000, v80, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Camera first up %f seconds", buf, 0x20u);

          }
          v77 = (id *)*v1;
          v78 = *((double *)*v1 + 41);
        }
        if (v78 > 0.0)
        {
          objc_msgSend(v77[7], "timeIntervalSinceNow");
          v86 = *((double *)*v1 + 42) != 0.0;
          if (-v85 - *((double *)*v1 + 41) <= 1.0)
            v86 = 1;
          if (!v86 && !v76)
          {
            objc_msgSend(*((id *)*v1 + 7), "timeIntervalSinceNow");
            *((double *)*v1 + 42) = -v87;
            _ARLogSession();
            v88 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
            {
              v89 = (objc_class *)objc_opt_class();
              NSStringFromClass(v89);
              v90 = (id)objc_claimAutoreleasedReturnValue();
              v91 = *v1;
              v92 = *((_QWORD *)*v1 + 42);
              *(_DWORD *)buf = 138543874;
              v169 = v90;
              v170 = 2048;
              v171 = v91;
              v172 = 2048;
              v173 = v92;
              _os_log_impl(&dword_1B3A68000, v88, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Camera down again %f seconds", buf, 0x20u);

            }
          }
        }
        objc_msgSend(*(id *)(a1 + 40), "vlState");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_msgSend(v93, "hasStartedAvailabilityCheck");
        v95 = *(_QWORD *)(a1 + 32);
        if (*(double *)(v95 + 344) == 0.0 && v94)
        {
          objc_msgSend(*(id *)(v95 + 56), "timeIntervalSinceNow");
          *((double *)*v1 + 43) = -v96;
          _ARLogSession();
          v97 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
          {
            v98 = (objc_class *)objc_opt_class();
            NSStringFromClass(v98);
            v99 = (id)objc_claimAutoreleasedReturnValue();
            v100 = *v1;
            v101 = *((_QWORD *)*v1 + 43);
            *(_DWORD *)buf = 138543874;
            v169 = v99;
            v170 = 2048;
            v171 = v100;
            v172 = 2048;
            v173 = v101;
            _os_log_impl(&dword_1B3A68000, v97, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Called VL available started %f seconds", buf, 0x20u);

          }
        }
        v102 = objc_msgSend(v93, "hasReturnedAvailabilityCheck");
        if (*((double *)*v1 + 44) == 0.0 && v102)
        {
          objc_msgSend(*((id *)*v1 + 7), "timeIntervalSinceNow");
          *((double *)*v1 + 44) = -v103;
          _ARLogSession();
          v104 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
          {
            v105 = (objc_class *)objc_opt_class();
            NSStringFromClass(v105);
            v106 = (id)objc_claimAutoreleasedReturnValue();
            v107 = *v1;
            v108 = *((_QWORD *)*v1 + 43);
            *(_DWORD *)buf = 138543874;
            v169 = v106;
            v170 = 2048;
            v171 = v107;
            v172 = 2048;
            v173 = v108;
            _os_log_impl(&dword_1B3A68000, v104, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Called VL available returned %f seconds", buf, 0x20u);

          }
        }
        v109 = objc_msgSend(v93, "hasStartedLocalization");
        if (*((double *)*v1 + 45) == 0.0 && v109)
        {
          objc_msgSend(*((id *)*v1 + 7), "timeIntervalSinceNow");
          *((double *)*v1 + 45) = -v110;
          _ARLogSession();
          v111 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
          {
            v112 = (objc_class *)objc_opt_class();
            NSStringFromClass(v112);
            v113 = (id)objc_claimAutoreleasedReturnValue();
            v114 = *v1;
            v115 = *((_QWORD *)*v1 + 45);
            *(_DWORD *)buf = 138543874;
            v169 = v113;
            v170 = 2048;
            v171 = v114;
            v172 = 2048;
            v173 = v115;
            _os_log_impl(&dword_1B3A68000, v111, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Called VL localization started %f seconds", buf, 0x20u);

          }
        }
        v116 = objc_msgSend(v93, "hasReturnedLocalization");
        if (*((double *)*v1 + 46) == 0.0 && v116)
        {
          objc_msgSend(*((id *)*v1 + 7), "timeIntervalSinceNow");
          *((double *)*v1 + 46) = -v117;
          _ARLogSession();
          v118 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
          {
            v119 = (objc_class *)objc_opt_class();
            NSStringFromClass(v119);
            v120 = (id)objc_claimAutoreleasedReturnValue();
            v121 = *v1;
            v122 = *((_QWORD *)*v1 + 46);
            *(_DWORD *)buf = 138543874;
            v169 = v120;
            v170 = 2048;
            v171 = v121;
            v172 = 2048;
            v173 = v122;
            _os_log_impl(&dword_1B3A68000, v118, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Called VL localization returned %f seconds", buf, 0x20u);

          }
        }
        v123 = objc_msgSend(v20, "failureReasons");
        if (*((double *)*v1 + 47) == 0.0 && (v123 & 0x10) != 0)
        {
          objc_msgSend(*((id *)*v1 + 7), "timeIntervalSinceNow");
          *((double *)*v1 + 47) = -v124;
          _ARLogSession();
          v125 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
          {
            v126 = (objc_class *)objc_opt_class();
            NSStringFromClass(v126);
            v127 = (id)objc_claimAutoreleasedReturnValue();
            v128 = *v1;
            v129 = *((_QWORD *)*v1 + 47);
            *(_DWORD *)buf = 138543874;
            v169 = v127;
            v170 = 2048;
            v171 = v128;
            v172 = 2048;
            v173 = v129;
            _os_log_impl(&dword_1B3A68000, v125, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: VL failed to localize after %f seconds", buf, 0x20u);

          }
        }
        v130 = objc_msgSend(v9, "trackingState") != 2 && objc_msgSend(v9, "trackingState") != 1;
        if (*((double *)*v1 + 48) == 0.0 && !v130)
        {
          objc_msgSend(*((id *)*v1 + 7), "timeIntervalSinceNow");
          *((double *)*v1 + 48) = -v131;
          _ARLogSession();
          v132 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
          {
            v133 = (objc_class *)objc_opt_class();
            NSStringFromClass(v133);
            v134 = (id)objc_claimAutoreleasedReturnValue();
            v135 = *v1;
            v136 = *((_QWORD *)*v1 + 48);
            *(_DWORD *)buf = 138543874;
            v169 = v134;
            v170 = 2048;
            v171 = v135;
            v172 = 2048;
            v173 = v136;
            _os_log_impl(&dword_1B3A68000, v132, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: VIO first pose after %f seconds", buf, 0x20u);

          }
        }
        v137 = objc_msgSend(v9, "trackingState");
        v138 = v137;
        v139 = (id *)*v1;
        v140 = *((double *)*v1 + 49);
        if (v140 == 0.0 && v137 == 2)
        {
          objc_msgSend(v139[7], "timeIntervalSinceNow");
          *((double *)*v1 + 49) = -v141;
          _ARLogSession();
          v142 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v142, OS_LOG_TYPE_DEBUG))
          {
            v143 = (objc_class *)objc_opt_class();
            NSStringFromClass(v143);
            v144 = (id)objc_claimAutoreleasedReturnValue();
            v145 = *v1;
            v146 = *((_QWORD *)*v1 + 49);
            *(_DWORD *)buf = 138543874;
            v169 = v144;
            v170 = 2048;
            v171 = v145;
            v172 = 2048;
            v173 = v146;
            _os_log_impl(&dword_1B3A68000, v142, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: VIO first normal pose after %f seconds", buf, 0x20u);

          }
          v139 = (id *)*v1;
          v140 = *((double *)*v1 + 49);
        }
        if (v140 > 0.0)
        {
          objc_msgSend(v139[7], "timeIntervalSinceNow");
          v148 = (id *)*v1;
          if (*((double *)*v1 + 50) == 0.0 && -v147 - *((double *)v148 + 49) > 1.0 && v138 != 2)
          {
            objc_msgSend(v148[7], "timeIntervalSinceNow");
            *((double *)*v1 + 50) = -v149;
            _ARLogSession();
            v150 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v150, OS_LOG_TYPE_DEBUG))
            {
              v151 = (objc_class *)objc_opt_class();
              NSStringFromClass(v151);
              v152 = (id)objc_claimAutoreleasedReturnValue();
              v153 = *v1;
              v154 = *((_QWORD *)*v1 + 50);
              *(_DWORD *)buf = 138543874;
              v169 = v152;
              v170 = 2048;
              v171 = v153;
              v172 = 2048;
              v173 = v154;
              _os_log_impl(&dword_1B3A68000, v150, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: VIO not normal after %f seconds", buf, 0x20u);

            }
          }
        }
        objc_msgSend(v9, "imageResolution");
        v156 = v155;
        objc_msgSend(v9, "imageResolution");
        if (*((double *)*v1 + 51) == 0.0)
        {
          v158 = v157;
          if (v156 * v157 > 0.0)
          {
            objc_msgSend(*((id *)*v1 + 7), "timeIntervalSinceNow", v156 * v157);
            *((double *)*v1 + 51) = -v159;
            _ARLogSession();
            v160 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v160, OS_LOG_TYPE_DEBUG))
            {
              v161 = (objc_class *)objc_opt_class();
              NSStringFromClass(v161);
              v162 = (id)objc_claimAutoreleasedReturnValue();
              v163 = *v1;
              v164 = *((_QWORD *)*v1 + 51);
              *(_DWORD *)buf = 138544386;
              v169 = v162;
              v170 = 2048;
              v171 = v163;
              v172 = 2048;
              v173 = v164;
              v174 = 2048;
              v175 = v156;
              v176 = 2048;
              v177 = v158;
              _os_log_impl(&dword_1B3A68000, v160, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: first image after %f seconds (%f x %f)", buf, 0x34u);

            }
          }
        }

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "worldTrackingState");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = v165;
    if (v165)
    {
      *((_QWORD *)*v1 + 22) = objc_msgSend(v165, "currentVIOMapSize");
      *((_QWORD *)*v1 + 23) = objc_msgSend(v166, "numberOfCameraSwitches");
      *((_QWORD *)*v1 + 24) = objc_msgSend(v166, "reinitializationAttempts");
    }
    ++*((_QWORD *)*v1 + 11);
    if (objc_msgSend(v9, "trackingState") != 2)
      ++*((_QWORD *)*v1 + 12);
    if (objc_msgSend(*((id *)*v1 + 6), "isKindOfConfiguration:", objc_opt_class()))
      objc_msgSend(*v1, "_recordBadFramePercentageFinal:", 0);

    goto LABEL_146;
  }
}

id __44__ARSessionMetrics__processFrameProperties___block_invoke_325(uint64_t a1)
{
  void *v1;
  double v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v8[0] = MEMORY[0x1E0C9AAB0];
  v7[0] = CFSTR("success");
  v7[1] = CFSTR("duration");
  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "timeIntervalSinceNow");
  *(float *)&v2 = v2;
  *(float *)&v2 = -*(float *)&v2;
  objc_msgSend(v1, "numberWithFloat:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("bundleID");
  bundleID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)sessionUpdateThermalState:(int64_t)a3
{
  NSDate *startDate;
  double v5;
  float v6;

  if (a3 >= 2 && !self->_sessionWasThrottled)
  {
    startDate = self->_startDate;
    if (startDate)
    {
      -[NSDate timeIntervalSinceNow](startDate, "timeIntervalSinceNow");
      *(float *)&v5 = v5;
      v6 = -*(float *)&v5;
    }
    else
    {
      v6 = 0.0;
    }
    self->_timeUntilThrottling = v6;
    self->_sessionWasThrottled = 1;
  }
}

- (void)recordSaveMap:(int64_t)a3 numberOfFeaturePoints:(unint64_t)a4
{
  NSObject *v7;
  _QWORD block[7];

  reportingQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ARSessionMetrics_recordSaveMap_numberOfFeaturePoints___block_invoke;
  block[3] = &unk_1E6673410;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(v7, block);

}

uint64_t __56__ARSessionMetrics_recordSaveMap_numberOfFeaturePoints___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[4];
  __int128 v4;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__ARSessionMetrics_recordSaveMap_numberOfFeaturePoints___block_invoke_2;
  v3[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  v4 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(v1, "sendEvent:dictionary:", CFSTR("com.apple.arkit.ARWorldMap.saving"), v3);
}

id __56__ARSessionMetrics_recordSaveMap_numberOfFeaturePoints___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("mappingStatus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("numberOfFeaturePoints");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("bundleID");
  bundleID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)recordRaycast:(id)a3 tracked:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  reportingQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__ARSessionMetrics_recordRaycast_tracked___block_invoke;
  block[3] = &unk_1E6673460;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

void __42__ARSessionMetrics_recordRaycast_tracked___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  char v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__ARSessionMetrics_recordRaycast_tracked___block_invoke_2;
  v4[3] = &unk_1E6673438;
  v5 = v2;
  v6 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v3, "sendEvent:dictionary:", CFSTR("com.apple.arkit.ARRaycast"), v4);
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208);

}

id __42__ARSessionMetrics_recordRaycast_tracked___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("target");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "target"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("alignment");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "targetAlignment"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("isTracked");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("bundleID");
  bundleID();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)recordHiResFrameCapture
{
  NSObject *v3;
  _QWORD block[5];

  reportingQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__ARSessionMetrics_recordHiResFrameCapture__block_invoke;
  block[3] = &unk_1E6672168;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __43__ARSessionMetrics_recordHiResFrameCapture__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 216);
  return result;
}

- (void)recordCoachingOverlayUsage:(int)a3
{
  NSObject *v5;
  _QWORD v6[5];
  int v7;

  reportingQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__ARSessionMetrics_recordCoachingOverlayUsage___block_invoke;
  v6[3] = &unk_1E6673488;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

uint64_t __47__ARSessionMetrics_recordCoachingOverlayUsage___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 224) = *(int *)(result + 40);
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 232);
  return result;
}

- (void)reportSessionFailure:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  reportingQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__ARSessionMetrics_reportSessionFailure___block_invoke;
  v7[3] = &unk_1E6672118;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __41__ARSessionMetrics_reportSessionFailure___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  double v12;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 202) = 1;
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "timeIntervalSinceNow");
  v5 = -v4;
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__ARSessionMetrics_reportSessionFailure___block_invoke_2;
  v9[3] = &unk_1E66734B0;
  v10 = v6;
  v11 = v3;
  v12 = v5;
  v8 = v3;
  objc_msgSend(v7, "sendEvent:dictionary:", CFSTR("com.apple.arkit.ARSessionError"), v9);

}

id __41__ARSessionMetrics_reportSessionFailure___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v3;
  v12[1] = CFSTR("underlyingErrorCode");
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    v17 = v1;
    v13 = CFSTR("underlyingErrorDomain");
    if (v5)
    {
      objc_msgSend(v5, "domain");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
    }
    else
    {
      v6 = &stru_1E6676798;
      v7 = 1;
    }
  }
  else
  {
    v17 = &unk_1E66CC388;
    v13 = CFSTR("underlyingErrorDomain");
    v6 = &stru_1E6676798;
    v7 = 1;
  }
  v18 = v6;
  v14 = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v8;
  v15 = CFSTR("bundleID");
  bundleID();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, v12, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v7 & 1) == 0)
  if (v4)

  return v10;
}

- (void)sessionStopped
{
  NSObject *v3;
  _QWORD block[5];

  reportingQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__ARSessionMetrics_sessionStopped__block_invoke;
  block[3] = &unk_1E6672168;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __34__ARSessionMetrics_sessionStopped__block_invoke(uint64_t a1)
{
  uint64_t result;

  s_isSessionStopped = 1;
  result = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(result + 56))
  {
    if (!*(_BYTE *)(result + 202))
    {
      objc_msgSend((id)result, "_recordSessionEnd");
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "postDarwinNotification:", CFSTR("com.apple.arkit.session.pause"));
    }
  }
  return result;
}

- (void)_recordSessionEnd
{
  ARSessionMetrics *v2;
  double v3;
  double v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  NSDate *startDate;
  _BOOL4 v9;
  uint64_t v10;
  char *__ptr32 *v11;
  _BOOL4 v12;
  ARConfiguration *currentConfiguration;
  void *v14;
  objc_class *v15;
  void *v16;
  ARSessionMetricsReporting *reporter;
  id v18;
  void *v19;
  _BOOL4 v20;
  ARConfiguration *v21;
  void *v22;
  objc_class *v23;
  ARSessionMetricsReporting *v24;
  void *v25;
  objc_class *v26;
  uint64_t v27;
  ARSessionMetricsReporting *v28;
  float v29;
  float v30;
  _BOOL4 v31;
  ARConfiguration *v32;
  void *v33;
  objc_class *v34;
  ARSessionMetricsReporting *v35;
  NSArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  objc_class *v42;
  NSArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  uint64_t i;
  void *v53;
  id v54;
  id v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  unint64_t v61;
  double v62;
  double v63;
  NSArray *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t k;
  ARSessionMetricsReporting *v70;
  id v71;
  ARSessionMetricsReporting *v72;
  uint64_t v73;
  id v74;
  void *v75;
  void *v76;
  ARSessionMetricsReporting *v77;
  ARSessionMetricsReporting *v78;
  void *v79;
  ARConfiguration *v80;
  void *v81;
  objc_class *v82;
  _BOOL4 geoTrackingTrueNorthUnavailable;
  NSObject *v84;
  _BOOL4 v85;
  objc_class *v86;
  void *v87;
  const char *v88;
  objc_class *v89;
  int64x2_t v90;
  unint64_t geoTrackingHighAccuracyFrameCount;
  unint64_t v92;
  double v93;
  ARSessionMetricsReporting *v94;
  float v95;
  ARSessionMetrics *v96;
  void *v97;
  void *v98;
  CLLocation *v99;
  _QWORD v100[6];
  _QWORD v101[5];
  _QWORD v102[4];
  id v103;
  id v104;
  ARSessionMetrics *v105;
  _QWORD v106[5];
  id v107;
  double v108;
  _QWORD v109[12];
  float v110;
  int8x16_t v111;
  double v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _QWORD v117[4];
  void *v118;
  _QWORD v119[4];
  void *v120;
  _QWORD v121[4];
  void *v122;
  _QWORD v123[5];
  id v124;
  uint64_t v125;
  uint64_t v126;
  double v127;
  float v128;
  float v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _QWORD v138[5];
  _BYTE v139[128];
  _BYTE v140[128];
  uint8_t v141[128];
  uint8_t buf[4];
  void *v143;
  __int16 v144;
  ARSessionMetrics *v145;
  __int16 v146;
  double v147;
  uint64_t v148;

  v2 = self;
  v148 = *MEMORY[0x1E0C80C00];
  -[NSDate timeIntervalSinceNow](self->_startDate, "timeIntervalSinceNow");
  v4 = -v3;
  _ARLogSession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v143 = v7;
    v144 = 2048;
    v145 = v2;
    v146 = 2048;
    v147 = v4;
    _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: ARSession duration seconds: %f", buf, 0x20u);

  }
  startDate = v2->_startDate;
  v2->_startDate = 0;

  v9 = -[ARConfiguration isKindOfConfiguration:](v2->_currentConfiguration, "isKindOfConfiguration:", objc_opt_class());
  v10 = MEMORY[0x1E0C809B0];
  v11 = &off_1B3BDF000;
  if (!v9
    || -[ARConfiguration isKindOfConfiguration:](v2->_currentConfiguration, "isKindOfConfiguration:", objc_opt_class()))
  {
    v12 = -[ARConfiguration isKindOfConfiguration:](v2->_currentConfiguration, "isKindOfConfiguration:", objc_opt_class());
    currentConfiguration = v2->_currentConfiguration;
    if (v12)
    {
      -[ARConfiguration getAsKindOfConfiguration:](currentConfiguration, "getAsKindOfConfiguration:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      reporter = v2->_reporter;
      v121[0] = v10;
      v121[1] = 3221225472;
      v121[2] = __37__ARSessionMetrics__recordSessionEnd__block_invoke_3;
      v121[3] = &unk_1E66733A0;
      v122 = v14;
      v18 = v14;
      -[ARSessionMetricsReporting sendEvent:dictionary:](reporter, "sendEvent:dictionary:", CFSTR("com.apple.arkit.ARImageTracking"), v121);
      v19 = v122;
LABEL_16:

      goto LABEL_70;
    }
    v20 = -[ARConfiguration isKindOfConfiguration:](currentConfiguration, "isKindOfConfiguration:", objc_opt_class());
    v21 = v2->_currentConfiguration;
    if (v20)
    {
      -[ARConfiguration getAsKindOfConfiguration:](v21, "getAsKindOfConfiguration:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v2->_reporter;
      v119[0] = v10;
      v119[1] = 3221225472;
      v119[2] = __37__ARSessionMetrics__recordSessionEnd__block_invoke_4;
      v119[3] = &unk_1E66733A0;
      v120 = v22;
      v18 = v22;
      -[ARSessionMetricsReporting sendEvent:dictionary:](v24, "sendEvent:dictionary:", CFSTR("com.apple.arkit.ARFaceTracking"), v119);
      v19 = v120;
      goto LABEL_16;
    }
    v31 = -[ARConfiguration isKindOfConfiguration:](v21, "isKindOfConfiguration:", objc_opt_class());
    v32 = v2->_currentConfiguration;
    if (v31)
    {
      -[ARConfiguration getAsKindOfConfiguration:](v32, "getAsKindOfConfiguration:", objc_opt_class());
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v2->_reporter;
      v117[0] = v10;
      v117[1] = 3221225472;
      v117[2] = __37__ARSessionMetrics__recordSessionEnd__block_invoke_5;
      v117[3] = &unk_1E66733A0;
      v118 = v33;
      v18 = v33;
      -[ARSessionMetricsReporting sendEvent:dictionary:](v35, "sendEvent:dictionary:", CFSTR("com.apple.arkit.ARBodyTracking"), v117);
      v19 = v118;
      goto LABEL_16;
    }
    if (!-[ARConfiguration isKindOfConfiguration:](v32, "isKindOfConfiguration:", objc_opt_class()))
    {
      if (-[ARConfiguration isKindOfConfiguration:](v2->_currentConfiguration, "isKindOfConfiguration:", objc_opt_class())|| -[ARConfiguration isKindOfConfiguration:](v2->_currentConfiguration, "isKindOfConfiguration:", objc_opt_class())|| -[ARConfiguration isKindOfConfiguration:](v2->_currentConfiguration, "isKindOfConfiguration:", objc_opt_class()))
      {
        v82 = (objc_class *)objc_opt_class();
        NSStringFromClass(v82);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      goto LABEL_70;
    }
    v42 = (objc_class *)objc_opt_class();
    NSStringFromClass(v42);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2->_frameCount)
      goto LABEL_70;
    v99 = v2->_lastUpdatedFrameLocation;
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    v96 = v2;
    v43 = v2->_lastUpdatedFrameAnchors;
    v44 = -[NSArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v113, v139, 16);
    if (v44)
    {
      v45 = v44;
      v97 = v16;
      v46 = 0;
      v47 = 0;
      v48 = *(_QWORD *)v114;
      v49 = 0.0;
      v50 = 1.79769313e308;
      v51 = 0.0;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v114 != v48)
            objc_enumerationMutation(v43);
          v53 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v54 = v53;
            v55 = objc_alloc(MEMORY[0x1E0C9E3B8]);
            if (v54)
            {
              objc_msgSend(v54, "locationLLA");
              v56 = v112;
              objc_msgSend(v54, "locationLLA");
              *(_QWORD *)&v57 = vextq_s8(v111, v111, 8uLL).u64[0];
            }
            else
            {
              v56 = 0.0;
              v57 = 0.0;
            }
            v58 = (void *)objc_msgSend(v55, "initWithLatitude:longitude:", v56, v57);
            -[CLLocation distanceFromLocation:](v99, "distanceFromLocation:", v58);
            v60 = v59;

            if (objc_msgSend(v54, "altitudeSource") == 3)
              ++v46;
            v51 = v51 + v60;
            if (v50 >= v60)
              v50 = v60;
            if (v49 < v60)
              v49 = v60;
            ++v47;

          }
        }
        v45 = -[NSArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v113, v139, 16);
      }
      while (v45);

      if (v47)
        v61 = v47;
      else
        v61 = 0;
      if (v47)
        v62 = v50;
      else
        v62 = 0.0;
      if (v47)
        v63 = v51 / (double)v47;
      else
        v63 = v51;
      v10 = MEMORY[0x1E0C809B0];
      v11 = &off_1B3BDF000;
      v16 = v97;
    }
    else
    {

      v61 = 0;
      v46 = 0;
      v49 = 0.0;
      v62 = 0.0;
      v63 = 0.0;
    }
    geoTrackingTrueNorthUnavailable = v96->_geoTrackingTrueNorthUnavailable;
    _ARLogSession();
    v84 = objc_claimAutoreleasedReturnValue();
    v85 = os_log_type_enabled(v84, OS_LOG_TYPE_INFO);
    if (geoTrackingTrueNorthUnavailable)
    {
      if (v85)
      {
        v86 = (objc_class *)objc_opt_class();
        NSStringFromClass(v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v143 = v87;
        v144 = 2048;
        v145 = v96;
        v88 = "%{public}@ <%p>: True North was not available during the session";
LABEL_89:
        _os_log_impl(&dword_1B3A68000, v84, OS_LOG_TYPE_INFO, v88, buf, 0x16u);

      }
    }
    else if (v85)
    {
      v89 = (objc_class *)objc_opt_class();
      NSStringFromClass(v89);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v143 = v87;
      v144 = 2048;
      v145 = v96;
      v88 = "%{public}@ <%p>: True North was available during the session";
      goto LABEL_89;
    }

    v90 = *(int64x2_t *)&v96->_geoTrackingLowAccuracyFrameCount;
    geoTrackingHighAccuracyFrameCount = v96->_geoTrackingHighAccuracyFrameCount;
    v92 = vaddvq_s64(v90) + geoTrackingHighAccuracyFrameCount;
    v93 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(vdivq_f64(vcvtq_f64_u64((uint64x2_t)v90), (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v92), 0)), (float64x2_t)vdupq_n_s64(0x4059000000000000uLL))));
    v94 = v96->_reporter;
    v109[0] = v10;
    v109[1] = *((_QWORD *)v11 + 413);
    v109[2] = __37__ARSessionMetrics__recordSessionEnd__block_invoke_340;
    v109[3] = &unk_1E6673520;
    v109[4] = v96;
    *(double *)&v109[5] = v4;
    v95 = (double)geoTrackingHighAccuracyFrameCount / (double)v92 * 100.0;
    if (!v92)
      v95 = 0.0;
    v109[6] = v61;
    v109[7] = v46;
    v2 = v96;
    if (!v92)
      v93 = 0.0;
    *(double *)&v109[8] = v62;
    *(double *)&v109[9] = v49;
    *(double *)&v109[10] = v63;
    *(double *)&v109[11] = v93;
    v110 = v95;
    -[ARSessionMetricsReporting sendEvent:dictionary:](v94, "sendEvent:dictionary:", CFSTR("com.apple.arkit.ARGeoTracking"), v109);

    goto LABEL_70;
  }
  -[ARConfiguration getAsKindOfConfiguration:](v2->_currentConfiguration, "getAsKindOfConfiguration:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (objc_class *)objc_opt_class();
  NSStringFromClass(v26);
  v27 = objc_claimAutoreleasedReturnValue();
  -[ARSessionMetrics _recordBadFramePercentageFinal:](v2, "_recordBadFramePercentageFinal:", 1);
  if (v2->_hasInitialWorldMap && v2->_relocalizingToInitialWorldMap)
  {
    v28 = v2->_reporter;
    v138[0] = v10;
    v138[1] = 3221225472;
    v138[2] = __37__ARSessionMetrics__recordSessionEnd__block_invoke;
    v138[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
    *(double *)&v138[4] = v4;
    -[ARSessionMetricsReporting sendEvent:dictionary:](v28, "sendEvent:dictionary:", CFSTR("com.apple.arkit.ARWorldMap.loading"), v138);
  }
  if (v2->_positionInitialized)
  {
    v29 = (float)(*(float *)v2->_maxPos - *(float *)v2->_minPos)
        * (float)(*(float *)&v2->_maxPos[8] - *(float *)&v2->_minPos[8]);
    v30 = *(float *)&v2->_maxPos[4] - *(float *)&v2->_minPos[4];
  }
  else
  {
    v30 = 0.0;
    v29 = 0.0;
  }
  if (objc_msgSend(v25, "isCollaborationEnabled"))
  {
    v136 = 0u;
    v137 = 0u;
    v134 = 0u;
    v135 = 0u;
    v36 = v2->_lastUpdatedFrameAnchors;
    v37 = -[NSArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v134, v141, 16);
    if (v37)
    {
      v38 = v37;
      v39 = 0;
      v40 = *(_QWORD *)v135;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v135 != v40)
            objc_enumerationMutation(v36);
          objc_opt_class();
          v39 += objc_opt_isKindOfClass() & 1;
        }
        v38 = -[NSArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v134, v141, 16);
      }
      while (v38);
    }
    else
    {
      v39 = 0;
    }

  }
  else
  {
    v39 = 0;
  }
  v98 = (void *)v27;
  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  v64 = v2->_lastUpdatedFrameAnchors;
  v65 = -[NSArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v130, v140, 16);
  if (v65)
  {
    v66 = v65;
    v67 = 0;
    v68 = *(_QWORD *)v131;
    do
    {
      for (k = 0; k != v66; ++k)
      {
        if (*(_QWORD *)v131 != v68)
          objc_enumerationMutation(v64);
        objc_opt_class();
        v67 += objc_opt_isKindOfClass() & 1;
      }
      v66 = -[NSArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v130, v140, 16);
    }
    while (v66);
  }
  else
  {
    v67 = 0;
  }

  v70 = v2->_reporter;
  v10 = MEMORY[0x1E0C809B0];
  v123[0] = MEMORY[0x1E0C809B0];
  v11 = &off_1B3BDF000;
  v123[1] = 3221225472;
  v123[2] = __37__ARSessionMetrics__recordSessionEnd__block_invoke_2;
  v123[3] = &unk_1E66734F8;
  v123[4] = v2;
  v124 = v25;
  v128 = v29;
  v129 = v30;
  v125 = v39;
  v126 = v67;
  v127 = v4;
  v71 = v25;
  -[ARSessionMetricsReporting sendEvent:dictionary:](v70, "sendEvent:dictionary:", CFSTR("com.apple.arkit.ARWorldTracking"), v123);

  v16 = v98;
LABEL_70:
  v72 = v2->_reporter;
  v106[0] = v10;
  v73 = *((_QWORD *)v11 + 413);
  v106[1] = v73;
  v106[2] = __37__ARSessionMetrics__recordSessionEnd__block_invoke_2_344;
  v106[3] = &unk_1E66734B0;
  v106[4] = v2;
  v74 = v16;
  v107 = v74;
  v108 = v4;
  -[ARSessionMetricsReporting sendEvent:dictionary:](v72, "sendEvent:dictionary:", CFSTR("com.apple.arkit.session"), v106);
  -[ARConfiguration videoFormat](v2->_currentConfiguration, "videoFormat");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v75;
  if (v75)
  {
    v77 = v2->_reporter;
    v102[0] = v10;
    v102[1] = v73;
    v102[2] = __37__ARSessionMetrics__recordSessionEnd__block_invoke_3_345;
    v102[3] = &unk_1E6673548;
    v103 = v75;
    v104 = v74;
    v105 = v2;
    -[ARSessionMetricsReporting sendEvent:dictionary:](v77, "sendEvent:dictionary:", CFSTR("com.apple.arkit.videoformat"), v102);

  }
  if (s_replayStats)
    -[ARSessionMetricsReporting sendEvent:dictionary:](v2->_reporter, "sendEvent:dictionary:", CFSTR("com.apple.arkit.ARReplay"), &__block_literal_global_25);
  if (v2->_coachingOverlayActivationCount)
  {
    v78 = v2->_reporter;
    v101[0] = v10;
    v101[1] = v73;
    v101[2] = __37__ARSessionMetrics__recordSessionEnd__block_invoke_5_350;
    v101[3] = &unk_1E66733A0;
    v101[4] = v2;
    -[ARSessionMetricsReporting sendEvent:dictionary:](v78, "sendEvent:dictionary:", CFSTR("com.apple.arkit.ARCoachingOverlay"), v101);
  }
  hitTestReportingMap();
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v79, "count"))
  {
    v100[0] = v10;
    v100[1] = v73;
    v100[2] = __37__ARSessionMetrics__recordSessionEnd__block_invoke_6;
    v100[3] = &unk_1E6673590;
    v100[4] = v2;
    *(double *)&v100[5] = v4;
    objc_msgSend(v79, "enumerateKeysAndObjectsUsingBlock:", v100);
  }
  v80 = v2->_currentConfiguration;
  v2->_currentConfiguration = 0;

  v2->_sessionWasThrottled = 0;
  v81 = (void *)s_replayStats;
  s_replayStats = 0;

  v2->_coachingOverlayActivationCount = 0;
}

id __37__ARSessionMetrics__recordSessionEnd__block_invoke(uint64_t a1)
{
  double v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C9AAA0];
  v6[0] = CFSTR("success");
  v6[1] = CFSTR("duration");
  v1 = *(double *)(a1 + 32);
  *(float *)&v1 = v1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v2;
  v6[2] = CFSTR("bundleID");
  bundleID();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __37__ARSessionMetrics__recordSessionEnd__block_invoke_2(uint64_t a1, double a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
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
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[27];
  _QWORD v48[29];

  v48[27] = *MEMORY[0x1E0C80C00];
  v47[0] = CFSTR("area");
  LODWORD(a2) = *(_DWORD *)(a1 + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v46;
  v47[1] = CFSTR("badFramePercentage10s");
  LODWORD(v3) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v45;
  v47[2] = CFSTR("badFramePercentage60s");
  LODWORD(v4) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 28);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v44;
  v47[3] = CFSTR("badFramePercentageMoreThan60s");
  LODWORD(v5) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v43;
  v47[4] = CFSTR("collaborativeSessionEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isCollaborationEnabled"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v42;
  v47[5] = CFSTR("collaborativeSessionMaximumNumberOfUsers");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v48[5] = v41;
  v47[6] = CFSTR("environmentTexturingHdrEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "wantsHDREnvironmentTextures"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v48[6] = v40;
  v47[7] = CFSTR("environmentTexturingMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "environmentTexturing"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v48[7] = v39;
  v47[8] = CFSTR("frameSemantics");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "frameSemantics"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v48[8] = v38;
  v47[9] = CFSTR("heightDelta");
  LODWORD(v6) = *(_DWORD *)(a1 + 76);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v48[9] = v37;
  v47[10] = CFSTR("maximumNumberOfTrackedImages");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "maximumNumberOfTrackedImages"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v48[10] = v36;
  v47[11] = CFSTR("numberOfDetectedPlanes");
  *(float *)&v7 = (float)*(unint64_t *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v48[11] = v35;
  v47[12] = CFSTR("numberOfDetectionImages");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "detectionImages");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v9 = (float)(unint64_t)objc_msgSend(v34, "count");
  objc_msgSend(v8, "numberWithFloat:", v9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v48[12] = v33;
  v47[13] = CFSTR("numberOfDetectionObjects");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "detectionObjects");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v11 = (float)(unint64_t)objc_msgSend(v32, "count");
  objc_msgSend(v10, "numberWithFloat:", v11);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v48[13] = v31;
  v47[14] = CFSTR("numberOfRaycasts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v48[14] = v30;
  v47[15] = CFSTR("planeDetectionMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "planeDetection"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v48[15] = v29;
  v47[16] = CFSTR("sceneReconstruction");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "sceneReconstruction"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v48[16] = v28;
  v47[17] = CFSTR("userFaceTrackingEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "userFaceTrackingEnabled"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v48[17] = v27;
  v47[18] = CFSTR("vioInitializationTime");
  v12 = *(double *)(*(_QWORD *)(a1 + 32) + 104);
  *(float *)&v12 = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v48[18] = v26;
  v47[19] = CFSTR("automaticImageScaleEstimationEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "automaticImageScaleEstimationEnabled"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v48[19] = v13;
  v47[20] = CFSTR("bundleID");
  bundleID();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48[20] = v14;
  v47[21] = CFSTR("numberOfCameraSwitches");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v48[21] = v15;
  v47[22] = CFSTR("numberOfReinitializationAttempts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v48[22] = v16;
  v47[23] = CFSTR("vioMapSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v48[23] = v17;
  v47[24] = CFSTR("timeToThrottle");
  v19 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v19 + 17))
    LODWORD(v18) = *(_DWORD *)(v19 + 20);
  else
    LODWORD(v18) = -1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v48[24] = v20;
  v47[25] = CFSTR("duration");
  v21 = *(double *)(a1 + 64);
  *(float *)&v21 = v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v48[25] = v22;
  v47[26] = CFSTR("appClipCodeTrackingEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "appClipCodeTrackingEnabled"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v48[26] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

id __37__ARSessionMetrics__recordSessionEnd__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("numberOfTrackingImages");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "trackingImages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = (float)(unint64_t)objc_msgSend(v3, "count");
  objc_msgSend(v2, "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v10[1] = CFSTR("maximumNumberOfTrackedImages");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "maximumNumberOfTrackedImages"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  v10[2] = CFSTR("bundleID");
  bundleID();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __37__ARSessionMetrics__recordSessionEnd__block_invoke_4(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("maximumNumberOfTrackedFaces");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  *(float *)&v3 = (float)objc_msgSend(*(id *)(a1 + 32), "maximumNumberOfTrackedFaces");
  objc_msgSend(v2, "numberWithFloat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = CFSTR("worldTrackingEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "isWorldTrackingEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  v9[2] = CFSTR("bundleID");
  bundleID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __37__ARSessionMetrics__recordSessionEnd__block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("automaticSkeletonScaleEstimationEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "automaticSkeletonScaleEstimationEnabled"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = CFSTR("bundleID");
  v6[0] = v1;
  bundleID();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __37__ARSessionMetrics__recordSessionEnd__block_invoke_340(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[30];
  _QWORD v58[32];

  v58[30] = *MEMORY[0x1E0C80C00];
  v57[0] = CFSTR("localized");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(double *)(*(_QWORD *)(a1 + 32) + 256) > 0.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v56;
  v57[1] = CFSTR("trueNorthUnavailable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 241));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v55;
  v57[2] = CFSTR("failureReason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v54;
  v57[3] = CFSTR("initializationTime");
  v2 = *(double *)(*(_QWORD *)(a1 + 32) + 248);
  *(float *)&v2 = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v58[3] = v53;
  v57[4] = CFSTR("localizationTime");
  v3 = *(double *)(*(_QWORD *)(a1 + 32) + 256);
  *(float *)&v3 = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v58[4] = v52;
  v57[5] = CFSTR("clFirstGps");
  v4 = *(double *)(*(_QWORD *)(a1 + 32) + 304);
  *(float *)&v4 = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v58[5] = v51;
  v57[6] = CFSTR("clFirstNonGps");
  v5 = *(double *)(*(_QWORD *)(a1 + 32) + 312);
  *(float *)&v5 = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v58[6] = v50;
  v57[7] = CFSTR("clFirstDem");
  v6 = *(double *)(*(_QWORD *)(a1 + 32) + 320);
  *(float *)&v6 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v58[7] = v49;
  v57[8] = CFSTR("angleFirstUp");
  v7 = *(double *)(*(_QWORD *)(a1 + 32) + 328);
  *(float *)&v7 = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v58[8] = v48;
  v57[9] = CFSTR("angleBackToDown");
  v8 = *(double *)(*(_QWORD *)(a1 + 32) + 336);
  *(float *)&v8 = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v58[9] = v47;
  v57[10] = CFSTR("vlBeforeAvailabilityCall");
  v9 = *(double *)(*(_QWORD *)(a1 + 32) + 344);
  *(float *)&v9 = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v58[10] = v46;
  v57[11] = CFSTR("vlAfterAvailabilityCall");
  v10 = *(double *)(*(_QWORD *)(a1 + 32) + 352);
  *(float *)&v10 = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v58[11] = v45;
  v57[12] = CFSTR("vlBeforeLocalizationCall");
  v11 = *(double *)(*(_QWORD *)(a1 + 32) + 360);
  *(float *)&v11 = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v58[12] = v44;
  v57[13] = CFSTR("vlAfterLocalizationCall");
  v12 = *(double *)(*(_QWORD *)(a1 + 32) + 368);
  *(float *)&v12 = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v58[13] = v43;
  v57[14] = CFSTR("vlFirstNonLocalized");
  v13 = *(double *)(*(_QWORD *)(a1 + 32) + 376);
  *(float *)&v13 = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v58[14] = v42;
  v57[15] = CFSTR("vioFirstPose");
  v14 = *(double *)(*(_QWORD *)(a1 + 32) + 384);
  *(float *)&v14 = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v58[15] = v41;
  v57[16] = CFSTR("vioFirstNormalPose");
  v15 = *(double *)(*(_QWORD *)(a1 + 32) + 392);
  *(float *)&v15 = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v58[16] = v40;
  v57[17] = CFSTR("vioBackToLimited");
  v16 = *(double *)(*(_QWORD *)(a1 + 32) + 400);
  *(float *)&v16 = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v58[17] = v39;
  v57[18] = CFSTR("firstImage");
  v17 = *(double *)(*(_QWORD *)(a1 + 32) + 408);
  *(float *)&v17 = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v58[18] = v38;
  v57[19] = CFSTR("sessionEnd");
  v18 = *(double *)(a1 + 40);
  *(float *)&v18 = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v58[19] = v37;
  v57[20] = CFSTR("numberOfLocalizations");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 288));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v58[20] = v19;
  v57[21] = CFSTR("numberOfGeoAnchors");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v58[21] = v20;
  v57[22] = CFSTR("numberOfGeoAnchorsWithUserDefinedAltitude");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v58[22] = v21;
  v57[23] = CFSTR("minGeoAnchorDistance");
  v22 = *(double *)(a1 + 64);
  *(float *)&v22 = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v58[23] = v23;
  v57[24] = CFSTR("maxGeoAnchorDistance");
  v24 = *(double *)(a1 + 72);
  *(float *)&v24 = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v58[24] = v25;
  v57[25] = CFSTR("meanGeoAnchorDistance");
  v26 = *(double *)(a1 + 80);
  *(float *)&v26 = v26;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v58[25] = v27;
  v57[26] = CFSTR("lowAccuracyFramePercentage");
  LODWORD(v28) = *(_DWORD *)(a1 + 88);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v58[26] = v29;
  v57[27] = CFSTR("mediumAccuracyFramePercentage");
  LODWORD(v30) = *(_DWORD *)(a1 + 92);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v58[27] = v31;
  v57[28] = CFSTR("highAccuracyFramePercentage");
  LODWORD(v32) = *(_DWORD *)(a1 + 96);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v58[28] = v33;
  v57[29] = CFSTR("bundleID");
  bundleID();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v58[29] = v34;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 30);
  v36 = (id)objc_claimAutoreleasedReturnValue();

  return v36;
}

id __37__ARSessionMetrics__recordSessionEnd__block_invoke_2_344(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[7];
  _QWORD v17[8];

  v17[7] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("autofocus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = CFSTR("configuration");
  v3 = *(void **)(a1 + 40);
  v4 = v3;
  if (!v3)
  {
    NSStringFromClass(*(Class *)(*(_QWORD *)(a1 + 32) + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v4;
  v16[2] = CFSTR("duration");
  v5 = *(double *)(a1 + 48);
  *(float *)&v5 = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = s_reportedRendererString;
  if (!s_reportedRendererString)
    v8 = s_rendererString;
  v17[2] = v6;
  v17[3] = v8;
  v16[3] = CFSTR("renderer");
  v16[4] = CFSTR("bundleID");
  bundleID();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v9;
  v16[5] = CFSTR("frameSemantics");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "frameSemantics"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v10;
  v16[6] = CFSTR("timeToThrottle");
  v12 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v12 + 17))
    LODWORD(v11) = *(_DWORD *)(v12 + 20);
  else
    LODWORD(v11) = -1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  return v14;
}

id __37__ARSessionMetrics__recordSessionEnd__block_invoke_3_345(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[8];
  _QWORD v18[10];

  v18[8] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("captureDevicePosition");
  NSStringFromAVCaptureDevicePosition(objc_msgSend(*(id *)(a1 + 32), "captureDevicePosition"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v2;
  v17[1] = CFSTR("configuration");
  v3 = *(void **)(a1 + 40);
  v4 = v3;
  if (!v3)
  {
    NSStringFromClass(*(Class *)(*(_QWORD *)(a1 + 48) + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[1] = v4;
  v17[2] = CFSTR("imageResolution");
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "imageResolution");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "imageResolution");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%.0fx%.0f"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v9;
  v17[3] = CFSTR("framesPerSecond");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "framesPerSecond"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v10;
  v17[4] = CFSTR("videoHDRSupported");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isVideoHDRSupported"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v11;
  v17[5] = CFSTR("nonBinned");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isRecommendedForHighResolutionFrameCapturing"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v12;
  v17[6] = CFSTR("hiResFrameCaptureCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 216));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v13;
  v17[7] = CFSTR("bundleID");
  bundleID();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  return v15;
}

id __37__ARSessionMetrics__recordSessionEnd__block_invoke_4_349()
{
  unsigned int v0;
  const __CFString *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("format");
  v0 = objc_msgSend((id)s_replayStats, "recordingFormat");
  if (v0 > 7)
    v1 = CFSTR("Unknown");
  else
    v1 = off_1E6673648[v0];
  v10[0] = v1;
  v9[1] = CFSTR("recordingDevice");
  objc_msgSend((id)s_replayStats, "deviceModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v2;
  v9[2] = CFSTR("recordingARKitVersion");
  objc_msgSend((id)s_replayStats, "arkitVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v3;
  v9[3] = CFSTR("recordingOSVersion");
  objc_msgSend((id)s_replayStats, "osVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v4;
  v9[4] = CFSTR("fileName");
  objc_msgSend((id)s_replayStats, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v5;
  v9[5] = CFSTR("bundleID");
  bundleID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __37__ARSessionMetrics__recordSessionEnd__block_invoke_5_350(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("activationCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("goal");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("bundleID");
  bundleID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __37__ARSessionMetrics__recordSessionEnd__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__ARSessionMetrics__recordSessionEnd__block_invoke_7;
  v10[3] = &unk_1E66734B0;
  v11 = v5;
  v12 = v6;
  v13 = *(_QWORD *)(a1 + 40);
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "sendEvent:dictionary:", CFSTR("com.apple.arkit.ARHitTest"), v10);

}

id __37__ARSessionMetrics__recordSessionEnd__block_invoke_7(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  float v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v12[0] = v3;
  v11[0] = CFSTR("type");
  v11[1] = CFSTR("numberOfHitTestsPerSecond");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "floatValue");
  v6 = v5 / *(double *)(a1 + 48);
  *(float *)&v6 = v6;
  objc_msgSend(v4, "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  v11[2] = CFSTR("bundleID");
  bundleID();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_recordBadFramePercentageFinal:(BOOL)a3
{
  double v5;
  double *p_sessionTimeForLastBadFrameRecording;
  uint64_t v7;
  float v8;

  if (self->_frameCount >= 0xA)
  {
    -[NSDate timeIntervalSinceNow](self->_frameStartDate, "timeIntervalSinceNow");
    if (v5 < -10.0)
    {
      p_sessionTimeForLastBadFrameRecording = &self->_sessionTimeForLastBadFrameRecording;
      if (self->_sessionTimeForLastBadFrameRecording < 10.0)
      {
        v7 = 24;
LABEL_8:
        *p_sessionTimeForLastBadFrameRecording = -v5;
LABEL_9:
        v8 = (double)self->_badFrameCount / (double)self->_frameCount * 100.0;
        *(float *)((char *)&self->super.isa + v7) = v8;
        return;
      }
    }
    if (v5 >= -60.0)
      return;
    p_sessionTimeForLastBadFrameRecording = &self->_sessionTimeForLastBadFrameRecording;
    if (self->_sessionTimeForLastBadFrameRecording < 60.0)
    {
      v7 = 28;
      goto LABEL_8;
    }
    if (a3)
    {
      v7 = 32;
      goto LABEL_9;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedFrameLocation, 0);
  objc_storeStrong((id *)&self->_lastUpdatedFrameAnchors, 0);
  objc_storeStrong((id *)&self->_frameStartDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
}

@end
