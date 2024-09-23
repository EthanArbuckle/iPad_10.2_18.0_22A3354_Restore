@implementation Start

void __aprscreen_Start_block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFDictionary *v2;
  uint64_t v3;
  uint64_t DerivedStorage;
  socklen_t v5;
  int v6;
  uint64_t v7;
  __CFDictionary *Mutable;
  socklen_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  pthread_mutex_t *v13;
  const void *Value;
  const void *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, const __CFString *, uint64_t);
  uint64_t v20;
  uint64_t (*v21)(uint64_t, __CFDictionary *);
  socklen_t v22;
  _DWORD *v23;
  CFMutableDictionaryRef v24;
  const void *v25;
  unsigned int *v26;
  socklen_t v27;
  uint64_t v28;
  void *v29;
  socklen_t v30;
  uint64_t v31;
  uint64_t v32;
  const void *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, const void *);
  socklen_t v36;
  int v37;
  unsigned int *v38;
  uint64_t v39;
  unsigned int v40;
  double v41;
  double v42;
  double v43;
  double v44;
  int v45;
  unsigned int *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  unsigned int (*v53)(uint64_t, socklen_t *, _QWORD *);
  uint64_t v54;
  void (*v55)(uint64_t, const __CFString *, uint64_t);
  uint64_t v56;
  size_t v57;
  CFDataRef v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, CFDataRef, uint64_t, double, double, double, double, double, double);
  socklen_t v61;
  void (*v62)(void *, CFDataRef, uint64_t, double, double, double, double, double, double);
  OSStatus v63;
  uint64_t v64;
  CFTypeRef v65;
  uint64_t (*v66)(uint64_t, CFTypeRef, uint64_t, double, double, double, double, double, double);
  socklen_t v67;
  CFTypeRef v68;
  void (*v69)(void *, CFTypeRef, uint64_t, double, double, double, double, double, double);
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t);
  socklen_t v77;
  int v78;
  size_t v79;
  _BOOL4 v80;
  uint64_t v81;
  _DWORD *v82;
  size_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  BOOL v91;
  socklen_t v92;
  OSStatus v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const void **v97;
  NSObject *v98;
  const void *v99;
  uint64_t v100;
  CMBlockBufferRef v101;
  uint64_t (*v102)(uint64_t, CMBlockBufferRef, uint64_t, const void *, _BOOL4);
  socklen_t v103;
  uint64_t v104;
  CMBlockBufferRef v105;
  void (*v106)(uint64_t, CMBlockBufferRef, uint64_t, const void *, _BOOL4);
  int v107;
  int v108;
  int v109;
  BOOL v110;
  int v111;
  int v112;
  uint64_t v113;
  void (*v114)(uint64_t, const __CFString *, uint64_t);
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const __CFAllocator *v120;
  const __CFAllocator *v121;
  double v122;
  double v123;
  _BOOL4 v124;
  CMBlockBufferRef blockBufferOut;
  _QWORD v126[6];
  int v127;
  int v128;
  const void *v129;
  socklen_t block[2];
  uint64_t v131;
  void (*v132)(_QWORD *);
  void *v133;
  uint64_t v134;
  _QWORD *v135;
  const void **v136;

  v1 = a1;
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(const __CFDictionary **)(a1 + 40);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if ((*(_DWORD *)(DerivedStorage + 228) & 0x80000000) != 0)
  {
    block[0] = 28;
    FigCFDictionaryGetInt32IfPresent();
    APSLogErrorAt();
    if (gLogCategory_APReceiverScreenSession <= 90
      && (gLogCategory_APReceiverScreenSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_17;
  }
  v5 = SocketAccept();
  if (!v5)
  {
    if (gLogCategory_APReceiverScreenSession <= 50
      && (gLogCategory_APReceiverScreenSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v6 = *(_DWORD *)(DerivedStorage + 228);
    if ((v6 & 0x80000000) == 0)
    {
      if (close(v6) && *__error())
        __error();
      *(_DWORD *)(DerivedStorage + 228) = -1;
    }
    if (*(_BYTE *)(DerivedStorage + 187))
      SocketSetQoS();
    v7 = CMBaseObjectGetDerivedStorage();
    pthread_mutex_lock(*(pthread_mutex_t **)(v7 + 240));
    if (*(_BYTE *)(v7 + 248))
    {
      pthread_mutex_unlock(*(pthread_mutex_t **)(v7 + 240));
LABEL_17:
      Mutable = 0;
      v9 = 0;
      goto LABEL_18;
    }
    v9 = NetSocket_CreateWithNative();
    pthread_mutex_unlock(*(pthread_mutex_t **)(v7 + 240));
    if (v9)
    {
      if (v9 == -6723)
        goto LABEL_17;
      goto LABEL_252;
    }
    if (v2)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      Value = CFDictionaryGetValue(v2, CFSTR("PresentationLayer"));
      if (Value)
        CFDictionarySetValue(Mutable, CFSTR("PresentationLayer"), Value);
      v15 = CFDictionaryGetValue(v2, CFSTR("PresentationContext"));
      if (v15)
        CFDictionarySetValue(Mutable, CFSTR("PresentationContext"), v15);
      v16 = CFDictionaryGetValue(v2, CFSTR("ReportedDisplaySize"));
      if (v16)
        CFDictionarySetValue(Mutable, CFSTR("ReportedDisplaySize"), v16);
    }
    else
    {
      Mutable = 0;
    }
    v17 = *(_QWORD *)(DerivedStorage + 144);
    v18 = *MEMORY[0x24BDBD268];
    v19 = *(void (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v19)
      v19(v17, CFSTR("ScreenFadeOutOnStop"), v18);
    v20 = *(_QWORD *)(DerivedStorage + 144);
    v21 = *(uint64_t (**)(uint64_t, __CFDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v21)
    {
      v22 = v21(v20, Mutable);
      if (!v22)
      {
        if (Mutable)
          CFRelease(Mutable);
        if (FigGetCFPreferenceNumberWithDefault())
          aprscreen_captureStart(v3, 0, 0);
        v118 = v18;
        v116 = v1;
        v23 = &unk_2553CC000;
        if (gLogCategory_APReceiverScreenSession <= 50
          && (gLogCategory_APReceiverScreenSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v115 = DerivedStorage;
        APTTrafficMetricsConnectionFormed();
        v26 = (unsigned int *)CMBaseObjectGetDerivedStorage();
        v119 = *MEMORY[0x24BDBD270];
        v120 = (const __CFAllocator *)*MEMORY[0x24BDBD248];
        v121 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        v117 = v3;
        while (2)
        {
          APTTrafficMetricsMessageReadStarted();
          v27 = (*(uint64_t (**)(void))(*((_QWORD *)v26 + 29) + 24))();
          if (v27)
          {
            v9 = v27;
            v110 = v27 == -6753 || v27 == -6723;
            DerivedStorage = v115;
            v1 = v116;
            if (v110)
              goto LABEL_238;
            APSLogErrorAt();
            v29 = 0;
            goto LABEL_246;
          }
          v28 = aprscreen_ntpTimestamp();
          *((_QWORD *)v26 + 38) = v28;
          *((_QWORD *)v26 + 39) = v28;
          if (*v26)
          {
            v29 = malloc_type_malloc(*v26, 0x45AA9998uLL);
            if (!v29)
            {
              APSLogErrorAt();
              v9 = -6728;
LABEL_243:
              v1 = v116;
LABEL_245:
              DerivedStorage = v115;
LABEL_246:
              v112 = v23[798];
              if (v112 <= 90 && (v112 != -1 || _LogCategory_Initialize()))
                LogPrintF();
              if (v29)
                free(v29);
              goto LABEL_252;
            }
            v30 = (*(uint64_t (**)(void))(*((_QWORD *)v26 + 29) + 24))();
            if (v30)
            {
              v9 = v30;
              v1 = v116;
              if (v30 == -6723)
              {
                free(v29);
                DerivedStorage = v115;
LABEL_238:
                v111 = v23[798];
                if (v111 <= 50 && (v111 != -1 || _LogCategory_Initialize()))
                  LogPrintF();
                v113 = *(_QWORD *)(DerivedStorage + 144);
                v114 = *(void (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 8)
                                                                                   + 56);
                if (v114)
                  v114(v113, CFSTR("ScreenFadeOutOnStop"), v119);
                goto LABEL_17;
              }
              APSLogErrorAt();
              goto LABEL_245;
            }
          }
          else
          {
            v29 = 0;
          }
          APTTrafficMetricsMessageReadFinished();
          *((_QWORD *)v26 + 40) = aprscreen_ntpTimestamp();
          v31 = CMBaseObjectGetDerivedStorage();
          pthread_mutex_lock(*(pthread_mutex_t **)(v31 + 208));
          switch(*(_BYTE *)(v31 + 4))
          {
            case 0:
              v46 = (unsigned int *)CMBaseObjectGetDerivedStorage();
              blockBufferOut = 0;
              v47 = *((_QWORD *)v46 + 1);
              v48 = *((_QWORD *)v46 + 5);
              v49 = CMBaseObjectGetDerivedStorage();
              v126[0] = 0;
              if (*(_BYTE *)(v49 + 188))
              {
                v50 = mach_absolute_time();
              }
              else
              {
                v51 = (_QWORD *)v49;
                v52 = *(_QWORD *)(v49 + 128);
                if (v52)
                {
                  v53 = *(unsigned int (**)(uint64_t, socklen_t *, _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 16)
                                                                                      + 24);
                  if (!v53
                    || (*(_QWORD *)block = v48,
                        v131 = v47 << 32,
                        v132 = (void (*)(_QWORD *))HIDWORD(v47),
                        v53(v52, block, v126)))
                  {
                    v74 = v23[798];
                    if (v74 <= 90 && (v74 != -1 || _LogCategory_Initialize()))
                      LogPrintF();
                    v50 = v51[35];
                  }
                  else
                  {
                    v50 = v126[0];
                    v51[35] = v126[0];
                  }
                }
                else
                {
                  v71 = NTPtoUpTicks();
                  v72 = v71;
                  if (v51[42])
                  {
                    v73 = v51[37];
                  }
                  else
                  {
                    v51[37] = v51[36] - v71;
                    v73 = v51[37] + MillisecondsToUpTicks();
                    v51[37] = v73;
                  }
                  v50 = v73 + v72;
                }
              }
              v79 = *v46;
              v80 = (*((_BYTE *)v46 + 5) & 0x10) != 0 || *((_QWORD *)v46 + 42) == 0;
              v124 = v80;
              v81 = CMBaseObjectGetDerivedStorage();
              block[0] = 0;
              if (!v29)
                goto LABEL_178;
              v82 = (_DWORD *)v81;
              if (*(_BYTE *)(v81 + 4))
                goto LABEL_178;
              if (*(_BYTE *)(v81 + 352))
              {
                if (*(_DWORD *)v81 >= 0x10u)
                {
                  v83 = v79;
                  v84 = v50;
                  v85 = v81 + 648;
                  chacha20_poly1305_init_64x64();
                  chacha20_poly1305_add_aad();
                  v86 = chacha20_poly1305_decrypt();
                  v87 = chacha20_poly1305_verify();
                  if (!block[0])
                  {
                    v88 = (*v82 - 16);
                    if (v87 + v86 == v88)
                    {
                      v89 = 0;
                      *v82 = v88;
                      v50 = v84;
                      v79 = v83;
                      v3 = v117;
                      do
                      {
                        if (++*(_BYTE *)(v85 + v89))
                          v91 = 1;
                        else
                          v91 = v89 == 7;
                        ++v89;
                      }
                      while (!v91);
                      goto LABEL_178;
                    }
                    APSLogErrorAt();
                    v9 = -6762;
                    block[0] = -6762;
                    v50 = v84;
                    v79 = v83;
                    v3 = v117;
LABEL_221:
                    if (gLogCategory_APReceiverScreenSession >= 91)
                      goto LABEL_226;
                    if (gLogCategory_APReceiverScreenSession != -1
                      || (v109 = _LogCategory_Initialize(), v9 = block[0], v109))
                    {
                      LogPrintF();
                      v9 = block[0];
                    }
                    if (v9)
                      goto LABEL_226;
                    goto LABEL_178;
                  }
                  APSLogErrorAt();
                  v9 = block[0];
                  v50 = v84;
                  v79 = v83;
                  v3 = v117;
                  if (block[0])
                    goto LABEL_221;
                }
              }
              else if (*(_BYTE *)(v81 + 704))
              {
                v92 = AES_CTR_Update();
                block[0] = v92;
                if (v92)
                {
                  v9 = v92;
                  APSLogErrorAt();
                  goto LABEL_221;
                }
              }
LABEL_178:
              v93 = CMBlockBufferCreateWithMemoryBlock(v121, v29, v79, v120, 0, 0, *v46, 0, &blockBufferOut);
              if (!v93)
              {
                *((_QWORD *)v46 + 41) = aprscreen_ntpTimestamp();
                v94 = CMBaseObjectGetDerivedStorage();
                v129 = 0;
                v95 = *(_QWORD *)(v94 + 136);
                v23 = &unk_2553CC000;
                if (v95)
                {
                  v96 = *(_QWORD *)(v94 + 88);
                  v126[0] = v50;
                  v126[1] = v96;
                  v126[2] = *(_QWORD *)(v94 + 32);
                  v126[3] = v94 + 96;
                  v126[4] = v94 + 304;
                  v126[5] = 0x400000010;
                  v127 = *(_DWORD *)v94;
                  v128 = *(_DWORD *)(v94 + 24);
                  v97 = &v129;
                  if (!*(_BYTE *)(v94 + 705))
                    v97 = 0;
                  v98 = *(NSObject **)(v95 + 16);
                  *(_QWORD *)block = MEMORY[0x24BDAC760];
                  v131 = 3221225472;
                  v132 = __APReceiverStatsCollectorUpdateAndCopyFrameStats_block_invoke;
                  v133 = &__block_descriptor_56_e5_v8__0l;
                  v134 = v95;
                  v135 = v126;
                  v136 = v97;
                  dispatch_sync(v98, block);
                  v99 = v129;
                }
                else
                {
                  v99 = 0;
                }
                v100 = *((_QWORD *)v46 + 18);
                v101 = blockBufferOut;
                v102 = *(uint64_t (**)(uint64_t, CMBlockBufferRef, uint64_t, const void *, _BOOL4))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
                if (v102)
                {
                  v103 = v102(v100, v101, v50, v99, v124);
                  if (!v103)
                  {
                    v104 = *((_QWORD *)v46 + 21);
                    if (v104)
                    {
                      if (v124 && *((_BYTE *)v46 + 176))
                        *((_BYTE *)v46 + 177) = 1;
                      if (*((_BYTE *)v46 + 177))
                      {
                        v105 = blockBufferOut;
                        v106 = *(void (**)(uint64_t, CMBlockBufferRef, uint64_t, const void *, _BOOL4))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
                        if (v106)
                          v106(v104, v105, v50, v99, v124);
                      }
                    }
                    v9 = 0;
                    v29 = 0;
                    ++*((_QWORD *)v46 + 42);
LABEL_199:
                    if (blockBufferOut)
                      CFRelease(blockBufferOut);
                    if (v99)
                      CFRelease(v99);
                    if (v29)
                      free(v29);
                    goto LABEL_205;
                  }
                  v9 = v103;
                }
                else
                {
                  v9 = -12782;
                }
                APSLogErrorAt();
                v29 = 0;
LABEL_195:
                v107 = v23[798];
                if (v107 <= 90 && (v107 != -1 || _LogCategory_Initialize()))
                  LogPrintF();
                goto LABEL_199;
              }
              v9 = v93;
LABEL_226:
              APSLogErrorAt();
              v99 = 0;
              v23 = (_DWORD *)&unk_2553CC000;
              goto LABEL_195;
            case 1:
              v38 = (unsigned int *)CMBaseObjectGetDerivedStorage();
              *(_QWORD *)block = 0;
              v39 = *((unsigned __int8 *)v38 + 5);
              v40 = *((unsigned __int8 *)v38 + 6);
              *((_BYTE *)v38 + 706) = (v40 & 0x10) != 0;
              if (!*((_QWORD *)v38 + 36))
                *((_QWORD *)v38 + 36) = mach_absolute_time();
              v41 = *((float *)v38 + 4);
              v42 = *((float *)v38 + 8);
              v122 = *((float *)v38 + 9);
              v123 = *((float *)v38 + 5);
              v43 = *((float *)v38 + 10);
              v44 = *((float *)v38 + 11);
              v45 = v23[798];
              if (v45 <= 50 && (v45 != -1 || _LogCategory_Initialize()))
                LogPrintF();
              v54 = *((_QWORD *)v38 + 18);
              v55 = *(void (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                + 56);
              if (v55)
              {
                if ((v40 & 1) != 0)
                  v56 = v119;
                else
                  v56 = v118;
                v55(v54, CFSTR("StatsDisplayEnabled"), v56);
              }
              v57 = *v38;
              if (!(_DWORD)v57)
                goto LABEL_124;
              if (((v40 >> 3) & 1) == 0)
              {
                v58 = CFDataCreateWithBytesNoCopy(v121, (const UInt8 *)v29, v57, v120);
                if (!v58)
                {
                  APSLogErrorAt();
                  v9 = -72120;
                  goto LABEL_151;
                }
                v59 = *((_QWORD *)v38 + 18);
                v60 = *(uint64_t (**)(uint64_t, CFDataRef, uint64_t, double, double, double, double, double, double))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
                if (!v60)
                {
                  v9 = -12782;
LABEL_129:
                  APSLogErrorAt();
                  v29 = 0;
                  goto LABEL_151;
                }
                v61 = v60(v59, v58, v39, v41, v123, v42, v122, v43, v44);
                if (v61)
                {
                  v9 = v61;
                  goto LABEL_129;
                }
                v29 = (void *)*((_QWORD *)v38 + 21);
                if (v29)
                {
                  v62 = *(void (**)(void *, CFDataRef, uint64_t, double, double, double, double, double, double))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
                  if (v62)
                    v62(v29, v58, v39, v41, v123, v42, v122, v43, v44);
                  goto LABEL_121;
                }
                goto LABEL_122;
              }
              v63 = CMBlockBufferCreateWithMemoryBlock(v121, v29, v57, v120, 0, 0, v57, 0, (CMBlockBufferRef *)block);
              if (v63)
              {
                v9 = v63;
                APSLogErrorAt();
                goto LABEL_137;
              }
              v64 = *((_QWORD *)v38 + 18);
              v65 = *(CFTypeRef *)block;
              v66 = *(uint64_t (**)(uint64_t, CFTypeRef, uint64_t, double, double, double, double, double, double))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
              if (!v66)
              {
                v9 = -12782;
                goto LABEL_136;
              }
              v67 = v66(v64, v65, v39, v41, v123, v42, v122, v43, v44);
              if (v67)
              {
                v9 = v67;
LABEL_136:
                APSLogErrorAt();
                v29 = 0;
LABEL_137:
                v58 = 0;
                goto LABEL_151;
              }
              v29 = (void *)*((_QWORD *)v38 + 21);
              if (v29)
              {
                v68 = *(CFTypeRef *)block;
                v69 = *(void (**)(void *, CFTypeRef, uint64_t, double, double, double, double, double, double))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
                if (v69)
                  v69(v29, v68, v39, v41, v123, v42, v122, v43, v44);
                v58 = 0;
LABEL_121:
                v29 = 0;
                *((_BYTE *)v38 + 176) = 1;
LABEL_122:
                if ((v40 & 0x40) == 0)
                  goto LABEL_142;
                goto LABEL_125;
              }
LABEL_124:
              v58 = 0;
              if ((v40 & 0x40) == 0)
                goto LABEL_142;
LABEL_125:
              v70 = v23[798];
              if (v70 <= 50 && (v70 != -1 || _LogCategory_Initialize()))
                LogPrintF();
              v75 = *((_QWORD *)v38 + 18);
              v76 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
              if (!v76 || (v77 = v76(v75), v77 == -12782) || (v9 = v77) == 0)
              {
LABEL_142:
                v9 = 0;
                ++*((_QWORD *)v38 + 43);
                goto LABEL_143;
              }
              APSLogErrorAt();
LABEL_151:
              v78 = v23[798];
              if (v78 <= 90 && (v78 != -1 || _LogCategory_Initialize()))
                LogPrintF();
LABEL_143:
              if (*(_QWORD *)block)
                CFRelease(*(CFTypeRef *)block);
              if (v58)
                CFRelease(v58);
              if (v29)
                free(v29);
LABEL_205:
              pthread_mutex_unlock(*(pthread_mutex_t **)(v31 + 208));
              if (v9)
              {
                APSLogErrorAt();
                v29 = 0;
                goto LABEL_243;
              }
LABEL_206:
              APTTrafficMetricsMessageProcessed();
              continue;
            case 2:
            case 5:
              block[0] = 0;
              v32 = CMBaseObjectGetDerivedStorage();
              aprstats_logEnable(*(_QWORD *)(v32 + 136), (*(_BYTE *)(v32 + 5) & 2) != 0);
              *(_BYTE *)(v32 + 705) = *(_BYTE *)(v32 + 5) & 1;
              if (v29 && *(_BYTE *)(v32 + 4) == 5)
              {
                v33 = (const void *)*(float *)(v32 + 124);
                if (v33)
                {
                  CFDictionaryGetTypeID();
                  v33 = (const void *)CFCreateWithPlistBytes();
                  if (block[0])
                    goto LABEL_207;
                }
              }
              else
              {
                v33 = 0;
              }
              v34 = *(_QWORD *)(v32 + 144);
              v35 = *(uint64_t (**)(uint64_t, const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
              if (!v35 || (v36 = v35(v34, v33), v36 == -12782))
              {
                block[0] = 0;
                goto LABEL_87;
              }
              block[0] = v36;
              if (v36)
              {
LABEL_207:
                APSLogErrorAt();
                if (block[0])
                {
                  v108 = v23[798];
                  if (v108 <= 90 && (v108 != -1 || _LogCategory_Initialize()))
                    LogPrintF();
                }
              }
LABEL_87:
              if (v33)
                CFRelease(v33);
              if (v29)
                free(v29);
              v9 = block[0];
              goto LABEL_205;
            case 4:
              goto LABEL_97;
            default:
              v37 = v23[798];
              if (v37 <= 50 && (v37 != -1 || _LogCategory_Initialize()))
                LogPrintF();
LABEL_97:
              if (v29)
                free(v29);
              pthread_mutex_unlock(*(pthread_mutex_t **)(v31 + 208));
              goto LABEL_206;
          }
        }
      }
      v9 = v22;
    }
    else
    {
      v9 = -12782;
    }
    APSLogErrorAt();
    goto LABEL_18;
  }
  v9 = v5;
LABEL_252:
  APSLogErrorAt();
  Mutable = 0;
LABEL_18:
  aprscreen_captureStop();
  v10 = *(_QWORD *)(DerivedStorage + 144);
  v11 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
  if (v11)
    v11(v10);
  if (Mutable)
    CFRelease(Mutable);
  v12 = CMBaseObjectGetDerivedStorage();
  v13 = *(pthread_mutex_t **)(v12 + 240);
  if (v13)
  {
    pthread_mutex_lock(v13);
    if (*(_QWORD *)(v12 + 232))
    {
      NetSocket_Delete();
      *(_QWORD *)(v12 + 232) = 0;
    }
    pthread_mutex_unlock(*(pthread_mutex_t **)(v12 + 240));
  }
  if (v9
    && gLogCategory_APReceiverScreenSession <= 90
    && (gLogCategory_APReceiverScreenSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(_QWORD *)(DerivedStorage + 152))
  {
    v24 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    FigCFDictionarySetInt32();
    (*(void (**)(uint64_t, const __CFString *, CFMutableDictionaryRef, _QWORD))(DerivedStorage + 152))(v3, CFSTR("SessionTerminated"), v24, *(_QWORD *)(DerivedStorage + 160));
    CFRelease(v24);
  }
  v25 = *(const void **)(v1 + 40);
  if (v25)
    CFRelease(v25);
}

@end
