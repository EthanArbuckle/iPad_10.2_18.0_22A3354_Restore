@implementation GTMTLReplayClient

void __GTMTLReplayClient_displayTexture_block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "error"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 280), "setDisplayTextureEncoder:", *(_QWORD *)(a1 + 32));

}

void __GTMTLReplayClient_displayAttachment_block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "error"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 280), "setDisplayTextureEncoder:", *(_QWORD *)(a1 + 32));

}

void __GTMTLReplayClient_streamShaderProfilingData_block_invoke(GTUSCSamplingStreamingManagerHelper *a1)
{
  uint64_t v1;
  void *v2;
  GTUSCSamplingStreamingManager *v3;
  unsigned __int8 v4;
  GTUSCSamplingStreamingManagerHelper *v5;
  uint64_t v6;
  unsigned __int8 v7;
  void *v8;
  void (*v9)(uint64_t);
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  GTUSCSamplingStreamingManagerHelper *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  int v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  std::vector<unsigned int>::size_type v41;
  uint64_t i;
  uint64_t v43;
  int v44;
  void *v45;
  uint64_t j;
  uint64_t *v47;
  unsigned int *value;
  unsigned int *begin;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  std::vector<unsigned int>::pointer end;
  unsigned int *v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unsigned int *v62;
  unsigned int v63;
  void *v64;
  id v65;
  unsigned int *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  unsigned __int8 v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  id v77;
  std::vector<unsigned int>::size_type v78;
  unsigned int *v79;
  unsigned int *v80;
  unsigned int *v81;
  unsigned int *v82;
  unsigned int *v83;
  void *v84;
  void *v85;
  std::vector<unsigned int>::pointer v86;
  unsigned int *v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unsigned int *v92;
  unsigned int v93;
  std::vector<unsigned int>::size_type v94;
  char *v95;
  unint64_t v96;
  char *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  char *v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  char *v108;
  int v109;
  void *v110;
  id v111;
  void (*v112)(uint64_t);
  void (*v113)(uint64_t);
  __int128 *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  GTUSCSamplingStreamingManagerHelper *v119;
  unint64_t v120;
  id v121;
  void *v122;
  id v123;
  void *v124;
  id v125;
  void **v126;
  uint64_t v127;
  uint64_t v128;
  id v129;
  void *v130;
  __n128 (*v131)(__n128 *, __n128 *);
  id v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  void *v139;
  void *v140;
  void *v141;
  uint64_t v142;
  void *v143;
  id v144;
  id v145;
  std::vector<unsigned int> v146;
  __int128 v147;
  std::vector<unsigned int>::size_type v148[2];
  const __CFString *v149;
  const __CFString *v150;
  const __CFString *v151;
  const __CFString *v152;
  __int128 v153;
  std::vector<unsigned int>::size_type __n[2];
  _UNKNOWN **v155;
  void *v156;
  void *v157;
  void *v158;
  void **v159;
  uint64_t v160;
  void (*v161)(uint64_t);
  void *v162;
  __CFString *v163;
  id v164;
  __int128 *v165;
  const __CFString *v166;
  uint64_t v167;
  void (*v168)(uint64_t);
  const __CFString *v169;
  id v170;
  __int128 *v171;
  int v172;
  const __CFString *v173;
  uint64_t v174;
  void (*v175)(uint64_t);
  const __CFString *v176;
  __CFString *v177;
  void ***v178;
  __int128 *v179;
  int v180;
  int v181;
  void **v182;
  uint64_t v183;
  uint64_t v184;
  __n128 (*v185)(__n128 *, __n128 *);
  void (*v186)(uint64_t);
  __int128 *v187;
  _QWORD v188[3];
  void *v189;
  void *v190;
  void *v191;
  std::vector<unsigned int> v192;

  v1 = *(_QWORD *)(*((_QWORD *)a1 + 4) + 8);
  GTUSCSamplingStreamingManagerHelper::Instance(a1);
  v128 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 64), "objectForKeyedSubscript:", CFSTR("useOverlap")));
  v129 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;
  byte_7528B2 = v4;
  v127 = v1 + 48;
  GTUSCSamplingStreamingManagerHelper::InitQueryShaderInfo((GTUSCSamplingStreamingManagerHelper *)(v1 + 48), v3);
  GTUSCSamplingStreamingManagerHelper::GatherCommandBufferRestoreInfo((uint64_t **)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance);
  v7 = atomic_load(byte_752AF4);
  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_opt_new(NSMutableDictionary, v6);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", *(_QWORD *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 56), CFSTR("MetalPluginName"));
    v182 = _NSConcreteStackBlock;
    v183 = 3221225472;
    v184 = (uint64_t)___ZN35GTUSCSamplingStreamingManagerHelper23StreamHarvestedBinariesEv_block_invoke;
    v185 = (__n128 (*)(__n128 *, __n128 *))&unk_726378;
    v187 = &GTUSCSamplingStreamingManagerHelper::Instance(void)::instance;
    v9 = v8;
    v186 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v182));
    objc_msgSend(v10, "setQueuePriority:", -8);
    objc_msgSend(**(id **)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8), "addOperation:", v10);
    objc_msgSend(v10, "waitUntilFinished");
    (*(void (**)(void))(*(_QWORD *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 32) + 16))();

  }
  v11 = atomic_load(byte_752AF4);
  if ((v11 & 1) == 0)
  {
    v125 = *(id *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 16);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("perEncoderDrawCallCount")));
    v123 = objc_msgSend(v12, "count");

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("perCommandBufferEncoderCount")));
    v14 = objc_msgSend(v13, "count");

    v16 = (void *)objc_opt_new(NSOperation, v15);
    v17 = (GTUSCSamplingStreamingManagerHelper *)objc_msgSend(*((id *)&xmmword_752038 + 1), "count");
    if (v17)
    {
      GTUSCSamplingStreamingManagerHelper::SetupMTLCounterAPIBuffer(v17);
      v136 = v16;
      v182 = 0;
      v183 = (uint64_t)&v182;
      v184 = 0x4812000000;
      v185 = __Block_byref_object_copy__345;
      v186 = __Block_byref_object_dispose__346;
      v187 = (__int128 *)&unk_4C2897;
      v18 = (char *)operator new(0x78uLL);
      v19 = 0;
      v188[0] = v18;
      v188[2] = v18 + 120;
      do
      {
        v20 = &v18[v19];
        *(_OWORD *)v20 = 0uLL;
        *((_OWORD *)v20 + 1) = 0uLL;
        *((_DWORD *)v20 + 8) = 1065353216;
        v19 += 40;
      }
      while (v19 != 120);
      v21 = 0;
      v188[1] = v18 + 120;
      do
      {
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(*(_QWORD *)(v183 + 48) + v21, vcvtps_u32_f32((float)(unint64_t)(6 * (_QWORD)v123) / *(float *)(*(_QWORD *)(v183 + 48) + v21 + 32)));
        v21 += 40;
      }
      while (v21 != 120);
      v22 = objc_autoreleasePoolPush();
      v23 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 3));
      v24 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 3));
      objc_autoreleasePoolPop(v22);
      v134 = (void *)v24;
      v130 = (void *)v23;
      v25 = (char *)operator new(0x48uLL);
      v26 = 0;
      *((_QWORD *)v25 + 8) = 0;
      *((_OWORD *)v25 + 2) = 0u;
      *((_OWORD *)v25 + 3) = 0u;
      *(_OWORD *)v25 = 0u;
      *((_OWORD *)v25 + 1) = 0u;
      v146.__begin_ = (std::vector<unsigned int>::pointer)v25;
      v146.__end_ = (std::vector<unsigned int>::pointer)(v25 + 72);
      v27 = 2 * (_QWORD)v14;
      v146.__end_cap_.__value_ = (unsigned int *)(v25 + 72);
      do
      {
        std::vector<std::tuple<unsigned long long,unsigned long long,unsigned long long>>::reserve((void **)&v25[v26], v27);
        v26 += 24;
      }
      while (v26 != 72);
      v28 = 0;
      v29 = 0;
      v30 = *(_DWORD *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 68);
      do
      {
        v31 = objc_autoreleasePoolPush();
        v33 = (void *)objc_opt_new(NSMutableArray, v32);
        v35 = (void *)objc_opt_new(NSMutableData, v34);
        objc_msgSend(v134, "addObject:", v35);

        objc_autoreleasePoolPop(v31);
        v173 = (const __CFString *)_NSConcreteStackBlock;
        v174 = 3221225472;
        v175 = ___ZN35GTUSCSamplingStreamingManagerHelper19StreamFrameTimeDataEv_block_invoke;
        v176 = (const __CFString *)&unk_7247C8;
        v180 = v30;
        v181 = v29;
        v178 = &v182;
        v179 = &GTUSCSamplingStreamingManagerHelper::Instance(void)::instance;
        v36 = v33;
        v177 = v36;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v173));
        objc_msgSend(v37, "setQueuePriority:", -8);
        if (v28)
          objc_msgSend(v37, "addDependency:", v28);
        objc_msgSend(**(id **)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8), "addOperation:", v37);
        if (dword_75286C && dword_752868)
        {
          v166 = (const __CFString *)_NSConcreteStackBlock;
          v167 = 3221225472;
          v168 = ___ZN35GTUSCSamplingStreamingManagerHelper19StreamFrameTimeDataEv_block_invoke_2;
          v169 = (const __CFString *)&unk_7247F0;
          v171 = &GTUSCSamplingStreamingManagerHelper::Instance(void)::instance;
          v170 = v134;
          v172 = v29;
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v166));
          objc_msgSend(v38, "addDependency:", v37);
          objc_msgSend(v136, "addDependency:", v38);
          objc_msgSend(**(id **)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8), "addOperation:", v38);

        }
        else
        {
          objc_msgSend(v136, "addDependency:", v37);
        }
        v159 = _NSConcreteStackBlock;
        v160 = 3221225472;
        v161 = ___ZN35GTUSCSamplingStreamingManagerHelper19StreamFrameTimeDataEv_block_invoke_3;
        v162 = &unk_725E60;
        v165 = &GTUSCSamplingStreamingManagerHelper::Instance(void)::instance;
        v39 = v36;
        v163 = v39;
        v132 = v130;
        v164 = v132;
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v159));
        objc_msgSend(v40, "addDependency:", v37);
        v138 = v40;

        objc_msgSend(v136, "addDependency:", v138);
        objc_msgSend(*(id *)(*(_QWORD *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8) + 8), "addOperation:", v138);

        ++v29;
        v28 = v138;
      }
      while (v29 != 3);
      objc_msgSend(*(id *)(*(_QWORD *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8) + 8), "addOperation:", v136);
      objc_msgSend(v136, "waitUntilFinished");
      v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 3));
      LODWORD(v41) = 0;
      memset(&v192, 0, sizeof(v192));
      for (i = 24; i != 144; i += 40)
      {
        v43 = *(_QWORD *)(v183 + 48);
        v44 = *(_DWORD *)(v43 + i);
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(v183 + 56) - v43) >> 3)));
        objc_msgSend(v140, "addObject:", v45);

        v41 = (v41 + v44);
      }
      std::vector<unsigned int>::reserve(&v192, v41);
      for (j = 0; j != 3; ++j)
      {
        v47 = *(uint64_t **)(*(_QWORD *)(v183 + 48) + 40 * j + 16);
        if (v47)
        {
          v142 = j;
          value = v192.__end_cap_.__value_;
          begin = v192.__begin_;
          do
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)v47 + 7)));
            v189 = v50;
            v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)v47 + 8)));
            v190 = v51;
            v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)v47 + 9)));
            v191 = v52;
            v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v189, 3));
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "objectAtIndexedSubscript:", v142));
            v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)v47 + 4)));
            objc_msgSend(v54, "setObject:forKeyedSubscript:", v53, v55);

            end = v192.__end_;
            if (v192.__end_ >= value)
            {
              v58 = v192.__end_ - begin;
              v59 = v58 + 1;
              if ((unint64_t)(v58 + 1) >> 62)
              {
                v192.__end_cap_.__value_ = value;
                v192.__begin_ = begin;
                abort();
              }
              if (((char *)value - (char *)begin) >> 1 > v59)
                v59 = ((char *)value - (char *)begin) >> 1;
              if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
                v60 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v60 = v59;
              if (v60)
                v60 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>(v60);
              else
                v61 = 0;
              v62 = (unsigned int *)(v60 + 4 * v58);
              *v62 = *((_DWORD *)v47 + 4);
              v57 = v62 + 1;
              while (end != begin)
              {
                v63 = *--end;
                *--v62 = v63;
              }
              value = (unsigned int *)(v60 + 4 * v61);
              v192.__end_ = v57;
              if (begin)
                operator delete(begin);
              begin = v62;
            }
            else
            {
              *v192.__end_ = *((_DWORD *)v47 + 4);
              v57 = end + 1;
            }
            v192.__end_ = v57;
            v47 = (uint64_t *)*v47;
          }
          while (v47);
          v192.__end_cap_.__value_ = value;
          v192.__begin_ = begin;
          j = v142;
        }
      }
      v145 = 0;
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v140, 1, &v145));
      v65 = v145;
      v66 = v192.__begin_;
      v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v192.__begin_, (char *)v192.__end_ - (char *)v192.__begin_));
      *(_QWORD *)&v147 = CFSTR("Frame Time Data");
      *((_QWORD *)&v147 + 1) = CFSTR("Encoder TraceId Data");
      *(_QWORD *)&v153 = v132;
      *((_QWORD *)&v153 + 1) = v67;
      v148[0] = (std::vector<unsigned int>::size_type)CFSTR("Num Encoders");
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v123));
      __n[0] = (std::vector<unsigned int>::size_type)v68;
      v148[1] = (std::vector<unsigned int>::size_type)CFSTR("Num Ring Buffers");
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", qword_7528A0));
      __n[1] = (std::vector<unsigned int>::size_type)v69;
      v155 = &off_7396A0;
      v149 = CFSTR("Num Frame Iterations");
      v150 = CFSTR("Sample Marker");
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", qword_752048));
      v156 = v70;
      v157 = v64;
      v151 = CFSTR("TraceId to SampleIndex");
      v152 = CFSTR("Frame Encoder Times Data");
      v158 = v134;
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v153, &v147, 8));

      (*(void (**)(void))(*(_QWORD *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 32) + 16))();
      if (v66)
      {
        v192.__end_ = v66;
        operator delete(v66);
      }

      v192.__begin_ = (std::vector<unsigned int>::pointer)&v146;
      std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v192);

      _Block_object_dispose(&v182, 8);
      v146.__begin_ = (std::vector<unsigned int>::pointer)v188;
      std::vector<std::unordered_map<unsigned int,GTEncoderSampleIndexInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v146);

      v16 = v136;
    }

  }
  v72 = atomic_load(byte_752AF4);
  if ((v72 & 1) == 0)
  {
    v153 = 0u;
    *(_OWORD *)__n = 0u;
    LODWORD(v155) = 1065353216;
    v147 = 0u;
    *(_OWORD *)v148 = 0u;
    LODWORD(v149) = 1065353216;
    v137 = (void *)objc_opt_new(NSMutableArray, v6);
    v139 = (void *)objc_opt_new(NSMutableArray, v73);
    v133 = (void *)objc_opt_new(NSMutableData, v74);
    v135 = (void *)objc_opt_new(NSMutableData, v75);
    v76 = GTUSCSamplingStreamingManagerHelper::GatherFrameMiscEncoderPostProcessedData(0, v137, v133, (uint64_t)&v153, 0);
    v122 = (void *)objc_claimAutoreleasedReturnValue(v76);
    v77 = GTUSCSamplingStreamingManagerHelper::GatherFrameMiscEncoderPostProcessedData(1, v139, v135, (uint64_t)&v147, v122);
    v124 = (void *)objc_claimAutoreleasedReturnValue(v77);
    objc_msgSend(v124, "waitUntilFinished");
    v143 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", __n[1]));
    memset(&v146, 0, sizeof(v146));
    std::vector<unsigned int>::reserve(&v146, __n[1]);
    v78 = __n[0];
    if (__n[0])
    {
      v79 = v146.__end_cap_.__value_;
      v80 = v146.__begin_;
      do
      {
        v81 = (unsigned int *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(v78 + 28)));
        v192.__begin_ = v81;
        v82 = (unsigned int *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(v78 + 32)));
        v192.__end_ = v82;
        v83 = (unsigned int *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(v78 + 36)));
        v192.__end_cap_.__value_ = v83;
        v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v192, 3));
        v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(v78 + 16)));
        objc_msgSend(v143, "setObject:forKeyedSubscript:", v84, v85);

        v86 = v146.__end_;
        if (v146.__end_ >= v79)
        {
          v88 = v146.__end_ - v80;
          v89 = v88 + 1;
          if ((unint64_t)(v88 + 1) >> 62)
          {
            v146.__begin_ = v80;
            abort();
          }
          if (((char *)v79 - (char *)v80) >> 1 > v89)
            v89 = ((char *)v79 - (char *)v80) >> 1;
          if ((unint64_t)((char *)v79 - (char *)v80) >= 0x7FFFFFFFFFFFFFFCLL)
            v90 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v90 = v89;
          if (v90)
            v90 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>(v90);
          else
            v91 = 0;
          v92 = (unsigned int *)(v90 + 4 * v88);
          *v92 = *(_DWORD *)(v78 + 16);
          v87 = v92 + 1;
          while (v86 != v80)
          {
            v93 = *--v86;
            *--v92 = v93;
          }
          v79 = (unsigned int *)(v90 + 4 * v91);
          v146.__end_ = v87;
          if (v80)
            operator delete(v80);
          v80 = v92;
        }
        else
        {
          *v146.__end_ = *(_DWORD *)(v78 + 16);
          v87 = v86 + 1;
        }
        v146.__end_ = v87;
        v78 = *(_QWORD *)v78;
      }
      while (v78);
      v146.__end_cap_.__value_ = v79;
      v146.__begin_ = v80;
    }
    else
    {
      v80 = v146.__begin_;
      v87 = v146.__end_;
    }
    std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>(v80, v87, &v182);
    v141 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", v148[1]));
    std::vector<unsigned int>::reserve(&v146, v148[1]);
    v94 = v148[0];
    if (v148[0])
    {
      v95 = 0;
      v96 = 0;
      v97 = 0;
      do
      {
        v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(v94 + 28)));
        v189 = v98;
        v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(v94 + 32)));
        v190 = v99;
        v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(v94 + 36)));
        v191 = v100;
        v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v189, 3));
        v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(v94 + 16)));
        objc_msgSend(v141, "setObject:forKeyedSubscript:", v101, v102);

        if ((unint64_t)v95 >= v96)
        {
          v104 = (v95 - v97) >> 2;
          v105 = v104 + 1;
          if ((unint64_t)(v104 + 1) >> 62)
            abort();
          if ((uint64_t)(v96 - (_QWORD)v97) >> 1 > v105)
            v105 = (uint64_t)(v96 - (_QWORD)v97) >> 1;
          if (v96 - (unint64_t)v97 >= 0x7FFFFFFFFFFFFFFCLL)
            v106 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v106 = v105;
          if (v106)
            v106 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>(v106);
          else
            v107 = 0;
          v108 = (char *)(v106 + 4 * v104);
          *(_DWORD *)v108 = *(_DWORD *)(v94 + 16);
          v103 = v108 + 4;
          while (v95 != v97)
          {
            v109 = *((_DWORD *)v95 - 1);
            v95 -= 4;
            *((_DWORD *)v108 - 1) = v109;
            v108 -= 4;
          }
          v96 = v106 + 4 * v107;
          if (v97)
            operator delete(v97);
          v97 = v108;
        }
        else
        {
          *(_DWORD *)v95 = *(_DWORD *)(v94 + 16);
          v103 = v95 + 4;
        }
        v94 = *(_QWORD *)v94;
        v95 = v103;
      }
      while (v94);
    }
    else
    {
      v103 = 0;
      v97 = 0;
    }
    std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>(v97, v103, &v182);
    v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v146.__begin_, (char *)v146.__end_ - (char *)v146.__begin_));
    v131 = (__n128 (*)(__n128 *, __n128 *))objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v97, v103 - v97));
    v145 = 0;
    v126 = (void **)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v143, 1, &v145));
    v111 = v145;
    v144 = v111;
    v112 = (void (*)(uint64_t))objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v141, 1, &v144));
    v121 = v144;

    v173 = CFSTR("Blit Encoder Frame Data");
    v174 = (uint64_t)CFSTR("Blit Encoder Info");
    v182 = (void **)v137;
    v183 = (uint64_t)v110;
    v175 = (void (*)(uint64_t))CFSTR("Blit Split Encoder Frame Data");
    v176 = CFSTR("Blit Split Encoder Info");
    v184 = (uint64_t)v139;
    v185 = v131;
    v177 = CFSTR("Blit Encoder Indices");
    v113 = (void (*)(uint64_t))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 16), "objectForKeyedSubscript:", CFSTR("blitEncoderIndices")));
    v186 = v113;
    v178 = (void ***)CFSTR("Encoder Draw Call Count");
    v114 = (__int128 *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 16), "objectForKeyedSubscript:", CFSTR("activePerEncoderDrawCallCount")));
    v187 = v114;
    v179 = (__int128 *)CFSTR("Source Sample Marker");
    v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", qword_752048));
    v188[0] = v115;
    v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v182, &v173, 7));
    v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v116));

    if (dword_75286C && dword_752868)
    {
      v166 = CFSTR("Blit TraceId to Sample Index");
      v167 = (uint64_t)CFSTR("Blit Encoder Time Data");
      v159 = v126;
      v160 = (uint64_t)v133;
      v168 = (void (*)(uint64_t))CFSTR("Blit Split TraceId to Sample Index");
      v169 = CFSTR("Blit Split Encoder Time Data");
      v161 = v112;
      v162 = v135;
      v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v159, &v166, 4));
      objc_msgSend(v117, "addEntriesFromDictionary:", v118);

    }
    (*(void (**)(void))(*(_QWORD *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 32) + 16))();
    NSLog(CFSTR("Sent Blit Misc Data"));

    if (v97)
      operator delete(v97);

    if (v146.__begin_)
      operator delete(v146.__begin_);

    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v147);
    v5 = (GTUSCSamplingStreamingManagerHelper *)std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v153);
  }
  GTUSCSamplingStreamingManagerHelper::StreamShaderProfilingData(v5);
  GTUSCSamplingStreamingManagerHelper::StreamEncoderDerivedCounterData(v119);
  dispatch_semaphore_signal((dispatch_semaphore_t)xmmword_7529E8);
  (*(void (**)(void))(*(_QWORD *)(v128 + 80) + 16))();
  v120 = atomic_load((unint64_t *)&xmmword_752AC8);
  if (v120 == v127)
    GTUSCSamplingStreamingManagerHelper::CleanUp((GTUSCSamplingStreamingManagerHelper *)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance);

}

