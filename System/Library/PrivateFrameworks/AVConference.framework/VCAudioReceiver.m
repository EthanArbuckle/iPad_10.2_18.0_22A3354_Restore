@implementation VCAudioReceiver

void __VCAudioReceiver_Finalize_block_invoke(uint64_t a1)
{
  VCRealTimeThread_Finalize(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 536));
  _VCAudioReceiver_Cleanup(*(_QWORD *)(a1 + 32));
}

uint64_t __VCAudioReceiver_PullAudioSamples_block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, BOOL *a4)
{
  unint64_t v8;
  BOOL *v9;
  uint64_t v10;
  unint64_t v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3 + 32;
  v12 = a3 + 5;
  v13 = xmmword_1D9110500;
  *(_BYTE *)(a3 + 21) = 16;
  *(_BYTE *)(a3 + 4) = 0;
  v9 = (BOOL *)(a3 + 4);
  VCAudioBufferList_GetTimestamp(a2);
  kdebug_trace();
  v10 = *(_QWORD *)(a1 + 32);
  ++*(_DWORD *)(v10 + 9104);
  if (v8 <= a3)
    __break(0x5519u);
  VCJitterBuffer_PlaybackGetSamples(*(int32x2_t **)(v10 + 440), a2, (int *)a3, v9, (uint64_t)&v12, (int *)(a3 + 24), (int *)(a3 + 28));
  *(_BYTE *)(a3 + 21) = BYTE8(v13);
  *a4 = *(_DWORD *)(a3 + 24) != 0;
  return kdebug_trace();
}

void ___VCAudioReceiver_RegisterStatistics_block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  int v4;
  unsigned __int8 v5;
  __int16 v6;
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    if (*(_DWORD *)a2 == 11)
    {
      v4 = *(unsigned __int16 *)(a2 + 92);
      if (v4 != 0xFFFF)
      {
        v5 = *(_BYTE *)(a2 + 89);
        v6 = *(_WORD *)(a2 + 90);
        *(_QWORD *)&v7 = *(_QWORD *)(a2 + 32);
        *((_QWORD *)&v7 + 1) = v5;
        WORD5(v7) = v6;
        WORD6(v7) = v4;
        VCJitterBuffer_ProcessWiFiNetworkNotification(*(_QWORD *)(v3 + 440), &v7, a3);
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        ___VCAudioReceiver_RegisterStatistics_block_invoke_cold_2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      ___VCAudioReceiver_RegisterStatistics_block_invoke_cold_1();
  }
}

void ___VCAudioReceiver_RegisterTransportCallbacks_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _VCAudioReceiver_HandleRTPPacket(*(_QWORD *)(a2 + 32), a2, a3);
}

void ___VCAudioReceiver_RegisterTransportCallbacks_block_invoke_2(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _VCAudioReceiver_ProcessAudioRTCPInternal(a2[4], a2, a3);
}

