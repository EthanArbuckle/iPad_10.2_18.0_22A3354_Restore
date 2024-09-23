@implementation FPCAMetalLayerState

+ (id)_globalScheduledCommandBuffers
{
  objc_opt_self();
  if (qword_25430AE68 != -1)
    dispatch_once(&qword_25430AE68, &__block_literal_global_51);
  return (id)qword_25430AE60;
}

void __53__FPCAMetalLayerState__globalScheduledCommandBuffers__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v1 = (void *)qword_25430AE60;
  qword_25430AE60 = (uint64_t)v0;

}

- (void)dealloc
{
  NSMutableDictionary *acquiredInFlightDrawables;
  NSMutableDictionary *clientPresentedInFlightDrawables;
  unint64_t v5;
  objc_super v6;

  acquiredInFlightDrawables = self->_acquiredInFlightDrawables;
  self->_acquiredInFlightDrawables = 0;

  clientPresentedInFlightDrawables = self->_clientPresentedInFlightDrawables;
  self->_clientPresentedInFlightDrawables = 0;

  -[FPCAMetalLayerState _reportState]((uint64_t)self);
  do
    v5 = __ldaxr(&gFPLayerCount);
  while (__stlxr(v5 - 1, &gFPLayerCount));
  v6.receiver = self;
  v6.super_class = (Class)FPCAMetalLayerState;
  -[FPCAMetalLayerState dealloc](&v6, sel_dealloc);
}

