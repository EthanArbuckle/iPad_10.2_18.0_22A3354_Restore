@implementation GTMTLReplay

void __GTMTLReplay_CLI_block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void (*v10)(id, void *);
  void *v11;
  void *v12;
  id v13;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@-%@-%@"), a1[4], v8, v7);

  v10 = (void (*)(id, void *))a1[6];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathExtension:", CFSTR("png")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", v11, 0, a1[5]));
  v10(v9, v12);

}

void __GTMTLReplay_CLI_block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "processStreamingGRCData:", v3);

  if (!v3)
  {
    objc_msgSend(WeakRetained, "processStreamingGRCData:", &off_739338);
    objc_msgSend(WeakRetained, "waitForCompletion");
  }

}

void __GTMTLReplay_CLI_block_invoke_196(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "processStreamingGRCData:", v3);

  if (!v3)
  {
    objc_msgSend(WeakRetained, "processStreamingGRCData:", &off_739360);
    objc_msgSend(WeakRetained, "waitForCompletion");
  }

}

void __GTMTLReplay_CLI_block_invoke_210(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "processStreamingGRCData:", v3);

  if (!v3)
  {
    objc_msgSend(WeakRetained, "processStreamingGRCData:", &off_739388);
    objc_msgSend(WeakRetained, "waitForCompletion");
  }

}

void __GTMTLReplay_CLI_block_invoke_2_226(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a2;
  v14 = v3;
  if (!v3)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    goto LABEL_14;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Streaming APS Counters")));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4 != 0;

    v3 = v14;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Remove APS Data")));

      v11 = *(void **)(a1 + 40);
      if (v10)
      {
        objc_msgSend(v11, "removeAPSData");
        v8 = *(_QWORD *)(a1 + 56);
        goto LABEL_10;
      }
      objc_msgSend(v11, "addAPSData:", v14);
      v9 = *(_QWORD *)(a1 + 56);
LABEL_13:
      ++*(_QWORD *)(*(_QWORD *)(v9 + 8) + 24);
      goto LABEL_14;
    }
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Streaming APS Profiling")));
    if (v5)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;

    v3 = v14;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Remove APS Counters")));

      v13 = *(void **)(a1 + 40);
      if (v12)
      {
        objc_msgSend(v13, "removeAPSCounterData");
        v8 = *(_QWORD *)(a1 + 72);
        goto LABEL_10;
      }
      objc_msgSend(v13, "addAPSCounterData:", v14);
      v9 = *(_QWORD *)(a1 + 72);
      goto LABEL_13;
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Remove APS Timeline")));

  v7 = *(void **)(a1 + 40);
  if (!v6)
  {
    objc_msgSend(v7, "addAPSTimelineData:", v14);
    v9 = *(_QWORD *)(a1 + 80);
    goto LABEL_13;
  }
  objc_msgSend(v7, "removeAPSTimelineData");
  v8 = *(_QWORD *)(a1 + 80);
LABEL_10:
  *(_QWORD *)(*(_QWORD *)(v8 + 8) + 24) = 0;
LABEL_14:

}

void __GTMTLReplay_CLI_block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  FILE *v4;
  id v5;

  if (a2)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (g_runningInCI)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\tBatch ID Filtering Data %lu/%lu"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(_QWORD *)(a1 + 40)));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#CI-INFO# ")));

      v4 = __stdoutp;
      v5 = objc_retainAutorelease(v3);
      fprintf(v4, "#CI-INFO# %s\n", (const char *)objc_msgSend(v5, "UTF8String"));

    }
  }
}

void __GTMTLReplay_CLI_block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  FILE *v6;
  id v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    v8 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addGPUTimelineData:", v3);
    v3 = v8;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (g_runningInCI)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\tTimeline Data %lu"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#CI-INFO# ")));

      v6 = __stdoutp;
      v7 = objc_retainAutorelease(v5);
      fprintf(v6, "#CI-INFO# %s\n", (const char *)objc_msgSend(v7, "UTF8String"));

      v3 = v8;
    }
  }

}

void __GTMTLReplay_CLI_block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  FILE *v6;
  id v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    v8 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addShaderProfilerData:", v3);
    v3 = v8;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (g_runningInCI)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\tShader Profiler Data %lu"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#CI-INFO# ")));

      v6 = __stdoutp;
      v7 = objc_retainAutorelease(v5);
      fprintf(v6, "#CI-INFO# %s\n", (const char *)objc_msgSend(v7, "UTF8String"));

      v3 = v8;
    }
  }

}

void __GTMTLReplay_CLI_block_invoke_6(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  FILE *v4;
  id v5;

  if (a2)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (g_runningInCI)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\tBatch ID Filtering Data %lu/%lu"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(_QWORD *)(a1 + 40)));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#CI-INFO# ")));

      v4 = __stdoutp;
      v5 = objc_retainAutorelease(v3);
      fprintf(v4, "#CI-INFO# %s\n", (const char *)objc_msgSend(v5, "UTF8String"));

    }
  }
}

void __GTMTLReplay_CLI_block_invoke_7(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "processStreamingGRCData:", v3);

  if (!v3)
  {
    objc_msgSend(WeakRetained, "processStreamingGRCData:", &off_7393B0);
    objc_msgSend(WeakRetained, "waitForCompletion");
    objc_msgSend(WeakRetained, "writeGPUTimelineSerializedData");
  }

}

@end
