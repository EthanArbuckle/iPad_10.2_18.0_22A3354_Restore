@implementation CAMAnalyticsPreferencesEvent

- (CAMAnalyticsPreferencesEvent)initWithPreferences:(id)a3
{
  id v4;
  CAMAnalyticsPreferencesEvent *v5;
  CAMCaptureCapabilities *v6;
  const __CFString *v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  int v12;
  int v13;
  unint64_t v14;
  uint64_t v15;
  __CFString *v16;
  char v17;
  id v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  unint64_t v36;
  __CFString *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  const __CFString *v57;
  void *v58;
  unint64_t v59;
  const __CFString *v60;
  void *v61;
  _BOOL4 v62;
  BOOL v63;
  const __CFString *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  __CFString *v68;
  __CFString *v69;
  void *v70;
  unint64_t v71;
  const __CFString *v72;
  void *v73;
  void *v74;
  const __CFString *v75;
  __CFString *v76;
  __CFString *v77;
  void *v78;
  __CFString *v79;
  __CFString *v80;
  void *v81;
  const __CFString *v82;
  void *v83;
  const __CFString *v84;
  void *v85;
  __CFString *v86;
  __CFString *v87;
  void *v88;
  const __CFString *v89;
  void *v90;
  const __CFString *v91;
  void *v92;
  const __CFString *v93;
  void *v94;
  const __CFString *v95;
  void *v96;
  const __CFString *v97;
  void *v98;
  const __CFString *v99;
  void *v100;
  const __CFString *v101;
  void *v102;
  const __CFString *v103;
  void *v104;
  void *v105;
  unint64_t v106;
  void *v107;
  void *v108;
  NSObject *v109;
  void *v110;
  void *v111;
  const __CFString *v112;
  void *v113;
  const __CFString *v114;
  void *v115;
  const __CFString *v116;
  void *v117;
  const __CFString *v118;
  void *v119;
  const __CFString *v120;
  void *v121;
  void *v122;
  unint64_t v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v131;
  BOOL v132;
  _BOOL4 v133;
  _BOOL4 v134;
  const __CFString *v135;
  void *v136;
  const __CFString *v137;
  void *v138;
  const __CFString *v139;
  void *v140;
  const __CFString *v141;
  void *v142;
  int v143;
  void *v144;
  void *v145;
  const __CFString *v146;
  int v147;
  void *v148;
  void *v149;
  const __CFString *v150;
  const __CFString *v151;
  id v152;
  void *v153;
  id v154;
  id v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t i;
  uint64_t v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  const __CFString *v166;
  void *v167;
  const __CFString *v168;
  void *v169;
  const __CFString *v170;
  void *v171;
  CAMAnalyticsPreferencesEvent *v172;
  uint64_t v174;
  uint64_t v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  objc_super v180;
  _BYTE v181[128];
  uint64_t v182;

  v182 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v180.receiver = self;
  v180.super_class = (Class)CAMAnalyticsPreferencesEvent;
  v5 = -[CAMAnalyticsEvent init](&v180, sel_init);

  if (!v5)
    goto LABEL_319;
  v6 = -[CAMCaptureCapabilities initWithHostProcess:]([CAMCaptureCapabilities alloc], "initWithHostProcess:", 0);
  objc_storeStrong((id *)&v5->__capabilities, v6);
  if (-[CAMCaptureCapabilities isHEVCEncodingSupported](v6, "isHEVCEncodingSupported"))
  {
    if (objc_msgSend(v4, "usingMostCompatibleEncoding"))
      v7 = CFSTR("MostCompatible");
    else
      v7 = CFSTR("HighEfficiency");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("Encoding"));

  }
  v9 = -[CAMCaptureCapabilities isPhotoResolutionSupported:forPhotoEncoding:](v6, "isPhotoResolutionSupported:forPhotoEncoding:", 3, 1);
  v10 = -[CAMCaptureCapabilities isLinearDNGSupported](v6, "isLinearDNGSupported");
  v11 = v10;
  if (!v9)
  {
    if (!v10)
    {
      v18 = 0;
      goto LABEL_28;
    }
    v17 = objc_msgSend(v4, "rawControlEnabled");
    v13 = objc_msgSend(v4, "preserveRAW");
    v18 = 0;
    if ((v17 & 1) != 0)
      goto LABEL_22;
    goto LABEL_15;
  }
  v12 = objc_msgSend(v4, "photoFormatControlEnabled");
  v13 = objc_msgSend(v4, "preservePhotoResolution");
  if ((v11 & v12) == 1)
  {
    v14 = objc_msgSend(v4, "photoFormatControlSecondaryFormat");
    if (v14 > 2)
      v16 = 0;
    else
      v16 = off_1EA32BAA0[v14];
    if ((unint64_t)(v15 - 1) > 2)
      v20 = 0;
    else
      v20 = qword_1DB9A5888[v15 - 1];
    v18 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%ld"), v16, v20);
    v17 = 1;
    goto LABEL_22;
  }
  v18 = 0;
  v17 = v12 & ~v11;
  if ((v17 & 1) == 0)
  {
LABEL_15:
    v19 = CFSTR("Off");
    goto LABEL_23;
  }
