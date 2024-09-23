@implementation AVAVAudioSettingsAudioOutputSettings

+ (id)eligibleOutputSettingsDictionaryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0C898E0], *MEMORY[0x1E0C89970], *MEMORY[0x1E0C89930], *MEMORY[0x1E0C898F0], *MEMORY[0x1E0C89900], *MEMORY[0x1E0C89910], *MEMORY[0x1E0C89928], *MEMORY[0x1E0C898B0], *MEMORY[0x1E0C898C8], *MEMORY[0x1E0C898D0], *MEMORY[0x1E0C898B8], *MEMORY[0x1E0C89948], *MEMORY[0x1E0C89968], *MEMORY[0x1E0C898A0], *MEMORY[0x1E0C898D8], *MEMORY[0x1E0C898A8], 0);
}

+ (id)_audioOutputSettingsWithAudioSettingsDictionary:(id)a3 exceptionReason:(id *)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAVAudioSettingsDictionary:exceptionReason:", a3, a4);
}

- (AVAVAudioSettingsAudioOutputSettings)initWithAVAudioSettingsDictionary:(id)a3 exceptionReason:(id *)a4
{
  AVAVAudioSettingsAudioOutputSettings *v7;
  objc_class *v8;
  void *v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  BOOL v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  objc_class *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  unsigned int *v47;
  unsigned int *v48;
  const __CFString *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  float v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  unsigned int v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  const __CFString *v64;
  void *v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  unint64_t v72;
  void *v73;
  uint64_t v74;
  unsigned int *v75;
  unsigned int v76;
  double v77;
  double v78;
  char *v79;
  double v80;
  uint64_t v81;
  double v82;
  double v83;
  double v84;
  uint64_t v86;
  _DWORD *v87;
  uint64_t v88;
  int v89;
  int v90;
  char v91;
  unsigned int v92;
  unsigned int *v93;
  unsigned int v94;
  unsigned int v95;
  int v96;
  int v98;
  int v99;
  UInt32 v100;
  OSStatus Property;
  int v102;
  void *v103;
  UInt32 v104;
  int v105;
  uint64_t v106;
  int *v107;
  int v108;
  AVAVAudioSettingsAudioOutputSettings *result;
  const __CFString *v110;
  AVAVAudioSettingsAudioOutputSettings *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  id *v130;
  AVAVAudioSettingsAudioOutputSettings *v131;
  unsigned int *inSpecifier;
  uint64_t v133;
  UInt32 inSpecifierSize[2];
  __CFString *v135;
  int v136;
  __int128 outPropertyData;
  __int128 v138;
  uint64_t v139;
  UInt32 outPropertyDataSize;
  UInt32 ioPropertyDataSize[3];

  v135 = 0;
  v7 = -[AVAudioOutputSettings initWithAudioSettingsDictionary:exceptionReason:](self, "initWithAudioSettingsDictionary:exceptionReason:", a3, &v135);
  v8 = (objc_class *)v7;
  if (!a3)
  {
    v111 = v7;
    v117 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(v8, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v112, v113, v114, v115, v116, (uint64_t)"avAudioSettingsDictionary != nil"), 0);
    objc_exception_throw(v117);
  }
  if (!v7)
  {
LABEL_180:
    result = 0;
    if (!a4)
      return result;
    goto LABEL_181;
  }
  v130 = a4;
  v9 = (void *)objc_msgSend(a3, "allKeys");
  v133 = *MEMORY[0x1E0C898E0];
  v10 = objc_msgSend(v9, "containsObject:");
  if ((v10 & 1) == 0)
    v135 = CFSTR("AVAudioSettings dictionary must contain AVFormatIDKey");
  v11 = *MEMORY[0x1E0C898C8];
  v12 = objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0C898C8]);
  v13 = *MEMORY[0x1E0C898D0];
  v14 = objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0C898D0]);
  v15 = (v10 & v12) != 1 || v14 == 0;
  v16 = (uint64_t *)MEMORY[0x1E0C89910];
  v17 = (uint64_t *)MEMORY[0x1E0C898F0];
  v131 = (AVAVAudioSettingsAudioOutputSettings *)v8;
  v128 = v13;
  v129 = v11;
  if (v15)
  {
    if (!v10)
    {
      v19 = 0;
      goto LABEL_19;
    }
    v18 = *MEMORY[0x1E0C89910];
    if ((!objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0C89910])
       || objc_msgSend(v9, "containsObject:", *v17))
      && ((objc_msgSend(v9, "containsObject:", v18) & 1) != 0 || !objc_msgSend(v9, "containsObject:", *v17)))
    {
      v19 = 1;
      goto LABEL_19;
    }
    v19 = 0;
    v20 = CFSTR("If one of AVLinearPCMIsFloatKey and AVLinearPCMBitDepthKey is specified, both must be specified");
  }
  else
  {
    v19 = 0;
    v20 = CFSTR("Cannot specify both AVEncoderBitRateKey and AVEncoderBitRatePerChannelKey");
  }
  v135 = (__CFString *)v20;
