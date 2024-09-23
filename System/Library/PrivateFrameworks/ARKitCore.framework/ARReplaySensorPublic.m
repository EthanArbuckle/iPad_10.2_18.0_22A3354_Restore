@implementation ARReplaySensorPublic

- (ARReplaySensorPublic)initWithDataFromFile:(id)a3
{
  void *v4;
  ARReplaySensorPublic *v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ARReplaySensorPublic initWithSequenceURL:replayMode:](self, "initWithSequenceURL:replayMode:", v4, 0);

  return v5;
}

- (ARReplaySensorPublic)initWithSequenceURL:(id)a3 manualReplay:(BOOL)a4
{
  return -[ARReplaySensorPublic initWithSequenceURL:manualReplay:synchronousMode:](self, "initWithSequenceURL:manualReplay:synchronousMode:", a3, a4, 0);
}

- (ARReplaySensorPublic)initWithSequenceURL:(id)a3 manualReplay:(BOOL)a4 synchronousMode:(BOOL)a5
{
  uint64_t v5;
  ARReplaySensorPublic *v6;

  if (a4)
    v5 = 3;
  else
    v5 = 0;
  v6 = -[ARReplaySensorPublic initWithSequenceURL:replayMode:](self, "initWithSequenceURL:replayMode:", a3, v5, a5);

  return v6;
}

- (BOOL)isSynchronousMode
{
  return self->_replayMode != 0;
}

- (ARReplaySensorPublic)initWithSequenceURL:(id)a3 replayMode:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  int v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  objc_class *v51;
  void *v52;
  NSObject *v53;
  objc_class *v54;
  void *v55;
  ARReplaySensorPublic *v56;
  double v57;
  double v58;
  ARImageCroppingTechnique *v59;
  void *v60;
  NSObject *v61;
  objc_class *v62;
  void *v63;
  void *v64;
  void *v65;
  int64_t v66;
  id *v67;
  void *v68;
  NSObject *v69;
  objc_class *v70;
  void *v71;
  void *v72;
  __CFString *v73;
  id v74;
  uint64_t v75;
  void *v76;
  void *v77;
  NSObject *v78;
  NSObject *v79;
  double v80;
  int v81;
  int v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  uint64_t v87;
  void *v88;
  NSObject *v89;
  double v90;
  int v91;
  int v92;
  uint64_t v93;
  int v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  objc_class *v98;
  void *v99;
  NSObject *v100;
  objc_class *v101;
  void *v102;
  void *v103;
  double v104;
  int v105;
  int v106;
  int v107;
  uint64_t v108;
  uint64_t v109;
  int v110;
  uint64_t v111;
  double v112;
  int v113;
  int v114;
  int v115;
  uint64_t v116;
  uint64_t v117;
  int v118;
  uint64_t v119;
  NSObject *v120;
  objc_class *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  id v127;
  id v128;
  void *v129;
  id *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  objc_super v135;
  id v136;
  uint8_t v137[128];
  uint8_t buf[4];
  void *v139;
  __int16 v140;
  ARReplaySensorPublic *v141;
  __int16 v142;
  id v143;
  __int16 v144;
  id v145;
  uint64_t v146;

  v146 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v136 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCB50]), "initWithFileURL:error:", v6, &v136);
  v8 = v136;
  if (v7)
  {
    v135.receiver = self;
    v135.super_class = (Class)ARReplaySensorPublic;
    v9 = -[ARReplaySensorPublic init](&v135, sel_init);
    if (!v9)
    {
LABEL_77:
      self = v9;
      v56 = self;
      goto LABEL_78;
    }
    v128 = v8;
    v10 = objc_opt_new();
    v11 = (void *)*((_QWORD *)v9 + 48);
    *((_QWORD *)v9 + 48) = v10;

    objc_msgSend(*((id *)v9 + 48), "setRecordingFormat:", 3);
    objc_msgSend(v6, "lastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v9 + 48), "setFileName:", v12);

    *((_QWORD *)v9 + 63) = replayModeByApplyingUserDefaultOverrides(a4);
    v13 = objc_msgSend(v6, "copy");
    v14 = (void *)*((_QWORD *)v9 + 57);
    *((_QWORD *)v9 + 57) = v13;

    v129 = v7;
    v130 = (id *)(v9 + 80);
    objc_storeStrong((id *)v9 + 10, v7);
    *((_QWORD *)v9 + 71) = 0;
    v9[427] = 1;
    objc_msgSend(*((id *)v9 + 10), "getAllStreams");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    v17 = *MEMORY[0x1E0CFCB80];
    objc_msgSend(v16, "removeObject:", *MEMORY[0x1E0CFCB80]);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v9 + 74);
    *((_QWORD *)v9 + 74) = v18;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)*((_QWORD *)v9 + 72);
    *((_QWORD *)v9 + 72) = v20;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)*((_QWORD *)v9 + 73);
    *((_QWORD *)v9 + 73) = v22;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)*((_QWORD *)v9 + 51);
    *((_QWORD *)v9 + 51) = v24;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)*((_QWORD *)v9 + 52);
    *((_QWORD *)v9 + 52) = v26;

    v28 = objc_msgSend(*((id *)v9 + 10), "containsMetadataStream:", *MEMORY[0x1E0CFCB90]);
    if (v28)
      LOBYTE(v28) = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.replaySensor.replayVisionData"));
    v9[426] = v28;
    v29 = objc_msgSend(*((id *)v9 + 10), "containsStream:", v17);
    if (v29)
      LOBYTE(v29) = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.replaySensor.replayPearlDepthData"));
    v9[424] = v29;
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    v134 = 0u;
    v30 = v16;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v131, v137, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v132;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v132 != v33)
            objc_enumerationMutation(v30);
          v35 = *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*((id *)v9 + 51), "setObject:forKeyedSubscript:", v36, v35);

          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*((id *)v9 + 52), "setObject:forKeyedSubscript:", v37, v35);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v131, v137, 16);
      }
      while (v32);
    }

    v9[425] = 0;
    objc_msgSend(v9, "_mainVideoStringID:", v30);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)*((_QWORD *)v9 + 67);
    *((_QWORD *)v9 + 67) = v38;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v30);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)*((_QWORD *)v9 + 17);
    *((_QWORD *)v9 + 17) = v40;

    v42 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*((id *)v9 + 10), "getAllMetadataStreams");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setWithArray:", v43);
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)*((_QWORD *)v9 + 18);
    *((_QWORD *)v9 + 18) = v44;

    objc_msgSend(v9, "readFileMetadata");
    ARCreateFixedPriorityDispatchQueue("com.apple.arkit.arreplaysensor.timerQueue");
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)*((_QWORD *)v9 + 5);
    *((_QWORD *)v9 + 5) = v46;

    v9[72] = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "performSelector:", sel__subscribeToBackgroundNotifications);
    v7 = v129;
    if (*((_QWORD *)v9 + 63) == 3)
    {
      +[ARKitUserDefaults objectForKey:](ARKitUserDefaults, "objectForKey:", CFSTR("com.apple.arkit.session.replay.filepath"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v9[8] = v48 != 0;

      if (v9[8])
      {
        objc_msgSend(v9, "advanceToFrameIndex:", +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com_apple_arkit_replay_filepath_advanceToFrame")));
        +[ARKitUserDefaults floatForKey:](ARKitUserDefaults, "floatForKey:", CFSTR("com_apple_arkit_replay_filepath_advanceFramesPerSecondMultiplier"));
        objc_msgSend(v9, "setAdvanceFramesPerSecondMultiplier:");
        objc_msgSend(MEMORY[0x1E0C99EA0], "appleGlobalDomain");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "addObserver:forKeyPath:options:context:", v9, CFSTR("com_apple_arkit_replay_filepath_advanceToFrame"), 1, 0);
        objc_msgSend(v49, "addObserver:forKeyPath:options:context:", v9, CFSTR("com_apple_arkit_replay_filepath_advanceFramesPerSecondMultiplier"), 1, 0);
        _ARLogSensor_11();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          v51 = (objc_class *)objc_opt_class();
          NSStringFromClass(v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v139 = v52;
          v140 = 2048;
          v141 = (ARReplaySensorPublic *)v9;
          _os_log_impl(&dword_1B3A68000, v50, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Using manual command line mode.", buf, 0x16u);

        }
      }
    }
    else
    {
      v9[8] = 0;
    }
    v9[88] = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.replay.display.synchronization.marker"));
    *((_QWORD *)v9 + 12) = +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.replay.display.synchronization.marker.frameCount"));
    if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.replaySensor.cropFrames")))
    {
      objc_msgSend(v9, "imageResolution");
      if (v58 == 1920.0 && v57 == 1440.0)
      {
        v59 = -[ARImageCroppingTechnique initWithCroppedImageSize:]([ARImageCroppingTechnique alloc], "initWithCroppedImageSize:", 1920.0, 1080.0);
        v60 = (void *)*((_QWORD *)v9 + 16);
        *((_QWORD *)v9 + 16) = v59;

        *(_OWORD *)(v9 + 600) = xmmword_1B3BE3760;
        _ARLogSensor_11();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          v62 = (objc_class *)objc_opt_class();
          NSStringFromClass(v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = (void *)*((_QWORD *)v9 + 75);
          v65 = (void *)*((_QWORD *)v9 + 76);
          *(_DWORD *)buf = 138544130;
          v139 = v63;
          v140 = 2048;
          v141 = (ARReplaySensorPublic *)v9;
          v142 = 2048;
          v143 = v64;
          v144 = 2048;
          v145 = v65;
          _os_log_impl(&dword_1B3A68000, v61, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Frames will be cropped to %.0f x %.0f", buf, 0x2Au);

        }
      }
    }
    v66 = +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.jasper.replayFramerate"));
    v67 = (id *)(v9 + 80);
    if (v66)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v66);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v130, "setDepthOutputFrameRate:", v68);

      _ARLogSensor_11();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        v70 = (objc_class *)objc_opt_class();
        NSStringFromClass(v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*((id *)v9 + 10), "depthOutputFrameRate");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v139 = v71;
        v140 = 2048;
        v141 = (ARReplaySensorPublic *)v9;
        v142 = 2112;
        v143 = v72;
        _os_log_impl(&dword_1B3A68000, v69, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Setting jasper replay rate to: %@ fps", buf, 0x20u);

      }
    }
    *((_QWORD *)v9 + 30) = 0;
    v73 = CFSTR("JasperCamera");
    v74 = (id)*MEMORY[0x1E0D040C0];
    if ((objc_msgSend(*((id *)v9 + 10), "containsStream:", v73) & 1) != 0
      || (objc_msgSend(*v130, "containsStream:", v74) & 1) != 0)
    {
      v75 = 1;
    }
    else
    {
      if ((objc_msgSend(*v130, "containsMetadataStream:", *MEMORY[0x1E0CFCB88]) & 1) == 0
        && (objc_msgSend(*v130, "containsMetadataStream:", *MEMORY[0x1E0CFCBB8]) & 1) == 0
        && !objc_msgSend(*v130, "containsMetadataStream:", *MEMORY[0x1E0CFCBC0]))
      {
LABEL_43:
        if (!ARDeviceSupportsJasper())
          goto LABEL_64;
        v127 = v74;
        objc_msgSend(*v130, "grabJasperExtrinsics");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v76;
        if (v76)
        {
          objc_msgSend(v76, "objectForKeyedSubscript:", *((_QWORD *)v9 + 67));
          v78 = objc_claimAutoreleasedReturnValue();
          v79 = v78;
          if (v78)
          {
            v80 = ARMatrix4x3FromNSData(v78);
            *((_DWORD *)v9 + 66) = v81;
            *((double *)v9 + 32) = v80;
            *((_DWORD *)v9 + 70) = v82;
            *((_DWORD *)v9 + 74) = v83;
            *((_QWORD *)v9 + 34) = v84;
            *((_QWORD *)v9 + 36) = v85;
            *((_DWORD *)v9 + 78) = v86;
            *((_QWORD *)v9 + 38) = v87;
          }
          if (ARDeviceSupportsUltraWideCamera())
          {
            objc_msgSend(v9, "_streamIdentifierForCaptureDeviceType:position:", *MEMORY[0x1E0C89F98], 1);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "objectForKeyedSubscript:", v88);
            v89 = objc_claimAutoreleasedReturnValue();

            if (v89)
            {
              v90 = ARMatrix4x3FromNSData(v89);
              *((_DWORD *)v9 + 82) = v91;
              *((double *)v9 + 40) = v90;
              *((_DWORD *)v9 + 86) = v92;
              *((_QWORD *)v9 + 42) = v93;
              *((_DWORD *)v9 + 90) = v94;
              *((_QWORD *)v9 + 44) = v95;
              *((_DWORD *)v9 + 94) = v96;
              v79 = v89;
              *((_QWORD *)v9 + 46) = v97;
            }
            else
            {
              v79 = 0;
            }
            v67 = (id *)(v9 + 80);
          }
        }
        else
        {
          _ARLogSensor_11();
          v79 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            v98 = (objc_class *)objc_opt_class();
            NSStringFromClass(v98);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v139 = v99;
            v140 = 2048;
            v141 = (ARReplaySensorPublic *)v9;
            _os_log_impl(&dword_1B3A68000, v79, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to get extrinsics to TOF sensor.", buf, 0x16u);

          }
        }

        if ((objc_msgSend(*((id *)v9 + 10), "grabSWToWExtrinsics:", v9 + 176) & 1) != 0)
        {
LABEL_63:

          v74 = v127;
LABEL_64:
          _ARLogSensor_11();
          v120 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
          {
            v121 = (objc_class *)objc_opt_class();
            NSStringFromClass(v121);
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromARReplayMode(*((_QWORD *)v9 + 63));
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v139 = v122;
            v140 = 2048;
            v141 = (ARReplaySensorPublic *)v9;
            v142 = 2112;
            v143 = v123;
            v144 = 2112;
            v145 = v6;
            _os_log_impl(&dword_1B3A68000, v120, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Initialized: ReplayMode: %@, URL:%@", buf, 0x2Au);

          }
          objc_msgSend(*((id *)v9 + 48), "setRecordedSensorTypes:", *((_QWORD *)v9 + 62));
          objc_msgSend(*((id *)v9 + 48), "setArkitVersion:", *((_QWORD *)v9 + 60));
          objc_msgSend(*((id *)v9 + 48), "setOsVersion:", *((_QWORD *)v9 + 59));
          objc_msgSend(*((id *)v9 + 48), "setDeviceModel:", *((_QWORD *)v9 + 58));
          v124 = *((_QWORD *)v9 + 30);
          if (v9[425])
          {
            v8 = v128;
            if (v124 == 1)
            {
              v125 = 6;
              goto LABEL_75;
            }
            if (v124 == 2)
            {
              v125 = 7;
LABEL_75:
              objc_msgSend(*((id *)v9 + 48), "setRecordingFormat:", v125);
            }
          }
          else
          {
            v8 = v128;
            if (v124 == 1)
            {
              v125 = 4;
              goto LABEL_75;
            }
            if (v124 == 2)
            {
              v125 = 5;
              goto LABEL_75;
            }
          }
          +[ARSessionMetrics recordReplayMetrics:](ARSessionMetrics, "recordReplayMetrics:", *((_QWORD *)v9 + 48));

          goto LABEL_77;
        }
        _ARLogSensor_11();
        v100 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        {
          v101 = (objc_class *)objc_opt_class();
          NSStringFromClass(v101);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v139 = v102;
          v140 = 2048;
          v141 = (ARReplaySensorPublic *)v9;
          _os_log_impl(&dword_1B3A68000, v100, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to get extrinsics from ultrawide to wide, using default hardcoded extrinsics", buf, 0x16u);

        }
        objc_msgSend(*v67, "deviceString");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        if (v103
          && (objc_msgSend(*v67, "deviceString"),
              v67 = (id *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v67, "isEqualToString:", CFSTR("ST2"))))
        {
          v104 = ARST2UltrawideToWideExtrinsics();
          *((_DWORD *)v9 + 46) = v105;
          *((double *)v9 + 22) = v104;
          *((_DWORD *)v9 + 50) = v106;
          *((_DWORD *)v9 + 54) = v107;
          *((_QWORD *)v9 + 24) = v108;
          *((_QWORD *)v9 + 26) = v109;
          *((_DWORD *)v9 + 58) = v110;
          *((_QWORD *)v9 + 28) = v111;
        }
        else
        {
          v112 = ARUltrawideToWideExtrinsics();
          *((_DWORD *)v9 + 46) = v113;
          *((double *)v9 + 22) = v112;
          *((_DWORD *)v9 + 50) = v114;
          *((_DWORD *)v9 + 54) = v115;
          *((_QWORD *)v9 + 24) = v116;
          *((_QWORD *)v9 + 26) = v117;
          *((_DWORD *)v9 + 58) = v118;
          *((_QWORD *)v9 + 28) = v119;
          if (!v103)
          {
LABEL_62:

            goto LABEL_63;
          }
        }

        goto LABEL_62;
      }
      v75 = 2;
    }
    *((_QWORD *)v9 + 30) = v75;
    goto LABEL_43;
  }
  _ARLogSensor_11();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    v54 = (objc_class *)objc_opt_class();
    NSStringFromClass(v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v139 = v55;
    v140 = 2048;
    v141 = self;
    v142 = 2112;
    v143 = v6;
    v144 = 2112;
    v145 = v8;
    _os_log_impl(&dword_1B3A68000, v53, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to create MOVStreamReader from URL: %@. Error: %@", buf, 0x2Au);

  }
  v56 = 0;
LABEL_78:

  return v56;
}

- (void)dealloc
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  OpaqueVTPixelTransferSession *synchronizationTransferSession;
  OpaqueVTPixelTransferSession *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  ARReplaySensorPublic *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_11();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v5;
    v12 = 2048;
    v13 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: dealloc", buf, 0x16u);

  }
  -[ARReplaySensorPublic _endReplay](self, "_endReplay");
  if (self->_manualCommandLineMode)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "appleGlobalDomain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:forKeyPath:", self, CFSTR("com_apple_arkit_replay_filepath_advanceToFrame"));
    objc_msgSend(v6, "removeObserver:forKeyPath:", self, CFSTR("com_apple_arkit_replay_filepath_advanceFramesPerSecondMultiplier"));

  }
  CVPixelBufferRelease(self->_depthFloat32PixelBuffer);
  CVPixelBufferRelease(self->_synchronizationMarker);
  CVPixelBufferPoolRelease(self->_synchronizationMarkerPool);
  synchronizationTransferSession = self->_synchronizationTransferSession;
  if (synchronizationTransferSession)
  {
    VTPixelTransferSessionInvalidate(synchronizationTransferSession);
    v8 = self->_synchronizationTransferSession;
    if (v8)
      CFRelease(v8);
  }
  v9.receiver = self;
  v9.super_class = (Class)ARReplaySensorPublic;
  -[ARReplaySensorPublic dealloc](&v9, sel_dealloc);
}

