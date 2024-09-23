@implementation CinematicFramingSessionOptions

- (CinematicFramingSessionOptions)initWithPlistPath:(id)a3
{
  id v4;
  CinematicFramingSessionOptions *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CinematicFramingSessionOptions;
  v5 = -[CinematicFramingSessionOptions init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CinematicFramingSessionOptions initWithPlist:](v5, "initWithPlist:", v6);

  }
  return v5;
}

- (CinematicFramingSessionOptions)initWithPlist:(id)a3
{
  id v4;
  CinematicFramingSessionOptions *v5;
  CinematicFramingSessionFramingParameters *v6;
  void *v7;
  CinematicFramingSessionFramingParameters *v8;
  CinematicFramingSessionFramingParameters *v9;
  void *v10;
  CinematicFramingSessionFramingParameters *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  void *v32;
  __CFString *v33;
  __CFString *v34;
  void *v35;
  __CFString *v36;
  __CFString *v37;
  __CFString *v38;
  __CFString *v39;
  __CFString *v40;
  __CFString *v41;
  __CFString *v42;
  __CFString *v43;
  __CFString *v44;
  __CFString *v45;
  __CFString *v46;
  __CFString *v47;
  __CFString *v48;
  __CFString *v49;
  __CFString *v50;
  __CFString *v51;
  __CFString *v52;
  __CFString *v53;
  __CFString *v54;
  __CFString *v55;
  __CFString *v56;
  __CFString *v57;
  __CFString *v58;
  __CFString *v59;
  __CFString *v60;
  __CFString *v61;
  double v62;
  __CFString *v63;
  __CFString *v64;
  double v65;
  __CFString *v66;
  __CFString *v67;
  CinematicFramingSessionOptions *v68;
  objc_super v70;

  v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)CinematicFramingSessionOptions;
  v5 = -[CinematicFramingSessionOptions init](&v70, sel_init);
  if (v5)
  {
    v6 = [CinematicFramingSessionFramingParameters alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("singlePersonFramingParameters"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CinematicFramingSessionFramingParameters initWithPlist:](v6, "initWithPlist:", v7);
    -[CinematicFramingSessionOptions setSinglePersonFramingParameters:](v5, "setSinglePersonFramingParameters:", v8);

    v9 = [CinematicFramingSessionFramingParameters alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("multiPersonFramingParameters"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CinematicFramingSessionFramingParameters initWithPlist:](v9, "initWithPlist:", v10);
    -[CinematicFramingSessionOptions setMultiPersonFramingParameters:](v5, "setMultiPersonFramingParameters:", v11);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("horizontalSpeedMultiplier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    -[CinematicFramingSessionOptions setHorizontalSpeedMultiplier:](v5, "setHorizontalSpeedMultiplier:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("horizontalAccelerationMultiplier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    -[CinematicFramingSessionOptions setHorizontalAccelerationMultiplier:](v5, "setHorizontalAccelerationMultiplier:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("verticalSpeedMultiplier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    -[CinematicFramingSessionOptions setVerticalSpeedMultiplier:](v5, "setVerticalSpeedMultiplier:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("verticalAccelerationMultiplier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    -[CinematicFramingSessionOptions setVerticalAccelerationMultiplier:](v5, "setVerticalAccelerationMultiplier:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("zoomInSpeedMultiplier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    -[CinematicFramingSessionOptions setZoomInSpeedMultiplier:](v5, "setZoomInSpeedMultiplier:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("zoomOutSpeedMultiplier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    -[CinematicFramingSessionOptions setZoomOutSpeedMultiplier:](v5, "setZoomOutSpeedMultiplier:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("zoomAccelerationMultiplier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    -[CinematicFramingSessionOptions setZoomAccelerationMultiplier:](v5, "setZoomAccelerationMultiplier:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldDisableTransitions"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CinematicFramingSessionOptions setShouldDisableTransitions:](v5, "setShouldDisableTransitions:", objc_msgSend(v19, "BOOLValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("zoomEaseInCurve"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("A"));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (!v21)
      v21 = CFSTR("1.0");
    -[__CFString floatValue](v21, "floatValue");
    -[CinematicFramingSessionOptions setZoomEaseInCurveA:](v5, "setZoomEaseInCurveA:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("zoomEaseInCurve"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("B"));
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (!v24)
      v24 = CFSTR("0.2");
    -[__CFString floatValue](v24, "floatValue");
    -[CinematicFramingSessionOptions setZoomEaseInCurveB:](v5, "setZoomEaseInCurveB:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("xEaseInCurve"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("A"));
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (!v27)
      v27 = CFSTR("4.0");
    -[__CFString floatValue](v27, "floatValue");
    -[CinematicFramingSessionOptions setXEaseInCurveA:](v5, "setXEaseInCurveA:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("xEaseInCurve"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("B"));
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (!v30)
      v30 = CFSTR("0.2");
    -[__CFString floatValue](v30, "floatValue");
    -[CinematicFramingSessionOptions setXEaseInCurveB:](v5, "setXEaseInCurveB:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("yEaseInCurve"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("A"));
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (!v33)
      v33 = CFSTR("2.5");
    -[__CFString floatValue](v33, "floatValue");
    -[CinematicFramingSessionOptions setYEaseInCurveA:](v5, "setYEaseInCurveA:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("yEaseInCurve"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("B"));
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (!v36)
      v36 = CFSTR("0.2");
    -[__CFString floatValue](v36, "floatValue");
    -[CinematicFramingSessionOptions setYEaseInCurveB:](v5, "setYEaseInCurveB:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewportDefaultFOV"));
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (!v38)
      v38 = CFSTR("0.68");
    -[__CFString floatValue](v38, "floatValue");
    -[CinematicFramingSessionOptions setViewportDefaultFOV:](v5, "setViewportDefaultFOV:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewportMinimumFOV"));
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (!v40)
      v40 = CFSTR("0.34");
    -[__CFString floatValue](v40, "floatValue");
    -[CinematicFramingSessionOptions setViewportMinimumFOV:](v5, "setViewportMinimumFOV:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deadbandRecenteringInitialDelaySec"));
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (!v42)
      v42 = CFSTR("3.0");
    -[__CFString floatValue](v42, "floatValue");
    -[CinematicFramingSessionOptions setDeadbandRecenteringInitialDelaySec:](v5, "setDeadbandRecenteringInitialDelaySec:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deadbandRecenteringDurationSec"));
    v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (!v44)
      v44 = CFSTR("1.5");
    -[__CFString floatValue](v44, "floatValue");
    -[CinematicFramingSessionOptions setDeadbandRecenteringDurationSec:](v5, "setDeadbandRecenteringDurationSec:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deadbandRecenteringIdleDurationSec"));
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (!v46)
      v46 = CFSTR("5.0");
    -[__CFString floatValue](v46, "floatValue");
    -[CinematicFramingSessionOptions setDeadbandRecenteringIdleDurationSec:](v5, "setDeadbandRecenteringIdleDurationSec:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("noPeopleDelayBeforeReturningHomeSec"));
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (!v48)
      v48 = CFSTR("5.0");
    -[__CFString floatValue](v48, "floatValue");
    -[CinematicFramingSessionOptions setNoPeopleDelayBeforeReturningHomeSec:](v5, "setNoPeopleDelayBeforeReturningHomeSec:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("noPeopleReturningHomeDurationSec"));
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (!v50)
      v50 = CFSTR("5.0");
    -[__CFString floatValue](v50, "floatValue");
    -[CinematicFramingSessionOptions setNoPeopleReturningHomeDurationSec:](v5, "setNoPeopleReturningHomeDurationSec:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tinyHeadMinValue"));
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (!v52)
      v52 = CFSTR("0.0");
    -[__CFString floatValue](v52, "floatValue");
    -[CinematicFramingSessionOptions setTinyHeadMinValue:](v5, "setTinyHeadMinValue:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tinyHeadMaxValue"));
    v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v55 = v54;
    if (!v54)
      v54 = CFSTR("0.0");
    -[__CFString floatValue](v54, "floatValue");
    -[CinematicFramingSessionOptions setTinyHeadMaxValue:](v5, "setTinyHeadMaxValue:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subjectMovementTolerance"));
    v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    if (!v56)
      v56 = CFSTR("0.2");
    -[__CFString floatValue](v56, "floatValue");
    -[CinematicFramingSessionOptions setSubjectMovementTolerance:](v5, "setSubjectMovementTolerance:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recenterAfterDriftEnabled"));
    v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v59 = v58;
    if (!v58)
      v58 = CFSTR("true");
    -[CinematicFramingSessionOptions setRecenterAfterDriftEnabled:](v5, "setRecenterAfterDriftEnabled:", -[__CFString BOOLValue](v58, "BOOLValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recenterAfterDriftDurationThreshold"));
    v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v61 = v60;
    if (!v60)
      v60 = CFSTR("1.0");
    *(float *)&v62 = (float)-[__CFString BOOLValue](v60, "BOOLValue");
    -[CinematicFramingSessionOptions setRecenterAfterDriftDurationThreshold:](v5, "setRecenterAfterDriftDurationThreshold:", v62);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recenterAfterDriftOffsetThreshold"));
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v64 = v63;
    if (!v63)
      v63 = CFSTR("0.25");
    *(float *)&v65 = (float)-[__CFString BOOLValue](v63, "BOOLValue");
    -[CinematicFramingSessionOptions setRecenterAfterDriftOffsetThreshold:](v5, "setRecenterAfterDriftOffsetThreshold:", v65);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inferSubjectBodyFromFaceLocation"));
    v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v67 = v66;
    if (!v66)
      v66 = CFSTR("true");
    -[CinematicFramingSessionOptions setInferSubjectBodyFromFaceLocation:](v5, "setInferSubjectBodyFromFaceLocation:", -[__CFString BOOLValue](v66, "BOOLValue"));

    -[CinematicFramingSessionOptions loadFramingStyleSpecificOptions:](v5, "loadFramingStyleSpecificOptions:", v4);
    v68 = v5;
  }

  return v5;
}

- (id)asDictionary
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
  void *v14;
  void *v15;
  void *v16;
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
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[27];
  _QWORD v72[29];

  v72[27] = *MEMORY[0x1E0C80C00];
  v71[0] = CFSTR("singlePersonFramingParameters");
  -[CinematicFramingSessionOptions singlePersonFramingParameters](self, "singlePersonFramingParameters");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "asDictionary");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v63;
  v71[1] = CFSTR("multiPersonFramingParameters");
  -[CinematicFramingSessionOptions multiPersonFramingParameters](self, "multiPersonFramingParameters");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "asDictionary");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v61;
  v71[2] = CFSTR("horizontalSpeedMultiplier");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions horizontalSpeedMultiplier](self, "horizontalSpeedMultiplier");
  objc_msgSend(v3, "numberWithFloat:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = v60;
  v71[3] = CFSTR("horizontalAccelerationMultiplier");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions horizontalAccelerationMultiplier](self, "horizontalAccelerationMultiplier");
  objc_msgSend(v4, "numberWithFloat:");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v72[3] = v59;
  v71[4] = CFSTR("verticalSpeedMultiplier");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions verticalSpeedMultiplier](self, "verticalSpeedMultiplier");
  objc_msgSend(v5, "numberWithFloat:");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v72[4] = v58;
  v71[5] = CFSTR("verticalAccelerationMultiplier");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions verticalAccelerationMultiplier](self, "verticalAccelerationMultiplier");
  objc_msgSend(v6, "numberWithFloat:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v72[5] = v57;
  v71[6] = CFSTR("zoomInSpeedMultiplier");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions zoomInSpeedMultiplier](self, "zoomInSpeedMultiplier");
  objc_msgSend(v7, "numberWithFloat:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v72[6] = v56;
  v71[7] = CFSTR("zoomOutSpeedMultiplier");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions zoomOutSpeedMultiplier](self, "zoomOutSpeedMultiplier");
  objc_msgSend(v8, "numberWithFloat:");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v72[7] = v55;
  v71[8] = CFSTR("zoomAccelerationMultiplier");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions zoomAccelerationMultiplier](self, "zoomAccelerationMultiplier");
  objc_msgSend(v9, "numberWithFloat:");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v72[8] = v54;
  v71[9] = CFSTR("shouldDisableTransitions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CinematicFramingSessionOptions shouldDisableTransitions](self, "shouldDisableTransitions"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v72[9] = v53;
  v71[10] = CFSTR("zoomEaseInCurve");
  v69[0] = CFSTR("A");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions zoomEaseInCurveA](self, "zoomEaseInCurveA");
  objc_msgSend(v10, "numberWithFloat:");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = CFSTR("B");
  v70[0] = v52;
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions zoomEaseInCurveB](self, "zoomEaseInCurveB");
  objc_msgSend(v11, "numberWithFloat:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v51;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v72[10] = v50;
  v71[11] = CFSTR("xEaseInCurve");
  v67[0] = CFSTR("A");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions xEaseInCurveA](self, "xEaseInCurveA");
  objc_msgSend(v12, "numberWithFloat:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = CFSTR("B");
  v68[0] = v49;
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions xEaseInCurveB](self, "xEaseInCurveB");
  objc_msgSend(v13, "numberWithFloat:");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = v48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v72[11] = v47;
  v71[12] = CFSTR("yEaseInCurve");
  v65[0] = CFSTR("A");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions yEaseInCurveA](self, "yEaseInCurveA");
  objc_msgSend(v14, "numberWithFloat:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = CFSTR("B");
  v66[0] = v46;
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions yEaseInCurveB](self, "yEaseInCurveB");
  objc_msgSend(v15, "numberWithFloat:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v45;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v72[12] = v44;
  v71[13] = CFSTR("viewportDefaultFOV");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions viewportDefaultFOV](self, "viewportDefaultFOV");
  objc_msgSend(v16, "numberWithFloat:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v72[13] = v43;
  v71[14] = CFSTR("viewportMinimumFOV");
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions viewportMinimumFOV](self, "viewportMinimumFOV");
  objc_msgSend(v17, "numberWithFloat:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v72[14] = v42;
  v71[15] = CFSTR("deadbandRecenteringInitialDelaySec");
  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions deadbandRecenteringInitialDelaySec](self, "deadbandRecenteringInitialDelaySec");
  objc_msgSend(v18, "numberWithFloat:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v72[15] = v41;
  v71[16] = CFSTR("deadbandRecenteringDurationSec");
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions deadbandRecenteringDurationSec](self, "deadbandRecenteringDurationSec");
  objc_msgSend(v19, "numberWithFloat:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v72[16] = v40;
  v71[17] = CFSTR("deadbandRecenteringIdleDurationSec");
  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions deadbandRecenteringIdleDurationSec](self, "deadbandRecenteringIdleDurationSec");
  objc_msgSend(v20, "numberWithFloat:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v72[17] = v39;
  v71[18] = CFSTR("noPeopleDelayBeforeReturningHomeSec");
  v21 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions noPeopleDelayBeforeReturningHomeSec](self, "noPeopleDelayBeforeReturningHomeSec");
  objc_msgSend(v21, "numberWithFloat:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v72[18] = v22;
  v71[19] = CFSTR("noPeopleReturningHomeDurationSec");
  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions noPeopleReturningHomeDurationSec](self, "noPeopleReturningHomeDurationSec");
  objc_msgSend(v23, "numberWithFloat:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v72[19] = v24;
  v71[20] = CFSTR("tinyHeadMinValue");
  v25 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions tinyHeadMinValue](self, "tinyHeadMinValue");
  objc_msgSend(v25, "numberWithFloat:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v72[20] = v26;
  v71[21] = CFSTR("tinyHeadMaxValue");
  v27 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions tinyHeadMaxValue](self, "tinyHeadMaxValue");
  objc_msgSend(v27, "numberWithFloat:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v72[21] = v28;
  v71[22] = CFSTR("subjectMovementTolerance");
  v29 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions subjectMovementTolerance](self, "subjectMovementTolerance");
  objc_msgSend(v29, "numberWithFloat:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v72[22] = v30;
  v71[23] = CFSTR("recenterAfterDriftEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CinematicFramingSessionOptions recenterAfterDriftEnabled](self, "recenterAfterDriftEnabled"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v72[23] = v31;
  v71[24] = CFSTR("recenterAfterDriftDurationThreshold");
  v32 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions recenterAfterDriftDurationThreshold](self, "recenterAfterDriftDurationThreshold");
  objc_msgSend(v32, "numberWithFloat:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v72[24] = v33;
  v71[25] = CFSTR("recenterAfterDriftOffsetThreshold");
  v34 = (void *)MEMORY[0x1E0CB37E8];
  -[CinematicFramingSessionOptions recenterAfterDriftOffsetThreshold](self, "recenterAfterDriftOffsetThreshold");
  objc_msgSend(v34, "numberWithFloat:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v72[25] = v35;
  v71[26] = CFSTR("inferSubjectBodyFromFaceLocation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CinematicFramingSessionOptions inferSubjectBodyFromFaceLocation](self, "inferSubjectBodyFromFaceLocation"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v72[26] = v36;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 27);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (void)loadFramingStyleSpecificOptions:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *framingStyleSpecificOptions;
  void *v6;
  uint64_t i;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  CinematicFramingSessionOptions *v12;
  id v13;

  v13 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  framingStyleSpecificOptions = self->_framingStyleSpecificOptions;
  self->_framingStyleSpecificOptions = v4;

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("framingStyleOverrides"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    for (i = 0; i <= 2; ++i)
    {
      v8 = off_1E98A7790[i];
      -[NSMutableDictionary objectForKeyedSubscript:](self->_framingStyleSpecificOptions, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = (void *)objc_msgSend(v13, "mutableCopy");
        objc_msgSend(v10, "removeObjectForKey:", CFSTR("framingStyleOverrides"));
        objc_msgSend(v6, "objectForKeyedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setValuesForKeysWithDictionary:", v11);
        v12 = -[CinematicFramingSessionOptions initWithPlist:]([CinematicFramingSessionOptions alloc], "initWithPlist:", v10);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_framingStyleSpecificOptions, "setObject:forKeyedSubscript:", v12, v8);

      }
    }
  }

}

- (id)optionsForFramingStyle:(int)a3
{
  const __CFString *v4;
  void *v5;

  if ((a3 - 2) < 2)
  {
    v4 = CFSTR("Newsroom");
LABEL_7:
    -[NSMutableDictionary objectForKeyedSubscript:](self->_framingStyleSpecificOptions, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  if (a3 == 1)
  {
    v4 = CFSTR("Floating");
    goto LABEL_7;
  }
  if (!a3)
    return self;
  v5 = 0;
  return v5;
}

- (CinematicFramingSessionFramingParameters)singlePersonFramingParameters
{
  return self->singlePersonFramingParameters;
}

- (void)setSinglePersonFramingParameters:(id)a3
{
  objc_storeStrong((id *)&self->singlePersonFramingParameters, a3);
}

- (CinematicFramingSessionFramingParameters)multiPersonFramingParameters
{
  return self->multiPersonFramingParameters;
}

- (void)setMultiPersonFramingParameters:(id)a3
{
  objc_storeStrong((id *)&self->multiPersonFramingParameters, a3);
}

- (float)horizontalSpeedMultiplier
{
  return self->horizontalSpeedMultiplier;
}

- (void)setHorizontalSpeedMultiplier:(float)a3
{
  self->horizontalSpeedMultiplier = a3;
}

- (float)horizontalAccelerationMultiplier
{
  return self->horizontalAccelerationMultiplier;
}

- (void)setHorizontalAccelerationMultiplier:(float)a3
{
  self->horizontalAccelerationMultiplier = a3;
}

- (float)verticalSpeedMultiplier
{
  return self->verticalSpeedMultiplier;
}

- (void)setVerticalSpeedMultiplier:(float)a3
{
  self->verticalSpeedMultiplier = a3;
}

- (float)verticalAccelerationMultiplier
{
  return self->verticalAccelerationMultiplier;
}

- (void)setVerticalAccelerationMultiplier:(float)a3
{
  self->verticalAccelerationMultiplier = a3;
}

- (float)zoomInSpeedMultiplier
{
  return self->zoomInSpeedMultiplier;
}

- (void)setZoomInSpeedMultiplier:(float)a3
{
  self->zoomInSpeedMultiplier = a3;
}

- (float)zoomOutSpeedMultiplier
{
  return self->zoomOutSpeedMultiplier;
}

- (void)setZoomOutSpeedMultiplier:(float)a3
{
  self->zoomOutSpeedMultiplier = a3;
}

- (float)zoomAccelerationMultiplier
{
  return self->zoomAccelerationMultiplier;
}

- (void)setZoomAccelerationMultiplier:(float)a3
{
  self->zoomAccelerationMultiplier = a3;
}

- (BOOL)shouldDisableTransitions
{
  return self->shouldDisableTransitions;
}

- (void)setShouldDisableTransitions:(BOOL)a3
{
  self->shouldDisableTransitions = a3;
}

- (float)zoomEaseInCurveA
{
  return self->zoomEaseInCurveA;
}

- (void)setZoomEaseInCurveA:(float)a3
{
  self->zoomEaseInCurveA = a3;
}

- (float)zoomEaseInCurveB
{
  return self->zoomEaseInCurveB;
}

- (void)setZoomEaseInCurveB:(float)a3
{
  self->zoomEaseInCurveB = a3;
}

- (float)xEaseInCurveA
{
  return self->xEaseInCurveA;
}

- (void)setXEaseInCurveA:(float)a3
{
  self->xEaseInCurveA = a3;
}

- (float)xEaseInCurveB
{
  return self->xEaseInCurveB;
}

- (void)setXEaseInCurveB:(float)a3
{
  self->xEaseInCurveB = a3;
}

- (float)yEaseInCurveA
{
  return self->yEaseInCurveA;
}

- (void)setYEaseInCurveA:(float)a3
{
  self->yEaseInCurveA = a3;
}

- (float)yEaseInCurveB
{
  return self->yEaseInCurveB;
}

- (void)setYEaseInCurveB:(float)a3
{
  self->yEaseInCurveB = a3;
}

- (float)viewportDefaultFOV
{
  return self->viewportDefaultFOV;
}

- (void)setViewportDefaultFOV:(float)a3
{
  self->viewportDefaultFOV = a3;
}

- (float)viewportMinimumFOV
{
  return self->viewportMinimumFOV;
}

- (void)setViewportMinimumFOV:(float)a3
{
  self->viewportMinimumFOV = a3;
}

- (float)deadbandRecenteringInitialDelaySec
{
  return self->deadbandRecenteringInitialDelaySec;
}

- (void)setDeadbandRecenteringInitialDelaySec:(float)a3
{
  self->deadbandRecenteringInitialDelaySec = a3;
}

- (float)deadbandRecenteringDurationSec
{
  return self->deadbandRecenteringDurationSec;
}

- (void)setDeadbandRecenteringDurationSec:(float)a3
{
  self->deadbandRecenteringDurationSec = a3;
}

- (float)deadbandRecenteringIdleDurationSec
{
  return self->deadbandRecenteringIdleDurationSec;
}

- (void)setDeadbandRecenteringIdleDurationSec:(float)a3
{
  self->deadbandRecenteringIdleDurationSec = a3;
}

- (float)noPeopleDelayBeforeReturningHomeSec
{
  return self->noPeopleDelayBeforeReturningHomeSec;
}

- (void)setNoPeopleDelayBeforeReturningHomeSec:(float)a3
{
  self->noPeopleDelayBeforeReturningHomeSec = a3;
}

- (float)noPeopleReturningHomeDurationSec
{
  return self->noPeopleReturningHomeDurationSec;
}

- (void)setNoPeopleReturningHomeDurationSec:(float)a3
{
  self->noPeopleReturningHomeDurationSec = a3;
}

- (float)tinyHeadMinValue
{
  return self->tinyHeadMinValue;
}

- (void)setTinyHeadMinValue:(float)a3
{
  self->tinyHeadMinValue = a3;
}

- (float)tinyHeadMaxValue
{
  return self->tinyHeadMaxValue;
}

- (void)setTinyHeadMaxValue:(float)a3
{
  self->tinyHeadMaxValue = a3;
}

- (float)subjectMovementTolerance
{
  return self->subjectMovementTolerance;
}

- (void)setSubjectMovementTolerance:(float)a3
{
  self->subjectMovementTolerance = a3;
}

- (BOOL)recenterAfterDriftEnabled
{
  return self->recenterAfterDriftEnabled;
}

- (void)setRecenterAfterDriftEnabled:(BOOL)a3
{
  self->recenterAfterDriftEnabled = a3;
}

- (float)recenterAfterDriftDurationThreshold
{
  return self->recenterAfterDriftDurationThreshold;
}

- (void)setRecenterAfterDriftDurationThreshold:(float)a3
{
  self->recenterAfterDriftDurationThreshold = a3;
}

- (float)recenterAfterDriftOffsetThreshold
{
  return self->recenterAfterDriftOffsetThreshold;
}

- (void)setRecenterAfterDriftOffsetThreshold:(float)a3
{
  self->recenterAfterDriftOffsetThreshold = a3;
}

- (BOOL)inferSubjectBodyFromFaceLocation
{
  return self->inferSubjectBodyFromFaceLocation;
}

- (void)setInferSubjectBodyFromFaceLocation:(BOOL)a3
{
  self->inferSubjectBodyFromFaceLocation = a3;
}

- (double)defaultViewportRotation
{
  return *(double *)(a1 + 136);
}

- (void)setDefaultViewportRotation:(CinematicFramingSessionOptions *)self
{
  uint64_t v2;

  *(_QWORD *)self->_defaultViewportRotation = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->multiPersonFramingParameters, 0);
  objc_storeStrong((id *)&self->singlePersonFramingParameters, 0);
  objc_storeStrong((id *)&self->_framingStyleSpecificOptions, 0);
}

@end
