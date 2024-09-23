@implementation AVCaptureSession

- (BOOL)_addInputWithNoConnections:(id)a3 exceptionReason:(id *)a4
{
  BOOL v7;
  AVCaptureSessionInternal *internal;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v7 = -[AVCaptureSession _canAddInput:failureReason:](self, "_canAddInput:failureReason:", a3, &v21);
  if (v7)
  {
    -[AVCaptureSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("inputs"));
    internal = self->_internal;
    objc_sync_enter(internal);
    objc_msgSend(a3, "setSession:", self);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = (void *)objc_msgSend(a3, "ports");
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "addObserver:forKeyPath:options:context:", self, CFSTR("changeSeed"), 3, AVCaptureSessionInputPortChangedContext);
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v10);
    }
    -[NSMutableArray addObject:](self->_internal->inputs, "addObject:", a3);
    if (objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
    {
      v15 = *MEMORY[0x1E0CA2E18];
      v16 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      objc_msgSend(a3, "setVideoMinFrameDurationOverride:", &v15);
      v13 = (void *)objc_msgSend(a3, "device");
      objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("connected"), 3, AVCaptureSessionVideoInputDeviceConnectedChangedContext);
      objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("activeFormat"), 3, AVCaptureSessionVideoInputDeviceActiveFormatChangedContext);
      objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("activeDepthDataFormat"), 3, AVCaptureSessionVideoInputDeviceActiveDepthDataFormatChangedContext);
      objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("automaticallyAdjustsVideoHDREnabled"), 3, AVCaptureSessionVideoInputDeviceAutomaticallyAdjustsHDREnabledChangedContext);
      objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("videoHDREnabled"), 3, AVCaptureSessionVideoInputDeviceHDREnabledChangedContext);
      objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("activeColorSpace"), 3, AVCaptureSessionVideoInputDeviceActiveColorSpaceChangedContext);
      objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("lowLightVideoCaptureEnabled"), 3, AVCaptureSessionVideoInputDeviceLowLightVideoEnabledChangedContext);
      objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("geometricDistortionCorrectionEnabled"), 3, AVCaptureSessionVideoInputDeviceGeometricDistortionCorrectionEnabledChangedContext);
      objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("variableFrameRateVideoCaptureEnabled"), 3, AVCaptureSessionVideoInputDeviceVariableFrameRateVideoEnabledChangedContext);
      objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("videoStabilizationStrength"), 3, AVCaptureSessionVideoInputDeviceVideoStabilizationStrengthChangedContext);
      objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("centerStageActive"), 3, AVCaptureSessionVideoInputDeviceCenterStageActiveChangedContext);
      objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("backgroundBlurActive"), 3, AVCaptureSessionVideoInputDeviceBackgroundBlurActiveChangedContext);
      objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("studioLightActive"), 3, AVCaptureSessionVideoInputDeviceStudioLightingActiveChangedContext);
      objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("canPerformReactionEffects"), 3, AVCaptureSessionVideoInputDeviceReactionEffectsActiveChangedContext);
      objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("backgroundReplacementActive"), 3, AVCaptureSessionVideoInputDeviceBackgroundReplacementActiveChangedContext);
      objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("manualFramingEnabled"), 3, AVCaptureSessionVideoInputDeviceManualFramingEnabledChangedContext);
      objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("manualFramingPanningAngleX"), 3, &AVCaptureSessionVideoInputDeviceManualFramingEnabledChangedContext);
      objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("manualFramingPanningAngleY"), 3, AVCaptureSessionVideoInputDeviceManualFramingPanningAngleYChangedContext);
      objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("gazeSelectionEnabled"), 3, AVCaptureSessionVideoInputDeviceGazeSelectionEnabledChangedContext);
      objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("audioInputRouteIsBuiltInMic"), 3, AVCaptureSessionAudioInputDeviceIsBuiltInMicChangedContext);
    }
    objc_sync_exit(internal);
    -[AVCaptureSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inputs"));
  }
  else if (a4)
  {
    *a4 = v21;
  }
  return v7;
}

- (void)_updateCameraCalibrationDataDeliveryEnabledForSourceDevice:(id)a3
{
  void *v5;
  NSMutableArray *inputs;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *connections;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  AVCaptureSessionInternal *obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  obj = self->_internal;
  objc_sync_enter(obj);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 2);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  inputs = self->_internal->inputs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v32;
    v9 = MEMORY[0x1E0C9AAA0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(inputs);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v5, "setObject:forKey:", v9, objc_msgSend(v11, "device"));
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v7);
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  connections = self->_internal->connections;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(connections);
        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        v17 = (id)objc_msgSend(v16, "sourceDevice");
        v18 = v17;
        if ((!a3 || v17 == a3) && (objc_msgSend((id)objc_msgSend(v5, "objectForKey:", v17), "BOOLValue") & 1) == 0)
        {
          objc_msgSend(v16, "output");
          objc_opt_class();
          objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_opt_isKindOfClass() & 1), v18);
        }
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v13);
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v24;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * k), "_setCameraCalibrationDataDeliveryEnabled:", objc_msgSend((id)objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * k)), "BOOLValue"));
      }
      v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v19);
  }

  objc_sync_exit(obj);
}

- (void)_updateDeviceActiveFormatsAndActiveConnections
{
  NSMutableArray *inputs;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  NSMutableArray *connections;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t MediaSubType;
  uint64_t v20;
  uint64_t k;
  void *v22;
  unsigned int v23;
  int v24;
  int v25;
  uint64_t v26;
  BOOL v27;
  BOOL v28;
  void *v29;
  id v30;
  int v31;
  id v32;
  uint64_t v33;
  unsigned int BoolAnswer;
  unsigned int v35;
  uint64_t v36;
  id v37;
  void *v38;
  unsigned int v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t n;
  uint64_t v50;
  int IsTenBit;
  void *v52;
  int v53;
  uint64_t v54;
  int v55;
  int v56;
  uint64_t v57;
  BOOL v58;
  _BOOL4 v59;
  uint64_t v60;
  void *v61;
  NSMutableArray *v62;
  uint64_t v63;
  CMTimeFlags flags;
  uint64_t v65;
  uint64_t v66;
  uint64_t ii;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  CMTimeEpoch v72;
  int32_t v73;
  CMTimeEpoch v74;
  CMTimeEpoch v75;
  int32_t v76;
  CMTimeEpoch v77;
  BOOL v78;
  CMTimeFlags v79;
  CMTimeEpoch v80;
  char v81;
  void *v82;
  int v83;
  void *v84;
  double v85;
  int v86;
  CMTimeValue v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t jj;
  const __CFString *v93;
  uint64_t v94;
  uint64_t v95;
  id obj;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  CMTimeEpoch v100;
  CMTimeFlags v101;
  CMTimeEpoch v102;
  CMTimeFlags v103;
  int v104;
  unsigned int v105;
  uint64_t v106;
  uint64_t v107;
  _BOOL4 v108;
  unsigned int v109;
  id v110;
  id v111;
  void *v112;
  id v113;
  id v114;
  uint64_t v115;
  unsigned int v116;
  id v117;
  AVCaptureSession *v118;
  CMTimeEpoch epoch;
  CMTimeEpoch v120;
  __int128 v121;
  CMTimeFlags v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  CMTime v127;
  CMTime time2;
  CMTime time1;
  CMTime v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  uint64_t v136;
  __int128 v137;
  uint64_t v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  _BYTE v159[128];
  _BYTE v160[128];
  CMTimeValue v161;
  CMTimeScale v162;
  CMTimeValue value;
  CMTimeScale timescale;
  _BYTE v165[128];
  _BYTE v166[128];
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  uint64_t v170;

  v170 = *MEMORY[0x1E0C80C00];
  obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  v155 = 0u;
  v156 = 0u;
  v157 = 0u;
  v158 = 0u;
  inputs = self->_internal->inputs;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v155, v169, 16);
  v5 = (uint64_t *)MEMORY[0x1E0CF2B90];
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v156;
    v8 = *MEMORY[0x1E0CF2B90];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v156 != v7)
          objc_enumerationMutation(inputs);
        v10 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = (void *)objc_msgSend(v10, "device");
          if (objc_msgSend(v11, "hasMediaType:", v8))
          {
            if ((objc_msgSend(obj, "containsObject:", v11) & 1) == 0)
              objc_msgSend(obj, "addObject:", v11);
          }
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v155, v169, 16);
    }
    while (v6);
  }
  self->_internal->videoInputDeviceUsed = objc_msgSend(obj, "count") != 0;
  v151 = 0u;
  v152 = 0u;
  v153 = 0u;
  v154 = 0u;
  v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v151, v168, 16);
  if (v98)
  {
    v97 = *(_QWORD *)v152;
    v93 = CFSTR("AVCaptureSessionPresetInputPriority");
    v103 = *(_DWORD *)(MEMORY[0x1E0CA2E30] + 12);
    v102 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
    v12 = *v5;
    v95 = *MEMORY[0x1E0CF2B68];
    v94 = *MEMORY[0x1E0CF2B70];
    v101 = *(_DWORD *)(MEMORY[0x1E0CA2E28] + 12);
    v100 = *(_QWORD *)(MEMORY[0x1E0CA2E28] + 16);
    v118 = self;
    do
    {
      for (j = 0; j != v98; j = v60 + 1)
      {
        if (*(_QWORD *)v152 != v97)
          objc_enumerationMutation(obj);
        v115 = j;
        v14 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * j);
        v147 = 0u;
        v148 = 0u;
        v149 = 0u;
        v150 = 0u;
        connections = self->_internal->connections;
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v147, v167, 16, v93);
        if (!v16)
          goto LABEL_46;
        v17 = v16;
        v18 = 0;
        MediaSubType = 0;
        v20 = *(_QWORD *)v148;
        do
        {
          for (k = 0; k != v17; ++k)
          {
            if (*(_QWORD *)v148 != v20)
              objc_enumerationMutation(connections);
            v22 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * k);
            if ((void *)objc_msgSend(v22, "sourceDevice") == v14
              && objc_msgSend((id)objc_msgSend(v22, "output"), "hasRequiredOutputFormatForConnection:", v22))
            {
              v23 = objc_msgSend((id)objc_msgSend(v22, "output"), "requiredOutputFormatForConnection:", v22);
              v24 = FigCaptureUncompressedPixelFormatForPixelFormat();
              if (v24 <= 1111970368)
              {
                if (v24 == 875704422)
                {
                  v25 = 2;
                }
                else
                {
                  if (v24 != 875704438)
                    goto LABEL_35;
                  v25 = 1;
                }
              }
              else
              {
                switch(v24)
                {
                  case 1111970369:
                    v25 = 5;
                    break;
                  case 2016686640:
                    v25 = 3;
                    break;
                  case 2016686642:
                    v25 = 4;
                    break;
                  default:
LABEL_35:
                    v25 = 0;
                    break;
                }
              }
              if (v25 <= v18)
              {
                MediaSubType = MediaSubType;
              }
              else
              {
                v18 = v25;
                MediaSubType = v23;
              }
              continue;
            }
          }
          v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v147, v167, 16);
        }
        while (v17);
        self = v118;
        if ((_DWORD)MediaSubType)
          goto LABEL_42;
LABEL_46:
        v27 = -[NSString isEqualToString:](self->_internal->sessionPreset, "isEqualToString:", CFSTR("AVCaptureSessionPresetPhoto"));
        v26 = 875704422;
        if (!v27)
        {
          v28 = -[NSString isEqualToString:](self->_internal->sessionPreset, "isEqualToString:", CFSTR("AVCaptureSessionPresetPhoto2592x1936"), 875704422);
          v26 = 875704422;
          if (!v28)
          {
            if (!-[NSString isEqualToString:](self->_internal->sessionPreset, "isEqualToString:", v93, 875704422))
              goto LABEL_53;
            MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend((id)objc_msgSend(v14, "activeFormat"), "formatDescription"));
LABEL_42:
            if ((int)MediaSubType > 2016686639)
            {
              if ((_DWORD)MediaSubType == 2016686640)
              {
                v26 = MediaSubType;
              }
              else
              {
                if ((_DWORD)MediaSubType != 2016686642)
                  goto LABEL_53;
                v26 = 2016686642;
              }
            }
            else
            {
              v26 = 875704422;
              if ((_DWORD)MediaSubType != 875704422 && (_DWORD)MediaSubType != 1111970369)
LABEL_53:
                v26 = 875704438;
            }
          }
        }
        v29 = (void *)objc_msgSend(v14, "deviceFormatForSessionPreset:sourceVideoFormat:", self->_internal->sessionPreset, v26);
        v30 = -[AVCaptureSession _outputWithClass:forSourceDevice:](self, "_outputWithClass:forSourceDevice:", objc_opt_class(), v14);
        if (v30)
        {
          if ((AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureMFOSupportsPhotoFormats")) & 1) != 0)
            v31 = 1;
          else
            v31 = objc_msgSend(v29, "isPhotoFormat") ^ 1;
          v109 = v31;
        }
        else
        {
          v109 = 0;
        }
        v32 = -[AVCaptureSession _outputsWithClass:forSourceDevice:](self, "_outputsWithClass:forSourceDevice:", objc_opt_class(), v14);
        v33 = objc_msgSend(v32, "count");
        BoolAnswer = AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureMultipleVideoDataOutputsSupported"));
        if (v30)
          v35 = BoolAnswer;
        else
          v35 = 1;
        if (v33)
          v36 = v35;
        else
          v36 = 0;
        v114 = -[AVCaptureSession _outputWithClass:forSourceDevice:](self, "_outputWithClass:forSourceDevice:", objc_opt_class(), v14);
        v107 = objc_msgSend(v14, "activeColorSpace");
        v113 = -[AVCaptureSession _outputWithClass:forSourceDevice:](self, "_outputWithClass:forSourceDevice:", objc_opt_class(), v14);
        v106 = objc_msgSend(v14, "activeColorSpace");
        v37 = -[AVCaptureSession _outputWithClass:forSourceDevice:](self, "_outputWithClass:forSourceDevice:", objc_opt_class(), 0);
        v38 = v37;
        v39 = v37 != 0;
        if (v30 && v37)
          v39 = AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureSimultaneousADOMFOVDOOutputsSupported"));
        if ((AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureADOSupportsAudioCaptureWithPhotoFormats")) & 1) == 0)
          v39 &= objc_msgSend(v29, "isPhotoFormat") ^ 1;
        v112 = v38;
        v116 = v39;
        if (v38)
        {
          v145 = 0u;
          v146 = 0u;
          v143 = 0u;
          v144 = 0u;
          v40 = (void *)objc_msgSend(v38, "connections");
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v143, v166, 16);
          if (v41)
          {
            v42 = v41;
            v43 = *(_QWORD *)v144;
            while (2)
            {
              for (m = 0; m != v42; ++m)
              {
                if (*(_QWORD *)v144 != v43)
                  objc_enumerationMutation(v40);
                if (objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v143 + 1) + 8 * m), "sourceDeviceInput"), "multichannelAudioMode") == 2)
                {
                  v116 = 0;
                  goto LABEL_83;
                }
              }
              v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v143, v166, 16);
              if (v42)
                continue;
              break;
            }
          }
        }
LABEL_83:
        self = v118;
        v111 = -[AVCaptureSession _outputWithClass:forSourceDevice:](v118, "_outputWithClass:forSourceDevice:", objc_opt_class(), v14);
        v117 = v30;
        if (v111
          && ((objc_msgSend(v29, "isStreamingDisparitySupported") & 1) != 0
           || objc_msgSend(v29, "isStreamingDepthSupported")))
        {
          if (CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v29, "formatDescription")).width >= 2561
            && objc_msgSend(v14, "_isBravoVariant"))
          {
            v141 = 0u;
            v142 = 0u;
            v139 = 0u;
            v140 = 0u;
            v45 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v139, v165, 16);
            if (v45)
            {
              v46 = v45;
              v47 = *(_QWORD *)v140;
              v48 = 1;
              do
              {
                for (n = 0; n != v46; ++n)
                {
                  if (*(_QWORD *)v140 != v47)
                    objc_enumerationMutation(v32);
                  v48 &= objc_msgSend(*(id *)(*((_QWORD *)&v139 + 1) + 8 * n), "deliversPreviewSizedOutputBuffers");
                }
                v46 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v139, v165, 16);
              }
              while (v46);
            }
            else
            {
              v48 = 1;
            }
            if (v109)
            {
              v83 = -[NSString isEqual:](v118->_internal->sessionPreset, "isEqual:", CFSTR("AVCaptureSessionPresetPhoto"));
              if (v48)
                v48 = v83;
              else
                v48 = 0;
            }
          }
          else
          {
            v48 = 1;
          }
          v108 = v48 != 0;
        }
        else
        {
          v108 = 0;
        }
        v110 = -[AVCaptureSession _outputWithClass:forSourceDevice:](v118, "_outputWithClass:forSourceDevice:", objc_opt_class(), v14);
        if (v110)
          v105 = objc_msgSend(v14, "isGeometricDistortionCorrectionEnabled") ^ 1;
        else
          v105 = 0;
        v50 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v29, "supportedColorSpaces"), "firstObject"), "integerValue");
        if (v118->_internal->automaticallyConfiguresCaptureDeviceForWideColor)
        {
          if (objc_msgSend(v14, "isWideColorSupported"))
          {
            if ((objc_msgSend((id)objc_opt_class(), "_isConfiguringProperty:forDevice:", CFSTR("activeColorSpace"), v14) & 1) == 0)
            {
              objc_msgSend((id)objc_msgSend(v29, "figCaptureSourceVideoFormat"), "format");
              IsTenBit = FigCapturePixelFormatIsTenBit();
              if ((IsTenBit & 1) != 0
                || -[AVCaptureSession _outputWithClass:forSourceDevice:](v118, "_outputWithClass:forSourceDevice:", objc_opt_class(), v14)&& ((v109 | v36) != 1|| -[NSString isEqualToString:](v118->_internal->sessionPreset, "isEqualToString:", CFSTR("AVCaptureSessionPresetPhoto"))))
              {
                if ((objc_msgSend(v29, "isWideColorSupported") & 1) == 0
                  && (-[NSString isEqual:](v118->_internal->sessionPreset, "isEqual:", v93) & 1) == 0)
                {
                  v52 = (void *)objc_msgSend(v14, "deviceFormatForSessionPreset:sourceVideoFormat:", v118->_internal->sessionPreset, 875704422);
                  if (objc_msgSend(v52, "isWideColorSupported"))
                    v29 = v52;
                  self = v118;
                }
                v53 = objc_msgSend(v29, "isWideColorSupported");
                v54 = 1;
                if (IsTenBit)
                  v54 = 2;
                if (v53)
                  v50 = v54;
              }
            }
          }
        }
        v55 = objc_msgSend(v29, "isEqual:", objc_msgSend(v14, "activeFormat"));
        if ((v55 & 1) != 0)
        {
          if (-[NSMutableArray containsObject:](self->_internal->devicesToResetVideoZoomFactorAndMinMaxFrameDurations, "containsObject:", v14)&& objc_msgSend(v14, "lockForConfiguration:", 0))
          {
            v137 = *MEMORY[0x1E0CA2E18];
            v121 = v137;
            v56 = v55;
            v138 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
            v57 = v138;
            objc_msgSend(v14, "setActiveVideoMaxFrameDuration:", &v137);
            v135 = v121;
            v136 = v57;
            v55 = v56;
            objc_msgSend(v14, "setActiveVideoMinFrameDuration:", &v135);
            -[AVCaptureSession _updateDepthDataDeliveryEnabledForSourceDevice:](self, "_updateDepthDataDeliveryEnabledForSourceDevice:", v14);
            objc_msgSend(v14, "_resetDefaultVideoZoomFactor");
            -[NSMutableArray removeObject:](self->_internal->devicesToResetVideoZoomFactorAndMinMaxFrameDurations, "removeObject:", v14);
            objc_msgSend(v14, "unlockForConfiguration");
          }
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "_startConfiguringProperty:forDevice:", CFSTR("activeFormat"), v14);
          objc_msgSend((id)objc_opt_class(), "_startConfiguringProperty:forDevice:", CFSTR("activeColorSpace"), v14);
          if (objc_msgSend(v14, "lockForConfiguration:", 0))
          {
            objc_msgSend(v14, "_setActiveFormat:resetVideoZoomFactorAndMinMaxFrameDurations:sessionPreset:", v29, -[NSMutableArray containsObject:](self->_internal->devicesToResetVideoZoomFactorAndMinMaxFrameDurations, "containsObject:", v14), self->_internal->sessionPreset);
            -[NSMutableArray removeObject:](self->_internal->devicesToResetVideoZoomFactorAndMinMaxFrameDurations, "removeObject:", v14);
            objc_msgSend(v14, "unlockForConfiguration");
          }
          objc_msgSend((id)objc_opt_class(), "_finishConfiguringProperty:forDevice:", CFSTR("activeColorSpace"), v14);
          objc_msgSend((id)objc_opt_class(), "_finishConfiguringProperty:forDevice:", CFSTR("activeFormat"), v14);
        }
        v99 = v50;
        if (objc_msgSend(v14, "isActiveVideoMinFrameDurationSet")
          && (objc_msgSend(v14, "isActiveVideoMaxFrameDurationSet") & 1) != 0)
        {
          v58 = 0;
          v59 = 0;
          v60 = v115;
          v61 = v117;
        }
        else
        {
          v104 = v55;
          value = *MEMORY[0x1E0CA2E30];
          timescale = *(_DWORD *)(MEMORY[0x1E0CA2E30] + 8);
          v161 = *MEMORY[0x1E0CA2E28];
          v162 = *(_DWORD *)(MEMORY[0x1E0CA2E28] + 8);
          v131 = 0u;
          v132 = 0u;
          v133 = 0u;
          v134 = 0u;
          v62 = self->_internal->connections;
          v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v131, v160, 16);
          flags = v103;
          v122 = v101;
          epoch = v102;
          v120 = v100;
          if (v63)
          {
            v65 = v63;
            v66 = *(_QWORD *)v132;
            flags = v103;
            v122 = v101;
            epoch = v102;
            v120 = v100;
            do
            {
              for (ii = 0; ii != v65; ++ii)
              {
                if (*(_QWORD *)v132 != v66)
                  objc_enumerationMutation(v62);
                v68 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * ii);
                if ((void *)objc_msgSend(v68, "sourceDevice") == v14
                  && objc_msgSend((id)objc_msgSend(v68, "mediaType"), "isEqual:", v12))
                {
                  if ((objc_msgSend(v14, "isActiveVideoMinFrameDurationSet") & 1) == 0)
                  {
                    if (objc_msgSend(v68, "isVideoMinFrameDurationSet"))
                    {
                      memset(&v130, 0, sizeof(v130));
                      if (v68)
                      {
                        objc_msgSend(v68, "_videoMinFrameDuration");
                        if ((v130.flags & 1) != 0)
                        {
                          time1 = v130;
                          time2.value = value;
                          time2.timescale = timescale;
                          time2.flags = flags;
                          time2.epoch = epoch;
                          if (CMTimeCompare(&time1, &time2) < 0)
                          {
                            value = v130.value;
                            flags = v130.flags;
                            timescale = v130.timescale;
                            epoch = v130.epoch;
                          }
                        }
                      }
                    }
                  }
                  if ((objc_msgSend(v14, "isActiveVideoMaxFrameDurationSet") & 1) == 0)
                  {
                    if (objc_msgSend(v68, "isVideoMaxFrameDurationSet"))
                    {
                      memset(&v130, 0, sizeof(v130));
                      if (v68)
                      {
                        objc_msgSend(v68, "_videoMaxFrameDuration");
                        if ((v130.flags & 1) != 0)
                        {
                          time1 = v130;
                          time2.value = v161;
                          time2.timescale = v162;
                          time2.flags = v122;
                          time2.epoch = v120;
                          if (CMTimeCompare(&time1, &time2) >= 1)
                          {
                            v161 = v130.value;
                            v122 = v130.flags;
                            v162 = v130.timescale;
                            v120 = v130.epoch;
                          }
                        }
                      }
                    }
                  }
                }
              }
              v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v131, v160, 16);
            }
            while (v65);
          }
          v69 = v122 & 9;
          v59 = v69 != 9;
          v58 = (flags & 5) != 5;
          if ((flags & 5) == 5 && v69 == 9)
          {
            v58 = 0;
            v59 = 0;
            v61 = v117;
            self = v118;
            v60 = v115;
            v55 = v104;
          }
          else
          {
            memset(&v130, 0, sizeof(v130));
            v70 = (void *)objc_msgSend(v14, "activeFormat");
            self = v118;
            if (v70)
              objc_msgSend(v70, "lowestSupportedVideoFrameDuration");
            else
              memset(&v130, 0, sizeof(v130));
            memset(&time1, 0, sizeof(time1));
            v71 = (void *)objc_msgSend(v14, "activeFormat");
            if (v71)
              objc_msgSend(v71, "highestSupportedVideoFrameDuration");
            else
              memset(&time1, 0, sizeof(time1));
            v72 = v120;
            v60 = v115;
            if ((flags & 5) != 5)
            {
              time2.value = value;
              time2.timescale = timescale;
              time2.flags = flags;
              time2.epoch = epoch;
              v127 = v130;
              v73 = CMTimeCompare(&time2, &v127);
              v74 = epoch;
              if (v73 < 0)
              {
                value = v130.value;
                flags = v130.flags;
                timescale = v130.timescale;
                v74 = v130.epoch;
              }
              time2.value = value;
              time2.timescale = timescale;
              time2.flags = flags;
              time2.epoch = v74;
              v127 = time1;
              v75 = v74;
              v76 = CMTimeCompare(&time2, &v127);
              v77 = v75;
              if (v76 >= 1)
              {
                value = time1.value;
                flags = time1.flags;
                timescale = time1.timescale;
                v77 = time1.epoch;
              }
              time2.value = value;
              time2.timescale = timescale;
              time2.flags = flags;
              time2.epoch = v77;
              objc_msgSend(v14, "_setActiveVideoMinFrameDuration:", &time2);
              v72 = v120;
              v59 = (v122 & 9) != 9;
            }
            v78 = v69 == 9;
            v61 = v117;
            v55 = v104;
            if (!v78)
            {
              time2.value = v161;
              time2.timescale = v162;
              v79 = v122;
              time2.flags = v122;
              time2.epoch = v72;
              v127 = time1;
              v80 = v120;
              if (CMTimeCompare(&time2, &v127) >= 1)
              {
                v161 = time1.value;
                v79 = time1.flags;
                v162 = time1.timescale;
                v80 = time1.epoch;
              }
              time2.value = v161;
              time2.timescale = v162;
              time2.flags = v79;
              time2.epoch = v80;
              v127 = v130;
              if (CMTimeCompare(&time2, &v127) < 0)
              {
                v161 = v130.value;
                v79 = v130.flags;
                v162 = v130.timescale;
                v80 = v130.epoch;
              }
              time2.value = v161;
              time2.timescale = v162;
              time2.flags = v79;
              time2.epoch = v80;
              objc_msgSend(v14, "_setActiveVideoMaxFrameDuration:", &time2);
              v61 = v117;
              v59 = (v122 & 9) != 9;
            }
          }
        }
        v81 = objc_msgSend(v14, "isActiveVideoMinFrameDurationSet");
        if (!v58
          && (v81 & 1) == 0
          && ((v59 | objc_msgSend(v14, "isActiveVideoMaxFrameDurationSet")) & 1) == 0
          && (objc_msgSend(v14, "isPortraitEffectActive") & 1) == 0
          && (objc_msgSend(v14, "isStudioLightActive") & 1) == 0
          && (objc_msgSend(v14, "isBackgroundReplacementActive") & 1) == 0
          && (objc_msgSend(v14, "isCenterStageActive") & 1) == 0)
        {
          memset(&v130, 0, sizeof(v130));
          v82 = (void *)objc_msgSend(v14, "activeFormat");
          if (v82)
            objc_msgSend(v82, "defaultActiveMinFrameDurationForSessionPreset:", self->_internal->sessionPreset);
          else
            memset(&v130, 0, sizeof(v130));
          memset(&time1, 0, sizeof(time1));
          v84 = (void *)objc_msgSend(v14, "activeFormat");
          if (v84)
            objc_msgSend(v84, "defaultActiveMaxFrameDurationForSessionPreset:", self->_internal->sessionPreset);
          else
            memset(&time1, 0, sizeof(time1));
          if (v108)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "activeDepthDataFormat"), "videoSupportedFrameRateRanges"), "lastObject"), "maxFrameRate");
            v86 = (int)v85;
            v87 = v130.timescale / v130.value;
            v88 = (int)v87 <= (int)v85 ? 1 : (int)v87 / v86;
            CMTimeMake(&time2, 1, v88 * v86);
            v130 = time2;
            time2 = time1;
            v127 = v130;
            if (CMTimeCompare(&time2, &v127) < 0)
              time1 = v130;
          }
          time2 = v130;
          objc_msgSend(v14, "_setActiveVideoMinFrameDuration:", &time2);
          time2 = time1;
          objc_msgSend(v14, "_setActiveVideoMaxFrameDuration:", &time2);
        }
        if (self->_internal->automaticallyConfiguresCaptureDeviceForWideColor
          && objc_msgSend(v14, "isWideColorSupported")
          && objc_msgSend(v14, "lockForConfiguration:", 0))
        {
          if (objc_msgSend(v14, "activeColorSpace") != v99)
          {
            objc_msgSend((id)objc_opt_class(), "_startConfiguringProperty:forDevice:", CFSTR("activeColorSpace"), v14);
            objc_msgSend(v14, "setActiveColorSpace:", v99);
            objc_msgSend((id)objc_opt_class(), "_finishConfiguringProperty:forDevice:", CFSTR("activeColorSpace"), v14);
          }
          objc_msgSend(v14, "unlockForConfiguration");
        }
        -[AVCaptureSession _updateVideoHDREnabledForDevice:forceResetVideoHDRSuspended:](self, "_updateVideoHDREnabledForDevice:forceResetVideoHDRSuspended:", v14, v55 ^ 1u);
        if (v61)
          objc_msgSend(v61, "setConnectionsActive:", v109);
        v125 = 0u;
        v126 = 0u;
        v123 = 0u;
        v124 = 0u;
        v89 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v123, v159, 16);
        if (v89)
        {
          v90 = v89;
          v91 = *(_QWORD *)v124;
          do
          {
            for (jj = 0; jj != v90; ++jj)
            {
              if (*(_QWORD *)v124 != v91)
                objc_enumerationMutation(v32);
              objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * jj), "connectionWithMediaType:", v12), "_setActive:", v36);
            }
            v90 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v123, v159, 16);
          }
          while (v90);
        }
        if (v112)
          objc_msgSend((id)objc_msgSend(v112, "connectionWithMediaType:", v95), "_setActive:", v116);
        if (v111)
          objc_msgSend((id)objc_msgSend(v111, "connectionWithMediaType:", v94), "_setActive:", v108);
        if (v110)
          objc_msgSend((id)objc_msgSend(v110, "connectionWithMediaType:", CFSTR("cacd")), "_setActive:", v105);
        if (v114)
          objc_msgSend((id)objc_msgSend(v114, "connectionWithMediaType:", v12), "_setActive:", v107 != 3);
        if (v113)
          objc_msgSend((id)objc_msgSend(v113, "connectionWithMediaType:", v12), "_setActive:", v106 != 3);
      }
      v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v151, v168, 16);
    }
    while (v98);
  }

}