- (BOOL)isReplayingManually
{
  return self->_replayMode == 3;
}

- (id)_mainVideoStringID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") >= 2
    && ((objc_msgSend(v5, "isEqualToString:", CFSTR("JasperCamera")) & 1) != 0
     || objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D040C0])))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      v10 = *MEMORY[0x1E0D040B8];
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v12, "isEqualToString:", v10, (_QWORD)v15))
          {
            v13 = v12;

            self->_usingST2Recording = 1;
            v5 = v13;
            goto LABEL_14;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return v5;
}

- (id)availableVideoFormatForDeviceType:(id)a3 position:(int64_t)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  ARVideoFormat *v14;
  ARVideoFormat *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  ARReplaySensorPublic *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ARReplaySensorPublic _streamIdentifierForCaptureDeviceType:position:](self, "_streamIdentifierForCaptureDeviceType:position:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSSet containsObject:](self->_availableVideoStreams, "containsObject:", v7))
  {
    -[MOVReaderInterface getSizeForStream:](self->_reader, "getSizeForStream:", v7);
    v9 = v8;
    v11 = v10;
    v12 = -[MOVReaderInterface getOutputPixelFormatForStream:](self->_reader, "getOutputPixelFormatForStream:", v7);
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C89F98]))
      v13 = &unk_1E66CEDF0;
    else
      v13 = &unk_1E66CEE08;
    v14 = -[ARVideoFormat initWithImageResolution:captureDevicePosition:captureDeviceType:frameRatesByPowerUsage:pixelFormat:]([ARVideoFormat alloc], "initWithImageResolution:captureDevicePosition:captureDeviceType:frameRatesByPowerUsage:pixelFormat:", a4, v6, v13, v12, v9, v11);
LABEL_14:
    v16 = v14;
    goto LABEL_15;
  }
  if (-[NSSet count](self->_availableVideoStreams, "count") == 1 && *MEMORY[0x1E0C89FA0] == (_QWORD)v6)
  {
    _ARLogSensor_11();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v19;
      v23 = 2048;
      v24 = self;
      _os_log_impl(&dword_1B3A68000, v17, OS_LOG_TYPE_INFO, "%{public}@ <%p>: stream identifier not found in the recording, please use new recording format.", (uint8_t *)&v21, 0x16u);

    }
    v14 = -[ARVideoFormat initWithImageResolution:captureDevicePosition:captureDeviceType:]([ARVideoFormat alloc], "initWithImageResolution:captureDevicePosition:captureDeviceType:", a4, v6, self->_imageResolution.width, self->_imageResolution.height);
    goto LABEL_14;
  }
  v16 = 0;
LABEL_15:

  return v16;
}

- (void)start
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  NSObject *replayQueue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  ARReplaySensorPublic *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_11();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v9 = v5;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: start", buf, 0x16u);

  }
  replayQueue = self->_replayQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__ARReplaySensorPublic_start__block_invoke;
  block[3] = &unk_1E6672168;
  block[4] = self;
  dispatch_sync(replayQueue, block);
}

void __29__ARReplaySensorPublic_start__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "prepareForReplay");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 73) = 0;
  objc_msgSend(*(id *)(a1 + 32), "startReplayIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sensorDidStart:", *(_QWORD *)(a1 + 32));

  }
}

- (void)stop
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  NSObject *replayQueue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  ARReplaySensorPublic *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_11();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v9 = v5;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: stop", buf, 0x16u);

  }
  replayQueue = self->_replayQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__ARReplaySensorPublic_stop__block_invoke;
  block[3] = &unk_1E6672168;
  block[4] = self;
  dispatch_async(replayQueue, block);
}

uint64_t __28__ARReplaySensorPublic_stop__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 72) = 0;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 73) = 1;
  return result;
}

- (void)waitForOutstandingCallbacks
{
  dispatch_sync((dispatch_queue_t)self->_replayQueue, &__block_literal_global_104);
}

- (void)interrupt
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  NSObject *replayQueue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  ARReplaySensorPublic *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_11();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v9 = v5;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: interrupt", buf, 0x16u);

  }
  replayQueue = self->_replayQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__ARReplaySensorPublic_interrupt__block_invoke;
  block[3] = &unk_1E6672168;
  block[4] = self;
  dispatch_sync(replayQueue, block);
}

void __33__ARReplaySensorPublic_interrupt__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  char v4;
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 72))
  {
    *(_BYTE *)(v1 + 73) = 1;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sensorDidPause:", *(_QWORD *)(a1 + 32));

    }
  }
}

- (void)endInterruption
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  NSObject *replayQueue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  ARReplaySensorPublic *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_11();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v9 = v5;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: endInterruption", buf, 0x16u);

  }
  replayQueue = self->_replayQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__ARReplaySensorPublic_endInterruption__block_invoke;
  block[3] = &unk_1E6672168;
  block[4] = self;
  dispatch_sync(replayQueue, block);
}

void __39__ARReplaySensorPublic_endInterruption__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  char v4;
  id v5;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[72])
  {
    objc_msgSend(v2, "prepareForReplay");
    objc_msgSend(*(id *)(a1 + 32), "startReplayIfNeeded");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 73) = 0;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sensorDidRestart:", *(_QWORD *)(a1 + 32));

    }
  }
}

- (void)advanceFrame
{
  NSObject *replayQueue;
  _QWORD block[5];

  if (self->_running)
  {
    if (self->_replayMode)
    {
      replayQueue = self->_replayQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__ARReplaySensorPublic_advanceFrame__block_invoke;
      block[3] = &unk_1E6672168;
      block[4] = self;
      dispatch_sync(replayQueue, block);
    }
  }
}

uint64_t __36__ARReplaySensorPublic_advanceFrame__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "advance");
}