- (void)_reportState
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  NSObject *v53;
  NSObject *v54;
  os_signpost_id_t v55;
  id v56;
  int v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  NSObject *v69;
  os_signpost_id_t v70;
  id v71;
  int v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  NSObject *v84;
  os_signpost_id_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  int v112;
  id v113;
  int v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  NSObject *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  id v145;
  id v146;
  uint64_t v147;
  uint64_t v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  id v152;
  uint64_t v153;
  uint64_t v154;
  id v155;
  uint64_t v156;
  uint64_t v157;
  id v158;
  uint64_t v159;
  uint64_t v160;
  id v161;
  id v162;
  uint64_t v163;
  uint64_t v164;
  id v165;
  uint64_t v166;
  uint64_t v167;
  id v168;
  uint64_t v169;
  int v170;
  id v171;
  id v172;
  int v173;
  id v174;
  id v175;
  id v176;
  id v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  id v189;
  id v190;
  uint64_t v191;
  id v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id v197;
  unint64_t v198;
  uint8_t buf[4];
  _BYTE v200[64];
  __int16 v201;
  uint64_t v202;
  __int16 v203;
  uint64_t v204;
  __int16 v205;
  uint64_t v206;
  __int16 v207;
  uint64_t v208;
  __int16 v209;
  uint64_t v210;
  __int16 v211;
  uint64_t v212;
  __int16 v213;
  uint64_t v214;
  __int16 v215;
  uint64_t v216;
  __int16 v217;
  uint64_t v218;
  __int16 v219;
  uint64_t v220;
  __int16 v221;
  uint64_t v222;
  __int16 v223;
  uint64_t v224;
  __int16 v225;
  uint64_t v226;
  __int16 v227;
  uint64_t v228;
  __int16 v229;
  int v230;
  __int16 v231;
  _BYTE v232[24];
  __int16 v233;
  uint64_t v234;
  __int16 v235;
  uint64_t v236;
  __int16 v237;
  unint64_t v238;
  __int16 v239;
  uint64_t v240;
  uint64_t v241;

  v241 = *MEMORY[0x24BDAC8D0];
  if (a1 && *(_BYTE *)(a1 + 8))
  {
    v2 = qword_25430AE78;
    if (*(_BYTE *)(a1 + 9))
      goto LABEL_7;
    v3 = qword_25430AE78 - *(_QWORD *)(a1 + 216);
    if (FPScaleMachTimestamp_onceToken != -1)
      dispatch_once(&FPScaleMachTimestamp_onceToken, &__block_literal_global_0);
    if (*(double *)&gTimebaseRatio * (double)(unint64_t)v3 >= 5.0)
    {
LABEL_7:
      _fpStateHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = *(_QWORD *)(a1 + 176);
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
      {
        v7 = *(void **)(a1 + 144);
        v194 = *(id *)(a1 + 152);
        v197 = v7;
        v191 = objc_msgSend(v194, "unsignedLongLongValue");
        v8 = *(id *)(a1 + 160);
        v9 = objc_msgSend(v8, "unsignedLongLongValue");
        v10 = *(id *)(a1 + 168);
        v11 = v2;
        v12 = objc_msgSend(v10, "unsignedLongLongValue");
        v13 = *(_QWORD *)(a1 + 216);

        *(_DWORD *)buf = 138544642;
        *(_QWORD *)v200 = v7;
        *(_WORD *)&v200[8] = 2050;
        *(_QWORD *)&v200[10] = v191;
        *(_WORD *)&v200[18] = 2050;
        *(_QWORD *)&v200[20] = v9;
        *(_WORD *)&v200[28] = 2050;
        *(_QWORD *)&v200[30] = v12;
        v2 = v11;
        *(_WORD *)&v200[38] = 2050;
        *(_QWORD *)&v200[40] = v13;
        *(_WORD *)&v200[48] = 2050;
        *(_QWORD *)&v200[50] = v11;
        _os_signpost_emit_with_name_impl(&dword_23C4DA000, v5, OS_SIGNPOST_EVENT, v6, "CAMetalLayerMetadata", "Signpost ID is Shared Image Queue ID\nName: '%{public, name=name}@'\nHeight (points): %{public, name=Height, units=pixels}llu\nWidth: (points): %{public, name=Width, units=pixels}llu\nPixel format: %{public, name=PixelFormat}#llx\n%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu", buf, 0x3Eu);

      }
      *(_QWORD *)(a1 + 216) = v2;
      *(_BYTE *)(a1 + 9) = 0;
    }
    v14 = qword_25430AE70;
    if (qword_25430AE80 > (unint64_t)qword_25430AE70)
      v14 = qword_25430AE80;
    if (v14 <= *(_QWORD *)(a1 + 208))
      v14 = *(_QWORD *)(a1 + 208);
    v198 = v14;
    if (objc_msgSend(*(id *)(a1 + 80), "count"))
    {
      _fpStateHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = *(_QWORD *)(a1 + 176);
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        v195 = *(id *)(a1 + 80);
        v173 = objc_msgSend(v195, "count");
        v192 = *(id *)(a1 + 80);
        objc_msgSend(v192, "averageMs");
        v169 = v18;
        v189 = *(id *)(a1 + 80);
        objc_msgSend(v189, "minMs");
        v167 = v19;
        v187 = *(id *)(a1 + 80);
        objc_msgSend(v187, "maxMs");
        v163 = v20;
        v185 = *(id *)(a1 + 80);
        objc_msgSend(v185, "stddevMs");
        v159 = v21;
        v183 = *(id *)(a1 + 88);
        objc_msgSend(v183, "averageMs");
        v157 = v22;
        v181 = *(id *)(a1 + 88);
        objc_msgSend(v181, "minMs");
        v153 = v23;
        v179 = *(id *)(a1 + 88);
        objc_msgSend(v179, "maxMs");
        v151 = v24;
        v177 = *(id *)(a1 + 88);
        objc_msgSend(v177, "stddevMs");
        v147 = v25;
        v175 = *(id *)(a1 + 96);
        objc_msgSend(v175, "averageMs");
        v143 = v26;
        v171 = *(id *)(a1 + 96);
        objc_msgSend(v171, "minMs");
        v141 = v27;
        v165 = *(id *)(a1 + 96);
        objc_msgSend(v165, "maxMs");
        v139 = v28;
        v161 = *(id *)(a1 + 96);
        objc_msgSend(v161, "stddevMs");
        v137 = v29;
        v155 = *(id *)(a1 + 104);
        objc_msgSend(v155, "averageMs");
        v31 = v30;
        v149 = *(id *)(a1 + 104);
        objc_msgSend(v149, "minMs");
        v33 = v32;
        v145 = *(id *)(a1 + 104);
        objc_msgSend(v145, "maxMs");
        v35 = v34;
        v36 = *(id *)(a1 + 104);
        objc_msgSend(v36, "stddevMs");
        v38 = v37;
        v39 = *(id *)(a1 + 112);
        objc_msgSend(v39, "averageMs");
        v41 = v40;
        v42 = *(id *)(a1 + 112);
        objc_msgSend(v42, "minMs");
        v44 = v43;
        v45 = *(id *)(a1 + 112);
        objc_msgSend(v45, "maxMs");
        v47 = v46;
        v48 = v2;
        v49 = *(id *)(a1 + 112);
        objc_msgSend(v49, "stddevMs");
        v51 = v50;
        v52 = *(_DWORD *)(a1 + 16);

        v2 = v48;
        *(_DWORD *)buf = 67246080;
        *(_DWORD *)v200 = v173;
        *(_WORD *)&v200[4] = 2050;
        *(_QWORD *)&v200[6] = v169;
        *(_WORD *)&v200[14] = 2050;
        *(_QWORD *)&v200[16] = v167;
        *(_WORD *)&v200[24] = 2050;
        *(_QWORD *)&v200[26] = v163;
        *(_WORD *)&v200[34] = 2050;
        *(_QWORD *)&v200[36] = v159;
        *(_WORD *)&v200[44] = 2050;
        *(_QWORD *)&v200[46] = v157;
        *(_WORD *)&v200[54] = 2050;
        *(_QWORD *)&v200[56] = v153;
        v201 = 2050;
        v202 = v151;
        v203 = 2050;
        v204 = v147;
        v205 = 2050;
        v206 = v143;
        v207 = 2050;
        v208 = v141;
        v209 = 2050;
        v210 = v139;
        v211 = 2050;
        v212 = v137;
        v213 = 2050;
        v214 = v31;
        v215 = 2050;
        v216 = v33;
        v217 = 2050;
        v218 = v35;
        v219 = 2050;
        v220 = v38;
        v221 = 2050;
        v222 = v41;
        v223 = 2050;
        v224 = v44;
        v225 = 2050;
        v226 = v47;
        v227 = 2050;
        v228 = v51;
        v229 = 1026;
        v230 = v52;
        v231 = 2050;
        *(_QWORD *)v232 = v198;
        *(_WORD *)&v232[8] = 2050;
        *(_QWORD *)&v232[10] = v48;
        _os_signpost_emit_with_name_impl(&dword_23C4DA000, v16, OS_SIGNPOST_EVENT, v17, "SkippedFrameStats", "Signpost ID is Shared Image Queue ID\nFrames (count, frames) =%{public, signpost.aggregation:count, group=Frames, unit=frames}u\nFrames_TotalEndToEndWalltime (TotalEndToEndWalltime average, ms) =%{public, signpost.aggregation:measure_average, group=Frames, type=TotalEndToEndWalltime, measure_unit=ms}.3f\nFrames_TotalEndToEndWalltime (TotalEndToEndWalltime min, ms) =%{public, signpost.aggregation:measure_min, group=Frames, type=TotalEndToEndWalltime, measure_unit=ms}.3f\nFrames_TotalEndToEndWalltime (TotalEndToEndWalltime max, ms) =%{public, signpost.aggregation:measure_max, group=Frames, type=TotalEndToEndWalltime, measure_unit=ms}.3f\nFrames_TotalEndToEndWalltime (TotalEndToEndWalltime stddev, ms) =%{public, signpost.aggregation:measure_stddev, group=Frames, type=TotalEndToEndWalltime, measure_unit=ms}.3f\nFrames_CPUEndToEndWalltime (CPUEndToEndWalltime average, ms) =%{public, signpost.aggregation:measure_average, group=Frames, type=CPUEndToEndWalltime, measure_unit=ms}.3f\nFrames_CPUEndToEndWalltime (CPUEndToEndWalltime min, ms) =%{public, signpost.aggregation:measure_min, group=Frames, type=CPUEndToEndWalltime, measure_unit=ms}.3f\n"
          "Frames_CPUEndToEndWalltime (CPUEndToEndWalltime max, ms) =%{public, signpost.aggregation:measure_max, group=Fr"
          "ames, type=CPUEndToEndWalltime, measure_unit=ms}.3f\n"
          "Frames_CPUEndToEndWalltime (CPUEndToEndWalltime stddev, ms) =%{public, signpost.aggregation:measure_stddev, gr"
          "oup=Frames, type=CPUEndToEndWalltime, measure_unit=ms}.3f\n"
          "Frames_GPUEndToEndWalltime (GPUEndToEndWalltime average, ms) =%{public, signpost.aggregation:measure_average, "
          "group=Frames, type=GPUEndToEndWalltime, measure_unit=ms}.3f\n"
          "Frames_GPUEndToEndWalltime (GPUEndToEndWalltime min, ms) =%{public, signpost.aggregation:measure_min, group=Fr"
          "ames, type=GPUEndToEndWalltime, measure_unit=ms}.3f\n"
          "Frames_GPUEndToEndWalltime (GPUEndToEndWalltime max, ms) =%{public, signpost.aggregation:measure_max, group=Fr"
          "ames, type=GPUEndToEndWalltime, measure_unit=ms}.3f\n"
          "Frames_GPUEndToEndWalltime (GPUEndToEndWalltime stddev, ms) =%{public, signpost.aggregation:measure_stddev, gr"
          "oup=Frames, type=GPUEndToEndWalltime, measure_unit=ms}.3f\n"
          "Frames_TotalOnGPUWalltime (TotalOnGPUWalltime average, ms) =%{public, signpost.aggregation:measure_average, gr"
          "oup=Frames, type=TotalOnGPUWalltime, measure_unit=ms}.3f\n"
          "Frames_TotalOnGPUWalltime (TotalOnGPUWalltime min, ms) =%{public, signpost.aggregation:measure_min, group=Fram"
          "es, type=TotalOnGPUWalltime, measure_unit=ms}.3f\n"
          "Frames_TotalOnGPUWalltime (TotalOnGPUWalltime max, ms) =%{public, signpost.aggregation:measure_max, group=Fram"
          "es, type=TotalOnGPUWalltime, measure_unit=ms}.3f\n"
          "Frames_TotalOnGPUWalltime (TotalOnGPUWalltime stddev, ms) =%{public, signpost.aggregation:measure_stddev, grou"
          "p=Frames, type=TotalOnGPUWalltime, measure_unit=ms}.3f\n"
          "Frames_GPUDoneToCompletedWalltime (GPUDoneToCompletedWalltime average, ms) =%{public, signpost.aggregation:mea"
          "sure_average, group=Frames, type=GPUDoneToCompletedWalltime, measure_unit=ms}.3f\n"
          "Frames_GPUDoneToCompletedWalltime (GPUDoneToCompletedWalltime min, ms) =%{public, signpost.aggregation:measure"
          "_min, group=Frames, type=GPUDoneToCompletedWalltime, measure_unit=ms}.3f\n"
          "Frames_GPUDoneToCompletedWalltime (GPUDoneToCompletedWalltime max, ms) =%{public, signpost.aggregation:measure"
          "_max, group=Frames, type=GPUDoneToCompletedWalltime, measure_unit=ms}.3f\n"
          "Frames_GPUDoneToCompletedWalltime (GPUDoneToCompletedWalltime stddev, ms) =%{public, signpost.aggregation:meas"
          "ure_stddev, group=Frames, type=GPUDoneToCompletedWalltime, measure_unit=ms}.3f\n"
          "FrameCommandBuffers (count, command_buffers) =%{public, signpost.aggregation:count, group=FrameCommandBuffers,"
          " unit=command_buffers}u\n"
          "%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu",
          buf,
          0xEAu);

      }
    }
    if (objc_msgSend(*(id *)(a1 + 128), "count"))
    {
      _fpStateHandle();
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = v53;
      v55 = *(_QWORD *)(a1 + 176);
      if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
      {
        v56 = *(id *)(a1 + 128);
        v57 = objc_msgSend(v56, "count");
        v58 = *(id *)(a1 + 128);
        objc_msgSend(v58, "averageMs");
        v60 = v59;
        v61 = *(id *)(a1 + 128);
        objc_msgSend(v61, "minMs");
        v63 = v62;
        v64 = *(id *)(a1 + 128);
        objc_msgSend(v64, "maxMs");
        v66 = v65;
        objc_msgSend(*(id *)(a1 + 128), "stddevMs");
        *(_DWORD *)buf = 67241728;
        *(_DWORD *)v200 = v57;
        *(_WORD *)&v200[4] = 2050;
        *(_QWORD *)&v200[6] = v60;
        *(_WORD *)&v200[14] = 2050;
        *(_QWORD *)&v200[16] = v63;
        *(_WORD *)&v200[24] = 2050;
        *(_QWORD *)&v200[26] = v66;
        *(_WORD *)&v200[34] = 2050;
        *(_QWORD *)&v200[36] = v67;
        *(_WORD *)&v200[44] = 2050;
        *(_QWORD *)&v200[46] = v198;
        *(_WORD *)&v200[54] = 2050;
        *(_QWORD *)&v200[56] = v2;
        _os_signpost_emit_with_name_impl(&dword_23C4DA000, v54, OS_SIGNPOST_EVENT, v55, "LateClientDrawablePresentStats", "Signpost ID is Shared Image Queue ID\nLateClientDrawablePresents (count, late_client_presents) =%{public, signpost.aggregation:count, group=LateClientDrawablePresents, unit=late_client_presents}u\nLateClientDrawablePresents_Lateness (Lateness average, ms) =%{public, signpost.aggregation:measure_average, group=LateClientDrawablePresents, type=Lateness, measure_unit=ms}.3f\nLateClientDrawablePresents_Lateness (Lateness min, ms) =%{public, signpost.aggregation:measure_min, group=LateClientDrawablePresents, type=Lateness, measure_unit=ms}.3f\nLateClientDrawablePresents_Lateness (Lateness max, ms) =%{public, signpost.aggregation:measure_max, group=LateClientDrawablePresents, type=Lateness, measure_unit=ms}.3f\nLateClientDrawablePresents_Lateness (Lateness stddev, ms) =%{public, signpost.aggregation:measure_stddev, group=LateClientDrawablePresents, type=Lateness, measure_unit=ms}.3f\n%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu", buf, 0x44u);

      }
    }
    if (objc_msgSend(*(id *)(a1 + 136), "count"))
    {
      _fpStateHandle();
      v68 = objc_claimAutoreleasedReturnValue();
      v69 = v68;
      v70 = *(_QWORD *)(a1 + 176);
      if (v70 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
      {
        v71 = *(id *)(a1 + 136);
        v72 = objc_msgSend(v71, "count");
        v73 = *(id *)(a1 + 136);
        objc_msgSend(v73, "averageMs");
        v75 = v74;
        v76 = *(id *)(a1 + 136);
        objc_msgSend(v76, "minMs");
        v78 = v77;
        v79 = *(id *)(a1 + 136);
        objc_msgSend(v79, "maxMs");
        v81 = v80;
        objc_msgSend(*(id *)(a1 + 136), "stddevMs");
        *(_DWORD *)buf = 67241728;
        *(_DWORD *)v200 = v72;
        *(_WORD *)&v200[4] = 2050;
        *(_QWORD *)&v200[6] = v75;
        *(_WORD *)&v200[14] = 2050;
        *(_QWORD *)&v200[16] = v78;
        *(_WORD *)&v200[24] = 2050;
        *(_QWORD *)&v200[26] = v81;
        *(_WORD *)&v200[34] = 2050;
        *(_QWORD *)&v200[36] = v82;
        *(_WORD *)&v200[44] = 2050;
        *(_QWORD *)&v200[46] = v198;
        *(_WORD *)&v200[54] = 2050;
        *(_QWORD *)&v200[56] = v2;
        _os_signpost_emit_with_name_impl(&dword_23C4DA000, v69, OS_SIGNPOST_EVENT, v70, "LateOnGlassPresentStats", "Signpost ID is Shared Image Queue ID\nLateOnGlassPresents (count, frames_late_on_glass) =%{public, signpost.aggregation:count, group=LateOnGlassPresents, unit=frames_late_on_glass}u\nLateOnGlassPresents_Lateness (Lateness average, ms) =%{public, signpost.aggregation:measure_average, group=LateOnGlassPresents, type=Lateness, measure_unit=ms}.3f\nLateOnGlassPresents_Lateness (Lateness min, ms) =%{public, signpost.aggregation:measure_min, group=LateOnGlassPresents, type=Lateness, measure_unit=ms}.3f\nLateOnGlassPresents_Lateness (Lateness max, ms) =%{public, signpost.aggregation:measure_max, group=LateOnGlassPresents, type=Lateness, measure_unit=ms}.3f\nLateOnGlassPresents_Lateness (Lateness stddev, ms) =%{public, signpost.aggregation:measure_stddev, group=LateOnGlassPresents, type=Lateness, measure_unit=ms}.3f\n%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu", buf, 0x44u);

      }
    }
    _fpStateHandle();
    v83 = objc_claimAutoreleasedReturnValue();
    v84 = v83;
    v85 = *(_QWORD *)(a1 + 176);
    if (v85 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v83))
    {
      v196 = *(id *)(a1 + 40);
      v170 = objc_msgSend(v196, "count");
      v193 = *(id *)(a1 + 40);
      objc_msgSend(v193, "averageMs");
      v166 = v86;
      v190 = *(id *)(a1 + 40);
      objc_msgSend(v190, "minMs");
      v164 = v87;
      v188 = *(id *)(a1 + 40);
      objc_msgSend(v188, "maxMs");
      v160 = v88;
      v186 = *(id *)(a1 + 40);
      objc_msgSend(v186, "stddevMs");
      v156 = v89;
      v184 = *(id *)(a1 + 48);
      objc_msgSend(v184, "averageMs");
      v154 = v90;
      v182 = *(id *)(a1 + 48);
      objc_msgSend(v182, "minMs");
      v150 = v91;
      v180 = *(id *)(a1 + 48);
      objc_msgSend(v180, "maxMs");
      v148 = v92;
      v178 = *(id *)(a1 + 48);
      objc_msgSend(v178, "stddevMs");
      v144 = v93;
      v176 = *(id *)(a1 + 56);
      objc_msgSend(v176, "averageMs");
      v140 = v94;
      v174 = *(id *)(a1 + 56);
      objc_msgSend(v174, "minMs");
      v138 = v95;
      v172 = *(id *)(a1 + 56);
      objc_msgSend(v172, "maxMs");
      v135 = v96;
      v168 = *(id *)(a1 + 56);
      objc_msgSend(v168, "stddevMs");
      v134 = v97;
      v162 = *(id *)(a1 + 64);
      objc_msgSend(v162, "averageMs");
      v132 = v98;
      v158 = *(id *)(a1 + 64);
      objc_msgSend(v158, "minMs");
      v131 = v99;
      v152 = *(id *)(a1 + 64);
      objc_msgSend(v152, "maxMs");
      v130 = v100;
      v146 = *(id *)(a1 + 64);
      objc_msgSend(v146, "stddevMs");
      v102 = v101;
      v142 = *(id *)(a1 + 72);
      objc_msgSend(v142, "averageMs");
      v104 = v103;
      v136 = *(id *)(a1 + 72);
      objc_msgSend(v136, "minMs");
      v106 = v105;
      v133 = *(id *)(a1 + 72);
      objc_msgSend(v133, "maxMs");
      v108 = v107;
      v129 = v2;
      v109 = *(id *)(a1 + 72);
      objc_msgSend(v109, "stddevMs");
      v111 = v110;
      v112 = *(_DWORD *)(a1 + 12);
      v113 = *(id *)(a1 + 120);
      v114 = objc_msgSend(v113, "count");
      v115 = *(id *)(a1 + 120);
      objc_msgSend(v115, "averageMs");
      v117 = v116;
      v118 = *(id *)(a1 + 120);
      objc_msgSend(v118, "minMs");
      v120 = v119;
      v121 = *(id *)(a1 + 120);
      objc_msgSend(v121, "maxMs");
      v123 = v122;
      objc_msgSend(*(id *)(a1 + 120), "stddevMs");
      *(_DWORD *)buf = 67247360;
      *(_DWORD *)v200 = v170;
      *(_WORD *)&v200[4] = 2050;
      *(_QWORD *)&v200[6] = v166;
      *(_WORD *)&v200[14] = 2050;
      *(_QWORD *)&v200[16] = v164;
      *(_WORD *)&v200[24] = 2050;
      *(_QWORD *)&v200[26] = v160;
      *(_WORD *)&v200[34] = 2050;
      *(_QWORD *)&v200[36] = v156;
      *(_WORD *)&v200[44] = 2050;
      *(_QWORD *)&v200[46] = v154;
      *(_WORD *)&v200[54] = 2050;
      *(_QWORD *)&v200[56] = v150;
      v201 = 2050;
      v202 = v148;
      v203 = 2050;
      v204 = v144;
      v205 = 2050;
      v206 = v140;
      v207 = 2050;
      v208 = v138;
      v209 = 2050;
      v210 = v135;
      v211 = 2050;
      v212 = v134;
      v213 = 2050;
      v214 = v132;
      v215 = 2050;
      v216 = v131;
      v217 = 2050;
      v218 = v130;
      v219 = 2050;
      v220 = v102;
      v221 = 2050;
      v222 = v104;
      v223 = 2050;
      v224 = v106;
      v225 = 2050;
      v226 = v108;
      v227 = 2050;
      v228 = v111;
      v229 = 1026;
      v230 = v112;
      v231 = 1026;
      *(_DWORD *)v232 = v114;
      *(_WORD *)&v232[4] = 2050;
      *(_QWORD *)&v232[6] = v117;
      *(_WORD *)&v232[14] = 2050;
      *(_QWORD *)&v232[16] = v120;
      v233 = 2050;
      v234 = v123;
      v235 = 2050;
      v236 = v124;
      v237 = 2050;
      v238 = v198;
      v239 = 2050;
      v240 = v129;
      _os_signpost_emit_with_name_impl(&dword_23C4DA000, v84, OS_SIGNPOST_EVENT, v85, "PresentedFrameStats", aSignpostIdIsSh_3, buf, 0x118u);

    }
    objc_msgSend(*(id *)(a1 + 40), "reset");
    objc_msgSend(*(id *)(a1 + 64), "reset");
    objc_msgSend(*(id *)(a1 + 48), "reset");
    objc_msgSend(*(id *)(a1 + 56), "reset");
    objc_msgSend(*(id *)(a1 + 72), "reset");
    *(_DWORD *)(a1 + 12) = 0;
    objc_msgSend(*(id *)(a1 + 80), "reset");
    objc_msgSend(*(id *)(a1 + 104), "reset");
    objc_msgSend(*(id *)(a1 + 88), "reset");
    objc_msgSend(*(id *)(a1 + 96), "reset");
    objc_msgSend(*(id *)(a1 + 112), "reset");
    *(_DWORD *)(a1 + 16) = 0;
    objc_msgSend(*(id *)(a1 + 120), "reset");
    objc_msgSend(*(id *)(a1 + 128), "reset");
    objc_msgSend(*(id *)(a1 + 136), "reset");
    *(_BYTE *)(a1 + 10) = 0;
    v125 = *(id *)(a1 + 192);
    if (objc_msgSend(v125, "count"))
    {

    }
    else
    {
      v126 = objc_msgSend(*(id *)(a1 + 200), "count");

      if (!v126 && *(_BYTE *)(a1 + 8))
      {
        *(_BYTE *)(a1 + 8) = 0;
        objc_opt_self();
        v127 = gFPNeedsReportCount;
        if (gFPNeedsReportCount == 1)
        {
          _aggregationTimerSource();
          v128 = objc_claimAutoreleasedReturnValue();
          dispatch_suspend(v128);

          v127 = gFPNeedsReportCount;
        }
        if (v127)
          gFPNeedsReportCount = v127 - 1;
      }
    }
  }
}

