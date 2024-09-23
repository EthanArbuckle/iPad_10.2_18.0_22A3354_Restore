@implementation VideoTransmitter

uint64_t ___VideoTransmitter_DispatchEncoderCallback_block_invoke(uint64_t a1)
{
  const void *v2;

  _VideoTransmitter_TransmitFrame(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(opaqueCMSampleBuffer **)(a1 + 48));
  _VideoTransmitter_ProcessEncoderArgs(*(_QWORD *)(a1 + 32), *(_DWORD **)(a1 + 40));
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
  return CheckOutHandleDebug();
}

uint64_t ___VideoTransmitter_HandleUncompressedVideo_block_invoke(uint64_t a1)
{
  const void *v2;

  _VideoTransmitter_TransmitFrame(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(opaqueCMSampleBuffer **)(a1 + 48));
  _VideoTransmitter_ProcessEncoderArgs(*(_QWORD *)(a1 + 32), *(_DWORD **)(a1 + 40));
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
  return CheckOutHandleDebug();
}

uint64_t ___VideoTransmitter_RetransmitPacketDispatched_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = RTPTransportResendRTP(*(double *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_DWORD *)(a1 + 64), *(unsigned __int16 *)(a1 + 68), *(int **)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t ___VideoTransmitter_ReportingRegisterPeriodicTask_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  _WORD *v8;
  unint64_t v9;
  double v10;
  unint64_t v11;
  double v12;
  int v13;
  double v14;
  double *v15;
  __CFDictionary *v16;
  unsigned int v17;
  double v18;
  double v19;
  double v20;
  const __CFAllocator *v21;
  CFNumberRef v22;
  CFNumberRef v23;
  float v24;
  CFNumberRef v25;
  CFNumberRef v26;
  CFNumberRef v27;
  CFNumberRef v28;
  CFNumberRef v29;
  CFNumberRef v30;
  CFNumberRef v31;
  CFNumberRef v32;
  CFNumberRef v33;
  CFNumberRef v34;
  CFNumberRef v35;
  unint64_t v36;
  CFNumberRef v37;
  CFNumberRef v38;
  int v39;
  CFNumberRef v40;
  CFNumberRef v41;
  CFNumberRef v42;
  CFNumberRef v43;
  CFNumberRef v44;
  CFNumberRef v45;
  uint64_t v46;
  unint64_t v47;
  int v48;
  unint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  unint64_t v52;
  int v53;
  int v54;
  CFNumberRef v55;
  CFNumberRef v56;
  CFNumberRef v57;
  CFNumberRef v58;
  CFNumberRef v59;
  CFNumberRef v60;
  CFNumberRef v61;
  CFNumberRef v62;
  CFNumberRef v63;
  CFNumberRef v64;
  CFNumberRef v65;
  CFNumberRef v66;
  CFNumberRef v67;
  int v68;
  int v69;
  uint64_t v70;
  NSObject *v71;
  int v72;
  int v73;
  int v74;
  unsigned int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  float v87;
  const CFDictionaryKeyCallBacks *v88;
  const CFDictionaryValueCallBacks *v89;
  __CFDictionary *Mutable;
  __CFDictionary *v91;
  __CFDictionary *v92;
  uint64_t v93;
  uint64_t v94;
  _DWORD *v95;
  uint64_t v96;
  CFStringRef v97;
  CFNumberRef v98;
  CFNumberRef v99;
  CFNumberRef v100;
  uint64_t v101;
  _DWORD *v102;
  uint64_t v103;
  NSObject *v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  CFNumberRef v108;
  CFNumberRef v109;
  CFNumberRef v110;
  CFNumberRef v111;
  CFNumberRef v112;
  CFNumberRef v113;
  CFNumberRef v114;
  CFNumberRef v115;
  CFNumberRef v116;
  CFNumberRef v117;
  CFNumberRef v118;
  CFNumberRef v119;
  CFNumberRef v120;
  CFNumberRef v121;
  CFNumberRef v122;
  CFNumberRef v123;
  CFNumberRef v124;
  __CFDictionary *theDict;
  _OWORD *v126;
  _OWORD *v127;
  _DWORD *v128;
  __CFDictionary *v129;
  uint64_t v130;
  uint64_t v131;
  int v132;
  double v133;
  double v134;
  _BYTE valuePtr[12];
  __int16 v136;
  const char *v137;
  __int16 v138;
  int v139;
  __int16 v140;
  _BYTE v141[10];
  _BYTE v142[6];
  uint64_t v143;
  _BYTE v144[10];
  __int16 v145;
  double v146;
  __int16 v147;
  int v148;
  __int16 v149;
  double v150;
  __int16 v151;
  int v152;
  __int16 v153;
  int v154;
  __int16 v155;
  int v156;
  __int16 v157;
  uint64_t v158;
  __int16 v159;
  uint64_t v160;
  __int16 v161;
  uint64_t v162;
  __int16 v163;
  uint64_t v164;
  __int16 v165;
  double v166;
  __int16 v167;
  int v168;
  __int16 v169;
  int v170;
  uint64_t v171;

  v171 = *MEMORY[0x1E0C80C00];
  result = CheckInHandleDebug();
  if (result)
  {
    v5 = result;
    v6 = result + 17780;
    v7 = atomic_load((unsigned __int8 *)(result + 18264));
    if ((v7 & 1) != 0)
    {
      v8 = (_WORD *)(result + 16486);
      v134 = 0.0;
      VideoTransmitter_GetFramerate(1.0, *(_QWORD *)(a1 + 32), &v134);
      v10 = v134;
      if (v134 > 0.0)
      {
        ++*(_WORD *)(v5 + 16558);
        LOWORD(v9) = *(_WORD *)(v5 + 16552);
        *(double *)&v11 = v10 + (double)v9;
        *(_WORD *)(v5 + 16552) = (int)*(double *)&v11;
        LOWORD(v11) = *(_WORD *)(v5 + 16554);
        v12 = (double)v11;
        v13 = (int)v10;
        if (v10 > v12)
          *(_WORD *)(v5 + 16554) = v13;
        LOWORD(v12) = *(_WORD *)(v5 + 16556);
        if (v10 < (double)*(unint64_t *)&v12)
          *(_WORD *)(v5 + 16556) = v13;
      }
      v133 = 0.0;
      VideoTransmitter_GetBitrate(1.0, *(_QWORD *)(a1 + 32), &v133);
      v14 = v133;
      if (*(double *)(v5 + 368) < v133)
        *(double *)(v5 + 368) = v133;
      if (*(double *)(v5 + 376) > v14)
        *(double *)(v5 + 376) = v14;
      if (a2)
      {
        v15 = (double *)(v5 + 328);
        _VideoTransmitter_GetBitrates(v5, (double *)(v5 + 328), (double *)(v5 + 336), (double *)(v5 + 344), (double *)(v5 + 352), (double *)(v5 + 360), (float)*(unsigned int *)(v5 + 12));
        v16 = (__CFDictionary *)selectDestinationForRTMetrics();
        v17 = *(_DWORD *)(v5 + 12);
        v18 = 0.0;
        v19 = 0.0;
        v20 = 0.0;
        if (v17)
        {
          v19 = (double)*(int *)(v5 + 320) / (double)v17;
          v20 = (double)*(int *)(v5 + 324) / (double)v17;
        }
        *(_DWORD *)valuePtr = (v19 / 1000.0 + 0.5);
        v21 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v22 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("VTxRHDRVCP"), v22);
        CFRelease(v22);
        *(_DWORD *)valuePtr = (v20 / 1000.0 + 0.5);
        v23 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("VTxRFECVCP"), v23);
        CFRelease(v23);
        if (*v15 > 0.0)
          v18 = *(double *)(v5 + 344) * 100.0 / *v15;
        v24 = v18;
        *(float *)valuePtr = v24;
        v25 = CFNumberCreate(v21, kCFNumberFloat32Type, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("VTxFECOverhead"), v25);
        CFRelease(v25);
        *(_DWORD *)valuePtr = (*(double *)(v5 + 328) / 1000.0 + 0.5);
        v26 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("VTxRMedia"), v26);
        CFRelease(v26);
        *(_DWORD *)valuePtr = (*(double *)(v5 + 336) / 1000.0 + 0.5);
        v27 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("VTxRHDR"), v27);
        CFRelease(v27);
        *(_DWORD *)valuePtr = (*(double *)(v5 + 344) / 1000.0 + 0.5);
        v28 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("VTxRFEC"), v28);
        CFRelease(v28);
        *(_DWORD *)valuePtr = (*(double *)(v5 + 360) / 1000.0 + 0.5);
        v29 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("VTxR"), v29);
        CFRelease(v29);
        *(_DWORD *)valuePtr = (*(double *)(v5 + 368) / 1000.0 + 0.5);
        v30 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("VTxRMax"), v30);
        CFRelease(v30);
        *(_DWORD *)valuePtr = (*(double *)(v5 + 376) / 1000.0 + 0.5);
        v31 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("VTxRMin"), v31);
        CFRelease(v31);
        *(_DWORD *)valuePtr = (int)((double)*(int *)(v5 + 36) / 1000.0 + 0.5);
        v32 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("VTxRTarget"), v32);
        CFRelease(v32);
        *(_DWORD *)valuePtr = (*(double *)(v5 + 352) / 1000.0 + 0.5);
        v33 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("VTxMetadataOverhead"), v33);
        CFRelease(v33);
        *(_DWORD *)valuePtr = *(_DWORD *)(v5 + 16);
        v34 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("CodecPayload"), v34);
        CFRelease(v34);
        *(_DWORD *)valuePtr = *(_DWORD *)(v6 + 320);
        v35 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("QID"), v35);
        CFRelease(v35);
        if (*(_WORD *)(v5 + 16558))
        {
          LOWORD(v36) = *(_WORD *)(v5 + 16552);
          *(float *)&v36 = (double)v36 / (double)*(unsigned __int16 *)(v5 + 16558);
        }
        else
        {
          LODWORD(v36) = 0;
        }
        *(_DWORD *)valuePtr = v36;
        v37 = CFNumberCreate(v21, kCFNumberFloat32Type, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("ATFr"), v37);
        CFRelease(v37);
        *(_DWORD *)valuePtr = *(unsigned __int16 *)(v5 + 16554);
        v38 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("XTFr"), v38);
        CFRelease(v38);
        v39 = *(unsigned __int16 *)(v5 + 16556);
        if (v39 == 0xFFFF)
          v39 = 0;
        *(_DWORD *)valuePtr = v39;
        v40 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("NTFr"), v40);
        CFRelease(v40);
        *(_DWORD *)valuePtr = *(_DWORD *)(v5 + 4432);
        v41 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("VFEC"), v41);
        CFRelease(v41);
        *(_DWORD *)valuePtr = (unsigned __int16)*v8;
        v42 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("AFECL"), v42);
        CFRelease(v42);
        *v8 = 0;
        *(_DWORD *)valuePtr = (int)(VCFECGenerator_GetProcessingAverageTime(*(_QWORD *)(v5 + 18160)) * 10000000.0);
        v43 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("VTxFECTime"), v43);
        CFRelease(v43);
        if (*(_DWORD *)(v6 + 476))
        {
          *(_DWORD *)valuePtr = *(_DWORD *)(v6 + 476);
          v44 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
          CFDictionaryAddValue(v16, CFSTR("LTRAckRx"), v44);
          CFRelease(v44);
          *(_DWORD *)(v6 + 476) = 0;
        }
        if (*(_DWORD *)(v6 + 480))
        {
          *(_DWORD *)valuePtr = *(_DWORD *)(v6 + 480);
          v45 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
          CFDictionaryAddValue(v16, CFSTR("RtcpAppLTRAckRx"), v45);
          CFRelease(v45);
          *(_DWORD *)(v6 + 480) = 0;
        }
        v46 = *(_QWORD *)(v5 + 18272);
        if (v46 && *(_BYTE *)(v6 + 406))
          VCNACKConsumer_GetStatistics(v46, v16);
        *(_OWORD *)(v5 + 368) = xmmword_1D910BA00;
        *(_QWORD *)(v5 + 16552) = 0xFFFF00000000;
        if (*(_DWORD *)(v5 + 1600))
        {
          v47 = 0;
          v48 = 0;
          v49 = 0;
          v50 = (uint64_t *)(v5 + 520);
          do
          {
            v132 = 0;
            RTPGetPacketSent(*v50, &v132);
            v48 += v132;
            *(_QWORD *)valuePtr = 0;
            v51 = *v50;
            v50 += 15;
            RTPGetUplinkReportingStats(v51, valuePtr);
            v49 += *(_QWORD *)valuePtr;
            ++v47;
          }
          while (v47 < *(unsigned int *)(v5 + 1600));
        }
        else
        {
          v49 = 0;
          v48 = 0;
        }
        v128 = (_DWORD *)(v5 + 16896);
        v52 = *(_QWORD *)(v5 + 18072);
        if (v49 <= v52)
          LODWORD(v52) = 0;
        v53 = *(_DWORD *)(v5 + 264);
        v54 = v53 - *(_DWORD *)(v5 + 268);
        *(_DWORD *)(v5 + 268) = v53;
        *(_DWORD *)valuePtr = v49 - v52;
        v55 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("RTPUplinkIngressVideoPkts"), v55);
        CFRelease(v55);
        *(_DWORD *)valuePtr = v48;
        v56 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("VPS"), v56);
        CFRelease(v56);
        *(_DWORD *)valuePtr = *(_DWORD *)(v5 + 16560);
        v57 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("VMediaPktSent"), v57);
        CFRelease(v57);
        *(_DWORD *)valuePtr = *(_DWORD *)(v5 + 16512);
        v58 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("VNWET"), v58);
        CFRelease(v58);
        *(_DWORD *)valuePtr = *(_DWORD *)v6;
        v59 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("VFCCnt"), v59);
        CFRelease(v59);
        *(_DWORD *)valuePtr = *(_DWORD *)(v6 + 28);
        v60 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("IdleFrameCount"), v60);
        CFRelease(v60);
        *(_DWORD *)valuePtr = *(_DWORD *)(v6 + 8);
        v61 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("EncInFrameCnt"), v61);
        CFRelease(v61);
        *(_DWORD *)valuePtr = *(_DWORD *)(v6 + 12);
        v62 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("EncOutFrameCnt"), v62);
        CFRelease(v62);
        *(_DWORD *)valuePtr = *(_DWORD *)(v6 + 24);
        v63 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("VTxNoFecTF"), v63);
        CFRelease(v63);
        *(_DWORD *)valuePtr = *(_DWORD *)(v5 + 16592);
        v64 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("VTxSinglePktFrame"), v64);
        CFRelease(v64);
        *(_DWORD *)valuePtr = v53;
        v65 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("VTxKeyFramesSent"), v65);
        CFRelease(v65);
        *(_DWORD *)valuePtr = *(_DWORD *)(v5 + 272);
        v66 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v16, CFSTR("VTxTotalIDR"), v66);
        CFRelease(v66);
        *(_DWORD *)valuePtr = v54;
        v67 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        v129 = v16;
        CFDictionaryAddValue(v16, CFSTR("VTxDeltaKeyFramesSent"), v67);
        CFRelease(v67);
        v68 = *(_DWORD *)(v6 + 12);
        v69 = *(_DWORD *)(v6 + 308);
        if ((int)VRTraceGetErrorLogLevelForModule() > 5)
        {
          v70 = VRTraceErrorLogLevelToCSTR();
          v71 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v72 = *(unsigned __int16 *)(v5 + 440);
            v73 = *(_DWORD *)v6;
            v74 = *(_DWORD *)(v6 + 4);
            v75 = *(_DWORD *)(v5 + 12);
            v76 = *(_DWORD *)(v6 + 8);
            v77 = *(_DWORD *)(v6 + 12);
            v78 = *(_DWORD *)(v6 + 16);
            v79 = *(_DWORD *)(v6 + 20);
            v80 = *(_DWORD *)(v6 + 24);
            v81 = *(_DWORD *)(v5 + 16592);
            *(_DWORD *)valuePtr = 136320514;
            v82 = *(_QWORD *)(v5 + 328);
            v83 = *(_QWORD *)(v5 + 336);
            v84 = *(_QWORD *)(v5 + 344);
            v85 = *(_QWORD *)(v5 + 360);
            v86 = *(_DWORD *)(v5 + 4380);
            *(_QWORD *)&valuePtr[4] = v70;
            v87 = (float)v75;
            v136 = 2080;
            v137 = "_VideoTransmitter_ReportingRegisterPeriodicTask_block_invoke";
            v138 = 1024;
            v139 = 815;
            v140 = 1024;
            *(_DWORD *)v141 = v72;
            *(_WORD *)&v141[4] = 1024;
            *(_DWORD *)&v141[6] = v73;
            *(_WORD *)v142 = 1024;
            *(_DWORD *)&v142[2] = v74;
            LOWORD(v143) = 1024;
            *(_DWORD *)((char *)&v143 + 2) = v78;
            HIWORD(v143) = 1024;
            *(_DWORD *)v144 = v76;
            *(_WORD *)&v144[4] = 1024;
            *(_DWORD *)&v144[6] = v68 / v69;
            v145 = 2048;
            v146 = (float)((float)(v68 / v69) / v87);
            v147 = 1024;
            v148 = v77;
            v149 = 2048;
            v150 = (float)((float)v77 / v87);
            v151 = 1024;
            v152 = v79;
            v153 = 1024;
            v154 = v80;
            v155 = 1024;
            v156 = v81;
            v157 = 2048;
            v158 = v82;
            v159 = 2048;
            v160 = v83;
            v161 = 2048;
            v162 = v84;
            v163 = 2048;
            v164 = v85;
            v165 = 2048;
            v166 = v18;
            v167 = 1024;
            v168 = v86;
            v169 = 1024;
            v170 = v54;
            _os_log_impl(&dword_1D8A54000, v71, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @=@ Health: VideoTransmitter streamID=%d, toBeBufferedFrameCount=%d, bufferedFrameCount=%d, encoderProcCount=%d, toBeEncodedFrameCount=%d, encodedFullFrameCount=%d, encodedFullFrameRate=%f, encodedFrameCount=%d, encodedFrameRate=%f, transmittedFrameCount=%d, transmittedNonFECFrameCount=%d, singlePacketFrameCount=%d, currentMediaBitrate=%f, currentHeaderBitrate=%f, currentFECBitrate=%f, currentTotalBitrate=%f, currentFECOverhead=%2.4f targetBitrate=%d deltaKeyFramesSent=%d", valuePtr, 0xAAu);
          }
        }
        v127 = (_OWORD *)(v5 + 408);
        *(_QWORD *)(v5 + 360) = 0;
        *(_DWORD *)(v5 + 16592) = 0;
        *(_OWORD *)(v5 + 320) = 0u;
        *(_OWORD *)(v5 + 336) = 0u;
        *(_OWORD *)v6 = 0u;
        *(_OWORD *)(v6 + 16) = 0u;
        v88 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
        v89 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
        v131 = v5;
        theDict = CFDictionaryCreateMutable(v21, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v126 = (_OWORD *)(v5 + 17816);
        Mutable = CFDictionaryCreateMutable(v21, 0, v88, v89);
        v91 = CFDictionaryCreateMutable(v21, 0, v88, v89);
        v92 = CFDictionaryCreateMutable(v21, 0, v88, v89);
        v93 = v6;
        v94 = 0;
        v130 = v93;
        v95 = (_DWORD *)(v93 + 52);
        do
        {
          if (*v95)
          {
            v96 = FECUtil_FECLevelofProtectionToFECPercentage(v94);
            v97 = CFStringCreateWithFormat(v21, 0, CFSTR("%u"), v96);
            *(_DWORD *)valuePtr = *((_QWORD *)v95 - 2);
            v98 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
            CFDictionaryAddValue(Mutable, v97, v98);
            CFRelease(v98);
            *(_DWORD *)valuePtr = *((_QWORD *)v95 - 1);
            v99 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
            CFDictionaryAddValue(v91, v97, v99);
            CFRelease(v99);
            *(_DWORD *)valuePtr = *v95;
            v100 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
            CFDictionaryAddValue(v92, v97, v100);
            CFRelease(v100);
            CFRelease(v97);
          }
          ++v94;
          v95 += 10;
        }
        while (v94 != 6);
        CFDictionaryAddValue(theDict, CFSTR("VFecDB"), Mutable);
        CFDictionaryAddValue(theDict, CFSTR("VFecPB"), v91);
        CFDictionaryAddValue(theDict, CFSTR("VFecTF"), v92);
        CFRelease(Mutable);
        CFRelease(v91);
        CFRelease(v92);
        CFDictionaryAddValue(v129, CFSTR("VTxFecStats"), theDict);
        CFRelease(theDict);
        v101 = 0;
        v102 = (_DWORD *)(v130 + 52);
        do
        {
          if (*v102 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v103 = VRTraceErrorLogLevelToCSTR();
            v104 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v105 = *((_QWORD *)v102 - 2);
              v106 = *((_QWORD *)v102 - 1);
              v107 = *v102;
              *(_DWORD *)valuePtr = 136316930;
              *(_QWORD *)&valuePtr[4] = v103;
              v136 = 2080;
              v137 = "_VideoTransmitter_ReportingRegisterPeriodicTask_block_invoke";
              v138 = 1024;
              v139 = 841;
              v140 = 2048;
              *(_QWORD *)v141 = v131;
              *(_WORD *)&v141[8] = 1024;
              *(_DWORD *)v142 = v101;
              *(_WORD *)&v142[4] = 2048;
              v143 = v105;
              *(_WORD *)v144 = 2048;
              *(_QWORD *)&v144[2] = v106;
              v145 = 1024;
              LODWORD(v146) = v107;
              _os_log_impl(&dword_1D8A54000, v104, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoTransmitter[%p] FEC health report: fecLevel:%d data:%llu, parity:%llu, totalFrame:%d", valuePtr, 0x46u);
            }
          }
          ++v101;
          v102 += 10;
        }
        while (v101 != 6);
        v126[13] = 0u;
        v126[14] = 0u;
        v126[11] = 0u;
        v126[12] = 0u;
        v126[9] = 0u;
        v126[10] = 0u;
        v126[7] = 0u;
        v126[8] = 0u;
        v126[5] = 0u;
        v126[6] = 0u;
        v126[3] = 0u;
        v126[4] = 0u;
        v126[1] = 0u;
        v126[2] = 0u;
        *v126 = 0u;
        *(_DWORD *)valuePtr = 0;
        v108 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, CFSTR("AVPEL"), v108);
        CFRelease(v108);
        *(_DWORD *)valuePtr = 0;
        v109 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, CFSTR("AVEL"), v109);
        CFRelease(v109);
        *(_DWORD *)valuePtr = 0;
        v110 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, CFSTR("AVPL"), v110);
        CFRelease(v110);
        *(_DWORD *)valuePtr = 0;
        v111 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, CFSTR("APSL"), v111);
        CFRelease(v111);
        *(_DWORD *)valuePtr = 0;
        v112 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, CFSTR("ATSL"), v112);
        CFRelease(v112);
        *(_DWORD *)valuePtr = 0;
        v113 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, CFSTR("MVPEL"), v113);
        CFRelease(v113);
        *(_DWORD *)valuePtr = 0;
        v114 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, CFSTR("MVEL"), v114);
        CFRelease(v114);
        *(_DWORD *)valuePtr = 0;
        v115 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, CFSTR("MVEL"), v115);
        CFRelease(v115);
        *(_DWORD *)valuePtr = 0;
        v116 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, CFSTR("MPSL"), v116);
        CFRelease(v116);
        *(_DWORD *)valuePtr = 0;
        v117 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, CFSTR("MTSL"), v117);
        CFRelease(v117);
        pthread_mutex_lock((pthread_mutex_t *)(v131 + 16832));
        *(_DWORD *)valuePtr = *v128;
        v118 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, CFSTR("AFL"), v118);
        CFRelease(v118);
        *(_DWORD *)valuePtr = v128[1];
        v119 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, CFSTR("VFL"), v119);
        CFRelease(v119);
        *(_QWORD *)(v131 + 16896) = 0;
        pthread_mutex_unlock((pthread_mutex_t *)(v131 + 16832));
        *(_DWORD *)valuePtr = *(_DWORD *)(v131 + 424);
        v120 = CFNumberCreate(v21, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(v129, CFSTR("AVHTDCount"), v120);
        CFRelease(v120);
        *(_QWORD *)valuePtr = *(_QWORD *)(v131 + 408);
        v121 = CFNumberCreate(v21, kCFNumberDoubleType, valuePtr);
        CFDictionaryAddValue(v129, CFSTR("AVHTDMax"), v121);
        CFRelease(v121);
        *(_QWORD *)valuePtr = *(_QWORD *)(v131 + 416);
        v122 = CFNumberCreate(v21, kCFNumberDoubleType, valuePtr);
        CFDictionaryAddValue(v129, CFSTR("AVHTDMin"), v122);
        CFRelease(v122);
        *(_QWORD *)valuePtr = *(_QWORD *)(v131 + 400);
        v123 = CFNumberCreate(v21, kCFNumberDoubleType, valuePtr);
        CFDictionaryAddValue(v129, CFSTR("AVHTDSum"), v123);
        CFRelease(v123);
        *(_QWORD *)valuePtr = *(_QWORD *)(v131 + 392);
        v124 = CFNumberCreate(v21, kCFNumberDoubleType, valuePtr);
        CFDictionaryAddValue(v129, CFSTR("AVHTDAbsSum"), v124);
        CFRelease(v124);
        *(_DWORD *)(v131 + 424) = 0;
        *v127 = xmmword_1D910C040;
        *(_QWORD *)(v131 + 392) = 0;
        *(_QWORD *)(v131 + 400) = 0;
        *(_QWORD *)(v131 + 18072) = v49;
      }
      return CheckOutHandleDebug();
    }
    else
    {
      return CheckOutHandleDebug();
    }
  }
  return result;
}

int32x2_t ___VideoTransmitter_RegisterStatistics_block_invoke(uint64_t a1, uint64_t a2)
{
  int32x2_t *v2;
  int32x2_t v3;
  int32x2_t result;

  if (*(_DWORD *)a2 == 3)
  {
    v2 = *(int32x2_t **)(a1 + 32);
    v3 = *(int32x2_t *)(a2 + 48);
    v2[2258].i32[0] = *(double *)(a2 + 40);
    result = vrev64_s32(v3);
    v2[2257] = result;
  }
  return result;
}

@end