- (id)customDataForTimestamp:(double)a3
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3 - self->_recordTimestampToMovieTimestampDifference;
  -[ARReplaySensorPublic customDataClasses](self, "customDataClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARReplaySensorPublic keyedArchiveConverterForClasses:](self, "keyedArchiveConverterForClasses:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARReplaySensorPublic getItemsFromStream:upToMovieTime:converter:](self, "getItemsFromStream:upToMovieTime:converter:", CFSTR("mdta/com.apple.arkit.customdata"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)sourceTimestampForMovieTimestamp:(double)a3
{
  return self->_recordTimestampToMovieTimestampDifference + a3;
}

- (BOOL)finishedReplaying
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_finishedReplaying);
  return v2 & 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("com_apple_arkit_replay_filepath_advanceToFrame")))
  {
    +[ARKitUserDefaults removeCachedObjectForKey:](ARKitUserDefaults, "removeCachedObjectForKey:", CFSTR("com_apple_arkit_replay_filepath_advanceToFrame"));
    -[ARReplaySensorPublic advanceToFrameIndex:](self, "advanceToFrameIndex:", +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com_apple_arkit_replay_filepath_advanceToFrame")));
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("com_apple_arkit_replay_filepath_advanceFramesPerSecondMultiplier")))
  {
    +[ARKitUserDefaults removeCachedObjectForKey:](ARKitUserDefaults, "removeCachedObjectForKey:", CFSTR("com_apple_arkit_replay_filepath_advanceFramesPerSecondMultiplier"));
    +[ARKitUserDefaults floatForKey:](ARKitUserDefaults, "floatForKey:", CFSTR("com_apple_arkit_replay_filepath_advanceFramesPerSecondMultiplier"));
    -[ARReplaySensorPublic setAdvanceFramesPerSecondMultiplier:](self, "setAdvanceFramesPerSecondMultiplier:");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ARReplaySensorPublic;
    -[ARReplaySensorPublic observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSURL *sequenceURL;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    sequenceURL = self->_sequenceURL;
    v7 = (sequenceURL == (NSURL *)v5[57] || -[NSURL isEqual:](sequenceURL, "isEqual:"))
      && self->_replayMode == v5[63];

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)prepareForReplay
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  double startTime;
  MOVReaderInterface *reader;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  NSMutableDictionary *v27;
  NSMutableDictionary *nextWrappedImageDataForStreamIdentifierMap;
  NSMutableDictionary *v29;
  NSMutableDictionary *metadataCache;
  void *v31;
  double v32;
  double v33;
  double v34;
  void (**v35)(_QWORD, _QWORD);
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  objc_class *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  NSObject *v44;
  objc_class *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  uint64_t v50;
  void *v51;
  _BYTE v52[24];
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE buf[24];
  id v59;
  __int16 v60;
  id v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSSet count](self->_availableVideoStreams, "count") == 1)
  {
    objc_msgSend(v3, "addObject:", self->_mainVideoStreamIdentifier);
  }
  else
  {
    v47 = v3;
    v57 = 0u;
    v55 = 0u;
    v56 = 0u;
    v54 = 0u;
    -[ARParentImageSensorSettings settings](self->_parentImageSensorSettings, "settings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v55;
      v8 = *MEMORY[0x1E0C89F80];
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v55 != v7)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_msgSend(v10, "videoFormat");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "captureDeviceType");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "isEqualToString:", v8);

            if ((v14 & 1) == 0)
            {
              if (objc_msgSend(v10, "isEnabled"))
              {
                objc_msgSend(v12, "captureDeviceType");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                -[ARReplaySensorPublic _streamIdentifierForCaptureDeviceType:position:](self, "_streamIdentifierForCaptureDeviceType:position:", v15, objc_msgSend(v12, "captureDevicePosition"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                if (!-[ARReplaySensorPublic _allStreamsAreAvailable:](self, "_allStreamsAreAvailable:", v16))
                {
                  ARErrorWithCodeAndUserInfo(101, 0);
                  v24 = (id)objc_claimAutoreleasedReturnValue();
                  _ARLogSensor_11();
                  v44 = objc_claimAutoreleasedReturnValue();
                  v3 = v47;
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                  {
                    v45 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v45);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544130;
                    *(_QWORD *)&buf[4] = v46;
                    *(_WORD *)&buf[12] = 2048;
                    *(_QWORD *)&buf[14] = self;
                    *(_WORD *)&buf[22] = 2112;
                    v59 = v16;
                    v60 = 2112;
                    v61 = v24;
                    _os_log_impl(&dword_1B3A68000, v44, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Recording doesn't have all the required (%@) video streams: %@", buf, 0x2Au);

                  }
                  -[ARReplaySensorPublic failWithError:](self, "failWithError:", v24);

                  goto LABEL_34;
                }
                objc_msgSend(v47, "addObject:", v16);

              }
            }
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        if (v6)
          continue;
        break;
      }
    }

    v3 = v47;
    if (!self->_parentImageSensorSettings)
    {
      _ARLogSensor_11();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = self;
        _os_log_impl(&dword_1B3A68000, v17, OS_LOG_TYPE_INFO, "%{public}@ <%p>: No image sensor settings defined, adding all available streams", buf, 0x16u);

      }
      -[NSSet allObjects](self->_availableVideoStreams, "allObjects");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addObjectsFromArray:", v20);

    }
  }
  objc_storeStrong((id *)&self->_videoStreamsToReplay, v3);
  startTime = self->_startTime;
  reader = self->_reader;
  if (startTime == 0.0)
  {
    v53 = 0;
    *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
    *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    -[MOVReaderInterface resetReaderTo:error:](reader, "resetReaderTo:error:", buf, &v53);
    v23 = v53;
  }
  else
  {
    -[ARReplaySensorPublic currentCMTime](self, "currentCMTime");
    v51 = 0;
    -[MOVReaderInterface resetReaderTo:error:](reader, "resetReaderTo:error:", v52, &v51);
    v23 = v51;
  }
  v24 = v23;
  -[MOVReaderInterface duration](self->_reader, "duration");
  v26 = v25;
  v27 = (NSMutableDictionary *)objc_opt_new();
  nextWrappedImageDataForStreamIdentifierMap = self->_nextWrappedImageDataForStreamIdentifierMap;
  self->_nextWrappedImageDataForStreamIdentifierMap = v27;

  v29 = (NSMutableDictionary *)objc_opt_new();
  metadataCache = self->_metadataCache;
  self->_metadataCache = v29;

  -[ARReplaySensorPublic peekNextWrappedImageDataForAllRequiredStreams](self, "peekNextWrappedImageDataForAllRequiredStreams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", self->_mainVideoStreamIdentifier);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "data");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "timestamp");
  v33 = v32;
  objc_msgSend(v12, "timestamp");
  self->_recordTimestampToMovieTimestampDifference = v33 - v34;

  if (startTime == 0.0)
  {
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __40__ARReplaySensorPublic_prepareForReplay__block_invoke;
    v48[3] = &unk_1E66758B0;
    v49 = v12;
    v50 = v26;
    v35 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E2DF90](v48);
    -[ARReplaySensorPublic replaySensorDelegate](self, "replaySensorDelegate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v35)[2](v35, v36);

    -[ARReplaySensorPublic traceReplaySensorDelegate](self, "traceReplaySensorDelegate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v35)[2](v35, v37);

  }
  _ARLogSensor_11();
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v24)
  {
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v41;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2112;
      v59 = v24;
      _os_log_impl(&dword_1B3A68000, v39, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error reseting reader: %@", buf, 0x20u);

    }
    -[ARReplaySensorPublic failWithError:](self, "failWithError:", v24);
  }
  else
  {
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v43;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      _os_log_impl(&dword_1B3A68000, v39, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Reset reader", buf, 0x16u);

    }
  }
LABEL_34:

}

void __40__ARReplaySensorPublic_prepareForReplay__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  _QWORD block[4];
  id v9;
  double v10;
  double v11;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timestamp");
    v6 = v5;

    v7 = v6 + *(double *)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__ARReplaySensorPublic_prepareForReplay__block_invoke_2;
    block[3] = &unk_1E6673410;
    v9 = v3;
    v10 = v6;
    v11 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __40__ARReplaySensorPublic_prepareForReplay__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "replaySensorDidFinishLoadingWithStartTimestamp:endTimestamp:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (BOOL)_allStreamsAreAvailable:(id)a3
{
  return -[NSSet containsObject:](self->_availableVideoStreams, "containsObject:", a3);
}

- (void)startReplayIfNeeded
{
  void *v3;
  double v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *timer;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (!self->_replayStarted)
  {
    self->_replayStarted = 1;
    -[ARReplaySensorPublic setImageIndex:](self, "setImageIndex:", 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSince1970");
    self->_startTime = v4;

    self->_tick = 0;
    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 1uLL, (dispatch_queue_t)self->_replayQueue);
    timer = self->_timer;
    self->_timer = v5;

    dispatch_source_set_timer((dispatch_source_t)self->_timer, 0, 0x7F2815uLL, 0);
    objc_initWeak(&location, self);
    v7 = self->_timer;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__ARReplaySensorPublic_startReplayIfNeeded__block_invoke;
    v8[3] = &unk_1E66722C0;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v7, v8);
    dispatch_resume((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __43__ARReplaySensorPublic_startReplayIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "tick");

}

- (double)currentTime
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4 - self->_startTime;

  return v5;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentCMTime
{
  Float64 v4;

  -[ARReplaySensorPublic currentTime](self, "currentTime");
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, v4, 1000);
}

- (void)_endReplay
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  NSObject *timer;
  OS_dispatch_source *v7;
  NSMutableDictionary *metadataCache;
  CVADepthIR *depthContainer;
  int v10;
  void *v11;
  __int16 v12;
  ARReplaySensorPublic *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _ARLogSensor_11();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v5;
    v12 = 2048;
    v13 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: endReplay", (uint8_t *)&v10, 0x16u);

  }
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v7 = self->_timer;
    self->_timer = 0;

  }
  metadataCache = self->_metadataCache;
  self->_metadataCache = 0;

  atomic_store(1u, (unsigned __int8 *)&self->_finishedReplaying);
  depthContainer = self->_depthContainer;
  self->_depthContainer = 0;

}

- (id)wrappedImageDataOrderedByTime:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_38_0);
}

uint64_t __54__ARReplaySensorPublic_wrappedImageDataOrderedByTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "timestamp");
  v7 = v6;
  objc_msgSend(v5, "timestamp");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "timestamp");
    v11 = v10;
    objc_msgSend(v5, "timestamp");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (void)tick
{
  int v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  float v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  int v16;
  void *v17;
  uint64_t v18;
  id v19;

  if (self->_running && !self->_interrupted)
  {
    if (self->_replayMode != 3
      || -[ARReplaySensorPublic targetFrameIndex](self, "targetFrameIndex") < 0
      || (v3 = -[ARReplaySensorPublic imageIndex](self, "imageIndex"),
          -[ARReplaySensorPublic targetFrameIndex](self, "targetFrameIndex") >= v3))
    {
      ++self->_tick;
      -[ARReplaySensorPublic currentTime](self, "currentTime");
      v5 = v4;
      kdebug_trace();
      if (self->_replayMode == 1)
      {
        -[ARReplaySensorPublic advance](self, "advance");
        kdebug_trace();
      }
      else
      {
        -[ARReplaySensorPublic peekNextWrappedImageDataForAllRequiredStreams](self, "peekNextWrappedImageDataForAllRequiredStreams");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v6;
        if (v6
          && objc_msgSend(v6, "count")
          && (objc_msgSend(v19, "objectForKeyedSubscript:", self->_mainVideoStreamIdentifier),
              v7 = (void *)objc_claimAutoreleasedReturnValue(),
              v7,
              v7))
        {
          if (self->_replayMode)
          {
            objc_msgSend(v19, "objectForKeyedSubscript:", self->_mainVideoStreamIdentifier);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "data");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = (double)objc_msgSend(v9, "captureFramesPerSecond");
            -[ARReplaySensorPublic advanceFramesPerSecondMultiplier](self, "advanceFramesPerSecondMultiplier");
            v12 = v11;
            v13 = v11 == 0.0;
            v14 = 1.0;
            if (!v13)
              v14 = v12;
            v15 = v14 * v10;

            v16 = (int)(120.0 / (double)(uint64_t)v15);
            if (v16 <= 1)
              v16 = 1;
            if (!(self->_tick % v16))
              -[ARReplaySensorPublic advance](self, "advance");
          }
          else
          {
            while (1)
            {
              -[ARReplaySensorPublic imageDataToReplayForTimestamp:](self, "imageDataToReplayForTimestamp:", v5);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "count");

              if (!v18)
                break;
              -[ARReplaySensorPublic advance](self, "advance");
            }
          }
        }
        else
        {
          -[ARReplaySensorPublic _endReplay](self, "_endReplay");
          -[ARReplaySensorPublic _replaySensorFinishedReplayingData](self, "_replaySensorFinishedReplayingData");
        }
        kdebug_trace();

      }
    }
  }
}