- (id)_outputWithClass:(Class)a3 forSourceDevice:(id)a4
{
  return (id)objc_msgSend(-[AVCaptureSession _outputsWithClass:forSourceDevice:](self, "_outputsWithClass:forSourceDevice:", a3, a4), "firstObject");
}

- (id)_outputsWithClass:(Class)a3 forSourceDevice:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  NSMutableArray *obj;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = self->_internal->outputs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v18 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v24 != v18)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v10 = (void *)objc_msgSend(v9, "connections");
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v20 != v13)
                objc_enumerationMutation(v10);
              v15 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "sourceDevice");
              if (!a4 || v15 == a4)
              {
                if (!v7)
                  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
                objc_msgSend(v7, "addObject:", v9);
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v12);
        }
      }
    }
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  }
  while (v6);
  return v7;
}

- (void)_updateDepthDataDeliveryEnabledForSourceDevice:(id)a3
{
  NSMutableArray *connections;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __objc2_prop_list **p_inst_props;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  AVCaptureSessionInternal *v24;
  NSHashTable *videoPreviewLayers;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  uint64_t v30;
  int v31;
  NSMutableArray *devicesObservingVideoZoomFactor;
  uint64_t v33;
  AVCaptureSessionInternal *internal;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  objc_sync_enter(internal);
  obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 2);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 2);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  connections = self->_internal->connections;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v50 != v6)
          objc_enumerationMutation(connections);
        v8 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        v9 = (id)objc_msgSend(v8, "sourceDevice", internal);
        v10 = v9;
        if ((!a3 || v9 == a3)
          && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "activeFormat"), "supportedDepthDataFormats"), "count")
          && (objc_msgSend(v8, "isTrulyDisabled") & 1) == 0
          && (objc_msgSend((id)objc_msgSend(obj, "objectForKey:", v10), "BOOLValue") & 1) == 0)
        {
          if (objc_msgSend(v8, "output"))
            v11 = objc_msgSend(v8, "output");
          else
            v11 = objc_msgSend(v8, "videoPreviewLayer");
          v12 = (void *)v11;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v13 = objc_msgSend(v12, "isDepthDataDeliveryEnabled");
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = objc_msgSend(v12, "isVirtualDeviceConstituentPhotoDeliveryEnabled");
LABEL_24:
              objc_msgSend(obj, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13), v10);
              objc_msgSend(v38, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14), v10);
              continue;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = 0;
              v13 = 1;
              goto LABEL_24;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (v15 = (void *)objc_msgSend(v12, "metadataObjectTypes"), objc_msgSend(v10, "activeDepthDataFormat")))
            {
              v13 = objc_msgSend(v15, "containsObject:", CFSTR("trackedFaces"));
            }
            else
            {
              v13 = 0;
            }
          }
          v14 = 0;
          goto LABEL_24;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v5);
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16, internal);
  if (v16)
  {
    v17 = *(_QWORD *)v46;
    p_inst_props = &OBJC_PROTOCOL___AVCaptureMetadataOutputObjectsDelegateInternal.inst_props;
    v36 = *(_QWORD *)v46;
    do
    {
      v19 = 0;
      v37 = v16;
      do
      {
        if (*(_QWORD *)v46 != v17)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v19);
        v21 = objc_msgSend((id)objc_msgSend(obj, "objectForKey:", v20), "BOOLValue");
        v22 = objc_msgSend((id)objc_msgSend(v38, "objectForKey:", v20), "BOOLValue");
        if ((_DWORD)v21
          && (v23 = -[AVCaptureSession _outputWithClass:forSourceDevice:](self, "_outputWithClass:forSourceDevice:", objc_opt_class(), v20)) != 0&& objc_msgSend(v23, "isDepthCaptureEnabled"))
        {
          v24 = self->_internal;
          objc_sync_enter(v24);
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          videoPreviewLayers = self->_internal->videoPreviewLayers;
          v26 = -[NSHashTable countByEnumeratingWithState:objects:count:](videoPreviewLayers, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
          if (v26)
          {
            v27 = *(_QWORD *)v42;
            while (2)
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v42 != v27)
                  objc_enumerationMutation(videoPreviewLayers);
                v29 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
                if ((void *)objc_msgSend((id)objc_msgSend(v29, "connection"), "sourceDevice") == v20
                  && objc_msgSend(v29, "isDepthDataDeliveryEnabled")
                  && (objc_msgSend(v29, "isFilterRenderingEnabled") & 1) != 0)
                {
                  v30 = 1;
                  goto LABEL_55;
                }
              }
              v26 = -[NSHashTable countByEnumeratingWithState:objects:count:](videoPreviewLayers, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
              if (v26)
                continue;
              break;
            }
          }
          v30 = 0;
LABEL_55:
          objc_sync_exit(v24);
          v17 = v36;
          v16 = v37;
          p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___AVCaptureMetadataOutputObjectsDelegateInternal + 56);
        }
        else
        {
          v30 = 0;
        }
        objc_msgSend(v20, "_setCinematicVideoEnabled:", v30);
        objc_msgSend(v20, "_setDepthDataDeliveryEnabled:", v21);
        objc_msgSend(v20, "_setContinuousZoomWithDepthDisallowed:", v22);
        v31 = v30 | v21 & (objc_msgSend((id)objc_msgSend(v20, "activeFormat"), "isContinuousZoomWithDepthSupported") ^ 1 | v22) ^ 1;
        devicesObservingVideoZoomFactor = self->_internal->_devicesObservingVideoZoomFactor;
        if ((v31 & 1) != 0)
        {
          if (-[NSMutableArray containsObject:](devicesObservingVideoZoomFactor, "containsObject:", v20))
          {
            objc_msgSend(v20, "removeObserver:forKeyPath:context:", self, CFSTR("videoZoomFactor"), p_inst_props[72]);
            -[NSMutableArray removeObject:](self->_internal->_devicesObservingVideoZoomFactor, "removeObject:", v20);
          }
        }
        else if ((-[NSMutableArray containsObject:](devicesObservingVideoZoomFactor, "containsObject:", v20) & 1) == 0)
        {
          objc_msgSend(v20, "addObserver:forKeyPath:options:context:", self, CFSTR("videoZoomFactor"), 3, p_inst_props[72]);
          -[NSMutableArray addObject:](self->_internal->_devicesObservingVideoZoomFactor, "addObject:", v20);
        }
        ++v19;
      }
      while (v19 != v16);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      v16 = v33;
    }
    while (v33);
  }

  objc_sync_exit(v35);
}

- (void)_determineSynchronizationClock
{
  AVCaptureSession *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  NSMutableArray *connections;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  AVCaptureSession *v23;
  AVCaptureSessionInternal *internal;
  NSMutableArray *obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v2 = self;
  v46 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  objc_sync_enter(internal);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v2->_internal->connections;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (!v3)
    goto LABEL_20;
  v23 = v2;
  v4 = 0;
  v5 = *(_QWORD *)v39;
  v6 = *MEMORY[0x1E0CF2B68];
  do
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v39 != v5)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      if ((objc_msgSend(v8, "isTrulyDisabled") & 1) == 0)
      {
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v9 = (void *)objc_msgSend(v8, "inputPorts");
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v35;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v35 != v11)
                objc_enumerationMutation(v9);
              v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
              if (objc_msgSend((id)objc_msgSend(v13, "mediaType"), "isEqualToString:", v6))
              {
                v4 = objc_msgSend((id)objc_msgSend(v13, "input"), "clock");
                goto LABEL_17;
              }
            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
            if (v10)
              continue;
            break;
          }
        }
      }
LABEL_17:
      ;
    }
    v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  }
  while (v3);
  v2 = v23;
  if (!v4)
  {
LABEL_20:
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    connections = v2->_internal->connections;
    v4 = 0;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v31;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(connections);
          v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * k);
          if (objc_msgSend(v18, "isActive"))
          {
            if ((objc_msgSend(v18, "isTrulyDisabled") & 1) == 0)
            {
              v28 = 0u;
              v29 = 0u;
              v26 = 0u;
              v27 = 0u;
              v19 = (void *)objc_msgSend(v18, "inputPorts");
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
              if (v20)
              {
                v21 = *(_QWORD *)v27;
LABEL_29:
                v22 = 0;
                while (1)
                {
                  if (*(_QWORD *)v27 != v21)
                    objc_enumerationMutation(v19);
                  v4 = objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v22), "input"), "clock");
                  if (v4)
                    break;
                  if (v20 == ++v22)
                  {
                    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
                    v4 = 0;
                    if (v20)
                      goto LABEL_29;
                    break;
                  }
                }
              }
            }
          }
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
      }
      while (v15);
    }
  }
  objc_sync_exit(internal);
  -[AVCaptureSession _setSynchronizationClock:](v2, "_setSynchronizationClock:", v4);
}

- (void)_updateConstantColorEnabledForSourceDevice:(id)a3
{
  void *v5;
  NSMutableArray *inputs;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *connections;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  AVCaptureSessionInternal *obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  obj = self->_internal;
  objc_sync_enter(obj);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 2);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  inputs = self->_internal->inputs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v35;
    v9 = MEMORY[0x1E0C9AAA0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(inputs);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v5, "setObject:forKey:", v9, objc_msgSend(v11, "device"));
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v7);
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  connections = self->_internal->connections;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(connections);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        v17 = (id)objc_msgSend(v16, "sourceDevice");
        v18 = v17;
        if ((!a3 || v17 == a3) && (objc_msgSend((id)objc_msgSend(v5, "objectForKey:", v17), "BOOLValue") & 1) == 0)
        {
          if (objc_msgSend(v16, "output"))
            v19 = objc_msgSend(v16, "output");
          else
            v19 = objc_msgSend(v16, "videoPreviewLayer");
          v20 = (void *)v19;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v21 = objc_msgSend(v20, "isConstantColorEnabled");
          else
            v21 = 0;
          objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21), v18);
        }
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v13);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v22 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v27;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * k), "_setConstantColorEnabled:", objc_msgSend((id)objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * k)), "BOOLValue"));
      }
      v22 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v22);
  }

  objc_sync_exit(obj);
}

- (void)_updateHardwareCost
{
  AVCaptureSession *v2;
  void *v3;
  NSArray *v4;
  uint64_t v5;
  float v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  float v13;
  AVCaptureSession *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v2 = self;
  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AF16C4](self, a2);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = -[AVCaptureSession connections](v2, "connections");
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  v6 = 0.0;
  if (v5)
  {
    v7 = v5;
    v14 = v2;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    v10 = *MEMORY[0x1E0CF2B90];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "isActive", v14))
        {
          if (objc_msgSend((id)objc_msgSend(v12, "mediaType"), "isEqualToString:", v10))
          {
            objc_msgSend(v12, "output");
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              || (objc_msgSend(v12, "output"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              if (v8 >= 1)
              {
                v2 = v14;
                -[AVCaptureSession _totalHardwareCost](v14, "_totalHardwareCost");
                v6 = v13;
                goto LABEL_16;
              }
              v8 = 1;
            }
          }
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
    v2 = v14;
  }
LABEL_16:
  if (v6 != v2->_internal->hardwareCost)
  {
    -[AVCaptureSession willChangeValueForKey:](v2, "willChangeValueForKey:", CFSTR("hardwareCost"));
    v2->_internal->hardwareCost = v6;
    -[AVCaptureSession didChangeValueForKey:](v2, "didChangeValueForKey:", CFSTR("hardwareCost"));
  }
  objc_autoreleasePoolPop(v3);
}

- (NSArray)connections
{
  AVCaptureSessionInternal *internal;
  NSArray *v4;

  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_internal->connections);
  objc_sync_exit(internal);
  return v4;
}

- (void)_setSynchronizationClock:(OpaqueCMClock *)a3
{
  AVCaptureSessionInternal *internal;
  AVCaptureSessionInternal *v6;
  OpaqueCMClock *synchronizationClock;

  internal = self->_internal;
  objc_sync_enter(internal);
  if (self->_internal->synchronizationClock != a3)
  {
    -[AVCaptureSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("synchronizationClock"));
    -[AVCaptureSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("masterClock"));
    v6 = self->_internal;
    synchronizationClock = v6->synchronizationClock;
    v6->synchronizationClock = a3;
    if (a3)
      CFRetain(a3);
    if (synchronizationClock)
      CFRelease(synchronizationClock);
    -[AVCaptureSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("masterClock"));
    -[AVCaptureSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("synchronizationClock"));
  }
  objc_sync_exit(internal);
}

- (BOOL)canAddOutput:(AVCaptureOutput *)output
{
  return -[AVCaptureSession _canAddOutput:failureReason:](self, "_canAddOutput:failureReason:", output, 0);
}

- (BOOL)canAddInput:(AVCaptureInput *)input
{
  return -[AVCaptureSession _canAddInput:failureReason:](self, "_canAddInput:failureReason:", input, 0);
}

- (void)_setMultitaskingCameraAccessEnabled:(BOOL)a3
{
  if (self->_internal->authorizedToUseCameraInMultipleForegroundAppLayout != a3)
  {
    -[AVCaptureSession _beginConfiguration](self, "_beginConfiguration");
    self->_internal->authorizedToUseCameraInMultipleForegroundAppLayout = a3;
    -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
  }
}

- (void)addInput:(AVCaptureInput *)input
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVCaptureSessionInternal *internal;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  AVCaptureSessionInternal *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  os_log_type_t type;
  int v30;
  _BYTE v31[128];
  _BYTE v32[128];
  _QWORD v33[19];

  v33[16] = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED6A0)
  {
    v30 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVCaptureSession _beginConfiguration](self, "_beginConfiguration", v18, v19);
  internal = self->_internal;
  objc_sync_enter(internal);
  v33[0] = 0;
  if (-[AVCaptureSession _addInputWithNoConnections:exceptionReason:](self, "_addInputWithNoConnections:exceptionReason:", input, v33))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = -[AVCaptureInput ports](input, "ports");
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v26;
      v20 = internal;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v7);
          v11 = -[AVCaptureSession _connectionsForNewInputPort:](self, "_connectionsForNewInputPort:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          v23 = 0u;
          v24 = 0u;
          v21 = 0u;
          v22 = 0u;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
          if (v12)
          {
            v13 = *(_QWORD *)v22;
            while (2)
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v22 != v13)
                  objc_enumerationMutation(v11);
                if (!-[AVCaptureSession _addConnection:exceptionReason:](self, "_addConnection:exceptionReason:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j), v33))
                {
                  internal = v20;
                  v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
                  -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
                  if (AVCaptureShouldThrowForAPIViolations())
                    objc_exception_throw(v17);
                  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v17);
                  goto LABEL_28;
                }
              }
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
              if (v12)
                continue;
              break;
            }
          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
        internal = v20;
      }
      while (v8);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)-[AVCaptureInput device](input, "device");
      if (objc_msgSend(v15, "hasMediaType:", *MEMORY[0x1E0CF2B90]))
      {
        -[NSMutableArray addObject:](self->_internal->devicesToResetVideoZoomFactorAndMinMaxFrameDurations, "addObject:", v15);
        if (objc_msgSend(v15, "lockForConfiguration:", 0))
        {
          objc_msgSend(v15, "setCachesFigCaptureSourceConfigurationChanges:", 1);
          objc_msgSend(v15, "unlockForConfiguration");
        }
      }
    }
    objc_sync_exit(internal);
    -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
  }
  else
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v16);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v16);
LABEL_28:
    objc_sync_exit(internal);
  }
}

- (id)_connectionsForNewInputPort:(id)a3
{
  uint64_t v5;
  void *v6;
  NSMutableArray *outputs;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  AVCaptureConnection *v13;
  NSHashTable *videoPreviewLayers;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  AVCaptureConnection *v20;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)v5;
  if (a3)
  {
    v22 = (void *)v5;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    outputs = self->_internal->outputs;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputs, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(outputs);
          v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          v33 = a3;
          v13 = +[AVCaptureConnection connectionWithInputPorts:output:](AVCaptureConnection, "connectionWithInputPorts:output:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1), v12);
          if (-[AVCaptureSession _shouldAutomaticallyAddConnection:](self, "_shouldAutomaticallyAddConnection:", v13))
            objc_msgSend(v22, "addObject:", v13);
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputs, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v9);
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    videoPreviewLayers = self->_internal->videoPreviewLayers;
    v15 = -[NSHashTable countByEnumeratingWithState:objects:count:](videoPreviewLayers, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    v6 = v22;
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(videoPreviewLayers);
          v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
          v23 = 0;
          v20 = +[AVCaptureConnection connectionWithInputPort:videoPreviewLayer:](AVCaptureConnection, "connectionWithInputPort:videoPreviewLayer:", a3, v19);
          if (objc_msgSend(v19, "canAddConnection:failureReason:", v20, &v23))
            objc_msgSend(v22, "addObject:", v20);
        }
        v16 = -[NSHashTable countByEnumeratingWithState:objects:count:](videoPreviewLayers, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v16);
    }
  }
  return v6;
}

- (id)_connectionsForNewOutput:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  AVCaptureConnection *v13;
  NSArray *obj;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = -[AVCaptureSession inputs](self, "inputs");
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(obj);
        v18 = v6;
        v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v6);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v8 = (void *)objc_msgSend(v7, "ports");
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v20;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v20 != v11)
                objc_enumerationMutation(v8);
              v27 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
              v13 = +[AVCaptureConnection connectionWithInputPorts:output:](AVCaptureConnection, "connectionWithInputPorts:output:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1), a3);
              if (-[AVCaptureSession _shouldAutomaticallyAddConnection:](self, "_shouldAutomaticallyAddConnection:", v13))
              {
                objc_msgSend(v5, "addObject:", v13);
              }
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
          }
          while (v10);
        }
        v6 = v18 + 1;
      }
      while (v18 + 1 != v17);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v17);
  }
  return v5;
}

- (NSArray)inputs
{
  AVCaptureSessionInternal *internal;
  NSArray *v4;

  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_internal->inputs);
  objc_sync_exit(internal);
  return v4;
}

- (BOOL)_shouldAutomaticallyAddConnection:(id)a3
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSArray *v16;
  uint64_t j;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  v5 = objc_msgSend((id)objc_msgSend(a3, "output"), "canAddConnection:failureReason:", a3, &v44);
  if (v5)
  {
    v6 = objc_msgSend(a3, "mediaType");
    if (v6 == *MEMORY[0x1E0CF2B78] && AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined()
      || (v7 = objc_msgSend(a3, "mediaType"), v7 == *MEMORY[0x1E0CF2B70])
      && (objc_msgSend(a3, "output"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
LABEL_6:
      LOBYTE(v5) = 0;
    }
    else
    {
      v8 = objc_msgSend(a3, "mediaType");
      if (v8 != *MEMORY[0x1E0CF2B90])
        goto LABEL_37;
      v9 = v8;
      objc_msgSend(a3, "output");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_37;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (v42 = 0u,
            v43 = 0u,
            v40 = 0u,
            v41 = 0u,
            v10 = (void *)objc_msgSend(a3, "inputPorts"),
            (v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v47, 16)) != 0))
      {
        v12 = v11;
        v13 = *(_QWORD *)v41;
        v26 = *(_QWORD *)v41;
        v27 = v10;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v41 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            if (objc_msgSend((id)objc_msgSend(v15, "mediaType", v26, v27), "isEqual:", v9))
            {
              v38 = 0u;
              v39 = 0u;
              v36 = 0u;
              v37 = 0u;
              v16 = -[AVCaptureSession connections](self, "connections");
              v30 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
              if (v30)
              {
                v31 = *(_QWORD *)v37;
                v28 = v12;
                v29 = v16;
                while (2)
                {
                  for (j = 0; j != v30; ++j)
                  {
                    if (*(_QWORD *)v37 != v31)
                      objc_enumerationMutation(v16);
                    v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
                    if (objc_msgSend(v18, "mediaType") == v9)
                    {
                      objc_msgSend(v18, "output");
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v34 = 0u;
                        v35 = 0u;
                        v32 = 0u;
                        v33 = 0u;
                        v19 = (void *)objc_msgSend(v18, "inputPorts");
                        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
                        if (v20)
                        {
                          v21 = v20;
                          v22 = *(_QWORD *)v33;
LABEL_25:
                          v23 = 0;
                          while (1)
                          {
                            if (*(_QWORD *)v33 != v22)
                              objc_enumerationMutation(v19);
                            v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v23);
                            if (objc_msgSend((id)objc_msgSend(v24, "mediaType"), "isEqual:", v9))
                            {
                              if ((objc_msgSend(v24, "isEqual:", v15) & 1) != 0)
                                goto LABEL_6;
                            }
                            if (v21 == ++v23)
                            {
                              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
                              v16 = v29;
                              if (v21)
                                goto LABEL_25;
                              break;
                            }
                          }
                        }
                      }
                    }
                  }
                  v13 = v26;
                  v10 = v27;
                  v12 = v28;
                  v30 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
                  if (v30)
                    continue;
                  break;
                }
              }
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
          LOBYTE(v5) = 1;
        }
        while (v12);
      }
      else
      {
LABEL_37:
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (void)beginConfiguration
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED6A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVCaptureSession _beginConfiguration](self, "_beginConfiguration", v4, v5);
}

- (void)_rebuildGraph
{
  -[AVCaptureSession _updateHardwareCost](self, "_updateHardwareCost");
  -[AVCaptureSession _beginConfiguration](self, "_beginConfiguration");
  -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
}

- (void)_beginConfiguration
{
  int *p_beginConfigRefCount;
  unsigned int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1A1AF1220](self->_internal->figCaptureSourceConfigChangeCacheMutex, a2);
  p_beginConfigRefCount = &self->_internal->beginConfigRefCount;
  do
    v4 = __ldxr((unsigned int *)p_beginConfigRefCount);
  while (__stxr(v4 + 1, (unsigned int *)p_beginConfigRefCount));
  if (!v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = -[AVCaptureSession sessionVideoCaptureDevices](self, "sessionVideoCaptureDevices");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "lockForConfiguration:", 0))
          {
            objc_msgSend(v10, "setCachesFigCaptureSourceConfigurationChanges:", 1);
            objc_msgSend(v10, "unlockForConfiguration");
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    self->_internal->threadWhichBeganConfiguration = (NSThread *)(id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  }
  MEMORY[0x1A1AF122C](self->_internal->figCaptureSourceConfigChangeCacheMutex);
  if (dword_1ECFED6A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)handleVideoInputDevice:(id)a3 activeFormatChanged:(id)a4
{
  void *v7;
  void *v8;
  _BOOL4 v9;
  int v10;
  int v11;
  AVCaptureSessionInternal *internal;

  v7 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
  v8 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v9 = -[AVCaptureSession videoHDREnabledForDevice:format:sessionPreset:](self, "videoHDREnabledForDevice:format:sessionPreset:", a3, v8, CFSTR("AVCaptureSessionPresetInputPriority"));
  if (objc_msgSend(v7, "isEqual:", v8))
    v10 = v9 ^ objc_msgSend(a3, "isVideoHDREnabled");
  else
    v10 = 1;
  if ((objc_msgSend((id)objc_opt_class(), "_isConfiguringProperty:forDevice:", CFSTR("activeFormat"), a3) & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v11 = v10;
    if (!-[NSString isEqualToString:](self->_internal->sessionPreset, "isEqualToString:", CFSTR("AVCaptureSessionPresetInputPriority")))
    {
      -[AVCaptureSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("sessionPreset"));
      internal = self->_internal;
      objc_sync_enter(internal);

      self->_internal->sessionPreset = (NSString *)objc_msgSend(CFSTR("AVCaptureSessionPresetInputPriority"), "copy");
      objc_sync_exit(internal);
      -[AVCaptureSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("sessionPreset"));
      v11 = v10;
    }
  }
  if (v10)
    -[AVCaptureSession _informSessionMembersOfChangedActiveFormat:forDevice:mediaType:](self, "_informSessionMembersOfChangedActiveFormat:forDevice:mediaType:", v8, a3, objc_msgSend(v8, "mediaType"));
  if (v11)
    -[AVCaptureSession _rebuildGraph](self, "_rebuildGraph");
}

- (void)_updateVideoHDREnabledForDevice:(id)a3 forceResetVideoHDRSuspended:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v6;

  v4 = a4;
  v6 = -[AVCaptureSession videoHDREnabledForDevice:format:sessionPreset:](self, "videoHDREnabledForDevice:format:sessionPreset:", a3, objc_msgSend(a3, "activeFormat"), self->_internal->sessionPreset);
  objc_msgSend((id)objc_opt_class(), "_startConfiguringProperty:forDevice:", CFSTR("videoHDREnabled"), a3);
  objc_msgSend(a3, "_setVideoHDREnabled:forceResetVideoHDRSuspended:", v6, v4);
  objc_msgSend((id)objc_opt_class(), "_finishConfiguringProperty:forDevice:", CFSTR("videoHDREnabled"), a3);
}

+ (void)_startConfiguringProperty:(id)a3 forDevice:(id)a4
{
  void *v6;
  void *v7;
  int v8;

  v6 = (void *)sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice;
  objc_sync_enter((id)sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice);
  v7 = (void *)objc_msgSend((id)sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice, "objectForKey:", a4);
  if (!v7)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend((id)sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice, "setObject:forKey:", v7, a4);
  }
  v8 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", a3), "unsignedIntValue");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (v8 + 1)), a3);
  objc_sync_exit(v6);
}

+ (void)_finishConfiguringProperty:(id)a3 forDevice:(id)a4
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;

  v6 = (void *)sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice;
  objc_sync_enter((id)sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice);
  v7 = (void *)objc_msgSend((id)sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice, "objectForKey:", a4);
  v8 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", a3), "unsignedIntValue");
  if (v8)
  {
    if (v8 == 1)
      v9 = 0;
    else
      v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (v8 - 1));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, a3);
  }
  if (!objc_msgSend(v7, "count"))
    objc_msgSend((id)sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice, "removeObjectForKey:", a4);
  objc_sync_exit(v6);
}

- (BOOL)videoHDREnabledForDevice:(id)a3 format:(id)a4 sessionPreset:(id)a5
{
  if (objc_msgSend(a3, "automaticallyAdjustsVideoHDREnabled"))
  {
    if (!AVCaptureColorSpaceIsHDR(objc_msgSend(a3, "activeColorSpace")))
      return objc_msgSend(a4, "prefersVideoHDREnabledForSessionPreset:", a5);
  }
  else if (objc_msgSend(a4, "isVideoHDRSupported"))
  {
    return objc_msgSend(a3, "isVideoHDREnabled");
  }
  return 0;
}

- (void)addOutput:(AVCaptureOutput *)output
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVCaptureSessionInternal *internal;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  os_log_type_t type;
  int v21;
  _BYTE v22[128];
  _QWORD v23[19];

  v23[16] = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED6A0)
  {
    v21 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVCaptureSession _beginConfiguration](self, "_beginConfiguration", v14, v15);
  internal = self->_internal;
  objc_sync_enter(internal);
  v23[0] = 0;
  if (-[AVCaptureSession _addOutputWithNoConnections:exceptionReason:](self, "_addOutputWithNoConnections:exceptionReason:", output, v23))
  {
    v7 = -[AVCaptureSession _connectionsForNewOutput:](self, "_connectionsForNewOutput:", output);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v17;
      v10 = *MEMORY[0x1E0CF2B68];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (-[AVCaptureSession canAddConnection:](self, "canAddConnection:", v12))
          {
            -[AVCaptureSession _addConnection:exceptionReason:](self, "_addConnection:exceptionReason:", v12, v23);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && objc_msgSend(v12, "mediaType") == v10
              && objc_msgSend((id)objc_msgSend(v12, "sourceDeviceInput"), "multichannelAudioMode") == 2)
            {
              objc_msgSend(v12, "_setActive:", 0);
            }
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v8);
    }
    objc_sync_exit(internal);
    -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
  }
  else
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v13);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v13);
    objc_sync_exit(internal);
  }
}

- (BOOL)_addConnection:(id)a3 exceptionReason:(id *)a4
{
  id v5;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  char v17;
  BOOL v19;
  AVCaptureSessionInternal *obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v5 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  LODWORD(v7) = -[AVCaptureSession _canAddConnection:failureReason:](self, "_canAddConnection:failureReason:", a3, &v25);
  if (v7)
  {
    v8 = (void *)objc_msgSend(v5, "output");
    v9 = (void *)objc_msgSend(v5, "videoPreviewLayer");
    v10 = v9;
    if (v8)
    {
      objc_msgSend(v8, "willChangeValueForKey:", CFSTR("connections"));
    }
    else if (v9)
    {
      objc_msgSend(v9, "willChangeValueForKey:", CFSTR("connection"));
    }
    obj = self->_internal;
    objc_sync_enter(obj);
    objc_msgSend(v5, "setupObservers");
    v11 = v8;
    if (v8 || (v11 = v10) != 0)
      v5 = (id)objc_msgSend(v11, "addConnection:error:", v5, 0);
    -[NSMutableArray addObject:](self->_internal->connections, "addObject:", v5);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("changeSeed"), 3, AVCaptureSessionConnectionChangedContext);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("active"), 3, AVCaptureSessionConnectionActiveChangedContext);
    v19 = v7;
    v7 = (_BOOL8)v10;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = (void *)objc_msgSend(v5, "inputPorts");
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "addObserver:forKeyPath:options:context:", self, CFSTR("enabled"), 3, AVCaptureSessionConnectedInputPortEnabledChangedContext);
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v13);
    }
    -[AVCaptureSession _updateHardwareCost](self, "_updateHardwareCost");
    v16 = (void *)v7;
    LOBYTE(v7) = v19;
    objc_sync_exit(obj);
    if (v8)
    {
      objc_msgSend(v8, "didChangeValueForKey:", CFSTR("connections"));
    }
    else if (v16)
    {
      objc_msgSend(v16, "didChangeValueForKey:", CFSTR("connection"));
    }
  }
  if (a4)
    v17 = v7;
  else
    v17 = 1;
  if ((v17 & 1) == 0)
    *a4 = v25;
  return v7;
}