uint64_t ___VCAudioReceiver_RegisterReportingTask_block_invoke(uint64_t result, uint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  unsigned int *v5;
  uint64_t v6;
  __CFDictionary *v7;
  const __CFAllocator *v8;
  CFNumberRef v9;
  CFNumberRef v10;
  CFNumberRef v11;
  CFNumberRef v12;
  CFNumberRef v13;
  CFNumberRef v14;
  CFNumberRef v15;
  CFNumberRef v16;
  CFNumberRef v17;
  CFNumberRef v18;
  CFNumberRef v19;
  CFNumberRef v20;
  CFNumberRef v21;
  CFNumberRef v22;
  CFNumberRef v23;
  CFNumberRef v24;
  CFNumberRef v25;
  CFNumberRef v26;
  CFNumberRef v27;
  CFNumberRef v28;
  float v29;
  CFNumberRef v30;
  CFNumberRef v31;
  CFNumberRef v32;
  CFNumberRef v33;
  CFNumberRef v34;
  CFNumberRef v35;
  CFNumberRef v36;
  CFNumberRef v37;
  CFNumberRef v38;
  __CFString *StringForPayloadData;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __CFString *v46;
  CFNumberRef v47;
  CFNumberRef v48;
  float v49;
  CFNumberRef v50;
  CFNumberRef v51;
  CFNumberRef v52;
  CFNumberRef v53;
  CFNumberRef v54;
  CFNumberRef v55;
  CFNumberRef v56;
  CFNumberRef v57;
  unsigned int *v58;
  unsigned int v59;
  unsigned int *v60;
  unsigned int v61;
  double v62;
  double v63;
  unsigned int v64;
  unsigned int v65;
  unint64_t v66;
  float v67;
  NSObject **v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  const char *CStringPtr;
  int v79;
  const char *v80;
  int v81;
  unsigned int v82;
  unsigned int v83;
  int ErrorLogLevelForModule;
  uint64_t v85;
  uint64_t v86;
  unsigned int v87;
  int v88;
  __CFDictionary *v89;
  const __CFAllocator *v90;
  float v91;
  NSObject *v92;
  NSObject *v93;
  _BOOL4 v94;
  const char *v95;
  NSObject *v96;
  unsigned int v97;
  uint64_t v98;
  NSObject *v99;
  NSObject *v100;
  const char *v101;
  _BOOL4 v102;
  const char *v103;
  NSObject *v104;
  int v105;
  float v106;
  float v107;
  double v108;
  double v109;
  unsigned int v110;
  CFNumberRef v111;
  CFNumberRef v112;
  CFNumberRef v113;
  CFNumberRef v114;
  uint64_t v115;
  NSObject *v116;
  const char *v117;
  double v118;
  CFNumberRef v119;
  CFNumberRef v120;
  CFNumberRef v121;
  CFNumberRef v122;
  CFNumberRef v123;
  float v124;
  CFNumberRef v125;
  float v126;
  CFNumberRef v127;
  int *v128;
  NSObject **v129;
  uint64_t v130;
  NSObject *v131;
  unsigned int v132;
  int v133;
  unsigned int v134;
  unint64_t v135;
  const char *v136;
  unsigned int v137;
  const __CFAllocator *v138;
  __CFDictionary *v139;
  float v140;
  _QWORD *v141;
  uint64_t v142;
  NSObject *log;
  uint64_t v144;
  int v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  int v149;
  uint64_t v150;
  int v151;
  uint64_t v152;
  unsigned int v153;
  unsigned int v154;
  uint64_t v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  uint64_t v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  unsigned int v174;
  uint64_t v175;
  float valuePtr;
  uint64_t v177;
  __int16 v178;
  const char *v179;
  __int16 v180;
  int v181;
  __int16 v182;
  const char *v183;
  __int16 v184;
  _BYTE v185[10];
  _BYTE v186[18];
  _BYTE v187[6];
  _BYTE v188[6];
  _DWORD v189[2];
  uint64_t v190;

  v190 = *MEMORY[0x1E0C80C00];
  if (!a2)
    return result;
  v2 = (_QWORD *)result;
  v3 = *(_QWORD *)(result + 40);
  if (v3)
  {
    if (v3 >= v2[6] || v3 < v2[7])
      goto LABEL_76;
  }
  result = CheckInHandleDebug();
  if (!result)
    return result;
  v5 = (unsigned int *)result;
  v6 = *(_QWORD *)(result + 440);
  if (!v6)
  {
    if (*((_BYTE *)v5 + 568))
    {
      v6 = 0;
    }
    else
    {
      *((_BYTE *)v5 + 568) = 1;
      reportingSymptom();
      v6 = *((_QWORD *)v5 + 55);
    }
  }
  if (!VCJitterBuffer_GetIsRunning(v6))
  {
    v66 = v2[5];
    if (v66 && (v66 >= v2[6] || v66 < v2[7]))
      goto LABEL_76;
    return CheckOutHandleDebug();
  }
  v170 = 0;
  v168 = 0u;
  v169 = 0u;
  v166 = 0u;
  v167 = 0u;
  v164 = 0u;
  v165 = 0u;
  v162 = 0u;
  v163 = 0u;
  v160 = 0u;
  v161 = 0u;
  VCJitterBuffer_GetPlaybackReportingMetrics(*((_QWORD *)v5 + 55), (uint64_t)&v160);
  v141 = v2;
  v7 = (__CFDictionary *)selectDestinationForRTMetrics();
  valuePtr = *(float *)&v160;
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v9 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberFloat32Type, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("AAL"), v9);
  CFRelease(v9);
  valuePtr = *((float *)&v160 + 1);
  v10 = CFNumberCreate(v8, kCFNumberFloat32Type, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("AWL"), v10);
  CFRelease(v10);
  valuePtr = *((float *)&v160 + 3);
  v11 = CFNumberCreate(v8, kCFNumberFloat32Type, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("AJQS"), v11);
  CFRelease(v11);
  valuePtr = *((float *)&v160 + 2) * 1000.0;
  v12 = CFNumberCreate(v8, kCFNumberFloat32Type, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("XJoW"), v12);
  CFRelease(v12);
  valuePtr = *(float *)&v161;
  v13 = CFNumberCreate(v8, kCFNumberFloat32Type, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("FrameErasureRate"), v13);
  CFRelease(v13);
  valuePtr = *((float *)&v161 + 1);
  v14 = CFNumberCreate(v8, kCFNumberFloat32Type, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("FrameErasureRateAlt"), v14);
  CFRelease(v14);
  valuePtr = *((float *)&v161 + 2);
  v15 = CFNumberCreate(v8, kCFNumberFloat32Type, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("FrameSpeechErasureRate"), v15);
  CFRelease(v15);
  valuePtr = *((float *)&v161 + 3);
  v16 = CFNumberCreate(v8, kCFNumberFloat32Type, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("JitterErasureRate"), v16);
  CFRelease(v16);
  valuePtr = *(float *)&v162;
  v17 = CFNumberCreate(v8, kCFNumberFloat32Type, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("WindowedFrameErasureRate"), v17);
  CFRelease(v17);
  valuePtr = *((float *)&v162 + 1);
  v18 = CFNumberCreate(v8, kCFNumberFloat32Type, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("RedErasureCompensationRate"), v18);
  CFRelease(v18);
  LODWORD(valuePtr) = (int)(float)(*((float *)&v162 + 2) * 1000.0);
  v19 = CFNumberCreate(v8, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("MaxRedFrameRecoveryDepth"), v19);
  CFRelease(v19);
  valuePtr = *((float *)&v162 + 3);
  v20 = CFNumberCreate(v8, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("RedRxPlayedCount"), v20);
  CFRelease(v20);
  valuePtr = *(float *)&v163;
  v21 = CFNumberCreate(v8, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("RedRxPlayedBytes"), v21);
  CFRelease(v21);
  valuePtr = *((float *)&v163 + 1);
  v22 = CFNumberCreate(v8, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("FramesPlayedCount"), v22);
  CFRelease(v22);
  valuePtr = *((float *)&v164 + 1);
  v23 = CFNumberCreate(v8, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("FrameErasureCount"), v23);
  CFRelease(v23);
  valuePtr = *((float *)&v164 + 2);
  v24 = CFNumberCreate(v8, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("FrameErasureCountAlt"), v24);
  CFRelease(v24);
  valuePtr = *((float *)&v165 + 2);
  v25 = CFNumberCreate(v8, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("MaxConsecutiveAudioErasures"), v25);
  CFRelease(v25);
  LODWORD(valuePtr) = BYTE8(v168);
  v26 = CFNumberCreate(v8, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("EnhancedJBAdaptationsEnabled"), v26);
  CFRelease(v26);
  valuePtr = *(float *)&v169;
  v27 = CFNumberCreate(v8, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("JBJumpSpikeCount"), v27);
  CFRelease(v27);
  valuePtr = *((float *)&v169 + 1);
  v28 = CFNumberCreate(v8, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("JBSlopeSpikeCount"), v28);
  CFRelease(v28);
  v29 = *((double *)&v169 + 1);
  valuePtr = v29;
  v30 = CFNumberCreate(v8, kCFNumberFloat32Type, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("JBSpikeSizeDelta"), v30);
  CFRelease(v30);
  valuePtr = *(float *)&v167;
  v31 = CFNumberCreate(v8, kCFNumberFloat32Type, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("TimescaleRate"), v31);
  CFRelease(v31);
  valuePtr = *((float *)&v167 + 1);
  v32 = CFNumberCreate(v8, kCFNumberFloat32Type, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("SpeechTimescaleRate"), v32);
  CFRelease(v32);
  valuePtr = *((float *)&v167 + 2);
  v33 = CFNumberCreate(v8, kCFNumberFloat32Type, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("SilenceTimescaleRate"), v33);
  CFRelease(v33);
  valuePtr = *((float *)&v165 + 3);
  v34 = CFNumberCreate(v8, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("TotalTimescaleCount"), v34);
  CFRelease(v34);
  valuePtr = *((float *)&v166 + 2);
  v35 = CFNumberCreate(v8, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("TotalExpandTimescaleCount"), v35);
  CFRelease(v35);
  valuePtr = *((float *)&v166 + 3);
  v36 = CFNumberCreate(v8, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("TotalCompressTimescaleCount"), v36);
  CFRelease(v36);
  valuePtr = *((float *)&v166 + 1);
  v37 = CFNumberCreate(v8, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("TotalSpeechTimescaleCount"), v37);
  CFRelease(v37);
  valuePtr = *(float *)&v166;
  v38 = CFNumberCreate(v8, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("TotalSilenceTimescaleCount"), v38);
  CFRelease(v38);
  memcpy(v5 + 2452, v5 + 2324, 0x200uLL);
  *((_OWORD *)v5 + 581) = 0u;
  *((_OWORD *)v5 + 582) = 0u;
  *((_OWORD *)v5 + 583) = 0u;
  *((_OWORD *)v5 + 584) = 0u;
  *((_OWORD *)v5 + 585) = 0u;
  *((_OWORD *)v5 + 586) = 0u;
  *((_OWORD *)v5 + 587) = 0u;
  *((_OWORD *)v5 + 588) = 0u;
  *((_OWORD *)v5 + 589) = 0u;
  *((_OWORD *)v5 + 590) = 0u;
  *((_OWORD *)v5 + 591) = 0u;
  *((_OWORD *)v5 + 592) = 0u;
  *((_OWORD *)v5 + 593) = 0u;
  *((_OWORD *)v5 + 594) = 0u;
  *((_OWORD *)v5 + 595) = 0u;
  *((_OWORD *)v5 + 596) = 0u;
  *((_OWORD *)v5 + 597) = 0u;
  *((_OWORD *)v5 + 598) = 0u;
  *((_OWORD *)v5 + 599) = 0u;
  *((_OWORD *)v5 + 600) = 0u;
  *((_OWORD *)v5 + 601) = 0u;
  *((_OWORD *)v5 + 602) = 0u;
  *((_OWORD *)v5 + 603) = 0u;
  *((_OWORD *)v5 + 604) = 0u;
  *((_OWORD *)v5 + 605) = 0u;
  *((_OWORD *)v5 + 606) = 0u;
  *((_OWORD *)v5 + 607) = 0u;
  *((_OWORD *)v5 + 608) = 0u;
  *((_OWORD *)v5 + 609) = 0u;
  *((_OWORD *)v5 + 610) = 0u;
  *((_OWORD *)v5 + 611) = 0u;
  *((_OWORD *)v5 + 612) = 0u;
  StringForPayloadData = _VCAudioReceiver_CreateStringForPayloadData((uint64_t)v5);
  if (StringForPayloadData)
  {
    v46 = StringForPayloadData;
    CFDictionaryAddValue(v7, CFSTR("Payload"), StringForPayloadData);
    CFRelease(v46);
  }
  *((_OWORD *)v5 + 643) = 0u;
  *((_OWORD *)v5 + 644) = 0u;
  *((_OWORD *)v5 + 641) = 0u;
  *((_OWORD *)v5 + 642) = 0u;
  *((_OWORD *)v5 + 639) = 0u;
  *((_OWORD *)v5 + 640) = 0u;
  *((_OWORD *)v5 + 637) = 0u;
  *((_OWORD *)v5 + 638) = 0u;
  *((_OWORD *)v5 + 635) = 0u;
  *((_OWORD *)v5 + 636) = 0u;
  *((_OWORD *)v5 + 633) = 0u;
  *((_OWORD *)v5 + 634) = 0u;
  *((_OWORD *)v5 + 631) = 0u;
  *((_OWORD *)v5 + 632) = 0u;
  *((_OWORD *)v5 + 629) = 0u;
  *((_OWORD *)v5 + 630) = 0u;
  *((_OWORD *)v5 + 627) = 0u;
  *((_OWORD *)v5 + 628) = 0u;
  *((_OWORD *)v5 + 625) = 0u;
  *((_OWORD *)v5 + 626) = 0u;
  *((_OWORD *)v5 + 623) = 0u;
  *((_OWORD *)v5 + 624) = 0u;
  *((_OWORD *)v5 + 621) = 0u;
  *((_OWORD *)v5 + 622) = 0u;
  *((_OWORD *)v5 + 619) = 0u;
  *((_OWORD *)v5 + 620) = 0u;
  *((_OWORD *)v5 + 617) = 0u;
  *((_OWORD *)v5 + 618) = 0u;
  *((_OWORD *)v5 + 615) = 0u;
  *((_OWORD *)v5 + 616) = 0u;
  *((_OWORD *)v5 + 613) = 0u;
  *((_OWORD *)v5 + 614) = 0u;
  v159 = 0;
  v157 = 0u;
  v158 = 0u;
  v156 = 0u;
  VCJitterBuffer_GetReportingMetrics(*((_QWORD *)v5 + 55), (uint64_t)&v156, v40, v41, v42, v43, v44, v45);
  valuePtr = *((float *)&v156 + 1) * 1000.0;
  v47 = CFNumberCreate(v8, kCFNumberFloat32Type, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("NJB"), v47);
  CFRelease(v47);
  valuePtr = *((float *)&v156 + 2) * 1000.0;
  v48 = CFNumberCreate(v8, kCFNumberFloat32Type, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("UJBL"), v48);
  CFRelease(v48);
  v49 = *((double *)&v158 + 1);
  valuePtr = v49;
  v50 = CFNumberCreate(v8, kCFNumberFloat32Type, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("RedOverheadDelay"), v50);
  CFRelease(v50);
  valuePtr = *((float *)&v156 + 3);
  v51 = CFNumberCreate(v8, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("RedRxCount"), v51);
  CFRelease(v51);
  valuePtr = *(float *)&v157;
  v52 = CFNumberCreate(v8, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("RedRxBytes"), v52);
  CFRelease(v52);
  valuePtr = *((float *)&v157 + 1);
  v53 = CFNumberCreate(v8, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("RedRxDiscardCount"), v53);
  CFRelease(v53);
  valuePtr = *((float *)&v157 + 2);
  v54 = CFNumberCreate(v8, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("RedRxDiscardBytes"), v54);
  CFRelease(v54);
  valuePtr = *(float *)&v158;
  v55 = CFNumberCreate(v8, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("RedRxBitrate"), v55);
  CFRelease(v55);
  valuePtr = *((float *)&v157 + 3);
  v56 = CFNumberCreate(v8, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("JitterBufferTargetChanges"), v56);
  CFRelease(v56);
  valuePtr = *((float *)v5 + 121);
  v57 = CFNumberCreate(v8, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v7, CFSTR("ARCC"), v57);
  CFRelease(v57);
  v58 = v5 + 184;
  do
    v59 = __ldaxr(v58);
  while (__stlxr(0, v58));
  v60 = v5 + 197;
  do
    v61 = __ldaxr(v60);
  while (__stlxr(0, v60));
  v62 = micro();
  v63 = v62 - *((double *)v5 + 519);
  *((double *)v5 + 519) = v62;
  if (v63 >= 0.5)
  {
    v65 = ((double)(8 * v59) / v63 / 1000.0 + 0.5);
    v64 = ((double)(8 * v61) / v63 / 1000.0 + 0.5);
  }
  else
  {
    v64 = 0;
    *(float *)&v65 = 0.0;
  }
  v138 = v8;
  v139 = v7;
  v140 = *(float *)&v65;
  v5[1040] = v65;
  v137 = v64;
  v5[1041] = v64;
  v67 = *((float *)&v160 + 1);
  v68 = (NSObject **)MEMORY[0x1E0CF2758];
  if (*v5)
  {
    v155 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0;
    v74 = (unint64_t)(v5 + 2);
    while (1)
    {
      v175 = 0;
      v174 = 0;
      if (v74 >= (unint64_t)(v5 + 58) || v74 < (unint64_t)(v5 + 2))
        break;
      RTPGetPacketLossMetrics(*(_QWORD *)v74, (unsigned int *)&v175 + 1, (unsigned int *)&v175, &v174);
      v149 = HIDWORD(v175);
      v151 = v175;
      v153 = v174;
      v171 = 0;
      v172 = 0;
      v173 = 0;
      RTPGetDownlinkReportingStats(*(_QWORD *)v74, (uint64_t)&v171);
      v76 = v172;
      v75 = v173;
      v147 = v171;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v142 = VRTraceErrorLogLevelToCSTR();
        v77 = *v68;
        log = *v68;
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
          {
            CStringPtr = CFStringGetCStringPtr(*((CFStringRef *)v5 + 35), 0x8000100u);
            v79 = *(unsigned __int16 *)(v74 + 8);
            valuePtr = 4.8159e-34;
            v177 = v142;
            v178 = 2080;
            v179 = "_VCAudioReceiver_GetRTPMetricsFromStreams";
            v180 = 1024;
            v181 = 528;
            v182 = 2048;
            v183 = (const char *)v5;
            v68 = (NSObject **)MEMORY[0x1E0CF2758];
            v184 = 2080;
            *(_QWORD *)v185 = CStringPtr;
            *(_WORD *)&v185[8] = 1024;
            *(_DWORD *)v186 = v79;
            *(_WORD *)&v186[4] = 1024;
            *(_DWORD *)&v186[6] = HIDWORD(v175);
            *(_WORD *)&v186[10] = 1024;
            *(_DWORD *)&v186[12] = v175;
            *(_WORD *)&v186[16] = 1024;
            *(_DWORD *)v187 = v174;
            _os_log_impl(&dword_1D8A54000, log, OS_LOG_TYPE_DEFAULT, "VCAudioReceiver [%s] %s:%d [%p] participantID=%s idsStreamID=%u Total(Received=%u expected=%u lost=%u)", (uint8_t *)&valuePtr, 0x48u);
          }
        }
        else if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
        {
          v80 = CFStringGetCStringPtr(*((CFStringRef *)v5 + 35), 0x8000100u);
          v81 = *(unsigned __int16 *)(v74 + 8);
          valuePtr = 4.8159e-34;
          v177 = v142;
          v178 = 2080;
          v179 = "_VCAudioReceiver_GetRTPMetricsFromStreams";
          v180 = 1024;
          v181 = 528;
          v182 = 2048;
          v183 = (const char *)v5;
          v68 = (NSObject **)MEMORY[0x1E0CF2758];
          v184 = 2080;
          *(_QWORD *)v185 = v80;
          *(_WORD *)&v185[8] = 1024;
          *(_DWORD *)v186 = v81;
          *(_WORD *)&v186[4] = 1024;
          *(_DWORD *)&v186[6] = HIDWORD(v175);
          *(_WORD *)&v186[10] = 1024;
          *(_DWORD *)&v186[12] = v175;
          *(_WORD *)&v186[16] = 1024;
          *(_DWORD *)v187 = v174;
          _os_log_debug_impl(&dword_1D8A54000, log, OS_LOG_TYPE_DEBUG, "VCAudioReceiver [%s] %s:%d [%p] participantID=%s idsStreamID=%u Total(Received=%u expected=%u lost=%u)", (uint8_t *)&valuePtr, 0x48u);
        }
      }
      LODWORD(v155) = v149 + v155;
      v69 += v151;
      HIDWORD(v155) += v153;
      v70 += v76;
      v71 += v75;
      v72 += v147;
      ++v73;
      v74 += 56;
      if (v73 >= *v5)
        goto LABEL_40;
    }