- (void)advance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  ARImageCroppingTechnique *croppingTechnique;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  void *m;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  double v61;
  size_t v62;
  void *v63;
  double v64;
  void *v65;
  double v66;
  void *v67;
  double v68;
  void *v69;
  OSType PixelFormatType;
  NSObject *v71;
  objc_class *v72;
  void *v73;
  NSObject *v74;
  objc_class *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  id obj;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  id v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _QWORD v115[4];
  id v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
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
  _BYTE v133[128];
  _BYTE buf[12];
  __int16 v135;
  ARReplaySensorPublic *v136;
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  uint64_t v141;

  v141 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  -[ARReplaySensorPublic getNextWrappedImageDataForReplay](self, "getNextWrappedImageDataForReplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", self->_mainVideoStreamIdentifier);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v3;
    objc_msgSend(v3, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARReplaySensorPublic wrappedImageDataOrderedByTime:](self, "wrappedImageDataOrderedByTime:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v99 = v6;
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timestamp");
    v9 = v8;

    croppingTechnique = self->_croppingTechnique;
    if (croppingTechnique && v4)
    {
      objc_msgSend(v4, "data");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageCroppingTechnique processData:](croppingTechnique, "processData:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setData:", v12);

    }
    -[MOVReaderInterface resolvedAccelStreamName:](self->_reader, "resolvedAccelStreamName:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARReplaySensorPublic getItemsFromStream:upToMovieTime:metadataClass:](self, "getItemsFromStream:upToMovieTime:metadataClass:", v13, objc_opt_class(), v9);
    v129 = 0u;
    v130 = 0u;
    v131 = 0u;
    v132 = 0u;
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v129, v140, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v130;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v130 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * i);
          v20 = (void *)MEMORY[0x1B5E2DDB0]();
          objc_msgSend(v19, "timestamp");
          v22 = v21;
          -[ARReplaySensorPublic recordingTimeToReplayTimeOffset](self, "recordingTimeToReplayTimeOffset");
          objc_msgSend(v19, "setTimestamp:", v22 + v23);
          objc_msgSend(v19, "timestamp");
          kdebug_trace();
          -[ARReplaySensorPublic _didOutputSensorData:](self, "_didOutputSensorData:", v19);
          objc_msgSend(v19, "timestamp");
          kdebug_trace();
          objc_autoreleasePoolPop(v20);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v129, v140, 16);
      }
      while (v16);
    }
    v104 = v14;

    -[MOVReaderInterface resolvedGyroStreamName:](self->_reader, "resolvedGyroStreamName:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[ARReplaySensorPublic getItemsFromStream:upToMovieTime:metadataClass:](self, "getItemsFromStream:upToMovieTime:metadataClass:", v24, objc_opt_class(), v9);
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v125, v139, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v126;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v126 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * j);
          v31 = (void *)MEMORY[0x1B5E2DDB0]();
          objc_msgSend(v30, "timestamp");
          v33 = v32;
          -[ARReplaySensorPublic recordingTimeToReplayTimeOffset](self, "recordingTimeToReplayTimeOffset");
          objc_msgSend(v30, "setTimestamp:", v33 + v34);
          objc_msgSend(v30, "timestamp");
          kdebug_trace();
          -[ARReplaySensorPublic _didOutputSensorData:](self, "_didOutputSensorData:", v30);
          objc_msgSend(v30, "timestamp");
          kdebug_trace();
          objc_autoreleasePoolPop(v31);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v125, v139, 16);
      }
      while (v27);
    }

    -[MOVReaderInterface resolvedDeviceMotionStreamName:](self->_reader, "resolvedDeviceMotionStreamName:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    -[ARReplaySensorPublic getItemsFromStream:upToMovieTime:metadataClass:](self, "getItemsFromStream:upToMovieTime:metadataClass:", v35, objc_opt_class(), v9);
    v121 = 0u;
    v122 = 0u;
    v123 = 0u;
    v124 = 0u;
    v36 = (id)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v121, v138, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v122;
      do
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v122 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * k);
          v42 = (void *)MEMORY[0x1B5E2DDB0]();
          objc_msgSend(v41, "timestamp");
          v44 = v43;
          -[ARReplaySensorPublic recordingTimeToReplayTimeOffset](self, "recordingTimeToReplayTimeOffset");
          objc_msgSend(v41, "setTimestamp:", v44 + v45);
          objc_msgSend(v41, "timestamp");
          kdebug_trace();
          -[ARReplaySensorPublic _didOutputSensorData:](self, "_didOutputSensorData:", v41);
          objc_msgSend(v41, "timestamp");
          kdebug_trace();
          objc_autoreleasePoolPop(v42);
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v121, v138, 16);
      }
      while (v38);
    }
    v98 = v25;
    v100 = v4;
    v103 = v36;

    -[MOVReaderInterface resolvedLocationStreamName:](self->_reader, "resolvedLocationStreamName:", 0);
    v46 = objc_claimAutoreleasedReturnValue();

    v97 = (void *)v46;
    -[ARReplaySensorPublic getItemsFromStream:upToMovieTime:metadataClass:](self, "getItemsFromStream:upToMovieTime:metadataClass:", v46, objc_opt_class(), v9);
    v117 = 0u;
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v109 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v137, 16);
    if (v109)
    {
      v107 = *(_QWORD *)v118;
      do
      {
        for (m = 0; m != v109; m = (char *)m + 1)
        {
          if (*(_QWORD *)v118 != v107)
            objc_enumerationMutation(obj);
          v48 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * (_QWORD)m);
          v49 = (void *)MEMORY[0x1B5E2DDB0]();
          objc_msgSend(v48, "timestamp");
          v51 = v50;
          -[ARReplaySensorPublic recordingTimeToReplayTimeOffset](self, "recordingTimeToReplayTimeOffset");
          objc_msgSend(v48, "setTimestamp:", v51 + v52);
          kdebug_trace();
          objc_msgSend(v48, "timestamp");
          objc_msgSend(v48, "location");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "coordinate");
          objc_msgSend(v48, "location");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "coordinate");
          objc_msgSend(v48, "location");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "horizontalAccuracy");
          kdebug_trace();

          -[ARReplaySensorPublic _didOutputSensorData:](self, "_didOutputSensorData:", v48);
          kdebug_trace();
          kdebug_trace();
          objc_autoreleasePoolPop(v49);
        }
        v109 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v137, 16);
      }
      while (v109);
    }

    if (self->_displaySynchronizationMarker)
    {
      objc_msgSend(v100, "data");
      v56 = objc_claimAutoreleasedReturnValue();
      if (v56)
      {
        v57 = (void *)v56;
        objc_msgSend(v100, "data");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "pixelBuffer");

        if (v59)
        {
          if (!self->_synchronizationMarker)
          {
            objc_msgSend(v100, "data");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "imageResolution");
            v62 = (unint64_t)v61;
            objc_msgSend(v100, "data");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "imageResolution");
            ARCreateSynchronizationMarker(v62, (unint64_t)v64, &self->_synchronizationMarker);

            objc_msgSend(v100, "data");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "imageResolution");
            LODWORD(v60) = v66;
            objc_msgSend(v100, "data");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "imageResolution");
            LODWORD(v63) = v68;
            objc_msgSend(v100, "data");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v69, "pixelBuffer"));
            LODWORD(v60) = ar_pixelBufferPoolCreateNew(v60, v63, PixelFormatType, &self->_synchronizationMarkerPool);

            if ((_DWORD)v60)
            {
              _ARLogGeneral_36();
              v71 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
              {
                v72 = (objc_class *)objc_opt_class();
                NSStringFromClass(v72);
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v73;
                v135 = 2048;
                v136 = self;
                _os_log_impl(&dword_1B3A68000, v71, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create pixel buffer pool", buf, 0x16u);

              }
            }
            if (VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &self->_synchronizationTransferSession))
            {
              _ARLogGeneral_36();
              v74 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
              {
                v75 = (objc_class *)objc_opt_class();
                NSStringFromClass(v75);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v76;
                v135 = 2048;
                v136 = self;
                _os_log_impl(&dword_1B3A68000, v74, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create transfer session", buf, 0x16u);

              }
            }
          }
          if (self->_displaySynchronizationMarkerFrames >= -[ARReplaySensorPublic imageIndex](self, "imageIndex"))
          {
            *(_QWORD *)buf = 0;
            CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], self->_synchronizationMarkerPool, (CVPixelBufferRef *)buf);
            VTPixelTransferSessionTransferImage(self->_synchronizationTransferSession, self->_synchronizationMarker, *(CVPixelBufferRef *)buf);
            v77 = *(_QWORD *)buf;
            objc_msgSend(v100, "data");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "setPixelBuffer:", v77);

            CVPixelBufferRelease(*(CVPixelBufferRef *)buf);
          }
        }
      }
    }
    objc_msgSend(v101, "allKeys");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v115[0] = MEMORY[0x1E0C809B0];
    v115[1] = 3221225472;
    v115[2] = __31__ARReplaySensorPublic_advance__block_invoke;
    v115[3] = &unk_1E66758F8;
    v80 = v101;
    v116 = v80;
    objc_msgSend(v79, "sortedArrayUsingComparator:", v115);
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v110 = v81;
    v82 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v111, v133, 16);
    if (v82)
    {
      v83 = v82;
      v84 = *(_QWORD *)v112;
      v106 = *MEMORY[0x1E0C89F98];
      v102 = *MEMORY[0x1E0C89FA0];
      do
      {
        v85 = 0;
        v108 = v83;
        do
        {
          if (*(_QWORD *)v112 != v84)
            objc_enumerationMutation(v110);
          v86 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * v85);
          v87 = (void *)MEMORY[0x1B5E2DDB0]();
          objc_msgSend(v80, "objectForKeyedSubscript:", v86);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "data");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = v89;
          if (v89 && objc_msgSend(v89, "pixelBuffer"))
          {
            v91 = v84;
            -[ARReplaySensorPublic _appendCalibrationData:streamIdentifier:](self, "_appendCalibrationData:streamIdentifier:", v90, v86);
            -[ARReplaySensorPublic _appendVisionDataToImageData:streamIdentifier:](self, "_appendVisionDataToImageData:streamIdentifier:", v90, v86);
            -[ARReplaySensorPublic _populateDepthDataForImageData:](self, "_populateDepthDataForImageData:", v90);
            objc_msgSend(v103, "lastObject");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "lastObject");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARReplaySensorPublic _populateDeviceOrientationIfNeededOnImageData:fromDeviceOrientationData:accelerometerData:streamIdentifier:](self, "_populateDeviceOrientationIfNeededOnImageData:fromDeviceOrientationData:accelerometerData:streamIdentifier:", v90, v92, v93, v86);

            +[ARImageSensor registerSignPostForImageData:](ARImageSensor, "registerSignPostForImageData:", v90);
            objc_msgSend(v90, "timestamp");
            kdebug_trace();
            objc_msgSend(v90, "cameraType");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v93) = objc_msgSend(v94, "isEqualToString:", v106);

            if ((_DWORD)v93)
            {
              if (ARMatrix4x3IsZero(*(float32x4_t *)self->_anon_b0, *(float32x4_t *)&self->_anon_b0[16], *(float32x4_t *)&self->_anon_b0[32], *(float32x4_t *)&self->_anon_b0[48]))ARWideToUltrawideExtrinsicsForOldRecordings();
              v84 = v91;
              objc_msgSend(v90, "addExtrinsicMatrix:toDeviceType:", v102);
            }
            else
            {
              v84 = v91;
            }
            v83 = v108;
            -[ARReplaySensorPublic _didOutputSensorData:](self, "_didOutputSensorData:", v90);
            objc_msgSend(v90, "timestamp");
            kdebug_trace();
          }

          objc_autoreleasePoolPop(v87);
          ++v85;
        }
        while (v83 != v85);
        v83 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v111, v133, 16);
      }
      while (v83);
    }

    -[ARReplaySensorPublic sourceTimestampForMovieTimestamp:](self, "sourceTimestampForMovieTimestamp:", v9);
    v96 = v95;
    if (ARDeviceSupportsJasper())
      -[ARReplaySensorPublic readAndVendCVADepthTOFsUntil:](self, "readAndVendCVADepthTOFsUntil:", v96);
    -[ARReplaySensorPublic readAndVendCMDatasUntil:](self, "readAndVendCMDatasUntil:", v96);
    -[ARReplaySensorPublic readAndVendCVAUserEventsUntil:](self, "readAndVendCVAUserEventsUntil:", v96);
    kdebug_trace();

    v3 = v101;
  }
  else
  {
    -[ARReplaySensorPublic _endReplay](self, "_endReplay");
    -[ARReplaySensorPublic _replaySensorFinishedReplayingData](self, "_replaySensorFinishedReplayingData");
    kdebug_trace();
  }

}

uint64_t __31__ARReplaySensorPublic_advance__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timestamp");
  v11 = v10;
  objc_msgSend(v8, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timestamp");
  v14 = v13;

  if (v11 >= v14)
  {
    objc_msgSend(v7, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timestamp");
    v18 = v17;
    objc_msgSend(v8, "data");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timestamp");
    v15 = v18 > v20;

  }
  else
  {
    v15 = -1;
  }

  return v15;
}

- (void)_populateDeviceOrientationIfNeededOnImageData:(id)a3 fromDeviceOrientationData:(id)a4 accelerometerData:(id)a5 streamIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  MOVReaderInterface *reader;
  uint64_t v23;
  _OWORD v24[3];
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!objc_msgSend(v10, "deviceOrientation"))
  {
    if (v11)
    {
      objc_msgSend(v11, "deviceMotion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "gravity");
      v16 = v15;
      v18 = v17;

    }
    else
    {
      if (!v12)
      {
        v26 = 0u;
        v27 = 0u;
        v25 = 0u;
        reader = self->_reader;
        if (reader)
          -[MOVReaderInterface transformForStream:](reader, "transformForStream:", v13);
        v23 = objc_msgSend(v10, "cameraPosition");
        v24[0] = v25;
        v24[1] = v26;
        v24[2] = v27;
        v21 = ARDeviceOrientationForCameraPositionAndVideoTransform(v23, v24);
        goto LABEL_16;
      }
      objc_msgSend(v12, "acceleration");
      v16 = v19;
      v18 = v20;
    }
    if (fabs(v16) <= fabs(v18))
    {
      if (v18 <= 0.0)
        v21 = 1;
      else
        v21 = 2;
    }
    else if (v16 <= 0.0)
    {
      v21 = 3;
    }
    else
    {
      v21 = 4;
    }
LABEL_16:
    objc_msgSend(v10, "setDeviceOrientation:", v21);
  }

}

- (id)_populateCalibrationStream:(id)a3 timestamp:(double)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  NSMutableDictionary *calibrationBuffer;
  void *v27;
  void *v28;
  double v29;
  double v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_calibrationBuffer, "objectForKeyedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MOVReaderInterface containsMetadataStream:](self->_reader, "containsMetadataStream:", *MEMORY[0x1E0CFCB78]))
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[NSMutableDictionary allValues](self->_calibrationBuffer, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v37;
      v11 = 0.0;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v13, "lastObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "timestamp");
          if (v11 <= v15)
          {
            objc_msgSend(v13, "lastObject");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "timestamp");
            v11 = v17;

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v9);
    }
    else
    {
      v11 = 0.0;
    }

    v18 = v11 + 0.00000011920929;
    if (v11 + 0.00000011920929 <= a4)
    {
      while (1)
      {
        objc_msgSend(v6, "removeAllObjects", v18);
        -[MOVReaderInterface grabNextCVACameraCalibrationData](self->_reader, "grabNextCVACameraCalibrationData");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v19, "count"))
          break;
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v20 = v19;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v33;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v33 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
              calibrationBuffer = self->_calibrationBuffer;
              objc_msgSend(v25, "streamID");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKeyedSubscript:](calibrationBuffer, "objectForKeyedSubscript:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "addObject:", v25);

              objc_msgSend(v25, "timestamp");
              if (v11 <= v29)
              {
                objc_msgSend(v25, "timestamp");
                v11 = v30;
              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v22);
        }

        v18 = v11 + 0.00000011920929;
        if (v11 + 0.00000011920929 > a4)
          return v6;
      }

    }
  }
  return v6;
}

- (id)_cameraCalibrationDataForStream:(id)a3 timestamp:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v13;
  double v14;
  _QWORD v15[5];

  v6 = a3;
  v7 = (void *)MEMORY[0x1B5E2DDB0]();
  -[ARReplaySensorPublic _populateCalibrationStream:timestamp:](self, "_populateCalibrationStream:timestamp:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
    goto LABEL_4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__ARReplaySensorPublic__cameraCalibrationDataForStream_timestamp___block_invoke;
  v15[3] = &__block_descriptor_40_e41_B32__0__CVACameraCalibrationData_8Q16_B24l;
  *(double *)&v15[4] = a4;
  v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", v15);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v8, "removeAllObjects");
LABEL_4:
    v10 = 0;
    goto LABEL_5;
  }
  v13 = v9;
  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectsInRange:", 0, v13);
  objc_msgSend(v10, "timestamp");
  if (v14 + -0.00000011920929 <= a4)
  {

    objc_autoreleasePoolPop(v7);
    v10 = v10;
    v11 = v10;
    goto LABEL_6;
  }
