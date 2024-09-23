@implementation Resume

void __screenstreamudp_Resume_block_invoke(uint64_t a1)
{
  const void *v2;
  _QWORD *v3;
  _BYTE *DerivedStorage;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const __CFAllocator *v9;
  CFMutableDictionaryRef Mutable;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, CFMutableDictionaryRef);
  int v13;
  int v14;
  uint64_t Int64;
  uint64_t CMBaseObject;
  uint64_t (*v17)(uint64_t, _QWORD, uint64_t);
  int v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  int v21;
  uint64_t v22;
  __CFDictionary *v23;
  __CFDictionary *v24;
  const void *v25;
  const void *v26;
  const void *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, _QWORD, const __CFAllocator *, const void **);
  int v30;
  const void *v31;
  const __CFDictionary *DisplayHDRMode;
  const void *v33;
  __CFDictionary *v34;
  int v35;
  CFMutableDictionaryRef v36;
  int v37;
  int v38;
  const void *v39;
  CFStringRef v40;
  const void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t, __CFDictionary *, const __CFDictionary **, CFTypeRef *, _QWORD);
  int v45;
  const __CFDictionary *v46;
  _QWORD *v47;
  uint64_t TypedValue;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, _QWORD, uint64_t);
  const __CFDictionary *Value;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t);
  int v56;
  const void *v57;
  uint64_t (*v58)(uint64_t, uint64_t, const void *, const void **);
  int v59;
  int v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, const __CFString *, const __CFAllocator *, CFTypeRef *);
  int v63;
  const void *v64;
  CFTypeRef v65;
  uint64_t (*v66)(const void *, CFTypeRef, const void *);
  int v67;
  int v68;
  const void *v69;
  uint64_t (*v70)(const void *);
  int v71;
  const void *v72;
  uint64_t (*v73)(const void *);
  int v74;
  const void *v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(uint64_t);
  uint64_t v79;
  uint64_t (*v80)(uint64_t, _QWORD, const __CFAllocator *, const __CFData **);
  int v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, const __CFString *, const __CFAllocator *, CFTypeRef *);
  int v84;
  CFTypeRef v85;
  uint64_t (*v86)(CFTypeRef, CFStringRef, uint64_t, CFTypeRef *, uint64_t, CFTypeRef *);
  int v87;
  uint64_t v88;
  const __CFDictionary *v89;
  uint64_t v90;
  uint64_t v91;
  CFTypeRef cf;
  uint64_t v93;
  _QWORD *v94;
  const void *v95;
  const __CFAllocator *allocator;
  int v97;
  const void *v98;
  _BYTE *v99;
  int v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  CFTypeRef v107;
  CFTypeRef v108;
  CFTypeRef v109;
  uint64_t v110;
  const __CFData *v111;
  uint64_t v112;
  const __CFDictionary *v113;
  CFTypeRef v114;
  int v115;
  CFTypeRef v116;
  const void *v117;
  _QWORD buffer[5];
  CFRange v119;

  buffer[2] = *MEMORY[0x1E0C80C00];
  v2 = *(const void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 48))
    v3 = (_QWORD *)(a1 + 56);
  else
    v3 = 0;
  DerivedStorage = (_BYTE *)CMBaseObjectGetDerivedStorage();
  if (DerivedStorage[24])
  {
    v38 = -16762;
    goto LABEL_192;
  }
  v5 = DerivedStorage;
  if (DerivedStorage[26] || !DerivedStorage[25])
    goto LABEL_77;
  v6 = CMBaseObjectGetDerivedStorage();
  v113 = 0;
  v114 = 0;
  buffer[0] = 0;
  buffer[1] = 0;
  v111 = 0;
  v112 = 0;
  v109 = 0;
  v110 = 0;
  v107 = 0;
  v108 = 0;
  v106 = 0;
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v101 = *MEMORY[0x1E0C9D820];
  v100 = 0;
  v99 = v5;
  if (!*(_QWORD *)(v6 + 48))
  {
    v38 = -16760;
LABEL_197:
    APSLogErrorAt();
    v24 = 0;
    Mutable = 0;
    goto LABEL_40;
  }
  v7 = v6;
  if (!*(_QWORD *)(v6 + 40))
  {
    v38 = -16760;
    goto LABEL_197;
  }
  v8 = RandomBytes();
  if (v8)
  {
    v38 = v8;
    goto LABEL_197;
  }
  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  FigCFDictionarySetInt32();
  FigCFDictionarySetInt32();
  FigCFDictionarySetInt32();
  v11 = *(_QWORD *)(v7 + 48);
  v12 = *(uint64_t (**)(uint64_t, uint64_t, CFMutableDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                           + 64);
  if (!v12)
  {
    v38 = -12782;
LABEL_39:
    APSLogErrorAt();
    v24 = 0;
LABEL_40:
    v39 = 0;
    v40 = 0;
LABEL_46:
    if (gLogCategory_APEndpointStreamScreenUDP <= 90
      && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      if (!v39)
        goto LABEL_53;
    }
    else if (!v39)
    {
      goto LABEL_53;
    }
LABEL_52:
    CFRelease(v39);
    goto LABEL_53;
  }
  v13 = v12(v11, 1935897205, Mutable);
  if (v13)
  {
    v38 = v13;
    goto LABEL_39;
  }
  v14 = objc_msgSend(*(id *)(v7 + 40), "getClientUPID:", &v112);
  if (v14)
  {
    v38 = v14;
    goto LABEL_39;
  }
  Int64 = CFNumberCreateInt64();
  CMBaseObject = FigTransportStreamGetCMBaseObject();
  v17 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  v98 = (const void *)Int64;
  if (!v17)
  {
    v38 = -12782;
LABEL_43:
    APSLogErrorAt();
    v24 = 0;
LABEL_44:
    v40 = 0;
LABEL_45:
    v39 = v98;
    goto LABEL_46;
  }
  v18 = v17(CMBaseObject, *MEMORY[0x1E0CF1F28], Int64);
  if (v18)
  {
    v38 = v18;
    goto LABEL_43;
  }
  v19 = *(_QWORD *)(v7 + 104);
  v20 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v20)
  {
    v38 = -12782;
    goto LABEL_43;
  }
  allocator = v9;
  v94 = v3;
  v21 = v20(v19);
  if (v21)
  {
    v38 = v21;
    goto LABEL_43;
  }
  v95 = v2;
  v22 = CMBaseObjectGetDerivedStorage();
  v117 = 0;
  v23 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v24 = v23;
  if (!v23)
  {
    APSLogErrorAt();
    v38 = -6728;
LABEL_202:
    APSLogErrorAt();
    v40 = 0;
    v2 = v95;
    goto LABEL_130;
  }
  v25 = (const void *)*MEMORY[0x1E0C9AE50];
  CFDictionarySetValue(v23, CFSTR("useAVConfMirroring"), (const void *)*MEMORY[0x1E0C9AE50]);
  FigCFDictionarySetInt32();
  v26 = (const void *)*MEMORY[0x1E0C9AE40];
  if (*(_BYTE *)(v22 + 268))
    v27 = v25;
  else
    v27 = (const void *)*MEMORY[0x1E0C9AE40];
  CFDictionarySetValue(v24, CFSTR("remoteShouldShowHUD"), v27);
  v28 = FigTransportStreamGetCMBaseObject();
  v29 = *(uint64_t (**)(uint64_t, _QWORD, const __CFAllocator *, const void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                        + 48);
  if (!v29)
  {
    v38 = -12782;
LABEL_81:
    APSLogErrorAt();
    v34 = 0;
LABEL_82:
    v36 = 0;
LABEL_83:
    CFRelease(v24);
    v24 = 0;
    goto LABEL_86;
  }
  v30 = v29(v28, *MEMORY[0x1E0CF1F70], allocator, &v117);
  if (v30)
  {
    v38 = v30;
    goto LABEL_81;
  }
  CFDictionarySetValue(v24, CFSTR("networkInfo"), v117);
  v31 = (const void *)objc_msgSend(*(id *)(v22 + 40), "negotiationDataForPresentationMode:", *(_QWORD *)(v22 + 240) == 1);
  if (!v31)
  {
    APSLogErrorAt();
    v34 = 0;
    v36 = 0;
    v38 = -16761;
    goto LABEL_83;
  }
  CFDictionarySetValue(v24, CFSTR("negotiationData"), v31);
  CFDictionarySetInt64();
  DisplayHDRMode = screenstreamudp_getDisplayHDRMode(v22);
  CFDictionarySetInt64();
  if (DisplayHDRMode)
    CFDictionarySetValue(v24, CFSTR("displayHDRMode"), DisplayHDRMode);
  if (*(_BYTE *)(v22 + 255))
    v33 = v25;
  else
    v33 = v26;
  CFDictionarySetValue(v24, CFSTR("hdrMirroringSupported"), v33);
  v34 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!v34)
  {
    APSLogErrorAt();
    v36 = 0;
LABEL_210:
    v38 = -6728;
    goto LABEL_83;
  }
  if (!*(_BYTE *)(v22 + 112))
    goto LABEL_35;
  v35 = RandomBytes();
  if (v35)
  {
    v38 = v35;
    APSLogErrorAt();
    goto LABEL_82;
  }
  v36 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!v36)
  {
    APSLogErrorAt();
    goto LABEL_210;
  }
  v37 = CFDictionarySetInt64();
  if (v37)
  {
    v38 = v37;
    APSLogErrorAt();
    goto LABEL_83;
  }
  CFDictionarySetValue(v34, CFSTR("streamConnectionTypeMediaDataControl"), v36);
  CFRelease(v36);