void __GTMTLReplayClient_streamDerivedCounterData_block_invoke(GTUSCSamplingStreamingManagerHelper *a1)
{
  uint64_t v1;
  GTUSCSamplingStreamingManager *v2;
  GTUSCSamplingStreamingManagerHelper *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  GTUSCSamplingStreamingManagerHelper *v19;
  GTUSCSamplingStreamingManagerHelper *v20;
  unint64_t v21;

  v1 = *(_QWORD *)(*((_QWORD *)a1 + 4) + 8);
  GTUSCSamplingStreamingManagerHelper::Instance(a1);
  GTUSCSamplingStreamingManagerHelper::Init((GTUSCSamplingStreamingManagerHelper *)(v1 + 48), v2);
  GTUSCSamplingStreamingManagerHelper::SetupGPURawCounters(v3);
  v4 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 7));
  v5 = (void *)qword_7527F0;
  qword_7527F0 = v4;

  v6 = (void *)qword_7527F8;
  qword_7527F8 = 0;

  for (i = 0; i != 7; ++i)
  {
    v8 = (void *)qword_7527F0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_7389A0, "objectAtIndexedSubscript:", i));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GPURawCounterSelect selectWithName:options:](GPURawCounterSelect, "selectWithName:options:", v9, 0));
    objc_msgSend(v8, "addObject:", v10);

  }
  v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1));
  v12 = (void *)qword_752830;
  qword_752830 = v11;

  v13 = (void *)qword_752830;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GPURawCounterSourceTriggerSelect selectWithName:options:](GPURawCounterSourceTriggerSelect, "selectWithName:options:", CFSTR("KickBoundary"), 0));
  objc_msgSend(v13, "addObject:", v14);

  v15 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1));
  v16 = (void *)*((_QWORD *)&xmmword_752820 + 1);
  *((_QWORD *)&xmmword_752820 + 1) = v15;

  v17 = (void *)*((_QWORD *)&xmmword_752820 + 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[GPURawCounterSourceTriggerSelect selectWithName:options:](GPURawCounterSourceTriggerSelect, "selectWithName:options:", CFSTR("TimerNClock"), &off_738DE8));
  objc_msgSend(v17, "addObject:", v18);

  GTUSCSamplingStreamingManagerHelper::SetupMTLCounterAPIBuffer(v19);
  GTUSCSamplingStreamingManagerHelper::StreamEncoderDerivedCounterData(v20);
  (*(void (**)(void))(*(_QWORD *)(v1 + 80) + 16))();
  dispatch_semaphore_signal((dispatch_semaphore_t)xmmword_7529E8);
  v21 = atomic_load((unint64_t *)&xmmword_752AC8);
  if (v21 == v1 + 48)
    GTUSCSamplingStreamingManagerHelper::CleanUp((GTUSCSamplingStreamingManagerHelper *)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance);
}