- (BOOL)_canAddConnection:(id)a3 failureReason:(id *)a4
{
  AVCaptureSessionInternal *internal;
  void *v8;
  objc_class *v9;
  uint64_t v10;
  id *v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  BOOL v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v28;
  objc_class *v29;
  AVCaptureSessionInternal *obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v35 = 0;
  internal = self->_internal;
  objc_sync_enter(internal);
  obj = internal;
  if (-[NSMutableArray containsObject:](self->_internal->connections, "containsObject:", a3))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (objc_class *)objc_opt_class();
    v10 = objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p> already exists in this session"), NSStringFromClass(v9), a3);
    goto LABEL_27;
  }
  if (objc_msgSend(a3, "output"))
  {
    if ((-[NSMutableArray containsObject:](self->_internal->outputs, "containsObject:", objc_msgSend(a3, "output")) & 1) == 0)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = (objc_class *)objc_opt_class();
      v10 = objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p> references an output unknown to this session"), NSStringFromClass(v20), a3);
      goto LABEL_27;
    }
    if ((objc_msgSend((id)objc_msgSend(a3, "output"), "canAddConnection:failureReason:", a3, &v35) & 1) == 0)
      goto LABEL_34;
  }
  else if (objc_msgSend(a3, "videoPreviewLayer"))
  {
    if (!-[NSHashTable containsObject:](self->_internal->videoPreviewLayers, "containsObject:", objc_msgSend(a3, "videoPreviewLayer")))
    {
      v25 = (void *)MEMORY[0x1E0CB3940];
      v26 = (objc_class *)objc_opt_class();
      v10 = objc_msgSend(v25, "stringWithFormat:", CFSTR("<%@: %p> references a video preview layer unknown to this session"), NSStringFromClass(v26), a3);
LABEL_27:
      v11 = a4;
LABEL_28:
      v18 = 0;
      v35 = (void *)v10;
      goto LABEL_29;
    }
    if (!objc_msgSend((id)objc_msgSend(a3, "videoPreviewLayer"), "canAddConnection:failureReason:", a3, &v35))
    {
LABEL_34:
      v11 = a4;
      v18 = 0;
      goto LABEL_29;
    }
  }
  if (!objc_msgSend(a3, "inputPorts"))
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    v22 = (objc_class *)objc_opt_class();
    v10 = objc_msgSend(v21, "stringWithFormat:", CFSTR("<%@: %p> references an invalid port"), NSStringFromClass(v22), a3);
    goto LABEL_27;
  }
  v11 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = (void *)objc_msgSend(a3, "inputPorts");
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if ((-[NSMutableArray containsObject:](self->_internal->inputs, "containsObject:", objc_msgSend(v17, "input")) & 1) == 0)
        {
          v23 = (void *)MEMORY[0x1E0CB3940];
          v24 = (objc_class *)objc_opt_class();
          v10 = objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@: %p> references an input unknown to this session"), NSStringFromClass(v24), a3);
          goto LABEL_28;
        }
        if ((isKindOfClass & 1) == 0 && objc_msgSend(v17, "sourcesFromConstituentDevice"))
        {
          v28 = (void *)MEMORY[0x1E0CB3940];
          v29 = (objc_class *)objc_opt_class();
          v10 = objc_msgSend(v28, "stringWithFormat:", CFSTR("<%@: %p> references an input port from a constituent device -- Use AVCaptureMultiCamSession instead"), NSStringFromClass(v29), a3);
          goto LABEL_28;
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      v18 = 1;
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v18 = 1;
  }
LABEL_29:
  objc_sync_exit(obj);
  if (v11 && v35)
    *v11 = v35;
  return v18;
}

- (BOOL)canAddConnection:(AVCaptureConnection *)connection
{
  return -[AVCaptureSession _canAddConnection:failureReason:](self, "_canAddConnection:failureReason:", connection, 0);
}

- (BOOL)_addOutputWithNoConnections:(id)a3 exceptionReason:(id *)a4
{
  BOOL v7;
  AVCaptureSessionInternal *internal;
  void *v10;

  v10 = 0;
  v7 = -[AVCaptureSession _canAddOutput:failureReason:](self, "_canAddOutput:failureReason:", a3, &v10);
  if (v7)
  {
    -[AVCaptureSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("outputs"));
    internal = self->_internal;
    objc_sync_enter(internal);
    objc_msgSend(a3, "setSession:", self);
    objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("changeSeed"), 3, AVCaptureSessionOutputChangedContext);
    -[NSMutableArray addObject:](self->_internal->outputs, "addObject:", a3);
    objc_sync_exit(internal);
    -[AVCaptureSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("outputs"));
  }
  else if (a4)
  {
    *a4 = v10;
  }
  return v7;
}

- (void)handleVideoInputDevice:(id)a3 activeDepthDataFormatChanged:(id)a4
{
  void *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v7 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
  v8 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v9 = objc_msgSend(v7, "isEqual:", v8);
  if ((objc_msgSend((id)objc_opt_class(), "_isConfiguringProperty:forDevice:", CFSTR("activeFormat"), a3) & 1) == 0
    && (v9 & 1) == 0)
  {
    -[AVCaptureSession _rebuildGraph](self, "_rebuildGraph");
  }
  if ((v9 & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = 0;
    else
      v10 = v8;
    -[AVCaptureSession _informSessionMembersOfChangedActiveFormat:forDevice:mediaType:](self, "_informSessionMembersOfChangedActiveFormat:forDevice:mediaType:", v10, a3, *MEMORY[0x1E0CF2B70]);
  }
}

- (void)_informSessionMembersOfChangedActiveFormat:(id)a3 forDevice:(id)a4 mediaType:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  uint64_t v27;
  uint64_t v28;
  uint64_t n;
  void *context;
  AVCaptureSessionInternal *internal;
  NSMutableArray *obj;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1A1AF16C4](self, a2);
  v39 = (id)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v38 = (id)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v40 = (id)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v37 = (id)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  internal = self->_internal;
  objc_sync_enter(internal);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = self->_internal->connections;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
  if (v7)
  {
    v34 = *(_QWORD *)v63;
    v8 = *MEMORY[0x1E0CF2B70];
    do
    {
      v9 = 0;
      v35 = v7;
      do
      {
        if (*(_QWORD *)v63 != v34)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v9);
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v11 = (void *)objc_msgSend(v10, "inputPorts");
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
        v36 = v9;
        if (v12)
        {
          v13 = *(_QWORD *)v59;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v59 != v13)
                objc_enumerationMutation(v11);
              v15 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
              objc_msgSend(v10, "output");
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a5, "isEqualToString:", v8))
                objc_msgSend(v40, "addObject:", objc_msgSend(v10, "output"));
              if ((id)objc_msgSend((id)objc_msgSend(v15, "input"), "videoDevice") == a4
                && objc_msgSend((id)objc_msgSend(v10, "mediaType"), "isEqual:", a5))
              {
                objc_msgSend(v39, "addObject:", objc_msgSend(v15, "input"));
                objc_msgSend(v38, "addObject:", v10);
                if (objc_msgSend(v10, "output"))
                {
                  v16 = objc_msgSend(v10, "output");
                  v17 = v40;
                }
                else
                {
                  if (!objc_msgSend(v10, "videoPreviewLayer"))
                    continue;
                  v16 = objc_msgSend(v10, "videoPreviewLayer");
                  v17 = v37;
                }
                objc_msgSend(v17, "addObject:", v16);
              }
            }
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
          }
          while (v12);
        }
        v9 = v36 + 1;
      }
      while (v36 + 1 != v35);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
    }
    while (v7);
  }
  objc_sync_exit(internal);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v18 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v55 != v19)
          objc_enumerationMutation(v39);
        objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * j), "handleChangedActiveFormat:forDevice:", a3, a4);
      }
      v18 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
    }
    while (v18);
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v21 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v51;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v51 != v22)
          objc_enumerationMutation(v38);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * k), "handleChangedActiveFormat:forDevice:", a3, a4);
      }
      v21 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
    }
    while (v21);
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v24 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v46, v67, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v47;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v47 != v25)
          objc_enumerationMutation(v40);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * m), "handleChangedActiveFormat:forDevice:", a3, a4);
      }
      v24 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v46, v67, 16);
    }
    while (v24);
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v27 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v42, v66, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v43;
    do
    {
      for (n = 0; n != v27; ++n)
      {
        if (*(_QWORD *)v43 != v28)
          objc_enumerationMutation(v37);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * n), "handleChangedActiveFormat:forDevice:", a3, a4);
      }
      v27 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v42, v66, 16);
    }
    while (v27);
  }
  objc_autoreleasePoolPop(context);
}

- (void)commitConfiguration
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED6A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration", v4, v5);
}

- (NSArray)outputs
{
  AVCaptureSessionInternal *internal;
  NSArray *v4;

  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_internal->outputs);
  objc_sync_exit(internal);
  return v4;
}

- (BOOL)_canAddInput:(id)a3 failureReason:(id *)a4
{
  AVCaptureSessionInternal *internal;
  NSMutableArray *inputs;
  NSString *v9;
  BOOL result;
  __CFString *v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v13;
  objc_class *v14;
  _QWORD v15[27];

  v15[26] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((AVCaptureSession *)objc_msgSend(a3, "session") == self)
    {
      v11 = CFSTR("An AVCaptureInput instance may not be added more than once to a session");
    }
    else if (objc_msgSend(a3, "session"))
    {
      v11 = CFSTR("An AVCaptureInput instance may not be added to more than one session");
    }
    else
    {
      if ((objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()) & 1) == 0
        && (objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        v14 = (objc_class *)objc_opt_class();
        v11 = (__CFString *)objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@> is an unsupported AVCaptureInput type"), NSStringFromClass(v14));
        goto LABEL_22;
      }
      internal = self->_internal;
      objc_sync_enter(internal);
      if ((-[NSMutableArray containsObject:](self->_internal->inputs, "containsObject:", a3) & 1) != 0)
      {
        v11 = CFSTR("An AVCaptureInput instance may not be added more than once to a session");
LABEL_21:
        objc_sync_exit(internal);
LABEL_22:
        if (!v11)
          return 0;
        goto LABEL_13;
      }
      if (!objc_msgSend(a3, "isMemberOfClass:", objc_opt_class())
        || (inputs = self->_internal->inputs,
            v15[0] = MEMORY[0x1E0C809B0],
            v15[1] = 3221225472,
            v15[2] = __47__AVCaptureSession__canAddInput_failureReason___block_invoke,
            v15[3] = &unk_1E421D448,
            v15[4] = a3,
            -[NSMutableArray indexOfObjectPassingTest:](inputs, "indexOfObjectPassingTest:", v15) == 0x7FFFFFFFFFFFFFFFLL))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (v9 = -[AVCaptureSession sessionPreset](self, "sessionPreset"),
              (objc_msgSend((id)objc_msgSend(a3, "device"), "supportsAVCaptureSessionPreset:", v9) & 1) != 0))
        {
          objc_sync_exit(internal);
          return 1;
        }
        v11 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't add %@ because the device does not support %@ - Use -[AVCaptureDevice supportsAVCaptureSessionPreset:]"), a3, v9);
        goto LABEL_21;
      }
      objc_sync_exit(internal);
      v11 = CFSTR("Multiple audio/video AVCaptureInputs are not currently supported");
    }
  }
  else
  {
    v11 = CFSTR("Can't add a nil AVCaptureInput");
  }
LABEL_13:
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  if (a4)
  {
    result = 0;
    *a4 = v11;
    return result;
  }
  return 0;
}

- (id)_figCaptureSessionConfiguration
{
  id v3;
  void *v4;
  AVCaptureSmartStyle *smartStyleSetByClient;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  double v13;
  double v14;
  double v15;
  NSMutableArray *connections;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D03C08]);
  ++_figCaptureSessionConfiguration_uniqueConfigurationID;
  objc_msgSend(v3, "setConfigurationID:");
  objc_msgSend(v3, "setClientExpectsCameraMountedInLandscapeOrientation:", AVCaptureClientExpectsCameraMountedInLandscapeOrientation());
  objc_msgSend(v3, "setSessionPreset:", -[AVCaptureSession sessionPreset](self, "sessionPreset"));
  objc_msgSend(v3, "setUsesAppAudioSession:", self->_internal->usesApplicationAudioSession);
  objc_msgSend(v3, "setConfiguresAppAudioSession:", self->_internal->automaticallyConfiguresApplicationAudioSession);
  if (objc_msgSend(v3, "usesAppAudioSession"))
    objc_msgSend(v3, "setConfiguresAppAudioSessionToMixWithOthers:", self->_internal->configuresApplicationAudioSessionToMixWithOthers);
  objc_msgSend(v3, "setAllowedToRunInMultitaskingMode:", self->_internal->authorizedToUseCameraInMultipleForegroundAppLayout);
  objc_msgSend(v3, "setTccIdentity:", self->_internal->tccIdentity);
  objc_opt_class();
  objc_msgSend(v3, "setMultiCamSession:", objc_opt_isKindOfClass() & 1);
  objc_msgSend(v3, "setXctestAuthorizedToStealDevice:", self->_internal->xctestAuthorizedToStealDevice);
  objc_msgSend(v3, "setContinuityCameraIsWired:", self->_internal->continuityCameraIsWired);
  objc_msgSend(v3, "setContinuityCameraClientDeviceClass:", self->_internal->continuityCameraClientDeviceClass);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setClientIsVOIP:", objc_msgSend((id)objc_msgSend(v4, "UIBackgroundModes"), "containsObject:", CFSTR("voip")));
  objc_msgSend(v3, "setSuppressVideoEffects:", self->_internal->suppressVideoEffects);
  objc_msgSend(v3, "setCheckIfFileAlreadyExistForMFO:", self->_internal->checkIfFileAlreadyExistForMFO);
  objc_msgSend(v3, "setSmartStyleRenderingEnabled:", self->_internal->smartStyleRenderingEnabled);
  if (objc_msgSend(v3, "smartStyleRenderingEnabled"))
  {
    objc_msgSend(v3, "setSmartStyleControlMode:", -[AVCaptureSession smartStyleControlMode](self, "smartStyleControlMode"));
    objc_msgSend(v3, "setSmartStyle:", 0);
    smartStyleSetByClient = self->_internal->smartStyleSetByClient;
    if (smartStyleSetByClient)
    {
      v6 = (void *)MEMORY[0x1E0D03C10];
      v7 = -[AVCaptureSmartStyle cast](smartStyleSetByClient, "cast");
      -[AVCaptureSmartStyle intensity](smartStyleSetByClient, "intensity");
      v9 = v8;
      -[AVCaptureSmartStyle toneBias](smartStyleSetByClient, "toneBias");
      v11 = v10;
      -[AVCaptureSmartStyle colorBias](smartStyleSetByClient, "colorBias");
      LODWORD(v13) = v12;
      LODWORD(v14) = v9;
      LODWORD(v15) = v11;
      objc_msgSend(v3, "setSmartStyle:", objc_msgSend(v6, "styleWithCast:intensity:toneBias:colorBias:", v7, v14, v15, v13));
    }
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  connections = self->_internal->connections;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(connections);
        v21 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "figCaptureConnectionConfigurationForSessionPreset:allConnections:", self->_internal->sessionPreset, self->_internal->connections);
        if (v21)
        {
          v22 = (void *)v21;
          objc_msgSend(v3, "addConnectionConfiguration:", v21);
          objc_msgSend((id)objc_msgSend(v22, "sourceConfiguration"), "setClientExpectsCameraMountedInLandscapeOrientation:", objc_msgSend(v3, "clientExpectsCameraMountedInLandscapeOrientation"));
        }
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v18);
  }
  -[AVCaptureSession _addFakeOutputsIfNeededForCenterStageToSessionConfiguration:](self, "_addFakeOutputsIfNeededForCenterStageToSessionConfiguration:", v3);
  return v3;
}

- (AVCaptureSessionPreset)sessionPreset
{
  AVCaptureSessionInternal *internal;
  NSString *v4;

  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = self->_internal->sessionPreset;
  objc_sync_exit(internal);
  return v4;
}

- (void)_addFakeOutputsIfNeededForCenterStageToSessionConfiguration:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unsigned int v21;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 2);
  v29 = a3;
  v30 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v5 = (void *)objc_msgSend(a3, "connectionConfigurations");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v46 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        v11 = (void *)objc_msgSend(v10, "sourceConfiguration");
        if ((objc_msgSend(v11, "cinematicFramingEnabled") & 1) != 0
          || objc_msgSend(v11, "manualCinematicFramingEnabled"))
        {
          v12 = (void *)objc_msgSend(v4, "objectForKey:", objc_msgSend(v11, "source"));
          if (!v12)
          {
            v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            objc_msgSend(v4, "setObject:forKey:", v12, objc_msgSend(v11, "source"));
          }
          objc_msgSend(v12, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v7);
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v32 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v42 != v31)
          objc_enumerationMutation(v4);
        v14 = (void *)objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j));
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
        if (v15)
        {
          v16 = v15;
          v17 = 0;
          v18 = *(_QWORD *)v38;
LABEL_20:
          v19 = 0;
          while (1)
          {
            if (*(_QWORD *)v38 != v18)
              objc_enumerationMutation(v14);
            v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v19);
            if (!v17)
            {
              if (objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v19), "mediaType") == 1986618469)
                v17 = v20;
              else
                v17 = 0;
            }
            v21 = objc_msgSend((id)objc_msgSend(v20, "sinkConfiguration"), "sinkType");
            if (v21 <= 6 && ((1 << v21) & 0x52) != 0)
              break;
            if (v16 == ++v19)
            {
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
              if (v16)
                goto LABEL_20;
              if (v17)
              {
                v23 = (id)objc_msgSend(v17, "copy");
                objc_msgSend(v23, "setConnectionID:", CFSTR("Fake AVCaptureMovieFileOutput video connection for cinematic framing"));
                objc_msgSend(v23, "setEnabled:", 1);
                v24 = objc_alloc_init(MEMORY[0x1E0D03BE8]);
                objc_msgSend(v24, "setSinkID:", CFSTR("Fake AVCaptureMovieFileOutput sink for cinematic framing"));
                objc_msgSend(v23, "setSinkConfiguration:", v24);
                objc_msgSend(v30, "addObject:", v23);
              }
              break;
            }
          }
        }
      }
      v32 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v32);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v25 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v34 != v27)
          objc_enumerationMutation(v30);
        objc_msgSend(v29, "addConnectionConfiguration:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k));
      }
      v26 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
    }
    while (v26);
  }
}

- (void)_commitConfiguration
{
  void *v3;
  AVCaptureSessionInternal *internal;
  unsigned int *p_beginConfigRefCount;
  int beginConfigRefCount;
  unsigned int v7;
  int v8;
  int *p_graphRebuildFromCommitConfigRefCount;
  unsigned int v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int *v12;
  unsigned int v13;
  AVCaptureSessionInternal *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  os_log_type_t type;
  int v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AF16C4](self, a2);
  MEMORY[0x1A1AF1220](self->_internal->figCaptureSourceConfigChangeCacheMutex);
  internal = self->_internal;
  p_beginConfigRefCount = (unsigned int *)&internal->beginConfigRefCount;
  beginConfigRefCount = internal->beginConfigRefCount;
  if (beginConfigRefCount < 1)
  {
    v8 = internal->beginConfigRefCount;
  }
  else
  {
    do
    {
      v7 = __ldxr(p_beginConfigRefCount);
      v8 = v7 - 1;
    }
    while (__stxr(v7 - 1, p_beginConfigRefCount));
    p_graphRebuildFromCommitConfigRefCount = &self->_internal->graphRebuildFromCommitConfigRefCount;
    do
      v10 = __ldxr((unsigned int *)p_graphRebuildFromCommitConfigRefCount);
    while (__stxr(v10 + 1, (unsigned int *)p_graphRebuildFromCommitConfigRefCount));
    internal = self->_internal;
  }
  MEMORY[0x1A1AF122C](internal->figCaptureSourceConfigChangeCacheMutex);
  if (dword_1ECFED6A0)
  {
    v28 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (beginConfigRefCount >= 1)
  {
    -[AVCaptureSession _buildAndRunGraph:](self, "_buildAndRunGraph:", v8 > 0, v21, v22);
    -[AVCaptureSession _determineSynchronizationClock](self, "_determineSynchronizationClock");
    MEMORY[0x1A1AF1220](self->_internal->figCaptureSourceConfigChangeCacheMutex);
    v12 = &self->_internal->graphRebuildFromCommitConfigRefCount;
    do
      v13 = __ldxr((unsigned int *)v12);
    while (__stxr(v13 - 1, (unsigned int *)v12));
    v14 = self->_internal;
    if (!v14->beginConfigRefCount && !v14->graphRebuildFromCommitConfigRefCount)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v15 = -[AVCaptureSession sessionVideoCaptureDevices](self, "sessionVideoCaptureDevices");
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v24 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            if (objc_msgSend(v20, "lockForConfiguration:", 0))
            {
              objc_msgSend(v20, "setCachesFigCaptureSourceConfigurationChanges:", 0);
              objc_msgSend(v20, "unlockForConfiguration");
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
        }
        while (v17);
      }
    }
    MEMORY[0x1A1AF122C](self->_internal->figCaptureSourceConfigChangeCacheMutex);
  }
  objc_autoreleasePoolPop(v3);
}