LABEL_76:
    __break(0x5519u);
  }
  v155 = 0;
  v69 = 0;
  v70 = 0;
  v71 = 0;
  v72 = 0;
LABEL_40:
  v82 = v5[187];
  v83 = v69 - v82;
  v150 = v72;
  v152 = v71;
  v154 = v69;
  v146 = v70;
  if (v69 >= v82)
  {
    v88 = v155 - v5[185];
    v145 = HIDWORD(v155) - v5[188];
    v86 = v70 - *((_QWORD *)v5 + 95);
    v85 = v71 - *((_QWORD *)v5 + 97);
    v90 = v138;
    v89 = v139;
    v91 = *(float *)&v137;
    v148 = v72 - *((_QWORD *)v5 + 96);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v98 = VRTraceErrorLogLevelToCSTR();
      v99 = *MEMORY[0x1E0CF2758];
      v100 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
        {
          v101 = CFStringGetCStringPtr(*((CFStringRef *)v5 + 35), 0x8000100u);
          valuePtr = 4.8161e-34;
          v177 = v98;
          v178 = 2080;
          v179 = "_VCAudioReceiver_CalculateAndReportRTPMetrics";
          v180 = 1024;
          v181 = 559;
          v182 = 2048;
          v183 = (const char *)v5;
          v184 = 2080;
          *(_QWORD *)v185 = v101;
          *(_WORD *)&v185[8] = 1024;
          *(_DWORD *)v186 = v155;
          *(_WORD *)&v186[4] = 1024;
          *(_DWORD *)&v186[6] = v154;
          *(_WORD *)&v186[10] = 1024;
          *(_DWORD *)&v186[12] = HIDWORD(v155);
          *(_WORD *)&v186[16] = 1024;
          *(_DWORD *)v187 = v88;
          *(_WORD *)&v187[4] = 1024;
          *(_DWORD *)v188 = v83;
          *(_WORD *)&v188[4] = 1024;
          v97 = v145;
          v189[0] = v145;
          _os_log_impl(&dword_1D8A54000, v100, OS_LOG_TYPE_DEFAULT, "VCAudioReceiver [%s] %s:%d [%p] participantID=%s Total(Received=%u expected=%u lost=%u) Reporting interval(Received=%u expected=%u lost=%u)", (uint8_t *)&valuePtr, 0x54u);
          goto LABEL_50;
        }
      }
      else if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
      {
        v136 = CFStringGetCStringPtr(*((CFStringRef *)v5 + 35), 0x8000100u);
        valuePtr = 4.8161e-34;
        v177 = v98;
        v178 = 2080;
        v179 = "_VCAudioReceiver_CalculateAndReportRTPMetrics";
        v180 = 1024;
        v181 = 559;
        v182 = 2048;
        v183 = (const char *)v5;
        v184 = 2080;
        *(_QWORD *)v185 = v136;
        *(_WORD *)&v185[8] = 1024;
        *(_DWORD *)v186 = v155;
        *(_WORD *)&v186[4] = 1024;
        *(_DWORD *)&v186[6] = v154;
        *(_WORD *)&v186[10] = 1024;
        *(_DWORD *)&v186[12] = HIDWORD(v155);
        *(_WORD *)&v186[16] = 1024;
        *(_DWORD *)v187 = v88;
        *(_WORD *)&v187[4] = 1024;
        *(_DWORD *)v188 = v83;
        *(_WORD *)&v188[4] = 1024;
        v97 = v145;
        v189[0] = v145;
        _os_log_debug_impl(&dword_1D8A54000, v100, OS_LOG_TYPE_DEBUG, "VCAudioReceiver [%s] %s:%d [%p] participantID=%s Total(Received=%u expected=%u lost=%u) Reporting interval(Received=%u expected=%u lost=%u)", (uint8_t *)&valuePtr, 0x54u);
        goto LABEL_50;
      }
    }
    v87 = v145;
  }
  else
  {
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    LODWORD(v85) = v71;
    LODWORD(v148) = v72;
    LODWORD(v86) = v70;
    v83 = v69;
    v88 = v155;
    v87 = HIDWORD(v155);
    v90 = v138;
    v89 = v139;
    v91 = *(float *)&v137;
    if (ErrorLogLevelForModule < 8)
      goto LABEL_55;
    v144 = VRTraceErrorLogLevelToCSTR();
    v92 = *MEMORY[0x1E0CF2758];
    v93 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      v94 = os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT);
      LODWORD(v85) = v152;
      LODWORD(v148) = v150;
      LODWORD(v86) = v70;
      v88 = v155;
      v87 = HIDWORD(v155);
      v83 = v154;
      if (!v94)
        goto LABEL_55;
      v95 = CFStringGetCStringPtr(*((CFStringRef *)v5 + 35), 0x8000100u);
      valuePtr = 4.8158e-34;
      v177 = v144;
      v178 = 2080;
      v179 = "_VCAudioReceiver_CalculateAndReportRTPMetrics";
      v180 = 1024;
      v181 = 568;
      v182 = 2048;
      v183 = (const char *)v5;
      v184 = 2080;
      *(_QWORD *)v185 = v95;
      *(_WORD *)&v185[8] = 1024;
      v83 = v154;
      v88 = v155;
      *(_DWORD *)v186 = v155;
      *(_WORD *)&v186[4] = 1024;
      *(_DWORD *)&v186[6] = v154;
      *(_WORD *)&v186[10] = 1024;
      v96 = v92;
      v97 = HIDWORD(v155);
      *(_DWORD *)&v186[12] = HIDWORD(v155);
      _os_log_impl(&dword_1D8A54000, v96, OS_LOG_TYPE_DEFAULT, "VCAudioReceiver [%s] %s:%d [%p] participantID=%s Expected packet count decreased, resetting counts. Received=%u expected=%u lost=%u", (uint8_t *)&valuePtr, 0x42u);
      goto LABEL_45;
    }
    v102 = os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG);
    LODWORD(v85) = v152;
    LODWORD(v148) = v150;
    LODWORD(v86) = v70;
    v88 = v155;
    v87 = HIDWORD(v155);
    v83 = v154;
    if (v102)
    {
      v103 = CFStringGetCStringPtr(*((CFStringRef *)v5 + 35), 0x8000100u);
      valuePtr = 4.8158e-34;
      v177 = v144;
      v178 = 2080;
      v179 = "_VCAudioReceiver_CalculateAndReportRTPMetrics";
      v180 = 1024;
      v181 = 568;
      v182 = 2048;
      v183 = (const char *)v5;
      v184 = 2080;
      *(_QWORD *)v185 = v103;
      *(_WORD *)&v185[8] = 1024;
      v83 = v154;
      v88 = v155;
      *(_DWORD *)v186 = v155;
      *(_WORD *)&v186[4] = 1024;
      *(_DWORD *)&v186[6] = v154;
      *(_WORD *)&v186[10] = 1024;
      v104 = v92;
      v97 = HIDWORD(v155);
      *(_DWORD *)&v186[12] = HIDWORD(v155);
      _os_log_debug_impl(&dword_1D8A54000, v104, OS_LOG_TYPE_DEBUG, "VCAudioReceiver [%s] %s:%d [%p] participantID=%s Expected packet count decreased, resetting counts. Received=%u expected=%u lost=%u", (uint8_t *)&valuePtr, 0x42u);
LABEL_45:
      LODWORD(v85) = v152;
      LODWORD(v148) = v150;
      LODWORD(v86) = v70;
LABEL_50:
      v87 = v97;
    }
  }