- (double)previousPresentedLifetimeEnd
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1[8]);
    a1 = (double *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)_layerStateForAddress:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_self();
  _FPGlobalLayerStateDictionary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __49__FPCAMetalLayerState__reportBundleInfoIfNeeded___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  __CFString *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
    v3 = (__CFString *)v1;
  else
    v3 = CFSTR("Unknown");
  objc_storeStrong((id *)&qword_25430AE90, v3);

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (__CFString *)v5;
  else
    v7 = CFSTR("Unknown");
  objc_storeStrong((id *)algn_25430AE98, v7);

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForInfoDictionaryKey:", CFSTR("CFBundleVersion"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (__CFString *)v8;
  else
    v10 = CFSTR("Unknown");
  objc_storeStrong((id *)&qword_25430AEA0, v10);

}

uint64_t __62__FPCAMetalLayerState__reportProcessPerformanceStatsIfNeeded___block_invoke()
{
  uint64_t result;

  result = getpid();
  dword_25430AE0C = result;
  return result;
}

+ (void)metalLayerAlloc:(uint64_t)a1
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[6];

  v3 = objc_opt_self();
  _FPLayerStateSyncQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__FPCAMetalLayerState_metalLayerAlloc___block_invoke;
  v5[3] = &__block_descriptor_48_e5_v8__0l;
  v5[4] = v3;
  v5[5] = a2;
  dispatch_async(v4, v5);

}