void __GTMTLReplayClient_streamBatchFilteredData_block_invoke(GTUSCSamplingStreamingManagerHelper *a1)
{
  uint64_t v1;
  GTUSCSamplingStreamingManager *v2;
  GTUSCSamplingStreamingManagerHelper *v3;
  NSDictionary *v4;
  void *v5;
  GTBatchedCounterManager *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  GTUSCSamplingStreamingManagerHelper *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  void (*v40)(uint64_t);
  char *v41;
  __int128 *v42;

  v1 = *(_QWORD *)(*((_QWORD *)a1 + 4) + 8);
  GTUSCSamplingStreamingManagerHelper::Instance(a1);
  GTUSCSamplingStreamingManagerHelper::Init((GTUSCSamplingStreamingManagerHelper *)(v1 + 48), v2);
  v3 = (GTUSCSamplingStreamingManagerHelper *)dispatch_semaphore_signal((dispatch_semaphore_t)xmmword_7529E8);
  GTUSCSamplingStreamingManagerHelper::SetupGPURawCounters(v3);
  if ((_DWORD)qword_7528A8 != -1)
    GTAGXProfilingSupportHelper::Initialize((GTAGXProfilingSupportHelper *)qword_7527E8, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 16), "objectForKeyedSubscript:", CFSTR("encoderBatchPriorityList")));
  v6 = -[GTBatchedCounterManager initWithEncoderBatchPriorityList:]([GTBatchedCounterManager alloc], "initWithEncoderBatchPriorityList:", v5);
  v7 = qword_7528B8;
  qword_7528B8 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 16), "objectForKeyedSubscript:", CFSTR("pause")));
  if (!v8)
    objc_msgSend(qword_7528B8, "resume");
  v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 7, v1 + 48));
  v10 = (void *)qword_7527F0;
  qword_7527F0 = v9;

  for (i = 0; i != 7; ++i)
  {
    v12 = (void *)qword_7527F0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_7389A0, "objectAtIndexedSubscript:", i));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[GPURawCounterSelect selectWithName:options:](GPURawCounterSelect, "selectWithName:options:", v13, 0));
    objc_msgSend(v12, "addObject:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 16), "objectForKeyedSubscript:", CFSTR("perEncoderDrawCallCount")));
  v16 = objc_msgSend(v15, "count");

  v17 = objc_msgSend(v5, "count");
  if (v17 <= v16)
    v18 = v16;
  else
    v18 = v17;
  v19 = 2 * (_QWORD)v18;
  v20 = *((_QWORD *)&xmmword_7528C0 + 1);
  v21 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&xmmword_7528C0 + 1) - xmmword_7528C0) >> 3);
  v22 = v19 - v21;
  if (v19 <= v21)
  {
    if (v19 >= v21)
    {
      v25 = *((_QWORD *)&xmmword_7528C0 + 1);
      goto LABEL_29;
    }
    v25 = xmmword_7528C0 + 24 * v19;
    if (*((_QWORD *)&xmmword_7528C0 + 1) != v25)
    {
      v26 = *((_QWORD *)&xmmword_7528C0 + 1);
      do
      {
        v28 = *(void **)(v26 - 24);
        v26 -= 24;
        v27 = v28;
        if (v28)
        {
          *(_QWORD *)(v20 - 16) = v27;
          operator delete(v27);
        }
        v20 = v26;
      }
      while (v26 != v25);
    }
LABEL_27:
    *((_QWORD *)&xmmword_7528C0 + 1) = v25;
    goto LABEL_29;
  }
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(unk_7528D0 - *((_QWORD *)&xmmword_7528C0 + 1)) >> 3) >= v22)
  {
    bzero(*((void **)&xmmword_7528C0 + 1), 24 * ((24 * v22 - 24) / 0x18) + 24);
    v25 = v20 + 24 * ((24 * v22 - 24) / 0x18) + 24;
    goto LABEL_27;
  }
  if (v19 > 0xAAAAAAAAAAAAAAALL)
    abort();
  v42 = (__int128 *)&unk_7528D0;
  if (0x5555555555555556 * ((uint64_t)(unk_7528D0 - xmmword_7528C0) >> 3) > v19)
    v19 = 0x5555555555555556 * ((uint64_t)(unk_7528D0 - xmmword_7528C0) >> 3);
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(unk_7528D0 - xmmword_7528C0) >> 3) >= 0x555555555555555)
    v23 = 0xAAAAAAAAAAAAAAALL;
  else
    v23 = v19;
  v38 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v23);
  v39 = (uint64_t)&v38[24 * v21];
  v41 = &v38[24 * v24];
  bzero((void *)v39, 24 * ((24 * v22 - 24) / 0x18) + 24);
  v40 = (void (*)(uint64_t))(v39 + 24 * ((24 * v22 - 24) / 0x18) + 24);
  std::vector<std::vector<NSObject  {objcproto21OS_dispatch_semaphore}* {__strong}>>::__swap_out_circular_buffer(&xmmword_7528C0, &v38);
  std::__split_buffer<std::vector<std::pair<unsigned int,unsigned int>>>::~__split_buffer((uint64_t)&v38);
  v25 = *((_QWORD *)&xmmword_7528C0 + 1);
