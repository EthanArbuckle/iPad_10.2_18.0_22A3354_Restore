@implementation CollectFrameCounters

void __CollectFrameCounters_block_invoke(uint64_t a1)
{
  os_signpost_id_t v2;
  void *v3;
  NSObject *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *i;
  void *v27;
  id v28;
  char *v29;
  char *v30;
  uint64_t j;
  void *k;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  unint64_t v37;
  os_signpost_id_t v38;
  id v39;
  id v40;
  unint64_t v41;
  unint64_t v42;
  void *v43;
  char *v44;
  id v45;
  uint8_t buf[2];

  v2 = os_signpost_id_make_with_pointer((os_log_t)g_signpostLog, *(const void **)(a1 + 32));
  v3 = g_signpostLog;
  v4 = v3;
  v5 = v2 - 1;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "Replayer-4-parallel", "MergeCounterData", buf, 2u);
  }

  v7 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v8 = *(void **)(a1 + 56);
  v10 = v6;
  v11 = v9;
  v45 = v8;
  v44 = (char *)objc_msgSend(v11, "count");
  if (v44 == (_BYTE *)&dword_0 + 1
    && (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0)),
        v13 = objc_msgSend(v12, "isEqualToArray:", v10),
        v12,
        v13))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectAtIndexedSubscript:", 0));
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectAtIndexedSubscript:", 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));
    v18 = (unint64_t)objc_msgSend(v16, "length");
    v41 = 8 * (_QWORD)objc_msgSend(v17, "count");
    v42 = v18;
    v19 = v18 / v41;

    v20 = objc_msgSend(v10, "count");
    v21 = objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 8 * v19 * (_QWORD)v20));
    v15 = (void *)v21;
    if (v44)
    {
      v40 = (id)v21;
      v43 = v11;
      v36 = v7;
      v37 = v2 - 1;
      v38 = v2;
      v22 = 0;
      if (v19 <= 1)
        v23 = 1;
      else
        v23 = v19;
      do
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectAtIndexedSubscript:", v22, v36, v37, v38));
        v25 = objc_msgSend(v24, "count");
        if (v25)
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", i));
            *(_QWORD *)&buf[8 * (_QWORD)i] = objc_msgSend(v10, "indexOfObject:", v27);

          }
        }
        v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectAtIndexedSubscript:", v22)));
        v29 = (char *)objc_msgSend(v28, "bytes");
        v39 = objc_retainAutorelease(v40);
        v30 = (char *)objc_msgSend(v39, "mutableBytes");
        if (v41 <= v42)
        {
          for (j = 0; j != v23; ++j)
          {
            if (v25)
            {
              for (k = 0; k != v25; k = (char *)k + 1)
              {
                v33 = *(_QWORD *)&buf[8 * (_QWORD)k];
                if (v33 != 0x7FFFFFFFFFFFFFFFLL)
                  *(_QWORD *)&v30[8 * v33] = *(_QWORD *)&v29[8 * (_QWORD)k];
              }
            }
            v30 += 8 * (_QWORD)v20;
            v29 += 8 * (_QWORD)v25;
          }
        }

        ++v22;
      }
      while (v22 != v44);
      v2 = v38;
      v15 = v39;
      v7 = v36;
      v5 = v37;
      v11 = v43;
    }
  }

  objc_msgSend(v7, "setData:", v15);
  v34 = g_signpostLog;
  v35 = v34;
  if (v5 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v35, OS_SIGNPOST_INTERVAL_END, v2, "Replayer-4-parallel", (const char *)&unk_4AAB5F, buf, 2u);
  }

}

void __CollectFrameCounters_block_invoke_311(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  size_t v9;
  id v10;
  size_t v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;

  v2 = g_signpostLog;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v2))
  {
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 64);
    v17 = 134218240;
    v18 = v5;
    v19 = 2048;
    v20 = v6;
    _os_signpost_emit_with_name_impl(&dword_0, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Replayer-4-parallel", "SortCounterData %lu/%lu", (uint8_t *)&v17, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 56)));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 56)));
  v9 = 8 * (_QWORD)objc_msgSend(v8, "count");
  v10 = v7;
  v11 = (unint64_t)objc_msgSend(v10, "length") / v9;
  v12 = objc_retainAutorelease(v10);
  v13 = objc_msgSend(v12, "mutableBytes");

  qsort(v13, v11, v9, (int (__cdecl *)(const void *, const void *))compareSampleData);
  v14 = g_signpostLog;
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 48);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v14))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v15, OS_SIGNPOST_INTERVAL_END, v16, "Replayer-4-parallel", (const char *)&unk_4AAB5F, (uint8_t *)&v17, 2u);
  }

}

