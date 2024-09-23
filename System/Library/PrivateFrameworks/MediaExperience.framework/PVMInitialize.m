@implementation PVMInitialize

void __PVMInitialize_block_invoke()
{
  uint64_t v0;
  CFTypeRef *v1;
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  const void *Value;
  uint64_t v5;
  const __CFDictionary *v6;
  const __CFAllocator *v7;
  CFMutableDictionaryRef MutableCopy;
  uint64_t v9;
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  const void *v15;
  CFTypeID v16;
  CFTypeID v17;
  CFTypeID v18;
  CFTypeRef v19;
  uint64_t v20;
  int v21;
  const __CFString *v22;
  const __CFString *v23;
  CFPropertyListRef v24;
  const void *v25;
  CFTypeID TypeID;
  const __CFDictionary *DeepCopy;
  const __CFDictionary *v28;
  CFMutableDictionaryRef Mutable;
  CFTypeRef v30;
  void *v31;
  CFPropertyListRef v32;
  const void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  CFPropertyListRef v44;
  const void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  uint64_t v53;
  uint64_t MappedBluetoothRouteWithDeviceIDAppended;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  void *v59;
  CFPropertyListRef v60;
  const void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t k;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  const void *v71;
  CFPropertyListRef v72;
  const void *v73;
  CFTypeID v74;
  CFPropertyListRef v75;
  const void *v76;
  CFTypeID v77;
  const __CFDictionary *v78;
  const __CFDictionary *v79;
  CFMutableDictionaryRef v80;
  CFPropertyListRef v81;
  const void *v82;
  CFTypeID v83;
  CFPropertyListRef v84;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  CFPropertyListRef v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  char v102;
  const void *v103;
  CFPropertyListRef v104;
  const void *v105;
  CFTypeID v106;
  NSObject *v107;
  NSObject *v108;
  const void *v109;
  const void *v110;
  const void *v111;
  const __CFDictionary *v112;
  const __CFDictionary *v113;
  const __CFDictionary *v114;
  void *v115;
  const void *v116;
  const void *v117;
  const void *v118;
  const void *v119;
  const __CFAllocator *v120;
  const __CFAllocator *v121;
  const __CFString *hostName;
  CFStringRef hostNamea;
  const __CFString *v124;
  const __CFString *v125;
  const __CFString *v126;
  const __CFString *v127;
  __CFDictionary *v128;
  __CFDictionary *v129;
  void *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  float valuePtr[32];
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  if (pvmInitializeLogging_onceToken != -1)
    dispatch_once(&pvmInitializeLogging_onceToken, &__block_literal_global_110);
  sStorage = (uint64_t)malloc_type_calloc(1uLL, 0x128uLL, 0x10E0040EAEAB365uLL);
  if (!sStorage)
    goto LABEL_154;
  v0 = FigReentrantMutexCreate();
  v1 = (CFTypeRef *)sStorage;
  *(_QWORD *)sStorage = v0;
  if (!v0)
    goto LABEL_132;
  MXInstallSysdiagnoseBlock((uint64_t)CFSTR("MXVolumePreferences"), (uint64_t)&__block_literal_global_63_0);
  CelestialGetModelSpecificName();
  *(_QWORD *)(sStorage + 160) = CelestialCFCreatePropertyListForModelAndBundleIdentifier();
  CelestialGetModelSpecificName();
  *(_QWORD *)(sStorage + 176) = CelestialCFCreatePropertyListForModelAndBundleIdentifier();
  CelestialGetModelSpecificName();
  *(_QWORD *)(sStorage + 184) = CelestialCFCreatePropertyListForModelAndBundleIdentifier();
  CelestialGetModelSpecificName();
  *(_QWORD *)(sStorage + 192) = CelestialCFCreatePropertyListForModelAndBundleIdentifier();
  CelestialGetModelSpecificName();
  *(_QWORD *)(sStorage + 80) = CelestialCFCreatePropertyListForModelAndBundleIdentifier();
  CelestialGetModelSpecificName();
  v2 = (const __CFDictionary *)CelestialCFCreatePropertyListForModelAndBundleIdentifier();
  if (v2)
  {
    v3 = v2;
    Value = CFDictionaryGetValue(v2, CFSTR("RouteDefaultVolumes"));
    *(_QWORD *)(sStorage + 200) = Value;
    if (Value)
      CFRetain(Value);
    if (!FigCFDictionaryGetFloatIfPresent())
      *(_DWORD *)(sStorage + 288) = 1065353216;
    CFRelease(v3);
  }
  v5 = sStorage;
  *(_WORD *)(sStorage + 292) = 0;
  v6 = *(const __CFDictionary **)(v5 + 160);
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (v6)
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v6);
  else
    MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v9 = sStorage;
  *(_QWORD *)(sStorage + 168) = MutableCopy;
  *(_QWORD *)(v9 + 136) = 0x3FC000003F000000;
  *(_QWORD *)(sStorage + 128) = CFRetain(CFSTR("Ringtone"));
  CelestialGetModelSpecificName();
  v10 = (const __CFDictionary *)CelestialCFCreatePropertyListForModelAndBundleIdentifier();
  if (v10)
  {
    v11 = v10;
    v12 = CFDictionaryGetValue(v10, CFSTR("Zero"));
    v13 = CFDictionaryGetValue(v11, CFSTR("One"));
    v14 = CFDictionaryGetValue(v11, CFSTR("Category"));
    if (v12)
    {
      v15 = v14;
      v16 = CFGetTypeID(v12);
      if (v16 == CFNumberGetTypeID())
      {
        if (v13)
        {
          v17 = CFGetTypeID(v13);
          if (v17 == CFNumberGetTypeID())
          {
            if (v15)
            {
              v18 = CFGetTypeID(v15);
              if (v18 == CFStringGetTypeID())
              {
                valuePtr[0] = 0.0;
                LODWORD(v131) = 0;
                CFNumberGetValue((CFNumberRef)v12, kCFNumberFloat32Type, valuePtr);
                CFNumberGetValue((CFNumberRef)v13, kCFNumberFloat32Type, &v131);
                if (*(float *)&v131 <= 5.0
                  && valuePtr[0] <= 1.0
                  && valuePtr[0] >= 0.0
                  && (float)(*(float *)&v131 - valuePtr[0]) >= 0.25)
                {
                  v19 = CFRetain(v15);
                  v20 = sStorage;
                  *(_QWORD *)(sStorage + 128) = v19;
                  v21 = v131;
                  *(float *)(v20 + 136) = valuePtr[0];
                  *(_DWORD *)(v20 + 140) = v21;
                }
              }
            }
          }
        }
      }
    }
    CFRelease(v11);
  }
  *(float *)(sStorage + 144) = *(float *)(sStorage + 140) - *(float *)(sStorage + 136);
  v22 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v23 = (const __CFString *)*MEMORY[0x1E0C9B230];
  v24 = CFPreferencesCopyValue(CFSTR("volumes"), CFSTR("com.apple.mediaexperience"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  *(_QWORD *)(sStorage + 16) = 0;
  if (v24)
  {
    v25 = v24;
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v25))
    {
      DeepCopy = (const __CFDictionary *)CFPropertyListCreateDeepCopy(v7, v25, 1uLL);
      if (DeepCopy)
      {
        v28 = DeepCopy;
        v120 = v7;
        Mutable = CFDictionaryCreateMutable(v7, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        CFDictionaryApplyFunction(v28, (CFDictionaryApplierFunction)pvmApplierFunction_ValidateVolumesForRoute, Mutable);
        hostName = v23;
        if (Mutable)
        {
          v30 = CFRetain(Mutable);
          *(_QWORD *)(sStorage + 16) = v30;
          if (v30)
          {
            v31 = (void *)v30;
            v32 = CFPreferencesCopyValue(CFSTR("AirTunesEntriesDeleted"), CFSTR("com.apple.mediaexperience"), v22, v23);
            v33 = (const void *)*MEMORY[0x1E0C9AE50];
            if (FigCFEqual())
              goto LABEL_48;
            v128 = Mutable;
            v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v131 = 0u;
            v132 = 0u;
            v133 = 0u;
            v134 = 0u;
            v35 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v131, valuePtr, 16);
            v109 = v33;
            if (v35)
            {
              v36 = v35;
              v112 = v28;
              v116 = v25;
              v124 = v22;
              v37 = 0;
              v38 = *(_QWORD *)v132;
              do
              {
                for (i = 0; i != v36; ++i)
                {
                  if (*(_QWORD *)v132 != v38)
                    objc_enumerationMutation(v31);
                  v40 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * i);
                  v41 = objc_msgSend(v31, "objectForKey:", v40);
                  if ((objc_msgSend(v40, "hasPrefix:", CFSTR("AirTunes")) & 1) != 0)
                    v37 = 1;
                  else
                    objc_msgSend(v34, "setObject:forKey:", v41, v40);
                }
                v36 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v131, valuePtr, 16);
              }
              while (v36);
              CFRelease(*(CFTypeRef *)(sStorage + 16));
              v42 = sStorage;
              *(_QWORD *)(sStorage + 16) = v34;
              v22 = v124;
              v28 = v112;
              v25 = v116;
              if ((v37 & 1) != 0)
              {
                *(_BYTE *)(v42 + 24) = 1;
                pvmWritePrefs();
              }
            }
            else
            {
              CFRelease(*(CFTypeRef *)(sStorage + 16));
              *(_QWORD *)(sStorage + 16) = v34;
            }
            MXCFPreferencesSetAndSynchronizeUserPreference(CFSTR("AirTunesEntriesDeleted"), v109);
            Mutable = v128;
            if (v32)
LABEL_48:
              CFRelease(v32);
          }
        }
        else
        {
          *(_QWORD *)(sStorage + 16) = 0;
        }
        v43 = *(void **)(sStorage + 16);
        if (v43)
        {
          v44 = CFPreferencesCopyValue(CFSTR("BluetoothA2DPAndHFPVolumesCombined"), CFSTR("com.apple.mediaexperience"), v22, hostName);
          v45 = (const void *)*MEMORY[0x1E0C9AE50];
          if (FigCFEqual())
          {
            CFRelease(v44);
          }
          else
          {
            v113 = v28;
            v117 = v25;
            v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v131 = 0u;
            v132 = 0u;
            v133 = 0u;
            v134 = 0u;
            v47 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v131, valuePtr, 16);
            if (v47)
            {
              v48 = v47;
              v110 = v45;
              v125 = v22;
              v49 = 0;
              v50 = *(_QWORD *)v132;
              do
              {
                for (j = 0; j != v48; ++j)
                {
                  if (*(_QWORD *)v132 != v50)
                    objc_enumerationMutation(v43);
                  v52 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * j);
                  v53 = objc_msgSend(v43, "objectForKey:", v52);
                  MappedBluetoothRouteWithDeviceIDAppended = pvmGetMappedBluetoothRouteWithDeviceIDAppended(v52);
                  if (MappedBluetoothRouteWithDeviceIDAppended)
                  {
                    v55 = MappedBluetoothRouteWithDeviceIDAppended;
                    v56 = objc_msgSend(v43, "objectForKey:", v52);
                    v57 = (id)objc_msgSend((id)objc_msgSend(v46, "objectForKey:", v55), "mutableCopy");
                    if (!v57)
                      v57 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                    objc_msgSend(v57, "addEntriesFromDictionary:", v56);
                    objc_msgSend(v46, "setObject:forKey:", v57, v55);

                    v49 = 1;
                  }
                  else
                  {
                    objc_msgSend(v46, "setObject:forKey:", v53, v52);
                  }
                }
                v48 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v131, valuePtr, 16);
              }
              while (v48);
              CFRelease(*(CFTypeRef *)(sStorage + 16));
              v58 = sStorage;
              *(_QWORD *)(sStorage + 16) = v46;
              v22 = v125;
              v45 = v110;
              if ((v49 & 1) != 0)
              {
                *(_BYTE *)(v58 + 24) = 1;
                pvmWritePrefs();
              }
            }
            else
            {
              CFRelease(*(CFTypeRef *)(sStorage + 16));
              *(_QWORD *)(sStorage + 16) = v46;
            }
            MXCFPreferencesSetAndSynchronizeUserPreference(CFSTR("BluetoothA2DPAndHFPVolumesCombined"), v45);
            v28 = v113;
            v25 = v117;
          }
        }
        v59 = *(void **)(sStorage + 16);
        v23 = hostName;
        if (v59)
        {
          v60 = CFPreferencesCopyValue(CFSTR("AirPlayLowLatencyEntriesDeleted"), CFSTR("com.apple.mediaexperience"), v22, hostName);
          v61 = (const void *)*MEMORY[0x1E0C9AE50];
          if (FigCFEqual())
            goto LABEL_87;
          v111 = v61;
          v114 = v28;
          v126 = v22;
          v129 = Mutable;
          v118 = v25;
          v62 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v131 = 0u;
          v132 = 0u;
          v133 = 0u;
          v134 = 0u;
          v63 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v131, valuePtr, 16);
          if (v63)
          {
            v64 = v63;
            v65 = 0;
            v66 = *(_QWORD *)v132;
            do
            {
              for (k = 0; k != v64; ++k)
              {
                if (*(_QWORD *)v132 != v66)
                  objc_enumerationMutation(v59);
                v68 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * k);
                v69 = objc_msgSend(v59, "objectForKey:", v68);
                if ((objc_msgSend(v68, "hasPrefix:", CFSTR("AirPlayLowLatency")) & 1) != 0)
                  v65 = 1;
                else
                  objc_msgSend(v62, "setObject:forKey:", v69, v68);
              }
              v64 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v131, valuePtr, 16);
            }
            while (v64);
          }
          else
          {
            v65 = 0;
          }
          v70 = sStorage;
          v71 = *(const void **)(sStorage + 16);
          if (v71)
          {
            CFRelease(v71);
            v70 = sStorage;
            *(_QWORD *)(sStorage + 16) = 0;
          }
          v23 = hostName;
          v22 = v126;
          v28 = v114;
          v25 = v118;
          *(_QWORD *)(v70 + 16) = v62;
          if ((v65 & 1) != 0)
          {
            *(_BYTE *)(v70 + 24) = 1;
            pvmWritePrefs();
          }
          MXCFPreferencesSetAndSynchronizeUserPreference(CFSTR("AirPlayLowLatencyEntriesDeleted"), v111);
          Mutable = v129;
          if (v60)