- (BOOL)_buildAndRunGraph:(BOOL)a3
{
  AVCaptureSession *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVCaptureSessionInternal *internal;
  int v8;
  int v9;
  id v10;
  int v11;
  AVCaptureSessionInternal *v12;
  _BOOL4 v13;
  char v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  AVCaptureSessionInternal *v19;
  OpaqueFigCaptureSession *figCaptureSession;
  void (*v21)(OpaqueFigCaptureSession *, void *);
  int v22;
  unint64_t *p_graphRebuildSignalCount;
  unint64_t v24;
  unint64_t v25;
  AVRunLoopCondition *runLoopCondition;
  uint64_t v27;
  int v28;
  BOOL waitingForFigCaptureSessionToStart;
  char v30;
  NSObject *v31;
  __CFString *v32;
  uint64_t v33;
  NSMutableArray *inputs;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  uint64_t stopError;
  BOOL v40;
  AVCaptureSessionInternal *v41;
  AVCaptureSessionConfiguration *v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  os_log_type_t type;
  int v53;
  id v54;
  _BYTE v55[128];
  uint64_t v56;
  _QWORD v57[19];

  v57[16] = *MEMORY[0x1E0C80C00];
  v5 = self;
  v54 = 0;
  if (dword_1ECFED6A0)
  {
    v53 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  -[AVCaptureSession _updateDeviceActiveFormatsAndActiveConnections](self, "_updateDeviceActiveFormatsAndActiveConnections");
  -[AVCaptureSession _updateDepthDataDeliveryEnabledForAllConnectedSourceDevices](self, "_updateDepthDataDeliveryEnabledForAllConnectedSourceDevices");
  -[AVCaptureSession _updateCameraCalibrationDataDeliveryEnabledForAllConnectedSourceDevices](self, "_updateCameraCalibrationDataDeliveryEnabledForAllConnectedSourceDevices");
  -[AVCaptureSession _updateConstantColorEnabledForAllConnectedSourceDevices](self, "_updateConstantColorEnabledForAllConnectedSourceDevices");
  -[AVCaptureSession _updateSmartStyleRenderingStatusWithSkipRebuildGraph:](self, "_updateSmartStyleRenderingStatusWithSkipRebuildGraph:", 1);
  if (!a3
    && !-[AVCaptureSession isBeingConfigured](self, "isBeingConfigured")
    && !-[AVCaptureSession isOverCost:](self, "isOverCost:", &v54))
  {
    v10 = -[AVCaptureSession _figCaptureSessionConfiguration](self, "_figCaptureSessionConfiguration");
    v17 = objc_msgSend(v10, "configurationID");
    objc_msgSend(v10, "setConfigurationID:", -[FigCaptureSessionConfiguration configurationID](self->_internal->sessionConfig, "configurationID"));
    if (dword_1ECFED6A0)
    {
      v53 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (v10 && (objc_msgSend(v10, "isEqual:", self->_internal->sessionConfig) & 1) == 0)
    {
      objc_msgSend(v10, "setConfigurationID:", v17);
      v42 = -[AVCaptureSessionConfiguration initWithConfigurationID:inputs:outputs:videoPreviewLayers:connections:]([AVCaptureSessionConfiguration alloc], "initWithConfigurationID:inputs:outputs:videoPreviewLayers:connections:", objc_msgSend(v10, "configurationID"), self->_internal->inputs, self->_internal->outputs, self->_internal->videoPreviewLayers, self->_internal->connections);
      -[NSMutableArray addObject:](self->_internal->committedAVCaptureSessionConfigurations, "addObject:", v42);

      v9 = 1;
      if (self->_internal->running)
      {
LABEL_77:
        v8 = 1;
LABEL_80:
        objc_sync_exit(internal);
        -[AVCaptureSession _updateControlsOverlay](self, "_updateControlsOverlay");
        goto LABEL_7;
      }
    }
    else
    {
      v41 = self->_internal;
      if (v41->running)
      {
        v9 = 0;
        v8 = 0;
        if (!v41->sessionConfig)
          goto LABEL_80;
        goto LABEL_77;
      }
      v9 = 0;
    }
    v8 = 0;
    goto LABEL_80;
  }
  objc_sync_exit(internal);
  v8 = 0;
  v9 = 0;
  v10 = 0;
LABEL_7:
  if ((v8 & 1) == 0 && !v9)
  {
    if (v54)
    {
      v11 = 0;
      goto LABEL_47;
    }
    goto LABEL_50;
  }
  -[AVRunLoopCondition lock](self->_internal->runLoopCondition, "lock", v44, v46);
  v12 = self->_internal;
  if (v8)
  {
    v13 = !v12->figCaptureSessionRunning;
    if (!v9)
      goto LABEL_13;
  }
  else
  {
    v13 = 0;
    if (!v9)
    {
LABEL_13:
      if (!v13)
        goto LABEL_29;
      goto LABEL_28;
    }
  }
  v14 = v12->figCaptureSessionRunning || v13;
  v12->waitingForFigCaptureSessionConfigurationToBecomeLive = v14;
  v15 = (void *)objc_msgSend(v10, "copy");
  if (dword_1ECFED6A0)
  {
    v53 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v19 = self->_internal;
  objc_sync_enter(v19);
  figCaptureSession = self->_internal->figCaptureSession;
  if (figCaptureSession)
  {
    v21 = *(void (**)(OpaqueFigCaptureSession *, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
    if (v21)
    {
      v21(figCaptureSession, v15);
    }
    else
    {
      v56 = *MEMORY[0x1E0D04368];
      v57[0] = &unk_1E424D110;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterPostNotification();
    }
  }

  self->_internal->sessionConfig = (FigCaptureSessionConfiguration *)v10;
  objc_sync_exit(v19);

  v12 = self->_internal;
  if (v13)
  {
LABEL_28:
    v12->waitingForFigCaptureSessionToStart = 1;
    -[AVCaptureSession _startFigCaptureSession](self, "_startFigCaptureSession", v45, v47);
    v12 = self->_internal;
  }
LABEL_29:
  if (v12->waitingForFigCaptureSessionConfigurationToBecomeLive || (v22 = v12->waitingForFigCaptureSessionToStart) != 0)
  {
    p_graphRebuildSignalCount = (unint64_t *)&v12->graphRebuildSignalCount;
    do
    {
      v24 = __ldxr(p_graphRebuildSignalCount);
      v25 = v24 + 1;
    }
    while (__stxr(v24 + 1, p_graphRebuildSignalCount));
    -[AVRunLoopCondition signal](self->_internal->runLoopCondition, "signal");
    runLoopCondition = self->_internal->runLoopCondition;
    v27 = objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 9.0);
    v28 = -[AVRunLoopCondition waitUntilDate:inMode:](runLoopCondition, "waitUntilDate:inMode:", v27, *MEMORY[0x1E0CA3680]);
    v12 = self->_internal;
    if (v12->waitingForFigCaptureSessionConfigurationToBecomeLive)
    {
      waitingForFigCaptureSessionToStart = 1;
      if (v28)
      {
LABEL_35:
        if (v12->figCaptureSessionRunning || v12->interrupted)
        {
          v30 = 1;
        }
        else
        {
          v30 = 0;
          v12->figCaptureSessionStarted = 0;
          v12 = self->_internal;
        }
        v22 = 0;
        v11 = 0;
        if (v12->graphRebuildSignalCount == v25)
          waitingForFigCaptureSessionToStart = 0;
        if (waitingForFigCaptureSessionToStart)
          goto LABEL_46;
        goto LABEL_45;
      }
    }
    else
    {
      waitingForFigCaptureSessionToStart = v12->waitingForFigCaptureSessionToStart;
      if (v28)
        goto LABEL_35;
    }
    v22 = -11819;
  }
  v30 = 1;
LABEL_45:
  v12->waitingForFigCaptureSessionConfigurationToBecomeLive = 0;
  self->_internal->waitingForFigCaptureSessionToStart = 0;
  v12 = self->_internal;
  v11 = v22;
LABEL_46:
  -[AVRunLoopCondition unlock](v12->runLoopCondition, "unlock", v45, v47);
  if (v54)
  {
LABEL_47:

    self->_internal->stopError = (NSError *)v54;
    if (dword_1ECFED6A0)
    {
      v53 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    goto LABEL_64;
  }
  if ((v30 & 1) == 0)
  {
LABEL_64:
    -[AVCaptureSession _stopAndTearDownGraph](self, "_stopAndTearDownGraph", v44, v46);
    stopError = (uint64_t)self->_internal->stopError;
    if (v11 || stopError)
    {
      if (!stopError)
        stopError = AVLocalizedErrorWithUnderlyingOSStatus();
      -[AVCaptureSession _postRuntimeError:](self, "_postRuntimeError:", stopError);
    }
    v40 = 0;
    goto LABEL_84;
  }
LABEL_50:
  if (-[AVCaptureSession isRunning](self, "isRunning", v44, v46))
  {
    if (!+[AVCaptureDevice haveShownGesturesDefaultDisabledNotification](AVCaptureDevice, "haveShownGesturesDefaultDisabledNotification"))
    {
      v32 = AVCaptureClientPreferencesDomain();
      v33 = AVControlCenterVideoEffectsGesturesEnabledPreferenceKey(v32);
      if (!+[AVCaptureDevice reactionEffectGesturesEnabledDefault](AVCaptureDevice, "reactionEffectGesturesEnabledDefault")&& !+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", v33))
      {
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        inputs = self->_internal->inputs;
        v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
        if (v35)
        {
          v36 = *(_QWORD *)v49;
          while (2)
          {
            for (i = 0; i != v35; ++i)
            {
              if (*(_QWORD *)v49 != v36)
                objc_enumerationMutation(inputs);
              v38 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && (objc_msgSend((id)objc_msgSend(v38, "device"), "canPerformReactionEffects") & 1) != 0)
              {
                +[AVCaptureDevice requestGesturesDefaultDisabledNotification](AVCaptureDevice, "requestGesturesDefaultDisabledNotification");
                goto LABEL_82;
              }
            }
            v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
            if (v35)
              continue;
            break;
          }
        }
      }
    }
LABEL_82:
    -[AVCaptureSession _activateControlsOverlayIfNecessary](self, "_activateControlsOverlayIfNecessary");
  }
  v40 = 1;
LABEL_84:

  return v40;
}

- (BOOL)isBeingConfigured
{
  return self->_internal->beginConfigRefCount > 0;
}

- (BOOL)isRunning
{
  return self->_internal->running;
}

- (void)_updateConstantColorEnabledForAllConnectedSourceDevices
{
  -[AVCaptureSession _updateConstantColorEnabledForSourceDevice:](self, "_updateConstantColorEnabledForSourceDevice:", 0);
}

- (void)_updateCameraCalibrationDataDeliveryEnabledForAllConnectedSourceDevices
{
  -[AVCaptureSession _updateCameraCalibrationDataDeliveryEnabledForSourceDevice:](self, "_updateCameraCalibrationDataDeliveryEnabledForSourceDevice:", 0);
}

- (void)_updateDepthDataDeliveryEnabledForAllConnectedSourceDevices
{
  -[AVCaptureSession _updateDepthDataDeliveryEnabledForSourceDevice:](self, "_updateDepthDataDeliveryEnabledForSourceDevice:", 0);
}

- (id)sessionVideoCaptureDevices
{
  void *v3;
  AVCaptureSessionInternal *internal;
  NSMutableArray *inputs;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  internal = self->_internal;
  objc_sync_enter(internal);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  inputs = self->_internal->inputs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    v8 = *MEMORY[0x1E0CF2B90];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(inputs);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = (void *)objc_msgSend(v10, "device");
          if (objc_msgSend(v11, "hasMediaType:", v8))
            objc_msgSend(v3, "addObject:", v11);
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  objc_sync_exit(internal);
  return v3;
}

- (BOOL)isInterrupted
{
  return self->_internal->interrupted;
}

- (BOOL)_canAddOutput:(id)a3 failureReason:(id *)a4
{
  AVCaptureSessionInternal *internal;
  id v8;
  NSMutableArray *outputs;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  BOOL result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[6];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (objc_msgSend(a3, "session"))
    {
      v13 = CFSTR("An AVCaptureOutput instance may not be added to more than one session");
    }
    else
    {
      internal = self->_internal;
      objc_sync_enter(internal);
      if ((-[NSMutableArray containsObject:](self->_internal->outputs, "containsObject:", a3) & 1) != 0)
      {
        v13 = CFSTR("An AVCaptureOutput instance may not be added more than once to a session");
      }
      else
      {
        v8 = +[AVCaptureOutput allOutputSubclasses](AVCaptureOutput, "allOutputSubclasses");
        outputs = self->_internal->outputs;
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __48__AVCaptureSession__canAddOutput_failureReason___block_invoke;
        v21[3] = &unk_1E421D470;
        v21[4] = v8;
        v21[5] = a3;
        if (-[NSMutableArray indexOfObjectPassingTest:](outputs, "indexOfObjectPassingTest:", v21) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v13 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot add output %@ to capture session %@ because more than one output of the same type is unsupported"), objc_msgSend(a3, "description"), -[AVCaptureSession description](self, "description"));
          FigDebugAssert3();
          objc_sync_exit(internal);
          if (!v13)
            return 0;
          goto LABEL_18;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
          || !objc_opt_class()
          || (v19 = 0u,
              v20 = 0u,
              v17 = 0u,
              v18 = 0u,
              v10 = self->_internal->outputs,
              (v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16)) == 0))
        {
LABEL_16:
          objc_sync_exit(internal);
          return 1;
        }
        v12 = *(_QWORD *)v18;
        v13 = CFSTR("AVCapturePhotoOutput and AVCaptureStillImageOutput may not both be used in a session");
LABEL_10:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v10);
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          if (v11 == ++v14)
          {
            v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
            if (v11)
              goto LABEL_10;
            goto LABEL_16;
          }
        }
      }
      objc_sync_exit(internal);
    }
  }
  else
  {
    v13 = CFSTR("Can't add a nil AVCaptureOutput");
  }
LABEL_18:
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  if (a4)
  {
    result = 0;
    *a4 = v13;
    return result;
  }
  return 0;
}

- (BOOL)isOverCost:(id *)a3
{
  float v4;
  float v5;

  -[AVCaptureSession hardwareCost](self, "hardwareCost");
  v5 = v4;
  if (a3 && v4 > 1.0)
    *a3 = (id)AVLocalizedError();
  return v5 > 1.0;
}

- (float)hardwareCost
{
  -[AVCaptureSession _updateHardwareCost](self, "_updateHardwareCost");
  return self->_internal->hardwareCost;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  AVCaptureSessionInternal *internal;
  NSMutableArray *inputs;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  _QWORD *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  float v27;
  float v28;
  float v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if ((void *)AVCaptureSessionInputPortChangedContext == a6
    || AVCaptureSessionConnectionChangedContext == (_QWORD)a6
    || AVCaptureSessionOutputChangedContext == (_QWORD)a6)
  {
    goto LABEL_9;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceConnectedChangedContext == a6)
    goto LABEL_49;
  if ((void *)AVCaptureSessionVideoInputDeviceActiveFormatChangedContext == a6)
  {
    -[AVCaptureSession handleVideoInputDevice:activeFormatChanged:](self, "handleVideoInputDevice:activeFormatChanged:", a4, a5);
    return;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceActiveDepthDataFormatChangedContext == a6)
  {
    -[AVCaptureSession handleVideoInputDevice:activeDepthDataFormatChanged:](self, "handleVideoInputDevice:activeDepthDataFormatChanged:", a4, a5);
    return;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceHDREnabledChangedContext == a6)
  {
    if ((objc_msgSend((id)objc_opt_class(), "_isConfiguringProperty:forDevice:", CFSTR("videoHDREnabled"), a4) & 1) != 0)
      return;
LABEL_49:
    v17 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]), "BOOLValue");
    v18 = (_QWORD *)MEMORY[0x1E0CB2CB8];
    goto LABEL_50;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceAutomaticallyAdjustsHDREnabledChangedContext == a6)
  {
    if ((objc_msgSend((id)objc_opt_class(), "_isConfiguringProperty:forDevice:", CFSTR("videoHDREnabled"), a4) & 1) == 0)
    {
      v19 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "BOOLValue");
      if ((objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]), "BOOLValue") & 1) == 0)
      {
        if (v19)
          -[AVCaptureSession _updateVideoHDREnabledForDevice:forceResetVideoHDRSuspended:](self, "_updateVideoHDREnabledForDevice:forceResetVideoHDRSuspended:", a4, 1);
      }
    }
    return;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceActiveColorSpaceChangedContext == a6)
  {
    if ((objc_msgSend((id)objc_opt_class(), "_isConfiguringProperty:forDevice:", CFSTR("activeColorSpace"), a4) & 1) != 0)
      return;
    -[AVCaptureSession _updateVideoHDREnabledForDevice:forceResetVideoHDRSuspended:](self, "_updateVideoHDREnabledForDevice:forceResetVideoHDRSuspended:", a4, 0);
    if (!objc_msgSend((id)objc_msgSend(a4, "activeFormat"), "isWideColorSupported"))
      return;
    v20 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]), "integerValue");
    if (v20 == objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "integerValue"))
      return;
LABEL_9:
    -[AVCaptureSession _rebuildGraph](self, "_rebuildGraph", a3, a4, a5);
    return;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceLowLightVideoEnabledChangedContext == a6)
    goto LABEL_60;
  if ((void *)AVCaptureSessionVideoInputDeviceGeometricDistortionCorrectionEnabledChangedContext == a6)
  {
LABEL_61:
    v17 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "BOOLValue");
    v18 = (_QWORD *)MEMORY[0x1E0CB2CC8];
LABEL_50:
    if (v17 == objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *v18), "BOOLValue"))
      return;
    goto LABEL_9;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceVariableFrameRateVideoEnabledChangedContext == a6)
    goto LABEL_60;
  if ((void *)AVCaptureSessionVideoInputDeviceVideoStabilizationStrengthChangedContext == a6)
  {
    if ((objc_msgSend((id)objc_opt_class(), "_isConfiguringProperty:forDevice:", CFSTR("activeFormat"), a4) & 1) != 0)
      return;
    v21 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "integerValue");
    if (objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]), "integerValue") == v21)
      return;
    goto LABEL_9;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceCenterStageActiveChangedContext == a6)
  {
    if ((objc_msgSend((id)objc_opt_class(), "_isConfiguringProperty:forDevice:", CFSTR("activeFormat"), a4) & 1) != 0)
      return;
    v22 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "BOOLValue");
    if (v22 == objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]), "BOOLValue"))return;
    -[AVCaptureSession _handleCenterStageActiveChangedForDevice:](self, "_handleCenterStageActiveChangedForDevice:", a4);
    goto LABEL_9;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceBackgroundBlurActiveChangedContext == a6)
  {
    if ((objc_msgSend((id)objc_opt_class(), "_isConfiguringProperty:forDevice:", CFSTR("activeFormat"), a4) & 1) != 0)
      return;
    v23 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "BOOLValue");
    if (v23 == objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]), "BOOLValue"))return;
    -[AVCaptureSession _handleBackgroundBlurActiveChangedForDevice:](self, "_handleBackgroundBlurActiveChangedForDevice:", a4);
    goto LABEL_9;
  }
  if ((void *)AVCaptureSessionConnectionActiveChangedContext == a6
    || (void *)AVCaptureSessionConnectedInputPortEnabledChangedContext == a6)
  {
    -[AVCaptureSession _updateHardwareCost](self, "_updateHardwareCost", a3);
    return;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceStudioLightingActiveChangedContext == a6)
  {
    if ((objc_msgSend((id)objc_opt_class(), "_isConfiguringProperty:forDevice:", CFSTR("activeFormat"), a4) & 1) != 0)
      return;
    v24 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "BOOLValue");
    if (v24 == objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]), "BOOLValue"))return;
    -[AVCaptureSession _handleStudioLightingActiveChangedForDevice:](self, "_handleStudioLightingActiveChangedForDevice:", a4);
    goto LABEL_9;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceReactionEffectsActiveChangedContext == a6)
  {
    if ((objc_msgSend((id)objc_opt_class(), "_isConfiguringProperty:forDevice:", CFSTR("activeFormat"), a4) & 1) != 0)
      return;
    v25 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "BOOLValue");
    if (v25 == objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]), "BOOLValue"))return;
    -[AVCaptureSession _handleReactionEffectsActiveChangedForDevice:](self, "_handleReactionEffectsActiveChangedForDevice:", a4);
    goto LABEL_9;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceBackgroundReplacementActiveChangedContext == a6)
  {
    if ((objc_msgSend((id)objc_opt_class(), "_isConfiguringProperty:forDevice:", CFSTR("activeFormat"), a4) & 1) != 0)
      return;
    v26 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "BOOLValue");
    if (v26 == objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]), "BOOLValue"))return;
    -[AVCaptureSession _handleBackgroundReplacementActiveChangedForDevice:](self, "_handleBackgroundReplacementActiveChangedForDevice:", a4);
    goto LABEL_9;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceVideoZoomFactorChangedContext == a6)
  {
    if (!objc_msgSend(a4, "_isDepthDataDeliveryEnabled", a3))
      return;
    objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "floatValue");
    v28 = v27;
    objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]), "floatValue");
    if (v29 == v28)
      return;
    goto LABEL_9;
  }
  if (AVCaptureSessionVideoInputDeviceManualFramingEnabledChangedContext == a6
    || a6 == &AVCaptureSessionVideoInputDeviceManualFramingEnabledChangedContext
    || (void *)AVCaptureSessionVideoInputDeviceManualFramingPanningAngleYChangedContext == a6)
  {
    goto LABEL_61;
  }
  if ((void *)AVCaptureSessionVideoInputDeviceGazeSelectionEnabledChangedContext == a6)
  {
LABEL_60:
    if ((objc_msgSend((id)objc_opt_class(), "_isConfiguringProperty:forDevice:", CFSTR("activeFormat"), a4) & 1) != 0)
      return;
    goto LABEL_61;
  }
  if ((void *)AVCaptureSessionAudioInputDeviceIsBuiltInMicChangedContext == a6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      internal = self->_internal;
      objc_sync_enter(internal);
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      inputs = self->_internal->inputs;
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v31;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v31 != v14)
              objc_enumerationMutation(inputs);
            v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && objc_msgSend((id)objc_msgSend(v16, "device"), "isEqual:", a4)
              && objc_msgSend(a4, "shouldAudioCaptureModeTriggerGraphRebuildOnAudioRouteChange:", objc_msgSend(v16, "audioCaptureMode"))&& !-[AVCaptureSession _sessionHasRecordingFileOutput](self, "_sessionHasRecordingFileOutput"))
            {
              objc_sync_exit(internal);
              -[AVCaptureSession _rebuildGraph](self, "_rebuildGraph");
              return;
            }
          }
          v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          if (v13)
            continue;
          break;
        }
      }
      objc_sync_exit(internal);
    }
  }
}

+ (BOOL)_isConfiguringProperty:(id)a3 forDevice:(id)a4
{
  void *v6;

  v6 = (void *)sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice;
  objc_sync_enter((id)sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice);
  LOBYTE(a3) = objc_msgSend((id)objc_msgSend((id)sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice, "objectForKey:", a4), "objectForKeyedSubscript:", a3) != 0;
  objc_sync_exit(v6);
  return (char)a3;
}

+ (BOOL)automaticallyNotifiesObserversOfRunning
{
  return 0;
}

uint64_t __48__AVCaptureSession__canAddOutput_failureReason___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  v5 = *(void **)(a1 + 32);
  result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v11;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureMultipleVideoDataOutputsSupported"))
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            result = 1;
            *a4 = 1;
            return result;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v7 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (BOOL)notifiesOnMainThread
{
  return self->_internal->notifiesOnMainThread;
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04458]))
  {
    -[AVCaptureSession _handleDidStartRunningNotificationWithPayload:](self, "_handleDidStartRunningNotificationWithPayload:", a4);
  }
  else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04460]))
  {
    -[AVCaptureSession _handleDidStopRunningNotificationWithPayload:](self, "_handleDidStopRunningNotificationWithPayload:", a4);
  }
  else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04448]))
  {
    -[AVCaptureSession _handleConfigurationCommittedNotificationWithPayload:](self, "_handleConfigurationCommittedNotificationWithPayload:", a4);
  }
  else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04450]))
  {
    -[AVCaptureSession _handleConfigurationDidBecomeLiveNotificationWithPayload:](self, "_handleConfigurationDidBecomeLiveNotificationWithPayload:", a4);
  }
  else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04468]))
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_internal->captureServerConnectionDiedSemaphore);
  }
}

- (void)_handleConfigurationCommittedNotificationWithPayload:(id)a3
{
  int v5;
  uint64_t v6;
  AVCaptureSessionInternal *internal;
  void *v8;
  AVCaptureSessionInternal *v9;
  __CFRunLoop *Main;
  uint64_t v11;
  const void *v12;
  __CFRunLoop *v13;
  _QWORD block[5];
  int v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04368]), "intValue");
  v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04310]), "longLongValue");
  internal = self->_internal;
  objc_sync_enter(internal);
  while (1)
  {
    if (!-[NSMutableArray count](self->_internal->committedAVCaptureSessionConfigurations, "count")
      || (v8 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_internal->committedAVCaptureSessionConfigurations, "objectAtIndexedSubscript:", 0), objc_msgSend(v8, "configurationID") > v6))
    {
      objc_sync_exit(internal);
      if (!v5)
        return;
      goto LABEL_10;
    }
    if (objc_msgSend(v8, "configurationID") >= v6)
      break;
    -[NSMutableArray removeObject:](self->_internal->committedAVCaptureSessionConfigurations, "removeObject:", v8);
  }
  if (!v5)
  {
    -[AVCaptureSession _makeConfigurationLive:](self, "_makeConfigurationLive:", v8);
    -[NSMutableArray removeObject:](self->_internal->committedAVCaptureSessionConfigurations, "removeObject:", v8);
    objc_sync_exit(internal);
    return;
  }
  objc_sync_exit(internal);
LABEL_10:
  -[AVRunLoopCondition lock](self->_internal->runLoopCondition, "lock");
  v9 = self->_internal;
  if (v9->waitingForFigCaptureSessionConfigurationToBecomeLive)
  {
    v9->waitingForFigCaptureSessionConfigurationToBecomeLive = 0;
    -[AVRunLoopCondition signal](self->_internal->runLoopCondition, "signal");
    v9 = self->_internal;
  }
  -[AVRunLoopCondition unlock](v9->runLoopCondition, "unlock");
  if (-[AVCaptureSession notifiesOnMainThread](self, "notifiesOnMainThread"))
  {
    Main = CFRunLoopGetMain();
    v11 = *MEMORY[0x1E0C9B270];
    v16[0] = *MEMORY[0x1E0CA3680];
    v16[1] = v11;
    v12 = (const void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__AVCaptureSession__handleConfigurationCommittedNotificationWithPayload___block_invoke;
    block[3] = &unk_1E4217D58;
    block[4] = self;
    v15 = v5;
    CFRunLoopPerformBlock(Main, v12, block);
    v13 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v13);
  }
  else
  {
    -[AVCaptureSession _postRuntimeError:](self, "_postRuntimeError:", AVLocalizedErrorWithUnderlyingOSStatus());
  }
}

- (void)_makeConfigurationLive:(id)a3
{
  AVCaptureSessionInternal *internal;
  AVCaptureSessionConfiguration *liveAVCaptureSessionConfiguration;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  liveAVCaptureSessionConfiguration = internal->liveAVCaptureSessionConfiguration;
  if (liveAVCaptureSessionConfiguration)
  {
    objc_msgSend(-[AVCaptureSessionConfiguration uniqueInputs:](internal->liveAVCaptureSessionConfiguration, "uniqueInputs:", a3), "makeObjectsPerformSelector:withObject:", sel_detachFromFigCaptureSession_, self->_internal->figCaptureSession);
    objc_msgSend(-[AVCaptureSessionConfiguration uniqueOutputs:](liveAVCaptureSessionConfiguration, "uniqueOutputs:", a3), "makeObjectsPerformSelector:withObject:", sel_detachFromFigCaptureSession_, self->_internal->figCaptureSession);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = -[AVCaptureSessionConfiguration uniqueVideoPreviewLayers:](liveAVCaptureSessionConfiguration, "uniqueVideoPreviewLayers:", a3);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "detachFromFigCaptureSession:", self->_internal->figCaptureSession);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v9);
    }
  }
  objc_msgSend((id)objc_msgSend(a3, "uniqueInputs:", liveAVCaptureSessionConfiguration), "makeObjectsPerformSelector:withObject:", sel_attachToFigCaptureSession_, self->_internal->figCaptureSession);
  objc_msgSend((id)objc_msgSend(a3, "uniqueOutputs:", liveAVCaptureSessionConfiguration), "makeObjectsPerformSelector:withObject:", sel_attachToFigCaptureSession_, self->_internal->figCaptureSession);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = (void *)objc_msgSend(a3, "uniqueVideoPreviewLayers:", liveAVCaptureSessionConfiguration, 0);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "attachToFigCaptureSession:", self->_internal->figCaptureSession);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }
  v17 = a3;

  self->_internal->liveAVCaptureSessionConfiguration = (AVCaptureSessionConfiguration *)a3;
}

- (void)_handleConfigurationDidBecomeLiveNotificationWithPayload:(id)a3
{
  uint64_t v4;
  AVCaptureSessionInternal *internal;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  AVCaptureSessionInternal *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04310]), "longLongValue");
  internal = self->_internal;
  objc_sync_enter(internal);
  if (-[AVCaptureSessionConfiguration configurationID](self->_internal->liveAVCaptureSessionConfiguration, "configurationID") == v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSArray count](-[AVCaptureSessionConfiguration inputs](self->_internal->liveAVCaptureSessionConfiguration, "inputs"), "count"));
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = -[AVCaptureSessionConfiguration inputs](self->_internal->liveAVCaptureSessionConfiguration, "inputs");
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = objc_msgSend(v11, "device");
            if (v12)
            {
              if ((objc_msgSend(v6, "containsObject:", v12) & 1) == 0)
                objc_msgSend(v6, "addObject:", v12);
            }
          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v8);
    }
  }
  else
  {
    v6 = 0;
  }
  objc_sync_exit(internal);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v6);
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVCaptureDeviceDidStartRunningNotification"), *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  -[AVRunLoopCondition lock](self->_internal->runLoopCondition, "lock");
  v16 = self->_internal;
  if (v16->waitingForFigCaptureSessionConfigurationToBecomeLive)
  {
    v16->waitingForFigCaptureSessionConfigurationToBecomeLive = 0;
    v16 = self->_internal;
    if (!v16->waitingForFigCaptureSessionToStart)
    {
      -[AVRunLoopCondition signal](v16->runLoopCondition, "signal");
      v16 = self->_internal;
    }
  }
  -[AVRunLoopCondition unlock](v16->runLoopCondition, "unlock");
  objc_msgSend((id)objc_opt_class(), "_writeDotStringToFile");
}

- (AVCaptureSession)init
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v4;

  if (dword_1ECFED6A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementWebBrowserEngineRendering))
    return (AVCaptureSession *)-[AVCaptureSession _initWithMediaEnvironment:](self, "_initWithMediaEnvironment:", 0);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0, AVCaptureEntitlementWebBrowserEngineRendering);

  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v4);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  return 0;
}

- (id)_initWithMediaEnvironment:(id)a3
{
  AVCaptureSession *v4;
  AVCaptureSessionInternal *v5;
  AVCaptureSessionInternal **p_internal;
  int v7;
  AVCaptureSessionInternal **v8;
  AVCaptureSessionInternal **v9;
  AVWeakReference *weakReference;
  void *v11;
  AVCaptureSessionInternal **v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD v15[5];
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)AVCaptureSession;
  v4 = -[AVCaptureSession init](&v16, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(AVCaptureSessionInternal);
    v4->_internal = v5;
    if (!v5)
    {

      return 0;
    }
    p_internal = &v4->_internal;
    v4->_internal->weakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", v4);
    (*p_internal)->runLoopCondition = (AVRunLoopCondition *)objc_alloc_init(MEMORY[0x1E0CF2D40]);
    (*p_internal)->sessionPreset = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", CFSTR("AVCaptureSessionPresetHigh"));
    (*p_internal)->mediaEnvironment = (NSString *)objc_msgSend(a3, "copy");
    (*p_internal)->inputs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    (*p_internal)->outputs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    (*p_internal)->controls = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    (*p_internal)->controlsOverlay = -[AVCaptureControlsOverlay initWithSession:]([AVCaptureControlsOverlay alloc], "initWithSession:", v4);
    (*p_internal)->videoPreviewLayers = (NSHashTable *)(id)objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    (*p_internal)->connections = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    (*p_internal)->committedAVCaptureSessionConfigurations = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    (*p_internal)->automaticallyConfiguresApplicationAudioSession = 1;
    (*p_internal)->configuresApplicationAudioSessionToMixWithOthers = 0;
    (*p_internal)->automaticallyConfiguresCaptureDeviceForWideColor = 1;
    (*p_internal)->usesApplicationAudioSession = AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureSessionUsesAppAudioSessionByDefault"));
    (*p_internal)->notifiesOnMainThread = 1;
    (*p_internal)->devicesToResetVideoZoomFactorAndMinMaxFrameDurations = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = -[AVCaptureSession isMultitaskingCameraAccessSupported](v4, "isMultitaskingCameraAccessSupported");
    if (v7)
      LOBYTE(v7) = AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementMultitaskingCameraAccess);
    v8 = &v4->_internal;
    v4->_internal->authorizedToUseCameraInMultipleForegroundAppLayout = v7;
    (*v8)->greenTeaLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
    (*v8)->checkIfFileAlreadyExistForMFO = AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureCheckIfFileAlreadyExistForMFO"));
    if ((AVCaptureIsRunningInMediaserverd() & 1) == 0)
    {
      v9 = &v4->_internal;
      weakReference = v4->_internal->weakReference;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __46__AVCaptureSession__initWithMediaEnvironment___block_invoke;
      v15[3] = &unk_1E421D420;
      v15[4] = weakReference;
      (*v9)->captureServerConnectionDiedSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
      (*v9)->serverConnectionDiedNotificationToken = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserverForName:object:queue:usingBlock:", 0x1E42232A8, 0, 0, v15);
      +[AVCaptureDevice _registerOnceForServerConnectionDiedNotification](AVCaptureDevice, "_registerOnceForServerConnectionDiedNotification");
    }
    v4->_internal->figCaptureSourceConfigChangeCacheMutex = (OpaqueFigReentrantMutex *)FigReentrantMutexCreate();
    -[AVCaptureSession _createFigCaptureSession](v4, "_createFigCaptureSession");
    v11 = (void *)sActiveSessions;
    objc_sync_enter((id)sActiveSessions);
    objc_msgSend((id)sActiveSessions, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v4));
    objc_sync_exit(v11);
    v12 = &v4->_internal;
    v4->_internal->_devicesObservingVideoZoomFactor = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_internal->continuityCameraIsWired = 0;
    v4->_internal->continuityCameraClientDeviceClass = 0;
    v4->_internal->clientIsVOIP = 0;
    v4->_internal->suppressVideoEffects = 0;
    (*v12)->recordingMovieFileOutputs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    (*v12)->recordingMovieFileOutputsLock._os_unfair_lock_opaque = 0;
    (*v12)->smartStyleControlMode = 0;
    (*v12)->smartStyleInVideoModeEnabled = _os_feature_enabled_impl();
    (*v12)->smartStyleInThirdPartyAppsEnabled = 0;
    -[AVCaptureSession isApplicationOptedOutByDefaultToSmartStyles](v4, "isApplicationOptedOutByDefaultToSmartStyles");
    (*v12)->smartStyleRenderingOptedOut = !-[AVCaptureSession isSystemStyleEnabled](v4, "isSystemStyleEnabled");
  }
  if (dword_1ECFED6A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v4;
}

- (BOOL)isMultitaskingCameraAccessSupported
{
  void *v3;

  if ((AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementMultitaskingCameraAccess) & 1) != 0)
    return 1;
  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureMultitaskingCameraAccessVoipAppsSupported"))
    && (v3 = (void *)objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess"),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend((id)objc_msgSend(v3, "UIBackgroundModes"), "containsObject:", CFSTR("voip")) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return MGGetBoolAnswer();
  }
}

- (int)_createFigCaptureSession
{
  int v3;
  void *v4;
  AVWeakReference *weakReference;
  char v7;
  char v8;
  __int128 v9;
  CFTypeRef cf;

  cf = 0;
  if (self->_internal->figCaptureSession)
  {
    FigDebugAssert3();
    return 0;
  }
  else
  {
    if ((AVCaptureIsRunningInMediaserverd() & 1) != 0)
    {
      AVCaptureGetCurrentProcessAuditToken(&v9);
      v3 = FigCaptureSessionCreate();
    }
    else
    {
      FigCaptureSessionRemoteCreate();
      v7 = 1;
      do
      {
        v3 = FigCaptureSessionRemoteCreate();
        usleep(0x3D090u);
        v8 = v7 & 1;
        v7 = 0;
      }
      while ((v8 & 1) != 0);
    }
    if (v3)
    {
      FigDebugAssert3();
      if (cf)
        CFRelease(cf);
    }
    else
    {
      v4 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
      weakReference = self->_internal->weakReference;
      objc_msgSend(v4, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, avcaptureFigCaptureSessionNotification, *MEMORY[0x1E0D04448], cf, 0);
      objc_msgSend(v4, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, avcaptureFigCaptureSessionNotification, *MEMORY[0x1E0D04450], cf, 0);
      objc_msgSend(v4, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, avcaptureFigCaptureSessionNotification, *MEMORY[0x1E0D04468], cf, 0);
      objc_msgSend(v4, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, avcaptureFigCaptureSessionNotification, *MEMORY[0x1E0D04458], cf, 0);
      objc_msgSend(v4, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, avcaptureFigCaptureSessionNotification, *MEMORY[0x1E0D04460], cf, 0);
      v3 = 0;
      self->_internal->figCaptureSession = (OpaqueFigCaptureSession *)cf;
    }
  }
  return v3;
}

uint64_t __47__AVCaptureSession__canAddInput_failureReason___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  void *v8;

  result = objc_msgSend(a2, "isMemberOfClass:", objc_opt_class());
  if ((_DWORD)result)
  {
    v8 = (void *)objc_msgSend(a2, "device");
    objc_msgSend(*(id *)(a1 + 32), "device");
    result = objc_msgSend(v8, "isMemberOfClass:", objc_opt_class());
    if ((_DWORD)result)
    {
      result = 1;
      *a4 = 1;
    }
  }
  return result;
}