id __CollectFrameCounters_block_invoke_312(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  FILE *v15;
  int v16;
  id v17;
  const char *v18;
  const char *v19;
  id v20;
  id v21;
  _DWORD *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  unsigned int v28;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  char *v35;
  void *v36;
  void *v37;
  uint64_t v39;
  char *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t *v46;
  NSRange v47;
  NSUInteger length;
  _QWORD *Object;
  int v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  int64_t v55;
  void *v56;
  char *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  int64_t v63;
  void *v64;
  NSObject *v65;
  os_signpost_id_t v66;
  void *v67;
  void *v68;
  uint64_t v70;
  id v71;
  id v72;
  uint64_t v73;
  uint64_t *v74;
  id v75;
  id v76;
  uint64_t v77;
  void *v79;
  uint64_t v80;
  unint64_t v81;
  _QWORD v82[4];
  id v83;
  uint64_t v84;
  _QWORD v85[4];
  id v86;
  _BYTE __dst[11096];
  NSRange v88;
  __int128 range2;
  _OWORD v90[13];
  apr_pool_t *p[2];
  _DWORD v92[2790];
  NSRange v93;
  NSRange v94;

  v1 = (void *)g_activityLog;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 64)));
  objc_msgSend(v1, "enterCollectCounters:statLocations:withIndex:", v2, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));

  v3 = g_signpostLog;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v3))
  {
    v6 = *(_QWORD *)(a1 + 64);
    v7 = *(_QWORD *)(a1 + 88);
    v92[0] = 134218240;
    *(_QWORD *)&v92[1] = v6;
    LOWORD(v92[3]) = 2048;
    *(_QWORD *)((char *)&v92[3] + 2) = v7;
    _os_signpost_emit_with_name_impl(&dword_0, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Replayer-1-serial", "CollectCounterData %lu/%lu", (uint8_t *)v92, 0x16u);
  }

  v8 = *(_QWORD *)(a1 + 96);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 64)));
  v10 = *(void **)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 64);
  v73 = *(_QWORD *)(a1 + 72);
  v75 = v9;
  v72 = v10;
  GTMTLReplayController_prePlayForProfiling(v8);
  objc_msgSend(v75, "count");
  v71 = objc_msgSend((id)g_commandBufferDescriptor, "errorOptions");
  objc_msgSend((id)g_commandBufferDescriptor, "setErrorOptions:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v8 + 8), "defaultCommandQueue"));
  objc_msgSend(v12, "setStatEnabled:", 1);
  objc_msgSend(v12, "setStatOptions:", 1);
  objc_msgSend(v12, "setStatOptions:", 0x10000000);
  objc_msgSend(v12, "setGPUPriority:", 0);
  objc_msgSend(v12, "setStatLocations:", v73);
  v13 = objc_msgSend(v12, "requestCounters:withIndex:", v75, v11);
  v79 = v12;
  if ((_DWORD)v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CollectCounterData requestCounters on index %d failed with error %d"), v11, v13));
    v15 = __stdoutp;
    v16 = g_runningInCI;
    v17 = objc_retainAutorelease(v14);
    v18 = (const char *)objc_msgSend(v17, "UTF8String");
    v19 = "#CI_ERROR# ";
    if (!v16)
      v19 = "";
    fprintf(v15, "%s%s %u: %s\n", v19, "void CollectCounterData(GTMTLReplayController *, NSArray *__strong, uint64_t, NSArray *__strong, NSUInteger)", 294, v18);
    v20 = objc_retainAutorelease(v17);
    GTMTLReplay_handleError(101, (uint64_t)objc_msgSend(v20, "UTF8String"), "/Library/Caches/com.apple.xbs/Sources/GPUToolsDevice/GPUTools/GTMTLCapture/replayer/GTMTLReplay_frameProfiler.m", (uint64_t)"CollectCounterData", 294, 1);

    v12 = v79;
  }
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = __CollectCounterData_block_invoke;
  v85[3] = &unk_726890;
  v86 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectAtIndexedSubscript:", v11));
  v21 = v86;
  objc_msgSend(v12, "addPerfSampleHandler:", v85);

  v22 = (_DWORD *)(v8 + 22480);
  v74 = *(uint64_t **)v8;
  v81 = v74[13] + v74[12];
  if (v81 > *(unsigned int *)(v8 + 22480))
  {
    v77 = 0;
    v80 = v74[15];
    v70 = v8 + 11368;
    do
    {
      v23 = objc_autoreleasePoolPush();
      v24 = *(_QWORD *)(v80 + 24);
      v25 = *v22;
      v26 = v24 + (v25 << 6);
      v27 = (int *)(v26 + 8);
      if (GetFuncEnumConstructorType(*(_DWORD *)(v26 + 8)) == 25)
        GTMTLReplayController_restoreCommandBuffer(v8, v24 + (v25 << 6));
      GTMTLReplayController_updateCommandEncoder(v8, v24 + (v25 << 6));
      v28 = *v27;
      if ((*v27 + 15756) <= 6 && ((1 << (*v27 - 116)) & 0x47) != 0 || v28 == -15637)
        goto LABEL_20;
      if (v77)
      {
        if (IsFuncEnumCreateCommandEncoder(*v27))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v8 + 8), "commandBufferForKey:", v77));
          objc_msgSend(v32, "commit");
          objc_msgSend(v79, "setStatLocations:", v73);
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v8 + 8), "defaultCommandQueue"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "commandBuffer"));

          objc_msgSend(*(id *)(v8 + 8), "setCommandBuffer:forKey:", v34, v77);
          v77 = 0;
          v28 = *v27;
        }
      }
      else
      {
        v77 = 0;
      }
      if (v28 == -15673)
      {
        v35 = GTTraceFunc_argumentBytesWithMap((_QWORD *)(v24 + (v25 << 6)), *(unsigned __int8 *)(v24 + (v25 << 6) + 13), v74[2]);
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v8 + 8), "commandBufferForKey:", *(_QWORD *)v35));
        objc_msgSend(v36, "commit");
        objc_msgSend(v79, "setStatLocations:", 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "commandBuffer"));

        objc_msgSend(*(id *)(v8 + 8), "setCommandBuffer:forKey:", v37, *(_QWORD *)v35);
        v77 = *(_QWORD *)v35;
        v28 = *v27;
      }
      if (v28 == -20457 || v28 == -20474)
      {
        v39 = v74[2];
        if (v28 == -20474)
        {
          v57 = GTTraceFunc_argumentBytesWithMap((_QWORD *)(v24 + (v25 << 6)), *(unsigned __int8 *)(v24 + (v25 << 6) + 13), v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v8 + 8), "spatialScalerForKey:", *(_QWORD *)v57));
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v8 + 8), "commandBufferForKey:", *((_QWORD *)v57 + 1)));
          objc_msgSend(v58, "commit");

          objc_msgSend(v79, "setStatLocations:", 0);
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "commandBuffer"));
          objc_msgSend(v41, "encodeToCommandBuffer:", v59);
          objc_msgSend(v59, "commit");
          objc_msgSend(v79, "setStatLocations:", v73);

          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v8 + 8), "defaultCommandQueue"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "commandBuffer"));

          objc_msgSend(*(id *)(v8 + 8), "setCommandBuffer:forKey:", v45, *((_QWORD *)v57 + 1));
          goto LABEL_47;
        }
        if (v28 == -20457)
        {
          v40 = GTTraceFunc_argumentBytesWithMap((_QWORD *)(v24 + (v25 << 6)), *(unsigned __int8 *)(v24 + (v25 << 6) + 13), v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v8 + 8), "temporalScalerForKey:", *(_QWORD *)v40));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v8 + 8), "commandBufferForKey:", *((_QWORD *)v40 + 1)));
          objc_msgSend(v42, "commit");

          objc_msgSend(v79, "setStatLocations:", 0);
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "commandBuffer"));
          objc_msgSend(v41, "encodeToCommandBuffer:", v43);
          objc_msgSend(v43, "commit");
          objc_msgSend(v79, "setStatLocations:", v73);

          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v8 + 8), "defaultCommandQueue"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "commandBuffer"));

          objc_msgSend(*(id *)(v8 + 8), "setCommandBuffer:forKey:", v45, *((_QWORD *)v40 + 1));