void __39__FPCAMetalLayerState_metalLayerAlloc___block_invoke(uint64_t a1)
{
  const void *v1;
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  FPCAMetalLayerState *v7;
  _QWORD *v8;
  _QWORD *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  FPDurationStatistics *v15;
  void *v16;
  FPDurationStatistics *v17;
  void *v18;
  FPDurationStatistics *v19;
  void *v20;
  FPDurationStatistics *v21;
  void *v22;
  FPDurationStatistics *v23;
  void *v24;
  FPDurationStatistics *v25;
  void *v26;
  FPDurationStatistics *v27;
  void *v28;
  FPDurationStatistics *v29;
  void *v30;
  FPDurationStatistics *v31;
  void *v32;
  FPDurationStatistics *v33;
  void *v34;
  FPDurationStatistics *v35;
  void *v36;
  FPDurationStatistics *v37;
  void *v38;
  FPDurationStatistics *v39;
  void *v40;
  uint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  void *v44;
  void *v45;
  objc_super v46;

  v1 = *(const void **)(a1 + 40);
  v2 = objc_opt_self();
  if (v1)
  {
    +[FPCAMetalLayerState _layerStateForAddress:](v2, (uint64_t)v1);
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3 && _shouldEmitErrorSignpost())
    {
      _fpErrorHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      _fpErrorHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = os_signpost_id_make_with_pointer(v5, v1);

      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
      {
        LOWORD(v46.receiver) = 0;
        _os_signpost_emit_unreliably_with_name_impl();
      }

    }
    v7 = [FPCAMetalLayerState alloc];
    if (v7)
    {
      v46.receiver = v7;
      v46.super_class = (Class)FPCAMetalLayerState;
      v8 = objc_msgSendSuper2(&v46, sel_init);
      v9 = v8;
      if (v8)
      {
        v8[3] = v1;
        v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v11 = (void *)v9[24];
        v9[24] = v10;

        v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v13 = (void *)v9[25];
        v9[25] = v12;

        _fpErrorHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        v9[22] = os_signpost_id_make_with_pointer(v14, v1);

        v15 = objc_alloc_init(FPDurationStatistics);
        v16 = (void *)v9[5];
        v9[5] = v15;

        v17 = objc_alloc_init(FPDurationStatistics);
        v18 = (void *)v9[8];
        v9[8] = v17;

        v19 = objc_alloc_init(FPDurationStatistics);
        v20 = (void *)v9[6];
        v9[6] = v19;

        v21 = objc_alloc_init(FPDurationStatistics);
        v22 = (void *)v9[7];
        v9[7] = v21;

        v23 = objc_alloc_init(FPDurationStatistics);
        v24 = (void *)v9[9];
        v9[9] = v23;

        v25 = objc_alloc_init(FPDurationStatistics);
        v26 = (void *)v9[10];
        v9[10] = v25;

        v27 = objc_alloc_init(FPDurationStatistics);
        v28 = (void *)v9[13];
        v9[13] = v27;

        v29 = objc_alloc_init(FPDurationStatistics);
        v30 = (void *)v9[11];
        v9[11] = v29;

        v31 = objc_alloc_init(FPDurationStatistics);
        v32 = (void *)v9[12];
        v9[12] = v31;

        v33 = objc_alloc_init(FPDurationStatistics);
        v34 = (void *)v9[14];
        v9[14] = v33;

        v35 = objc_alloc_init(FPDurationStatistics);
        v36 = (void *)v9[15];
        v9[15] = v35;

        v37 = objc_alloc_init(FPDurationStatistics);
        v38 = (void *)v9[16];
        v9[16] = v37;

        v39 = objc_alloc_init(FPDurationStatistics);
        v40 = (void *)v9[17];
        v9[17] = v39;

        v41 = mach_continuous_time();
        v9[26] = v41;
        v9[27] = v41;
        *((_BYTE *)v9 + 9) = 1;
        do
          v42 = __ldaxr(&gFPLayerCount);
        while (__stlxr(v42 + 1, &gFPLayerCount));
        _MergedGlobals_0 = 1;
      }
    }
    else
    {
      v9 = 0;
    }
    v43 = v9;
    objc_opt_self();
    _FPGlobalLayerStateDictionary();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setObject:forKeyedSubscript:", v43, v45);

LABEL_14:
    goto LABEL_15;
  }
  if (_shouldEmitErrorSignpost())
  {
    _fpErrorHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v3))
    {
      LOWORD(v46.receiver) = 0;
      _os_signpost_emit_unreliably_with_name_impl();
    }
    goto LABEL_14;
  }
LABEL_15:
  if (qword_25430AED0 != -1)
    dispatch_once(&qword_25430AED0, &__block_literal_global_122);
}

