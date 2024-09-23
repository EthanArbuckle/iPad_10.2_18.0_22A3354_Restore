@implementation SNKShotFeaturizerImpl

+ (id)defaultRandomNumberGenerator
{
  return &unk_1E97B1490;
}

+ (id)pseudoRandomNumberGeneratorWithSeed:(unsigned int)a3
{
  void *v3;
  _QWORD aBlock[5];
  _QWORD v6[3];
  unsigned int v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v7 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D44E62C4;
  aBlock[3] = &unk_1E97C4340;
  aBlock[4] = v6;
  v3 = _Block_copy(aBlock);
  _Block_object_dispose(v6, 8);
  return v3;
}

+ (id)featurizeFiles:(id)a3 hallucinatorModelURL:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v30;
  id v31;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD aBlock[4];
  id v40;
  id v41;
  id v42;
  id v43;

  v9 = a6;
  v10 = (objc_class *)MEMORY[0x1E0C99DE8];
  v31 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(v10);
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D44E75C0;
  aBlock[3] = &unk_1E97C4368;
  v18 = v13;
  v40 = v18;
  v19 = v14;
  v41 = v19;
  v20 = v15;
  v42 = v20;
  v21 = v16;
  v43 = v21;
  v22 = _Block_copy(aBlock);
  v33[0] = v17;
  v33[1] = 3221225472;
  v33[2] = sub_1D44E76A4;
  v33[3] = &unk_1E97C4390;
  v34 = v18;
  v35 = v19;
  v36 = v20;
  v37 = v21;
  v38 = v9;
  v30 = v9;
  v23 = v21;
  v24 = v20;
  v25 = v19;
  v26 = v18;
  v27 = _Block_copy(v33);
  objc_msgSend(a1, "featurizeFiles:hallucinatorModelURL:queue:resultHandler:completionHandler:", v12, v11, v31, v22, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)featurizeFiles:(id)a3 hallucinatorModelURL:(id)a4 queue:(id)a5 resultHandler:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  SNBooleanCancellable *v17;
  SNBooleanCancellable *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  SNBooleanCancellable *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  SNBooleanCancellable *v29;
  id v30;
  id v31;
  id v32;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = a5;
  v17 = objc_alloc_init(SNBooleanCancellable);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_1D44E78E8;
  v26[3] = &unk_1E97C43B8;
  v32 = a1;
  v27 = v12;
  v28 = v13;
  v18 = v17;
  v29 = v18;
  v30 = v14;
  v31 = v15;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(v16, v26);

  v23 = v31;
  v24 = v18;

  return v24;
}