LABEL_29:
  std::vector<std::pair<unsigned int,unsigned int>>::reserve(&qword_7528D8, 0xAAAAAAAAAAAAAAABLL * ((v25 - (uint64_t)xmmword_7528C0) >> 3));
  v38 = (char *)_NSConcreteStackBlock;
  v39 = 3221225472;
  v40 = ___ZN35GTUSCSamplingStreamingManagerHelper20InitBatchIdFilteringEP29GTUSCSamplingStreamingManager_block_invoke;
  v41 = (char *)&__block_descriptor_40_e5_v8__0l;
  v42 = &GTUSCSamplingStreamingManagerHelper::Instance(void)::instance;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v38));
  objc_msgSend(v29, "setQueuePriority:", -8);
  objc_msgSend(**(id **)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8), "addOperation:", v29);
  objc_msgSend(v29, "waitUntilFinished");
  v30 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1));
  v31 = (void *)qword_752830;
  qword_752830 = v30;

  v32 = (void *)qword_752830;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[GPURawCounterSourceTriggerSelect selectWithName:options:](GPURawCounterSourceTriggerSelect, "selectWithName:options:", CFSTR("KickBoundary"), 0));
  objc_msgSend(v32, "addObject:", v33);

  GTUSCSamplingStreamingManagerHelper::StreamBatchIdFilteredCounters(v34, v35);
  (*(void (**)(void))(*(_QWORD *)(v1 + 80) + 16))();
  v36 = atomic_load((unint64_t *)&xmmword_752AC8);
  if (v36 == v37)
    GTUSCSamplingStreamingManagerHelper::CleanUp((GTUSCSamplingStreamingManagerHelper *)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance);
}

void __GTMTLReplayClient_collectGPUShaderTimelineData_block_invoke(GTUSCSamplingStreamingManagerHelper *a1)
{
  uint64_t v1;
  void *v2;
  GTUSCSamplingStreamingManager *v3;
  unsigned __int8 v4;
  GTUSCSamplingStreamingManagerHelper *v5;
  GTUSCSamplingStreamingManagerHelper *v6;
  void *v7;
  unint64_t v8;
  id v9;
  _QWORD v10[5];

  v1 = *(_QWORD *)(*((_QWORD *)a1 + 4) + 8);
  GTUSCSamplingStreamingManagerHelper::Instance(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 64), "objectForKeyedSubscript:", CFSTR("useOverlap")));
  v9 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue", v2);
  else
    v4 = 1;
  byte_7528B2 = v4;
  GTUSCSamplingStreamingManagerHelper::InitQueryShaderInfo((GTUSCSamplingStreamingManagerHelper *)(v1 + 48), v3);
  HIDWORD(qword_7528A8) = 1;
  GTUSCSamplingStreamingManagerHelper::SetupMTLCounterAPIBuffer(v5);
  GTUSCSamplingStreamingManagerHelper::StreamEncoderDerivedCounterData(v6);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = ___ZN35GTUSCSamplingStreamingManagerHelper17StreamGPUTimelineEv_block_invoke;
  v10[3] = &__block_descriptor_40_e5_v8__0l;
  v10[4] = &GTUSCSamplingStreamingManagerHelper::Instance(void)::instance;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v10));
  GTUSCSamplingStreamingManagerHelper::StreamShaderProfilingData((GTUSCSamplingStreamingManagerHelper *)objc_msgSend(**(id **)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8), "addOperation:", v7));

  (*(void (**)(void))(*(_QWORD *)(v1 + 80) + 16))();
  dispatch_semaphore_signal((dispatch_semaphore_t)xmmword_7529E8);
  v8 = atomic_load((unint64_t *)&xmmword_752AC8);
  if (v8 == v1 + 48)
    GTUSCSamplingStreamingManagerHelper::CleanUp((GTUSCSamplingStreamingManagerHelper *)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance);

}