LABEL_22:
  v19 = CFSTR("On");
LABEL_23:
  -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, CFSTR("PhotoFormatControl"));

  if ((v17 & 1) != 0)
  {
    if (v13)
      v22 = CFSTR("On");
    else
      v22 = CFSTR("Off");
    v23 = v22;
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("PreservePhotoFormatControl"));

    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v18, CFSTR("PhotoFormatControlDefault"));

  }
LABEL_28:
  if (-[CAMCaptureCapabilities isLinearDNGSupported](v6, "isLinearDNGSupported"))
  {
    if (objc_msgSend(v4, "rawControlEnabled"))
      v26 = CFSTR("On");
    else
      v26 = CFSTR("Off");
    v27 = v26;
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, CFSTR("LinearDNG"));

    if (objc_msgSend(v4, "preserveRAW"))
      v29 = CFSTR("On");
    else
      v29 = CFSTR("Off");
    v30 = v29;
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, CFSTR("PreserveLinearDNG"));

  }
  if (-[CAMCaptureCapabilities isProResVideoSupported](v6, "isProResVideoSupported"))
  {
    v32 = objc_msgSend(v4, "isProResControlEnabled") ? CFSTR("On") : CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, CFSTR("ProRes"));

    v34 = objc_msgSend(v4, "preserveProRes") ? CFSTR("On") : CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, CFSTR("PreserveProRes"));

    if (-[CAMCaptureCapabilities isProResLogColorSpaceSupported](v6, "isProResLogColorSpaceSupported"))
    {
      if (objc_msgSend(v4, "isProResControlEnabled")
        && objc_msgSend(v4, "allowExplicitProResColorSpace"))
      {
        v36 = objc_msgSend(v4, "explicitProResColorSpace");
        if (v36 > 3)
          v37 = 0;
        else
          v37 = off_1EA32BAB8[v36];
        -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, CFSTR("ExplicitProResColorSpace"));

      }
    }
  }
  if (-[CAMCaptureCapabilities isPALVideoSupported](v6, "isPALVideoSupported"))
  {
    if (objc_msgSend(v4, "isPALVideoEnabled"))
      v39 = CFSTR("On");
    else
      v39 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v39, CFSTR("ShowPALFormats"));

  }
  v41 = objc_msgSend(v4, "usingMostCompatibleEncoding") ^ 1;
  v42 = objc_msgSend(v4, "prefersHDR10BitVideoForCapabilities:", v6);
  LOBYTE(v174) = v42;
  v43 = -[CAMCaptureCapabilities resolvedVideoConfigurationForMode:device:videoEncodingBehavior:videoConfiguration:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:](v6, "resolvedVideoConfigurationForMode:device:videoEncodingBehavior:videoConfiguration:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:", 1, 0, v41, objc_msgSend(v4, "videoConfiguration"), 0, 0, v174);
  LOBYTE(v175) = v42;
  v44 = -[CAMCaptureCapabilities resolvedVideoConfigurationForMode:device:videoEncodingBehavior:videoConfiguration:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:](v6, "resolvedVideoConfigurationForMode:device:videoEncodingBehavior:videoConfiguration:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:", 2, 0, v41, objc_msgSend(v4, "slomoConfiguration"), 0, 0, v175);
  switch(v43)
  {
    case 0:
      v45 = CFSTR("Auto");
      break;
    case 1:
      v45 = CFSTR("1080p60");
      break;
    case 2:
      v45 = CFSTR("720p120");
      break;
    case 3:
      v45 = CFSTR("720p240");
      break;
    case 4:
      v45 = CFSTR("1080p120");
      break;
    case 5:
      v45 = CFSTR("4k30");
      break;
    case 6:
      v45 = CFSTR("720p30");
      break;
    case 7:
      v45 = CFSTR("1080p30");
      break;
    case 8:
      v45 = CFSTR("1080p240");
      break;
    case 9:
      v45 = CFSTR("4k60");
      break;
    case 10:
      v45 = CFSTR("4k24");
      break;
    case 11:
      v45 = CFSTR("1080p25");
      break;
    case 12:
      v45 = CFSTR("4k25");
      break;
    case 13:
      v45 = CFSTR("4k120");
      break;
    case 14:
      v45 = CFSTR("4k100");
      break;
    default:
      switch(v43)
      {
        case 10000:
          v45 = CFSTR("ImagePickerHigh");
          break;
        case 10001:
          v45 = CFSTR("ImagePickerMedium");
          break;
        case 10002:
          v45 = CFSTR("ImagePickerLow");
          break;
        case 10003:
          v45 = CFSTR("ImagePickerVGA");
          break;
        case 10004:
          v45 = CFSTR("ImagePickeriFrame720p");
          break;
        case 10005:
          v45 = CFSTR("ImagePickeriFrame540p");
          break;
        default:
          v45 = 0;
          break;
      }
      break;
  }
  -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setObject:forKeyedSubscript:", v45, CFSTR("VideoConfiguration"));

  switch(v44)
  {
    case 0:
      v47 = CFSTR("Auto");
      break;
    case 1:
      v47 = CFSTR("1080p60");
      break;
    case 2:
      v47 = CFSTR("720p120");
      break;
    case 3:
      v47 = CFSTR("720p240");
      break;
    case 4:
      v47 = CFSTR("1080p120");
      break;
    case 5:
      v47 = CFSTR("4k30");
      break;
    case 6:
      v47 = CFSTR("720p30");
      break;
    case 7:
      v47 = CFSTR("1080p30");
      break;
    case 8:
      v47 = CFSTR("1080p240");
      break;
    case 9:
      v47 = CFSTR("4k60");
      break;
    case 10:
      v47 = CFSTR("4k24");
      break;
    case 11:
      v47 = CFSTR("1080p25");
      break;
    case 12:
      v47 = CFSTR("4k25");
      break;
    case 13:
      v47 = CFSTR("4k120");
      break;
    case 14:
      v47 = CFSTR("4k100");
      break;
    default:
      switch(v44)
      {
        case 10000:
          v47 = CFSTR("ImagePickerHigh");
          break;
        case 10001:
          v47 = CFSTR("ImagePickerMedium");
          break;
        case 10002:
          v47 = CFSTR("ImagePickerLow");
          break;
        case 10003:
          v47 = CFSTR("ImagePickerVGA");
          break;
        case 10004:
          v47 = CFSTR("ImagePickeriFrame720p");
          break;
        case 10005:
          v47 = CFSTR("ImagePickeriFrame540p");
          break;
        default:
          v47 = 0;
          break;
      }
      break;
  }
  -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v47, CFSTR("SlomoConfiguration"));

  if (objc_msgSend(v4, "usingMostCompatibleEncoding")
    && -[CAMCaptureCapabilities isHEVCEncodingSupported](v6, "isHEVCEncodingSupported"))
  {
    if (objc_msgSend(v4, "didConfirmVideoMostCompatible"))
      v49 = CFSTR("On");
    else
      v49 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setObject:forKeyedSubscript:", v49, CFSTR("VideoMostCompatible"));

    if (objc_msgSend(v4, "didConfirmSlomo1080p240MostCompatible"))
      v51 = CFSTR("On");
    else
      v51 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setObject:forKeyedSubscript:", v51, CFSTR("1080p240MostCompatible"));

  }
  if (-[CAMCaptureCapabilities isProRawJpegXLSupported](v6, "isProRawJpegXLSupported"))
  {
    v53 = objc_msgSend(v4, "rawFileFormatBehavior");
    if (v53 == 2)
    {
      -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v54;
      v56 = CFSTR("JpegXLLossy");
    }
    else if (v53 == 1)
    {
      -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v54;
      v56 = CFSTR("JpegXLLossless");
    }
    else
    {
      if (v53)
        goto LABEL_120;
      -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v54;
      v56 = CFSTR("JpegLossless");
    }
    objc_msgSend(v54, "setObject:forKeyedSubscript:", v56, CFSTR("RawFileFormatBehavior"));

  }