+ (void)metalLayerDealloc:(uint64_t)a1
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[6];

  v3 = objc_opt_self();
  _FPLayerStateSyncQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__FPCAMetalLayerState_metalLayerDealloc___block_invoke;
  v5[3] = &__block_descriptor_48_e5_v8__0l;
  v5[4] = v3;
  v5[5] = a2;
  dispatch_async(v4, v5);

}

void __41__FPCAMetalLayerState_metalLayerDealloc___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  objc_opt_self();
  _FPGlobalLayerStateDictionary();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

+ (void)_updateLayerState:(void *)a3 block:
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v5 = objc_opt_self();
  _FPLayerStateSyncQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__FPCAMetalLayerState__updateLayerState_block___block_invoke;
  block[3] = &unk_250D47720;
  v10 = v5;
  v11 = a2;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, block);

}

void __47__FPCAMetalLayerState__updateLayerState_block___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;

  +[FPCAMetalLayerState _layerStateForAddress:](a1[5], a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  else if (_shouldEmitErrorSignpost())
  {
    _fpErrorHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    _fpErrorHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_make_with_pointer(v4, (const void *)a1[6]);

    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
      _os_signpost_emit_unreliably_with_name_impl();

  }
}

void __54__FPCAMetalLayerState_metalLayerSetSize_height_width___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a2 + 152);
    *(_QWORD *)(a2 + 152) = v4;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a2 + 160);
    *(_QWORD *)(a2 + 160) = v6;

    *(_BYTE *)(a2 + 9) = 1;
  }
}

void __60__FPCAMetalLayerState_metalLayerSetPixelFormat_pixelFormat___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDD16E0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "numberWithUnsignedInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_storeStrong(v4 + 21, v5);
    *((_BYTE *)v4 + 9) = 1;
  }

}

+ (void)metalLayerSetNameOfLayer:(void *)a3 name:
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = objc_opt_self();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__FPCAMetalLayerState_metalLayerSetNameOfLayer_name___block_invoke;
  v7[3] = &unk_250D47788;
  v8 = v4;
  v6 = v4;
  +[FPCAMetalLayerState _updateLayerState:block:](v5, a2, v7);

}

void __53__FPCAMetalLayerState_metalLayerSetNameOfLayer_name___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = v3;
  if (a2)
  {
    objc_storeStrong((id *)(a2 + 144), v3);
    *(_BYTE *)(a2 + 9) = 1;
  }

}

void __100__FPCAMetalLayerState_drawableLifetimeStart_drawableID_surfaceID_acquisitionWaitStart_acquiredTime___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  FPInFlightDrawableLifetime *v12;
  char *v13;
  unint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  __int128 v20;
  _BYTE v21[22];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_DWORD *)(a1 + 56);
    v20 = *(_OWORD *)(a1 + 40);
    v5 = (void *)MEMORY[0x24BDD16E0];
    v6 = *(id *)(a2 + 192);
    objc_msgSend(v5, "numberWithUnsignedInteger:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (_shouldEmitErrorSignpost())
      {
        _fpErrorHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if ((unint64_t)(*(_QWORD *)(a2 + 176) - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
        {
          v11 = v8[2];
          *(_DWORD *)v21 = 134218240;
          *(_QWORD *)&v21[4] = v3;
          *(_WORD *)&v21[12] = 2048;
          *(_QWORD *)&v21[14] = v11;
          _os_signpost_emit_unreliably_with_name_impl();
        }

      }
    }
    else
    {
      v12 = [FPInFlightDrawableLifetime alloc];
      if (v12)
      {
        *(_QWORD *)v21 = v12;
        *(_QWORD *)&v21[8] = FPInFlightDrawableLifetime;
        v13 = (char *)objc_msgSendSuper2((objc_super *)v21, sel_init);
        v8 = v13;
        if (v13)
        {
          *((_QWORD *)v13 + 2) = v3;
          *((_DWORD *)v13 + 2) = v4;
          *(_OWORD *)(v13 + 24) = v20;
          do
            v14 = __ldaxr(&gFPInFlightDrawableLifetimeCount);
          while (__stlxr(v14 + 1, &gFPInFlightDrawableLifetimeCount));
        }
      }
      else
      {
        v8 = 0;
      }
    }
    v15 = (void *)MEMORY[0x24BDD16E0];
    v16 = *(id *)(a2 + 192);
    objc_msgSend(v15, "numberWithUnsignedInteger:", v3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v8, v17);

    if (!*(_BYTE *)(a2 + 8))
    {
      *(_BYTE *)(a2 + 8) = 1;
      objc_opt_self();
      v18 = gFPNeedsReportCount;
      if (!gFPNeedsReportCount)
      {
        _aggregationTimerSource();
        v19 = objc_claimAutoreleasedReturnValue();
        dispatch_resume(v19);

        qword_25430AE70 = mach_continuous_time();
        v18 = gFPNeedsReportCount;
      }
      gFPNeedsReportCount = v18 + 1;
    }

  }
}

void __65__FPCAMetalLayerState_metalLayer_drawableID_clientPresentedTime___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = (void *)MEMORY[0x24BDD16E0];
    v6 = *(id *)(a2 + 200);
    objc_msgSend(v5, "numberWithUnsignedInteger:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDD16E0];
    v10 = *(id *)(a2 + 192);
    objc_msgSend(v9, "numberWithUnsignedInteger:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (!v8)
      {
        v12[5] = v4;
        v15 = (void *)MEMORY[0x24BDD16E0];
        v16 = *(id *)(a2 + 200);
        objc_msgSend(v15, "numberWithUnsignedInteger:", v3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v12, v17);

        v18 = *(void **)(a2 + 192);
        v19 = (void *)MEMORY[0x24BDD16E0];
        v20 = v18;
        objc_msgSend(v19, "numberWithUnsignedInteger:", v3);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "removeObjectForKey:", v21);

        +[FPCAMetalLayerState _globalScheduledCommandBuffers]();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "copy");
        v24 = (void *)v12[6];
        v12[6] = v23;

        objc_msgSend(v22, "removeAllObjects");
        goto LABEL_13;
      }
      if (_shouldEmitErrorSignpost())
      {
        _fpErrorHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (!os_signpost_enabled(v13))
        {
LABEL_11:

          goto LABEL_13;
        }
LABEL_10:
        _os_signpost_emit_unreliably_with_name_impl();
        goto LABEL_11;
      }
    }
    else if (_shouldEmitErrorSignpost())
    {
      _fpErrorHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      v13 = v14;
      if ((unint64_t)(v3 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v14))
        goto LABEL_11;
      goto LABEL_10;
    }
LABEL_13:

  }
}

+ (void)drawableLifetimeEnd:(uint64_t)a3 imageQueueID:(int)a4 drawableID:(uint64_t)a5 drawableFinishedTime:(char)a6 wasPresented:(void *)a7 targetCPUDeadline:(void *)a8 targetPresentationTime:
{
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  double v23;
  int v24;
  char v25;

  v14 = a7;
  v15 = a8;
  v16 = objc_opt_self();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __142__FPCAMetalLayerState_drawableLifetimeEnd_imageQueueID_drawableID_drawableFinishedTime_wasPresented_targetCPUDeadline_targetPresentationTime___block_invoke;
  v19[3] = &unk_250D477D0;
  v24 = a4;
  v21 = v15;
  v22 = a5;
  v23 = a1;
  v25 = a6;
  v20 = v14;
  v17 = v15;
  v18 = v14;
  +[FPCAMetalLayerState _updateLayerState:block:](v16, a3, v19);

}

