@implementation EstablishCurrentEventForCurrentItem

void __fpic_EstablishCurrentEventForCurrentItem_block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  uint64_t DerivedStorage;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, _BYTE *);
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  CFIndex Count;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  CFIndex v16;
  int v17;
  const void *ValueAtIndex;
  uint64_t v19;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v21;
  CMTimeEpoch v22;
  double v23;
  int v24;
  unsigned int v25;
  int v26;
  CMTimeEpoch v27;
  uint64_t v28;
  CMTime *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  int v33;
  int v34;
  double v35;
  int v36;
  int v37;
  CMTimeEpoch epoch;
  const void *v39;
  uint64_t v40;
  uint64_t v41;
  _OWORD *v42;
  __int128 v43;
  __int128 v44;
  NSObject *v45;
  unsigned int v46;
  unsigned int v47;
  Float64 v48;
  int v49;
  NSObject *v50;
  unsigned int v51;
  unsigned int v52;
  Float64 Seconds;
  Float64 v54;
  CFIndex v55;
  const void *v56;
  uint64_t v57;
  _BOOL4 v58;
  int v59;
  CFTypeRef *v60;
  _BOOL4 v61;
  uint64_t v62;
  _BOOL4 v63;
  BOOL v64;
  NSObject *v65;
  unsigned int value;
  unsigned int v67;
  Float64 v68;
  double v69;
  int v70;
  BOOL v71;
  const char *v72;
  char v73;
  __int128 v74;
  const void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  uint64_t v82;
  __int128 v83;
  uint64_t v84;
  uint64_t v85;
  CMTimeEpoch v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  unsigned int v90;
  unsigned int v91;
  Float64 v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const void *v97;
  uint64_t v98;
  int v99;
  CFIndex i;
  CFIndex v101;
  const void *v102;
  uint64_t v103;
  const __CFDictionary *v104;
  CMTime *v105;
  NSObject *v106;
  unsigned int v107;
  unsigned int v108;
  Float64 v109;
  Float64 v110;
  int v111;
  uint64_t v112;
  int v113;
  char v114;
  NSObject *v115;
  unsigned int v116;
  unsigned int v117;
  CFTypeRef *v118;
  uint64_t v119;
  uint64_t v120;
  __int128 v121;
  CFIndex v122;
  uint64_t v123;
  unsigned __int8 SnapOptions;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  __int128 v129;
  uint64_t v130;
  uint64_t v131;
  CFIndex v132;
  CFIndex v133;
  uint64_t v134;
  const void *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  int v139;
  char v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  __int128 v144;
  uint64_t v145;
  __int128 v146;
  CFStringRef v147;
  CFStringRef v148;
  NSObject *v149;
  unsigned int v150;
  unsigned int v151;
  uint64_t v152;
  NSObject *v153;
  unsigned int v154;
  unsigned int v155;
  uint64_t v156;
  uint64_t v157;
  __int128 v158;
  const __CFArray *v159;
  const __CFArray *v160;
  CFIndex v161;
  const void *v162;
  uint64_t v163;
  uint64_t v164;
  __int128 v165;
  CFTypeRef *v166;
  CFStringRef MomentDesc;
  CFStringRef v168;
  NSObject *v169;
  unsigned int v170;
  unsigned int v171;
  const __CFArray *v172;
  CFTypeRef *v173;
  _BOOL4 v174;
  uint64_t FirstIndexOfValue;
  BOOL v176;
  CFIndex v177;
  const void *CurrentlyPlayingEvent;
  CFTypeRef *v179;
  char v180;
  uint64_t v181;
  uint64_t v182;
  CMTimeEpoch v183;
  uint64_t v184;
  __int128 v185;
  int v186;
  __int16 v187;
  int v188;
  __int16 v189;
  __int128 v190;
  CMTimeEpoch v191;
  __int128 v192;
  __int128 v193;
  uint64_t v194;
  os_log_type_t type;
  _BYTE v196[32];
  uint64_t v197;
  _BYTE time[32];
  uint64_t v199;
  CMTime v200;
  os_log_type_t v201[8];
  _BYTE rhs[32];
  _BYTE v203[10];
  __int16 v204;
  _BYTE v205[14];
  __int16 v206;
  uint64_t v207;
  _BYTE lhs[32];
  uint64_t v209;
  CMTime v210;
  CMTime v211;
  uint64_t v212;

  v212 = *MEMORY[0x1E0C80C00];
  v2 = *(const void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v5 = DerivedStorage;
  v6 = *(_QWORD *)(DerivedStorage + 152);
  if (v6 && !*(_BYTE *)(DerivedStorage + 975))
  {
    *(_OWORD *)time = *MEMORY[0x1E0CA2E68];
    *(_QWORD *)&time[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v7 = *(void (**)(uint64_t, _BYTE *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
    if (v7)
      v7(v6, time);
    v8 = CMBaseObjectGetDerivedStorage();
    if (*(_BYTE *)(v8 + 974) && !*(_BYTE *)(v8 + 973))
    {
      *(_BYTE *)(v5 + 975) = 1;
    }
    else
    {
      v9 = *(_QWORD *)(v5 + 152);
      *(_OWORD *)lhs = *(_OWORD *)time;
      *(_QWORD *)&lhs[16] = *(_QWORD *)&time[16];
      *(_OWORD *)rhs = kMomentsAreCloseThreshold;
      *(_QWORD *)&rhs[16] = 0;
      CMTimeAdd((CMTime *)v196, (CMTime *)lhs, (CMTime *)rhs);
      v10 = fpic_BufferIncludesTime(v9, (CMTime *)v196, MEMORY[0x1E0CA2E68]);
      *(_BYTE *)(v5 + 975) = v10;
      if (!v10)
        goto LABEL_23;
    }
    v11 = CMBaseObjectGetDerivedStorage();
    Count = CFArrayGetCount(*(CFArrayRef *)(v11 + 184));
    if (*(_BYTE *)(v11 + 975))
    {
      v13 = Count;
      if ((*(_BYTE *)(v11 + 564) & 1) == 0)
      {
        v14 = *(_QWORD *)(v11 + 152);
        v15 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
        if (v15)
          v15(v14, v11 + 552);
      }
      if (v13 >= 1)
      {
        v184 = v5;
        v16 = 0;
        v17 = 0;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(v11 + 184), v16);
          v19 = (*(uint64_t (**)(const void *, uint64_t, const void *))(v11 + 80))(v2, v3, ValueAtIndex);
          if (FigPlayerInterstitialEventIsPreRoll(v19))
          {
            *(_OWORD *)lhs = *(_OWORD *)(v11 + 552);
            *(_QWORD *)&lhs[16] = *(_QWORD *)(v11 + 568);
            FigPlayerInterstitialEventSetStartTime(v19, (uint64_t)lhs);
            v17 = 1;
            fpic_EnsureEventHasResolvedProperties(v2, v3, ValueAtIndex, 1);
          }
          ++v16;
        }
        while (v13 != v16);
        v5 = v184;
        if (v17 && dword_1EE2A33C8)
        {
          LODWORD(v192) = 0;
          LOBYTE(v211.value) = 0;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, v211.value);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v5 = v184;
        }
      }
    }
    fpic_PostNotification(v5, (uint64_t)CFSTR("fpiResolvePropertiesChange"), v2, 0);
  }
LABEL_23:
  if (!*(_BYTE *)(v5 + 975))
    return;
  v194 = 0;
  v192 = 0u;
  v193 = 0u;
  fpic_GetEffectiveCurrentItemMoment(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 152), (uint64_t)&v192);
  v189 = 0;
  v188 = 0;
  v185 = *MEMORY[0x1E0CA2E18];
  v190 = *MEMORY[0x1E0CA2E18];
  v183 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v191 = v183;
  v211.value = v192;
  v21 = HIDWORD(v192);
  v211.timescale = DWORD2(v192);
  v23 = *((double *)&v193 + 1);
  v22 = v193;
  v24 = v194;
  LODWORD(v200.value) = *(_DWORD *)((char *)&v194 + 2);
  WORD2(v200.value) = HIWORD(v194);
  v210.value = *(_QWORD *)(a1 + 64);
  v25 = *(_DWORD *)(a1 + 76);
  v210.timescale = *(_DWORD *)(a1 + 72);
  v26 = BYTE1(v194);
  if ((v25 & 1) == 0)
    goto LABEL_28;
  if (!(_BYTE)v194)
    goto LABEL_28;
  v27 = *(_QWORD *)(a1 + 80);
  *(_OWORD *)lhs = v192;
  *(_QWORD *)&lhs[16] = v193;
  *(_QWORD *)rhs = *(_QWORD *)(a1 + 64);
  *(_DWORD *)&rhs[8] = *(_DWORD *)(a1 + 72);
  *(_DWORD *)&rhs[12] = v25;
  *(_QWORD *)&rhs[16] = v27;
  if (CMTimeCompare((CMTime *)lhs, (CMTime *)rhs) < 1)
    goto LABEL_28;
  *(_QWORD *)rhs = v211.value;
  *(_DWORD *)&rhs[8] = v211.timescale;
  *(_DWORD *)&rhs[12] = v21;
  *(_QWORD *)&rhs[16] = v22;
  *(_QWORD *)time = v210.value;
  *(_QWORD *)&time[8] = __PAIR64__(v25, v210.timescale);
  *(_QWORD *)&time[16] = v27;
  CMTimeSubtract((CMTime *)lhs, (CMTime *)rhs, (CMTime *)time);
  *(_OWORD *)rhs = kMaxNotificationDelay;
  *(_QWORD *)&rhs[16] = 0;
  if (CMTimeCompare((CMTime *)lhs, (CMTime *)rhs) < 0)
  {
    memset(rhs, 0, 24);
    *(_QWORD *)time = v211.value;
    *(_QWORD *)&time[8] = __PAIR64__(v21, v211.timescale);
    *(_QWORD *)&time[16] = v22;
    *(_QWORD *)v196 = v210.value;
    *(_QWORD *)&v196[8] = __PAIR64__(v25, v210.timescale);
    *(_QWORD *)&v196[16] = v27;
    CMTimeSubtract((CMTime *)rhs, (CMTime *)time, (CMTime *)v196);
    v211.value = v210.value;
    v211.timescale = v210.timescale;
    if (v26)
    {
      *(_OWORD *)time = *(_OWORD *)rhs;
      *(_QWORD *)&time[16] = *(_QWORD *)&rhs[16];
      v23 = v23 - CMTimeGetSeconds((CMTime *)time);
    }
  }
  else
  {
LABEL_28:
    v25 = v21;
    v27 = v22;
  }
  *(_QWORD *)&v192 = v211.value;
  *(_DWORD *)((char *)&v194 + 2) = v200.value;
  HIWORD(v194) = WORD2(v200.value);
  *((_QWORD *)&v192 + 1) = __PAIR64__(v25, v211.timescale);
  *(_QWORD *)&v193 = v27;
  *((double *)&v193 + 1) = v23;
  LOBYTE(v194) = v24;
  BYTE1(v194) = v26;
  *(_OWORD *)&v200.value = v192;
  v200.epoch = v27;
  v186 = *(_DWORD *)((char *)&v194 + 2);
  v187 = HIWORD(v194);
  v28 = CMBaseObjectGetDerivedStorage();
  v199 = 0;
  memset(time, 0, sizeof(time));
  if ((*(_BYTE *)(v28 + 908) & 1) == 0 || *(_BYTE *)(v28 + 920))
    goto LABEL_48;
  v29 = (CMTime *)(v28 + 896);
  v30 = CMBaseObjectGetDerivedStorage();
  v31 = v30 + 240;
  if (!*(_BYTE *)(v30 + 272) && !*(_BYTE *)(v30 + 273))
    v31 = v30 + 200;
  v211 = *(CMTime *)v31;
  v32 = *(double *)(v31 + 24);
  v33 = *(unsigned __int8 *)(v31 + 32);
  v34 = *(unsigned __int8 *)(v31 + 33);
  *(_DWORD *)((char *)&v197 + 2) = *(_DWORD *)(v31 + 34);
  HIWORD(v197) = *(_WORD *)(v31 + 38);
  v210 = *v29;
  *(CMTime *)rhs = v200;
  *(double *)&rhs[24] = v23;
  v203[0] = v24;
  v203[1] = v26;
  *(_DWORD *)&v203[2] = v186;
  *(_WORD *)&v203[6] = v187;
  fpic_MakeMomentFromTime((uint64_t)&v210, (uint64_t)rhs, (uint64_t)lhs);
  v210 = *(CMTime *)lhs;
  v35 = *(double *)&lhs[24];
  v36 = v209;
  v37 = BYTE1(v209);
  *(_DWORD *)v201 = *(_DWORD *)((char *)&v209 + 2);
  *(_WORD *)&v201[4] = HIWORD(v209);
  fpic_AddTimeToMoment((uint64_t)lhs, &kJumpForwardTolerance, (uint64_t)time);
  *(CMTime *)lhs = v210;
  *(double *)&lhs[24] = v35;
  LOBYTE(v209) = v36;
  BYTE1(v209) = v37;
  *(_DWORD *)((char *)&v209 + 2) = *(_DWORD *)v201;
  HIWORD(v209) = *(_WORD *)&v201[4];
  *(CMTime *)v196 = v211;
  *(double *)&v196[24] = v32;
  LOBYTE(v197) = v33;
  BYTE1(v197) = v34;
  if (!fpic_MomentGreaterThan((uint64_t)lhs, (uint64_t)v196))
  {
    v32 = v35;
    v34 = v37;
    if (v24)
      goto LABEL_43;
    goto LABEL_44;
  }
  if (v33)
  {
    *(_OWORD *)rhs = *(_OWORD *)&v211.value;
    epoch = v211.epoch;
LABEL_37:
    *(_QWORD *)&rhs[16] = epoch;
    goto LABEL_42;
  }
  if (!v34)
  {
    *(_OWORD *)rhs = v185;
    epoch = v183;
    goto LABEL_37;
  }
  *(CMTime *)lhs = v210;
  *(double *)&lhs[24] = v35;
  LOBYTE(v209) = v36;
  BYTE1(v209) = v37;
  *(_DWORD *)((char *)&v209 + 2) = *(_DWORD *)v201;
  HIWORD(v209) = *(_WORD *)&v201[4];
  FigCreateTimeWithDateAndMoment((uint64_t)lhs, (uint64_t)rhs, v32);