void __GTMTLReplayClient_collectAPSData_block_invoke(GTUSCSamplingStreamingManagerHelper *a1)
{
  uint64_t v1;
  id v2;
  GTUSCSamplingStreamingManager *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  void *i;
  unsigned int v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unsigned int v32;
  unsigned int v33;
  void *v34;
  id v35;
  void *v36;
  CFTypeRef v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  int v45;
  double v46;
  id v47;
  char *v48;
  uint64_t v49;
  char *v50;
  unint64_t v51;
  double v52;
  unint64_t v53;
  void *v54;
  id v55;
  uint8x8_t v56;
  int v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  char *v63;
  __int128 v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  char *v69;
  int v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  unint64_t j;
  void *v88;
  void *v89;
  double v90;
  _BOOL4 v91;
  void *v92;
  void *v93;
  double v94;
  double v95;
  void *v96;
  void *v97;
  double v98;
  double v99;
  void *v100;
  void *v101;
  double v102;
  GTUSCSamplingStreamingManager *v103;
  char v104;
  void *v105;
  id v106;
  double v107;
  double v108;
  BOOL v109;
  uint64_t v110;
  void *v111;
  unsigned int v112;
  void *v113;
  unsigned int v114;
  unsigned int k;
  GTUSCSamplingStreamingManagerHelper *v116;
  uint64_t v117;
  int v118;
  id v119;
  id v120;
  void *v121;
  GTUSCSamplingStreamingManagerHelper *v122;
  id v123;
  void *v124;
  id v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  GTUSCSamplingStreamingManagerHelper *v133;
  GTUSCSamplingStreamingManagerHelper *v134;
  GTUSCSamplingStreamingManager *v135;
  int v136;
  GTUSCSamplingStreamingManagerHelper *v137;
  unint64_t v138;
  uint64_t v139;
  int v140;
  unint64_t v141;
  void *v142;
  void *v143;
  id v144;
  id v145;
  unsigned int v146;
  void *v147;
  unsigned int v148;
  GTUSCSamplingStreamingManager *v149;
  GTUSCSamplingStreamingManagerHelper *v150;
  uint64_t v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  uint64_t v156;
  uint64_t *v157;
  uint64_t v158;
  uint64_t (*v159)(uint64_t, uint64_t);
  void (*v160)(uint64_t);
  id v161;

  v1 = *(_QWORD *)(*((_QWORD *)a1 + 4) + 8);
  GTUSCSamplingStreamingManagerHelper::Instance(a1);
  v151 = v1;
  v145 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 64), "objectForKeyedSubscript:", CFSTR("apsProfilingConfig")));
  if (v145)
  {
    v2 = v145;
    v3 = (GTUSCSamplingStreamingManager *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("fractionOfCores")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("thresholdInSeconds")));
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "doubleValue");
      *((_QWORD *)&xmmword_752C80 + 1) = v6;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("drawCountThreshold")));
    v8 = v7;
    if (v7)
      qword_752C90 = (uint64_t)objc_msgSend(v7, "unsignedLongLongValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("usingMinimumTracingMode")));
    v10 = v9;
    if (v9)
    {
      v11 = objc_msgSend(v9, "BOOLValue");
      v12 = 2;
      if (!v11)
        v12 = 0;
      qword_752C98 = qword_752C98 & 0xFFFFFFFFFFFFFFFDLL | v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("GPUDebugger.ShaderProfiler.ForceMinTracingMode"));

      if (v14)
        qword_752C98 |= 2uLL;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("usedCoreMasks")));
    v16 = v15;
    if (v15 && objc_msgSend(v15, "count"))
    {
      std::vector<BOOL>::resize((uint64_t)&qword_752CA0, (unint64_t)objc_msgSend(v16, "count"), 0);
      v154 = 0u;
      v155 = 0u;
      v152 = 0u;
      v153 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v152, &v156, 16);
      if (v18)
      {
        v143 = v10;
        v147 = v5;
        v149 = v3;
        v19 = 0;
        v20 = 0;
        v21 = *(_QWORD *)v153;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v153 != v21)
              objc_enumerationMutation(v17);
            v23 = objc_msgSend(*(id *)(*((_QWORD *)&v152 + 1) + 8 * (_QWORD)i), "BOOLValue");
            v24 = ((unint64_t)i + v19) >> 6;
            v25 = 1 << (v19 + i);
            if (v23)
              v26 = *(_QWORD *)(qword_752CA0 + 8 * v24) | v25;
            else
              v26 = *(_QWORD *)(qword_752CA0 + 8 * v24) & ~v25;
            *(_QWORD *)(qword_752CA0 + 8 * v24) = v26;
            v20 += v23;
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v152, &v156, 16);
          v19 += (uint64_t)i;
        }
        while (v18);
        v27 = (double)v20;
        v5 = v147;
        v3 = v149;
        v10 = v143;
      }
      else
      {
        v27 = 0.0;
      }

      v28 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v27 / (double)(unint64_t)objc_msgSend(v17, "count")));
      v3 = (GTUSCSamplingStreamingManager *)v28;
    }
    if (v3)
    {
      -[GTUSCSamplingStreamingManager doubleValue](v3, "doubleValue");
      *(_QWORD *)&xmmword_752C80 = v29;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("useOverlap")));
    v31 = v30;
    if (v30)
      v32 = objc_msgSend(v30, "BOOLValue");
    else
      v32 = 1;
    qword_752C98 = qword_752C98 & 0xFFFFFFFFFFFFFFFELL | v32;

  }
  v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v151 + 64), "objectForKeyedSubscript:", CFSTR("useOverlap")));
  if (v142)
  {
    v33 = objc_msgSend(v142, "BOOLValue");
    qword_752C98 = qword_752C98 & 0xFFFFFFFFFFFFFFFELL | v33;
    byte_7528B2 = v33;
  }
  LODWORD(xmmword_7528B4) = 0;
  *(_QWORD *)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance = v151 + 48;
  v150 = (GTUSCSamplingStreamingManagerHelper *)(v151 + 48);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(v151 + 48) + 8), "defaultDevice"));
  v35 = DEVICEOBJECT(v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v37 = GTProfilerConfigurationVariables((io_registry_entry_t)objc_msgSend(v36, "acceleratorPort"));
  v38 = objc_claimAutoreleasedReturnValue(v37);
  v39 = (void *)qword_7527E8;
  qword_7527E8 = v38;

  v40 = (id)qword_7527E8;
  v41 = v40;
  if (!qword_752CA8)
  {
    v144 = v40;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("num_cores")));
    v148 = objc_msgSend(v42, "unsignedIntValue");

    if (*(double *)&xmmword_752C80 >= 1.0)
    {
      std::vector<BOOL>::resize((uint64_t)&qword_752CA0, v148, 1);
    }
    else
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("core_mask_list"), *(double *)&xmmword_752C80));
      v44 = objc_msgSend(v43, "count");
      if (v44 <= 1)
        v45 = 1;
      else
        v45 = v44;
      v146 = v45;
      std::vector<BOOL>::resize((uint64_t)&qword_752CA0, v148, 0);
      v46 = *(double *)&xmmword_752C80;
      v47 = objc_msgSend(v43, "count");
      if (v47)
      {
        if ((unint64_t)v47 > 0xAAAAAAAAAAAAAAALL)
          abort();
        v48 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>((unint64_t)v47);
        v50 = &v48[24 * v49];
      }
      else
      {
        v48 = 0;
        v50 = 0;
      }
      v51 = 0;
      v52 = v46 * (double)v148;
      v141 = v148 / v146;
      v140 = (int)(ceil(v52) / (double)v146);
      v139 = vcvtpd_s64_f64(v52) - v146 * v140;
      v53 = (unint64_t)v48;
      while (v51 < (unint64_t)objc_msgSend(v43, "count", v139))
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectAtIndexedSubscript:", v51));
        v55 = objc_msgSend(v54, "unsignedLongLongValue");

        v56 = (uint8x8_t)vcnt_s8((int8x8_t)v55);
        v56.i16[0] = vaddlv_u8(v56);
        v57 = -v56.i32[0];
        if (v53 >= (unint64_t)v50)
        {
          v58 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v53 - (_QWORD)v48) >> 3) + 1;
          if (v58 > 0xAAAAAAAAAAAAAAALL)
            abort();
          if (0x5555555555555556 * ((v50 - v48) >> 3) > v58)
            v58 = 0x5555555555555556 * ((v50 - v48) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * ((v50 - v48) >> 3) >= 0x555555555555555)
            v59 = 0xAAAAAAAAAAAAAAALL;
          else
            v59 = v58;
          if (v59)
            v59 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v59);
          else
            v60 = 0;
          v61 = v59 + 8 * ((uint64_t)(v53 - (_QWORD)v48) >> 3);
          *(_DWORD *)v61 = v57;
          *(_QWORD *)(v61 + 8) = v51;
          *(_QWORD *)(v61 + 16) = v55;
          if ((char *)v53 == v48)
          {
            v63 = (char *)(v59 + 8 * ((uint64_t)(v53 - (_QWORD)v48) >> 3));
            v41 = v144;
          }
          else
          {
            v62 = v59 + 8 * ((uint64_t)(v53 - (_QWORD)v48) >> 3);
            v41 = v144;
            do
            {
              v63 = (char *)(v62 - 24);
              v64 = *(_OWORD *)(v53 - 24);
              *(_QWORD *)(v62 - 8) = *(_QWORD *)(v53 - 8);
              *(_OWORD *)(v62 - 24) = v64;
              v53 -= 24;
              v62 -= 24;
            }
            while ((char *)v53 != v48);
          }
          v50 = (char *)(v59 + 24 * v60);
          v53 = v61 + 24;
          if (v48)
            operator delete(v48);
          v48 = v63;
        }
        else
        {
          *(_DWORD *)v53 = v57;
          *(_QWORD *)(v53 + 8) = v51;
          *(_QWORD *)(v53 + 16) = v55;
          v53 += 24;
        }
        ++v51;
      }
      v65 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v53 - (_QWORD)v48) >> 3));
      if ((char *)v53 == v48)
        v66 = 0;
      else
        v66 = v65;
      std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::tuple<int,unsigned long,unsigned long long> *,false>((unint64_t)v48, v53, v66, 1);
      if ((char *)v53 != v48)
      {
        v67 = 0;
        v68 = v148 / v146;
        if (v141 <= 1)
          v68 = 1;
        v69 = v48;
        do
        {
          if (v67 >= (int)v139)
            v70 = 0;
          else
            v70 = -1;
          if (v146 <= v148)
          {
            v71 = 0;
            v72 = *((_QWORD *)v69 + 1) * v141;
            v73 = qword_752CA0;
            v74 = v140;
            do
            {
              if (v74 <= v70)
                break;
              v75 = *((_QWORD *)v69 + 2);
              if ((v75 & (1 << v71)) != 0)
              {
                *((_QWORD *)v69 + 2) = v75 & ~(1 << v71);
                --v74;
                *(_QWORD *)(v73 + (((v72 + v71) >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << (v72
                                                                                        + v71);
              }
              ++v71;
            }
            while (v68 != v71);
          }
          ++v67;
          v69 += 24;
        }
        while (v69 != (char *)v53);
      }
      if (v48)
        operator delete(v48);

    }
  }

  v156 = 0;
  v157 = &v156;
  v158 = 0x3032000000;
  v159 = __Block_byref_object_copy_;
  v160 = __Block_byref_object_dispose_;
  v161 = (id)objc_opt_new(NSMutableArray, v76);
  *(_QWORD *)&v152 = _NSConcreteStackBlock;
  *((_QWORD *)&v152 + 1) = 3221225472;
  *(_QWORD *)&v153 = ___ZN35GTUSCSamplingStreamingManagerHelper18CalculateFrameTimeEv_block_invoke;
  *((_QWORD *)&v153 + 1) = &unk_727530;
  *(_QWORD *)&v154 = &v156;
  *((_QWORD *)&v154 + 1) = &GTUSCSamplingStreamingManagerHelper::Instance(void)::instance;
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v152));
  objc_msgSend(**(id **)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8), "addOperation:", v77);
  objc_msgSend(v77, "waitUntilFinished");
  if (objc_msgSend((id)v157[5], "count"))
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v157[5], "objectAtIndexedSubscript:", 0));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectAtIndexedSubscript:", 1));
    objc_msgSend(v79, "doubleValue");
    v81 = v80;

  }
  else
  {
    v81 = 0.0;
  }
  if (objc_msgSend((id)v157[5], "count"))
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v157[5], "objectAtIndexedSubscript:", 0));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v83, "doubleValue");
    v85 = v84;

    v86 = v81 - v85;
  }
  else
  {
    v86 = 0.0;
  }
  for (j = 1; j < (unint64_t)objc_msgSend((id)v157[5], "count"); ++j)
  {
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v157[5], "objectAtIndexedSubscript:", j));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "objectAtIndexedSubscript:", 1));
    objc_msgSend(v89, "doubleValue");
    v91 = v81 < v90;

    if (v91)
    {
      v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v157[5], "objectAtIndexedSubscript:", j));
      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "objectAtIndexedSubscript:", 1));
      objc_msgSend(v93, "doubleValue");
      v95 = v94;
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v157[5], "objectAtIndexedSubscript:", j));
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "objectAtIndexedSubscript:", 0));
      objc_msgSend(v97, "doubleValue");
      if (v81 >= v98)
        v99 = v81;
      else
        v99 = v98;

      v86 = v86 + v95 - v99;
    }
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v157[5], "objectAtIndexedSubscript:", j));
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "objectAtIndexedSubscript:", 1));
    objc_msgSend(v101, "doubleValue");
    if (v81 < v102)
      v81 = v102;

  }
  qword_752C78 = *(_QWORD *)&v86;

  _Block_object_dispose(&v156, 8);
  v104 = qword_752C98;
  if ((qword_752C98 & 2) == 0)
  {
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v151 + 64), "objectForKeyedSubscript:", CFSTR("totalDrawCallCount")));
    v106 = objc_msgSend(v105, "unsignedIntegerValue");

    v107 = *(double *)&xmmword_752C80 + *(double *)&xmmword_752C80;
    if (*(double *)&xmmword_752C80 + *(double *)&xmmword_752C80 > 1.0)
      v107 = 1.0;
    v108 = v86 * v107;
    v109 = (unint64_t)v106 <= qword_752C90 && v108 <= 0.5;
    v110 = 2;
    if (v109)
      v110 = 0;
    qword_752C98 = v110 | qword_752C98 & 0xFFFFFFFFFFFFFFFDLL;
    *((_QWORD *)&xmmword_752C80 + 1) = 0x3FE0000000000000;
    v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", v108));
    v112 = objc_msgSend(v111, "BOOLForKey:", CFSTR("GPUDebugger.ShaderProfiler.DisableMinTracingMode"));

    if (v112)
      qword_752C98 &= ~2uLL;
    v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v114 = objc_msgSend(v113, "BOOLForKey:", CFSTR("GPUDebugger.ShaderProfiler.ForceMinTracingMode"));

    v104 = qword_752C98;
    if (v114)
    {
      v104 = qword_752C98 | 2;
      qword_752C98 |= 2uLL;
    }
  }
  if ((v104 & 2) != 0)
  {
    GTUSCSamplingStreamingManagerHelper::InitAPSStreaming(v150, v103);
  }
  else
  {
    for (k = 0; k != 5; ++k)
    {
      GTUSCSamplingStreamingManagerHelper::InitAPSStreaming(v150, v103);
      v117 = GTUSCSamplingStreamingManagerHelper::StreamAPS(v116);
      if ((v117 & 1) != 0)
        break;
      v117 = (*(uint64_t (**)(void))(*(_QWORD *)(v151 + 80) + 16))();
      if (k <= 3)
        v117 = dispatch_semaphore_signal((dispatch_semaphore_t)xmmword_7529E8);
    }
  }
  LODWORD(xmmword_7528B4) = 1;
  v118 = 5;
  do
  {
    GTUSCSamplingStreamingManagerHelper::CleanupForAPSStreaming((GTUSCSamplingStreamingManagerHelper *)v117);
    v119 = GTUSCSamplingStreamingManagerHelper::AllocUSCSamplingAddressBuffer((GTUSCSamplingStreamingManagerHelper *)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance);
    qword_7527B8 = (uint64_t)objc_msgSend((id)qword_7527D8, "mutableBytes");
    v120 = -[ProgramAddressTableCollector initForHarvestingBinaries]([ProgramAddressTableCollector alloc], "initForHarvestingBinaries");
    v121 = (void *)xmmword_7527C0;
    *(_QWORD *)&xmmword_7527C0 = v120;

    if ((_DWORD)qword_7528A8 != -1)
    {
      GTUSCSamplingStreamingManagerHelper::SetupBuffersForAPSSource(v122);
      if ((qword_752C98 & 2) != 0)
      {
        v125 = -[GTGPUAPSConfig initForMinimumInfoCounters]([GTGPUAPSConfig alloc], "initForMinimumInfoCounters");
      }
      else
      {
        v123 = -[GTGPUAPSConfig initForCounters]([GTGPUAPSConfig alloc], "initForCounters");
        v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 16), "objectForKeyedSubscript:", CFSTR("CounterConfig")));
        if (v124)
          objc_msgSend(v123, "readConfig:", v124);

        v125 = v123;
      }
      v126 = objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "grcOptions"));
      v127 = (void *)qword_752838;
      qword_752838 = v126;

      v128 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1));
      v129 = (void *)xmmword_752840;
      *(_QWORD *)&xmmword_752840 = v128;

      v130 = (void *)xmmword_752840;
      v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "grcTrigger"));
      v132 = (void *)objc_claimAutoreleasedReturnValue(+[GPURawCounterSourceTriggerSelect selectWithName:options:](GPURawCounterSourceTriggerSelect, "selectWithName:options:", CFSTR("KickAndStateTracing"), v131));
      objc_msgSend(v130, "addObject:", v132);

      v133 = (GTUSCSamplingStreamingManagerHelper *)(*(uint64_t (**)(void))(*(_QWORD *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance
                                                                                     + 32)
                                                                         + 16))();
      GTUSCSamplingStreamingManagerHelper::InitRDELimiterCounters(v133);

    }
    if (GTUSCSamplingStreamingManagerHelper::StreamAPS(v122))
      break;
    v117 = (*(uint64_t (**)(void))(*(_QWORD *)(v151 + 80) + 16))();
    --v118;
  }
  while (v118);
  GTUSCSamplingStreamingManager::InitDerivedCountersInfo((id *)v150);
  GTUSCSamplingStreamingManagerHelper::StreamEncoderDerivedCounterData(v134);
  LODWORD(xmmword_7528B4) = 2;
  v136 = 5;
  do
  {
    GTUSCSamplingStreamingManagerHelper::InitAPSStreaming(v150, v135);
    if (GTUSCSamplingStreamingManagerHelper::StreamAPS(v137))
      break;
    (*(void (**)(void))(*(_QWORD *)(v151 + 80) + 16))();
    --v136;
  }
  while (v136);
  (*(void (**)(void))(*(_QWORD *)(v151 + 80) + 16))();
  dispatch_semaphore_signal((dispatch_semaphore_t)xmmword_7529E8);
  v138 = atomic_load((unint64_t *)&xmmword_752AC8);
  if ((GTUSCSamplingStreamingManagerHelper *)v138 == v150)
    GTUSCSamplingStreamingManagerHelper::CleanUp((GTUSCSamplingStreamingManagerHelper *)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance);

}