+ (id)performSegmentationRequest:(id)a3 error:(id *)a4
{
  NSObject *v4;
  uint64_t v5;
  float64x2_t v6;
  int32x2_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void (**v20)(_QWORD);
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  float *v33;
  unint64_t v34;
  float *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  int v40;
  uint64_t v41;
  float *v42;
  float v43;
  float v44;
  unint64_t v45;
  unint64_t v46;
  unsigned int v47;
  float *v48;
  unsigned int v49;
  int v50;
  float *v51;
  uint64_t v52;
  float v53;
  float v54;
  unint64_t v55;
  unint64_t v56;
  SNKShotSegmentationResult *v57;
  void *v58;
  unint64_t v59;
  float *v60;
  float v61;
  float v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  void *v76;
  void *v77;
  _BOOL4 v78;
  void *v79;
  void *v80;
  void *v81;
  unint64_t v82;
  void *v83;
  void *v84;
  CMTimeValue value;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  int32_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  CMTimeValue v96;
  uint64_t v97;
  CMTimeValue v98;
  uint64_t v99;
  uint64_t v100;
  int32_t v101;
  SNKShotSegment *v102;
  SNKShotSegment *v103;
  void *v104;
  int v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  int v115;
  id v116;
  void *v117;
  void *v118;
  void *v119;
  int v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  id v124;
  id v125;
  void (**v126)(_QWORD);
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  SNKShotSegment *v132;
  float *v133;
  int v134;
  CMTimeValue v135;
  void *v136;
  void *v137;
  void *v138;
  int v139;
  int v140;
  id v141;
  Float64 v142;
  int v143;
  SNKShotSegmentationResult *v144;
  Float64 Seconds;
  void *v148;
  id obj;
  float *obja;
  id objb;
  void *v152;
  id v153;
  _QWORD v154[4];
  id v155;
  id v156;
  CMTime *p_buf;
  CMTimeValue v158;
  id v159;
  float *v160;
  int v161;
  int v162;
  uint64_t v163;
  int v164;
  int v165;
  CMTime buf;
  int v167;
  SNKShotSegment *v168;
  SNKShotSegment *v169;
  CMTime v170;
  CMTimeRange v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  CMTime duration;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  CMTime v179;
  CMTimeRange v180;
  __int128 v181;
  _QWORD v182[4];
  CMTime time2;
  __int128 v184;
  _QWORD v185[4];
  CMTime time1;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  CMTime v190;
  CMTimeRange v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  CMTime v195;
  CMTimeRange v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  CMTime v203;
  CMTimeRange v204;
  CMTimeRange v205;
  CMTime v206;
  CMTime v207;
  CMTimeRange v208;
  CMTimeRange v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  CMTime v213;
  CMTimeRange v214;
  CMTime v215;
  CMTimeRange v216;
  CMTimeRange range;
  CMTime end;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  CMTime start;
  CMTimeRange v223;
  _QWORD v224[5];
  id v225;
  id v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  _QWORD aBlock[5];
  id v232;
  id v233;
  uint64_t v234;
  int v235;
  int32x2_t v236;
  int v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  CMTime v242;
  CMTime time;
  _QWORD v244[2];
  _QWORD v245[3];
  _QWORD v246[3];
  _QWORD v247[2];
  _BYTE v248[128];
  _BYTE v249[128];
  uint64_t v250;

  v250 = *MEMORY[0x1E0C80C00];
  v153 = a3;
  sub_1D4501768();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.value) = 0;
    _os_log_impl(&dword_1D42A7000, v4, OS_LOG_TYPE_DEFAULT, "[Custom Sound Recognition Model Training] Starting segmentation.", (uint8_t *)&buf, 2u);
  }

  v152 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 20);
  if (v153)
  {
    objc_msgSend(v153, "hangoverDuration");
    Seconds = CMTimeGetSeconds(&time);
    objc_msgSend(v153, "minSegmentDuration");
  }
  else
  {
    memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    memset(&v242, 0, sizeof(v242));
  }
  v142 = CMTimeGetSeconds(&v242);
  v240 = 0u;
  v241 = 0u;
  v238 = 0u;
  v239 = 0u;
  objc_msgSend(v153, "fileURLs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v238, v249, 16);
  if (v5)
  {
    v6.f64[0] = Seconds;
    v6.f64[1] = v142;
    v7 = vcvt_s32_f32(vdiv_f32(vmul_f32(vcvt_f32_f64(v6), (float32x2_t)vdup_n_s32(0x467A0000u)), (float32x2_t)vdup_n_s32(0x43200000u)));
    v8 = *(_QWORD *)v239;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v239 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v238 + 1) + 8 * i);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = sub_1D44E9678;
        aBlock[3] = &unk_1E97C43E0;
        aBlock[4] = v10;
        v234 = 0x6000000010;
        v235 = 48;
        v232 = v153;
        v236 = v7;
        v237 = 1056964608;
        v233 = v152;
        v11 = (void (**)(_QWORD))_Block_copy(aBlock);
        v12 = (void *)MEMORY[0x1D825DE1C]();
        v11[2](v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v12);
        if (v13)
        {
          if (a4)
            *a4 = objc_retainAutorelease(v13);

          v57 = 0;
          goto LABEL_138;
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v238, v249, 16);
    }
    while (v5);
  }

  v148 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v152, "count"));
  v230 = 0u;
  v229 = 0u;
  v228 = 0u;
  v227 = 0u;
  v14 = v152;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v227, v248, 16);
  if (!v15)
    goto LABEL_22;
  v16 = *(_QWORD *)v228;
  v17 = MEMORY[0x1E0C809B0];
  do
  {
    for (j = 0; j != v15; ++j)
    {
      if (*(_QWORD *)v228 != v16)
        objc_enumerationMutation(v14);
      v19 = *(_QWORD *)(*((_QWORD *)&v227 + 1) + 8 * j);
      v224[0] = v17;
      v224[1] = 3221225472;
      v224[2] = sub_1D44EA6CC;
      v224[3] = &unk_1E97C4408;
      v226 = a1;
      v224[4] = v19;
      v225 = v148;
      v20 = (void (**)(_QWORD))_Block_copy(v224);
      v21 = (void *)MEMORY[0x1D825DE1C]();
      v20[2](v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v21);
      if (v22)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v22);

        goto LABEL_52;
      }

    }
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v227, v248, 16);
  }
  while (v15);