- (BOOL)likelyToRecordProResMovies
{
  uint64_t v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", +[AVCaptureOutput supportedProResCodecTypes](AVCaptureOutput, "supportedProResCodecTypes"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = -[AVCaptureSession connections](self, "connections", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v5)
    return v5;
  v6 = v5;
  v7 = *(_QWORD *)v15;
  v8 = *MEMORY[0x1E0CF2B08];
  while (2)
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v15 != v7)
        objc_enumerationMutation(v4);
      v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "output");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_msgSend(v10, "availableVideoCodecTypesForAssetWriterWithOutputFileType:", v8);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_12;
        v11 = objc_msgSend(v10, "availableVideoCodecTypes");
      }
      if (v11)
      {
        v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
        goto LABEL_13;
      }
LABEL_12:
      v12 = 0;
LABEL_13:
      if ((objc_msgSend(v12, "intersectsSet:", v3) & 1) != 0)
      {
        LOBYTE(v5) = 1;
        return v5;
      }
      ++v9;
    }
    while (v6 != v9);
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    v6 = v5;
    if (v5)
      continue;
    return v5;
  }
}

id __30__AVCaptureSession_initialize__block_invoke()
{
  id result;

  sActiveSessions = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  result = (id)objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  sCaptureDevicePropertiesBeingConfiguredByASession_ByDevice = (uint64_t)result;
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 || (id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
    if (initialize_sActiveSessionsToken != -1)
      dispatch_once(&initialize_sActiveSessionsToken, &__block_literal_global_21);
  }
  objc_opt_class();
}

- (BOOL)_startFigCaptureSession
{
  AVCaptureSessionInternal *internal;
  OpaqueFigCaptureSession *figCaptureSession;
  void (*v5)(OpaqueFigCaptureSession *);
  AVCaptureSessionInternal **p_internal;
  AVCaptureSessionInternal *v7;
  NSMutableArray *inputs;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  -[AVCaptureSession isRunning](self, "isRunning");
  self->_internal->figCaptureSessionStarted = 1;
  internal = self->_internal;
  objc_sync_enter(internal);
  figCaptureSession = self->_internal->figCaptureSession;
  if (figCaptureSession)
  {
    v5 = *(void (**)(OpaqueFigCaptureSession *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
    if (v5)
    {
      v5(figCaptureSession);
    }
    else
    {
      v19 = *MEMORY[0x1E0D04368];
      v20[0] = &unk_1E424D110;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterPostNotification();
    }
  }
  objc_sync_exit(internal);
  v7 = self->_internal;
  p_internal = &self->_internal;

  (*p_internal)->stopError = 0;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  inputs = (*p_internal)->inputs;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(inputs);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend((id)objc_msgSend(v12, "device"), "updateStreamingDeviceHistory");
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  return 1;
}

- (void)setAutomaticallyConfiguresCaptureDeviceForWideColor:(BOOL)automaticallyConfiguresCaptureDeviceForWideColor
{
  AVCaptureSessionInternal *internal;

  internal = self->_internal;
  if (internal->automaticallyConfiguresCaptureDeviceForWideColor != automaticallyConfiguresCaptureDeviceForWideColor)
  {
    internal->automaticallyConfiguresCaptureDeviceForWideColor = automaticallyConfiguresCaptureDeviceForWideColor;
    if (automaticallyConfiguresCaptureDeviceForWideColor)
    {
      -[AVCaptureSession _beginConfiguration](self, "_beginConfiguration");
      -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
    }
  }
}

- (BOOL)_addVideoPreviewLayer:(id)a3 exceptionReason:(id *)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVCaptureSessionInternal *internal;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL result;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  os_log_type_t type;
  int v22;
  _BYTE v23[128];
  _QWORD v24[17];

  v24[16] = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED6A0)
  {
    v22 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v24[0] = 0;
  if (-[AVCaptureSession _canAddVideoPreviewLayer:failureReason:](self, "_canAddVideoPreviewLayer:failureReason:", a3, v24, v15, v16))
  {
    internal = self->_internal;
    objc_sync_enter(internal);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[AVCaptureSession _removeAllPreviewLayers](self, "_removeAllPreviewLayers");
    if (-[NSHashTable containsObject:](self->_internal->videoPreviewLayers, "containsObject:", a3))
    {
      objc_sync_exit(internal);
      return 1;
    }
    if (-[NSHashTable count](self->_internal->videoPreviewLayers, "count") >= 2)
    {
      v24[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot add %@ to capture session %@ because it's already associated with one or more video preview layers. Use the AVCaptureVideoPreviewLayer \"WithNoConnections:\" method variants instead."), objc_msgSend(a3, "description"), -[AVCaptureSession description](self, "description"));
    }
    else
    {
      -[AVCaptureSession beginConfiguration](self, "beginConfiguration");
      -[NSHashTable addObject:](self->_internal->videoPreviewLayers, "addObject:", a3);
      v9 = -[AVCaptureSession _connectionsForNewVideoPreviewLayer:](self, "_connectionsForNewVideoPreviewLayer:", a3);
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      if (!v10)
      {
LABEL_18:
        objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("changeSeed"), 3, AVCaptureSessionOutputChangedContext);
        -[AVCaptureSession _updateHardwareCost](self, "_updateHardwareCost");
        objc_sync_exit(internal);
        -[AVCaptureSession commitConfiguration](self, "commitConfiguration");
        return 1;
      }
      v11 = *(_QWORD *)v18;
LABEL_11:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        if (-[AVCaptureSession canAddConnection:](self, "canAddConnection:", v13))
        {
          if (!-[AVCaptureSession _addConnection:exceptionReason:](self, "_addConnection:exceptionReason:", v13, v24))
            break;
        }
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
          if (v10)
            goto LABEL_11;
          goto LABEL_18;
        }
      }
    }
    objc_sync_exit(internal);
  }
  result = 0;
  if (a4)
    *a4 = (id)v24[0];
  return result;
}

- (void)_removeAllPreviewLayers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[NSHashTable count](self->_internal->videoPreviewLayers, "count"))
  {
    v3 = (void *)-[NSHashTable copy](self->_internal->videoPreviewLayers, "copy");
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setSession:", 0);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (id)_connectionsForNewVideoPreviewLayer:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  AVCaptureConnection *v16;
  NSArray *obj;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = -[AVCaptureSession inputs](self, "inputs");
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v19 = *(_QWORD *)v26;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v8);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v10 = (void *)objc_msgSend(v9, "ports");
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v22;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v22 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
              v20 = 0;
              v16 = +[AVCaptureConnection connectionWithInputPort:videoPreviewLayer:](AVCaptureConnection, "connectionWithInputPort:videoPreviewLayer:", v15, a3);
              if (objc_msgSend(a3, "canAddConnection:failureReason:", v16, &v20))
                objc_msgSend(v5, "addObject:", v16);
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v12);
        }
        ++v8;
      }
      while (v8 != v7);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }
  return v5;
}

- (BOOL)_canAddVideoPreviewLayer:(id)a3 failureReason:(id *)a4
{
  if (!a3 && a4)
    *a4 = CFSTR("Cannot add a nil video preview layer to a session");
  return a3 != 0;
}

- (void)setSessionPreset:(AVCaptureSessionPreset)sessionPreset
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVCaptureSessionInternal *internal;
  void *v7;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED6A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (-[AVCaptureSession canSetSessionPreset:](self, "canSetSessionPreset:", sessionPreset, v9, v10))
  {
    internal = self->_internal;
    objc_sync_enter(internal);
    if (-[NSString isEqualToString:](sessionPreset, "isEqualToString:", self->_internal->sessionPreset))
    {
      objc_sync_exit(internal);
    }
    else
    {
      -[AVCaptureSession _beginConfiguration](self, "_beginConfiguration");
      v8 = (NSString *)-[NSString copy](sessionPreset, "copy");

      self->_internal->sessionPreset = v8;
      objc_sync_exit(internal);
      if (!-[NSString isEqualToString:](sessionPreset, "isEqualToString:", CFSTR("AVCaptureSessionPresetInputPriority")))-[NSMutableArray addObjectsFromArray:](self->_internal->devicesToResetVideoZoomFactorAndMinMaxFrameDurations, "addObjectsFromArray:", -[AVCaptureSession sessionVideoCaptureDevices](self, "sessionVideoCaptureDevices"));
      -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
    }
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0, sessionPreset);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
}

- (BOOL)canSetSessionPreset:(AVCaptureSessionPreset)preset
{
  NSMutableArray *inputs;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  AVCaptureSessionInternal *obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  obj = self->_internal;
  objc_sync_enter(obj);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  inputs = self->_internal->inputs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(inputs);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = 0u;
          v20 = 0u;
          v17 = 0u;
          v18 = 0u;
          v9 = (void *)objc_msgSend(v8, "ports");
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v10)
          {
            v11 = *(_QWORD *)v18;
LABEL_9:
            v12 = 0;
            while (1)
            {
              if (*(_QWORD *)v18 != v11)
                objc_enumerationMutation(v9);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "isEnabled", obj) & 1) != 0)
                break;
              if (v10 == ++v12)
              {
                v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
                if (v10)
                  goto LABEL_9;
                goto LABEL_18;
              }
            }
            v13 = (void *)objc_msgSend(v8, "device");
            if (v13 && (objc_msgSend(v13, "supportsAVCaptureSessionPreset:", preset) & 1) == 0)
            {
              objc_sync_exit(obj);
              return 0;
            }
          }
        }
LABEL_18:
        ;
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }
  objc_sync_exit(obj);
  return objc_msgSend(+[AVCaptureSession allSessionPresets](AVCaptureSession, "allSessionPresets"), "containsObject:", preset);
}

+ (id)allSessionPresets
{
  id result;

  result = (id)allSessionPresets_doablePresets;
  if (!allSessionPresets_doablePresets)
  {
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("AVCaptureSessionPresetPhoto"), CFSTR("AVCaptureSessionPresetPhoto2592x1936"), CFSTR("AVCaptureSessionPreset3840x2160"), CFSTR("AVCaptureSessionPresetHigh"), CFSTR("AVCaptureSessionPresetHigh60"), CFSTR("AVCaptureSessionPresetMedium"), CFSTR("AVCaptureSessionPresetLow"), CFSTR("AVCaptureSessionPreset352x288"), CFSTR("AVCaptureSessionPreset640x480"), CFSTR("AVCaptureSessionPreset1280x720"), CFSTR("AVCaptureSessionPreset1920x1080"), CFSTR("AVCaptureSessionPresetiFrame960x540"), CFSTR("AVCaptureSessionPresetiFrame1280x720"), CFSTR("AVCaptureSessionPresetInputPriority"), CFSTR("AVCaptureSessionPresetVoicemailGreeting"), 0);
    allSessionPresets_doablePresets = (uint64_t)result;
  }
  return result;
}

- (void)_handleDidStartRunningNotificationWithPayload:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v8;
  AVCaptureSessionInternal *internal;
  AVCaptureSessionInternal *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  _QWORD v14[23];

  v14[22] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04368]), "intValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04360]), "intValue");
  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D043E8]);
  if (v5)
  {
    v6 = v5;
    if (dword_1ECFED6A0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v13 = CFSTR("AVCapturePrewarmReasonKey");
    v14[0] = v6;
    v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1, v11, v12);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AVCaptureSessionWasPrewarmedNotification"), self, v8);
  }
  internal = self->_internal;
  if (internal->interrupted)
  {
    -[AVCaptureSession _setInterrupted:withReason:](self, "_setInterrupted:withReason:", 0, 0);
    internal = self->_internal;
  }
  -[AVRunLoopCondition lock](internal->runLoopCondition, "lock");
  v10 = self->_internal;
  if (v10->waitingForFigCaptureSessionToStart)
  {
    v10->waitingForFigCaptureSessionToStart = 0;
    -[AVRunLoopCondition signal](self->_internal->runLoopCondition, "signal");
    v10 = self->_internal;
  }
  v10->figCaptureSessionRunning = 1;
  -[AVRunLoopCondition unlock](self->_internal->runLoopCondition, "unlock");
  -[AVCaptureSession _notifySessionStarted](self, "_notifySessionStarted");
}

- (void)_notifySessionStarted
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!self->_internal->running)
  {
    -[AVCaptureSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("running"));
    self->_internal->running = 1;
    -[AVCaptureSession _activateControlsOverlayIfNecessary](self, "_activateControlsOverlayIfNecessary");
    -[AVCaptureSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("running"));
    if (dword_1ECFED6A0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v4, v5), "postNotificationName:object:", CFSTR("AVCaptureSessionDidStartRunningNotification"), self);
  }
}

- (void)startRunning
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVCaptureSessionInternal *internal;
  void *v5;
  BOOL v6;

  if (dword_1ECFED6A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  if (-[AVCaptureSession isBeingConfigured](self, "isBeingConfigured"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
    objc_sync_exit(internal);
  }
  else
  {
    v6 = -[AVCaptureSession isRunning](self, "isRunning");
    objc_sync_exit(internal);
    if (!v6)
      -[AVCaptureSession _setRunning:](self, "_setRunning:", 1);
  }
}

- (void)_setRunning:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  AVCaptureSession *v6;
  AVCaptureSessionInternal *internal;
  AVCaptureSessionInternal *v8;
  _BOOL4 v9;
  AVCaptureSessionInternal *v10;
  int v11;
  NSObject *v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVCaptureSessionInternal *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  NSObject *CTGreenTeaOsLogHandle;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[136];
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1A1AF16C4](self, a2);
  v6 = self;
  if (self->_internal->videoInputDeviceUsed && AVCaptureClientIsCameraOrDerivative() && v3)
  {
    if (avcs_platformSupportsDeferredProcessing_onceToken != -1)
      dispatch_once(&avcs_platformSupportsDeferredProcessing_onceToken, &__block_literal_global_691);
    if (avcs_platformSupportsDeferredProcessing_answer)
      notify_post((const char *)*MEMORY[0x1E0D03F60]);
  }
  internal = self->_internal;
  if (internal->running != v3 || internal->figCaptureSessionStarted && !v3)
  {
    -[AVCaptureSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("running"));
    v8 = self->_internal;
    if (v3)
    {
      v8->running = v3;
      v9 = -[AVCaptureSession _buildAndRunGraph:](self, "_buildAndRunGraph:", -[AVCaptureSession isBeingConfigured](self, "isBeingConfigured"));
      v10 = self->_internal;
      if (!v9)
      {
        v10->running = 0;
LABEL_39:
        -[AVCaptureSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("running"));
        goto LABEL_40;
      }
      if (v10->interrupted)
      {
        v10->running = 0;
      }
      else
      {
        if (dword_1ECFED6A0)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v19, v20), "postNotificationName:object:", CFSTR("AVCaptureSessionDidStartRunningNotification"), self);
      }
      if (!self->_internal->videoInputDeviceUsed)
        goto LABEL_39;
      CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
      if (!CTGreenTeaOsLogHandle)
        goto LABEL_39;
      v16 = CTGreenTeaOsLogHandle;
      if (!os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
        goto LABEL_39;
      *(_WORD *)buf = 0;
      v17 = "Started camera session";
LABEL_38:
      _os_log_impl(&dword_19EDF1000, v16, OS_LOG_TYPE_INFO, v17, buf, 2u);
      goto LABEL_39;
    }
    if (v8->figCaptureSessionStarted)
    {
      v11 = -[AVCaptureSession _stopFigCaptureSession](self, "_stopFigCaptureSession");
      if (v11 && v11 != -11819)
        goto LABEL_26;
      self->_internal->running = 0;
      if (!dword_1ECFED6A0)
      {
LABEL_25:
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v19, v20), "postNotificationName:object:", CFSTR("AVCaptureSessionDidStopRunningNotification"), self);
LABEL_26:
        v14 = self->_internal;
        if (!v14->running && v14->interrupted)
        {
          -[AVCaptureSession _setInterrupted:withReason:](self, "_setInterrupted:withReason:", 0, 0);
          v14 = self->_internal;
        }
        if (!v14->videoInputDeviceUsed)
          goto LABEL_39;
        v15 = getCTGreenTeaOsLogHandle();
        if (!v15)
          goto LABEL_39;
        v16 = v15;
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          goto LABEL_39;
        *(_WORD *)buf = 0;
        v17 = "Stopped camera session";
        goto LABEL_38;
      }
    }
    else
    {
      v8->running = 0;
      if (!dword_1ECFED6A0)
        goto LABEL_25;
    }
    v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_25;
  }
LABEL_40:

  objc_autoreleasePoolPop(v5);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  AVCaptureSessionInternal *internal;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id obj;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  v5 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p [%@]>"), NSStringFromClass(v4), self, -[AVCaptureSession sessionPreset](self, "sessionPreset"));
  internal = self->_internal;
  objc_sync_enter(internal);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", -[AVCaptureSessionConfiguration connections](self->_internal->liveAVCaptureSessionConfiguration, "connections"));
  objc_sync_exit(internal);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v7;
  v19 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v10 = (void *)objc_msgSend(v9, "inputPorts");
        if (objc_msgSend(v9, "output"))
          v11 = objc_msgSend(v9, "output");
        else
          v11 = objc_msgSend(v9, "videoPreviewLayer");
        v12 = v11;
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v21;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v21 != v14)
                objc_enumerationMutation(v10);
              objc_msgSend(v5, "appendFormat:", CFSTR("\n\t%@[%@] -> %@"), objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "input"), objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "mediaType"), v12);
            }
            v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v13);
        }
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v19);
  }
  return v5;
}

uint64_t __46__AVCaptureSession__initWithMediaEnvironment___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "referencedObject"), "_handleCaptureServerConnectionDiedNotification");
}

- (AVCaptureSession)initWithAssumedIdentity:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVCaptureSession *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED6A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v6 = -[AVCaptureSession _initWithMediaEnvironment:](self, "_initWithMediaEnvironment:", 0, v8, v9);
  if (v6)
    v6->_internal->tccIdentity = (OS_tcc_identity *)a3;
  return v6;
}

- (AVCaptureSession)initWithMediaEnvironment:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v7;

  if (dword_1ECFED6A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementWebBrowserEngineRendering) & 1) != 0)
    return (AVCaptureSession *)-[AVCaptureSession _initWithMediaEnvironment:](self, "_initWithMediaEnvironment:", a3);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0, AVCaptureEntitlementWebBrowserEngineRendering);

  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v7);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  return 0;
}

- (void)dealloc
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v4;
  NSArray *v5;
  uint64_t i;
  NSArray *j;
  NSMutableArray *devicesObservingVideoZoomFactor;
  uint64_t v9;
  uint64_t v10;
  uint64_t k;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  os_log_type_t type;
  int v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED6A0)
  {
    v20 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (self->_internal)
  {
    v4 = (void *)sActiveSessions;
    objc_sync_enter((id)sActiveSessions);
    objc_msgSend((id)sActiveSessions, "removeObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self));
    objc_sync_exit(v4);
    -[AVRunLoopCondition signal](self->_internal->runLoopCondition, "signal");
    -[AVCaptureSession _beginConfiguration](self, "_beginConfiguration");
    v5 = -[AVCaptureSession inputs](self, "inputs");
    for (i = -[NSArray count](v5, "count"); i; i = -[NSArray count](v5, "count"))
    {
      -[AVCaptureSession removeInput:](self, "removeInput:", -[NSArray firstObject](v5, "firstObject"));
      v5 = -[AVCaptureSession inputs](self, "inputs");
    }
    for (j = -[AVCaptureSession outputs](self, "outputs");
          -[NSArray count](j, "count");
          j = -[AVCaptureSession outputs](self, "outputs"))
    {
      -[AVCaptureSession removeOutput:](self, "removeOutput:", -[NSArray firstObject](j, "firstObject", v12, v13));
    }

    -[AVCaptureSession _makeConfigurationLive:](self, "_makeConfigurationLive:", 0);
    -[AVCaptureSession _teardownFigCaptureSession](self, "_teardownFigCaptureSession");
    if ((AVCaptureIsRunningInMediaserverd() & 1) == 0)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_internal->serverConnectionDiedNotificationToken);

    }
    FigSimpleMutexDestroy();

    ct_green_tea_logger_destroy();
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    devicesObservingVideoZoomFactor = self->_internal->_devicesObservingVideoZoomFactor;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](devicesObservingVideoZoomFactor, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v16;
      do
      {
        for (k = 0; k != v9; ++k)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(devicesObservingVideoZoomFactor);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * k), "removeObserver:forKeyPath:context:", self, CFSTR("videoZoomFactor"), AVCaptureSessionVideoInputDeviceVideoZoomFactorChangedContext, v12, v13);
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](devicesObservingVideoZoomFactor, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      }
      while (v9);
    }

  }
  v14.receiver = self;
  v14.super_class = (Class)AVCaptureSession;
  -[AVCaptureSession dealloc](&v14, sel_dealloc, v12, v13);
}

+ (id)dotString
{
  return 0;
}

- (BOOL)isBeingConfiguredOnCurrentThread
{
  AVCaptureSessionInternal *internal;
  char v4;

  MEMORY[0x1A1AF1220](self->_internal->figCaptureSourceConfigChangeCacheMutex, a2);
  internal = self->_internal;
  if (internal->beginConfigRefCount < 1)
  {
    v4 = 0;
  }
  else
  {
    v4 = -[NSThread isEqual:](internal->threadWhichBeganConfiguration, "isEqual:", objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"));
    internal = self->_internal;
  }
  MEMORY[0x1A1AF122C](internal->figCaptureSourceConfigChangeCacheMutex);
  return v4;
}

- (void)addInputWithNoConnections:(AVCaptureInput *)input
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[17];

  v9[16] = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED6A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVCaptureSession _beginConfiguration](self, "_beginConfiguration", v7, v8);
  v9[0] = 0;
  if (-[AVCaptureSession _addInputWithNoConnections:exceptionReason:](self, "_addInputWithNoConnections:exceptionReason:", input, v9))
  {
    -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

- (void)removeInput:(AVCaptureInput *)input
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVCaptureSessionInternal *internal;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED6A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVCaptureSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("inputs"), v7, v8);
  internal = self->_internal;
  objc_sync_enter(internal);
  if (-[NSMutableArray containsObject:](self->_internal->inputs, "containsObject:", input))
  {
    -[AVCaptureSession _beginConfiguration](self, "_beginConfiguration");
    -[AVCaptureSession _removeInput:](self, "_removeInput:", input);
    objc_sync_exit(internal);
    -[AVCaptureSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inputs"));
    -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
  }
  else
  {
    objc_sync_exit(internal);
    -[AVCaptureSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inputs"));
  }
}

- (void)_removeInput:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_msgSend(a3, "ports", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "removeObserver:forKeyPath:context:", self, CFSTR("changeSeed"), AVCaptureSessionInputPortChangedContext);
        -[AVCaptureSession _removeConnectionsForInputPort:](self, "_removeConnectionsForInputPort:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  objc_msgSend(a3, "setSession:", 0);
  if (objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
  {
    v11 = (void *)objc_msgSend(a3, "device");
    if (objc_msgSend(v11, "hasMediaType:", *MEMORY[0x1E0CF2B90])
      && objc_msgSend(v11, "lockForConfiguration:", 0))
    {
      objc_msgSend(v11, "setCachesFigCaptureSourceConfigurationChanges:", 0);
      objc_msgSend(v11, "unlockForConfiguration");
    }
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("geometricDistortionCorrectionEnabled"), AVCaptureSessionVideoInputDeviceGeometricDistortionCorrectionEnabledChangedContext);
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("lowLightVideoCaptureEnabled"), AVCaptureSessionVideoInputDeviceLowLightVideoEnabledChangedContext);
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("variableFrameRateVideoCaptureEnabled"), AVCaptureSessionVideoInputDeviceVariableFrameRateVideoEnabledChangedContext);
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("videoStabilizationStrength"), AVCaptureSessionVideoInputDeviceVideoStabilizationStrengthChangedContext);
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("centerStageActive"), AVCaptureSessionVideoInputDeviceCenterStageActiveChangedContext);
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("backgroundBlurActive"), AVCaptureSessionVideoInputDeviceBackgroundBlurActiveChangedContext);
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("studioLightActive"), AVCaptureSessionVideoInputDeviceStudioLightingActiveChangedContext);
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("canPerformReactionEffects"), AVCaptureSessionVideoInputDeviceReactionEffectsActiveChangedContext);
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("backgroundReplacementActive"), AVCaptureSessionVideoInputDeviceBackgroundReplacementActiveChangedContext);
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("activeColorSpace"), AVCaptureSessionVideoInputDeviceActiveColorSpaceChangedContext);
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("videoHDREnabled"), AVCaptureSessionVideoInputDeviceHDREnabledChangedContext);
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("automaticallyAdjustsVideoHDREnabled"), AVCaptureSessionVideoInputDeviceAutomaticallyAdjustsHDREnabledChangedContext);
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("activeDepthDataFormat"), AVCaptureSessionVideoInputDeviceActiveDepthDataFormatChangedContext);
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("activeFormat"), AVCaptureSessionVideoInputDeviceActiveFormatChangedContext);
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("connected"), AVCaptureSessionVideoInputDeviceConnectedChangedContext);
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("manualFramingEnabled"), AVCaptureSessionVideoInputDeviceManualFramingEnabledChangedContext);
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("manualFramingPanningAngleX"), &AVCaptureSessionVideoInputDeviceManualFramingEnabledChangedContext);
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("manualFramingPanningAngleY"), AVCaptureSessionVideoInputDeviceManualFramingPanningAngleYChangedContext);
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("gazeSelectionEnabled"), AVCaptureSessionVideoInputDeviceGazeSelectionEnabledChangedContext);
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("audioInputRouteIsBuiltInMic"), AVCaptureSessionAudioInputDeviceIsBuiltInMicChangedContext);
  }
  -[NSMutableArray removeObject:](self->_internal->inputs, "removeObject:", a3);
}

- (void)addOutputWithNoConnections:(AVCaptureOutput *)output
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[17];

  v9[16] = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED6A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVCaptureSession _beginConfiguration](self, "_beginConfiguration", v7, v8);
  v9[0] = 0;
  if (-[AVCaptureSession _addOutputWithNoConnections:exceptionReason:](self, "_addOutputWithNoConnections:exceptionReason:", output, v9))
  {
    -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

- (void)removeOutput:(AVCaptureOutput *)output
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVCaptureSessionInternal *internal;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  os_log_type_t type;
  int v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED6A0)
  {
    v18 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVCaptureSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("outputs"), v11, v12);
  internal = self->_internal;
  objc_sync_enter(internal);
  if (-[NSMutableArray containsObject:](self->_internal->outputs, "containsObject:", output))
  {
    -[AVCaptureSession _beginConfiguration](self, "_beginConfiguration");
    -[AVCaptureOutput removeObserver:forKeyPath:context:](output, "removeObserver:forKeyPath:context:", self, CFSTR("changeSeed"), AVCaptureSessionOutputChangedContext);
    v7 = (void *)-[NSArray copy](-[AVCaptureOutput connections](output, "connections"), "copy");
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          -[AVCaptureSession _removeConnection:](self, "_removeConnection:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      }
      while (v8);
    }

    -[AVCaptureOutput setSession:](output, "setSession:", 0);
    -[NSMutableArray removeObject:](self->_internal->outputs, "removeObject:", output);
    objc_sync_exit(internal);
    -[AVCaptureSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("outputs"));
    -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
  }
  else
  {
    objc_sync_exit(internal);
    -[AVCaptureSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("outputs"));
  }
}

- (BOOL)_addVideoPreviewLayerWithNoConnection:(id)a3 exceptionReason:(id *)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _BOOL4 v8;
  AVCaptureSessionInternal *internal;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[17];

  v13[16] = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED6A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v13[0] = 0;
  v8 = -[AVCaptureSession _canAddVideoPreviewLayer:failureReason:](self, "_canAddVideoPreviewLayer:failureReason:", a3, v13, v11, v12);
  if (v8)
  {
    internal = self->_internal;
    objc_sync_enter(internal);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[AVCaptureSession _removeAllPreviewLayers](self, "_removeAllPreviewLayers");
    if (!-[NSHashTable containsObject:](self->_internal->videoPreviewLayers, "containsObject:", a3))
    {
      -[NSHashTable addObject:](self->_internal->videoPreviewLayers, "addObject:", a3);
      objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("changeSeed"), 3, AVCaptureSessionOutputChangedContext);
    }
    objc_sync_exit(internal);
  }
  else if (a4)
  {
    *a4 = (id)v13[0];
  }
  return v8;
}

- (void)_removeVideoPreviewLayer:(id)a3
{
  AVCaptureSessionInternal *internal;
  uint64_t v6;

  if (a3)
  {
    internal = self->_internal;
    objc_sync_enter(internal);
    -[AVCaptureSession beginConfiguration](self, "beginConfiguration");
    v6 = objc_msgSend(a3, "connection");
    if (v6)
      -[AVCaptureSession _removeConnection:](self, "_removeConnection:", v6);
    -[NSHashTable removeObject:](self->_internal->videoPreviewLayers, "removeObject:", a3);
    objc_msgSend(a3, "removeObserver:forKeyPath:context:", self, CFSTR("changeSeed"), AVCaptureSessionOutputChangedContext);
    objc_sync_exit(internal);
    -[AVCaptureSession commitConfiguration](self, "commitConfiguration");
  }
}

- (void)addConnection:(AVCaptureConnection *)connection
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[17];

  v9[16] = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED6A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVCaptureSession _beginConfiguration](self, "_beginConfiguration", v7, v8);
  v9[0] = 0;
  if (-[AVCaptureSession _addConnection:exceptionReason:](self, "_addConnection:exceptionReason:", connection, v9))
  {
    -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

- (void)removeConnection:(AVCaptureConnection *)connection
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED6A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVCaptureSession _beginConfiguration](self, "_beginConfiguration", v6, v7);
  -[AVCaptureSession _removeConnection:](self, "_removeConnection:", connection);
  -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
}