LABEL_87:
            CFRelease(v60);
        }
        if (Mutable)
          CFRelease(Mutable);
        CFRelease(v28);
        v7 = v120;
      }
    }
    CFRelease(v25);
  }
  v72 = CFPreferencesCopyValue(CFSTR("inputVolumes"), CFSTR("com.apple.mediaexperience"), v22, v23);
  if (v72)
  {
    v73 = v72;
    v74 = CFDictionaryGetTypeID();
    if (v74 == CFGetTypeID(v73))
      *(_QWORD *)(sStorage + 48) = CFPropertyListCreateDeepCopy(v7, v73, 1uLL);
    CFRelease(v73);
  }
  v75 = CFPreferencesCopyValue(CFSTR("volumeLimits"), CFSTR("com.apple.mediaexperience"), v22, v23);
  *(_QWORD *)(sStorage + 32) = 0;
  if (v75)
  {
    v76 = v75;
    v77 = CFDictionaryGetTypeID();
    if (v77 == CFGetTypeID(v76))
    {
      v78 = (const __CFDictionary *)CFPropertyListCreateDeepCopy(v7, v76, 1uLL);
      if (v78)
      {
        v79 = v78;
        v80 = CFDictionaryCreateMutable(v7, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        CFDictionaryApplyFunction(v79, (CFDictionaryApplierFunction)pvmApplierFunction_CopyValidatedVolumes, v80);
        if (v80)
        {
          *(_QWORD *)(sStorage + 32) = CFRetain(v80);
          CFRelease(v80);
        }
        else
        {
          *(_QWORD *)(sStorage + 32) = 0;
        }
        CFRelease(v79);
      }
    }
    CFRelease(v76);
  }
  v81 = CFPreferencesCopyValue(CFSTR("endpointTypeInfo"), CFSTR("com.apple.mediaexperience"), v22, v23);
  if (!v81)
    goto LABEL_130;
  v82 = v81;
  v83 = CFDictionaryGetTypeID();
  if (v83 != CFGetTypeID(v82))
    goto LABEL_129;
  v127 = v22;
  v84 = CFPropertyListCreateDeepCopy(v7, v82, 1uLL);
  *(_QWORD *)(sStorage + 112) = v84;
  if (!v84)
    goto LABEL_128;
  v85 = (void *)v84;
  v86 = (void *)MXCFPreferencesCopyPreference(CFSTR("endpointTypeInfoEntriesDeleted"));
  if ((objc_msgSend(v86, "BOOLValue") & 1) != 0)
    goto LABEL_127;
  hostNamea = v23;
  v87 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  v88 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v131, valuePtr, 16);
  if (!v88)
  {
    CFRelease(*(CFTypeRef *)(sStorage + 112));
    *(_QWORD *)(sStorage + 112) = v87;
    goto LABEL_126;
  }
  v89 = v88;
  v130 = v87;
  v115 = v86;
  v119 = v82;
  v121 = v7;
  v90 = 0;
  v91 = *(_QWORD *)v132;
  do
  {
    v92 = 0;
    do
    {
      if (*(_QWORD *)v132 != v91)
        objc_enumerationMutation(v85);
      v93 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * v92);
      v94 = objc_msgSend(v85, "objectForKey:", v93);
      v95 = pvmGetMappedBluetoothRouteWithDeviceIDAppended(v93);
      if ((objc_msgSend(v93, "hasPrefix:", CFSTR("AirTunes")) & 1) != 0
        || (objc_msgSend(v93, "hasPrefix:", CFSTR("CarAudioOutput")) & 1) != 0
        || (objc_msgSend(v93, "hasPrefix:", CFSTR("AirPlayLowLatency")) & 1) != 0)
      {
        goto LABEL_118;
      }
      if (v95)
      {
        objc_msgSend(v130, "setValue:forKey:", v94, v95);
LABEL_118:
        v90 = 1;
        goto LABEL_119;
      }
      objc_msgSend(v130, "setValue:forKey:", v94, v93);
LABEL_119:
      ++v92;
    }
    while (v89 != v92);
    v96 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v131, valuePtr, 16);
    v89 = v96;
  }
  while (v96);
  CFRelease(*(CFTypeRef *)(sStorage + 112));
  v97 = sStorage;
  *(_QWORD *)(sStorage + 112) = v130;
  v82 = v119;
  v7 = v121;
  v86 = v115;
  if ((v90 & 1) != 0)
  {
    *(_BYTE *)(v97 + 120) = 1;
    pvmWritePrefs();
  }