LABEL_120:
  if (-[CAMCaptureCapabilities isHDR10BitVideoSupportedForVideoConfiguration:videoEncodingBehavior:](v6, "isHDR10BitVideoSupportedForVideoConfiguration:videoEncodingBehavior:", objc_msgSend(v4, "videoConfiguration"), v41))
  {
    if (objc_msgSend(v4, "HDR10BitVideoEnabled"))
      v57 = CFSTR("On");
    else
      v57 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setObject:forKeyedSubscript:", v57, CFSTR("HDR10Video"));

  }
  if (-[CAMCaptureCapabilities isVariableFramerateVideoSupported](v6, "isVariableFramerateVideoSupported"))
  {
    v59 = objc_msgSend(v4, "VFRMode");
    if (v59 > 2)
      v60 = 0;
    else
      v60 = off_1EA32BAD8[v59];
LABEL_133:
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setObject:forKeyedSubscript:", v60, CFSTR("AutoFPS"));

    goto LABEL_134;
  }
  if (-[CAMCaptureCapabilities isAutoLowLightVideoSupportedForMode:videoConfiguration:videoEncodingBehavior:](v6, "isAutoLowLightVideoSupportedForMode:videoConfiguration:videoEncodingBehavior:", 1, objc_msgSend(v4, "videoConfiguration"), 1))
  {
    if (objc_msgSend(v4, "isLowLightVideoEnabled"))
      v60 = CFSTR("AutoLowLightVideoOn");
    else
      v60 = CFSTR("AutoLowLightVideoOff");
    goto LABEL_133;
  }