void __GTMTLReplayClient_harvestTexture_block_invoke(uint64_t a1)
{
  char *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int8x8_t v12;
  int8x8_t v13;
  int32x2_t v14;

  v2 = (char *)objc_msgSend(*(id *)(a1 + 32), "contents") + *(_QWORD *)(a1 + 40);
  v3 = malloc_type_malloc(*(_QWORD *)(a1 + 136), 0xDC943483uLL);
  v4 = v3;
  if ((int)*(_QWORD *)(a1 + 80) >= 1)
  {
    v5 = 0;
    v6 = *(_QWORD *)(a1 + 80);
    v7 = *(_QWORD *)(a1 + 72);
    v8 = v2;
    do
    {
      if ((int)v7 >= 1)
      {
        v9 = 0;
        do
        {
          v10 = *(_QWORD *)&vorr_s8((int8x8_t)vshl_n_s32((int32x2_t)__PAIR64__(v9, v5), 8uLL), vand_s8((int8x8_t)__PAIR64__(v9, v5), (int8x8_t)0xFFFF0000FFFFLL)) & 0xFF00FF00FF00FFLL;
          v11 = *(_QWORD *)&vorr_s8((int8x8_t)vshl_n_s32((int32x2_t)v10, 4uLL), (int8x8_t)v10) & 0xFF0FFF0FFF0FFF0FLL;
          v12 = vand_s8(vorr_s8((int8x8_t)vshl_n_s32((int32x2_t)v11, 2uLL), (int8x8_t)v11), (int8x8_t)0x3333333333333333);
          v13 = (int8x8_t)vshl_u32((uint32x2_t)v12, (uint32x2_t)0x200000001);
          v12.i32[1] *= 2;
          v14 = (int32x2_t)vand_s8(vorr_s8(v13, v12), (int8x8_t)0xAAAAAAAA55555555);
          *((_QWORD *)v3 + vorr_s8((int8x8_t)v14, (int8x8_t)vdup_lane_s32(v14, 1)).i32[0]) = *(_QWORD *)&v8[8 * v9++];
        }
        while (v7 != v9);
      }
      ++v5;
      v8 += 8 * (int)v7;
    }
    while (v5 != v6);
  }
  memcpy(v2, v3, *(_QWORD *)(a1 + 136));
  free(v4);
}