LABEL_126:
  MXCFPreferencesSetAndSynchronizeUserPreference(CFSTR("endpointTypeInfoEntriesDeleted"), (const void *)*MEMORY[0x1E0C9AE50]);
  v23 = hostNamea;
LABEL_127:

LABEL_128:
  v22 = v127;
LABEL_129:
  CFRelease(v82);
LABEL_130:
  v98 = CFPreferencesCopyValue(CFSTR("vibeIntensity"), CFSTR("com.apple.mediaexperience"), v22, v23);
  v99 = sStorage;
  *(_QWORD *)(sStorage + 64) = v98;
  CelesteGetRegionSpecificVolumeLimit(*(const __CFDictionary **)(v99 + 80));
  *(_DWORD *)(sStorage + 88) = v100;
  pvmAssureCurrentCategoryAndDeviceRoute();
  v101 = sStorage;
  *(_QWORD *)(sStorage + 264) = 0;
  if (pvmSetCurrentRouteInfo((uint64_t)CFSTR("Unspecified"), *(_QWORD *)(v101 + 248), *(_QWORD *)(v101 + 256), 0, *(CFTypeRef *)(v101 + 272)))
  {
    v1 = (CFTypeRef *)sStorage;
    if (sStorage)
    {
LABEL_132:
      if (v1[2])
      {
        CFRelease(v1[2]);
        v1 = (CFTypeRef *)sStorage;
        *(_QWORD *)(sStorage + 16) = 0;
      }
      if (v1[4])
      {
        CFRelease(v1[4]);
        v1 = (CFTypeRef *)sStorage;
        *(_QWORD *)(sStorage + 32) = 0;
      }
      if (v1[14])
      {
        CFRelease(v1[14]);
        v1 = (CFTypeRef *)sStorage;
        *(_QWORD *)(sStorage + 112) = 0;
      }
      if (v1[31])
      {
        CFRelease(v1[31]);
        *(_QWORD *)(sStorage + 248) = 0;
        *(_BYTE *)(sStorage + 280) = FigCFEqual();
        v102 = FigCFEqual();
        v1 = (CFTypeRef *)sStorage;
        *(_BYTE *)(sStorage + 281) = v102;
      }
      if (v1[26])
      {
        CFRelease(v1[26]);
        v1 = (CFTypeRef *)sStorage;
        *(_QWORD *)(sStorage + 208) = 0;
      }
      if (v1[28])
      {
        CFRelease(v1[28]);
        v1 = (CFTypeRef *)sStorage;
        *(_QWORD *)(sStorage + 224) = 0;
      }
      if (*v1)
      {
        FigSimpleMutexDestroy();
        v1 = (CFTypeRef *)sStorage;
        *(_QWORD *)sStorage = 0;
      }
      free(v1);
      sStorage = 0;
    }
  }
  else
  {
    pvmRemoveVolumesForDeviceRoute(CFSTR("LineOut"), 0, 0);
    v103 = *(const void **)(sStorage + 96);
    if (v103)
    {
      CFRelease(v103);
      *(_QWORD *)(sStorage + 96) = 0;
    }
    v104 = CFPreferencesCopyValue(CFSTR("volumeMultiplier"), CFSTR("com.apple.mediaexperience"), v22, v23);
    if (v104)
    {
      v105 = v104;
      v106 = CFDictionaryGetTypeID();
      if (v106 == CFGetTypeID(v105))
        *(_QWORD *)(sStorage + 96) = CFPropertyListCreateDeepCopy(v7, v105, 1uLL);
      CFRelease(v105);
    }
    *(_BYTE *)(sStorage + 104) = 0;
    v107 = MXGetSerialQueue();
    notify_register_dispatch("HAENVolumeLimitStatusDidChange", (int *)&pvmAdd100dBVolumeLimitChangedListener_sHAENVolumeLimitNotifyToken, v107, &__block_literal_global_142);
    pvmGetMappedCategoryWithModeAppended(CFSTR("MediaPlayback"), CFSTR("VoicePrompt"));
  }
LABEL_154:
  v108 = MXGetSerialQueue();
  MXDispatchAsync((uint64_t)"PVMInitialize_block_invoke", (uint64_t)"MXPreferredVolumeManager.m", 1736, 0, 0, v108, (uint64_t)&__block_literal_global_33_1);
}

uint64_t __PVMInitialize_block_invoke_2()
{
  _QWORD *v0;
  _BOOL8 v1;

  MEMORY[0x1940352BC](*(_QWORD *)sStorage);
  pvmUpdatePreferredVolumeAndLimit((uint64_t)CFSTR("CategoryChange"), 0, *(const __CFString **)(sStorage + 208), *(const void **)(sStorage + 216), 0, 1, 0, 0.0, 0.0);
  MEMORY[0x1940352C8](*(_QWORD *)sStorage);
  MEMORY[0x1940352BC](*(_QWORD *)sStorage);
  v0 = (_QWORD *)sStorage;
  *(_BYTE *)(sStorage + 8) = 0;
  MEMORY[0x1940352C8](*v0);
  v1 = FigGetCFPreferenceNumberWithDefault() != 0;
  return pvmUpdate100dBVolumeLimit(v1);
}

@end