void __142__FPCAMetalLayerState_drawableLifetimeEnd_imageQueueID_drawableID_drawableFinishedTime_wasPresented_targetCPUDeadline_targetPresentationTime___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  double v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  id v27;
  double v28;
  double v29;
  double *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  uint64_t v47;
  _BOOL4 v48;
  double v49;
  double v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  char v64;
  void *v65;
  double v66;
  double v67;
  id v68;
  void *v69;
  double v70;
  __int128 v71;
  id *v72;
  double v73;
  id v74;
  id v75;
  id v76;
  id v77;
  __int128 v78;
  int v79;
  uint64_t v80;
  void *v81;
  void **v82;
  NSObject *v83;
  FPOnGlassCAMetalLayerDrawableInterval *v84;
  os_signpost_id_t v85;
  __int128 v86;
  char *v87;
  int v88;
  const double *v89;
  float64x2_t v90;
  double v91;
  float64x2_t v92;
  float64x2_t v93;
  float64x2_t v94;
  float64x2_t v95;
  float64x2_t v96;
  float64x2_t v97;
  char *v98;
  unint64_t v99;
  _DWORD *v100;
  int v101;
  double v102;
  double v103;
  void *v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  void *v113;
  id v114;
  void *v115;
  uint64_t v116;
  void *v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  id v127;
  void *v128;
  uint64_t v129;
  __int128 v130;
  float64x2_t v131;
  id v132;
  void *v133;
  __int128 v134;
  __int128 v135;
  int v136;
  float64x2_t v137;
  id *v138;
  id v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  _BYTE v156[128];
  _BYTE v157[128];
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  uint8_t buf[4];
  _BYTE v163[14];
  __int16 v164;
  float64_t v165;
  __int16 v166;
  float64_t v167;
  __int16 v168;
  double v169;
  __int16 v170;
  float64_t v171;
  __int16 v172;
  uint64_t v173;
  __int16 v174;
  unint64_t v175;
  uint64_t v176;

  v176 = *MEMORY[0x24BDAC8D0];
  v3 = *(unsigned int *)(a1 + 64);
  v5 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(double *)(a1 + 56);
  v136 = *(unsigned __int8 *)(a1 + 68);
  v139 = *(id *)(a1 + 32);
  v7 = v5;
  if (a2)
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = *(id *)(a2 + 200);
    objc_msgSend(v8, "numberWithUnsignedInteger:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (id *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v133 = v7;
      v12 = (void *)MEMORY[0x24BDD16E0];
      v13 = *(id *)(a2 + 200);
      objc_msgSend(v12, "numberWithUnsignedInteger:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObjectForKey:", v14);

      v15 = *(void **)(a2 + 32);
      v16 = v15 == 0;
      if (v15 && objc_msgSend(v15, "unsignedLongLongValue") == v3)
      {
        v16 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(a2 + 32), v17);

      }
      v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v144 = 0u;
      v145 = 0u;
      v146 = 0u;
      v147 = 0u;
      v138 = v11;
      v19 = v11[6];
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v144, v157, 16);
      v21 = 0.0;
      v22 = 0.0;
      if (v20)
      {
        v23 = v20;
        v24 = *(_QWORD *)v145;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v145 != v24)
              objc_enumerationMutation(v19);
            v26 = *(_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * i);
            if (v26)
            {
              if (*(double *)(v26 + 56) != 0.0 && *(double *)(v26 + 64) != 0.0)
              {
                objc_msgSend(v18, "addObject:", *(_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * i));
                if (v22 < *(double *)(v26 + 64))
                  v22 = *(double *)(v26 + 64);
              }
            }
          }
          v23 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v144, v157, 16);
        }
        while (v23);
      }

      v27 = v18;
      v28 = 0.0;
      v29 = 0.0;
      if (objc_msgSend(v27, "count"))
      {
        if (objc_msgSend(v27, "count") == 1)
        {
          objc_msgSend(v27, "firstObject");
          v30 = (double *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            v21 = v30[7];
            v28 = v30[8];
            v29 = v28 - v21;
          }
          else
          {
            v21 = 0.0;
          }

          goto LABEL_64;
        }
        objc_msgSend(v27, "sortUsingComparator:", &__block_literal_global_121);
        v160 = 0u;
        v161 = 0u;
        v158 = 0u;
        v159 = 0u;
        v36 = v27;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v158, buf, 16);
        v21 = 0.0;
        if (!v37)
        {
          v40 = 1.79769313e308;
          v41 = 0.0;
          v42 = 0.0;
          goto LABEL_59;
        }
        v38 = v37;
        v39 = *(_QWORD *)v159;
        v40 = 1.79769313e308;
        v41 = 0.0;
        v42 = 0.0;
        while (1)
        {
          v43 = 0;
          do
          {
            if (*(_QWORD *)v159 != v39)
              objc_enumerationMutation(v36);
            v44 = *(_QWORD *)(*((_QWORD *)&v158 + 1) + 8 * v43);
            if (v44)
            {
              v46 = *(double *)(v44 + 56);
              v45 = *(double *)(v44 + 64);
              if (v40 >= v46)
                v40 = *(double *)(v44 + 56);
              if (v28 < v45)
                v28 = *(double *)(v44 + 64);
              if (v41 == 0.0 && v42 == 0.0)
                goto LABEL_46;
              if (v46 >= v42)
              {
                v29 = v29 + v42 - v41;
LABEL_46:
                v41 = *(double *)(v44 + 56);
                v42 = *(double *)(v44 + 64);
                goto LABEL_47;
              }
            }
            else
            {
              v45 = 0.0;
              v40 = fmin(v40, 0.0);
              if (v28 < 0.0)
                v28 = 0.0;
              if (v41 == 0.0 && v42 == 0.0)
              {
                v41 = 0.0;
                v42 = 0.0;
                goto LABEL_47;
              }
              if (v42 <= 0.0)
              {
                v29 = v29 + v42 - v41;
                v41 = 0.0;
                v42 = 0.0;
                goto LABEL_47;
              }
            }
            if (v42 < v45)
              v42 = v45;
LABEL_47:
            ++v43;
          }
          while (v38 != v43);
          v47 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v158, buf, 16);
          v38 = v47;
          if (!v47)
          {
LABEL_59:

            v29 = v29 + v42 - v41;
            v48 = v40 == 1.79769313e308;
            if (v28 == 0.0)
              v48 = 1;
            if (v48)
              v28 = 0.0;
            else
              v21 = v40;
            break;
          }
        }
      }