void __GTMTLReplayClient_createOldTransport_block_invoke(uint64_t a1, void *a2)
{
  ProcessMessage(*(_QWORD *)(a1 + 40), *(void **)(a1 + 32), a2);
}

intptr_t __GTMTLReplayClient_createOldTransport_block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __GTMTLReplayClient_createNewTransport_block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t uint64;
  id v5;
  xpc_object_t xdict;

  xdict = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64 = xpc_dictionary_get_uint64(xdict, "_remoteDeviceRelayPort");
    v5 = objc_msgSend(objc_alloc((Class)GTRelayedXPCConnection), "initWithConnection:relayPort:relayPid:", WeakRetained, uint64, xpc_dictionary_get_uint64(xdict, "_remoteDeviceRelayPid"));
    objc_msgSend(WeakRetained, "dispatchMessage:replyConnection:", xdict, v5);

  }
}

void __GTMTLReplayClient_createNewTransport_block_invoke_2(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;

  v2 = a2;
  exit(0);
}

void __GTMTLReplayClient_queryShaderInfo_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  FILE *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
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
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;

  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "setPerfState:");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 72) + 8), "defaultCommandQueue"));
  objc_msgSend(v2, "setStatEnabled:", 1);
  if (g_runningInCI)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("QueryShaderInfo - subdividing counter list")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#CI-INFO# ")));

    v5 = __stdoutp;
    v6 = objc_retainAutorelease(v4);
    fprintf(v5, "#CI-INFO# %s\n", (const char *)objc_msgSend(v6, "UTF8String"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "subdivideCounterList:", *(_QWORD *)(a1 + 48)));
  validateSubdividedCounterLists(*(void **)(a1 + 48), v7);
  objc_msgSend(v2, "setStatEnabled:", 0);
  v8 = objc_alloc_init((Class)NSMutableArray);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v12 = *(_QWORD *)(a1 + 72);
  v11 = *(id **)(a1 + 80);
  v29 = *(void **)(a1 + 56);
  v30 = v2;
  v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v14 = *(id *)(a1 + 48);
  v15 = v13;
  v16 = *(void **)(v12 + 8);
  v17 = v7;

  v18 = objc_alloc_init((Class)NSMutableData);
  v19 = CollectFrameCounters(v12, v11, v14, v17, 41493, v18);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v20 = objc_alloc_init((Class)NSMutableData);
  v21 = CollectFrameCounters(v12, v11, v14, v17, 63, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = __ProfileFrame_block_invoke;
  v31[3] = &unk_7267F0;
  v32 = v15;
  v33 = v18;
  v34 = v20;
  v35 = v14;
  v23 = v15;
  v24 = v18;
  v25 = v20;
  v26 = v14;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v31));
  objc_msgSend(v27, "addDependency:", v28);
  objc_msgSend(v27, "addDependency:", v22);
  objc_msgSend(v11[1], "addOperation:", v27);

  objc_msgSend(v29, "addDependency:", v27);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 80) + 8), "addOperation:", *(_QWORD *)(a1 + 56));

}