LABEL_134:
  v62 = -[CAMCaptureCapabilities interactiveVideoFormatControlSupported](v6, "interactiveVideoFormatControlSupported");
  v63 = -[CAMCaptureCapabilities interactiveVideoFormatControlAlwaysEnabled](v6, "interactiveVideoFormatControlAlwaysEnabled");
  if (v62 && !v63)
  {
    if (objc_msgSend(v4, "isVideoConfigurationControlEnabled"))
      v64 = CFSTR("On");
    else
      v64 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v64, CFSTR("VideoConfigurationControl"));

  }
  if (-[CAMCaptureCapabilities isTelephotoSupported](v6, "isTelephotoSupported")
    || -[CAMCaptureCapabilities isSuperWideSupported](v6, "isSuperWideSupported"))
  {
    if (objc_msgSend(v4, "shouldDisableCameraSwitchingDuringVideoRecordingForMode:", 1))
      v66 = CFSTR("On");
    else
      v66 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setObject:forKeyedSubscript:", v66, CFSTR("LockCamera"));

  }
  if (-[CAMCaptureCapabilities isWhiteBalanceLockingForVideoRecordingSupported](v6, "isWhiteBalanceLockingForVideoRecordingSupported"))
  {
    if (objc_msgSend(v4, "shouldLockWhiteBalanceDuringVideoRecording"))
      v68 = CFSTR("On");
    else
      v68 = CFSTR("Off");
    v69 = v68;
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setObject:forKeyedSubscript:", v69, CFSTR("LockWhiteBalance"));

  }
  if (-[CAMCaptureCapabilities isStereoAudioRecordingSupported](v6, "isStereoAudioRecordingSupported")
    || -[CAMCaptureCapabilities isCinematicAudioSupported](v6, "isCinematicAudioSupported"))
  {
    v71 = objc_msgSend(v4, "preferredAudioConfiguration") - 1;
    if (v71 > 2)
      v72 = 0;
    else
      v72 = off_1EA32BAF0[v71];
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v73;
    v75 = CFSTR("AudioConfiguration");
LABEL_157:
    objc_msgSend(v73, "setObject:forKeyedSubscript:", v72, v75);

    goto LABEL_158;
  }
  if (-[CAMCaptureCapabilities isStereoAudioRecordingSupported](v6, "isStereoAudioRecordingSupported"))
  {
    if (objc_msgSend(v4, "preferredAudioConfiguration") == 1)
      v72 = CFSTR("Off");
    else
      v72 = CFSTR("On");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v73;
    v75 = CFSTR("StereoAudio");
    goto LABEL_157;
  }
