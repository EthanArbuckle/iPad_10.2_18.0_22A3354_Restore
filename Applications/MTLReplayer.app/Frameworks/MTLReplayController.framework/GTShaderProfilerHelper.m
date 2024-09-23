@implementation GTShaderProfilerHelper

- (GTShaderProfilerHelper)initWithOptions:(GTProfilerOptions *)a3
{
  GTShaderProfilerHelper *v4;
  GTShaderProfilerHelper *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSOperation *waitOperation;
  NSOperationQueue *v11;
  NSOperationQueue *operationQueue;
  uint64_t v13;
  uint64_t v14;
  DYWorkloadGPUTimelineInfo *workloadTimelineInfo;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)GTShaderProfilerHelper;
  v4 = -[GTShaderProfilerHelper init](&v17, "init");
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    if (objc_msgSend(a3->var0, "length"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", a3->var0, 1, 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3->var0, "stringByAppendingPathComponent:", CFSTR("shaderBinaries")));
      objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);

      objc_msgSend(v6, "removeItemAtPath:error:", CFSTR("/tmp/com.apple.gputools.profiling/shaderProfilerResults"), 0);
      objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/tmp/com.apple.gputools.profiling/shaderProfilerResults"), 1, 0, 0);
      objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/tmp/com.apple.gputools.profiling/shaderProfilerResults/json"), 1, 0, 0);
      if (-[GTShaderProfilerHelper initWithOptions:]::onceToken != -1)
        dispatch_once(&-[GTShaderProfilerHelper initWithOptions:]::onceToken, &__block_literal_global_1870);
      v9 = objc_opt_new(NSOperation, v8);
      waitOperation = v5->waitOperation;
      v5->waitOperation = (NSOperation *)v9;

    }
    v11 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = v11;

    -[NSOperationQueue setName:](v5->_operationQueue, "setName:", CFSTR("gputools.AGXMTLReplayer.serialQueue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    v14 = objc_opt_new(DYWorkloadGPUTimelineInfo, v13);
    workloadTimelineInfo = v5->_workloadTimelineInfo;
    v5->_workloadTimelineInfo = (DYWorkloadGPUTimelineInfo *)v14;

  }
  return v5;
}

- (BOOL)_shouldUseProgramAddressMappings:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = v3;
  v5 = 0;
  if (v3 && (dword_75313C & 0x200) != 0)
    v5 = objc_msgSend(v3, "count") != 0;

  return v5;
}

- (unsigned)_getLegacyProgramType:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_739180, "objectForKeyedSubscript:", a3));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "unsignedIntValue");
  else
    v5 = 255;

  return v5;
}

- (void)_visitAllShaderInfosInResult:(id)a3 usingBlock:(id)a4
{
  id *v5;
  void (**v6)(id, void *, _QWORD, uint64_t);
  uint64_t v7;
  void *v8;
  uint64_t i;
  _QWORD v10[4];

  v5 = (id *)a3;
  v6 = (void (**)(id, void *, _QWORD, uint64_t))a4;
  v10[0] = v5[30];
  v10[1] = v5[31];
  v10[2] = v5[32];
  v7 = 0;
  v10[3] = v5[33];
  do
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_738A78, "objectAtIndexedSubscript:", v7));
    v6[2](v6, v8, v10[v7], v7);

    ++v7;
  }
  while (v7 != 4);
  for (i = 3; i != -1; --i)

}

- (BOOL)analyzeShaderInfoResult:(id)a3 forDataSource:(const GTMTLReplayDataSource *)a4 forReplayController:(const GTMTLReplayController *)a5
{
  NSString *v7;
  NSString *metalPluginName;
  char *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *i;
  char *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  unsigned int v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  unsigned int v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  unsigned int v70;
  id v71;
  id v72;
  uint64_t v73;
  void *k;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  unsigned int v80;
  uint64_t v81;
  char *v82;
  void *v83;
  id v85;
  char *v86;
  char *v87;
  id v88;
  id obj;
  void *v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  unsigned int v95;
  void *j;
  char *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _QWORD v106[5];
  id v107;
  unsigned int v108;
  _QWORD v109[3];
  _QWORD v110[5];
  _OWORD v111[2];
  int v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  void **v117;
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];

  v88 = a3;
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("draw call info")));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("MetalPluginName")));
  metalPluginName = self->_metalPluginName;
  self->_metalPluginName = v7;

  v9 = (char *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _gatherStaticInformation:forReplayController:](self, "_gatherStaticInformation:forReplayController:", a4, a5));
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "drawCallInfoList"));
  v97 = v9;
  v11 = 0;
  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v113, v120, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v114;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v114 != v13)
          objc_enumerationMutation(v10);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)i), "pipelineStateId") == (id)-1)
          ++v11;
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v113, v120, 16);
    }
    while (v12);
  }

  v15 = (char *)objc_msgSend(v91, "count");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "drawCallInfoList"));
  v86 = &v15[v11];
  v87 = (char *)objc_msgSend(v16, "count");

  if (&v15[v11] == v87)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("frametime")));
    -[GTShaderProfilerHelper _calculateFrameTime:result:](self, "_calculateFrameTime:result:", v17, v97);

    v95 = MetalPluginTarget(self->_metalPluginName);
    v18 = 0;
    memset(v111, 0, sizeof(v111));
    v112 = 1065353216;
    while ((unint64_t)objc_msgSend(v91, "count") > v18)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "objectAtIndexedSubscript:", v18));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "drawCallInfoList"));
      v22 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", v18));

      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("vertex shader key")));
      v24 = v22[1];
      v22[1] = (id)v23;

      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("fragment shader key")));
      v26 = v22[2];
      v22[2] = (id)v25;

      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("compute kernel key")));
      v28 = v22[3];
      v22[3] = (id)v27;

      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("mutiple binary keys")));
      v30 = v29;
      if (v29)
      {
        v31 = objc_msgSend(v29, "copy");
        objc_storeStrong(v22 + 4, v31);
      }
      else
      {
        v32 = &__NSArray0__struct;
        v31 = v22[4];
        v22[4] = &__NSArray0__struct;
      }

      if (!std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(v111, v18))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "programPipelineInfoList"));
        v34 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectAtIndexedSubscript:", objc_msgSend(v22, "pipelineStateIndex")));

        objc_storeStrong(v34 + 1, v22[1]);
        objc_storeStrong(v34 + 2, v22[2]);
        objc_storeStrong(v34 + 3, v22[3]);
        objc_storeStrong(v34 + 4, v22[4]);
        std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)v111, v18, v18);

      }
      ++v18;
    }
    v35 = objc_opt_new(NSMutableDictionary, v19);
    v36 = (void *)*((_QWORD *)v97 + 30);
    *((_QWORD *)v97 + 30) = v35;

    v38 = objc_opt_new(NSMutableDictionary, v37);
    v39 = (void *)*((_QWORD *)v97 + 31);
    *((_QWORD *)v97 + 31) = v38;

    v41 = objc_opt_new(NSMutableDictionary, v40);
    v42 = (void *)*((_QWORD *)v97 + 32);
    *((_QWORD *)v97 + 32) = v41;

    v44 = objc_opt_new(NSMutableDictionary, v43);
    v45 = (void *)*((_QWORD *)v97 + 33);
    *((_QWORD *)v97 + 33) = v44;

    v110[0] = _NSConcreteStackBlock;
    v110[1] = 3221225472;
    v110[2] = __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke;
    v110[3] = &unk_725390;
    v110[4] = self;
    -[GTShaderProfilerHelper _visitAllShaderInfosInResult:usingBlock:](self, "_visitAllShaderInfosInResult:usingBlock:", v97, v110);
    if ((*((_BYTE *)self->_options + 16) & 0x40) != 0)
      -[GTShaderProfilerHelper _saveShaderBinariesWith:targetIndex:](self, "_saveShaderBinariesWith:targetIndex:", v97, v95);
    memset(v109, 0, sizeof(v109));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("payload")));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _setupLimiterInfoPerDrawCall:forPayload:withShaderInfo:](self, "_setupLimiterInfoPerDrawCall:forPayload:withShaderInfo:", v97, v46, v88));

    -[GTShaderProfilerHelper _preProcessUSCSampleData:result:targetIndex:](self, "_preProcessUSCSampleData:result:targetIndex:", v88, v97, v95);
    v106[0] = _NSConcreteStackBlock;
    v106[1] = 3221225472;
    v106[2] = __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_3;
    v106[3] = &unk_725400;
    v106[4] = self;
    v108 = v95;
    v85 = v47;
    v107 = v85;
    -[GTShaderProfilerHelper _visitAllShaderInfosInResult:usingBlock:](self, "_visitAllShaderInfosInResult:usingBlock:", v97, v106);
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "drawCallInfoList"));
    v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v119, 16);
    if (v93)
    {
      v92 = *(_QWORD *)v103;
      do
      {
        for (j = 0; j != v93; j = (char *)j + 1)
        {
          if (*(_QWORD *)v103 != v92)
            objc_enumerationMutation(obj);
          v48 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)j);
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "programPipelineInfoList"));
          v94 = objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectAtIndexedSubscript:", objc_msgSend((id)v48, "pipelineStateIndex")));

          v50 = *(void **)(v48 + 8);
          if (v50 && objc_msgSend(v50, "length"))
          {
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v97 + 30), "objectForKeyedSubscript:", *(_QWORD *)(v48 + 8)));
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "analyzerResult"));

            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "drawCallCost"));
            v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)v48, "drawCallIndex")));
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", v54));
            v56 = objc_msgSend(v55, "unsignedIntValue");

            *(double *)(v48 + 40) = (double)v56;
            *(double *)(v48 + 48) = (double)v56;
            *(double *)(v48 + 56) = (double)v56;
            *(float64x2_t *)(v48 + 184) = vaddq_f64(*(float64x2_t *)(v48 + 40), *(float64x2_t *)(v48 + 184));
            *(double *)(v48 + 200) = *(double *)(v48 + 200) + (double)v56;

          }
          v57 = *(void **)(v48 + 16);
          if (v57 && objc_msgSend(v57, "length"))
          {
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v97 + 31), "objectForKeyedSubscript:", *(_QWORD *)(v48 + 16)));
            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "analyzerResult"));

            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "drawCallCost"));
            v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)v48, "drawCallIndex")));
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectForKeyedSubscript:", v61));
            v63 = objc_msgSend(v62, "unsignedIntValue");

            *(double *)(v48 + 88) = (double)v63;
            *(double *)(v48 + 96) = (double)v63;
            *(double *)(v48 + 104) = (double)v63;
            *(float64x2_t *)(v48 + 184) = vaddq_f64(*(float64x2_t *)(v48 + 88), *(float64x2_t *)(v48 + 184));
            *(double *)(v48 + 200) = *(double *)(v48 + 200) + (double)v63;

          }
          v64 = *(void **)(v48 + 24);
          if (v64 && objc_msgSend(v64, "length"))
          {
            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v97 + 32), "objectForKeyedSubscript:", *(_QWORD *)(v48 + 24)));
            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "analyzerResult"));

            v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "drawCallCost"));
            v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)v48, "drawCallIndex")));
            v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKeyedSubscript:", v68));
            v70 = objc_msgSend(v69, "unsignedIntValue");

            *(double *)(v48 + 136) = (double)v70;
            *(double *)(v48 + 144) = (double)v70;
            *(double *)(v48 + 152) = (double)v70;
            *(float64x2_t *)(v48 + 184) = vaddq_f64(*(float64x2_t *)(v48 + 136), *(float64x2_t *)(v48 + 184));
            *(double *)(v48 + 200) = *(double *)(v48 + 200) + (double)v70;

          }
          v100 = 0u;
          v101 = 0u;
          v98 = 0u;
          v99 = 0u;
          v71 = *(id *)(v48 + 32);
          v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v98, v118, 16);
          if (v72)
          {
            v73 = *(_QWORD *)v99;
            do
            {
              for (k = 0; k != v72; k = (char *)k + 1)
              {
                if (*(_QWORD *)v99 != v73)
                  objc_enumerationMutation(v71);
                v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v97 + 33), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)k)));
                v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "analyzerResult"));

                v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "drawCallCost"));
                v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)v48, "drawCallIndex")));
                v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectForKeyedSubscript:", v78));
                v80 = objc_msgSend(v79, "unsignedIntValue");

                *(float64x2_t *)(v48 + 184) = vaddq_f64((float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v80), 0), *(float64x2_t *)(v48 + 184));
                *(double *)(v48 + 200) = *(double *)(v48 + 200) + (double)v80;

              }
              v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v98, v118, 16);
            }
            while (v72);
          }

          *(float64x2_t *)(v94 + 40) = vaddq_f64(*(float64x2_t *)(v48 + 40), *(float64x2_t *)(v94 + 40));
          *(double *)(v94 + 56) = *(double *)(v48 + 56) + *(double *)(v94 + 56);
          *(float64x2_t *)(v94 + 88) = vaddq_f64(*(float64x2_t *)(v48 + 88), *(float64x2_t *)(v94 + 88));
          *(double *)(v94 + 104) = *(double *)(v48 + 104) + *(double *)(v94 + 104);
          *(float64x2_t *)(v94 + 136) = vaddq_f64(*(float64x2_t *)(v48 + 136), *(float64x2_t *)(v94 + 136));
          *(double *)(v94 + 152) = *(double *)(v48 + 152) + *(double *)(v94 + 152);
          *(float64x2_t *)(v94 + 184) = vaddq_f64(*(float64x2_t *)(v48 + 184), *(float64x2_t *)(v94 + 184));
          *(double *)(v94 + 200) = *(double *)(v48 + 200) + *(double *)(v94 + 200);
          *(float64x2_t *)(v97 + 8) = vaddq_f64(*(float64x2_t *)(v48 + 40), *(float64x2_t *)(v97 + 8));
          *((double *)v97 + 3) = *(double *)(v48 + 56) + *((double *)v97 + 3);
          *(float64x2_t *)(v97 + 56) = vaddq_f64(*(float64x2_t *)(v48 + 88), *(float64x2_t *)(v97 + 56));
          *((double *)v97 + 9) = *(double *)(v48 + 104) + *((double *)v97 + 9);
          *(float64x2_t *)(v97 + 104) = vaddq_f64(*(float64x2_t *)(v48 + 136), *(float64x2_t *)(v97 + 104));
          *((double *)v97 + 15) = *(double *)(v48 + 152) + *((double *)v97 + 15);

        }
        v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v119, 16);
      }
      while (v93);
    }

    v81 = *((_QWORD *)self->_options + 2);
    if ((v81 & 0x10) != 0)
    {
      -[GTShaderProfilerHelper _showDrawCallDataforResult:](self, "_showDrawCallDataforResult:", v97);
    }
    else
    {
      v82 = v97;
      if ((v81 & 8) != 0)
        -[GTShaderProfilerHelper _dumpTraceProfileDataForResult:](self, "_dumpTraceProfileDataForResult:", v97);
    }
    if ((*((_BYTE *)self->_options + 16) & 0x40) != 0)
    {
      v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager", v82));
      objc_msgSend(v83, "moveItemAtPath:toPath:error:", CFSTR("/tmp/com.apple.gputools.profiling/shaderProfilerResults"), self->_options->var0, 0);

    }
    v117 = (void **)v109;
    std::vector<std::unordered_map<unsigned int,GTEncoderSampleIndexInfo>>::__destroy_vector::operator()[abi:nn180100](&v117);

    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v111);
  }

  return v86 == v87;
}

- (id)_analyzeBinary:(id)a3 uscSamples:(id)a4 targetIndex:(int)a5 withTextSegment:(id)a6 withKey:(id)a7 withShaderSourcePath:(id)a8 forDataMaster:(unsigned int)a9 withPerDrawLimiterData:(id)a10
{
  uint64_t v13;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v24;

  v13 = *(_QWORD *)&a5;
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a10;
  if (objc_msgSend(v17, "length"))
  {
    LODWORD(v24) = a9;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _calculatePerLineCostWithSampleData:binary:targetIndex:withTextSegment:withKey:withShaderSourcePath:forDataMaster:withPerDrawLimiterData:](self, "_calculatePerLineCostWithSampleData:binary:targetIndex:withTextSegment:withKey:withShaderSourcePath:forDataMaster:withPerDrawLimiterData:", v17, v16, v13, v18, v19, v20, v24, v21));
    if (!v22)
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _calculatePerDrawCallCostWithSampleData:targetIndex:](self, "_calculatePerDrawCallCostWithSampleData:targetIndex:", v17, v13));
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)_gatherStaticInformation:(const GTMTLReplayDataSource *)a3 forReplayController:(const GTMTLReplayController *)a4
{
  uint64_t v5;
  void *v6;
  apr_array_header_t *v7;
  int nelts;
  int v9;
  unint64_t v10;
  char *elts;
  uint64_t v12;
  char *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  unsigned int *v20;
  uint64_t v21;
  _BYTE *v22;
  unsigned int v23;
  char *v25;
  uint64_t v26;
  uint8x8_t v27;
  unint64_t v28;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  _BYTE *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t **v42;
  uint64_t *i;
  unint64_t v44;
  void *v45;
  unint64_t v46;
  uint8x8_t v47;
  void **v48;
  _QWORD *v49;
  unint64_t v50;
  float v51;
  _BOOL8 v52;
  unint64_t v53;
  unint64_t v54;
  size_t v55;
  _QWORD *Object;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  _BYTE *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  unsigned int v73;
  void *v74;
  void *v75;
  uint64_t v76;
  _QWORD *v77;
  unint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  id v85;
  _BYTE *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  unsigned int v94;
  void *v95;
  void *v96;
  const GTMTLReplayDataSource *v98;
  char *v100;
  unint64_t *v101;
  int v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  apr_array_header_t *v106;
  int v107;
  uint64_t v108;
  apr_hash_t *var2;
  unsigned int v110;
  uint64_t v111;
  unsigned int v112;
  unsigned int v113;
  char *v114;
  int v115;
  apr_array_header_t *var3;
  void *v117;
  unsigned int v118;
  id v119;
  _QWORD __dst[1394];
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  _QWORD v125[13];
  uint64_t v126;
  uint64_t v127[11];
  uint64_t v128;
  apr_pool_t *p;
  _BYTE v130[11152];
  _BYTE v131[11152];
  __int128 v132;
  __int128 v133;
  float v134;

  v5 = objc_opt_new(DYMTLShaderProfilerResult, a2);
  v6 = (void *)v5;
  var2 = a3->var2;
  v7 = a3->var9.var2;
  var3 = a3->var9.var3;
  v132 = 0u;
  v133 = 0u;
  v134 = 1.0;
  v106 = v7;
  nelts = v7->nelts;
  if (nelts >= 1)
  {
    v102 = 0;
    v9 = 0;
    v111 = 0;
    v118 = 0;
    v108 = v5 + 200;
    v10 = -1;
    v117 = (void *)v5;
    v98 = a3;
    do
    {
      elts = v106->elts;
      v107 = v9;
      v12 = v9;
      v114 = &elts[32 * v9];
      v13 = &var3->elts[64 * *(_QWORD *)v114];
      v14 = *((_DWORD *)v13 + 2);
      if (GetFuncEnumConstructorType(v14) == 25)
      {
        ++v102;
      }
      else if (GTMTLReplayHost_IsFuncEnumSampledEncoder(v14, 1, 0))
      {
        v101 = (unint64_t *)v13;
        objc_msgSend(v6, "setEncoderCount:", objc_msgSend(v6, "encoderCount") + 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "encoderInfoList"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "drawCallInfoList"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "count")));
        objc_msgSend(v15, "addObject:", v17);

        bzero(v131, 0x2B90uLL);
        bzero(v130, 0x2B90uLL);
        v18 = *(_QWORD *)v114;
        v100 = &elts[32 * v12];
        v19 = v100 + 8;
        if (*(_QWORD *)v114 >= *((_QWORD *)v100 + 1))
        {
LABEL_112:
          v107 += *((_DWORD *)v100 + 5);
          nelts = v106->nelts;
          goto LABEL_113;
        }
        v110 = v102 - 1;
        while (2)
        {
          v20 = (unsigned int *)&var3->elts[64 * v18];
          v21 = IsFuncEnumParallelCommandEncoderCall(v20[2]);
          if ((_DWORD)v21)
            v22 = v131;
          else
            v22 = v130;
          GTMTLSMCommandEncoder_processTraceFunc((uint64_t)v22, (uint64_t *)v20, (uint64_t)a3->var2);
          v23 = v20[2];
          if (v23 != -16279 && v23 != -16337)
          {
            v115 = v21;
            if (IsFuncEnumGPUCommandCall(v23))
            {
              if (IsFuncEnumSampledBlitCall(v23) || IsFuncEnumSampledBlitCallAGX(v23))
                v10 = -1;
              v31 = (void *)objc_opt_new(DYShaderProfilerDrawCallInfo, v30);
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "drawCallInfoList"));
              v33 = objc_msgSend(v32, "count");

              objc_msgSend(v31, "setPipelineStateId:", v10);
              objc_msgSend(v31, "setPipelineStateIndex:", v118);
              objc_msgSend(v31, "setPipelineStateFunctionIndex:", v111);
              objc_msgSend(v31, "setDrawCallIndex:", v33);
              objc_msgSend(v31, "setCommandBufferIndex:", v110);
              objc_msgSend(v31, "setFunctionIndex:", *v20);
              objc_msgSend(v31, "setEncoderIndex:", objc_msgSend(v6, "encoderCount") - 1);
              v34 = v131;
              if (!v115)
                v34 = v130;
              objc_msgSend(v31, "setEncoderStateId:", *((_QWORD *)v34 + 1), v98);
              objc_msgSend(v31, "setEncoderFunctionIndex:", *(_QWORD *)v114);
              if (v10 != -1)
              {
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "programPipelineInfoList"));
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectAtIndexedSubscript:", v118));

                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "drawCallInfoList"));
                v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v33));
                objc_msgSend(v37, "addObject:", v38);

                v6 = v117;
                v19 = v100 + 8;
              }
              *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v108, *(_QWORD *)v20, v20)+ 6) = (_DWORD)v33;
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "drawCallInfoList"));
              objc_msgSend(v39, "addObject:", v31);

              v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v33));
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "encoderInfoList"));
              objc_msgSend(v41, "setObject:atIndexedSubscript:", v40, objc_msgSend(v31, "encoderIndex"));

            }
            else if (v23 >> 2 == 1073737833)
            {
              p = *(apr_pool_t **)a4->var19;
              GTMTLSMContext_indirectCommandBufferResources((uint64_t)v127, a3->var5, *v101, p);
              GetExecuteCommandsInBufferArgs((uint64_t)&v121, (uint64_t)&var3->elts[64 * v18], (uint64_t)a3->var2);
              Object = GTMTLSMContext_getObject(*(_QWORD *)a3->var5, v121, *v101);
              GTMTLCreateIndirectCommandEncoder((uint64_t)v125, Object[13]);
              memcpy(__dst, v22, sizeof(__dst));
              if (*(_DWORD *)v22 == 28)
              {
                if ((GT_SUPPORT_0 & 0x10) != 0)
                {
                  v80 = v123;
                  if (v123)
                  {
                    v113 = 0;
                    v81 = v124 + v126 * (v107 + (int)v122);
                    v105 = v81;
                    do
                    {
                      v128 = v81;
                      if (GTMTLSMComputeCommandEncoder_loadIndirectCommand((uint64_t)&__dst[7], v125, v81, v127))
                      {
                        v83 = (void *)objc_opt_new(DYShaderProfilerDrawCallInfo, v82);
                        v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "drawCallInfoList"));
                        v85 = objc_msgSend(v84, "count");

                        objc_msgSend(v83, "setPipelineStateId:", __dst[8]);
                        v119 = objc_msgSend(v83, "pipelineStateId");
                        objc_msgSend(v83, "setPipelineStateIndex:", *((unsigned int *)std::__hash_table<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&v132, (unint64_t)v119, &v119)+ 6));
                        v119 = objc_msgSend(v83, "pipelineStateId");
                        objc_msgSend(v83, "setPipelineStateFunctionIndex:", std::__hash_table<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&v132, (unint64_t)v119, &v119)[4]);
                        objc_msgSend(v83, "setDrawCallIndex:", v85);
                        objc_msgSend(v83, "setCommandBufferIndex:", v110);
                        objc_msgSend(v83, "setFunctionIndex:", *v20);
                        objc_msgSend(v83, "setSubCommandIndex:", v113);
                        objc_msgSend(v83, "setEncoderIndex:", objc_msgSend(v117, "encoderCount") - 1);
                        v86 = v131;
                        if (!v115)
                          v86 = v130;
                        objc_msgSend(v83, "setEncoderStateId:", *((_QWORD *)v86 + 1), v98);
                        objc_msgSend(v83, "setEncoderFunctionIndex:", *(_QWORD *)v114);
                        if (v10 != -1)
                        {
                          v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "programPipelineInfoList"));
                          v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "objectAtIndexedSubscript:", v118));

                          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "drawCallInfoList"));
                          v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v85));
                          objc_msgSend(v89, "addObject:", v90);

                        }
                        *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v108, *(_QWORD *)v20, v20)+ 6) = (_DWORD)v85;
                        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "drawCallInfoList"));
                        objc_msgSend(v91, "addObject:", v83);

                        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "encoderInfoList"));
                        v93 = objc_msgSend(v92, "count");
                        v94 = objc_msgSend(v83, "encoderIndex");

                        if ((unint64_t)v93 <= v94)
                        {
                          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "encoderInfoList"));
                          v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v85));
                          objc_msgSend(v95, "addObject:", v96);
                        }
                        else
                        {
                          v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v85));
                          v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "encoderInfoList"));
                          objc_msgSend(v96, "setObject:atIndexedSubscript:", v95, objc_msgSend(v83, "encoderIndex"));
                        }
                        ++v113;

                        v81 = v105;
                      }
                      --v80;
                    }
                    while (v80);
                  }
                }
              }
              else if (*(_DWORD *)v22 == 70)
              {
                v57 = v123;
                if (v123)
                {
                  v112 = 0;
                  v58 = v124;
                  v59 = v126;
                  v60 = v122 << 32;
                  v103 = v126;
                  v104 = v124;
                  do
                  {
                    v128 = v58 + v59 * (v60 >> 32);
                    if (GTMTLSMRenderCommandEncoder_loadIndirectCommand((uint64_t)&__dst[7], v125, v128, v127))
                    {
                      v62 = (void *)objc_opt_new(DYShaderProfilerDrawCallInfo, v61);
                      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "drawCallInfoList"));
                      v64 = objc_msgSend(v63, "count");

                      objc_msgSend(v62, "setPipelineStateId:", __dst[1075]);
                      v119 = objc_msgSend(v62, "pipelineStateId");
                      objc_msgSend(v62, "setPipelineStateIndex:", *((unsigned int *)std::__hash_table<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&v132, (unint64_t)v119, &v119)+ 6));
                      v119 = objc_msgSend(v62, "pipelineStateId");
                      objc_msgSend(v62, "setPipelineStateFunctionIndex:", std::__hash_table<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&v132, (unint64_t)v119, &v119)[4]);
                      objc_msgSend(v62, "setDrawCallIndex:", v64);
                      objc_msgSend(v62, "setCommandBufferIndex:", v110);
                      objc_msgSend(v62, "setFunctionIndex:", *v20);
                      objc_msgSend(v62, "setSubCommandIndex:", v112);
                      objc_msgSend(v62, "setEncoderIndex:", objc_msgSend(v117, "encoderCount") - 1);
                      v65 = v131;
                      if (!v115)
                        v65 = v130;
                      objc_msgSend(v62, "setEncoderStateId:", *((_QWORD *)v65 + 1), v98);
                      objc_msgSend(v62, "setEncoderFunctionIndex:", *(_QWORD *)v114);
                      if (v10 != -1)
                      {
                        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "programPipelineInfoList"));
                        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectAtIndexedSubscript:", v118));

                        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "drawCallInfoList"));
                        v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v64));
                        objc_msgSend(v68, "addObject:", v69);

                      }
                      *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v108, *(_QWORD *)v20, v20)+ 6) = (_DWORD)v64;
                      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "drawCallInfoList"));
                      objc_msgSend(v70, "addObject:", v62);

                      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "encoderInfoList"));
                      v72 = objc_msgSend(v71, "count");
                      v73 = objc_msgSend(v62, "encoderIndex");

                      if ((unint64_t)v72 <= v73)
                      {
                        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "encoderInfoList"));
                        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v64));
                        objc_msgSend(v74, "addObject:", v75);
                      }
                      else
                      {
                        v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v64));
                        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "encoderInfoList"));
                        objc_msgSend(v75, "setObject:atIndexedSubscript:", v74, objc_msgSend(v62, "encoderIndex"));
                      }
                      ++v112;

                      v59 = v103;
                      v58 = v104;
                    }
                    v60 += 0x100000000;
                    --v57;
                  }
                  while (v57);
                }
              }
              apr_pool_clear(p);
              v6 = v117;
              a3 = v98;
              v19 = v100 + 8;
            }
            goto LABEL_96;
          }
          v25 = GTTraceFunc_argumentBytesWithMap(v20, *((unsigned __int8 *)v20 + 13), (uint64_t)var2);
          v10 = *((_QWORD *)v25 + 1);
          if (*((_QWORD *)&v132 + 1))
          {
            v27 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v132 + 8));
            v27.i16[0] = vaddlv_u8(v27);
            if (v27.u32[0] > 1uLL)
            {
              v28 = *((_QWORD *)v25 + 1);
              if (v10 >= *((_QWORD *)&v132 + 1))
                v28 = v10 % *((_QWORD *)&v132 + 1);
            }
            else
            {
              v28 = (*((_QWORD *)&v132 + 1) - 1) & v10;
            }
            v42 = *(uint64_t ***)(v132 + 8 * v28);
            if (v42)
            {
              for (i = *v42; i; i = (uint64_t *)*i)
              {
                v44 = i[1];
                if (v44 == v10)
                {
                  if (i[2] == v10)
                  {
                    v118 = *((_DWORD *)i + 6);
                    v111 = i[4];
                    goto LABEL_96;
                  }
                }
                else
                {
                  if (v27.u32[0] > 1uLL)
                  {
                    if (v44 >= *((_QWORD *)&v132 + 1))
                      v44 %= *((_QWORD *)&v132 + 1);
                  }
                  else
                  {
                    v44 &= *((_QWORD *)&v132 + 1) - 1;
                  }
                  if (v44 != v28)
                    break;
                }
              }
            }
          }
          v118 = DWORD2(v133);
          v45 = (void *)objc_opt_new(DYShaderProfilerProgramInfo, v26);
          objc_msgSend(v45, "setProgramId:", v10);
          objc_msgSend(v45, "setProgramIndex:", v118);
          objc_msgSend(v45, "setPipelineStateFunctionIndex:", v18);
          v46 = *((_QWORD *)&v132 + 1);
          if (*((_QWORD *)&v132 + 1))
          {
            v47 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v132 + 8));
            v47.i16[0] = vaddlv_u8(v47);
            if (v47.u32[0] > 1uLL)
            {
              v21 = v10;
              if (v10 >= *((_QWORD *)&v132 + 1))
                v21 = v10 % *((_QWORD *)&v132 + 1);
            }
            else
            {
              v21 = (*((_QWORD *)&v132 + 1) - 1) & v10;
            }
            v48 = *(void ***)(v132 + 8 * v21);
            if (v48)
            {
              v49 = *v48;
              if (*v48)
              {
                do
                {
                  v50 = v49[1];
                  if (v50 == v10)
                  {
                    if (v49[2] == v10)
                      goto LABEL_95;
                  }
                  else
                  {
                    if (v47.u32[0] > 1uLL)
                    {
                      if (v50 >= *((_QWORD *)&v132 + 1))
                        v50 %= *((_QWORD *)&v132 + 1);
                    }
                    else
                    {
                      v50 &= *((_QWORD *)&v132 + 1) - 1;
                    }
                    if (v50 != v21)
                      break;
                  }
                  v49 = (_QWORD *)*v49;
                }
                while (v49);
              }
            }
          }
          v49 = operator new(0x28uLL);
          *v49 = 0;
          v49[1] = v10;
          v49[2] = v10;
          *((_DWORD *)v49 + 6) = 0;
          v49[4] = 0;
          v51 = (float)(unint64_t)(*((_QWORD *)&v133 + 1) + 1);
          if (!v46 || (float)(v134 * (float)v46) < v51)
          {
            v52 = (v46 & (v46 - 1)) != 0;
            if (v46 < 3)
              v52 = 1;
            v53 = v52 | (2 * v46);
            v54 = vcvtps_u32_f32(v51 / v134);
            if (v53 <= v54)
              v55 = v54;
            else
              v55 = v53;
            std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)&v132, v55);
            v46 = *((_QWORD *)&v132 + 1);
            if ((v46 & (v46 - 1)) != 0)
            {
              if (v10 >= *((_QWORD *)&v132 + 1))
                v21 = v10 % *((_QWORD *)&v132 + 1);
              else
                v21 = v10;
            }
            else
            {
              v21 = (*((_QWORD *)&v132 + 1) - 1) & v10;
            }
          }
          v76 = v132;
          v77 = *(_QWORD **)(v132 + 8 * v21);
          if (v77)
          {
            *v49 = *v77;
            goto LABEL_93;
          }
          *v49 = v133;
          *(_QWORD *)&v133 = v49;
          *(_QWORD *)(v76 + 8 * v21) = &v133;
          if (*v49)
          {
            v78 = *(_QWORD *)(*v49 + 8);
            if ((v46 & (v46 - 1)) != 0)
            {
              if (v78 >= v46)
                v78 %= v46;
            }
            else
            {
              v78 &= v46 - 1;
            }
            v77 = (_QWORD *)(v132 + 8 * v78);
LABEL_93:
            *v77 = v49;
          }
          ++*((_QWORD *)&v133 + 1);
LABEL_95:
          *((_DWORD *)v49 + 6) = v118;
          v49[4] = v18;
          objc_msgSend(v45, "setValid:", 1, v98);
          v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "programPipelineInfoList"));
          objc_msgSend(v79, "addObject:", v45);

          v111 = v18;
LABEL_96:
          if ((unint64_t)++v18 >= *v19)
            goto LABEL_112;
          continue;
        }
      }
LABEL_113:
      v9 = v107 + 1;
    }
    while (v107 + 1 < nelts);
  }
  if ((objc_opt_respondsToSelector(v6, "buildDrawCallIndexMap") & 1) != 0)
    objc_msgSend(v6, "buildDrawCallIndexMap");
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v132);
  return v6;
}

- (void)_saveSampleDataFromGPURawCounters:(unint64_t *)a3 size:(unsigned int)a4 filename:(const char *)a5
{
  FILE *v7;
  FILE *v8;
  unsigned int v9;
  unint64_t v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t *v13;
  uint64_t i;

  v7 = fopen(a5, "wt");
  if (v7)
  {
    v8 = v7;
    if (a4)
    {
      v9 = 0;
      do
      {
        v10 = a3[v9];
        v11 = v9 + 4 * (BYTE4(v10) & 0x7F) + 1;
        fprintf(v8, "%6u : encoderId:%u limiterIdx:%u nTracePackets:%u)\n", v11, v10, v10 >> 39, BYTE4(v10) & 0x7F);
        if ((a3[v9] & 0x7F00000000) != 0)
        {
          v12 = 0;
          v13 = &a3[v9 + 1];
          do
          {
            for (i = 0; i != 4; ++i)
              fprintf(v8, "%6u : 0x%0.8llx 0x%0.8llx\n", i, HIDWORD(v13[i]), v13[i]);
            ++v12;
            v13 += 4;
          }
          while (v12 < (HIDWORD(a3[v9]) & 0x7Fu));
        }
        v9 = v11;
      }
      while (v11 < a4);
    }
    fclose(v8);
  }
}

- (void)_calculatePerSampleAggregatedActiveShaders:(id)a3 withShaderProfilerResult:(id)a4 forWorkloadInfo:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t j;
  unsigned int i;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *k;
  void *v32;
  char *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  _QWORD *v41;
  _QWORD *v42;
  char *v43;
  __int128 v44;
  char *v45;
  unsigned int v46;
  unsigned int v47;
  size_t v48;
  size_t v49;
  unsigned int v50;
  size_t v51;
  char *v52;
  unint64_t v53;
  int64_t v54;
  uint64_t v55;
  double v56;
  void *v57;
  void *v58;
  id v59;
  char *v60;
  void *v61;
  void *v62;
  id v63;
  _DWORD *v64;
  uint64_t v65;
  unsigned int *v66;
  unsigned int v67;
  unint64_t *v68;
  _QWORD *v69;
  uint64_t v70;
  unsigned int *v71;
  unsigned int v72;
  _DWORD *v73;
  unint64_t *v74;
  _QWORD *v75;
  unint64_t v76;
  char *v77;
  unsigned int v78;
  _QWORD *v79;
  char *v80;
  char **v81;
  char *v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  char *v92;
  uint64_t v93;
  char *v94;
  char *v95;
  char *v96;
  char *v97;
  char *v98;
  uint64_t v99;
  char *v100;
  char *v101;
  uint64_t v102;
  char *v103;
  char **v104;
  char *v105;
  unint64_t v106;
  char *v107;
  char *v108;
  uint64_t v109;
  _QWORD *v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  char *v114;
  char *v115;
  char *v116;
  char *v117;
  char *v118;
  uint64_t v119;
  char *v120;
  _QWORD *v121;
  unsigned int v122;
  _QWORD *v123;
  _QWORD *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  id v139;
  void *v140;
  void *v141;
  uint64_t v142;
  char *v143;
  int v144;
  unsigned int v145;
  id obj;
  void *v147;
  int64_t v148;
  char *v149;
  id v150;
  __int128 v151;
  void *__p[2];
  int v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  char *v157;
  char *v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  void *v163;
  char *v164;
  unint64_t v165;
  uint64_t v166;
  unint64_t v167;
  uint64_t v168[3];
  _BYTE v169[128];

  v7 = a3;
  v139 = a4;
  v150 = a5;
  v141 = v7;
  v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "aggregatedGPUTimelineInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("aggregated derived counters")));
  objc_msgSend(v147, "setDerivedCounters:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sampled timestamps")));
  objc_msgSend(v147, "setTimestamps:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "timestamps"));
  objc_msgSend(v147, "setNumPeriodicSamples:", objc_msgSend(v10, "length") >> 3);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "mGPUTimelineInfos"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "derivedCounterNames"));
  v14 = objc_msgSend(v13, "copy");
  objc_msgSend(v147, "setDerivedCounterNames:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "mGPUTimelineInfos"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "encoderTimelineInfos"));
  objc_msgSend(v147, "setEncoderTimelineInfos:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "timestamps"));
  BufferView<unsigned long long>::BufferView(v168, v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "encoderTimelineInfos"));
  BufferView<DYGPUTimelineEncoderTimelineInfo>::BufferView(&v166, v19);

  if (v167)
  {
    v20 = 0;
    LODWORD(j) = 0;
    for (i = 0; i < v167; v20 = ++i)
    {
      v23 = v166;
      v24 = (_QWORD *)(v166 + 24 * v20 + 8);
      for (j = j; j < objc_msgSend(v147, "numPeriodicSamples"); ++j)
      {
        if (*(_QWORD *)(v168[0] + 8 * j) >= *v24)
        {
          *(_DWORD *)(v23 + 24 * v20 + 16) = j;
          break;
        }
      }
    }
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("ring buffer sampled counter data")));
  objc_msgSend(v150, "setPerRingSampledDerivedCounters:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("core counts")));
  objc_msgSend(v150, "setCoreCounts:", v26);

  v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("Restore Timestamps")));
  v140 = (void *)v27;
  if (v27)
    objc_msgSend(v150, "setRestoreTimestamps:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("ring buffer blend factors")));
  v163 = 0;
  v164 = 0;
  v165 = 0;
  std::vector<DYMTLShaderProfilerProgramAddress>::reserve(&v163, (unint64_t)objc_msgSend(v28, "count"));
  v161 = 0u;
  v162 = 0u;
  v159 = 0u;
  v160 = 0u;
  obj = v28;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v159, v169, 16, v28);
  if (v29)
  {
    v30 = *(_QWORD *)v160;
    do
    {
      for (k = 0; k != v29; k = (char *)k + 1)
      {
        if (*(_QWORD *)v160 != v30)
          objc_enumerationMutation(obj);
        v32 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * (_QWORD)k);
        if ((unint64_t)v164 >= v165)
        {
          v34 = 0xAAAAAAAAAAAAAAABLL * ((v164 - (_BYTE *)v163) >> 3);
          v35 = v34 + 1;
          if (v34 + 1 > 0xAAAAAAAAAAAAAAALL)
            abort();
          if (0x5555555555555556 * ((uint64_t)(v165 - (_QWORD)v163) >> 3) > v35)
            v35 = 0x5555555555555556 * ((uint64_t)(v165 - (_QWORD)v163) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v165 - (_QWORD)v163) >> 3) >= 0x555555555555555)
            v36 = 0xAAAAAAAAAAAAAAALL;
          else
            v36 = v35;
          if (v36)
          {
            v37 = std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v36);
            v39 = v38;
          }
          else
          {
            v37 = 0;
            v39 = 0;
          }
          v40 = (char *)BufferView<double>::BufferView(&v37[3 * v34], v32);
          v42 = v163;
          v41 = v164;
          v43 = v40;
          if (v164 != v163)
          {
            do
            {
              v44 = *(_OWORD *)(v41 - 3);
              *((_QWORD *)v43 - 1) = *(v41 - 1);
              *(_OWORD *)(v43 - 24) = v44;
              v43 -= 24;
              v41 -= 3;
            }
            while (v41 != v42);
            v41 = v163;
          }
          v45 = (char *)&v37[3 * v39];
          v33 = v40 + 24;
          v163 = v43;
          v165 = (unint64_t)v45;
          if (v41)
            operator delete(v41);
        }
        else
        {
          v33 = (char *)(BufferView<double>::BufferView(v164, *(void **)(*((_QWORD *)&v159 + 1) + 8 * (_QWORD)k)) + 3);
        }
        v164 = v33;
      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v159, v169, 16);
    }
    while (v29);
  }

  v46 = objc_msgSend(v147, "numPeriodicSamples");
  v156 = 0;
  v157 = 0;
  v158 = 0;
  if (v46)
  {
    v47 = v46;
    v48 = 24 * v46;
    v156 = (char *)operator new(v48);
    v158 = &v156[24 * v47];
    v49 = 24 * ((v48 - 24) / 0x18) + 24;
    bzero(v156, v49);
    v157 = &v156[v49];
  }
  std::vector<std::vector<DYGPUTimelinePipelineStateInfo>>::vector(&v154, objc_msgSend(v147, "numPeriodicSamples"));
  v50 = objc_msgSend(v147, "numPeriodicSamples");
  if (v50)
  {
    v51 = 8 * v50;
    v52 = (char *)operator new(v51);
    bzero(v52, v51);
    v138 = &v52[v51];
  }
  else
  {
    v138 = 0;
    v52 = 0;
  }
  v53 = 0;
  v145 = 0;
  v151 = 0u;
  *(_OWORD *)__p = 0u;
  v143 = v164;
  v149 = (char *)v163;
  v153 = 1050253722;
  if ((unint64_t)((v164 - (_BYTE *)v163) / 24) <= 1)
    v54 = 1;
  else
    v54 = (v164 - (_BYTE *)v163) / 24;
  v148 = v54;
  while (v53 < objc_msgSend(v147, "numPeriodicSamples"))
  {
    if (v143 != v149)
    {
      v55 = 0;
      do
      {
        v56 = *(double *)(*(_QWORD *)&v149[24 * v55] + 8 * v53);
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "mGPUTimelineInfos"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectAtIndexedSubscript:", v55));
        v59 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "activeShadersPerPeriodicSample")));
        v60 = (char *)objc_msgSend(v59, "bytes");
        objc_msgSend(v59, "length");

        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "mGPUTimelineInfos"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "objectAtIndexedSubscript:", v55));
        v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "numActiveShadersPerPeriodicSample")));
        v64 = objc_msgSend(v63, "bytes");
        objc_msgSend(v63, "length");

        v65 = (v56 + 2.22044605e-16);
        v66 = &v64[2 * v65];
        if (*v66)
        {
          v67 = 0;
          do
          {
            v68 = (unint64_t *)&v60[8 * v67 + 8 * v64[2 * v65 + 1]];
            v69 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&v151, *v68, v68);
            v69[3] |= 1 << v55;
            ++v67;
          }
          while (v67 < *v66);
        }
        v70 = (ceil(v56 + -2.22044605e-16) + 2.22044605e-16);
        if ((_DWORD)v70 != (_DWORD)v65)
        {
          v71 = &v64[2 * v70];
          if (*v71)
          {
            v72 = 0;
            v73 = &v64[2 * v70 + 1];
            do
            {
              v74 = (unint64_t *)&v60[8 * v72 + 8 * *v73];
              v75 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&v151, *v74, v74);
              v75[3] |= 1 << v55;
              ++v72;
            }
            while (v72 < *v71);
          }
        }
        ++v55;
      }
      while (v55 != v148);
    }
    v76 = (unint64_t)__p[1];
    v77 = &v52[8 * v53];
    v78 = v145;
    *(_DWORD *)v77 = __p[1];
    *((_DWORD *)v77 + 1) = v145;
    v79 = (_QWORD *)(v154 + 24 * v53);
    v81 = (char **)(v79 + 1);
    v80 = (char *)v79[1];
    v82 = (char *)*v79;
    v83 = (uint64_t)&v80[-*v79] >> 3;
    v144 = v76;
    if (v76 <= v83)
    {
      if (v76 >= v83)
        goto LABEL_71;
      v100 = &v82[8 * v76];
      goto LABEL_70;
    }
    v84 = v76 - v83;
    v85 = v154 + 24 * v53;
    v88 = *(_QWORD *)(v85 + 16);
    v87 = (_QWORD *)(v85 + 16);
    v86 = v88;
    if (v76 - v83 <= (v88 - (uint64_t)v80) >> 3)
    {
      bzero(v80, 8 * v84);
      v100 = &v80[8 * v84];
LABEL_70:
      *v81 = v100;
      goto LABEL_71;
    }
    if (v76 >> 61)
      goto LABEL_113;
    v89 = v86 - (_QWORD)v82;
    v90 = v89 >> 2;
    if (v89 >> 2 <= v76)
      v90 = v76;
    if ((unint64_t)v89 >= 0x7FFFFFFFFFFFFFF8)
      v91 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v91 = v90;
    v92 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v91);
    v142 = v93;
    v94 = v92;
    v95 = &v92[8 * v83];
    bzero(v95, 8 * v84);
    v96 = *v81;
    v97 = (char *)*v79;
    v98 = v95;
    if (*v81 != (char *)*v79)
    {
      do
      {
        v99 = *((_QWORD *)v96 - 1);
        v96 -= 8;
        *((_QWORD *)v98 - 1) = v99;
        v98 -= 8;
      }
      while (v96 != v97);
      v96 = (char *)*v79;
    }
    *v79 = v98;
    *v81 = &v95[8 * v84];
    *v87 = &v94[8 * v142];
    v78 = v145;
    if (v96)
      operator delete(v96);
LABEL_71:
    v101 = &v156[24 * v53];
    v102 = (uint64_t)__p[1];
    v104 = (char **)(v101 + 8);
    v103 = (char *)*((_QWORD *)v101 + 1);
    v105 = *(char **)v101;
    v106 = (uint64_t)&v103[-*(_QWORD *)v101] >> 3;
    if (__p[1] <= (void *)v106)
    {
      if (__p[1] >= (void *)v106)
        goto LABEL_89;
      v120 = &v105[8 * (uint64_t)__p[1]];
      goto LABEL_88;
    }
    v107 = (char *)__p[1] - v106;
    v108 = &v156[24 * v53];
    v111 = *((_QWORD *)v108 + 2);
    v110 = v108 + 16;
    v109 = v111;
    if ((char *)__p[1] - v106 <= (void *)((v111 - (uint64_t)v103) >> 3))
    {
      bzero(v103, 8 * (_QWORD)v107);
      v120 = &v103[8 * (_QWORD)v107];
LABEL_88:
      *v104 = v120;
      goto LABEL_89;
    }
    if ((unint64_t)__p[1] >> 61)
LABEL_113:
      abort();
    v112 = v109 - (_QWORD)v105;
    if ((void *)(v112 >> 2) > __p[1])
      v102 = v112 >> 2;
    if ((unint64_t)v112 >= 0x7FFFFFFFFFFFFFF8)
      v113 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v113 = v102;
    if (v113 >> 61)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v114 = (char *)operator new(8 * v113);
    v115 = &v114[8 * v106];
    bzero(v115, 8 * (_QWORD)v107);
    v116 = *v104;
    v117 = *(char **)v101;
    v118 = v115;
    if (*v104 != *(char **)v101)
    {
      do
      {
        v119 = *((_QWORD *)v116 - 1);
        v116 -= 8;
        *((_QWORD *)v118 - 1) = v119;
        v118 -= 8;
      }
      while (v116 != v117);
      v116 = *(char **)v101;
    }
    *(_QWORD *)v101 = v118;
    *v104 = &v115[8 * (_QWORD)v107];
    *v110 = &v114[8 * v113];
    v78 = v145;
    if (v116)
      operator delete(v116);
LABEL_89:
    v121 = __p[0];
    if (__p[0])
    {
      v122 = 0;
      do
      {
        *(_QWORD *)(*(_QWORD *)(v154 + 24 * v53) + 8 * v122) = v121[2];
        *(_QWORD *)(*(_QWORD *)&v156[24 * v53] + 8 * v122++) = v121[3];
        v121 = (_QWORD *)*v121;
      }
      while (v121);
    }
    if (__p[1])
    {
      v123 = __p[0];
      if (__p[0])
      {
        do
        {
          v124 = (_QWORD *)*v123;
          operator delete(v123);
          v123 = v124;
        }
        while (v124);
      }
      __p[0] = 0;
      v125 = *((_QWORD *)&v151 + 1);
      if (*((_QWORD *)&v151 + 1))
      {
        v126 = 0;
        do
          *(_QWORD *)(v151 + 8 * v126++) = 0;
        while (v125 != v126);
      }
      __p[1] = 0;
    }
    v145 = v78 + v144;
    ++v53;
  }
  v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", v52, v138 - v52));
  objc_msgSend(v147, "setNumActiveShadersPerPeriodicSample:", v127);

  v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 8 * v145));
  v129 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 8 * v145));
  v130 = v154;
  if (v155 != v154)
  {
    v131 = 0;
    v132 = 0;
    do
    {
      v133 = (uint64_t *)(v130 + v131);
      v134 = *v133;
      v135 = v133[1];
      if (v134 != v135)
        objc_msgSend(v128, "appendBytes:length:", v134, v135 - v134);
      v136 = *(_QWORD *)&v156[v131];
      v137 = *(_QWORD *)&v156[v131 + 8];
      if (v136 != v137)
        objc_msgSend(v129, "appendBytes:length:", v136, v137 - v136);
      ++v132;
      v130 = v154;
      v131 += 24;
    }
    while (v132 < 0xAAAAAAAAAAAAAAABLL * ((v155 - v154) >> 3));
  }
  objc_msgSend(v147, "setActiveShadersPerPeriodicSample:", v128);
  objc_msgSend(v147, "setActiveCoreInfoMasksPerPeriodicSample:", v129);

  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v151);
  if (v52)
    operator delete(v52);
  *(_QWORD *)&v151 = &v154;
  std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v151);
  *(_QWORD *)&v151 = &v156;
  std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v151);
  if (v163)
    operator delete(v163);

}

- (void)_updateShaderTimelineInfo:(id)a3 withShaderTimelineDataEx:(id)a4 forGPUTimelineInfo:(id)a5 withEncoderGlobalTraceIdToStateMirrorIdMapping:(void *)a6
{
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  unint64_t v13;
  void *v14;
  int8x8_t prime;
  uint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  char *v20;
  unsigned int v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint8x8_t v25;
  void **v26;
  _QWORD *v27;
  unint64_t v28;
  float v29;
  float v30;
  _BOOL8 v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  uint8x8_t v39;
  unint64_t v40;
  uint8x8_t v41;
  uint64_t v42;
  _QWORD *v43;
  unint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  unint64_t v47;
  _QWORD *v48;
  void *v49;
  id v50;
  id v51;
  char *v52;
  uint64_t v53[3];

  v9 = a3;
  v10 = a4;
  v50 = a5;
  v51 = objc_retainAutorelease(v9);
  v52 = (char *)objc_msgSend(v51, "bytes", v10);
  v11 = objc_retainAutorelease(v10);
  v12 = objc_msgSend(v11, "bytes");
  v13 = (unint64_t)objc_msgSend(v51, "length");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 24 * (v13 / 0x18)));
  objc_msgSend(v50, "setEncoderTimelineInfos:", v14);
  v49 = v11;

  prime = (int8x8_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "encoderTimelineInfos"));
  BufferView<DYGPUTimelineEncoderTimelineInfo>::BufferView(v53, *(void **)&prime);

  if (v13 < 0x18)
    goto LABEL_2;
  v16 = 0;
  if (v13 / 0x18 <= 1)
    v17 = 1;
  else
    v17 = v13 / 0x18;
  v18 = (char *)a6 + 16;
  do
  {
    v19 = v53[0] + 24 * v16;
    v20 = &v52[24 * v16];
    *(_QWORD *)v19 = v12[3 * v16];
    *(_QWORD *)(v19 + 8) = *(_QWORD *)(v20 + 12);
    *(_DWORD *)(v19 + 16) = *((_DWORD *)v20 + 1);
    v21 = *(_DWORD *)(v19 + 20) & 0xFFFFFF00 | (*(_DWORD *)v20 >> 1) & 7;
    *(_DWORD *)(v19 + 20) = v21;
    *(_DWORD *)(v19 + 20) = ((*(_DWORD *)v20 & 1) << 16) | (unsigned __int16)v21;
    v22 = v12[3 * v16];
    v23 = *((unsigned int *)v20 + 5);
    v24 = *((_QWORD *)a6 + 1);
    if (v24)
    {
      v25 = (uint8x8_t)vcnt_s8((int8x8_t)v24);
      v25.i16[0] = vaddlv_u8(v25);
      if (v25.u32[0] > 1uLL)
      {
        prime = (int8x8_t)*((unsigned int *)v20 + 5);
        if (v24 <= v23)
          prime = (int8x8_t)(v23 % v24);
      }
      else
      {
        prime = (int8x8_t)(((_DWORD)v24 - 1) & v23);
      }
      v26 = *(void ***)(*(_QWORD *)a6 + 8 * *(_QWORD *)&prime);
      if (v26)
      {
        v27 = *v26;
        if (*v26)
        {
          do
          {
            v28 = v27[1];
            if (v28 == v23)
            {
              if (*((_DWORD *)v27 + 4) == (_DWORD)v23)
                goto LABEL_79;
            }
            else
            {
              if (v25.u32[0] > 1uLL)
              {
                if (v28 >= v24)
                  v28 %= v24;
              }
              else
              {
                v28 &= v24 - 1;
              }
              if (v28 != *(_QWORD *)&prime)
                break;
            }
            v27 = (_QWORD *)*v27;
          }
          while (v27);
        }
      }
    }
    v27 = operator new(0x20uLL);
    *v27 = 0;
    v27[1] = v23;
    *((_DWORD *)v27 + 4) = v23;
    v27[3] = 0;
    v29 = (float)(unint64_t)(*((_QWORD *)a6 + 3) + 1);
    v30 = *((float *)a6 + 8);
    if (v24 && (float)(v30 * (float)v24) >= v29)
    {
      v23 = (unint64_t)prime;
      goto LABEL_69;
    }
    v31 = (v24 & (v24 - 1)) != 0;
    if (v24 < 3)
      v31 = 1;
    v32 = v31 | (2 * v24);
    v33 = vcvtps_u32_f32(v29 / v30);
    if (v32 <= v33)
      prime = (int8x8_t)v33;
    else
      prime = (int8x8_t)v32;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v24 = *((_QWORD *)a6 + 1);
    }
    if (*(_QWORD *)&prime <= v24)
    {
      if (*(_QWORD *)&prime >= v24)
        goto LABEL_65;
      v40 = vcvtps_u32_f32((float)*((unint64_t *)a6 + 3) / *((float *)a6 + 8));
      if (v24 < 3 || (v41 = (uint8x8_t)vcnt_s8((int8x8_t)v24), v41.i16[0] = vaddlv_u8(v41), v41.u32[0] > 1uLL))
      {
        v40 = std::__next_prime(v40);
      }
      else
      {
        v42 = 1 << -(char)__clz(v40 - 1);
        if (v40 >= 2)
          v40 = v42;
      }
      if (*(_QWORD *)&prime <= v40)
        prime = (int8x8_t)v40;
      if (*(_QWORD *)&prime >= v24)
      {
        v24 = *((_QWORD *)a6 + 1);
        goto LABEL_65;
      }
      if (!*(_QWORD *)&prime)
      {
        v48 = *(_QWORD **)a6;
        *(_QWORD *)a6 = 0;
        if (v48)
          operator delete(v48);
        v24 = 0;
        *((_QWORD *)a6 + 1) = 0;
        goto LABEL_65;
      }
    }
    if (*(_QWORD *)&prime >> 61)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v34 = operator new(8 * *(_QWORD *)&prime);
    v35 = *(_QWORD **)a6;
    *(_QWORD *)a6 = v34;
    if (v35)
      operator delete(v35);
    v36 = 0;
    *((int8x8_t *)a6 + 1) = prime;
    do
      *(_QWORD *)(*(_QWORD *)a6 + 8 * v36++) = 0;
    while (*(_QWORD *)&prime != v36);
    v37 = (_QWORD *)*v18;
    if (*v18)
    {
      v38 = v37[1];
      v39 = (uint8x8_t)vcnt_s8(prime);
      v39.i16[0] = vaddlv_u8(v39);
      if (v39.u32[0] > 1uLL)
      {
        if (v38 >= *(_QWORD *)&prime)
          v38 %= *(_QWORD *)&prime;
      }
      else
      {
        v38 &= *(_QWORD *)&prime - 1;
      }
      *(_QWORD *)(*(_QWORD *)a6 + 8 * v38) = v18;
      v43 = (_QWORD *)*v37;
      if (*v37)
      {
        do
        {
          v44 = v43[1];
          if (v39.u32[0] > 1uLL)
          {
            if (v44 >= *(_QWORD *)&prime)
              v44 %= *(_QWORD *)&prime;
          }
          else
          {
            v44 &= *(_QWORD *)&prime - 1;
          }
          if (v44 != v38)
          {
            if (!*(_QWORD *)(*(_QWORD *)a6 + 8 * v44))
            {
              *(_QWORD *)(*(_QWORD *)a6 + 8 * v44) = v37;
              goto LABEL_61;
            }
            *v37 = *v43;
            *v43 = **(_QWORD **)(*(_QWORD *)a6 + 8 * v44);
            **(_QWORD **)(*(_QWORD *)a6 + 8 * v44) = v43;
            v43 = v37;
          }
          v44 = v38;
LABEL_61:
          v37 = v43;
          v43 = (_QWORD *)*v43;
          v38 = v44;
        }
        while (v43);
      }
    }
    v24 = (unint64_t)prime;
LABEL_65:
    if ((v24 & (v24 - 1)) != 0)
    {
      if (v24 <= v23)
        v23 %= v24;
    }
    else
    {
      v23 = ((_DWORD)v24 - 1) & v23;
    }
LABEL_69:
    v45 = *(_QWORD **)a6;
    v46 = *(_QWORD **)(*(_QWORD *)a6 + 8 * v23);
    if (v46)
    {
      *v27 = *v46;
LABEL_77:
      *v46 = v27;
      goto LABEL_78;
    }
    *v27 = *v18;
    *v18 = v27;
    v45[v23] = v18;
    if (*v27)
    {
      v47 = *(_QWORD *)(*v27 + 8);
      if ((v24 & (v24 - 1)) != 0)
      {
        if (v47 >= v24)
          v47 %= v24;
      }
      else
      {
        v47 &= v24 - 1;
      }
      v46 = (_QWORD *)(*(_QWORD *)a6 + 8 * v47);
      goto LABEL_77;
    }
LABEL_78:
    ++*((_QWORD *)a6 + 3);
LABEL_79:
    v27[3] = v22;
    ++v16;
  }
  while (v16 != v17);
LABEL_2:

}

- (void)_calculatePerSampleActiveShaders:(id)a3 withShaderProfilerResult:(id)a4 forWorkloadInfo:(id)a5
{
  unint64_t v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint8x8_t v26;
  _QWORD *v27;
  unint64_t v28;
  _QWORD *v29;
  float v30;
  _BOOL4 v31;
  unint64_t v32;
  unint64_t v33;
  int8x8_t prime;
  void *v35;
  void *v36;
  uint64_t v37;
  _QWORD **v38;
  unint64_t v39;
  uint8x8_t v40;
  unint64_t v41;
  uint8x8_t v42;
  uint64_t v43;
  _QWORD *i;
  unint64_t v45;
  _QWORD *v46;
  unint64_t v47;
  id v48;
  void *v49;
  unsigned __int8 v50;
  void *v51;
  void *v52;
  FILE *v53;
  id v54;
  void *v55;
  BOOL v56;
  id v57;
  char *v58;
  unsigned int v59;
  void *v60;
  void *v61;
  unsigned int v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  void *j;
  void *v68;
  void *v69;
  unsigned int v70;
  void *v71;
  unsigned int v72;
  void *v73;
  unsigned int v74;
  void *v75;
  unsigned int v76;
  void *v77;
  unsigned int v78;
  unsigned int v79;
  uint64_t *v80;
  unint64_t v81;
  _QWORD *v82;
  _QWORD *v83;
  unsigned int v84;
  unint64_t v85;
  unsigned int *v86;
  _DWORD *v87;
  unsigned int *v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  BOOL v92;
  unint64_t v93;
  uint64_t v94;
  unsigned int *v95;
  unsigned int *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  unsigned int v100;
  unint64_t v101;
  uint64_t *v102;
  unint64_t v103;
  _QWORD *v104;
  _QWORD *v105;
  int64x2_t *v106;
  __int32 v107;
  unint64_t v108;
  int32x2_t *v109;
  int32x2_t *v110;
  int32x2_t *v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  int32x2_t *v117;
  int32x2_t *v118;
  _QWORD *k;
  uint64_t v120;
  char *v121;
  unint64_t v122;
  uint64_t v123;
  unsigned int v124;
  char *v125;
  unsigned int v126;
  char *v127;
  unsigned int v128;
  unsigned int v129;
  char *v130;
  unint64_t v131;
  uint64_t *v132;
  uint64_t *v133;
  _QWORD *v134;
  _QWORD *v135;
  unint64_t v136;
  unint64_t v137;
  unint64_t v138;
  uint64_t v139;
  uint64_t *v140;
  uint64_t *m;
  unsigned int v142;
  _DWORD *v143;
  uint64_t v144;
  unint64_t v145;
  _DWORD *v146;
  unint64_t v147;
  unsigned int *v148;
  uint64_t v149;
  unsigned int *v150;
  unint64_t v152;
  unsigned int v153;
  void **v154;
  void **v155;
  unint64_t *v156;
  unint64_t v157;
  _QWORD *v158;
  unsigned int v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  unint64_t v163;
  uint64_t v164;
  unint64_t *v165;
  char *v166;
  char *v167;
  unint64_t v168;
  unsigned int v169;
  size_t v170;
  char *v171;
  char *v172;
  void *v173;
  _QWORD *v174;
  _QWORD *v175;
  unsigned int v176;
  int v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  void *v182;
  unsigned int v183;
  char *v184;
  id v185;
  id v186;
  uint64_t v187;
  id v188;
  void *v189;
  id v190;
  void *v191;
  void *v192;
  void *v193;
  id v194;
  void *v195;
  void *v196;
  id obj;
  id obja;
  id v199;
  uint64_t *v201;
  __int128 v202;
  __int128 v203;
  int v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  void *v209[2];
  __int128 v210;
  __int128 v211;
  uint64_t v212;
  int v213;
  void *__p[2];
  __int128 v215;
  float v216;
  _QWORD *v217;
  _QWORD *v218;
  _OWORD v219[2];
  int v220;
  _BYTE v221[128];

  v8 = a3;
  v199 = a4;
  v190 = a5;
  v195 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ring buffer")));
  LODWORD(a4) = objc_msgSend(v9, "unsignedIntValue");

  v196 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "mGPUTimelineInfoAtIndex:", a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("limiter data")));
  objc_msgSend(v196, "setDerivedCounters:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("limiter time stamps")));
  objc_msgSend(v196, "setTimestamps:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v196, "timestamps"));
  objc_msgSend(v196, "setNumPeriodicSamples:", objc_msgSend(v12, "length") >> 3);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("limiter counter list")));
  objc_msgSend(v196, "setDerivedCounterNames:", v13);

  v191 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("shader timeline data")));
  memset(v219, 0, sizeof(v219));
  v220 = 1050253722;
  v189 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("shader timeline data ex")));
  -[GTShaderProfilerHelper _updateShaderTimelineInfo:withShaderTimelineDataEx:forGPUTimelineInfo:withEncoderGlobalTraceIdToStateMirrorIdMapping:](self, "_updateShaderTimelineInfo:withShaderTimelineDataEx:forGPUTimelineInfo:withEncoderGlobalTraceIdToStateMirrorIdMapping:", v191, v189, v196, v219);
  std::vector<std::vector<DYGPUTimelinePipelineStateInfo>>::vector(&v217, objc_msgSend(v196, "numPeriodicSamples"));
  v14 = 0;
  v15 = 0;
  *(_OWORD *)__p = 0u;
  v215 = 0u;
  v216 = 1.0;
  v16 = -1;
  while (1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "drawCallInfoList"));
    v18 = v15 < (unint64_t)objc_msgSend(v17, "count");

    if (!v18)
      break;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "drawCallInfoList"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", v15));

    if ((id)v16 != objc_msgSend(v20, "encoderFunctionIndex"))
    {
      v16 = (uint64_t)objc_msgSend(v20, "encoderFunctionIndex");
      v14 = 0;
    }
    v21 = objc_msgSend(v20, "encoderFunctionIndex");
    v22 = std::unordered_map<unsigned long long,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>::find[abi:nn180100]((uint64_t)__p[0], (unint64_t)__p[1], (unint64_t)v21);
    if (v22)
      goto LABEL_79;
    v23 = (unint64_t)objc_msgSend(v20, "encoderFunctionIndex");
    v24 = v23;
    v212 = 0;
    v210 = 0u;
    v211 = 0u;
    *(_OWORD *)v209 = 0u;
    v213 = 1050253722;
    v25 = (unint64_t)__p[1];
    if (__p[1])
    {
      v26 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]);
      v26.i16[0] = vaddlv_u8(v26);
      if (v26.u32[0] > 1uLL)
      {
        v5 = v23;
        if ((void *)v23 >= __p[1])
          v5 = v23 % (unint64_t)__p[1];
      }
      else
      {
        v5 = ((unint64_t)__p[1] - 1) & v23;
      }
      v27 = (_QWORD *)*((_QWORD *)__p[0] + v5);
      if (v27)
      {
        v22 = (_QWORD *)*v27;
        if (*v27)
        {
          do
          {
            v28 = v22[1];
            if (v28 == v23)
            {
              if (v22[2] == v23)
                goto LABEL_77;
            }
            else
            {
              if (v26.u32[0] > 1uLL)
              {
                if ((void *)v28 >= __p[1])
                  v28 %= (unint64_t)__p[1];
              }
              else
              {
                v28 &= (unint64_t)__p[1] - 1;
              }
              if (v28 != v5)
                break;
            }
            v22 = (_QWORD *)*v22;
          }
          while (v22);
        }
      }
    }
    v29 = operator new(0x58uLL);
    *(_QWORD *)&v202 = v29;
    *((_QWORD *)&v202 + 1) = &v215;
    *v29 = 0;
    v29[1] = v24;
    v29[2] = v24;
    v29[3] = 0;
    v29[4] = 0;
    v29[5] = 0;
    *(_OWORD *)v209 = 0u;
    v210 = 0u;
    v29[6] = 0;
    v29[7] = 0;
    v29[8] = 0;
    v29[9] = 0;
    *((_DWORD *)v29 + 20) = 1050253722;
    LOBYTE(v203) = 1;
    v30 = (float)(unint64_t)(*((_QWORD *)&v215 + 1) + 1);
    if (!v25 || (float)(v216 * (float)v25) < v30)
    {
      v31 = (v25 & (v25 - 1)) == 0;
      if (v25 < 3)
        v31 = 0;
      v32 = (2 * v25) | !v31;
      v33 = vcvtps_u32_f32(v30 / v216);
      if (v32 <= v33)
        prime = (int8x8_t)v33;
      else
        prime = (int8x8_t)v32;
      if (*(_QWORD *)&prime == 1)
      {
        prime = (int8x8_t)2;
      }
      else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
      {
        prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
        v25 = (unint64_t)__p[1];
      }
      if (*(_QWORD *)&prime <= v25)
      {
        if (*(_QWORD *)&prime < v25)
        {
          v41 = vcvtps_u32_f32((float)*((unint64_t *)&v215 + 1) / v216);
          if (v25 < 3 || (v42 = (uint8x8_t)vcnt_s8((int8x8_t)v25), v42.i16[0] = vaddlv_u8(v42), v42.u32[0] > 1uLL))
          {
            v41 = std::__next_prime(v41);
          }
          else
          {
            v43 = 1 << -(char)__clz(v41 - 1);
            if (v41 >= 2)
              v41 = v43;
          }
          if (*(_QWORD *)&prime <= v41)
            prime = (int8x8_t)v41;
          if (*(_QWORD *)&prime >= v25)
          {
            v25 = (unint64_t)__p[1];
          }
          else
          {
            if (prime)
              goto LABEL_34;
            v49 = __p[0];
            __p[0] = 0;
            if (v49)
              operator delete(v49);
            v25 = 0;
            __p[1] = 0;
          }
        }
      }
      else
      {
LABEL_34:
        if (*(_QWORD *)&prime >> 61)
          std::__throw_bad_array_new_length[abi:nn180100]();
        v35 = operator new(8 * *(_QWORD *)&prime);
        v36 = __p[0];
        __p[0] = v35;
        if (v36)
          operator delete(v36);
        v37 = 0;
        __p[1] = (void *)prime;
        do
          *((_QWORD *)__p[0] + v37++) = 0;
        while (*(_QWORD *)&prime != v37);
        v38 = (_QWORD **)v215;
        if ((_QWORD)v215)
        {
          v39 = *(_QWORD *)(v215 + 8);
          v40 = (uint8x8_t)vcnt_s8(prime);
          v40.i16[0] = vaddlv_u8(v40);
          if (v40.u32[0] > 1uLL)
          {
            if (v39 >= *(_QWORD *)&prime)
              v39 %= *(_QWORD *)&prime;
          }
          else
          {
            v39 &= *(_QWORD *)&prime - 1;
          }
          *((_QWORD *)__p[0] + v39) = &v215;
          for (i = *v38; i; v39 = v45)
          {
            v45 = i[1];
            if (v40.u32[0] > 1uLL)
            {
              if (v45 >= *(_QWORD *)&prime)
                v45 %= *(_QWORD *)&prime;
            }
            else
            {
              v45 &= *(_QWORD *)&prime - 1;
            }
            if (v45 != v39)
            {
              if (!*((_QWORD *)__p[0] + v45))
              {
                *((_QWORD *)__p[0] + v45) = v38;
                goto LABEL_59;
              }
              *v38 = (_QWORD *)*i;
              *i = **((_QWORD **)__p[0] + v45);
              **((_QWORD **)__p[0] + v45) = i;
              i = v38;
            }
            v45 = v39;
LABEL_59:
            v38 = (_QWORD **)i;
            i = (_QWORD *)*i;
          }
        }
        v25 = (unint64_t)prime;
      }
      if ((v25 & (v25 - 1)) != 0)
      {
        if (v24 >= v25)
          v5 = v24 % v25;
        else
          v5 = v24;
      }
      else
      {
        v5 = (v25 - 1) & v24;
      }
    }
    v46 = (_QWORD *)*((_QWORD *)__p[0] + v5);
    if (v46)
    {
      *(_QWORD *)v202 = *v46;
      *v46 = v202;
    }
    else
    {
      *(_QWORD *)v202 = v215;
      *(_QWORD *)&v215 = v202;
      *((_QWORD *)__p[0] + v5) = &v215;
      if (*(_QWORD *)v202)
      {
        v47 = *(_QWORD *)(*(_QWORD *)v202 + 8);
        if ((v25 & (v25 - 1)) != 0)
        {
          if (v47 >= v25)
            v47 %= v25;
        }
        else
        {
          v47 &= v25 - 1;
        }
        *((_QWORD *)__p[0] + v47) = v202;
      }
    }
    v22 = (_QWORD *)v202;
    *(_QWORD *)&v202 = 0;
    ++*((_QWORD *)&v215 + 1);
    std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>,void *>>>>::~unique_ptr[abi:nn180100]((uint64_t)&v202);
LABEL_77:
    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v210 + 8);
    if (v209[0])
    {
      v209[1] = v209[0];
      operator delete(v209[0]);
    }
LABEL_79:
    v48 = objc_msgSend(v20, "pipelineStateId");
    v209[0] = v14;
    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)(v22 + 6), (unint64_t)v14, v209)[3] = v48;

    ++v15;
    ++v14;
  }
  v194 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "objectForKeyedSubscript:", CFSTR("usc sampling address data")));
  v193 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "objectForKeyedSubscript:", CFSTR("usc sampling sample data")));
  v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "objectForKeyedSubscript:", CFSTR("usc sampling address mappings")));
  v50 = -[GTShaderProfilerHelper _shouldUseProgramAddressMappings:](self, "_shouldUseProgramAddressMappings:");
  if (g_runningInCI)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("In _calculatePerSampleActiveShaders, sample data %lu bytes, address data %lu bytes, address mappings %lu"), objc_msgSend(v193, "length"), objc_msgSend(v194, "length"), objc_msgSend(v192, "count")));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#CI-INFO# ")));

    v53 = __stdoutp;
    v54 = objc_retainAutorelease(v52);
    fprintf(v53, "#CI-INFO# %s\n", (const char *)objc_msgSend(v54, "UTF8String"));

  }
  if (v194)
  {
    if (v193)
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "drawCallInfoList"));
      v56 = objc_msgSend(v55, "count") == 0;

      if (!v56)
      {
        v57 = objc_retainAutorelease(v194);
        v58 = (char *)objc_msgSend(v57, "bytes");
        v59 = objc_msgSend(v57, "length");
        v186 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/tmp/com.apple.gputools.profiling/shaderProfilerResults/Frames/1/uscSamplingAddressRaw.txt")));
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v186, "stringByDeletingLastPathComponent"));
        objc_msgSend(v60, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v61, 1, 0, 0);

        v188 = objc_retainAutorelease(v186);
        v62 = v59 / 0x18;
        -[GTShaderProfilerHelper _saveAddressList:size:filename:](self, "_saveAddressList:size:filename:", v58, v59 / 0x18uLL, objc_msgSend(v188, "UTF8String"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v188, "stringByDeletingLastPathComponent"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/uscSamplingAddressMapRaw.txt"), v63));

        v185 = objc_retainAutorelease(v64);
        -[GTShaderProfilerHelper _saveAddressMappings:filename:](self, "_saveAddressMappings:filename:", v192, objc_msgSend(v185, "UTF8String"));
        if ((v50 & 1) != 0)
        {
          v207 = 0u;
          v208 = 0u;
          v205 = 0u;
          v206 = 0u;
          obj = v192;
          v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v205, v221, 16);
          if (v65)
          {
            v66 = *(_QWORD *)v206;
            do
            {
              for (j = 0; j != v65; j = (char *)j + 1)
              {
                if (*(_QWORD *)v206 != v66)
                  objc_enumerationMutation(obj);
                v68 = *(void **)(*((_QWORD *)&v205 + 1) + 8 * (_QWORD)j);
                v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("encID")));
                v70 = objc_msgSend(v69, "unsignedIntValue");

                v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("drawCallIndex")));
                v72 = objc_msgSend(v71, "unsignedIntValue");

                v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("mappedAddress")));
                v74 = objc_msgSend(v73, "unsignedLongLongValue");

                v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("mappedSize")));
                v76 = objc_msgSend(v75, "unsignedLongLongValue");

                v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("type")));
                v78 = -[GTShaderProfilerHelper _getLegacyProgramType:](self, "_getLegacyProgramType:", v77);
                v79 = v78;
                if (v78 < 4 || v78 - 100 <= 1)
                {
                  v80 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned long long>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned long long>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned long long>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned long long>>>::find<unsigned int>(*(uint64_t *)&v219[0], *((unint64_t *)&v219[0] + 1), v70);
                  if (v80)
                  {
                    v81 = v80[3];
                    v82 = std::unordered_map<unsigned long long,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>::find[abi:nn180100]((uint64_t)__p[0], (unint64_t)__p[1], v81);
                    if (v82)
                    {
                      v83 = v82;
                      if (v79 <= 3)
                      {
                        v209[0] = (void *)v72;
                        v81 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)(v82 + 6), v72, v209)[3];
                      }
                      v84 = v76 + v74;
                      v86 = (unsigned int *)v83[4];
                      v85 = v83[5];
                      if ((unint64_t)v86 >= v85)
                      {
                        v88 = (unsigned int *)v83[3];
                        v89 = ((char *)v86 - (char *)v88) >> 4;
                        v90 = v89 + 1;
                        if ((unint64_t)(v89 + 1) >> 60)
                          abort();
                        v91 = v85 - (_QWORD)v88;
                        if (v91 >> 3 > v90)
                          v90 = v91 >> 3;
                        v92 = (unint64_t)v91 >= 0x7FFFFFFFFFFFFFF0;
                        v93 = 0xFFFFFFFFFFFFFFFLL;
                        if (!v92)
                          v93 = v90;
                        if (v93)
                        {
                          v93 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<ASVDataSourceFilterTokenType,NSString * {__strong}>>>(v93);
                          v88 = (unsigned int *)v83[3];
                          v86 = (unsigned int *)v83[4];
                        }
                        else
                        {
                          v94 = 0;
                        }
                        v95 = (unsigned int *)(v93 + 16 * v89);
                        *v95 = v74;
                        v95[1] = v84;
                        v95[2] = v81;
                        v95[3] = v79;
                        v96 = v95;
                        if (v86 != v88)
                        {
                          do
                          {
                            *((_OWORD *)v96 - 1) = *((_OWORD *)v86 - 1);
                            v96 -= 4;
                            v86 -= 4;
                          }
                          while (v86 != v88);
                          v88 = (unsigned int *)v83[3];
                        }
                        v87 = v95 + 4;
                        v83[3] = v96;
                        v83[4] = v95 + 4;
                        v83[5] = v93 + 16 * v94;
                        if (v88)
                          operator delete(v88);
                      }
                      else
                      {
                        *v86 = v74;
                        v86[1] = v84;
                        v87 = v86 + 4;
                        v86[2] = v81;
                        v86[3] = v79;
                      }
                      v83[4] = v87;
                    }
                  }
                }

              }
              v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v205, v221, 16);
            }
            while (v65);
          }

        }
        else if (v59 >= 0x18)
        {
          v97 = 0;
          if (v62 <= 1)
            v98 = 1;
          else
            v98 = v62;
          do
          {
            v99 = &v58[24 * v97];
            if ((*(_QWORD *)v99 & *((_QWORD *)v99 + 1) & *((_QWORD *)v99 + 2)) != -1)
            {
              v100 = *((_DWORD *)v99 + 1);
              if (v100 != -1)
              {
                v101 = *(unsigned int *)v99;
                if ((v101 & 0xFC) == 0 || (*(_DWORD *)v99 & 0xFE) == 0x64)
                {
                  v102 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned long long>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned long long>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned long long>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned long long>>>::find<unsigned int>(*(uint64_t *)&v219[0], *((unint64_t *)&v219[0] + 1), v100);
                  if (v102)
                  {
                    v103 = v102[3];
                    v104 = std::unordered_map<unsigned long long,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>::find[abi:nn180100]((uint64_t)__p[0], (unint64_t)__p[1], v103);
                    if (v104)
                    {
                      v105 = v104;
                      if ((v101 & 0xFC) == 0)
                      {
                        v209[0] = (void *)(v101 >> 8);
                        v103 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)(v104 + 6), v101 >> 8, v209)[3];
                        LOBYTE(v101) = *v99;
                      }
                      v106 = (int64x2_t *)&v58[24 * v97 + 8];
                      v107 = v101;
                      v109 = (int32x2_t *)v105[4];
                      v108 = v105[5];
                      if ((unint64_t)v109 >= v108)
                      {
                        v111 = (int32x2_t *)v105[3];
                        v112 = ((char *)v109 - (char *)v111) >> 4;
                        v113 = v112 + 1;
                        if ((unint64_t)(v112 + 1) >> 60)
                          abort();
                        v114 = v108 - (_QWORD)v111;
                        if (v114 >> 3 > v113)
                          v113 = v114 >> 3;
                        if ((unint64_t)v114 >= 0x7FFFFFFFFFFFFFF0)
                          v115 = 0xFFFFFFFFFFFFFFFLL;
                        else
                          v115 = v113;
                        if (v115)
                        {
                          v115 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<ASVDataSourceFilterTokenType,NSString * {__strong}>>>(v115);
                          v111 = (int32x2_t *)v105[3];
                          v109 = (int32x2_t *)v105[4];
                        }
                        else
                        {
                          v116 = 0;
                        }
                        v117 = (int32x2_t *)(v115 + 16 * v112);
                        *v117 = vmovn_s64(*v106);
                        v117[1].i32[0] = v103;
                        v117[1].i32[1] = v107;
                        v118 = v117;
                        if (v109 != v111)
                        {
                          do
                          {
                            *(_OWORD *)v118[-2].i8 = *(_OWORD *)v109[-2].i8;
                            v118 -= 2;
                            v109 -= 2;
                          }
                          while (v109 != v111);
                          v111 = (int32x2_t *)v105[3];
                        }
                        v110 = v117 + 2;
                        v105[3] = v118;
                        v105[4] = v117 + 2;
                        v105[5] = v115 + 16 * v116;
                        if (v111)
                          operator delete(v111);
                      }
                      else
                      {
                        *v109 = vmovn_s64(*v106);
                        v109[1].i32[0] = v103;
                        v109[1].i32[1] = v101;
                        v110 = v109 + 2;
                      }
                      v105[4] = v110;
                    }
                  }
                }
              }
            }
            ++v97;
          }
          while (v97 != v98);
        }
        for (k = (_QWORD *)v215; k; k = (_QWORD *)*k)
        {
          v120 = k[3];
          v121 = (char *)k[4];
          v122 = 126 - 2 * __clz((uint64_t)&v121[-v120] >> 4);
          if (v121 == (char *)v120)
            v123 = 0;
          else
            v123 = v122;
          std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::tuple<unsigned int,unsigned int,unsigned int,unsigned int> *,false>(v120, v121, v123, 1);
        }
        v124 = objc_msgSend(v193, "length");
        v125 = (char *)objc_msgSend(objc_retainAutorelease(v193), "bytes");
        *(_OWORD *)v209 = 0u;
        v210 = 0u;
        LODWORD(v211) = 1050253722;
        v202 = 0u;
        v203 = 0u;
        v204 = 1050253722;
        if (v124 >= 8)
        {
          v127 = v125;
          v128 = 0;
          v126 = 0;
          v129 = v124 >> 3;
          LODWORD(v187) = -1;
          v183 = v124 >> 3;
          v184 = v125;
          do
          {
            v130 = &v127[8 * v128];
            v131 = *(_QWORD *)v130;
            if (*(_QWORD *)v130 != -1)
            {
              v132 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned long long>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned long long>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned long long>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned long long>>>::find<unsigned int>(*(uint64_t *)&v219[0], *((unint64_t *)&v219[0] + 1), *(_QWORD *)v130);
              if (v132)
              {
                v133 = v132;
                v134 = std::unordered_map<unsigned long long,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>::find[abi:nn180100]((uint64_t)__p[0], (unint64_t)__p[1], v132[3]);
                if (v134)
                {
                  v135 = v134;
                  if (v134[3] != v134[4])
                  {
                    v201 = v133;
                    v136 = v131;
                    if ((_DWORD)v187 != v131 >> 39)
                    {
                      std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::clear(&v202);
                      v136 = *(_QWORD *)v130;
                      v187 = *(_QWORD *)v130 >> 39;
                    }
                    if ((v136 & 0x7F00000000) != 0)
                    {
                      v137 = 0;
                      do
                      {
                        v138 = 0;
                        v139 = (uint64_t)&v130[32 * v137 + 8];
                        do
                        {
                          if ((*(_DWORD *)(v139 + 4 * v138) & 1) != 0)
                          {
                            ++v138;
                            std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)v209, *(_DWORD *)(v139 + 4 * v138), *(_DWORD *)(v139 + 4 * v138));
                          }
                          v92 = v138++ >= 7;
                        }
                        while (!v92);
                        ++v137;
                      }
                      while (v137 < (*((_DWORD *)v130 + 1) & 0x7Fu));
                    }
                    obja = (id)v131;
                    v140 = (uint64_t *)v210;
                    for (m = v201; v140; v140 = (uint64_t *)*v140)
                    {
                      v142 = *((_DWORD *)v140 + 4);
                      v143 = (_DWORD *)v135[3];
                      v144 = v135[4] - (_QWORD)v143;
                      if (v144)
                      {
                        v145 = v144 >> 4;
                        v146 = (_DWORD *)v135[3];
                        do
                        {
                          v147 = v145 >> 1;
                          v148 = &v146[4 * (v145 >> 1)];
                          if (v142 >= *v148)
                          {
                            if (*v148 >= v142 && v148[1] == -1 && v148[2] == -1)
                            {
                              v147 = v145 + ~v147;
                              v146 = v148 + 4;
                            }
                            else
                            {
                              v146 = v148 + 4;
                              v147 = v145 + ~v147;
                            }
                          }
                          v145 = v147;
                        }
                        while (v147);
                      }
                      else
                      {
                        v146 = (_DWORD *)v135[3];
                      }
                      if (v143 == v146)
                        v149 = 0;
                      else
                        v149 = -1;
                      v150 = &v146[4 * v149];
                      if (v142 >= *v150 && v142 <= v150[1])
                      {
                        v152 = v150[2] & 0x3FFFFFFF | ((m[3] & 0x3FFFFFFF) << 30) | ((unint64_t)v150[3] << 60);
                        if (std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>(&v202, v152))
                        {
                          m = v201;
                        }
                        else
                        {
                          v153 = v126;
                          std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long &>((uint64_t)&v202, v152, v152);
                          v154 = (void **)&v217[3 * (*(_QWORD *)v130 >> 39)];
                          v155 = v154 + 1;
                          v156 = (unint64_t *)v154[1];
                          v157 = (unint64_t)v154[2];
                          if ((unint64_t)v156 >= v157)
                          {
                            v160 = ((char *)v156 - (_BYTE *)*v154) >> 3;
                            if ((unint64_t)(v160 + 1) >> 61)
                              abort();
                            v161 = v157 - (_QWORD)*v154;
                            v162 = v161 >> 2;
                            if (v161 >> 2 <= (unint64_t)(v160 + 1))
                              v162 = v160 + 1;
                            if ((unint64_t)v161 >= 0x7FFFFFFFFFFFFFF8)
                              v163 = 0x1FFFFFFFFFFFFFFFLL;
                            else
                              v163 = v162;
                            if (v163)
                              v163 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v163);
                            else
                              v164 = 0;
                            v165 = (unint64_t *)(v163 + 8 * v160);
                            *v165 = v152;
                            v158 = v165 + 1;
                            v166 = (char *)*v155;
                            v167 = (char *)*v154;
                            if (*v155 == *v154)
                            {
                              m = v201;
                            }
                            else
                            {
                              m = v201;
                              do
                              {
                                v168 = *((_QWORD *)v166 - 1);
                                v166 -= 8;
                                *--v165 = v168;
                              }
                              while (v166 != v167);
                              v166 = (char *)*v154;
                            }
                            *v154 = v165;
                            *v155 = v158;
                            v154[2] = (void *)(v163 + 8 * v164);
                            if (v166)
                              operator delete(v166);
                            v159 = v153;
                          }
                          else
                          {
                            *v156 = v152;
                            v158 = v156 + 1;
                            v159 = v153;
                            m = v201;
                          }
                          *v155 = v158;
                          v126 = v159 + 1;
                        }
                      }
                    }
                    std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::clear(v209);
                    v129 = v183;
                    v127 = v184;
                    v131 = (unint64_t)obja;
                  }
                }
              }
            }
            v128 += ((v131 >> 30) & 0x1FC) + 1;
          }
          while (v128 < v129);
        }
        else
        {
          v126 = 0;
        }
        v169 = objc_msgSend(v196, "numPeriodicSamples");
        if (v169)
        {
          v170 = 8 * v169;
          v171 = (char *)operator new(v170);
          bzero(v171, v170);
          v172 = &v171[v170];
        }
        else
        {
          v171 = 0;
          v172 = 0;
        }
        v173 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 8 * v126));
        v174 = v217;
        v175 = v218;
        if (v217 != v218)
        {
          v176 = 0;
          v177 = 0;
          do
          {
            v178 = v176;
            *(_DWORD *)&v171[8 * v176 + 4] = v177;
            v179 = v174[1];
            if (*v174 != v179)
            {
              *(_DWORD *)&v171[8 * v178] = (unint64_t)(v179 - *v174) >> 3;
              objc_msgSend(v173, "appendBytes:length:");
              v177 += (v174[1] - *v174) >> 3;
            }
            v176 = v178 + 1;
            v174 += 3;
          }
          while (v174 != v175);
        }
        objc_msgSend(v196, "setActiveShadersPerPeriodicSample:", v173);
        v181 = (void *)objc_opt_new(NSData, v180);
        objc_msgSend(v196, "setActiveCoreInfoMasksPerPeriodicSample:", v181);

        v182 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", v171, v172 - v171));
        objc_msgSend(v196, "setNumActiveShadersPerPeriodicSample:", v182);

        if (v171)
          operator delete(v171);
        std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v202);
        std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v209);

      }
    }
  }

  std::unordered_map<unsigned long long,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>::~unordered_map[abi:nn180100]((uint64_t)__p);
  v209[0] = &v217;
  std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)v209);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v219);

}

- (void)_preProcessStreamingUSCSampleData:(id)a3 result:(id)a4
{
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  FILE *v25;
  id v26;
  uint64_t v27;
  int v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v32 = a3;
  v6 = a4;
  v7 = MetalPluginTarget(self->_metalPluginName);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("usc sampling address data")));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("usc sampling sample data")));
  v10 = (void *)v9;
  if (v8)
  {
    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "drawCallInfoList"));
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("frame index")));
        v14 = objc_msgSend(v13, "unsignedIntValue");

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("ring buffer")));
        v16 = objc_msgSend(v15, "unsignedIntValue");

        LODWORD(v15) = objc_msgSend(v10, "length");
        v29 = v16;
        v30 = v14;
        v31 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/tmp/com.apple.gputools.profiling/shaderProfilerResults/Frames/%u/%u/uscSamplingSampleRaw.txt"), v14, v16));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringByDeletingLastPathComponent"));
        objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v18, 1, 0, 0);

        v19 = objc_retainAutorelease(v10);
        v20 = objc_msgSend(v19, "bytes");
        v21 = objc_retainAutorelease(v31);
        -[GTShaderProfilerHelper _saveSampleDataFromGPURawCounters:size:filename:](self, "_saveSampleDataFromGPURawCounters:size:filename:", v20, v15 >> 3, objc_msgSend(v21, "UTF8String"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("usc sampling address mappings")));
        if (g_runningInCI)
        {
          v28 = v7;
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("In _preProcessStreamingUSCSampleData, sample data %lu bytes, address data %lu bytes, address mappings %lu"), objc_msgSend(v19, "length"), objc_msgSend(v8, "length"), objc_msgSend(v22, "count")));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#CI-INFO# ")));

          v25 = __stdoutp;
          v26 = objc_retainAutorelease(v24);
          fprintf(v25, "#CI-INFO# %s\n", (const char *)objc_msgSend(v26, "UTF8String"));

          v7 = v28;
        }
        LODWORD(v27) = v7;
        if (-[GTShaderProfilerHelper _shouldUseProgramAddressMappings:](self, "_shouldUseProgramAddressMappings:", v22))
          -[GTShaderProfilerHelper _preProcessStreamingUSCSampleData:result:withAddressMappings:sampleData:frameIndex:ringBufferIdx:targetIndex:](self, "_preProcessStreamingUSCSampleData:result:withAddressMappings:sampleData:frameIndex:ringBufferIdx:targetIndex:", v32, v6, v22, v19, v30, v29, v27);
        else
          -[GTShaderProfilerHelper _preProcessStreamingUSCSampleData:result:withAddressData:sampleData:frameIndex:ringBufferIdx:targetIndex:](self, "_preProcessStreamingUSCSampleData:result:withAddressData:sampleData:frameIndex:ringBufferIdx:targetIndex:", v32, v6, v8, v19, v30, v29, v27);

      }
    }
  }

}

- (void)_preProcessStreamingUSCSampleData:(id)a3 result:(id)a4 withAddressData:(id)a5 sampleData:(id)a6 frameIndex:(unsigned int)a7 ringBufferIdx:(unsigned int)a8 targetIndex:(int)a9
{
  uint64_t v9;
  id v13;
  id v14;
  id v15;
  id v16;
  char *v17;
  unsigned int v18;
  id v19;
  unint64_t v20;
  unsigned int v21;
  uint64_t v22;
  _DWORD *v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  _QWORD *v27;
  void *v28;
  id v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  unsigned int *v35;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  __int128 v39;
  char *v40;
  char *v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  __int128 v45;
  char *v46;
  char *v47;
  __int128 v48;
  uint64_t *v49;
  unint64_t v50;
  unint64_t v51;
  uint8x8_t v52;
  uint64_t *v53;
  uint64_t *v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint8x8_t v60;
  void **v61;
  _QWORD *v62;
  unint64_t v63;
  float v64;
  _BOOL8 v65;
  unint64_t v66;
  unint64_t v67;
  size_t v68;
  uint64_t v69;
  _QWORD *v70;
  unint64_t v71;
  char *v72;
  unint64_t v73;
  char **v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  char **v82;
  char *v83;
  char *v84;
  char *v85;
  uint64_t v86;
  unsigned int v87;
  id v88;
  id v89;
  id v90;
  uint64_t v91;
  id v93;
  void *v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  float v99;
  __int128 v100;
  __int128 v101;
  float v102;
  char *v103;
  char *v104;
  unint64_t v105;
  __int128 v106;
  __int128 v107;
  int v108;

  v9 = *(_QWORD *)&a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v93 = objc_retainAutorelease(v15);
  v95 = v16;
  v17 = (char *)objc_msgSend(v93, "bytes");
  LODWORD(a6) = objc_msgSend(v93, "length");
  v18 = objc_msgSend(v16, "length");
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/tmp/com.apple.gputools.profiling/shaderProfilerResults/Frames/%u/uscSamplingAddressRaw.txt"), v9)));
  v20 = a6 / 0x18uLL;
  -[GTShaderProfilerHelper _saveAddressList:size:filename:](self, "_saveAddressList:size:filename:", v17, v20, objc_msgSend(v19, "UTF8String"));
  v106 = 0u;
  v107 = 0u;
  v108 = 1065353216;
  if (a6 >= 0x18)
  {
    v21 = 0;
    v91 = v18 >> 3;
    v22 = v20 <= 1 ? 1 : v20;
    v23 = v17 + 4;
    v24 = 0xFFFFFFFFLL;
    v96 = v22;
    do
    {
      if (*v23 == -1)
      {
        v25 = *(v23 - 1);
        v26 = v25 >> 8;
        if (v25 >> 8 != 0xFFFFFF)
        {
          LODWORD(v100) = v25 >> 8;
          v27 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)&v106, v25 >> 8, &v100);
          if ((_DWORD)v24 == -1)
            v24 = v26;
          else
            v24 = v24;
          *((_DWORD *)v27 + 5) = v26;
          v21 = v26;
        }
      }
      v23 += 6;
      --v22;
    }
    while (v22);
    if (v21 >= v24)
    {
      v87 = v21;
      v103 = 0;
      v104 = 0;
      v105 = 0;
      v100 = 0u;
      v101 = 0u;
      v102 = 0.3;
      v89 = v14;
      v90 = v13;
      v88 = v19;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "drawCallInfoList"));
      v29 = objc_msgSend(v28, "count");
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)&v100, vcvtps_u32_f32((float)(unint64_t)(4 * (_QWORD)v29) / v102));

      std::vector<DYMTLShaderProfilerProgramAddress>::reserve((void **)&v103, v20);
      v30 = 0;
      v31 = v24 - 1;
      v97 = 0u;
      v98 = 0u;
      v99 = 1.0;
      v32 = v96;
      while (1)
      {
        v33 = &v17[24 * v30];
        if ((*(_QWORD *)v33 & *((_QWORD *)v33 + 1) & *((_QWORD *)v33 + 2)) != -1)
        {
          v35 = (unsigned int *)(v33 + 4);
          v34 = *((unsigned int *)v33 + 1);
          v36 = *(unsigned int *)v33;
          if ((_DWORD)v34 != -1)
          {
            if ((v36 & 0xFC) == 0)
              std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)&v100, (v36 >> 8) | (v34 << 32), (v36 >> 8) | (v34 << 32));
            if (*((_QWORD *)&v101 + 1))
              v37 = (DWORD2(v101) - 1);
            else
              v37 = 0;
            v38 = v104;
            if ((unint64_t)v104 >= v105)
            {
              v41 = v103;
              v42 = 0xAAAAAAAAAAAAAAABLL * ((v104 - v103) >> 3) + 1;
              if (v42 > 0xAAAAAAAAAAAAAAALL)
                abort();
              if (0x5555555555555556 * ((uint64_t)(v105 - (_QWORD)v103) >> 3) > v42)
                v42 = 0x5555555555555556 * ((uint64_t)(v105 - (_QWORD)v103) >> 3);
              if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v105 - (_QWORD)v103) >> 3) >= 0x555555555555555)
                v43 = 0xAAAAAAAAAAAAAAALL;
              else
                v43 = v42;
              if (v43)
                v43 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v43);
              else
                v44 = 0;
              v45 = *(_OWORD *)v33;
              v46 = (char *)(v43 + 8 * ((v38 - v41) >> 3));
              *((_QWORD *)v46 + 2) = *((_QWORD *)v33 + 2);
              *(_OWORD *)v46 = v45;
              v47 = v46;
              if (v38 == v41)
              {
                v32 = v96;
              }
              else
              {
                v32 = v96;
                do
                {
                  v48 = *(_OWORD *)(v38 - 24);
                  *((_QWORD *)v47 - 1) = *((_QWORD *)v38 - 1);
                  *(_OWORD *)(v47 - 24) = v48;
                  v47 -= 24;
                  v38 -= 24;
                }
                while (v38 != v41);
                v38 = v103;
              }
              v40 = v46 + 24;
              v103 = v47;
              v105 = v43 + 24 * v44;
              if (v38)
                operator delete(v38);
            }
            else
            {
              v39 = *(_OWORD *)v33;
              *((_QWORD *)v104 + 2) = *((_QWORD *)v33 + 2);
              *(_OWORD *)v38 = v39;
              v40 = v38 + 24;
            }
            v104 = v40;
            *((_DWORD *)v40 - 6) = *(v40 - 24) | (v31 << 8);
            *((_DWORD *)v40 - 5) = v37;
            *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)&v106, *v35, v35)+ 5) = v31;
            v49 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(&v106, v31);
            if (v49)
            {
              v50 = *((_QWORD *)&v106 + 1);
              v51 = v49[1];
              v52 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v106 + 8));
              v52.i16[0] = vaddlv_u8(v52);
              if (v52.u32[0] > 1uLL)
              {
                if (v51 >= *((_QWORD *)&v106 + 1))
                  v51 %= *((_QWORD *)&v106 + 1);
              }
              else
              {
                v51 &= *((_QWORD *)&v106 + 1) - 1;
              }
              v53 = *(uint64_t **)(v106 + 8 * v51);
              do
              {
                v54 = v53;
                v53 = (uint64_t *)*v53;
              }
              while (v53 != v49);
              if (v54 == (uint64_t *)&v107)
                goto LABEL_61;
              v55 = v54[1];
              if (v52.u32[0] > 1uLL)
              {
                if (v55 >= *((_QWORD *)&v106 + 1))
                  v55 %= *((_QWORD *)&v106 + 1);
              }
              else
              {
                v55 &= *((_QWORD *)&v106 + 1) - 1;
              }
              if (v55 != v51)
              {
LABEL_61:
                if (!*v49)
                  goto LABEL_62;
                v56 = *(_QWORD *)(*v49 + 8);
                if (v52.u32[0] > 1uLL)
                {
                  if (v56 >= *((_QWORD *)&v106 + 1))
                    v56 %= *((_QWORD *)&v106 + 1);
                }
                else
                {
                  v56 &= *((_QWORD *)&v106 + 1) - 1;
                }
                if (v56 != v51)
LABEL_62:
                  *(_QWORD *)(v106 + 8 * v51) = 0;
              }
              v57 = *v49;
              if (*v49)
              {
                v58 = *(_QWORD *)(v57 + 8);
                if (v52.u32[0] > 1uLL)
                {
                  if (v58 >= v50)
                    v58 %= v50;
                }
                else
                {
                  v58 &= v50 - 1;
                }
                if (v58 != v51)
                {
                  *(_QWORD *)(v106 + 8 * v58) = v54;
                  v57 = *v49;
                }
              }
              *v54 = v57;
              --*((_QWORD *)&v107 + 1);
              operator delete(v49);
            }
            v59 = *((_QWORD *)&v97 + 1);
            if (*((_QWORD *)&v97 + 1))
            {
              v60 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v97 + 8));
              v60.i16[0] = vaddlv_u8(v60);
              if (v60.u32[0] > 1uLL)
              {
                v37 = v31;
                if (*((_QWORD *)&v97 + 1) <= (unint64_t)v31)
                  v37 = (unint64_t)v31 % *((_QWORD *)&v97 + 1);
              }
              else
              {
                v37 = (DWORD2(v97) - 1) & v31;
              }
              v61 = *(void ***)(v97 + 8 * v37);
              if (v61)
              {
                v62 = *v61;
                if (*v61)
                {
                  do
                  {
                    v63 = v62[1];
                    if (v63 == v31)
                    {
                      if (*((_DWORD *)v62 + 4) == v31)
                        goto LABEL_109;
                    }
                    else
                    {
                      if (v60.u32[0] > 1uLL)
                      {
                        if (v63 >= *((_QWORD *)&v97 + 1))
                          v63 %= *((_QWORD *)&v97 + 1);
                      }
                      else
                      {
                        v63 &= *((_QWORD *)&v97 + 1) - 1;
                      }
                      if (v63 != v37)
                        break;
                    }
                    v62 = (_QWORD *)*v62;
                  }
                  while (v62);
                }
              }
            }
            v62 = operator new(0x30uLL);
            *v62 = 0;
            v62[1] = v31;
            *((_DWORD *)v62 + 4) = v31;
            v62[4] = 0;
            v62[5] = 0;
            v62[3] = 0;
            v64 = (float)(unint64_t)(*((_QWORD *)&v98 + 1) + 1);
            if (!v59 || (float)(v99 * (float)v59) < v64)
            {
              v65 = (v59 & (v59 - 1)) != 0;
              if (v59 < 3)
                v65 = 1;
              v66 = v65 | (2 * v59);
              v67 = vcvtps_u32_f32(v64 / v99);
              if (v66 <= v67)
                v68 = v67;
              else
                v68 = v66;
              std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)&v97, v68);
              v59 = *((_QWORD *)&v97 + 1);
              if ((*((_QWORD *)&v97 + 1) & (*((_QWORD *)&v97 + 1) - 1)) != 0)
              {
                if (*((_QWORD *)&v97 + 1) <= (unint64_t)v31)
                  v37 = (unint64_t)v31 % *((_QWORD *)&v97 + 1);
                else
                  v37 = v31;
              }
              else
              {
                v37 = (DWORD2(v97) - 1) & v31;
              }
            }
            v69 = v97;
            v70 = *(_QWORD **)(v97 + 8 * v37);
            if (v70)
            {
              *v62 = *v70;
              goto LABEL_107;
            }
            *v62 = v98;
            *(_QWORD *)&v98 = v62;
            *(_QWORD *)(v69 + 8 * v37) = &v98;
            if (*v62)
            {
              v71 = *(_QWORD *)(*v62 + 8);
              if ((v59 & (v59 - 1)) != 0)
              {
                if (v71 >= v59)
                  v71 %= v59;
              }
              else
              {
                v71 &= v59 - 1;
              }
              v70 = (_QWORD *)(v97 + 8 * v71);
LABEL_107:
              *v70 = v62;
            }
            ++*((_QWORD *)&v98 + 1);
LABEL_109:
            v72 = v104 - 24;
            v74 = (char **)v62[4];
            v73 = v62[5];
            if ((unint64_t)v74 >= v73)
            {
              v76 = v62[3];
              v77 = ((uint64_t)v74 - v76) >> 3;
              if ((unint64_t)(v77 + 1) >> 61)
                abort();
              v78 = v73 - v76;
              v79 = v78 >> 2;
              if (v78 >> 2 <= (unint64_t)(v77 + 1))
                v79 = v77 + 1;
              if ((unint64_t)v78 >= 0x7FFFFFFFFFFFFFF8)
                v80 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v80 = v79;
              if (v80)
                v80 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v80);
              else
                v81 = 0;
              v82 = (char **)(v80 + 8 * v77);
              *v82 = v72;
              v75 = v82 + 1;
              v84 = (char *)v62[3];
              v83 = (char *)v62[4];
              if (v83 != v84)
              {
                do
                {
                  v85 = (char *)*((_QWORD *)v83 - 1);
                  v83 -= 8;
                  *--v82 = v85;
                }
                while (v83 != v84);
                v83 = (char *)v62[3];
              }
              v62[3] = v82;
              v62[4] = v75;
              v62[5] = v80 + 8 * v81;
              if (v83)
                operator delete(v83);
            }
            else
            {
              *v74 = v72;
              v75 = v74 + 1;
            }
            v62[4] = v75;
            goto LABEL_126;
          }
          if (v36 < 0xFFFFFF00)
            ++v31;
        }
LABEL_126:
        if (++v30 == v32)
        {
          v13 = v90;
          LODWORD(v86) = v87;
          -[DYPMTLShaderProfilerHelper evaluateStreamingSamples:withUSCSampleNum:withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:](self->_shaderProfilerHelper, "evaluateStreamingSamples:withUSCSampleNum:withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:", objc_msgSend(objc_retainAutorelease(v95), "bytes"), v91, &v97, a9, a8, v24, v86, &v106, v90);
          std::__hash_table<std::__hash_value_type<unsigned int,std::vector<GTCoalescedEncoderIndexInfo>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::vector<GTCoalescedEncoderIndexInfo>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::vector<GTCoalescedEncoderIndexInfo>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::vector<GTCoalescedEncoderIndexInfo>>>>::~__hash_table((uint64_t)&v97);
          std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v100);
          v19 = v88;
          v14 = v89;
          if (v103)
            operator delete(v103);
          break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v106);

}

- (void)_preProcessStreamingUSCSampleData:(id)a3 result:(id)a4 withAddressMappings:(id)a5 sampleData:(id)a6 frameIndex:(unsigned int)a7 ringBufferIdx:(unsigned int)a8 targetIndex:(int)a9
{
  uint64_t v9;
  id v13;
  void *i;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  char *v20;
  void *v21;
  id v22;
  id v23;
  unint64_t v24;
  void *v25;
  unsigned int v26;
  void *v27;
  unsigned __int8 v28;
  int v29;
  char *v30;
  char *v31;
  int *v32;
  char *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  int *v38;
  char *v39;
  __int128 v40;
  _QWORD *v41;
  _QWORD *v42;
  int *v43;
  unint64_t v44;
  int **v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  int **v53;
  char *v54;
  char *v55;
  int *v56;
  int v57;
  int v58;
  char *v59;
  int *v60;
  char *v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  int *v66;
  char *v67;
  __int128 v68;
  unsigned int v69;
  unsigned int v70;
  unsigned int v71;
  DYPMTLShaderProfilerHelper *shaderProfilerHelper;
  id v73;
  uint64_t v74;
  unsigned int v75;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id obj;
  uint64_t v83;
  id v85;
  unint64_t v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  unsigned int v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _OWORD v96[2];
  int v97;
  _QWORD v98[4];
  int v99;
  void *__p;
  int *v101;
  unint64_t v102;
  _BYTE v103[32];
  int v104;
  _BYTE v105[128];

  v9 = *(_QWORD *)&a7;
  v80 = a3;
  v77 = a4;
  v81 = a5;
  v78 = a6;
  v75 = objc_msgSend(v78, "length");
  v79 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/tmp/com.apple.gputools.profiling/shaderProfilerResults/Frames/%u/uscSamplingAddressMappings.txt"), v9)));
  -[GTShaderProfilerHelper _saveAddressMappings:filename:](self, "_saveAddressMappings:filename:", v81, objc_msgSend(v79, "UTF8String"));
  memset(v103, 0, sizeof(v103));
  v104 = 1065353216;
  __p = 0;
  v101 = 0;
  v102 = 0;
  std::vector<DYMTLShaderProfilerProgramAddress>::reserve(&__p, 2 * (_QWORD)objc_msgSend(v81, "count"));
  memset(v98, 0, sizeof(v98));
  v99 = 1065353216;
  memset(v96, 0, sizeof(v96));
  v97 = 1065353216;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  obj = v81;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
  if (v13)
  {
    v83 = *(_QWORD *)v93;
    v87 = -1;
    v88 = 0;
    do
    {
      v85 = v13;
      for (i = 0; i != v85; i = (char *)i + 1)
      {
        if (*(_QWORD *)v93 != v83)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("encID")));
        v17 = objc_msgSend(v16, "unsignedIntValue");

        v91 = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("drawCallIndex")));
        v89 = objc_msgSend(v18, "unsignedIntValue");

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("mappedAddress")));
        v20 = (char *)objc_msgSend(v19, "unsignedLongLongValue");

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("mappedSize")));
        v22 = objc_msgSend(v21, "unsignedLongLongValue");

        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("binaryUniqueId"))));
        v24 = strtoull((const char *)objc_msgSend(v23, "UTF8String"), 0, 16);

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("encIndex")));
        v26 = objc_msgSend(v25, "unsignedIntValue");

        v90 = v26;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("type")));
        v28 = -[GTShaderProfilerHelper _getLegacyProgramType:](self, "_getLegacyProgramType:", v27);

        v86 = v24;
        v29 = (v17 << 8) | 0x62;
        v30 = &v20[(_QWORD)v22];
        v31 = (char *)v101;
        if ((unint64_t)v101 >= v102)
        {
          v33 = (char *)__p;
          v34 = 0xAAAAAAAAAAAAAAABLL * (((char *)v101 - (_BYTE *)__p) >> 3);
          v35 = v34 + 1;
          if (v34 + 1 > 0xAAAAAAAAAAAAAAALL)
            goto LABEL_70;
          if (0x5555555555555556 * ((uint64_t)(v102 - (_QWORD)__p) >> 3) > v35)
            v35 = 0x5555555555555556 * ((uint64_t)(v102 - (_QWORD)__p) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v102 - (_QWORD)__p) >> 3) >= 0x555555555555555)
            v36 = 0xAAAAAAAAAAAAAAALL;
          else
            v36 = v35;
          if (v36)
            v36 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v36);
          else
            v37 = 0;
          v38 = (int *)(v36 + 24 * v34);
          *v38 = v29;
          v38[1] = v89;
          *((_QWORD *)v38 + 1) = v20;
          *((_QWORD *)v38 + 2) = v30;
          v39 = (char *)v38;
          if (v31 != v33)
          {
            do
            {
              v40 = *(_OWORD *)(v31 - 24);
              *((_QWORD *)v39 - 1) = *((_QWORD *)v31 - 1);
              *(_OWORD *)(v39 - 24) = v40;
              v39 -= 24;
              v31 -= 24;
            }
            while (v31 != v33);
            v31 = (char *)__p;
          }
          v32 = v38 + 6;
          __p = v39;
          v101 = v38 + 6;
          v102 = v36 + 24 * v37;
          if (v31)
            operator delete(v31);
        }
        else
        {
          *v101 = v29;
          *((_DWORD *)v31 + 1) = v89;
          v32 = (int *)(v31 + 24);
          *((_QWORD *)v31 + 1) = v20;
          *((_QWORD *)v31 + 2) = v30;
        }
        v101 = v32;
        v41 = std::__hash_table<std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)v96, v26, &v90);
        v42 = v41;
        v43 = v32 - 6;
        v45 = (int **)v41[4];
        v44 = v41[5];
        if ((unint64_t)v45 >= v44)
        {
          v47 = v41[3];
          v48 = ((uint64_t)v45 - v47) >> 3;
          if ((unint64_t)(v48 + 1) >> 61)
            abort();
          v49 = v44 - v47;
          v50 = v49 >> 2;
          if (v49 >> 2 <= (unint64_t)(v48 + 1))
            v50 = v48 + 1;
          if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF8)
            v51 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v51 = v50;
          if (v51)
            v51 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v51);
          else
            v52 = 0;
          v53 = (int **)(v51 + 8 * v48);
          *v53 = v43;
          v46 = v53 + 1;
          v55 = (char *)v42[3];
          v54 = (char *)v42[4];
          if (v54 != v55)
          {
            do
            {
              v56 = (int *)*((_QWORD *)v54 - 1);
              v54 -= 8;
              *--v53 = v56;
            }
            while (v54 != v55);
            v54 = (char *)v42[3];
          }
          v42[3] = v53;
          v42[4] = v46;
          v42[5] = v51 + 8 * v52;
          if (v54)
            operator delete(v54);
        }
        else
        {
          *v45 = v43;
          v46 = v45 + 1;
        }
        v57 = (v17 << 8) | 0x63;
        v58 = v28;
        v42[4] = v46;
        v59 = (char *)v101;
        if ((unint64_t)v101 >= v102)
        {
          v61 = (char *)__p;
          v62 = 0xAAAAAAAAAAAAAAABLL * (((char *)v101 - (_BYTE *)__p) >> 3);
          v63 = v62 + 1;
          if (v62 + 1 > 0xAAAAAAAAAAAAAAALL)
LABEL_70:
            abort();
          if (0x5555555555555556 * ((uint64_t)(v102 - (_QWORD)__p) >> 3) > v63)
            v63 = 0x5555555555555556 * ((uint64_t)(v102 - (_QWORD)__p) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v102 - (_QWORD)__p) >> 3) >= 0x555555555555555)
            v64 = 0xAAAAAAAAAAAAAAALL;
          else
            v64 = v63;
          if (v64)
            v64 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v64);
          else
            v65 = 0;
          v66 = (int *)(v64 + 24 * v62);
          *v66 = v57;
          v66[1] = v89;
          *((_QWORD *)v66 + 1) = v86;
          v66[4] = v58;
          v67 = (char *)v66;
          if (v59 != v61)
          {
            do
            {
              v68 = *(_OWORD *)(v59 - 24);
              *((_QWORD *)v67 - 1) = *((_QWORD *)v59 - 1);
              *(_OWORD *)(v67 - 24) = v68;
              v67 -= 24;
              v59 -= 24;
            }
            while (v59 != v61);
            v59 = (char *)__p;
          }
          v60 = v66 + 6;
          __p = v67;
          v102 = v64 + 24 * v65;
          if (v59)
            operator delete(v59);
        }
        else
        {
          *v101 = v57;
          *((_DWORD *)v59 + 1) = v89;
          *((_QWORD *)v59 + 1) = v86;
          v60 = (int *)(v59 + 24);
          *((_DWORD *)v59 + 4) = v28;
        }
        v101 = v60;
        if (v26 >= v87)
          v69 = v87;
        else
          v69 = v26;
        v70 = v88;
        if (v26 > v88)
          v70 = v26;
        v87 = v69;
        v88 = v70;
        *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)v103, v17, &v91)+ 5) = v26;
        std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)v98, v26, v26);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
    }
    while (v13);

    v71 = v87;
    v91 = v87;
    do
    {
      if (!std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(v98, v71))*((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)v103, v71, &v91)+ 5) = v71;
      v91 = ++v71;
    }
    while (v71 <= v88);
  }
  else
  {

    v87 = -1;
    v88 = 0;
  }
  shaderProfilerHelper = self->_shaderProfilerHelper;
  v73 = objc_retainAutorelease(v78);
  LODWORD(v74) = v88;
  -[DYPMTLShaderProfilerHelper evaluateStreamingSamples:withUSCSampleNum:withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:](shaderProfilerHelper, "evaluateStreamingSamples:withUSCSampleNum:withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:", objc_msgSend(v73, "bytes"), v75 >> 3, v96, a9, a8, v87, v74, v103, v80);
  std::__hash_table<std::__hash_value_type<unsigned int,std::vector<GTCoalescedEncoderIndexInfo>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::vector<GTCoalescedEncoderIndexInfo>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::vector<GTCoalescedEncoderIndexInfo>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::vector<GTCoalescedEncoderIndexInfo>>>>::~__hash_table((uint64_t)v96);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v98);
  if (__p)
    operator delete(__p);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v103);

}

- (id)_processHarvestedBinaryData:(id)a3 forStreamedData:(id)a4
{
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *i;
  char *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v48;
  GTShaderProfilerHelper *v49;
  _QWORD v50[5];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _OWORD v55[2];
  int v56;

  v6 = a3;
  v48 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("draw call info")));
  v49 = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_payload, "objectForKeyedSubscript:", CFSTR("perCommandBufferEncoderCount")));
  objc_msgSend(v6, "setCommandBufferCount:", objc_msgSend(v8, "count"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v49->_payload, "objectForKeyedSubscript:", CFSTR("perCommandBufferEncoderCount")));
  objc_msgSend(v6, "setPerCommandBufferEncoderCount:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v49->_payload, "objectForKeyedSubscript:", CFSTR("encoderIndexToLabel")));
  objc_msgSend(v6, "setEncoderIndexToLabelMap:", v10);

  objc_storeStrong((id *)&v49->_shaderInfoResult, a4);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "drawCallInfoList"));
  v12 = 0;
  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v52 != v14)
          objc_enumerationMutation(v11);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i), "pipelineStateId") == (id)-1)
          ++v12;
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v13);
  }

  v16 = (char *)objc_msgSend(v7, "count");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "drawCallInfoList"));
  LOBYTE(v16) = &v16[v12] == objc_msgSend(v17, "count");

  if ((v16 & 1) != 0)
  {
    v18 = 0;
    memset(v55, 0, sizeof(v55));
    v56 = 1065353216;
    while ((unint64_t)objc_msgSend(v7, "count") > v18)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v18));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "drawCallInfoList"));
      v22 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", v18));

      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("vertex shader key")));
      v24 = v22[1];
      v22[1] = (id)v23;

      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("fragment shader key")));
      v26 = v22[2];
      v22[2] = (id)v25;

      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("compute kernel key")));
      v28 = v22[3];
      v22[3] = (id)v27;

      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("mutiple binary keys")));
      v30 = v29;
      if (v29)
      {
        v31 = objc_msgSend(v29, "copy");
        objc_storeStrong(v22 + 4, v31);
      }
      else
      {
        v32 = &__NSArray0__struct;
        v31 = v22[4];
        v22[4] = &__NSArray0__struct;
      }

      if (!std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(v55, v18))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "programPipelineInfoList"));
        v34 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectAtIndexedSubscript:", objc_msgSend(v22, "pipelineStateIndex")));

        objc_storeStrong(v34 + 1, v22[1]);
        objc_storeStrong(v34 + 2, v22[2]);
        objc_storeStrong(v34 + 3, v22[3]);
        objc_storeStrong(v34 + 4, v22[4]);
        std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)v55, v18, v18);

      }
      ++v18;
    }
    v35 = objc_opt_new(NSMutableDictionary, v19);
    v36 = (void *)v6[30];
    v6[30] = v35;

    v38 = objc_opt_new(NSMutableDictionary, v37);
    v39 = (void *)v6[31];
    v6[31] = v38;

    v41 = objc_opt_new(NSMutableDictionary, v40);
    v42 = (void *)v6[32];
    v6[32] = v41;

    v44 = objc_opt_new(NSMutableDictionary, v43);
    v45 = (void *)v6[33];
    v6[33] = v44;

    v46 = MetalPluginTarget(v49->_metalPluginName);
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = __70__GTShaderProfilerHelper__processHarvestedBinaryData_forStreamedData___block_invoke;
    v50[3] = &unk_725390;
    v50[4] = v49;
    -[GTShaderProfilerHelper _visitAllShaderInfosInResult:usingBlock:](v49, "_visitAllShaderInfosInResult:usingBlock:", v6, v50);
    if ((*((_BYTE *)v49->_options + 16) & 0x40) != 0)
      -[GTShaderProfilerHelper _saveShaderBinariesWith:targetIndex:](v49, "_saveShaderBinariesWith:targetIndex:", v6, v46);
    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v55);
  }

  return 0;
}

- (void)_addBlitTimesToEffectiveKickTimes:(id)a3
{
  void *v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  void *i;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  double v18;
  char *k;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v24 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "blitEncoderTimeInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Blit Encoder Kick Times Nsec")));

  if (v4)
  {
    v5 = (char *)objc_msgSend(v4, "count");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "blitEncoderTimeInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Blit Encoder Indices")));

    v25 = v7;
    if (v5 == objc_msgSend(v7, "count"))
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "effectiveKickTimes"));
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v31;
        v11 = 0.0;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v31 != v10)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
            v26 = 0u;
            v27 = 0u;
            v28 = 0u;
            v29 = 0u;
            v14 = v13;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v15)
            {
              v16 = *(_QWORD *)v27;
              do
              {
                for (j = 0; j != v15; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v27 != v16)
                    objc_enumerationMutation(v14);
                  objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j), "doubleValue");
                  v11 = v11 + v18;
                }
                v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
              }
              while (v15);
            }

          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        }
        while (v9);
      }
      else
      {
        v11 = 0.0;
      }

      objc_msgSend(v24, "setShaderProfilingTime:", v11);
      if (v5)
      {
        for (k = 0; k != v5; ++k)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", k));
          v21 = objc_msgSend(v20, "unsignedIntValue");

          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v21));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", k));
          objc_msgSend(v22, "setArray:", v23);

        }
      }

    }
  }

}

- (id)_createPerCounterCommandData:(id)a3 withPerCommandData:(id)a4
{
  id v5;
  id v6;
  id v7;
  unint64_t i;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = a3;
  v19 = a4;
  v6 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v5, "count"));
  v7 = objc_msgSend(v19, "count");
  for (i = 0; i < (unint64_t)objc_msgSend(v5, "count"); ++i)
  {
    v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v7);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v19;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v21;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v13), "objectAtIndexedSubscript:", i));
          objc_msgSend(v9, "addObject:", v14);

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", i));
    v16 = objc_msgSend(v9, "copy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v15);

  }
  v17 = objc_msgSend(v6, "copy");

  return v17;
}

- (id)_targetType
{
  int v2;
  void *v3;
  char *v5;
  int v6;
  uint64_t v8;
  size_t v9;
  int v10[2];

  v9 = 0;
  *(_QWORD *)v10 = 0x1A00000006;
  v2 = sysctl(v10, 2u, 0, &v9, 0, 0);
  v3 = 0;
  if (v2 != -1 && v9 != 0)
  {
    v5 = (char *)&v8 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v5, v9);
    v6 = sysctl(v10, 2u, v5, &v9, 0, 0);
    v3 = 0;
    if (!v6)
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5));
  }
  return v3;
}

- (id)_productType
{
  int v2;
  void *v3;
  char *v5;
  int v6;
  uint64_t v8;
  size_t v9;
  int v10[2];

  v9 = 0;
  *(_QWORD *)v10 = 0x1B00000006;
  v2 = sysctl(v10, 2u, 0, &v9, 0, 0);
  v3 = 0;
  if (v2 != -1 && v9 != 0)
  {
    v5 = (char *)&v8 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v5, v9);
    v6 = sysctl(v10, 2u, v5, &v9, 0, 0);
    v3 = 0;
    if (!v6)
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5));
  }
  return v3;
}

- (id)_version
{
  id v2;
  void *v3;

  v2 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfFile:", CFSTR("/System/Library/CoreServices/SystemVersion.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("ProductVersion")));

  return v3;
}

- (id)_build
{
  id v2;
  void *v3;

  v2 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfFile:", CFSTR("/System/Library/CoreServices/SystemVersion.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("ProductBuildVersion")));

  return v3;
}

- (void)_processDerivedEncoderCounterData:(id)a3 forDerivedEncoderData:(id)a4 withEffectivePerDrawKickTimes:(id)a5 withShaderInfo:(id)a6
{
  id v10;
  void *v11;
  NSMutableDictionary *payload;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  GTShaderProfilerHelper *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];

  v10 = a4;
  v45 = a5;
  v46 = a6;
  v47 = v10;
  objc_msgSend(a3, "setDerivedCountersData:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("derivedCounterDataForBottleneckAnalysis")));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("counters")));

  payload = self->_payload;
  v48 = self;
  if (payload)
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](payload, "objectForKeyedSubscript:", CFSTR("MetalPluginName")));
  else
    v44 = 0;
  v49 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v49, "setObject:forKeyedSubscript:", v44, CFSTR("MetalPluginName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("derivedCounterDataForBottleneckAnalysis")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AverageSamples")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _createPerCounterCommandData:withPerCommandData:](self, "_createPerCounterCommandData:withPerCommandData:", v43, v14));
  objc_msgSend(v49, "setObject:forKeyedSubscript:", v15, CFSTR("PerCounterEncoderCallData"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DerivedCounterConfigurationVariables")));
  v17 = objc_msgSend(v16, "mutableCopy");
  objc_msgSend(v49, "setObject:forKeyedSubscript:", v17, CFSTR("ConfigurationVariables"));

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _version](self, "_version"));
  if (v41)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("ConfigurationVariables")));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v41, CFSTR("Version"));

  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _build](self, "_build"));
  if (v42)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("ConfigurationVariables")));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v42, CFSTR("Build"));

  }
  v20 = objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _targetType](self, "_targetType"));
  v39 = (void *)v20;
  if (v20)
    objc_msgSend(v49, "setObject:forKeyedSubscript:", v20, CFSTR("Target"));
  v21 = objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _productType](self, "_productType"));
  v40 = (void *)v21;
  if (v21)
    objc_msgSend(v49, "setObject:forKeyedSubscript:", v21, CFSTR("Product"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DerivedCounterInfo")));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("DerivedCounterDictionary")));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("DerivedCounters")));

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v24, "count")));
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allKeys"));
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v28)
          objc_enumerationMutation(v26);
        v30 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v30));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("counters")));
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v32, v30);

      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v27);
  }

  objc_msgSend(v49, "setObject:forKeyedSubscript:", v25, CFSTR("DerivedCounterDependentCounters"));
  if (v45)
    objc_msgSend(v49, "setObject:forKeyedSubscript:", v45, CFSTR("effectivePerDrawKickTimes"));
  if (v46)
    objc_msgSend(v49, "setObject:forKeyedSubscript:", v46, CFSTR("shaderInfo"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v49, 1, 0));
  if (objc_msgSend(v48->_options->var0, "length"))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v48->_options->var0));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48->_options->var1, "lastPathComponent"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringByDeletingPathExtension"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "stringByAppendingPathExtension:", CFSTR("json")));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", v37, 0, v34));
    objc_msgSend(v33, "writeToURL:atomically:", v38, 0);

  }
  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/tmp/com.apple.gputools.profiling/shaderProfilerResults/derivedCounters.json")));
    objc_msgSend(v33, "writeToURL:atomically:", v34, 0);
  }

}

- (void)_processBatchIdCounterData:(id)a3
{
  void *v4;
  void *v5;
  FILE *v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  FILE *v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  FILE *v23;
  int v24;
  const char *v25;
  const char *v26;
  id v27;
  char *i;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  FILE *v37;
  int v38;
  id v39;
  const char *v40;
  const char *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  FILE *v49;
  int v50;
  id v51;
  const char *v52;
  const char *v53;
  id v54;
  id v55;
  id *v56;
  _UNKNOWN **v57;
  _UNKNOWN **v58;
  id v59;
  unint64_t j;
  id v61;
  uint64_t k;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  GTShaderProfilerHelper *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  void *__p;
  void *v86;
  void *v87;
  id v88;
  id v89;
  void **v90;
  void **v91;
  void **v92;
  char *v93;
  id *v94;
  char *v95;
  void ***v96;
  _QWORD v97[5];
  _QWORD v98[5];
  _QWORD v99[3];
  _QWORD v100[3];

  v79 = a3;
  if (g_runningInCI)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Got %lu partial results"), objc_msgSend(v79, "count")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#CI-INFO# ")));

    v6 = __stdoutp;
    v7 = objc_retainAutorelease(v5);
    fprintf(v6, "#CI-INFO# %s\n", (const char *)objc_msgSend(v7, "UTF8String"));

  }
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_payload, "objectForKeyedSubscript:", CFSTR("activePerEncoderDrawCallCount")));
  v8 = (unint64_t)objc_msgSend(v83, "count");
  v9 = v8;
  v78 = self;
  if (v8)
  {
    if (v8 >> 61)
      abort();
    __p = std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v8);
    bzero(__p, 8 * v9);
    v10 = 0;
    v11 = 0;
    do
    {
      *((_QWORD *)__p + (_QWORD)v11) = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "objectAtIndexedSubscript:", v11));
      v10 += objc_msgSend(v12, "unsignedIntValue");

      ++v11;
    }
    while ((char *)v9 != v11);
  }
  else
  {
    __p = 0;
    v10 = 0;
  }
  if (g_runningInCI)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Got %lu draw calls in %lu encoders"), v10, v9));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#CI-INFO# ")));

    v15 = __stdoutp;
    v16 = objc_retainAutorelease(v14);
    fprintf(v15, "#CI-INFO# %s\n", (const char *)objc_msgSend(v16, "UTF8String"));

  }
  v81 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v9);
  v80 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v9);
  v93 = 0;
  v94 = 0;
  v95 = 0;
  if (v10)
  {
    if (v10 >> 61)
      abort();
    v93 = (char *)operator new(8 * v10);
    v95 = &v93[8 * v10];
    bzero(v93, 8 * v10);
    v94 = (id *)v95;
    v90 = (void **)operator new(8 * v10);
    v92 = &v90[v10];
    bzero(v90, 8 * v10);
    v91 = v92;
  }
  else
  {
    v90 = 0;
    v91 = 0;
    v92 = 0;
  }
  v82 = v79;
  v17 = 0;
  v86 = 0;
  while (v17 < (unint64_t)objc_msgSend(v82, "count"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "objectAtIndexedSubscript:", v17));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("derivedCounterDataForBottleneckAnalysis")));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("counters")));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("derivedCounterDataForBottleneckAnalysis")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("AverageSamples")));

    objc_msgSend(v81, "setObject:atIndexedSubscript:", v21, v17);
    v87 = v21;
    if (v17)
    {
      if ((objc_msgSend(v84, "isEqualToArray:", v86) & 1) == 0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Batch counter list has changed between batches from %@ to %@"), v86, v84));
        v23 = __stdoutp;
        v24 = g_runningInCI;
        v88 = objc_retainAutorelease(v22);
        v25 = (const char *)objc_msgSend(v88, "UTF8String");
        v26 = "#CI_ERROR# ";
        if (!v24)
          v26 = "";
        fprintf(v23, "%s%s %u: %s\n", v26, "-[GTShaderProfilerHelper _processBatchIdCounterData:]", 2185, v25);
        v89 = objc_retainAutorelease(v88);
        GTMTLReplay_handleError(101, (uint64_t)objc_msgSend(v89, "UTF8String"), "/Library/Caches/com.apple.xbs/Sources/GPUToolsDevice/GPUTools/GTMTLCapture/replayer/profile/GTShaderProfilerHelper.mm", (uint64_t)"-[GTShaderProfilerHelper _processBatchIdCounterData:]", 2185, 1);
        goto LABEL_38;
      }
    }
    else
    {
      v27 = v84;

      v86 = v27;
    }
    v89 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("BatchInfos")));
    objc_msgSend(v80, "setObject:atIndexedSubscript:");
    if (objc_msgSend(v21, "count") == (id)v9 && objc_msgSend(v89, "count") == (id)v9)
    {
      if (v9)
      {
        for (i = 0; i != (char *)v9; ++i)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectAtIndexedSubscript:", i));
          v30 = objc_msgSend(v29, "unsignedIntValue");

          if (v30 != -1)
          {
            v31 = v30;
            v32 = *((_QWORD *)__p + (_QWORD)i) + v30;
            if (v32 >= v10)
            {
              v33 = v18;
              v34 = v9;
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "objectAtIndexedSubscript:", i));
              v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("drawId %lu > numDraws %lu, drawIndexWithinEncoder %lu (max %d)"), v32, v10, v31, objc_msgSend(v35, "unsignedIntValue")));

              v37 = __stdoutp;
              v38 = g_runningInCI;
              v39 = objc_retainAutorelease(v36);
              v40 = (const char *)objc_msgSend(v39, "UTF8String");
              v41 = "#CI_ERROR# ";
              if (!v38)
                v41 = "";
              fprintf(v37, "%s%s %u: %s\n", v41, "-[GTShaderProfilerHelper _processBatchIdCounterData:]", 2208, v40);
              v42 = objc_retainAutorelease(v39);
              GTMTLReplay_handleError(101, (uint64_t)objc_msgSend(v42, "UTF8String"), "/Library/Caches/com.apple.xbs/Sources/GPUToolsDevice/GPUTools/GTMTLCapture/replayer/profile/GTShaderProfilerHelper.mm", (uint64_t)"-[GTShaderProfilerHelper _processBatchIdCounterData:]", 2208, 1);

              v32 = v10 - 1;
              v9 = v34;
              v18 = v33;
            }
            v21 = v87;
            v43 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v17));
            v44 = *(void **)&v93[8 * v32];
            *(_QWORD *)&v93[8 * v32] = v43;

            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "objectAtIndexedSubscript:", i));
            v46 = v90[v32];
            v90[v32] = v45;

          }
        }
      }
      v47 = 1;
      goto LABEL_39;
    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Batch has invalid encoder count, encoderCount %lu, averageSamplesByEncoder.count %lu, batchInfos.count %lu"), v9, objc_msgSend(v21, "count"), objc_msgSend(v89, "count")));
    v49 = __stdoutp;
    v50 = g_runningInCI;
    v51 = objc_retainAutorelease(v48);
    v52 = (const char *)objc_msgSend(v51, "UTF8String");
    v53 = "#CI_ERROR# ";
    if (!v50)
      v53 = "";
    fprintf(v49, "%s%s %u: %s\n", v53, "-[GTShaderProfilerHelper _processBatchIdCounterData:]", 2194, v52);
    v54 = objc_retainAutorelease(v51);
    GTMTLReplay_handleError(101, (uint64_t)objc_msgSend(v54, "UTF8String"), "/Library/Caches/com.apple.xbs/Sources/GPUToolsDevice/GPUTools/GTMTLCapture/replayer/profile/GTShaderProfilerHelper.mm", (uint64_t)"-[GTShaderProfilerHelper _processBatchIdCounterData:]", 2194, 1);

LABEL_38:
    v47 = 0;
    v21 = v87;
LABEL_39:

    ++v17;
    if ((v47 & 1) == 0)
      goto LABEL_59;
  }
  v55 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v10);
  v56 = (id *)v93;
  if (v93 != (char *)v94)
  {
    do
    {
      v57 = (_UNKNOWN **)*v56;
      if (v57)
        v58 = v57;
      else
        v58 = &off_7399B8;
      objc_msgSend(v55, "addObject:", v58);

      ++v56;
    }
    while (v56 != v94);
  }
  v59 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v86, "count"));
  for (j = 0; j < (unint64_t)objc_msgSend(v86, "count"); ++j)
  {
    v61 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v10);
    if (v10)
    {
      for (k = 0; k != v10; ++k)
      {
        v63 = v90[k];
        v64 = v63;
        if (v63)
        {
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectAtIndexedSubscript:", j));
          objc_msgSend(v61, "addObject:", v65);

        }
        else
        {
          objc_msgSend(v61, "addObject:", &off_7399D0);
        }

      }
    }
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "objectAtIndexedSubscript:", j));
    v67 = objc_msgSend(v61, "copy");
    objc_msgSend(v59, "setObject:forKeyedSubscript:", v67, v66);

  }
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v78->_payload, "objectForKeyedSubscript:", CFSTR("MetalPluginName")));
  v100[0] = v68;
  v99[0] = CFSTR("MetalPluginName");
  v99[1] = CFSTR("PerCounterDrawCallData");
  v69 = objc_msgSend(v59, "copy");
  v100[1] = v69;
  v99[2] = CFSTR("intermediate");
  v97[0] = CFSTR("activePerEncoderDrawCount");
  v97[1] = CFSTR("drawToBatchId");
  v98[0] = v83;
  v98[1] = v55;
  v97[2] = CFSTR("batchInfoList");
  v97[3] = CFSTR("rawBatchResults");
  v98[2] = v80;
  v98[3] = v81;
  v97[4] = CFSTR("counters");
  v98[4] = v86;
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v98, v97, 5));
  v100[2] = v70;
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v100, v99, 3));

  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v71, 1, 0));
  if (objc_msgSend(v78->_options->var0, "length"))
  {
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v78->_options->var0));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78->_options->var1, "lastPathComponent"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "stringByDeletingPathExtension"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "stringByAppendingPathExtension:", CFSTR("json")));
    v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", v76, 0, v73));
    objc_msgSend(v72, "writeToURL:atomically:", v77, 0);

  }
  else
  {
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/tmp/com.apple.gputools.profiling/shaderProfilerResults/derivedCountersByDraw.json")));
    objc_msgSend(v72, "writeToURL:atomically:", v73, 0);
  }

LABEL_59:
  v96 = &v90;
  std::vector<objc_object  {objcproto7MTLHeap}* {__strong}>::__destroy_vector::operator()[abi:nn180100]((void ***)&v96);
  v90 = (void **)&v93;
  std::vector<objc_object  {objcproto7MTLHeap}* {__strong}>::__destroy_vector::operator()[abi:nn180100](&v90);

  if (__p)
    operator delete(__p);

}

- (DebugInfo)_getDebugInfoForBinary:(SEL)a3 withTextSegment:(id)a4 forTargetIndex:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  char *v13;
  char *v14;
  void *v15;
  NSString *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  lldb::SBDebugger *v26;
  uint64_t v27;
  id v28;
  id v29;
  unsigned int NumCompileUnits;
  unsigned int v31;
  char v32;
  unint64_t v33;
  int NumLineEntries;
  unsigned int v35;
  BOOL v36;
  unint64_t v37;
  const char *Name;
  unint64_t FileAddress;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  unint64_t v44;
  char IsInlined;
  int Line;
  LineEntry *var0;
  char *v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t *v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  unint64_t v56;
  int v57;
  unint64_t v58;
  const std::string::value_type *InlinedName;
  const std::string::value_type *Directory;
  const std::string::value_type *Filename;
  void **v62;
  LineEntry *v63;
  char *v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t *v67;
  __int128 v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  char *v73;
  unint64_t v74;
  int v75;
  uint64_t v76;
  const std::string::value_type *v77;
  const std::string::value_type *v78;
  const std::string::value_type *v79;
  char *v80;
  char *v81;
  uint64_t v82;
  LineEntry *v83;
  char *v84;
  unint64_t v85;
  unint64_t *v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t *v89;
  uint64_t v90;
  std::string::size_type size;
  unint64_t v92;
  void **v93;
  std::string *p_s1;
  __int128 v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  unint64_t v99;
  int v100;
  unint64_t v101;
  const std::string::value_type *v102;
  const std::string::value_type *v103;
  void **v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char v110;
  void **v111;
  uint64_t v112;
  uint64_t v113;
  void **v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  BOOL v126;
  char *v127;
  unsigned int **v128;
  uint64_t v129;
  char *v130;
  unsigned int v131;
  unsigned int var6;
  unsigned int v133;
  unsigned int v134;
  unsigned int v135;
  unsigned int var3;
  unsigned int var2;
  unsigned int v138;
  _QWORD *v139;
  uint64_t v140;
  char *v141;
  _QWORD *v142;
  unsigned int v143;
  __int128 v144;
  uint64_t v145;
  char *v146;
  __int128 v147;
  __int128 v148;
  LineEntry *v149;
  int64_t v150;
  unint64_t v151;
  unsigned int v152;
  unint64_t v153;
  unsigned int v154;
  unint64_t v155;
  int v156;
  unint64_t v157;
  unsigned int *v158;
  DebugInfo *result;
  id v160;
  id v161;
  void *v162;
  id v163;
  uint64_t v164;
  int v165;
  id v166;
  GTShaderProfilerHelper *v167;
  id v168;
  unint64_t v170;
  DebugInfo *v171;
  void *v172;
  char v173;
  LineEntry *v174;
  char v175;
  uint64_t v176;
  uint64_t v177;
  __int128 v178;
  char v179;
  uint64_t v180;
  uint64_t v181;
  __int128 v182;
  unsigned int v183;
  uint64_t v184;
  size_t v185;
  uint64_t v186;
  size_t v187;
  char v188[8];
  char v189[8];
  char v190[8];
  char v191[8];
  char v192[8];
  std::string __s1;
  char v194[8];
  char v195[8];
  uint64_t v196;
  void *v197[2];
  unsigned __int8 v198;
  _BYTE v199[16];
  uint64_t v200;
  _QWORD v201[2];
  char v202[8];
  _QWORD v203[2];
  _BYTE v204[16];
  _BYTE v205[15];
  char v206;
  _QWORD v207[3];
  lldb::SBDebugger *v208;
  _QWORD v209[4];
  char buffer[32];
  __int128 v211;
  _QWORD v212[4];
  __int128 __p;
  uint64_t v214;
  _QWORD v215[2];
  _BYTE v216[15];

  v9 = a4;
  v10 = a5;
  v172 = v9;
  if (!objc_msgSend(v9, "length")
    || (v11 = objc_retainAutorelease(v9),
        MachOInfo::MachOInfo((MachOInfo *)&v184, (unsigned __int8 *)objc_msgSend(v11, "bytes")),
        !v185))
  {
    retstr->var6 = 0;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var2 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
    *(_OWORD *)&retstr->var0.var2.var0 = 0u;
    goto LABEL_201;
  }
  v167 = self;
  v12 = v11;
  v168 = v10;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var2.var0 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  retstr->var6 = 0;
  if (!v12)
    goto LABEL_200;
  v171 = retstr;
  if (!objc_msgSend(v12, "length"))
    goto LABEL_200;
  v160 = v10;
  v161 = v12;
  v163 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](NSMutableData, "dataWithData:", v12)));
  v13 = (char *)objc_msgSend(v163, "bytes");
  bzero(&v13[v184], v185);
  v166 = objc_retainAutorelease(v163);
  v14 = (char *)objc_msgSend(v166, "bytes");
  bzero(&v14[v186], v187);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v16 = NSTemporaryDirectory();
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_7282A8, "stringByAppendingString:", CFSTR("XXXXXX")));
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingPathComponent:", v18));

  CFStringGetFileSystemRepresentation(v19, buffer, 1024);
  v20 = mkstemp(buffer);
  if (v20 == -1)
  {
    v162 = 0;
  }
  else
  {
    close(v20);
    v21 = objc_msgSend(v15, "stringWithFileSystemRepresentation:length:", buffer, strlen(buffer));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if ((objc_msgSend(v15, "removeItemAtPath:error:", v22, 0) & 1) != 0)
      v162 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v22, 0));
    else
      v162 = 0;

  }
  v23 = v162;
  if ((objc_msgSend(v166, "writeToURL:atomically:", v162, 0) & 1) == 0)
    goto LABEL_199;
  v24 = v162;
  v207[0] = off_725640;
  v207[1] = v24;
  v208 = (lldb::SBDebugger *)v207;
  v209[0] = off_725640;
  v209[3] = v209;
  v25 = v24;
  v209[1] = v25;
  v26 = v208;
  if (v208 == (lldb::SBDebugger *)v207)
  {
    v27 = 4;
    v26 = (lldb::SBDebugger *)v207;
    goto LABEL_17;
  }
  if (v208)
  {
    v27 = 5;
LABEL_17:
    v26 = (lldb::SBDebugger *)(*(uint64_t (**)(void))(*(_QWORD *)v26 + 8 * v27))();
  }
  lldb::SBDebugger::Create(v26);
  if ((lldb::SBDebugger::IsValid((lldb::SBDebugger *)v204) & 1) == 0)
    goto LABEL_198;
  v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "path")));
  lldb::SBDebugger::CreateTargetWithFileAndArch(v203, (lldb::SBDebugger *)v204, (const char *)objc_msgSend(v28, "UTF8String"), "16777235-0");

  if ((lldb::SBTarget::IsValid((lldb::SBTarget *)v203) & 1) == 0)
    goto LABEL_197;
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "path")));
  lldb::SBFileSpec::SBFileSpec((lldb::SBFileSpec *)v202, (const char *)objc_msgSend(v29, "UTF8String"), 1);

  lldb::SBTarget::FindModule(v201, (lldb::SBTarget *)v203, (const lldb::SBFileSpec *)v202);
  if (!lldb::SBModule::GetNumCompileUnits((lldb::SBModule *)v201))
    goto LABEL_196;
  lldb::SBModule::SBModule((lldb::SBModule *)v199, (const lldb::SBModule *)v201);
  NumCompileUnits = lldb::SBModule::GetNumCompileUnits((lldb::SBModule *)v199);
  if (NumCompileUnits >= 2)
  {
    v31 = 0;
    v32 = 0;
    v183 = 0;
    v33 = -1;
    while (1)
    {
      lldb::SBModule::GetCompileUnitAtIndex(buffer, (lldb::SBModule *)v199, v31);
      NumLineEntries = lldb::SBCompileUnit::GetNumLineEntries((lldb::SBCompileUnit *)buffer);
      if (NumLineEntries)
        break;
LABEL_44:
      lldb::SBCompileUnit::~SBCompileUnit((lldb::SBCompileUnit *)buffer);
      if (++v31 == NumCompileUnits)
        goto LABEL_47;
    }
    v35 = 0;
    v36 = 0;
    v37 = -1;
    do
    {
      lldb::SBCompileUnit::GetLineEntryAtIndex(v197, (lldb::SBCompileUnit *)buffer, v35);
      lldb::SBLineEntry::GetStartAddress((lldb::SBLineEntry *)v197);
      lldb::SBAddress::GetSymbol((lldb::SBAddress *)v205);
      Name = (const char *)lldb::SBSymbol::GetName((lldb::SBSymbol *)&__s1);
      lldb::SBSymbol::~SBSymbol((lldb::SBSymbol *)&__s1);
      lldb::SBAddress::~SBAddress((lldb::SBAddress *)v205);
      if (!v36 && Name != 0)
        v36 = strlen(Name) == 8 && *(_QWORD *)Name == 0x6E69616D2E6DLL;
      lldb::SBLineEntry::GetStartAddress((lldb::SBLineEntry *)v197);
      FileAddress = lldb::SBAddress::GetFileAddress((lldb::SBAddress *)&__s1);
      if (FileAddress < v37)
        v37 = FileAddress;
      lldb::SBAddress::~SBAddress((lldb::SBAddress *)&__s1);
      lldb::SBLineEntry::~SBLineEntry((lldb::SBLineEntry *)v197);
      ++v35;
    }
    while (NumLineEntries != v35);
    if (v36)
    {
      v40 = v183;
      if ((v32 & (v37 >= v33)) == 0)
        v40 = v31;
      v183 = v40;
      if ((v32 & (v37 >= v33)) == 0)
        v33 = v37;
    }
    else if ((v32 & 1) == 0)
    {
      v32 = 0;
      v41 = v183;
      if (v37 < v33)
        v41 = v31;
      v183 = v41;
      if (v37 < v33)
        v33 = v37;
      goto LABEL_43;
    }
    v32 = 1;
LABEL_43:
    retstr = v171;
    goto LABEL_44;
  }
  v183 = 0;
LABEL_47:
  lldb::SBModule::GetCompileUnitAtIndex(&v200, (lldb::SBModule *)v201, v183);
  lldb::SBModule::~SBModule((lldb::SBModule *)v199);
  if (!lldb::SBCompileUnit::GetNumLineEntries((lldb::SBCompileUnit *)&v200))
    goto LABEL_195;
  v42 = lldb::SBCompileUnit::GetNumLineEntries((lldb::SBCompileUnit *)&v200);
  std::vector<DebugInfo::LineEntry>::resize((uint64_t)retstr, v42);
  *(_QWORD *)&retstr->var2 = 0xFFFFFFFFLL;
  v43 = v185;
  retstr->var5 = 0;
  retstr->var6 = v43;
  std::string::basic_string[abi:nn180100]<0>(v197, "::air.vertexFetchFunction()");
  v44 = 0;
  v164 = 72;
  v165 = -1;
  while (v44 < lldb::SBCompileUnit::GetNumLineEntries((lldb::SBCompileUnit *)&v200))
  {
    lldb::SBCompileUnit::GetLineEntryAtIndex(&v196, (lldb::SBCompileUnit *)&v200, v44);
    lldb::SBLineEntry::GetStartAddress((lldb::SBLineEntry *)&v196);
    lldb::SBAddress::GetBlock((lldb::SBAddress *)&__s1);
    IsInlined = lldb::SBBlock::IsInlined((lldb::SBBlock *)buffer);
    lldb::SBBlock::~SBBlock((lldb::SBBlock *)buffer);
    lldb::SBAddress::~SBAddress((lldb::SBAddress *)&__s1);
    v170 = v44;
    if ((IsInlined & 1) != 0)
    {
      lldb::SBBlock::SBBlock((lldb::SBBlock *)v192);
      lldb::SBLineEntry::GetStartAddress((lldb::SBLineEntry *)&v196);
      lldb::SBAddress::GetBlock((lldb::SBAddress *)buffer);
      lldb::SBAddress::~SBAddress((lldb::SBAddress *)buffer);
      lldb::SBLineEntry::GetFileSpec((lldb::SBLineEntry *)&v196);
      Line = lldb::SBLineEntry::GetLine((lldb::SBLineEntry *)&v196);
      while (lldb::SBBlock::IsInlined((lldb::SBBlock *)v191))
      {
        lldb::SBBlock::operator=(v192, v191);
        lldb::SBBlock::GetParent((lldb::SBBlock *)v191);
        lldb::SBBlock::operator=(v191, buffer);
        lldb::SBBlock::~SBBlock((lldb::SBBlock *)buffer);
        var0 = retstr->var0.var0;
        v48 = (char *)retstr->var0.var0 + 80 * v44;
        v214 = 0;
        __p = 0u;
        memset(v212, 0, sizeof(v212));
        v211 = 0u;
        memset(buffer, 0, sizeof(buffer));
        v49 = *((_QWORD *)v48 + 8);
        v50 = *((_QWORD *)v48 + 9);
        v51 = (unint64_t *)(v48 + 64);
        if (v49 >= v50)
        {
          v56 = std::vector<DebugInfo::BlockInfo>::__push_back_slow_path<DebugInfo::BlockInfo>((unint64_t *)var0 + 10 * v44 + 7, (uint64_t)buffer);
          v57 = SHIBYTE(v214);
          *v51 = v56;
          if (v57 < 0)
            operator delete((void *)__p);
        }
        else
        {
          *(_QWORD *)v49 = 0;
          v52 = *(_OWORD *)&buffer[8];
          *(_QWORD *)(v49 + 24) = *(_QWORD *)&buffer[24];
          *(_OWORD *)(v49 + 8) = v52;
          memset(&buffer[8], 0, 24);
          v53 = v212[0];
          *(_OWORD *)(v49 + 32) = v211;
          *(_QWORD *)(v49 + 48) = v53;
          v212[0] = 0;
          v211 = 0uLL;
          v54 = *(_OWORD *)&v212[1];
          *(_QWORD *)(v49 + 72) = v212[3];
          *(_OWORD *)(v49 + 56) = v54;
          memset(&v212[1], 0, 24);
          v55 = __p;
          *(_QWORD *)(v49 + 96) = v214;
          *(_OWORD *)(v49 + 80) = v55;
          __p = 0uLL;
          v214 = 0;
          *v51 = v49 + 104;
        }
        if (SHIBYTE(v212[3]) < 0)
          operator delete((void *)v212[1]);
        if (SHIBYTE(v212[0]) < 0)
          operator delete((void *)v211);
        if (buffer[31] < 0)
          operator delete(*(void **)&buffer[8]);
        v58 = *v51;
        if (lldb::SBBlock::GetInlinedName((lldb::SBBlock *)v192))
        {
          InlinedName = (const std::string::value_type *)lldb::SBBlock::GetInlinedName((lldb::SBBlock *)v192);
          std::string::assign((std::string *)(v58 - 72), InlinedName);
        }
        if (lldb::SBFileSpec::GetDirectory((lldb::SBFileSpec *)v190)
          && lldb::SBFileSpec::GetFilename((lldb::SBFileSpec *)v190))
        {
          Directory = (const std::string::value_type *)lldb::SBFileSpec::GetDirectory((lldb::SBFileSpec *)v190);
          std::string::assign((std::string *)(v58 - 96), Directory);
          Filename = (const std::string::value_type *)lldb::SBFileSpec::GetFilename((lldb::SBFileSpec *)v190);
          std::string::assign((std::string *)(v58 - 48), Filename);
          constructFullPath((uint64_t)buffer, v58 - 96, v58 - 48);
          v62 = (void **)(v58 - 24);
          if (*(char *)(v58 - 1) < 0)
            operator delete(*v62);
          *(_OWORD *)v62 = *(_OWORD *)buffer;
          *(_QWORD *)(v58 - 8) = *(_QWORD *)&buffer[16];
        }
        *(_DWORD *)(v58 - 104) = Line;
        Line = lldb::SBBlock::GetInlinedCallSiteLine((lldb::SBBlock *)v192);
        lldb::SBBlock::GetInlinedCallSiteFile((lldb::SBBlock *)v192);
        lldb::SBFileSpec::operator=(v190, buffer);
        lldb::SBFileSpec::~SBFileSpec((lldb::SBFileSpec *)buffer);
      }
      lldb::SBLineEntry::GetStartAddress((lldb::SBLineEntry *)&v196);
      lldb::SBAddress::GetFunction((lldb::SBAddress *)v205);
      v72 = lldb::SBFunction::GetName((lldb::SBFunction *)buffer);
      if (v72)
      {
        lldb::SBLineEntry::GetStartAddress((lldb::SBLineEntry *)&v196);
        lldb::SBAddress::GetFunction((lldb::SBAddress *)v188);
        v73 = (char *)lldb::SBFunction::GetName((lldb::SBFunction *)v189);
      }
      else
      {
        v73 = "";
      }
      std::string::basic_string[abi:nn180100]<0>(&__s1, v73);
      if (v72)
      {
        lldb::SBFunction::~SBFunction((lldb::SBFunction *)v189);
        lldb::SBAddress::~SBAddress((lldb::SBAddress *)v188);
      }
      lldb::SBFunction::~SBFunction((lldb::SBFunction *)buffer);
      lldb::SBAddress::~SBAddress((lldb::SBAddress *)v205);
      v83 = retstr->var0.var0;
      v84 = (char *)retstr->var0.var0 + 80 * v44;
      v87 = *((_QWORD *)v84 + 7);
      v86 = (unint64_t *)(v84 + 56);
      v85 = v87;
      v89 = v86 + 1;
      v88 = v86[1];
      if (v87 != v88)
      {
        v90 = HIBYTE(__s1.__r_.__value_.__r.__words[2]);
        if ((__s1.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          size = HIBYTE(__s1.__r_.__value_.__r.__words[2]);
        else
          size = __s1.__r_.__value_.__l.__size_;
        v92 = v198;
        if ((v198 & 0x80u) != 0)
          v92 = (unint64_t)v197[1];
        if (size != v92)
          goto LABEL_117;
        if ((v198 & 0x80u) == 0)
          v93 = v197;
        else
          v93 = (void **)v197[0];
        if ((*((_BYTE *)&__s1.__r_.__value_.__s + 23) & 0x80) != 0)
        {
          if (memcmp(__s1.__r_.__value_.__l.__data_, v93, __s1.__r_.__value_.__l.__size_))
            goto LABEL_117;
        }
        else if (*((_BYTE *)&__s1.__r_.__value_.__s + 23))
        {
          p_s1 = &__s1;
          while (p_s1->__r_.__value_.__s.__data_[0] == *(unsigned __int8 *)v93)
          {
            p_s1 = (std::string *)((char *)p_s1 + 1);
            v93 = (void **)((char *)v93 + 1);
            if (!--v90)
              goto LABEL_133;
          }
LABEL_117:
          v214 = 0;
          __p = 0u;
          memset(v212, 0, sizeof(v212));
          v211 = 0u;
          memset(buffer, 0, sizeof(buffer));
          if (v88 >= *((_QWORD *)v83 + 10 * v44 + 9))
          {
            v99 = std::vector<DebugInfo::BlockInfo>::__push_back_slow_path<DebugInfo::BlockInfo>(v86, (uint64_t)buffer);
            v100 = SHIBYTE(v214);
            *v89 = v99;
            if (v100 < 0)
              operator delete((void *)__p);
          }
          else
          {
            *(_QWORD *)v88 = 0;
            v95 = *(_OWORD *)&buffer[8];
            *(_QWORD *)(v88 + 24) = *(_QWORD *)&buffer[24];
            *(_OWORD *)(v88 + 8) = v95;
            memset(&buffer[8], 0, 24);
            v96 = v212[0];
            *(_OWORD *)(v88 + 32) = v211;
            *(_QWORD *)(v88 + 48) = v96;
            v212[0] = 0;
            v211 = 0uLL;
            v97 = *(_OWORD *)&v212[1];
            *(_QWORD *)(v88 + 72) = v212[3];
            *(_OWORD *)(v88 + 56) = v97;
            memset(&v212[1], 0, 24);
            v98 = __p;
            *(_QWORD *)(v88 + 96) = v214;
            *(_OWORD *)(v88 + 80) = v98;
            __p = 0uLL;
            v214 = 0;
            *v89 = v88 + 104;
          }
          if (SHIBYTE(v212[3]) < 0)
            operator delete((void *)v212[1]);
          if (SHIBYTE(v212[0]) < 0)
            operator delete((void *)v211);
          if (buffer[31] < 0)
            operator delete(*(void **)&buffer[8]);
          v101 = *v89;
          std::string::operator=((std::string *)(*v89 - 72), &__s1);
          if (lldb::SBFileSpec::GetDirectory((lldb::SBFileSpec *)v190)
            && lldb::SBFileSpec::GetFilename((lldb::SBFileSpec *)v190))
          {
            v102 = (const std::string::value_type *)lldb::SBFileSpec::GetDirectory((lldb::SBFileSpec *)v190);
            std::string::assign((std::string *)(v101 - 96), v102);
            v103 = (const std::string::value_type *)lldb::SBFileSpec::GetFilename((lldb::SBFileSpec *)v190);
            std::string::assign((std::string *)(v101 - 48), v103);
            constructFullPath((uint64_t)buffer, v101 - 96, v101 - 48);
            v104 = (void **)(v101 - 24);
            if (*(char *)(v101 - 1) < 0)
              operator delete(*v104);
            *(_OWORD *)v104 = *(_OWORD *)buffer;
            *(_QWORD *)(v101 - 8) = *(_QWORD *)&buffer[16];
          }
          *(_DWORD *)(v101 - 104) = Line;
          v85 = *v86;
          v88 = *v89;
        }
LABEL_133:
        if (v85 != v88)
        {
          v105 = v88 - 104;
          if (v88 - 104 > v85)
          {
            v106 = v85 + 104;
            do
            {
              v107 = *(_QWORD *)(v106 - 104);
              v108 = *(_QWORD *)(v106 - 96);
              v109 = *(_QWORD *)(v106 - 88);
              *(_QWORD *)&buffer[7] = *(_QWORD *)(v106 - 81);
              *(_QWORD *)buffer = v109;
              v110 = *(_BYTE *)(v106 - 73);
              v111 = (void **)(v106 - 72);
              v112 = *(_QWORD *)(v106 - 72);
              *(_QWORD *)(v106 - 96) = 0;
              *(_QWORD *)(v106 - 88) = 0;
              v113 = *(_QWORD *)(v106 - 57);
              *(_QWORD *)v205 = *(_QWORD *)(v106 - 64);
              *(_QWORD *)&v205[7] = v113;
              v173 = *(_BYTE *)(v106 - 49);
              *(_QWORD *)(v106 - 64) = 0;
              *(_QWORD *)(v106 - 72) = 0;
              v114 = (void **)(v106 - 48);
              v177 = *(_QWORD *)(v106 - 48);
              v115 = *(_QWORD *)(v106 - 40);
              *(_QWORD *)&v216[7] = *(_QWORD *)(v106 - 33);
              *(_QWORD *)v216 = v115;
              v116 = v106 - 24;
              v181 = *(_QWORD *)(v106 - 24);
              *(_QWORD *)(v106 - 80) = 0;
              *(_QWORD *)(v106 - 56) = 0;
              v175 = *(_BYTE *)(v106 - 25);
              *(_QWORD *)(v106 - 40) = 0;
              *(_QWORD *)(v106 - 48) = 0;
              v117 = *(_QWORD *)(v106 - 16);
              *(_QWORD *)((char *)v215 + 7) = *(_QWORD *)(v106 - 9);
              v215[0] = v117;
              v179 = *(_BYTE *)(v106 - 1);
              *(_QWORD *)(v116 + 8) = 0;
              *(_QWORD *)(v116 + 16) = 0;
              *(_QWORD *)(v106 - 32) = 0;
              *(_QWORD *)v116 = 0;
              *(_QWORD *)(v106 - 104) = *(_QWORD *)v105;
              v118 = *(_OWORD *)(v105 + 8);
              *(_QWORD *)(v106 - 80) = *(_QWORD *)(v105 + 24);
              *(_OWORD *)(v106 - 96) = v118;
              *(_BYTE *)(v105 + 31) = 0;
              *(_BYTE *)(v105 + 8) = 0;
              if (*(char *)(v106 - 49) < 0)
                operator delete(*v111);
              v119 = *(_OWORD *)(v105 + 32);
              *(_QWORD *)(v106 - 56) = *(_QWORD *)(v105 + 48);
              *(_OWORD *)v111 = v119;
              *(_BYTE *)(v105 + 55) = 0;
              *(_BYTE *)(v105 + 32) = 0;
              if (*(char *)(v106 - 25) < 0)
                operator delete(*v114);
              v120 = *(_OWORD *)(v105 + 56);
              *(_QWORD *)(v106 - 32) = *(_QWORD *)(v105 + 72);
              *(_OWORD *)v114 = v120;
              *(_BYTE *)(v105 + 79) = 0;
              *(_BYTE *)(v105 + 56) = 0;
              if (*(char *)(v106 - 1) < 0)
                operator delete(*(void **)v116);
              v121 = *(_OWORD *)(v105 + 80);
              *(_QWORD *)(v106 - 8) = *(_QWORD *)(v105 + 96);
              *(_OWORD *)v116 = v121;
              *(_BYTE *)(v105 + 103) = 0;
              *(_BYTE *)(v105 + 80) = 0;
              *(_QWORD *)v105 = v107;
              if (*(char *)(v105 + 31) < 0)
                operator delete(*(void **)(v105 + 8));
              *(_QWORD *)(v105 + 8) = v108;
              v122 = *(_QWORD *)buffer;
              *(_QWORD *)(v105 + 23) = *(_QWORD *)&buffer[7];
              *(_QWORD *)(v105 + 16) = v122;
              *(_BYTE *)(v105 + 31) = v110;
              if (*(char *)(v105 + 55) < 0)
                operator delete(*(void **)(v105 + 32));
              *(_QWORD *)(v105 + 32) = v112;
              v123 = *(_QWORD *)v205;
              *(_QWORD *)(v105 + 47) = *(_QWORD *)&v205[7];
              *(_QWORD *)(v105 + 40) = v123;
              *(_BYTE *)(v105 + 55) = v173;
              if (*(char *)(v105 + 79) < 0)
                operator delete(*(void **)(v105 + 56));
              *(_QWORD *)(v105 + 56) = v177;
              v124 = *(_QWORD *)v216;
              *(_QWORD *)(v105 + 71) = *(_QWORD *)&v216[7];
              *(_QWORD *)(v105 + 64) = v124;
              *(_BYTE *)(v105 + 79) = v175;
              v44 = v170;
              if (*(char *)(v105 + 103) < 0)
                operator delete(*(void **)(v105 + 80));
              *(_QWORD *)(v105 + 80) = v181;
              v125 = v215[0];
              *(_QWORD *)(v105 + 95) = *(_QWORD *)((char *)v215 + 7);
              *(_QWORD *)(v105 + 88) = v125;
              *(_BYTE *)(v105 + 103) = v179;
              v105 -= 104;
              v126 = v106 >= v105;
              v106 += 104;
            }
            while (!v126);
          }
        }
      }
      if (SHIBYTE(__s1.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__s1.__r_.__value_.__l.__data_);
      lldb::SBFileSpec::~SBFileSpec((lldb::SBFileSpec *)v190);
      lldb::SBBlock::~SBBlock((lldb::SBBlock *)v191);
      lldb::SBBlock::~SBBlock((lldb::SBBlock *)v192);
      retstr = v171;
      v63 = v171->var0.var0;
      goto LABEL_155;
    }
    lldb::SBLineEntry::GetFileSpec((lldb::SBLineEntry *)&v196);
    v63 = retstr->var0.var0;
    v64 = (char *)retstr->var0.var0 + 80 * v44;
    v214 = 0;
    __p = 0u;
    memset(v212, 0, sizeof(v212));
    v211 = 0u;
    memset(buffer, 0, sizeof(buffer));
    v65 = *((_QWORD *)v64 + 8);
    v66 = *((_QWORD *)v64 + 9);
    v67 = (unint64_t *)(v64 + 64);
    if (v65 >= v66)
    {
      v74 = std::vector<DebugInfo::BlockInfo>::__push_back_slow_path<DebugInfo::BlockInfo>((unint64_t *)v63 + 10 * v44 + 7, (uint64_t)buffer);
      v75 = SHIBYTE(v214);
      *v67 = v74;
      if (v75 < 0)
        operator delete((void *)__p);
    }
    else
    {
      *(_QWORD *)v65 = 0;
      v68 = *(_OWORD *)&buffer[8];
      *(_QWORD *)(v65 + 24) = *(_QWORD *)&buffer[24];
      *(_OWORD *)(v65 + 8) = v68;
      memset(&buffer[8], 0, 24);
      v69 = v212[0];
      *(_OWORD *)(v65 + 32) = v211;
      *(_QWORD *)(v65 + 48) = v69;
      v212[0] = 0;
      v211 = 0uLL;
      v70 = *(_OWORD *)&v212[1];
      *(_QWORD *)(v65 + 72) = v212[3];
      *(_OWORD *)(v65 + 56) = v70;
      memset(&v212[1], 0, 24);
      v71 = __p;
      *(_QWORD *)(v65 + 96) = v214;
      *(_OWORD *)(v65 + 80) = v71;
      __p = 0uLL;
      v214 = 0;
      *v67 = v65 + 104;
    }
    if (SHIBYTE(v212[3]) < 0)
      operator delete((void *)v212[1]);
    if (SHIBYTE(v212[0]) < 0)
      operator delete((void *)v211);
    if (buffer[31] < 0)
      operator delete(*(void **)&buffer[8]);
    lldb::SBLineEntry::GetStartAddress((lldb::SBLineEntry *)&v196);
    lldb::SBAddress::GetFunction((lldb::SBAddress *)&__s1);
    v76 = lldb::SBFunction::GetName((lldb::SBFunction *)buffer);
    if (v76)
    {
      lldb::SBLineEntry::GetStartAddress((lldb::SBLineEntry *)&v196);
      lldb::SBAddress::GetFunction((lldb::SBAddress *)v194);
      v77 = (const std::string::value_type *)lldb::SBFunction::GetName((lldb::SBFunction *)v195);
    }
    else
    {
      v77 = "-";
    }
    std::string::assign((std::string *)(*v67 - 72), v77);
    if (v76)
    {
      lldb::SBFunction::~SBFunction((lldb::SBFunction *)v195);
      lldb::SBAddress::~SBAddress((lldb::SBAddress *)v194);
    }
    lldb::SBFunction::~SBFunction((lldb::SBFunction *)buffer);
    lldb::SBAddress::~SBAddress((lldb::SBAddress *)&__s1);
    if (lldb::SBFileSpec::GetDirectory((lldb::SBFileSpec *)v216)
      && lldb::SBFileSpec::GetFilename((lldb::SBFileSpec *)v216))
    {
      v78 = (const std::string::value_type *)lldb::SBFileSpec::GetDirectory((lldb::SBFileSpec *)v216);
      std::string::assign((std::string *)(*v67 - 96), v78);
      v79 = (const std::string::value_type *)lldb::SBFileSpec::GetFilename((lldb::SBFileSpec *)v216);
      std::string::assign((std::string *)(*v67 - 48), v79);
      v80 = (char *)lldb::SBFileSpec::GetDirectory((lldb::SBFileSpec *)v216);
      std::string::basic_string[abi:nn180100]<0>(&__s1, v80);
      v81 = (char *)lldb::SBFileSpec::GetFilename((lldb::SBFileSpec *)v216);
      std::string::basic_string[abi:nn180100]<0>(v205, v81);
      constructFullPath((uint64_t)buffer, (uint64_t)&__s1, (uint64_t)v205);
      v82 = *v67 - 24;
      if (*(char *)(*v67 - 1) < 0)
        operator delete(*(void **)v82);
      *(_OWORD *)v82 = *(_OWORD *)buffer;
      *(_QWORD *)(v82 + 16) = *(_QWORD *)&buffer[16];
      if (v206 < 0)
        operator delete(*(void **)v205);
      if (SHIBYTE(__s1.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__s1.__r_.__value_.__l.__data_);
    }
    *(_DWORD *)(*v67 - 104) = lldb::SBLineEntry::GetLine((lldb::SBLineEntry *)&v196);
    lldb::SBFileSpec::~SBFileSpec((lldb::SBFileSpec *)v216);
LABEL_155:
    v127 = (char *)v63 + 80 * v44;
    v129 = *((_QWORD *)v127 + 7);
    v128 = (unsigned int **)(v127 + 56);
    constructFullPath((uint64_t)buffer, v129 + 8, v129 + 56);
    v130 = (char *)v63 + 80 * v44;
    if (v130[23] < 0)
      operator delete(*(void **)v130);
    *(_OWORD *)v130 = *(_OWORD *)buffer;
    *((_QWORD *)v130 + 2) = *(_QWORD *)&buffer[16];
    lldb::SBLineEntry::GetStartAddress((lldb::SBLineEntry *)&v196);
    v131 = lldb::SBAddress::GetFileAddress((lldb::SBAddress *)buffer);
    var6 = retstr->var6;
    if (var6 >= v131)
      v133 = v131;
    else
      v133 = retstr->var6;
    *((_DWORD *)v63 + 20 * v44 + 6) = v133;
    lldb::SBAddress::~SBAddress((lldb::SBAddress *)buffer);
    lldb::SBLineEntry::GetEndAddress((lldb::SBLineEntry *)&v196);
    v134 = lldb::SBAddress::GetFileAddress((lldb::SBAddress *)buffer);
    if (var6 >= v134)
      v135 = v134;
    else
      v135 = var6;
    *((_DWORD *)v63 + 20 * v44 + 7) = v135;
    lldb::SBAddress::~SBAddress((lldb::SBAddress *)buffer);
    var3 = **v128;
    if (var3 != -1)
    {
      var2 = retstr->var2;
      if (var3 < var2)
        var2 = **v128;
      if (retstr->var3 > var3)
        var3 = retstr->var3;
      retstr->var2 = var2;
      retstr->var3 = var3;
      if (v170)
      {
        v138 = v165;
        v139 = (_QWORD *)((char *)v63 + v164);
        v174 = v63;
        do
        {
          v140 = v138;
          v141 = (char *)v63 + 80 * v138;
          v143 = *((_DWORD *)v141 + 6);
          v142 = v141 + 24;
          if (*((_DWORD *)v139 - 12) < v143)
          {
            v144 = *(_OWORD *)(v139 - 9);
            *(_QWORD *)&buffer[16] = *(v139 - 7);
            *(_OWORD *)buffer = v144;
            *(v139 - 8) = 0;
            *(v139 - 7) = 0;
            *(v139 - 9) = 0;
            v145 = *(v139 - 6);
            *(_QWORD *)&buffer[24] = v145;
            v146 = (char *)v63 + 80 * v138;
            v178 = *(_OWORD *)(v139 - 5);
            v211 = v178;
            v176 = *(v139 - 3);
            v212[0] = v176;
            *(v139 - 5) = 0;
            *(v139 - 4) = 0;
            *(v139 - 3) = 0;
            v182 = *((_OWORD *)v139 - 1);
            *(_OWORD *)&v212[1] = v182;
            v180 = *v139;
            v212[3] = *v139;
            *(v139 - 1) = 0;
            *v139 = 0;
            *(v139 - 2) = 0;
            v147 = *(_OWORD *)v146;
            *(v139 - 7) = *((_QWORD *)v146 + 2);
            *(_OWORD *)(v139 - 9) = v147;
            v146[23] = 0;
            *v146 = 0;
            *(v139 - 6) = *v142;
            std::vector<DebugInfo::LineDisassemblyInfo>::__vdeallocate(v139 - 5);
            *(_OWORD *)(v139 - 5) = *((_OWORD *)v146 + 2);
            *(v139 - 3) = *((_QWORD *)v146 + 6);
            *((_QWORD *)v146 + 5) = 0;
            *((_QWORD *)v146 + 4) = 0;
            *((_QWORD *)v146 + 6) = 0;
            std::vector<DebugInfo::BlockInfo>::__vdeallocate((void **)v139 - 2);
            *((_OWORD *)v139 - 1) = *(_OWORD *)(v146 + 56);
            *v139 = *((_QWORD *)v146 + 9);
            *((_QWORD *)v146 + 8) = 0;
            *((_QWORD *)v146 + 7) = 0;
            *((_QWORD *)v146 + 9) = 0;
            if (v146[23] < 0)
              operator delete(*(void **)v146);
            v148 = *(_OWORD *)buffer;
            *((_QWORD *)v146 + 2) = *(_QWORD *)&buffer[16];
            *(_OWORD *)v146 = v148;
            buffer[23] = 0;
            buffer[0] = 0;
            *v142 = v145;
            std::vector<DebugInfo::LineDisassemblyInfo>::__vdeallocate((uint64_t *)v146 + 4);
            *((_OWORD *)v146 + 2) = v178;
            *((_QWORD *)v146 + 6) = v176;
            v211 = 0uLL;
            v212[0] = 0;
            std::vector<DebugInfo::BlockInfo>::__vdeallocate((void **)v146 + 7);
            *(_OWORD *)(v146 + 56) = v182;
            *((_QWORD *)v146 + 9) = v180;
            memset(&v212[1], 0, 24);
            __s1.__r_.__value_.__r.__words[0] = (std::string::size_type)&v212[1];
            std::vector<DebugInfo::BlockInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)&__s1);
            __s1.__r_.__value_.__r.__words[0] = (std::string::size_type)&v211;
            std::vector<DebugInfo::LineDisassemblyInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)&__s1);
            if (buffer[23] < 0)
              operator delete(*(void **)buffer);
            retstr = v171;
            v63 = v174;
          }
          v139 -= 10;
          --v138;
        }
        while (v140);
      }
    }
    lldb::SBLineEntry::~SBLineEntry((lldb::SBLineEntry *)&v196);
    v44 = v170 + 1;
    v164 += 80;
    ++v165;
  }
  retstr->var4 = retstr->var3 - retstr->var2 + 1;
  v149 = retstr->var0.var0;
  v150 = retstr->var0.var1 - retstr->var0.var0;
  if (v150)
  {
    v151 = 0;
    v152 = 0;
    v153 = 0xCCCCCCCCCCCCCCCDLL * (v150 >> 4);
    do
    {
      v154 = *((_DWORD *)v149 + 20 * v151 + 7);
      v155 = v152 + 1;
      if (v153 > v155)
      {
        v156 = *((_DWORD *)v149 + 20 * v151 + 6);
        do
        {
          if (v156 != *((_DWORD *)v149 + 20 * v155 + 6))
            break;
          if (v154 <= *((_DWORD *)v149 + 20 * v155 + 7))
            v154 = *((_DWORD *)v149 + 20 * v155 + 7);
          v155 = (v155 + 1);
        }
        while (v153 > v155);
      }
      v151 = v152;
      if (v152 < v155)
      {
        v157 = v155 - (unint64_t)v152;
        v158 = (unsigned int *)((char *)v149 + 80 * v152 + 28);
        do
        {
          *v158 = v154;
          v158 += 20;
          --v157;
        }
        while (v157);
        v151 = v155;
        v152 = v155;
      }
    }
    while (v153 > v151);
  }
  if ((a6 & 0x80000000) == 0)
    operator new();
  if ((char)v198 < 0)
    operator delete(v197[0]);
LABEL_195:
  lldb::SBCompileUnit::~SBCompileUnit((lldb::SBCompileUnit *)&v200);
LABEL_196:
  lldb::SBModule::~SBModule((lldb::SBModule *)v201);
  lldb::SBFileSpec::~SBFileSpec((lldb::SBFileSpec *)v202);
LABEL_197:
  lldb::SBTarget::~SBTarget((lldb::SBTarget *)v203);
  v23 = v162;
LABEL_198:
  lldb::SBDebugger::~SBDebugger((lldb::SBDebugger *)v204);
  GTScopeFunction::~GTScopeFunction((GTScopeFunction *)v209);
LABEL_199:

  v10 = v160;
  v12 = v161;
LABEL_200:

LABEL_201:
  return result;
}

- (pair<std::vector<unsigned)_getAddressAndLineTableForDebugInfo:(pair<std:(std:(SEL)a3 :(void *)a4 vector<std::vector<DebugInfo::LineEntry *>>> *)self :vector<unsigned)int>
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unsigned int *v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
  _QWORD *v15;
  char *v16;
  __int128 v17;
  int64x2_t v18;
  char *v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  unint64_t v23;
  unsigned int v24;
  uint64_t v25;
  char *v26;
  unint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  __int128 v38;
  int64x2_t v39;
  char *v40;
  void **v41;
  _QWORD *v42;
  void **v43;
  unint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  _QWORD *v63;
  _QWORD *v64;
  uint64_t v65;
  __int128 v66;
  int64x2_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  _QWORD *v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  char *v82;
  char *v83;
  uint64_t v84;
  void *v85;
  unsigned int v86;
  unsigned int *v87;
  char *v88;
  unsigned int *v89;
  unsigned int *v91;
  void *__p;
  int64x2_t v93;
  char *v94;
  void **v95;
  uint64_t v96;
  int64x2_t v97;
  char *v98;
  char **v99;

  v5 = *(_QWORD *)a4;
  v4 = *((_QWORD *)a4 + 1);
  if (*(_QWORD *)a4 == v4)
  {
    *(_OWORD *)&retstr->var0.__end_cap_.__value_ = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.__begin_ = 0u;
  }
  else
  {
    v7 = *((unsigned int *)a4 + 16);
    if ((_DWORD)v7)
    {
      v8 = (unsigned int *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>(*((unsigned int *)a4 + 16));
      v89 = &v8[v9];
      memset(v8, 255, 4 * v7);
      v91 = &v8[v7];
      v5 = *(_QWORD *)a4;
      v4 = *((_QWORD *)a4 + 1);
    }
    else
    {
      v8 = 0;
      v91 = 0;
      v89 = 0;
    }
    v97 = 0uLL;
    v98 = 0;
    v10 = 0xCCCCCCCCCCCCCCCDLL * ((v4 - v5) >> 4);
    if (v10 >= 2)
    {
      if (v10 >= 0x1555555555555556)
        abort();
      v95 = (void **)&v98;
      v11 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v10 >> 1);
      __p = v11;
      v93.i64[0] = (uint64_t)v11;
      v13 = &v11[24 * v12];
      v93.i64[1] = (uint64_t)v11;
      v94 = v13;
      v14 = (_QWORD *)v97.i64[1];
      v15 = (_QWORD *)v97.i64[0];
      if (v97.i64[1] == v97.i64[0])
      {
        v18 = vdupq_n_s64(v97.u64[1]);
        v16 = v11;
      }
      else
      {
        v16 = v11;
        do
        {
          *((_QWORD *)v16 - 3) = 0;
          *((_QWORD *)v16 - 2) = 0;
          v16 -= 24;
          *((_QWORD *)v16 + 2) = 0;
          v17 = *(_OWORD *)(v14 - 3);
          v14 -= 3;
          *(_OWORD *)v16 = v17;
          *((_QWORD *)v16 + 2) = v14[2];
          *v14 = 0;
          v14[1] = 0;
          v14[2] = 0;
        }
        while (v14 != v15);
        v18 = v97;
        v11 = (char *)v93.i64[1];
        v13 = v94;
      }
      v97.i64[0] = (uint64_t)v16;
      v97.i64[1] = (uint64_t)v11;
      v93 = v18;
      v19 = v98;
      v98 = v13;
      v94 = v19;
      __p = (void *)v18.i64[0];
      std::__split_buffer<std::vector<std::pair<unsigned int,unsigned int>>>::~__split_buffer((uint64_t)&__p);
      v5 = *(_QWORD *)a4;
      v4 = *((_QWORD *)a4 + 1);
    }
    if (v4 != v5)
    {
      v20 = 0;
      v21 = 0;
      do
      {
        v22 = v5 + 80 * v20;
        v23 = *(unsigned int *)(v22 + 24);
        if (v91 - v8 > v23)
        {
          v24 = v8[v23];
          v25 = v97.i64[0];
          if (v24 == -1)
          {
            v26 = (char *)v97.i64[1];
            v27 = 0xAAAAAAAAAAAAAAABLL * ((v97.i64[1] - v97.i64[0]) >> 3);
            do
            {
              v8[v23] = v27;
              LODWORD(v23) = v23 + 1;
            }
            while (v23 < *(_DWORD *)(v5 + 80 * v20 + 28));
            if (v26 >= v98)
            {
              if (v27 + 1 > 0xAAAAAAAAAAAAAAALL)
                abort();
              v29 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v98[-v25] >> 3);
              v30 = 2 * v29;
              if (2 * v29 <= v27 + 1)
                v30 = v27 + 1;
              if (v29 >= 0x555555555555555)
                v31 = 0xAAAAAAAAAAAAAAALL;
              else
                v31 = v30;
              v95 = (void **)&v98;
              v32 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v31);
              v33 = &v32[24 * v27];
              __p = v32;
              v93.i64[0] = (uint64_t)v33;
              v94 = &v32[24 * v34];
              v28 = v33 + 24;
              *(_QWORD *)v33 = 0;
              *((_QWORD *)v33 + 1) = 0;
              *((_QWORD *)v33 + 2) = 0;
              v93.i64[1] = (uint64_t)(v33 + 24);
              v35 = (_QWORD *)v97.i64[1];
              v36 = (_QWORD *)v97.i64[0];
              v37 = v93.i64[0];
              if (v97.i64[1] == v97.i64[0])
              {
                v39 = vdupq_n_s64(v97.u64[1]);
              }
              else
              {
                do
                {
                  *(_QWORD *)(v37 - 24) = 0;
                  *(_QWORD *)(v37 - 16) = 0;
                  v37 -= 24;
                  *(_QWORD *)(v37 + 16) = 0;
                  v38 = *(_OWORD *)(v35 - 3);
                  v35 -= 3;
                  *(_OWORD *)v37 = v38;
                  *(_QWORD *)(v37 + 16) = v35[2];
                  *v35 = 0;
                  v35[1] = 0;
                  v35[2] = 0;
                }
                while (v35 != v36);
                v39 = v97;
                v28 = (_QWORD *)v93.i64[1];
              }
              v97.i64[0] = v37;
              v97.i64[1] = (uint64_t)v28;
              v93 = v39;
              v40 = v98;
              v98 = v94;
              v94 = v40;
              __p = (void *)v39.i64[0];
              std::__split_buffer<std::vector<std::pair<unsigned int,unsigned int>>>::~__split_buffer((uint64_t)&__p);
            }
            else
            {
              v28 = v26 + 24;
              *(_QWORD *)v26 = 0;
              *((_QWORD *)v26 + 1) = 0;
              *((_QWORD *)v26 + 2) = 0;
            }
            v97.i64[1] = (uint64_t)v28;
            v24 = v8[*(unsigned int *)(v22 + 24)];
            v25 = v97.i64[0];
          }
          v41 = (void **)(v25 + 24 * v24);
          v43 = v41 + 1;
          v42 = v41[1];
          v44 = (unint64_t)v41[2];
          if ((unint64_t)v42 >= v44)
          {
            v46 = ((char *)v42 - (_BYTE *)*v41) >> 3;
            if ((unint64_t)(v46 + 1) >> 61)
              abort();
            v47 = v44 - (_QWORD)*v41;
            v48 = v47 >> 2;
            if (v47 >> 2 <= (unint64_t)(v46 + 1))
              v48 = v46 + 1;
            if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8)
              v49 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v49 = v48;
            if (v49)
              v49 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v49);
            else
              v50 = 0;
            v51 = (_QWORD *)(v49 + 8 * v46);
            *v51 = v22;
            v45 = v51 + 1;
            v52 = (char *)*v43;
            v53 = (char *)*v41;
            if (*v43 != *v41)
            {
              do
              {
                v54 = *((_QWORD *)v52 - 1);
                v52 -= 8;
                *--v51 = v54;
              }
              while (v52 != v53);
              v52 = (char *)*v41;
            }
            *v41 = v51;
            *v43 = v45;
            v41[2] = (void *)(v49 + 8 * v50);
            if (v52)
              operator delete(v52);
          }
          else
          {
            *v42 = v22;
            v45 = v42 + 1;
          }
          *v43 = v45;
          v5 = *(_QWORD *)a4;
          v4 = *((_QWORD *)a4 + 1);
        }
        v20 = ++v21;
      }
      while (0xCCCCCCCCCCCCCCCDLL * ((v4 - v5) >> 4) > v21);
    }
    v55 = v97.i64[1];
    if (v97.i64[1] >= (unint64_t)v98)
    {
      v57 = 0xAAAAAAAAAAAAAAABLL * ((v97.i64[1] - v97.i64[0]) >> 3);
      v58 = v57 + 1;
      if (v57 + 1 > 0xAAAAAAAAAAAAAAALL)
        abort();
      if (0x5555555555555556 * ((uint64_t)&v98[-v97.i64[0]] >> 3) > v58)
        v58 = 0x5555555555555556 * ((uint64_t)&v98[-v97.i64[0]] >> 3);
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v98[-v97.i64[0]] >> 3) >= 0x555555555555555)
        v59 = 0xAAAAAAAAAAAAAAALL;
      else
        v59 = v58;
      v95 = (void **)&v98;
      v60 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v59);
      v61 = &v60[24 * v57];
      v93.i64[0] = (uint64_t)v61;
      v94 = &v60[24 * v62];
      v56 = v61 + 24;
      *(_QWORD *)v61 = 0;
      *((_QWORD *)v61 + 1) = 0;
      *((_QWORD *)v61 + 2) = 0;
      v93.i64[1] = (uint64_t)(v61 + 24);
      v63 = (_QWORD *)v97.i64[1];
      v64 = (_QWORD *)v97.i64[0];
      v65 = v93.i64[0];
      if (v97.i64[1] == v97.i64[0])
      {
        v67 = vdupq_n_s64(v97.u64[1]);
      }
      else
      {
        do
        {
          *(_QWORD *)(v65 - 24) = 0;
          *(_QWORD *)(v65 - 16) = 0;
          v65 -= 24;
          *(_QWORD *)(v65 + 16) = 0;
          v66 = *(_OWORD *)(v63 - 3);
          v63 -= 3;
          *(_OWORD *)v65 = v66;
          *(_QWORD *)(v65 + 16) = v63[2];
          *v63 = 0;
          v63[1] = 0;
          v63[2] = 0;
        }
        while (v63 != v64);
        v67 = v97;
        v56 = (void *)v93.i64[1];
      }
      v97.i64[0] = v65;
      v97.i64[1] = (uint64_t)v56;
      v93 = v67;
      v68 = v98;
      v98 = v94;
      v94 = v68;
      __p = (void *)v67.i64[0];
      std::__split_buffer<std::vector<std::pair<unsigned int,unsigned int>>>::~__split_buffer((uint64_t)&__p);
    }
    else
    {
      v56 = (void *)(v97.i64[1] + 24);
      *(_QWORD *)v97.i64[1] = 0;
      *(_QWORD *)(v55 + 8) = 0;
      *(_QWORD *)(v55 + 16) = 0;
    }
    v97.i64[1] = (uint64_t)v56;
    v69 = *(_QWORD *)a4;
    v70 = *((_QWORD *)a4 + 1);
    if (v69 != v70)
    {
      do
      {
        v71 = v97.i64[1];
        v73 = *(_QWORD **)(v97.i64[1] - 16);
        v72 = *(_QWORD *)(v97.i64[1] - 8);
        if ((unint64_t)v73 >= v72)
        {
          v75 = *(_QWORD *)(v97.i64[1] - 24);
          v76 = ((uint64_t)v73 - v75) >> 3;
          if ((unint64_t)(v76 + 1) >> 61)
            abort();
          v77 = v72 - v75;
          v78 = v77 >> 2;
          if (v77 >> 2 <= (unint64_t)(v76 + 1))
            v78 = v76 + 1;
          if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFF8)
            v79 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v79 = v78;
          if (v79)
            v79 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v79);
          else
            v80 = 0;
          v81 = (_QWORD *)(v79 + 8 * v76);
          *v81 = v69;
          v74 = v81 + 1;
          v83 = *(char **)(v71 - 24);
          v82 = *(char **)(v71 - 16);
          if (v82 != v83)
          {
            do
            {
              v84 = *((_QWORD *)v82 - 1);
              v82 -= 8;
              *--v81 = v84;
            }
            while (v82 != v83);
            v82 = *(char **)(v71 - 24);
          }
          *(_QWORD *)(v71 - 24) = v81;
          *(_QWORD *)(v71 - 16) = v74;
          *(_QWORD *)(v71 - 8) = v79 + 8 * v80;
          if (v82)
            operator delete(v82);
        }
        else
        {
          *v73 = v69;
          v74 = v73 + 1;
        }
        *(_QWORD *)(v71 - 16) = v74;
        v69 += 80;
      }
      while (v69 != v70);
      v56 = (void *)v97.i64[1];
    }
    v85 = (void *)v97.i64[0];
    if (v8 != v91)
    {
      v86 = -1431655765 * (((unint64_t)v56 - v97.i64[0]) >> 3) - 1;
      v87 = v8;
      do
      {
        if (*v87 == -1)
          *v87 = v86;
        ++v87;
      }
      while (v87 != v91);
      v85 = (void *)v97.i64[0];
    }
    v88 = v98;
    v98 = 0;
    v96 = 0;
    v97 = 0uLL;
    retstr->var0.__begin_ = v8;
    retstr->var0.__end_ = v91;
    __p = 0;
    v93 = 0uLL;
    v94 = 0;
    retstr->var0.__end_cap_.__value_ = v89;
    retstr->var1.var0 = v85;
    retstr->var1.var1 = v56;
    retstr->var1.var2.var0 = v88;
    v95 = 0;
    v99 = &v94;
    std::vector<std::vector<ProfileEvent>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v99);
    if (__p)
    {
      v93.i64[0] = (uint64_t)__p;
      operator delete(__p);
    }
    __p = &v97;
    std::vector<std::vector<ProfileEvent>>::__destroy_vector::operator()[abi:nn180100]((void ***)&__p);
  }
  return self;
}

- (void)_ProcessLineList:(void *)a3 forFileCostMap:(void *)a4 forDebugInfo:(void *)a5 andCost:(double)a6 forAddr:(unsigned int)a7 andDrawIndex:(unsigned int)a8 andTargetIndex:(int)a9
{
  size_t *v9;
  size_t *v10;
  uint64_t v12;
  size_t v15;
  unint64_t v16;
  uint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint8x8_t v22;
  unint64_t v23;
  uint64_t **v24;
  uint64_t *i;
  unint64_t v26;
  char *v27;
  std::string *v28;
  __int128 v29;
  float v30;
  float v31;
  _BOOL8 v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  _QWORD *v38;
  size_t v39;
  uint8x8_t v40;
  unint64_t v41;
  uint8x8_t v42;
  uint64_t v43;
  _QWORD *v44;
  size_t v45;
  _QWORD *v46;
  unint64_t v47;
  unint64_t v48;
  uint8x8_t v49;
  void **v50;
  char *v51;
  unint64_t v52;
  _QWORD *v53;
  float v54;
  float v55;
  _BOOL8 v56;
  unint64_t v57;
  unint64_t v58;
  int8x8_t prime;
  void *v60;
  void *v61;
  uint64_t v62;
  _QWORD *v63;
  unint64_t v64;
  uint8x8_t v65;
  unint64_t v66;
  uint8x8_t v67;
  uint64_t v68;
  _QWORD *v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  size_t v78;
  unsigned int v79;
  double v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  char v90;
  size_t *v91;
  _QWORD *v95;
  _QWORD v97[2];
  char v98;

  v10 = *(size_t **)a3;
  v9 = (size_t *)*((_QWORD *)a3 + 1);
  if (*(size_t **)a3 != v9)
  {
    v12 = (uint64_t)a5;
    v90 = 0;
    v95 = (char *)a4 + 16;
    v91 = (size_t *)*((_QWORD *)a3 + 1);
    while (1)
    {
      v15 = *v10;
      if (*(_DWORD *)(*v10 + 24) < *(_DWORD *)(v12 + 64))
        break;
LABEL_173:
      if (++v10 == v9)
        return;
    }
    v16 = *(unsigned __int8 *)(v15 + 23);
    if (*(char *)(v15 + 23) < 0)
    {
      if (*(_QWORD *)(v15 + 8))
        goto LABEL_7;
    }
    else if (*(_BYTE *)(v15 + 23))
    {
LABEL_7:
      if ((v16 & 0x80u) == 0)
        v17 = (uint64_t *)v15;
      else
        v17 = *(uint64_t **)v15;
      if ((v16 & 0x80u) == 0)
        v18 = v16;
      else
        v18 = *(_QWORD *)(v15 + 8);
      v19 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v17, v18);
      v20 = v19;
      v21 = *((_QWORD *)a4 + 1);
      if (v21)
      {
        v22 = (uint8x8_t)vcnt_s8((int8x8_t)v21);
        v22.i16[0] = vaddlv_u8(v22);
        v23 = v22.u32[0];
        if (v22.u32[0] > 1uLL)
        {
          v12 = v19;
          if (v19 >= v21)
            v12 = v19 % v21;
        }
        else
        {
          v12 = (v21 - 1) & v19;
        }
        v24 = *(uint64_t ***)(*(_QWORD *)a4 + 8 * v12);
        if (v24)
        {
          for (i = *v24; i; i = (uint64_t *)*i)
          {
            v26 = i[1];
            if (v26 == v20)
            {
              if (std::equal_to<std::string>::operator()[abi:nn180100]((unsigned __int8 *)i + 16, (unsigned __int8 *)v15))
              {
                goto LABEL_90;
              }
            }
            else
            {
              if (v23 > 1)
              {
                if (v26 >= v21)
                  v26 %= v21;
              }
              else
              {
                v26 &= v21 - 1;
              }
              if (v26 != v12)
                break;
            }
          }
        }
      }
      v27 = (char *)operator new(0x70uLL);
      v97[0] = v27;
      v97[1] = v95;
      v98 = 0;
      *(_QWORD *)v27 = 0;
      *((_QWORD *)v27 + 1) = v20;
      v28 = (std::string *)(v27 + 16);
      if (*(char *)(v15 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v28, *(const std::string::value_type **)v15, *(_QWORD *)(v15 + 8));
      }
      else
      {
        v29 = *(_OWORD *)v15;
        *((_QWORD *)v27 + 4) = *(_QWORD *)(v15 + 16);
        *(_OWORD *)&v28->__r_.__value_.__l.__data_ = v29;
      }
      *((_QWORD *)v27 + 13) = 0;
      *(_OWORD *)(v27 + 88) = 0u;
      *(_OWORD *)(v27 + 72) = 0u;
      *(_OWORD *)(v27 + 56) = 0u;
      *(_OWORD *)(v27 + 40) = 0u;
      *((_DWORD *)v27 + 26) = 1065353216;
      v98 = 1;
      v30 = (float)(unint64_t)(*((_QWORD *)a4 + 3) + 1);
      v31 = *((float *)a4 + 8);
      if (v21 && (float)(v31 * (float)v21) >= v30)
      {
LABEL_80:
        v46 = *(_QWORD **)(*(_QWORD *)a4 + 8 * v12);
        i = (uint64_t *)v97[0];
        if (v46)
        {
          *(_QWORD *)v97[0] = *v46;
        }
        else
        {
          *(_QWORD *)v97[0] = *((_QWORD *)a4 + 2);
          *((_QWORD *)a4 + 2) = i;
          *(_QWORD *)(*(_QWORD *)a4 + 8 * v12) = v95;
          if (!*i)
          {
LABEL_89:
            v97[0] = 0;
            ++*((_QWORD *)a4 + 3);
            std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,PerFileCost>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,PerFileCost>,void *>>>>::reset[abi:nn180100]((uint64_t)v97);
LABEL_90:
            v48 = i[10];
            if (v48)
            {
              v49 = (uint8x8_t)vcnt_s8((int8x8_t)v48);
              v49.i16[0] = vaddlv_u8(v49);
              if (v49.u32[0] > 1uLL)
              {
                v15 = a8;
                if (v48 <= a8)
                  v15 = a8 % v48;
              }
              else
              {
                v15 = ((_DWORD)v48 - 1) & a8;
              }
              v50 = *(void ***)(i[9] + 8 * v15);
              if (v50)
              {
                v51 = (char *)*v50;
                if (*v50)
                {
                  do
                  {
                    v52 = *((_QWORD *)v51 + 1);
                    if (v52 == a8)
                    {
                      if (*((_DWORD *)v51 + 4) == a8)
                        goto LABEL_162;
                    }
                    else
                    {
                      if (v49.u32[0] > 1uLL)
                      {
                        if (v52 >= v48)
                          v52 %= v48;
                      }
                      else
                      {
                        v52 &= v48 - 1;
                      }
                      if (v52 != v15)
                        break;
                    }
                    v51 = *(char **)v51;
                  }
                  while (v51);
                }
              }
            }
            v53 = i + 11;
            v51 = (char *)operator new(0x38uLL);
            *(_QWORD *)v51 = 0;
            *((_QWORD *)v51 + 1) = a8;
            *((_DWORD *)v51 + 4) = a8;
            *(_OWORD *)(v51 + 24) = 0u;
            *(_OWORD *)(v51 + 40) = 0u;
            v54 = (float)(unint64_t)(i[12] + 1);
            v55 = *((float *)i + 26);
            if (v48 && (float)(v55 * (float)v48) >= v54)
            {
LABEL_152:
              v72 = i[9];
              v73 = *(_QWORD **)(v72 + 8 * v15);
              if (v73)
              {
                *(_QWORD *)v51 = *v73;
              }
              else
              {
                *(_QWORD *)v51 = *v53;
                *v53 = v51;
                *(_QWORD *)(v72 + 8 * v15) = v53;
                if (!*(_QWORD *)v51)
                  goto LABEL_161;
                v74 = *(_QWORD *)(*(_QWORD *)v51 + 8);
                if ((v48 & (v48 - 1)) != 0)
                {
                  if (v74 >= v48)
                    v74 %= v48;
                }
                else
                {
                  v74 &= v48 - 1;
                }
                v73 = (_QWORD *)(i[9] + 8 * v74);
              }
              *v73 = v51;
LABEL_161:
              ++i[12];
LABEL_162:
              v12 = (uint64_t)a5;
              if (i[5] == i[6])
              {
                v75 = *((unsigned int *)a5 + 14);
                v97[0] = 0;
                std::vector<double>::resize((char **)i + 5, v75, v97);
                i[8] = 0;
              }
              v76 = *((_QWORD *)v51 + 3);
              if (v76 == *((_QWORD *)v51 + 4))
              {
                v77 = *((unsigned int *)a5 + 14);
                v97[0] = 0;
                std::vector<double>::resize((char **)v51 + 3, v77, v97);
                *((_QWORD *)v51 + 6) = 0;
                v76 = *((_QWORD *)v51 + 3);
              }
              v78 = *v10;
              v79 = **(_DWORD **)(*v10 + 56) - *((_DWORD *)a5 + 12);
              v80 = a6 / (double)(unint64_t)((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3);
              *(double *)(i[5] + 8 * v79) = *(double *)(i[5] + 8 * v79) + v80;
              *((double *)i + 8) = *((double *)i + 8) + v80;
              *(double *)(v76 + 8 * v79) = v80 + *(double *)(v76 + 8 * v79);
              *((double *)v51 + 6) = v80 + *((double *)v51 + 6);
              v81 = a7 - *(_DWORD *)(v78 + 24);
              v82 = *(_QWORD *)(v78 + 32);
              if (0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(v78 + 40) - v82) >> 3) <= v81)
              {
                v9 = v91;
              }
              else
              {
                v83 = v82 + 40 * v81;
                *(double *)(v83 + 16) = v80 + *(double *)(v83 + 16);
                v9 = v91;
                if (!*(_QWORD *)v83)
                {
                  *(_QWORD *)v83 = &stru_7282A8;
                  v84 = *((_QWORD *)a5 + 3);
                  v85 = 40 * a7;
                  v86 = *(void **)(v84 + v85);
                  *(_QWORD *)(v84 + v85) = &stru_7282A8;

                }
                if ((v90 & 1) == 0)
                  ++*(_DWORD *)(v82 + 40 * v81 + 24);
                v90 = 1;
              }
              goto LABEL_173;
            }
            v56 = (v48 & (v48 - 1)) != 0;
            if (v48 < 3)
              v56 = 1;
            v57 = v56 | (2 * v48);
            v58 = vcvtps_u32_f32(v54 / v55);
            if (v57 <= v58)
              prime = (int8x8_t)v58;
            else
              prime = (int8x8_t)v57;
            if (*(_QWORD *)&prime == 1)
            {
              prime = (int8x8_t)2;
            }
            else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
            {
              prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
            }
            v48 = i[10];
            if (*(_QWORD *)&prime > v48)
              goto LABEL_118;
            if (*(_QWORD *)&prime < v48)
            {
              v66 = vcvtps_u32_f32((float)(unint64_t)i[12] / *((float *)i + 26));
              if (v48 < 3 || (v67 = (uint8x8_t)vcnt_s8((int8x8_t)v48), v67.i16[0] = vaddlv_u8(v67), v67.u32[0] > 1uLL))
              {
                v66 = std::__next_prime(v66);
              }
              else
              {
                v68 = 1 << -(char)__clz(v66 - 1);
                if (v66 >= 2)
                  v66 = v68;
              }
              if (*(_QWORD *)&prime <= v66)
                prime = (int8x8_t)v66;
              if (*(_QWORD *)&prime >= v48)
              {
                v48 = i[10];
              }
              else
              {
                if (prime)
                {
LABEL_118:
                  if (*(_QWORD *)&prime >> 61)
                    std::__throw_bad_array_new_length[abi:nn180100]();
                  v60 = operator new(8 * *(_QWORD *)&prime);
                  v61 = (void *)i[9];
                  i[9] = (uint64_t)v60;
                  if (v61)
                    operator delete(v61);
                  v62 = 0;
                  i[10] = (uint64_t)prime;
                  do
                    *(_QWORD *)(i[9] + 8 * v62++) = 0;
                  while (*(_QWORD *)&prime != v62);
                  v63 = (_QWORD *)*v53;
                  if (*v53)
                  {
                    v64 = v63[1];
                    v65 = (uint8x8_t)vcnt_s8(prime);
                    v65.i16[0] = vaddlv_u8(v65);
                    if (v65.u32[0] > 1uLL)
                    {
                      if (v64 >= *(_QWORD *)&prime)
                        v64 %= *(_QWORD *)&prime;
                    }
                    else
                    {
                      v64 &= *(_QWORD *)&prime - 1;
                    }
                    *(_QWORD *)(i[9] + 8 * v64) = v53;
                    v69 = (_QWORD *)*v63;
                    if (*v63)
                    {
                      do
                      {
                        v70 = v69[1];
                        if (v65.u32[0] > 1uLL)
                        {
                          if (v70 >= *(_QWORD *)&prime)
                            v70 %= *(_QWORD *)&prime;
                        }
                        else
                        {
                          v70 &= *(_QWORD *)&prime - 1;
                        }
                        if (v70 != v64)
                        {
                          v71 = i[9];
                          if (!*(_QWORD *)(v71 + 8 * v70))
                          {
                            *(_QWORD *)(v71 + 8 * v70) = v63;
                            goto LABEL_143;
                          }
                          *v63 = *v69;
                          *v69 = **(_QWORD **)(i[9] + 8 * v70);
                          **(_QWORD **)(i[9] + 8 * v70) = v69;
                          v69 = v63;
                        }
                        v70 = v64;
LABEL_143:
                        v63 = v69;
                        v69 = (_QWORD *)*v69;
                        v64 = v70;
                      }
                      while (v69);
                    }
                  }
                  v48 = (unint64_t)prime;
                  goto LABEL_147;
                }
                v88 = (void *)i[9];
                i[9] = 0;
                if (v88)
                  operator delete(v88);
                v48 = 0;
                i[10] = 0;
              }
            }
LABEL_147:
            if ((v48 & (v48 - 1)) != 0)
            {
              if (v48 <= a8)
                v15 = a8 % v48;
              else
                v15 = a8;
            }
            else
            {
              v15 = ((_DWORD)v48 - 1) & a8;
            }
            goto LABEL_152;
          }
          v47 = *(_QWORD *)(*i + 8);
          if ((v21 & (v21 - 1)) != 0)
          {
            if (v47 >= v21)
              v47 %= v21;
          }
          else
          {
            v47 &= v21 - 1;
          }
          v46 = (_QWORD *)(*(_QWORD *)a4 + 8 * v47);
        }
        *v46 = i;
        goto LABEL_89;
      }
      v32 = (v21 & (v21 - 1)) != 0;
      if (v21 < 3)
        v32 = 1;
      v33 = v32 | (2 * v21);
      v34 = vcvtps_u32_f32(v30 / v31);
      if (v33 <= v34)
        v15 = v34;
      else
        v15 = v33;
      if (v15 == 1)
      {
        v15 = 2;
      }
      else if ((v15 & (v15 - 1)) != 0)
      {
        v15 = std::__next_prime(v15);
      }
      v21 = *((_QWORD *)a4 + 1);
      if (v15 > v21)
        goto LABEL_46;
      if (v15 < v21)
      {
        v41 = vcvtps_u32_f32((float)*((unint64_t *)a4 + 3) / *((float *)a4 + 8));
        if (v21 < 3 || (v42 = (uint8x8_t)vcnt_s8((int8x8_t)v21), v42.i16[0] = vaddlv_u8(v42), v42.u32[0] > 1uLL))
        {
          v41 = std::__next_prime(v41);
        }
        else
        {
          v43 = 1 << -(char)__clz(v41 - 1);
          if (v41 >= 2)
            v41 = v43;
        }
        if (v15 <= v41)
          v15 = v41;
        if (v15 >= v21)
        {
          v21 = *((_QWORD *)a4 + 1);
        }
        else
        {
          if (v15)
          {
LABEL_46:
            if (v15 >> 61)
              std::__throw_bad_array_new_length[abi:nn180100]();
            v35 = operator new(8 * v15);
            v36 = *(void **)a4;
            *(_QWORD *)a4 = v35;
            if (v36)
              operator delete(v36);
            v37 = 0;
            *((_QWORD *)a4 + 1) = v15;
            do
              *(_QWORD *)(*(_QWORD *)a4 + 8 * v37++) = 0;
            while (v15 != v37);
            v38 = (_QWORD *)*v95;
            if (*v95)
            {
              v39 = v38[1];
              v40 = (uint8x8_t)vcnt_s8((int8x8_t)v15);
              v40.i16[0] = vaddlv_u8(v40);
              if (v40.u32[0] > 1uLL)
              {
                if (v39 >= v15)
                  v39 %= v15;
              }
              else
              {
                v39 &= v15 - 1;
              }
              *(_QWORD *)(*(_QWORD *)a4 + 8 * v39) = v95;
              v44 = (_QWORD *)*v38;
              if (*v38)
              {
                do
                {
                  v45 = v44[1];
                  if (v40.u32[0] > 1uLL)
                  {
                    if (v45 >= v15)
                      v45 %= v15;
                  }
                  else
                  {
                    v45 &= v15 - 1;
                  }
                  if (v45 != v39)
                  {
                    if (!*(_QWORD *)(*(_QWORD *)a4 + 8 * v45))
                    {
                      *(_QWORD *)(*(_QWORD *)a4 + 8 * v45) = v38;
                      goto LABEL_71;
                    }
                    *v38 = *v44;
                    *v44 = **(_QWORD **)(*(_QWORD *)a4 + 8 * v45);
                    **(_QWORD **)(*(_QWORD *)a4 + 8 * v45) = v44;
                    v44 = v38;
                  }
                  v45 = v39;
LABEL_71:
                  v38 = v44;
                  v44 = (_QWORD *)*v44;
                  v39 = v45;
                }
                while (v44);
              }
            }
            v21 = v15;
            goto LABEL_75;
          }
          v87 = *(void **)a4;
          *(_QWORD *)a4 = 0;
          if (v87)
            operator delete(v87);
          v21 = 0;
          *((_QWORD *)a4 + 1) = 0;
        }
      }
LABEL_75:
      if ((v21 & (v21 - 1)) != 0)
      {
        if (v20 >= v21)
          v12 = v20 % v21;
        else
          v12 = v20;
      }
      else
      {
        v12 = (v21 - 1) & v20;
      }
      goto LABEL_80;
    }
    NSLog(CFSTR("Empty Path"), a2);
    v16 = *(unsigned __int8 *)(v15 + 23);
    goto LABEL_7;
  }
}

- (id)_processPerLineCostDataForLineTable:(void *)a3 withFileCost:(void *)a4 withDebugInfo:(void *)a5 andAllDrawCost:(double)a6 withKey:(id)a7 withShaderSourcePath:(id)a8 withDrawCost:(void *)a9
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  unint64_t v17;
  uint64_t **v18;
  uint64_t *v19;
  unsigned int *v20;
  uint64_t *v21;
  unsigned int v22;
  uint64_t **v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t **v26;
  unsigned int v27;
  uint64_t **v28;
  unsigned int v29;
  uint64_t **v30;
  uint64_t **v31;
  unsigned int v32;
  _DWORD *v33;
  uint64_t *v34;
  unsigned int v35;
  uint64_t **v36;
  uint64_t *v37;
  uint64_t **v38;
  unsigned int v39;
  unsigned int v40;
  std::string *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  std::string *v51;
  uint64_t *v52;
  uint64_t *v53;
  unint64_t v54;
  std::string::__raw *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  void *v63;
  uint64_t *v64;
  unint64_t v65;
  unint64_t v66;
  void *v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  id v73;
  id v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  char *v81;
  uint64_t v82;
  char *v83;
  void *v84;
  uint64_t v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  __int128 v89;
  id v90;
  id v91;
  id *v92;
  id *v93;
  char *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id *v98;
  void *v99;
  void *v100;
  unsigned int v101;
  uint64_t **v102;
  std::string *p_p;
  uint64_t v104;
  uint64_t *v105;
  uint64_t *v106;
  std::string *v107;
  std::string::size_type size;
  int8x8_t v109;
  uint8x8_t v110;
  unint64_t v111;
  double v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  unsigned __int8 **v119;
  std::string::size_type v120;
  std::string *v121;
  unsigned __int8 *v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  unsigned __int8 *v127;
  unint64_t v128;
  uint64_t v129;
  double *v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t v133;
  _QWORD *v134;
  uint64_t v135;
  unint64_t v136;
  uint64_t *v137;
  unint64_t v138;
  uint64_t v139;
  unint64_t v140;
  char *v141;
  uint64_t *v142;
  uint64_t v143;
  _QWORD *v144;
  _QWORD *v145;
  _QWORD *v146;
  _QWORD *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t *v152;
  uint64_t *v153;
  uint64_t **v154;
  BOOL v155;
  void *v156;
  uint64_t v157;
  uint64_t *i;
  _QWORD *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t *v167;
  double v168;
  const char **v169;
  int v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t *v182;
  uint64_t *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  uint64_t *v187;
  uint64_t *v188;
  uint64_t *v189;
  void *v190;
  uint64_t *v191;
  void *v192;
  const char *v193;
  const char *v194;
  void *v195;
  uint64_t *v196;
  void *v197;
  _QWORD *v198;
  void *v199;
  uint64_t *v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  void *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  id v230;
  void *v231;
  void *v232;
  id v233;
  uint64_t *j;
  void *v235;
  _QWORD *v236;
  _QWORD *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  double *k;
  void *v243;
  void *v244;
  void *v245;
  _BOOL4 v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  id v255;
  id v258;
  id v259;
  id v260;
  void *v261;
  id v262;
  void *v263;
  void *v264;
  void *v265;
  uint64_t **v266;
  void *v267;
  void *v270;
  uint64_t *v271;
  void *v272;
  unsigned int v274;
  uint64_t *v275;
  uint64_t v276;
  void *v277;
  int v278;
  uint64_t v279;
  uint64_t *v280;
  int v281;
  void *v282;
  uint64_t *v283;
  uint64_t *v284;
  uint64_t *v285;
  uint64_t v286;
  void *v287;
  uint64_t v288;
  uint64_t *v289;
  void *v290;
  FILE *__stream;
  uint64_t __streama;
  FILE *__streamb;
  std::string __p;
  _QWORD *v295[2];
  __int128 v296;
  __int128 v297;
  int v298;
  unsigned int v299;
  uint64_t **v300;
  uint64_t *v301;
  uint64_t v302;
  std::string v303[43];

  v258 = a7;
  v262 = a8;
  v264 = (void *)objc_opt_new(DYShaderAnalyzerResult, v12);
  v301 = 0;
  v302 = 0;
  v300 = &v301;
  v299 = 0;
  v15 = *(_QWORD *)a3;
  v14 = *((_QWORD *)a3 + 1);
  if (0xAAAAAAAAAAAAAAABLL * ((v14 - *(_QWORD *)a3) >> 3) >= 2)
  {
    v16 = 0;
    LODWORD(v17) = 1;
    v271 = (uint64_t *)a3;
    while (1)
    {
      v18 = (uint64_t **)(v15 + 24 * v16);
      v16 = v17;
      v19 = *v18;
      v280 = v18[1];
      if (*v18 != v280)
        break;
LABEL_88:
      v17 = v16 + 1;
      if (0xAAAAAAAAAAAAAAABLL * ((v14 - v15) >> 3) <= v17)
        goto LABEL_89;
    }
    v274 = v17;
    while (1)
    {
      v20 = *(unsigned int **)(*v19 + 56);
      v21 = v301;
      v22 = *v20;
      if (!v301)
        goto LABEL_14;
      v23 = &v301;
      v24 = v301;
      do
      {
        v25 = v24;
        v26 = v23;
        v27 = *((_DWORD *)v24 + 8);
        v28 = (uint64_t **)(v24 + 1);
        if (v27 >= v22)
        {
          v28 = (uint64_t **)v25;
          v23 = (uint64_t **)v25;
        }
        v24 = *v28;
      }
      while (v24);
      if (v23 == &v301)
        goto LABEL_14;
      if (v27 < v22)
        v25 = (uint64_t *)v26;
      if (v22 >= *((_DWORD *)v25 + 8))
      {
        v40 = v299;
        if (v299 <= v22)
          v40 = *v20;
        v299 = v40;
      }
      else
      {
LABEL_14:
        if (v299 > v22)
          v22 = v299;
        v299 = v22;
        v296 = 0uLL;
        *(_QWORD *)&v297 = 0;
        v29 = *v20;
        LODWORD(v303[0].__r_.__value_.__l.__data_) = *v20;
        memset(&v303[0].__r_.__value_.__r.__words[1], 0, sizeof(std::string));
        *(_QWORD *)&v297 = 0;
        v296 = 0uLL;
        v30 = &v301;
        v31 = &v301;
        if (v301)
        {
          while (1)
          {
            while (1)
            {
              v31 = (uint64_t **)v21;
              v32 = *((_DWORD *)v21 + 8);
              if (v29 >= v32)
                break;
              v21 = *v31;
              v30 = v31;
              if (!*v31)
                goto LABEL_23;
            }
            if (v32 >= v29)
              break;
            v21 = v31[1];
            if (!v21)
            {
              v30 = v31 + 1;
              goto LABEL_23;
            }
          }
        }
        else
        {
LABEL_23:
          v33 = operator new(0x40uLL);
          v33[8] = v29;
          *((_QWORD *)v33 + 6) = 0;
          *((_QWORD *)v33 + 7) = 0;
          *((_QWORD *)v33 + 5) = 0;
          memset(&v303[0].__r_.__value_.__r.__words[1], 0, sizeof(std::string));
          *(_QWORD *)v33 = 0;
          *((_QWORD *)v33 + 1) = 0;
          *((_QWORD *)v33 + 2) = v31;
          *v30 = (uint64_t *)v33;
          if (*v300)
          {
            v300 = (uint64_t **)*v300;
            v33 = *v30;
          }
          std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(v301, (uint64_t *)v33);
          ++v302;
        }
        std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>::~vector[abi:nn180100]((uint64_t *)&v303[0].__r_.__value_.__l.__size_);
        std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>::~vector[abi:nn180100]((uint64_t *)&v296);
        v34 = v301;
        v23 = &v301;
        if (v301)
        {
          v35 = **(_DWORD **)(*v19 + 56);
          v36 = &v301;
          do
          {
            v37 = v34;
            v38 = v36;
            v39 = *((_DWORD *)v34 + 8);
            if (v39 >= v35)
              v36 = (uint64_t **)v34;
            else
              ++v34;
            v34 = (uint64_t *)*v34;
          }
          while (v34);
          v23 = &v301;
          if (v36 != &v301)
          {
            if (v39 < v35)
              v37 = (uint64_t *)v38;
            v23 = v36;
            if (v35 < *((_DWORD *)v37 + 8))
              v23 = &v301;
          }
        }
      }
      memset(v303, 0, 48);
      v41 = (std::string *)v23[6];
      v42 = v23[7];
      if (v41 >= (std::string *)v42)
      {
        v44 = v23[5];
        v45 = 0xAAAAAAAAAAAAAAABLL * (((char *)v41 - (char *)v44) >> 4);
        v46 = v45 + 1;
        if (v45 + 1 > 0x555555555555555)
          abort();
        v47 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42 - (char *)v44) >> 4);
        if (2 * v47 > v46)
          v46 = 2 * v47;
        if (v47 >= 0x2AAAAAAAAAAAAAALL)
          v48 = 0x555555555555555;
        else
          v48 = v46;
        v49 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<DynamicBuffer>>(v48);
        v51 = (std::string *)&v49[48 * v45];
        v51->__r_.__value_.__r.__words[0] = 0;
        v51->__r_.__value_.__l.__size_ = 0;
        v51->__r_.__value_.__r.__words[2] = 0;
        *v51 = v303[0];
        memset(v303, 0, 24);
        v51[1].__r_.__value_.__r.__words[0] = 0;
        v51[1].__r_.__value_.__l.__size_ = 0;
        v51[1].__r_.__value_.__r.__words[2] = 0;
        v51[1] = v303[1];
        memset(&v303[1], 0, sizeof(std::string));
        v52 = v23[5];
        v53 = v23[6];
        if (v53 == v52)
        {
          v43 = (uint64_t *)&v51[2];
          v23[5] = (uint64_t *)v51;
          v23[6] = (uint64_t *)&v51[2];
          v23[7] = (uint64_t *)&v49[48 * v50];
          if (!v53)
            goto LABEL_55;
        }
        else
        {
          v54 = 0;
          do
          {
            v55 = (std::string::__raw *)&v51[v54 / 0x18];
            v56 = &v53[v54 / 8];
            v55[-2].__words[0] = 0;
            v55[-2].__words[1] = 0;
            v55[-2].__words[2] = 0;
            *(_OWORD *)v55[-2].__words = *(_OWORD *)&v53[v54 / 8 - 6];
            v55[-2].__words[2] = v53[v54 / 8 - 4];
            *(v56 - 6) = 0;
            *(v56 - 5) = 0;
            *(v56 - 4) = 0;
            v55[-1].__words[0] = 0;
            v55[-1].__words[1] = 0;
            v55[-1].__words[2] = 0;
            *(_OWORD *)v55[-1].__words = *(_OWORD *)&v53[v54 / 8 - 3];
            v55[-1].__words[2] = v53[v54 / 8 - 1];
            *(v56 - 3) = 0;
            *(v56 - 2) = 0;
            *(v56 - 1) = 0;
            v54 -= 48;
          }
          while (&v53[v54 / 8] != v52);
          v53 = v23[5];
          v57 = v23[6];
          v43 = (uint64_t *)&v51[2];
          v23[5] = (uint64_t *)&v51[v54 / 0x18];
          v23[6] = (uint64_t *)&v51[2];
          v23[7] = (uint64_t *)&v49[48 * v50];
          if (v57 != v53)
          {
            do
            {
              v58 = v57 - 6;
              *(_QWORD *)&v296 = v57 - 3;
              std::vector<DebugInfo::BlockInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)&v296);
              std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo>::~vector[abi:nn180100](v58);
              v57 = v58;
            }
            while (v58 != v53);
          }
          if (!v53)
            goto LABEL_55;
        }
        operator delete(v53);
      }
      else
      {
        v41->__r_.__value_.__r.__words[2] = 0;
        v41[1].__r_.__value_.__r.__words[0] = 0;
        v41->__r_.__value_.__r.__words[0] = 0;
        v41->__r_.__value_.__l.__size_ = 0;
        *v41 = v303[0];
        memset(v303, 0, 24);
        v41[1].__r_.__value_.__l.__size_ = 0;
        v41[1].__r_.__value_.__r.__words[2] = 0;
        v41[1] = v303[1];
        memset(&v303[1], 0, sizeof(std::string));
        v43 = (uint64_t *)&v41[2];
      }
LABEL_55:
      v23[6] = v43;
      *(_QWORD *)&v296 = &v303[1];
      std::vector<DebugInfo::BlockInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)&v296);
      std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo>::~vector[abi:nn180100]((uint64_t *)v303);
      v59 = *v19;
      v60 = (uint64_t)(v23[6] - 3);
      v284 = v19;
      if (v60 != *v19 + 56)
      {
        std::vector<DebugInfo::BlockInfo>::__assign_with_size[abi:nn180100]<DebugInfo::BlockInfo*,DebugInfo::BlockInfo*>(v60, *(_QWORD *)(v59 + 56), *(_QWORD *)(v59 + 64), 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(*(_QWORD *)(v59 + 64) - *(_QWORD *)(v59 + 56)) >> 3));
        v59 = *v19;
      }
      v61 = *(_QWORD *)(v59 + 32);
      __stream = *(FILE **)(v59 + 40);
      if ((FILE *)v61 != __stream)
      {
        v62 = *(_DWORD *)(v59 + 24);
        while (1)
        {
          v63 = *(void **)v61;
          if (*(_QWORD *)v61)
            break;
LABEL_79:
          ++v62;
          v61 += 40;
          if ((FILE *)v61 == __stream)
            goto LABEL_84;
        }
        v64 = v23[6];
        v66 = *(v64 - 5);
        v65 = *(v64 - 4);
        if (v66 < v65)
        {
          v67 = *(void **)(v61 + 8);
          v68 = *(_QWORD *)(v61 + 16);
          v69 = *(_DWORD *)(v61 + 24);
          v70 = *(unsigned int *)(v61 + 36);
          v71 = *(_QWORD *)(v61 + 28);
          *(_QWORD *)&v72 = v71;
          *((_QWORD *)&v72 + 1) = HIDWORD(v71);
          v73 = v63;
          v74 = v67;
          *(_QWORD *)v66 = v73;
          *(_QWORD *)(v66 + 8) = v74;
          *(_DWORD *)(v66 + 16) = v62;
          *(_DWORD *)(v66 + 20) = v69;
          *(_QWORD *)(v66 + 24) = v68;
          *(_OWORD *)(v66 + 32) = v72;
          v75 = (char *)(v66 + 56);
          *(_QWORD *)(v66 + 48) = v70;
LABEL_78:
          *(v64 - 5) = (uint64_t)v75;
          goto LABEL_79;
        }
        v76 = *(v64 - 6);
        v77 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v66 - v76) >> 3);
        v78 = v77 + 1;
        if ((unint64_t)(v77 + 1) > 0x492492492492492)
          abort();
        v79 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v65 - v76) >> 3);
        if (2 * v79 > v78)
          v78 = 2 * v79;
        if (v79 >= 0x249249249249249)
          v80 = 0x492492492492492;
        else
          v80 = v78;
        if (v80)
        {
          v81 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo>>(v80);
          v288 = v82;
          v63 = *(void **)v61;
        }
        else
        {
          v81 = 0;
          v288 = 0;
        }
        v83 = &v81[56 * v77];
        v84 = *(void **)(v61 + 8);
        v85 = *(_QWORD *)(v61 + 16);
        v86 = *(_DWORD *)(v61 + 24);
        v87 = *(unsigned int *)(v61 + 36);
        v88 = *(_QWORD *)(v61 + 28);
        *(_QWORD *)&v89 = v88;
        *((_QWORD *)&v89 + 1) = HIDWORD(v88);
        v90 = v63;
        v91 = v84;
        *(_QWORD *)v83 = v90;
        *((_QWORD *)v83 + 1) = v91;
        *((_DWORD *)v83 + 4) = v62;
        *((_DWORD *)v83 + 5) = v86;
        *((_QWORD *)v83 + 3) = v85;
        *((_OWORD *)v83 + 2) = v89;
        *((_QWORD *)v83 + 6) = v87;
        v92 = (id *)*(v64 - 6);
        v93 = (id *)*(v64 - 5);
        if (v93 == v92)
        {
          v75 = v83 + 56;
          *(v64 - 6) = (uint64_t)v83;
          *(v64 - 5) = (uint64_t)(v83 + 56);
          *(v64 - 4) = (uint64_t)&v81[56 * v288];
        }
        else
        {
          v94 = v83;
          do
          {
            v95 = *(_OWORD *)(v93 - 7);
            v93 -= 7;
            *v93 = 0;
            v93[1] = 0;
            *(_OWORD *)(v94 - 56) = v95;
            v94 -= 56;
            v96 = *((_OWORD *)v93 + 1);
            v97 = *((_OWORD *)v93 + 2);
            *((_QWORD *)v94 + 6) = v93[6];
            *((_OWORD *)v94 + 1) = v96;
            *((_OWORD *)v94 + 2) = v97;
          }
          while (v93 != v92);
          v93 = (id *)*(v64 - 6);
          v98 = (id *)*(v64 - 5);
          v75 = v83 + 56;
          *(v64 - 6) = (uint64_t)v94;
          *(v64 - 5) = (uint64_t)(v83 + 56);
          *(v64 - 4) = (uint64_t)&v81[56 * v288];
          if (v98 != v93)
          {
            do
            {

              v99 = *(v98 - 7);
              v98 -= 7;

            }
            while (v98 != v93);
            if (!v93)
              goto LABEL_78;
LABEL_77:
            operator delete(v93);
            goto LABEL_78;
          }
        }
        if (!v93)
          goto LABEL_78;
        goto LABEL_77;
      }
LABEL_84:
      v19 = v284 + 1;
      if (v284 + 1 == v280)
      {
        v15 = *v271;
        v14 = v271[1];
        v16 = v274;
        goto LABEL_88;
      }
    }
  }
LABEL_89:
  v296 = 0u;
  v297 = 0u;
  v298 = 1065353216;
  v295[0] = &v296;
  v295[1] = &v299;
  memset(&__p, 0, sizeof(__p));
  if (v262
    && (v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager")),
        v101 = objc_msgSend(v100, "fileExistsAtPath:", v262),
        v100,
        v101))
  {
    std::string::basic_string[abi:nn180100]<0>(v303, (char *)objc_msgSend(objc_retainAutorelease(v262), "UTF8String"));
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    __p = v303[0];
    -[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::$_2::operator()(v295, (uint64_t)&__p);
    v278 = 1;
  }
  else
  {
    v278 = 0;
  }
  v102 = v300;
  if (v300 == &v301)
    goto LABEL_173;
  p_p = &__p;
  if (!v278)
    p_p = v303;
  v276 = (uint64_t)p_p;
  do
  {
    v104 = v102[5][3];
    if (*(char *)(v104 + 103) < 0)
      std::string::__init_copy_ctor_external(v303, *(const std::string::value_type **)(v104 + 80), *(_QWORD *)(v104 + 88));
    else
      v303[0] = *(std::string *)(v104 + 80);
    if ((v278 & 1) == 0)
      -[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::$_2::operator()(v295, (uint64_t)v303);
    v106 = v102[5];
    v105 = v102[6];
    if (v106 == v105)
    {
      v112 = 0.0;
      goto LABEL_138;
    }
    if ((v303[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v107 = v303;
    else
      v107 = (std::string *)v303[0].__r_.__value_.__r.__words[0];
    if ((v303[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v303[0].__r_.__value_.__r.__words[2]);
    else
      size = v303[0].__r_.__value_.__l.__size_;
    v109 = *(int8x8_t *)((char *)a4 + 8);
    v286 = *(_QWORD *)a4;
    v110 = (uint8x8_t)vcnt_s8(v109);
    v110.i16[0] = vaddlv_u8(v110);
    v111 = v110.u32[0];
    __streama = *(_QWORD *)&v109 - 1;
    v281 = *((_DWORD *)a5 + 12);
    v112 = 0.0;
    v113 = v102[5];
    v289 = v102[6];
    do
    {
      v114 = *v113;
      v115 = v113[1];
      if (*v113 != v115)
      {
        do
        {
          v112 = v112 + *(double *)(v114 + 24);
          v114 += 56;
        }
        while (v114 != v115);
        goto LABEL_133;
      }
      v116 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t *)v107, size);
      if (!*(_QWORD *)&v109)
        goto LABEL_133;
      v117 = v116;
      if (v111 > 1)
      {
        v118 = v116;
        if (v116 >= *(_QWORD *)&v109)
          v118 = v116 % *(_QWORD *)&v109;
      }
      else
      {
        v118 = __streama & v116;
      }
      v119 = *(unsigned __int8 ***)(v286 + 8 * v118);
      if (!v119)
        goto LABEL_132;
      v120 = size;
      v121 = v107;
      v122 = *v119;
      if (!*v119)
      {
LABEL_131:
        v107 = v121;
        size = v120;
LABEL_132:
        v105 = v289;
        goto LABEL_133;
      }
      while (1)
      {
        v123 = *((_QWORD *)v122 + 1);
        if (v123 == v117)
          break;
        if (v111 > 1)
        {
          if (v123 >= *(_QWORD *)&v109)
            v123 %= *(_QWORD *)&v109;
        }
        else
        {
          v123 &= __streama;
        }
        if (v123 != v118)
          goto LABEL_131;
LABEL_130:
        v122 = *(unsigned __int8 **)v122;
        if (!v122)
          goto LABEL_131;
      }
      if (!std::equal_to<std::string>::operator()[abi:nn180100](v122 + 16, (unsigned __int8 *)v303))
        goto LABEL_130;
      v124 = *((_QWORD *)v122 + 5);
      v125 = *((_QWORD *)v122 + 6) - v124;
      v126 = *((_DWORD *)v102 + 8) - v281;
      v107 = v121;
      size = v120;
      v105 = v289;
      if (v126 < v125 >> 3)
        v112 = *(double *)(v124 + 8 * v126);
LABEL_133:
      v113 += 6;
    }
    while (v113 != v105);
LABEL_138:
    v127 = std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::find[abi:nn180100](&v296, v276);
    if (v127)
    {
      v128 = (*((_DWORD *)v102 + 8) - 1);
      v129 = *((_QWORD *)v127 + 5);
      if (0x6DB6DB6DB6DB6DB7 * ((*((_QWORD *)v127 + 6) - v129) >> 3) > v128)
      {
        v130 = (double *)(v129 + 56 * v128);
        *v130 = v112;
        v131 = (uint64_t *)(v130 + 4);
        if (v131 != (uint64_t *)(v102 + 5))
        {
          v132 = v129 + 56 * v128;
          v135 = *(_QWORD *)(v132 + 48);
          v134 = (_QWORD *)(v132 + 48);
          v133 = v135;
          v136 = 0xAAAAAAAAAAAAAAABLL * (((char *)v105 - (char *)v106) >> 4);
          v137 = (uint64_t *)*v131;
          if (0xAAAAAAAAAAAAAAABLL * ((v135 - *v131) >> 4) >= v136)
          {
            if (0xAAAAAAAAAAAAAAABLL
               * ((uint64_t)(*(_QWORD *)(v129 + 56 * v128 + 40) - (_QWORD)v137) >> 4) < v136)
            {
              v142 = &v106[2 * ((uint64_t)(*(_QWORD *)(v129 + 56 * v128 + 40) - (_QWORD)v137) >> 4)];
              std::__copy[abi:nn180100]<std::_ClassicAlgPolicy,-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo *,-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo *,-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo *>(v106, v142, v137);
              v106 = v142;
              goto LABEL_154;
            }
            v152 = std::__copy[abi:nn180100]<std::_ClassicAlgPolicy,-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo *,-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo *,-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo *>(v106, v105, v137);
            std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>::__base_destruct_at_end[abi:nn180100](v131, v152);
          }
          else
          {
            if (v137)
            {
              std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>::__base_destruct_at_end[abi:nn180100](v131, (uint64_t *)*v131);
              operator delete((void *)*v131);
              v133 = 0;
              *v131 = 0;
              v131[1] = 0;
              v131[2] = 0;
            }
            if (v136 > 0x555555555555555)
              goto LABEL_251;
            v138 = 0xAAAAAAAAAAAAAAABLL * (v133 >> 4);
            v139 = 2 * v138;
            if (2 * v138 <= v136)
              v139 = 0xAAAAAAAAAAAAAAABLL * (((char *)v105 - (char *)v106) >> 4);
            v140 = v138 >= 0x2AAAAAAAAAAAAAALL ? 0x555555555555555 : v139;
            if (v140 > 0x555555555555555)
LABEL_251:
              abort();
            v141 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<DynamicBuffer>>(v140);
            *(int64x2_t *)v131 = vdupq_n_s64((unint64_t)v141);
            *v134 = &v141[48 * v13];
LABEL_154:
            v143 = v129 + 56 * v128;
            v146 = *(_QWORD **)(v143 + 40);
            v144 = (_QWORD *)(v143 + 40);
            v145 = v146;
            if (v106 == v105)
            {
              v147 = v145;
            }
            else
            {
              v147 = v145;
              do
              {
                *v147 = 0;
                v147[1] = 0;
                v147[2] = 0;
                v148 = *v106;
                v149 = v106[1];
                if (v149 != *v106)
                {
                  std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo>::__vallocate[abi:nn180100](v147, 0x6DB6DB6DB6DB6DB7 * ((v149 - *v106) >> 3));
                  std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo>::__construct_at_end<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo*,-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo*>(v147, v148, v149);
                }
                v147[3] = 0;
                v147[4] = 0;
                v147[5] = 0;
                v150 = v106[3];
                v151 = v106[4];
                if (v151 != v150)
                {
                  std::vector<DebugInfo::BlockInfo>::__vallocate[abi:nn180100](v147 + 3, 0x4EC4EC4EC4EC4EC5 * ((v151 - v150) >> 3));
                  std::vector<DebugInfo::BlockInfo>::__construct_at_end<DebugInfo::BlockInfo*,DebugInfo::BlockInfo*>((uint64_t)(v147 + 3), v150, v151);
                }
                v147 += 6;
                v106 += 6;
              }
              while (v106 != v105);
            }
            *v144 = v147;
          }
        }
      }
    }
    if (SHIBYTE(v303[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v303[0].__r_.__value_.__l.__data_);
    v153 = v102[1];
    if (v153)
    {
      do
      {
        v154 = (uint64_t **)v153;
        v153 = (uint64_t *)*v153;
      }
      while (v153);
    }
    else
    {
      do
      {
        v154 = (uint64_t **)v102[2];
        v155 = *v154 == (uint64_t *)v102;
        v102 = v154;
      }
      while (!v155);
    }
    v102 = v154;
  }
  while (v154 != &v301);
LABEL_173:
  v272 = (void *)objc_opt_new(NSMutableArray, v13);
  v156 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")));
  v270 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "invertedSet"));

  for (i = (uint64_t *)v297; i; i = (uint64_t *)*i)
  {
    v159 = i + 2;
    if (*((char *)i + 39) < 0)
      v159 = (_QWORD *)*v159;
    v160 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v159));
    v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "lastPathComponent"));
    v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v161, "stringByDeletingPathExtension"));

    v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "componentsSeparatedByCharactersInSet:", v270));
    v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "componentsJoinedByString:", &stru_7282A8));

    objc_msgSend(v272, "addObject:", v164);
  }
  v261 = (void *)objc_opt_new(NSMutableDictionary, v157);
  v260 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "componentsJoinedByString:", CFSTR("_"))));
  v165 = (const char *)objc_msgSend(v260, "UTF8String");
  v259 = objc_retainAutorelease(v258);
  snprintf((char *)v303, 0x400uLL, "/tmp/com.apple.gputools.profiling/shaderProfilerResults/shader_cost_%s_%s.txt", v165, (const char *)objc_msgSend(v259, "UTF8String"));
  __streamb = fopen((const char *)v303, "w");
  v263 = (void *)objc_opt_new(NSMutableDictionary, v166);
  objc_msgSend(v261, "setObject:forKeyedSubscript:");
  v167 = (uint64_t *)v297;
  v168 = 100.0 / (a6 + 2.22507386e-308);
  if ((_QWORD)v297)
  {
    do
    {
      v169 = (const char **)(v167 + 2);
      v266 = (uint64_t **)v167;
      v170 = *((char *)v167 + 39);
      v171 = (const char *)(v167 + 2);
      if (v170 < 0)
        v171 = *v169;
      fprintf(__streamb, "%s\n", v171);
      v267 = (void *)objc_opt_new(NSMutableDictionary, v172);
      if (*((char *)v266 + 39) < 0)
        v169 = (const char **)*v169;
      v265 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v169));
      objc_msgSend(v263, "setObject:forKeyedSubscript:", v267);
      v277 = (void *)objc_opt_new(NSMutableArray, v173);
      objc_msgSend(v267, "setObject:forKeyedSubscript:");
      v283 = v266[5];
      v275 = v266[6];
      if (v283 != v275)
      {
        v279 = 1;
        do
        {
          v282 = (void *)objc_opt_new(NSMutableDictionary, v174);
          objc_msgSend(v277, "addObject:");
          v175 = (uint64_t)(v283 + 1);
          if (*((char *)v283 + 31) < 0)
            v175 = v283[1];
          v176 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v175));
          objc_msgSend(v282, "setObject:forKeyedSubscript:", v176, CFSTR("source"));

          v177 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v279));
          objc_msgSend(v282, "setObject:forKeyedSubscript:", v177, CFSTR("line"));

          v178 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)v283));
          objc_msgSend(v282, "setObject:forKeyedSubscript:", v178, CFSTR("cost"));

          v179 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v168 * *(double *)v283));
          objc_msgSend(v282, "setObject:forKeyedSubscript:", v179, CFSTR("percent"));

          if (*(double *)v283 <= 2.22507386e-308)
            fprintf(__streamb, "%u: %s\n");
          else
            fprintf(__streamb, "%u: %s      %.1f %.2f%%\n");
          v287 = (void *)objc_opt_new(NSMutableArray, v180);
          objc_msgSend(v282, "setObject:forKeyedSubscript:");
          v183 = (uint64_t *)v283[4];
          v182 = (uint64_t *)v283[5];
          v285 = v182;
          while (v183 != v182)
          {
            v290 = (void *)objc_opt_new(NSMutableDictionary, v181);
            v186 = (void *)objc_opt_new(NSMutableArray, v184);
            v187 = (uint64_t *)v183[3];
            v188 = (uint64_t *)v183[4];
            if (v187 != v188)
            {
              v189 = v187 + 7;
              do
              {
                v190 = (void *)objc_opt_new(NSMutableDictionary, v185);
                v191 = v189 - 7;
                v192 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)v189 - 14)));
                objc_msgSend(v190, "setObject:forKeyedSubscript:", v192, CFSTR("lineIndex"));

                v193 = (const char *)(v189 - 3);
                v194 = (const char *)(v189 - 3);
                if (*((char *)v189 - 1) < 0)
                  v194 = *(const char **)v193;
                v195 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v194));
                objc_msgSend(v190, "setObject:forKeyedSubscript:", v195, CFSTR("function"));

                v196 = v189;
                if (*((char *)v189 + 23) < 0)
                  v196 = (uint64_t *)*v189;
                v197 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v196));
                objc_msgSend(v190, "setObject:forKeyedSubscript:", v197, CFSTR("filename"));

                v198 = v189 + 3;
                if (*((char *)v189 + 47) < 0)
                  v198 = (_QWORD *)*v198;
                v199 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v198));
                objc_msgSend(v190, "setObject:forKeyedSubscript:", v199, CFSTR("fullpath"));

                v200 = v189 - 6;
                if (*((char *)v189 - 25) < 0)
                  v200 = (uint64_t *)*v200;
                v201 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v200));
                objc_msgSend(v190, "setObject:forKeyedSubscript:", v201, CFSTR("directory"));

                if (*((char *)v189 - 1) < 0)
                  v193 = *(const char **)v193;
                v202 = (const char *)v189;
                if (*((char *)v189 + 23) < 0)
                  v202 = (const char *)*v189;
                fprintf(__streamb, "      -----> %u:  %s : %s\n", *(_DWORD *)v191, v193, v202);
                objc_msgSend(v186, "addObject:", v190);

                v189 += 13;
              }
              while (v191 + 13 != v188);
            }
            if (objc_msgSend(v186, "count"))
              objc_msgSend(v290, "setObject:forKeyedSubscript:", v186, CFSTR("callstackInfos"));
            objc_msgSend(v287, "addObject:", v290);
            if (*v183 != v183[1])
            {
              v204 = (void *)objc_opt_new(NSMutableArray, v203);
              objc_msgSend(v290, "setObject:forKeyedSubscript:", v204, CFSTR("diassembly"));
              v206 = *v183;
              v207 = v183[1];
              if (*v183 != v207)
              {
                do
                {
                  v208 = (void *)objc_opt_new(NSMutableDictionary, v205);
                  objc_msgSend(v204, "addObject:", v208);
                  v209 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(v206 + 16)));
                  objc_msgSend(v208, "setObject:forKeyedSubscript:", v209, CFSTR("offset"));

                  objc_msgSend(v208, "setObject:forKeyedSubscript:", *(_QWORD *)v206, CFSTR("disasm"));
                  v210 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(v206 + 24)));
                  objc_msgSend(v208, "setObject:forKeyedSubscript:", v210, CFSTR("cost"));

                  v211 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v168 * *(double *)(v206 + 24)));
                  objc_msgSend(v208, "setObject:forKeyedSubscript:", v211, CFSTR("percent"));

                  v206 += 56;
                }
                while (v206 != v207);
                v212 = *v183;
                v213 = v183[1];
                while (v212 != v213)
                {
                  v214 = *(void **)(v212 + 8);
                  if (*(double *)(v212 + 24) <= 2.22507386e-308)
                  {
                    objc_msgSend(v214, "UTF8String");
                    fprintf(__streamb, "    %d %s\n");
                  }
                  else
                  {
                    objc_msgSend(v214, "UTF8String");
                    fprintf(__streamb, "    %d %s %.1f %.2f%%\n");
                  }
                  v212 += 56;
                }
              }

            }
            v183 += 6;
            v182 = v285;
          }

          v279 = (v279 + 1);
          v283 += 7;
        }
        while (v283 != v275);
      }

      v167 = *v266;
    }
    while (*v266);
  }
  if (*((_QWORD *)a5 + 3) != *((_QWORD *)a5 + 4))
  {
    fwrite("\n----------- Full Binary Disassembly -----------\n", 0x31uLL, 1uLL, __streamb);
    v217 = (void *)objc_opt_new(NSMutableArray, v215);
    v218 = *((_QWORD *)a5 + 3);
    v219 = *((_QWORD *)a5 + 4);
    if (v218 != v219)
    {
      v220 = 0;
      do
      {
        if (*(_QWORD *)v218)
        {
          v221 = (void *)objc_opt_new(NSMutableDictionary, v216);
          v222 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v220));
          objc_msgSend(v221, "setObject:forKeyedSubscript:", v222, CFSTR("offset"));

          objc_msgSend(v221, "setObject:forKeyedSubscript:", *(_QWORD *)v218, CFSTR("disasmSource"));
          objc_msgSend(v221, "setObject:forKeyedSubscript:", *(_QWORD *)(v218 + 8), CFSTR("irSource"));
          v223 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(v218 + 16)));
          objc_msgSend(v221, "setObject:forKeyedSubscript:", v223, CFSTR("cost"));

          v224 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v168 * *(double *)(v218 + 16)));
          objc_msgSend(v221, "setObject:forKeyedSubscript:", v224, CFSTR("costPercentage"));

          v225 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(v218 + 28)));
          objc_msgSend(v221, "setObject:forKeyedSubscript:", v225, CFSTR("opcodeType"));

          v226 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(v218 + 32)));
          objc_msgSend(v221, "setObject:forKeyedSubscript:", v226, CFSTR("opcodeSubType"));

          v227 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(v218 + 36)));
          objc_msgSend(v221, "setObject:forKeyedSubscript:", v227, CFSTR("opcode"));

          objc_msgSend(v217, "addObject:", v221);
          v228 = *(void **)v218;
          if (*(double *)(v218 + 16) <= 2.22507386e-308)
          {
            objc_msgSend(v228, "UTF8String");
            fprintf(__streamb, "    %d %s\n");
          }
          else
          {
            objc_msgSend(v228, "UTF8String");
            fprintf(__streamb, "    %d %s %.1f %.2f%%\n");
          }

        }
        v220 = (v220 + 1);
        v218 += 40;
      }
      while (v218 != v219);
    }
    objc_msgSend(v261, "setObject:forKeyedSubscript:", v217, CFSTR("binaryDisassemblyInfo"));

  }
  fclose(__streamb);
  v229 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v261, 1, 0));
  if (v229)
  {
    snprintf((char *)v303, 0x400uLL, "/tmp/com.apple.gputools.profiling/shaderProfilerResults/json/shader_cost_%s_%s.json", (const char *)objc_msgSend(objc_retainAutorelease(v260), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v259), "UTF8String"));
    v230 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v229, 4);
    v231 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v303));
    objc_msgSend(v230, "writeToFile:atomically:encoding:error:", v231, 0, 4, 0);

  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::~unordered_map[abi:nn180100]((uint64_t)&v296);
  v232 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", *((_QWORD *)a4 + 3) == 0));
  objc_msgSend(v264, "setPerFileCost:", v232);
  v233 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v264, "setPerFileLineCostDictForCI:", v233);
  for (j = (uint64_t *)*((_QWORD *)a4 + 2); j; j = (uint64_t *)*j)
  {
    v235 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _createPerFileCostDictionaryWith:lineOffset:](self, "_createPerFileCostDictionaryWith:lineOffset:", j + 5, *((unsigned int *)a5 + 12)));
    v236 = j + 2;
    v237 = j + 2;
    if (*((char *)j + 39) < 0)
      v237 = (_QWORD *)*v236;
    v238 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v237));
    objc_msgSend(v232, "setObject:forKeyedSubscript:", v235, v238);

    v239 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _createPerFileLineCostDictionaryForCIWith:lineOffset:](self, "_createPerFileLineCostDictionaryForCIWith:lineOffset:", j + 5, *((unsigned int *)a5 + 12)));
    if (*((char *)j + 39) < 0)
      v236 = (_QWORD *)*v236;
    v240 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v236));
    objc_msgSend(v233, "setObject:forKeyedSubscript:", v239, v240);

  }
  objc_msgSend(v264, "setTotalCost:", a6);
  v241 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", *((_QWORD *)a9 + 3)));
  objc_msgSend(v264, "setDrawCallCost:", v241);
  for (k = (double *)*((_QWORD *)a9 + 2); k; k = *(double **)k)
  {
    v243 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", k[3]));
    v244 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)k + 4)));
    objc_msgSend(v241, "setObject:forKeyedSubscript:", v243, v244);

  }
  v245 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v264, "perFileCost"));
  v246 = objc_msgSend(v245, "count") == (char *)&dword_0 + 1;

  if (v246)
  {
    v247 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v264, "perFileCost"));
    v248 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v247, "allValues"));

    v249 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v248, "objectAtIndexedSubscript:", 0));
    v250 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v249, "objectForKeyedSubscript:", CFSTR("allDrawCall")));
    objc_msgSend(v264, "setTotalPerLineCost:", v250);

    v251 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v248, "objectAtIndexedSubscript:", 0));
    v252 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v251, "objectForKeyedSubscript:", CFSTR("perDrawCall")));
    objc_msgSend(v264, "setDrawCallPerLineCost:", v252);

    goto LABEL_247;
  }
  v253 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v264, "perFileCost"));
  v248 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v253, "objectForKeyedSubscript:", CFSTR("/program_source")));

  if (v248)
  {
    v254 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v248, "objectForKeyedSubscript:", CFSTR("allDrawCall")));
    objc_msgSend(v264, "setTotalPerLineCost:", v254);

    v251 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v248, "objectForKeyedSubscript:", CFSTR("perDrawCall")));
    objc_msgSend(v264, "setDrawCallPerLineCost:", v251);
LABEL_247:

  }
  v255 = v264;

  std::__tree<std::__value_type<unsigned int,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>>>>::destroy(v301);
  return v255;
}

- (id)_calculatePerLineCostWithSampleData:(id)a3 binary:(id)a4 targetIndex:(int)a5 withTextSegment:(id)a6 withKey:(id)a7 withShaderSourcePath:(id)a8 forDataMaster:(unsigned int)a9 withPerDrawLimiterData:(id)a10
{
  uint64_t v13;
  id v16;
  id v17;
  id v18;
  _BYTE *v19;
  _BYTE *v20;
  void *v21;
  id v22;
  char *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unsigned int *v28;
  double v29;
  unsigned int v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  double v34;
  int v35;
  double v36;
  void *v37;
  double v38;
  int v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  unsigned int v45;
  unsigned int v46;
  double v47;
  uint64_t v48;
  unsigned int v49;
  double *v50;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  _BYTE *v57;
  id v58;
  int v59;
  _OWORD v60[2];
  int v61;
  void *__p[2];
  _BYTE v63[24];
  uint64_t v64;
  __int128 v65;
  uint64_t v66;
  _BYTE v67[24];
  _QWORD v68[8];

  v13 = *(_QWORD *)&a5;
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v56 = a7;
  v55 = a8;
  v58 = a10;
  v54 = v17;
  -[GTShaderProfilerHelper _getDebugInfoForBinary:withTextSegment:forTargetIndex:](self, "_getDebugInfoForBinary:withTextSegment:forTargetIndex:", v17, v18, v13);
  v65 = 0uLL;
  v66 = 0;
  -[GTShaderProfilerHelper _getAddressAndLineTableForDebugInfo:](self, "_getAddressAndLineTableForDebugInfo:", v67);
  v20 = __p[0];
  v19 = __p[1];
  __p[1] = 0;
  *(_QWORD *)v63 = 0;
  __p[0] = 0;
  std::vector<std::vector<DebugInfo::LineEntry *>>::__vdeallocate((uint64_t *)&v65);
  v65 = *(_OWORD *)&v63[8];
  v66 = v64;
  *(_QWORD *)&v63[16] = 0;
  v64 = 0;
  *(_QWORD *)&v63[8] = 0;
  *(_QWORD *)&v60[0] = &v63[8];
  std::vector<std::vector<ProfileEvent>>::__destroy_vector::operator()[abi:nn180100]((void ***)v60);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  v21 = 0;
  if ((_QWORD)v65 != *((_QWORD *)&v65 + 1) && v20 != v19)
  {
    *(_OWORD *)__p = 0u;
    *(_OWORD *)v63 = 0u;
    *(_DWORD *)&v63[16] = 1065353216;
    memset(v60, 0, sizeof(v60));
    v61 = 1065353216;
    v22 = objc_retainAutorelease(v16);
    v57 = v20;
    v52 = v18;
    v53 = v16;
    v23 = (char *)objc_msgSend(v22, "bytes");
    v24 = (unint64_t)objc_msgSend(v22, "length");
    v26 = (v24 / 0x14);
    if ((v24 / 0x14))
    {
      v27 = (v19 - v20) >> 2;
      v28 = (unsigned int *)(v23 + 8);
      v29 = 0.0;
      while (1)
      {
        v30 = *(v28 - 1);
        v31 = *v28;
        v32 = *(v28 - 2);
        v59 = *(v28 - 2);
        if ((v13 & 0x80000000) == 0 || v30 == 3)
        {
          if ((v13 & 0x80000000) != 0)
          {
            v34 = 1.0;
LABEL_43:
            if (v27 <= v31)
              v49 = -1 - 1431655765 * ((*((_QWORD *)&v65 + 1) - (_QWORD)v65) >> 3);
            else
              v49 = *(_DWORD *)&v20[4 * v31];
            -[GTShaderProfilerHelper _ProcessLineList:forFileCostMap:forDebugInfo:andCost:forAddr:andDrawIndex:andTargetIndex:](self, "_ProcessLineList:forFileCostMap:forDebugInfo:andCost:forAddr:andDrawIndex:andTargetIndex:", (_QWORD)v65 + 24 * v49, __p, v67, v31, v32, v13, v34);
            v50 = (double *)std::__hash_table<std::__hash_value_type<unsigned int,double>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,double>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,double>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,double>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((float *)v60, v32, &v59);
            v29 = v29 + v34;
            v50[3] = v34 + v50[3];
            goto LABEL_47;
          }
          v33 = v68[0];
          if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v68[1] - v68[0]) >> 3) > v31)
          {
            LODWORD(v25) = v28[2];
            v34 = (double)v30 / (double)v25;
            if (v58 && (unint64_t)objc_msgSend(v58, "count") > v32)
            {
              v35 = *(_DWORD *)(v33 + 40 * v31 + 36);
              v36 = 1.0;
              switch(v35)
              {
                case 12:
                  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectAtIndexedSubscript:", v32));
                  -[GTShaderProfilerHelper _latencyAdjustmentFactorWithLimiterDataForDraw:forDataMaster:](self, "_latencyAdjustmentFactorWithLimiterDataForDraw:forDataMaster:", v37, a9);
                  goto LABEL_15;
                case 13:
                  goto LABEL_36;
                case 14:
                  if (*(_DWORD *)(v33 + 40 * v31 + 32) == 2)
                  {
                    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectAtIndexedSubscript:", v32));
                    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_738A90, "objectAtIndexedSubscript:", 2));
                  }
                  else
                  {
                    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectAtIndexedSubscript:", v32));
                    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_738A90, "objectAtIndexedSubscript:", 6));
                  }
                  goto LABEL_26;
                case 15:
                  if (*(_DWORD *)(v33 + 40 * v31 + 32) == 2)
                  {
                    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectAtIndexedSubscript:", v32));
                    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_738A90, "objectAtIndexedSubscript:", 3));
                  }
                  else
                  {
                    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectAtIndexedSubscript:", v32));
                    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_738A90, "objectAtIndexedSubscript:", 7));
                  }
LABEL_26:
                  -[GTShaderProfilerHelper _latencyAdjustmentFactorWithLimiterDataForDraw:forDataMaster:forLimiterType:](self, "_latencyAdjustmentFactorWithLimiterDataForDraw:forDataMaster:forLimiterType:", v37, a9, v40);
                  goto LABEL_34;
                case 16:
                  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectAtIndexedSubscript:", v32));
                  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_738A90, "objectAtIndexedSubscript:", 5));
                  -[GTShaderProfilerHelper _latencyAdjustmentFactorWithLimiterDataForDraw:forDataMaster:forLimiterType:](self, "_latencyAdjustmentFactorWithLimiterDataForDraw:forDataMaster:forLimiterType:", v37, a9, v40);
LABEL_34:
                  v36 = v41;

                  goto LABEL_35;
                default:
                  if (v35 == 54)
                  {
                    if ((*(_BYTE *)(v33 + 40 * v31 + 33) & 2) != 0)
                    {
                      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectAtIndexedSubscript:", v32));
                      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_738A90, "objectAtIndexedSubscript:", 4));
                      -[GTShaderProfilerHelper _latencyAdjustmentFactorWithLimiterDataForDraw:forDataMaster:forLimiterType:](self, "_latencyAdjustmentFactorWithLimiterDataForDraw:forDataMaster:forLimiterType:", v42, a9, v43);
                      v36 = v44;

                    }
                  }
                  else if (v35 == 52)
                  {
                    v39 = *(_DWORD *)(v33 + 40 * v31 + 32);
                    if (v39 == 256 || v39 == 128)
                    {
                      v36 = 0.0;
                    }
                    else if (v39 == 64)
                    {
                      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectAtIndexedSubscript:", v32));
                      -[GTShaderProfilerHelper _waitLatencyAdjustmentFactorWithLimiterDataForDraw:forDataMaster:](self, "_waitLatencyAdjustmentFactorWithLimiterDataForDraw:forDataMaster:", v37, a9);
LABEL_15:
                      v36 = v38;
LABEL_35:

                    }
                  }
LABEL_36:
                  v45 = *(v28 - 1);
                  if (v45)
                  {
                    v46 = v28[1];
                    if (!v46)
                      v46 = *(v28 - 1);
                    v47 = (double)v46 / (double)v45;
                  }
                  else
                  {
                    v47 = 1.0;
                  }
                  v34 = v36 * ((1.0 - v36) * (v34 * v47) + v34 * v36);
                  break;
              }
            }
            v48 = v33 + 40 * v31;
            *(double *)(v48 + 16) = v34 + *(double *)(v48 + 16);
            ++*(_DWORD *)(v48 + 24);
            v20 = v57;
            goto LABEL_43;
          }
          v20 = v57;
        }
LABEL_47:
        v28 += 5;
        if (!--v26)
          goto LABEL_51;
      }
    }
    v29 = 0.0;
LABEL_51:
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:](self, "_processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:", &v65, __p, v67, v56, v55, v60, v29));
    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v60);
    std::__hash_table<std::__hash_value_type<std::string,PerFileCost>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerFileCost>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerFileCost>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerFileCost>>>::~__hash_table((uint64_t)__p);
    v18 = v52;
    v16 = v53;
  }
  __p[0] = &v65;
  std::vector<std::vector<ProfileEvent>>::__destroy_vector::operator()[abi:nn180100]((void ***)__p);
  if (v20)
    operator delete(v20);
  __p[0] = v68;
  std::vector<DebugInfo::LineDisassemblyInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)__p);
  __p[0] = v67;
  std::vector<DebugInfo::LineEntry>::__destroy_vector::operator()[abi:nn180100]((void ***)__p);

  return v21;
}

- (id)_calculatePerLineCostWithSampleData:(id)a3 binary:(id)a4 targetIndex:(int)a5 withKey:(id)a6 withShaderSourcePath:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  FILE *v18;
  id v19;
  _BYTE *v20;
  _DWORD *v21;
  id v22;
  char *v23;
  unint64_t v24;
  uint64_t v25;
  double *v26;
  double v27;
  unint64_t v28;
  unsigned int v29;
  double v30;
  uint64_t v31;
  unsigned int v32;
  double *v33;
  void *v34;
  id v36;
  id v37;
  id v38;
  unsigned int v39;
  _OWORD v40[2];
  int v41;
  void *__p[2];
  _BYTE v43[24];
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  _BYTE v47[24];
  _QWORD v48[8];

  v9 = *(_QWORD *)&a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v38 = v12;
  if (g_runningInCI)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("In _calculatePerLineCostWithSampleData")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#CI-INFO# ")));

    v18 = __stdoutp;
    v19 = objc_retainAutorelease(v17);
    fprintf(v18, "#CI-INFO# %s\n", (const char *)objc_msgSend(v19, "UTF8String"));

    v12 = v38;
  }
  -[GTShaderProfilerHelper _getDebugInfoForBinary:withTextSegment:forTargetIndex:](self, "_getDebugInfoForBinary:withTextSegment:forTargetIndex:", v13, 0, v9);
  v45 = 0uLL;
  v46 = 0;
  -[GTShaderProfilerHelper _getAddressAndLineTableForDebugInfo:](self, "_getAddressAndLineTableForDebugInfo:", v47);
  v21 = __p[0];
  v20 = __p[1];
  __p[1] = 0;
  *(_QWORD *)v43 = 0;
  __p[0] = 0;
  std::vector<std::vector<DebugInfo::LineEntry *>>::__vdeallocate((uint64_t *)&v45);
  v45 = *(_OWORD *)&v43[8];
  v46 = v44;
  *(_QWORD *)&v43[16] = 0;
  v44 = 0;
  *(_QWORD *)&v43[8] = 0;
  *(_QWORD *)&v40[0] = &v43[8];
  std::vector<std::vector<ProfileEvent>>::__destroy_vector::operator()[abi:nn180100]((void ***)v40);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  v22 = objc_retainAutorelease(v12);
  v23 = (char *)objc_msgSend(v22, "bytes");
  v24 = (unint64_t)objc_msgSend(v22, "length");
  *(_OWORD *)__p = 0u;
  *(_OWORD *)v43 = 0u;
  *(_DWORD *)&v43[16] = 1065353216;
  memset(v40, 0, sizeof(v40));
  v41 = 1065353216;
  if ((_QWORD)v45 == *((_QWORD *)&v45 + 1))
  {
    v34 = 0;
  }
  else
  {
    v36 = v22;
    v37 = v15;
    if ((v24 & 0xFFFFFFFF0) != 0)
    {
      v25 = (v24 >> 4);
      v26 = (double *)(v23 + 8);
      v27 = 0.0;
      do
      {
        v28 = *((unsigned int *)v26 - 2);
        v29 = *((_DWORD *)v26 - 1) & 0xFFFFFFF;
        v39 = v29;
        v30 = *v26;
        if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v48[1] - v48[0]) >> 3) > v28)
        {
          v31 = v48[0] + 40 * v28;
          *(double *)(v31 + 16) = v30 + *(double *)(v31 + 16);
          ++*(_DWORD *)(v31 + 24);
        }
        if ((v20 - (_BYTE *)v21) >> 2 <= v28)
          v32 = -1 - 1431655765 * ((*((_QWORD *)&v45 + 1) - (_QWORD)v45) >> 3);
        else
          v32 = v21[v28];
        -[GTShaderProfilerHelper _ProcessLineList:forFileCostMap:forDebugInfo:andCost:forAddr:andDrawIndex:andTargetIndex:](self, "_ProcessLineList:forFileCostMap:forDebugInfo:andCost:forAddr:andDrawIndex:andTargetIndex:", (_QWORD)v45 + 24 * v32, __p, v47, v30);
        v33 = (double *)std::__hash_table<std::__hash_value_type<unsigned int,double>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,double>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,double>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,double>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((float *)v40, v29, &v39);
        v27 = v27 + v30;
        v33[3] = v30 + v33[3];
        v26 += 2;
        --v25;
      }
      while (v25);
    }
    else
    {
      v27 = 0.0;
    }
    v15 = v37;
    v22 = v36;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:](self, "_processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:", &v45, __p, v47, v14, v37, v40, v27));
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v40);
  std::__hash_table<std::__hash_value_type<std::string,PerFileCost>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerFileCost>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerFileCost>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerFileCost>>>::~__hash_table((uint64_t)__p);
  __p[0] = &v45;
  std::vector<std::vector<ProfileEvent>>::__destroy_vector::operator()[abi:nn180100]((void ***)__p);
  if (v21)
    operator delete(v21);
  __p[0] = v48;
  std::vector<DebugInfo::LineDisassemblyInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)__p);
  __p[0] = v47;
  std::vector<DebugInfo::LineEntry>::__destroy_vector::operator()[abi:nn180100]((void ***)__p);

  return v34;
}

- (id)_calculatePerDrawCallWithGRCSampleData:(id)a3 targetIndex:(int)a4
{
  id v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double *v9;
  double v10;
  double v11;
  double *v12;
  void *v13;
  void *v14;
  double *i;
  void *v16;
  void *v17;
  unsigned int v19;
  __int128 v20;
  __int128 v21;
  int v22;

  v20 = 0u;
  v21 = 0u;
  v22 = 1065353216;
  v4 = objc_retainAutorelease(a3);
  v5 = (char *)objc_msgSend(v4, "bytes");
  v6 = (unint64_t)objc_msgSend(v4, "length");
  if ((v6 & 0xFFFFFFFF0) != 0)
  {
    v8 = (v6 >> 4);
    v9 = (double *)(v5 + 8);
    v10 = 0.0;
    do
    {
      v19 = *((_DWORD *)v9 - 1) & 0xFFFFFFF;
      v11 = *v9;
      v12 = (double *)std::__hash_table<std::__hash_value_type<unsigned int,double>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,double>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,double>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,double>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((float *)&v20, v19, &v19);
      v10 = v10 + v11;
      v12[3] = v11 + v12[3];
      v9 += 2;
      --v8;
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }
  v13 = (void *)objc_opt_new(DYShaderAnalyzerResult, v7);
  objc_msgSend(v13, "setTotalCost:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", *((_QWORD *)&v21 + 1)));
  objc_msgSend(v13, "setDrawCallCost:", v14);
  for (i = (double *)v21; i; i = *(double **)i)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", i[3]));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)i + 4)));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, v17);

  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v20);

  return v13;
}

- (id)analyzedBinary:(id)a3 processedUscSamples:(id)a4 targetIndex:(int)a5 withKey:(id)a6 withShaderSourcePath:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v9 = *(_QWORD *)&a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend(v13, "length"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _calculatePerLineCostWithSampleData:binary:targetIndex:withKey:withShaderSourcePath:](self, "_calculatePerLineCostWithSampleData:binary:targetIndex:withKey:withShaderSourcePath:", v13, v12, v9, v14, v15));
    if (!v16)
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _calculatePerDrawCallWithGRCSampleData:targetIndex:](self, "_calculatePerDrawCallWithGRCSampleData:targetIndex:", v13, v9));
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)_analyzeShaderBinarySamplesForResult:(id)a3 forShaderKeyToSourcePath:(id)a4
{
  id v5;
  int v6;
  _QWORD v7[5];
  int v8;

  v5 = a3;
  v6 = MetalPluginTarget(self->_metalPluginName);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __88__GTShaderProfilerHelper__analyzeShaderBinarySamplesForResult_forShaderKeyToSourcePath___block_invoke;
  v7[3] = &unk_725450;
  v7[4] = self;
  v8 = v6;
  -[GTShaderProfilerHelper _visitAllShaderInfosInResult:usingBlock:](self, "_visitAllShaderInfosInResult:usingBlock:", v5, v7);

}

- (void)_calculatePerDrawCosts:(id)a3
{
  unsigned int v3;
  _OWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  _OWORD *v8;
  __int128 v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t i;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  int v25;
  uint64_t v26;
  void *j;
  uint64_t v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  unsigned int v40;
  unsigned int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  unsigned int v49;
  unsigned int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  unsigned int v58;
  unsigned int v59;
  uint64_t v60;
  unint64_t k;
  void *v62;
  void *v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  id v80;
  void *m;
  uint64_t v82;
  void *v83;
  void *v84;
  BOOL v85;
  void *v86;
  unsigned int v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  unsigned int v97;
  double v98;
  void *v99;
  void *v100;
  void *v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  unsigned int v107;
  double v108;
  void *v109;
  void *v110;
  void *v111;
  double v112;
  double v113;
  double v114;
  double v115;
  unsigned int v116;
  double v117;
  void *v118;
  void *v119;
  double v120;
  double v121;
  void *v122;
  void *v123;
  void *v124;
  double v125;
  double v126;
  void *v127;
  void *v128;
  void *v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  void *v136;
  double v137;
  float64x2_t v138;
  double v139;
  double v140;
  void *v141;
  BOOL v142;
  double v143;
  void *v144;
  id v145;
  unsigned int v146;
  uint64_t v147;
  double v148;
  void *n;
  uint64_t v150;
  void *v151;
  double v152;
  float64x2_t v153;
  void *v154;
  _BOOL4 v155;
  void *v156;
  _BOOL4 v157;
  void *v158;
  void *v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  unint64_t ii;
  void *v168;
  unsigned int v169;
  void *v170;
  id v171;
  uint64_t v172;
  id v173;
  void *v174;
  id v175;
  unsigned int v176;
  uint64_t v177;
  unsigned int v178;
  void *jj;
  uint64_t v180;
  void *v181;
  void *v182;
  BOOL v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  GTShaderProfilerHelper *v196;
  uint64_t v197;
  void *v198;
  void *v199;
  id v200;
  uint64_t v201;
  void *v202;
  id v203;
  id v204;
  void *obj;
  void *obja;
  id objb[2];
  void *objc;
  char *v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  float64x2_t v226;
  _OWORD v227[2];
  _QWORD *v228;
  _QWORD *v229;
  _QWORD *v230;
  _BYTE v231[128];
  _BYTE v232[128];
  _BYTE v233[128];
  _BYTE v234[128];

  v196 = self;
  v209 = (char *)a3;
  v3 = objc_msgSend(v209, "encoderCount");
  v4 = operator new(0x20uLL);
  *v4 = 0u;
  v4[1] = 0u;
  v229 = 0;
  v230 = 0;
  v228 = 0;
  if (v3)
  {
    v5 = std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v3);
    v228 = v5;
    v229 = v5;
    v230 = &v5[3 * v6];
    v7 = &v5[3 * v3];
    do
    {
      *v5 = 0;
      v5[1] = 0;
      v5[2] = 0;
      std::vector<NSString * {__strong}>::__vallocate[abi:nn180100](v5, 4uLL);
      v8 = (_OWORD *)v5[1];
      v9 = v4[1];
      *v8 = *v4;
      v8[1] = v9;
      v5[1] = v8 + 2;
      v5 += 3;
    }
    while (v5 != v7);
    v229 = v7;
  }
  operator delete(v4);
  v199 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "loadActionTimes"));
  v198 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "storeActionTimes"));
  v10 = objc_msgSend(v199, "count");
  if (v10 == (id)objc_msgSend(v209, "encoderCount"))
  {
    v11 = objc_msgSend(v198, "count");
    if (v11 == (id)objc_msgSend(v209, "encoderCount"))
    {
      v12 = 0;
      for (i = 0; i < objc_msgSend(v209, "encoderCount", v196); ++i)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "objectAtIndexedSubscript:", i));
        v15 = v14;
        if (v14)
        {
          objc_msgSend(v14, "timing");
          v16 = v226.f64[0];
        }
        else
        {
          memset(v227, 0, sizeof(v227));
          v16 = 0.0;
          v226 = 0u;
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "objectAtIndexedSubscript:", i));
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "timing");
          v19 = v226.f64[0];
        }
        else
        {
          memset(v227, 0, sizeof(v227));
          v19 = 0.0;
          v226 = 0u;
        }

        v20 = v228[v12];
        *(double *)(v20 + 8) = v16 + v19 + *(double *)(v20 + 8);
        *(double *)(v20 + 24) = v16 + v19 + *(double *)(v20 + 24);
        v12 += 3;
      }
    }
  }
  objc_msgSend(v209, "shaderProfilingTime", v196);
  v22 = v21;
  v224 = 0u;
  v225 = 0u;
  v222 = 0u;
  v223 = 0u;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "drawCallInfoList"));
  obj = v23;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v222, v234, 16);
  if (v24)
  {
    v25 = 0;
    v26 = *(_QWORD *)v223;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(_QWORD *)v223 != v26)
          objc_enumerationMutation(obj);
        v28 = *(_QWORD *)(*((_QWORD *)&v222 + 1) + 8 * (_QWORD)j);
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v28, "programInfo"));
        if (v29
          && (v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v28, "programInfo")),
              v31 = objc_msgSend(v30, "programId") == (id)-1,
              v30,
              v29,
              v31))
        {
          ++v25;
        }
        else
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)v28, "drawCallIndex") - v25));
          v33 = *(void **)(v28 + 8);
          if (v33 && objc_msgSend(v33, "length"))
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v209 + 30), "objectForKeyedSubscript:", *(_QWORD *)(v28 + 8)));
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "analyzerResult"));

            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "drawCallCost"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", v32));
            objc_msgSend(v37, "doubleValue");
            v39 = v38;

            *(double *)(v28 + 40) = v39;
            *(double *)(v28 + 48) = v39;
            *(double *)(v28 + 56) = v39;
            *(float64x2_t *)(v28 + 184) = vaddq_f64(*(float64x2_t *)(v28 + 40), *(float64x2_t *)(v28 + 184));
            *(double *)(v28 + 200) = v39 + *(double *)(v28 + 200);
            v40 = objc_msgSend((id)v28, "encoderIndex");
            *(double *)v228[3 * v40] = v39 + *(double *)v228[3 * v40];
            v41 = objc_msgSend((id)v28, "encoderIndex");
            *(double *)(v228[3 * v41] + 24) = v39 + *(double *)(v228[3 * v41] + 24);

          }
          v42 = *(void **)(v28 + 16);
          if (v42 && objc_msgSend(v42, "length"))
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v209 + 31), "objectForKeyedSubscript:", *(_QWORD *)(v28 + 16)));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "analyzerResult"));

            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "drawCallCost"));
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", v32));
            objc_msgSend(v46, "doubleValue");
            v48 = v47;

            *(double *)(v28 + 88) = v48;
            *(double *)(v28 + 96) = v48;
            *(double *)(v28 + 104) = v48;
            *(float64x2_t *)(v28 + 184) = vaddq_f64(*(float64x2_t *)(v28 + 88), *(float64x2_t *)(v28 + 184));
            *(double *)(v28 + 200) = v48 + *(double *)(v28 + 200);
            v49 = objc_msgSend((id)v28, "encoderIndex");
            *(double *)(v228[3 * v49] + 8) = v48 + *(double *)(v228[3 * v49] + 8);
            v50 = objc_msgSend((id)v28, "encoderIndex");
            *(double *)(v228[3 * v50] + 24) = v48 + *(double *)(v228[3 * v50] + 24);

          }
          v51 = *(void **)(v28 + 24);
          if (v51 && objc_msgSend(v51, "length"))
          {
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v209 + 32), "objectForKeyedSubscript:", *(_QWORD *)(v28 + 24)));
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "analyzerResult"));

            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "drawCallCost"));
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", v32));
            objc_msgSend(v55, "doubleValue");
            v57 = v56;

            *(double *)(v28 + 136) = v57;
            *(double *)(v28 + 144) = v57;
            *(double *)(v28 + 152) = v57;
            *(float64x2_t *)(v28 + 184) = vaddq_f64(*(float64x2_t *)(v28 + 136), *(float64x2_t *)(v28 + 184));
            *(double *)(v28 + 200) = v57 + *(double *)(v28 + 200);
            v58 = objc_msgSend((id)v28, "encoderIndex");
            *(double *)(v228[3 * v58] + 16) = v57 + *(double *)(v228[3 * v58] + 16);
            v59 = objc_msgSend((id)v28, "encoderIndex");
            *(double *)(v228[3 * v59] + 24) = v57 + *(double *)(v228[3 * v59] + 24);

          }
          *(float64x2_t *)(v209 + 8) = vaddq_f64(*(float64x2_t *)(v28 + 40), *(float64x2_t *)(v209 + 8));
          *((double *)v209 + 3) = *(double *)(v28 + 56) + *((double *)v209 + 3);
          *(float64x2_t *)(v209 + 56) = vaddq_f64(*(float64x2_t *)(v28 + 88), *(float64x2_t *)(v209 + 56));
          *((double *)v209 + 9) = *(double *)(v28 + 104) + *((double *)v209 + 9);
          *(float64x2_t *)(v209 + 104) = vaddq_f64(*(float64x2_t *)(v28 + 136), *(float64x2_t *)(v209 + 104));
          *((double *)v209 + 15) = *(double *)(v28 + 152) + *((double *)v209 + 15);
          *(float64x2_t *)(v209 + 152) = vaddq_f64(*(float64x2_t *)(v28 + 184), *(float64x2_t *)(v209 + 152));
          *((double *)v209 + 21) = *(double *)(v28 + 200) + *((double *)v209 + 21);

        }
      }
      v23 = obj;
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v222, v234, 16);
    }
    while (v24);
  }

  v60 = 0;
  for (k = 0; k < objc_msgSend(v209, "encoderCount"); ++k)
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "objectAtIndexedSubscript:", k));
    v63 = v62;
    if (v62)
    {
      objc_msgSend(v62, "timing");
    }
    else
    {
      memset(v227, 0, sizeof(v227));
      v226 = 0u;
    }
    v64 = *(double *)(v228[v60] + 8);
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "effectiveKickTimes"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectAtIndexedSubscript:", k));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectAtIndexedSubscript:", 1));
    objc_msgSend(v67, "doubleValue");
    if (v64 != 0.0)
    {
      v69 = v68 / 1000000000.0;
      if (v69 != 0.0)
      {
        v70 = v69 / v64;
        *(float64x2_t *)((char *)v227 + 8) = vmulq_n_f64(v226, v70);
        *((double *)&v227[1] + 1) = v70 * *(double *)v227;
      }
    }

    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "objectAtIndexedSubscript:", k));
    v72 = v71;
    if (v71)
    {
      objc_msgSend(v71, "timing");
    }
    else
    {
      memset(v227, 0, sizeof(v227));
      v226 = 0u;
    }
    v73 = *(double *)(v228[v60] + 8);
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "effectiveKickTimes"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "objectAtIndexedSubscript:", k));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectAtIndexedSubscript:", 1));
    objc_msgSend(v76, "doubleValue");
    if (v73 != 0.0)
    {
      v78 = v77 / 1000000000.0;
      if (v78 != 0.0)
      {
        v79 = v78 / v73;
        *(float64x2_t *)((char *)v227 + 8) = vmulq_n_f64(v226, v79);
        *((double *)&v227[1] + 1) = v79 * *(double *)v227;
      }
    }

    v60 += 3;
  }
  v220 = 0u;
  v221 = 0u;
  v218 = 0u;
  v219 = 0u;
  v200 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "drawCallInfoList"));
  v80 = objc_msgSend(v200, "countByEnumeratingWithState:objects:count:", &v218, v233, 16);
  if (v80)
  {
    v201 = *(_QWORD *)v219;
    do
    {
      v203 = v80;
      for (m = 0; m != v203; m = (char *)m + 1)
      {
        if (*(_QWORD *)v219 != v201)
          objc_enumerationMutation(v200);
        v82 = *(_QWORD *)(*((_QWORD *)&v218 + 1) + 8 * (_QWORD)m);
        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v82, "programInfo"));
        if (v83)
        {
          v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v82, "programInfo"));
          v85 = objc_msgSend(v84, "programId") == (id)-1;

          if (v85)
            continue;
        }
        v86 = *(void **)(v82 + 8);
        if (v86 && objc_msgSend(v86, "length"))
        {
          v87 = objc_msgSend((id)v82, "encoderIndex");
          v88 = *(double *)v228[3 * v87];
          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "effectiveKickTimes"));
          v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectAtIndexedSubscript:", objc_msgSend((id)v82, "encoderIndex")));
          v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectAtIndexedSubscript:", 0));
          objc_msgSend(v91, "doubleValue");
          if (v88 != 0.0)
          {
            v93 = v92 / 1000000000.0;
            if (v93 != 0.0)
            {
              v94 = v93 / v88;
              v95 = v94 * *(double *)(v82 + 56);
              *(float64x2_t *)(v82 + 64) = vmulq_n_f64(*(float64x2_t *)(v82 + 40), v94);
              *(double *)(v82 + 80) = v95;
            }
          }

        }
        v96 = *(void **)(v82 + 16);
        if (v96 && objc_msgSend(v96, "length"))
        {
          v97 = objc_msgSend((id)v82, "encoderIndex");
          v98 = *(double *)(v228[3 * v97] + 8);
          v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "effectiveKickTimes"));
          v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "objectAtIndexedSubscript:", objc_msgSend((id)v82, "encoderIndex")));
          v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "objectAtIndexedSubscript:", 1));
          objc_msgSend(v101, "doubleValue");
          if (v98 != 0.0)
          {
            v103 = v102 / 1000000000.0;
            if (v103 != 0.0)
            {
              v104 = v103 / v98;
              v105 = v104 * *(double *)(v82 + 104);
              *(float64x2_t *)(v82 + 112) = vmulq_n_f64(*(float64x2_t *)(v82 + 88), v104);
              *(double *)(v82 + 128) = v105;
            }
          }

        }
        v106 = *(void **)(v82 + 24);
        if (v106 && objc_msgSend(v106, "length"))
        {
          v107 = objc_msgSend((id)v82, "encoderIndex");
          v108 = *(double *)(v228[3 * v107] + 16);
          v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "effectiveKickTimes"));
          v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "objectAtIndexedSubscript:", objc_msgSend((id)v82, "encoderIndex")));
          v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "objectAtIndexedSubscript:", 2));
          objc_msgSend(v111, "doubleValue");
          if (v108 != 0.0)
          {
            v113 = v112 / 1000000000.0;
            if (v113 != 0.0)
            {
              v114 = v113 / v108;
              v115 = v114 * *(double *)(v82 + 152);
              *(float64x2_t *)(v82 + 160) = vmulq_n_f64(*(float64x2_t *)(v82 + 136), v114);
              *(double *)(v82 + 176) = v115;
            }
          }

        }
        v116 = objc_msgSend((id)v82, "encoderIndex");
        v117 = *(double *)(v228[3 * v116] + 24);
        obja = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "effectiveKickTimes"));
        v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obja, "objectAtIndexedSubscript:", objc_msgSend((id)v82, "encoderIndex")));
        v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "objectAtIndexedSubscript:", 0));
        objc_msgSend(v119, "doubleValue");
        v121 = v120;
        v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "effectiveKickTimes"));
        v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "objectAtIndexedSubscript:", objc_msgSend((id)v82, "encoderIndex")));
        v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "objectAtIndexedSubscript:", 1));
        objc_msgSend(v124, "doubleValue");
        v126 = v125;
        v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "effectiveKickTimes"));
        v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "objectAtIndexedSubscript:", objc_msgSend((id)v82, "encoderIndex")));
        v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "objectAtIndexedSubscript:", 2));
        objc_msgSend(v129, "doubleValue");
        if (v117 != 0.0)
        {
          v131 = (v121 + v126 + v130) / 1000000000.0;
          if (v131 != 0.0)
          {
            v132 = v131 / v117;
            v133 = v132 * *(double *)(v82 + 200);
            *(float64x2_t *)(v82 + 208) = vmulq_n_f64(*(float64x2_t *)(v82 + 184), v132);
            *(double *)(v82 + 224) = v133;
          }
        }

      }
      v80 = objc_msgSend(v200, "countByEnumeratingWithState:objects:count:", &v218, v233, 16);
    }
    while (v80);
  }

  v134 = *((double *)v209 + 19);
  if (v134 == 0.0 || v22 / 1000000000.0 == 0.0)
  {
    objb[0] = *((id *)v209 + 19);
    v136 = v209;
    v138.f64[0] = *((float64_t *)v209 + 22);
  }
  else
  {
    v135 = v22 / 1000000000.0 / v134;
    v136 = v209;
    v137 = v135 * *((double *)v209 + 21);
    *(_OWORD *)objb = *(_OWORD *)(v209 + 152);
    v138 = vmulq_n_f64(*(float64x2_t *)objb, v135);
    *((float64x2_t *)v209 + 11) = v138;
    *((double *)v209 + 24) = v137;
  }
  v139 = v138.f64[0] * 1000000000.0;
  if (v139 >= 1.0)
    v140 = v139;
  else
    v140 = 1.0;
  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "blitTimeData"));
  v142 = v141 == 0;

  v143 = *(double *)objb / v140;
  if (v142)
  {
    v148 = 0.0;
  }
  else
  {
    v216 = 0u;
    v217 = 0u;
    v214 = 0u;
    v215 = 0u;
    v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "drawCallInfoList"));
    v145 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v214, v232, 16);
    if (v145)
    {
      v146 = 0;
      v147 = *(_QWORD *)v215;
      v148 = 0.0;
      do
      {
        for (n = 0; n != v145; n = (char *)n + 1)
        {
          if (*(_QWORD *)v215 != v147)
            objc_enumerationMutation(v144);
          v150 = *(_QWORD *)(*((_QWORD *)&v214 + 1) + 8 * (_QWORD)n);
          v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v150, "programInfo"));
          if (v151)
          {
            v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v150, "programInfo"));
            v155 = objc_msgSend(v154, "programId") == (id)-1;

            if (v155)
            {
              v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "blitTimeData"));
              v157 = (unint64_t)objc_msgSend(v156, "count") > v146;

              if (v157)
              {
                v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "blitTimeData"));
                v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "objectAtIndexedSubscript:", v146));
                objc_msgSend(v159, "doubleValue");
                v161 = v160;

                ++v146;
                v152 = v143 * v161;
                *(double *)(v150 + 184) = v143 * v161;
                *(double *)(v150 + 192) = v143 * v161;
                *(double *)(v150 + 200) = v143 * v161;
                v148 = v148 + v161;
                if (v143 * v161 != 0.0)
                {
                  v153.f64[0] = v161 / 1000000000.0;
                  if (v161 / 1000000000.0 != 0.0)
                  {
                    v162 = v153.f64[0] / v152;
                    v152 = v162 * v152;
                    v153 = vmulq_n_f64(*(float64x2_t *)(v150 + 184), v162);
                    *(float64x2_t *)(v150 + 208) = v153;
                    *(double *)(v150 + 224) = v152;
                  }
                }
              }
            }
          }
        }
        v145 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v214, v232, 16, v152, v153.f64[0]);
      }
      while (v145);
    }
    else
    {
      v148 = 0.0;
    }

  }
  v163 = v143 * v148 + *((double *)v209 + 19);
  *((double *)v209 + 19) = v163;
  *((double *)v209 + 20) = v163;
  *((double *)v209 + 21) = v163;
  objc_msgSend(v209, "gpuTime");
  if (v163 != 0.0 && v164 != 0.0)
  {
    v165 = v164 / v163;
    v166 = v165 * *((double *)v209 + 21);
    *((float64x2_t *)v209 + 11) = vmulq_n_f64(*(float64x2_t *)(v209 + 152), v165);
    *((double *)v209 + 24) = v166;
  }
  objc = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v209, "encoderCount")));
  v202 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v197 + 48), "objectForKeyedSubscript:", CFSTR("activePerEncoderDrawCallCount")));
  for (ii = 0; ii < (unint64_t)objc_msgSend(v202, "count"); ++ii)
  {
    v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "objectAtIndexedSubscript:", ii));
    v169 = objc_msgSend(v168, "unsignedIntValue");

    v170 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v169));
    v171 = objc_msgSend(&off_738AA8, "mutableCopy");
    objc_msgSend(v170, "addObject:", v171);

    if (v169 >= 2)
    {
      v172 = v169 - 1;
      do
      {
        v173 = objc_msgSend(&off_738AC0, "mutableCopy");
        objc_msgSend(v170, "addObject:", v173);

        --v172;
      }
      while (v172);
    }
    objc_msgSend(objc, "addObject:", v170);

  }
  v212 = 0u;
  v213 = 0u;
  v210 = 0u;
  v211 = 0u;
  v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "drawCallInfoList"));
  v204 = v174;
  v175 = objc_msgSend(v174, "countByEnumeratingWithState:objects:count:", &v210, v231, 16);
  if (v175)
  {
    v176 = 0;
    v177 = *(_QWORD *)v211;
    v178 = -1;
    do
    {
      for (jj = 0; jj != v175; jj = (char *)jj + 1)
      {
        if (*(_QWORD *)v211 != v177)
          objc_enumerationMutation(v204);
        v180 = *(_QWORD *)(*((_QWORD *)&v210 + 1) + 8 * (_QWORD)jj);
        v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v180, "programInfo"));
        if (v181)
        {
          v182 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v180, "programInfo"));
          v183 = objc_msgSend(v182, "programId") == (id)-1;

          if (v183)
            continue;
        }
        if (objc_msgSend((id)v180, "encoderIndex") == v178)
        {
          ++v176;
        }
        else
        {
          v178 = objc_msgSend((id)v180, "encoderIndex");
          v176 = 0;
        }
        if ((unint64_t)objc_msgSend(objc, "count") > v178)
        {
          v184 = *(void **)(v180 + 8);
          if (v184 && objc_msgSend(v184, "length"))
          {
            v185 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(v180 + 64) * 1000000000.0));
            v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objc, "objectAtIndexedSubscript:", v178));
            v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v186, "objectAtIndexedSubscript:", v176));
            objc_msgSend(v187, "setObject:atIndexedSubscript:", v185, 0);

          }
          v188 = *(void **)(v180 + 16);
          if (v188 && objc_msgSend(v188, "length"))
          {
            v189 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(v180 + 112) * 1000000000.0));
            v190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objc, "objectAtIndexedSubscript:", v178));
            v191 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "objectAtIndexedSubscript:", v176));
            objc_msgSend(v191, "setObject:atIndexedSubscript:", v189, 1);

          }
          v192 = *(void **)(v180 + 24);
          if (v192 && objc_msgSend(v192, "length"))
          {
            v193 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(v180 + 160) * 1000000000.0));
            v194 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objc, "objectAtIndexedSubscript:", v178));
            v195 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v194, "objectAtIndexedSubscript:", v176));
            objc_msgSend(v195, "setObject:atIndexedSubscript:", v193, 2);

          }
        }
      }
      v174 = v204;
      v175 = objc_msgSend(v204, "countByEnumeratingWithState:objects:count:", &v210, v231, 16);
    }
    while (v175);
  }

  objc_msgSend(v209, "setEffectivePerEncoderDrawKickTimes:", objc);
  *(_QWORD *)&v226.f64[0] = &v228;
  std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v226);

}

- (void)_handlePerDrawCounterData
{
  void *v3;
  void *v4;
  FILE *v5;
  id v6;
  DYMTLShaderProfilerResult *v7;
  void *v8;
  void *v9;
  FILE *v10;
  id v11;
  void *v12;
  unsigned int v13;
  id v14;
  id v15;
  id v16;
  id v17;
  unint64_t i;
  void *v19;
  void *v20;
  unsigned int v21;
  unint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  FILE *v30;
  int v31;
  id v32;
  const char *v33;
  const char *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  DYMTLShaderProfilerResult *v43;
  GTShaderProfilerHelper *v44;
  void *v45;
  void *v46;
  id v47;
  _QWORD v48[7];
  _QWORD v49[7];
  _QWORD v50[3];
  _QWORD v51[3];

  if ((*((_BYTE *)self->_options + 16) & 1) == 0)
  {
    -[GTShaderProfilerHelper _analyzeShaderBinarySamplesForResult:forShaderKeyToSourcePath:](self, "_analyzeShaderBinarySamplesForResult:forShaderKeyToSourcePath:", self->_streamingMTLResult, 0);
    -[GTShaderProfilerHelper _calculatePerDrawCosts:](self, "_calculatePerDrawCosts:", self->_streamingMTLResult);
    if ((*((_BYTE *)self->_options + 17) & 0x10) != 0)
    {
      v44 = self;
      if (g_runningInCI)
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("includePerDrawTimings now processing")));
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#CI-INFO# ")));

        v5 = __stdoutp;
        v6 = objc_retainAutorelease(v4);
        fprintf(v5, "#CI-INFO# %s\n", (const char *)objc_msgSend(v6, "UTF8String"));

      }
      v7 = v44->_streamingMTLResult;
      v43 = v7;
      if (g_runningInCI)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("includePerDrawTimings: strongSelf is %p, result is %p"), v44, v7));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#CI-INFO# ")));

        v10 = __stdoutp;
        v11 = objc_retainAutorelease(v9);
        fprintf(v10, "#CI-INFO# %s\n", (const char *)objc_msgSend(v11, "UTF8String"));

        v7 = v43;
      }
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[DYShaderProfilerResult effectivePerEncoderDrawKickTimes](v7, "effectivePerEncoderDrawKickTimes"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v44->_payload, "objectForKeyedSubscript:", CFSTR("totalDrawCount")));
      v13 = objc_msgSend(v12, "unsignedIntValue");

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v44->_payload, "objectForKeyedSubscript:", CFSTR("activePerEncoderDrawCallCount")));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v44->_payload, "objectForKeyedSubscript:", CFSTR("perEncoderKickCount")));
      v47 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v13);
      v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v13);
      v15 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v13);
      v16 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v13);
      v17 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v13);
      for (i = 0; i < (unint64_t)objc_msgSend(v46, "count"); ++i)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectAtIndexedSubscript:", i));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectAtIndexedSubscript:", i));
        v21 = objc_msgSend(v20, "unsignedIntValue");

        if (v21)
        {
          for (j = 0; j < (unint64_t)objc_msgSend(v19, "count"); ++j)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", j));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", 0));
            objc_msgSend(v47, "addObject:", v24);

            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", 1));
            objc_msgSend(v14, "addObject:", v25);

            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", 2));
            objc_msgSend(v15, "addObject:", v26);

            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", i));
            objc_msgSend(v16, "addObject:", v27);

            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", j));
            objc_msgSend(v17, "addObject:", v28);

          }
        }
        else if (objc_msgSend(v19, "count") != (char *)&dword_0 + 1)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Encoder %lu should be empty, expecting dummy draw call but found %lu"), i, objc_msgSend(v19, "count")));
          v30 = __stdoutp;
          v31 = g_runningInCI;
          v32 = objc_retainAutorelease(v29);
          v33 = (const char *)objc_msgSend(v32, "UTF8String");
          v34 = "#CI_ERROR# ";
          if (!v31)
            v34 = "";
          fprintf(v30, "%s%s %u: %s\n", v34, "-[GTShaderProfilerHelper _handlePerDrawCounterData]", 3296, v33);
          v35 = objc_retainAutorelease(v32);
          GTMTLReplay_handleError(101, (uint64_t)objc_msgSend(v35, "UTF8String"), "/Library/Caches/com.apple.xbs/Sources/GPUToolsDevice/GPUTools/GTMTLCapture/replayer/profile/GTShaderProfilerHelper.mm", (uint64_t)"-[GTShaderProfilerHelper _handlePerDrawCounterData]", 3296, 1);

        }
      }
      v50[0] = CFSTR("vertex");
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper convertBinaryInfoToJSONDictionary:](v44, "convertBinaryInfoToJSONDictionary:", v43->super._vertexShaderBinaryInfo));
      v51[0] = v36;
      v50[1] = CFSTR("fragment");
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper convertBinaryInfoToJSONDictionary:](v44, "convertBinaryInfoToJSONDictionary:", v43->super._fragmentShaderBinaryInfo));
      v51[1] = v37;
      v50[2] = CFSTR("compute");
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper convertBinaryInfoToJSONDictionary:](v44, "convertBinaryInfoToJSONDictionary:", v43->super._computeKernelBinaryInfo));
      v51[2] = v38;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v51, v50, 3));

      v48[0] = CFSTR("GPUTime_vtx");
      v48[1] = CFSTR("GPUTime_frg");
      v49[0] = v47;
      v49[1] = v14;
      v48[2] = CFSTR("GPUTime_cmp");
      v48[3] = CFSTR("encoder");
      v49[2] = v15;
      v49[3] = v16;
      v48[4] = CFSTR("drawIndexInEncoder");
      v48[5] = CFSTR("activePerEncoderDrawCallCount");
      v49[4] = v17;
      v49[5] = v45;
      v48[6] = CFSTR("perEncoderKickCount");
      v49[6] = v42;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v49, v48, 7));
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[DYShaderProfilerResult derivedCountersData](v43, "derivedCountersData"));
      -[GTShaderProfilerHelper _processDerivedEncoderCounterData:forDerivedEncoderData:withEffectivePerDrawKickTimes:withShaderInfo:](v44, "_processDerivedEncoderCounterData:forDerivedEncoderData:withEffectivePerDrawKickTimes:withShaderInfo:", v43, v41, v40, v39);

    }
  }
}

- (id)convertBinaryInfoToJSONDictionary:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v9, (_QWORD)v14));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "analyzerResult"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "perFileLineCostDictForCI"));

          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v9);
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

  }
  else
  {
    v4 = &__NSDictionary0__struct;
  }

  return v4;
}

- (void)processStreamingGRCData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __50__GTShaderProfilerHelper_processStreamingGRCData___block_invoke;
  v7[3] = &unk_725C20;
  objc_copyWeak(&v9, &location);
  v5 = v4;
  v8 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v7));
  -[NSOperation addDependency:](self->waitOperation, "addDependency:", v6);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v6);
  objc_msgSend(v6, "waitUntilFinished");

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)waitForCompletion
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", self->waitOperation);
  -[NSOperation waitUntilFinished](self->waitOperation, "waitUntilFinished");
  if ((*((_BYTE *)self->_options + 16) & 0x40) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", CFSTR("/tmp/com.apple.gputools.profiling/shaderProfilerResults/"), 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v4);
          v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/tmp/com.apple.gputools.profiling/shaderProfilerResults/"), "stringByAppendingPathComponent:", v8, (_QWORD)v11));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->_options->var0, "stringByAppendingPathComponent:", v8));
          objc_msgSend(v3, "moveItemAtPath:toPath:error:", v9, v10, 0);

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

  }
  std::unique_ptr<MTLGRCStreamingSampleHelper>::reset[abi:nn180100]((uint64_t **)&self->_streamingHelper, 0);
}

- (void)_addDerivedCounterDataToTimelineInfo:(id)a3 usingShaderProfilerResult:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  id v20;
  id v21;
  uint64_t v22;
  char *v23;
  void *i;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v42;
  void *v43;
  id obj;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];

  v5 = a3;
  v39 = a4;
  v43 = (void *)objc_opt_new(DYGPUDerivedEncoderCounterInfo, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("derivedCounterData")));
  v49 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("counters")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  v40 = v9;
  v10 = objc_msgSend(v9, "copy");
  objc_msgSend(v43, "setDerivedCounterNames:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("derivedCounterData")));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AverageSamples")));

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 8 * (_QWORD)objc_msgSend(v9, "count") * (_QWORD)objc_msgSend(v42, "count")));
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v42;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v12)
  {
    v45 = *(_QWORD *)v55;
    do
    {
      v13 = 0;
      v47 = v12;
      do
      {
        if (*(_QWORD *)v55 != v45)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v13);
        v15 = (unint64_t)objc_msgSend(v14, "count");
        if (v15)
        {
          if (v15 >> 61)
            abort();
          v16 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v15);
          v18 = &v16[8 * v17];
          v19 = v16;
        }
        else
        {
          v19 = 0;
          v18 = 0;
        }
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v20 = v14;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        v48 = v13;
        if (v21)
        {
          v22 = *(_QWORD *)v51;
          v23 = v19;
          do
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(_QWORD *)v51 != v22)
                objc_enumerationMutation(v20);
              objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i), "doubleValue");
              v26 = v25;
              if (v23 >= v18)
              {
                v27 = (v23 - v19) >> 3;
                v28 = v27 + 1;
                if ((unint64_t)(v27 + 1) >> 61)
                  abort();
                if ((v18 - v19) >> 2 > v28)
                  v28 = (v18 - v19) >> 2;
                if ((unint64_t)(v18 - v19) >= 0x7FFFFFFFFFFFFFF8)
                  v29 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v29 = v28;
                if (v29)
                  v29 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v29);
                else
                  v30 = 0;
                v31 = (char *)(v29 + 8 * v27);
                *(_QWORD *)v31 = v26;
                v32 = v31 + 8;
                while (v23 != v19)
                {
                  v33 = *((_QWORD *)v23 - 1);
                  v23 -= 8;
                  *((_QWORD *)v31 - 1) = v33;
                  v31 -= 8;
                }
                v18 = (char *)(v29 + 8 * v30);
                if (v19)
                  operator delete(v19);
                v19 = v31;
                v23 = v32;
                v5 = v49;
              }
              else
              {
                *(_QWORD *)v23 = v25;
                v23 += 8;
              }
            }
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
          }
          while (v21);
        }
        else
        {
          v23 = v19;
        }

        objc_msgSend(v46, "appendBytes:length:", v19, v23 - v19);
        if (v19)
          operator delete(v19);
        v13 = v48 + 1;
      }
      while ((id)(v48 + 1) != v47);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v12);
  }

  objc_msgSend(v43, "setDerivedCounters:", v46);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("GPU Encoder Info")));
  objc_msgSend(v43, "setEncoderInfos:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Timebase")));
  v36 = v35;
  if (v35 && objc_msgSend(v35, "count") == (char *)&dword_0 + 2)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "firstObject"));
    -[DYWorkloadGPUTimelineInfo setTimeBaseNumerator:](self->_workloadTimelineInfo, "setTimeBaseNumerator:", objc_msgSend(v37, "unsignedIntValue"));

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "lastObject"));
    -[DYWorkloadGPUTimelineInfo setTimeBaseDenominator:](self->_workloadTimelineInfo, "setTimeBaseDenominator:", objc_msgSend(v38, "unsignedIntValue"));

  }
  else
  {
    -[DYWorkloadGPUTimelineInfo setTimeBaseNumerator:](self->_workloadTimelineInfo, "setTimeBaseNumerator:", 125);
    -[DYWorkloadGPUTimelineInfo setTimeBaseDenominator:](self->_workloadTimelineInfo, "setTimeBaseDenominator:", 3);
  }
  -[DYWorkloadGPUTimelineInfo setDerivedEncoderCounterInfo:](self->_workloadTimelineInfo, "setDerivedEncoderCounterInfo:", v43);

}

- (void)processGPUTimelineDataSources:(const GTMTLReplayDataSource *)a3 withPayload:(id)a4 forReplayController:(const GTMTLReplayController *)a5
{
  id v9;
  uint64_t v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *shaderSourcePath;
  DYMTLShaderProfilerResult *v13;
  DYMTLShaderProfilerResult *streamingMTLResult;
  _QWORD v15[4];
  id v16;
  id v17;
  id from;
  id location;

  v9 = a4;
  objc_storeStrong((id *)&self->_payload, a4);
  v11 = (NSMutableDictionary *)objc_opt_new(NSMutableDictionary, v10);
  shaderSourcePath = self->_shaderSourcePath;
  self->_shaderSourcePath = v11;

  v13 = (DYMTLShaderProfilerResult *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _gatherStaticInformation:forReplayController:](self, "_gatherStaticInformation:forReplayController:", a3, a5));
  streamingMTLResult = self->_streamingMTLResult;
  self->_streamingMTLResult = v13;

  objc_initWeak(&location, self->_streamingMTLResult);
  objc_initWeak(&from, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __88__GTShaderProfilerHelper_processGPUTimelineDataSources_withPayload_forReplayController___block_invoke;
  v15[3] = &unk_725478;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  objc_retainBlock(v15);
  operator new();
}

- (void)_dumpGPUTimelineDataResult:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  FILE *v15;
  void *v16;
  id v17;
  unint64_t i;
  void *v19;
  id v20;
  id var0;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  FILE *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  FILE *v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  FILE *v53;
  _QWORD v54[4];
  id v55;
  FILE *v56;
  id v57;
  id v58;
  int v59;
  _QWORD v60[4];
  id v61;
  FILE *v62;
  id v63;
  id v64;
  int v65;

  v4 = a3;
  v50 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(self->_options->var0, "stringByAppendingPathComponent:", CFSTR("aggregatedGPUTimeline.txt")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aggregatedGPUTimelineInfo"));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timestamps")));
  v7 = objc_msgSend(v6, "bytes");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aggregatedGPUTimelineInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "derivedCounterNames"));
  LODWORD(v6) = objc_msgSend(v9, "count");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aggregatedGPUTimelineInfo"));
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "derivedCounters")));
  v12 = objc_msgSend(v11, "bytes");

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "stringByDeletingLastPathComponent"));
  objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v14, 1, 0, 0);

  v49 = objc_retainAutorelease(v50);
  v15 = fopen((const char *)objc_msgSend(v49, "UTF8String"), "wt");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aggregatedGPUTimelineInfo"));
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = __53__GTShaderProfilerHelper__dumpGPUTimelineDataResult___block_invoke;
  v60[3] = &unk_7254A0;
  v62 = v15;
  v63 = v7;
  v65 = (int)v6;
  v17 = v4;
  v61 = v17;
  v64 = v12;
  objc_msgSend(v16, "enumerateActiveShadersForAllSamples:", v60);

  fclose(v15);
  for (i = 0; ; ++i)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mGPUTimelineInfos"));
    v20 = objc_msgSend(v19, "count");

    if (i >= (unint64_t)v20)
      break;
    var0 = self->_options->var0;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("gpuTimeline_%lu.txt"), i));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(var0, "stringByAppendingPathComponent:", v22));

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mGPUTimelineInfos"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", i));
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "timestamps")));
    v27 = objc_msgSend(v26, "bytes");

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mGPUTimelineInfos"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", i));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "derivedCounterNames"));
    LODWORD(v24) = objc_msgSend(v30, "count");

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mGPUTimelineInfos"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndexedSubscript:", i));
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "derivedCounters")));
    v34 = objc_msgSend(v33, "bytes");

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringByDeletingLastPathComponent"));
    objc_msgSend(v35, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v36, 1, 0, 0);

    v37 = objc_retainAutorelease(v23);
    v38 = fopen((const char *)objc_msgSend(v37, "UTF8String"), "wt");
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mGPUTimelineInfos"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectAtIndexedSubscript:", i));
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = __53__GTShaderProfilerHelper__dumpGPUTimelineDataResult___block_invoke_2;
    v54[3] = &unk_7254A0;
    v56 = v38;
    v57 = v27;
    v59 = (int)v24;
    v55 = v17;
    v58 = v34;
    objc_msgSend(v40, "enumerateActiveShadersForAllSamples:", v54);

    fclose(v38);
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "derivedEncoderCounterInfo"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "derivedCounterNames"));

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->_options->var0, "stringByAppendingPathComponent:", CFSTR("gpuTimeline_derivedEncoderData.txt")));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "stringByDeletingLastPathComponent"));
  objc_msgSend(v44, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v45, 1, 0, 0);

  v46 = objc_retainAutorelease(v43);
  v47 = fopen((const char *)objc_msgSend(v46, "UTF8String"), "wt");
  fprintf(v47, "TimeBase = %u/%u\n", objc_msgSend(v17, "timeBaseNumerator"), objc_msgSend(v17, "timeBaseDenominator"));
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = __53__GTShaderProfilerHelper__dumpGPUTimelineDataResult___block_invoke_3;
  v51[3] = &unk_7254C8;
  v53 = v47;
  v48 = v42;
  v52 = v48;
  objc_msgSend(v17, "enumerateEncoderDerivedData:", v51);
  fclose(v47);

}

- (void)writeGPUTimelineSerializedData
{
  void *v3;
  DYWorkloadGPUTimelineInfo *workloadTimelineInfo;
  void *v5;
  id v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->_options->var0, "stringByAppendingPathComponent:", CFSTR("WorkloadArchive.data")));
  workloadTimelineInfo = self->_workloadTimelineInfo;
  v7 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", workloadTimelineInfo, 1, &v7));
  v6 = v7;
  objc_msgSend(v5, "writeToFile:atomically:", v3, 0);

}

- (void)profileShadersForDataSource:(const GTMTLReplayDataSource *)a3 withPayload:(id)a4 forReplayController:(const GTMTLReplayController *)a5
{
  id v9;
  uint64_t v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *shaderSourcePath;
  DYMTLShaderProfilerResult *v13;
  DYMTLShaderProfilerResult *streamingMTLResult;
  _QWORD v15[5];
  id v16;
  id v17;
  id from;
  id location;
  _QWORD v20[3];
  int v21;

  v9 = a4;
  objc_storeStrong((id *)&self->_payload, a4);
  v11 = (NSMutableDictionary *)objc_opt_new(NSMutableDictionary, v10);
  shaderSourcePath = self->_shaderSourcePath;
  self->_shaderSourcePath = v11;

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v13 = (DYMTLShaderProfilerResult *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _gatherStaticInformation:forReplayController:](self, "_gatherStaticInformation:forReplayController:", a3, a5));
  streamingMTLResult = self->_streamingMTLResult;
  self->_streamingMTLResult = v13;

  objc_initWeak(&location, self->_streamingMTLResult);
  objc_initWeak(&from, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __86__GTShaderProfilerHelper_profileShadersForDataSource_withPayload_forReplayController___block_invoke;
  v15[3] = &unk_7254F0;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  v15[4] = v20;
  objc_retainBlock(v15);
  operator new();
}

- (void)profileBatchIdFilteredData:(const GTMTLReplayDataSource *)a3 withPayload:(id)a4 forReplayController:(const GTMTLReplayController *)a5
{
  id v9;
  uint64_t v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *shaderSourcePath;
  DYMTLShaderProfilerResult *v13;
  DYMTLShaderProfilerResult *streamingMTLResult;
  NSMutableArray *v15;
  NSMutableArray *batchIdPartialResults;
  _QWORD v17[4];
  id v18;
  id location;

  v9 = a4;
  objc_storeStrong((id *)&self->_payload, a4);
  v11 = (NSMutableDictionary *)objc_opt_new(NSMutableDictionary, v10);
  shaderSourcePath = self->_shaderSourcePath;
  self->_shaderSourcePath = v11;

  v13 = (DYMTLShaderProfilerResult *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _gatherStaticInformation:forReplayController:](self, "_gatherStaticInformation:forReplayController:", a3, a5));
  streamingMTLResult = self->_streamingMTLResult;
  self->_streamingMTLResult = v13;

  objc_initWeak(&location, self);
  v15 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("activePerEncoderDrawCallCount"))), "count"));
  batchIdPartialResults = self->_batchIdPartialResults;
  self->_batchIdPartialResults = v15;

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __85__GTShaderProfilerHelper_profileBatchIdFilteredData_withPayload_forReplayController___block_invoke;
  v17[3] = &unk_725518;
  objc_copyWeak(&v18, &location);
  objc_retainBlock(v17);
  operator new();
}

- (void)_calculateFrameTime:(id)a3 result:(id)a4
{
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = 0;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          v8 += (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "unsignedLongLongValue", (_QWORD)v12);
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    objc_msgSend(v6, "setFrameTime:", v8 / (unint64_t)objc_msgSend(v7, "count"));
  }

}

- (void)_generateSamplesForResult:(id)a3 withProgramAddressLUT:(void *)a4 withBatchIndexMin:(unsigned int)a5 andBatchIndexMax:(unsigned int)a6 andMinIndex:(unsigned int)a7 withProgramAddressList:(DYMTLShaderProfilerProgramAddress *)a8 withUSCSampleList:(DYMTLShaderProfilerUSCSample *)a9 withUSCSampleNum:(unsigned int)a10 withBatchIDToEncoderIndex:(void *)a11 andEncoderIndexToBatchIdMap:(void *)a12
{
  id *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  DYMTLShaderProfilerUSCSample *v19;
  unsigned int v20;
  void *v21;
  id v22;
  unsigned int v23;
  void *v24;
  _QWORD *v25;
  char *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  char *v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  int64x2_t v45;
  _QWORD *v46;
  void *v47;
  _QWORD *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  unsigned int v61;
  FILE *v62;
  uint64_t v63;
  DYMTLShaderProfilerUSCSample *v64;
  unsigned int var0;
  DYMTLShaderProfilerUSCSample *v66;
  $F60400ACC696FD52E79A1AB3BC66C28E *p_var1;
  unsigned int v68;
  unsigned int v70;
  unsigned int v71;
  unint64_t v72;
  uint64_t v73;
  unsigned __int8 **v74;
  unsigned __int8 **v75;
  unint64_t var1;
  unsigned __int8 *v77;
  unint64_t v78;
  unint64_t v79;
  id v80;
  int v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  int v86;
  void *v87;
  void *v89;
  id v90;
  unsigned int v91;
  id *v93;
  unsigned int v94;
  char **v95;
  int v96;
  unsigned int v97;
  char *v98;
  char *v99;
  char *v100;

  v14 = (id *)a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "drawCallInfoList"));
  v16 = (unint64_t)objc_msgSend(v15, "count");
  v17 = v16;
  v98 = 0;
  v99 = 0;
  v100 = 0;
  if (v16)
  {
    if (v16 >= 0xAAAAAAAAAAAAAABLL)
      abort();
    v98 = (char *)operator new(24 * v16);
    v100 = &v98[24 * v17];
    v18 = 24 * ((24 * v17 - 24) / 0x18) + 24;
    bzero(v98, v18);
    v99 = &v98[v18];
  }
  v91 = a6;
  v19 = a9;

  v20 = 0;
  v93 = v14;
  v94 = a5;
  while (1)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "drawCallInfoList"));
    v22 = objc_msgSend(v21, "count");
    v23 = v20;

    if ((unint64_t)v22 <= v20)
      break;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "drawCallInfoList"));
    v25 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", v20));
    v26 = &v98[24 * v20];

    v27 = v26 + 8;
    v28 = (_QWORD *)*((_QWORD *)v26 + 1);
    v29 = *(_QWORD **)v26;
    v30 = (uint64_t)v28 - *(_QWORD *)v26;
    if ((unint64_t)v30 > 0x2F)
    {
      if (v30 != 48)
      {
        v46 = v29 + 6;
        while (v28 != v46)
        {
          v47 = (void *)*--v28;

        }
        *v27 = v46;
      }
    }
    else
    {
      v31 = v30 >> 3;
      v32 = 6 - (v30 >> 3);
      v33 = &v98[24 * v20];
      v36 = *((_QWORD *)v33 + 2);
      v35 = v33 + 16;
      v34 = v36;
      if (v32 <= (v36 - (uint64_t)v28) >> 3)
      {
        v48 = &v28[v32];
        v49 = 48 - 8 * v31;
        v19 = a9;
        do
        {
          *v28++ = 0;
          v49 -= 8;
        }
        while (v49);
        *v27 = v48;
        a5 = v94;
      }
      else
      {
        v37 = v34 - (_QWORD)v29;
        v38 = v37 >> 2;
        if ((unint64_t)(v37 >> 2) <= 6)
          v38 = 6;
        if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF8)
          v39 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v39 = v38;
        if (v39 >> 61)
          std::__throw_bad_array_new_length[abi:nn180100]();
        v40 = operator new(8 * v39);
        v41 = (char *)&v40[v31];
        do
          v40[v31++] = 0;
        while (v31 != 6);
        v42 = (_QWORD *)*v27;
        v43 = *(_QWORD **)v26;
        if (*v27 == *(_QWORD *)v26)
        {
          v45 = vdupq_n_s64((unint64_t)v42);
          a5 = v94;
        }
        else
        {
          a5 = v94;
          do
          {
            v44 = *--v42;
            *v42 = 0;
            *((_QWORD *)v41 - 1) = v44;
            v41 -= 8;
          }
          while (v42 != v43);
          v45 = *(int64x2_t *)v26;
        }
        *(_QWORD *)v26 = v41;
        *v27 = v40 + 6;
        *v35 = &v40[v39];
        v50 = (char *)v45.i64[1];
        v51 = (char *)v45.i64[0];
        while (v50 != v51)
        {
          v52 = (void *)*((_QWORD *)v50 - 1);
          v50 -= 8;

        }
        v14 = v93;
        v19 = a9;
        if (v51)
          operator delete(v51);
      }
    }
    v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14[30], "objectForKeyedSubscript:", v25[1]));
    v54 = *(void **)(*(_QWORD *)v26 + 8);
    *(_QWORD *)(*(_QWORD *)v26 + 8) = v53;

    v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14[31], "objectForKeyedSubscript:", v25[2]));
    v56 = *(void **)(*(_QWORD *)v26 + 16);
    *(_QWORD *)(*(_QWORD *)v26 + 16) = v55;

    v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14[32], "objectForKeyedSubscript:", v25[3]));
    v58 = *(void **)(*(_QWORD *)v26 + 24);
    *(_QWORD *)(*(_QWORD *)v26 + 24) = v57;

    v20 = v23 + 1;
  }
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->_options->var0, "stringByAppendingPathComponent:", CFSTR("/uscSamplingProcessedSample.txt")));
  v60 = v59;
  v61 = v91;
  if ((*((_BYTE *)self->_options + 16) & 0x40) != 0)
    v62 = fopen((const char *)objc_msgSend(objc_retainAutorelease(v59), "UTF8String"), "wt");
  else
    v62 = 0;
  if (a10)
  {
    v63 = 0;
    v87 = v60;
    do
    {
      v64 = &v19[v63];
      var0 = v64->var0;
      if (v64->var0 != -1)
      {
        v66 = &v19[v63];
        v68 = v66->var1.var0.var0.var0;
        p_var1 = &v66->var1;
        if (v68)
        {
          if (var0 < a5 || var0 > v61)
          {
            if (v62)
              fprintf(v62, "%5u | %5u | batch index is out of range\n", v63, var0);
          }
          else
          {
            v70 = *(_DWORD *)(*(_QWORD *)a11 + 4 * (var0 - a5));
            v97 = v70;
            if (v70 != -1)
            {
              v71 = *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)a12, v70, &v97)+ 5);
              v72 = v71 - a5;
              if (v71 >= a5 && 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3) > v72)
              {
                v73 = *(_QWORD *)a4 + 24 * v72;
                v75 = *(unsigned __int8 ***)v73;
                v74 = *(unsigned __int8 ***)(v73 + 8);
                if (v75 == v74)
                {
LABEL_57:
                  v60 = v87;
                  if (v62)
                    fprintf(v62, "%5u | %5u | PC (0x%0.8x) is not within any program\n", v63, v64->var0, p_var1->var0.var1);
                }
                else
                {
                  var1 = p_var1->var0.var1;
                  while (1)
                  {
                    v77 = *v75;
                    if (*((_QWORD *)*v75 + 1) <= var1 && *((_QWORD *)v77 + 2) > var1)
                      break;
                    if (++v75 == v74)
                      goto LABEL_57;
                  }
                  v78 = *((unsigned int *)v77 + 1);
                  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "drawCallInfoList"));
                  v79 = v78 % (unint64_t)objc_msgSend(v89, "count");

                  v80 = *(id *)(*(_QWORD *)&v98[24 * v79] + 8 * **v75);
                  v81 = p_var1->var0.var1 - *((_DWORD *)*v75 + 2);
                  HIDWORD(v95) = p_var1->var0.var0.var0;
                  v96 = v81;
                  v86 = v79;
                  LODWORD(v95) = v79;
                  v90 = v80;
                  v61 = v91;
                  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "uscSamples"));

                  if (!v82)
                  {
                    v84 = (void *)objc_opt_new(NSMutableData, v83);
                    objc_msgSend(v90, "setUscSamples:", v84);

                  }
                  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "uscSamples"));
                  objc_msgSend(v85, "appendBytes:length:", &v95, 20);

                  if (v62)
                    fprintf(v62, "%5u | %5u(%5u) | %5u (%u) | %2u 0x%0.8x\n", v63, v64->var0, v71, v86, **v75, HIDWORD(v95), v96);

                  v60 = v87;
                }
              }
            }
            v14 = v93;
          }
        }
      }
      ++v63;
    }
    while (v63 != a10);
  }
  if (v62)
    fclose(v62);

  v95 = &v98;
  std::vector<std::vector<ShaderBinaryInfo * {__strong}>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v95);

}

- (void)_saveAddressList:(DYMTLShaderProfilerProgramAddress *)a3 size:(unsigned int)a4 filename:(const char *)a5
{
  FILE *v7;
  FILE *v8;
  uint64_t v9;
  $421EE431C39B988764BEB5E8283D4E0D *p_var1;
  unsigned int v11;
  int var3;
  unint64_t var0;
  unint64_t var1;

  v7 = fopen(a5, "wt");
  if (v7)
  {
    v8 = v7;
    fwrite("Index : ProgramType BatchIdx FunctionIdx [Start - End]\n", 0x37uLL, 1uLL, v7);
    if (a4)
    {
      v9 = 0;
      p_var1 = &a3->var1;
      do
      {
        v11 = *((_DWORD *)&p_var1[-1].var1 + 2);
        if (v11 <= 0xFFFFFEFF)
          var3 = p_var1[-1].var1.var3;
        else
          var3 = 999999;
        var0 = p_var1->var0.var0;
        var1 = p_var1->var0.var1;
        p_var1 = ($421EE431C39B988764BEB5E8283D4E0D *)((char *)p_var1 + 24);
        fprintf(v8, "%6u : %2u %6u %6u [0x%0.8llx - 0x%0.8llx]\n", v9++, v11, var3, v11 >> 8, var0, var1);
      }
      while (a4 != v9);
    }
    fclose(v8);
  }
}

- (void)_saveAddressMappings:(id)a3 filename:(const char *)a4
{
  FILE *v5;
  id v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  char *v15;
  void *v16;
  id v17;
  id v18;
  unint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id obj;
  uint64_t v25;
  FILE *v27;
  id v28;
  unsigned int v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v23 = a3;
  v5 = fopen(a4, "wt");
  if (v5)
  {
    fwrite("Encoder  Index [  Start -  End   ]  BinaryUniqueID  EncIdx Index Type\n", 0x46uLL, 1uLL, v5);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = v23;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    v27 = v5;
    if (v6)
    {
      v25 = *(_QWORD *)v31;
      do
      {
        v28 = v6;
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("encID")));
          v29 = objc_msgSend(v9, "unsignedIntValue");

          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("index")));
          v11 = objc_msgSend(v10, "unsignedIntValue");

          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("drawCallIndex")));
          v13 = objc_msgSend(v12, "unsignedIntValue");

          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mappedAddress")));
          v15 = (char *)objc_msgSend(v14, "unsignedLongLongValue");

          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mappedSize")));
          v17 = objc_msgSend(v16, "unsignedLongLongValue");

          v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("binaryUniqueId"))));
          v19 = strtoull((const char *)objc_msgSend(v18, "UTF8String"), 0, 16);

          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("encIndex")));
          LODWORD(v18) = objc_msgSend(v20, "unsignedIntValue");

          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type")));
          LODWORD(v20) = -[GTShaderProfilerHelper _getLegacyProgramType:](self, "_getLegacyProgramType:", v21);

          v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type"))));
          fprintf(v27, "%08x %5d [%08llx-%08llx] %016llx %6d %5d %3d %s\n", v29, v13, v15, &v15[(_QWORD)v17], v19, (_DWORD)v18, v11, (_DWORD)v20, (const char *)objc_msgSend(v22, "UTF8String"));

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v6);
    }

    fclose(v27);
  }

}

- (void)_saveSampleList:(DYMTLShaderProfilerUSCSample *)a3 size:(unsigned int)a4 filename:(const char *)a5
{
  FILE *v7;
  FILE *v8;
  uint64_t v9;
  unsigned int *p_var1;

  v7 = fopen(a5, "wt");
  if (v7)
  {
    v8 = v7;
    if (a4)
    {
      v9 = 0;
      p_var1 = &a3->var1.var0.var1;
      do
      {
        if (*(p_var1 - 2) == -1)
          fprintf(v8, "%6u : %u --------\n");
        else
          fprintf(v8, "%6u : %6u 0x%0.8x 0x%0.8x\n");
        ++v9;
        p_var1 += 3;
      }
      while (a4 != v9);
    }
    fclose(v8);
  }
}

- (void)_saveSampleListForTarget:(unint64_t *)a3 size:(unsigned int)a4 filename:(const char *)a5
{
  FILE *v7;
  FILE *v8;
  uint64_t v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t i;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  _QWORD v20[2];
  int v21;
  int v22;

  v7 = fopen(a5, "wt");
  if (v7)
  {
    v8 = v7;
    if (a4)
    {
      v9 = 0;
      v10 = 0;
      do
      {
        v11 = a3[v10];
        if (HIWORD(v11) == 65261)
        {
          for (i = 0; i != 3; ++i)
            v20[i] = a3[(v10 + i) % a4];
          v13 = v20[0];
          v14 = v20[0] & 0xF;
          if ((v20[0] & 0xC) != 0)
            v14 = 4;
          v15 = v9 + 1;
          v16 = (LODWORD(v20[0]) >> 7) & 0x7F;
          fprintf(v8, "%6llu : %6u 0x%0.16llx (type:\"%s\" trace_id:0x%0.8x dm:%u render_id:0x%0.8x timestamp:0x%0.16llx gpu_cycles:0x%0.8x counter_num:%u)\n", v9, v10, v11, (&-[GTShaderProfilerHelper _saveSampleListForTarget:size:filename:]::type_string)[v14], v20[0] >> 16, LOWORD(v20[0]) >> 14, v22, v20[1], v21, (LODWORD(v20[0]) >> 7) & 0x7F);
          v19 = (v13 >> 4) & 7;
          if ((_DWORD)v16)
          {
            v17 = 0;
            v18 = v10 + 2 * ((v13 >> 4) & 7) - 1 + v16;
            do
            {
              if (v18 + (int)v17 < a4)
                fprintf(v8, "%6llu : %6u 0x%0.8x 0x%0.8x\n", v15++, v17, a3[(v18 + v17)], HIDWORD(a3[(v18 + v17)]));
              ++v17;
            }
            while (v16 != v17);
          }
          v10 = v10 + v19 + v16 - 1;
          v9 = v15;
        }
        else
        {
          fprintf(v8, "%6llu : %6u : 0x%0.8llx\n", v9, v10, v11);
        }
        ++v10;
      }
      while (v10 < a4);
    }
    fclose(v8);
  }
}

- (void)_saveSampleDataFromGPURawCountersBytes:(char *)a3 size:(unsigned int)a4 filename:(const char *)a5
{
  FILE *v7;
  FILE *v8;
  int v9;
  unint64_t v10;
  char *v11;
  uint64_t i;
  unint64_t v13;

  v7 = fopen(a5, "wt");
  if (v7)
  {
    v8 = v7;
    if (a4)
    {
      v9 = 0;
      do
      {
        fprintf(v8, "%6u : trace_id:0x%0.8x limiterIdx:%u nTracePackets:%u)\n", v9, *(_QWORD *)a3, *(_QWORD *)a3 >> 39, HIDWORD(*(_QWORD *)a3) & 0x7F);
        if ((a3[4] & 0x7F) != 0)
        {
          v10 = 0;
          v11 = a3 + 8;
          do
          {
            for (i = 0; i != 4; ++i)
              fprintf(v8, "%6u : 0x%0.8llx 0x%0.8llx\n", i, HIDWORD(*(_QWORD *)&v11[8 * i]), *(_QWORD *)&v11[8 * i]);
            ++v10;
            v13 = *((_DWORD *)a3 + 1) & 0x7F;
            v11 += 32;
          }
          while (v10 < v13);
        }
        else
        {
          v13 = 0;
        }
        a3 += 32 * v13 + 8;
        ++v9;
      }
      while (v9 != a4);
    }
    fclose(v8);
  }
}

- (void)_preProcessUSCSampleData:(id)a3 result:(id)a4 targetIndex:(int)a5
{
  void *v7;
  void *v8;
  FILE *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  unsigned int v14;
  id v15;
  id v16;
  unsigned __int16 *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int16 *v22;
  unint64_t v23;
  _BOOL4 v24;
  BOOL v25;
  GTProfilerOptions *options;
  id v27;
  id v28;
  id v29;
  unsigned int v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *i;
  void *v35;
  unsigned int v36;
  uint64_t v37;
  _DWORD *v38;
  unsigned int v39;
  int v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  size_t v44;
  id v45;
  unsigned int v46;
  unsigned int v47;
  void *v48;
  unsigned int v49;
  void *v50;
  void *v51;
  void *v52;
  unsigned int v53;
  void *v54;
  char *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  unsigned __int8 v60;
  int v61;
  int v62;
  char *v63;
  char *v64;
  char *v65;
  unsigned int v66;
  char *v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  __int128 v74;
  char *v75;
  char *v76;
  void **v77;
  char **v78;
  unint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  char **v86;
  char *v87;
  char *v88;
  char *v89;
  int v90;
  int v91;
  char *v92;
  char *v93;
  id v94;
  char *v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  uint64_t v99;
  char *v100;
  char *v101;
  __int128 v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  int v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  int v110;
  uint64_t v111;
  _OWORD *v112;
  __int128 v113;
  char *v114;
  _OWORD *v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  uint64_t v119;
  __int128 v120;
  char *v121;
  char *v122;
  __int128 v123;
  unsigned int v124;
  uint64_t v125;
  uint64_t v126;
  _DWORD *v127;
  unint64_t v128;
  GTProfilerOptions *v129;
  id v130;
  id v131;
  void *v132;
  char v133;
  uint64_t v134;
  char *v135;
  char *v136;
  char **v137;
  void **v138;
  unint64_t v139;
  _QWORD *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  char **v145;
  char *v146;
  char *v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  unsigned int v152;
  _DWORD *v153;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  unsigned int v157;
  uint64_t v158;
  unsigned __int16 *v159;
  _DWORD *v160;
  unsigned int v161;
  _BOOL4 v162;
  unint64_t v163;
  unsigned __int8 v165;
  id v166;
  id v167;
  void *v168;
  char *v169;
  id v170;
  id v171;
  id obj;
  int v173;
  uint64_t v174;
  id v175;
  GTShaderProfilerHelper *v176;
  unint64_t v177;
  unsigned int v178;
  int v179;
  int v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  unsigned int v185;
  char *v186;
  char *v187;
  char *v188;
  __int128 v189;
  __int128 v190;
  int v191;
  void *v192;
  char *v193;
  char *v194;
  void *__p;
  char *v196;
  unint64_t v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  char **v202;
  _BYTE v203[128];
  _BYTE v204[128];

  v166 = a3;
  v167 = a4;
  v171 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "objectForKeyedSubscript:", CFSTR("usc sampling address data")));
  v170 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "objectForKeyedSubscript:", CFSTR("usc sampling sample data")));
  v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "objectForKeyedSubscript:", CFSTR("usc sampling address mappings")));
  v165 = -[GTShaderProfilerHelper _shouldUseProgramAddressMappings:](self, "_shouldUseProgramAddressMappings:");
  if (g_runningInCI)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("In _preProcessUSCSampleData, sample data %lu bytes, address data %lu bytes, address mappings %lu"), objc_msgSend(v170, "length"), objc_msgSend(v171, "length"), objc_msgSend(v168, "count")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#CI-INFO# ")));

    v9 = __stdoutp;
    v10 = objc_retainAutorelease(v8);
    fprintf(v9, "#CI-INFO# %s\n", (const char *)objc_msgSend(v10, "UTF8String"));

  }
  v176 = self;
  if (v171)
  {
    if (v170)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "drawCallInfoList"));
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
        v13 = objc_retainAutorelease(v171);
        v169 = (char *)objc_msgSend(v13, "bytes");
        v14 = objc_msgSend(v13, "length");
        v15 = objc_retainAutorelease(v170);
        v160 = objc_msgSend(v15, "bytes");
        v16 = objc_retainAutorelease(v15);
        v17 = (unsigned __int16 *)objc_msgSend(v16, "bytes");
        v18 = objc_msgSend(v16, "length");
        v19 = objc_msgSend(v16, "length") >> 3;
        if (a5 < 0)
        {
          v24 = 0;
          v165 = 0;
        }
        else
        {
          if (v19 >= 0x400)
            v20 = 1024;
          else
            v20 = v19;
          if ((_DWORD)v20)
          {
            v21 = v20 - 1;
            v22 = v17;
            do
            {
              v23 = (unint64_t)v22[3] << 48;
              v24 = v23 == 0xFEED000000000000;
              v25 = v23 == 0xFEED000000000000 || v21-- == 0;
              v22 += 4;
            }
            while (!v25);
          }
          else
          {
            v24 = 0;
          }
        }
        options = self->_options;
        if ((*((_BYTE *)options + 16) & 0x40) != 0)
        {
          v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(options->var0, "stringByAppendingPathComponent:", CFSTR("/uscSamplingAddressRaw.txt"))));
          -[GTShaderProfilerHelper _saveAddressList:size:filename:](self, "_saveAddressList:size:filename:", v169, v14 / 0x18uLL, objc_msgSend(v27, "UTF8String"));
          v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(self->_options->var0, "stringByAppendingPathComponent:", CFSTR("/uscSamplingAddressMapping.txt"))));
          -[GTShaderProfilerHelper _saveAddressMappings:filename:](self, "_saveAddressMappings:filename:", v168, objc_msgSend(v28, "UTF8String"));

        }
        v163 = v14 / 0x18uLL;
        v158 = v19;
        v159 = v17;
        v162 = v24;
        v161 = v18;
        if ((v165 & 1) != 0)
        {
          v200 = 0u;
          v201 = 0u;
          v198 = 0u;
          v199 = 0u;
          v29 = v168;
          v30 = 0;
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v198, v204, 16);
          if (v31)
          {
            v32 = *(_QWORD *)v199;
            LODWORD(v33) = -1;
            do
            {
              for (i = 0; i != v31; i = (char *)i + 1)
              {
                if (*(_QWORD *)v199 != v32)
                  objc_enumerationMutation(v29);
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v198 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", CFSTR("encIndex")));
                v36 = objc_msgSend(v35, "unsignedIntValue");

                if (v36 >= v33)
                  v33 = v33;
                else
                  v33 = v36;
                if (v30 <= v36)
                  v30 = v36;
              }
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v198, v204, 16);
            }
            while (v31);
          }
          else
          {
            v33 = 0xFFFFFFFFLL;
          }

        }
        else
        {
          if (v14 < 0x18)
            goto LABEL_201;
          v30 = 0;
          if (v163 <= 1)
            v37 = 1;
          else
            v37 = v163;
          v38 = v169 + 4;
          v33 = 0xFFFFFFFFLL;
          do
          {
            if (*v38 != -1)
            {
              v39 = *(v38 - 1);
              v33 = v39 >> 8 >= v33 ? v33 : v39 >> 8;
              if (v30 <= v39 >> 8)
                v30 = v39 >> 8;
            }
            v38 += 6;
            --v37;
          }
          while (v37);
        }
        v40 = v30 - v33;
        if (v30 >= v33)
        {
          v157 = v30;
          __p = 0;
          v196 = 0;
          v197 = 0;
          v192 = 0;
          v193 = 0;
          v194 = 0;
          v41 = (v40 + 1);
          if (v40 == -1)
          {
            v42 = 0;
            v189 = 0u;
            v190 = 0u;
            v191 = 1065353216;
            v186 = 0;
            v187 = 0;
            v188 = 0;
          }
          else
          {
            v42 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>((v40 + 1));
            v192 = v42;
            v194 = &v42[4 * v43];
            memset(v42, 255, 4 * v41);
            v193 = &v42[4 * v41];
            v189 = 0u;
            v190 = 0u;
            v191 = 1065353216;
            v186 = (char *)operator new(24 * v41);
            v188 = &v186[24 * v41];
            v44 = 24 * ((24 * v41 - 24) / 0x18uLL) + 24;
            bzero(v186, v44);
            v187 = &v186[v44];
          }
          if ((v165 & 1) != 0)
          {
            std::vector<DYMTLShaderProfilerProgramAddress>::reserve(&__p, 2 * (_QWORD)objc_msgSend(v168, "count"));
            LODWORD(v202) = 0;
            v181 = 0u;
            v182 = 0u;
            v183 = 0u;
            v184 = 0u;
            obj = v168;
            v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v181, v203, 16);
            if (v45)
            {
              v46 = 0;
              v173 = 0;
              v179 = 0;
              v174 = *(_QWORD *)v182;
              v47 = -1;
              do
              {
                v48 = 0;
                v175 = v45;
                do
                {
                  v49 = v47;
                  if (*(_QWORD *)v182 != v174)
                    objc_enumerationMutation(obj);
                  v50 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * (_QWORD)v48);
                  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("encID")));
                  v47 = objc_msgSend(v51, "unsignedIntValue");

                  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("drawCallIndex")));
                  v53 = objc_msgSend(v52, "unsignedIntValue");

                  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("mappedAddress")));
                  v55 = (char *)objc_msgSend(v54, "unsignedLongLongValue");

                  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("mappedSize")));
                  v57 = objc_msgSend(v56, "unsignedLongLongValue");

                  v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("binaryUniqueId"))));
                  v177 = strtoull((const char *)objc_msgSend(v58, "UTF8String"), 0, 16);

                  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("type")));
                  v60 = -[GTShaderProfilerHelper _getLegacyProgramType:](v176, "_getLegacyProgramType:", v59);

                  if (v49 == -1 || v49 == v47)
                  {
                    v61 = v53 + v173;
                  }
                  else
                  {
                    LODWORD(v202) = v47;
                    v61 = v179 + 1;
                    v46 = v47;
                    v173 = v179 + 1;
                  }
                  v179 = v61;
                  *((_DWORD *)v192 + v47 - v33) = v46;
                  v178 = v46;
                  *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)&v189, v46, &v202)+ 5) = v47;
                  v62 = (v47 << 8) | 0x62;
                  v63 = &v55[(_QWORD)v57];
                  v64 = v196;
                  if ((unint64_t)v196 >= v197)
                  {
                    v67 = (char *)__p;
                    v68 = 0xAAAAAAAAAAAAAAABLL * ((v196 - (_BYTE *)__p) >> 3);
                    v69 = v68 + 1;
                    if (v68 + 1 > 0xAAAAAAAAAAAAAAALL)
                      goto LABEL_202;
                    if (0x5555555555555556 * ((uint64_t)(v197 - (_QWORD)__p) >> 3) > v69)
                      v69 = 0x5555555555555556 * ((uint64_t)(v197 - (_QWORD)__p) >> 3);
                    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v197 - (_QWORD)__p) >> 3) >= 0x555555555555555)
                      v70 = 0xAAAAAAAAAAAAAAALL;
                    else
                      v70 = v69;
                    if (v70)
                      v70 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v70);
                    else
                      v71 = 0;
                    v72 = (char *)(v70 + 24 * v68);
                    *(_DWORD *)v72 = v62;
                    *((_DWORD *)v72 + 1) = v179;
                    *((_QWORD *)v72 + 1) = v55;
                    *((_QWORD *)v72 + 2) = v63;
                    v73 = v72;
                    if (v64 == v67)
                    {
                      v66 = v178;
                    }
                    else
                    {
                      v66 = v178;
                      do
                      {
                        v74 = *(_OWORD *)(v64 - 24);
                        *((_QWORD *)v73 - 1) = *((_QWORD *)v64 - 1);
                        *(_OWORD *)(v73 - 24) = v74;
                        v73 -= 24;
                        v64 -= 24;
                      }
                      while (v64 != v67);
                      v64 = (char *)__p;
                    }
                    v65 = v72 + 24;
                    __p = v73;
                    v197 = v70 + 24 * v71;
                    if (v64)
                      operator delete(v64);
                  }
                  else
                  {
                    *(_DWORD *)v196 = v62;
                    *((_DWORD *)v64 + 1) = v179;
                    v65 = v64 + 24;
                    *((_QWORD *)v64 + 1) = v55;
                    *((_QWORD *)v64 + 2) = v63;
                    v66 = v178;
                  }
                  v196 = v65;
                  v75 = &v186[24 * (v66 - v33)];
                  v76 = v65 - 24;
                  v77 = (void **)(v75 + 8);
                  v78 = (char **)*((_QWORD *)v75 + 1);
                  v79 = *((_QWORD *)v75 + 2);
                  if ((unint64_t)v78 >= v79)
                  {
                    v81 = ((uint64_t)v78 - *(_QWORD *)v75) >> 3;
                    if ((unint64_t)(v81 + 1) >> 61)
                      abort();
                    v82 = v79 - *(_QWORD *)v75;
                    v83 = v82 >> 2;
                    if (v82 >> 2 <= (unint64_t)(v81 + 1))
                      v83 = v81 + 1;
                    if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFF8)
                      v84 = 0x1FFFFFFFFFFFFFFFLL;
                    else
                      v84 = v83;
                    if (v84)
                      v84 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v84);
                    else
                      v85 = 0;
                    v86 = (char **)(v84 + 8 * v81);
                    *v86 = v76;
                    v80 = v86 + 1;
                    v87 = (char *)*v77;
                    v88 = *(char **)v75;
                    if (*v77 == *(void **)v75)
                    {
                      v46 = v178;
                    }
                    else
                    {
                      v46 = v178;
                      do
                      {
                        v89 = (char *)*((_QWORD *)v87 - 1);
                        v87 -= 8;
                        *--v86 = v89;
                      }
                      while (v87 != v88);
                      v87 = *(char **)v75;
                    }
                    *(_QWORD *)v75 = v86;
                    *v77 = v80;
                    *((_QWORD *)v75 + 2) = v84 + 8 * v85;
                    if (v87)
                      operator delete(v87);
                  }
                  else
                  {
                    *v78 = v76;
                    v80 = v78 + 1;
                    v46 = v178;
                  }
                  v90 = (v47 << 8) | 0x63;
                  v91 = v60;
                  *v77 = v80;
                  v92 = v196;
                  if ((unint64_t)v196 >= v197)
                  {
                    v95 = (char *)__p;
                    v96 = 0xAAAAAAAAAAAAAAABLL * ((v196 - (_BYTE *)__p) >> 3);
                    v97 = v96 + 1;
                    if (v96 + 1 > 0xAAAAAAAAAAAAAAALL)
LABEL_202:
                      abort();
                    if (0x5555555555555556 * ((uint64_t)(v197 - (_QWORD)__p) >> 3) > v97)
                      v97 = 0x5555555555555556 * ((uint64_t)(v197 - (_QWORD)__p) >> 3);
                    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v197 - (_QWORD)__p) >> 3) >= 0x555555555555555)
                      v98 = 0xAAAAAAAAAAAAAAALL;
                    else
                      v98 = v97;
                    if (v98)
                      v98 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v98);
                    else
                      v99 = 0;
                    v100 = (char *)(v98 + 24 * v96);
                    *(_DWORD *)v100 = v90;
                    *((_DWORD *)v100 + 1) = v179;
                    *((_QWORD *)v100 + 1) = v177;
                    *((_DWORD *)v100 + 4) = v91;
                    v101 = v100;
                    if (v92 == v95)
                    {
                      v94 = v175;
                      v46 = v178;
                    }
                    else
                    {
                      v94 = v175;
                      v46 = v178;
                      do
                      {
                        v102 = *(_OWORD *)(v92 - 24);
                        *((_QWORD *)v101 - 1) = *((_QWORD *)v92 - 1);
                        *(_OWORD *)(v101 - 24) = v102;
                        v101 -= 24;
                        v92 -= 24;
                      }
                      while (v92 != v95);
                      v92 = (char *)__p;
                    }
                    v93 = v100 + 24;
                    __p = v101;
                    v197 = v98 + 24 * v99;
                    if (v92)
                      operator delete(v92);
                  }
                  else
                  {
                    *(_DWORD *)v196 = v90;
                    *((_DWORD *)v92 + 1) = v179;
                    *((_QWORD *)v92 + 1) = v177;
                    v93 = v92 + 24;
                    *((_DWORD *)v92 + 4) = v91;
                    v94 = v175;
                  }
                  v196 = v93;
                  v48 = (char *)v48 + 1;
                }
                while (v48 != v94);
                v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v181, v203, 16);
              }
              while (v45);
            }

            v104 = v163;
          }
          else
          {
            std::vector<DYMTLShaderProfilerProgramAddress>::reserve(&__p, v163);
            LODWORD(v202) = 0;
            if (v14 >= 0x18)
            {
              v105 = 0;
              v106 = 0;
              v180 = 0;
              if (v163 <= 1)
                v107 = 1;
              else
                v107 = v163;
              v108 = 0xFFFFFFFFLL;
              do
              {
                v109 = &v169[24 * v105];
                if ((*(_QWORD *)v109 & *((_QWORD *)v109 + 1) & *((_QWORD *)v109 + 2)) == -1
                  || (v110 = *((_DWORD *)v109 + 1), v110 == -1))
                {
                  v111 = v108;
                }
                else
                {
                  v111 = *(_DWORD *)v109 >> 8;
                  if ((_DWORD)v108 == -1 || (_DWORD)v108 == (_DWORD)v111)
                  {
                    v106 = v110 + v180;
                  }
                  else
                  {
                    LODWORD(v202) = *(_DWORD *)v109 >> 8;
                    v180 = ++v106;
                  }
                  v112 = v196;
                  if ((unint64_t)v196 >= v197)
                  {
                    v115 = __p;
                    v116 = 0xAAAAAAAAAAAAAAABLL * ((v196 - (_BYTE *)__p) >> 3);
                    v117 = v116 + 1;
                    if (v116 + 1 > 0xAAAAAAAAAAAAAAALL)
                      abort();
                    if (0x5555555555555556 * ((uint64_t)(v197 - (_QWORD)__p) >> 3) > v117)
                      v117 = 0x5555555555555556 * ((uint64_t)(v197 - (_QWORD)__p) >> 3);
                    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v197 - (_QWORD)__p) >> 3) >= 0x555555555555555)
                      v118 = 0xAAAAAAAAAAAAAAALL;
                    else
                      v118 = v117;
                    if (v118)
                      v118 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v118);
                    else
                      v119 = 0;
                    v120 = *(_OWORD *)v109;
                    v121 = (char *)(v118 + 24 * v116);
                    *((_QWORD *)v121 + 2) = *((_QWORD *)v109 + 2);
                    *(_OWORD *)v121 = v120;
                    v122 = v121;
                    if (v112 != v115)
                    {
                      do
                      {
                        v123 = *(_OWORD *)((char *)v112 - 24);
                        *((_QWORD *)v122 - 1) = *((_QWORD *)v112 - 1);
                        *(_OWORD *)(v122 - 24) = v123;
                        v122 -= 24;
                        v112 = (_OWORD *)((char *)v112 - 24);
                      }
                      while (v112 != v115);
                      v112 = __p;
                    }
                    v114 = v121 + 24;
                    __p = v122;
                    v197 = v118 + 24 * v119;
                    if (v112)
                      operator delete(v112);
                  }
                  else
                  {
                    v113 = *(_OWORD *)v109;
                    *((_QWORD *)v196 + 2) = *((_QWORD *)v109 + 2);
                    *v112 = v113;
                    v114 = (char *)v112 + 24;
                  }
                  v196 = v114;
                  *((_DWORD *)v114 - 5) = v106;
                  v124 = v202;
                  v42 = (char *)v192;
                  *((_DWORD *)v192 + (v111 - v33)) = (_DWORD)v202;
                  *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)&v189, v124, &v202)+ 5) = v111;
                }
                ++v105;
                v108 = v111;
              }
              while (v105 != v107);
            }
            v169 = (char *)__p;
            v125 = (v196 - (_BYTE *)__p) >> 3;
            v104 = 0xAAAAAAAAAAAAAAABLL * v125;
            if (-1431655765 * (_DWORD)v125)
            {
              v126 = (-1431655765 * v125);
              v127 = __p;
              do
              {
                v185 = 0;
                v185 = *(_DWORD *)&v42[4 * ((*v127 >> 8) - v33)];
                *v127 = *(unsigned __int8 *)v127 | (*((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)&v189, v185, &v185)+ 5) << 8);
                v127 += 6;
                --v126;
              }
              while (v126);
            }
          }
          v128 = v161 / 0xCuLL;
          v129 = v176->_options;
          if ((*((_BYTE *)v129 + 16) & 0x40) != 0)
          {
            if ((v165 & 1) == 0)
            {
              v130 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v129->var0, "stringByAppendingPathComponent:", CFSTR("/uscSamplingAddressProcessed.txt"))));
              -[GTShaderProfilerHelper _saveAddressList:size:filename:](v176, "_saveAddressList:size:filename:", v169, v104, objc_msgSend(v130, "UTF8String"));

              v129 = v176->_options;
            }
            v131 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v129->var0, "stringByAppendingPathComponent:", CFSTR("/uscSamplingSampleRaw.txt"))));
            v132 = v131;
            if (v162)
              -[GTShaderProfilerHelper _saveSampleListForTarget:size:filename:](v176, "_saveSampleListForTarget:size:filename:", v159, v158, objc_msgSend(v131, "UTF8String"));
            else
              -[GTShaderProfilerHelper _saveSampleList:size:filename:](v176, "_saveSampleList:size:filename:", v160, v128, objc_msgSend(v131, "UTF8String"));

          }
          v133 = v165;
          if (!(_DWORD)v104)
            v133 = 1;
          if ((v133 & 1) == 0)
          {
            v134 = 0;
            do
            {
              v135 = &v169[24 * v134];
              v136 = &v186[24 * ((*(_DWORD *)v135 >> 8) - v33)];
              v138 = (void **)(v136 + 8);
              v137 = (char **)*((_QWORD *)v136 + 1);
              v139 = *((_QWORD *)v136 + 2);
              if ((unint64_t)v137 >= v139)
              {
                v141 = ((uint64_t)v137 - *(_QWORD *)v136) >> 3;
                if ((unint64_t)(v141 + 1) >> 61)
                  abort();
                v142 = v139 - *(_QWORD *)v136;
                v143 = v142 >> 2;
                if (v142 >> 2 <= (unint64_t)(v141 + 1))
                  v143 = v141 + 1;
                if ((unint64_t)v142 >= 0x7FFFFFFFFFFFFFF8)
                  v144 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v144 = v143;
                if (v144)
                  v144 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v144);
                else
                  v103 = 0;
                v145 = (char **)(v144 + 8 * v141);
                *v145 = v135;
                v140 = v145 + 1;
                v146 = (char *)*v138;
                v147 = *(char **)v136;
                if (*v138 != *(void **)v136)
                {
                  do
                  {
                    v148 = (char *)*((_QWORD *)v146 - 1);
                    v146 -= 8;
                    *--v145 = v148;
                  }
                  while (v146 != v147);
                  v146 = *(char **)v136;
                }
                *(_QWORD *)v136 = v145;
                *v138 = v140;
                *((_QWORD *)v136 + 2) = v144 + 8 * v103;
                if (v146)
                  operator delete(v146);
              }
              else
              {
                *v137 = v135;
                v140 = v137 + 1;
              }
              *v138 = v140;
              ++v134;
            }
            while (v134 != v104);
          }
          if (v162)
          {
            v149 = 0;
            v150 = v157;
          }
          else
          {
            v150 = v157;
            if ((_DWORD)v128 == 1)
            {
              v149 = 0;
            }
            else
            {
              v151 = 0;
              v149 = 0;
              v152 = -1;
              v153 = v160;
              do
              {
                if (*v153 == -1)
                {
                  if (v153[3] >= v152)
                  {
                    v149 = v149;
                  }
                  else
                  {
                    v152 = v153[3];
                    v149 = v151;
                  }
                }
                ++v151;
                v153 += 3;
              }
              while ((_DWORD)v128 - 1 != v151);
            }
          }
          if (a5 < 0)
          {
            LODWORD(v155) = v161 / 0xC;
            -[GTShaderProfilerHelper _generateSamplesForResult:withProgramAddressLUT:withBatchIndexMin:andBatchIndexMax:andMinIndex:withProgramAddressList:withUSCSampleList:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:](v176, "_generateSamplesForResult:withProgramAddressLUT:withBatchIndexMin:andBatchIndexMax:andMinIndex:withProgramAddressList:withUSCSampleList:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:", v167, &v186, v33, v150, v149, v169, v160, v155, &v192, &v189);
          }
          else
          {
            v154 = (void *)objc_opt_new(DYPMTLShaderProfilerHelper, v103);
            LODWORD(v156) = a5;
            objc_msgSend(v154, "generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:", v167, &v186, v33, v169, v159, v158, &v192, &v189, v156);

          }
          v202 = &v186;
          std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v202);
          std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v189);
          if (v192)
          {
            v193 = (char *)v192;
            operator delete(v192);
          }
          if (__p)
            operator delete(__p);
        }
      }
    }
  }
LABEL_201:

}

- (void)_dumpTraceProfileDataForResult:(id)a3
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  FILE *v7;
  id v8;
  double v9;
  uint64_t v10;
  _QWORD *v11;
  double v12;
  uint64_t v13;
  unsigned int v14;
  id v15;
  double v16;
  const char *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  FILE *v29;
  id v30;
  void *j;
  _QWORD *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  unsigned int v46;
  unsigned int v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  void *v57;
  uint64_t v58;
  FILE *v59;
  id v60;
  void *k;
  _QWORD *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  BOOL v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  void *v71;
  double v72;
  void *v73;
  double v74;
  void *v75;
  unsigned int v76;
  unsigned int v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  const char *v82;
  void *v83;
  const char *v84;
  void *v85;
  const char *v86;
  const char *v87;
  id v88;
  void *v89;
  void *v90;
  id v92;
  id obj;
  void *v94;
  id v95;
  id v96;
  id v97;
  FILE *v98;
  FILE *v99;
  FILE *v100;
  id v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  double v111;
  double v112;
  double v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _QWORD v122[4];
  id v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];

  v3 = a3;
  v94 = v3;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "vertexTiming");
    objc_msgSend(v4, "fragmentTiming");
    objc_msgSend(v4, "computeTiming");
    v5 = *(double *)&v134 + *(double *)&v131 + *(double *)&v128;
  }
  else
  {
    v5 = 0.0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "programPipelineInfoList"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_477));

  v95 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(self->_options->var0, "stringByAppendingFormat:", CFSTR("/PipelineState.txt"))));
  v7 = fopen((const char *)objc_msgSend(v95, "UTF8String"), "w");
  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  obj = v90;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v140, 16);
  if (v8)
  {
    v98 = *(FILE **)v125;
    v9 = 0.0;
    do
    {
      v10 = 0;
      v101 = v8;
      do
      {
        if (*(FILE **)v125 != v98)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD **)(*((_QWORD *)&v124 + 1) + 8 * v10);
        if (v11)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v124 + 1) + 8 * v10), "timing");
          v12 = *(double *)&v134;
        }
        else
        {
          v12 = 0.0;
        }
        v13 = v11[1];
        v14 = objc_msgSend(v11, "programIndex");
        v15 = objc_msgSend(v11, "programId");
        if (v13)
        {
          objc_msgSend(v11, "vertexTiming");
          v16 = *(double *)&v134;
          objc_msgSend(v11, "fragmentTiming");
          fprintf(v7, "[%u] PipelineState 0x%llX\tVertex[%.4f%%]\tFragment[%.4f%%]\n", v14, v15, v16 * 100.0 / v5, *(double *)&v131 * 100.0 / v5);
          v17 = "\tVert\t\tFragment";
        }
        else
        {
          objc_msgSend(v11, "computeTiming");
          fprintf(v7, "[%u] PipelineState 0x%llX\tCompute[%.4f%%]\n", v14, v15, *(double *)&v134 * 100.0 / v5);
          v17 = "\tCompute";
        }
        v104 = v10;
        fprintf(v7, "\tindex\tfunctionIndex\t%s\n", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "drawCallInfoList"));
        v122[0] = _NSConcreteStackBlock;
        v122[1] = 3221225472;
        v122[2] = __57__GTShaderProfilerHelper__dumpTraceProfileDataForResult___block_invoke_2;
        v122[3] = &unk_726980;
        v19 = v94;
        v123 = v19;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sortedArrayUsingComparator:", v122));

        v120 = 0u;
        v121 = 0u;
        v118 = 0u;
        v119 = 0u;
        v21 = v20;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v118, v139, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v119;
          do
          {
            for (i = 0; i != v22; i = (char *)i + 1)
            {
              if (*(_QWORD *)v119 != v23)
                objc_enumerationMutation(v21);
              v25 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)i);
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "drawCallInfoList"));
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndexedSubscript:", objc_msgSend(v25, "unsignedIntegerValue")));

              if (v13)
              {
                objc_msgSend(v27, "drawCallIndex");
                objc_msgSend(v27, "functionIndex");
                if (v27)
                {
                  objc_msgSend(v27, "vertexTiming");
                  objc_msgSend(v27, "fragmentTiming");
                }
                else
                {
                  v135 = 0u;
                  v136 = 0u;
                  v133 = 0u;
                  v134 = 0u;
                  v131 = 0u;
                  v132 = 0u;
                }
                fprintf(v7, "\t%6u\t\t%6u\t\t%.2f%%\t\t%.4f%%\n");
              }
              else
              {
                objc_msgSend(v27, "drawCallIndex");
                objc_msgSend(v27, "functionIndex");
                if (v27)
                {
                  objc_msgSend(v27, "computeTiming");
                }
                else
                {
                  v135 = 0u;
                  v136 = 0u;
                  v134 = 0u;
                }
                fprintf(v7, "\t%6u\t\t%6u\t\t%.4f%%\n");
              }

            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v118, v139, 16);
          }
          while (v22);
        }

        v9 = v9 + v12;
        v10 = v104 + 1;
      }
      while ((id)(v104 + 1) != v101);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v140, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0.0;
  }

  fclose(v7);
  v102 = (void *)objc_opt_new(NSMutableArray, v28);
  v88 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(self->_options->var0, "stringByAppendingFormat:", CFSTR("/DrawCallCosts_Unsorted.txt"))));
  v29 = fopen((const char *)objc_msgSend(v88, "UTF8String"), "wb");
  fwrite("\tindex\tfunctionIndex\t\tVert\t\t    Fragment\t\tCompute\t\tVS_Hash\t\tFS_Hash\t\tCS_HASH\tNumSamples\n", 0x58uLL, 1uLL, v29);
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v96 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "drawCallInfoList"));
  v30 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v114, v138, 16);
  v99 = v29;
  if (v30)
  {
    v105 = *(_QWORD *)v115;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(_QWORD *)v115 != v105)
          objc_enumerationMutation(v96);
        v32 = *(_QWORD **)(*((_QWORD *)&v114 + 1) + 8 * (_QWORD)j);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "programInfo"));
        if (v34)
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "programInfo"));
          v36 = objc_msgSend(v35, "programId") == (id)-1;

          if (v36)
            continue;
        }
        v37 = (void *)objc_opt_new(NSMutableDictionary, v33);
        objc_msgSend(v102, "addObject:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "drawCallIndex")));
        objc_msgSend(v37, "setObject:forKeyedSubscript:", v38, CFSTR("Index"));

        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "functionIndex")));
        objc_msgSend(v37, "setObject:forKeyedSubscript:", v39, CFSTR("FunctionIndex"));

        if (v32)
        {
          objc_msgSend(v32, "vertexTiming");
          v40 = *(double *)&v134;
        }
        else
        {
          v135 = 0u;
          v136 = 0u;
          v40 = 0.0;
          v134 = 0u;
        }
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v40 * 100.0 / v5));
        objc_msgSend(v37, "setObject:forKeyedSubscript:", v41, CFSTR("VS_Percent"));

        if (v32)
        {
          objc_msgSend(v32, "fragmentTiming");
          v42 = *(double *)&v134;
        }
        else
        {
          v135 = 0u;
          v136 = 0u;
          v42 = 0.0;
          v134 = 0u;
        }
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v42 * 100.0 / v5));
        objc_msgSend(v37, "setObject:forKeyedSubscript:", v43, CFSTR("FS_Percent"));

        if (v32)
        {
          objc_msgSend(v32, "computeTiming");
          v44 = *(double *)&v134;
        }
        else
        {
          v135 = 0u;
          v136 = 0u;
          v44 = 0.0;
          v134 = 0u;
        }
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v44 * 100.0 / v5));
        objc_msgSend(v37, "setObject:forKeyedSubscript:", v45, CFSTR("CS_Percent"));

        v46 = objc_msgSend(v32, "drawCallIndex");
        v47 = objc_msgSend(v32, "functionIndex");
        if (v32)
        {
          objc_msgSend(v32, "vertexTiming");
          v48 = *(double *)&v134;
          objc_msgSend(v32, "fragmentTiming");
          v49 = *(double *)&v131;
          objc_msgSend(v32, "computeTiming");
          v50 = *(double *)&v128;
        }
        else
        {
          v135 = 0u;
          v136 = 0u;
          v133 = 0u;
          v134 = 0u;
          v131 = 0u;
          v132 = 0u;
          v129 = 0u;
          v130 = 0u;
          v50 = 0.0;
          v49 = 0.0;
          v48 = 0.0;
          v128 = 0u;
        }
        v51 = (void *)v32[1];
        if (v51)
          v52 = (const char *)objc_msgSend(v51, "UTF8String");
        else
          v52 = "\t\t";
        v53 = (void *)v32[2];
        if (v53)
          v54 = (const char *)objc_msgSend(v53, "UTF8String");
        else
          v54 = "\t\t";
        v55 = (void *)v32[3];
        if (v55)
          v56 = (const char *)objc_msgSend(v55, "UTF8String");
        else
          v56 = "\t\t";
        objc_msgSend(v32, "vertexTiming");
        objc_msgSend(v32, "computeTiming");
        objc_msgSend(v32, "fragmentTiming");
        fprintf(v99, "\t%6u\t\t%6u\t\t%10.4f%%\t\t%10.4f%%\t\t%10.4f%%\t\t%s\t%s\t%s\t%g\n", v46, v47, v48 * 100.0 / v5, v49 * 100.0 / v5, v50 * 100.0 / v5, v52, v54, v56, v113 + v112 + v111);

      }
      v30 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v114, v138, 16);
    }
    while (v30);
  }

  if (v99)
    fclose(v99);

  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "drawCallInfoList"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "sortedArrayUsingComparator:", &__block_literal_global_504));

  v103 = (void *)objc_opt_new(NSMutableArray, v58);
  v92 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(self->_options->var0, "stringByAppendingFormat:", CFSTR("/DrawCallCosts_Sorted.txt"))));
  v59 = fopen((const char *)objc_msgSend(v92, "UTF8String"), "wb");
  fwrite("\tindex\tfunctionIndex\t\tVert\t\t    Fragment\t\tCompute\t\tVS_Hash\t\tFS_Hash\t\tCS_HASH\n", 0x4DuLL, 1uLL, v59);
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v97 = v89;
  v60 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v107, v137, 16);
  v100 = v59;
  if (v60)
  {
    v106 = *(_QWORD *)v108;
    do
    {
      for (k = 0; k != v60; k = (char *)k + 1)
      {
        if (*(_QWORD *)v108 != v106)
          objc_enumerationMutation(v97);
        v62 = *(_QWORD **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)k);
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "programInfo"));
        if (v64)
        {
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "programInfo"));
          v66 = objc_msgSend(v65, "programId") == (id)-1;

          if (v66)
            continue;
        }
        v67 = (void *)objc_opt_new(NSMutableDictionary, v63);
        objc_msgSend(v103, "addObject:", v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v62, "drawCallIndex")));
        objc_msgSend(v67, "setObject:forKeyedSubscript:", v68, CFSTR("Index"));

        v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v62, "functionIndex")));
        objc_msgSend(v67, "setObject:forKeyedSubscript:", v69, CFSTR("FunctionIndex"));

        if (v62)
        {
          objc_msgSend(v62, "vertexTiming");
          v70 = *(double *)&v134;
        }
        else
        {
          v135 = 0u;
          v136 = 0u;
          v70 = 0.0;
          v134 = 0u;
        }
        v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v70 * 100.0 / v5));
        objc_msgSend(v67, "setObject:forKeyedSubscript:", v71, CFSTR("VS_Percent"));

        if (v62)
        {
          objc_msgSend(v62, "fragmentTiming");
          v72 = *(double *)&v134;
        }
        else
        {
          v135 = 0u;
          v136 = 0u;
          v72 = 0.0;
          v134 = 0u;
        }
        v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v72 * 100.0 / v5));
        objc_msgSend(v67, "setObject:forKeyedSubscript:", v73, CFSTR("FS_Percent"));

        if (v62)
        {
          objc_msgSend(v62, "computeTiming");
          v74 = *(double *)&v134;
        }
        else
        {
          v135 = 0u;
          v136 = 0u;
          v74 = 0.0;
          v134 = 0u;
        }
        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v74 * 100.0 / v5));
        objc_msgSend(v67, "setObject:forKeyedSubscript:", v75, CFSTR("CS_Percent"));

        v76 = objc_msgSend(v62, "drawCallIndex");
        v77 = objc_msgSend(v62, "functionIndex");
        if (v62)
        {
          objc_msgSend(v62, "vertexTiming");
          v78 = *(double *)&v134;
          objc_msgSend(v62, "fragmentTiming");
          v79 = *(double *)&v131;
          objc_msgSend(v62, "computeTiming");
          v80 = *(double *)&v128;
        }
        else
        {
          v135 = 0u;
          v136 = 0u;
          v133 = 0u;
          v134 = 0u;
          v131 = 0u;
          v132 = 0u;
          v129 = 0u;
          v130 = 0u;
          v80 = 0.0;
          v79 = 0.0;
          v78 = 0.0;
          v128 = 0u;
        }
        v81 = (void *)v62[1];
        if (v81)
          v82 = (const char *)objc_msgSend(v81, "UTF8String");
        else
          v82 = "\t\t";
        v83 = (void *)v62[2];
        if (v83)
          v84 = (const char *)objc_msgSend(v83, "UTF8String");
        else
          v84 = "\t\t";
        v85 = (void *)v62[3];
        if (v85)
          v86 = (const char *)objc_msgSend(v85, "UTF8String");
        else
          v86 = "\t\t";
        fprintf(v100, "\t%6u\t\t%6u\t\t%10.4f%%\t\t%10.4f%%\t\t%10.4f%%\t\t%s\t%s\t%s\n", v76, v77, v78 * 100.0 / v5, v79 * 100.0 / v5, v80 * 100.0 / v5, v82, v84, v86);

      }
      v60 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v107, v137, 16);
    }
    while (v60);
  }

  if (v100)
    fclose(v100);

  if (v5 > 1.0)
  {
    if (vabdd_f64(v5, v9) <= 0.1 && v5 >= 1.0)
      goto LABEL_104;
LABEL_106:
    v87 = "Failed";
    goto LABEL_107;
  }
  if (v5 < 1.0)
    goto LABEL_106;
LABEL_104:
  v87 = "Passed";
LABEL_107:
  fprintf(__stdoutp, "%s Shader Profling Test\n", v87);

}

- (void)_showDrawCallDataforResult:(id)a3
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  unint64_t v7;
  double *v8;
  double *v9;
  unint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  double v16;
  double v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int v20;
  double v22;
  uint64_t v23;
  const char *v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "vertexTiming");
    objc_msgSend(v4, "fragmentTiming");
    v5 = *(double *)&v33 + *(double *)&v30;
  }
  else
  {
    v5 = 0.0;
  }
  fwrite("index\tfunctionIndex\tvertTiming\tvertCyclePercent\fragTiming\tfragmentCyclePercent", 0x4EuLL, 1uLL, __stdoutp);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "drawCallInfoList"));
  v7 = (unint64_t)objc_msgSend(v6, "count");
  if (v7 >= 0x10)
  {
    v10 = v7 >> 4;
    v8 = (double *)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v7 >> 4);
    bzero(v8, 8 * v10);
    v9 = &v8[v10];
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "drawCallInfoList"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        if (v15)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "vertexTiming");
          v16 = *(double *)&v33;
          objc_msgSend(v15, "fragmentTiming");
          v17 = *(double *)&v30;
        }
        else
        {
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v17 = 0.0;
          v16 = 0.0;
          v30 = 0u;
          v31 = 0u;
        }
        v18 = objc_msgSend(v15, "drawCallIndex");
        v8[v18 >> 4] = v16 * 100.0 / v5 + v17 * 100.0 / v5 + v8[v18 >> 4];
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v12);
  }

  fwrite("Encoder Index\t Percentage Frame\n", 0x20uLL, 1uLL, __stdoutp);
  if (v9 != v8)
  {
    v19 = 0;
    v20 = 1;
    do
    {
      fprintf(__stdoutp, "%u\t %g\n", v20 - 1, v8[v19]);
      v19 = v20;
    }
    while (v9 - v8 > (unint64_t)v20++);
  }
  v22 = *v8;
  v23 = 1;
  v24 = "Failed";
  do
  {
    v25 = v8[v23];
    if (fabs(v22 / v25 + -4.0) <= 1.6)
    {
      v22 = v8[v23];
    }
    else
    {
      fprintf(__stdoutp, "Failed ratio %g / %g = %g\n", v22, v8[v23], v22 / v25);
      if (v8[v23] >= 1.0)
        goto LABEL_27;
    }
    ++v23;
  }
  while (v23 != 4);
  v24 = "Passed";
LABEL_27:
  fprintf(__stdoutp, "%s Shader Profling Test\n", v24);
  operator delete(v8);

}

- (void)_calculateRealTimeInfoWithGPUTime:(double)a3 forShaderInfoResult:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  uint64_t v11;
  BOOL v12;
  void *i;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v5 = a4;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "vertexTiming");
    objc_msgSend(v6, "fragmentTiming");
    objc_msgSend(v6, "computeTiming");
    v7 = *(double *)&v26 + v25 + v24;
  }
  else
  {
    v7 = 0.0;
  }
  if (v7 >= 0.01)
    v8 = v7;
  else
    v8 = 0.01;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "drawCallInfoList"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v21;
    v12 = a3 == 0.0 || v8 == 0.0;
    v19 = a3 / v8;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v9);
        if (!v12)
        {
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v15 = v19 * *(double *)(v14 + 56);
          *(float64x2_t *)(v14 + 64) = vmulq_n_f64(*(float64x2_t *)(v14 + 40), v19);
          *(double *)(v14 + 80) = v15;
          v16 = v19 * *(double *)(v14 + 104);
          *(float64x2_t *)(v14 + 112) = vmulq_n_f64(*(float64x2_t *)(v14 + 88), v19);
          *(double *)(v14 + 128) = v16;
          v17 = v19 * *(double *)(v14 + 152);
          *(float64x2_t *)(v14 + 160) = vmulq_n_f64(*(float64x2_t *)(v14 + 136), v19);
          *(double *)(v14 + 176) = v17;
          v18 = v19 * *(double *)(v14 + 200);
          *(float64x2_t *)(v14 + 208) = vmulq_n_f64(*(float64x2_t *)(v14 + 184), v19);
          *(double *)(v14 + 224) = v18;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    }
    while (v10);
  }

  if (v6)
  {
    objc_msgSend(v6, "vertexTiming");
    objc_msgSend(v6, "fragmentTiming");
    objc_msgSend(v6, "computeTiming");
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v26 = 0u;
  }

}

- (id)_extractShaderBinaryTextSegment:(id)a3
{
  id v3;
  id v4;
  _DWORD *v5;
  _DWORD *v6;
  int i;
  int v8;
  _DWORD *v9;

  v3 = a3;
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "binary")));
  v5 = objc_msgSend(v4, "bytes");

  if (v5)
  {
    v6 = v5 + 8;
    for (i = v5[4]; i; --i)
    {
      if (*v6 == 25)
        break;
      v6 = (_DWORD *)((char *)v6 + v6[1]);
    }
    v8 = v6[16];
    if (v8)
    {
      v9 = v6 + 18;
      while (v9[4] != 1163157343 || *(_DWORD *)((char *)v9 + 19) != 5527621)
      {
        v9 += 20;
        if (!--v8)
          goto LABEL_12;
      }
      v5 = (_DWORD *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", (char *)v5 + v9[12], v9[10]));
    }
    else
    {
LABEL_12:
      v5 = 0;
    }
  }

  return v5;
}

- (id)_calculatePerDrawCallCostWithSampleData:(id)a3 targetIndex:(int)a4
{
  id v5;
  unsigned int *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  double v10;
  uint64_t v11;
  unsigned int v12;
  double v13;
  double *v14;
  void *v15;
  void *v16;
  double *i;
  void *v18;
  void *v19;
  int v21;
  __int128 v22;
  __int128 v23;
  int v24;

  v22 = 0u;
  v23 = 0u;
  v24 = 1065353216;
  v5 = objc_retainAutorelease(a3);
  v6 = (unsigned int *)objc_msgSend(v5, "bytes");
  v7 = (unint64_t)objc_msgSend(v5, "length");
  v10 = 0.0;
  v11 = (v7 / 0x14);
  if ((v7 / 0x14))
  {
    do
    {
      v8 = *v6;
      v12 = v6[1];
      v21 = *v6;
      if ((a4 & 0x80000000) == 0 || v12 == 3)
      {
        if (a4 < 0)
        {
          v13 = 1.0;
        }
        else
        {
          LODWORD(v9) = v6[4];
          v13 = (double)v12 / (double)v9;
        }
        v14 = (double *)std::__hash_table<std::__hash_value_type<unsigned int,double>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,double>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,double>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,double>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((float *)&v22, v8, &v21);
        v10 = v10 + v13;
        v14[3] = v13 + v14[3];
      }
      v6 += 5;
      --v11;
    }
    while (v11);
  }
  v15 = (void *)objc_opt_new(DYShaderAnalyzerResult, v8);
  objc_msgSend(v15, "setTotalCost:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", *((_QWORD *)&v23 + 1)));
  objc_msgSend(v15, "setDrawCallCost:", v16);
  for (i = (double *)v23; i; i = *(double **)i)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", i[3]));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)i + 4)));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, v19);

  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v22);

  return v15;
}

- (id)_createPerLineCostDictionaryWith:(const void *)a3 lineOffset:(unsigned int)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (*(_QWORD *)a3 != *((_QWORD *)a3 + 1))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *((double *)a3 + 3)));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("totalCost"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("perLineCost"));

    v10 = *(_QWORD *)a3;
    v9 = *((_QWORD *)a3 + 1);
    if (v9 != *(_QWORD *)a3)
    {
      v11 = 0;
      v12 = 1;
      do
      {
        if (*(double *)(v10 + 8 * v11) > 2.22044605e-16)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("perLineCost")));
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a4 + v12 - 1));
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

          v10 = *(_QWORD *)a3;
          v9 = *((_QWORD *)a3 + 1);
        }
        v11 = v12++;
      }
      while (v11 < (v9 - v10) >> 3);
    }
  }
  return v6;
}

- (id)_createPerFileCostDictionaryWith:(const void *)a3 lineOffset:(unsigned int)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  void *v9;
  uint64_t **i;
  void *v11;
  void *v12;
  void *v13;

  v4 = *(_QWORD *)&a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _createPerLineCostDictionaryWith:lineOffset:](self, "_createPerLineCostDictionaryWith:lineOffset:", a3, v4));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("allDrawCall"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", *((_QWORD *)a3 + 7)));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("perDrawCall"));

  for (i = (uint64_t **)*((_QWORD *)a3 + 6); i; i = (uint64_t **)*i)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _createPerLineCostDictionaryWith:lineOffset:](self, "_createPerLineCostDictionaryWith:lineOffset:", i + 3, v4));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("perDrawCall")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)i + 4)));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

  }
  return v7;
}

- (id)_createPerFileLineCostDictionaryForCIWith:(const void *)a3 lineOffset:(unsigned int)a4
{
  void *v6;
  double *i;
  id v8;
  unsigned int j;
  uint64_t v10;
  unint64_t v11;
  double v12;
  unsigned int v13;
  void *v14;
  void *v15;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", *((_QWORD *)a3 + 7)));
  for (i = (double *)*((_QWORD *)a3 + 6); i; i = *(double **)i)
  {
    v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", a4 + ((uint64_t)(*((_QWORD *)i + 4) - *((_QWORD *)i + 3)) >> 3));
    for (j = a4; j; --j)
      objc_msgSend(v8, "addObject:", &off_7399D0);
    v10 = *((_QWORD *)i + 3);
    if (*((_QWORD *)i + 4) != v10)
    {
      v11 = 0;
      v12 = 100.0 / (i[6] + 2.22507386e-308);
      v13 = 1;
      do
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12 * *(double *)(v10 + 8 * v11)));
        objc_msgSend(v8, "addObject:", v14);

        v11 = v13;
        v10 = *((_QWORD *)i + 3);
        ++v13;
      }
      while (v11 < (*((_QWORD *)i + 4) - v10) >> 3);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), *((unsigned int *)i + 4)));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v15);

  }
  return v6;
}

- (void)_saveDebugInfoFrom:(id)a3 to:(id)a4 targetIndex:(int)a5
{
  -[GTShaderProfilerHelper _saveDebugInfoFrom:to:withTextSegment:targetIndex:](self, "_saveDebugInfoFrom:to:withTextSegment:targetIndex:", a3, a4, 0, 0xFFFFFFFFLL);
}

- (void)_saveDebugInfoFrom:(id)a3 to:(id)a4 withTextSegment:(id)a5 targetIndex:(int)a6
{
  id v8;
  id v9;
  lldb::SBDebugger *v10;
  id v11;
  _QWORD v12[2];
  _BYTE v13[8];
  _QWORD v14[2];
  _BYTE v15[23];

  v8 = a3;
  v9 = a4;
  v10 = (lldb::SBDebugger *)a5;
  lldb::SBDebugger::Create(v10);
  if ((lldb::SBDebugger::IsValid((lldb::SBDebugger *)v15) & 1) != 0)
  {
    v11 = objc_retainAutorelease(v8);
    lldb::SBDebugger::CreateTargetWithFileAndArch(v14, (lldb::SBDebugger *)v15, (const char *)objc_msgSend(v11, "UTF8String"), "16777235-0");
    if ((lldb::SBTarget::IsValid((lldb::SBTarget *)v14) & 1) != 0)
    {
      lldb::SBFileSpec::SBFileSpec((lldb::SBFileSpec *)v13, (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), 1);
      lldb::SBTarget::FindModule(v12, (lldb::SBTarget *)v14, (const lldb::SBFileSpec *)v13);
      if (lldb::SBModule::GetNumCompileUnits((lldb::SBModule *)v12)
        && fopen((const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), "wt"))
      {
        operator new();
      }
      lldb::SBModule::~SBModule((lldb::SBModule *)v12);
      lldb::SBFileSpec::~SBFileSpec((lldb::SBFileSpec *)v13);
    }
    lldb::SBTarget::~SBTarget((lldb::SBTarget *)v14);
  }
  lldb::SBDebugger::~SBDebugger((lldb::SBDebugger *)v15);

}

- (void)_dumpShaderBinaryInfo:(id)a3 usingKey:(id)a4 withBaseFileName:(id)a5 targetIndex:(int)a6
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "binary"));

  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR(".bin")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "binary"));
    objc_msgSend(v11, "writeToFile:atomically:", v10, 0);

    objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _extractShaderBinaryTextSegment:](self, "_extractShaderBinaryTextSegment:", v12));
    operator new();
  }

}

- (void)_saveShaderBinariesWith:(id)a3 targetIndex:(int)a4
{
  void *v6;
  id v7;
  FILE *v8;
  unsigned int i;
  void *v10;
  id v11;
  void *v12;
  GTShaderProfilerHelper *v13;
  _QWORD *v14;
  unsigned int v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  id v22;
  FILE *v23;
  int v24;
  unsigned int v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id *v30;
  unsigned int v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  const char *v36;
  id v37;
  const char *v38;
  const char *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  int j;
  unsigned int v48;
  id *v49;
  _QWORD v50[5];
  id v51;
  int v52;
  _QWORD v53[5];
  id v54;
  int v55;
  _QWORD v56[5];
  id v57;
  int v58;
  _QWORD v59[5];
  id v60;
  int v61;

  v49 = (id *)a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->_options->var0, "stringByAppendingPathComponent:", CFSTR("/shaderBinaries")));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("/legacy-drawCallToBinariesMap.txt"))));
  v8 = fopen((const char *)objc_msgSend(v7, "UTF8String"), "wt");

  if (v8)
  {
    fwrite("Index | DisplayIdx |          VS_Hash     |          FS_Hash     |         CS_Hash        \n", 0x5BuLL, 1uLL, v8);
    for (i = 0; ; ++i)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "drawCallInfoList"));
      v11 = objc_msgSend(v10, "count");

      if ((unint64_t)v11 <= i)
        break;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "drawCallInfoList"));
      v13 = self;
      v14 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", i));

      v15 = objc_msgSend(v14, "functionIndex");
      v16 = (void *)v14[1];
      if (v16)
        v17 = (const char *)objc_msgSend(v16, "UTF8String");
      else
        v17 = "";
      v18 = (void *)v14[2];
      if (v18)
        v19 = (const char *)objc_msgSend(v18, "UTF8String");
      else
        v19 = "";
      v20 = (void *)v14[3];
      if (v20)
        v21 = (const char *)objc_msgSend(v20, "UTF8String");
      else
        v21 = "";
      fprintf(v8, "%5u | %10u | %19s | %19s | %19s\n", i, v15, v17, v19, v21);

      self = v13;
    }
    fclose(v8);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("/drawCallToBinariesMap.txt"))));
    v23 = fopen((const char *)objc_msgSend(v22, "UTF8String"), "wt");

    if (v23)
    {
      v24 = a4;
      fwrite("Index | DisplayIdx | All Binary keys\n", 0x25uLL, 1uLL, v23);
      v25 = 0;
      v26 = v6;
      for (j = a4; ; v24 = j)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "drawCallInfoList"));
        v28 = objc_msgSend(v27, "count");

        if ((unint64_t)v28 <= v25)
          break;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "drawCallInfoList"));
        v48 = v25;
        v30 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", v25));

        fprintf(v23, "%5u | %10u |", v25, objc_msgSend(v30, "functionIndex"));
        v31 = 0;
        while (1)
        {
          v32 = v31;
          if ((unint64_t)objc_msgSend(v30[4], "count") <= v31)
            break;
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30[4], "objectAtIndexedSubscript:", v31));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49[33], "objectForKeyedSubscript:", v33));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "type"));

          if (v32)
            v36 = ", ";
          else
            v36 = " ";
          v37 = objc_retainAutorelease(v33);
          v38 = (const char *)objc_msgSend(v37, "UTF8String");
          if (v35)
            v39 = (const char *)objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
          else
            v39 = "";
          fprintf(v23, "%s%s(%s)", v36, v38, v39);

          v31 = v32 + 1;
          v6 = v26;
        }
        fputc(10, v23);

        v25 = v48 + 1;
      }
      fclose(v23);
      v40 = v49[30];
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke;
      v59[3] = &unk_7255C8;
      v59[4] = self;
      v41 = v6;
      v60 = v41;
      v61 = v24;
      objc_msgSend(v40, "enumerateKeysAndObjectsUsingBlock:", v59);
      v42 = v49[31];
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke_2;
      v56[3] = &unk_7255C8;
      v56[4] = self;
      v43 = v41;
      v57 = v43;
      v58 = v24;
      objc_msgSend(v42, "enumerateKeysAndObjectsUsingBlock:", v56);
      v44 = v49[32];
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke_3;
      v53[3] = &unk_7255C8;
      v53[4] = self;
      v45 = v43;
      v54 = v45;
      v55 = v24;
      objc_msgSend(v44, "enumerateKeysAndObjectsUsingBlock:", v53);
      v46 = v49[33];
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke_4;
      v50[3] = &unk_7255C8;
      v50[4] = self;
      v51 = v45;
      v52 = v24;
      objc_msgSend(v46, "enumerateKeysAndObjectsUsingBlock:", v50);

    }
  }

}

- (id)_setupLimiterInfoPerDrawCall:(id)a3 forPayload:(id)a4 withShaderInfo:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unsigned int *v12;
  id v13;
  unsigned int v14;
  void *i;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  BOOL v23;
  unsigned int *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  unsigned int *v36;
  void *v37;
  char *j;
  void *v39;
  void *v40;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  id v51;
  id obj;
  id obja;
  unsigned int *__p;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];

  v46 = a3;
  v43 = a4;
  v44 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("LimiterCounterData")));
  v45 = v7;
  if (v7)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("derivedCounterData")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("counters")));
    v9 = v8;
    if (!v8)
    {
      v49 = 0;
LABEL_50:

      goto LABEL_51;
    }
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

    v10 = (unint64_t)objc_msgSend(&off_738AD8, "count");
    v11 = v10;
    if (v10)
    {
      if (v10 >> 62)
        abort();
      v12 = (unsigned int *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>(v10);
      bzero(v12, 4 * v11);
    }
    else
    {
      v12 = 0;
    }
    __p = v12;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    obja = obj;
    v13 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    if (v13)
    {
      v14 = 0;
      v55 = *(_QWORD *)v64;
      v57 = 0;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v64 != v55)
            objc_enumerationMutation(obja);
          v16 = 0;
          v17 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i);
          while (1)
          {
            v18 = v16;
            if ((unint64_t)objc_msgSend(&off_738AD8, "count") <= v16)
              break;
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_738AD8, "objectAtIndexedSubscript:", v16));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_7391A8, "objectForKeyedSubscript:", v19));

            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_738AD8, "objectAtIndexedSubscript:", v18));
            if ((objc_msgSend(v17, "isEqualToString:", v21) & 1) != 0)
            {

LABEL_23:
              v12[v18] = v14;

              ++v57;
              break;
            }
            if (v20)
            {
              v22 = objc_msgSend(v17, "isEqualToString:", v20);

              if ((v22 & 1) != 0)
                goto LABEL_23;
            }
            else
            {

            }
            v16 = v18 + 1;
          }
          ++v14;
        }
        v13 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
      }
      while (v13);
    }
    else
    {
      v57 = 0;
    }

    v23 = v57 == objc_msgSend(&off_738AD8, "count");
    v24 = v12;
    if (v23)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("AverageSamples")));
      v49 = (id)objc_opt_new(NSMutableArray, v25);
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v47 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "drawCallInfoList"));
      v26 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      if (v26)
      {
        v50 = *(_QWORD *)v60;
        do
        {
          v27 = 0;
          v51 = v26;
          do
          {
            if (*(_QWORD *)v60 != v50)
              objc_enumerationMutation(v47);
            v28 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "programInfo"));
            v56 = v27;
            if (!v29
              || (v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "programInfo")),
                  v31 = objc_msgSend(v30, "programId") == (id)-1,
                  v30,
                  v29,
                  !v31))
            {
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectAtIndexedSubscript:", objc_msgSend(v28, "encoderIndex")));
              v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 3));
              v34 = objc_msgSend(&off_738AF0, "count");
              v35 = 0;
              v36 = __p;
              do
              {
                v37 = (void *)objc_opt_new(NSMutableDictionary, v33);
                if (v34)
                {
                  for (j = 0; j != v34; ++j)
                  {
                    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndexedSubscript:", v36[(_QWORD)j]));
                    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_738AF0, "objectAtIndexedSubscript:", j));
                    objc_msgSend(v37, "setObject:forKeyedSubscript:", v39, v40);

                  }
                }
                objc_msgSend(v58, "addObject:", v37);

                ++v35;
                v36 += (uint64_t)v34;
              }
              while (v35 != 3);
              objc_msgSend(v49, "addObject:", v58);

            }
            v27 = v56 + 1;
          }
          while ((id)(v56 + 1) != v51);
          v26 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
        }
        while (v26);
      }

      v24 = __p;
      if (!__p)
        goto LABEL_49;
    }
    else
    {
      v49 = 0;
      if (!v12)
      {
LABEL_49:

        goto LABEL_50;
      }
    }
    operator delete(v24);
    goto LABEL_49;
  }
  v49 = 0;
LABEL_51:

  return v49;
}

- (double)_waitLatencyAdjustmentWithLimiterData:(id)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  double v24;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", *(unsigned int *)(*(_QWORD *)a5 + 4) + a4));
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", **(unsigned int **)a5 + a4));
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", *(unsigned int *)(*(_QWORD *)a5 + 8) + a4));
  objc_msgSend(v14, "doubleValue");
  v15 = v13 * 0.01;
  v16 = v10 * 0.01;
  v18 = v17 * 0.01;

  if (v15 >= v18)
    v19 = v15;
  else
    v19 = v18;
  v20 = v16 / (v19 + 0.00001);
  v21 = 1.0 - v20;
  v22 = v20 < 1.0;
  v23 = 0.0;
  if (v22)
    v23 = v21;
  v24 = (1.0 - (v16 + (1.0 - v16) * 0.5)) * (1.0 - v16 / (v16 + v19 + 0.00001)) + (v16 + (1.0 - v16) * 0.5) * v23;

  return v24;
}

- (double)_latencyAdjustmentWithLimiterData:(id)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5
{
  uint64_t v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double result;

  v8 = 0;
  v9 = 0.0;
  do
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectAtIndexedSubscript:", *(unsigned int *)(*(_QWORD *)a5 + v8) + a4));
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    if (v9 < v12)
      v9 = v12;
    v8 += 4;
  }
  while (v8 != 36);
  result = 0.0;
  if (v9 * 0.01 < 1.0)
    return 1.0 - v9 * 0.01;
  return result;
}

- (double)_latencyAdjustmentFactorWithLimiterData:(id)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5 forLimiterType:(unsigned int)a6
{
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;

  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", *(unsigned int *)(*(_QWORD *)a5 + 4) + a4));
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", *(unsigned int *)(*(_QWORD *)a5 + 4 * a6) + a4));
  objc_msgSend(v13, "doubleValue");
  v15 = v14 * 0.01;

  return 1.0 - v12 * 0.01 / (v12 * 0.01 + v15 + 0.00001);
}

- (double)_waitLatencyAdjustmentFactorWithLimiterDataForDraw:(id)a3 forDataMaster:(unsigned int)a4
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  double v20;
  double v21;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectAtIndexedSubscript:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ALU")));
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TPU")));
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GlobalLoad")));
  objc_msgSend(v11, "doubleValue");
  v12 = v10 * 0.01;
  v13 = v7 * 0.01;
  v15 = v14 * 0.01;

  if (v12 >= v15)
    v16 = v12;
  else
    v16 = v15;
  v17 = v13 / (v16 + 0.00001);
  v18 = 1.0 - v17;
  v19 = v17 < 1.0;
  v20 = 0.0;
  if (v19)
    v20 = v18;
  v21 = (1.0 - (v13 + (1.0 - v13) * 0.5)) * (1.0 - v13 / (v13 + v16 + 0.00001)) + (v13 + (1.0 - v13) * 0.5) * v20;

  return v21;
}

- (double)_latencyAdjustmentFactorWithLimiterDataForDraw:(id)a3 forDataMaster:(unsigned int)a4
{
  void *v4;
  double v5;
  double v6;
  _QWORD v8[5];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectAtIndexedSubscript:", a4));
  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __87__GTShaderProfilerHelper__latencyAdjustmentFactorWithLimiterDataForDraw_forDataMaster___block_invoke;
  v8[3] = &unk_7255F0;
  v8[4] = &v9;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);
  v5 = v10[3] * 0.01;
  if (v5 >= 1.0)
    v6 = 0.0;
  else
    v6 = 1.0 - v5;
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (double)_latencyAdjustmentFactorWithLimiterDataForDraw:(id)a3 forDataMaster:(unsigned int)a4 forLimiterType:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectAtIndexedSubscript:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ALU")));
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));
  objc_msgSend(v12, "doubleValue");
  v14 = v13 * 0.01;

  return 1.0 - v11 * 0.01 / (v11 * 0.01 + v14 + 0.00001);
}

- (id)_codeGenCounterProcessing:(id)a3 derivedCounterNames:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];

  v5 = a3;
  v23 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v33;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "appendFormat:", CFSTR("var %@_norm = 0;\n"),
          *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v8);
  }

  objc_msgSend(v6, "appendString:", CFSTR("var _DerivedCounterResult = [];\n\n"));
  objc_msgSend(v6, "appendFormat:", CFSTR("function _SetAndEvaluateRawCounterValues(numSamples, gpuCyclesCounterIndex) {\n"));
  objc_msgSend(v6, "appendString:", CFSTR("\t_DerivedCounterResult = [];\n"));
  objc_msgSend(v6, "appendString:", CFSTR("\tfor (var sampleIndex = 0; sampleIndex < numSamples; ++sampleIndex) {\n"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\t\tvar sampleStartIndex = sampleIndex * %lu;\n"), objc_msgSend(v7, "count"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\t\tvar gpuCycles = _RawCounterValues[gpuCyclesCounterIndex + sampleStartIndex] / num_cores;\n"));
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v12)
  {
    v13 = 0;
    v14 = *(_QWORD *)v29;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v15);
        objc_msgSend(v6, "appendFormat:", CFSTR("\t\t%@_norm = 100.0 * (_RawCounterValues[%lu + sampleStartIndex] / gpuCycles);\n"),
          v16,
          (char *)v15 + v13);

        v15 = (char *)v15 + 1;
      }
      while (v12 != v15);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      v13 += (uint64_t)v15;
    }
    while (v12);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = v23;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v25;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v17);
        v21 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v20);
        objc_msgSend(v6, "appendFormat:", CFSTR("\t\ttry { value = %@(); if (!isFinite(value)) { value = 0; } _DerivedCounterResult.push(value); } catch(err) { ErrorLog(err); _DerivedCounterResult.push(0); }\n"),
          v21);

        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v18);
  }

  objc_msgSend(v6, "appendFormat:", CFSTR("\t}\n"));
  objc_msgSend(v6, "appendFormat:", CFSTR("}\n"));

  return v6;
}

- (BOOL)_prepareCounterNames:(id)a3 derivedCounterNames:(id)a4 withContext:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _codeGenCounterProcessing:derivedCounterNames:](self, "_codeGenCounterProcessing:derivedCounterNames:", a3, a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "context"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &__block_literal_global_651, CFSTR("ErrorLog"));

  LOBYTE(v10) = objc_msgSend(v8, "evaluteScript:scriptURL:", v9, 0);
  return (char)v10;
}

- (id)_prepareAndEvaluateCounterValues:(unsigned int *)a3 numElementsPerSample:(unint64_t)a4 numSamples:(unint64_t)a5 withContext:(id)a6 withGPUCyclesCounterIndex:(unint64_t)a7
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v11 = a6;
  objc_msgSend(v11, "setRawArrayValues:withUint32Values:andNumCounters:", CFSTR("_RawCounterValues"), a3, a5 * a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", a5));
  v18[0] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", a7));
  v18[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
  objc_msgSend(v11, "callFunction:withArguments:", CFSTR("_SetAndEvaluateRawCounterValues"), v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getValue:", CFSTR("_DerivedCounterResult")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "toArray"));

  return v16;
}

- (void)_PrintLimiterData:(PerfCounterCompressedSample *)a3 withRawLimiterList:(id)a4 withDerivedCounters:(id)a5 andDerivedCounterNames:(id)a6
{
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  void *v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unsigned int v23;
  id v24;

  v24 = a4;
  v9 = a5;
  v10 = a6;
  if ((*(_DWORD *)a3 & 0x3FFFFFF) != 0)
  {
    v23 = 0;
    do
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
      v12 = 0;
      v13 = v23 * (*(unsigned int *)a3 >> 26);
      while (1)
      {
        v14 = v12;
        if ((unint64_t)objc_msgSend(v24, "count") <= v12)
          break;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", v12));
        objc_msgSend(v11, "appendFormat:", CFSTR("%@ = %u, "), v15, a3->var2[v13 + v14]);

        v12 = v14 + 1;
      }
      NSLog(CFSTR("%@"), v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
      v17 = 0;
      v18 = v23 * objc_msgSend(v10, "count");
      while (1)
      {
        v19 = v17;
        if ((unint64_t)objc_msgSend(v10, "count") <= v17)
          break;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v17));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v18 + v17));
        objc_msgSend(v21, "doubleValue");
        objc_msgSend(v16, "appendFormat:", CFSTR("%@ = %f, "), v20, v22);

        v17 = v19 + 1;
      }
      NSLog(CFSTR("%@"), v16);

      ++v23;
    }
    while (v23 < (*(_DWORD *)a3 & 0x3FFFFFFu));
  }

}

- (id)_processGPURawCounterData:(id)a3 andFillDeivedCounterNames:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("limiter sample data")));
  v9 = v8;
  if (v8)
  {
    v10 = (char *)objc_msgSend(objc_retainAutorelease(v8), "bytes");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("limiter sample counters")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LimiterCounters")));
    if (v13)
    {
      v14 = (void *)objc_opt_new(DYJSScriptingContext, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("DerivedCounterScript")));
      v16 = objc_msgSend(v14, "evaluteScript:scriptURL:", v15, 0);

      if ((v16 & 1) != 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("DerivedCounterDictionary")));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("DerivedCounters")));

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allKeys"));
        if (-[GTShaderProfilerHelper _prepareCounterNames:derivedCounterNames:withContext:](self, "_prepareCounterNames:derivedCounterNames:withContext:", v11, v19, v14))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _prepareAndEvaluateCounterValues:numElementsPerSample:numSamples:withContext:withGPUCyclesCounterIndex:](self, "_prepareAndEvaluateCounterValues:numElementsPerSample:numSamples:withContext:withGPUCyclesCounterIndex:", v10 + 4));
          objc_msgSend(v7, "addObjectsFromArray:", v19);
        }
        else
        {
          v20 = 0;
        }

      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)_calculateEffectiveGPUEncoderCostforData:(id)a3 andPerLimiterBatchCost:(void *)a4 forShaderProfilerResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  unsigned int *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unsigned int *v15;
  uint64_t v16;
  unint64_t v17;
  unsigned int v18;
  unsigned int v19;
  char *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  unint64_t v26;
  uint8x8_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unsigned int v34;
  unsigned int v35;
  size_t v36;
  char *v37;
  void *v38;
  double v39;
  uint64_t *v40;
  uint64_t v41;
  unsigned int v42;
  double *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  char *v49;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  double *v55;
  GTProfilerOptions *options;
  id v57;
  FILE *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t j;
  double v63;
  uint64_t k;
  uint64_t m;
  double v66;
  double v67;
  double v68;
  char *v69;
  GTShaderProfilerHelper *v70;
  void *v71;
  id v72;
  id v73;
  void *i;
  double v75[3];
  __int128 v76;
  __int128 v77;
  int v78;
  __int128 v79;
  __int128 v80;
  int v81;

  v8 = a3;
  v9 = a5;
  v10 = objc_retainAutorelease(v8);
  v11 = (unsigned int *)objc_msgSend(v10, "bytes");
  v12 = (unint64_t)objc_msgSend(v10, "length");
  if (v12 >= 0x18)
  {
    v70 = self;
    v71 = v9;
    v72 = v10;
    v79 = 0u;
    v80 = 0u;
    v81 = 1065353216;
    v76 = 0u;
    v77 = 0u;
    v78 = 1065353216;
    *(_QWORD *)&v75[0] = &v76;
    *(_QWORD *)&v75[1] = &v79;
    *(_QWORD *)&v75[2] = a4;
    v13 = v12 / 0x18 - 1;
    if (v12 / 0x18 != 1)
    {
      v14 = 0;
      while (1)
      {
        v15 = &v11[6 * v14];
        v16 = *(_QWORD *)(v15 + 3);
        v17 = 125 * (*(_QWORD *)(v15 + 9) - v16) / 3uLL;
        v18 = *v15;
        v19 = v15[2];
        if ((*v15 & 1) != 0)
          break;
        v20 = std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::BatchInfo>::operator[]((float *)&v76, v19);
        *(_DWORD *)v20 = (v18 >> 1) & 7;
        *((_QWORD *)v20 + 1) = v16;
        *((_QWORD *)v20 + 2) = 0;
        -[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::$_4::operator()(v75, &v11[6 * v14], v17);
LABEL_37:
        if (++v14 == v13)
          goto LABEL_38;
      }
      v21 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(&v76, v19);
      if (!v21)
      {
LABEL_35:
        if (*((_QWORD *)&v77 + 1))
          -[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::$_4::operator()(v75, &v11[6 * v14], v17);
        goto LABEL_37;
      }
      v22 = v21;
      v23 = v21[4];
      v24 = std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::TimeStats>::operator[]((uint64_t)&v79, *((_DWORD *)v21 + 4));
      *(double *)&v24[8 * *((unsigned int *)v22 + 6)] = *(double *)&v24[8 * *((unsigned int *)v22 + 6)]
                                                      + (double)(125 * (v16 - v23) / 3uLL);
      v25 = *((_QWORD *)&v76 + 1);
      v26 = v22[1];
      v27 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v76 + 8));
      v27.i16[0] = vaddlv_u8(v27);
      if (v27.u32[0] > 1uLL)
      {
        if (v26 >= *((_QWORD *)&v76 + 1))
          v26 %= *((_QWORD *)&v76 + 1);
      }
      else
      {
        v26 &= *((_QWORD *)&v76 + 1) - 1;
      }
      v28 = *v22;
      v29 = *(uint64_t **)(v76 + 8 * v26);
      do
      {
        v30 = v29;
        v29 = (uint64_t *)*v29;
      }
      while (v29 != v22);
      if (v30 == (uint64_t *)&v77)
        goto LABEL_24;
      v31 = v30[1];
      if (v27.u32[0] > 1uLL)
      {
        if (v31 >= *((_QWORD *)&v76 + 1))
          v31 %= *((_QWORD *)&v76 + 1);
      }
      else
      {
        v31 &= *((_QWORD *)&v76 + 1) - 1;
      }
      if (v31 != v26)
      {
LABEL_24:
        if (v28)
        {
          v32 = *(_QWORD *)(v28 + 8);
          if (v27.u32[0] > 1uLL)
          {
            v33 = *(_QWORD *)(v28 + 8);
            if (v32 >= *((_QWORD *)&v76 + 1))
              v33 = v32 % *((_QWORD *)&v76 + 1);
          }
          else
          {
            v33 = v32 & (*((_QWORD *)&v76 + 1) - 1);
          }
          if (v33 == v26)
            goto LABEL_28;
        }
        *(_QWORD *)(v76 + 8 * v26) = 0;
        v28 = *v22;
      }
      if (!v28)
      {
LABEL_34:
        *v30 = v28;
        --*((_QWORD *)&v77 + 1);
        operator delete(v22);
        goto LABEL_35;
      }
      v32 = *(_QWORD *)(v28 + 8);
LABEL_28:
      if (v27.u32[0] > 1uLL)
      {
        if (v32 >= v25)
          v32 %= v25;
      }
      else
      {
        v32 &= v25 - 1;
      }
      if (v32 != v26)
      {
        *(_QWORD *)(v76 + 8 * v32) = v30;
        v28 = *v22;
      }
      goto LABEL_34;
    }
LABEL_38:
    v9 = v71;
    v34 = objc_msgSend(v71, "encoderCount");
    v35 = v34;
    if (v34)
    {
      v36 = 48 * v34;
      v37 = (char *)operator new(v36);
      bzero(v37, 48 * ((v36 - 48) / 0x30) + 48);
      v38 = std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>(v35);
      bzero(v38, 4 * v35);
      v40 = (uint64_t *)v80;
      for (i = v38; v40; v40 = (uint64_t *)*v40)
      {
        v41 = 0;
        v42 = *((_DWORD *)v40 + 4);
        v43 = (double *)(v40 + 6);
        v44 = -3;
        v45 = v37 + 24;
        do
        {
          v46 = v42 % v35;
          v47 = (uint64_t)&v37[48 * v46 + 8 * v41];
          *(double *)(v47 + 24) = *v43 + *(double *)(v47 + 24);
          v48 = *(v43 - 3);
          if (v48 < *v43)
          {
            fprintf(__stderrp, "%u[%u]: Duration %f < Effective Time %f\n", v42, v44 + 3, *(v43 - 3), *v43);
            v48 = *(v43 - 3);
            v42 = *((_DWORD *)v40 + 4);
            v46 = v42 % v35;
          }
          v49 = &v45[48 * v46];
          v39 = v48 + *((double *)v49 - 3);
          *((double *)v49 - 3) = v39;
          ++v41;
          v45 += 8;
          ++v43;
        }
        while (!__CFADD__(v44++, 1));
        v38 = i;
        ++*((_DWORD *)i + v46);
      }
      v51 = 0;
      if (v35 <= 1uLL)
        v52 = 1;
      else
        v52 = v35;
      v53 = v37;
      v9 = v71;
      v10 = v72;
      do
      {
        v54 = 0;
        LODWORD(v39) = *((_DWORD *)v38 + v51);
        v39 = (double)*(unint64_t *)&v39;
        do
        {
          v55 = (double *)&v53[v54];
          v55[3] = *(double *)&v53[v54 + 24] / v39;
          *v55 = *(double *)&v53[v54] / v39;
          v54 += 8;
        }
        while (v54 != 24);
        ++v51;
        v53 += 48;
      }
      while (v51 != v52);
      options = v70->_options;
      if ((*((_BYTE *)options + 16) & 0x40) != 0)
      {
        v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(options->var0, "stringByAppendingPathComponent:", CFSTR("/EffectGPUTimePerBatch.txt"))));
        v58 = fopen((const char *)objc_msgSend(v57, "UTF8String"), "wt");
        if (v58)
        {
          v73 = v57;
          v59 = *((_QWORD *)&v80 + 1);
          fwrite("Batch DM  Time\n", 0xFuLL, 1uLL, v58);
          v60 = 0;
          v61 = v37;
          do
          {
            for (j = 0; j != 3; ++j)
            {
              v63 = *(double *)&v61[8 * j + 24];
              if (v63 > 2.22044605e-16)
                fprintf(v58, "%lu %u\t%f µs / %f µs = %f %% \n", v60, j, v63 * 0.001, *(double *)&v61[8 * j] * 0.001, v63 * 100.0 / *(double *)&v61[8 * j]);
            }
            ++v60;
            v61 += 48;
          }
          while (v60 != v52);
          fwrite("\n\n", 2uLL, 1uLL, v58);
          if (v59)
          {
            for (k = 0; k != v59; ++k)
            {
              for (m = 0; m != 3; ++m)
              {
                if (*(double *)&std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::TimeStats>::operator[]((uint64_t)&v79, k)[8 * m + 24] > 2.22044605e-16)
                {
                  v66 = *(double *)&std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::TimeStats>::operator[]((uint64_t)&v79, k)[8 * m + 24];
                  v67 = *(double *)&std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::TimeStats>::operator[]((uint64_t)&v79, k)[8 * m];
                  v68 = *(double *)&std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::TimeStats>::operator[]((uint64_t)&v79, k)[8 * m + 24];
                  v69 = std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::TimeStats>::operator[]((uint64_t)&v79, k);
                  fprintf(v58, "%lu %u\t%f µs / %f µs = %f %% \n", k, m, v66 * 0.001, v67 * 0.001, v68 * 100.0 / *(double *)&v69[8 * m]);
                }
              }
            }
          }
          fclose(v58);
          v9 = v71;
          v10 = v72;
          v57 = v73;
          v38 = i;
        }

      }
      if (v38)
        operator delete(v38);
      operator delete(v37);
    }
    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v76);
    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v79);
  }

}

- (NSString)metalPluginName
{
  return self->_metalPluginName;
}

- (void)setMetalPluginName:(id)a3
{
  objc_storeStrong((id *)&self->_metalPluginName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalPluginName, 0);
  objc_storeStrong((id *)&self->_workloadTimelineInfo, 0);
  objc_storeStrong((id *)&self->_batchIdPartialResults, 0);
  objc_storeStrong((id *)&self->waitOperation, 0);
  objc_storeStrong((id *)&self->_streamingMTLResult, 0);
  objc_storeStrong((id *)&self->_shaderInfoResult, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_shaderProfilerHelper, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_shaderSourcePath, 0);
  std::unique_ptr<MTLGRCStreamingSampleHelper>::reset[abi:nn180100]((uint64_t **)&self->_streamingHelper, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (char)_calculateEffectiveGPUEncoderCostforData:(float *)a1 andPerLimiterBatchCost:(unsigned int)a2 forShaderProfilerResult:
{
  unint64_t v2;
  unint64_t v5;
  unint64_t v6;
  uint8x8_t v7;
  void **v8;
  _QWORD *v9;
  unint64_t v10;
  float v11;
  float v12;
  _BOOL4 v13;
  unint64_t v14;
  unint64_t v15;
  int8x8_t prime;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  uint8x8_t v22;
  unint64_t v23;
  uint8x8_t v24;
  uint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  unint64_t v30;
  _QWORD *v32;

  v5 = a2;
  v6 = *((_QWORD *)a1 + 1);
  if (v6)
  {
    v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      v2 = a2;
      if (v6 <= a2)
        v2 = a2 % v6;
    }
    else
    {
      v2 = ((_DWORD)v6 - 1) & a2;
    }
    v8 = *(void ***)(*(_QWORD *)a1 + 8 * v2);
    if (v8)
    {
      v9 = *v8;
      if (*v8)
      {
        do
        {
          v10 = v9[1];
          if (v10 == a2)
          {
            if (*((_DWORD *)v9 + 4) == a2)
              return (char *)(v9 + 3);
          }
          else
          {
            if (v7.u32[0] > 1uLL)
            {
              if (v10 >= v6)
                v10 %= v6;
            }
            else
            {
              v10 &= v6 - 1;
            }
            if (v10 != v2)
              break;
          }
          v9 = (_QWORD *)*v9;
        }
        while (v9);
      }
    }
  }
  v9 = operator new(0x30uLL);
  *v9 = 0;
  v9[1] = v5;
  *((_DWORD *)v9 + 4) = a2;
  *((_DWORD *)v9 + 6) = 0;
  v9[4] = 0;
  v9[5] = 0;
  v11 = (float)(unint64_t)(*((_QWORD *)a1 + 3) + 1);
  v12 = a1[8];
  if (v6 && (float)(v12 * (float)v6) >= v11)
  {
    v5 = v2;
    goto LABEL_64;
  }
  v13 = (v6 & (v6 - 1)) == 0;
  if (v6 < 3)
    v13 = 0;
  v14 = (2 * v6) | !v13;
  v15 = vcvtps_u32_f32(v11 / v12);
  if (v14 <= v15)
    prime = (int8x8_t)v15;
  else
    prime = (int8x8_t)v14;
  if (*(_QWORD *)&prime == 1)
  {
    prime = (int8x8_t)2;
  }
  else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
  {
    prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    v6 = *((_QWORD *)a1 + 1);
  }
  if (*(_QWORD *)&prime <= v6)
  {
    if (*(_QWORD *)&prime >= v6)
      goto LABEL_60;
    v23 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
    if (v6 < 3 || (v24 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v24.i16[0] = vaddlv_u8(v24), v24.u32[0] > 1uLL))
    {
      v23 = std::__next_prime(v23);
    }
    else
    {
      v25 = 1 << -(char)__clz(v23 - 1);
      if (v23 >= 2)
        v23 = v25;
    }
    if (*(_QWORD *)&prime <= v23)
      prime = (int8x8_t)v23;
    if (*(_QWORD *)&prime >= v6)
    {
      v6 = *((_QWORD *)a1 + 1);
      goto LABEL_60;
    }
    if (!*(_QWORD *)&prime)
    {
      v32 = *(_QWORD **)a1;
      *(_QWORD *)a1 = 0;
      if (v32)
        operator delete(v32);
      v6 = 0;
      *((_QWORD *)a1 + 1) = 0;
      goto LABEL_60;
    }
  }
  if (*(_QWORD *)&prime >> 61)
    std::__throw_bad_array_new_length[abi:nn180100]();
  v17 = operator new(8 * *(_QWORD *)&prime);
  v18 = *(_QWORD **)a1;
  *(_QWORD *)a1 = v17;
  if (v18)
    operator delete(v18);
  v19 = 0;
  *((int8x8_t *)a1 + 1) = prime;
  do
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v19++) = 0;
  while (*(_QWORD *)&prime != v19);
  v20 = (_QWORD *)*((_QWORD *)a1 + 2);
  if (v20)
  {
    v21 = v20[1];
    v22 = (uint8x8_t)vcnt_s8(prime);
    v22.i16[0] = vaddlv_u8(v22);
    if (v22.u32[0] > 1uLL)
    {
      if (v21 >= *(_QWORD *)&prime)
        v21 %= *(_QWORD *)&prime;
    }
    else
    {
      v21 &= *(_QWORD *)&prime - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v21) = a1 + 4;
    v26 = (_QWORD *)*v20;
    if (*v20)
    {
      do
      {
        v27 = v26[1];
        if (v22.u32[0] > 1uLL)
        {
          if (v27 >= *(_QWORD *)&prime)
            v27 %= *(_QWORD *)&prime;
        }
        else
        {
          v27 &= *(_QWORD *)&prime - 1;
        }
        if (v27 != v21)
        {
          if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v27))
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v27) = v20;
            goto LABEL_56;
          }
          *v20 = *v26;
          *v26 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v27);
          **(_QWORD **)(*(_QWORD *)a1 + 8 * v27) = v26;
          v26 = v20;
        }
        v27 = v21;
LABEL_56:
        v20 = v26;
        v26 = (_QWORD *)*v26;
        v21 = v27;
      }
      while (v26);
    }
  }
  v6 = (unint64_t)prime;
LABEL_60:
  if ((v6 & (v6 - 1)) != 0)
  {
    if (v6 <= v5)
      v5 %= v6;
  }
  else
  {
    v5 = ((_DWORD)v6 - 1) & v5;
  }
LABEL_64:
  v28 = *(_QWORD **)a1;
  v29 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v5);
  if (v29)
  {
    *v9 = *v29;
LABEL_72:
    *v29 = v9;
    goto LABEL_73;
  }
  *v9 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = v9;
  v28[v5] = a1 + 4;
  if (*v9)
  {
    v30 = *(_QWORD *)(*v9 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v30 >= v6)
        v30 %= v6;
    }
    else
    {
      v30 &= v6 - 1;
    }
    v29 = (_QWORD *)(*(_QWORD *)a1 + 8 * v30);
    goto LABEL_72;
  }
LABEL_73:
  ++*((_QWORD *)a1 + 3);
  return (char *)(v9 + 3);
}

- (double)_calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:
{
  double *v4;
  unsigned int v5;
  unsigned int v6;
  double v8;
  unint64_t v9;
  uint64_t *v10;
  float *v11;
  unsigned int v12;
  double *v13;
  double v14;
  float *v15;
  uint64_t *i;
  double v17;
  double *v18;
  uint64_t *v19;
  double v20;
  double *v21;

  v4 = result;
  v6 = *a2;
  v5 = a2[1];
  if (v5 >= v5 + (*a2 >> 4))
  {
    v15 = *(float **)result;
    goto LABEL_17;
  }
  v8 = 0.0;
  v9 = a2[1];
  do
  {
    v10 = *(uint64_t **)(**((_QWORD **)v4 + 2) + 40 * v9 + 16);
    if (!v10)
      goto LABEL_11;
    do
    {
      v11 = *(float **)v4;
      v12 = *((_DWORD *)v10 + 4);
      result = (double *)std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(*(_QWORD **)v4, v12);
      if (result)
      {
        v13 = (double *)(v10 + 3);
        v14 = *((double *)v10 + 3);
        result = (double *)std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::BatchInfo>::operator[](v11, v12);
        result[2] = v14 + result[2];
LABEL_6:
        v8 = v8 + *v13;
        goto LABEL_8;
      }
      if (v12 == -1)
      {
        v13 = (double *)(v10 + 3);
        goto LABEL_6;
      }
LABEL_8:
      v10 = (uint64_t *)*v10;
    }
    while (v10);
    v6 = *a2;
    v5 = a2[1];
LABEL_11:
    ++v9;
  }
  while (v9 < v5 + (v6 >> 4));
  v15 = *(float **)v4;
  if (v8 > 2.22044605e-16)
  {
    for (i = (uint64_t *)*((_QWORD *)v15 + 2); i; i = (uint64_t *)*i)
    {
      v17 = *((double *)i + 5) / v8 * (double)a3;
      result = (double *)std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::TimeStats>::operator[](*((_QWORD *)v4 + 1), *((_DWORD *)i + 4));
      v18 = &result[*((unsigned int *)i + 6)];
      v18[3] = v17 + v18[3];
      i[5] = 0;
    }
    return result;
  }
LABEL_17:
  v19 = (uint64_t *)*((_QWORD *)v15 + 2);
  if (v19)
  {
    v20 = (double)a3 / (double)*((unint64_t *)v15 + 3);
    do
    {
      result = (double *)std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::TimeStats>::operator[](*((_QWORD *)v4 + 1), *((_DWORD *)v19 + 4));
      v21 = &result[*((unsigned int *)v19 + 6)];
      v21[3] = v20 + v21[3];
      v19 = (uint64_t *)*v19;
    }
    while (v19);
  }
  return result;
}

- (char)_calculateEffectiveGPUEncoderCostforData:(uint64_t)a1 andPerLimiterBatchCost:(unsigned int)a2 forShaderProfilerResult:
{
  unint64_t v2;
  unint64_t v5;
  unint64_t v6;
  uint8x8_t v7;
  void **v8;
  char *v9;
  unint64_t v10;
  float v11;
  float v12;
  _BOOL8 v13;
  unint64_t v14;
  unint64_t v15;
  size_t v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 8);
  if (v6)
  {
    v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      v2 = a2;
      if (v6 <= a2)
        v2 = a2 % v6;
    }
    else
    {
      v2 = ((_DWORD)v6 - 1) & a2;
    }
    v8 = *(void ***)(*(_QWORD *)a1 + 8 * v2);
    if (v8)
    {
      v9 = (char *)*v8;
      if (*v8)
      {
        do
        {
          v10 = *((_QWORD *)v9 + 1);
          if (v10 == a2)
          {
            if (*((_DWORD *)v9 + 4) == a2)
              return v9 + 24;
          }
          else
          {
            if (v7.u32[0] > 1uLL)
            {
              if (v10 >= v6)
                v10 %= v6;
            }
            else
            {
              v10 &= v6 - 1;
            }
            if (v10 != v2)
              break;
          }
          v9 = *(char **)v9;
        }
        while (v9);
      }
    }
  }
  v9 = (char *)operator new(0x48uLL);
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = v5;
  *((_DWORD *)v9 + 4) = a2;
  *(_OWORD *)(v9 + 24) = 0u;
  *(_OWORD *)(v9 + 40) = 0u;
  *(_OWORD *)(v9 + 56) = 0u;
  v11 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v12 = *(float *)(a1 + 32);
  if (!v6 || (float)(v12 * (float)v6) < v11)
  {
    v13 = 1;
    if (v6 >= 3)
      v13 = (v6 & (v6 - 1)) != 0;
    v14 = v13 | (2 * v6);
    v15 = vcvtps_u32_f32(v11 / v12);
    if (v14 <= v15)
      v16 = v15;
    else
      v16 = v14;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v16);
    v6 = *(_QWORD *)(a1 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v6 <= v5)
        v2 = v5 % v6;
      else
        v2 = v5;
    }
    else
    {
      v2 = ((_DWORD)v6 - 1) & v5;
    }
  }
  v17 = *(_QWORD *)a1;
  v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v2);
  if (v18)
  {
    *(_QWORD *)v9 = *v18;
LABEL_38:
    *v18 = v9;
    goto LABEL_39;
  }
  *(_QWORD *)v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(v17 + 8 * v2) = a1 + 16;
  if (*(_QWORD *)v9)
  {
    v19 = *(_QWORD *)(*(_QWORD *)v9 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v19 >= v6)
        v19 %= v6;
    }
    else
    {
      v19 &= v6 - 1;
    }
    v18 = (_QWORD *)(*(_QWORD *)a1 + 8 * v19);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v9 + 24;
}

{
  unint64_t v2;
  unint64_t v5;
  unint64_t v6;
  uint8x8_t v7;
  void **v8;
  char *v9;
  unint64_t v10;
  float v11;
  float v12;
  _BOOL8 v13;
  unint64_t v14;
  unint64_t v15;
  size_t v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 8);
  if (v6)
  {
    v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      v2 = a2;
      if (v6 <= a2)
        v2 = a2 % v6;
    }
    else
    {
      v2 = ((_DWORD)v6 - 1) & a2;
    }
    v8 = *(void ***)(*(_QWORD *)a1 + 8 * v2);
    if (v8)
    {
      v9 = (char *)*v8;
      if (*v8)
      {
        do
        {
          v10 = *((_QWORD *)v9 + 1);
          if (v10 == a2)
          {
            if (*((_DWORD *)v9 + 4) == a2)
              return v9 + 24;
          }
          else
          {
            if (v7.u32[0] > 1uLL)
            {
              if (v10 >= v6)
                v10 %= v6;
            }
            else
            {
              v10 &= v6 - 1;
            }
            if (v10 != v2)
              break;
          }
          v9 = *(char **)v9;
        }
        while (v9);
      }
    }
  }
  v9 = (char *)operator new(0x48uLL);
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = v5;
  *((_DWORD *)v9 + 4) = a2;
  *(_OWORD *)(v9 + 24) = 0u;
  *(_OWORD *)(v9 + 40) = 0u;
  *(_OWORD *)(v9 + 56) = 0u;
  v11 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v12 = *(float *)(a1 + 32);
  if (!v6 || (float)(v12 * (float)v6) < v11)
  {
    v13 = 1;
    if (v6 >= 3)
      v13 = (v6 & (v6 - 1)) != 0;
    v14 = v13 | (2 * v6);
    v15 = vcvtps_u32_f32(v11 / v12);
    if (v14 <= v15)
      v16 = v15;
    else
      v16 = v14;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v16);
    v6 = *(_QWORD *)(a1 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v6 <= v5)
        v2 = v5 % v6;
      else
        v2 = v5;
    }
    else
    {
      v2 = ((_DWORD)v6 - 1) & v5;
    }
  }
  v17 = *(_QWORD *)a1;
  v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v2);
  if (v18)
  {
    *(_QWORD *)v9 = *v18;
LABEL_38:
    *v18 = v9;
    goto LABEL_39;
  }
  *(_QWORD *)v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(v17 + 8 * v2) = a1 + 16;
  if (*(_QWORD *)v9)
  {
    v19 = *(_QWORD *)(*(_QWORD *)v9 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v19 >= v6)
        v19 %= v6;
    }
    else
    {
      v19 &= v6 - 1;
    }
    v18 = (_QWORD *)(*(_QWORD *)a1 + 8 * v19);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v9 + 24;
}

void __79__GTShaderProfilerHelper__prepareCounterNames_derivedCounterNames_withContext___block_invoke(id a1, NSString *a2)
{
  NSLog(CFSTR("%@"), a2);
}

void __87__GTShaderProfilerHelper__latencyAdjustmentFactorWithLimiterDataForDraw_forDataMaster___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "doubleValue");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v4 < *(double *)(v5 + 24))
    v4 = *(double *)(v5 + 24);
  *(double *)(v5 + 24) = v4;

}

void __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/legacy-VS_%@"), *(_QWORD *)(a1 + 40), v8));
  objc_msgSend(v6, "_dumpShaderBinaryInfo:usingKey:withBaseFileName:targetIndex:", v5, v8, v7, *(unsigned int *)(a1 + 48));

}

void __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/legacy-FS_%@"), *(_QWORD *)(a1 + 40), v8));
  objc_msgSend(v6, "_dumpShaderBinaryInfo:usingKey:withBaseFileName:targetIndex:", v5, v8, v7, *(unsigned int *)(a1 + 48));

}

void __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/legacy-CS_%@"), *(_QWORD *)(a1 + 40), v8));
  objc_msgSend(v6, "_dumpShaderBinaryInfo:usingKey:withBaseFileName:targetIndex:", v5, v8, v7, *(unsigned int *)(a1 + 48));

}

void __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), *(_QWORD *)(a1 + 40), v8));
  objc_msgSend(v6, "_dumpShaderBinaryInfo:usingKey:withBaseFileName:targetIndex:", v5, v8, v7, *(unsigned int *)(a1 + 48));

}

uint64_t __57__GTShaderProfilerHelper__dumpTraceProfileDataForResult___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  double v15;
  double v16;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "drawCallInfoList"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "unsignedIntegerValue")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "drawCallInfoList"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "unsignedIntegerValue")));

  if (v8)
  {
    objc_msgSend(v8, "timing");
    v11 = v16;
    if (v10)
    {
LABEL_3:
      objc_msgSend(v10, "timing");
      v12 = v15;
      goto LABEL_6;
    }
  }
  else
  {
    v11 = 0.0;
    if (v10)
      goto LABEL_3;
  }
  v12 = 0.0;
LABEL_6:
  if (v11 < v12)
    v13 = 1;
  else
    v13 = -1;

  return v13;
}

int64_t __57__GTShaderProfilerHelper__dumpTraceProfileDataForResult___block_invoke_3(id a1, NSNumber *a2, NSNumber *a3)
{
  NSNumber *v4;
  NSNumber *v5;
  NSNumber *v6;
  NSNumber *v7;
  NSNumber *v8;
  double v9;
  double v10;
  int64_t v11;
  double v13;
  double v14;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  v8 = v7;
  if (v6)
  {
    -[NSNumber timing](v6, "timing");
    v9 = v14;
    if (v8)
    {
LABEL_3:
      -[NSNumber timing](v8, "timing");
      v10 = v13;
      goto LABEL_6;
    }
  }
  else
  {
    v9 = 0.0;
    if (v7)
      goto LABEL_3;
  }
  v10 = 0.0;
LABEL_6:
  if (v9 < v10)
    v11 = 1;
  else
    v11 = -1;

  return v11;
}

int64_t __57__GTShaderProfilerHelper__dumpTraceProfileDataForResult___block_invoke(id a1, DYShaderProfilerProgramInfo *a2, DYShaderProfilerProgramInfo *a3)
{
  DYShaderProfilerProgramInfo *v4;
  DYShaderProfilerProgramInfo *v5;
  DYShaderProfilerProgramInfo *v6;
  double v7;
  double v8;
  int64_t v9;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    -[DYShaderProfilerProgramInfo timing](v4, "timing");
    v7 = v12;
    if (v6)
    {
LABEL_3:
      -[DYShaderProfilerProgramInfo timing](v6, "timing");
      v8 = v11;
      goto LABEL_6;
    }
  }
  else
  {
    v7 = 0.0;
    if (v5)
      goto LABEL_3;
  }
  v8 = 0.0;
LABEL_6:
  if (v7 < v8)
    v9 = 1;
  else
    v9 = -1;

  return v9;
}

uint64_t __85__GTShaderProfilerHelper_profileBatchIdFilteredData_withPayload_forReplayController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  FILE *v8;
  id v9;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("End Batch ID Streaming Data")));

  if (v5)
  {
    objc_msgSend(WeakRetained, "_processBatchIdCounterData:", WeakRetained[10]);
  }
  else
  {
    objc_msgSend(WeakRetained[10], "addObject:", v3);
    if (g_runningInCI)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Received data for batch %lu"), objc_msgSend(WeakRetained[10], "count")));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#CI-INFO# ")));

      v8 = __stdoutp;
      v9 = objc_retainAutorelease(v7);
      fprintf(v8, "#CI-INFO# %s\n", (const char *)objc_msgSend(v9, "UTF8String"));

    }
  }

  return 0;
}

id __86__GTShaderProfilerHelper_profileShadersForDataSource_withPayload_forReplayController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  FILE *v31;
  id v32;
  void *v33;
  void *v34;
  FILE *v35;
  id v36;
  _QWORD v37[3];
  _QWORD v38[3];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("usc sampling address data")));

  if (v6)
  {
    objc_msgSend(v5, "_preProcessStreamingUSCSampleData:result:", v3, WeakRetained);
LABEL_6:
    v14 = 0;
    goto LABEL_7;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Havested Binaries")));

  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MetalPluginName")));
    v9 = v5[12];
    v5[12] = (id)v8;

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = MetalPluginTarget(v5[12]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Havested Binaries")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >= 0));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("BatchingFilteringAvailable"));

    v13 = objc_msgSend(v5, "_processHarvestedBinaryData:forStreamedData:", WeakRetained, v11);
LABEL_5:

    goto LABEL_6;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Finalize Shader Profiler Result")));

  if (!v16)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Shader Profiling Frame Time")));

    if (v20)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "shaderProfilingFrameTimes"));

      if (!v14)
        goto LABEL_7;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "shaderProfilingFrameTimes"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Shader Profiling Frame Time")));
      objc_msgSend(v11, "addObject:", v21);

    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Frame Time Data")));

      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("GPU Time")));
        objc_msgSend(v23, "doubleValue");
        objc_msgSend(WeakRetained, "setGpuTime:", v24 / 1000000000.0);

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Num Ring Buffers")));
        v26 = objc_msgSend(v25, "unsignedIntValue");

        objc_msgSend(v5[5], "setupDataForEvaluatingStreamingSamples:forRingBufferCount:forTargetIndex:", WeakRetained, v26, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
        goto LABEL_6;
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Blit Command Nsec Times")));

      if (!v27)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("derivedCounterData")));

        if (!v14)
          goto LABEL_7;
        if (g_runningInCI)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("derivedCounterData: strongSelf is %p, strongResult is %p"), v5, WeakRetained));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#CI-INFO# ")));

          v31 = __stdoutp;
          v32 = objc_retainAutorelease(v30);
          fprintf(v31, "#CI-INFO# %s\n", (const char *)objc_msgSend(v32, "UTF8String"));

        }
        if ((*((_BYTE *)v5[1] + 17) & 0x10) == 0)
        {
          objc_msgSend(v5, "_processDerivedEncoderCounterData:forDerivedEncoderData:withEffectivePerDrawKickTimes:withShaderInfo:", WeakRetained, v3, 0, 0);
          v14 = 0;
          goto LABEL_7;
        }
        if (g_runningInCI)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("includePerDrawTimings deferring")));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#CI-INFO# ")));

          v35 = __stdoutp;
          v36 = objc_retainAutorelease(v34);
          fprintf(v35, "#CI-INFO# %s\n", (const char *)objc_msgSend(v36, "UTF8String"));

        }
        objc_msgSend(WeakRetained, "setDerivedCountersData:", v3);
        goto LABEL_6;
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Blit Command Nsec Times")));
      objc_msgSend(WeakRetained, "setBlitTimeData:", v28);

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "blitEncoderTimeInfo"));
      objc_msgSend(v11, "setDictionary:", v3);
    }
    goto LABEL_5;
  }
  objc_msgSend(v5[5], "adjustHWBiasAndFinalizeResult");
  objc_msgSend(v5, "_addBlitTimesToEffectiveKickTimes:", WeakRetained);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "effectiveKickTimes"));

  if (v14)
  {
    v37[0] = CFSTR("Kick Time Data");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "effectiveKickTimes"));
    v38[0] = v17;
    v37[1] = CFSTR("Encoder Load Action Times");
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "loadActionTimes"));
    v38[1] = v18;
    v37[2] = CFSTR("Encoder Store Action Times");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "storeActionTimes"));
    v38[2] = v19;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 3));

  }
LABEL_7:

  return v14;
}

void __53__GTShaderProfilerHelper__dumpGPUTimelineDataResult___block_invoke(uint64_t a1, _DWORD *a2, _QWORD *a3, unsigned int a4, int a5)
{
  unint64_t v7;
  FILE *v8;
  void *v9;
  void *v10;
  id v11;

  fprintf(*(FILE **)(a1 + 40), "%8u %llu %8u : %u %u %llu 0x%llx\n", a4, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * a4), a5, *a2 & 0x3FFFFFFF, (*(_QWORD *)a2 >> 30) & 0x3FFFFFFF, *(_QWORD *)a2 >> 60, *a3);
  if (*(_DWORD *)(a1 + 64))
  {
    v7 = 0;
    do
    {
      v8 = *(FILE **)(a1 + 40);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "aggregatedGPUTimelineInfo"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "derivedCounterNames"));
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v7)));
      fprintf(v8, "\t\t\t%s : %f\n", (const char *)objc_msgSend(v11, "UTF8String"), *(double *)(*(_QWORD *)(a1 + 56) + 8 * (v7 + *(_DWORD *)(a1 + 64) * a4)));

      ++v7;
    }
    while (v7 < *(unsigned int *)(a1 + 64));
  }
}

void __53__GTShaderProfilerHelper__dumpGPUTimelineDataResult___block_invoke_2(uint64_t a1, _DWORD *a2, uint64_t a3, unsigned int a4, int a5)
{
  unint64_t v7;
  FILE *v8;
  void *v9;
  void *v10;
  id v11;

  fprintf(*(FILE **)(a1 + 40), "%8u %llu %8u : %u %u %llu\n", a4, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * a4), a5, *a2 & 0x3FFFFFFF, (*(_QWORD *)a2 >> 30) & 0x3FFFFFFF, *(_QWORD *)a2 >> 60);
  if (*(_DWORD *)(a1 + 64))
  {
    v7 = 0;
    do
    {
      v8 = *(FILE **)(a1 + 40);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "aggregatedGPUTimelineInfo"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "derivedCounterNames"));
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v7)));
      fprintf(v8, "\t\t\t%s : %f\n", (const char *)objc_msgSend(v11, "UTF8String"), *(double *)(*(_QWORD *)(a1 + 56) + 8 * (v7 + *(_DWORD *)(a1 + 64) * a4)));

      ++v7;
    }
    while (v7 < *(unsigned int *)(a1 + 64));
  }
}

void __53__GTShaderProfilerHelper__dumpGPUTimelineDataResult___block_invoke_3(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  FILE *v9;
  id v10;

  fprintf(*(FILE **)(a1 + 40), "Encoder Index:%8u Function Index:%llu EncoderType:%llu V[%.2f ns] F[%.2f ns] C[%.2f ns] B[%.2f ns]\n", a2, *(_QWORD *)a3, *(_QWORD *)(a3 + 8), *(double *)(a3 + 16), *(double *)(a3 + 24), *(double *)(a3 + 32), *(double *)(a3 + 40));
  if (a5)
  {
    v8 = 0;
    do
    {
      v9 = *(FILE **)(a1 + 40);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v8)));
      fprintf(v9, "\t%s = %.3f\n", (const char *)objc_msgSend(v10, "UTF8String"), *(double *)(a4 + 8 * v8));

      ++v8;
    }
    while (a5 != v8);
  }
}

uint64_t __88__GTShaderProfilerHelper_processGPUTimelineDataSources_withPayload_forReplayController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  _QWORD *v6;
  void *v7;
  id v8;
  void *v9;
  void *v11;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("usc sampling address data")));

  if (v7)
  {
    v8 = objc_loadWeakRetained(v4);
    objc_msgSend(v6, "_calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:", v3, v8, v6[11]);
LABEL_5:

    goto LABEL_6;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("aggregated derived counters")));

  if (v9)
  {
    v8 = objc_loadWeakRetained(v4);
    objc_msgSend(v6, "_calculatePerSampleAggregatedActiveShaders:withShaderProfilerResult:forWorkloadInfo:", v3, v8, v6[11]);
    goto LABEL_5;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("derivedCounterData")));

  if (v11)
    objc_msgSend(v6, "_addDerivedCounterDataToTimelineInfo:usingShaderProfilerResult:", v3, WeakRetained);
LABEL_6:

  return 0;
}

void __50__GTShaderProfilerHelper_processStreamingGRCData___block_invoke(uint64_t a1)
{
  NSDictionary *v2;
  void *v3;
  MTLGRCStreamingSampleHelperImpl **v4;
  MTLGRCStreamingSampleHelperImpl *v5;
  void *v6;
  MTLGRCStreamingSampleHelperImpl **v7;
  MTLGRCStreamingSampleHelperImpl *v8;
  MTLGRCStreamingSampleHelperImpl ***WeakRetained;

  WeakRetained = (MTLGRCStreamingSampleHelperImpl ***)objc_loadWeakRetained((id *)(a1 + 40));
  MTLGRCStreamingSampleHelperImpl::ProcessStreamedData(*WeakRetained[2], *(NSDictionary **)(a1 + 32), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("End Streaming Data")));

  if (v3)
  {
    v4 = WeakRetained[2];
    v5 = *v4;
    objc_msgSend(*((id *)*v4 + 6), "addOperation:", *((_QWORD *)*v4 + 7));
    objc_msgSend(*((id *)v5 + 7), "waitUntilFinished");
    objc_msgSend(WeakRetained, "_handlePerDrawCounterData");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("End Batch ID Streaming Data")));

    if (v6)
    {
      v7 = WeakRetained[2];
      v8 = *v7;
      objc_msgSend(*((id *)*v7 + 6), "addOperation:", *((_QWORD *)*v7 + 7));
      objc_msgSend(*((id *)v8 + 7), "waitUntilFinished");
    }
  }

}

void __88__GTShaderProfilerHelper__analyzeShaderBinarySamplesForResult_forShaderKeyToSourcePath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  int v16;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", v5));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __88__GTShaderProfilerHelper__analyzeShaderBinarySamplesForResult_forShaderKeyToSourcePath___block_invoke_2;
  v12[3] = &unk_725428;
  v8 = v6;
  v13 = v8;
  v9 = v5;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = v9;
  v14 = v9;
  v15 = v10;
  v16 = *(_DWORD *)(a1 + 40);
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12);

}

void __88__GTShaderProfilerHelper__analyzeShaderBinarySamplesForResult_forShaderKeyToSourcePath___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  FILE *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:"));
  v4 = v3;
  if (g_runningInCI)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "binary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dylib"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uscSamples"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("_analyzeShaderBinarySamplesForResult [%@][%@] binary:%p dylib:%@ type:%@ samples:%lu"), v5, v20, v6, v7, v8, objc_msgSend(v9, "length")));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#CI-INFO# ")));
    v12 = __stdoutp;
    v13 = objc_retainAutorelease(v11);
    fprintf(v12, "#CI-INFO# %s\n", (const char *)objc_msgSend(v13, "UTF8String"));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "binary"));

  if (v14)
  {
    v15 = *(void **)(a1 + 48);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "binary"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uscSamples"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "analyzedBinary:processedUscSamples:targetIndex:withKey:withShaderSourcePath:", v16, v17, *(unsigned int *)(a1 + 56), v20, 0));

    if (!v18)
      v18 = (void *)objc_opt_new(DYShaderAnalyzerResult, v19);
    objc_msgSend(v4, "setAnalyzerResult:", v18);

  }
}

- (uint64_t)_processPerLineCostDataForLineTable:(uint64_t *)a1 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  if (*a1)
  {
    std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo>::__base_destruct_at_end[abi:nn180100]((uint64_t)a1, *a1);
    operator delete((void *)*a1);
  }
  return a1;
}

- (uint64_t)_processPerLineCostDataForLineTable:(uint64_t)a1 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>::~vector[abi:nn180100]((uint64_t *)(a1 + 32));
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  return a1;
}

- (void)_processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  unint64_t v2;
  uint64_t v5;
  std::locale *v6;
  __int128 v7;
  std::string *v8;
  std::string::size_type size;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  std::locale::__imp **v15;
  std::locale::__imp *i;
  unint64_t v17;
  char *v18;
  _QWORD *v19;
  float v20;
  float v21;
  _BOOL4 v22;
  unint64_t v23;
  unint64_t v24;
  int8x8_t prime;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  uint8x8_t v31;
  unint64_t v32;
  uint8x8_t v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  std::locale::__imp **v37;
  unint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  std::string::size_type v44;
  std::string::size_type v45;
  std::ios_base *v46;
  uint64_t v47;
  _QWORD *v48;
  const std::locale::facet *v49;
  unsigned __int8 v50;
  uint64_t v51;
  _QWORD *v52;
  _BYTE *v53;
  int v54;
  unint64_t v55;
  unint64_t v56;
  __int128 v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  std::locale *v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  std::string::size_type v73;
  size_t v74;
  uint64_t v75;
  void *v76;
  _QWORD **v77;
  __int128 v78;
  std::locale v79[4];
  __int128 v80;
  std::locale::__imp *v81;
  std::string __str;
  char v83;
  __int128 v84;
  std::locale *v85;
  std::string v86;
  __int128 v87;
  _QWORD v88[48];
  void (__cdecl **v89)(std::ifstream *__hidden);

  v5 = (uint64_t)*a1;
  if (std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::find[abi:nn180100](*a1, a2))
  {
    return;
  }
  v84 = 0uLL;
  v85 = 0;
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v86, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
    v7 = v84;
    v6 = v85;
  }
  else
  {
    v6 = 0;
    v86 = *(std::string *)a2;
    v7 = 0uLL;
  }
  v78 = v7;
  v87 = v7;
  v88[0] = v6;
  v85 = 0;
  v84 = 0uLL;
  if ((v86.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v8 = &v86;
  else
    v8 = (std::string *)v86.__r_.__value_.__r.__words[0];
  if ((v86.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v86.__r_.__value_.__r.__words[2]);
  else
    size = v86.__r_.__value_.__l.__size_;
  v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t *)v8, size);
  v11 = v10;
  v12 = *(_QWORD *)(v5 + 8);
  v77 = a1;
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      v2 = v10;
      if (v10 >= v12)
        v2 = v10 % v12;
    }
    else
    {
      v2 = (v12 - 1) & v10;
    }
    v15 = *(std::locale::__imp ***)(*(_QWORD *)v5 + 8 * v2);
    if (v15)
    {
      for (i = *v15; i; i = *(std::locale::__imp **)i)
      {
        v17 = *((_QWORD *)i + 1);
        if (v17 == v11)
        {
          if (std::equal_to<std::string>::operator()[abi:nn180100]((unsigned __int8 *)i + 16, (unsigned __int8 *)&v86))
            goto LABEL_83;
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12)
              v17 %= v12;
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v2)
            break;
        }
      }
    }
  }
  v18 = (char *)operator new(0x40uLL);
  v19 = (_QWORD *)(v5 + 16);
  v79[0].__locale_ = (std::locale::__imp *)v18;
  v79[1].__locale_ = (std::locale::__imp *)(v5 + 16);
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = v11;
  *(std::string *)(v18 + 16) = v86;
  memset(&v86, 0, sizeof(v86));
  *(_OWORD *)(v18 + 40) = v78;
  *((_QWORD *)v18 + 7) = v6;
  v88[0] = 0;
  v87 = 0uLL;
  LOBYTE(v79[2].__locale_) = 1;
  v20 = (float)(unint64_t)(*(_QWORD *)(v5 + 24) + 1);
  v21 = *(float *)(v5 + 32);
  if (v12 && (float)(v21 * (float)v12) >= v20)
    goto LABEL_74;
  v22 = (v12 & (v12 - 1)) == 0;
  if (v12 < 3)
    v22 = 0;
  v23 = (2 * v12) | !v22;
  v24 = vcvtps_u32_f32(v20 / v21);
  if (v23 <= v24)
    prime = (int8x8_t)v24;
  else
    prime = (int8x8_t)v23;
  if (*(_QWORD *)&prime == 1)
  {
    prime = (int8x8_t)2;
  }
  else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
  {
    prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    v12 = *(_QWORD *)(v5 + 8);
  }
  if (*(_QWORD *)&prime > v12)
    goto LABEL_40;
  if (*(_QWORD *)&prime < v12)
  {
    v32 = vcvtps_u32_f32((float)*(unint64_t *)(v5 + 24) / *(float *)(v5 + 32));
    if (v12 < 3 || (v33 = (uint8x8_t)vcnt_s8((int8x8_t)v12), v33.i16[0] = vaddlv_u8(v33), v33.u32[0] > 1uLL))
    {
      v32 = std::__next_prime(v32);
    }
    else
    {
      v34 = 1 << -(char)__clz(v32 - 1);
      if (v32 >= 2)
        v32 = v34;
    }
    if (*(_QWORD *)&prime <= v32)
      prime = (int8x8_t)v32;
    if (*(_QWORD *)&prime >= v12)
    {
      v12 = *(_QWORD *)(v5 + 8);
    }
    else
    {
      if (prime)
      {
LABEL_40:
        if (*(_QWORD *)&prime >> 61)
          std::__throw_bad_array_new_length[abi:nn180100]();
        v26 = operator new(8 * *(_QWORD *)&prime);
        v27 = *(void **)v5;
        *(_QWORD *)v5 = v26;
        if (v27)
          operator delete(v27);
        v28 = 0;
        *(int8x8_t *)(v5 + 8) = prime;
        do
          *(_QWORD *)(*(_QWORD *)v5 + 8 * v28++) = 0;
        while (*(_QWORD *)&prime != v28);
        v29 = (_QWORD *)*v19;
        if (*v19)
        {
          v30 = v29[1];
          v31 = (uint8x8_t)vcnt_s8(prime);
          v31.i16[0] = vaddlv_u8(v31);
          if (v31.u32[0] > 1uLL)
          {
            if (v30 >= *(_QWORD *)&prime)
              v30 %= *(_QWORD *)&prime;
          }
          else
          {
            v30 &= *(_QWORD *)&prime - 1;
          }
          *(_QWORD *)(*(_QWORD *)v5 + 8 * v30) = v19;
          v35 = (_QWORD *)*v29;
          if (*v29)
          {
            do
            {
              v36 = v35[1];
              if (v31.u32[0] > 1uLL)
              {
                if (v36 >= *(_QWORD *)&prime)
                  v36 %= *(_QWORD *)&prime;
              }
              else
              {
                v36 &= *(_QWORD *)&prime - 1;
              }
              if (v36 != v30)
              {
                if (!*(_QWORD *)(*(_QWORD *)v5 + 8 * v36))
                {
                  *(_QWORD *)(*(_QWORD *)v5 + 8 * v36) = v29;
                  goto LABEL_65;
                }
                *v29 = *v35;
                *v35 = **(_QWORD **)(*(_QWORD *)v5 + 8 * v36);
                **(_QWORD **)(*(_QWORD *)v5 + 8 * v36) = v35;
                v35 = v29;
              }
              v36 = v30;
LABEL_65:
              v29 = v35;
              v35 = (_QWORD *)*v35;
              v30 = v36;
            }
            while (v35);
          }
        }
        v12 = (unint64_t)prime;
        goto LABEL_69;
      }
      v76 = *(void **)v5;
      *(_QWORD *)v5 = 0;
      if (v76)
        operator delete(v76);
      v12 = 0;
      *(_QWORD *)(v5 + 8) = 0;
    }
  }
LABEL_69:
  if ((v12 & (v12 - 1)) != 0)
  {
    if (v11 >= v12)
      v2 = v11 % v12;
    else
      v2 = v11;
  }
  else
  {
    v2 = (v12 - 1) & v11;
  }
LABEL_74:
  v37 = *(std::locale::__imp ***)(*(_QWORD *)v5 + 8 * v2);
  if (v37)
  {
    *(_QWORD *)v79[0].__locale_ = *v37;
    *v37 = v79[0].__locale_;
  }
  else
  {
    *(_QWORD *)v79[0].__locale_ = *(_QWORD *)(v5 + 16);
    *(std::locale *)(v5 + 16) = v79[0];
    *(_QWORD *)(*(_QWORD *)v5 + 8 * v2) = v19;
    if (*(_QWORD *)v79[0].__locale_)
    {
      v38 = *(_QWORD *)(*(_QWORD *)v79[0].__locale_ + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v38 >= v12)
          v38 %= v12;
      }
      else
      {
        v38 &= v12 - 1;
      }
      *(std::locale *)(*(_QWORD *)v5 + 8 * v38) = v79[0];
    }
  }
  i = v79[0].__locale_;
  v79[0].__locale_ = 0;
  ++*(_QWORD *)(v5 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>,void *>>>>::~unique_ptr[abi:nn180100]((uint64_t)v79);
LABEL_83:
  std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>::~vector[abi:nn180100]((void **)&v87);
  if (SHIBYTE(v86.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v86.__r_.__value_.__l.__data_);
  std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>::~vector[abi:nn180100]((void **)&v84);
  v83 = 0;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (*(char *)(a2 + 23) >= 0)
    v40 = a2;
  else
    v40 = *(_QWORD *)a2;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v40));
  v42 = objc_msgSend(v39, "fileExistsAtPath:isDirectory:", v41, &v83);
  if (v83)
    v43 = 0;
  else
    v43 = v42;

  if ((v43 & 1) == 0)
  {
    v65 = *((_QWORD *)i + 5);
    v66 = *((_QWORD *)i + 6);
    v67 = (*(_DWORD *)v77[1] + 1);
    v68 = 0x6DB6DB6DB6DB6DB7 * ((v66 - v65) >> 3);
    v69 = v67 - v68;
    if (v67 <= v68)
    {
      if (v67 < v68)
      {
        v75 = v65 + 56 * v67;
        while (v66 != v75)
        {
          v66 -= 56;
          std::allocator_traits<std::allocator<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::destroy[abi:nn180100]<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo,void>(v66);
        }
        *((_QWORD *)i + 6) = v75;
      }
    }
    else
    {
      v70 = *((_QWORD *)i + 7);
      if (0x6DB6DB6DB6DB6DB7 * ((v70 - v66) >> 3) >= v69)
      {
        bzero(*((void **)i + 6), 56 * ((56 * v69 - 56) / 0x38) + 56);
        *((_QWORD *)i + 6) = v66 + 56 * ((56 * v69 - 56) / 0x38) + 56;
      }
      else
      {
        v71 = 0x6DB6DB6DB6DB6DB7 * ((v70 - v65) >> 3);
        if (2 * v71 > v67)
          v67 = 2 * v71;
        if (v71 >= 0x249249249249249)
          v72 = 0x492492492492492;
        else
          v72 = v67;
        std::__split_buffer<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>::__split_buffer(&v86, v72, v68, (uint64_t)i + 56);
        v73 = v86.__r_.__value_.__r.__words[2];
        v74 = 56 * ((56 * v69 - 56) / 0x38) + 56;
        bzero((void *)v86.__r_.__value_.__r.__words[2], v74);
        v86.__r_.__value_.__r.__words[2] = v73 + v74;
        std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>::__swap_out_circular_buffer((uint64_t *)i + 5, &v86);
        std::__split_buffer<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>::~__split_buffer((uint64_t)&v86);
      }
    }
    return;
  }
  v86.__r_.__value_.__r.__words[0] = v44;
  *(std::string::size_type *)((char *)v86.__r_.__value_.__r.__words + *(_QWORD *)(v44 - 24)) = v45;
  v86.__r_.__value_.__l.__size_ = 0;
  v46 = (std::ios_base *)((char *)&v86 + *(_QWORD *)(v86.__r_.__value_.__r.__words[0] - 24));
  std::ios_base::init(v46, &v86.__r_.__value_.__r.__words[2]);
  v46[1].__vftable = 0;
  v46[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf(&v86.__r_.__value_.__r.__words[2]);
  if (*(char *)(a2 + 23) >= 0)
    v47 = a2;
  else
    v47 = *(_QWORD *)a2;
  if (!std::filebuf::open(&v86.__r_.__value_.__r.__words[2], v47, 8))
    std::ios_base::clear((std::ios_base *)((char *)&v86 + *(_QWORD *)(v86.__r_.__value_.__r.__words[0] - 24)), *(_DWORD *)((char *)&v88[-1] + *(_QWORD *)(v86.__r_.__value_.__r.__words[0] - 24)) | 4);
  if (*(_DWORD *)((char *)&v88[-1] + *(_QWORD *)(v86.__r_.__value_.__r.__words[0] - 24)))
    goto LABEL_143;
  memset(&__str, 0, sizeof(__str));
  v48 = (_QWORD *)((char *)i + 40);
  while (2)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)&v86 + *(_QWORD *)(v86.__r_.__value_.__r.__words[0] - 24)));
    v49 = std::locale::use_facet(v79, &std::ctype<char>::id);
    v50 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v49->__vftable[2].~facet_0)(v49, 10);
    std::locale::~locale(v79);
    std::istream::sentry::sentry(v79, &v86, 1);
    if (!LOBYTE(v79[0].__locale_))
      goto LABEL_116;
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    {
      *__str.__r_.__value_.__l.__data_ = 0;
      __str.__r_.__value_.__l.__size_ = 0;
    }
    else
    {
      __str.__r_.__value_.__s.__data_[0] = 0;
      *((_BYTE *)&__str.__r_.__value_.__s + 23) = 0;
    }
    v51 = 0;
    while (1)
    {
      v52 = *(_QWORD **)((char *)v88 + *(_QWORD *)(v86.__r_.__value_.__r.__words[0] - 24));
      v53 = (_BYTE *)v52[3];
      if (v53 != (_BYTE *)v52[4])
      {
        v52[3] = v53 + 1;
        LOBYTE(v52) = *v53;
        goto LABEL_107;
      }
      LODWORD(v52) = (*(uint64_t (**)(_QWORD *))(*v52 + 80))(v52);
      if ((_DWORD)v52 == -1)
        break;
LABEL_107:
      if (v50 == v52)
      {
        v54 = 0;
        goto LABEL_115;
      }
      std::string::push_back(&__str, (std::string::value_type)v52);
      ++v51;
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0 && __str.__r_.__value_.__l.__size_ == 0x7FFFFFFFFFFFFFF7)
      {
        v54 = 4;
        goto LABEL_115;
      }
    }
    if (v51)
      v54 = 2;
    else
      v54 = 6;
LABEL_115:
    std::ios_base::clear((std::ios_base *)((char *)&v86 + *(_QWORD *)(v86.__r_.__value_.__r.__words[0] - 24)), *(_DWORD *)((char *)&v88[-1] + *(_QWORD *)(v86.__r_.__value_.__r.__words[0] - 24)) | v54);
LABEL_116:
    if ((*((_BYTE *)&v88[-1] + *(_QWORD *)(v86.__r_.__value_.__r.__words[0] - 24)) & 5) == 0)
    {
      v81 = 0;
      v80 = 0u;
      memset(v79, 0, sizeof(v79));
      v55 = *((_QWORD *)i + 6);
      v56 = *((_QWORD *)i + 7);
      if (v55 >= v56)
      {
        v59 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v55 - *v48) >> 3);
        v60 = v59 + 1;
        if ((unint64_t)(v59 + 1) > 0x492492492492492)
          abort();
        v61 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v56 - *v48) >> 3);
        if (2 * v61 > v60)
          v60 = 2 * v61;
        if (v61 >= 0x249249249249249)
          v62 = 0x492492492492492;
        else
          v62 = v60;
        std::__split_buffer<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>::__split_buffer(&v84, v62, v59, (uint64_t)i + 56);
        v63 = v85;
        v85->__locale_ = (std::locale::__imp *)v79[0];
        v64 = *(_OWORD *)&v79[1].__locale_;
        v63[3].__locale_ = (std::locale::__imp *)v79[3];
        v63[4].__locale_ = 0;
        *(_OWORD *)&v63[1].__locale_ = v64;
        memset(&v79[1], 0, 24);
        v63[5].__locale_ = 0;
        v63[6].__locale_ = 0;
        *(_OWORD *)&v63[4].__locale_ = v80;
        v63[6].__locale_ = v81;
        v80 = 0uLL;
        v81 = 0;
        v85 += 7;
        std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>::__swap_out_circular_buffer((uint64_t *)i + 5, &v84);
        v58 = *((_QWORD *)i + 6);
        std::__split_buffer<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>::~__split_buffer((uint64_t)&v84);
      }
      else
      {
        *(_QWORD *)v55 = 0;
        v57 = *(_OWORD *)&v79[1].__locale_;
        *(std::locale *)(v55 + 24) = v79[3];
        *(_QWORD *)(v55 + 32) = 0;
        *(_OWORD *)(v55 + 8) = v57;
        memset(&v79[1], 0, 24);
        *(_QWORD *)(v55 + 40) = 0;
        *(_QWORD *)(v55 + 48) = 0;
        *(_OWORD *)(v55 + 32) = v80;
        *(_QWORD *)(v55 + 48) = v81;
        v80 = 0uLL;
        v81 = 0;
        v58 = v55 + 56;
      }
      *((_QWORD *)i + 6) = v58;
      std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>::~vector[abi:nn180100]((uint64_t *)&v80);
      if (SHIBYTE(v79[3].__locale_) < 0)
        operator delete(v79[1].__locale_);
      std::string::operator=((std::string *)(*((_QWORD *)i + 6) - 48), &__str);
      continue;
    }
    break;
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
LABEL_143:
  std::filebuf::~filebuf(&v86.__r_.__value_.__r.__words[2]);
  std::ios::~ios(&v89);
}

- (unsigned)_processPerLineCostDataForLineTable:(_QWORD *)a1 withFileCost:(uint64_t)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  int v4;
  uint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  int8x8_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 **v13;
  unsigned __int8 *i;
  unint64_t v15;

  v4 = *(char *)(a2 + 23);
  if (v4 >= 0)
    v5 = (uint64_t *)a2;
  else
    v5 = *(uint64_t **)a2;
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(a2 + 23);
  else
    v6 = *(_QWORD *)(a2 + 8);
  v7 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v5, v6);
  v8 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v8)
    return 0;
  v9 = v7;
  v10 = (uint8x8_t)vcnt_s8(v8);
  v10.i16[0] = vaddlv_u8(v10);
  v11 = v10.u32[0];
  if (v10.u32[0] > 1uLL)
  {
    v12 = v7;
    if (v7 >= *(_QWORD *)&v8)
      v12 = v7 % *(_QWORD *)&v8;
  }
  else
  {
    v12 = (*(_QWORD *)&v8 - 1) & v7;
  }
  v13 = *(unsigned __int8 ***)(*a1 + 8 * v12);
  if (!v13)
    return 0;
  for (i = *v13; i; i = *(unsigned __int8 **)i)
  {
    v15 = *((_QWORD *)i + 1);
    if (v15 == v9)
    {
      if (std::equal_to<std::string>::operator()[abi:nn180100](i + 16, (unsigned __int8 *)a2))
        return i;
    }
    else
    {
      if (v11 > 1)
      {
        if (v15 >= *(_QWORD *)&v8)
          v15 %= *(_QWORD *)&v8;
      }
      else
      {
        v15 &= *(_QWORD *)&v8 - 1;
      }
      if (v15 != v12)
        return 0;
    }
  }
  return i;
}

- (uint64_t)_processPerLineCostDataForLineTable:(uint64_t *)result withFileCost:(uint64_t *)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;
  void **v6;

  v3 = result;
  v4 = (uint64_t *)result[1];
  if (v4 != a2)
  {
    do
    {
      v5 = v4 - 6;
      v6 = (void **)(v4 - 3);
      std::vector<DebugInfo::BlockInfo>::__destroy_vector::operator()[abi:nn180100](&v6);
      result = std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo>::~vector[abi:nn180100](v5);
      v4 = v5;
    }
    while (v5 != a2);
  }
  v3[1] = (uint64_t)a2;
  return result;
}

- (void)_processPerLineCostDataForLineTable:(_QWORD *)a1 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  if (a1)
  {
    std::__tree<std::__value_type<unsigned int,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>>>>::destroy(*a1);
    std::__tree<std::__value_type<unsigned int,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>>>>::destroy(a1[1]);
    std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>::~vector[abi:nn180100](a1 + 5);
    operator delete(a1);
  }
}

- (void)_processPerLineCostDataForLineTable:(uint64_t)a1 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>::~vector[abi:nn180100]((uint64_t *)(a1 + 32));
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
}

- (void)_processPerLineCostDataForLineTable:(void *)a1 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *a1;
  if (*a1)
  {
    v3 = (uint64_t)a1[1];
    v4 = *a1;
    if ((void *)v3 != v2)
    {
      do
      {
        v3 -= 56;
        std::allocator_traits<std::allocator<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::destroy[abi:nn180100]<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo,void>(v3);
      }
      while ((void *)v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

- (char)_processPerLineCostDataForLineTable:(_QWORD *)a1 withFileCost:(unint64_t)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x492492492492493)
    abort();
  result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[56 * v4];
  return result;
}

- (_QWORD)_processPerLineCostDataForLineTable:(uint64_t)a3 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v3 = result;
  v4 = result[1];
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      *(_QWORD *)v4 = *(id *)v6;
      result = *(id *)(v6 + 8);
      *(_QWORD *)(v4 + 8) = result;
      v7 = *(_QWORD *)(v6 + 48);
      v8 = *(_OWORD *)(v6 + 32);
      *(_OWORD *)(v4 + 16) = *(_OWORD *)(v6 + 16);
      *(_OWORD *)(v4 + 32) = v8;
      *(_QWORD *)(v4 + 48) = v7;
      v4 += 56;
      v6 += 56;
    }
    while (v6 != a3);
  }
  v3[1] = v4;
  return result;
}

- (void)_processPerLineCostDataForLineTable:(uint64_t)a1 withFileCost:(uint64_t)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  uint64_t i;
  void *v5;

  for (i = *(_QWORD *)(a1 + 8); i != a2; i -= 56)
  {

    v5 = *(void **)(i - 56);
  }
  *(_QWORD *)(a1 + 8) = a2;
}

- (_QWORD)_processPerLineCostDataForLineTable:(uint64_t)a3 withFileCost:(uint64_t)a4 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  char *v7;
  char *v8;

  a1[3] = 0;
  a1[4] = a4;
  if (a2)
  {
    if (a2 >= 0x492492492492493)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v7 = (char *)operator new(56 * a2);
  }
  else
  {
    v7 = 0;
  }
  v8 = &v7[56 * a3];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v8;
  a1[3] = &v7[56 * a2];
  return a1;
}

- (uint64_t)_processPerLineCostDataForLineTable:(uint64_t *)result withFileCost:(_QWORD *)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *result;
  v2 = result[1];
  v4 = a2[1];
  if (v2 != *result)
  {
    v5 = 0;
    do
    {
      v6 = v4 + v5;
      v7 = v2 + v5;
      *(_QWORD *)(v6 - 56) = *(_QWORD *)(v2 + v5 - 56);
      v8 = *(_OWORD *)(v2 + v5 - 48);
      *(_QWORD *)(v6 - 32) = *(_QWORD *)(v2 + v5 - 32);
      *(_OWORD *)(v6 - 48) = v8;
      *(_QWORD *)(v7 - 40) = 0;
      *(_QWORD *)(v7 - 32) = 0;
      *(_QWORD *)(v7 - 48) = 0;
      *(_QWORD *)(v6 - 24) = 0;
      *(_QWORD *)(v6 - 16) = 0;
      *(_QWORD *)(v6 - 8) = 0;
      *(_OWORD *)(v6 - 24) = *(_OWORD *)(v2 + v5 - 24);
      *(_QWORD *)(v6 - 8) = *(_QWORD *)(v2 + v5 - 8);
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      v5 -= 56;
    }
    while (v2 + v5 != v3);
    v4 += v5;
  }
  a2[1] = v4;
  v9 = *result;
  *result = v4;
  a2[1] = v9;
  v10 = result[1];
  result[1] = a2[2];
  a2[2] = v10;
  v11 = result[2];
  result[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return result;
}

void __70__GTShaderProfilerHelper__processHarvestedBinaryData_forStreamedData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", a2));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __70__GTShaderProfilerHelper__processHarvestedBinaryData_forStreamedData___block_invoke_2;
  v8[3] = &unk_725368;
  v7 = v5;
  v9 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __70__GTShaderProfilerHelper__processHarvestedBinaryData_forStreamedData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v7 = (void *)objc_opt_new(ShaderBinaryInfo, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("binary")));
  objc_msgSend(v7, "setBinary:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type")));
  objc_msgSend(v7, "setType:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dylib")));
  objc_msgSend(v7, "setDylib:", v10);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v11);
}

- (_QWORD)_calculatePerSampleActiveShaders:(uint64_t)a1 withShaderProfilerResult:(unint64_t)a2 forWorkloadInfo:(unint64_t)a3
{
  uint8x8_t v3;
  unint64_t v4;
  _QWORD *v5;
  _QWORD *result;
  unint64_t v7;

  if (!a2)
    return 0;
  v3 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    v4 = a3;
    if (a3 >= a2)
      v4 = a3 % a2;
  }
  else
  {
    v4 = (a2 - 1) & a3;
  }
  v5 = *(_QWORD **)(a1 + 8 * v4);
  if (!v5)
    return 0;
  result = (_QWORD *)*v5;
  if (*v5)
  {
    do
    {
      v7 = result[1];
      if (v7 == a3)
      {
        if (result[2] == a3)
          return result;
      }
      else
      {
        if (v3.u32[0] > 1uLL)
        {
          if (v7 >= a2)
            v7 %= a2;
        }
        else
        {
          v7 &= a2 - 1;
        }
        if (v7 != v4)
          return 0;
      }
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

- (uint64_t)_calculatePerSampleActiveShaders:(uint64_t)a1 withShaderProfilerResult:forWorkloadInfo:
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      std::allocator_traits<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>,void *>>>::destroy[abi:nn180100]<std::pair<unsigned long long const,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>,void,void>((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

- (void)_calculatePerSampleActiveShaders:(uint64_t)a1 withShaderProfilerResult:forWorkloadInfo:
{
  void *v2;

  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table(a1 + 32);
  v2 = *(void **)(a1 + 8);
  if (v2)
  {
    *(_QWORD *)(a1 + 16) = v2;
    operator delete(v2);
  }
}

void __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", a2));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_2;
  v8[3] = &unk_725368;
  v7 = v5;
  v9 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned int a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  unsigned int v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  int v19;
  unsigned int v20;

  v12 = a2;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", v12));
  if (a4 > 2)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_5;
    v13[3] = &__block_descriptor_36_e15_v32__0_8_16_B24l;
    v14 = a4;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v13);
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_4;
    v15[3] = &unk_7253B8;
    v9 = v7;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v16 = v9;
    v17 = v10;
    v19 = *(_DWORD *)(a1 + 48);
    v20 = a4;
    v18 = v11;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v15);

    v8 = v16;
  }

}

void __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:"));
  v4 = *(void **)(a1 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "binary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uscSamples"));
  v7 = *(unsigned int *)(a1 + 56);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_extractShaderBinaryTextSegment:", v3));
  LODWORD(v11) = *(_DWORD *)(a1 + 60);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_analyzeBinary:uscSamples:targetIndex:withTextSegment:withKey:withShaderSourcePath:forDataMaster:withPerDrawLimiterData:", v5, v6, v7, v8, v12, 0, v11, *(_QWORD *)(a1 + 48)));

  if (!v9)
    v9 = (void *)objc_opt_new(DYShaderAnalyzerResult, v10);
  objc_msgSend(v3, "setAnalyzerResult:", v9);

}

void __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  FILE *v6;
  id v7;
  id v8;

  v3 = a2;
  if (g_runningInCI)
  {
    v8 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("analyzeShaderInfoResult ignoring data master %d on key %@"), *(unsigned int *)(a1 + 32), v3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#CI-INFO# ")));

    v6 = __stdoutp;
    v7 = objc_retainAutorelease(v5);
    fprintf(v6, "#CI-INFO# %s\n", (const char *)objc_msgSend(v7, "UTF8String"));

    v3 = v8;
  }

}

void __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v7 = (void *)objc_opt_new(ShaderBinaryInfo, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("binary")));
  objc_msgSend(v7, "setBinary:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type")));
  objc_msgSend(v7, "setType:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dylib")));
  objc_msgSend(v7, "setDylib:", v10);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v11);
}

@end