- (void)_removeConnection:(id)a3
{
  void *v5;
  void *v6;
  AVCaptureSessionInternal *internal;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "output");
  v6 = (void *)objc_msgSend(a3, "videoPreviewLayer");
  internal = self->_internal;
  objc_sync_enter(internal);
  if ((-[NSMutableArray containsObject:](self->_internal->connections, "containsObject:", a3) & 1) != 0)
  {
    if (v5)
      objc_msgSend(v5, "removeConnection:", a3);
    else
      objc_msgSend(v6, "removeConnection:", a3);
    objc_msgSend(a3, "teardownObservers");
    objc_msgSend(a3, "removeObserver:forKeyPath:context:", self, CFSTR("changeSeed"), AVCaptureSessionConnectionChangedContext);
    objc_msgSend(a3, "removeObserver:forKeyPath:context:", self, CFSTR("active"), AVCaptureSessionConnectionActiveChangedContext);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = (void *)objc_msgSend(a3, "inputPorts", 0);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "removeObserver:forKeyPath:context:", self, CFSTR("enabled"), AVCaptureSessionConnectedInputPortEnabledChangedContext);
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }
    -[NSMutableArray removeObject:](self->_internal->connections, "removeObject:", a3);
    -[AVCaptureSession _updateHardwareCost](self, "_updateHardwareCost");
  }
  objc_sync_exit(internal);
}

- (BOOL)supportsControls
{
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
    return MGGetBoolAnswer();
  else
    return 0;
}

- (void)setControlsDelegate:(id)a3 queue:(id)a4
{
  void *v7;
  AVCaptureSessionInternal *internal;
  AVWeakReference *weakReferenceControlsDelegate;
  AVCaptureSessionInternal *v10;
  NSObject *clientControlsQueue;

  if (!a3 || a4)
  {
    internal = self->_internal;
    objc_sync_enter(internal);
    -[AVCaptureSession _beginConfiguration](self, "_beginConfiguration");
    weakReferenceControlsDelegate = self->_internal->weakReferenceControlsDelegate;
    if (weakReferenceControlsDelegate)
    {

      self->_internal->weakReferenceControlsDelegate = 0;
    }
    if (a3)
      self->_internal->weakReferenceControlsDelegate = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", a3);
    v10 = self->_internal;
    clientControlsQueue = v10->clientControlsQueue;
    if (clientControlsQueue != a4)
    {
      v10->clientControlsQueue = (OS_dispatch_queue *)a4;
      if (a4)
        dispatch_retain((dispatch_object_t)a4);
      if (clientControlsQueue)
        dispatch_release(clientControlsQueue);
    }
    -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
    objc_sync_exit(internal);
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
}

- (AVCaptureSessionControlsDelegate)controlsDelegate
{
  AVCaptureSessionInternal *internal;
  AVCaptureSessionControlsDelegate *v4;

  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = (AVCaptureSessionControlsDelegate *)-[AVWeakReference referencedObject](self->_internal->weakReferenceControlsDelegate, "referencedObject");
  objc_sync_exit(internal);
  return v4;
}

- (OS_dispatch_queue)controlsDelegateCallbackQueue
{
  AVCaptureSessionInternal *internal;
  OS_dispatch_queue *v4;

  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = self->_internal->clientControlsQueue;
  objc_sync_exit(internal);
  return v4;
}

- (NSArray)controls
{
  AVCaptureSessionInternal *internal;
  NSArray *v4;

  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_internal->controls);
  objc_sync_exit(internal);
  return v4;
}

- (BOOL)_canAddControl:(id)a3 failureReason:(id *)a4
{
  unint64_t v5;
  NSMutableArray *controls;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL result;
  const __CFString *v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const __CFString *v14;
  uint64_t v15;
  __CFString *v17;
  AVCaptureSessionInternal *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!-[AVCaptureSession supportsControls](self, "supportsControls"))
  {
    v14 = CFSTR("The session doesn't support controls");
LABEL_40:
    v17 = (__CFString *)v14;
    goto LABEL_32;
  }
  if (!a3)
  {
    v14 = CFSTR("Can't add a nil AVCaptureControl");
    goto LABEL_40;
  }
  if ((AVCaptureSession *)objc_msgSend(a3, "session") == self)
  {
LABEL_39:
    v14 = CFSTR("An AVCaptureControl instance may not be added more than once to a session");
    goto LABEL_40;
  }
  if (objc_msgSend(a3, "session"))
  {
    v14 = CFSTR("An AVCaptureControl instance may not be added to more than one session");
    goto LABEL_40;
  }
  if (!objc_msgSend(a3, "actionQueue"))
  {
    v14 = CFSTR("An AVCaptureControl instance cannot have a nil action queue");
    goto LABEL_40;
  }
  obj = self->_internal;
  objc_sync_enter(obj);
  if (-[NSMutableArray containsObject:](self->_internal->controls, "containsObject:", a3))
  {
    objc_sync_exit(obj);
    goto LABEL_39;
  }
  v5 = -[NSMutableArray count](self->_internal->controls, "count");
  if (v5 >= -[AVCaptureSession maxControlsCount](self, "maxControlsCount"))
  {
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The session cannot have more than %lu controls"), -[AVCaptureSession maxControlsCount](self, "maxControlsCount"));
    objc_sync_exit(obj);
    v17 = (__CFString *)v15;
    if (!v15)
      return 0;
LABEL_32:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (a4)
    {
      result = 0;
      *a4 = v17;
      return result;
    }
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    controls = self->_internal->controls;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](controls, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v17 = CFSTR("The session doesn't support having multiple AVCaptureSystemZoomSlider instances with the same device");
      v8 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(controls);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "device"), "uniqueID"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a3, "device"), "uniqueID")) & 1) != 0)
            {
              goto LABEL_31;
            }
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "device"), "uniqueID"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a3, "device"), "uniqueID")) & 1) != 0)
            {
              v12 = CFSTR("The session doesn't support having multiple AVCaptureSystemExposureBiasSlider instances with the same device");
LABEL_30:
              v17 = (__CFString *)v12;
LABEL_31:
              objc_sync_exit(obj);
              goto LABEL_32;
            }
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "device"), "uniqueID"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a3, "device"), "uniqueID")) & 1) != 0)
            {
              v12 = CFSTR("The session doesn't support having multiple AVCaptureSystemLensSelector instances with the same device");
              goto LABEL_30;
            }
          }
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](controls, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v7)
          continue;
        break;
      }
    }
  }
  objc_sync_exit(obj);
  return 1;
}

- (BOOL)canAddControl:(id)a3
{
  return -[AVCaptureSession _canAddControl:failureReason:](self, "_canAddControl:failureReason:", a3, 0);
}

- (void)addControl:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVCaptureSessionInternal *internal;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[17];

  v10[16] = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED6A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVCaptureSession _beginConfiguration](self, "_beginConfiguration", v8, v9);
  internal = self->_internal;
  objc_sync_enter(internal);
  v10[0] = 0;
  if (-[AVCaptureSession _canAddControl:failureReason:](self, "_canAddControl:failureReason:", a3, v10))
  {
    objc_msgSend(a3, "setSession:", self);
    -[NSMutableArray addObject:](self->_internal->controls, "addObject:", a3);
    objc_sync_exit(internal);
    -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
    objc_sync_exit(internal);
  }
}

- (void)removeControl:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVCaptureSessionInternal *internal;

  if (dword_1ECFED6A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  if (-[NSMutableArray containsObject:](self->_internal->controls, "containsObject:", a3))
  {
    objc_msgSend(a3, "setSession:", 0);
    -[AVCaptureSession _beginConfiguration](self, "_beginConfiguration");
    -[NSMutableArray removeObject:](self->_internal->controls, "removeObject:", a3);
    objc_sync_exit(internal);
    -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
  }
  else
  {
    objc_sync_exit(internal);
  }
}

- (int64_t)maxControlsCount
{
  return 7;
}

- (void)_setInterrupted:(BOOL)a3 withReason:(int)a4
{
  uint64_t v4;
  _BOOL4 v5;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *CTGreenTeaOsLogHandle;
  NSObject *v16;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[128];
  _BYTE v25[128];
  uint64_t v26;

  LODWORD(v4) = a4;
  v5 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  -[AVCaptureSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("interrupted"));
  self->_internal->interrupted = v5;
  if (v5)
    v7 = CFSTR("AVCaptureSessionWasInterruptedNotification");
  else
    v7 = CFSTR("AVCaptureSessionInterruptionEndedNotification");
  if (v5)
  {
    v8 = 0;
    v4 = v4;
    switch((int)v4)
    {
      case 1:
        goto LABEL_21;
      case 2:
      case 3:
        v8 = 0;
        v4 = 2;
        goto LABEL_21;
      case 4:
        v8 = 0;
        v4 = 3;
        goto LABEL_21;
      case 5:
        v8 = 0;
        v4 = 4;
        goto LABEL_21;
      case 6:
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v10 = -[AVCaptureSession sessionVideoCaptureDevices](self, "sessionVideoCaptureDevices");
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (!v11)
        {
          v8 = 0;
          v4 = 5;
          goto LABEL_21;
        }
        v12 = v11;
        v13 = *(_QWORD *)v21;
        v4 = 5;
        break;
      default:
        v9 = 0;
        goto LABEL_22;
    }
LABEL_13:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v13)
        objc_enumerationMutation(v10);
      v8 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v14), "systemPressureState");
      if ((objc_msgSend((id)objc_msgSend(v8, "level"), "isEqual:", CFSTR("AVCaptureSystemPressureLevelShutdown")) & 1) != 0)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        v8 = 0;
        if (!v12)
          break;
        goto LABEL_13;
      }
    }
LABEL_21:
    v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4), CFSTR("AVCaptureSessionInterruptionReasonKey"), v8, CFSTR("AVCaptureSessionInterruptionSystemPressureStateKey"), 0);
LABEL_22:
    if (self->_internal->videoInputDeviceUsed)
    {
      CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
      if (CTGreenTeaOsLogHandle)
      {
        v16 = CTGreenTeaOsLogHandle;
        if (os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19EDF1000, v16, OS_LOG_TYPE_INFO, "Stopped camera session", buf, 2u);
        }
      }
    }
  }
  else
  {
    v9 = 0;
  }
  if (dword_1ECFED6A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v18, v19), "postNotificationName:object:userInfo:", v7, self, v9);
  -[AVCaptureSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("interrupted"));
}

- (BOOL)isMultitaskingCameraAccessEnabled
{
  return self->_internal->authorizedToUseCameraInMultipleForegroundAppLayout;
}

- (void)setMultitaskingCameraAccessEnabled:(BOOL)multitaskingCameraAccessEnabled
{
  _BOOL8 v3;
  void *v5;

  v3 = multitaskingCameraAccessEnabled;
  if (multitaskingCameraAccessEnabled
    && !-[AVCaptureSession isMultitaskingCameraAccessSupported](self, "isMultitaskingCameraAccessSupported"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
  else
  {
    -[AVCaptureSession _setMultitaskingCameraAccessEnabled:](self, "_setMultitaskingCameraAccessEnabled:", v3);
  }
}

- (BOOL)usesApplicationAudioSession
{
  return self->_internal->usesApplicationAudioSession;
}

- (void)setUsesApplicationAudioSession:(BOOL)usesApplicationAudioSession
{
  if (self->_internal->usesApplicationAudioSession != usesApplicationAudioSession)
  {
    -[AVCaptureSession _beginConfiguration](self, "_beginConfiguration");
    self->_internal->usesApplicationAudioSession = usesApplicationAudioSession;
    -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
  }
}

- (BOOL)automaticallyConfiguresApplicationAudioSession
{
  return self->_internal->automaticallyConfiguresApplicationAudioSession;
}

- (void)setAutomaticallyConfiguresApplicationAudioSession:(BOOL)automaticallyConfiguresApplicationAudioSession
{
  AVCaptureSessionInternal *internal;

  internal = self->_internal;
  if (internal->automaticallyConfiguresApplicationAudioSession != automaticallyConfiguresApplicationAudioSession)
  {
    internal->automaticallyConfiguresApplicationAudioSession = automaticallyConfiguresApplicationAudioSession;
    if (self->_internal->usesApplicationAudioSession)
    {
      -[AVCaptureSession _beginConfiguration](self, "_beginConfiguration");
      -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
    }
  }
}

- (BOOL)configuresApplicationAudioSessionToMixWithOthers
{
  return self->_internal->configuresApplicationAudioSessionToMixWithOthers;
}

- (void)setConfiguresApplicationAudioSessionToMixWithOthers:(BOOL)a3
{
  AVCaptureSessionInternal *internal;

  internal = self->_internal;
  if (internal->configuresApplicationAudioSessionToMixWithOthers != a3)
  {
    internal->configuresApplicationAudioSessionToMixWithOthers = a3;
    if (self->_internal->usesApplicationAudioSession)
      -[AVCaptureSession _rebuildGraph](self, "_rebuildGraph");
  }
}

- (BOOL)automaticallyConfiguresCaptureDeviceForWideColor
{
  return self->_internal->automaticallyConfiguresCaptureDeviceForWideColor;
}

- (void)stopRunning
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVCaptureSessionInternal *internal;
  void *v5;

  if (dword_1ECFED6A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  if (-[AVCaptureSession isBeingConfigured](self, "isBeingConfigured"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
    goto LABEL_6;
  }
  if (!-[AVCaptureSession isRunning](self, "isRunning") && !self->_internal->figCaptureSessionStarted)
  {
LABEL_6:
    objc_sync_exit(internal);
    return;
  }
  objc_sync_exit(internal);
  -[AVCaptureSession _setRunning:](self, "_setRunning:", 0);
}

- (int)_stopFigCaptureSession
{
  id v3;
  AVCaptureSessionInternal *internal;
  OpaqueFigCaptureSession *figCaptureSession;
  void (*v6)(OpaqueFigCaptureSession *);
  AVRunLoopCondition *runLoopCondition;
  uint64_t v8;
  char v9;
  _BOOL4 waitingForFigCaptureSessionToStop;
  int v11;
  AVCaptureSessionInternal **p_internal;
  AVCaptureSessionInternal *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[AVCaptureSession isRunning](self, "isRunning");
  v3 = -[AVCaptureSession _stopError](self, "_stopError");
  -[AVRunLoopCondition lock](self->_internal->runLoopCondition, "lock");
  self->_internal->waitingForFigCaptureSessionToStop = 1;
  internal = self->_internal;
  objc_sync_enter(internal);
  figCaptureSession = self->_internal->figCaptureSession;
  if (figCaptureSession)
  {
    v6 = *(void (**)(OpaqueFigCaptureSession *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
    if (v6)
    {
      v6(figCaptureSession);
    }
    else
    {
      v15 = *MEMORY[0x1E0D04368];
      v16[0] = &unk_1E424D110;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterPostNotification();
    }
  }
  objc_sync_exit(internal);
  -[AVRunLoopCondition signal](self->_internal->runLoopCondition, "signal");
  runLoopCondition = self->_internal->runLoopCondition;
  v8 = objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 9.0);
  v9 = -[AVRunLoopCondition waitUntilDate:inMode:](runLoopCondition, "waitUntilDate:inMode:", v8, *MEMORY[0x1E0CA3680]);
  waitingForFigCaptureSessionToStop = self->_internal->waitingForFigCaptureSessionToStop;
  self->_internal->waitingForFigCaptureSessionToStop = 0;
  if ((v9 & 1) != 0)
  {
    if (waitingForFigCaptureSessionToStop)
    {
      v11 = -1;
    }
    else
    {
      v11 = 0;
      self->_internal->figCaptureSessionStarted = 0;
    }
  }
  else
  {
    v3 = (id)AVLocalizedError();
    v11 = -11819;
  }
  -[AVRunLoopCondition unlock](self->_internal->runLoopCondition, "unlock");
  if (v3 && objc_msgSend(v3, "code") != -11806)
    -[AVCaptureSession _postRuntimeError:](self, "_postRuntimeError:", v3);
  v13 = self->_internal;
  p_internal = &self->_internal;
  os_unfair_lock_lock(&v13->recordingMovieFileOutputsLock);
  -[NSMutableArray removeAllObjects]((*p_internal)->recordingMovieFileOutputs, "removeAllObjects");
  os_unfair_lock_unlock(&(*p_internal)->recordingMovieFileOutputsLock);
  return v11;
}

- (CMClockRef)synchronizationClock
{
  AVCaptureSessionInternal *internal;
  OpaqueCMClock *synchronizationClock;
  CFTypeRef v5;
  OpaqueCMClock *v6;

  internal = self->_internal;
  objc_sync_enter(internal);
  synchronizationClock = self->_internal->synchronizationClock;
  if (synchronizationClock)
  {
    v5 = CFRetain(synchronizationClock);
    v6 = (OpaqueCMClock *)CFAutorelease(v5);
  }
  else
  {
    v6 = 0;
  }
  objc_sync_exit(internal);
  return v6;
}

- (float)_totalHardwareCost
{
  float v3;
  float v4;
  float v5;
  float v6;
  float result;

  -[AVCaptureSession _nandCost](self, "_nandCost");
  if (v3 >= 0.0)
    v4 = v3;
  else
    v4 = 0.0;
  if ((int)FigCapturePlatformIdentifier() >= 6)
  {
    -[AVCaptureSession _memoryCost](self, "_memoryCost");
    if (v4 <= v5)
      v4 = v5;
    -[AVCaptureSession _encoderCost](self, "_encoderCost");
    if (v4 <= v6)
      v4 = v6;
  }
  -[AVCaptureSession _videoAndMovieOutputCost](self, "_videoAndMovieOutputCost");
  if (v4 > result)
    return v4;
  return result;
}

- (float)_nandCost
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v2 = -[AVCaptureSession connections](self, "connections");
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    v6 = *MEMORY[0x1E0CF2B90];
    v7 = *MEMORY[0x1E0CA9040];
    v18 = *MEMORY[0x1E0CF2B08];
    v8 = *MEMORY[0x1E0CF2C60];
    v9 = 0.0;
    while (1)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v11, "isActive")
          && objc_msgSend((id)objc_msgSend(v11, "mediaType"), "isEqualToString:", v6))
        {
          v12 = (void *)objc_msgSend(v11, "output");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "videoSettings"), "objectForKeyedSubscript:", v7), "intValue");
            if (!FigCapturePixelFormatIs422())
              continue;
            v13 = (void *)objc_msgSend(v12, "availableVideoCodecTypesForAssetWriterWithOutputFileType:", v18);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            v13 = (void *)objc_msgSend(v12, "availableVideoCodecTypes");
          }
          v14 = 0.0;
          if (objc_msgSend(v13, "containsObject:", v8)
            && !+[AVExternalStorageDeviceDiscoverySession isSupported](AVExternalStorageDeviceDiscoverySession, "isSupported"))
          {
            -[AVCaptureSession _nandCostWithDataRate:](self, "_nandCostWithDataRate:", -[AVCaptureSession _getMovieFileOutputNANDDataRate:](self, "_getMovieFileOutputNANDDataRate:", v11));
            v14 = v15;
          }
          v9 = v9 + v14;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (!v4)
        return v9;
    }
  }
  return 0.0;
}

- (float)_nandCostWithDataRate:(int)a3
{
  return (float)a3 / flt_19EEEA910[AVCaptureGetDiskCapacityInGB() < 0x100];
}

- (id)mediaEnvironment
{
  return self->_internal->mediaEnvironment;
}

- (BOOL)requestNANDBandwidthToStartMovieFileRecording:(id)a3 outputFileURL:(id)a4 videoCodecType:(id)a5
{
  uint64_t v8;
  int v9;
  NSMutableArray *recordingMovieFileOutputs;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray removeObject:](self->_internal->recordingMovieFileOutputs, "removeObject:");
  if (!objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0CF2C68])
    || FigFileIsFileOnExternalStorageDevice())
  {
    return 1;
  }
  os_unfair_lock_lock(&self->_internal->recordingMovieFileOutputsLock);
  v8 = *MEMORY[0x1E0CF2B90];
  v9 = -[AVCaptureSession _getMovieFileOutputNANDDataRate:](self, "_getMovieFileOutputNANDDataRate:", objc_msgSend(a3, "connectionWithMediaType:", *MEMORY[0x1E0CF2B90]));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  recordingMovieFileOutputs = self->_internal->recordingMovieFileOutputs;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](recordingMovieFileOutputs, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(recordingMovieFileOutputs);
        v9 += -[AVCaptureSession _getMovieFileOutputNANDDataRate:](self, "_getMovieFileOutputNANDDataRate:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "connectionWithMediaType:", v8));
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](recordingMovieFileOutputs, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }
  v15 = v9 < 283392001;
  if (v9 <= 283392000)
    -[NSMutableArray addObject:](self->_internal->recordingMovieFileOutputs, "addObject:", a3);
  os_unfair_lock_unlock(&self->_internal->recordingMovieFileOutputsLock);
  return v15;
}

- (void)movieFileOutputStoppedRecording:(id)a3
{
  os_unfair_lock_lock(&self->_internal->recordingMovieFileOutputsLock);
  if (-[NSMutableArray containsObject:](self->_internal->recordingMovieFileOutputs, "containsObject:", a3))-[NSMutableArray removeObject:](self->_internal->recordingMovieFileOutputs, "removeObject:", a3);
  os_unfair_lock_unlock(&self->_internal->recordingMovieFileOutputsLock);
}

- (int)_getMovieFileOutputNANDDataRate:(id)a3
{
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CMVideoDimensions Dimensions;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27 = *MEMORY[0x1E0CA2E18];
  v4 = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
  v28 = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = (void *)objc_msgSend(a3, "inputPorts");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    v9 = *MEMORY[0x1E0CF2B90];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v11, "mediaType"), "isEqual:", v9))
        {
          v12 = (void *)objc_msgSend(v11, "input");
          if (v12)
          {
            objc_msgSend(v12, "videoMinFrameDurationOverride");
            LOBYTE(v4) = v21;
          }
          else
          {
            LOBYTE(v4) = 0;
            v17 = 0;
            v19 = 0;
          }
          v27 = v17;
          v28 = v19;
          goto LABEL_14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_14:
  v13 = (void *)objc_msgSend((id)objc_msgSend(a3, "sourceDevice"), "activeFormat");
  v14 = v13;
  v18 = 0;
  v20 = 0;
  if ((v4 & 1) != 0)
  {
    v18 = v27;
    v20 = v28;
  }
  else if (v13)
  {
    objc_msgSend(v13, "lowestSupportedVideoFrameDuration");
  }
  Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v14, "formatDescription"));
  return (int)(float)((float)((float)v20 / (float)v18) * (float)(Dimensions.height * Dimensions.width));
}

- (float)_memoryCost
{
  int v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  float v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  uint64_t v29;
  char v30;
  char v31;
  int v32;
  int v33;
  unsigned int v34;
  int v35;
  AVCaptureSession *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = FigCapturePlatformIdentifier();
  v4 = -[AVCaptureSession _livePortSetsByDeviceInput](self, "_livePortSetsByDeviceInput");
  v37 = self;
  v38 = -[AVCaptureSession _devicesProvidingDepthData](self, "_devicesProvidingDepthData");
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v53;
    v8 = *MEMORY[0x1E0CF2B90];
    if (v3 >= 6)
      v9 = 1.0;
    else
      v9 = 1.25;
    if (v3 <= 6)
      v10 = 1.0;
    else
      v10 = 1.2;
    v11 = 300;
    v39 = *MEMORY[0x1E0CF2B90];
    v40 = *(_QWORD *)v53;
    do
    {
      v12 = 0;
      v41 = v6;
      do
      {
        if (*(_QWORD *)v53 != v7)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v12);
        v14 = (void *)objc_msgSend(v13, "device");
        if (objc_msgSend(v14, "hasMediaType:", v8))
        {
          v15 = objc_msgSend(v14, "isVirtualDevice");
          v42 = v11;
          if ((v15 & 1) != 0)
          {
            v16 = (void *)objc_msgSend(v14, "constituentDevices");
            v17 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
            if (objc_msgSend(v38, "containsObject:", v14))
            {
              if ((__CFString *)objc_msgSend(v14, "deviceType") != CFSTR("AVCaptureDeviceTypeBuiltInLiDARDepthCamera"))
              {
                v50 = 0u;
                v51 = 0u;
                v48 = 0u;
                v49 = 0u;
                v18 = (void *)objc_msgSend(v14, "constituentDevices");
                v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
                if (v19)
                {
                  v20 = v19;
                  v21 = *(_QWORD *)v49;
                  do
                  {
                    for (i = 0; i != v20; ++i)
                    {
                      if (*(_QWORD *)v49 != v21)
                        objc_enumerationMutation(v18);
                      objc_msgSend(v17, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "deviceType"));
                    }
                    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
                  }
                  while (v20);
                }
              }
            }
          }
          else
          {
            v17 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v16 = 0;
          }
          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          v23 = (void *)objc_msgSend(obj, "objectForKeyedSubscript:", v13);
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v45;
            do
            {
              for (j = 0; j != v25; ++j)
              {
                if (*(_QWORD *)v45 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
                if ((objc_msgSend(v17, "containsObject:", objc_msgSend(v28, "sourceDeviceType")) & 1) == 0)
                  objc_msgSend(v17, "addObject:", objc_msgSend(v28, "sourceDeviceType"));
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
            }
            while (v25);
          }
          v29 = objc_msgSend(v17, "count");
          if (v15)
          {
            v8 = v39;
            v7 = v40;
            if (objc_msgSend(v17, "containsObject:", objc_msgSend(v14, "deviceType")))
              v29 = (__PAIR128__(v29, objc_msgSend(v16, "count")) - (unint64_t)v29) >> 64;
          }
          else
          {
            v8 = v39;
            v7 = v40;
          }
          v30 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "activeFormat"), "figCaptureSourceVideoFormat"), "isVideoHDRFusionSupported");
          v31 = objc_msgSend(v14, "isVideoHDREnabled") | v30;
          v32 = 5 * v29 + 2 * (objc_msgSend(v16, "count") - v29);
          v33 = objc_msgSend((id)objc_msgSend(v14, "activeFormat"), "sensorDimensions");
          v11 = v42
              + (float)((float)(v10
                                            * (float)(v9
                                                    * (float)(int)((((unint64_t)objc_msgSend((id)objc_msgSend(v14, "activeFormat"), "sensorDimensions") >> 32)* v33) << v31)))* 0.00000095367)* v32;
          v6 = v41;
        }
        ++v12;
      }
      while (v12 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v6);
  }
  else
  {
    v11 = 300;
  }
  v34 = -[AVCaptureSession _computeMemoryUsageForOutputs](v37, "_computeMemoryUsageForOutputs");
  if ((int)((unint64_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "physicalMemory") >> 30) >= 5)
    v35 = 2100;
  else
    v35 = 1800;
  return (float)(int)(v34 + v11) / (float)v35;
}

- (unsigned)_computeMemoryUsageForOutputs
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  int v17;
  float v18;
  float v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  uint64_t v29;
  unsigned int v30;
  void *v31;
  int v32;
  int v33;
  float width;
  float height;
  unsigned int v36;
  float v37;
  int v38;
  float v39;
  float v40;
  int v41;
  int v42;
  uint64_t v43;
  BOOL v44;
  int v45;
  float v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  int v54;
  int v55;
  float v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  void *v62;
  void *v63;
  uint64_t v64;
  float v65;
  NSArray *obj;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  id v79;
  unsigned int v80;
  CMVideoDimensions Dimensions;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  obj = -[AVCaptureSession connections](self, "connections");
  v69 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v100, v107, 16);
  v2 = 0;
  if (v69)
  {
    v68 = *(_QWORD *)v101;
    v3 = *MEMORY[0x1E0CF2B90];
    v73 = *MEMORY[0x1E0CA90E0];
    v72 = *MEMORY[0x1E0CA8FD8];
    v71 = *MEMORY[0x1E0CA9040];
    v74 = *MEMORY[0x1E0CF2B90];
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v101 != v68)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v4);
        v70 = v4;
        if (!objc_msgSend(v5, "isActive"))
          goto LABEL_88;
        v6 = objc_msgSend(v5, "output");
        objc_opt_class();
        v77 = v5;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_74;
            v88 = 0u;
            v89 = 0u;
            v86 = 0u;
            v87 = 0u;
            v47 = (void *)objc_msgSend(v5, "inputPorts");
            v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v86, v105, 16);
            if (!v48)
              goto LABEL_74;
            v49 = v48;
            v50 = *(_QWORD *)v87;
            while (2)
            {
              v51 = 0;
LABEL_64:
              if (*(_QWORD *)v87 != v50)
                objc_enumerationMutation(v47);
              v52 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v51);
              if (objc_msgSend((id)objc_msgSend(v52, "mediaType"), "isEqual:", v3))
              {
                v53 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v52, "input"), "videoDevice"), "activeFormat");
                if (FigCapturePlatformSupportsUniversalCompression())
                {
                  objc_msgSend(MEMORY[0x1E0D03BA8], "stillImageMaxLossyCompressionLevel");
                  goto LABEL_70;
                }
                if (FigCapturePlatformSupportsHTPC16x8Compression())
LABEL_70:
                  FigCaptureCompressedPixelFormatForPixelFormat();
                v93 = 0;
                objc_msgSend((id)objc_msgSend((id)objc_msgSend(v53, "supportedMaxPhotoDimensions"), "lastObject"), "getValue:", &v93);
                v54 = HIDWORD(v93);
                v55 = v93;
                FigCapturePixelFormatBytesPerPixel();
                v2 += 3 * (int)(float)((float)(v56 * (float)(v54 * v55)) * 0.00000095367) + 120;
              }
              if (v49 == ++v51)
              {
                v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v86, v105, 16);
                if (!v49)
                  goto LABEL_74;
                continue;
              }
              goto LABEL_64;
            }
          }
        }
        v98 = 0u;
        v99 = 0u;
        v96 = 0u;
        v97 = 0u;
        v79 = (id)objc_msgSend(v5, "inputPorts");
        v7 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v97;
          v75 = *(_QWORD *)v97;
          v76 = (void *)v6;
          do
          {
            v10 = 0;
            v78 = v8;
            do
            {
              if (*(_QWORD *)v97 != v9)
                objc_enumerationMutation(v79);
              v11 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v10);
              if (!objc_msgSend((id)objc_msgSend(v11, "mediaType"), "isEqual:", v3))
                goto LABEL_57;
              v12 = (void *)objc_msgSend(v11, "input");
              v13 = (void *)objc_msgSend((id)objc_msgSend(v12, "videoDevice"), "activeFormat");
              v14 = (void *)objc_msgSend(v13, "figCaptureSourceVideoFormat");
              Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v13, "formatDescription"));
              v93 = 0;
              v94 = 0;
              v95 = 0;
              if (v12)
              {
                objc_msgSend(v12, "videoMinFrameDurationOverride");
                if ((v91 & 0x100000000) != 0)
                {
                  objc_msgSend(v12, "videoMinFrameDurationOverride");
                  goto LABEL_22;
                }
              }
              else
              {
                v90 = 0;
                v91 = 0;
                v92 = 0;
              }
              if (v13)
              {
                objc_msgSend(v13, "lowestSupportedVideoFrameDuration");
              }
              else
              {
                v93 = 0;
                v94 = 0;
                v95 = 0;
              }