LABEL_158:
  if (-[CAMCaptureCapabilities isMixAudioWithOthersSupported](v6, "isMixAudioWithOthersSupported"))
  {
    if (objc_msgSend(v4, "shouldMixAudioWithOthers"))
      v76 = CFSTR("On");
    else
      v76 = CFSTR("Off");
    v77 = v76;
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setObject:forKeyedSubscript:", v77, CFSTR("MixAudioWithOthers"));

  }
  if (-[CAMCaptureCapabilities isWindRemovalSupported](v6, "isWindRemovalSupported"))
  {
    if (objc_msgSend(v4, "shouldEnableWindRemoval"))
      v79 = CFSTR("On");
    else
      v79 = CFSTR("Off");
    v80 = v79;
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setObject:forKeyedSubscript:", v80, CFSTR("WindRemoval"));

  }
  if (objc_msgSend(v4, "preserveCaptureMode"))
    v82 = CFSTR("On");
  else
    v82 = CFSTR("Off");
  -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v82, CFSTR("PreserveCaptureMode"));

  if (-[CAMCaptureCapabilities isPreserveCreativeControlsSupported](v6, "isPreserveCreativeControlsSupported"))
  {
    if (objc_msgSend(v4, "preserveEffectFilter"))
      v84 = CFSTR("On");
    else
      v84 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setObject:forKeyedSubscript:", v84, CFSTR("PreserveCreativeControls"));

  }
  if (-[CAMCaptureCapabilities isPreserveCreativeControlsSupported](v6, "isPreserveCreativeControlsSupported"))
  {
    if (objc_msgSend(v4, "preserveSmartStyle"))
      v86 = CFSTR("On");
    else
      v86 = CFSTR("Off");
    v87 = v86;
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setObject:forKeyedSubscript:", v87, CFSTR("PreserveSmartStyle"));

  }
  if (-[CAMCaptureCapabilities isExposureSliderSupported](v6, "isExposureSliderSupported"))
  {
    if (objc_msgSend(v4, "preserveExposure"))
      v89 = CFSTR("On");
    else
      v89 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setObject:forKeyedSubscript:", v89, CFSTR("PreserveExposure"));

  }
  if (-[CAMCaptureCapabilities isLivePhotoSupported](v6, "isLivePhotoSupported"))
  {
    if (objc_msgSend(v4, "preserveLivePhoto"))
      v91 = CFSTR("On");
    else
      v91 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "setObject:forKeyedSubscript:", v91, CFSTR("PreserveLivePhoto"));

  }
  if (-[CAMCaptureCapabilities isCTMSupported](v6, "isCTMSupported"))
  {
    if (objc_msgSend(v4, "shouldUseVolumeUpBurst"))
      v93 = CFSTR("On");
    else
      v93 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setObject:forKeyedSubscript:", v93, CFSTR("VolumeUpForBurst"));

  }
  if (objc_msgSend(v4, "QRBannersEnabledInSettings"))
    v95 = CFSTR("On");
  else
    v95 = CFSTR("Off");
  -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "setObject:forKeyedSubscript:", v95, CFSTR("ScanQRCodes"));

  if (-[CAMCaptureCapabilities isImageAnalysisSupported](v6, "isImageAnalysisSupported"))
  {
    if (objc_msgSend(v4, "isImageAnalysisEnabled"))
      v97 = CFSTR("On");
    else
      v97 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setObject:forKeyedSubscript:", v97, CFSTR("LiveText"));

  }
  if (objc_msgSend(v4, "shouldShowGridView"))
    v99 = CFSTR("On");
  else
    v99 = CFSTR("Off");
  -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setObject:forKeyedSubscript:", v99, CFSTR("Grid"));

  if (-[CAMCaptureCapabilities isMirroredFrontCapturesSupported](v6, "isMirroredFrontCapturesSupported"))
  {
    if (objc_msgSend(v4, "shouldMirrorFrontCameraCaptures"))
      v101 = CFSTR("On");
    else
      v101 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setObject:forKeyedSubscript:", v101, CFSTR("MirrorFrontCamera"));

  }
  if (-[CAMCaptureCapabilities isSpatialOverCaptureSupported](v6, "isSpatialOverCaptureSupported"))
  {
    if (objc_msgSend(v4, "isOverCapturePreviewEnabled"))
      v103 = CFSTR("On");
    else
      v103 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "setObject:forKeyedSubscript:", v103, CFSTR("OvercapturePreview"));

  }
  if (-[CAMCaptureCapabilities semanticStylesSupport](v6, "semanticStylesSupport"))
  {
    objc_msgSend(v4, "captureConfiguration");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_msgSend(v105, "selectedSemanticStyleIndex");

    objc_msgSend(v4, "captureConfiguration");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "semanticStyles");
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    if (v106 >= objc_msgSend(v108, "count"))
    {
      v109 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
        -[CAMAnalyticsPreferencesEvent initWithPreferences:].cold.1(v108, v106, v109);
    }
    else
    {
      objc_msgSend(v108, "objectAtIndexedSubscript:", v106);
      v109 = objc_claimAutoreleasedReturnValue();
      -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject analyticsDictionaryForPreferences](v109, "analyticsDictionaryForPreferences");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "addEntriesFromDictionary:", v111);

    }
  }
  if (-[CAMCaptureCapabilities semanticDevelopmentSupported](v6, "semanticDevelopmentSupported"))
  {
    if (objc_msgSend(v4, "semanticDevelopmentEnabled"))
      v112 = CFSTR("On");
    else
      v112 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "setObject:forKeyedSubscript:", v112, CFSTR("SemanticDevelopment"));

  }
  if (-[CAMCaptureCapabilities responsiveShutterSupported](v6, "responsiveShutterSupported"))
  {
    if (objc_msgSend(v4, "responsiveShutterEnabled"))
      v114 = CFSTR("On");
    else
      v114 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "setObject:forKeyedSubscript:", v114, CFSTR("DynamicShutter"));

  }
  if (-[CAMCaptureCapabilities contentAwareDistortionCorrectionSupported](v6, "contentAwareDistortionCorrectionSupported"))
  {
    if (objc_msgSend(v4, "shouldUseContentAwareDistortionCorrection"))
      v116 = CFSTR("On");
    else
      v116 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setObject:forKeyedSubscript:", v116, CFSTR("LensCorrection"));

  }
  if (-[CAMCaptureCapabilities isSuperWideAutoMacroSupported](v6, "isSuperWideAutoMacroSupported"))
  {
    if (objc_msgSend(v4, "isSuperWideAutoMacroControlAllowed"))
      v118 = CFSTR("On");
    else
      v118 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "setObject:forKeyedSubscript:", v118, CFSTR("AutoMacro"));

    if (objc_msgSend(v4, "preserveSuperWideAutoMacro"))
      v120 = CFSTR("On");
    else
      v120 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "setObject:forKeyedSubscript:", v120, CFSTR("PreserveAutoMacro"));

  }
  if (-[CAMCaptureCapabilities enhancedRAWResolutionSupported](v6, "enhancedRAWResolutionSupported")
    && objc_msgSend(v4, "rawControlEnabled"))
  {
    v122 = (void *)MEMORY[0x1E0CB37E8];
    v123 = objc_msgSend(v4, "maximumRAWPhotoResolution") - 1;
    if (v123 > 2)
      v124 = 0;
    else
      v124 = qword_1DB9A5888[v123];
    objc_msgSend(v122, "numberWithInteger:", v124);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "setObject:forKeyedSubscript:", v125, CFSTR("RAWResolution"));

  }
  if (-[CAMCaptureCapabilities isPhotoResolutionSupported:forPhotoEncoding:](v6, "isPhotoResolutionSupported:forPhotoEncoding:", 2, 1))
  {
    v127 = (void *)MEMORY[0x1E0CB37E8];
    v128 = objc_msgSend(v4, "preferredHEICPhotoResolutionForDevicePosition:", 0);
    v129 = 0;
    if ((unint64_t)(v128 - 1) <= 2)
      v129 = qword_1DB9A5888[v128 - 1];
    objc_msgSend(v127, "numberWithInteger:", v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "setObject:forKeyedSubscript:", v130, CFSTR("BackPreferredPhotoResolution"));

  }
  if (-[CAMCaptureCapabilities isHDRSettingAllowed](v6, "isHDRSettingAllowed"))
  {
    v132 = -[CAMCaptureCapabilities isModernHDRSupported](v6, "isModernHDRSupported");
    v133 = -[CAMCaptureCapabilities isSmartHDRSupported](v6, "isSmartHDRSupported");
    v134 = -[CAMCaptureCapabilities isHDREV0CaptureSupported](v6, "isHDREV0CaptureSupported");
    if (v132 || v133)
    {
      if (objc_msgSend(v4, "shouldUseModernHDRBehavior"))
        v135 = CFSTR("On");
      else
        v135 = CFSTR("Off");
      -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "setObject:forKeyedSubscript:", v135, CFSTR("SmartHDR"));

    }
    if (v134)
    {
      if (objc_msgSend(v4, "shouldCaptureHDREV0"))
        v137 = CFSTR("On");
      else
        v137 = CFSTR("Off");
      -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "setObject:forKeyedSubscript:", v137, CFSTR("HDRKeepNormalPhoto"));

    }
  }
  if (-[CAMCaptureCapabilities isVideoStabilizationControlSupported](v6, "isVideoStabilizationControlSupported"))
  {
    if (objc_msgSend(v4, "enhancedVideoStabilization"))
      v139 = CFSTR("On");
    else
      v139 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "setObject:forKeyedSubscript:", v139, CFSTR("EnhancedVideoStabilization"));

    if (objc_msgSend(v4, "actionModeLowLightEnabled"))
      v141 = CFSTR("On");
    else
      v141 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "setObject:forKeyedSubscript:", v141, CFSTR("ActionModeLowLight"));

  }
  if (!+[CAMUserPreferences isSharedLibrarySupportedAndEnabledForCapabilities:](CAMUserPreferences, "isSharedLibrarySupportedAndEnabledForCapabilities:", v6))goto LABEL_291;
  v143 = objc_msgSend(v4, "sharedLibraryEnabled");
  -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = v144;
  if (v143)
  {
    v146 = CFSTR("On");
    objc_msgSend(v144, "setObject:forKeyedSubscript:", CFSTR("On"), CFSTR("SharedLibraryShareFromCamera"));

    v147 = objc_msgSend(v4, "sharedLibraryAutoBehaviorEnabled");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = v148;
    if (v147)
    {
      objc_msgSend(v148, "setObject:forKeyedSubscript:", CFSTR("Automatic"), CFSTR("SharedLibraryMode"));

      if (!objc_msgSend(v4, "shareWhenAtHomeEnabled"))
        v146 = CFSTR("Off");
      -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = v149;
      v150 = CFSTR("SharedLibraryWhenAtHome");
      v151 = v146;
      goto LABEL_290;
    }
    v151 = CFSTR("Manual");
    v150 = CFSTR("SharedLibraryMode");
  }
  else
  {
    v151 = CFSTR("Off");
    v150 = CFSTR("SharedLibraryShareFromCamera");
  }
  v149 = v145;
