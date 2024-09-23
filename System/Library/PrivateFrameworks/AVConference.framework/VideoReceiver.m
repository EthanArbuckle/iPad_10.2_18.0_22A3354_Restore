@implementation VideoReceiver

void ___VideoReceiver_SendRTCP_block_invoke(uint64_t a1)
{
  char v2;
  int *v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (int *)(a1 + 32);
  v2 = *(_BYTE *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 200);
  if ((v2 & 0x40) != 0)
    v5 = RTPSendControlPacket(v4, v3);
  else
    v5 = RTPSendRTCP(v4);
  v6 = v5;
  if (v5 < 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v10 = *(_QWORD *)(a1 + 208);
        v11 = 136316418;
        v12 = v7;
        v13 = 2080;
        v14 = "_VideoReceiver_SendRTCP_block_invoke";
        v15 = 1024;
        v16 = 1557;
        v17 = 1024;
        v18 = 1557;
        v19 = 2048;
        v20 = v10;
        v21 = 1024;
        v22 = v6;
        _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, "VideoReceiver [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Others/VideoReceiver.c:%d: VideoReceiver[%p] send rtcp failed (%08X)", (uint8_t *)&v11, 0x32u);
      }
    }
  }
  else
  {
    _VideoReceiver_HandleSendRTCPSuccess(*(_QWORD *)(a1 + 216), v3, *(double *)(a1 + 224));
  }
  v9 = *(void **)(a1 + 232);
  if (v9)
    VCMemoryPool_Free(*(OSQueueHead **)(*(_QWORD *)(a1 + 208) + 41392), v9);
}

__n128 ___VideoReceiver_RegisterStatistics_block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  _OWORD v10[12];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned int **)(a1 + 32);
  v3 = *(_OWORD *)(a2 + 176);
  v10[10] = *(_OWORD *)(a2 + 160);
  v10[11] = v3;
  v11 = *(_QWORD *)(a2 + 192);
  v4 = *(_OWORD *)(a2 + 112);
  v10[6] = *(_OWORD *)(a2 + 96);
  v10[7] = v4;
  v5 = *(_OWORD *)(a2 + 144);
  v10[8] = *(_OWORD *)(a2 + 128);
  v10[9] = v5;
  v6 = *(_OWORD *)(a2 + 48);
  v10[2] = *(_OWORD *)(a2 + 32);
  v10[3] = v6;
  v7 = *(_OWORD *)(a2 + 80);
  v10[4] = *(_OWORD *)(a2 + 64);
  v10[5] = v7;
  v8 = *(_OWORD *)(a2 + 16);
  v10[0] = *(_OWORD *)a2;
  v10[1] = v8;
  _VideoReceiver_ProcessRTTStatistics(v2, v10);
  return result;
}

uint64_t __VideoReceiver_SetSynchronizer_block_invoke(uint64_t a1, _QWORD *a2)
{
  return VideoReceiver_UpdateSourcePlayoutTime(*(_QWORD *)(a1 + 32), a2);
}