LABEL_22:
              v15 = v94;
              v16 = v93;
              v17 = objc_msgSend(v77, "clientRetainedBufferCount");
              v18 = 0.0;
              v19 = 0.0;
              switch(objc_msgSend(v77, "activeVideoStabilizationMode"))
              {
                case 1:
                  if (objc_msgSend(v14, "stabilizationTypeOverrideForStandard") != 1)
                  {
                    objc_msgSend(v14, "stabilizationOverscanPercentageOverrideForStandard");
                    if (v28 == 0.0)
                      v19 = 10.0;
                    else
                      v19 = v28;
                    goto LABEL_39;
                  }
                  v20 = v2;
                  v21 = v3;
                  v22 = 8;
                  goto LABEL_40;
                case 2:
                  objc_msgSend(v14, "stabilizationOverscanPercentageOverrideForCinematic");
                  if (v25 == 0.0)
                    v19 = 20.0;
                  else
                    v19 = v25;
                  v18 = 0.5;
                  goto LABEL_39;
                case 3:
                  objc_msgSend(v14, "cinematicStabilizationExtendedLookAheadDuration");
                  v18 = v23;
                  objc_msgSend(v14, "stabilizationOverscanPercentageOverrideForCinematic");
                  if (v24 == 0.0)
                    v19 = 20.0;
                  else
                    v19 = v24;
                  goto LABEL_39;
                case 4:
                  goto LABEL_39;
                case 5:
                  objc_msgSend(v14, "cinematicStabilizationExtendedLookAheadDuration");
                  v18 = v26;
                  objc_msgSend(v14, "stabilizationOverscanPercentageOverrideForCinematicExtendedEnhanced");
                  if (v27 == 0.0)
                    v19 = 28.0;
                  else
                    v19 = v27;
                  goto LABEL_39;
                default:
                  v19 = 0.0;
LABEL_39:
                  v20 = v2;
                  v21 = v3;
                  v22 = (float)((float)((float)((float)v15 / (float)v16) * v18) + 10.0);
LABEL_40:
                  v80 = v22;
                  v29 = objc_msgSend(v14, "format");
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v30 = v20;
                    v31 = (void *)objc_msgSend(v76, "videoSettings");
                    v32 = objc_msgSend((id)objc_msgSend(v31, "objectForKeyedSubscript:", v73), "intValue");
                    v33 = objc_msgSend((id)objc_msgSend(v31, "objectForKeyedSubscript:", v72), "intValue");
                    objc_msgSend((id)objc_msgSend(v31, "objectForKeyedSubscript:", v71), "intValue");
                    if (FigCapturePlatformSupportsUniversalCompression())
                    {
                      objc_msgSend(MEMORY[0x1E0D03BA8], "videoDataMaxLossyCompressionLevel");
                      goto LABEL_49;
                    }
                    if (FigCapturePlatformSupportsHTPC16x8Compression())
LABEL_49:
                      FigCaptureCompressedPixelFormatForPixelFormat();
                    FigCapturePixelFormatBytesPerPixel();
                    v38 = (v17 + 2) * (int)(float)((float)(v39 * (float)(v33 * v32)) * 0.00000095367);
                    width = (float)Dimensions.width;
                    height = (float)Dimensions.height;
                    v36 = v30;
                    v3 = v74;
                    goto LABEL_51;
                  }
                  if (FigCapturePlatformSupportsUniversalCompression())
                  {
                    objc_msgSend(MEMORY[0x1E0D03BA8], "movieFileMaxLossyCompressionLevelForPixelFormat:", v29);
                    FigCaptureCompressedPixelFormatForPixelFormat();
                    v3 = v21;
                  }
                  else
                  {
                    v3 = v21;
                    if (FigCapturePlatformSupportsHTPC16x8Compression())
                      FigCaptureCompressedPixelFormatForPixelFormat();
                  }
                  width = (float)Dimensions.width;
                  height = (float)Dimensions.height;
                  v36 = v20
                      + (int)(float)((float)((float)((float)((float)Dimensions.width * 16.5) * (float)Dimensions.height)
                                           + 17.0)
                                   * 0.00000095367);
                  FigCapturePixelFormatBytesPerPixel();
                  v38 = (v17 + 11)
                      * (int)(float)((float)(v37 * (float)(Dimensions.height * Dimensions.width)) * 0.00000095367);
LABEL_51:
                  v40 = (float)(v19 / 100.0) + 1.0;
                  v41 = (int)(float)(v40 * width);
                  v42 = (int)(float)(v40 * height);
                  v43 = objc_msgSend(v14, "sensorDimensions");
                  v44 = v41 <= (int)v43;
                  if (v41 >= (int)v43)
                    v41 = v43;
                  if (v44)
                    v45 = v42;
                  else
                    v45 = HIDWORD(v43);
                  FigCapturePixelFormatBytesPerPixel();
                  v2 = v36 + v38 + v80 * (int)(float)((float)(v46 * (float)(v45 * v41)) * 0.00000095367);
                  v9 = v75;
                  v8 = v78;
                  break;
              }
LABEL_57:
              ++v10;
            }
            while (v8 != v10);
            v8 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
          }
          while (v8);
        }
LABEL_74:
        if (objc_msgSend(v77, "videoPreviewLayer"))
        {
          v84 = 0u;
          v85 = 0u;
          v82 = 0u;
          v83 = 0u;
          v57 = (void *)objc_msgSend(v77, "inputPorts");
          v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v82, v104, 16);
          if (v58)
          {
            v59 = v58;
            v60 = *(_QWORD *)v83;
            do
            {
              for (i = 0; i != v59; ++i)
              {
                if (*(_QWORD *)v83 != v60)
                  objc_enumerationMutation(v57);
                v62 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
                if (objc_msgSend((id)objc_msgSend(v62, "mediaType"), "isEqual:", v3))
                {
                  v63 = (void *)objc_msgSend(v62, "input");
                  v64 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v63, "videoDevice"), "activeFormat"), "figCaptureSourceVideoFormat"), "previewDimensions");
                  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v63, "videoDevice"), "activeFormat"), "figCaptureSourceVideoFormat"), "format");
                  if (FigCapturePlatformSupportsUniversalCompression())
                  {
                    objc_msgSend(MEMORY[0x1E0D03BA8], "previewMaxLossyCompressionLevel");
                    goto LABEL_84;
                  }
                  if (FigCapturePlatformSupportsHTPC16x8Compression())
LABEL_84:
                    FigCaptureCompressedPixelFormatForPixelFormat();
                  FigCapturePixelFormatBytesPerPixel();
                  v2 += 6 * (int)(float)((float)(v65 * (float)(HIDWORD(v64) * v64)) * 0.00000095367);
                  continue;
                }
              }
              v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v82, v104, 16);
            }
            while (v59);
          }
        }
LABEL_88:
        v4 = v70 + 1;
      }
      while (v70 + 1 != v69);
      v69 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v100, v107, 16);
    }
    while (v69);
  }
  return v2;
}

- (float)_encoderCost
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  char v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  unint64_t Dimensions;
  void *v18;
  int32_t v19;
  NSArray *obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = -[AVCaptureSession connections](self, "connections");
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v23)
  {
    v29 = 0;
    v22 = *(_QWORD *)v36;
    v2 = *MEMORY[0x1E0CF2B90];
    v27 = *MEMORY[0x1E0CA9040];
    v26 = *MEMORY[0x1E0CA90E0];
    v25 = *MEMORY[0x1E0CA8FD8];
    while (1)
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v36 != v22)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v3);
        v24 = v3;
        if (objc_msgSend(v4, "isActive"))
        {
          v5 = objc_msgSend(v4, "output");
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          objc_opt_class();
          v28 = (void *)v5;
          v7 = objc_opt_isKindOfClass();
          v8 = v7;
          if ((isKindOfClass & 1) != 0 || (v7 & 1) != 0)
          {
            v33 = 0u;
            v34 = 0u;
            v31 = 0u;
            v32 = 0u;
            v9 = (void *)objc_msgSend(v4, "inputPorts");
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            if (v10)
            {
              v11 = v10;
              v12 = *(_QWORD *)v32;
              do
              {
                for (i = 0; i != v11; ++i)
                {
                  if (*(_QWORD *)v32 != v12)
                    objc_enumerationMutation(v9);
                  v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
                  if (objc_msgSend((id)objc_msgSend(v14, "mediaType"), "isEqual:", v2))
                  {
                    v15 = (void *)objc_msgSend(v14, "input");
                    v16 = (void *)objc_msgSend((id)objc_msgSend(v15, "videoDevice"), "activeFormat");
                    Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v16, "formatDescription"));
                    if ((v8 & 1) == 0)
                    {
                      v19 = Dimensions;
                      v18 = (void *)HIDWORD(Dimensions);
LABEL_20:
                      if (v15)
                      {
                        objc_msgSend(v15, "videoMinFrameDurationOverride");
                        if ((v30 & 1) != 0)
                        {
                          objc_msgSend(v15, "videoMinFrameDurationOverride");
LABEL_26:
                          v29 += (float)((float)((float)0 / (float)0) * (float)((int)v18 * v19));
                          continue;
                        }
                      }
                      else
                      {
                        v30 = 0;
                      }
                      if (v16)
                        objc_msgSend(v16, "lowestSupportedVideoFrameDuration");
                      goto LABEL_26;
                    }
                    v18 = (void *)objc_msgSend(v28, "videoSettings");
                    objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v27), "intValue");
                    if (FigCapturePixelFormatIsTenBit() && FigCapturePixelFormatIs422())
                    {
                      v19 = objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v26), "intValue");
                      LODWORD(v18) = objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v25), "intValue");
                      goto LABEL_20;
                    }
                  }
                }
                v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              }
              while (v11);
            }
          }
        }
        v3 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (!v23)
        return (float)v29 / 497660000.0;
    }
  }
  v29 = 0;
  return (float)v29 / 497660000.0;
}

- (float)_videoAndMovieOutputCost
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char isKindOfClass;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  CMVideoDimensions Dimensions;
  unsigned int v23;
  unsigned int v24;
  float result;
  NSArray *obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = -[AVCaptureSession connections](self, "connections");
  v28 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  v2 = 0;
  v3 = 0;
  v4 = 0;
  if (v28)
  {
    v27 = *(_QWORD *)v38;
    v5 = *MEMORY[0x1E0CF2B90];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v38 != v27)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v6);
        v29 = v6;
        if (objc_msgSend(v7, "isActive"))
        {
          objc_msgSend(v7, "output");
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          objc_opt_class();
          v9 = objc_opt_isKindOfClass();
          if ((isKindOfClass & 1) != 0 || (v9 & 1) != 0)
          {
            v35 = 0u;
            v36 = 0u;
            v33 = 0u;
            v34 = 0u;
            v31 = (id)objc_msgSend(v7, "inputPorts");
            v10 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            if (v10)
            {
              v11 = v10;
              v12 = *(_QWORD *)v34;
              do
              {
                v13 = 0;
                v30 = v11;
                do
                {
                  if (*(_QWORD *)v34 != v12)
                    objc_enumerationMutation(v31);
                  v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v13);
                  if (objc_msgSend((id)objc_msgSend(v14, "mediaType"), "isEqual:", v5))
                  {
                    v15 = v5;
                    v16 = v4;
                    v17 = v3;
                    v18 = v2;
                    v19 = v7;
                    v20 = (void *)objc_msgSend(v14, "input");
                    v21 = (void *)objc_msgSend((id)objc_msgSend(v20, "videoDevice"), "activeFormat");
                    Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v21, "formatDescription"));
                    if (v20)
                    {
                      objc_msgSend(v20, "videoMinFrameDurationOverride");
                      if ((v32 & 1) != 0)
                      {
                        objc_msgSend(v20, "videoMinFrameDurationOverride");
LABEL_21:
                        v7 = v19;
                        v23 = (float)((float)((float)0 / (float)0)
                                                  * (float)(Dimensions.height * Dimensions.width));
                        v4 = v16 + v23;
                        if (objc_msgSend(v7, "activeVideoStabilizationMode"))
                          v24 = v23;
                        else
                          v24 = 0;
                        v2 = v24 + v18;
                        v3 = v17 + 1;
                        v5 = v15;
                        v11 = v30;
                        goto LABEL_25;
                      }
                    }
                    else
                    {
                      v32 = 0;
                    }
                    if (v21)
                      objc_msgSend(v21, "lowestSupportedVideoFrameDuration");
                    goto LABEL_21;
                  }
LABEL_25:
                  ++v13;
                }
                while (v11 != v13);
                v11 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
              }
              while (v11);
            }
          }
        }
        v6 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v28);
  }
  result = (float)v3
         / (float)(AVGestaltGetIntegerAnswerWithDefault((uint64_t)CFSTR("AVGQCaptureSessionMaxMultiCamRGBStreamsSupported"), 1)+ 1);
  if ((float)((float)v4 / 995330000.0) > result)
    result = (float)v4 / 995330000.0;
  if (result <= (float)((float)v2 / 497660000.0))
    return (float)v2 / 497660000.0;
  return result;
}

- (id)_livePortSetsByDeviceInput
{
  const __CFDictionary *Mutable;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  const void *v12;
  void *Value;
  NSArray *obj;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = -[AVCaptureSession connections](self, "connections");
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(obj);
        v18 = v4;
        v5 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v4);
        if (objc_msgSend(v5, "isLive"))
        {
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          v6 = (void *)objc_msgSend(v5, "inputPorts");
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v7)
          {
            v8 = v7;
            v9 = *(_QWORD *)v20;
            do
            {
              for (i = 0; i != v8; ++i)
              {
                if (*(_QWORD *)v20 != v9)
                  objc_enumerationMutation(v6);
                v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
                objc_msgSend(v11, "input");
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v12 = (const void *)objc_msgSend(v11, "input");
                  Value = (void *)CFDictionaryGetValue(Mutable, v12);
                  if (!Value)
                  {
                    Value = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
                    CFDictionaryAddValue(Mutable, v12, Value);
                  }
                  objc_msgSend(Value, "addObject:", v11);
                }
              }
              v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v8);
          }
        }
        v4 = v18 + 1;
      }
      while (v18 + 1 != v17);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v17);
  }
  return Mutable;
}

- (id)_devicesProvidingDepthData
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  NSArray *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = -[AVCaptureSession connections](self, "connections");
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    v7 = *MEMORY[0x1E0CF2B70];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v9, "output");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          v10 = (void *)objc_msgSend(v9, "inputPorts");
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v20;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v20 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
                if (objc_msgSend((id)objc_msgSend(v15, "mediaType"), "isEqual:", v7))
                {
                  v16 = (void *)objc_msgSend(v15, "input");
                  if ((objc_msgSend(v3, "containsObject:", objc_msgSend(v16, "device")) & 1) == 0)
                    objc_msgSend(v3, "addObject:", objc_msgSend(v16, "device"));
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v12);
          }
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }
  return v3;
}

- (id)valueForUndefinedKey:(id)a3
{
  objc_super v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("masterClock")))
    return -[AVCaptureSession masterClock](self, "masterClock");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("synchronizationClock")))
    return -[AVCaptureSession synchronizationClock](self, "synchronizationClock");
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureSession;
  return -[AVCaptureSession valueForUndefinedKey:](&v6, sel_valueForUndefinedKey_, a3);
}

+ (BOOL)automaticallyNotifiesObserversOfSynchronizationClock
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfMasterClock
{
  return 0;
}

- (BOOL)_sessionHasRecordingFileOutput
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = -[AVCaptureSession outputs](self, "outputs", 0);
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v7, "isRecording") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return v3;
}

- (void)_teardownFigCaptureSession
{
  AVCaptureSessionInternal *internal;
  void *v4;
  AVCaptureSessionInternal *v5;
  AVWeakReference *weakReference;
  OpaqueFigCaptureSession *figCaptureSession;
  void (*v8)(OpaqueFigCaptureSession *);
  OpaqueFigCaptureSession *v9;
  FigCaptureSessionConfiguration *sessionConfig;

  internal = self->_internal;
  if (internal->figCaptureSession)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v5 = self->_internal;
    weakReference = v5->weakReference;
    objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", weakReference, avcaptureFigCaptureSessionNotification, *MEMORY[0x1E0D04448], v5->figCaptureSession);
    objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", weakReference, avcaptureFigCaptureSessionNotification, *MEMORY[0x1E0D04450], self->_internal->figCaptureSession);
    objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", weakReference, avcaptureFigCaptureSessionNotification, *MEMORY[0x1E0D04468], self->_internal->figCaptureSession);
    objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", weakReference, avcaptureFigCaptureSessionNotification, *MEMORY[0x1E0D04458], self->_internal->figCaptureSession);
    objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", weakReference, avcaptureFigCaptureSessionNotification, *MEMORY[0x1E0D04460], self->_internal->figCaptureSession);
    if (AVCaptureIsRunningInMediaserverd())
    {
      figCaptureSession = self->_internal->figCaptureSession;
      if (figCaptureSession)
      {
        v8 = *(void (**)(OpaqueFigCaptureSession *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
        if (v8)
          v8(figCaptureSession);
      }
    }
    internal = self->_internal;
    v9 = internal->figCaptureSession;
    if (v9)
    {
      CFRelease(v9);
      self->_internal->figCaptureSession = 0;
      internal = self->_internal;
    }
    sessionConfig = internal->sessionConfig;
    if (sessionConfig)
    {

      self->_internal->sessionConfig = 0;
      internal = self->_internal;
    }
  }
  internal->figCaptureSessionRunning = 0;
  self->_internal->figCaptureSessionStarted = 0;
  -[AVCaptureSession _setSynchronizationClock:](self, "_setSynchronizationClock:", 0);
}

- (void)_removeConnectionsForInputPort:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[NSMutableArray copy](self->_internal->connections, "copy");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v11 = (void *)objc_msgSend(v10, "inputPorts");
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v18;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v18 != v14)
                objc_enumerationMutation(v11);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15), "isEqual:", a3)
                && objc_msgSend((id)objc_msgSend(v10, "inputPorts"), "count") == 1)
              {
                -[AVCaptureSession _removeConnection:](self, "_removeConnection:", v10);
              }
              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v13);
        }
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

}

- (id)liveSessionConnectedVideoCaptureDevices
{
  void *v3;
  NSMutableArray *connections;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  AVCaptureSessionInternal *obj;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  obj = self->_internal;
  objc_sync_enter(obj);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  connections = self->_internal->connections;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(connections);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isLive", obj))
        {
          if (objc_msgSend(v9, "sourceDevice"))
          {
            v12[0] = v7;
            v12[1] = 3221225472;
            v12[2] = __59__AVCaptureSession_liveSessionConnectedVideoCaptureDevices__block_invoke;
            v12[3] = &unk_1E421D498;
            v12[4] = v9;
            if (objc_msgSend(v3, "indexOfObjectPassingTest:", v12) == 0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend(v3, "addObject:", objc_msgSend(v9, "sourceDevice"));
          }
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  objc_sync_exit(obj);
  return v3;
}

uint64_t __59__AVCaptureSession_liveSessionConnectedVideoCaptureDevices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "uniqueID"), "isEqualToString:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sourceDevice"), "uniqueID"));
}

- (id)_stopError
{
  return self->_internal->stopError;
}

- (void)_postRuntimeError:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  _QWORD v10[23];

  v10[22] = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED6A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v7, v8);
  v9 = CFSTR("AVCaptureSessionErrorKey");
  v10[0] = a3;
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("AVCaptureSessionRuntimeErrorNotification"), self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
}

- (void)_handleCenterStageActiveChangedForDevice:(id)a3
{
  NSMutableArray *outputs;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  outputs = self->_internal->outputs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputs, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(outputs);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "handleCenterStageActiveChangedForDevice:", a3);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputs, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)_handleBackgroundBlurActiveChangedForDevice:(id)a3
{
  NSMutableArray *outputs;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[AVCaptureSession _handleVideoEffectFrameRateThrottling:](self, "_handleVideoEffectFrameRateThrottling:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  outputs = self->_internal->outputs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputs, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(outputs);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "handleBackgroundBlurActiveChangedForDevice:", a3);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputs, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)_handleStudioLightingActiveChangedForDevice:(id)a3
{
  NSMutableArray *outputs;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[AVCaptureSession _handleVideoEffectFrameRateThrottling:](self, "_handleVideoEffectFrameRateThrottling:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  outputs = self->_internal->outputs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputs, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(outputs);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "handleStudioLightingActiveChangedForDevice:", a3);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputs, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)_handleReactionEffectsActiveChangedForDevice:(id)a3
{
  NSMutableArray *outputs;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  outputs = self->_internal->outputs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputs, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(outputs);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "handleReactionEffectsActiveChangedForDevice:", a3);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputs, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)_handleBackgroundReplacementActiveChangedForDevice:(id)a3
{
  NSMutableArray *outputs;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[AVCaptureSession _handleVideoEffectFrameRateThrottling:](self, "_handleVideoEffectFrameRateThrottling:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  outputs = self->_internal->outputs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputs, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(outputs);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "handleBackgroundReplacementActiveChangedForDevice:", a3);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputs, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)_handleVideoEffectFrameRateThrottling:(id)a3
{
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = MEMORY[0x1E0CA2E18];
  v19 = *MEMORY[0x1E0CA2E18];
  v20 = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  if ((objc_msgSend(a3, "isBackgroundBlurActive") & 1) != 0 || (objc_msgSend(a3, "isStudioLightActive") & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(a3, "isBackgroundReplacementActive");
  v7 = objc_msgSend(a3, "isActiveVideoMinFrameDurationSet");
  v8 = objc_msgSend(a3, "isActiveVideoMaxFrameDurationSet");
  if (v6)
  {
    v9 = *(_DWORD *)(v5 + 12);
    v10 = *(_QWORD *)(v5 + 16);
    if (a3)
    {
      objc_msgSend(a3, "activeVideoMinFrameDuration");
      v11 = HIDWORD(v17);
      v12 = v18;
    }
    else
    {
      v12 = 0;
      v11 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
    }
    v21 = v16;
    v22 = v17;
    if ((v11 & 1) != 0)
      goto LABEL_31;
LABEL_20:
    if ((v9 & 1) == 0)
      return;
    goto LABEL_21;
  }
  v13 = v8;
  v14 = (void *)objc_msgSend(a3, "activeFormat");
  if (v14)
  {
    objc_msgSend(v14, "defaultActiveMinFrameDurationForSessionPreset:", self->_internal->sessionPreset);
    v11 = HIDWORD(v17);
    v12 = v18;
  }
  else
  {
    v12 = 0;
    v11 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
  }
  v21 = v16;
  v22 = v17;
  v15 = (void *)objc_msgSend(a3, "activeFormat", v16, v17);
  if (v15)
  {
    objc_msgSend(v15, "defaultActiveMaxFrameDurationForSessionPreset:", self->_internal->sessionPreset);
    v9 = HIDWORD(v17);
    v10 = v18;
  }
  else
  {
    v10 = 0;
    v9 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
  }
  v19 = v16;
  v20 = v17;
  if (v7)
  {
    if (a3)
    {
      objc_msgSend(a3, "activeVideoMinFrameDurationSetByClient");
      v11 = HIDWORD(v17);
      v12 = v18;
    }
    else
    {
      v12 = 0;
      v11 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
    }
    v21 = v16;
    v22 = v17;
    if (!v13)
    {
LABEL_19:
      if ((v11 & 1) != 0)
        goto LABEL_31;
      goto LABEL_20;
    }
  }
  else if (!v13)
  {
    goto LABEL_19;
  }
  if (a3)
  {
    objc_msgSend(a3, "activeVideoMaxFrameDurationSetByClient");
    v9 = HIDWORD(v17);
    v10 = v18;
  }
  else
  {
    v10 = 0;
    v9 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
  }
  v19 = v16;
  v20 = v17;
  if ((v11 & 1) == 0)
    goto LABEL_20;
LABEL_31:
  v16 = v21;
  v17 = __PAIR64__(v11, v22);
  v18 = v12;
  objc_msgSend(a3, "_setActiveVideoMinFrameDuration:", &v16);
  if ((v9 & 1) == 0)
    return;
LABEL_21:
  v16 = v19;
  v17 = __PAIR64__(v9, v20);
  v18 = v10;
  objc_msgSend(a3, "_setActiveVideoMaxFrameDuration:", &v16);
}

- (void)_stopAndTearDownGraph
{
  AVCaptureSessionInternal *internal;
  AVCaptureSessionInternal *v4;

  internal = self->_internal;
  if (internal->figCaptureSessionStarted)
  {
    -[AVCaptureSession _stopFigCaptureSession](self, "_stopFigCaptureSession");
  }
  else if (internal->running)
  {
    -[AVCaptureSession _notifySessionStopped](self, "_notifySessionStopped");
  }
  v4 = self->_internal;
  objc_sync_enter(v4);
  -[AVCaptureSession _makeConfigurationLive:](self, "_makeConfigurationLive:", 0);
  -[AVCaptureSession _setSynchronizationClock:](self, "_setSynchronizationClock:", 0);

  self->_internal->sessionConfig = 0;
  objc_sync_exit(v4);
}

- (void)_notifySessionStopped
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (self->_internal->running)
  {
    -[AVCaptureSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("running"));
    self->_internal->running = 0;
    -[AVCaptureSession _invalidateControlsOverlay](self, "_invalidateControlsOverlay");
    -[AVCaptureSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("running"));
    if (dword_1ECFED6A0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v4, v5), "postNotificationName:object:", CFSTR("AVCaptureSessionDidStopRunningNotification"), self);
  }
}

- (void)_handleDidStopRunningNotificationWithPayload:(id)a3
{
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  AVCaptureSessionInternal *internal;
  BOOL *p_waitingForFigCaptureSessionToStop;
  _BOOL4 v12;
  _BOOL4 waitingForFigCaptureSessionToStop;
  uint64_t v14;
  char v15;
  AVCaptureSessionInternal *v16;
  AVCaptureSessionInternal *v17;

  v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04368]), "intValue");
  v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04360]), "intValue");
  v7 = 0;
  v8 = 1;
  if (v5 > -16403)
  {
    if (v5 == -16402)
    {
      -[AVCaptureSession _setInterrupted:withReason:](self, "_setInterrupted:withReason:", 1, v6);
      v8 = 0;
      v7 = -16402;
      goto LABEL_10;
    }
    v9 = -15545;
  }
  else
  {
    if (v5 == -16409)
    {
      v8 = 0;
      v7 = 0;
      goto LABEL_10;
    }
    v9 = -16406;
  }
  if (v5 != v9)
  {
    v8 = 0;
    v7 = v5;
  }
LABEL_10:
  -[AVRunLoopCondition lock](self->_internal->runLoopCondition, "lock");
  internal = self->_internal;
  waitingForFigCaptureSessionToStop = internal->waitingForFigCaptureSessionToStop;
  p_waitingForFigCaptureSessionToStop = &internal->waitingForFigCaptureSessionToStop;
  v12 = waitingForFigCaptureSessionToStop;
  if (waitingForFigCaptureSessionToStop)
  {
    v14 = 0;
LABEL_24:
    *p_waitingForFigCaptureSessionToStop = 0;
    -[AVRunLoopCondition signal](self->_internal->runLoopCondition, "signal");
    goto LABEL_25;
  }
  if (v7)
  {
    if ((v7 + 16400) < 0xFFFFFFFE)
    {
LABEL_20:
      v14 = AVLocalizedErrorWithUnderlyingOSStatus();
      goto LABEL_21;
    }
  }
  else
  {
    if (self->_internal->waitingForFigCaptureSessionToStart)
      v15 = v8;
    else
      v15 = 1;
    if ((v15 & 1) == 0)
      goto LABEL_20;
  }
  v14 = 0;
LABEL_21:
  v16 = self->_internal;
  if (v16->waitingForFigCaptureSessionToStart || v16->waitingForFigCaptureSessionConfigurationToBecomeLive)
  {
    v16->waitingForFigCaptureSessionToStart = 0;
    p_waitingForFigCaptureSessionToStop = &self->_internal->waitingForFigCaptureSessionConfigurationToBecomeLive;
    goto LABEL_24;
  }
LABEL_25:
  self->_internal->figCaptureSessionRunning = 0;
  -[AVRunLoopCondition unlock](self->_internal->runLoopCondition, "unlock");
  if (v14)
    -[AVCaptureSession _postRuntimeError:](self, "_postRuntimeError:", v14);
  v17 = self->_internal;
  objc_sync_enter(v17);
  if (!-[AVCaptureSession isBeingConfigured](self, "isBeingConfigured"))
  {

    self->_internal->sessionConfig = (FigCaptureSessionConfiguration *)-[AVCaptureSession _figCaptureSessionConfiguration](self, "_figCaptureSessionConfiguration");
  }
  objc_sync_exit(v17);
  if (!v12)
  {
    -[AVCaptureSession _notifySessionStopped](self, "_notifySessionStopped");
    if (v8)
    {
      -[AVCaptureSession _setInterrupted:withReason:](self, "_setInterrupted:withReason:", 0, 0);
      -[AVCaptureSession _notifyMediaServicesError](self, "_notifyMediaServicesError");
    }
  }
}

uint64_t __73__AVCaptureSession__handleConfigurationCommittedNotificationWithPayload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postRuntimeError:", AVLocalizedErrorWithUnderlyingOSStatus());
}

- (void)_notifyMediaServicesError
{
  -[AVCaptureSession _postRuntimeError:](self, "_postRuntimeError:", AVLocalizedError());
}