LABEL_22:

  v23 = objc_alloc(MEMORY[0x1E0C9E970]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v247[0] = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v247[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v247, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v23, "initWithShape:dataType:error:", v26, 65568, a4);

  if (!v27)
  {
    v14 = 0;
LABEL_52:
    obj = 0;
    v57 = 0;
    goto LABEL_137;
  }
  v141 = objc_retainAutorelease(v27);
  obja = (float *)objc_msgSend(v141, "dataPointer");
  objc_msgSend(v141, "strides");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = objc_msgSend(v29, "intValue");

  objc_msgSend(v141, "strides");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = objc_msgSend(v31, "intValue");

  if (!objc_msgSend(v14, "count"))
  {
LABEL_30:
    v40 = 0;
    if (objc_msgSend(v14, "count"))
    {
      v41 = 1;
      v42 = obja;
      do
      {
        v43 = *v42;
        objc_msgSend(v153, "similarityThreshold");
        if (v43 > v44)
          ++v40;
        v45 = objc_msgSend(v14, "count");
        v46 = v41++;
        v42 += v143;
      }
      while (v45 > v46);
    }
    if ((unint64_t)objc_msgSend(v14, "count") < 2)
    {
      v47 = 0;
    }
    else
    {
      v47 = 0;
      v48 = &obja[v139];
      v49 = 1;
      do
      {
        v50 = 0;
        if (objc_msgSend(v14, "count"))
        {
          v51 = v48;
          v52 = 1;
          do
          {
            v53 = *v51;
            objc_msgSend(v153, "similarityThreshold");
            if (v53 > v54)
              ++v50;
            v55 = objc_msgSend(v14, "count");
            v56 = v52++;
            v51 += v143;
          }
          while (v55 > v56);
        }
        if (v50 > v40)
        {
          v47 = v49;
          v40 = v50;
        }
        ++v49;
        v48 += v139;
      }
      while (objc_msgSend(v14, "count") > (unint64_t)v49);
    }
    v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 20);
    if (objc_msgSend(v14, "count"))
    {
      v59 = 0;
      v60 = &obja[v47 * v139];
      do
      {
        v61 = *v60;
        objc_msgSend(v153, "similarityThreshold");
        if (v61 > v62)
        {
          if (!objc_msgSend(v58, "count"))
            goto LABEL_61;
          objc_msgSend(v58, "lastObject");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "url");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectAtIndexedSubscript:", v59);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "url");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v64 == v66;

          if (v67)
          {
            objc_msgSend(v58, "lastObject");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = v69;
            if (v69)
            {
              objc_msgSend(v69, "timeRange");
            }
            else
            {
              v221 = 0u;
              v220 = 0u;
              v219 = 0u;
            }
            *(_OWORD *)&start.value = v219;
            start.epoch = v220;
            objc_msgSend(v14, "objectAtIndexedSubscript:", v59);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = v70;
            if (v70)
              objc_msgSend(v70, "timeRange");
            else
              memset(&range, 0, sizeof(range));
            CMTimeRangeGetEnd(&end, &range);
            CMTimeRangeFromTimeToTime(&v223, &start, &end);
            objc_msgSend(v58, "lastObject");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v216 = v223;
            objc_msgSend(v72, "setTimeRange:", &v216);

          }
          else
          {
LABEL_61:
            objc_msgSend(v14, "objectAtIndexedSubscript:", v59);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "addObject:", v68);
          }

          objc_msgSend(v14, "objectAtIndexedSubscript:", v59);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v73;
          if (v73)
            objc_msgSend(v73, "timeRange");
          else
            memset(&v214, 0, sizeof(v214));
          CMTimeRangeGetEnd(&v215, &v214);
          v75 = CMTimeGetSeconds(&v215);
          objc_msgSend(v58, "lastObject");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = v76;
          if (v76)
          {
            objc_msgSend(v76, "timeRange");
          }
          else
          {
            v212 = 0u;
            v211 = 0u;
            v210 = 0u;
          }
          *(_OWORD *)&v213.value = v210;
          v213.epoch = v211;
          v78 = v75 - CMTimeGetSeconds(&v213) > 10.0;

          if (v78)
          {
            memset(&buf, 0, sizeof(buf));
            objc_msgSend(v58, "lastObject");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = v79;
            if (v79)
              objc_msgSend(v79, "timeRange");
            else
              memset(&v209, 0, sizeof(v209));
            CMTimeRangeGetEnd(&buf, &v209);

            CMTimeMake(&v207, buf.value - 10 * buf.timescale, buf.timescale);
            v206 = buf;
            CMTimeRangeFromTimeToTime(&v208, &v207, &v206);
            objc_msgSend(v58, "lastObject");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v205 = v208;
            objc_msgSend(v81, "setTimeRange:", &v205);

          }
        }
        ++v59;
        v60 += v143;
      }
      while (objc_msgSend(v14, "count") > v59);
    }
    objc_msgSend(v58, "sortedArrayUsingComparator:", &unk_1E97C4448);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = (unint64_t)(objc_msgSend(v138, "count") - 1) >> 1;
    objc_msgSend(v138, "objectAtIndexedSubscript:", v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v83;
    if (v83)
      objc_msgSend(v83, "timeRange");
    else
      memset(&v204, 0, sizeof(v204));
    CMTimeRangeGetEnd(&v203, &v204);
    value = v203.value;
    objc_msgSend(v138, "objectAtIndexedSubscript:", v82);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v86;
    if (v86)
    {
      objc_msgSend(v86, "timeRange");
      v88 = v200;
    }
    else
    {
      v88 = 0;
      v201 = 0u;
      v202 = 0u;
      v200 = 0u;
    }

    memset(&v206, 0, sizeof(v206));
    objc_msgSend(v138, "objectAtIndexedSubscript:", v82);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v89;
    if (v89)
    {
      objc_msgSend(v89, "timeRange");
      v91 = DWORD2(v197);
    }
    else
    {
      v91 = 0;
      v198 = 0u;
      v199 = 0u;
      v197 = 0u;
    }
    v135 = value - v88;
    CMTimeMake(&v206, value - v88, v91);

    objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v58, "count") >= 2)
    {
      v140 = 0;
      v93 = 1;
      while (1)
      {
        objc_msgSend(v58, "objectAtIndexedSubscript:", v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = v94;
        if (v94)
        {
          objc_msgSend(v94, "timeRange");
          CMTimeRangeGetEnd(&v195, &v196);
          v96 = v195.value;
          objc_msgSend(v95, "timeRange");
          v97 = v192;
          if (!v92)
            goto LABEL_96;
        }
        else
        {
          memset(&v196, 0, sizeof(v196));
          CMTimeRangeGetEnd(&v195, &v196);
          v97 = 0;
          v96 = v195.value;
          v192 = 0u;
          v193 = 0u;
          v194 = 0u;
          if (!v92)
          {
LABEL_96:
            memset(&v191, 0, sizeof(v191));
            CMTimeRangeGetEnd(&v190, &v191);
            v99 = 0;
            v98 = v190.value;
            v187 = 0u;
            v188 = 0u;
            v189 = 0u;
            goto LABEL_97;
          }
        }
        objc_msgSend(v92, "timeRange");
        CMTimeRangeGetEnd(&v190, &v191);
        v98 = v190.value;
        objc_msgSend(v92, "timeRange");
        v99 = v187;
LABEL_97:
        if (v96 - v97 < v98 - v99)
        {
          objc_msgSend(v58, "objectAtIndexedSubscript:", v93);
          v100 = objc_claimAutoreleasedReturnValue();

          v140 = v93;
          v92 = (void *)v100;
        }
        if (v95)
        {
          objc_msgSend(v95, "timeRange");
        }
        else
        {
          memset(v185, 0, sizeof(v185));
          v184 = 0u;
        }
        time1 = *(CMTime *)&v185[1];
        if (v92)
        {
          objc_msgSend(v92, "timeRange");
        }
        else
        {
          memset(v182, 0, sizeof(v182));
          v181 = 0u;
        }
        time2 = *(CMTime *)&v182[1];
        if (CMTimeCompare(&time1, &time2) < 0)
        {
          if (v95)
          {
            objc_msgSend(v95, "timeRange");
            *(_OWORD *)&v179.value = v176;
            v179.epoch = v177;
            objc_msgSend(v95, "timeRange");
            v101 = DWORD2(v172);
          }
          else
          {
            v101 = 0;
            v177 = 0u;
            v178 = 0u;
            v176 = 0u;
            memset(&v179, 0, sizeof(v179));
            v172 = 0u;
            v173 = 0u;
            v174 = 0u;
          }
          buf = v206;
          CMTimeConvertScale(&duration, &buf, v101, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
          CMTimeRangeMake(&v180, &v179, &duration);
          v171 = v180;
          objc_msgSend(v95, "setTimeRange:", &v171);
        }

        if (objc_msgSend(v58, "count") <= (unint64_t)++v93)
          goto LABEL_113;
      }
    }
    v140 = 0;
LABEL_113:
    CMTimeMake(&v170, 1, 1);
    v169 = 0;
    sub_1D44E6C70((uint64_t)a1, (__int128 *)&v170.value, v92, &v169);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v169;
    if (!v136)
    {
      obj = v102;
      +[SNError populateClientError:withCode:underlyingError:message:](SNError, "populateClientError:withCode:underlyingError:message:", a4, 1);
      v57 = 0;
LABEL_135:

      goto LABEL_136;
    }
    v103 = v102;
    v168 = v102;
    sub_1D44E6E9C((uint64_t)a1, 2, v136, 0, (uint64_t)&unk_1E97DAA58, &v168);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = v168;

    if (!v104)
    {
      +[SNError populateClientError:withCode:underlyingError:message:](SNError, "populateClientError:withCode:underlyingError:message:", a4, 1, v132, CFSTR("Error ensuring segment length."));
      v57 = 0;
LABEL_134:

      obj = v132;
      goto LABEL_135;
    }
    v105 = objc_msgSend(v104, "count");
    v137 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v105);
    if (v105 < 1)
    {
LABEL_119:
      v113 = (void *)MEMORY[0x1E0C9E970];
      objc_msgSend(v137, "objectAtIndexedSubscript:", 0);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "multiArrayByConcatenatingMultiArrays:alongAxis:dataType:", v137, 1, objc_msgSend(v114, "dataType"));
      objb = (id)objc_claimAutoreleasedReturnValue();

      v115 = objc_msgSend(v104, "count");
      v116 = objc_alloc(MEMORY[0x1E0C9E970]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 48);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v244[0] = v117;
      v134 = 96 * v115;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v244[1] = v118;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v244, 2);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (SNKShotSegmentationResult *)objc_msgSend(v116, "initWithShape:dataType:error:", v119, 65568, a4);

      if (!v57)
      {

LABEL_133:
        goto LABEL_134;
      }
      v144 = objc_retainAutorelease(v57);
      v133 = (float *)-[SNKShotSegmentationResult dataPointer](v144, "dataPointer");
      objb = objc_retainAutorelease(objb);
      vDSP_mtrans((const float *)objc_msgSend(objb, "dataPointer"), 1, v133, 1, 0x30uLL, v134);
      v112 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 20);
      v120 = objc_msgSend(v58, "count");
      buf.value = 0;
      *(_QWORD *)&buf.timescale = &buf;
      buf.epoch = 0x2020000000;
      v167 = v140;
      if (v120 < 1)
      {
LABEL_124:
        v57 = objc_alloc_init(SNKShotSegmentationResult);
        -[SNKShotSegmentationResult setSegments:](v57, "setSegments:", v112);
        objc_msgSend(v148, "objectAtIndexedSubscript:", v140);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        -[SNKShotSegmentationResult setExemplarEmbedding:](v57, "setExemplarEmbedding:", v129);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(int *)(*(_QWORD *)&buf.timescale + 24));
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        -[SNKShotSegmentationResult setExemplarIndex:](v57, "setExemplarIndex:", v130);

        +[SNUtils logKShotSegments:exemplarIndex:](SNUtils, "logKShotSegments:exemplarIndex:", v112, *(int *)(*(_QWORD *)&buf.timescale + 24));
      }
      else
      {
        v121 = 0;
        v122 = v120;
        while (1)
        {
          objc_msgSend(v58, "objectAtIndexedSubscript:", v121);
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          v154[0] = MEMORY[0x1E0C809B0];
          v154[1] = 3221225472;
          v154[2] = sub_1D44EA904;
          v154[3] = &unk_1E97C4470;
          v124 = v123;
          v155 = v124;
          v161 = v121;
          v162 = v140;
          v125 = v112;
          v158 = v135;
          v159 = a1;
          v163 = 0x6000000010;
          v164 = 48;
          v165 = v134;
          v160 = v133;
          v156 = v125;
          p_buf = &buf;
          v126 = (void (**)(_QWORD))_Block_copy(v154);
          v127 = (void *)MEMORY[0x1D825DE1C]();
          v126[2](v126);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_autoreleasePoolPop(v127);
          if (v128)
            break;

          if (v122 == ++v121)
            goto LABEL_124;
        }
        if (a4)
          *a4 = objc_retainAutorelease(v128);

        v57 = 0;
      }
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v106 = 0;
      v107 = v105;
      while (1)
      {
        objc_msgSend(v104, "objectAtIndexedSubscript:", v106);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "featureVector");
        objb = (id)objc_claimAutoreleasedReturnValue();

        v246[0] = &unk_1E97DA328;
        v246[1] = &unk_1E97DA328;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 16);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v246[2] = v109;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v246, 3);
        v144 = (SNKShotSegmentationResult *)objc_claimAutoreleasedReturnValue();

        v245[0] = &unk_1E97DA340;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 96);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v245[1] = v110;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 48);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v245[2] = v111;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v245, 3);
        v112 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(objb, "sliceAtOrigin:shape:squeeze:error:", v144, v112, 0, a4);
        v57 = (SNKShotSegmentationResult *)objc_claimAutoreleasedReturnValue();
        if (!v57)
          break;
        objc_msgSend(v137, "addObject:", v57);

        if (v107 == ++v106)
          goto LABEL_119;
      }
    }

    goto LABEL_133;
  }
  v32 = 0;
  v33 = obja;
  while (!objc_msgSend(v14, "count"))
  {
LABEL_29:
    ++v32;
    v33 += v139;
    if (objc_msgSend(v14, "count") <= v32)
      goto LABEL_30;
  }
  v34 = 0;
  v35 = v33;
  while (1)
  {
    objc_msgSend(v148, "objectAtIndexedSubscript:", v32);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "objectAtIndexedSubscript:", v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[SNFeaturePrint cosineSimilarityBetweenOneFeatureVector:andAnotherFeatureVector:error:](SNFeaturePrint, "cosineSimilarityBetweenOneFeatureVector:andAnotherFeatureVector:error:", v36, v37, a4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v38)
      break;
    objc_msgSend(v38, "floatValue");
    *(_DWORD *)v35 = v39;

    ++v34;
    v35 += v143;
    if (objc_msgSend(v14, "count") <= v34)
      goto LABEL_29;
  }
  obj = 0;
  v57 = 0;