LABEL_64:

      if (v139)
      {
        *(_BYTE *)(a2 + 10) = 1;
        objc_msgSend(v139, "doubleValue");
        v50 = *((double *)v138 + 5);
        if (v50 > v49 + 0.001)
          objc_msgSend(*(id *)(a2 + 128), "addDurationSec:", v50 - v49);
      }
      v51 = *((double *)v138 + 4);
      v140 = 0u;
      v141 = 0u;
      v142 = 0u;
      v143 = 0u;
      v35 = v27;
      v52 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v140, v156, 16);
      if (v52)
      {
        v53 = v52;
        v54 = *(_QWORD *)v141;
        do
        {
          v55 = 0;
          do
          {
            if (*(_QWORD *)v141 != v54)
              objc_enumerationMutation(v35);
            v56 = *(_QWORD *)(*((_QWORD *)&v140 + 1) + 8 * v55);
            if (v56)
              v57 = *(double *)(v56 + 24);
            else
              v57 = 0.0;
            if (v51 >= v57)
              v51 = v57;
            ++v55;
          }
          while (v53 != v55);
          v58 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v140, v156, 16);
          v53 = v58;
        }
        while (v58);
      }

      if (v136)
      {
        v59 = *(id *)(a2 + 40);
        v60 = *(id *)(a2 + 64);
        v61 = *(id *)(a2 + 48);
        v62 = *(id *)(a2 + 56);
        v132 = *(id *)(a2 + 72);
        -[FPCAMetalLayerState previousPresentedLifetimeEnd](*(double **)(a2 + 184));
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        v64 = !v16;
        if (!v63)
          v64 = 1;
        if ((v64 & 1) == 0)
        {
          -[FPCAMetalLayerState previousPresentedLifetimeEnd](*(double **)(a2 + 184));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "doubleValue");
          v67 = v66 + 0.5;

          if (v51 <= v67)
          {
            v68 = *(id *)(a2 + 120);
            -[FPCAMetalLayerState previousPresentedLifetimeEnd](*(double **)(a2 + 184));
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "doubleValue");
            objc_msgSend(v68, "addDurationSec:", v6 - v70);

          }
        }
        *(_QWORD *)&v71 = v62;
        *((_QWORD *)&v71 + 1) = v60;
        v135 = v71;
        *(_QWORD *)&v71 = v59;
        *((_QWORD *)&v71 + 1) = v61;
        v134 = v71;
        v72 = v138;
        if (v133)
        {
          objc_msgSend(v133, "doubleValue");
          if (v73 + 0.001 < v6)
            objc_msgSend(*(id *)(a2 + 136), "addDurationSec:", v6 - v73, v73 + 0.001);
        }
      }
      else
      {
        v74 = *(id *)(a2 + 80);
        v75 = *(id *)(a2 + 104);
        v76 = *(id *)(a2 + 88);
        v77 = *(id *)(a2 + 96);
        v132 = *(id *)(a2 + 112);
        *(_QWORD *)&v78 = v74;
        *((_QWORD *)&v78 + 1) = v76;
        v134 = v78;
        *(_QWORD *)&v78 = v77;
        *((_QWORD *)&v78 + 1) = v75;
        v135 = v78;
        v72 = v138;
      }
      objc_msgSend(0, "addDurationSec:", *((double *)v72 + 5) - *((double *)v72 + 4));
      objc_msgSend(*((id *)&v135 + 1), "addDurationSec:", v29);
      if (v22 != 0.0)
        objc_msgSend(v132, "addDurationSec:", v6 - v22);
      v79 = objc_msgSend(v35, "count");
      v80 = 12;
      if (!v136)
        v80 = 16;
      *(_DWORD *)(a2 + v80) += v79;
      objc_msgSend((id)v134, "addDurationSec:", v6 - v51);
      objc_msgSend(*((id *)&v134 + 1), "addDurationSec:", *((double *)v72 + 5) - v51);
      objc_msgSend((id)v135, "addDurationSec:", v28 - v21);
      if (!v136)
        goto LABEL_107;
      v82 = (void **)(a2 + 184);
      v81 = *(void **)(a2 + 184);
      if (v81)
      {
        if (!gFPPerFrameSignpostingIsEnabled)
        {
LABEL_104:
          v100 = v81;
          v101 = objc_msgSend(v35, "count");
          if (v100)
          {
            v100[2] = v101;
            *((double *)v100 + 2) = v51;
            *((_QWORD *)v100 + 3) = v72[3];
            *((_QWORD *)v100 + 4) = v72[4];
            *((_QWORD *)v100 + 5) = v72[5];
            *((double *)v100 + 6) = v21;
            *((double *)v100 + 7) = v28;
            *((double *)v100 + 8) = v6;
            *((double *)v100 + 9) = v29;
          }

LABEL_107:
          v103 = *((double *)v72 + 4);
          v102 = *((double *)v72 + 5);
          objc_msgSend(*(id *)(a2 + 192), "allValues", v130);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v152 = 0u;
          v153 = 0u;
          v154 = 0u;
          v155 = 0u;
          v105 = v104;
          v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v152, buf, 16);
          if (!v106)
            goto LABEL_121;
          v107 = v106;
          v108 = *(_QWORD *)v153;
          while (1)
          {
            v109 = 0;
            do
            {
              if (*(_QWORD *)v153 != v108)
                objc_enumerationMutation(v105);
              v110 = *(_QWORD *)(*((_QWORD *)&v152 + 1) + 8 * v109);
              if (v110)
              {
                if (*(double *)(v110 + 32) > v103)
                  goto LABEL_116;
                v111 = *(void **)(a2 + 192);
                v112 = *(_QWORD *)(v110 + 16);
                goto LABEL_115;
              }
              if (v103 >= 0.0)
              {
                v112 = 0;
                v111 = *(void **)(a2 + 192);
LABEL_115:
                v113 = (void *)MEMORY[0x24BDD16E0];
                v114 = v111;
                objc_msgSend(v113, "numberWithUnsignedInteger:", v112);
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v114, "removeObjectForKey:", v115);

              }
LABEL_116:
              ++v109;
            }
            while (v107 != v109);
            v116 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v152, buf, 16);
            v107 = v116;
            if (!v116)
            {
LABEL_121:

              objc_msgSend(*(id *)(a2 + 200), "allValues");
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              v148 = 0u;
              v149 = 0u;
              v150 = 0u;
              v151 = 0u;
              v118 = v117;
              v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v148, &v158, 16);
              if (!v119)
                goto LABEL_135;
              v120 = v119;
              v121 = *(_QWORD *)v149;
              while (1)
              {
                v122 = 0;
                do
                {
                  if (*(_QWORD *)v149 != v121)
                    objc_enumerationMutation(v118);
                  v123 = *(_QWORD *)(*((_QWORD *)&v148 + 1) + 8 * v122);
                  if (v123)
                  {
                    if (*(double *)(v123 + 40) > v102)
                      goto LABEL_130;
                    v124 = *(void **)(a2 + 200);
                    v125 = *(_QWORD *)(v123 + 16);
                    goto LABEL_129;
                  }
                  if (v102 >= 0.0)
                  {
                    v125 = 0;
                    v124 = *(void **)(a2 + 200);
LABEL_129:
                    v126 = (void *)MEMORY[0x24BDD16E0];
                    v127 = v124;
                    objc_msgSend(v126, "numberWithUnsignedInteger:", v125);
                    v128 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v127, "removeObjectForKey:", v128);

                  }
LABEL_130:
                  ++v122;
                }
                while (v120 != v122);
                v129 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v148, &v158, 16);
                v120 = v129;
                if (!v129)
                {
LABEL_135:

                  v7 = v133;
                  v11 = v138;
                  goto LABEL_136;
                }
              }
            }
          }
        }
        _fpStateHandle();
        v83 = objc_claimAutoreleasedReturnValue();
        v84 = (FPOnGlassCAMetalLayerDrawableInterval *)v83;
        v85 = *(_QWORD *)(a2 + 176);
        if (v85 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v83))
        {
          v87 = (char *)*v82;
          if (*v82)
          {
            v88 = *((_DWORD *)v87 + 2);
            v89 = (const double *)(v87 + 16);
            v90 = *((float64x2_t *)v87 + 3);
            *(_QWORD *)&v86 = *((_QWORD *)v87 + 8);
            v91 = *((double *)v87 + 9) * 1000.0;
            v92 = (float64x2_t)vextq_s8((int8x16_t)v90, (int8x16_t)v90, 8uLL);
            *(_QWORD *)&v90.f64[0] = v86;
            v130 = v86;
            *(_QWORD *)&v93.f64[0] = v86;
            v93.f64[1] = *((float64_t *)v87 + 5);
            v94 = vld1q_dup_f64(v89);
            v95 = vsubq_f64(v90, v92);
            v96 = vsubq_f64(v93, v94);
            v97 = (float64x2_t)vdupq_n_s64(0x408F400000000000uLL);
            v131 = vmulq_f64(v96, v97);
            v137 = vmulq_f64(v95, v97);
          }
          else
          {
            v88 = 0;
            v137 = 0u;
            v91 = 0.0;
            v130 = 0u;
            v131 = 0u;
          }
          v98 = v87;
          *(_QWORD *)&v130 = FPTimeIntervalToMachContinuousRescaled(*(double *)&v130);
          v99 = FPTimeIntervalToMachContinuousRescaled(v6);
          *(_DWORD *)buf = 67241984;
          *(_DWORD *)v163 = v88;
          *(_WORD *)&v163[4] = 2050;
          *(float64_t *)&v163[6] = v131.f64[0];
          v164 = 2050;
          v165 = v131.f64[1];
          v166 = 2050;
          v167 = v137.f64[1];
          v168 = 2050;
          v169 = v91;
          v170 = 2050;
          v171 = v137.f64[0];
          v172 = 2050;
          v173 = v130;
          v174 = 2050;
          v175 = v99;
          _os_signpost_emit_with_name_impl(&dword_23C4DA000, &v84->super, OS_SIGNPOST_EVENT, v85, "OnGlassDrawableInterval", "Signpost ID is CAMetalLayer ID\nCommand Buffer Count = %{public, name=command_buffer_count}u\nIn-Flight Total End-to-end = %{public, name=inflight_end_to_end_total_ms}.3fms\nIn-Flight CPU End-to-end = %{public, name=inflight_end_to_end_cpu_ms}.3fms\nIn-Flight GPU End-to-end = %{public, name=inflight_end_to_end_gpu_ms}.3fms\nTotal On-GPU Time = %{public, name=inflight_on_gpu_ms}.3fms\nWait to land on glass = %{public, name=inflight_wait_for_glass_ms}.3fms\n%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu", buf, 0x4Eu);

        }
      }
      else
      {
        v84 = objc_alloc_init(FPOnGlassCAMetalLayerDrawableInterval);
        objc_storeStrong((id *)(a2 + 184), v84);
      }

      v81 = *v82;
      goto LABEL_104;
    }
    if (_shouldEmitErrorSignpost())
    {
      _fpErrorHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v31))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v163 = v4;
        _os_signpost_emit_unreliably_with_name_impl();
      }

    }
    v32 = (void *)MEMORY[0x24BDD16E0];
    v33 = *(id *)(a2 + 192);
    objc_msgSend(v32, "numberWithUnsignedInteger:", v4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "removeObjectForKey:", v34);

    +[FPCAMetalLayerState _globalScheduledCommandBuffers]();
    v35 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "removeAllObjects");
LABEL_136:

  }
}