LABEL_35:
  CFDictionarySetValue(v24, CFSTR("streamConnections"), v34);
  if (gLogCategory_APEndpointStreamScreenUDP <= 40
    && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v36 = 0;
  v38 = 0;
LABEL_86:
  if (v117)
    CFRelease(v117);
  if (v34)
    CFRelease(v34);
  if (v36)
    CFRelease(v36);
  v2 = v95;
  if (v38)
    goto LABEL_202;
  if (gLogCategory_APEndpointStreamScreenUDP <= 40)
  {
    if (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize())
      LogPrintF();
    if (gLogCategory_APEndpointStreamScreenUDP <= 40
      && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  v42 = *(_QWORD *)(v7 + 48);
  v43 = *(unsigned int *)(v7 + 96);
  v44 = *(uint64_t (**)(uint64_t, uint64_t, __CFDictionary *, const __CFDictionary **, CFTypeRef *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (!v44)
  {
    v38 = -12782;
LABEL_129:
    APSLogErrorAt();
    v40 = 0;
LABEL_130:
    v3 = v94;
    goto LABEL_45;
  }
  v45 = v44(v42, v43, v24, &v113, &v114, 0);
  if (v45)
  {
    v38 = v45;
    goto LABEL_129;
  }
  v46 = v113;
  if (!v113)
  {
    APSLogErrorAt();
    v40 = 0;
    v38 = -16765;
    goto LABEL_130;
  }
  v115 = 0;
  v47 = (_QWORD *)CMBaseObjectGetDerivedStorage();
  CFDictionaryGetTypeID();
  TypedValue = CFDictionaryGetTypedValue();
  if (v115)
  {
    APSLogErrorAt();
    v93 = 0;
    goto LABEL_134;
  }
  v49 = FigTransportStreamGetCMBaseObject();
  v50 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (!v50)
  {
    v115 = -12782;
    goto LABEL_132;
  }
  v115 = v50(v49, *MEMORY[0x1E0CF1FD0], TypedValue);
  if (v115)
  {
LABEL_132:
    APSLogErrorAt();
    v93 = 0;
LABEL_133:
    v2 = v95;
LABEL_134:
    v3 = v94;
    goto LABEL_135;
  }
  CFDataGetTypeID();
  v93 = CFDictionaryGetTypedValue();
  v2 = v95;
  if (v115)
  {
    APSLogErrorAt();
    goto LABEL_134;
  }
  if (!CFDictionaryContainsKey(v46, CFSTR("streamConnections")))
    goto LABEL_134;
  Value = (const __CFDictionary *)CFDictionaryGetValue(v46, CFSTR("streamConnections"));
  if (!CFDictionaryContainsKey(Value, CFSTR("streamConnectionTypeMediaDataControl")))
    goto LABEL_134;
  CFDictionaryGetValue(Value, CFSTR("streamConnectionTypeMediaDataControl"));
  CFDictionaryGetInt64();
  if (v115)
  {
    APSLogErrorAt();
    goto LABEL_133;
  }
  v52 = v47[6];
  v53 = v47[17];
  v117 = 0;
  v54 = APTransportStreamIDMakeWithPort();
  v116 = 0;
  v55 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (!v55)
  {
    v56 = -12782;
    goto LABEL_138;
  }
  v91 = v53;
  v56 = v55(v52);
  if (v56)
  {
LABEL_138:
    v97 = v56;
    APSLogErrorAt();
    v75 = 0;
    v57 = 0;
LABEL_139:
    v2 = v95;
    v3 = v94;
    goto LABEL_155;
  }
  v57 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!v57)
  {
    APSLogErrorAt();
    v75 = 0;
    v97 = -6728;
    goto LABEL_139;
  }
  CFDictionarySetInt64();
  CFDictionarySetInt64();
  CFDictionarySetInt64();
  v58 = *(uint64_t (**)(uint64_t, uint64_t, const void *, const void **))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 64);
  cf = v57;
  if (!v58)
  {
    v59 = -12782;
    goto LABEL_141;
  }
  v59 = v58(v52, v54, v57, &v117);
  if (v59)
  {
LABEL_141:
    v97 = v59;
LABEL_142:
    APSLogErrorAt();
    v57 = 0;
    v2 = v95;
LABEL_148:
    v3 = v94;
    goto LABEL_154;
  }
  v60 = APSSetFBOPropertyInt64();
  if (v60)
  {
    v97 = v60;
    goto LABEL_142;
  }
  v61 = APSenderSessionGetCMBaseObject(v52);
  v62 = *(uint64_t (**)(uint64_t, const __CFString *, const __CFAllocator *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                                  + 48);
  v2 = v95;
  v3 = v94;
  if (!v62)
  {
    v63 = -12782;
    goto LABEL_144;
  }
  v63 = v62(v61, CFSTR("KeyHolder"), allocator, &v116);
  if (v63)
  {
LABEL_144:
    v97 = v63;
    APSLogErrorAt();
    v57 = 0;
LABEL_154:
    v75 = cf;
LABEL_155:
    if (v117)
    {
      v76 = FigTransportStreamGetCMBaseObject();
      if (v76)
      {
        v77 = v76;
        v78 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
        if (v78)
          v78(v77);
      }
      CFRelease(v117);
      v117 = 0;
    }
    if (!v75)
      goto LABEL_162;
    goto LABEL_161;
  }
  v57 = APKeyHolderCoreUtilsEncryptionContextDataStreamCreateWithSeed(allocator, v91);
  if (!v57)
  {
    APSLogErrorAt();
    v97 = -6728;
    goto LABEL_148;
  }
  v65 = v116;
  v64 = v117;
  v66 = *(uint64_t (**)(const void *, CFTypeRef, const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                        + 80);
  if (!v66)
  {
    v67 = -12782;
    goto LABEL_146;
  }
  v67 = v66(v64, v65, v57);
  if (v67)
  {
LABEL_146:
    v97 = v67;
LABEL_147:
    APSLogErrorAt();
    goto LABEL_148;
  }
  v68 = APSSetFBOPropertyInt64();
  if (v68)
  {
    v97 = v68;
    goto LABEL_147;
  }
  v69 = v117;
  v70 = *(uint64_t (**)(const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  v3 = v94;
  if (!v70)
  {
    v71 = -12782;
    goto LABEL_150;
  }
  v71 = v70(v69);
  if (v71)
  {
LABEL_150:
    v97 = v71;
LABEL_153:
    APSLogErrorAt();
    goto LABEL_154;
  }
  v72 = v117;
  v73 = *(uint64_t (**)(const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
  if (!v73)
  {
    v74 = -12782;
    goto LABEL_152;
  }
  v74 = v73(v72);
  if (v74)
  {
LABEL_152:
    v97 = v74;
    goto LABEL_153;
  }
  v97 = 0;
  v47[15] = v117;
  v117 = 0;
  v75 = cf;
LABEL_161:
  CFRelease(v75);
LABEL_162:
  if (v116)
    CFRelease(v116);
  if (v57)
    CFRelease(v57);
  v115 = v97;
  if (!v97)
    goto LABEL_167;
  APSLogErrorAt();
LABEL_135:
  v38 = v115;
  if (v115)
    goto LABEL_181;
LABEL_167:
  v79 = FigTransportStreamGetCMBaseObject();
  v80 = *(uint64_t (**)(uint64_t, _QWORD, const __CFAllocator *, const __CFData **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                            + 48);
  if (!v80)
  {
    v38 = -12782;
LABEL_181:
    APSLogErrorAt();
    goto LABEL_44;
  }
  v81 = v80(v79, *MEMORY[0x1E0CF1F90], allocator, &v111);
  if (v81)
  {
    v38 = v81;
    goto LABEL_181;
  }
  v119.location = 0;
  v119.length = 16;
  CFDataGetBytes(v111, v119, (UInt8 *)buffer);
  v82 = APSenderSessionGetCMBaseObject(*(_QWORD *)(v7 + 48));
  v83 = *(uint64_t (**)(uint64_t, const __CFString *, const __CFAllocator *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                                  + 48);
  if (!v83)
  {
    v38 = -12782;
    goto LABEL_181;
  }
  v84 = v83(v82, CFSTR("KeyHolder"), allocator, &v109);
  if (v84)
  {
    v38 = v84;
    goto LABEL_181;
  }
  if (!v109)
  {
    APSLogErrorAt();
    v40 = 0;
    v38 = -16765;
    goto LABEL_45;
  }
  v40 = APKeyHolderCoreUtilsEncryptionContextDataStreamCreateWithSeed(allocator, v110);
  if (!v40)
  {
    APSLogErrorAt();
    v38 = -6728;
    goto LABEL_45;
  }
  v85 = v109;
  v86 = *(uint64_t (**)(CFTypeRef, CFStringRef, uint64_t, CFTypeRef *, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 64);
  if (!v86)
  {
    v38 = -12782;
LABEL_183:
    APSLogErrorAt();
    goto LABEL_45;
  }
  v87 = v86(v85, v40, 46, &v108, 46, &v107);
  if (v87)
  {
    v38 = v87;
    goto LABEL_183;
  }
  if (*(_QWORD *)(v7 + 240) == 1)
  {
    APSScreenGetMediaPresentationParams();
    v88 = v93;
    if (gLogCategory_APEndpointStreamScreenUDP <= 50
      && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    v101 = *(_OWORD *)(v7 + 152);
    v100 = *(_DWORD *)(v7 + 260);
    v88 = v93;
  }
  v102 = v101;
  LODWORD(v103) = v100;
  *((_QWORD *)&v103 + 1) = v107;
  *(_QWORD *)&v104 = v108;
  BYTE8(v104) = *(_QWORD *)(v7 + 240) == 1;
  v89 = screenstreamudp_getDisplayHDRMode(v7);
  v90 = *(_QWORD *)(v7 + 192);
  *(_QWORD *)&v105 = v89;
  *((_QWORD *)&v105 + 1) = v90;
  LOBYTE(v106) = *(_BYTE *)(v7 + 248);
  v38 = objc_msgSend(*(id *)(v7 + 40), "startWithNWConnectionClientID:negotiatedBlob:screenOptions:completion:", buffer, v88, &v102, v3);
  if (v38)
    goto LABEL_183;
  v39 = v98;
  if (v98)
    goto LABEL_52;
LABEL_53:
  if (v111)
    CFRelease(v111);
  if (v24)
    CFRelease(v24);
  if (v114)
    CFRelease(v114);
  if (v113)
    CFRelease(v113);
  if (Mutable)
    CFRelease(Mutable);
  if (v109)
    CFRelease(v109);
  if (v40)
    CFRelease(v40);
  if (v108)
    CFRelease(v108);
  if (v107)
    CFRelease(v107);
  if (!v38)
  {
    if (gLogCategory_APEndpointStreamScreenUDP <= 50
      && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v99[27] = 1;
    goto LABEL_77;
  }
LABEL_192:
  APSLogErrorAt();
  if (gLogCategory_APEndpointStreamScreenUDP <= 90
    && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  screenstreamudp_dispatchCallback(v2, v3, v38);
  screenstreamudp_handleFatalError(v2, v38, CFSTR("Resume failed"));
LABEL_77:
  v41 = *(const void **)(a1 + 40);
  if (v41)
    CFRelease(v41);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __audioEngineCarPlay_Resume_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t DerivedStorage;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  size_t v8;
  __int16 v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t (*v12)(uint64_t, _OWORD *);
  int v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void (*v22)(uint64_t, uint64_t, uint64_t, uint64_t (*)(), uint64_t);
  uint64_t v23;
  _QWORD *v24;
  uint64_t (*v25)(uint64_t);
  int v26;
  _QWORD block[5];
  _OWORD __s1[2];
  uint64_t v29;
  const void *v30;
  CFTypeRef v31;

  v29 = 0;
  memset(__s1, 0, sizeof(__s1));
  v2 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(v2 + 120))
  {
    if (*(_QWORD *)(v2 + 72) && *(_QWORD *)(v2 + 80) && *(_QWORD *)(v2 + 96))
    {
      DerivedStorage = CMBaseObjectGetDerivedStorage();
      v30 = 0;
      v31 = 0;
      if (*(_BYTE *)(DerivedStorage + 120))
      {
        APSLogErrorAt();
        v5 = -72077;
      }
      else
      {
        v4 = DerivedStorage;
        if (*(_QWORD *)(DerivedStorage + 64))
        {
          if (*(_QWORD *)(DerivedStorage + 88))
          {
            v5 = 0;
          }
          else
          {
            v6 = *MEMORY[0x1E0C9AE00];
            v7 = APTransportStreamSendBackingProviderCreateWithStreamID();
            if (v7)
            {
              v5 = v7;
              APSLogErrorAt();
            }
            else
            {
              v8 = *(_QWORD *)(v4 + 64);
              v9 = arc4random();
              v5 = APMessageRingCreate(v6, v8, v9, v30, 48, 0, (uint64_t *)&v31);
              if (v5)
              {
                APSLogErrorAt();
                if (v31)
                  CFRelease(v31);
              }
              else
              {
                *(_QWORD *)(v4 + 88) = v31;
                v31 = 0;
              }
            }
          }
        }
        else
        {
          APSLogErrorAt();
          v5 = -72071;
        }
      }
      if (v30)
        CFRelease(v30);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
      if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
        goto LABEL_45;
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72);
      v11 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
      if (*v11 < 2uLL)
      {
        v13 = -12781;
      }
      else
      {
        v12 = (uint64_t (*)(uint64_t, _OWORD *))v11[1];
        v13 = v12 ? v12(v10, __s1) : -12782;
      }
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v13;
      if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
        goto LABEL_45;
      v14 = *(_QWORD *)(a1 + 40);
      if (!memcmp(__s1, (const void *)(v14 + 24), 0x28uLL))
      {
        *(_DWORD *)(v14 + 4) = *(_DWORD *)v14 * *(double *)(v14 + 24) / (1000 * *(_DWORD *)(v14 + 44));
        v15 = *(NSObject **)(v14 + 128);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 0x40000000;
        block[2] = __audioEngineCarPlay_Resume_block_invoke_2;
        block[3] = &__block_descriptor_tmp_18_1;
        block[4] = v14;
        dispatch_sync(v15, block);
        APSSetFBOPropertyInt64();
        v16 = *(_QWORD *)(a1 + 40);
        v17 = *(_QWORD *)(a1 + 48);
        v18 = *(_QWORD *)(v16 + 72);
        v19 = *(unsigned int *)(v16 + 4);
        v20 = *(_QWORD *)(v16 + 128);
        v21 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
        if (*v21 >= 2uLL)
        {
          v22 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t (*)(), uint64_t))v21[3];
          if (v22)
            v22(v18, v19, v20, audioEngineCarPlay_HandleDataReady, v17);
        }
        if (gLogCategory_APAudioEngineCarPlay <= 40
          && (gLogCategory_APAudioEngineCarPlay != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72);
        v24 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
        if (*v24 < 2uLL)
        {
          v26 = -12781;
        }
        else
        {
          v25 = (uint64_t (*)(uint64_t))v24[4];
          if (v25)
            v26 = v25(v23);
          else
            v26 = -12782;
        }
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v26;
        if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
        {
          *(_BYTE *)(*(_QWORD *)(a1 + 40) + 120) = 1;
          goto LABEL_36;
        }
LABEL_45:
        APSLogErrorAt();
        goto LABEL_36;
      }
    }
    APSLogErrorAt();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -72074;
  }
LABEL_36:
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

void __audioEngineCarPlay_Resume_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  const void *v5;
  const void *v6;
  uint64_t v7;
  const void *v8;
  const void *v9;
  uint64_t v10;
  const void *v11;
  const void *v12;
  uint64_t v13;
  const void *v14;
  const void *v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(v2 + 40);
  *(_OWORD *)(v2 + 144) = *(_OWORD *)(v2 + 24);
  *(_OWORD *)(v2 + 160) = v3;
  *(_QWORD *)(v2 + 176) = *(_QWORD *)(v2 + 56);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(const void **)(v4 + 184);
  v6 = *(const void **)(v4 + 72);
  *(_QWORD *)(v4 + 184) = v6;
  if (v6)
    CFRetain(v6);
  if (v5)
    CFRelease(v5);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(const void **)(v7 + 192);
  v9 = *(const void **)(v7 + 80);
  *(_QWORD *)(v7 + 192) = v9;
  if (v9)
    CFRetain(v9);
  if (v8)
    CFRelease(v8);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(const void **)(v10 + 200);
  v12 = *(const void **)(v10 + 88);
  *(_QWORD *)(v10 + 200) = v12;
  if (v12)
    CFRetain(v12);
  if (v11)
    CFRelease(v11);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(const void **)(v13 + 208);
  v15 = *(const void **)(v13 + 96);
  *(_QWORD *)(v13 + 208) = v15;
  if (v15)
    CFRetain(v15);
  if (v14)
    CFRelease(v14);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
  v16 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v16 + 232) = 0;
  *(_BYTE *)(v16 + 236) = 0;
  *(_BYTE *)(v16 + 136) = 1;
}

void __screenstream_Resume_block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t DerivedStorage;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  CFTypeRef *v7;
  uint64_t v8;
  const __CFAllocator *v9;
  CFMutableDictionaryRef Mutable;
  const void *v11;
  CFTypeRef v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t, CFMutableDictionaryRef, CFTypeRef *, CFTypeRef *, _QWORD);
  const void *v17;
  CFUUIDRef v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t, CFMutableDictionaryRef, CFTypeRef *);
  uint64_t v22;
  const CFDictionaryKeyCallBacks *v23;
  const CFDictionaryValueCallBacks *v24;
  __CFDictionary *v25;
  __CFDictionary *v26;
  const void *v27;
  const void *v28;
  const void *v29;
  const void *v30;
  const void *v31;
  const void *v32;
  const void *v33;
  const void *v34;
  const void *v35;
  const void *v36;
  const void *v37;
  const void *v38;
  const void *v39;
  CFTypeRef v40;
  const void *v41;
  uint64_t (*v42)(CFTypeRef);
  uint64_t v43;
  const void *v44;
  const void *v45;
  CFTypeRef v46;
  uint64_t (*v47)(CFTypeRef);
  CFTypeRef v48;
  uint64_t (*v49)(CFTypeRef);
  CFTypeRef v50;
  uint64_t (*v51)(CFTypeRef, _QWORD, const void *);
  int v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t);
  int v55;
  uint64_t v56;
  int v57;
  int v58;
  NSObject *v59;
  dispatch_time_t v60;
  int v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  const void *v65;
  uint64_t v66;
  const void *v67;
  CFMutableDictionaryRef cf;
  _QWORD block[7];
  int v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(uint64_t, const void *, const void *);
  void *v74;
  CFMutableDictionaryRef v75;
  CFTypeRef v76;
  CFTypeRef v77;
  int v78;

  v2 = *(const void **)(a1 + 32);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v4 = DerivedStorage;
  v5 = &gLogCategory_APAudioHoseManagerBuffered;
  if (*(_BYTE *)(DerivedStorage + 24))
  {
    v52 = -16762;
    goto LABEL_102;
  }
  if (*(_BYTE *)(DerivedStorage + 26) || !*(_BYTE *)(DerivedStorage + 25))
  {
LABEL_110:
    v52 = 0;
    goto LABEL_113;
  }
  if (!*(_QWORD *)(DerivedStorage + 160))
  {
    v52 = -16768;
    goto LABEL_102;
  }
  atomic_store(0, (unsigned int *)(DerivedStorage + 1176));
  v78 = 0;
  v6 = CMBaseObjectGetDerivedStorage();
  v76 = 0;
  v77 = 0;
  v7 = (CFTypeRef *)(v6 + 136);
  if (!*(_QWORD *)(v6 + 136))
  {
    v8 = v6;
    if (gLogCategory_APEndpointStreamScreen <= 40
      && (gLogCategory_APEndpointStreamScreen != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (!Mutable)
    {
      APSLogErrorAt();
      v78 = -16761;
LABEL_91:
      if (v76)
        CFRelease(v76);
      if (Mutable)
        CFRelease(Mutable);
      goto LABEL_95;
    }
    FigCFDictionarySetInt32();
    cf = Mutable;
    if (*(_QWORD *)(v8 + 48))
    {
      if (*(_BYTE *)(v8 + 378))
      {
        CFDictionarySetValue(Mutable, CFSTR("uuid"), *(const void **)(v8 + 296));
        if (*(_QWORD *)(v8 + 120))
        {
          v71 = MEMORY[0x1E0C809B0];
          v72 = 0x40000000;
          v73 = __screenstream_ensureTransportStream_block_invoke;
          v74 = &__block_descriptor_tmp_94_0;
          v75 = Mutable;
          CFDictionaryApplyBlock();
        }
      }
      else if (*(_BYTE *)(v8 + 389))
      {
        v12 = APDemoManagerCopyDeviceInfo();
        if (v12)
        {
          v13 = v12;
          CFDictionarySetValue(Mutable, CFSTR("DemoDeviceInfo"), v12);
          CFRelease(v13);
        }
      }
      v14 = *(_QWORD *)(v8 + 48);
      v15 = *(unsigned int *)(v8 + 88);
      v16 = *(uint64_t (**)(uint64_t, uint64_t, CFMutableDictionaryRef, CFTypeRef *, CFTypeRef *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
      if (v16)
      {
        v78 = v16(v14, v15, Mutable, &v76, &v77, 0);
        if (!v78)
        {
          CFDictionaryGetInt64();
          v5 = &gLogCategory_APAudioHoseManagerBuffered;
          if (!v78)
          {
            if (gLogCategory_APEndpointStreamScreen <= 50
              && (gLogCategory_APEndpointStreamScreen != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            Mutable = CFDictionaryCreateMutable(v9, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
            FigCFDictionarySetInt32();
            FigCFDictionarySetInt32();
            FigCFDictionarySetInt32();
            if (*(_BYTE *)(v8 + 378))
            {
              v17 = (const void *)*MEMORY[0x1E0CA5448];
              v18 = CFUUIDGetConstantUUIDWithBytes(0, 0x99u, 0xA4u, 0x2Au, 0xF4u, 0x23u, 0xE3u, 0x4Au, 0, 0x91u, 0x6Eu, 0xC1u, 0x43u, 0xD3u, 0x32u, 0x3Bu, 0x92u);
              CFDictionarySetValue(Mutable, v17, v18);
            }
            v19 = *(_QWORD *)(v8 + 48);
            v20 = APTransportStreamIDMakeWithPort();
            v21 = *(uint64_t (**)(uint64_t, uint64_t, CFMutableDictionaryRef, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                  + 64);
            if (v21)
            {
              v78 = v21(v19, v20, Mutable, v7);
              if (!v78)
              {
                v5 = &gLogCategory_APAudioHoseManagerBuffered;
                if (gLogCategory_APEndpointStreamScreen <= 50
                  && (gLogCategory_APEndpointStreamScreen != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF();
                }
                v78 = APSSetFBOPropertyInt64();
                if (v78)
                {
LABEL_88:
                  APSLogErrorAt();
                  goto LABEL_89;
                }
LABEL_45:
                if (*(int *)(v8 + 1160) >= 1)
                {
                  if (gLogCategory_APEndpointStreamScreen <= 50
                    && (gLogCategory_APEndpointStreamScreen != -1 || _LogCategory_Initialize()))
                  {
                    LogPrintF();
                  }
                  APSSetFBOPropertyInt64();
                }
                v66 = v4;
                v67 = v2;
                v22 = CMBaseObjectGetDerivedStorage();
                *(_QWORD *)(v22 + 1152) = mach_absolute_time();
                v23 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
                v24 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
                v25 = CFDictionaryCreateMutable(v9, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
                v26 = CFDictionaryCreateMutable(v9, 0, v23, v24);
                v27 = *(const void **)(v8 + 1104);
                if (v27)
                {
                  CFRelease(v27);
                  *(_QWORD *)(v8 + 1104) = 0;
                }
                v28 = (const void *)*MEMORY[0x1E0CF75A0];
                CFDictionarySetValue(v25, (const void *)*MEMORY[0x1E0CF75A0], CFSTR("fps"));
                FigCFDictionarySetDouble();
                v29 = (const void *)*MEMORY[0x1E0CF7598];
                CFDictionarySetValue(v25, (const void *)*MEMORY[0x1E0CF7598], CFSTR("Source Frames"));
                v30 = (const void *)APSStatsHistogramCreate();
                if (v30)
                {
                  v31 = v30;
                  CFDictionarySetValue(v26, CFSTR("Source Frames"), v30);
                  CFRelease(v31);
                }
                CFDictionarySetValue(v25, v29, CFSTR("Sent Frames"));
                v32 = (const void *)APSStatsHistogramCreate();
                if (v32)
                {
                  v33 = v32;
                  CFDictionarySetValue(v26, CFSTR("Sent Frames"), v32);
                  CFRelease(v33);
                }
                CFDictionarySetValue(v25, v29, CFSTR("Dropped Overflow Frames"));
                v34 = (const void *)APSStatsHistogramCreate();
                if (v34)
                {
                  v35 = v34;
                  CFDictionarySetValue(v26, CFSTR("Dropped Overflow Frames"), v34);
                  CFRelease(v35);
                }
                CFDictionarySetValue(v25, v28, CFSTR("Mbps"));
                FigCFDictionarySetDouble();
                CFDictionarySetValue(v25, v29, CFSTR("Used Bandwidth"));
                v36 = (const void *)APSStatsHistogramCreate();
                if (v36)
                {
                  v37 = v36;
                  CFDictionarySetValue(v26, CFSTR("Used Bandwidth"), v36);
                  CFRelease(v37);
                }
                FigCFDictionarySetDouble();
                FigCFDictionarySetInt32();
                CFDictionarySetValue(v25, v29, CFSTR("Available Bandwidth"));
                v38 = (const void *)APSStatsHistogramCreate();
                if (v38)
                {
                  v39 = v38;
                  CFDictionarySetValue(v26, CFSTR("Available Bandwidth"), v38);
                  CFRelease(v39);
                }
                CFRelease(v25);
                *(_QWORD *)(v8 + 1104) = v26;
                v40 = v77;
                v41 = *(const void **)(v8 + 912);
                *(_QWORD *)(v8 + 912) = v77;
                v4 = v66;
                v2 = v67;
                if (v40)
                  CFRetain(v40);
                if (v41)
                  CFRelease(v41);
                if (v40)
                {
                  v42 = *(uint64_t (**)(CFTypeRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
                  v5 = &gLogCategory_APAudioHoseManagerBuffered;
                  if (v42)
                    v43 = v42(v40);
                  else
                    v43 = 0;
                }
                else
                {
                  v43 = 0;
                  v5 = &gLogCategory_APAudioHoseManagerBuffered;
                }
                *(_QWORD *)(v8 + 920) = v43;
                v44 = *(const void **)(v8 + 960);
                v45 = *(const void **)(v8 + 64);
                *(_QWORD *)(v8 + 960) = v45;
                if (v45)
                  CFRetain(v45);
                if (v44)
                  CFRelease(v44);
                v46 = *v7;
                v47 = *(uint64_t (**)(CFTypeRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
                if (v47)
                {
                  v78 = v47(v46);
                  if (!v78)
                  {
                    v48 = *v7;
                    v49 = *(uint64_t (**)(CFTypeRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
                    if (v49)
                    {
                      v78 = v49(v48);
                      if (!v78)
                      {
                        v50 = *v7;
                        v51 = *(uint64_t (**)(CFTypeRef, _QWORD, const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                        + 64);
                        if (v51)
                        {
                          v78 = v51(v50, screenstream_dequeueAndProcessSampleBuffer, v67);
                          if (!v78)
                            goto LABEL_89;
                        }
                        else
                        {
                          v78 = -12782;
                        }
                      }
                    }
                    else
                    {
                      v78 = -12782;
                    }
                  }
                }
                else
                {
                  v78 = -12782;
                }
                goto LABEL_88;
              }
            }
            else
            {
              v78 = -12782;
            }
            APSLogErrorAt();
LABEL_40:
            v5 = &gLogCategory_APAudioHoseManagerBuffered;
            goto LABEL_89;
          }
          APSLogErrorAt();
          Mutable = 0;
LABEL_89:
          CFRelease(cf);
          if (v77)
            CFRelease(v77);
          goto LABEL_91;
        }
      }
      else
      {
        v78 = -12782;
      }
      APSLogErrorAt();
      Mutable = 0;
      goto LABEL_40;
    }
    v11 = *(const void **)(v8 + 128);
    if (v11)
    {
      *v7 = CFRetain(v11);
      if (gLogCategory_APEndpointStreamScreen <= 50
        && (gLogCategory_APEndpointStreamScreen != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      Mutable = 0;
      goto LABEL_45;
    }
    APSLogErrorAt();
    Mutable = 0;
    v78 = -16765;
    goto LABEL_89;
  }
LABEL_95:
  v52 = v78;
  if (!v78)
  {
    v53 = *(_QWORD *)(v4 + 160);
    v54 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
    if (v54)
    {
      v55 = v54(v53);
      if (!v55)
      {
        v56 = CMBaseObjectGetDerivedStorage();
        v57 = v5[272];
        if (v57 <= 30 && (v57 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        v59 = *(NSObject **)(v56 + 200);
        v60 = dispatch_time(0, 1000000000);
        dispatch_source_set_timer(v59, v60, 0x3B9ACA00uLL, 0x5F5E100uLL);
        screenStream_setResumedAndNotifiyObservers(v2, 1);
        v61 = v5[272];
        if (v61 <= 50 && (v61 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        goto LABEL_110;
      }
      v52 = v55;
    }
    else
    {
      v52 = -12782;
    }
  }
LABEL_102:
  APSLogErrorAt();
  v58 = v5[272];
  if (v58 <= 90 && (v58 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  screenstream_cleanup();
LABEL_113:
  if (*(_QWORD *)(a1 + 48))
  {
    CFRetain(*(CFTypeRef *)(a1 + 32));
    v62 = *(_QWORD *)(a1 + 48);
    v63 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 96);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = __screenstream_Resume_block_invoke_2;
    block[3] = &__block_descriptor_tmp_87_1;
    v64 = *(_QWORD *)(a1 + 32);
    block[4] = v62;
    block[5] = v64;
    v70 = v52;
    block[6] = *(_QWORD *)(a1 + 64);
    dispatch_async(v63, block);
  }
  v65 = *(const void **)(a1 + 40);
  if (v65)
    CFRelease(v65);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __screenstream_Resume_block_invoke_2(uint64_t a1)
{
  (*(void (**)(_QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