LABEL_136:
  v14 = v141;
LABEL_137:

LABEL_138:
  return v57;
}

+ (id)featurizeFiles:(id)a3 randomNumberGenerator:(id)a4 hallucinatorModelURL:(id)a5 error:(id *)a6
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  SNBooleanCancellable *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  SNKShotFeaturizationResult *v24;
  void *v25;
  SNBooleanCancellable *v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  _QWORD aBlock[4];
  id v35;
  id v36;
  id v37;
  id v38;

  v8 = (objc_class *)MEMORY[0x1E0C99DE8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(v8);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = objc_alloc_init(SNBooleanCancellable);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D44EC338;
  aBlock[3] = &unk_1E97C4368;
  v17 = v12;
  v35 = v17;
  v18 = v13;
  v36 = v18;
  v19 = v14;
  v37 = v19;
  v20 = v15;
  v38 = v20;
  v21 = _Block_copy(aBlock);
  v22 = a1;
  v29 = v16;
  sub_1D44E7998((uint64_t)v22, v11, v10, v9, v16, v21, a6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = objc_alloc_init(SNKShotFeaturizationResult);
    -[SNKShotFeaturizationResult setTrainingDataEmbeddings:](v24, "setTrainingDataEmbeddings:", v17);
    -[SNKShotFeaturizationResult setTrainingDataLabels:](v24, "setTrainingDataLabels:", v18);
    -[SNKShotFeaturizationResult setValidationDataEmbeddings:](v24, "setValidationDataEmbeddings:", v19);
    -[SNKShotFeaturizationResult setValidationDataLabels:](v24, "setValidationDataLabels:", v20);
    objc_msgSend(v23, "inferenceWindowSize");
    v30 = v32;
    v31 = v33;
    -[SNKShotFeaturizationResult setInferenceWindowSize:](v24, "setInferenceWindowSize:", &v30);
    objc_msgSend(v23, "exemplar");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SNKShotFeaturizationResult setExemplar:](v24, "setExemplar:", v25);

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (id)readNumRepetitionsPerTimeShiftFromHallucinator:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "modelDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("iterationsPerTimeshift"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "integerValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not read key from hallucinator metadata: %@"), CFSTR("iterationsPerTimeshift"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SNError populateClientError:withCode:underlyingError:message:](SNError, "populateClientError:withCode:underlyingError:message:", a4, 4, 0, v10);

    v9 = 0;
  }

  return v9;
}