LABEL_42:
  v210 = *(CMTime *)rhs;
  if (v24)
  {
LABEL_43:
    if (v36)
      goto LABEL_46;
  }
LABEL_44:
  if (!v26 || !v34)
    goto LABEL_48;
LABEL_46:
  *(CMTime *)lhs = v200;
  *(double *)&lhs[24] = v23;
  LOBYTE(v209) = v24;
  BYTE1(v209) = v26;
  *(_DWORD *)((char *)&v209 + 2) = v186;
  HIWORD(v209) = v187;
  *(CMTime *)rhs = v210;
  *(double *)&rhs[24] = v32;
  v203[0] = v36;
  v203[1] = v34;
  *(_DWORD *)&v203[2] = *(_DWORD *)v201;
  *(_WORD *)&v203[6] = *(_WORD *)&v201[4];
  if (!fpic_MomentGreaterThan((uint64_t)lhs, (uint64_t)rhs))
    goto LABEL_48;
  *(CMTime *)lhs = v200;
  *(double *)&lhs[24] = v23;
  LOBYTE(v209) = v24;
  BYTE1(v209) = v26;
  *(_DWORD *)((char *)&v209 + 2) = v186;
  HIWORD(v209) = v187;
  *(_OWORD *)rhs = *(_OWORD *)time;
  *(_OWORD *)&rhs[16] = *(_OWORD *)&time[16];
  *(_QWORD *)v203 = v199;
  if (fpic_MomentGreaterThan((uint64_t)lhs, (uint64_t)rhs))
  {
LABEL_48:
    LOBYTE(v34) = v26;
    LOBYTE(v36) = v24;
    v32 = v23;
    goto LABEL_49;
  }
  if (dword_1EE2A33C8 >= 3)
  {
    *(_DWORD *)v196 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v50 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v51 = *(_DWORD *)v196;
    if (os_log_type_enabled(v50, type))
      v52 = v51;
    else
      v52 = v51 & 0xFFFFFFFE;
    if (v52)
    {
      *(CMTime *)lhs = v200;
      Seconds = CMTimeGetSeconds((CMTime *)lhs);
      *(CMTime *)lhs = v210;
      v54 = CMTimeGetSeconds((CMTime *)lhs);
      *(_DWORD *)rhs = 136316162;
      *(_QWORD *)&rhs[4] = "fpic_ClampItemMomentToGateMoment";
      *(_WORD *)&rhs[12] = 2048;
      *(Float64 *)&rhs[14] = Seconds;
      *(_WORD *)&rhs[22] = 2048;
      *(double *)&rhs[24] = v23;
      *(_WORD *)v203 = 2048;
      *(Float64 *)&v203[2] = v54;
      v204 = 2048;
      *(double *)v205 = v32;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v200 = v210;
  v186 = *(_DWORD *)v201;
  v187 = *(_WORD *)&v201[4];
LABEL_49:
  v192 = *(_OWORD *)&v200.value;
  *(_QWORD *)&v193 = v200.epoch;
  *(_DWORD *)((char *)&v194 + 2) = v186;
  HIWORD(v194) = v187;
  *((double *)&v193 + 1) = v32;
  LOBYTE(v194) = v36;
  BYTE1(v194) = v34;
  v39 = *(const void **)(a1 + 40);
  v181 = *(_QWORD *)(a1 + 48);
  v40 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v197 = v194;
  *(_OWORD *)v196 = *(_OWORD *)&v200.value;
  *(_OWORD *)&v196[16] = v193;
  v41 = CMBaseObjectGetDerivedStorage();
  v42 = (_OWORD *)(v41 + 280);
  v43 = *(_OWORD *)(v41 + 296);
  *(_OWORD *)lhs = *(_OWORD *)(v41 + 280);
  *(_OWORD *)&lhs[16] = v43;
  v209 = *(_QWORD *)(v41 + 312);
  *(_OWORD *)rhs = *(_OWORD *)v196;
  *(_OWORD *)&rhs[16] = *(_OWORD *)&v196[16];
  *(_QWORD *)v203 = v197;
  if (fpic_MomentGreaterThan((uint64_t)lhs, (uint64_t)rhs) && !*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 728))
  {
    memset(&v211, 0, sizeof(v211));
    v44 = *(_OWORD *)(v41 + 296);
    *(_OWORD *)lhs = *v42;
    *(_OWORD *)&lhs[16] = v44;
    v209 = *(_QWORD *)(v41 + 312);
    *(_OWORD *)rhs = *(_OWORD *)v196;
    *(_OWORD *)&rhs[16] = *(_OWORD *)&v196[16];
    *(_QWORD *)v203 = v197;
    fpic_SubtractMomentFromMoment((uint64_t)lhs, (uint64_t)rhs, (uint64_t)&v211);
    *(CMTime *)lhs = v211;
    *(_OWORD *)rhs = *(_OWORD *)&kJumpForwardTolerance.value;
    *(_QWORD *)&rhs[16] = 0;
    if (CMTimeCompare((CMTime *)lhs, (CMTime *)rhs) < 1 || *(_DWORD *)(v41 + 716))
    {
      if (dword_1EE2A33C8)
      {
        *(_DWORD *)time = 0;
        LOBYTE(v210.value) = 0;
        v45 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v46 = *(_DWORD *)time;
        if (os_log_type_enabled(v45, v210.value))
          v47 = v46;
        else
          v47 = v46 & 0xFFFFFFFE;
        if (v47)
        {
          *(_OWORD *)lhs = *(_OWORD *)v196;
          *(_QWORD *)&lhs[16] = *(_QWORD *)&v196[16];
          v48 = CMTimeGetSeconds((CMTime *)lhs);
          v49 = *(_DWORD *)(v41 + 716);
          *(_DWORD *)rhs = 136315906;
          *(_QWORD *)&rhs[4] = "fpic_CheckTimeJumpedBackward";
          *(_WORD *)&rhs[12] = 2048;
          *(_QWORD *)&rhs[14] = v39;
          *(_WORD *)&rhs[22] = 2048;
          *(Float64 *)&rhs[24] = v48;
          *(_WORD *)v203 = 1024;
          *(_DWORD *)&v203[2] = v49;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v74 = *(_OWORD *)&v196[16];
      *v42 = *(_OWORD *)v196;
      *(_OWORD *)(v41 + 296) = v74;
      *(_QWORD *)(v41 + 312) = v197;
    }
    else
    {
      v177 = CFArrayGetCount(*(CFArrayRef *)(v41 + 184));
      if (v177 >= 1)
      {
        v55 = 0;
        v173 = (CFTypeRef *)(v40 + 24);
        do
        {
          v56 = CFArrayGetValueAtIndex(*(CFArrayRef *)(v41 + 184), v55);
          v57 = (*(uint64_t (**)(const void *, uint64_t, const void *))(v41 + 80))(v39, v181, v56);
          v199 = 0;
          memset(time, 0, sizeof(time));
          fpic_EventDateTimeMoment(v57, (uint64_t)time);
          memset(&v210, 0, sizeof(v210));
          v58 = 1;
          fpic_PredictEventGroupDurationOnPrimary((uint64_t)v39, v56, v181, 1, 0, &v210);
          *(_OWORD *)lhs = *(_OWORD *)v196;
          *(_OWORD *)&lhs[16] = *(_OWORD *)&v196[16];
          v209 = v197;
          *(_OWORD *)rhs = *(_OWORD *)time;
          *(_OWORD *)&rhs[16] = *(_OWORD *)&time[16];
          *(_QWORD *)v203 = v199;
          v200 = v210;
          if (!fpic_MomentCanBeCurrent((__int128 *)lhs, (__int128 *)rhs, (__int128 *)&v200.value))
            v58 = FigPlayerInterstitialEventIsPostRoll(v57) != 0;
          v59 = CFSetContainsValue(*(CFSetRef *)(v41 + 632), v56);
          CurrentlyPlayingEvent = fpic_GetCurrentlyPlayingEvent();
          v60 = FigPlayerInterstitialEventCopyIdentifier(v57);
          if (v58 && (v59 || v56 == CurrentlyPlayingEvent))
          {
            if (FigPlayerInterstitialEventCueOnce(v57))
            {
              *(_DWORD *)lhs = 0;
              FigCFDictionaryGetInt32IfPresent();
              v61 = *(_DWORD *)lhs > 0;
            }
            else
            {
              v61 = 0;
            }
            if (*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 724)
              && fpic_isEventInSameGroupAsAnotherEvent((uint64_t)v39, (uint64_t)v56, *(_QWORD *)(v41 + 736)))
            {
              CMBaseObjectGetDerivedStorage();
              FirstIndexOfValue = FigCFArrayGetFirstIndexOfValue();
              CMBaseObjectGetDerivedStorage();
              v62 = FigCFArrayGetFirstIndexOfValue();
              v63 = FirstIndexOfValue < v62;
              v64 = FirstIndexOfValue >= v62;
            }
            else
            {
              v63 = 0;
              v64 = 1;
            }
            if (dword_1EE2A33C8)
            {
              v174 = v63;
              v176 = v64;
              LODWORD(v200.value) = 0;
              v201[0] = OS_LOG_TYPE_DEFAULT;
              v65 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              value = v200.value;
              if (os_log_type_enabled(v65, v201[0]))
                v67 = value;
              else
                v67 = value & 0xFFFFFFFE;
              if (v67)
              {
                *(_OWORD *)lhs = *v42;
                *(_QWORD *)&lhs[16] = *(_QWORD *)(v41 + 296);
                v68 = CMTimeGetSeconds((CMTime *)lhs);
                *(_OWORD *)lhs = *(_OWORD *)v196;
                *(_QWORD *)&lhs[16] = *(_QWORD *)&v196[16];
                v69 = CMTimeGetSeconds((CMTime *)lhs);
                *(_DWORD *)rhs = 136316674;
                v70 = v174;
                if (v61)
                  v70 = 1;
                *(_QWORD *)&rhs[4] = "fpic_CheckTimeJumpedBackward";
                v71 = v70 == 0;
                v72 = "";
                if (!v71)
                  v72 = " do not";
                *(_WORD *)&rhs[12] = 2048;
                *(_QWORD *)&rhs[14] = v39;
                *(_WORD *)&rhs[22] = 2048;
                *(Float64 *)&rhs[24] = v68;
                *(_WORD *)v203 = 2048;
                *(double *)&v203[2] = v69;
                v204 = 1024;
                *(_DWORD *)v205 = v61;
                *(_WORD *)&v205[4] = 2080;
                *(_QWORD *)&v205[6] = v72;
                v206 = 2112;
                v207 = v57;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              v64 = v176;
            }
            if (!v61 || v56 == CurrentlyPlayingEvent)
            {
              fpic_ResetCurrentEventList(v39, v181, v173);
              v73 = !v64;
              if (v61)
                v73 = 1;
              if ((v73 & 1) == 0)
                fpic_ForgetPastEvent((uint64_t)v39, v56);
            }
          }
          if (v60)
            CFRelease(v60);
          ++v55;
        }
        while (v177 != v55);
      }
      *(_BYTE *)(v41 + 977) = 0;
    }
  }
  v75 = *(const void **)(a1 + 40);
  v76 = *(_QWORD *)(a1 + 48);
  v77 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_OWORD *)v196 = v192;
  *(_OWORD *)&v196[16] = v193;
  v197 = v194;
  v78 = CMBaseObjectGetDerivedStorage();
  if (!*(_BYTE *)(CMBaseObjectGetDerivedStorage() + 976))
  {
    v79 = CMBaseObjectGetDerivedStorage();
    v80 = v79 + 240;
    if (!*(_BYTE *)(v79 + 272) && !*(_BYTE *)(v79 + 273))
      v80 = v79 + 200;
    v81 = *(_OWORD *)(v80 + 16);
    *(_OWORD *)time = *(_OWORD *)v80;
    *(_OWORD *)&time[16] = v81;
    v199 = *(_QWORD *)(v80 + 32);
    if (!*(_BYTE *)(v78 + 978) && !*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 728) && !*(_DWORD *)(v78 + 716))
    {
      *(_OWORD *)lhs = *(_OWORD *)v196;
      *(_OWORD *)&lhs[16] = *(_OWORD *)&v196[16];
      v209 = v197;
      *(_OWORD *)rhs = *(_OWORD *)time;
      *(_OWORD *)&rhs[16] = *(_OWORD *)&time[16];
      *(_QWORD *)v203 = v199;
      if (fpic_MomentGreaterThan((uint64_t)lhs, (uint64_t)rhs))
      {
        if (!*(_BYTE *)(v78 + 352) && !*(_BYTE *)(v78 + 353)
          || (*(_OWORD *)lhs = *(_OWORD *)v196,
              *(_OWORD *)&lhs[16] = *(_OWORD *)&v196[16],
              v209 = v197,
              v165 = *(_OWORD *)(v78 + 336),
              *(_OWORD *)rhs = *(_OWORD *)(v78 + 320),
              *(_OWORD *)&rhs[16] = v165,
              *(_QWORD *)v203 = *(_QWORD *)(v78 + 352),
              !fpic_MomentsAreClose((uint64_t)lhs, (uint64_t)rhs)))
        {
          v166 = (CFTypeRef *)(v77 + 24);
          fpic_ResetCurrentEventList(v75, v76, v166);
          *(_OWORD *)lhs = *(_OWORD *)v196;
          *(_OWORD *)&lhs[16] = *(_OWORD *)&v196[16];
          v209 = v197;
          MomentDesc = fpic_CreateMomentDesc((uint64_t)lhs);
          *(_OWORD *)lhs = *(_OWORD *)time;
          *(_OWORD *)&lhs[16] = *(_OWORD *)&time[16];
          v209 = v199;
          v168 = fpic_CreateMomentDesc((uint64_t)lhs);
          if (dword_1EE2A33C8)
          {
            LODWORD(v211.value) = 0;
            LOBYTE(v210.value) = 0;
            v169 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v170 = v211.value;
            if (os_log_type_enabled(v169, v210.value))
              v171 = v170;
            else
              v171 = v170 & 0xFFFFFFFE;
            if (v171)
            {
              v172 = (const __CFArray *)*v166;
              if (*v166)
                LODWORD(v172) = CFArrayGetCount(v172);
              *(_DWORD *)rhs = 136316162;
              *(_QWORD *)&rhs[4] = "fpic_CheckTimeJumpedForward";
              *(_WORD *)&rhs[12] = 2048;
              *(_QWORD *)&rhs[14] = v75;
              *(_WORD *)&rhs[22] = 2112;
              *(_QWORD *)&rhs[24] = v168;
              *(_WORD *)v203 = 2112;
              *(_QWORD *)&v203[2] = MomentDesc;
              v204 = 1024;
              *(_DWORD *)v205 = (_DWORD)v172;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          if (MomentDesc)
            CFRelease(MomentDesc);
          if (v168)
            CFRelease(v168);
        }
      }
    }
  }
  if (!*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 728))
  {
    v82 = *(_QWORD *)(a1 + 56);
    *(_QWORD *)(v82 + 312) = v194;
    v83 = v193;
    *(_OWORD *)(v82 + 280) = v192;
    *(_OWORD *)(v82 + 296) = v83;
  }
  v84 = *(_QWORD *)(a1 + 40);
  v85 = CMBaseObjectGetDerivedStorage();
  v86 = v183;
  if (*(_BYTE *)(v85 + 860))
  {
    v87 = v85;
    if (fpic_isEventResolvableOnPrimaryTimeline(v84, *(_QWORD *)(v85 + 736)))
    {
      if (*(_BYTE *)(v87 + 861))
      {
        v88 = CMBaseObjectGetDerivedStorage();
        if (*(unsigned __int8 *)(v88 + 352) | *(unsigned __int8 *)(v88 + 353))
        {
          if (dword_1EE2A33C8)
          {
            *(_DWORD *)time = 0;
            v196[0] = 0;
            v89 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v90 = *(_DWORD *)time;
            if (os_log_type_enabled(v89, (os_log_type_t)v196[0]))
              v91 = v90;
            else
              v91 = v90 & 0xFFFFFFFE;
            if (v91)
            {
              fpic_GetCurrentDepartureTime((__n128 *)&v200);
              v92 = CMTimeGetSeconds(&v200);
              *(_DWORD *)rhs = 136315650;
              *(_QWORD *)&rhs[4] = "fpic_establishIntendedEventToSeekInto";
              *(_WORD *)&rhs[12] = 2048;
              *(_QWORD *)&rhs[14] = v84;
              *(_WORD *)&rhs[22] = 2048;
              *(Float64 *)&rhs[24] = v92;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            v86 = v183;
          }
          *(_WORD *)(v87 + 352) = 0;
          *(_BYTE *)(v87 + 861) = 0;
        }
      }
      v93 = fpic_UnwrapEvent(v84, *(_QWORD *)(v87 + 736));
      v179 = FigPlayerInterstitialEventCopyIdentifier(v93);
      v94 = CMBaseObjectGetDerivedStorage();
      *(_QWORD *)v201 = 0;
      *(_OWORD *)time = v185;
      *(_QWORD *)&time[16] = v86;
      *(_OWORD *)v196 = *MEMORY[0x1E0CA2E68];
      *(_QWORD *)&v196[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      if (*(_QWORD *)(v94 + 736))
      {
        v95 = v94;
        v96 = FigCFWeakReferenceHolderCopyReferencedObject();
        if (v96)
        {
          v97 = (const void *)v96;
          v98 = fpic_UnwrapEvent(v84, *(_QWORD *)(v95 + 736));
          v99 = fpic_copyEventsScheduledAtSameMomentAsEvent(v84, v98, (__CFArray **)v201);
          if (v99)
          {
            v111 = v99;
          }
          else
          {
            v182 = v93;
            for (i = 0; ; ++i)
            {
              v101 = *(_QWORD *)v201;
              if (*(_QWORD *)v201)
                v101 = CFArrayGetCount(*(CFArrayRef *)v201);
              if (i >= v101)
                break;
              v102 = CFArrayGetValueAtIndex(*(CFArrayRef *)v201, i);
              v103 = fpic_UnwrapEvent(v84, (uint64_t)v102);
              *(_OWORD *)lhs = v185;
              *(_QWORD *)&lhs[16] = v86;
              if (*(const void **)(v95 + 736) == v102)
                break;
              memset(rhs, 0, 24);
              FigPlayerInterstitialEventGetResumptionOffset(v103, (uint64_t)rhs);
              if (CFDictionaryContainsKey(*(CFDictionaryRef *)(v95 + 616), v102))
              {
                v104 = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(v95 + 616), v102);
                CMTimeMakeFromDictionary((CMTime *)lhs, v104);
              }
              else
              {
                fpic_GetEventDuration(v84, (uint64_t)v102, (uint64_t)v97, &v211);
                *(CMTime *)lhs = v211;
              }
              if ((rhs[12] & 1) != 0)
                v105 = (CMTime *)rhs;
              else
                v105 = (CMTime *)lhs;
              v210 = *v105;
              v211 = *(CMTime *)lhs;
              fpic_AccumulateDuration((CMTime *)v196, &v211);
              fpic_AccumulateDuration((CMTime *)time, &v210);
            }
            *(_OWORD *)(v95 + 384) = *(_OWORD *)time;
            *(_QWORD *)(v95 + 400) = *(_QWORD *)&time[16];
            *(_OWORD *)(v95 + 432) = *(_OWORD *)v196;
            *(_QWORD *)(v95 + 448) = *(_QWORD *)&v196[16];
            if (dword_1EE2A33C8)
            {
              LODWORD(v211.value) = 0;
              LOBYTE(v210.value) = 0;
              v106 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              v107 = v211.value;
              if (os_log_type_enabled(v106, v210.value))
                v108 = v107;
              else
                v108 = v107 & 0xFFFFFFFE;
              if (v108)
              {
                *(_OWORD *)lhs = *(_OWORD *)(v95 + 384);
                *(_QWORD *)&lhs[16] = *(_QWORD *)(v95 + 400);
                v109 = CMTimeGetSeconds((CMTime *)lhs);
                *(_OWORD *)lhs = *(_OWORD *)(v95 + 432);
                *(_QWORD *)&lhs[16] = *(_QWORD *)(v95 + 448);
                v110 = CMTimeGetSeconds((CMTime *)lhs);
                *(_DWORD *)rhs = 136315906;
                *(_QWORD *)&rhs[4] = "fpic_recalculatePlayedOutResumptionOffsetUpToIntendedEventToSeekInto";
                *(_WORD *)&rhs[12] = 2048;
                *(_QWORD *)&rhs[14] = v84;
                *(_WORD *)&rhs[22] = 2048;
                *(Float64 *)&rhs[24] = v109;
                *(_WORD *)v203 = 2048;
                *(Float64 *)&v203[2] = v110;
                _os_log_send_and_compose_impl();
              }
              v93 = v182;
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              v111 = 0;
            }
            else
            {
              v111 = 0;
              v93 = v182;
            }
          }
          CFRelease(v97);
          if (*(_QWORD *)v201)
            CFRelease(*(CFTypeRef *)v201);
          if (!v111)
            goto LABEL_152;
        }
        else if (!FigSignalErrorAt())
        {
          goto LABEL_152;
        }
        v93 = 0;
        v114 = 1;
        v112 = 0x7FEFFFFFFFFFFFFFLL;
        v113 = 1;
        goto LABEL_248;
      }
LABEL_152:
      fpic_GetEventStartMoment(v93, (uint64_t)lhs);
      v190 = *(_OWORD *)lhs;
      v112 = *(_QWORD *)&lhs[24];
      v191 = *(_QWORD *)&lhs[16];
      v113 = v209;
      v114 = BYTE1(v209);
      v188 = *(_DWORD *)((char *)&v209 + 2);
      v189 = HIWORD(v209);
      *(_BYTE *)(v87 + 860) = 0;
      if (dword_1EE2A33C8)
      {
        *(_DWORD *)time = 0;
        v196[0] = 0;
        v115 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v116 = *(_DWORD *)time;
        if (os_log_type_enabled(v115, (os_log_type_t)v196[0]))
          v117 = v116;
        else
          v117 = v116 & 0xFFFFFFFE;
        if (v117)
        {
          *(_DWORD *)rhs = 136315650;
          *(_QWORD *)&rhs[4] = "fpic_establishIntendedEventToSeekInto";
          *(_WORD *)&rhs[12] = 2048;
          *(_QWORD *)&rhs[14] = v84;
          *(_WORD *)&rhs[22] = 2112;
          v118 = v179;
          *(_QWORD *)&rhs[24] = v179;
          _os_log_send_and_compose_impl();
        }
        else
        {
          v118 = v179;
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        if (!v118)
          goto LABEL_161;
LABEL_160:
        CFRelease(v118);
LABEL_161:
        v86 = v183;
        goto LABEL_162;
      }
LABEL_248:
      v118 = v179;
      if (!v179)
        goto LABEL_161;
      goto LABEL_160;
    }
  }
  v93 = 0;
  v114 = 1;
  v112 = 0x7FEFFFFFFFFFFFFFLL;
  v113 = 1;
LABEL_162:
  if (CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(a1 + 56) + 600)))
    return;
  if (fpic_ShouldIgnoreInterstitialsDueToExternalPlaybackStrategy(*(_QWORD *)(a1 + 40)))
    return;
  v119 = CMBaseObjectGetDerivedStorage();
  if (*(unsigned __int8 *)(v119 + 352) | *(unsigned __int8 *)(v119 + 353)
    || *(_DWORD *)(CMBaseObjectGetDerivedStorage() + 724) && (!v93 || *(_BYTE *)(*(_QWORD *)(a1 + 56) + 860)))
  {
    return;
  }
  if (*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 728))
    return;
  v120 = *(_QWORD *)(a1 + 56);
  v121 = *(_OWORD *)(v120 + 216);
  *(_OWORD *)time = *(_OWORD *)(v120 + 200);
  *(_OWORD *)&time[16] = v121;
  v199 = *(_QWORD *)(v120 + 232);
  v122 = CFArrayGetCount(*(CFArrayRef *)(v120 + 184));
  if (v93)
  {
    v123 = v93;
LABEL_171:
    if (v113 || (_BYTE)v194 && BYTE1(v194))
    {
      SnapOptions = FigPlayerInterstitialEventGetSnapOptions(v123);
      v125 = CMBaseObjectGetDerivedStorage();
      *(_WORD *)(v125 + 232) = 0;
      *(_WORD *)(v125 + 272) = 0;
      *(_OWORD *)(v125 + 408) = v185;
      *(_QWORD *)(v125 + 424) = v86;
      *(_OWORD *)(v125 + 456) = v185;
      *(_QWORD *)(v125 + 472) = v86;
      *(_BYTE *)(v125 + 976) = 0;
      *(_QWORD *)(v125 + 592) = v86;
      *(_OWORD *)(v125 + 576) = v185;
      *(_BYTE *)(v125 + 979) = 0;
      v126 = *(_QWORD *)(a1 + 56);
      *(_QWORD *)(v126 + 216) = v191;
      *(_OWORD *)(v126 + 200) = v190;
      *(_QWORD *)(v126 + 224) = v112;
      *(_BYTE *)(v126 + 232) = v113;
      *(_BYTE *)(v126 + 233) = v114;
      *(_WORD *)(v126 + 238) = v189;
      *(_DWORD *)(v126 + 234) = v188;
      v127 = *(_QWORD *)(a1 + 56);
      v128 = MEMORY[0x1E0CA2E68];
      v129 = *MEMORY[0x1E0CA2E68];
      *(_OWORD *)(v127 + 408) = *MEMORY[0x1E0CA2E68];
      v130 = *(_QWORD *)(v128 + 16);
      *(_QWORD *)(v127 + 424) = v130;
      v131 = *(_QWORD *)(a1 + 56);
      *(_QWORD *)(v131 + 472) = v130;
      *(_OWORD *)(v131 + 456) = v129;
      fpic_GatePrimaryBufferingAtCurrentEvent(*(_QWORD *)(a1 + 40), SnapOptions & 1);
    }
    goto LABEL_198;
  }
  v132 = v122;
  if (v122 >= 1)
  {
    v180 = v114;
    v133 = 0;
    v134 = 0;
    v123 = 0;
    do
    {
      v135 = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 56) + 184), v133);
      v136 = (*(uint64_t (**)(_QWORD, _QWORD, const void *))(*(_QWORD *)(a1 + 56) + 80))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v135);
      v137 = (*(uint64_t (**)(_QWORD, _QWORD, const void *))(*(_QWORD *)(a1 + 56) + 88))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v135);
      v138 = *(_QWORD *)(a1 + 56);
      if (*(_QWORD *)(v138 + 152) == v137 && !CFSetContainsValue(*(CFSetRef *)(v138 + 632), v135))
      {
        v209 = 0;
        memset(lhs, 0, sizeof(lhs));
        fpic_EventDateTimeMoment(v136, (uint64_t)lhs);
        if (FigPlayerInterstitialEventIsPostRoll(v136))
        {
          if (!v134)
            v134 = v136;
        }
        else
        {
          v139 = v209;
          v140 = BYTE1(v209);
          if ((_BYTE)v209 && (_BYTE)v194 || BYTE1(v209) && BYTE1(v194))
          {
            memset(&v211, 0, sizeof(v211));
            fpic_PredictEventGroupDurationOnPrimary(*(_QWORD *)(a1 + 40), v135, *(_QWORD *)(a1 + 48), 0, 0, &v211);
            *(_OWORD *)rhs = v192;
            *(_OWORD *)&rhs[16] = v193;
            *(_QWORD *)v203 = v194;
            *(_OWORD *)v196 = *(_OWORD *)lhs;
            *(_OWORD *)&v196[16] = *(_OWORD *)&lhs[16];
            v197 = v209;
            v210 = v211;
            if (fpic_MomentCanBeCurrent((__int128 *)rhs, (__int128 *)v196, (__int128 *)&v210.value))
            {
              *(_OWORD *)rhs = v190;
              *(_QWORD *)&rhs[16] = v191;
              *(_QWORD *)&rhs[24] = v112;
              v203[0] = v113;
              v203[1] = v180;
              *(_DWORD *)&v203[2] = v188;
              *(_WORD *)&v203[6] = v189;
              *(_OWORD *)v196 = *(_OWORD *)lhs;
              *(_OWORD *)&v196[16] = *(_OWORD *)&lhs[16];
              v197 = v209;
              if (fpic_MomentGreaterThan((uint64_t)rhs, (uint64_t)v196))
              {
                v190 = *(_OWORD *)lhs;
                v112 = *(_QWORD *)&lhs[24];
                v191 = *(_QWORD *)&lhs[16];
                v188 = *(_DWORD *)((char *)&v209 + 2);
                v189 = HIWORD(v209);
                v123 = v136;
                v180 = v140;
                v113 = v139;
              }
            }
            else
            {
              CFSetSetValue(*(CFMutableSetRef *)(*(_QWORD *)(a1 + 56) + 632), v135);
            }
          }
          v93 = 0;
          v86 = v183;
        }
      }
      ++v133;
    }
    while (v132 != v133);
    if (!v123 && v134)
    {
      fpic_GetEarliestStartForPostroll((uint64_t)lhs);
      v190 = *(_OWORD *)lhs;
      v112 = *(_QWORD *)&lhs[24];
      v191 = *(_QWORD *)&lhs[16];
      v113 = v209;
      v114 = BYTE1(v209);
      v188 = *(_DWORD *)((char *)&v209 + 2);
      v123 = v134;
      v189 = HIWORD(v209);
      goto LABEL_171;
    }
    v114 = v180;
    if (v123)
      goto LABEL_171;
  }
  v141 = CMBaseObjectGetDerivedStorage();
  *(_WORD *)(v141 + 232) = 0;
  *(_WORD *)(v141 + 272) = 0;
  *(_OWORD *)(v141 + 408) = v185;
  *(_QWORD *)(v141 + 424) = v86;
  *(_OWORD *)(v141 + 456) = v185;
  *(_QWORD *)(v141 + 472) = v86;
  *(_BYTE *)(v141 + 976) = 0;
  *(_OWORD *)(v141 + 576) = v185;
  *(_QWORD *)(v141 + 592) = v86;
  *(_BYTE *)(v141 + 979) = 0;