+ (id)_commandBufferForAddress:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_self();
  _FPGlobalInFlightCommandBufferDictionary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)_updateCommandBufferState:(void *)a3 block:
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v5 = objc_opt_self();
  _FPLayerStateSyncQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__FPCAMetalLayerState__updateCommandBufferState_block___block_invoke;
  block[3] = &unk_250D47720;
  v10 = v5;
  v11 = a2;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, block);

}

void __55__FPCAMetalLayerState__updateCommandBufferState_block___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;

  +[FPCAMetalLayerState _commandBufferForAddress:](a1[5], a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  else if (_shouldEmitErrorSignpost())
  {
    _fpErrorHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    _fpErrorHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_make_with_pointer(v4, (const void *)a1[6]);

    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
      _os_signpost_emit_unreliably_with_name_impl();

  }
}

+ (void)commandBufferCreate:(uint64_t)a3 creationTime:
{
  uint64_t v5;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[7];

  v5 = objc_opt_self();
  if (atomic_load(&gFPLayerCount))
  {
    v7 = v5;
    _FPLayerStateSyncQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__FPCAMetalLayerState_commandBufferCreate_creationTime___block_invoke;
    block[3] = &__block_descriptor_56_e5_v8__0l;
    block[4] = v7;
    block[5] = a2;
    block[6] = a3;
    dispatch_async(v8, block);

  }
}

void __56__FPCAMetalLayerState_commandBufferCreate_creationTime___block_invoke(uint64_t a1)
{
  const void *v1;
  unint64_t v2;
  double v3;
  uint64_t v4;
  double v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  FPInFlightCommandBuffer *v10;
  void *v11;
  void *address;
  void *v13;
  uint64_t v14;

  v1 = *(const void **)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 48);
  if (FPScaleMachTimestamp_onceToken != -1)
    dispatch_once(&FPScaleMachTimestamp_onceToken, &__block_literal_global_0);
  v3 = *(double *)&gTimebaseRatio;
  v4 = objc_opt_self();
  if (v1)
  {
    v5 = v3 * (double)v2;
    +[FPCAMetalLayerState _commandBufferForAddress:](v4, (uint64_t)v1);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6 && _shouldEmitErrorSignpost())
    {
      _fpErrorHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      _fpErrorHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_signpost_id_make_with_pointer(v8, v1);

      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        LOWORD(v14) = 0;
        _os_signpost_emit_unreliably_with_name_impl();
      }

    }
    v10 = -[FPInFlightCommandBuffer initWithAddress:creationTime:]([FPInFlightCommandBuffer alloc], "initWithAddress:creationTime:", v1, v5);
    objc_opt_self();
    _FPGlobalInFlightCommandBufferDictionary();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      address = v10->_address;
    else
      address = 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", address, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v13);

LABEL_13:
    return;
  }
  if (_shouldEmitErrorSignpost())
  {
    _fpErrorHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
      _os_signpost_emit_unreliably_with_name_impl();
    goto LABEL_13;
  }
}

+ (void)commandBufferCommit:(uint64_t)a3 commitTime:
{
  uint64_t v5;
  _QWORD v7[5];

  v5 = objc_opt_self();
  if (atomic_load(&gFPLayerCount))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __54__FPCAMetalLayerState_commandBufferCommit_commitTime___block_invoke;
    v7[3] = &__block_descriptor_40_e33_v16__0__FPInFlightCommandBuffer_8l;
    v7[4] = a3;
    +[FPCAMetalLayerState _updateCommandBufferState:block:](v5, a2, v7);
  }
}

void __54__FPCAMetalLayerState_commandBufferCommit_commitTime___block_invoke(uint64_t a1, void *a2)
{
  double *v3;
  unint64_t v4;
  double *v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (FPScaleMachTimestamp_onceToken != -1)
  {
    v5 = v3;
    dispatch_once(&FPScaleMachTimestamp_onceToken, &__block_literal_global_0);
    v3 = v5;
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v3)
LABEL_3:
    v3[4] = *(double *)&gTimebaseRatio * (double)v4;
LABEL_4:

}

+ (void)commandBufferScheduled:(uint64_t)a3 kernelStartTime:(uint64_t)a4 kernelEndTime:
{
  uint64_t v7;
  _QWORD v9[7];

  v7 = objc_opt_self();
  if (atomic_load(&gFPLayerCount))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __76__FPCAMetalLayerState_commandBufferScheduled_kernelStartTime_kernelEndTime___block_invoke;
    v9[3] = &__block_descriptor_56_e33_v16__0__FPInFlightCommandBuffer_8l;
    v9[4] = a3;
    v9[5] = a4;
    v9[6] = v7;
    +[FPCAMetalLayerState _updateCommandBufferState:block:](v7, a2, v9);
  }
}

void __76__FPCAMetalLayerState_commandBufferScheduled_kernelStartTime_kernelEndTime___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  double *v4;
  double *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  double *v9;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  v5 = v4;
  if (FPScaleMachTimestamp_onceToken == -1)
  {
    if (v4)
    {
LABEL_3:
      v5[5] = *(double *)&gTimebaseRatio * (double)v3;
      v5[6] = *(double *)&gTimebaseRatio * (double)*(unint64_t *)(a1 + 40);
    }
  }
  else
  {
    dispatch_once(&FPScaleMachTimestamp_onceToken, &__block_literal_global_0);
    if (v5)
      goto LABEL_3;
  }
  v9 = v5;
  objc_opt_self();
  _FPGlobalLayerStateDictionary();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v5)
    *((_BYTE *)v9 + 8) = v7 > 1;
  +[FPCAMetalLayerState _globalScheduledCommandBuffers]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

}

+ (void)commandBufferCompleted:(uint64_t)a3 gpuStartTime:(uint64_t)a4 gpuEndTime:
{
  uint64_t v7;
  _QWORD v9[8];

  v7 = objc_opt_self();
  if (atomic_load(&gFPLayerCount))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __70__FPCAMetalLayerState_commandBufferCompleted_gpuStartTime_gpuEndTime___block_invoke;
    v9[3] = &__block_descriptor_64_e33_v16__0__FPInFlightCommandBuffer_8l;
    v9[4] = a3;
    v9[5] = a4;
    v9[6] = v7;
    v9[7] = a2;
    +[FPCAMetalLayerState _updateCommandBufferState:block:](v7, a2, v9);
  }
}

void __70__FPCAMetalLayerState_commandBufferCompleted_gpuStartTime_gpuEndTime___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = a1[4];
  v11 = v3;
  if (v4 || a1[5])
  {
    if (FPScaleMachTimestamp_onceToken == -1)
    {
      if (v3)
      {
LABEL_5:
        *((double *)v3 + 7) = *(double *)&gTimebaseRatio * (double)v4;
        *((double *)v3 + 8) = *(double *)&gTimebaseRatio * (double)(unint64_t)a1[5];
      }
    }
    else
    {
      dispatch_once(&FPScaleMachTimestamp_onceToken, &__block_literal_global_0);
      v3 = v11;
      if (v11)
        goto LABEL_5;
    }
  }
  v5 = a1[7];
  objc_opt_self();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _FPGlobalInFlightCommandBufferDictionary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    _FPGlobalInFlightCommandBufferDictionary();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v10);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientPresentedInFlightDrawables, 0);
  objc_storeStrong((id *)&self->_acquiredInFlightDrawables, 0);
  objc_storeStrong((id *)&self->_previousDrawableOnGlassDrawable, 0);
  objc_storeStrong((id *)&self->_pixelFormat, 0);
  objc_storeStrong((id *)&self->_width, 0);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_onGlassPresentationLatenessStats, 0);
  objc_storeStrong((id *)&self->_clientPresentationLatenessStats, 0);
  objc_storeStrong((id *)&self->_onScreenStats, 0);
  objc_storeStrong((id *)&self->_skippedGPUFinishToPresentLatency, 0);
  objc_storeStrong((id *)&self->_skippedOnGPUTimeStats, 0);
  objc_storeStrong((id *)&self->_skippedGPUWalltimeStats, 0);
  objc_storeStrong((id *)&self->_skippedCPUWalltimeStats, 0);
  objc_storeStrong((id *)&self->_skippedEndToEndDrawableLifetimeStats, 0);
  objc_storeStrong((id *)&self->_presentedGPUFinishToPresentLatency, 0);
  objc_storeStrong((id *)&self->_presentedOnGPUTimeStats, 0);
  objc_storeStrong((id *)&self->_presentedGPUWalltimeStats, 0);
  objc_storeStrong((id *)&self->_presentedCPUWalltimeStats, 0);
  objc_storeStrong((id *)&self->_presentedEndToEndDrawableLifetimeStats, 0);
  objc_storeStrong((id *)&self->_imageQueueID, 0);
}

@end