+ (id)readNumTimeShiftsPerSegmentFromHallucinator:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "modelDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("timeshiftsPerSegment"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "integerValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not read key from hallucinator metadata: %@"), CFSTR("timeshiftsPerSegment"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SNError populateClientError:withCode:underlyingError:message:](SNError, "populateClientError:withCode:underlyingError:message:", a4, 4, 0, v10);

    v9 = 0;
  }

  return v9;
}

+ (BOOL)ensureIsValidHallucinatorV3Model:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  id v22;
  BOOL v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  id v30;
  const __CFString *v31;
  BOOL v32;
  id v33;
  BOOL v34;
  id v35;
  BOOL v36;
  id v37;
  BOOL v38;
  id v39;
  BOOL v40;
  id v41;
  const __CFString *v42;
  BOOL v43;
  id v44;
  BOOL v45;
  id v46;
  BOOL v47;
  BOOL v48;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[3];
  _QWORD v64[9];

  v64[7] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "modelDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputDescriptionsByName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "modelDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "outputDescriptionsByName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "readNumRepetitionsPerTimeShiftFromHallucinator:error:", v6, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(a1, "readNumTimeShiftsPerSegmentFromHallucinator:error:", v6, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v64[0] = CFSTR("foreground");
      v64[1] = CFSTR("background");
      v64[2] = CFSTR("shiftIteration");
      v64[3] = CFSTR("stateIn");
      v64[4] = CFSTR("set");
      v64[5] = CFSTR("shiftedSamples");
      v64[6] = CFSTR("segmentLength");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = CFSTR("embedding");
      v63[1] = CFSTR("label");
      v63[2] = CFSTR("stateOut");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "modelDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = +[SNValidateModel ensureModelDescription:hasInputFeatureNames:hasOutputFeatureNames:error:](SNValidateModel, "ensureModelDescription:hasInputFeatureNames:hasOutputFeatureNames:error:", v15, v13, v14, a4);

      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 1, 0x7FFFFFFFFFFFFFFFLL);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = v17;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 1, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v62[1] = v18;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 1000, 319001);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v62[2] = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = CFSTR("foreground");
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("foreground"));
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v60 = 0;
        v23 = +[SNValidateModel ensureFeatureWithDescription:isOptional:isMultiArrayWithDataType:dimensionSizeRanges:error:](SNValidateModel, "ensureFeatureWithDescription:isOptional:isMultiArrayWithDataType:dimensionSizeRanges:error:", v22, 0, 65568, v20, &v60);
        v24 = v60;
        v25 = v24;
        if (!v23)
          goto LABEL_17;

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 1, 0x7FFFFFFFFFFFFFFFLL);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v61[0] = v26;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 1, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v61[1] = v27;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 1000, 319001);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v61[2] = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = CFSTR("background");
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("background"));
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v59 = 0;
        v29 = +[SNValidateModel ensureFeatureWithDescription:isOptional:isMultiArrayWithDataType:dimensionSizeRanges:error:](SNValidateModel, "ensureFeatureWithDescription:isOptional:isMultiArrayWithDataType:dimensionSizeRanges:error:", v22, 0, 65568, v20, &v59);
        v30 = v59;
        v25 = v30;
        if (v29)
        {

          v31 = CFSTR("shiftIteration");
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("shiftIteration"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = 0;
          v32 = +[SNValidateModel ensureFeatureWithDescription:isOptional:isMultiArrayWithDataType:shapeOptions:error:](SNValidateModel, "ensureFeatureWithDescription:isOptional:isMultiArrayWithDataType:shapeOptions:error:", v20, 0, 65568, &unk_1E97DA620, &v58);
          v33 = v58;
          v22 = v33;
          if (!v32)
            goto LABEL_18;

          v31 = CFSTR("stateIn");
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("stateIn"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = 0;
          v34 = +[SNValidateModel ensureFeatureWithDescription:isOptional:error:](SNValidateModel, "ensureFeatureWithDescription:isOptional:error:", v20, 1, &v57);
          v35 = v57;
          v22 = v35;
          if (!v34)
            goto LABEL_18;

          v31 = CFSTR("set");
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("set"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = 0;
          v36 = +[SNValidateModel ensureFeatureWithDescription:isOptional:isMultiArrayWithDataType:shapeOptions:error:](SNValidateModel, "ensureFeatureWithDescription:isOptional:isMultiArrayWithDataType:shapeOptions:error:", v20, 1, 65568, &unk_1E97DA650, &v56);
          v37 = v56;
          v22 = v37;
          if (!v36)
            goto LABEL_18;

          v31 = CFSTR("shiftedSamples");
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("shiftedSamples"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = 0;
          v38 = +[SNValidateModel ensureFeatureWithDescription:isOptional:isMultiArrayWithDataType:shapeOptions:error:](SNValidateModel, "ensureFeatureWithDescription:isOptional:isMultiArrayWithDataType:shapeOptions:error:", v20, 1, 65568, &unk_1E97DA680, &v55);
          v39 = v55;
          v22 = v39;
          if (!v38)
            goto LABEL_18;

          v31 = CFSTR("segmentLength");
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("segmentLength"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = 0;
          v40 = +[SNValidateModel ensureFeatureWithDescription:isOptional:isMultiArrayWithDataType:shapeOptions:error:](SNValidateModel, "ensureFeatureWithDescription:isOptional:isMultiArrayWithDataType:shapeOptions:error:", v20, 1, 65568, &unk_1E97DA6B0, &v54);
          v41 = v54;
          v22 = v41;
          if (v40)
          {

            v42 = CFSTR("embedding");
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("embedding"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = 0;
            v43 = +[SNValidateModel ensureFeatureWithDescription:isOptional:isFreelyShapedMultiArrayWithDataType:error:](SNValidateModel, "ensureFeatureWithDescription:isOptional:isFreelyShapedMultiArrayWithDataType:error:", v20, 0, 65568, &v53);
            v44 = v53;
            v22 = v44;
            if (v43)
            {

              v42 = CFSTR("label");
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("label"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = 0;
              v45 = +[SNValidateModel ensureFeatureWithDescription:isOptional:isMultiArrayWithDataType:shapeOptions:error:](SNValidateModel, "ensureFeatureWithDescription:isOptional:isMultiArrayWithDataType:shapeOptions:error:", v20, 0, 65568, &unk_1E97DA6E0, &v52);
              v46 = v52;
              v22 = v46;
              if (v45)
              {

                v42 = CFSTR("stateOut");
                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("stateOut"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = 0;
                v47 = +[SNValidateModel ensureFeatureWithDescription:isOptional:error:](SNValidateModel, "ensureFeatureWithDescription:isOptional:error:", v20, 0, &v51);
                v22 = v51;
                if (v47)
                {
                  v48 = 1;
LABEL_21:

                  goto LABEL_16;
                }
              }
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid specification for output feature: '%@'"), v42);
          }
          else
          {
LABEL_18:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid specification for input feature: '%@'"), v31);
          }
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[SNError populateClientError:withCode:underlyingError:message:](SNError, "populateClientError:withCode:underlyingError:message:", a4, 4, v22, v25);
        }
        else
        {
LABEL_17:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid specification for input feature: '%@'"), v21);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          +[SNError populateClientError:withCode:underlyingError:message:](SNError, "populateClientError:withCode:underlyingError:message:", a4, 4, v25, v50);

        }
        v48 = 0;
        goto LABEL_21;
      }
    }
  }
  v48 = 0;
LABEL_16:

  return v48;
}

+ (int)recognizeHallucinatorModel:(id)a3 error:(id *)a4
{
  return objc_msgSend(a1, "ensureIsValidHallucinatorV3Model:error:", a3, a4);
}

+ (id)labelFromNumberRepresentation:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  if (v6 == 1)
  {
    v7 = -[SNKShotLabel initAsPositiveLabel]([SNKShotLabel alloc], "initAsPositiveLabel");
  }
  else
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not translate number to label: %@"), v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SNError populateClientError:withCode:underlyingError:message:](SNError, "populateClientError:withCode:underlyingError:message:", a4, 1, 0, v9);

      v8 = 0;
      goto LABEL_7;
    }
    v7 = -[SNKShotLabel initAsNegativeLabel]([SNKShotLabel alloc], "initAsNegativeLabel");
  }
  v8 = v7;
LABEL_7:

  return v8;
}

+ (id)streamResultWithEmbedding:(id)a3 label:(id)a4 dataset:(int64_t)a5 error:(id *)a6
{
  id v10;
  void *v11;
  SNKShotFeaturizationStreamResult *v12;

  v10 = a3;
  objc_msgSend(a1, "labelFromNumberRepresentation:error:", a4, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_alloc_init(SNKShotFeaturizationStreamResult);
    -[SNKShotFeaturizationStreamResult setDatasetType:](v12, "setDatasetType:", a5);
    -[SNKShotFeaturizationStreamResult setData:](v12, "setData:", v10);
    -[SNKShotFeaturizationStreamResult setLabel:](v12, "setLabel:", v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)streamResultsForDatasetType:(int64_t)a3 embeddings:(id)a4 labels:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v13 = 0;
    while (1)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15 || !v14)
      {
        +[SNError populateClientError:withCode:underlyingError:message:](SNError, "populateClientError:withCode:underlyingError:message:", a6, 1, 0, CFSTR("expected same number of embeddings and labels"));
        goto LABEL_10;
      }
      objc_msgSend(a1, "streamResultWithEmbedding:label:dataset:error:", v14, v15, a3, a6);
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
        break;
      v17 = (void *)v16;
      objc_msgSend(v12, "addObject:", v16);

      if (objc_msgSend(v10, "count") <= (unint64_t)++v13)
        goto LABEL_11;
    }

    v12 = 0;
LABEL_10:

  }
LABEL_11:

  return v12;
}

+ (id)streamResultsFromFeaturizationResult:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  objc_msgSend(v6, "trainingDataEmbeddings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trainingDataLabels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "streamResultsForDatasetType:embeddings:labels:error:", 0, v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v12 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v6, "validationDataEmbeddings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validationDataLabels");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "streamResultsForDatasetType:embeddings:labels:error:", 1, v10, v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v13;
}

+ (id)streamCompletionFromFeaturizationResult:(id)a3
{
  id v3;
  SNKShotFeaturizationStreamCompletion *v4;
  void *v5;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v3 = a3;
  v4 = objc_alloc_init(SNKShotFeaturizationStreamCompletion);
  if (v3)
  {
    objc_msgSend(v3, "inferenceWindowSize");
  }
  else
  {
    v9 = 0uLL;
    v10 = 0;
  }
  v7 = v9;
  v8 = v10;
  -[SNKShotFeaturizationStreamCompletion setInferenceWindowSize:](v4, "setInferenceWindowSize:", &v7);
  objc_msgSend(v3, "exemplar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SNKShotFeaturizationStreamCompletion setExemplar:](v4, "setExemplar:", v5);

  return v4;
}

@end