LABEL_198:
  v142 = *(_QWORD *)(a1 + 56);
  if (!v93)
  {
    *(_OWORD *)(v142 + 384) = v185;
    *(_QWORD *)(v142 + 400) = v86;
    v143 = *(_QWORD *)(a1 + 56);
    *(_OWORD *)(v143 + 432) = v185;
    *(_QWORD *)(v143 + 448) = v86;
    v142 = *(_QWORD *)(a1 + 56);
  }
  *(_OWORD *)lhs = *(_OWORD *)time;
  *(_OWORD *)&lhs[16] = *(_OWORD *)&time[16];
  v209 = v199;
  v144 = *(_OWORD *)(v142 + 216);
  *(_OWORD *)rhs = *(_OWORD *)(v142 + 200);
  *(_OWORD *)&rhs[16] = v144;
  *(_QWORD *)v203 = *(_QWORD *)(v142 + 232);
  if (!fpic_MomentsAreClose((uint64_t)lhs, (uint64_t)rhs))
  {
    v145 = *(_QWORD *)(a1 + 56);
    v146 = *(_OWORD *)(v145 + 216);
    *(_OWORD *)lhs = *(_OWORD *)(v145 + 200);
    *(_OWORD *)&lhs[16] = v146;
    v209 = *(_QWORD *)(v145 + 232);
    v147 = fpic_CreateMomentDesc((uint64_t)lhs);
    *(_OWORD *)lhs = v192;
    *(_OWORD *)&lhs[16] = v193;
    v209 = v194;
    v148 = fpic_CreateMomentDesc((uint64_t)lhs);
    if (dword_1EE2A33C8)
    {
      *(_DWORD *)v196 = 0;
      LOBYTE(v211.value) = 0;
      v149 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v150 = *(_DWORD *)v196;
      if (os_log_type_enabled(v149, v211.value))
        v151 = v150;
      else
        v151 = v150 & 0xFFFFFFFE;
      if (v151)
      {
        v152 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)rhs = 136315906;
        *(_QWORD *)&rhs[4] = "fpic_EstablishCurrentEventForCurrentItem_block_invoke";
        *(_WORD *)&rhs[12] = 2048;
        *(_QWORD *)&rhs[14] = v152;
        *(_WORD *)&rhs[22] = 2112;
        *(_QWORD *)&rhs[24] = v148;
        *(_WORD *)v203 = 2112;
        *(_QWORD *)&v203[2] = v147;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      if (dword_1EE2A33C8 >= 2)
      {
        *(_DWORD *)v196 = 0;
        LOBYTE(v211.value) = 0;
        v153 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v154 = *(_DWORD *)v196;
        if (os_log_type_enabled(v153, v211.value))
          v155 = v154;
        else
          v155 = v154 & 0xFFFFFFFE;
        if (v155)
        {
          *(_DWORD *)rhs = 136315138;
          *(_QWORD *)&rhs[4] = "fpic_EstablishCurrentEventForCurrentItem_block_invoke";
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    v156 = *(_QWORD *)(a1 + 40);
    v157 = *(_QWORD *)(a1 + 56);
    v158 = *(_OWORD *)(v157 + 216);
    *(_OWORD *)v196 = *(_OWORD *)(v157 + 200);
    *(_OWORD *)&v196[16] = v158;
    v197 = *(_QWORD *)(v157 + 232);
    CMBaseObjectGetDerivedStorage();
    v159 = (const __CFArray *)FigCFDictionaryCopyArrayOfKeys();
    if (v159)
    {
      v160 = v159;
      if (CFArrayGetCount(v159) >= 1)
      {
        v161 = 0;
        do
        {
          v162 = (const void *)FigCFArrayGetValueAtIndex();
          v163 = fpic_UnwrapEvent(v156, (uint64_t)v162);
          fpic_EventDateTimeMoment(v163, (uint64_t)lhs);
          *(_OWORD *)rhs = *(_OWORD *)v196;
          *(_OWORD *)&rhs[16] = *(_OWORD *)&v196[16];
          *(_QWORD *)v203 = v197;
          if (!fpic_MomentsAreClose((uint64_t)rhs, (uint64_t)lhs))
          {
            v164 = CMBaseObjectGetDerivedStorage();
            CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v164 + 616), v162);
          }
          ++v161;
        }
        while (v161 < CFArrayGetCount(v160));
      }
      CFRelease(v160);
    }
    if (v147)
      CFRelease(v147);
    if (v148)
      CFRelease(v148);
  }
}

@end
