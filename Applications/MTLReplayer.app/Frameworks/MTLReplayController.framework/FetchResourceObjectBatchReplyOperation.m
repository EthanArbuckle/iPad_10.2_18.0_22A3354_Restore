@implementation FetchResourceObjectBatchReplyOperation

void __FetchResourceObjectBatchReplyOperation_block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  id v27;
  __CFString *v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  int v34;
  id v35;
  id v36;
  id v37;
  uint8_t *v38;
  id v39;
  id v40;
  size_t v41;
  void *v42;
  NSObject *v43;
  os_signpost_id_t v44;
  id v45;
  void *v46;
  NSObject *v47;
  os_signpost_id_t v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  NSObject *v55;
  os_signpost_id_t v56;
  id v57;
  void *v58;
  NSObject *v59;
  os_signpost_id_t v60;
  id v61;
  void *v62;
  NSObject *v63;
  os_signpost_id_t v64;
  int v65;
  id v66;
  void *v67;
  NSObject *v68;
  os_signpost_id_t v69;
  id v70;
  void *context;
  void *v72;
  id v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[3];
  _QWORD v80[3];
  uint8_t buf[4];
  _BYTE v82[14];
  __int16 v83;
  id v84;
  _QWORD v85[4];
  _QWORD v86[4];
  _BYTE v87[128];

  v2 = g_signpostLog;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 80);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v2))
  {
    v5 = *(_DWORD *)(a1 + 96);
    v6 = *(_QWORD *)(a1 + 88);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v82 = v5;
    *(_WORD *)&v82[4] = 2048;
    *(_QWORD *)&v82[6] = v6;
    _os_signpost_emit_with_name_impl(&dword_0, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Replayer-4-parallel", "%u. kDYMessageFetchResourceObjectBatch x%lu", buf, 0x12u);
  }

  context = objc_autoreleasePoolPush();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allKeys"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v76 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12));
        v14 = PreprocessICBData(v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v15, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
    }
    while (v9);
  }

  v16 = g_signpostLog;
  v17 = v16;
  v18 = *(_QWORD *)(a1 + 80);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v16))
  {
    v19 = *(_DWORD *)(a1 + 96);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v82 = v19;
    _os_signpost_emit_with_name_impl(&dword_0, v17, OS_SIGNPOST_INTERVAL_BEGIN, v18, "Replayer-6-high", "%u. archivedDataWithRootObject", buf, 8u);
  }

  v85[0] = CFSTR("stream");
  v85[1] = CFSTR("object");
  v20 = *(_QWORD *)(a1 + 32);
  v86[0] = *(_QWORD *)(a1 + 40);
  v86[1] = v20;
  v85[2] = CFSTR("functionIndex");
  v85[3] = CFSTR("requestID");
  v21 = *(_QWORD *)(a1 + 56);
  v86[2] = *(_QWORD *)(a1 + 48);
  v86[3] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v86, v85, 4));
  v74 = 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v22, 1, &v74));
  v70 = v74;

  v24 = g_signpostLog;
  v25 = v24;
  v26 = *(_QWORD *)(a1 + 80);
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v24))
  {
    v27 = objc_msgSend(v23, "length");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v82 = v27;
    _os_signpost_emit_with_name_impl(&dword_0, v25, OS_SIGNPOST_INTERVAL_END, v26, "Replayer-6-high", "%{xcode:size-in-bytes}lu", buf, 0xCu);
  }

  v28 = (__CFString *)*(id *)(a1 + 64);
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_739400, "objectForKeyedSubscript:", v28));
  v72 = v23;
  if (v29)
  {
    v30 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", objc_msgSend(v23, "length"));
    v31 = g_signpostLog;
    v32 = v31;
    v33 = *(_QWORD *)(a1 + 80);
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v31))
    {
      v34 = *(_DWORD *)(a1 + 96);
      v35 = -[__CFString UTF8String](objc_retainAutorelease(v28), "UTF8String");
      v36 = objc_msgSend(v72, "length");
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v82 = v34;
      *(_WORD *)&v82[4] = 2082;
      *(_QWORD *)&v82[6] = v35;
      v23 = v72;
      v83 = 2048;
      v84 = v36;
      _os_signpost_emit_with_name_impl(&dword_0, v32, OS_SIGNPOST_INTERVAL_BEGIN, v33, "Replayer-6-high", "%u. %{public}s %{xcode:size-in-bytes}lu", buf, 0x1Cu);
    }

    v37 = objc_retainAutorelease(v30);
    v38 = (uint8_t *)objc_msgSend(v37, "mutableBytes");
    v39 = objc_msgSend(v37, "length");
    v40 = objc_retainAutorelease(v23);
    v41 = compression_encode_buffer(v38, (size_t)v39, (const uint8_t *)objc_msgSend(v40, "bytes"), (size_t)objc_msgSend(v40, "length"), 0, (compression_algorithm)objc_msgSend(v29, "unsignedIntValue"));
    v42 = g_signpostLog;
    v43 = v42;
    v44 = *(_QWORD *)(a1 + 80);
    if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v42))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v82 = v41;
      _os_signpost_emit_with_name_impl(&dword_0, v43, OS_SIGNPOST_INTERVAL_END, v44, "Replayer-6-high", "%{xcode:size-in-bytes}zu", buf, 0xCu);
    }

    objc_msgSend(v37, "setLength:", v41);
    v23 = v72;
  }
  else
  {
    v37 = 0;
  }
  if (!objc_msgSend(v37, "length"))
  {

    v45 = v23;
    v28 = CFSTR("none");
    v37 = v45;
  }
  v46 = g_signpostLog;
  v47 = v46;
  v48 = *(_QWORD *)(a1 + 80);
  if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v46))
  {
    v49 = *(_DWORD *)(a1 + 96);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v82 = v49;
    _os_signpost_emit_with_name_impl(&dword_0, v47, OS_SIGNPOST_INTERVAL_BEGIN, v48, "Replayer-6-high", "%u. archivedDataWithRootObject", buf, 8u);
  }

  v80[0] = v28;
  v79[0] = CFSTR("compressed");
  v79[1] = CFSTR("stream");
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v23, "length")));
  v79[2] = CFSTR("object");
  v80[1] = v50;
  v80[2] = v37;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v80, v79, 3));
  v73 = v70;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v51, 1, &v73));
  v53 = v73;

  v54 = g_signpostLog;
  v55 = v54;
  v56 = *(_QWORD *)(a1 + 80);
  if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v54))
  {
    v57 = objc_msgSend(v72, "length");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v82 = v57;
    _os_signpost_emit_with_name_impl(&dword_0, v55, OS_SIGNPOST_INTERVAL_END, v56, "Replayer-6-high", "%{xcode:size-in-bytes}lu", buf, 0xCu);
  }

  v58 = g_signpostLog;
  v59 = v58;
  v60 = *(_QWORD *)(a1 + 80);
  if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v58))
  {
    v61 = objc_msgSend(v52, "length");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v82 = v61;
    _os_signpost_emit_with_name_impl(&dword_0, v59, OS_SIGNPOST_INTERVAL_END, v60, "Replayer-4-parallel", "%{xcode:size-in-bytes}lu", buf, 0xCu);
  }

  objc_autoreleasePoolPop(context);
  v62 = g_signpostLog;
  v63 = v62;
  v64 = *(_QWORD *)(a1 + 80);
  if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v62))
  {
    v65 = *(_DWORD *)(a1 + 96);
    v66 = objc_msgSend(v52, "length");
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v82 = v65;
    *(_WORD *)&v82[4] = 2048;
    *(_QWORD *)&v82[6] = v66;
    _os_signpost_emit_with_name_impl(&dword_0, v63, OS_SIGNPOST_INTERVAL_BEGIN, v64, "Replayer-5-network", "%u. send compressedData %{xcode:size-in-bytes}lu", buf, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  v67 = g_signpostLog;
  v68 = v67;
  v69 = *(_QWORD *)(a1 + 80);
  if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v67))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v68, OS_SIGNPOST_INTERVAL_END, v69, "Replayer-5-network", (const char *)&unk_4AAB5F, buf, 2u);
  }

}

@end