LABEL_5:

  objc_autoreleasePoolPop(v7);
  v11 = 0;
LABEL_6:

  return v11;
}

BOOL __66__ARReplaySensorPublic__cameraCalibrationDataForStream_timestamp___block_invoke(uint64_t a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "timestamp");
  return v3 + 0.00000011920929 > *(double *)(a1 + 32);
}

- (void)_appendVisionDataToImageData:(id)a3 streamIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  NSObject *v22;
  objc_class *v23;
  id v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  NSMutableDictionary *featureBuffers;
  void *v36;
  void *v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  double v43;
  __CVBuffer *v44;
  void *v45;
  id v46;
  _QWORD v47[5];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint8_t v57[128];
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  ARReplaySensorPublic *v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_shouldReplayVisionData)
  {
    v46 = v7;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_featureBuffers, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v45 = v6;
      objc_msgSend(v6, "timestamp");
      v10 = v9;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      -[NSMutableDictionary allValues](self->_featureBuffers, "allValues");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v53;
        v15 = 0.0;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v53 != v14)
              objc_enumerationMutation(v11);
            v17 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
            objc_msgSend(v17, "lastObject");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "timestamp");
            if (v15 <= v19)
            {
              objc_msgSend(v17, "lastObject");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "timestamp");
              v15 = v21;

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
        }
        while (v13);
      }
      else
      {
        v15 = 0.0;
      }

      while (1)
      {
        v26 = v15 + 0.00000011920929;
        if (v15 + 0.00000011920929 > v10)
          break;
        v27 = (void *)MEMORY[0x1B5E2DDB0](v26);
        objc_msgSend(v8, "removeAllObjects");
        -[MOVReaderInterface grabNextFeatureBuffer](self->_reader, "grabNextFeatureBuffer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v28, "count"))
        {

          objc_autoreleasePoolPop(v27);
          break;
        }
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v29 = v28;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v49;
          do
          {
            for (j = 0; j != v31; ++j)
            {
              if (*(_QWORD *)v49 != v32)
                objc_enumerationMutation(v29);
              v34 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
              featureBuffers = self->_featureBuffers;
              objc_msgSend(v34, "sourceStreamID");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKeyedSubscript:](featureBuffers, "objectForKeyedSubscript:", v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "addObject:", v34);

              objc_msgSend(v34, "timestamp");
              if (v15 <= v38)
              {
                objc_msgSend(v34, "timestamp");
                v15 = v39;
              }
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
          }
          while (v31);
        }

        objc_autoreleasePoolPop(v27);
      }
      v6 = v45;
      if (objc_msgSend(v8, "count", v26))
      {
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __70__ARReplaySensorPublic__appendVisionDataToImageData_streamIdentifier___block_invoke;
        v47[3] = &__block_descriptor_40_e33_B32__0__CVAFeatureBuffer_8Q16_B24l;
        *(double *)&v47[4] = v10;
        v40 = objc_msgSend(v8, "indexOfObjectPassingTest:", v47);
        if (v40 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v8, "removeAllObjects");
        }
        else
        {
          v41 = v40;
          objc_msgSend(v8, "objectAtIndexedSubscript:", v40);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeObjectsInRange:", 0, v41);
          objc_msgSend(v42, "timestamp");
          if (v10 >= v43 + -0.00000011920929)
          {
            v44 = (__CVBuffer *)objc_msgSend(v42, "getPixelBuffer");
            objc_msgSend(v45, "setVisionData:", v44);
            CVPixelBufferRelease(v44);
          }

        }
      }
    }
    else
    {
      _ARLogGeneral_36();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = v6;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v59 = v25;
        v60 = 2048;
        v61 = self;
        v62 = 2114;
        v63 = v46;
        _os_log_impl(&dword_1B3A68000, v22, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Missing feature buffers queue for stream '%{public}@', not appending vision data", buf, 0x20u);

        v6 = v24;
      }

    }
    v7 = v46;
  }

}

BOOL __70__ARReplaySensorPublic__appendVisionDataToImageData_streamIdentifier___block_invoke(uint64_t a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "timestamp");
  return v3 + 0.00000011920929 > *(double *)(a1 + 32);
}

- (void)_appendCalibrationData:(id)a3 streamIdentifier:(id)a4
{
  void *v4;
  id v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  objc_class *v35;
  void *v36;
  int v37;
  void *v38;
  __int16 v39;
  ARReplaySensorPublic *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (ARDeviceSupportsJasper())
  {
    objc_msgSend(v7, "cameraType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C89F98]);

    v11 = 256;
    if (v10)
      v11 = 320;
    v12 = 272;
    if (v10)
      v12 = 336;
    v13 = 288;
    if (v10)
      v13 = 352;
    v14 = 304;
    if (v10)
      v14 = 368;
    objc_msgSend(v7, "addExtrinsicMatrix:toDeviceType:", *MEMORY[0x1E0C89F80], *(double *)((char *)&self->super.isa + v11), *(double *)((char *)&self->super.isa + v12), *(double *)((char *)&self->super.isa + v13), *(double *)((char *)&self->super.isa + v14));
  }
  objc_msgSend(v7, "timestamp");
  -[ARReplaySensorPublic _cameraCalibrationDataForStream:timestamp:](self, "_cameraCalibrationDataForStream:timestamp:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "calibrationData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCalibrationData:", v16);

    objc_msgSend(v7, "calibrationData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(v7, "extrinsicMatrixToDeviceType:", *MEMORY[0x1E0C89F80]);
      objc_msgSend(v15, "setExtrinsicMatrix:");
      objc_msgSend(MEMORY[0x1E0CFCDC0], "ar_initWithCVACameraCalibrationData:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAdCameraCalibration:", v18);

      objc_msgSend(v7, "adCameraCalibration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        _ARLogSensor_11();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 138543618;
          v38 = v22;
          v39 = 2048;
          v40 = self;
          _os_log_impl(&dword_1B3A68000, v20, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CVACameraCalibrationData from recording is missing some info.", (uint8_t *)&v37, 0x16u);

        }
      }
    }
  }
  objc_msgSend(v7, "calibrationData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    goto LABEL_18;
  objc_msgSend(v7, "adCameraCalibration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    _ARLogSensor_11();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138543618;
      v38 = v27;
      v39 = 2048;
      v40 = self;
      _os_log_impl(&dword_1B3A68000, v25, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Missing calibration from recording, attempting to use hardcoded calibrations", (uint8_t *)&v37, 0x16u);

    }
    objc_msgSend(v7, "cameraType");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqualToString:", *MEMORY[0x1E0C89FA0]);

    if (v29)
    {
      -[MOVReaderInterface deviceString](self->_reader, "deviceString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30
        && (-[MOVReaderInterface deviceString](self->_reader, "deviceString"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v4, "isEqualToString:", CFSTR("ST2"))))
      {
        ARST2JasperWideCameraCalibration();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        ARJasperWideCameraCalibration();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v30)
        {
LABEL_29:

          objc_msgSend(v23, "cameraToPlatformTransform");
          objc_msgSend(v7, "addExtrinsicMatrix:toDeviceType:", *MEMORY[0x1E0C89F80]);
          objc_msgSend(MEMORY[0x1E0CFCDC0], "ar_calibrationWithImageData:adCalibrationData:", v7, v23);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            v32 = v7;
            v33 = v31;
          }
          else
          {
            _ARLogGeneral_36();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              v35 = (objc_class *)objc_opt_class();
              NSStringFromClass(v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = 138543618;
              v38 = v36;
              v39 = 2048;
              v40 = self;
              _os_log_impl(&dword_1B3A68000, v34, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: failed to create image adjusted calibration data", (uint8_t *)&v37, 0x16u);

            }
            v32 = v7;
            v33 = v23;
          }
          objc_msgSend(v32, "setAdCameraCalibration:", v33);

LABEL_18:
          goto LABEL_26;
        }
      }

      goto LABEL_29;
    }
  }
LABEL_26:

}

- (void)_populateDepthDataForImageData:(id)a3
{
  id v4;
  CVADepthIR *v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  CVADepthIR **p_depthContainer;
  double v15;
  CVADepthIR *v16;
  __CVBuffer *v17;
  void *v18;
  __CVBuffer **p_depthFloat32PixelBuffer;
  __CVBuffer *depthFloat32PixelBuffer;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  const __CFAllocator *v27;
  size_t Width;
  size_t Height;
  CVReturn v30;
  CVReturn v31;
  objc_class *v32;
  CVAttachmentMode attachmentMode;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  ARReplaySensorPublic *v37;
  __int16 v38;
  CVReturn v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_shouldReplayPearlDepthData)
  {
    v5 = self->_depthContainer;
    objc_msgSend(v4, "timestamp");
    v7 = v6;
    v8 = -[CVADepthIR timestamp](v5, "timestamp");
    if (v9 + 0.00000011920929 <= v7)
    {
      do
      {
        v10 = (void *)MEMORY[0x1B5E2DDB0](v8);
        -[MOVReaderInterface grabNextDepthIR](self->_reader, "grabNextDepthIR");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "count"))
        {

          objc_autoreleasePoolPop(v10);
          goto LABEL_8;
        }
        objc_msgSend(v11, "lastObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v10);
        v8 = objc_msgSend(v12, "timestamp");
        v5 = (CVADepthIR *)v12;
      }
      while (v13 + 0.00000011920929 <= v7);
      if (v12)
        goto LABEL_9;
      goto LABEL_23;
    }
LABEL_8:
    v12 = v5;
    if (!v5)
    {
LABEL_23:

      goto LABEL_24;
    }
LABEL_9:
    p_depthContainer = &self->_depthContainer;
    objc_msgSend(v12, "timestamp");
    if (v7 < v15 + -0.00000011920929)
    {
      objc_storeStrong((id *)&self->_depthContainer, v12);
      goto LABEL_23;
    }
    v16 = *p_depthContainer;
    *p_depthContainer = 0;

    v17 = (__CVBuffer *)objc_msgSend(v12, "dataBuffer");
    attachmentMode = kCVAttachmentMode_ShouldNotPropagate;
    v18 = (void *)CVBufferCopyAttachment(v17, (CFStringRef)*MEMORY[0x1E0D05458], &attachmentMode);
    if (v18)
    {
      p_depthFloat32PixelBuffer = &self->_depthFloat32PixelBuffer;
      depthFloat32PixelBuffer = self->_depthFloat32PixelBuffer;
      if (depthFloat32PixelBuffer)
      {
LABEL_13:
        if (!ARConvertFixedPointUnsigned13_3ToDepthFloat32Buffer(v17, depthFloat32PixelBuffer))
        {
LABEL_22:

          goto LABEL_23;
        }
        v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C8B1A8]), "initWithPixelBuffer:depthMetadataDictionary:", *p_depthFloat32PixelBuffer, v18);
        objc_msgSend(v4, "setDepthData:", v21);
LABEL_21:

        goto LABEL_22;
      }
      v27 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      Width = CVPixelBufferGetWidth(v17);
      Height = CVPixelBufferGetHeight(v17);
      v30 = CVPixelBufferCreate(v27, Width, Height, 0x66646570u, 0, &self->_depthFloat32PixelBuffer);
      if (!v30)
      {
        depthFloat32PixelBuffer = *p_depthFloat32PixelBuffer;
        goto LABEL_13;
      }
      v31 = v30;
      _ARLogGeneral_36();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v23;
      v36 = 2048;
      v37 = self;
      v38 = 1024;
      v39 = v31;
      v24 = "%{public}@ <%p>: Failed to create float32-formatted pixel buffer for transcoding depth frames, CVReturn=%d";
      v25 = v21;
      v26 = 28;
    }
    else
    {
      _ARLogGeneral_36();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v23;
      v36 = 2048;
      v37 = self;
      v24 = "%{public}@ <%p>: Failed to retrieve depth metadata dictionary from depth pixel buffer's attachments";
      v25 = v21;
      v26 = 22;
    }
    _os_log_impl(&dword_1B3A68000, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);

    goto LABEL_21;
  }
LABEL_24:

}

- (void)readAndVendCMDatasUntil:(double)a3
{
  id v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  __int128 v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  __int128 v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  ARReplaySensorPublic *v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (-[MOVReaderInterface containsMetadataStream:](self->_reader, "containsMetadataStream:", *MEMORY[0x1E0CFCB70]))
  {
    -[NSMutableArray lastObject](self->_cmDataBuffer, "lastObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    v7 = v6;
    while (1)
    {

      if (v7 >= a3)
        break;
      -[MOVReaderInterface grabNextCMData](self->_reader, "grabNextCMData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "count"))
      {

        break;
      }
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v5 = v8;
      v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v30 != v11)
              objc_enumerationMutation(v5);
            v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(v13, "timestamp");
            if (v14 > v7)
            {
              -[NSMutableArray addObject:](self->_cmDataBuffer, "addObject:", v13);
              objc_msgSend(v13, "timestamp");
              v7 = v15;
            }
          }
          v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
        }
        while (v10);
      }

    }
    if (-[NSMutableArray count](self->_cmDataBuffer, "count"))
    {
      *(_QWORD *)&v16 = 138543874;
      v27 = v16;
      while (1)
      {
        -[NSMutableArray firstObject](self->_cmDataBuffer, "firstObject", v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timestamp");
        if (v18 > a3)
          break;
        -[NSMutableArray removeObjectAtIndex:](self->_cmDataBuffer, "removeObjectAtIndex:", 0);
        if ((objc_msgSend(v17, "isSent") & 1) == 0)
        {
          objc_msgSend(v17, "additionalData");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)MEMORY[0x1E0CB3710];
          v21 = objc_opt_class();
          v28 = 0;
          objc_msgSend(v20, "ar_unarchivedObjectOfClass:fromData:error:", v21, v19, &v28);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v28;
          if (v23)
          {
            _ARLogSensor_11();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              v25 = (objc_class *)objc_opt_class();
              NSStringFromClass(v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v27;
              v34 = v26;
              v35 = 2048;
              v36 = self;
              v37 = 2112;
              v38 = v23;
              _os_log_impl(&dword_1B3A68000, v24, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Replay sensor could not decode collaboration data: %@", buf, 0x20u);

            }
          }
          else
          {
            -[ARReplaySensorPublic session](self, "session");
            v24 = objc_claimAutoreleasedReturnValue();
            -[NSObject updateWithCollaborationData:](v24, "updateWithCollaborationData:", v22);
          }

        }
        if (!-[NSMutableArray count](self->_cmDataBuffer, "count"))
          return;
      }

    }
  }
}