uint64_t ___VideoReceiver_ReportingRegisterPeriodicTask_block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFAllocator *v2;
  uint64_t v3;
  double v4;
  uint64_t result;
  unsigned int *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  double v10;
  double v11;
  unint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _DWORD *v19;
  uint64_t v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  unint64_t v25;
  uint64_t v26;
  const char *CStringPtr;
  uint64_t v28;
  double v29;
  double v30;
  float v31;
  double v32;
  BOOL v33;
  double v34;
  uint64_t v35;
  unsigned __int8 v36;
  unsigned __int8 v37;
  double v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int ErrorLogLevelForModule;
  uint64_t v44;
  NSObject *v45;
  int v46;
  uint64_t v47;
  char *v48;
  const char *v49;
  NSObject *v50;
  uint32_t v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  __CFDictionary *v56;
  unsigned int v57;
  const __CFAllocator *v58;
  CFNumberRef v59;
  CFNumberRef v60;
  CFNumberRef v61;
  CFNumberRef v62;
  CFNumberRef v63;
  CFNumberRef v64;
  CFNumberRef v65;
  unsigned int v66;
  float v67;
  double v68;
  float v69;
  CFNumberRef v70;
  CFNumberRef v71;
  CFNumberRef v72;
  float v73;
  CFNumberRef v74;
  double v75;
  double v76;
  CFNumberRef v77;
  float v78;
  CFNumberRef v79;
  CFNumberRef v80;
  int v81;
  int v82;
  CFNumberRef v83;
  double PlaybackTimeOffset;
  float v85;
  CFNumberRef v86;
  CFNumberRef v87;
  double *v88;
  double v89;
  double v90;
  float v91;
  CFNumberRef v92;
  double v93;
  double v94;
  CFNumberRef v95;
  float v96;
  CFNumberRef v97;
  CFNumberRef v98;
  CFNumberRef v99;
  double v100;
  CFNumberRef v101;
  CFNumberRef v102;
  CFNumberRef v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  __CFArray *Mutable;
  CFIndex v110;
  char *v111;
  CFNumberRef v112;
  CFNumberRef v113;
  float v114;
  CFNumberRef v115;
  float v116;
  CFNumberRef v117;
  CFNumberRef v118;
  CFNumberRef v119;
  CFNumberRef v120;
  CFNumberRef v121;
  CFNumberRef v122;
  CFNumberRef v123;
  const CFDictionaryKeyCallBacks *v124;
  const CFDictionaryValueCallBacks *v125;
  __CFDictionary *v126;
  __CFDictionary *v127;
  __CFDictionary *v128;
  __CFDictionary *v129;
  uint64_t v130;
  unsigned int *v131;
  unsigned int v132;
  uint64_t v133;
  CFStringRef v134;
  CFNumberRef v135;
  CFNumberRef v136;
  CFNumberRef v137;
  CFNumberRef v138;
  CFNumberRef v139;
  CFNumberRef v140;
  __CFDictionary *v141;
  uint64_t v142;
  uint64_t v143;
  char *v144;
  unsigned int v145;
  CFStringRef v146;
  CFNumberRef v147;
  uint64_t v148;
  double *v149;
  const char *v150;
  os_log_t *v151;
  uint64_t v152;
  NSObject *v153;
  const char *v154;
  const char *v155;
  double v156;
  uint64_t v157;
  int v158;
  char *v159;
  uint64_t v160;
  NSObject *v161;
  const char *v162;
  unsigned int v163;
  char *v164;
  uint64_t v165;
  double v166;
  double v167;
  double v168;
  int v169;
  int v170;
  int v171;
  float v172;
  CFNumberRef v173;
  CFNumberRef v174;
  CFNumberRef v175;
  unsigned int v176;
  int v177;
  float v178;
  double v179;
  float v180;
  int v181;
  CFNumberRef v182;
  CFNumberRef v183;
  CFNumberRef v184;
  unsigned int v185;
  unsigned int v186;
  unsigned int v187;
  float v188;
  float v189;
  float v190;
  float v191;
  CFNumberRef v192;
  CFNumberRef v193;
  CFNumberRef v194;
  CFNumberRef v195;
  CFNumberRef v196;
  CFNumberRef v197;
  CFNumberRef v198;
  CFNumberRef v199;
  CFNumberRef v200;
  CFNumberRef v201;
  CFNumberRef v202;
  CFNumberRef v203;
  CFNumberRef v204;
  CFNumberRef v205;
  CFNumberRef v206;
  CFNumberRef v207;
  CFNumberRef v208;
  CFNumberRef v209;
  CFNumberRef v210;
  CFNumberRef v211;
  CFNumberRef v212;
  CFNumberRef v213;
  CFNumberRef v214;
  CFNumberRef v215;
  CFNumberRef v216;
  CFNumberRef v217;
  CFNumberRef v218;
  CFNumberRef v219;
  CFNumberRef v220;
  CFNumberRef v221;
  unint64_t v222;
  uint64_t v223;
  int v224;
  int v225;
  CFNumberRef v226;
  CFNumberRef v227;
  uint64_t v228;
  int v229;
  _DWORD *v230;
  CFNumberRef v231;
  uint64_t v232;
  int v233;
  int v234;
  unsigned int v235;
  unsigned int v236;
  int v237;
  int v238;
  int v239;
  unsigned int v240;
  _QWORD *v241;
  __CFDictionary *v242;
  unsigned int v243;
  unint64_t v244;
  uint64_t v245;
  unint64_t v246;
  unint64_t v247;
  unsigned int *v248;
  uint64_t v249;
  int v250;
  __CFDictionary *v251;
  int v252;
  int v253;
  __CFDictionary *v254;
  int v255;
  int theDict;
  int theDicta;
  __CFDictionary *theDictb;
  int theDictc;
  CFAllocatorRef allocator;
  const __CFAllocator *allocatora;
  _OWORD v262[2];
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  double v272;
  double v273;
  double v274;
  double v275;
  double v276;
  double v277;
  unsigned int v278;
  double valuePtr[5280];
  _QWORD v280[5282];

  v1 = MEMORY[0x1E0C80A78](a1);
  allocator = v2;
  v3 = v1;
  v280[5279] = *MEMORY[0x1E0C80C00];
  v4 = micro();
  v277 = 0.0;
  result = CheckInHandleDebug();
  if (result)
  {
    v6 = (unsigned int *)result;
    v7 = result + 40984;
    v8 = result + 40656;
    VideoReceiver_GetFramerate(1.0, *(_QWORD *)(v3 + 32), &v277);
    v10 = v277;
    if (v277 > 0.0)
    {
      ++*(_WORD *)(v8 + 284);
      LOWORD(v9) = *(_WORD *)(v8 + 282);
      *(_WORD *)(v8 + 282) = (int)(v10 + (double)v9);
      if (*(double *)(v7 + 64) < v10)
        *(double *)(v7 + 64) = v10;
      if (*(double *)(v7 + 72) > v10)
        *(double *)(v7 + 72) = v10;
    }
    v276 = 0.0;
    VideoReceiver_GetBitrate(1.0, *(_QWORD *)(v3 + 32), (uint64_t)&v276, 0, 0, 0, 0);
    v11 = v276;
    if (*(double *)(v7 + 88) < v276)
      *(double *)(v7 + 88) = v276;
    if (*(double *)(v7 + 96) > v11)
      *(double *)(v7 + 96) = v11;
    v245 = v8;
    v274 = 0.0;
    v275 = 0.0;
    v272 = 0.0;
    v273 = 0.0;
    v241 = (_QWORD *)(v7 + 80);
    VideoReceiver_GetBitrate((float)*(unsigned int *)(v7 + 452), *(_QWORD *)(v3 + 32), v7 + 80, &v275, &v274, &v273, &v272);
    v249 = v7;
    if (*v6)
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 376;
      do
      {
        LODWORD(valuePtr[0]) = -1431655766;
        LODWORD(v262[0]) = -1431655766;
        v278 = -1431655766;
        RTPGetPacketLossMetrics(*(_QWORD *)&v6[v18], (unsigned int *)valuePtr, (unsigned int *)v262, &v278);
        v13 += LODWORD(v262[0]);
        v14 += v278;
        memset(v280, 0, 24);
        RTPGetDownlinkReportingStats(*(_QWORD *)&v6[v18], (uint64_t)v280);
        v15 += v280[1];
        v16 += v280[2];
        v17 += v280[0];
        ++v12;
        v18 += 1080;
      }
      while (v12 < *v6);
    }
    else
    {
      v17 = 0;
      v16 = 0;
      v15 = 0;
      v14 = 0;
      v13 = 0;
    }
    v243 = v14;
    v244 = v16;
    v247 = v17;
    v248 = v6;
    v19 = v6 + 10089;
    v20 = v245;
    v21 = *(_DWORD *)(v245 + 288);
    v22 = v13 - v21;
    v23 = v13;
    if (v13 >= v21)
    {
      v24 = v243 - *(_DWORD *)(v245 + 292);
    }
    else
    {
      *(_DWORD *)(v245 + 288) = v13;
      v24 = v243;
      *(_DWORD *)(v245 + 292) = v243;
      v22 = v13;
    }
    v25 = *(_QWORD *)(v245 + 312);
    if (v15 <= *(_QWORD *)(v245 + 304))
      LODWORD(v26) = 0;
    else
      v26 = *(_QWORD *)(v245 + 304);
    if (v244 <= v25)
      CStringPtr = *(const char **)(v245 + 312);
    else
      LODWORD(CStringPtr) = v244 - v25;
    if (v247 <= *(_QWORD *)(v245 + 320))
      LODWORD(v28) = 0;
    else
      v28 = *(_QWORD *)(v245 + 320);
    v246 = v15;
    if (v22 < 1 || (v24 & 0x80000000) != 0)
    {
      v31 = 0.0;
      if (!allocator)
        return CheckOutHandleDebug();
    }
    else
    {
      v29 = (double)v24 / (double)v22;
      if (v29 <= 1.0)
        v30 = v29 * 100.0;
      else
        v30 = 100.0;
      v31 = v30;
      v32 = *(double *)(v245 + 64);
      v33 = v32 == 0.0;
      v34 = v31 * 0.5 + v32 * 0.5;
      if (v33)
        v34 = v31;
      *(double *)(v245 + 64) = v34;
      v35 = v249;
      v36 = atomic_load((unsigned __int8 *)(v249 + 737));
      v37 = atomic_load((unsigned __int8 *)(v35 + 738));
      if (*v19 == 1)
      {
        v38 = *(double *)(v245 + 64);
        v39 = v38 > 0.0 || v22 >= 0xB;
        if (v39 && (v36 & 1) == 0 && (v37 & 1) == 0)
        {
          memset(&v280[4], 0, 40);
          memset(&v280[10], 0, 120);
          v40 = *((_QWORD *)v248 + 144);
          v41 = *(_QWORD *)(v249 + 416);
          v280[0] = 3;
          *(double *)&v280[1] = v4;
          v280[2] = 0;
          *(double *)&v280[3] = v38;
          v280[9] = v40;
          VCRateControlSetStatistics(v41, v280);
        }
      }
      if (!allocator)
        return CheckOutHandleDebug();
      if ((v36 & 1) == 0)
        atomic_store(0, (unsigned __int8 *)(v249 + 738));
      v42 = *((_QWORD *)v248 + 154);
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v42)
      {
        if (ErrorLogLevelForModule >= 7)
        {
          theDict = v28;
          v44 = VRTraceErrorLogLevelToCSTR();
          v45 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v253 = v26;
            v46 = (int)CStringPtr;
            CStringPtr = CFStringGetCStringPtr(*((CFStringRef *)v248 + 154), 0x8000100u);
            v47 = *(_QWORD *)(v245 + 64);
            v48 = FourccToCStr(v248[312]);
            LODWORD(v280[0]) = 136317442;
            *(_QWORD *)((char *)v280 + 4) = v44;
            WORD2(v280[1]) = 2080;
            *(_QWORD *)((char *)&v280[1] + 6) = "_VideoReceiver_ReportingRegisterPeriodicTask_block_invoke";
            HIWORD(v280[2]) = 1024;
            LODWORD(v280[3]) = 4404;
            WORD2(v280[3]) = 2048;
            *(_QWORD *)((char *)&v280[3] + 6) = v248;
            v20 = v245;
            HIWORD(v280[4]) = 2080;
            v280[5] = CStringPtr;
            LODWORD(CStringPtr) = v46;
            LODWORD(v26) = v253;
            LOWORD(v280[6]) = 2048;
            *(_QWORD *)((char *)&v280[6] + 2) = v47;
            WORD1(v280[7]) = 2048;
            *(double *)((char *)&v280[7] + 4) = v31;
            WORD2(v280[8]) = 1024;
            *(_DWORD *)((char *)&v280[8] + 6) = v22;
            WORD1(v280[9]) = 1024;
            HIDWORD(v280[9]) = v24;
            LOWORD(v280[10]) = 2080;
            *(_QWORD *)((char *)&v280[10] + 2) = v48;
            v49 = "VideoReceiver [%s] %s:%d VideoReceiver[%p] FEC health report for participantId:%s with PLR percentage:"
                  "%.2f, current percentage:%.2f (exp:%d, loss:%d) streamGroupID:%s";
            v50 = v45;
            v51 = 90;
LABEL_57:
            _os_log_impl(&dword_1D8A54000, v50, OS_LOG_TYPE_DEFAULT, v49, (uint8_t *)v280, v51);
            goto LABEL_58;
          }
          goto LABEL_58;
        }
      }
      else if (ErrorLogLevelForModule >= 7)
      {
        theDict = v28;
        v52 = VRTraceErrorLogLevelToCSTR();
        v53 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v54 = *((_QWORD *)v248 + 144);
          v55 = *(_QWORD *)(v245 + 64);
          LODWORD(v280[0]) = 136317186;
          *(_QWORD *)((char *)v280 + 4) = v52;
          WORD2(v280[1]) = 2080;
          *(_QWORD *)((char *)&v280[1] + 6) = "_VideoReceiver_ReportingRegisterPeriodicTask_block_invoke";
          HIWORD(v280[2]) = 1024;
          LODWORD(v280[3]) = 4406;
          WORD2(v280[3]) = 2048;
          *(_QWORD *)((char *)&v280[3] + 6) = v248;
          HIWORD(v280[4]) = 2048;
          v280[5] = v54;
          LOWORD(v280[6]) = 2048;
          *(_QWORD *)((char *)&v280[6] + 2) = v55;
          WORD1(v280[7]) = 2048;
          *(double *)((char *)&v280[7] + 4) = v31;
          WORD2(v280[8]) = 1024;
          *(_DWORD *)((char *)&v280[8] + 6) = v22;
          WORD1(v280[9]) = 1024;
          HIDWORD(v280[9]) = v24;
          v49 = "VideoReceiver [%s] %s:%d VideoReceiver[%p] FEC health report for participantId:%llu with PLR percentage:"
                "%.2f, current percentage:%.2f (exp:%d, loss:%d)";
          v50 = v53;
          v51 = 80;
          goto LABEL_57;
        }