LABEL_290:
  objc_msgSend(v149, "setObject:forKeyedSubscript:", v151, v150);

LABEL_291:
  if (-[CAMCaptureCapabilities isCustomLensSupportedForPhotoResolution:](v6, "isCustomLensSupportedForPhotoResolution:", objc_msgSend(v4, "preferredHEICPhotoResolutionForDevicePosition:", 0)))
  {
    v152 = v18;
    objc_msgSend(v4, "customLensGroup");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v176 = 0u;
    v177 = 0u;
    v178 = 0u;
    v179 = 0u;
    v155 = v153;
    v156 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v176, v181, 16);
    if (v156)
    {
      v157 = v156;
      v158 = *(_QWORD *)v177;
      do
      {
        for (i = 0; i != v157; ++i)
        {
          if (*(_QWORD *)v177 != v158)
            objc_enumerationMutation(v155);
          v160 = objc_msgSend(*(id *)(*((_QWORD *)&v176 + 1) + 8 * i), "integerValue");
          if (v160)
          {
            -[CAMAnalyticsPreferencesEvent _focalLengthStringForCustomLens:](v5, "_focalLengthStringForCustomLens:", v160);
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v154, "addObject:", v161);

          }
        }
        v157 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v176, v181, 16);
      }
      while (v157);
    }

    if (objc_msgSend(v154, "count"))
    {
      objc_msgSend(v154, "componentsJoinedByString:", CFSTR(", "));
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v163, "setObject:forKeyedSubscript:", v162, CFSTR("CustomLenses"));

      -[CAMAnalyticsPreferencesEvent _focalLengthStringForCustomLens:](v5, "_focalLengthStringForCustomLens:", objc_msgSend(v4, "defaultCustomLens"));
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "setObject:forKeyedSubscript:", v164, CFSTR("DefaultCustomLens"));

    }
    else
    {
      -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v164, "setObject:forKeyedSubscript:", CFSTR("None"), CFSTR("CustomLenses"));
    }
    v18 = v152;

  }
  if (-[CAMCaptureCapabilities isSpatialVideoCaptureSupported](v6, "isSpatialVideoCaptureSupported"))
  {
    if (objc_msgSend(v4, "spatialVideoControlEnabled"))
      v166 = CFSTR("On");
    else
      v166 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "setObject:forKeyedSubscript:", v166, CFSTR("SpatialVideoControl"));

    if (objc_msgSend(v4, "preserveSpatialVideoEnabled"))
      v168 = CFSTR("On");
    else
      v168 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "setObject:forKeyedSubscript:", v168, CFSTR("PreserveSpatialVideo"));

  }
  if (-[CAMCaptureCapabilities photoModeDepthSuggestionSupported](v6, "photoModeDepthSuggestionSupported"))
  {
    if (objc_msgSend(v4, "shouldUseDepthSuggestionInPhotoMode"))
      v170 = CFSTR("On");
    else
      v170 = CFSTR("Off");
    -[CAMAnalyticsEvent _eventMap](v5, "_eventMap");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "setObject:forKeyedSubscript:", v170, CFSTR("PhotoModeDepthSuggestion"));

  }
  v172 = v5;

LABEL_319:
  return v5;
}

- (id)_focalLengthStringForCustomLens:(int64_t)a3
{
  void *v4;
  unint64_t v5;
  uint64_t v6;

  -[CAMAnalyticsPreferencesEvent _capabilities](self, "_capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "effectiveFocalLengthForCustomLens:", a3);

  v6 = 0;
  if (v5 <= 3)
    v6 = qword_1DB9A58A0[v5];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.fmm"), v6);
}

- (id)eventName
{
  return CFSTR("preferences");
}

- (CAMCaptureCapabilities)_capabilities
{
  return self->__capabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__capabilities, 0);
}

- (void)initWithPreferences:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 134218240;
  v5 = a2;
  v6 = 2048;
  v7 = objc_msgSend(a1, "count") - 1;
  _os_log_error_impl(&dword_1DB760000, a3, OS_LOG_TYPE_ERROR, "Selected semantic style index %ld is out of range 0-%ld", (uint8_t *)&v4, 0x16u);
}

@end