- (void)readAndVendCVADepthTOFsUntil:(double)a3
{
  id v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  ARPointCloudSensorData *v21;
  void *v22;
  ARPointCloudSensorData *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  ARReplaySensorPublic *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray lastObject](self->_cvaDepthTOFBuffer, "lastObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestamp");
  v7 = v6;
  while (1)
  {

    if (v7 >= a3)
      break;
    -[MOVReaderInterface grabNextDepthTOF](self->_reader, "grabNextDepthTOF");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "count"))
    {

      break;
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v5 = v8;
    v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(v5);
          v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v13, "timestamp");
          if (v14 > v7)
          {
            -[NSMutableArray addObject:](self->_cvaDepthTOFBuffer, "addObject:", v13);
            objc_msgSend(v13, "timestamp");
            v7 = v15;
          }
        }
        v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v10);
    }

  }
  if (-[NSMutableArray count](self->_cvaDepthTOFBuffer, "count"))
  {
    while (1)
    {
      v16 = (void *)MEMORY[0x1B5E2DDB0]();
      -[NSMutableArray firstObject](self->_cvaDepthTOFBuffer, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timestamp");
      if (v18 > a3)
        break;
      -[NSMutableArray removeObjectAtIndex:](self->_cvaDepthTOFBuffer, "removeObjectAtIndex:", 0);
      v19 = objc_msgSend(v17, "projectorMode");
      if ((unint64_t)(v19 - 1) >= 3)
        v20 = 0;
      else
        v20 = v19;
      v21 = [ARPointCloudSensorData alloc];
      objc_msgSend(v17, "pointCloud");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timestamp");
      v23 = -[ARPointCloudSensorData initWithPointCloudData:projectorMode:timestamp:](v21, "initWithPointCloudData:projectorMode:timestamp:", v22, v20);

      if (v23)
      {
        +[ARDepthSensor registerSignPostForPointCloudData:](ARDepthSensor, "registerSignPostForPointCloudData:", v23);
        -[ARReplaySensorPublic _didOutputSensorData:](self, "_didOutputSensorData:", v23);
      }
      else
      {
        _ARLogSensor_11();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v26;
          v33 = 2048;
          v34 = self;
          _os_log_impl(&dword_1B3A68000, v24, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Replay sensor couldn't not decode PointCloudSensor data", buf, 0x16u);

        }
      }

      objc_autoreleasePoolPop(v16);
      if (!-[NSMutableArray count](self->_cvaDepthTOFBuffer, "count"))
        return;
    }

    objc_autoreleasePoolPop(v16);
  }
}

- (void)readAndVendCVAUserEventsUntil:(double)a3
{
  id v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  __int128 v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  objc_class *v27;
  void *v28;
  __int128 v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  ARReplaySensorPublic *v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (-[MOVReaderInterface containsMetadataStream:](self->_reader, "containsMetadataStream:", *MEMORY[0x1E0CFCB98]))
  {
    -[NSMutableArray lastObject](self->_userEventBuffer, "lastObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    v7 = v6;
    while (1)
    {

      if (v7 >= a3)
        goto LABEL_16;
      -[MOVReaderInterface grabNextUserEvent](self->_reader, "grabNextUserEvent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "count"))
        break;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v5 = v8;
      v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v33 != v11)
              objc_enumerationMutation(v5);
            v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_msgSend(v13, "timestamp");
            if (v14 > v7)
            {
              -[NSMutableArray addObject:](self->_userEventBuffer, "addObject:", v13);
              objc_msgSend(v13, "timestamp");
              v7 = v15;
            }
          }
          v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
        }
        while (v10);
      }

    }
LABEL_16:
    if (!-[NSMutableArray count](self->_userEventBuffer, "count"))
      return;
    *(_QWORD *)&v16 = 138543874;
    v29 = v16;
    while (1)
    {
      -[NSMutableArray firstObject](self->_userEventBuffer, "firstObject", v29);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timestamp");
      if (v18 > a3)
      {

        return;
      }
      -[NSMutableArray removeObjectAtIndex:](self->_userEventBuffer, "removeObjectAtIndex:", 0);
      if (objc_msgSend(v17, "eventType") == 4)
        break;
      if (objc_msgSend(v17, "eventType") == 13)
      {
        objc_msgSend(v17, "anchorData");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0CB3710];
        v26 = objc_opt_class();
        v30 = 0;
        objc_msgSend(v25, "ar_unarchivedObjectOfClass:fromData:error:", v26, v19, &v30);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v30;
        if (v23)
        {
          _ARLogSensor_11();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            goto LABEL_26;
        }
        else
        {
          -[ARReplaySensorPublic session](self, "session");
          v24 = objc_claimAutoreleasedReturnValue();
          -[NSObject removeAnchor:](v24, "removeAnchor:", v22);
        }
LABEL_29:

      }
      if (!-[NSMutableArray count](self->_userEventBuffer, "count"))
        return;
    }
    objc_msgSend(v17, "anchorData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB3710];
    v21 = objc_opt_class();
    v31 = 0;
    objc_msgSend(v20, "ar_unarchivedObjectOfClass:fromData:error:", v21, v19, &v31);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v31;
    if (v23)
    {
      _ARLogSensor_11();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
LABEL_26:
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v29;
        v37 = v28;
        v38 = 2048;
        v39 = self;
        v40 = 2112;
        v41 = v23;
        _os_log_impl(&dword_1B3A68000, v24, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Replay sensor could not decode anchor data: %@", buf, 0x20u);

      }
    }
    else
    {
      -[ARReplaySensorPublic session](self, "session");
      v24 = objc_claimAutoreleasedReturnValue();
      -[NSObject addAnchor:](v24, "addAnchor:", v22);
    }
    goto LABEL_29;
  }
}

- (id)keyedArchiveConverter:(Class)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARReplaySensorPublic keyedArchiveConverterForClasses:](self, "keyedArchiveConverterForClasses:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)keyedArchiveConverterForClasses:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  ARReplaySensorPublic *v10;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__ARReplaySensorPublic_keyedArchiveConverterForClasses___block_invoke;
  v8[3] = &unk_1E6675960;
  v9 = v4;
  v10 = self;
  v5 = v4;
  v6 = (void *)MEMORY[0x1B5E2DF90](v8);

  return v6;
}

id __56__ARReplaySensorPublic_keyedArchiveConverterForClasses___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ARApprovedDecoderClasses();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "unionSet:", *(_QWORD *)(a1 + 32));
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "ar_unarchivedObjectOfClasses:fromData:error:", v5, v3, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v14;
  if (!v6)
  {
    _ARLogSensor_11();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v16 = v10;
      v17 = 2048;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Replay sensor could not unpack %@, %@", buf, 0x2Au);

    }
  }

  return v6;
}

- (id)metadataWrapperConverter:(Class)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__ARReplaySensorPublic_metadataWrapperConverter___block_invoke;
  v4[3] = &unk_1E6675988;
  v4[4] = self;
  v4[5] = a3;
  return (id)MEMORY[0x1B5E2DF90](v4, a2);
}

id __49__ARReplaySensorPublic_metadataWrapperConverter___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = *(objc_class **)(a1 + 40);
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithMetadataWrapper:", v4);

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    _ARLogSensor_11();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v13 = 138543874;
      v14 = v9;
      v15 = 2048;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Replay sensor could not unpack %@", (uint8_t *)&v13, 0x20u);

    }
  }

  return v5;
}

- (id)peekNextWrappedImageDataForAllRequiredStreams
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_videoStreamsToReplay;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = -[ARReplaySensorPublic peekNextWrappedImageDataForStreamIdentifier:](self, "peekNextWrappedImageDataForStreamIdentifier:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7++), (_QWORD)v10);
      }
      while (v5 != v7);
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return self->_nextWrappedImageDataForStreamIdentifierMap;
}

- (id)peekNextWrappedImageDataForStreamIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MOVReaderInterface *reader;
  __CVBuffer *v8;
  ARImageData *v9;
  ARImageData *v10;
  double Seconds;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  CFDictionaryRef v16;
  ARImageData *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  float v33;
  double v34;
  unsigned int v35;
  double v36;
  NSObject *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  float v43;
  float v44;
  float v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  objc_class *v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v57;
  id v58;
  id v59;
  void *v60;
  ARImageData *v61;
  id v62;
  CMTime v63;
  CMTime time;
  ARImageData *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_nextWrappedImageDataForStreamIdentifierMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v63 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    reader = self->_reader;
    v62 = 0;
    v8 = (__CVBuffer *)-[MOVReaderInterface copyNextFrameForStream:timestamp:error:](reader, "copyNextFrameForStream:timestamp:error:", v4, &v63, &v62);
    v9 = (ARImageData *)v62;
    v10 = v9;
    if (v8)
    {
      time = v63;
      Seconds = CMTimeGetSeconds(&time);
      v12 = (__CFString *)v4;
      v13 = v12;
      if (-[NSSet count](self->_availableVideoStreams, "count") == 1)
      {
        v13 = v12;
        if (!-[NSSet containsObject:](self->_availableMetadataStreams, "containsObject:", v12))
        {
          v13 = CFSTR("mdta/com.apple.arkit.arimagedata");

        }
      }
      -[ARReplaySensorPublic keyedArchiveConverter:](self, "keyedArchiveConverter:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARReplaySensorPublic getWrappedItemsFromStream:upToMovieTime:converter:](self, "getWrappedItemsFromStream:upToMovieTime:converter:", v13, v14, Seconds);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v61 = v10;
        v6 = (void *)objc_opt_new();
        v16 = CVBufferCopyAttachments(v8, kCVAttachmentMode_ShouldPropagate);
        objc_msgSend(v6, "setTimestamp:", Seconds);
        v17 = -[ARImageData initWithDictionary:]([ARImageData alloc], "initWithDictionary:", v16);
        AVCaptureDeviceTypeFromStreamIdentifier(v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARImageData setCameraType:](v17, "setCameraType:", v18);

        -[ARImageData setCameraPosition:](v17, "setCameraPosition:", AVCaptureDevicePositionFromStreamIdentifier(v12));
        -[ARImageData setCaptureFramesPerSecond:](v17, "setCaptureFramesPerSecond:", llround(self->_nominalFrameRate));
        if (self->_usingST2Recording
          && (v19 = *MEMORY[0x1E0D04138],
              -[__CFDictionary objectForKey:](v16, "objectForKey:", *MEMORY[0x1E0D04138]),
              v20 = (void *)objc_claimAutoreleasedReturnValue(),
              v20,
              v20))
        {
          -[__CFDictionary objectForKey:](v16, "objectForKey:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D05038]);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
          {
            objc_msgSend(v22, "doubleValue");
            -[ARImageData setExposureDuration:](v17, "setExposureDuration:");
          }
          v60 = v23;
          -[ARImageData cameraIntrinsics](v17, "cameraIntrinsics");
          if (ARMatrix3x3IsZero(v24, v25, v26))
          {
            -[ARImageData cameraType](v17, "cameraType");
            v27 = v21;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = (void *)*MEMORY[0x1E0C89F98];

            v30 = v28 == v29;
            v21 = v27;
            if (v30)
            {
              objc_msgSend(v27, "objectForKey:", *MEMORY[0x1E0D050D0]);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (v31)
              {
                v58 = v31;
                objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Width"));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = (float)(int)objc_msgSend(v32, "intValue");

                v34 = (float)(v33 / 640.0);
                *(float *)&v35 = v34 * 245.391312;
                LODWORD(v36) = 0;
                HIDWORD(v36) = v35;
                -[ARImageData setCameraIntrinsics:](v17, "setCameraIntrinsics:", COERCE_DOUBLE((unint64_t)v35), v36, COERCE_DOUBLE(vcvt_f32_f64(vmulq_n_f64((float64x2_t)xmmword_1B3C0B8E0, v34))));
                _ARLogSensor_11();
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                {
                  v38 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v38);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(time.value) = 138543874;
                  *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v39;
                  LOWORD(time.flags) = 2048;
                  *(_QWORD *)((char *)&time.flags + 2) = self;
                  HIWORD(time.epoch) = 2048;
                  v65 = v17;
                  _os_log_impl(&dword_1B3A68000, v37, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Falling back to hardcoded intrinsics for UW for %p.", (uint8_t *)&time, 0x20u);

                }
                v21 = v27;
                v31 = v58;
              }

            }
          }
          objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D04FB8]);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D04FC0]);
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = (void *)v41;
          if (v40 && v41)
          {
            objc_msgSend(v40, "floatValue");
            v44 = v43;
            objc_msgSend(v42, "floatValue");
            *(float *)&v46 = log2f(v44 / v45);
            -[ARImageData setExposureTargetOffset:](v17, "setExposureTargetOffset:", v46);
          }
          v57 = v42;
          v59 = v40;
          objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D05060]);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v47;
          if (v47)
          {
            objc_msgSend(v47, "floatValue");
            -[ARImageData setISO:](v17, "setISO:");
          }
          objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D05098]);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v49;
          if (v49)
          {
            objc_msgSend(v49, "floatValue");
            -[ARImageData setSignalToNoiseRatio:](v17, "setSignalToNoiseRatio:");
          }

        }
        else
        {
          v21 = v16;
        }
        objc_msgSend(v6, "setData:", v17);

        v10 = v61;
      }
      objc_msgSend(v6, "data");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setPixelBuffer:", v8);

      v54 = CACurrentMediaTime();
      objc_msgSend(v6, "data");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setCurrentCaptureTimestamp:", v54);

      CVPixelBufferRelease(v8);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_nextWrappedImageDataForStreamIdentifierMap, "setObject:forKeyedSubscript:", v6, v12);
    }
    else
    {
      if (!v9)
      {
        v6 = 0;
        goto LABEL_36;
      }
      _ARLogGeneral_36();
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
      {
        v51 = (objc_class *)objc_opt_class();
        NSStringFromClass(v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(time.value) = 138543874;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v52;
        LOWORD(time.flags) = 2048;
        *(_QWORD *)((char *)&time.flags + 2) = self;
        HIWORD(time.epoch) = 2112;
        v65 = v10;
        _os_log_impl(&dword_1B3A68000, (os_log_t)v13, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not copyNextFrameForStream: %@", (uint8_t *)&time, 0x20u);

      }
      v6 = 0;
    }

LABEL_36:
    goto LABEL_37;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_nextWrappedImageDataForStreamIdentifierMap, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_37:

  return v6;
}

- (id)getNextWrappedImageDataForReplay
{
  id v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  void *v16;
  double v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  __int128 v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  ARReplaySensorPublic *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = -[ARReplaySensorPublic peekNextWrappedImageDataForAllRequiredStreams](self, "peekNextWrappedImageDataForAllRequiredStreams");
  if (-[NSMutableDictionary count](self->_nextWrappedImageDataForStreamIdentifierMap, "count"))
  {
    -[ARReplaySensorPublic currentTime](self, "currentTime");
    v5 = v4;
    -[ARReplaySensorPublic imageDataToReplayForTimestamp:](self, "imageDataToReplayForTimestamp:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    if (v9)
    {
      v11 = v9;
      v12 = *(_QWORD *)v26;
      *(_QWORD *)&v10 = 138544130;
      v23 = v10;
      v24 = v8;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_nextWrappedImageDataForStreamIdentifierMap, "setObject:forKeyedSubscript:", 0, v14, v23);
          if (self->_replayMode)
          {
            v15 = 0;
          }
          else
          {
            -[ARReplaySensorPublic peekNextWrappedImageDataForStreamIdentifier:](self, "peekNextWrappedImageDataForStreamIdentifier:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = 0;
            if (v16)
            {
              do
              {
                objc_msgSend(v16, "timestamp");
                if (v17 > v5)
                  break;
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v14);
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_nextWrappedImageDataForStreamIdentifierMap, "setObject:forKeyedSubscript:", 0, v14);
                -[ARReplaySensorPublic peekNextWrappedImageDataForStreamIdentifier:](self, "peekNextWrappedImageDataForStreamIdentifier:", v14);
                v18 = objc_claimAutoreleasedReturnValue();

                ++v15;
                v16 = (void *)v18;
              }
              while (v18);
              if (v15)
              {
                _ARLogSensor_11();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  v20 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v20);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v23;
                  v30 = v21;
                  v31 = 2048;
                  v32 = self;
                  v33 = 1024;
                  v34 = v15;
                  v35 = 2112;
                  v36 = v14;
                  _os_log_impl(&dword_1B3A68000, v19, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Skipped %u replay frames of type: %@", buf, 0x26u);

                  v8 = v24;
                }

              }
            }

          }
          if (objc_msgSend(v14, "isEqualToString:", self->_mainVideoStreamIdentifier))
            -[ARReplaySensorPublic setImageIndex:](self, "setImageIndex:", v15 + -[ARReplaySensorPublic imageIndex](self, "imageIndex") + 1);
        }
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      }
      while (v11);
    }

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v7;
}