void __GTMTLReplayClient_queryShaderInfo_block_invoke_2(uint64_t a1)
{
  id *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  int v9;
  uint64_t v10;
  _QWORD *v11;
  unsigned int *v12;
  unint64_t i;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  int v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  int FuncEnumConstructorType;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  unint64_t v36;
  uint64_t v37;
  NSObject *v38;
  BOOL v39;
  BOOL v40;
  void *v41;
  void *v42;
  uint64_t v43;
  double *v44;
  double v45;
  double *v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  BOOL v52;
  void *v53;
  _UNKNOWN **v54;
  void *v55;
  void *v56;
  FILE *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v63;
  int v64;
  int v65;
  unsigned int v66;
  uint64_t v67;
  void *v68;
  double *v69;
  id v70;
  int v71;
  id v72;
  _QWORD v73[5];
  mach_timebase_info info;
  _QWORD v75[2];
  uint8_t buf[8];
  _UNKNOWN **v77;

  v1 = *(id **)(a1 + 40);
  info = 0;
  mach_timebase_info(&info);
  v70 = v1[1];
  v2 = *v1;
  v67 = *((_QWORD *)*v1 + 2);
  v3 = *((_QWORD *)*v1 + 14);
  v4 = *(int *)(v3 + 12);
  if ((int)v4 < 1)
  {
    v64 = 0;
  }
  else
  {
    v64 = 0;
    v5 = *(_QWORD *)(v3 + 24);
    do
    {
      if (GetFuncEnumConstructorType(*(_DWORD *)(v5 + 28)) == 25)
      {
        v6 = v2[12];
        v8 = v6 > *(_QWORD *)v5;
        v7 = v2[13] + v6;
        v8 = !v8 && v7 > *(_QWORD *)v5;
        if (v8)
          v9 = v64 + 1;
        else
          v9 = v64;
        v64 = v9;
      }
      v5 += 32;
      --v4;
    }
    while (v4);
  }
  v69 = (double *)malloc_type_calloc(32 * v64, 0x10uLL, 0x1000040451B5BE8uLL);
  v68 = (void *)objc_opt_new(NSMutableSet, v10);
  GTMTLReplayController_prePlayForProfiling((uint64_t)v1);
  v11 = *v1;
  v12 = (unsigned int *)(v1 + 2810);
  for (i = *((unsigned int *)v1 + 5620); v11[13] + v11[12] > i; *v12 = i)
  {
    v14 = objc_autoreleasePoolPush();
    v15 = *(_QWORD *)(v11[15] + 24) + ((unint64_t)*v12 << 6);
    if (GetFuncEnumConstructorType(*(_DWORD *)(v15 + 8)) == 25)
    {
      v16 = GTMTLReplayController_restoreCommandBuffer((uint64_t)v1, v15);
      GTMTLReplayController_updateCommandEncoder((uint64_t)v1, v15);
      GTMTLReplayController_defaultDispatchFunction((uint64_t)v1, v15);
      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *v12));
        objc_msgSend(v68, "addObject:", v17);

      }
    }
    else
    {
      GTMTLReplayController_updateCommandEncoder((uint64_t)v1, v15);
      GTMTLReplayController_defaultDispatchFunction((uint64_t)v1, v15);
    }
    objc_autoreleasePoolPop(v14);
    i = *v12 + 1;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "defaultDevice"));
  v72 = objc_msgSend(v18, "newEvent");

  v63 = mach_absolute_time();
  v71 = 0;
  LODWORD(v19) = 0;
  v20 = 1;
  do
  {
    v21 = v20;
    v66 = v19;
    objc_msgSend((id)g_activityLog, "enterPerformFrameTimingForIndex:");
    v22 = g_signpostLog;
    if (os_signpost_enabled((os_log_t)g_signpostLog))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v66;
      _os_signpost_emit_with_name_impl(&dword_0, v22, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Replayer-1-serial", "performFrameTiming %d", buf, 8u);
    }
    GTMTLReplayController_prePlayForProfiling((uint64_t)v1);
    v65 = v21;
    if (v2[13] + v2[12] > (unint64_t)*v12)
    {
      do
      {
        v23 = objc_autoreleasePoolPush();
        v24 = *(_QWORD *)(v2[15] + 24);
        v25 = *v12;
        FuncEnumConstructorType = GetFuncEnumConstructorType(*(_DWORD *)(v24 + (v25 << 6) + 8));
        if (FuncEnumConstructorType == 25)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v25));
          v28 = objc_msgSend(v68, "containsObject:", v27);

          if (v28)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "defaultCommandQueue"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "commandBuffer"));

            ++performFrameTimingDesktop_signalCounter;
            objc_msgSend(v30, "encodeSignalEvent:value:", v72);
            objc_msgSend(v30, "encodeWaitForEvent:value:", v72, performFrameTimingDesktop_signalCounter);
            objc_msgSend(v30, "commit");

          }
          v31 = GTMTLReplayController_restoreCommandBuffer((uint64_t)v1, v24 + (v25 << 6));
        }
        else
        {
          v31 = 0;
        }
        GTMTLReplayController_updateCommandEncoder((uint64_t)v1, v24 + (v25 << 6));
        GTMTLReplayController_defaultDispatchFunction((uint64_t)v1, v24 + (v25 << 6));
        if (FuncEnumConstructorType == 25)
        {
          v32 = objc_msgSend(v70, "commandBufferForKey:", *((_QWORD *)GTTraceFunc_argumentBytesWithMap((_QWORD *)(v24 + (v25 << 6)), *(unsigned __int8 *)(v24 + (v25 << 6) + 13), *((_QWORD *)*v1 + 2))+ 1));
          v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
          v73[0] = _NSConcreteStackBlock;
          v73[1] = 3221225472;
          v73[2] = __performFrameTimingDesktop_block_invoke;
          v73[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
          v73[4] = &v69[2 * v71];
          objc_msgSend(v33, "addCompletedHandler:", v73);

          ++v71;
        }
        if (v31)
        {
          v34 = objc_msgSend(v70, "commandBufferForKey:", *((_QWORD *)GTTraceFunc_argumentBytesWithMap((_QWORD *)(v24 + (v25 << 6)), *(unsigned __int8 *)(v24 + (v25 << 6) + 13), v67)+ 1));
          v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
          ++performFrameTimingDesktop_signalCounter;
          objc_msgSend(v35, "encodeSignalEvent:value:", v72);
          objc_msgSend(v35, "encodeWaitForEvent:value:", v72, performFrameTimingDesktop_signalCounter);

        }
        objc_autoreleasePoolPop(v23);
        v36 = *v12 + 1;
        *v12 = v36;
      }
      while (v2[13] + v2[12] > v36);
    }
    v37 = mach_absolute_time();
    v38 = g_signpostLog;
    if (os_signpost_enabled((os_log_t)g_signpostLog))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v66;
      _os_signpost_emit_with_name_impl(&dword_0, v38, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Replayer-1-serial", "performFrameTiming %d", buf, 8u);
    }
    v39 = (v37 - v63) * info.numer / info.denom < 0x3B9ACA00;
    objc_msgSend((id)g_activityLog, "leaveActivity");
    v40 = v66 < 0x1F && v39;
    v20 = v65 + 1;
    v19 = v66 + 1;
  }
  while (v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[1], "defaultCommandQueue", v19));
  objc_msgSend(v41, "finish");

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v66 + 1));
  v43 = 0;
  v44 = v69 + 1;
  do
  {
    qsort(&v69[2 * v43 * v64], v64, 0x10uLL, (int (__cdecl *)(const void *, const void *))CommandBufferTimeInfo_compare);
    if (v64 <= 0)
    {
      v48 = 0.0;
    }
    else
    {
      v45 = 0.0;
      v46 = v44;
      v47 = v64;
      v48 = 0.0;
      do
      {
        if (v45 < *(v46 - 1))
          v45 = *(v46 - 1);
        v49 = *v46;
        v46 += 2;
        v50 = v49;
        v51 = v49 - v45;
        v52 = v49 <= v45;
        if (v49 <= v45)
          v51 = -0.0;
        v48 = v48 + v51;
        if (!v52)
          v45 = v50;
        --v47;
      }
      while (v47);
    }
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)(v48 * 1000000000.0)));
    objc_msgSend(v42, "addObject:", v53);

    ++v43;
    v44 += 2 * v64;
  }
  while (v43 != v65);
  free(v69);
  objc_msgSend(v42, "sortUsingComparator:", &__block_literal_global_323);
  if (objc_msgSend(v42, "count"))
    v54 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v42, "count") >> 1));
  else
    v54 = &off_739D48;
  if (g_runningInCI)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GPU Time = %@"), v54));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#CI-INFO# ")));

    v57 = __stdoutp;
    v58 = objc_retainAutorelease(v56);
    fprintf(v57, "#CI-INFO# %s\n", (const char *)objc_msgSend(v58, "UTF8String"));

  }
  v75[0] = CFSTR("frametime");
  v75[1] = CFSTR("frameGPUTime");
  *(_QWORD *)buf = v42;
  v77 = v54;
  v59 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, v75, 2));

  v60 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v61 = *(void **)(v60 + 40);
  *(_QWORD *)(v60 + 40) = v59;

}

id *__GTMTLReplayClient_queryShaderInfo_block_invoke_3(id *result)
{
  id *v1;
  uint64_t v2;

  if (result[4])
  {
    v1 = result;
    result = (id *)objc_msgSend(result[5], "getStateOccupancy");
    *(_QWORD *)(*((_QWORD *)v1[6] + 1) + 24) = v2;
  }
  return result;
}

void __GTMTLReplayClient_queryShaderInfo_block_invoke_4(uint64_t a1)
{
  id Analysis;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "defaultDevice"));
  Analysis = DYMTLReplayFrameProfiler_loadAnalysis(v6);
  v3 = objc_claimAutoreleasedReturnValue(Analysis);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

@end