LABEL_58:
        LODWORD(v28) = theDict;
      }
    }
    theDicta = v28;
    v239 = (int)CStringPtr;
    v240 = v23;
    v56 = (__CFDictionary *)selectDestinationForRTMetrics();
    v57 = (v274 / 1000.0 + 0.5);
    v235 = (*(double *)(v249 + 80) / 1000.0 + 0.5);
    LODWORD(v280[0]) = v235;
    v58 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v59 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, v280);
    CFDictionaryAddValue(v56, CFSTR("VRxR"), v59);
    CFRelease(v59);
    LODWORD(v280[0]) = (*(double *)(v249 + 88) / 1000.0 + 0.5);
    v60 = CFNumberCreate(v58, kCFNumberIntType, v280);
    CFDictionaryAddValue(v56, CFSTR("VRxRMax"), v60);
    CFRelease(v60);
    LODWORD(v280[0]) = (*(double *)(v249 + 96) / 1000.0 + 0.5);
    v61 = CFNumberCreate(v58, kCFNumberIntType, v280);
    CFDictionaryAddValue(v56, CFSTR("VRxRMin"), v61);
    CFRelease(v61);
    LODWORD(v280[0]) = (v275 / 1000.0 + 0.5);
    v62 = CFNumberCreate(v58, kCFNumberIntType, v280);
    CFDictionaryAddValue(v56, CFSTR("VRFECRxR"), v62);
    CFRelease(v62);
    v236 = v57;
    LODWORD(v280[0]) = v57;
    v63 = CFNumberCreate(v58, kCFNumberIntType, v280);
    CFDictionaryAddValue(v56, CFSTR("VRxMetadataOverhead"), v63);
    CFRelease(v63);
    LODWORD(v280[0]) = (v273 / 1000.0 + 0.5);
    v64 = CFNumberCreate(v58, kCFNumberIntType, v280);
    CFDictionaryAddValue(v56, CFSTR("VRxMR"), v64);
    CFRelease(v64);
    LODWORD(v280[0]) = (v272 / 1000.0 + 0.5);
    v65 = CFNumberCreate(v58, kCFNumberIntType, v280);
    CFDictionaryAddValue(v56, CFSTR("VRxDMR"), v65);
    CFRelease(v65);
    _VideoReceiver_CheckIfVideoStalling((uint64_t)v248);
    if (*(_WORD *)(v20 + 284))
    {
      LOWORD(v66) = *(_WORD *)(v20 + 282);
      v67 = (float)v66 / (float)*(unsigned __int16 *)(v20 + 284);
    }
    else
    {
      v67 = 0.0;
    }
    v68 = 0.0;
    v69 = *(double *)(v249 + 72);
    *(float *)v280 = v67;
    v70 = CFNumberCreate(v58, kCFNumberFloat32Type, v280);
    CFDictionaryAddValue(v56, CFSTR("ARFr"), v70);
    CFRelease(v70);
    LODWORD(v280[0]) = (int)*(double *)(v249 + 64);
    v71 = CFNumberCreate(v58, kCFNumberIntType, v280);
    CFDictionaryAddValue(v56, CFSTR("XRFr"), v71);
    CFRelease(v71);
    LODWORD(v280[0]) = (int)v69;
    v72 = CFNumberCreate(v58, kCFNumberIntType, v280);
    CFDictionaryAddValue(v56, CFSTR("NRFr"), v72);
    CFRelease(v72);
    v73 = *(double *)(v249 + 104);
    *(float *)v280 = v73;
    v74 = CFNumberCreate(v58, kCFNumberFloat32Type, v280);
    CFDictionaryAddValue(v56, CFSTR("VST"), v74);
    CFRelease(v74);
    v75 = *(double *)(v249 + 112);
    v76 = *(double *)(v249 + 104) - v75;
    LODWORD(v75) = *(_DWORD *)(v249 + 452);
    *(float *)&v76 = v76 / (double)*(unint64_t *)&v75;
    LODWORD(v280[0]) = LODWORD(v76);
    v77 = CFNumberCreate(v58, kCFNumberFloat32Type, v280);
    CFDictionaryAddValue(v56, CFSTR("iVSP"), v77);
    CFRelease(v77);
    v78 = *(double *)(v249 + 152);
    *(float *)v280 = v78;
    v79 = CFNumberCreate(v58, kCFNumberFloat32Type, v280);
    CFDictionaryAddValue(v56, CFSTR("VSTSM"), v79);
    CFRelease(v79);
    LODWORD(v280[0]) = *(_DWORD *)(v249 + 128);
    v80 = CFNumberCreate(v58, kCFNumberIntType, v280);
    CFDictionaryAddValue(v56, CFSTR("VSTCNT"), v80);
    CFRelease(v80);
    *(_DWORD *)(v249 + 128) = 0;
    v81 = *(_DWORD *)(v249 + 572);
    v82 = v81 - *(_DWORD *)(v249 + 576);
    *(_DWORD *)(v249 + 576) = v81;
    v234 = v82;
    LODWORD(v280[0]) = v82;
    v83 = CFNumberCreate(v58, kCFNumberIntType, v280);
    CFDictionaryAddValue(v56, CFSTR("VFrErCnt"), v83);
    CFRelease(v83);
    v233 = *(unsigned __int16 *)(v20 + 104);
    PlaybackTimeOffset = VCVideoPlayer_GetPlaybackTimeOffset();
    v270 = 0u;
    v271 = 0u;
    v269 = 0u;
    v267 = 0u;
    v268 = 0u;
    v265 = 0u;
    v266 = 0u;
    v263 = 0u;
    v264 = 0u;
    memset(v262, 0, sizeof(v262));
    VCVideoPlayer_CollectVideoPlayerStatsForReporting(v4, *(_QWORD *)(v19 + 19), (uint64_t)v262);
    _VideoReceiver_ReportVideoPlayerStatsForReporting((uint64_t)v262, v56);
    VCVideoPlayer_ResetVideoPlayerStatsForReporting(v4);
    if (*((_BYTE *)v248 + 1180))
    {
      v85 = *(double *)(v20 + 88);
      *(float *)v280 = v85;
      v86 = CFNumberCreate(v58, kCFNumberFloat32Type, v280);
      CFDictionaryAddValue(v56, CFSTR("VJ"), v86);
      CFRelease(v86);
      LODWORD(v280[0]) = *(unsigned __int16 *)(v20 + 104);
      v87 = CFNumberCreate(v58, kCFNumberIntType, v280);
      CFDictionaryAddValue(v56, CFSTR("VJBTC"), v87);
      CFRelease(v87);
      *(_WORD *)(v20 + 104) = 0;
      v88 = (double *)(v20 + 120);
      v89 = *(double *)(v20 + 120);
      v90 = v4 - *(double *)(v20 + 112);
      if (*(double *)(v20 + 96) != 0.0)
      {
        v89 = v90 + v89;
        *v88 = v89;
      }
      v91 = v89;
      *(float *)v280 = v91;
      v92 = CFNumberCreate(v58, kCFNumberFloat32Type, v280);
      CFDictionaryAddValue(v56, CFSTR("VJBTNZT"), v92);
      CFRelease(v92);
      v232 = *(_QWORD *)(v20 + 120);
      v93 = *(double *)(v20 + 128);
      v94 = v93 + v90 * *(double *)(v20 + 88);
      *(double *)(v20 + 128) = v94;
      LODWORD(v93) = *(_DWORD *)(v249 + 452);
      v68 = v94 / (double)*(unint64_t *)&v93;
      *(float *)&v94 = v68;
      LODWORD(v280[0]) = LODWORD(v94);
      v95 = CFNumberCreate(v58, kCFNumberFloat32Type, v280);
      CFDictionaryAddValue(v56, CFSTR("VJBTWA"), v95);
      CFRelease(v95);
      *v88 = 0.0;
      *(_QWORD *)(v20 + 128) = 0;
      *(double *)(v20 + 112) = v4;
      v96 = PlaybackTimeOffset;
      *(float *)v280 = v96;
      v97 = CFNumberCreate(v58, kCFNumberFloat32Type, v280);
      CFDictionaryAddValue(v56, CFSTR("VPO"), v97);
      CFRelease(v97);
      if (*((_BYTE *)v248 + 1216) && *((_BYTE *)v248 + 1217))
      {
        LODWORD(v280[0]) = (int)*(double *)&v263;
        v98 = CFNumberCreate(v58, kCFNumberIntType, v280);
        CFDictionaryAddValue(v56, CFSTR("AVSyncOffsetMin"), v98);
        CFRelease(v98);
        LODWORD(v280[0]) = (int)*((double *)&v263 + 1);
        v99 = CFNumberCreate(v58, kCFNumberIntType, v280);
        CFDictionaryAddValue(v56, CFSTR("AVSyncOffsetMax"), v99);
        CFRelease(v99);
        if ((_DWORD)v265)
          v100 = *(double *)&v264 / (double)(int)v265;
        else
          v100 = 0.0;
        LODWORD(v280[0]) = (int)v100;
        v101 = CFNumberCreate(v58, kCFNumberIntType, v280);
        CFDictionaryAddValue(v56, CFSTR("AVSyncOffset"), v101);
        CFRelease(v101);
      }
    }
    else
    {
      v232 = 0;
    }
    LODWORD(v280[0]) = (int)*(double *)&v271;
    v102 = CFNumberCreate(v58, kCFNumberIntType, v280);
    CFDictionaryAddValue(v56, CFSTR("VPFDC"), v102);
    CFRelease(v102);
    v280[0] = *((_QWORD *)&v271 + 1);
    v103 = CFNumberCreate(v58, kCFNumberDoubleType, v280);
    CFDictionaryAddValue(v56, CFSTR("VPFDCD"), v103);
    CFRelease(v103);
    v104 = *(_QWORD *)(v249 + 640);
    if (v104)
      VCNACKGenerator_GetStatistics(v104, v56);
    bzero(v280, 0xA4F8uLL);
    _VideoReceiver_GetVPBStats((uint64_t)v248);
    v105 = *v248;
    if ((_DWORD)v105)
    {
      v106 = 0;
      v107 = 392;
      do
      {
        v108 = *(_QWORD *)&v248[v107];
        if (v108)
        {
          VideoPacketBuffer_ResetStatistics(v108);
          v105 = *v248;
        }
        ++v106;
        v107 += 1080;
      }
      while (v106 < v105);
    }
    v237 = v246 - v26;
    v238 = v247 - theDicta;
    if (LODWORD(v280[73]))
      *(double *)&v280[70] = *(double *)&v280[69] / (double)LODWORD(v280[73]);
    Mutable = CFArrayCreateMutable(0, 23, MEMORY[0x1E0C9B378]);
    v110 = 0;
    v111 = (char *)&v280[57] + 4;
    do
    {
      v112 = CFNumberCreate(0, kCFNumberIntType, v111);
      CFArraySetValueAtIndex(Mutable, v110, v112);
      if (v112)
        CFRelease(v112);
      ++v110;
      v111 += 4;
    }
    while (v110 != 23);
    CFDictionaryAddValue(v56, CFSTR("VFEVLtPktDelayHist"), Mutable);
    if (Mutable)
      CFRelease(Mutable);
    LODWORD(valuePtr[0]) = HIDWORD(v280[72]);
    v113 = CFNumberCreate(v58, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v56, CFSTR("VFEVTrCnt"), v113);
    CFRelease(v113);
    v114 = *(double *)&v280[70];
    *(float *)valuePtr = v114;
    v115 = CFNumberCreate(v58, kCFNumberFloat32Type, valuePtr);
    CFDictionaryAddValue(v56, CFSTR("VFEVLtPktDelay"), v115);
    CFRelease(v115);
    v116 = *(double *)&v280[71];
    *(float *)valuePtr = v116;
    v117 = CFNumberCreate(v58, kCFNumberFloat32Type, valuePtr);
    CFDictionaryAddValue(v56, CFSTR("VFEVMaxLtPktDelay"), v117);
    CFRelease(v117);
    LODWORD(valuePtr[0]) = v280[72];
    v118 = CFNumberCreate(v58, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v56, CFSTR("VFrLateCount"), v118);
    CFRelease(v118);
    LODWORD(valuePtr[0]) = v280[73];
    v119 = CFNumberCreate(v58, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v56, CFSTR("VFEVRecoveredCnt"), v119);
    CFRelease(v119);
    LODWORD(valuePtr[0]) = v280[75];
    v120 = CFNumberCreate(v58, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v56, CFSTR("NacksFrmsSchWithRTX"), v120);
    CFRelease(v120);
    LODWORD(valuePtr[0]) = HIDWORD(v280[75]);
    v121 = CFNumberCreate(v58, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v56, CFSTR("NacksFrmsAssemWithRTX"), v121);
    CFRelease(v121);
    LODWORD(valuePtr[0]) = v280[76];
    v122 = CFNumberCreate(v58, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v56, CFSTR("NacksFrmsFailedAssemWithRTX"), v122);
    CFRelease(v122);
    LODWORD(valuePtr[0]) = HIDWORD(v280[5278]);
    v123 = CFNumberCreate(v58, kCFNumberIntType, valuePtr);
    v242 = v56;
    CFDictionaryAddValue(v56, CFSTR("VRxIDRC"), v123);
    CFRelease(v123);
    v124 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
    v125 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
    v251 = CFDictionaryCreateMutable(v58, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    memcpy(valuePtr, v280, 0xA4F8uLL);
    theDictb = CFDictionaryCreateMutable(v58, 0, v124, v125);
    v254 = CFDictionaryCreateMutable(v58, 0, v124, v125);
    v126 = CFDictionaryCreateMutable(v58, 0, v124, v125);
    v127 = CFDictionaryCreateMutable(v58, 0, v124, v125);
    v128 = CFDictionaryCreateMutable(v58, 0, v124, v125);
    allocatora = v58;
    v129 = CFDictionaryCreateMutable(v58, 0, v124, v125);
    v130 = 0;
    v131 = (unsigned int *)&valuePtr[5] + 1;
    do
    {
      v132 = *(v131 - 3);
      if (v132)
      {
        v133 = FECUtil_FECLevelofProtectionToFECPercentage(v130);
        v134 = CFStringCreateWithFormat(v58, 0, CFSTR("%u"), v133);
        v278 = *(_QWORD *)(v131 - 7);
        v135 = CFNumberCreate(v58, kCFNumberIntType, &v278);
        CFDictionaryAddValue(theDictb, v134, v135);
        CFRelease(v135);
        v278 = *(_QWORD *)(v131 - 5);
        v136 = CFNumberCreate(v58, kCFNumberIntType, &v278);
        CFDictionaryAddValue(v254, v134, v136);
        CFRelease(v136);
        v278 = v132;
        v137 = CFNumberCreate(v58, kCFNumberIntType, &v278);
        CFDictionaryAddValue(v126, v134, v137);
        CFRelease(v137);
        v278 = *(v131 - 2);
        v138 = CFNumberCreate(v58, kCFNumberIntType, &v278);
        CFDictionaryAddValue(v127, v134, v138);
        CFRelease(v138);
        v278 = *(v131 - 1);
        v139 = CFNumberCreate(v58, kCFNumberIntType, &v278);
        CFDictionaryAddValue(v128, v134, v139);
        CFRelease(v139);
        v278 = *v131;
        v140 = CFNumberCreate(v58, kCFNumberIntType, &v278);
        CFDictionaryAddValue(v129, v134, v140);
        CFRelease(v140);
        CFRelease(v134);
      }
      ++v130;
      v131 += 10;
    }
    while (v130 != 6);
    CFDictionaryAddValue(v251, CFSTR("VFecDB"), theDictb);
    CFDictionaryAddValue(v251, CFSTR("VFecPB"), v254);
    CFDictionaryAddValue(v251, CFSTR("VFecTF"), v126);
    CFDictionaryAddValue(v251, CFSTR("VFecCF"), v127);
    CFDictionaryAddValue(v251, CFSTR("VFecNF"), v128);
    CFDictionaryAddValue(v251, CFSTR("VFecFF"), v129);
    CFRelease(theDictb);
    CFRelease(v254);
    CFRelease(v126);
    CFRelease(v127);
    CFRelease(v128);
    CFRelease(v129);
    v141 = CFDictionaryCreateMutable(v58, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v142 = 0;
    v143 = v249;
    do
    {
      v144 = (char *)valuePtr + 2 * v142;
      v145 = *((unsigned __int16 *)v144 + 128);
      if (*((_WORD *)v144 + 128))
      {
        v146 = CFStringCreateWithFormat(v58, 0, CFSTR("%d"), v142);
        v278 = v145;
        v147 = CFNumberCreate(v58, kCFNumberIntType, &v278);
        CFDictionaryAddValue(v141, v146, v147);
        CFRelease(v147);
        CFRelease(v146);
      }
      ++v142;
    }
    while (v142 != 102);
    CFDictionaryAddValue(v251, CFSTR("VRLossPattern"), v141);
    CFRelease(v141);
    _VideoReceiver_ComputePacketLoss2DHistogram(v251, CFSTR("VRLossHistogram"), (uint64_t)&valuePtr[76] + 4);
    _VideoReceiver_ComputePacketLoss2DHistogram(v251, CFSTR("VRLossFecHistogram"), (uint64_t)&valuePtr[2677] + 4);
    CFDictionaryAddValue(v242, CFSTR("VFecStats"), v251);
    CFRelease(v251);
    v148 = 0;
    *(_DWORD *)(v249 + 668) = 0;
    v149 = (double *)&v280[6];
    v150 = "VideoReceiver";
    v151 = (os_log_t *)MEMORY[0x1E0CF2758];
    do
    {
      if (*((_QWORD *)v149 - 4) || *((_DWORD *)v149 - 4))
      {
        *(_DWORD *)(v143 + 668) = v148;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v152 = VRTraceErrorLogLevelToCSTR();
          v153 = *v151;
          if (os_log_type_enabled(*v151, OS_LOG_TYPE_DEFAULT))
          {
            v154 = v150;
            v155 = CFStringGetCStringPtr(*((CFStringRef *)v248 + 154), 0x8000100u);
            v156 = *(v149 - 4);
            v157 = *((_QWORD *)v149 - 3);
            v158 = *((_DWORD *)v149 - 4);
            v250 = *((_DWORD *)v149 - 3);
            v252 = *((_DWORD *)v149 - 2);
            v255 = *((_DWORD *)v149 - 1);
            theDictc = *(_DWORD *)v149;
            v159 = FourccToCStr(v248[312]);
            LODWORD(valuePtr[0]) = 136318466;
            *(_QWORD *)((char *)valuePtr + 4) = v152;
            WORD2(valuePtr[1]) = 2080;
            *(_QWORD *)((char *)&valuePtr[1] + 6) = "_VideoReceiver_ReportingRegisterPeriodicTask_block_invoke";
            HIWORD(valuePtr[2]) = 1024;
            LODWORD(valuePtr[3]) = 4552;
            WORD2(valuePtr[3]) = 2048;
            *(_QWORD *)((char *)&valuePtr[3] + 6) = v248;
            HIWORD(valuePtr[4]) = 1024;
            LODWORD(valuePtr[5]) = v148;
            WORD2(valuePtr[5]) = 2080;
            *(_QWORD *)((char *)&valuePtr[5] + 6) = v155;
            v150 = v154;
            HIWORD(valuePtr[6]) = 2048;
            valuePtr[7] = v156;
            LOWORD(valuePtr[8]) = 2048;
            *(_QWORD *)((char *)&valuePtr[8] + 2) = v157;
            v143 = v249;
            WORD1(valuePtr[9]) = 1024;
            HIDWORD(valuePtr[9]) = v158;
            LOWORD(valuePtr[10]) = 1024;
            *(_DWORD *)((char *)&valuePtr[10] + 2) = v250;
            v151 = (os_log_t *)MEMORY[0x1E0CF2758];
            HIWORD(valuePtr[10]) = 1024;
            LODWORD(valuePtr[11]) = v252;
            WORD2(valuePtr[11]) = 1024;
            *(_DWORD *)((char *)&valuePtr[11] + 6) = v255;
            WORD1(valuePtr[12]) = 1024;
            HIDWORD(valuePtr[12]) = theDictc;
            LOWORD(valuePtr[13]) = 2080;
            *(_QWORD *)((char *)&valuePtr[13] + 2) = v159;
            _os_log_impl(&dword_1D8A54000, v153, OS_LOG_TYPE_DEFAULT, "VideoReceiver [%s] %s:%d VideoReceiver[%p] FEC health report: fecLevel:%d participantID:%s data:%llu, parity:%llu, totalFrame:%d complete:%d, notRecoverable:%d, failedToRecover:%d, recovered:%d streamGroupId:%s", (uint8_t *)valuePtr, 0x72u);
          }
        }
      }
      ++v148;
      v149 += 5;
    }
    while (v148 != 6);
    if ((int)VRTraceGetErrorLogLevelForModule() > 5)
    {
      v160 = VRTraceErrorLogLevelToCSTR();
      v161 = *v151;
      if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
      {
        v162 = CFStringGetCStringPtr(*((CFStringRef *)v248 + 154), 0x8000100u);
        v163 = v248[254];
        v164 = FourccToCStr(v248[312]);
        v165 = *(_QWORD *)(v143 + 64);
        v166 = *(double *)(v143 + 104) * 1000.0;
        v167 = *(double *)(v143 + 152) * 1000.0;
        v168 = *(double *)(v245 + 88) * 1000.0;
        v169 = *(_DWORD *)(v245 + 296);
        v170 = *(_DWORD *)(v143 + 476);
        v171 = *(_DWORD *)(v143 + 472);
        LODWORD(valuePtr[0]) = 136320514;
        *(_QWORD *)((char *)valuePtr + 4) = v160;
        WORD2(valuePtr[1]) = 2080;
        *(_QWORD *)((char *)&valuePtr[1] + 6) = "_VideoReceiver_ReportingRegisterPeriodicTask_block_invoke";
        HIWORD(valuePtr[2]) = 1024;
        LODWORD(valuePtr[3]) = 4556;
        WORD2(valuePtr[3]) = 2080;
        *(_QWORD *)((char *)&valuePtr[3] + 6) = v162;
        HIWORD(valuePtr[4]) = 1024;
        LODWORD(valuePtr[5]) = v163;
        WORD2(valuePtr[5]) = 2080;
        *(_QWORD *)((char *)&valuePtr[5] + 6) = v164;
        HIWORD(valuePtr[6]) = 2048;
        valuePtr[7] = v67;
        LOWORD(valuePtr[8]) = 2048;
        *(double *)((char *)&valuePtr[8] + 2) = v69;
        WORD1(valuePtr[9]) = 2048;
        *(_QWORD *)((char *)&valuePtr[9] + 4) = v165;
        WORD2(valuePtr[10]) = 1024;
        *(_DWORD *)((char *)&valuePtr[10] + 6) = v235;
        WORD1(valuePtr[11]) = 2048;
        *(double *)((char *)&valuePtr[11] + 4) = v166;
        WORD2(valuePtr[12]) = 2048;
        *(double *)((char *)&valuePtr[12] + 6) = v167;
        HIWORD(valuePtr[13]) = 2048;
        valuePtr[14] = v168;
        LOWORD(valuePtr[15]) = 2048;
        *(double *)((char *)&valuePtr[15] + 2) = PlaybackTimeOffset * 1000.0;
        WORD1(valuePtr[16]) = 1024;
        HIDWORD(valuePtr[16]) = v233;
        LOWORD(valuePtr[17]) = 2048;
        *(_QWORD *)((char *)&valuePtr[17] + 2) = v232;
        WORD1(valuePtr[18]) = 2048;
        *(double *)((char *)&valuePtr[18] + 4) = v68 * 1000.0;
        WORD2(valuePtr[19]) = 1024;
        *(_DWORD *)((char *)&valuePtr[19] + 6) = v234;
        WORD1(valuePtr[20]) = 1024;
        HIDWORD(valuePtr[20]) = v169;
        LOWORD(valuePtr[21]) = 1024;
        *(_DWORD *)((char *)&valuePtr[21] + 2) = v170;
        HIWORD(valuePtr[21]) = 1024;
        LODWORD(valuePtr[22]) = v171;
        WORD2(valuePtr[22]) = 1024;
        *(_DWORD *)((char *)&valuePtr[22] + 6) = v236;
        _os_log_impl(&dword_1D8A54000, v161, OS_LOG_TYPE_DEFAULT, "VideoReceiver [%s] %s:%d @=@ Health: VideoReceiver participantID=%s, mode=%d, streamGroupId=%s, videoRxAvgFrameRate=%.2f, videoRxMinFrameRate=%.2f, videoRxMaxFrameRate=%.2f, videoRxBitrate=%d kbps, videoStallTime=%.1f ms, videoSegmentMaxStall=%.1f ms, videoJitterQueueSize=%.1f ms, playbackOffset=%f ms, numOfJitterQueueSizeChanges=%d, timeSpentInNonZeroJBQueueSize=%f s, averageJitterQueueSize=%f ms, frameErasureCount=%u, packetReceived=%u, callbackCount=%u significantOutOfOrderPacketCount=%d, metadataRxBitrateKbps=%u", (uint8_t *)valuePtr, 0xBAu);
      }
    }
    if (*((_BYTE *)v248 + 1181))
      VCVideoJitterBuffer_HealthPrint(*(_QWORD *)(v143 + 536));
    v172 = *(double *)(v245 + 64);
    *(float *)valuePtr = v172;
    v173 = CFNumberCreate(allocatora, kCFNumberFloat32Type, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("VRxAvgPktLoss"), v173);
    CFRelease(v173);
    *(float *)valuePtr = v31;
    v174 = CFNumberCreate(allocatora, kCFNumberFloat32Type, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("VRxPktLoss"), v174);
    CFRelease(v174);
    LODWORD(valuePtr[0]) = 0;
    v175 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("VPktRx"), v175);
    CFRelease(v175);
    v176 = *(unsigned __int16 *)(v143 + 40);
    v177 = (__int16)(v176 - *(_WORD *)(v143 + 38));
    v178 = 0.0;
    v179 = (double)v176;
    v180 = 0.0;
    if (v177 >= 1)
      v180 = (double)v177 / v179;
    v181 = (__int16)(v176 - *(_WORD *)(v143 + 36));
    if (v181 >= 1)
      v178 = (double)v181 / v179;
    *(float *)valuePtr = v180;
    v182 = CFNumberCreate(allocatora, kCFNumberFloat32Type, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("VRFrLoss"), v182);
    CFRelease(v182);
    *(float *)valuePtr = v178;
    v183 = CFNumberCreate(allocatora, kCFNumberFloat32Type, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("VRFrShown"), v183);
    CFRelease(v183);
    LODWORD(valuePtr[0]) = *(unsigned __int16 *)(v143 + 40);
    v184 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("VRFrExpected"), v184);
    CFRelease(v184);
    v186 = *(unsigned __int16 *)(v143 + 276);
    if (*(_WORD *)(v143 + 276))
    {
      v187 = *(unsigned __int16 *)(v245 + 284);
      if (*(_WORD *)(v245 + 284))
      {
        LOWORD(v185) = *(_WORD *)(v143 + 274);
        v188 = (float)(*(unsigned __int16 *)(v143 + 272) / v186);
        v189 = (float)-(float)v185 / (float)v186;
        v190 = (float)(1.0 - expf((float)(v189 * (float)(int)(*(unsigned __int16 *)(v245 + 282) / v187 - 1)) / 30.0))
             * v188;
        v191 = v190 / (float)(1.0 - expf(v189));
        if ((int)v191 <= 0xA)
          v187 = (5 * (int)v191 + 50);
        else
          v187 = 100;
        *(_WORD *)(v143 + 272) = 0;
        *(_WORD *)(v143 + 276) = 0;
      }
    }
    else
    {
      v187 = 0;
    }
    LODWORD(valuePtr[0]) = v187;
    v192 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("VQS"), v192);
    CFRelease(v192);
    LODWORD(valuePtr[0]) = *(_DWORD *)(v143 + 472);
    v193 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("VRSOOOCnt"), v193);
    CFRelease(v193);
    LODWORD(valuePtr[0]) = v280[0];
    v194 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("VFIRDCnt"), v194);
    CFRelease(v194);
    LODWORD(valuePtr[0]) = *(_DWORD *)v143;
    v195 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("VFIRCnt"), v195);
    CFRelease(v195);
    LODWORD(valuePtr[0]) = *(_DWORD *)(v143 + 8);
    v196 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("VFIRFSCnt"), v196);
    CFRelease(v196);
    LODWORD(valuePtr[0]) = *(_DWORD *)(v143 + 44);
    v197 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("VFDBSCnt"), v197);
    CFRelease(v197);
    LODWORD(valuePtr[0]) = HIDWORD(v280[0]);
    v198 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("VFTICnt"), v198);
    CFRelease(v198);
    LODWORD(valuePtr[0]) = *(unsigned __int16 *)(v143 + 52);
    v199 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("DecOutFrameCnt"), v199);
    CFRelease(v199);
    LODWORD(valuePtr[0]) = *(unsigned __int16 *)(v143 + 54);
    v200 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("DecOutMLEnhancedFrameCnt"), v200);
    CFRelease(v200);
    LODWORD(valuePtr[0]) = *(unsigned __int16 *)(v143 + 36);
    v201 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("DVFECnt"), v201);
    CFRelease(v201);
    LODWORD(valuePtr[0]) = *(unsigned __int16 *)(v143 + 38);
    v202 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("VFRxCnt"), v202);
    CFRelease(v202);
    LODWORD(valuePtr[0]) = HIDWORD(v280[1]);
    v203 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("VNoFecTF"), v203);
    CFRelease(v203);
    LODWORD(valuePtr[0]) = v280[1];
    v204 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("VNoFecCF"), v204);
    CFRelease(v204);
    LODWORD(valuePtr[0]) = *(_DWORD *)(v143 + 56);
    v205 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("DecNoShowFrameCnt"), v205);
    CFRelease(v205);
    LODWORD(valuePtr[0]) = *(_DWORD *)(v245 + 156);
    v206 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("Width"), v206);
    CFRelease(v206);
    LODWORD(valuePtr[0]) = *(_DWORD *)(v245 + 160);
    v207 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("Height"), v207);
    CFRelease(v207);
    LODWORD(valuePtr[0]) = (unsigned __int16)(*(_WORD *)(v143 + 26) - *(_WORD *)(v143 + 28));
    v208 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("VFExCnt"), v208);
    CFRelease(v208);
    LODWORD(valuePtr[0]) = *(_DWORD *)(v143 + 48);
    v209 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("VRxSinglePktFrame"), v209);
    CFRelease(v209);
    LODWORD(valuePtr[0]) = 0;
    v210 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("APRL"), v210);
    CFRelease(v210);
    LODWORD(valuePtr[0]) = 0;
    v211 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("AVDL"), v211);
    CFRelease(v211);
    LODWORD(valuePtr[0]) = 0;
    v212 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("ADL"), v212);
    CFRelease(v212);
    LODWORD(valuePtr[0]) = 0;
    v213 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("ATRL"), v213);
    CFRelease(v213);
    LODWORD(valuePtr[0]) = 0;
    v214 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("MPRL"), v214);
    CFRelease(v214);
    LODWORD(valuePtr[0]) = 0;
    v215 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("MVDL"), v215);
    CFRelease(v215);
    LODWORD(valuePtr[0]) = 0;
    v216 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("MDL"), v216);
    CFRelease(v216);
    LODWORD(valuePtr[0]) = 0;
    v217 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("MTRL"), v217);
    CFRelease(v217);
    LODWORD(valuePtr[0]) = (int)(_VideoReceiver_GetTotalPLR(v248) * 10000.0);
    v218 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("VRxPLR"), v218);
    CFRelease(v218);
    LODWORD(valuePtr[0]) = v237;
    v219 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("RTPDownlinkIngressVideoPkts"), v219);
    CFRelease(v219);
    LODWORD(valuePtr[0]) = v239;
    v220 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("RTPDownlinkEgressVideoPkts"), v220);
    CFRelease(v220);
    LODWORD(valuePtr[0]) = v238;
    v221 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
    CFDictionaryAddValue(v242, CFSTR("RTPDownlinkIngressNonDupMediaPkts"), v221);
    CFRelease(v221);
    v222 = v246;
    if (*v248)
    {
      v223 = 0;
      v224 = 0;
      v225 = 0;
      do
      {
        v224 += v248[v223 + 1429];
        v225 += v248[v223 + 1430];
        v223 += 1080;
      }
      while (1080 * *v248 != v223);
      if (v224)
      {
        LODWORD(valuePtr[0]) = v224;
        v226 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v242, CFSTR("LTRAckTx"), v226);
        CFRelease(v226);
      }
      if (v225)
      {
        LODWORD(valuePtr[0]) = v225;
        v227 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v242, CFSTR("LossFbTx"), v227);
        CFRelease(v227);
      }
      v228 = *v248;
      v222 = v246;
      if ((_DWORD)v228)
      {
        v229 = 0;
        v230 = v248 + 1431;
        do
        {
          v229 += *v230;
          v230 += 1080;
          --v228;
        }
        while (v228);
        if (v229)
        {
          LODWORD(valuePtr[0]) = v229;
          v231 = CFNumberCreate(allocatora, kCFNumberIntType, valuePtr);
          CFDictionaryAddValue(v242, CFSTR("RtcpAppLTRAckTx"), v231);
          CFRelease(v231);
          v222 = v246;
        }
      }
    }
    *(_WORD *)(v143 + 28) = *(_WORD *)(v143 + 26);
    *(_DWORD *)v143 = 0;
    *(_DWORD *)(v143 + 8) = 0;
    *(_DWORD *)(v143 + 44) = 0;
    *(_DWORD *)(v143 + 48) = 0;
    *(_DWORD *)(v245 + 282) = 0;
    *(_OWORD *)(v143 + 64) = xmmword_1D910BA00;
    *(_DWORD *)(v143 + 36) = 0;
    *(_QWORD *)(v143 + 52) = 0;
    *v241 = 0;
    v241[1] = 0;
    *(_QWORD *)(v143 + 96) = 0x7FF8000000000000;
    *(_DWORD *)(v143 + 472) = 0;
    *(_QWORD *)(v143 + 112) = *(_QWORD *)(v143 + 104);
    *(_DWORD *)(v245 + 288) = v240;
    *(_DWORD *)(v245 + 292) = v243;
    *(_QWORD *)(v245 + 304) = v222;
    *(_QWORD *)(v245 + 312) = v244;
    *(_QWORD *)(v245 + 320) = v247;
    _VideoReceiver_ResetStreamStats(v248);
    return CheckOutHandleDebug();
  }
  return result;
}

uint64_t ___VideoReceiver_RegisterTransportCallbacks_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FILE *v5;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 41195))
  {
    v5 = *(FILE **)(*(_QWORD *)(a1 + 32) + 41200);
    if (v5)
      _VideoReceiverUtil_LogRtpMediaPacket(a3 + 8, v5, *(_DWORD *)(a1 + 40));
  }
  return _VideoReceiver_RTPPacketCallback(a2, a3);
}

uint64_t ___VideoReceiver_RegisterTransportCallbacks_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = CheckInHandleDebug();
  if (result)
  {
    _VideoReceiver_ProcessVideoRTCPInternal(result, a2, a3);
    return CheckOutHandleDebug();
  }
  return result;
}

@end