- (id)getItemsFromStream:(id)a3 upToMovieTime:(double)a4 converter:(id)a5
{
  void *v5;
  void *v6;

  -[ARReplaySensorPublic getWrappedItemsFromStream:upToMovieTime:converter:](self, "getWrappedItemsFromStream:upToMovieTime:converter:", a3, a5, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getItemsFromStream:(id)a3 upToMovieTime:(double)a4 metadataClass:(Class)a5
{
  void *v5;
  void *v6;
  _QWORD v8[6];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__ARReplaySensorPublic_getItemsFromStream_upToMovieTime_metadataClass___block_invoke;
  v8[3] = &unk_1E66759B0;
  v8[4] = self;
  v8[5] = a5;
  -[ARReplaySensorPublic getWrappedItemsFromStream:upToMovieTime:withBlock:](self, "getWrappedItemsFromStream:upToMovieTime:withBlock:", a3, v8, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __71__ARReplaySensorPublic_getItemsFromStream_upToMovieTime_metadataClass___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  double v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0.0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "grabNextFromReader:timestamp:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), &v15, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        v9 = (void *)objc_opt_new();
        objc_msgSend(v9, "setTimestamp:", v15);
        objc_msgSend(v9, "setData:", v8);
        objc_msgSend(v2, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v5);
  }

  return v2;
}

- (BOOL)readNextFrameFromStream:(id)a3 forWrapper:(id)a4
{
  id v6;
  id v7;
  MOVReaderInterface *reader;
  __CVBuffer *v9;
  id v10;
  void *v11;
  CFDictionaryRef v12;
  ARImageData *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  objc_class *v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  objc_class *v27;
  uint64_t v28;
  id v30;
  CMTime v31;
  CMTime time;
  id v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  reader = self->_reader;
  v30 = 0;
  v9 = (__CVBuffer *)-[MOVReaderInterface copyNextFrameForStream:timestamp:error:](reader, "copyNextFrameForStream:timestamp:error:", v6, &v31, &v30);
  v10 = v30;
  if (!v9)
  {
    v18 = -[MOVReaderInterface hasReachedEndOfStream:](self->_reader, "hasReachedEndOfStream:", v6);
    _ARLogSensor_11();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v20)
      {
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "timestamp");
        LODWORD(time.value) = 138544130;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v22;
        LOWORD(time.flags) = 2048;
        *(_QWORD *)((char *)&time.flags + 2) = self;
        HIWORD(time.epoch) = 2112;
        v33 = v6;
        v34 = 2048;
        v35 = v23;
        v24 = "%{public}@ <%p>: Replay sensor reached end of stream %@ at %lf";
        v25 = v19;
        v26 = 42;
LABEL_10:
        _os_log_impl(&dword_1B3A68000, v25, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&time, v26);

      }
    }
    else if (v20)
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timestamp");
      LODWORD(time.value) = 138544386;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v22;
      LOWORD(time.flags) = 2048;
      *(_QWORD *)((char *)&time.flags + 2) = self;
      HIWORD(time.epoch) = 2112;
      v33 = v6;
      v34 = 2048;
      v35 = v28;
      v36 = 2112;
      v37 = v10;
      v24 = "%{public}@ <%p>: Replay sensor couldn't get frame for stream %@ at %lf: %@";
      v25 = v19;
      v26 = 52;
      goto LABEL_10;
    }

    goto LABEL_12;
  }
  time = v31;
  objc_msgSend(v7, "setTimestamp:", CMTimeGetSeconds(&time));
  objc_msgSend(v7, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = CVBufferCopyAttachments(v9, kCVAttachmentMode_ShouldPropagate);
    v13 = -[ARImageData initWithDictionary:]([ARImageData alloc], "initWithDictionary:", v12);
    AVCaptureDeviceTypeFromStreamIdentifier(v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageData setCameraType:](v13, "setCameraType:", v14);

    -[ARImageData setCameraPosition:](v13, "setCameraPosition:", AVCaptureDevicePositionFromStreamIdentifier(v6));
    -[ARImageData setCaptureFramesPerSecond:](v13, "setCaptureFramesPerSecond:", llround(self->_nominalFrameRate));
    objc_msgSend(v7, "setData:", v13);

  }
  v15 = CACurrentMediaTime();
  objc_msgSend(v7, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCurrentCaptureTimestamp:", v15);

  objc_msgSend(v7, "data");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPixelBuffer:", v9);

  CVPixelBufferRelease(v9);
LABEL_12:

  return v9 != 0;
}

- (double)_getMinFrameDurationForStream:(id)a3
{
  MOVReaderInterface *reader;
  CMTime time;

  reader = self->_reader;
  if (reader)
    -[MOVReaderInterface getMinFrameDurationForStream:](reader, "getMinFrameDurationForStream:", a3);
  else
    memset(&time, 0, sizeof(time));
  return CMTimeGetSeconds(&time);
}

- (id)getWrappedItemsFromPixelBufferStream:(id)a3 upToMovieTime:(double)a4 converter:(id)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  id v14;

  v7 = a3;
  v8 = (void *)objc_opt_new();
  -[ARReplaySensorPublic _getMinFrameDurationForStream:](self, "_getMinFrameDurationForStream:", v7);
  v10 = v9;
  while (1)
  {
    v11 = (void *)objc_opt_new();
    if (!-[ARReplaySensorPublic readNextFrameFromStream:forWrapper:](self, "readNextFrameFromStream:forWrapper:", v7, v11))break;
    objc_msgSend(v11, "timestamp");
    v13 = v10 + v12;
    objc_msgSend(v8, "addObject:", v11);

    if (v13 > a4)
    {
      v14 = v8;
      goto LABEL_6;
    }
  }

  v14 = 0;
LABEL_6:

  return v14;
}

- (id)getWrappedItemsFromStream:(id)a3 upToMovieTime:(double)a4 converter:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__ARReplaySensorPublic_getWrappedItemsFromStream_upToMovieTime_converter___block_invoke;
  v14[3] = &unk_1E66759D8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  -[ARReplaySensorPublic getWrappedItemsFromStream:upToMovieTime:withBlock:](self, "getWrappedItemsFromStream:upToMovieTime:withBlock:", v11, v14, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __74__ARReplaySensorPublic_getWrappedItemsFromStream_upToMovieTime_converter___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "getNextWrappedItemsFromStream:converter:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)getWrappedItemsFromStream:(id)a3 upToMovieTime:(double)a4 withBlock:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  _QWORD v21[7];

  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  v10 = (void *)MEMORY[0x1B5E2DDB0]();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_metadataCache, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadataCache, "setObject:forKeyedSubscript:", v11, v8);
  }
  do
  {
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timestamp");
      v14 = v13;

      if (v14 > a4 + 0.00000011920929)
        break;
    }
    v9[2](v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v15);
    v16 = objc_msgSend(v15, "count");

  }
  while (v16);
  -[ARReplaySensorPublic _getMinFrameDurationForStream:](self, "_getMinFrameDurationForStream:", v8);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __74__ARReplaySensorPublic_getWrappedItemsFromStream_upToMovieTime_withBlock___block_invoke;
  v21[3] = &__block_descriptor_56_e41_B32__0__ARReplayMovieDataWrapper_8Q16_B24l;
  *(double *)&v21[4] = v17;
  *(double *)&v21[5] = a4;
  *(double *)&v21[6] = v17 * 0.5;
  objc_msgSend(v11, "indexesOfObjectsPassingTest:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectsAtIndexes:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectsAtIndexes:", v18);

  objc_autoreleasePoolPop(v10);
  return v19;
}

BOOL __74__ARReplaySensorPublic_getWrappedItemsFromStream_upToMovieTime_withBlock___block_invoke(double *a1, void *a2)
{
  double v3;
  double v4;

  v3 = a1[5];
  objc_msgSend(a2, "timestamp", a1[4]);
  return vabdd_f64(v3, v4) <= a1[6];
}

- (id)getNextWrappedItemsFromStream:(id)a3 converter:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  __int128 v8;
  void *v9;
  void *v10;
  double Seconds;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *context;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CMTime time;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
  v29 = *MEMORY[0x1E0CA2E50];
  v30 = v8;
  v31 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
  v9 = (void *)objc_opt_new();
  context = (void *)MEMORY[0x1B5E2DDB0]();
  v23 = v6;
  if (-[MOVReaderInterface containsMetadataStream:](self->_reader, "containsMetadataStream:", v6))
  {
    -[MOVReaderInterface grabNextMetadataOfStream:timeRange:](self->_reader, "grabNextMetadataOfStream:timeRange:", v6, &v29);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  *(_OWORD *)&time.value = v29;
  time.epoch = v30;
  Seconds = CMTimeGetSeconds(&time);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1B5E2DDB0]();
        v7[2](v7, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = (void *)objc_opt_new();
          objc_msgSend(v20, "setTimestamp:", Seconds);
          objc_msgSend(v20, "setData:", v19);
          objc_msgSend(v9, "addObject:", v20);

        }
        objc_autoreleasePoolPop(v18);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v14);
  }

  objc_autoreleasePoolPop(context);
  return v9;
}

- (void)failWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ARReplaySensorPublic delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ARReplaySensorPublic delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sensor:didFailWithError:", self, v7);

  }
}

- (void)_didOutputSensorData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ARReplaySensorPublic delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sensor:didOutputSensorData:", self, v4);

}