LABEL_19:
  v127 = *v17;
  v21 = objc_msgSend(a3, "objectForKey:");
  v22 = (void *)v21;
  if (v19 && v21)
  {
    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 8);
    v25 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 16);
    v26 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 24);
    v27 = (void *)objc_msgSend(v23, "setWithObjects:", v24, v25, v26, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 32), 0);
    if ((objc_msgSend(v27, "containsObject:", v22) & 1) != 0)
    {
      v19 = 1;
    }
    else
    {
      v19 = 0;
      v135 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bit depth can only be one of: %@"), objc_msgSend((id)objc_msgSend(v27, "allObjects"), "componentsJoinedByString:", CFSTR(", ")));
    }
  }
  v126 = *MEMORY[0x1E0C898B8];
  v28 = objc_msgSend(a3, "objectForKey:");
  if (v19)
  {
    v29 = v28;
    if (v28)
    {
      v30 = (void *)MEMORY[0x1E0C99E60];
      v31 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 16);
      v32 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 20);
      v33 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 24);
      v34 = (void *)objc_msgSend(v30, "setWithObjects:", v31, v32, v33, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 32), 0);
      if ((objc_msgSend(v34, "containsObject:", v29) & 1) != 0)
      {
        v19 = 1;
      }
      else
      {
        v19 = 0;
        v135 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bit depth hint can only be one of: %@"), objc_msgSend((id)objc_msgSend(v34, "allObjects"), "componentsJoinedByString:", CFSTR(", ")));
      }
    }
  }
  v125 = *MEMORY[0x1E0C898D8];
  v35 = objc_msgSend(a3, "objectForKey:");
  v36 = (void *)v35;
  if (v19 && v35)
  {
    v37 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0C89630], *MEMORY[0x1E0C89638], *MEMORY[0x1E0C89648], *MEMORY[0x1E0C89640], 0);
    if ((objc_msgSend(v37, "containsObject:", v36) & 1) != 0)
    {
      v19 = 1;
    }
    else
    {
      v19 = 0;
      v135 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bit rate strategy can only be one of: %@"), objc_msgSend((id)objc_msgSend(v37, "allObjects"), "componentsJoinedByString:", CFSTR(", ")));
    }
  }
  v124 = *MEMORY[0x1E0C898A8];
  v38 = objc_msgSend(a3, "objectForKey:");
  if (v19 && v38)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v36 && (objc_msgSend(v36, "isEqualToString:", *MEMORY[0x1E0C89640]) & 1) != 0)
      {
        v19 = 1;
        goto LABEL_43;
      }
      v41 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot specify a value for AVEncoderAudioQualityForVBRKey without also specifying AVAudioBitRateStrategy_Variable for AVEncoderBitRateStrategyKey"), v118);
    }
    else
    {
      v39 = (void *)MEMORY[0x1E0CB3940];
      v40 = (objc_class *)objc_opt_class();
      v41 = objc_msgSend(v39, "stringWithFormat:", CFSTR("Value for AVEncoderAudioQualityForVBRKey must be an instance of %@"), NSStringFromClass(v40));
    }
    v19 = 0;
    v135 = (__CFString *)v41;
  }
LABEL_43:
  v123 = *v16;
  v42 = (void *)objc_msgSend(a3, "objectForKey:");
  if (v19 && v42 && v22)
  {
    if (objc_msgSend(v42, "BOOLValue") && objc_msgSend(v22, "integerValue") != 32)
    {
      v19 = 0;
      v135 = CFSTR("Floating-point LPCM must be 32-bit");
    }
    else
    {
      v19 = 1;
    }
  }
  v43 = *MEMORY[0x1E0C89930];
  v44 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C89930]);
  v45 = v44;
  if (v19 && v44)
  {
    if (objc_msgSend(v44, "integerValue") <= 0)
    {
      v19 = 0;
      v135 = CFSTR("Channel count must be positive");
    }
    else
    {
      v19 = 1;
    }
  }
  *(_QWORD *)inSpecifierSize = 0;
  v46 = *MEMORY[0x1E0C898A0];
  v47 = copyAudioChannelLayoutFromData((void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C898A0]), (unint64_t *)inSpecifierSize);
  v48 = v47;
  if (v19 && v47)
  {
    if (AudioFormatGetProperty(0x7661636Cu, inSpecifierSize[0], v47, 0, 0))
    {
      v19 = 0;
      v49 = CFSTR("AudioChannelLayout is invalid");
LABEL_66:
      v135 = (__CFString *)v49;
      goto LABEL_67;
    }
    LODWORD(outPropertyData) = 0;
    ioPropertyDataSize[0] = 4;
    if (AudioFormatGetProperty(0x6E63686Du, inSpecifierSize[0], v48, ioPropertyDataSize, &outPropertyData)
      || (v50 = outPropertyData, !(_DWORD)outPropertyData))
    {
      v19 = 0;
      v49 = CFSTR("AudioChannelLayout channel count must be positive");
      goto LABEL_66;
    }
    if (v45 && objc_msgSend(v45, "integerValue") != v50)
    {
      v19 = 0;
      v49 = CFSTR("AudioChannelLayout channel count does not match AVNumberOfChannelsKey channel count");
      goto LABEL_66;
    }
    v19 = 1;
  }
LABEL_67:
  v51 = *MEMORY[0x1E0C89970];
  v52 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C89970]);
  v53 = v52;
  if (v19 && v52)
  {
    objc_msgSend(v52, "floatValue");
    if (v54 < 8000.0 || v54 > 192000.0)
    {
      v19 = 0;
      v135 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid value %.2f for AVSampleRateKey; sample rate must be between 8.0 and 192.0 kHz inclusive"),
                             v54);
    }
    else
    {
      v19 = 1;
    }
  }
  inSpecifier = v48;
  v55 = *MEMORY[0x1E0C89948];
  v56 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C89948]);
  if (!v19)
    goto LABEL_79;
  v57 = (void *)v56;
  if (!v56)
    goto LABEL_79;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v64 = CFSTR("Value for AVSampleRateConverterAlgorithmKey must be an instance of NSString");
LABEL_114:
    v75 = inSpecifier;
    v135 = (__CFString *)v64;
    objc_msgSend(a3, "objectForKey:", v133);
LABEL_115:
    a4 = v130;
    goto LABEL_116;
  }
  if ((objc_msgSend(v57, "isEqualToString:", *MEMORY[0x1E0C89960]) & 1) == 0
    && (objc_msgSend(v57, "isEqualToString:", *MEMORY[0x1E0C89958]) & 1) == 0)
  {
    v64 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unrecognized value \"%@\" for AVSampleRateConverterAlgorithmKey"), v57);
    goto LABEL_114;
  }
  v19 = 1;