LABEL_47:

          goto LABEL_20;
        }
      }
      if (v28 >> 2 == 1073737833)
      {
        v46 = *(uint64_t **)v8;
        *(_OWORD *)p = 0u;
        memset(v90, 0, sizeof(v90));
        range2 = 0u;
        v88 = (NSRange)0;
        GetExecuteCommandsInBufferArgs((uint64_t)&v88, v24 + (v25 << 6), v46[2]);
        v94.location = v88.length;
        v94.length = range2;
        v93.location = 0;
        v93.length = -1;
        v47 = NSIntersectionRange(v93, v94);
        length = v47.length;
        if (v47.length)
        {
          p[1] = **(apr_pool_t ***)(v8 + 152);
          GTMTLSMContext_indirectCommandBufferResources((uint64_t)&v90[7] + 8, (_DWORD **)v46[5], *(_QWORD *)v26, p[1]);
          Object = GTMTLSMContext_getObject(*(_QWORD *)v46[5], v88.location, *(_QWORD *)v26);
          GTMTLCreateIndirectCommandEncoder((uint64_t)v90 + 8, Object[13]);
          memcpy(v92, (const void *)(v8 + 11312), 0x2B90uLL);
          v76 = *(id *)(v8 + 8);
          v50 = *(_DWORD *)(v8 + 11312);
          if (v50 == 28)
          {
            if ((GT_SUPPORT_0 & 0x10) != 0)
            {
              v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v8 + 8), "computeCommandEncoderForKey:", *(_QWORD *)(v8 + 11320)));
              v61 = *((_QWORD *)&range2 + 1);
              v62 = *(_QWORD *)&v90[7];
              v63 = v47.location << 32;
              do
              {
                p[0] = (apr_pool_t *)(v61 + v62 * (v63 >> 32));
                memcpy(__dst, &v92[14], 0x8D0uLL);
                if (GTMTLSMComputeCommandEncoder_loadIndirectCommand((uint64_t)&v92[14], (_QWORD *)v90 + 1, (uint64_t)p[0], (uint64_t *)&v90[7] + 1))
                {
                  GTMTLReplayController_restoreComputeCommandEncoder(v56, (uint64_t)__dst, (uint64_t)&v92[14], v76);
                  DYMTLDispatchComputeCommandEncoder(v56, (uint64_t)v90 + 8, v61 + v62 * (v63 >> 32));
                }
                v63 += 0x100000000;
                --length;
              }
              while (length);
              GTMTLReplayController_restoreComputeCommandEncoder(v56, (uint64_t)&v92[14], v70, v76);
LABEL_54:

            }
          }
          else if (v50 == 70)
          {
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "executeIndirectCommandBufferMap"));
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v8 + 8), "renderCommandEncoderForKey:", *(_QWORD *)(v8 + 11320)));
            v53 = *((_QWORD *)&range2 + 1);
            v54 = *(_QWORD *)&v90[7];
            v55 = v47.location << 32;
            do
            {
              p[0] = (apr_pool_t *)(v53 + v54 * (v55 >> 32));
              memcpy(__dst, &v92[14], sizeof(__dst));
              if (GTMTLSMRenderCommandEncoder_loadIndirectCommand((uint64_t)&v92[14], (_QWORD *)v90 + 1, (uint64_t)p[0], (uint64_t *)&v90[7] + 1))
              {
                GTMTLReplayController_restoreRenderCommandEncoder(v52, (uint64_t)__dst, (uint64_t)&v92[14], v76);
                DYMTLDrawRenderCommandEncoder(v52, (uint64_t)v90 + 8, v53 + v54 * (v55 >> 32), (uint64_t)&v90[7] + 8, v51);
              }
              v55 += 0x100000000;
              --length;
            }
            while (length);
            GTMTLReplayController_restoreRenderCommandEncoder(v52, (uint64_t)&v92[14], v70, v76);
            v56 = v51;

            goto LABEL_54;
          }
          apr_pool_clear(p[1]);

        }
      }
      else
      {
        GTMTLReplayController_defaultDispatchFunction(v8, v24 + (v25 << 6));
      }