- (void)_handleCaptureServerConnectionDiedNotification
{
  __CFRunLoop *Main;
  uint64_t v4;
  __CFRunLoop *v5;
  uint64_t v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_internal->captureServerConnectionDiedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (-[AVCaptureSession notifiesOnMainThread](self, "notifiesOnMainThread", MEMORY[0x1E0C809B0], 3221225472, __66__AVCaptureSession__handleCaptureServerConnectionDiedNotification__block_invoke, &unk_1E42165A8, self))
  {
    Main = CFRunLoopGetMain();
    v4 = *MEMORY[0x1E0C9B270];
    v7[0] = *MEMORY[0x1E0CA3680];
    v7[1] = v4;
    CFRunLoopPerformBlock(Main, (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2), &v6);
    v5 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v5);
  }
  else
  {
    -[AVCaptureSession _reconnectAfterServerConnectionDied](self, "_reconnectAfterServerConnectionDied");
  }
}

uint64_t __66__AVCaptureSession__handleCaptureServerConnectionDiedNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reconnectAfterServerConnectionDied");
}

- (void)_reconnectAfterServerConnectionDied
{
  AVCaptureSessionInternal *internal;
  AVCaptureSessionInternal *v4;
  AVCaptureSessionConfiguration *v5;
  AVCaptureSessionInternal *v6;

  -[AVRunLoopCondition lock](self->_internal->runLoopCondition, "lock");
  internal = self->_internal;
  if (*(_WORD *)&internal->waitingForFigCaptureSessionToStart
    || internal->waitingForFigCaptureSessionConfigurationToBecomeLive)
  {
    internal->waitingForFigCaptureSessionToStart = 0;
    self->_internal->waitingForFigCaptureSessionToStop = 0;
    self->_internal->waitingForFigCaptureSessionConfigurationToBecomeLive = 0;
    -[AVRunLoopCondition signal](self->_internal->runLoopCondition, "signal");
    internal = self->_internal;
  }
  -[AVRunLoopCondition unlock](internal->runLoopCondition, "unlock");
  v4 = self->_internal;
  objc_sync_enter(v4);
  v5 = self->_internal->liveAVCaptureSessionConfiguration;
  -[NSArray makeObjectsPerformSelector:withObject:](-[AVCaptureSessionConfiguration outputs](v5, "outputs"), "makeObjectsPerformSelector:withObject:", sel_handleServerConnectionDeathForFigCaptureSession_, self->_internal->figCaptureSession);
  -[AVCaptureSession _makeConfigurationLive:](self, "_makeConfigurationLive:", 0);
  -[AVCaptureSession _teardownFigCaptureSession](self, "_teardownFigCaptureSession");
  -[AVCaptureSession _createFigCaptureSession](self, "_createFigCaptureSession");
  -[AVCaptureSession _makeConfigurationLive:](self, "_makeConfigurationLive:", v5);

  -[AVCaptureSession _determineSynchronizationClock](self, "_determineSynchronizationClock");
  objc_sync_exit(v4);
  v6 = self->_internal;
  if (v6->running || v6->interrupted)
  {
    -[AVCaptureSession _notifySessionStopped](self, "_notifySessionStopped");
    -[AVCaptureSession _setInterrupted:withReason:](self, "_setInterrupted:withReason:", 0, 0);
    -[AVCaptureSession _notifyMediaServicesError](self, "_notifyMediaServicesError");
  }
}

- (BOOL)_getSmartStyleRenderingSupported
{
  int IsContinuityCapture;
  NSMutableArray *inputs;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableArray *outputs;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    IsContinuityCapture = AVCaptureClientIsContinuityCapture();
    if (!IsContinuityCapture)
      return IsContinuityCapture;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  inputs = self->_internal->inputs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    v8 = *MEMORY[0x1E0CF2B90];
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v7)
        objc_enumerationMutation(inputs);
      v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "device");
        if ((objc_msgSend(v11, "hasMediaType:", v8) & 1) != 0)
          break;
      }
      if (v6 == ++v9)
      {
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v6)
          goto LABEL_5;
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    v11 = 0;
  }
  IsContinuityCapture = objc_msgSend((id)objc_msgSend(v11, "activeFormat"), "isSmartStyleRenderingSupported");
  if (!IsContinuityCapture)
    return IsContinuityCapture;
  if (!self->_internal->smartStyleInVideoModeEnabled)
  {
    IsContinuityCapture = objc_msgSend((id)objc_msgSend(v11, "activeFormat"), "isPhotoFormat");
    if (!IsContinuityCapture)
      return IsContinuityCapture;
  }
  if ((unint64_t)(objc_msgSend(v11, "imageControlMode") - 4) < 3)
    goto LABEL_17;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  outputs = self->_internal->outputs;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputs, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (!v13)
  {
    v15 = 0;
    v16 = 0;
    goto LABEL_39;
  }
  v14 = v13;
  v15 = 0;
  v16 = 0;
  v17 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v22 != v17)
        objc_enumerationMutation(outputs);
      v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
      if (v15)
      {
        if (!v16)
          goto LABEL_30;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v19;
        else
          v15 = 0;
        if (!v16)
        {
LABEL_30:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v16 = v19;
          else
            v16 = 0;
          if (!v16)
            continue;
        }
      }
      if (v15)
        goto LABEL_39;
    }
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputs, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  }
  while (v14);
LABEL_39:
  if ((objc_msgSend(v15, "isSpatialVideoCaptureEnabled") & 1) == 0)
  {
    LOBYTE(IsContinuityCapture) = objc_msgSend(v16, "isSpatialPhotoCaptureEnabled") ^ 1;
    return IsContinuityCapture;
  }
LABEL_17:
  LOBYTE(IsContinuityCapture) = 0;
  return IsContinuityCapture;
}

- (void)_updateSmartStyleRenderingStatusWithSkipRebuildGraph:(BOOL)a3
{
  AVCaptureSessionInternal *internal;
  AVCaptureSessionInternal *v6;
  int v7;
  int smartStyleRenderingEnabled;

  internal = self->_internal;
  objc_sync_enter(internal);
  self->_internal->smartStyleRenderingSupported = -[AVCaptureSession _getSmartStyleRenderingSupported](self, "_getSmartStyleRenderingSupported");
  v6 = self->_internal;
  if (v6->running && v6->smartStyleRenderingOptedOutDefault)
  {
    -[AVCaptureSession displaySmartStylesOptOutAlert](self, "displaySmartStylesOptOutAlert");
    v6 = self->_internal;
  }
  v7 = v6->smartStyleRenderingSupported && !v6->smartStyleRenderingOptedOut;
  smartStyleRenderingEnabled = v6->smartStyleRenderingEnabled;
  v6->smartStyleRenderingEnabled = v7;
  objc_sync_exit(internal);
  if (smartStyleRenderingEnabled != v7 && !a3)
    -[AVCaptureSession _rebuildGraph](self, "_rebuildGraph");
}

- (void)_activateControlsOverlayIfNecessary
{
  id v3;
  AVCaptureSessionInternal *internal;
  AVCaptureSessionInternal *v5;

  v3 = -[AVCaptureSession sessionVideoCaptureDevices](self, "sessionVideoCaptureDevices");
  internal = self->_internal;
  objc_sync_enter(internal);
  v5 = self->_internal;
  if (v5->running && -[NSMutableArray count](v5->controls, "count") && objc_msgSend(v3, "count"))
    -[AVCaptureControlsOverlay activate](self->_internal->controlsOverlay, "activate");
  objc_sync_exit(internal);
}

- (void)_invalidateControlsOverlay
{
  AVCaptureSessionInternal *internal;

  internal = self->_internal;
  objc_sync_enter(internal);
  -[AVCaptureControlsOverlay invalidate](self->_internal->controlsOverlay, "invalidate");
  objc_sync_exit(internal);
}

- (void)_updateControlsOverlay
{
  AVCaptureSessionInternal *internal;
  uint64_t v4;
  AVCaptureControlsOverlay *v5;
  __CFString *v6;
  char v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  _QWORD *v15;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVCaptureControlsOverlay *v17;
  id obj;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = -[AVWeakReference referencedObject](self->_internal->weakReferenceControlsDelegate, "referencedObject");
  obj = (id)-[NSMutableArray copy](self->_internal->controls, "copy");
  v5 = self->_internal->controlsOverlay;
  objc_sync_exit(internal);
  if (objc_msgSend(obj, "count"))
  {
    v6 = (__CFString *)AVCaptureCopyClientCodeSigningIdentifier();
    v7 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("com.apple.BarcodeScanner"));

    if ((v7 & 1) == 0 && !v4)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return;
    }
    v17 = v5;
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = -[AVCaptureSession liveSessionConnectedVideoCaptureDevices](self, "liveSessionConnectedVideoCaptureDevices");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (!v10)
      goto LABEL_19;
    v11 = *(_QWORD *)v23;
    v12 = MEMORY[0x1E0C809B0];
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21[0] = v12;
          v21[1] = 3221225472;
          v15 = v21;
          v21[2] = __42__AVCaptureSession__updateControlsOverlay__block_invoke;
          goto LABEL_15;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20[0] = v12;
          v20[1] = 3221225472;
          v15 = v20;
          v20[2] = __42__AVCaptureSession__updateControlsOverlay__block_invoke_2;
          goto LABEL_15;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19[0] = v12;
          v19[1] = 3221225472;
          v15 = v19;
          v19[2] = __42__AVCaptureSession__updateControlsOverlay__block_invoke_3;
LABEL_15:
          v15[3] = &unk_1E421D498;
          v15[4] = v14;
          if (objc_msgSend(v9, "indexOfObjectPassingTest:") == 0x7FFFFFFFFFFFFFFFLL)
            continue;
        }
        objc_msgSend(v8, "addObject:", v14);
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (!v10)
      {
LABEL_19:
        -[AVCaptureControlsOverlay updateControls:](v17, "updateControls:", v8);
        return;
      }
    }
  }
}

uint64_t __42__AVCaptureSession__updateControlsOverlay__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "uniqueID"), "isEqualToString:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "device"), "uniqueID"));
}

uint64_t __42__AVCaptureSession__updateControlsOverlay__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "uniqueID"), "isEqualToString:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "device"), "uniqueID"));
}

uint64_t __42__AVCaptureSession__updateControlsOverlay__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "uniqueID"), "isEqualToString:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "device"), "uniqueID"));
}

- (void)handleControlsOverlay:(id)a3 didChangeVisibility:(BOOL)a4 activeControl:(id)a5
{
  AVCaptureSessionInternal *internal;
  AVCaptureSessionInternal *v10;
  AVCaptureControlsOverlay *controlsOverlay;
  id v12;
  OS_dispatch_queue *v13;
  AVWeakReference *v14;
  _QWORD v17[7];
  BOOL v18;

  internal = self->_internal;
  objc_sync_enter(internal);
  v10 = self->_internal;
  controlsOverlay = v10->controlsOverlay;
  if (controlsOverlay == a3)
  {
    v12 = (id)-[AVWeakReference referencedObject](v10->weakReferenceControlsDelegate, "referencedObject");
    v13 = self->_internal->clientControlsQueue;
    v14 = self->_internal->weakReference;
  }
  else
  {
    v14 = 0;
    v13 = 0;
    v12 = 0;
  }
  objc_sync_exit(internal);
  if (controlsOverlay == a3 && v13 != 0 && v12 != 0)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __76__AVCaptureSession_handleControlsOverlay_didChangeVisibility_activeControl___block_invoke;
    v17[3] = &unk_1E421D4C0;
    v17[4] = v14;
    v17[5] = v12;
    v18 = a4;
    v17[6] = a5;
    dispatch_async((dispatch_queue_t)v13, v17);
  }
}

uint64_t __76__AVCaptureSession_handleControlsOverlay_didChangeVisibility_activeControl___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  int v5;
  int IsInternalTestTool;

  result = (uint64_t)(id)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  if (!result)
    return result;
  v3 = result;
  v4 = *(void **)(a1 + 40);
  if ((AVCaptureClientIsCameraOrDerivative() & 1) == 0)
  {
    IsInternalTestTool = AVCaptureClientIsInternalTestTool();
    v5 = IsInternalTestTool;
    if (*(_BYTE *)(a1 + 56))
      goto LABEL_6;
    if (!IsInternalTestTool)
      return objc_msgSend(*(id *)(a1 + 40), "sessionControlsDidBecomeInactive:", v3);
LABEL_12:
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "session:didChangeActiveControl:", v3, 0);
    return objc_msgSend(*(id *)(a1 + 40), "sessionControlsDidBecomeInactive:", v3);
  }
  if (!*(_BYTE *)(a1 + 56))
    goto LABEL_12;
  v5 = 1;
LABEL_6:
  result = objc_msgSend(*(id *)(a1 + 40), "sessionControlsDidBecomeActive:", v3);
  if (*(_QWORD *)(a1 + 48) && v5)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(v4, "session:didChangeActiveControl:", v3, *(_QWORD *)(a1 + 48));
  }
  return result;
}

- (void)handleControlsOverlay:(id)a3 didChangeInterfaceReduced:(BOOL)a4
{
  AVCaptureSessionInternal *internal;
  AVCaptureSessionInternal *v8;
  AVCaptureControlsOverlay *controlsOverlay;
  id v10;
  OS_dispatch_queue *v11;
  AVWeakReference *v12;
  _QWORD block[6];
  BOOL v16;

  internal = self->_internal;
  objc_sync_enter(internal);
  v8 = self->_internal;
  controlsOverlay = v8->controlsOverlay;
  if (controlsOverlay == a3)
  {
    v10 = (id)-[AVWeakReference referencedObject](v8->weakReferenceControlsDelegate, "referencedObject");
    v11 = self->_internal->clientControlsQueue;
    v12 = self->_internal->weakReference;
  }
  else
  {
    v12 = 0;
    v11 = 0;
    v10 = 0;
  }
  objc_sync_exit(internal);
  if (controlsOverlay == a3 && v11 != 0 && v10 != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__AVCaptureSession_handleControlsOverlay_didChangeInterfaceReduced___block_invoke;
    block[3] = &unk_1E421D198;
    v16 = a4;
    block[4] = v12;
    block[5] = v10;
    dispatch_async((dispatch_queue_t)v11, block);
  }
}

uint64_t __68__AVCaptureSession_handleControlsOverlay_didChangeInterfaceReduced___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = (uint64_t)(id)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  if (result)
  {
    v3 = result;
    if (*(_BYTE *)(a1 + 48))
    {
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
        return objc_msgSend(*(id *)(a1 + 40), "sessionControlsWillEnterFullscreenAppearance:", v3);
    }
    else
    {
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
        return objc_msgSend(*(id *)(a1 + 40), "sessionControlsWillExitFullscreenAppearance:", v3);
    }
  }
  return result;
}

- (void)handleControlsOverlay:(id)a3 didChangeActiveControl:(id)a4
{
  AVCaptureSessionInternal *internal;
  AVCaptureSessionInternal *v8;
  id v9;
  OS_dispatch_queue *v10;
  AVWeakReference *v11;
  char v12;
  _QWORD block[7];

  internal = self->_internal;
  objc_sync_enter(internal);
  v8 = self->_internal;
  if (v8->controlsOverlay == a3 && (-[NSMutableArray containsObject:](v8->controls, "containsObject:", a4) & 1) != 0)
  {
    v9 = (id)-[AVWeakReference referencedObject](self->_internal->weakReferenceControlsDelegate, "referencedObject");
    v10 = self->_internal->clientControlsQueue;
    v11 = self->_internal->weakReference;
    v12 = 0;
  }
  else
  {
    v11 = 0;
    v10 = 0;
    v9 = 0;
    v12 = 1;
  }
  objc_sync_exit(internal);
  if ((v12 & 1) == 0
    && v10
    && v9
    && ((AVCaptureClientIsCameraOrDerivative() & 1) != 0 || AVCaptureClientIsInternalTestTool()))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__AVCaptureSession_handleControlsOverlay_didChangeActiveControl___block_invoke;
    block[3] = &unk_1E4216898;
    block[4] = v11;
    block[5] = v9;
    block[6] = a4;
    dispatch_async((dispatch_queue_t)v10, block);
  }
}

uint64_t __65__AVCaptureSession_handleControlsOverlay_didChangeActiveControl___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;

  result = (uint64_t)(id)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  if (result)
  {
    v3 = result;
    v4 = *(void **)(a1 + 40);
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(v4, "session:didChangeActiveControl:", v3, *(_QWORD *)(a1 + 48));
  }
  return result;
}

- (void)cancelForegroundAutoResumeAfterDate:(id)a3
{
  double v4;
  double v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVCaptureSessionInternal *internal;
  OpaqueFigCaptureSession *figCaptureSession;
  uint64_t v9;
  void (*v10)(OpaqueFigCaptureSession *, _QWORD, uint64_t);

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  if (dword_1ECFED6A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  figCaptureSession = self->_internal->figCaptureSession;
  if (figCaptureSession)
  {
    v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
    v10 = *(void (**)(OpaqueFigCaptureSession *, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                            + 56);
    if (v10)
      v10(figCaptureSession, *MEMORY[0x1E0D04508], v9);
  }
  objc_sync_exit(internal);
}

- (void)setSmartStyleControlMode:(int64_t)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVCaptureSessionInternal *internal;

  if (dword_1ECFED6A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  self->_internal->smartStyleControlMode = a3;
  objc_sync_exit(internal);
}

- (int64_t)smartStyleControlMode
{
  AVCaptureSessionInternal *internal;
  int64_t smartStyleControlMode;

  internal = self->_internal;
  objc_sync_enter(internal);
  smartStyleControlMode = self->_internal->smartStyleControlMode;
  objc_sync_exit(internal);
  return smartStyleControlMode;
}

- (BOOL)smartStyleRenderingEnabled
{
  AVCaptureSession *v2;
  AVCaptureSessionInternal *internal;

  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->smartStyleRenderingEnabled;
  objc_sync_exit(internal);
  return (char)v2;
}

- (void)setSmartStyle:(id)a3
{
  AVCaptureSessionInternal *internal;
  AVCaptureSessionInternal *v6;
  void *v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  double v14;
  double v15;
  double v16;
  OpaqueFigCaptureSession *figCaptureSession;
  void (*v18)(OpaqueFigCaptureSession *, _QWORD, id);

  internal = self->_internal;
  objc_sync_enter(internal);
  v6 = self->_internal;
  if (!v6->smartStyleRenderingOptedOut && (objc_msgSend(a3, "isEqual:", v6->smartStyleSetByClient) & 1) == 0)
  {

    self->_internal->smartStyleSetByClient = (AVCaptureSmartStyle *)a3;
    if (!-[AVCaptureSession isBeingConfigured](self, "isBeingConfigured"))
    {
      if (a3)
      {
        v7 = (void *)MEMORY[0x1E0D03C10];
        v8 = objc_msgSend(a3, "cast");
        objc_msgSend(a3, "intensity");
        v10 = v9;
        objc_msgSend(a3, "toneBias");
        v12 = v11;
        objc_msgSend(a3, "colorBias");
        LODWORD(v14) = v13;
        LODWORD(v15) = v10;
        LODWORD(v16) = v12;
        a3 = (id)objc_msgSend(v7, "styleWithCast:intensity:toneBias:colorBias:", v8, v15, v16, v14);
      }
      figCaptureSession = self->_internal->figCaptureSession;
      if (figCaptureSession)
      {
        v18 = *(void (**)(OpaqueFigCaptureSession *, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 56);
        if (v18)
          v18(figCaptureSession, *MEMORY[0x1E0D04510], a3);
      }
    }
  }
  objc_sync_exit(internal);
}

- (id)smartStyle
{
  AVCaptureSessionInternal *internal;
  AVCaptureSmartStyle *v4;

  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = self->_internal->smartStyleSetByClient;
  objc_sync_exit(internal);
  return v4;
}

- (void)saveSystemStyleOverrideToDefaults:(id)a3
{
  AVCaptureSessionInternal *internal;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  double v13;
  double v14;
  double v15;
  OpaqueFigCaptureSession *figCaptureSession;
  void (*v17)(OpaqueFigCaptureSession *, _QWORD, id);

  internal = self->_internal;
  objc_sync_enter(internal);
  if (!self->_internal->smartStyleRenderingOptedOut
    && !-[AVCaptureSession isBeingConfigured](self, "isBeingConfigured"))
  {
    if (a3)
    {
      v6 = (void *)MEMORY[0x1E0D03C10];
      v7 = objc_msgSend(a3, "cast");
      objc_msgSend(a3, "intensity");
      v9 = v8;
      objc_msgSend(a3, "toneBias");
      v11 = v10;
      objc_msgSend(a3, "colorBias");
      LODWORD(v13) = v12;
      LODWORD(v14) = v9;
      LODWORD(v15) = v11;
      a3 = (id)objc_msgSend(v6, "styleWithCast:intensity:toneBias:colorBias:", v7, v14, v15, v13);
    }
    figCaptureSession = self->_internal->figCaptureSession;
    if (figCaptureSession)
    {
      v17 = *(void (**)(OpaqueFigCaptureSession *, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                         + 56);
      if (v17)
        v17(figCaptureSession, *MEMORY[0x1E0D04518], a3);
    }
  }
  objc_sync_exit(internal);
}

- (id)systemSmartStyle
{
  __CFString *v3;
  void *SystemStyle;

  v3 = AVCaptureClientPreferencesDomain();
  SystemStyle = (void *)AVSmartStyleSettingsGetSystemStyle((uint64_t)v3);
  if (!-[AVCaptureSession isValidSystemStyle:](self, "isValidSystemStyle:", SystemStyle))
    SystemStyle = (void *)AVSmartStyleSettingsGetSystemStyle((uint64_t)AVSmartStyleSettingsSystemStyle);
  if (SystemStyle)
    return SystemStyle;
  else
    return +[AVCaptureSmartStyle identityStyle](AVCaptureSmartStyle, "identityStyle");
}

- (id)activeSmartStyle
{
  AVCaptureSessionInternal *internal;
  AVCaptureSessionInternal *v4;
  AVCaptureSmartStyle *v5;
  AVCaptureSmartStyle *smartStyleSetByClient;
  AVCaptureSmartStyle *v7;

  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = self->_internal;
  if (v4->smartStyleRenderingOptedOut)
  {
    v5 = +[AVCaptureSmartStyle identityStyle](AVCaptureSmartStyle, "identityStyle");
  }
  else
  {
    smartStyleSetByClient = v4->smartStyleSetByClient;
    if (smartStyleSetByClient)
      v5 = smartStyleSetByClient;
    else
      v5 = -[AVCaptureSession systemSmartStyle](self, "systemSmartStyle");
  }
  v7 = v5;
  objc_sync_exit(internal);
  return v7;
}

- (void)isApplicationOptedOutByDefaultToSmartStyles
{
  __CFString *v3;
  uint64_t v4;
  void *v5;
  AVCaptureSessionInternal *internal;
  uint64_t v7;
  uint64_t HasShownOptOutMessagePreferenceKey;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;

  if (self->_internal->smartStyleInThirdPartyAppsEnabled)
  {
    v3 = AVCaptureClientPreferencesDomain();
    v4 = objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
    if (v4)
    {
      v5 = (void *)v4;
      internal = self->_internal;
      objc_sync_enter(internal);
      v7 = AVSmartStyleSettingsSystemStyleEnabledDefaultPreferenceKey(v3);
      HasShownOptOutMessagePreferenceKey = AVSmartStyleSettingsSystemStyleHasShownOptOutMessagePreferenceKey(v3);
      v9 = (void *)objc_msgSend(v5, "infoDictionary");
      if (objc_msgSend(v9, "objectForKey:ofClass:", AVCaptureBundleCameraPhotographicStylesOptOut, objc_opt_class()))
      {
        v10 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", v7);
        v11 = (void *)objc_msgSend(v5, "infoDictionary");
        v12 = objc_msgSend((id)objc_msgSend(v11, "objectForKey:ofClass:", AVCaptureBundleCameraPhotographicStylesOptOut, objc_opt_class()), "BOOLValue");
        self->_internal->smartStyleAlertBundleName = (NSString *)(id)objc_msgSend((id)objc_msgSend(v5, "infoDictionary"), "objectForKey:ofClass:", CFSTR("CFBundleName"), objc_opt_class());
        v13 = (void *)objc_msgSend(v5, "infoDictionary");
        self->_internal->smartStyleAlertOptOutDescription = (NSString *)(id)objc_msgSend(v13, "objectForKey:ofClass:", AVCaptureBundleCameraPhotographicStylesOptOutDescription, objc_opt_class());
        if (!v10 || v12 == objc_msgSend(v10, "BOOLValue"))
        {
          +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12 ^ 1u), v7);
          if (+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", HasShownOptOutMessagePreferenceKey))
          {
            +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", 0, HasShownOptOutMessagePreferenceKey);
          }
          -[AVCaptureSession setSystemStyleEnabled:](self, "setSystemStyleEnabled:", v12 ^ 1u);
        }
      }
      else
      {
        +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", 0, v7);
        +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", 0, HasShownOptOutMessagePreferenceKey);
        LOBYTE(v12) = 0;
      }
      self->_internal->smartStyleRenderingOptedOutDefault = v12;
      objc_sync_exit(internal);
    }
  }
}

- (void)displaySmartStylesOptOutAlert
{
  __CFString *v3;
  uint64_t HasShownOptOutMessagePreferenceKey;
  AVCaptureSessionInternal *internal;
  uint64_t v6;
  NSString *smartStyleAlertOptOutDescription;
  uint64_t v8;
  uint64_t v9;
  const __CFDictionary *v10;
  __CFUserNotification *v11;
  __CFUserNotification *v12;
  _BOOL8 v13;
  SInt32 v14;
  CFOptionFlags responseFlags;
  SInt32 error;
  _QWORD v18[5];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  v3 = AVCaptureClientPreferencesDomain();
  HasShownOptOutMessagePreferenceKey = AVSmartStyleSettingsSystemStyleHasShownOptOutMessagePreferenceKey(v3);
  if (!+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", HasShownOptOutMessagePreferenceKey))
  {
    internal = self->_internal;
    objc_sync_enter(internal);
    if (self->_internal->smartStyleAlertBundleName)
    {
      v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("“%@” Would Like To Turn Off Camera Styles"), self->_internal->smartStyleAlertBundleName);
      smartStyleAlertOptOutDescription = self->_internal->smartStyleAlertOptOutDescription;
      v8 = *MEMORY[0x1E0C9B810];
      v18[0] = *MEMORY[0x1E0C9B800];
      v18[1] = v8;
      v19[0] = v6;
      v19[1] = smartStyleAlertOptOutDescription;
      v9 = *MEMORY[0x1E0C9B830];
      v18[2] = *MEMORY[0x1E0C9B838];
      v18[3] = v9;
      v19[2] = CFSTR("Turn Off");
      v19[3] = CFSTR("Cancel");
      v18[4] = *MEMORY[0x1E0C9B820];
      v19[4] = MEMORY[0x1E0C9AAB0];
      v10 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
      error = 0;
      v11 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 2uLL, &error, v10);
      v12 = v11;
      if (v11)
      {
        if (error)
        {
          v13 = 1;
        }
        else
        {
          responseFlags = 0;
          v14 = CFUserNotificationReceiveResponse(v11, 0.0, &responseFlags);
          error = v14;
          v13 = (responseFlags & 3) != 0 || v14 != 0;
        }
        CFRelease(v12);
      }
      else
      {
        v13 = 1;
      }
      self->_internal->smartStyleRenderingOptedOut = !v13;
      objc_sync_exit(internal);
      +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", MEMORY[0x1E0C9AAB0], HasShownOptOutMessagePreferenceKey);
      -[AVCaptureSession setSystemStyleEnabled:](self, "setSystemStyleEnabled:", v13);
    }
    else
    {
      objc_sync_exit(internal);
    }
  }
}

- (BOOL)isSystemStyleEnabled
{
  __CFString *v2;
  void *v3;
  uint64_t SystemStyleEnabledForBundleID;

  if (!self->_internal->smartStyleInThirdPartyAppsEnabled)
    return AVCaptureClientIsCameraOrDerivative();
  v2 = AVCaptureClientPreferencesDomain();
  v3 = (void *)objc_msgSend(AVSmartStyleSettingsGetSystemStyleEnabledStateForCameraApps(), "mutableCopy");
  if (objc_msgSend(v3, "objectForKeyedSubscript:", v2))
  {
    LOBYTE(SystemStyleEnabledForBundleID) = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v2), "BOOLValue");
  }
  else
  {
    SystemStyleEnabledForBundleID = AVSmartStyleSettingsGetSystemStyleEnabledForBundleID((uint64_t)v2);
    AVSmartStyleSettingsSetSystemStyleEnabledForBundleID(SystemStyleEnabledForBundleID, (uint64_t)v2);
  }

  return SystemStyleEnabledForBundleID;
}

- (void)setSystemStyleEnabled:(BOOL)a3
{
  _BOOL8 v3;
  __CFString *v4;

  v3 = a3;
  v4 = AVCaptureClientPreferencesDomain();
  AVSmartStyleSettingsSetSystemStyleEnabledForBundleID(v3, (uint64_t)v4);
}

- (BOOL)isValidSystemStyle:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")) ^ 1;
  else
    return 0;
}

- (void)setContinuityCameraIsWired:(BOOL)a3
{
  if (self->_internal->continuityCameraIsWired != a3)
  {
    -[AVCaptureSession _beginConfiguration](self, "_beginConfiguration");
    self->_internal->continuityCameraIsWired = a3;
    -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
  }
}

- (BOOL)continuityCameraIsWired
{
  return self->_internal->continuityCameraIsWired;
}

- (void)setContinuityCameraClientDeviceClass:(int)a3
{
  if (self->_internal->continuityCameraClientDeviceClass != a3)
  {
    -[AVCaptureSession _beginConfiguration](self, "_beginConfiguration");
    self->_internal->continuityCameraClientDeviceClass = a3;
    -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
  }
}

- (int)continuityCameraClientDeviceClass
{
  return self->_internal->continuityCameraClientDeviceClass;
}

- (void)setSuppressVideoEffects:(BOOL)a3
{
  if (self->_internal->suppressVideoEffects != a3)
  {
    -[AVCaptureSession _beginConfiguration](self, "_beginConfiguration");
    -[AVCaptureSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("suppressVideoEffects"));
    self->_internal->suppressVideoEffects = a3;
    -[AVCaptureSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("suppressVideoEffects"));
    -[AVCaptureSession _commitConfiguration](self, "_commitConfiguration");
  }
}

- (BOOL)suppressVideoEffects
{
  return self->_internal->suppressVideoEffects;
}

@end