LABEL_79:
  v122 = v45;
  v58 = (void *)objc_msgSend(a3, "objectForKey:", v133);
  if (!v19)
    goto LABEL_176;
  v59 = v58;
  if (!v58)
    goto LABEL_176;
  v60 = objc_msgSend(v58, "unsignedIntValue");
  v61 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v133, v51, v43, v55, *MEMORY[0x1E0C89968], v46, 0);
  v62 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(a3, "allKeys"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v62), "intersectSet:", v61);
  if (v60 == 1634492771)
  {
    v63 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v126, 0, v119, v120, v121);
  }
  else if (v60 == 1819304813)
  {
    v63 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v127, *MEMORY[0x1E0C89900], v123, *MEMORY[0x1E0C89928], 0);
  }
  else
  {
    v65 = (void *)MEMORY[0x1E0C99E60];
    v66 = *MEMORY[0x1E0C898B0];
    v67 = objc_msgSend(v62, "containsObject:", v128);
    v68 = v129;
    if (v67)
      v68 = v128;
    v63 = objc_msgSend(v65, "setWithObjects:", v66, v68, v125, v124, 0);
  }
  v69 = v63;
  v70 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v62);
  objc_msgSend(v70, "minusSet:", v61);
  v71 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v69);
  objc_msgSend(v71, "intersectSet:", v70);
  v72 = objc_msgSend(v71, "count");
  if (v72 < objc_msgSend(v70, "count"))
  {
    v73 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v70);
    objc_msgSend(v73, "minusSet:", v71);
    v74 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The following keys are not allowed when format ID is '%@': %@"), AVStringForOSType(v60), objc_msgSend((id)objc_msgSend(v73, "allObjects"), "componentsJoinedByString:", CFSTR(", ")));
LABEL_91:
    v135 = (__CFString *)v74;
    a4 = v130;
    v75 = inSpecifier;
LABEL_116:
    free(v75);
LABEL_179:

    goto LABEL_180;
  }
  v76 = objc_msgSend(v59, "unsignedIntValue");
  if (!encoderExistsForFormat(v76))
    goto LABEL_176;
  if (v53)
  {
    objc_msgSend(v53, "doubleValue");
    v78 = v77;
    LODWORD(outPropertyData) = v76;
    ioPropertyDataSize[0] = 0;
    if (AudioFormatGetPropertyInfo(0x61657372u, 4u, &outPropertyData, ioPropertyDataSize))
    {
      v79 = 0;
    }
    else
    {
      v79 = (char *)malloc_type_malloc(ioPropertyDataSize[0], 0x17C14BADuLL);
      if (v79 && !AudioFormatGetProperty(0x61657372u, 4u, &outPropertyData, ioPropertyDataSize, v79))
      {
        v80 = 0.0;
        if (ioPropertyDataSize[0] < 0x10)
          goto LABEL_119;
        v81 = 0;
        v82 = 3.40282347e38;
        while (1)
        {
          v83 = *(double *)&v79[v81];
          v84 = *(double *)&v79[v81 + 8];
          if (v83 == 0.0 && v84 == 0.0)
            break;
          if (v83 <= v78 && v84 >= v78)
            break;
          if (v84 >= v78)
          {
            if (v83 - v78 < v82)
            {
              v80 = *(double *)&v79[v81];
              v82 = v83 - v78;
            }
          }
          else if (v78 - v84 < v82)
          {
            v80 = *(double *)&v79[v81 + 8];
            v82 = v78 - v84;
          }
          v81 += 16;
          if ((ioPropertyDataSize[0] & 0xFFFFFFF0) == v81)
            goto LABEL_119;
        }
      }
    }
    v80 = v78;
LABEL_119:
    free(v79);
    if (v78 != v80)
    {
      v74 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%g Hz is not a valid sample rate for Format ID '%@'.  Use kAudioFormatProperty_AvailableEncodeSampleRates (<AudioToolbox/AudioFormat.h>) to enumerate available rates for a given format."), *(_QWORD *)&v78, AVStringForOSType(v76));
      goto LABEL_91;
    }
  }
  v75 = inSpecifier;
  if (!v122)
    goto LABEL_157;
  v86 = objc_msgSend(v122, "unsignedIntegerValue");
  ioPropertyDataSize[0] = 0;
  v139 = 0;
  outPropertyData = 0u;
  v138 = 0u;
  DWORD2(outPropertyData) = v76;
  if (AudioFormatGetPropertyInfo(0x61766E63u, 0x28u, &outPropertyData, ioPropertyDataSize))
  {
    v87 = 0;
LABEL_156:
    free(v87);
    goto LABEL_157;
  }
  v87 = malloc_type_malloc(ioPropertyDataSize[0], 0x1DBBAE27uLL);
  if (AudioFormatGetProperty(0x61766E63u, 0x28u, &outPropertyData, ioPropertyDataSize, v87))
    goto LABEL_156;
  LODWORD(v88) = ioPropertyDataSize[0] >> 2;
  if (ioPropertyDataSize[0] >> 2 == 1 && *v87 == -1)
    goto LABEL_156;
  if (ioPropertyDataSize[0] >= 4)
  {
    v90 = 0;
    v91 = 0;
    v92 = 0;
    if (v88 <= 1)
      v88 = 1;
    else
      v88 = v88;
    v93 = v87;
    while (1)
    {
      v95 = *v93++;
      v94 = v95;
      if (v95 == (_DWORD)v86)
        break;
      if (v94 == 1)
        v96 = 1;
      else
        v96 = v90;
      if (v94 == 2)
        v91 = 1;
      else
        v90 = v96;
      if (v94 > v92 && v94 < v86)
        v92 = v86;
      if (!--v88)
      {
        v98 = 2;
        goto LABEL_147;
      }
    }
    v91 = 1;
    v98 = v86;
    v92 = v86;
LABEL_147:
    if ((v90 & 1) != 0)
      v99 = 1;
    else
      v99 = v92;
    if ((v91 & 1) != 0)
      v89 = v98;
    else
      v89 = v99;
  }
  else
  {
    v89 = 0;
  }
  free(v87);
  if (v89 != (_DWORD)v86)
  {
    v135 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d is not a valid channel count for Format ID '%@'.  Use kAudioFormatProperty_AvailableEncodeNumberChannels (<AudioToolbox/AudioFormat.h>) to enumerate available channel counts for a given format."), v86, AVStringForOSType(v76));
    goto LABEL_115;
  }
