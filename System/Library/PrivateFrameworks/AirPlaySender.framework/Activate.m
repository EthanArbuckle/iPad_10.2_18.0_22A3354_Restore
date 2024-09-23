@implementation Activate

void __carEndpoint_Activate_block_invoke(uint64_t a1)
{
  NSObject *v2;
  int isDissociated;
  const __CFArray *v4;
  char *v5;
  int v6;
  int v7;
  void *v8;
  const __CFDictionary *v9;
  uint64_t DerivedStorage;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  const void *Value;
  const __CFDictionary *v20;
  int SessionFeatureKeysWithIdentifier;
  const __CFArray *MutableCopy;
  uint64_t v23;
  char IntWithDefault;
  CFIndex CountOfValue;
  BOOL v26;
  CFIndex FirstIndexOfValue;
  int v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, const __CFDictionary *, uint64_t, const __CFArray **);
  int v35;
  const __CFArray *v36;
  __CFDictionary *v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, const __CFString *, uint64_t);
  uint64_t v46;
  int v47;
  uint64_t v48;
  void (*v49)(uint64_t, const __CFString *, uint64_t);
  uint64_t v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  _BOOL4 v54;
  uint64_t v55;
  __CFDictionary *Mutable;
  int v57;
  CFMutableArrayRef v58;
  CFMutableArrayRef v59;
  int UIContextMasterURLList;
  int v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, __CFDictionary *);
  int v67;
  uint64_t v68;
  uint64_t v69;
  CFAllocatorRef v70;
  uint64_t CMBaseObject;
  uint64_t (*v72)(uint64_t, const __CFString *, CFAllocatorRef, CFDictionaryRef *);
  int v73;
  int v74;
  const __CFArray *v75;
  CFIndex Count;
  int v77;
  uint64_t v78;
  uint64_t v79;
  double v80;
  double v81;
  uint64_t TypedValueAtIndex;
  BOOL v83;
  const __CFDictionary *v84;
  void *v85;
  uint64_t Int64;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  BOOL v90;
  int v91;
  const __CFArray *v92;
  const __CFArray *v93;
  CFTypeID v94;
  BOOL v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, const __CFString *, _QWORD, CFTypeRef *);
  int v98;
  NSObject *v99;
  uint64_t v100;
  NSObject *v101;
  NSObject *v102;
  NSObject **v103;
  NSObject *v104;
  uint64_t v105;
  CFMutableDictionaryRef v106;
  CFMutableDictionaryRef v107;
  const __CFAllocator *v108;
  __CFString *v109;
  __CFString *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const __CFString *v114;
  uint64_t v115;
  uint64_t TimeBetweenEventsInMilliSecondRecursive;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  NSObject *v123;
  NSObject *v124;
  CFMutableDictionaryRef v125;
  int v126;
  uint64_t v127;
  NSObject *v128;
  NSObject *v129;
  const void *v130;
  uint64_t v131;
  NSObject *v132;
  uint64_t v133;
  uint64_t v134;
  NSObject *v135;
  uint64_t v136;
  uint64_t v137;
  const void *v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;
  uint64_t v145;
  int v146;
  unint64_t v147;
  __CFDictionary *v148;
  const __CFDictionary *v149;
  const __CFDictionary *v150;
  NSObject *v151;
  uint64_t v152;
  _QWORD v153[9];
  int v154;
  int v155;
  _QWORD v156[5];
  const __CFArray *v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  uint64_t *v161;
  uint64_t v162;
  uint8_t block[8];
  uint64_t v164;
  void *v165;
  void *v166;
  uint64_t *v167;
  CFArrayRef *v168;
  uint8_t *v169;
  const void *v170;
  const __CFDictionary *v171;
  CFArrayRef theArray;
  uint64_t p_theArray;
  uint64_t v174;
  void *v175;
  uint64_t *v176;
  uint64_t v177;
  CFTypeRef v178;
  const void *v179;
  uint8_t buf[8];
  uint64_t v181;
  uint64_t (*v182)(uint64_t);
  void *v183;
  uint64_t *v184;
  uint64_t *v185;
  uint64_t *v186;
  uint64_t v187;
  const void *v188;
  NSObject *v189;
  uint64_t v190;
  uint64_t *v191;
  uint64_t v192;
  int v193;
  uint64_t v194;
  uint64_t *v195;
  uint64_t v196;
  uint64_t v197;
  const __CFArray *v198;
  CFTypeRef v199;
  uint64_t v200;
  uint64_t *v201;
  uint64_t v202;
  int v203;
  int v204;
  CFDictionaryRef v205;
  uint8_t v206[8];
  uint64_t v207;
  uint64_t v208;
  void *v209;
  const __CFArray **v210;
  uint64_t v211;
  CFRange v212;
  CFRange v213;
  CFRange v214;
  CFRange v215;
  CFRange v216;
  CFRange v217;
  CFRange v218;
  CFRange v219;
  CFRange v220;
  CFRange v221;
  CFRange v222;
  CFRange v223;
  CFRange v224;
  CFRange v225;

  v2 = dispatch_semaphore_create(0);
  isDissociated = carEndpoint_isDissociated(*(_QWORD *)(a1 + 32));
  v4 = (const __CFArray *)MEMORY[0x1E0C809B0];
  v5 = "eRemoteControlSessionEventInternal";
  if (isDissociated)
  {
    v6 = -16723;
    APSLogErrorAt();
    v7 = 0;
    goto LABEL_383;
  }
  v8 = *(void **)(a1 + 40);
  v9 = *(const __CFDictionary **)(a1 + 48);
  v200 = 0;
  v201 = &v200;
  v202 = 0x2000000000;
  v203 = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v198 = 0;
  v199 = 0;
  v194 = 0;
  v195 = &v194;
  v196 = 0x2000000000;
  v197 = 0;
  v190 = 0;
  v191 = &v190;
  v192 = 0x2000000000;
  v193 = 0;
  if (*(_QWORD *)(DerivedStorage + 480))
    APSEventRecorderRecordEventWithFlags();
  v11 = LogCategoryCopyOSLogHandle();
  v12 = (void *)v11;
  if (v11)
    v13 = v11;
  else
    v13 = MEMORY[0x1E0C81028];
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C943B000, v13, OS_SIGNPOST_EVENT, 0x2B160198uLL, "AP_SIGNPOST_ENDPOINTSELECTED", (const char *)&unk_1C965D452, buf, 2u);
  }
  if (v12)
    os_release(v12);
  carEndpoint_setFeatureFlagsToDefaultValues(v8, 0, 0);
  v14 = *(NSObject **)(DerivedStorage + 144);
  *(_QWORD *)buf = v4;
  v181 = 0x40000000;
  v182 = __carEndpoint_activateInternal_block_invoke;
  v183 = &unk_1E826CBD0;
  v184 = &v200;
  v185 = &v190;
  v188 = v8;
  v189 = v2;
  v186 = &v194;
  v187 = DerivedStorage;
  dispatch_sync(v14, buf);
  if (*((_DWORD *)v201 + 6))
  {
    v7 = 0;
    v9 = 0;
    goto LABEL_70;
  }
  if (*(_QWORD *)(DerivedStorage + 480))
    APSEventRecorderRecordEvent();
  v15 = LogCategoryCopyOSLogHandle();
  v16 = (void *)v15;
  if (v15)
    v17 = v15;
  else
    v17 = MEMORY[0x1E0C81028];
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)block = 0;
    _os_signpost_emit_with_name_impl(&dword_1C943B000, v17, OS_SIGNPOST_EVENT, 0x2B8D0804uLL, "AP_SIGNPOST_CAR_SETUPREQUESTFEATURELIST_START", (const char *)&unk_1C965D452, block, 2u);
  }
  if (v16)
    os_release(v16);
  v18 = CMBaseObjectGetDerivedStorage();
  v149 = v9;
  if (*(_BYTE *)(v18 + 136))
  {
    if (v9)
    {
      Value = CFDictionaryGetValue(v9, CFSTR("FeaturesList"));
      if (Value)
        v9 = (const __CFDictionary *)CFRetain(Value);
      else
        v9 = 0;
    }
    if (gLogCategory_APEndpointCarPlay > 50
      || gLogCategory_APEndpointCarPlay == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_51;
    }
    goto LABEL_44;
  }
  *(_QWORD *)block = 0;
  v20 = *(const __CFDictionary **)(v18 + 48);
  if (v20)
    v20 = (const __CFDictionary *)CFDictionaryGetValue(v20, CFSTR("pairedVehicleIdentifier"));
  SessionFeatureKeysWithIdentifier = APCarPlay_FetchSessionFeatureKeysWithIdentifier((uint64_t)v20, (CFTypeRef *)block);
  if (SessionFeatureKeysWithIdentifier)
  {
    v28 = SessionFeatureKeysWithIdentifier;
  }
  else if (*(_QWORD *)block)
  {
    MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, *(CFArrayRef *)block);
    if (!MutableCopy)
    {
      APSLogErrorAt();
      v28 = -16721;
      goto LABEL_198;
    }
    v9 = MutableCopy;
    carEndpoint_overrideFeatureKeyWithPrefValue((int)v8, MutableCopy, CFSTR("fileTransfer"));
    carEndpoint_overrideFeatureKeyWithPrefValue((int)v8, v9, CFSTR("vehicleStateProtocol"));
    carEndpoint_overrideFeatureKeyWithPrefValue((int)v8, v9, CFSTR("logTransfer"));
    carEndpoint_overrideFeatureKeyWithPrefValue((int)v8, v9, CFSTR("uiSync"));
    carEndpoint_overrideFeatureKeyWithPrefValue((int)v8, v9, CFSTR("mainBuffered"));
    carEndpoint_overrideFeatureKeyWithPrefValue((int)v8, v9, CFSTR("hevc"));
    v23 = CMBaseObjectGetDerivedStorage();
    IntWithDefault = APSSettingsGetIntWithDefault();
    v212.length = CFArrayGetCount(v9);
    v212.location = 0;
    CountOfValue = CFArrayGetCountOfValue(v9, v212, CFSTR("enhancedSiri"));
    if (CountOfValue <= 1)
    {
      v26 = IntWithDefault == 0;
      if (CountOfValue != 1)
        v26 = 0;
      *(_BYTE *)(v23 + 56) = v26;
      if (CountOfValue && IntWithDefault && CountOfValue == 1)
      {
        v213.length = CFArrayGetCount(v9);
        v213.location = 0;
        FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v9, v213, CFSTR("enhancedSiri"));
        CFArrayRemoveValueAtIndex(v9, FirstIndexOfValue);
      }
      CFRelease(*(CFTypeRef *)block);
      if (gLogCategory_APEndpointCarPlay > 50
        || gLogCategory_APEndpointCarPlay == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_51;
      }