LABEL_20:
      objc_autoreleasePoolPop(v23);
      v31 = (*v22 + 1);
      *v22 = v31;
    }
    while (v81 > v31);
  }
  *(_DWORD *)(v8 + 22484) = 0;
  objc_msgSend(v79, "finish");
  objc_msgSend(v79, "setGPUPriority:", 1);
  objc_msgSend(v79, "setStatEnabled:", 0);
  objc_msgSend((id)g_commandBufferDescriptor, "setErrorOptions:", v71);

  v64 = g_signpostLog;
  v65 = v64;
  v66 = *(_QWORD *)(a1 + 80);
  if (v66 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v64))
  {
    LOWORD(v92[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v65, OS_SIGNPOST_INTERVAL_END, v66, "Replayer-1-serial", (const char *)&unk_4AAB5F, (uint8_t *)v92, 2u);
  }

  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "commandBufferWithUnretainedReferences"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.gputools.replay"), CFSTR("CollectFrameCounters")));
  objc_msgSend(v67, "setLabel:", v68);

  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = __CollectFrameCounters_block_invoke_315;
  v82[3] = &unk_726840;
  v84 = *(_QWORD *)(a1 + 104);
  v83 = *(id *)(a1 + 56);
  objc_msgSend(v67, "addCompletedHandler:", v82);
  GTMTLReplay_commitCommandBuffer(v67);

  return objc_msgSend((id)g_activityLog, "leaveActivity");
}

id __CollectFrameCounters_block_invoke_315(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addOperation:", *(_QWORD *)(a1 + 32));
}

@end