LABEL_157:
  if (!inSpecifier)
    goto LABEL_176;
  v100 = inSpecifierSize[0];
  LODWORD(outPropertyData) = 0;
  outPropertyDataSize = 0;
  ioPropertyDataSize[0] = 4;
  Property = AudioFormatGetProperty(0x6E63686Du, inSpecifierSize[0], inSpecifier, ioPropertyDataSize, &outPropertyData);
  v102 = outPropertyData;
  if (Property)
    v102 = 0;
  outPropertyData = 0u;
  v138 = 0u;
  v139 = 0;
  DWORD2(outPropertyData) = v76;
  HIDWORD(v138) = v102;
  if (AudioFormatGetPropertyInfo(0x6165636Cu, 0x28u, &outPropertyData, &outPropertyDataSize))
    goto LABEL_161;
  v103 = malloc_type_malloc(outPropertyDataSize, 0x9BEB004FuLL);
  if (!v103 || AudioFormatGetProperty(0x6165636Cu, 0x28u, &outPropertyData, &outPropertyDataSize, v103))
  {
LABEL_183:
    free(v103);
LABEL_161:
    free(inSpecifier);
    a4 = v130;
    goto LABEL_177;
  }
  v104 = outPropertyDataSize;
  v136 = 0;
  outPropertyDataSize = 4;
  if (AudioFormatGetProperty(0x636D7074u, v100, inSpecifier, &outPropertyDataSize, &v136))
    goto LABEL_184;
  v105 = v136;
  if (v104 >= 4)
  {
    LODWORD(v106) = v104 >> 2;
    if (v104 >> 2 <= 1)
      v106 = 1;
    else
      v106 = v106;
    v107 = (int *)v103;
    do
    {
      v108 = *v107++;
      if (v108 == v136)
        goto LABEL_183;
    }
    while (--v106);
  }
  if (v76 != 1634754915 && v76 != 1667330147 && v76 != 1902211171)
  {
LABEL_184:
    free(v103);
LABEL_185:
    v110 = CFSTR("Unsupported encoding format");
    if (v76 == 1634754915 || v76 == 1667330147)
    {
      a4 = v130;
      v75 = inSpecifier;
    }
    else
    {
      a4 = v130;
      v75 = inSpecifier;
      if (v76 != 1902211171)
        v110 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Channel layout is not valid for Format ID '%@'.  Use kAudioFormatProperty_AvailableEncodeChannelLayoutTags (<AudioToolbox/AudioFormat.h>) to enumerate available channel layout tags for a given format."), AVStringForOSType(v76));
    }
    v135 = (__CFString *)v110;
    goto LABEL_116;
  }
  free(v103);
  if (v105 != -266338299)
    goto LABEL_185;
LABEL_176:
  free(inSpecifier);
  a4 = v130;
  if ((v19 & 1) == 0)
    goto LABEL_179;
LABEL_177:
  result = v131;
  if (!a4)
    return result;
LABEL_181:
  *a4 = v135;
  return result;
}

- (AVAVAudioSettingsAudioOutputSettings)initWithTrustedAVAudioSettingsDictionary:(id)a3
{
  return -[AVAudioOutputSettings initWithAudioSettingsDictionary:exceptionReason:](self, "initWithAudioSettingsDictionary:exceptionReason:", a3, 0);
}

- (BOOL)willYieldCompressedSamples
{
  NSDictionary *v2;

  v2 = -[AVAudioOutputSettings audioSettingsDictionary](self, "audioSettingsDictionary");
  return objc_msgSend(-[NSDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x1E0C898E0]), "unsignedIntValue") != 1819304813;
}

- (BOOL)encoderIsAvailableOnCurrentSystemReturningError:(id *)a3
{
  NSDictionary *v4;
  id v5;
  char v6;
  void *v7;

  v4 = -[AVAudioOutputSettings audioSettingsDictionary](self, "audioSettingsDictionary");
  v5 = -[NSDictionary objectForKey:](v4, "objectForKey:", *MEMORY[0x1E0C898E0]);
  v6 = encoderExistsForFormat(objc_msgSend(v5, "unsignedIntValue"));
  if ((v6 & 1) == 0)
  {
    v7 = (void *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11834, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("soun"), CFSTR("AVErrorMediaTypeKey"), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v5, 0), CFSTR("AVErrorMediaSubTypeKey"), 0));
    if (a3)
      *a3 = v7;
  }
  return v6;
}

- (BOOL)canFullySpecifyOutputFormatReturningReason:(id *)a3
{
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  BOOL result;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = -[AVAudioOutputSettings audioSettingsDictionary](self, "audioSettingsDictionary");
  v5 = *MEMORY[0x1E0C898E0];
  v6 = *MEMORY[0x1E0C898A0];
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", *MEMORY[0x1E0C898E0], *MEMORY[0x1E0C89970], *MEMORY[0x1E0C898A0], 0);
  v8 = objc_msgSend(-[NSDictionary objectForKey:](v4, "objectForKey:", v5), "unsignedIntValue");
  v9 = -[NSDictionary objectForKey:](v4, "objectForKey:", *MEMORY[0x1E0C89930]);
  if (v9 && (unint64_t)(objc_msgSend(v9, "integerValue") - 1) <= 1)
    objc_msgSend(v7, "removeObject:", v6);
  if (v8 == 1634492771)
  {
    v10 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0C898B8], 0, v19, v20, v21);
  }
  else
  {
    if (v8 != 1819304813)
      goto LABEL_9;
    v10 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0C898F0], *MEMORY[0x1E0C89900], *MEMORY[0x1E0C89910], *MEMORY[0x1E0C89928], 0);
  }
  objc_msgSend(v7, "unionSet:", v10);