LABEL_44:
      LogPrintF();
LABEL_51:
      v28 = 0;
      goto LABEL_52;
    }
    APSLogErrorAt();
    v28 = -6705;
  }
  else
  {
    if (gLogCategory_APEndpointCarPlay <= 90
      && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v28 = -16720;
  }
  APSLogErrorAt();
LABEL_198:
  v9 = 0;
LABEL_52:
  *((_DWORD *)v201 + 6) = v28;
  if (*(_QWORD *)(DerivedStorage + 480))
    APSEventRecorderRecordEvent();
  v29 = LogCategoryCopyOSLogHandle();
  v30 = (void *)v29;
  if (v29)
    v31 = v29;
  else
    v31 = MEMORY[0x1E0C81028];
  if (os_signpost_enabled(v31))
  {
    *(_WORD *)block = 0;
    _os_signpost_emit_with_name_impl(&dword_1C943B000, v31, OS_SIGNPOST_EVENT, 0x2B8D0808uLL, "AP_SIGNPOST_CAR_SETUPREQUESTFEATURELIST_COMPLETE", (const char *)&unk_1C965D452, block, 2u);
  }
  if (v30)
    os_release(v30);
  if (*((_DWORD *)v201 + 6))
    goto LABEL_69;
  v32 = v195[3];
  v33 = *(_QWORD *)(DerivedStorage + 280);
  v34 = *(uint64_t (**)(uint64_t, const __CFDictionary *, uint64_t, const __CFArray **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                               + 104);
  if (!v34)
  {
    *((_DWORD *)v201 + 6) = -12782;
LABEL_69:
    APSLogErrorAt();
    v7 = 0;
LABEL_70:
    v37 = 0;
    goto LABEL_369;
  }
  v152 = DerivedStorage;
  v150 = v9;
  v35 = v34(v32, v9, v33, &v198);
  *((_DWORD *)v201 + 6) = v35;
  if (v35)
    goto LABEL_69;
  v36 = v198;
  v151 = v2;
  if (!v198)
  {
    v37 = 0;
    goto LABEL_177;
  }
  if (gLogCategory_APEndpointCarPlay <= 50)
  {
    if (gLogCategory_APEndpointCarPlay != -1 || (v38 = _LogCategory_Initialize(), v36 = v198, v38))
    {
      LogPrintF();
      v36 = v198;
    }
  }
  v39 = *((_DWORD *)v191 + 6);
  v40 = CMBaseObjectGetDerivedStorage();
  v214.length = CFArrayGetCount(v36);
  v214.location = 0;
  if (CFArrayContainsValue(v36, v214, CFSTR("altScreen")))
    *(_BYTE *)(v40 + 60) = 1;
  v215.length = CFArrayGetCount(v36);
  v215.location = 0;
  if (CFArrayContainsValue(v36, v215, CFSTR("uiContext")))
    *(_BYTE *)(v40 + 61) = 1;
  v216.length = CFArrayGetCount(v36);
  v216.location = 0;
  if (CFArrayContainsValue(v36, v216, CFSTR("viewAreas")))
    *(_BYTE *)(v40 + 59) = 1;
  if (*(_BYTE *)(v40 + 56))
  {
    v217.length = CFArrayGetCount(v36);
    v217.location = 0;
    if (CFArrayContainsValue(v36, v217, CFSTR("enhancedSiri")))
      *(_BYTE *)(v40 + 57) = 1;
  }
  v41 = *(_QWORD *)(v40 + 8);
  v42 = *(unsigned __int8 *)(v40 + 57);
  v43 = *MEMORY[0x1E0C9AE50];
  v44 = *MEMORY[0x1E0C9AE40];
  v45 = *(void (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v45)
  {
    if (v42)
      v46 = v43;
    else
      v46 = v44;
    v45(v41, CFSTR("SupportsJarvis"), v46);
  }
  if (gLogCategory_APEndpointCarPlay <= 50
    && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v218.length = CFArrayGetCount(v36);
  v218.location = 0;
  v2 = v151;
  if (CFArrayContainsValue(v36, v218, CFSTR("cornerMasks")))
  {
    *(_BYTE *)(v40 + 62) = 1;
    if (gLogCategory_APEndpointCarPlay <= 50
      && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  v219.length = CFArrayGetCount(v36);
  v219.location = 0;
  if (CFArrayContainsValue(v36, v219, CFSTR("focusTransfer")))
  {
    *(_BYTE *)(v40 + 63) = 1;
    if (gLogCategory_APEndpointCarPlay <= 50
      && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  v220.length = CFArrayGetCount(v36);
  v220.location = 0;
  if (CFArrayContainsValue(v36, v220, CFSTR("hevc")))
    *(_BYTE *)(v40 + 64) = 1;
  if (gLogCategory_APEndpointCarPlay <= 50
    && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v221.length = CFArrayGetCount(v36);
  v221.location = 0;
  if (CFArrayContainsValue(v36, v221, CFSTR("fileTransfer")))
    *(_BYTE *)(v40 + 65) = 1;
  if (gLogCategory_APEndpointCarPlay <= 50
    && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v222.length = CFArrayGetCount(v36);
  v222.location = 0;
  if (CFArrayContainsValue(v36, v222, CFSTR("logTransfer")))
    *(_BYTE *)(v40 + 104) = 1;
  if (gLogCategory_APEndpointCarPlay <= 50
    && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v223.length = CFArrayGetCount(v36);
  v223.location = 0;
  if (CFArrayContainsValue(v36, v223, CFSTR("uiSync")))
    *(_BYTE *)(v40 + 120) = 1;
  if (gLogCategory_APEndpointCarPlay <= 50
    && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v224.length = CFArrayGetCount(v36);
  v224.location = 0;
  if (CFArrayContainsValue(v36, v224, CFSTR("vehicleStateProtocol")))
    *(_BYTE *)(v40 + 80) = 1;
  if (gLogCategory_APEndpointCarPlay <= 50
    && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v225.length = CFArrayGetCount(v36);
  v225.location = 0;
  if (CFArrayContainsValue(v36, v225, CFSTR("mainBuffered")))
  {
    v47 = 1;
    *(_BYTE *)(v40 + 58) = 1;
  }
  else
  {
    v47 = *(unsigned __int8 *)(v40 + 58);
  }
  v48 = *(_QWORD *)(v40 + 8);
  v49 = *(void (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v49)
  {
    if (v47)
      v50 = v43;
    else
      v50 = v44;
    v49(v48, CFSTR("SupportsBufferedAudio"), v50);
  }
  if (gLogCategory_APEndpointCarPlay <= 50
    && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  carEndpoint_postNotification(v8, (const void *)*MEMORY[0x1E0CA3B48], v39, 0);
  *((_DWORD *)v201 + 6) = 0;
  v5 = "session_handleRemoteControlSessionEventInternal" + 13;
  if (*(_QWORD *)(v152 + 480))
    APSEventRecorderRecordEvent();
  v51 = LogCategoryCopyOSLogHandle();
  v52 = (void *)v51;
  if (v51)
    v53 = v51;
  else
    v53 = MEMORY[0x1E0C81028];
  v54 = os_signpost_enabled(v53);
  v4 = (const __CFArray *)MEMORY[0x1E0C809B0];
  if (v54)
  {
    *(_WORD *)block = 0;
    _os_signpost_emit_with_name_impl(&dword_1C943B000, v53, OS_SIGNPOST_EVENT, 0x2B8D080CuLL, "AP_SIGNPOST_CAR_INFOREQUESTFEATURELIST_START", (const char *)&unk_1C965D452, block, 2u);
  }
  if (v52)
    os_release(v52);
  v55 = CMBaseObjectGetDerivedStorage();
  theArray = 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
  {
    APSLogErrorAt();
    v61 = -16721;
    goto LABEL_165;
  }
  if (!*(_BYTE *)(v55 + 60))
  {
LABEL_160:
    if (!*(_BYTE *)(v55 + 61))
    {
      v61 = 0;
      goto LABEL_165;
    }
    UIContextMasterURLList = APCarPlay_FetchUIContextMasterURLList((CFTypeRef *)&theArray);
    if (!UIContextMasterURLList)
    {
      if (theArray)
      {
        CFDictionarySetValue(Mutable, CFSTR("uiContextURLs"), theArray);
        v61 = 0;
        *(_BYTE *)(v55 + 61) = 1;
        goto LABEL_165;
      }
      goto LABEL_418;
    }
    v61 = UIContextMasterURLList;
    goto LABEL_414;
  }
  v57 = APCarPlay_CRFetchInstrumentClusterURLs((CFTypeRef *)&theArray);
  if (!v57)
  {
    if (!theArray)
    {
LABEL_418:
      APSLogErrorAt();
      v61 = -16721;
      goto LABEL_419;
    }
    v58 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    if (!v58)
    {
      APSLogErrorAt();
      v61 = -71750;
      goto LABEL_419;
    }
    v59 = v58;
    CFArrayGetCount(theArray);
    *(_QWORD *)block = v4;
    v164 = 0x40000000;
    v165 = __carEndpoint_createInfoRequestFeatureList_block_invoke;
    v166 = &__block_descriptor_tmp_447;
    v167 = (uint64_t *)v59;
    CFArrayApplyBlock();
    CFDictionarySetValue(Mutable, CFSTR("altScreenURLs"), v59);
    if (theArray)
    {
      CFRelease(theArray);
      theArray = 0;
    }
    CFRelease(v59);
    goto LABEL_160;
  }
  v61 = v57;
LABEL_414:
  APSLogErrorAt();
LABEL_419:
  CFRelease(Mutable);
  Mutable = 0;
LABEL_165:
  if (theArray)
    CFRelease(theArray);
  *((_DWORD *)v201 + 6) = v61;
  DerivedStorage = v152;
  if (*(_QWORD *)(v152 + 480))
    APSEventRecorderRecordEvent();
  v62 = LogCategoryCopyOSLogHandle();
  v63 = (void *)v62;
  if (v62)
    v64 = v62;
  else
    v64 = MEMORY[0x1E0C81028];
  v37 = Mutable;
  if (os_signpost_enabled(v64))
  {
    *(_WORD *)block = 0;
    _os_signpost_emit_with_name_impl(&dword_1C943B000, v64, OS_SIGNPOST_EVENT, 0x2B8D0810uLL, "AP_SIGNPOST_CAR_INFOREQUESTFEATURELIST_COMPLETE", (const char *)&unk_1C965D452, block, 2u);
  }
  if (v63)
    os_release(v63);
  if (*((_DWORD *)v201 + 6))
    goto LABEL_330;
LABEL_177:
  v65 = v195[3];
  v66 = *(uint64_t (**)(uint64_t, __CFDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 112);
  if (!v66)
  {
    *((_DWORD *)v201 + 6) = -12782;
    goto LABEL_330;
  }
  v67 = v66(v65, v37);
  *((_DWORD *)v201 + 6) = v67;
  if (v67)
  {
LABEL_330:
    APSLogErrorAt();
    v7 = 0;
    v9 = v150;
    goto LABEL_369;
  }
  v148 = v37;
  v68 = CMBaseObjectGetDerivedStorage();
  v205 = 0;
  v69 = *(_QWORD *)(v68 + 8);
  v70 = CFGetAllocator(v8);
  CMBaseObject = APEndpointDescriptionGetCMBaseObject(v69);
  v72 = *(uint64_t (**)(uint64_t, const __CFString *, CFAllocatorRef, CFDictionaryRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                                 + 48);
  if (!v72)
  {
    v74 = -12782;
    goto LABEL_190;
  }
  v73 = v72(CMBaseObject, CFSTR("EndpointInfo"), v70, &v205);
  if (v73)
  {
    v74 = v73;
    goto LABEL_190;
  }
  if (CFDictionaryContainsKey(v205, CFSTR("uiContextLastOnDisplayURLs"))
    || CFDictionaryContainsKey(v205, CFSTR("uiContextNowOnDisplayURLs")))
  {
    if (!*(_BYTE *)(v68 + 61)
      && gLogCategory_APEndpointCarPlay <= 60
      && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (*(_BYTE *)(v68 + 61))
  {
    if (gLogCategory_APEndpointCarPlay <= 90
      && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v74 = -16720;
    goto LABEL_190;
  }
  v75 = (const __CFArray *)CFDictionaryGetValue(v205, CFSTR("displays"));
  if (!v75)
  {
    if (gLogCategory_APEndpointCarPlay <= 90
      && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v74 = -16720;
    APSLogErrorAt();
    v2 = v151;
    goto LABEL_314;
  }
  Count = CFArrayGetCount(v75);
  theArray = 0;
  p_theArray = (uint64_t)&theArray;
  v174 = 0x2000000000;
  LOBYTE(v175) = 0;
  v204 = 0;
  v77 = CFDictionaryContainsKey(v205, CFSTR("hevcInfo"));
  v78 = 8912896;
  if (!v77)
    v78 = 9437184;
  v147 = v78;
  if (Count < 1)
  {
    v146 = 0;
    v144 = 0;
LABEL_237:
    if (*(_BYTE *)(v68 + 60))
    {
      v95 = Count <= 1;
      v2 = v151;
      if (!v95)
        goto LABEL_247;
      v5 = "session_handleRemoteControlSessionEventInternal" + 13;
      DerivedStorage = v152;
      if (gLogCategory_APEndpointCarPlay > 90
        || gLogCategory_APEndpointCarPlay == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_312;
      }
    }
    else
    {
      v95 = Count < 2;
      v2 = v151;
      if (v95)
      {
LABEL_247:
        v5 = "session_handleRemoteControlSessionEventInternal" + 13;
        DerivedStorage = v152;
        if (*(_BYTE *)(v68 + 59))
        {
          if (!v146)
          {
            if (gLogCategory_APEndpointCarPlay > 90
              || gLogCategory_APEndpointCarPlay == -1 && !_LogCategory_Initialize())
            {
              goto LABEL_312;
            }
            goto LABEL_292;
          }
        }
        else if (v146 == 1
               && gLogCategory_APEndpointCarPlay <= 60
               && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (*(_BYTE *)(v68 + 63))
        {
          if (!*(_BYTE *)(p_theArray + 24))
          {
            *(_BYTE *)(v68 + 63) = 0;
            if (gLogCategory_APEndpointCarPlay > 90
              || gLogCategory_APEndpointCarPlay == -1 && !_LogCategory_Initialize())
            {
              goto LABEL_312;
            }
            goto LABEL_292;
          }
        }
        else if (*(_BYTE *)(p_theArray + 24) == 1
               && gLogCategory_APEndpointCarPlay <= 60
               && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (*(_BYTE *)(v68 + 62))
        {
          if (!v144)
          {
            *(_BYTE *)(v68 + 62) = 0;
            if (gLogCategory_APEndpointCarPlay > 90
              || gLogCategory_APEndpointCarPlay == -1 && !_LogCategory_Initialize())
            {
              goto LABEL_312;
            }
            goto LABEL_292;
          }
        }
        else if (v144 == 1
               && gLogCategory_APEndpointCarPlay <= 60
               && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        _Block_object_dispose(&theArray, 8);
        v139 = carEndpoint_validateInfoResponseKeyPresentForFeature((int)v8, v205, CFSTR("hevcInfo"), *(_BYTE *)(v68 + 64) != 0);
        if (v139)
        {
          v74 = v139;
        }
        else
        {
          v140 = carEndpoint_validateInfoResponseKeyPresentForFeature((int)v8, v205, CFSTR("mainBufferedInfo"), *(_BYTE *)(v68 + 58) != 0);
          if (v140)
          {
            v74 = v140;
          }
          else
          {
            v141 = carEndpoint_validateInfoResponseKeyPresentForFeature((int)v8, v205, CFSTR("fileTransferInfo"), *(_BYTE *)(v68 + 65) != 0);
            if (v141)
            {
              v74 = v141;
            }
            else
            {
              v142 = carEndpoint_validateInfoResponseKeyPresentForFeature((int)v8, v205, CFSTR("vehicleStateProtocolInfo"), *(_BYTE *)(v68 + 80) != 0);
              if (v142)
              {
                v74 = v142;
              }
              else
              {
                v143 = carEndpoint_validateInfoResponseKeyPresentForFeature((int)v8, v205, CFSTR("logTransferInfo"), *(_BYTE *)(v68 + 104) != 0);
                if (v143)
                {
                  v74 = v143;
                }
                else
                {
                  v74 = carEndpoint_validateInfoResponseKeyPresentForFeature((int)v8, v205, CFSTR("uiSyncInfo"), *(_BYTE *)(v68 + 120) != 0);
                  if (!v74)
                    goto LABEL_314;
                }
              }
            }
          }
        }
LABEL_190:
        APSLogErrorAt();
        goto LABEL_314;
      }
      v5 = "session_handleRemoteControlSessionEventInternal" + 13;
      DerivedStorage = v152;
      if (gLogCategory_APEndpointCarPlay > 90
        || gLogCategory_APEndpointCarPlay == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_312;
      }
    }
LABEL_292:
    LogPrintF();
LABEL_312:
    APSLogErrorAt();
    goto LABEL_313;
  }
  v144 = 0;
  v146 = 0;
  v79 = 0;
  v80 = *MEMORY[0x1E0C9D820];
  v81 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v145 = a1;
  while (1)
  {
    *(_QWORD *)v206 = 0;
    v207 = (uint64_t)v206;
    v208 = 0x2000000000;
    LOBYTE(v209) = 0;
    CFDictionaryGetTypeID();
    TypedValueAtIndex = CFArrayGetTypedValueAtIndex();
    if (v204)
      v83 = 1;
    else
      v83 = TypedValueAtIndex == 0;
    if (v83)
      goto LABEL_231;
    v84 = (const __CFDictionary *)TypedValueAtIndex;
    v85 = v8;
    Int64 = CFDictionaryGetInt64();
    v87 = CFDictionaryGetInt64();
    v88 = CFDictionaryGetInt64();
    v89 = CFDictionaryGetInt64();
    if (!Int64 || !v87)
    {
      if (gLogCategory_APEndpointCarPlay > 90
        || gLogCategory_APEndpointCarPlay == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_277;
      }
LABEL_257:
      LogPrintF();
LABEL_277:
      APSLogErrorAt();
      v2 = v151;
      DerivedStorage = v152;
      v4 = (const __CFArray *)MEMORY[0x1E0C809B0];
      v5 = "session_handleRemoteControlSessionEventInternal" + 13;
      v8 = v85;
      goto LABEL_278;
    }
    if (v87 * Int64 > v147)
    {
      if (gLogCategory_APEndpointCarPlay <= 90
        && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_257;
      }
      goto LABEL_277;
    }
    v90 = v80 == (double)(unint64_t)v88 && v81 == (double)(unint64_t)v89;
    if (!v90 && (!v88 || !v89))
    {
      v4 = (const __CFArray *)MEMORY[0x1E0C809B0];
      v8 = v85;
      if (gLogCategory_APEndpointCarPlay <= 90
        && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      APSLogErrorAt();
LABEL_286:
      v2 = v151;
      DerivedStorage = v152;
      v5 = "session_handleRemoteControlSessionEventInternal" + 13;
LABEL_278:
      a1 = v145;
      goto LABEL_279;
    }
    v91 = CFDictionaryContainsKey(v84, CFSTR("viewAreas"));
    v4 = (const __CFArray *)MEMORY[0x1E0C809B0];
    v8 = v85;
    if (v91
      || CFDictionaryContainsKey(v84, CFSTR("initialViewArea"))
      || CFDictionaryContainsKey(v84, CFSTR("adjacentViewAreas")))
    {
      v92 = (const __CFArray *)CFDictionaryGetValue(v84, CFSTR("viewAreas"));
      if (v92)
      {
        v93 = v92;
        v157 = 0;
        v158 = (uint64_t)&v157;
        v159 = 0x2000000000;
        LODWORD(v160) = 0;
        v94 = CFGetTypeID(v92);
        if (v94 != CFArrayGetTypeID())
          goto LABEL_410;
        CFArrayGetCount(v93);
        *(_QWORD *)block = v4;
        v164 = 0x40000000;
        v165 = __carEndpoint_validateEnabledFeaturesWithAccessory_block_invoke;
        v166 = &unk_1E826D2B8;
        v167 = (uint64_t *)&v157;
        v168 = &theArray;
        v169 = v206;
        CFArrayApplyBlock();
        if (*(_DWORD *)(v158 + 24))
        {
LABEL_410:
          APSLogErrorAt();
          _Block_object_dispose(&v157, 8);
          goto LABEL_286;
        }
        _Block_object_dispose(&v157, 8);
      }
      v146 = 1;
    }
    if (CFDictionaryContainsKey(v84, CFSTR("cornerMasks")) && CFDictionaryGetInt64())
      break;
LABEL_230:
    a1 = v145;
LABEL_231:
    _Block_object_dispose(v206, 8);
    if (Count == ++v79)
      goto LABEL_237;
  }
  if (!*(_BYTE *)(v207 + 24))
  {
    v144 = 1;
    goto LABEL_230;
  }
  a1 = v145;
  if (gLogCategory_APEndpointCarPlay <= 90
    && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  APSLogErrorAt();
  v2 = v151;
  DerivedStorage = v152;
  v5 = "session_handleRemoteControlSessionEventInternal" + 13;
LABEL_279:
  _Block_object_dispose(v206, 8);
LABEL_313:
  _Block_object_dispose(&theArray, 8);
  v74 = -16720;
LABEL_314:
  if (v205)
    CFRelease(v205);
  *((_DWORD *)v201 + 6) = v74;
  if (v74)
  {
    APSLogErrorAt();
LABEL_408:
    v7 = 0;
    v9 = v150;
    v37 = v148;
    goto LABEL_369;
  }
  v96 = APEndpointDescriptionGetCMBaseObject(*(_QWORD *)(DerivedStorage + 8));
  v97 = *(uint64_t (**)(uint64_t, const __CFString *, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 8)
                                                                                   + 48);
  if (!v97)
  {
    *((_DWORD *)v201 + 6) = -12782;
    goto LABEL_329;
  }
  v98 = v97(v96, CFSTR("HIDs"), 0, &v199);
  *((_DWORD *)v201 + 6) = v98;
  if (v98)
  {
LABEL_329:
    v37 = v148;
    goto LABEL_330;
  }
  v99 = *(NSObject **)(DerivedStorage + 144);
  theArray = v4;
  p_theArray = 0x40000000;
  v174 = (uint64_t)__carEndpoint_activateInternal_block_invoke_98;
  v175 = &unk_1E826CBF8;
  v176 = &v200;
  v177 = DerivedStorage;
  v178 = v199;
  v179 = v8;
  dispatch_sync(v99, &theArray);
  if (*((_DWORD *)v201 + 6))
    goto LABEL_408;
  v100 = CMBaseObjectGetDerivedStorage();
  carEndpoint_registerForGlobalNotification((uint64_t)v8, (uint64_t)"com.apple.airplay.overrideTBTPrefsChanged", (uint64_t)carEndpoint_handleOverrideTurnByTurnConfigurationChanged, v100 + 320);
  v101 = *(NSObject **)(v100 + 456);
  *(_QWORD *)block = v4;
  v164 = 0x40000000;
  v165 = __carEndpoint_registerForOverrideTurnByTurnConfigurationChangedNotification_block_invoke;
  v166 = &__block_descriptor_tmp_507;
  v167 = (uint64_t *)v8;
  dispatch_async(v101, block);
  v102 = *(NSObject **)(DerivedStorage + 144);
  *(_QWORD *)block = v4;
  v164 = 0x40000000;
  v165 = __carEndpoint_activateInternal_block_invoke_2_102;
  v166 = &unk_1E826CC20;
  v169 = (uint8_t *)DerivedStorage;
  v170 = v8;
  v171 = v149;
  v167 = &v200;
  v168 = (CFArrayRef *)&v190;
  dispatch_sync(v102, block);
  if (*((_DWORD *)v201 + 6))
    goto LABEL_408;
  if (*(_BYTE *)(DerivedStorage + 57))
  {
    v103 = (NSObject **)CMBaseObjectGetDerivedStorage();
    carEndpoint_registerForGlobalNotification((uint64_t)v8, (uint64_t)"com.apple.coreaudio.BorealisToggled", (uint64_t)carEndpoint_handleJarvisParametersChangedNotification, (uint64_t)v103 + 396);
    carEndpoint_registerForGlobalNotification((uint64_t)v8, (uint64_t)"com.apple.corespeech.voicetriggerassetchange", (uint64_t)carEndpoint_handleJarvisParametersChangedNotification, (uint64_t)(v103 + 50));
    carEndpoint_registerForGlobalNotification((uint64_t)v8, (uint64_t)"com.apple.airplay.jarvisParametersChanged", (uint64_t)carEndpoint_handleJarvisParametersChangedNotification, (uint64_t)(v103 + 49));
    carEndpoint_registerForGlobalNotification((uint64_t)v8, (uint64_t)"com.apple.mobile.keybagd.first_unlock", (uint64_t)carEndpoint_handleJarvisParametersChangedNotification, (uint64_t)v103 + 404);
    carEndpoint_registerForGlobalNotification((uint64_t)v8, (uint64_t)kAPCarPlaySpringBoardStartNotificationKey, (uint64_t)carEndpoint_handleJarvisParametersChangedNotification, (uint64_t)(v103 + 51));
    v104 = *v103;
    *(_QWORD *)v206 = v4;
    v207 = 0x40000000;
    v208 = (uint64_t)__carEndpoint_setupNotificationsAndInitialParametersForJarvis_block_invoke;
    v209 = &__block_descriptor_tmp_583;
    v210 = (const __CFArray **)v8;
    dispatch_async(v104, v206);
    APCarPlayAVVCServerRegisterEndpoint(v8);
  }
  APSEventRecorderRecordEvent();
  v105 = CMBaseObjectGetDerivedStorage();
  v157 = 0;
  v158 = (uint64_t)&v157;
  v159 = 0x2000000000;
  LODWORD(v160) = 0;
  v106 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (v106)
  {
    v107 = v106;
    if (gLogCategory_APEndpointCarPlay <= 50
      && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
    {
      v108 = CFGetAllocator(v8);
      v109 = CFStringCreateMutable(v108, 0);
      v110 = v109;
      if (v109)
        CFStringAppendFormat(v109, 0, CFSTR("CarPlay Connection: AirPlay Timing Information For %@\n"), *(_QWORD *)(v105 + 16));
    }
    else
    {
      v110 = 0;
    }
    v112 = *(_QWORD *)(v105 + 480);
    v111 = *(_QWORD *)(v105 + 488);
    if (*(_BYTE *)(v105 + 40))
    {
      carEndpoint_addEventIntervalToPerformanceDictionaryAndLog(v111, 268427268, v112, 268304385, (uint64_t)CFSTR("Total AirPlay Contribution (Endpoint Detected To Endpoint Activate Complete)"), (uint64_t)v107, (uint64_t)v110);
      *(_DWORD *)(v105 + 428) = APSEventRecorderGetTimeBetweenEventsInMilliSecondRecursive();
      v113 = *(_QWORD *)(v105 + 488);
      v114 = CFSTR("EndpointDetectedOverWiFiTime");
      v115 = 268427268;
    }
    else
    {
      carEndpoint_addEventIntervalToPerformanceDictionaryAndLog(v111, 268427269, v112, 268304385, (uint64_t)CFSTR("Total AirPlay Contribution (Endpoint Detected To Endpoint Activate Complete)"), (uint64_t)v107, (uint64_t)v110);
      *(_DWORD *)(v105 + 428) = APSEventRecorderGetTimeBetweenEventsInMilliSecondRecursive();
      v113 = *(_QWORD *)(v105 + 488);
      v114 = CFSTR("EndpointDetectedOverUSBTime");
      v115 = 268427269;
    }
    carEndpoint_addEventToPerformanceDictionaryAndLog(v113, v115, (uint64_t)v114, (uint64_t)v107, (uint64_t)v110);
    carEndpoint_addEventToPerformanceDictionaryAndLog(*(_QWORD *)(v105 + 488), 268427275, (uint64_t)CFSTR("CarPlayControlConnectCommandReceived"), (uint64_t)v107, (uint64_t)v110);
    carEndpoint_addEventToPerformanceDictionaryAndLog(*(_QWORD *)(v105 + 480), 150994945, (uint64_t)CFSTR("ResolveDNSTime"), (uint64_t)v107, (uint64_t)v110);
    carEndpoint_addEventToPerformanceDictionaryAndLog(*(_QWORD *)(v105 + 488), 268427266, (uint64_t)CFSTR("USBBrowsingStartTime"), (uint64_t)v107, (uint64_t)v110);
    carEndpoint_addEventToPerformanceDictionaryAndLog(*(_QWORD *)(v105 + 488), 268427267, (uint64_t)CFSTR("WiFiBrowsingStartTime"), (uint64_t)v107, (uint64_t)v110);
    carEndpoint_addEventToPerformanceDictionaryAndLog(*(_QWORD *)(v105 + 480), 268304384, (uint64_t)CFSTR("EndpointActivate"), (uint64_t)v107, (uint64_t)v110);
    carEndpoint_addEventToPerformanceDictionaryAndLog(*(_QWORD *)(v105 + 480), 150994944, (uint64_t)CFSTR("QuerySRVTime"), (uint64_t)v107, (uint64_t)v110);
    carEndpoint_addEventToPerformanceDictionaryAndLog(*(_QWORD *)(v105 + 480), 150994946, (uint64_t)CFSTR("ConnectTime"), (uint64_t)v107, (uint64_t)v110);
    carEndpoint_addEventToPerformanceDictionaryAndLog(*(_QWORD *)(v105 + 480), 150994948, (uint64_t)CFSTR("ConnectedTime"), (uint64_t)v107, (uint64_t)v110);
    carEndpoint_addEventToPerformanceDictionaryAndLog(*(_QWORD *)(v105 + 480), 250609664, (uint64_t)CFSTR("EndpointConnectionStartTime"), (uint64_t)v107, (uint64_t)v110);
    carEndpoint_addEventToPerformanceDictionaryAndLog(*(_QWORD *)(v105 + 480), 250609668, (uint64_t)CFSTR("EndpointGetInfoCompleteTime"), (uint64_t)v107, (uint64_t)v110);
    carEndpoint_addEventIntervalToPerformanceDictionaryAndLog(*(_QWORD *)(v105 + 480), 250609667, *(_QWORD *)(v105 + 480), 250609668, (uint64_t)CFSTR("INFOTimeMs"), (uint64_t)v107, (uint64_t)v110);
    carEndpoint_addEventIntervalToPerformanceDictionaryAndLog(*(_QWORD *)(v105 + 480), 150994946, *(_QWORD *)(v105 + 480), 150994948, (uint64_t)CFSTR("ConnectTimeMs"), (uint64_t)v107, (uint64_t)v110);
    carEndpoint_addEventIntervalToPerformanceDictionaryAndLog(*(_QWORD *)(v105 + 480), 250609677, *(_QWORD *)(v105 + 480), 250609678, (uint64_t)CFSTR("EndpointAUTHTimeMs"), (uint64_t)v107, (uint64_t)v110);
    carEndpoint_addEventIntervalToPerformanceDictionaryAndLog(*(_QWORD *)(v105 + 480), 250609675, *(_QWORD *)(v105 + 480), 250609676, (uint64_t)CFSTR("EndpointRECORDTimeMs"), (uint64_t)v107, (uint64_t)v110);
    TimeBetweenEventsInMilliSecondRecursive = APSEventRecorderGetTimeBetweenEventsInMilliSecondRecursive();
    v117 = APSEventRecorderGetTimeBetweenEventsInMilliSecondRecursive() + TimeBetweenEventsInMilliSecondRecursive;
    v118 = APSEventRecorderGetTimeBetweenEventsInMilliSecondRecursive();
    v119 = v117 + v118 + APSEventRecorderGetTimeBetweenEventsInMilliSecondRecursive();
    v120 = APSEventRecorderGetTimeBetweenEventsInMilliSecondRecursive();
    carEndpoint_addIntervalToPerformanceDictionaryAndLog(v119 + v120, (uint64_t)CFSTR("EndpointTotalSETUPTimeMs"), (uint64_t)v107, (uint64_t)v110);
    if (*(_QWORD *)(v105 + 480))
      APSEventRecorderRecordEvent();
    v121 = LogCategoryCopyOSLogHandle();
    v122 = (void *)v121;
    if (v121)
      v123 = v121;
    else
      v123 = MEMORY[0x1E0C81028];
    v2 = v151;
    if (os_signpost_enabled(v123))
    {
      *(_WORD *)v206 = 0;
      _os_signpost_emit_with_name_impl(&dword_1C943B000, v123, OS_SIGNPOST_EVENT, 0x2B8D07E8uLL, "AP_SIGNPOST_CAR_SENT_STATISTICS", (const char *)&unk_1C965D452, v206, 2u);
    }
    if (v122)
      os_release(v122);
    if (gLogCategory_APEndpointCarPlay <= 50
      && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v124 = *(NSObject **)(v105 + 144);
    *(_QWORD *)v206 = MEMORY[0x1E0C809B0];
    v207 = 0x40000000;
    v208 = (uint64_t)__carEndpoint_postPerformanceReport_block_invoke;
    v209 = &unk_1E826D598;
    v210 = &v157;
    v211 = v105;
    dispatch_sync(v124, v206);
    carEndpoint_postNotification(v8, (const void *)*MEMORY[0x1E0CA3B80], *(_DWORD *)(v158 + 24), v107);
    CFRelease(v107);
    if (v110)
      CFRelease(v110);
  }
  else
  {
    APSLogErrorAt();
  }
  _Block_object_dispose(&v157, 8);
  carEndpoint_powerLogActivation((uint64_t)v8, 1);
  CMBaseObjectGetDerivedStorage();
  v125 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!v125)
  {
    APSLogErrorAt();
    v4 = (const __CFArray *)MEMORY[0x1E0C809B0];
    v5 = "session_handleRemoteControlSessionEventInternal" + 13;
    v127 = v152;
    v9 = v150;
    v37 = v148;
    goto LABEL_353;
  }
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  carEndpoint_addSignPostTimeToDictionary();
  v126 = APCarPlay_AddSignPostTimeInfoToTimeStore((uint64_t)CFSTR("CARAirPlayConnectionTimeInfo"), (uint64_t)v125);
  v4 = (const __CFArray *)MEMORY[0x1E0C809B0];
  v5 = "eRemoteControlSessionEventInternal";
  v127 = v152;
  v9 = v150;
  v37 = v148;
  if (v126)
  {
LABEL_353:
    if (gLogCategory_APEndpointCarPlay <= 90
      && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v125)
      goto LABEL_358;
  }
  else
  {
LABEL_358:
    CFRelease(v125);
  }
  if (gLogCategory_APEndpointCarPlay <= 50
    && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v7 = *((_DWORD *)v191 + 6);
  if (introspector_getCollectionOfActiveCarPlayEndpoints_once != -1)
    dispatch_once(&introspector_getCollectionOfActiveCarPlayEndpoints_once, &__block_literal_global_23);
  if (introspector_getCollectionOfActiveCarPlayEndpoints_coll)
  {
    v128 = *(NSObject **)introspector_getCollectionOfActiveCarPlayEndpoints_coll;
    *(_QWORD *)v206 = v4;
    v207 = 0x40000000;
    v208 = (uint64_t)__carEndpoint_activateInternal_block_invoke_2_110;
    v209 = &__block_descriptor_tmp_111;
    v210 = (const __CFArray **)introspector_getCollectionOfActiveCarPlayEndpoints_coll;
    v211 = (uint64_t)v8;
    dispatch_sync(v128, v206);
  }
  if (APSSettingsGetInt64())
  {
    v129 = *(NSObject **)(v127 + 144);
    v157 = v4;
    v158 = 0x40000000;
    v159 = (uint64_t)__carEndpoint_activateInternal_block_invoke_3_114;
    v160 = &unk_1E826CC68;
    v161 = &v200;
    v162 = v127;
    dispatch_async(v129, &v157);
  }
LABEL_369:
  if (*((_DWORD *)v201 + 6))
  {
    dispatch_semaphore_signal(v2);
    carEndpoint_deactivateInternal(v8, 0, (uint64_t)CFSTR("Activation Failed"), 0);
  }
  v130 = (const void *)v195[3];
  if (v130)
    CFRelease(v130);
  if (v199)
    CFRelease(v199);
  if (v9)
    CFRelease(v9);
  if (v198)
    CFRelease(v198);
  if (v37)
    CFRelease(v37);
  v6 = *((_DWORD *)v201 + 6);
  _Block_object_dispose(&v190, 8);
  _Block_object_dispose(&v194, 8);
  _Block_object_dispose(&v200, 8);
  if (v6)
    APSLogErrorAt();
LABEL_383:
  v131 = *(_QWORD *)(a1 + 32);
  v132 = *(NSObject **)(v131 + 144);
  v156[0] = v4;
  v133 = *((_QWORD *)v5 + 227);
  v156[1] = v133;
  v156[2] = __carEndpoint_Activate_block_invoke_2;
  v156[3] = &__block_descriptor_tmp_80;
  v156[4] = v131;
  dispatch_sync(v132, v156);
  if (!v6)
  {
    v6 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 212);
    if (v6)
    {
      if (gLogCategory_APEndpointCarPlay <= 90
        && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      dispatch_semaphore_signal(v2);
      carEndpoint_deactivateInternal(*(const void **)(a1 + 40), 0, (uint64_t)CFSTR("Activation failed, endpointStatus error "), 0);
      v7 = 0;
    }
  }
  CFRetain(*(CFTypeRef *)(a1 + 40));
  dispatch_retain(v2);
  v134 = *(_QWORD *)(a1 + 40);
  v135 = **(NSObject ***)(a1 + 32);
  v153[0] = v4;
  v153[2] = __carEndpoint_Activate_block_invoke_3;
  v153[3] = &__block_descriptor_tmp_85;
  v136 = *(_QWORD *)(a1 + 64);
  v153[4] = *(_QWORD *)(a1 + 56);
  v153[5] = v134;
  v153[1] = v133;
  v154 = v7;
  v155 = v6;
  v137 = *(_QWORD *)(a1 + 72);
  v153[6] = v136;
  v153[7] = v137;
  v153[8] = v2;
  dispatch_async(v135, v153);
  if (v7)
    carEndpoint_postActivationNotification(*(const void **)(a1 + 40), (const void *)*MEMORY[0x1E0CA3B38], v7);
  CFRelease(*(CFTypeRef *)(a1 + 40));
  v138 = *(const void **)(a1 + 48);
  if (v138)
    CFRelease(v138);
  dispatch_release(v2);
}

uint64_t __carEndpoint_Activate_block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 324) = 0;
  return result;
}

void __carEndpoint_Activate_block_invoke_3(uint64_t a1)
{
  void (*v2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);

  v2 = *(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 32);
  if (v2)
    v2(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 72), *(unsigned int *)(a1 + 76), *(_QWORD *)(a1 + 56));
  if (gLogCategory_APEndpointCarPlay <= 30
    && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!*(_DWORD *)(a1 + 76))
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
  dispatch_release(*(dispatch_object_t *)(a1 + 64));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __endpointCluster_Activate_block_invoke(uint64_t a1, const void *a2)
{
  CompletionCallbackContextAddSubEndpoint(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 312), a2);
}

@end