- (void)setImageIndex:(int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  self->_imageIndex = a3;
  -[ARReplaySensorPublic setNextFrameIndex:](self, "setNextFrameIndex:", a3);
  if (self->_manualCommandLineMode)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    +[ARKitUserDefaults setObject:forKey:](ARKitUserDefaults, "setObject:forKey:", v5, CFSTR("com_apple_arkit_replay_filepath_nextFrameIndex"));

  }
}

- (id)imageDataToReplayForTimestamp:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[ARReplaySensorPublic peekNextWrappedImageDataForAllRequiredStreams](self, "peekNextWrappedImageDataForAllRequiredStreams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  if (objc_msgSend(v5, "count"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v5, "allKeys", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (!v8)
      goto LABEL_17;
    v9 = v8;
    v10 = *(_QWORD *)v22;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (!self->_replayMode)
        {
          objc_msgSend(v13, "timestamp");
          if (v19 > a3)
            goto LABEL_15;
LABEL_14:
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v12);
          goto LABEL_15;
        }
        if (objc_msgSend(v12, "isEqualToString:", self->_mainVideoStreamIdentifier))
          goto LABEL_14;
        objc_msgSend(v5, "objectForKeyedSubscript:", self->_mainVideoStreamIdentifier);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v14, "timestamp");
          v17 = v16;
          objc_msgSend(v15, "timestamp");
          if (v17 <= v18)
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v12);
        }

LABEL_15:
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (!v9)
      {
LABEL_17:

        break;
      }
    }
  }

  return v6;
}

- (void)readFileMetadata
{
  void *v3;
  NSDictionary *v4;
  NSDictionary *customUserData;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  uint64_t v38;
  NSString *v39;
  NSString *deviceModel;
  NSString *v41;
  NSString *osVersion;
  NSString *v43;
  NSString *arkitVersion;
  CGFloat v45;
  CGFloat v46;
  double v47;
  id v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  ARReplaySensorPublic *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  self->_recordingFormatVersion = 0;
  -[MOVReaderInterface grabSummary](self->_reader, "grabSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("mdta/com.apple.arkit.customuserdata"));
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  customUserData = self->_customUserData;
  self->_customUserData = v4;

  -[MOVReaderInterface metadataForMovie](self->_reader, "metadataForMovie");
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v55;
    v10 = *MEMORY[0x1E0CFCB60];
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v55 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v10);

        if (v13)
        {
          self->_recordingFormatVersion = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  if (self->_recordingFormatVersion == 1)
  {
    v14 = objc_opt_class();
    ARMetadataIdentifierForARSensorDataClass(v14, self->_recordingFormatVersion);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVReaderInterface metadataTrackForStream:](self->_reader, "metadataTrackForStream:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "totalSampleDataLength");
    if (!v16 || v17 <= 0)
    {
      _ARLogSensor_11();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v20;
        v61 = 2048;
        v62 = self;
        _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Reverting back to legacy format for metadata stream names.", buf, 0x16u);

      }
      self->_recordingFormatVersion = 0;
    }

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("mdta/com.apple.arkit.arsensordatatypeinformation"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21)
  {
    v48 = v6;
    v49 = v3;
    self->_recordedSensorTypes = 1;
    -[MOVReaderInterface getAllMetadataStreams](self->_reader, "getAllMetadataStreams");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_opt_class();
    ARMetadataIdentifierForARSensorDataClass(v24, self->_recordingFormatVersion);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_opt_class();
    ARMetadataIdentifierForARSensorDataClass(v26, self->_recordingFormatVersion);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_opt_class();
    ARMetadataIdentifierForARSensorDataClass(v28, self->_recordingFormatVersion);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_opt_class();
    ARMetadataIdentifierForARSensorDataClass(v30, self->_recordingFormatVersion);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v32 = v23;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (!v33)
      goto LABEL_36;
    v34 = v33;
    v35 = *(_QWORD *)v51;
    while (1)
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v51 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        if ((objc_msgSend(v37, "isEqualToString:", v25) & 1) != 0)
        {
          v38 = 2;
        }
        else if ((objc_msgSend(v37, "isEqualToString:", v27) & 1) != 0)
        {
          v38 = 4;
        }
        else if ((objc_msgSend(v37, "isEqualToString:", v29) & 1) != 0)
        {
          v38 = 8;
        }
        else
        {
          if (!objc_msgSend(v37, "isEqualToString:", v31))
            continue;
          v38 = 64;
        }
        self->_recordedSensorTypes |= v38;
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      if (!v34)
      {
LABEL_36:

        v6 = v48;
        v3 = v49;
        v22 = 0;
        goto LABEL_37;
      }
    }
  }
  self->_recordedSensorTypes = objc_msgSend(v21, "unsignedIntegerValue");
LABEL_37:
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCBD8]);
  v39 = (NSString *)objc_claimAutoreleasedReturnValue();
  deviceModel = self->_deviceModel;
  self->_deviceModel = v39;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("mdta/com.apple.arkit.osversion"));
  v41 = (NSString *)objc_claimAutoreleasedReturnValue();
  osVersion = self->_osVersion;
  self->_osVersion = v41;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("mdta/com.apple.arkit.arkitversion"));
  v43 = (NSString *)objc_claimAutoreleasedReturnValue();
  arkitVersion = self->_arkitVersion;
  self->_arkitVersion = v43;

  -[MOVReaderInterface getSizeForStream:](self->_reader, "getSizeForStream:", self->_mainVideoStreamIdentifier);
  self->_imageResolution.width = v45;
  self->_imageResolution.height = v46;
  -[MOVReaderInterface getFrameRateForStream:](self->_reader, "getFrameRateForStream:", self->_mainVideoStreamIdentifier);
  self->_nominalFrameRate = v47;

}

- (void)_replaySensorFinishedReplayingData
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__ARReplaySensorPublic__replaySensorFinishedReplayingData__block_invoke;
  v6[3] = &unk_1E6675A20;
  v6[4] = self;
  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E2DF90](v6, a2);
  -[ARReplaySensorPublic replaySensorDelegate](self, "replaySensorDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v3)[2](v3, v4);

  -[ARReplaySensorPublic traceReplaySensorDelegate](self, "traceReplaySensorDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v3)[2](v3, v5);

}

void __58__ARReplaySensorPublic__replaySensorFinishedReplayingData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];
  id v5;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __58__ARReplaySensorPublic__replaySensorFinishedReplayingData__block_invoke_2;
    v4[3] = &unk_1E6672118;
    v4[4] = *(_QWORD *)(a1 + 32);
    v5 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

void __58__ARReplaySensorPublic__replaySensorFinishedReplayingData__block_invoke_2(uint64_t a1)
{
  _BOOL4 v2;
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  dispatch_time_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = +[ARQATracer isEnabled](ARQATracer, "isEnabled");
  _ARLogGeneral_36();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v17 = v6;
      v18 = 2048;
      v19 = v7;
      _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Waiting 0.5 second for the QATracer to complete the last frame", buf, 0x16u);

    }
    v8 = dispatch_time(0, 500000000);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __58__ARReplaySensorPublic__replaySensorFinishedReplayingData__block_invoke_72;
    v14[3] = &unk_1E6672118;
    v9 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v9;
    dispatch_after(v8, MEMORY[0x1E0C80D38], v14);

  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v17 = v11;
      v18 = 2048;
      v19 = v12;
      v20 = 2114;
      v21 = v13;
      _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: replaySensorDelegate replaySensorDidFinishReplayingData (2): %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "replaySensorDidFinishReplayingData");
  }
}

uint64_t __58__ARReplaySensorPublic__replaySensorFinishedReplayingData__block_invoke_72(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _ARLogGeneral_36();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543874;
    v9 = v4;
    v10 = 2048;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1B3A68000, v2, OS_LOG_TYPE_INFO, "%{public}@ <%p>: replaySensorDelegate replaySensorDidFinishReplayingData (1): %{public}@", (uint8_t *)&v8, 0x20u);

  }
  return objc_msgSend(*(id *)(a1 + 40), "replaySensorDidFinishReplayingData");
}

- (id)_streamIdentifierForCaptureDeviceType:(id)a3 position:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v6 = a3;
  v7 = v6;
  if (self->_usingST2Recording)
  {
    v8 = (id)*MEMORY[0x1E0D040B8];
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C89F98]))
    {
      v9 = (id)*MEMORY[0x1E0D040C8];
LABEL_10:
      v11 = v9;

      v8 = v11;
    }
  }
  else
  {
    ARStreamIdentifierForDeviceTypeAndPosition(v6, a4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C89F98])
      && !-[ARReplaySensorPublic _allStreamsAreAvailable:](self, "_allStreamsAreAvailable:", v8))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%ld"), CFSTR("AVCaptureDeviceTypeBuiltInSuperWideAngleCamera"), a4);
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v10;
    }
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C89F80])
      && !-[ARReplaySensorPublic _allStreamsAreAvailable:](self, "_allStreamsAreAvailable:", v8))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%ld"), CFSTR("JasperCamera"), a4);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }

  return v8;
}

- (void)setTraceReplaySensorDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_traceReplaySensorDelegate, a3);
}

- (ARReplaySensorDelegate)traceReplaySensorDelegate
{
  return self->_traceReplaySensorDelegate;
}

- (ARSensorDelegate)delegate
{
  return (ARSensorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ARReplaySensorDelegate)replaySensorDelegate
{
  return (ARReplaySensorDelegate *)objc_loadWeakRetained((id *)&self->_replaySensorDelegate);
}

- (void)setReplaySensorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_replaySensorDelegate, a3);
}

- (NSURL)sequenceURL
{
  return self->_sequenceURL;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)arkitVersion
{
  return self->_arkitVersion;
}

- (CGSize)imageResolution
{
  double width;
  double height;
  CGSize result;

  width = self->_imageResolution.width;
  height = self->_imageResolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)nominalFrameRate
{
  return self->_nominalFrameRate;
}

- (unint64_t)recordedSensorTypes
{
  return self->_recordedSensorTypes;
}

- (int64_t)replayMode
{
  return self->_replayMode;
}

- (int64_t)nextFrameIndex
{
  return self->_nextFrameIndex;
}

- (void)setNextFrameIndex:(int64_t)a3
{
  self->_nextFrameIndex = a3;
}

- (float)advanceFramesPerSecondMultiplier
{
  return self->_advanceFramesPerSecondMultiplier;
}

- (void)setAdvanceFramesPerSecondMultiplier:(float)a3
{
  self->_advanceFramesPerSecondMultiplier = a3;
}

- (NSSet)customDataClasses
{
  return self->_customDataClasses;
}

- (void)setCustomDataClasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (ARParentImageSensorSettings)parentImageSensorSettings
{
  return self->_parentImageSensorSettings;
}

- (void)setParentImageSensorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_parentImageSensorSettings, a3);
}

- (NSString)mainVideoStreamIdentifier
{
  return self->_mainVideoStreamIdentifier;
}

- (void)setMainVideoStreamIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_mainVideoStreamIdentifier, a3);
}

- (ARSession)session
{
  return (ARSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (NSDictionary)customUserData
{
  return self->_customUserData;
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (BOOL)shouldReplayVisionData
{
  return self->_shouldReplayVisionData;
}

- (int)imageIndex
{
  return self->_imageIndex;
}

- (int64_t)targetFrameIndex
{
  return self->_targetFrameIndex;
}

- (void)setTargetFrameIndex:(int64_t)a3
{
  self->_targetFrameIndex = a3;
}

- (double)recordingTimeToReplayTimeOffset
{
  return self->_recordingTimeToReplayTimeOffset;
}

- (void)setRecordingTimeToReplayTimeOffset:(double)a3
{
  self->_recordingTimeToReplayTimeOffset = a3;
}

- (BOOL)recordingTimeToReplayTimeOffsetReset
{
  return self->_recordingTimeToReplayTimeOffsetReset;
}

- (void)setRecordingTimeToReplayTimeOffsetReset:(BOOL)a3
{
  self->_recordingTimeToReplayTimeOffsetReset = a3;
}

- (NSMutableArray)cmDataBuffer
{
  return self->_cmDataBuffer;
}

- (NSMutableArray)userEventBuffer
{
  return self->_userEventBuffer;
}

- (NSMutableArray)cvaDepthTOFBuffer
{
  return self->_cvaDepthTOFBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cvaDepthTOFBuffer, 0);
  objc_storeStrong((id *)&self->_userEventBuffer, 0);
  objc_storeStrong((id *)&self->_cmDataBuffer, 0);
  objc_storeStrong((id *)&self->_customUserData, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_mainVideoStreamIdentifier, 0);
  objc_storeStrong((id *)&self->_parentImageSensorSettings, 0);
  objc_storeStrong((id *)&self->_customDataClasses, 0);
  objc_storeStrong((id *)&self->_arkitVersion, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_sequenceURL, 0);
  objc_destroyWeak((id *)&self->_replaySensorDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_featureBuffers, 0);
  objc_storeStrong((id *)&self->_calibrationBuffer, 0);
  objc_storeStrong((id *)&self->_depthContainer, 0);
  objc_storeStrong((id *)&self->_determinedReplayStats, 0);
  objc_storeStrong((id *)&self->_traceReplaySensorDelegate, 0);
  objc_storeStrong((id *)&self->_videoStreamsToReplay, 0);
  objc_storeStrong((id *)&self->_availableMetadataStreams, 0);
  objc_storeStrong((id *)&self->_availableVideoStreams, 0);
  objc_storeStrong((id *)&self->_croppingTechnique, 0);
  objc_storeStrong((id *)&self->_reader, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_replayQueue, 0);
  objc_storeStrong((id *)&self->_metadataCache, 0);
  objc_storeStrong((id *)&self->_nextWrappedImageDataForStreamIdentifierMap, 0);
}

@end