LABEL_9:
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v7);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (!-[NSDictionary objectForKey:](v4, "objectForKey:", v15))
        {
          v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing required key %@"), v15);
          if (!a3)
            return 0;
          v18 = (void *)v17;
          result = 0;
          *a3 = v18;
          return result;
        }
      }
      v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v12)
        continue;
      break;
    }
  }
  return 1;
}

- (void)getAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3 forAudioFileTypeID:(unsigned int)a4 sourceFormatDescription:(opaqueCMFormatDescription *)a5
{
  const AudioFormatListItem *RichestDecodableFormat;
  const AudioStreamBasicDescription *StreamBasicDescription;
  NSDictionary *v11;
  _BOOL4 v12;
  char v13;
  int v14;
  char v15;
  const opaqueCMFormatDescription *v16;
  uint64_t v17;
  uint64_t mBitsPerChannel;
  unint64_t v20;
  __int128 v21;
  int v22;
  const __CFArray *v23;
  const AudioStreamBasicDescription *v24;
  int v25;
  char v26;
  id v27;
  int v28;
  int v29;
  unsigned int v30;
  id v31;
  int v32;
  int v33;
  unsigned int v34;
  id v35;
  unsigned int v36;
  id v37;
  BOOL v38;
  int v39;
  int v40;
  unsigned int v41;
  id v42;
  unsigned int *v43;
  unsigned int *v44;
  BOOL v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  unint64_t v50;
  AVAudioSettingsValueConstrainer *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  double v55;
  char v56;
  AudioFormatFlags mFormatFlags;
  unsigned int mBytesPerFrame;
  uint64_t v59;
  int v60;
  __int128 v61;
  double mSampleRate;
  float v63;
  CMAudioFormatDescriptionRef desc[2];
  __int128 v65;
  uint64_t v66;
  UInt32 inSpecifierSize[2];
  __int128 outPropertyData;
  __int128 v69;
  uint64_t v70;
  UInt32 ioPropertyDataSize;

  v70 = 0;
  outPropertyData = 0u;
  v69 = 0u;
  if (!a5)
  {
    v11 = -[AVAudioOutputSettings audioSettingsDictionary](self, "audioSettingsDictionary");
    StreamBasicDescription = 0;
    goto LABEL_5;
  }
  RichestDecodableFormat = CMAudioFormatDescriptionGetRichestDecodableFormat(a5);
  if (!RichestDecodableFormat)
  {
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(a5);
    v11 = -[AVAudioOutputSettings audioSettingsDictionary](self, "audioSettingsDictionary");
    if (StreamBasicDescription)
      goto LABEL_7;
LABEL_5:
    v12 = 0;
    v13 = 1;
    goto LABEL_8;
  }
  StreamBasicDescription = &RichestDecodableFormat->mASBD;
  v11 = -[AVAudioOutputSettings audioSettingsDictionary](self, "audioSettingsDictionary");
LABEL_7:
  v13 = 0;
  v12 = StreamBasicDescription->mFormatID == 1819304813;
LABEL_8:
  v14 = objc_msgSend(-[NSDictionary objectForKey:](v11, "objectForKey:", *MEMORY[0x1E0C898E0]), "unsignedIntValue");
  DWORD2(outPropertyData) = v14;
  if (v14 == 1634492771)
  {
    v17 = objc_msgSend(-[NSDictionary objectForKey:](v11, "objectForKey:", *MEMORY[0x1E0C898B8]), "integerValue");
    if ((v13 & 1) == 0 && StreamBasicDescription->mFormatID == 1819304813)
    {
      mBitsPerChannel = StreamBasicDescription->mBitsPerChannel;
      if ((_DWORD)mBitsPerChannel == 32 && (StreamBasicDescription->mFormatFlags & 1) != 0)
        mBitsPerChannel = 24;
      if (v17 > mBitsPerChannel || v17 == 0)
        v17 = mBitsPerChannel;
    }
    goto LABEL_28;
  }
  if (v14 != 1819304813)
  {
    v17 = 0;
LABEL_28:
    *((_QWORD *)&v21 + 1) = v17;
    *(_QWORD *)&v21 = v17 - 16;
    v20 = v21 >> 2;
    if (v20 > 4)
      v22 = 0;
    else
      v22 = dword_19357D30C[v20];
    DWORD2(v69) = 0;
    *(_QWORD *)&v69 = 0;
    HIDWORD(outPropertyData) = v22;
    goto LABEL_115;
  }
  desc[0] = 0;
  if (v12)
    v15 = 1;
  else
    v15 = v13;
  if ((v15 & 1) == 0)
  {
    v23 = (const __CFArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a5);
    CMAudioFormatDescriptionCreateSummary((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v23, 0, desc);
    v24 = CMAudioFormatDescriptionGetStreamBasicDescription(desc[0]);
    v25 = HIDWORD(outPropertyData);
LABEL_39:
    HIDWORD(outPropertyData) = v25 | 8;
    goto LABEL_41;
  }
  if (a5)
    v16 = (const opaqueCMFormatDescription *)CFRetain(a5);
  else
    v16 = 0;
  desc[0] = v16;
  if (v12)
    v26 = v13;
  else
    v26 = 1;
  if ((v26 & 1) != 0)
  {
    v25 = 0;
    v24 = StreamBasicDescription;
    goto LABEL_39;
  }
  HIDWORD(outPropertyData) = StreamBasicDescription->mFormatFlags & 0x18;
  v24 = StreamBasicDescription;
LABEL_41:
  v27 = -[NSDictionary objectForKey:](v11, "objectForKey:", *MEMORY[0x1E0C89928], desc[0]);
  if (v27)
  {
    v28 = objc_msgSend(v27, "BOOLValue");
    v29 = HIDWORD(outPropertyData);
    if (v28)
    {
      v30 = HIDWORD(outPropertyData) | 0x20;
LABEL_47:
      HIDWORD(outPropertyData) = v30;
      goto LABEL_48;
    }
LABEL_46:
    v30 = v29 & 0xFFFFFFDF;
    goto LABEL_47;
  }
  if (a4)
  {
    v29 = HIDWORD(outPropertyData);
    goto LABEL_46;
  }
  if (v24)
  {
    v30 = HIDWORD(outPropertyData) | v24->mFormatFlags & 0x20;
    goto LABEL_47;
  }
LABEL_48:
  v31 = -[NSDictionary objectForKey:](v11, "objectForKey:", *MEMORY[0x1E0C89900]);
  if (v31)
  {
    v32 = objc_msgSend(v31, "BOOLValue");
    v33 = HIDWORD(outPropertyData);
    if (!v32)
      goto LABEL_59;
LABEL_55:
    v34 = v33 | 2;
LABEL_60:
    HIDWORD(outPropertyData) = v34;
    goto LABEL_61;
  }
  if ((int)a4 > 1380333107)
  {
    if (a4 == 1380333108 || a4 == 1463899717)
    {
      v33 = HIDWORD(outPropertyData);
LABEL_59:
      v34 = v33 & 0xFFFFFFFD;
      goto LABEL_60;
    }
  }
  else if (a4 == 1095321155 || a4 == 1095321158)
  {
    v33 = HIDWORD(outPropertyData);
    goto LABEL_55;
  }
  if (v24)
  {
    v34 = HIDWORD(outPropertyData) | v24->mFormatFlags & 2;
    goto LABEL_60;
  }
LABEL_61:
  v35 = -[NSDictionary objectForKey:](v11, "objectForKey:", *MEMORY[0x1E0C89910]);
  if (v35)
  {
    if (objc_msgSend(v35, "BOOLValue"))
    {
      v36 = HIDWORD(outPropertyData) & 0xFFFFFFFA | 1;
      goto LABEL_82;
    }
    v38 = a4 == 1380333108 || a4 == 1463899717;
    v36 = HIDWORD(outPropertyData) & 0xFFFFFFFA;
    if (v38 && (_DWORD)v70 == 8)
      goto LABEL_82;
LABEL_77:
    v36 |= 4u;
    goto LABEL_82;
  }
  if ((v13 & 1) == 0 && StreamBasicDescription->mFormatID == 1634492771)
  {
    HIDWORD(outPropertyData) = HIDWORD(outPropertyData) & 0xFFFFFFFA | 4;
    v37 = -[NSDictionary objectForKey:](v11, "objectForKey:", *MEMORY[0x1E0C898F0]);
    if (v37)
    {
LABEL_84:
      LODWORD(v70) = objc_msgSend(v37, "unsignedIntegerValue");
      goto LABEL_113;
    }
    goto LABEL_86;
  }
  if (a4 == 1095321158)
  {
    v36 = HIDWORD(outPropertyData) & 0xFFFFFFFE;
    goto LABEL_77;
  }
  if (!v24)
    goto LABEL_83;
  HIDWORD(outPropertyData) |= v24->mFormatFlags & 1;
  v36 = v24->mFormatFlags & 4 | HIDWORD(outPropertyData);
LABEL_82:
  HIDWORD(outPropertyData) = v36;
LABEL_83:
  v37 = -[NSDictionary objectForKey:](v11, "objectForKey:", *MEMORY[0x1E0C898F0]);
  if (v37)
    goto LABEL_84;
  if ((v13 & 1) == 0)
  {
LABEL_86:
    if (StreamBasicDescription->mFormatID == 1634492771)
    {
      switch(StreamBasicDescription->mFormatFlags)
      {
        case 1u:
          goto LABEL_88;
        case 2u:
          v39 = 20;
          goto LABEL_112;
        case 3u:
          goto LABEL_111;
        case 4u:
          goto LABEL_109;
        default:
          goto LABEL_113;
      }
      goto LABEL_113;
    }
  }
  if (!v24)
    goto LABEL_113;
  LODWORD(v70) = v24->mBitsPerChannel;
  if ((int)a4 > 1380333107)
  {
    if (a4 == 1463899717)
      goto LABEL_96;
    v40 = 1380333108;
  }
  else
  {
    if (a4 == 1095321155)
      goto LABEL_96;
    v40 = 1095321158;
  }
  if (a4 != v40)
    goto LABEL_113;
LABEL_96:
  HIDWORD(outPropertyData) = HIDWORD(outPropertyData) & 0xFFFFFFE7 | 8;
  if ((v24->mFormatFlags & 1) != 0)
  {
    if (a4 == 1095321158)
      goto LABEL_111;
  }
  else
  {
    if (a4 == 1095321155 || a4 == 1463899717 || a4 == 1380333108)
    {
      v41 = v24->mBitsPerChannel;
      if (v41 >= 0x40)
      {
        v39 = 64;
        goto LABEL_112;
      }
    }
    else
    {
      v41 = v24->mBitsPerChannel;
    }
    if (v41 >= 0x20)
    {
LABEL_109:
      v39 = 32;
      goto LABEL_112;
    }
    if (v41 >= 0x18)
    {
LABEL_111:
      v39 = 24;
      goto LABEL_112;
    }
    if (v41 >= 0x10)
    {
LABEL_88:
      v39 = 16;
LABEL_112:
      LODWORD(v70) = v39;
      goto LABEL_113;
    }
    if (v41 >= 8)
    {
      v39 = 8;
      goto LABEL_112;
    }
  }
LABEL_113:
  DWORD1(v69) = 1;
  if (desc[0])
    CFRelease(desc[0]);
LABEL_115:
  v42 = -[NSDictionary objectForKey:](v11, "objectForKey:", *MEMORY[0x1E0C89930]);
  *(_QWORD *)inSpecifierSize = 0;
  v43 = copyAudioChannelLayoutFromData(-[NSDictionary objectForKey:](v11, "objectForKey:", *MEMORY[0x1E0C898A0]), (unint64_t *)inSpecifierSize);
  v44 = v43;
  if (v42)
    v45 = 1;
  else
    v45 = v43 == 0;
  if (!v45)
  {
    v46 = (void *)MEMORY[0x1E0CB37E8];
    LODWORD(desc[0]) = 0;
    ioPropertyDataSize = 4;
    if (AudioFormatGetProperty(0x6E63686Du, inSpecifierSize[0], v43, &ioPropertyDataSize, desc))
      v47 = 0;
    else
      v47 = LODWORD(desc[0]);
    v42 = (id)objc_msgSend(v46, "numberWithInteger:", v47);
  }
  v48 = -[NSDictionary objectForKey:](v11, "objectForKey:", *MEMORY[0x1E0C89970]);
  v49 = -[NSDictionary objectForKey:](v11, "objectForKey:", *MEMORY[0x1E0C898C8]);
  if ((v13 & 1) != 0)
  {
    v51 = 0;
  }
  else
  {
    v52 = (void *)v49;
    v51 = objc_alloc_init(AVAudioSettingsValueConstrainer);
    v53 = *(_OWORD *)&StreamBasicDescription->mSampleRate;
    v54 = *(_OWORD *)&StreamBasicDescription->mBytesPerPacket;
    v66 = *(_QWORD *)&StreamBasicDescription->mBitsPerChannel;
    *(_OWORD *)desc = v53;
    v65 = v54;
    -[AVAudioSettingsValueConstrainer setInputPropertiesFromASBD:](v51, "setInputPropertiesFromASBD:", desc);
    -[AVAudioSettingsValueConstrainer setOutputFormat:](v51, "setOutputFormat:", DWORD2(outPropertyData));
    -[AVAudioSettingsValueConstrainer setOutputFormatFlags:](v51, "setOutputFormatFlags:", HIDWORD(outPropertyData));
    -[AVAudioSettingsValueConstrainer setOutputBitsPerChannel:](v51, "setOutputBitsPerChannel:", v70);
    if (v48)
    {
      objc_msgSend(v48, "doubleValue");
      *(float *)&v55 = v55;
      -[AVAudioSettingsValueConstrainer setOutputSampleRate:](v51, "setOutputSampleRate:", v55);
    }
    if (v42)
      -[AVAudioSettingsValueConstrainer setOutputChannelCount:](v51, "setOutputChannelCount:", objc_msgSend(v42, "unsignedIntegerValue"));
    if (v52)
      -[AVAudioSettingsValueConstrainer setOutputDataRate:](v51, "setOutputDataRate:", objc_msgSend(v52, "unsignedIntegerValue"));
  }
  if (v42)
  {
    HIDWORD(v69) = objc_msgSend(v42, "unsignedIntegerValue");
  }
  else
  {
    if (a4 == 1634562662)
    {
      HIDWORD(v69) = 1;
      if (v48)
        goto LABEL_134;
LABEL_139:
      *(_QWORD *)&outPropertyData = 0x40BF400000000000;
      goto LABEL_140;
    }
    if ((v13 & 1) == 0)
    {
      v59 = -[AVAudioSettingsValueConstrainer availableOutputChannelCountForDesiredChannelCount:rounding:](v51, "availableOutputChannelCountForDesiredChannelCount:rounding:", StreamBasicDescription->mChannelsPerFrame, -1);
      HIDWORD(v69) = v59;
      -[AVAudioSettingsValueConstrainer setOutputChannelCount:](v51, "setOutputChannelCount:", v59);
    }
  }
  if (v48)
  {
LABEL_134:
    objc_msgSend(v48, "doubleValue");
    *(_QWORD *)&outPropertyData = v50;
    goto LABEL_140;
  }
  if (a4 == 1634562662)
    goto LABEL_139;
  if ((v13 & 1) == 0)
  {
    mSampleRate = StreamBasicDescription->mSampleRate;
    *(float *)&mSampleRate = StreamBasicDescription->mSampleRate;
    -[AVAudioSettingsValueConstrainer applicableOutputSampleRateForDesiredSampleRate:rounding:](v51, "applicableOutputSampleRateForDesiredSampleRate:rounding:", 1, mSampleRate);
    *(double *)&outPropertyData = v63;
    -[AVAudioSettingsValueConstrainer setOutputSampleRate:](v51, "setOutputSampleRate:");
  }
LABEL_140:
  if (DWORD2(outPropertyData) == 1819304813)
  {
    if ((BYTE12(outPropertyData) & 8) != 0)
    {
      LODWORD(v50) = v70;
      mBytesPerFrame = vcvtpd_u64_f64((double)v50 * 0.125);
    }
    else
    {
      if (v12)
        v56 = v13;
      else
        v56 = 1;
      if ((v56 & 1) != 0 || (mFormatFlags = StreamBasicDescription->mFormatFlags, (mFormatFlags & 8) != 0))
      {
        mBytesPerFrame = ((v70 >> 3) + 3) & 0x3FFFFFFC;
      }
      else
      {
        mBytesPerFrame = StreamBasicDescription->mBytesPerFrame;
        if ((mFormatFlags & 0x20) == 0)
          mBytesPerFrame /= StreamBasicDescription->mChannelsPerFrame;
      }
    }
    if ((BYTE12(outPropertyData) & 0x20) != 0)
      v60 = 1;
    else
      v60 = HIDWORD(v69);
    LODWORD(v69) = mBytesPerFrame * v60;
    DWORD2(v69) = mBytesPerFrame * v60;
  }
  free(v44);
  LODWORD(desc[0]) = 40;
  AudioFormatGetProperty(0x666D7469u, 0, 0, (UInt32 *)desc, &outPropertyData);
  if (a3)
  {
    v61 = v69;
    *(_OWORD *)&a3->mSampleRate = outPropertyData;
    *(_OWORD *)&a3->mBytesPerPacket = v61;
    *(_QWORD *)&a3->mBitsPerChannel = v70;
  }
}

- (AudioChannelLayout)copyAudioChannelLayoutForSourceFormatDescription:(opaqueCMFormatDescription *)a3 audioChannelLayoutSize:(unint64_t *)a4
{
  NSDictionary *v6;
  id v7;
  id v8;
  unsigned int *v9;
  AudioChannelLayout *v10;
  void *v12;
  unsigned int v13;
  OSStatus Property;
  int v15;
  AudioChannelLayout *v16;
  UInt32 inSpecifierSize[2];
  unint64_t v18;
  UInt32 ioPropertyDataSize;
  int outPropertyData;

  v18 = 0;
  v6 = -[AVAudioOutputSettings audioSettingsDictionary](self, "audioSettingsDictionary");
  v7 = -[NSDictionary objectForKey:](v6, "objectForKey:", *MEMORY[0x1E0C898A0]);
  v8 = -[NSDictionary objectForKey:](v6, "objectForKey:", *MEMORY[0x1E0C89930]);
  if (v7)
  {
    v9 = copyAudioChannelLayoutFromData(v7, &v18);
LABEL_3:
    v10 = (AudioChannelLayout *)v9;
    goto LABEL_4;
  }
  v12 = v8;
  if (a3)
  {
    *(_QWORD *)inSpecifierSize = 0;
    v10 = (AudioChannelLayout *)AVCopyBestAudioChannelLayoutFromFormatDescription(a3, (size_t *)inSpecifierSize);
    if (!v10 || !v12)
      goto LABEL_13;
    v13 = objc_msgSend(v12, "unsignedIntegerValue");
    ioPropertyDataSize = 4;
    outPropertyData = 0;
    Property = AudioFormatGetProperty(0x6E63686Du, inSpecifierSize[0], v10, &ioPropertyDataSize, &outPropertyData);
    v15 = outPropertyData;
    if (Property)
      v15 = 0;
    if (v15 != v13)
    {
      v16 = (AudioChannelLayout *)copyDefaultChannelLayoutForChannelCount(v13, (uint64_t *)&v18);
      free(v10);
      v10 = v16;
    }
    else
    {
LABEL_13:
      v18 = *(_QWORD *)inSpecifierSize;
    }
  }
  else
  {
    if (v8)
    {
      v9 = copyDefaultChannelLayoutForChannelCount(objc_msgSend(v8, "integerValue"), (uint64_t *)&v18);
      goto LABEL_3;
    }
    v10 = 0;
  }
LABEL_4:
  if (a4)
    *a4 = v18;
  return v10;
}

- (id)audioOptions
{
  void *v3;
  NSDictionary *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = -[AVAudioOutputSettings audioSettingsDictionary](self, "audioSettingsDictionary");
  v5 = -[NSDictionary objectForKey:](v4, "objectForKey:", *MEMORY[0x1E0C898C8]);
  v6 = (_QWORD *)MEMORY[0x1E0CC3D98];
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, *MEMORY[0x1E0CC3D98]);
  v7 = -[NSDictionary objectForKey:](v4, "objectForKey:", *MEMORY[0x1E0C898B0]);
  if (v7)
    objc_msgSend(v3, "setObject:forKey:", v7, *MEMORY[0x1E0CC3DB8]);
  v8 = -[NSDictionary objectForKey:](v4, "objectForKey:", *MEMORY[0x1E0C898D0]);
  v9 = -[NSDictionary objectForKey:](v4, "objectForKey:", *MEMORY[0x1E0C89930]);
  if (v8)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v11 = (void *)v9;
    v12 = objc_msgSend(v8, "integerValue");
    v13 = objc_msgSend(v11, "integerValue");
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13 * v12), *v6);
  }
  v14 = -[NSDictionary objectForKey:](v4, "objectForKey:", *MEMORY[0x1E0C898D8]);
  if (v14)
  {
    v15 = v14;
    v16 = (void *)MEMORY[0x1E0CB37E8];
    if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0C89630]) & 1) != 0)
    {
      v17 = 0;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0C89638]) & 1) != 0)
    {
      v17 = 1;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0C89640]) & 1) != 0)
    {
      v17 = 3;
    }
    else
    {
      if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0C89648]) & 1) == 0)
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Unrecognized bit rate strategy"), 0));
      v17 = 2;
    }
    v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", v17);
    objc_msgSend(v3, "setObject:forKey:", v18, *MEMORY[0x1E0CC3DB0]);
  }
  v19 = -[NSDictionary objectForKey:](v4, "objectForKey:", *MEMORY[0x1E0C898A8]);
  if (v19)
    objc_msgSend(v3, "setObject:forKey:", v19, *MEMORY[0x1E0CC3DD0]);
  v20 = -[NSDictionary objectForKey:](v4, "objectForKey:", *MEMORY[0x1E0C89948]);
  if (v20)
  {
    v21 = v20;
    v22 = (void *)MEMORY[0x1E0CB37E8];
    if ((objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0C89960]) & 1) != 0)
    {
      v23 = 1852797549;
    }
    else if (objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0C89958]))
    {
      v23 = 1650553971;
    }
    else
    {
      v23 = 0;
    }
    v24 = objc_msgSend(v22, "numberWithUnsignedInt:", v23);
    objc_msgSend(v3, "setObject:forKey:", v24, *MEMORY[0x1E0CC3DA0]);
  }
  -[AVAVAudioSettingsAudioOutputSettings willYieldCompressedSamples](self, "willYieldCompressedSamples");
  return v3;
}

@end