LABEL_55:
  *(float *)&v105 = 0.0;
  v106 = 0.0;
  v107 = v91;
  if (v83 && v87)
  {
    v108 = (float)((float)v87 / (float)v83);
    v109 = 100.0;
    if (v108 * 100.0 <= 100.0)
      v109 = v108 * 100.0;
    v106 = v109;
    v105 = (int)(v108 * 10000.0);
  }
  v110 = v87;
  valuePtr = *(float *)&v105;
  v111 = CFNumberCreate(v90, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v89, CFSTR("ARxPLR"), v111);
  CFRelease(v111);
  valuePtr = *(float *)&v86;
  v112 = CFNumberCreate(v90, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v89, CFSTR("RTPDownlinkIngressAudioPkts"), v112);
  CFRelease(v112);
  valuePtr = *(float *)&v148;
  v113 = CFNumberCreate(v90, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v89, CFSTR("RTPDownlinkIngressNonDupMediaPkts"), v113);
  CFRelease(v113);
  valuePtr = *(float *)&v85;
  v114 = CFNumberCreate(v90, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v89, CFSTR("RTPDownlinkEgressAudioPkts"), v114);
  CFRelease(v114);
  VCUtil_ExponentialMovingAverage((float *)v5 + 196, v106, 3.0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v115 = VRTraceErrorLogLevelToCSTR();
    v116 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v117 = CFStringGetCStringPtr(*((CFStringRef *)v5 + 35), 0x8000100u);
      valuePtr = 4.816e-34;
      v118 = *((float *)v5 + 196);
      v177 = v115;
      v178 = 2080;
      v179 = "_VCAudioReceiver_CalculateAndReportRTPMetrics";
      v180 = 1024;
      v181 = 582;
      v182 = 2080;
      v183 = v117;
      v184 = 2048;
      *(double *)v185 = v67 * 100.0;
      *(_WORD *)&v185[8] = 2048;
      *(double *)v186 = v118;
      *(_WORD *)&v186[8] = 2048;
      *(double *)&v186[10] = v106;
      *(_WORD *)v187 = 1024;
      *(_DWORD *)&v187[2] = v88;
      *(_WORD *)v188 = 1024;
      *(_DWORD *)&v188[2] = v83;
      LOWORD(v189[0]) = 1024;
      *(_DWORD *)((char *)v189 + 2) = v110;
      _os_log_impl(&dword_1D8A54000, v116, OS_LOG_TYPE_DEFAULT, "VCAudioReceiver [%s] %s:%d @=@ Health: VCAudioReceiver ParticipantID=%s erasure percentage=%.2f%% PLR percentage=%.2f%% current percentage:%.2f%% (rec:%u exp:%u, loss:%u)", (uint8_t *)&valuePtr, 0x56u);
    }
  }
  v5[185] = v155;
  v5[186] += v88;
  v5[187] = v154;
  v5[188] = HIDWORD(v155);
  *((_QWORD *)v5 + 95) = v146;
  *((_QWORD *)v5 + 96) = v150;
  *((_QWORD *)v5 + 97) = v152;
  valuePtr = v140;
  v119 = CFNumberCreate(v90, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v89, CFSTR("ARxR"), v119);
  CFRelease(v119);
  valuePtr = *((float *)v5 + 186);
  v120 = CFNumberCreate(v90, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v89, CFSTR("APktRx"), v120);
  CFRelease(v120);
  valuePtr = v107;
  v121 = CFNumberCreate(v90, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v89, CFSTR("AMRR"), v121);
  CFRelease(v121);
  valuePtr = *(float *)&v159;
  v122 = CFNumberCreate(v90, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v89, CFSTR("ARxDecodeBitrate"), v122);
  CFRelease(v122);
  if (*((_BYTE *)v5 + 9096))
  {
    valuePtr = *((float *)v5 + 2316);
    v123 = CFNumberCreate(v90, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(v89, CFSTR("MSTC"), v123);
    CFRelease(v123);
    v5[2316] = 0;
    v124 = *((double *)v5 + 1156);
    valuePtr = v124;
    v125 = CFNumberCreate(v90, kCFNumberFloat32Type, &valuePtr);
    CFDictionaryAddValue(v89, CFSTR("MSTT"), v125);
    CFRelease(v125);
    *((_QWORD *)v5 + 1156) = 0;
    v126 = *((double *)v5 + 1157);
    valuePtr = v126;
    v127 = CFNumberCreate(v90, kCFNumberFloat32Type, &valuePtr);
    CFDictionaryAddValue(v89, CFSTR("MMST"), v127);
    CFRelease(v127);
    *((_QWORD *)v5 + 1157) = 0;
  }
  v128 = (int *)*((_QWORD *)v5 + 1160);
  v129 = (NSObject **)MEMORY[0x1E0CF2758];
  if (v128)
  {
    LOWORD(valuePtr) = 0;
    VCAudioIssueDetector_GetReportingStats(v128, &valuePtr);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v130 = VRTraceErrorLogLevelToCSTR();
    v131 = *v129;
    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
    {
      v132 = v5[2323];
      v133 = *((unsigned __int16 *)v5 + 4550);
      v134 = v5[186];
      valuePtr = 4.816e-34;
      v177 = v130;
      v178 = 2080;
      v179 = "_VCAudioReceiver_RegisterReportingTask_block_invoke";
      v180 = 1024;
      v181 = 757;
      v182 = 2048;
      v183 = (const char *)v5;
      v184 = 1024;
      *(float *)v185 = v140;
      *(_WORD *)&v185[4] = 1024;
      *(float *)&v185[6] = v107;
      *(_WORD *)v186 = 1024;
      *(_DWORD *)&v186[2] = v132;
      *(_WORD *)&v186[6] = 1024;
      *(_DWORD *)&v186[8] = v133;
      *(_WORD *)&v186[12] = 1024;
      *(_DWORD *)&v186[14] = ((double)(8 * v163) / v63 / 1000.0 + 0.5);
      *(_WORD *)v187 = 1024;
      *(_DWORD *)&v187[2] = v134;
      _os_log_impl(&dword_1D8A54000, v131, OS_LOG_TYPE_DEFAULT, "VCAudioReceiver [%s] %s:%d @=@ Health: VCAudioReceiver [%p] audioRxBitrate=%ukbps, primaryAudioRxRate=%ukbps payload=%d streamID=%d redBitrate=%ukbps totalPacketsReceived=%d", (uint8_t *)&valuePtr, 0x4Au);
    }
  }
  v135 = v141[5];
  if (v135 && (v135 >= v141[6] || v135 < v141[7]))
    goto LABEL_76;
  return CheckOutHandleDebug();
}

void ___VCAudioReceiver_RegisterStatistics_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioReceiver [%s] %s:%d AudioReceiver is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void ___VCAudioReceiver_RegisterStatistics_block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "_VCAudioReceiver_ProcessWiFiNetworkNotification";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCAudioReceiver [%s] %s:%d Wrong type of statistics message is processed by VCAudioStream type=%d", v2, *(const char **)v3, (unint64_t)"_VCAudioReceiver_ProcessWiFiNetworkNotification" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

@end
