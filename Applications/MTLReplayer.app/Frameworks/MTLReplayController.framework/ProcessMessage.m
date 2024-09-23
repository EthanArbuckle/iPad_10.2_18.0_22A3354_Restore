@implementation ProcessMessage

void __ProcessMessage_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  _BOOL8 updated;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectPayload"));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 128);
  v4 = *(void **)(v2 + 136);
  v5 = ArchiveDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  updated = UpdateDebugFileCache(v11, v3, v4, v6);

  v8 = *(void **)(a1 + 40);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", updated));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:objectPayload:](GTTransportMessage_replayer, "messageWithKind:objectPayload:", 4612, v9));
  objc_msgSend(v8, "send:inReplyTo:error:", v10, *(_QWORD *)(a1 + 32), 0);

}

id __ProcessMessage_block_invoke_41(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  int v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[8];
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, void *);
  void *v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;

  objc_msgSend((id)g_activityLog, "enterMessage:", *(_QWORD *)(a1 + 32));
  v2 = g_signpostLog;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v2))
  {
    v5 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v5;
    _os_signpost_emit_with_name_impl(&dword_0, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Replayer-1-serial", "%u. kDYMessageReplayerUpdateLibraries", buf, 8u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectPayload"));
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v9 = (void *)objc_opt_new(NSMutableDictionary, v8);
  *(_QWORD *)buf = _NSConcreteStackBlock;
  v24 = 3221225472;
  v25 = __UpdateLibraries_block_invoke;
  v26 = &unk_726178;
  v28 = &v19;
  v29 = v6;
  v10 = v9;
  v27 = v10;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", buf);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)v20 + 24)));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("succeeded"));

  _Block_object_dispose(&v19, 8);
  v12 = *(void **)(a1 + 40);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:attributes:objectPayload:](GTTransportMessage_replayer, "messageWithKind:attributes:objectPayload:", objc_msgSend(*(id *)(a1 + 32), "kind"), 0, v10));
  objc_msgSend(v12, "send:inReplyTo:error:", v13, *(_QWORD *)(a1 + 32), 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("succeeded")));
  LODWORD(v13) = objc_msgSend(v14, "BOOLValue");

  if ((_DWORD)v13)
    DisplayAttachmentIfNeeded(*(_QWORD *)(a1 + 56), *(_DWORD *)(a1 + 68), *(_DWORD *)(a1 + 72));
  v15 = g_signpostLog;
  v16 = v15;
  v17 = *(_QWORD *)(a1 + 48);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v16, OS_SIGNPOST_INTERVAL_END, v17, "Replayer-1-serial", (const char *)&unk_4AAB5F, buf, 2u);
  }

  return objc_msgSend((id)g_activityLog, "leaveActivity");
}

id __ProcessMessage_block_invoke_44(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  void *v11;
  void *v12;
  _DWORD v14[2];
  __int16 v15;
  id v16;

  objc_msgSend((id)g_activityLog, "enterMessage:", *(_QWORD *)(a1 + 32));
  v2 = ArchiveDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = g_signpostLog;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v4))
  {
    v7 = *(_DWORD *)(a1 + 56);
    v14[0] = 67109378;
    v14[1] = v7;
    v15 = 2082;
    v16 = objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    _os_signpost_emit_with_name_impl(&dword_0, v5, OS_SIGNPOST_EVENT, v6, "Replayer-1-serial", "%u. kDYMessageReplayerDeleteAllArchives %{public}s", (uint8_t *)v14, 0x12u);
  }

  DeleteAllArchives(v3);
  v8 = g_signpostLog;
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 48);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v8))
  {
    LOWORD(v14[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v9, OS_SIGNPOST_EVENT, v10, "Replayer-1-serial", (const char *)&unk_4AAB5F, (uint8_t *)v14, 2u);
  }

  v11 = *(void **)(a1 + 40);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:](GTTransportMessage_replayer, "messageWithKind:", objc_msgSend(*(id *)(a1 + 32), "kind")));
  objc_msgSend(v11, "send:inReplyTo:error:", v12, *(_QWORD *)(a1 + 32), 0);

  return objc_msgSend((id)g_activityLog, "leaveActivity");
}

id __ProcessMessage_block_invoke_45(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  apr_pool_t **v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void ***v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  apr_status_t (__cdecl *v17)(void *);
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void *v22;
  id v23;
  id v24;

  objc_msgSend((id)g_activityLog, "enterMessage:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sandbox_extensions")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("debug_files")));

  v6 = *(apr_pool_t ***)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = ArchiveDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = __ProcessMessage_block_invoke_2;
  v22 = &unk_725ED8;
  v23 = *(id *)(a1 + 48);
  v24 = *(id *)(a1 + 32);
  v10 = v9;
  v11 = v3;
  v12 = v5;
  v13 = &v19;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v7, v19, v20, v21, v22));
  if (v11)
  {
    v15 = sandbox_extension_consume(objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
    v16 = apr_palloc(*v6, 8uLL);
    *v16 = v15;
    apr_pool_cleanup_register(*v6, v16, (apr_status_t (__cdecl *)(void *))CleanupSandboxExtension, v17);
  }
  BeginDebugArchivePath(v6, v14, v10, v12, v13);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return objc_msgSend((id)g_activityLog, "leaveActivity");
}

id __ProcessMessage_block_invoke_51(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "makeObjectsPerformSelector:", "cancel");
}

void __ProcessMessage_block_invoke_54(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  os_signpost_id_t v30;
  void *v31;
  int v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  os_signpost_id_t v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  _QWORD *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  int v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  _QWORD v60[3];
  _QWORD v61[3];
  _QWORD v62[4];
  _QWORD v63[4];
  _QWORD v64[2];
  _QWORD v65[2];
  _BYTE v66[128];

  v42 = a2;
  v5 = a3;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v45 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
  if (v45)
  {
    v44 = *(_QWORD *)v51;
    v43 = v5;
    v49 = a1;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v51 != v44)
          objc_enumerationMutation(v5);
        v7 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v6);
        v64[0] = CFSTR("buffer name");
        v64[1] = CFSTR("capture serial");
        v65[0] = v7;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(a1[6] + 16)));
        v65[1] = v8;
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v65, v64, 2));

        v46 = v7;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v7));
        v48 = v6;
        if ((unint64_t)objc_msgSend(v9, "length") < 0x40000001)
        {
          v27 = v47;
        }
        else
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));

          if (objc_msgSend(v9, "length"))
          {
            v12 = 0;
            v13 = 0;
            v14 = v9;
            do
            {
              v15 = objc_retainAutorelease(v9);
              v16 = (char *)objc_msgSend(v15, "bytes");
              if (((unint64_t)objc_msgSend(v15, "length") + v12) >> 30)
                v17 = 0x40000000;
              else
                v17 = (uint64_t)objc_msgSend(v15, "length") + v12;
              v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", &v16[v13], v17, 0));
              v63[0] = v11;
              v62[0] = CFSTR("chunkUUID");
              v62[1] = CFSTR("fullSize");
              v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "length")));
              v63[1] = v19;
              v62[2] = CFSTR("index");
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v13 >> 30));
              v63[2] = v20;
              v62[3] = CFSTR("currentOffset");
              v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v13));
              v63[3] = v21;
              v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v63, v62, 4));

              v23 = (void *)v49[4];
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:attributes:payload:](GTTransportMessage_replayer, "messageWithKind:attributes:payload:", 271, v22, v18));
              objc_msgSend(v23, "send:inReplyTo:error:", v24, v49[5], 0);

              v13 += 0x40000000;
              v12 -= 0x40000000;
              v9 = v14;
            }
            while (v13 < (unint64_t)objc_msgSend(v15, "length"));
          }

          v61[0] = v46;
          v60[0] = CFSTR("buffer name");
          v60[1] = CFSTR("capture serial");
          a1 = v49;
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(v49[6] + 16)));
          v60[2] = CFSTR("chunkUUID");
          v61[1] = v25;
          v61[2] = v11;
          v26 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v61, v60, 3));

          v9 = 0;
          v27 = (void *)v26;
          v5 = v43;
        }
        v28 = g_signpostLog;
        v29 = v28;
        v30 = a1[7];
        if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v28))
        {
          v31 = v27;
          v32 = *((_DWORD *)a1 + 16);
          v33 = objc_msgSend(objc_retainAutorelease(v46), "UTF8String");
          v34 = objc_msgSend(v9, "length");
          *(_DWORD *)buf = 67109634;
          v55 = v32;
          v27 = v31;
          v56 = 2082;
          v57 = v33;
          v58 = 2048;
          v59 = v34;
          _os_signpost_emit_with_name_impl(&dword_0, v29, OS_SIGNPOST_INTERVAL_BEGIN, v30, "Replayer-5-network", "%u. send %{public}s %{xcode:size-in-bytes}lu", buf, 0x1Cu);
        }

        v35 = (void *)a1[4];
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:attributes:payload:](GTTransportMessage_replayer, "messageWithKind:attributes:payload:", 258, v27, v9));
        objc_msgSend(v35, "send:inReplyTo:error:", v36, a1[5], 0);

        v37 = g_signpostLog;
        v38 = v37;
        v39 = a1[7];
        if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v37))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_0, v38, OS_SIGNPOST_INTERVAL_END, v39, "Replayer-5-network", (const char *)&unk_4AAB5F, buf, 2u);
        }

        v6 = v48 + 1;
      }
      while ((id)(v48 + 1) != v45);
      v45 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
    }
    while (v45);
  }
  v40 = (void *)a1[4];
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:attributes:payload:](GTTransportMessage_replayer, "messageWithKind:attributes:payload:", objc_msgSend((id)a1[5], "kind"), 0, v42));
  objc_msgSend(v40, "send:inReplyTo:error:", v41, a1[5], 0);

}

void __ProcessMessage_block_invoke_74(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:attributes:payload:](GTTransportMessage_replayer, "messageWithKind:attributes:payload:", objc_msgSend(v4, "kind"), 0, v5));

  objc_msgSend(v3, "send:inReplyTo:error:", v6, *(_QWORD *)(a1 + 40), 0);
}

id __ProcessMessage_block_invoke_76(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  int v5;
  unsigned int *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  void *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  id v31;
  _QWORD v32[2];
  uint8_t buf[8];
  void *v34;

  objc_msgSend((id)g_activityLog, "enterMessage:", *(_QWORD *)(a1 + 32));
  v2 = g_signpostLog;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v2))
  {
    v5 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v5;
    _os_signpost_emit_with_name_impl(&dword_0, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Replayer-1-serial", "%u. kGTMessageReplayerResourcesUsedForFunctionIndex", buf, 8u);
  }

  v6 = *(unsigned int **)(*(_QWORD *)(a1 + 56) + 8);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "plistPayload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("functionIndex")));
  v9 = objc_msgSend(v8, "unsignedLongLongValue");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("subCommandIndex")));
  v11 = objc_msgSend(v10, "unsignedLongLongValue");

  v31 = 0;
  v12 = GTMTLReplayClient_generateFunctionResourceUsageInfoV2(v6, (unint64_t)v9, (unint64_t)v11, &v31);
  v13 = v31;
  v14 = v13;
  v15 = &__NSArray0__struct;
  if (v13)
    v15 = v13;
  v32[1] = CFSTR("error");
  *(_QWORD *)buf = v15;
  v32[0] = CFSTR("resources");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v12 ^ 1u));
  v34 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, v32, 2));

  v18 = g_signpostLog;
  v19 = v18;
  v20 = *(_QWORD *)(a1 + 48);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v19, OS_SIGNPOST_INTERVAL_END, v20, "Replayer-1-serial", (const char *)&unk_4AAB5F, buf, 2u);
  }

  v21 = g_signpostLog;
  v22 = v21;
  v23 = *(_QWORD *)(a1 + 48);
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v21))
  {
    v24 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v24;
    _os_signpost_emit_with_name_impl(&dword_0, v22, OS_SIGNPOST_INTERVAL_BEGIN, v23, "Replayer-5-network", "%u. kGTMessageReplayerResourcesUsedForFunctionIndex", buf, 8u);
  }

  v25 = *(void **)(a1 + 40);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:objectPayload:](GTTransportMessage_replayer, "messageWithKind:objectPayload:", objc_msgSend(*(id *)(a1 + 32), "kind"), v17));
  objc_msgSend(v25, "send:inReplyTo:error:", v26, *(_QWORD *)(a1 + 32), 0);

  v27 = g_signpostLog;
  v28 = v27;
  v29 = *(_QWORD *)(a1 + 48);
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v28, OS_SIGNPOST_INTERVAL_END, v29, "Replayer-5-network", (const char *)&unk_4AAB5F, buf, 2u);
  }

  return objc_msgSend((id)g_activityLog, "leaveActivity");
}

id __ProcessMessage_block_invoke_77(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  int v5;
  void *v6;
  id Thumbnails;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  _DWORD v15[2];

  objc_msgSend((id)g_activityLog, "enterMessage:", *(_QWORD *)(a1 + 32));
  v2 = g_signpostLog;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v2))
  {
    v5 = *(_DWORD *)(a1 + 64);
    v15[0] = 67109120;
    v15[1] = v5;
    _os_signpost_emit_with_name_impl(&dword_0, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Replayer-1-serial", "%u. kDYMessageReplayerGenerateThumbnails", (uint8_t *)v15, 8u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectPayload"));
  Thumbnails = GTMTLReplayClient_generateThumbnails(**(_QWORD ***)(*(_QWORD *)(a1 + 56) + 8), v6, *(void **)(*(_QWORD *)(a1 + 56) + 88));
  v8 = (void *)objc_claimAutoreleasedReturnValue(Thumbnails);
  v9 = *(void **)(a1 + 40);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:objectPayload:](GTTransportMessage_replayer, "messageWithKind:objectPayload:", objc_msgSend(*(id *)(a1 + 32), "kind"), v8));
  objc_msgSend(v9, "send:inReplyTo:error:", v10, *(_QWORD *)(a1 + 32), 0);

  v11 = g_signpostLog;
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 48);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v11))
  {
    LOWORD(v15[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v12, OS_SIGNPOST_INTERVAL_END, v13, "Replayer-1-serial", (const char *)&unk_4AAB5F, (uint8_t *)v15, 2u);
  }

  return objc_msgSend((id)g_activityLog, "leaveActivity");
}

id __ProcessMessage_block_invoke_78(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  int v5;
  void *v6;
  id DependencyGraphThumbnails;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  _DWORD v15[2];

  objc_msgSend((id)g_activityLog, "enterMessage:", *(_QWORD *)(a1 + 32));
  v2 = g_signpostLog;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v2))
  {
    v5 = *(_DWORD *)(a1 + 64);
    v15[0] = 67109120;
    v15[1] = v5;
    _os_signpost_emit_with_name_impl(&dword_0, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Replayer-1-serial", "%u. kDYMessageReplayerGenerateDependencyGraphThumbnails", (uint8_t *)v15, 8u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectPayload"));
  DependencyGraphThumbnails = GTMTLReplayClient_generateDependencyGraphThumbnails(**(_QWORD **)(*(_QWORD *)(a1 + 56) + 8), v6, *(void **)(*(_QWORD *)(a1 + 56) + 88));
  v8 = (void *)objc_claimAutoreleasedReturnValue(DependencyGraphThumbnails);
  v9 = *(void **)(a1 + 40);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:objectPayload:](GTTransportMessage_replayer, "messageWithKind:objectPayload:", objc_msgSend(*(id *)(a1 + 32), "kind"), v8));
  objc_msgSend(v9, "send:inReplyTo:error:", v10, *(_QWORD *)(a1 + 32), 0);

  v11 = g_signpostLog;
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 48);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v11))
  {
    LOWORD(v15[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v12, OS_SIGNPOST_INTERVAL_END, v13, "Replayer-1-serial", (const char *)&unk_4AAB5F, (uint8_t *)v15, 2u);
  }

  return objc_msgSend((id)g_activityLog, "leaveActivity");
}

id __ProcessMessage_block_invoke_79(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  id MetalPluginName;
  void *v10;
  const char *v11;
  id v12;
  _UNKNOWN **v13;
  void *v14;
  _UNKNOWN **v15;
  id v16;
  _UNKNOWN **v17;
  void *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  void *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  _QWORD v31[3];
  _QWORD v32[3];
  uint8_t buf[4];
  int v34;

  objc_msgSend((id)g_activityLog, "enterMessage:", *(_QWORD *)(a1 + 32));
  v2 = g_signpostLog;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v2))
  {
    v5 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 67109120;
    v34 = v5;
    _os_signpost_emit_with_name_impl(&dword_0, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Replayer-1-serial", "%u. kGTMessageQueryInducedGPUPerfState", buf, 8u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 8), "defaultDevice"));
  v7 = DEVICEOBJECT(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  MetalPluginName = GetMetalPluginName((io_registry_entry_t)objc_msgSend(v8, "acceleratorPort"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(MetalPluginName);
  if (IsAGXMetalPlugin(v10, v11))
  {
    v12 = ConsistentPerformanceStateInfo(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8));
    v13 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v12);
    if (objc_msgSend(v8, "supportsFamily:", 1009))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v13));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", &off_739B98, CFSTR("gen"));
      v15 = (_UNKNOWN **)objc_msgSend(v14, "copy");
    }
    else
    {
      if (!objc_msgSend(v8, "supportsFamily:", 1004))
      {
        v17 = v13;
        goto LABEL_13;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v13));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", &off_739BB0, CFSTR("gen"));
      v15 = (_UNKNOWN **)objc_msgSend(v14, "copy");
    }
    goto LABEL_12;
  }
  if ((objc_opt_respondsToSelector(v8, "currentPerformanceState") & 1) != 0)
  {
    v16 = objc_msgSend(v8, "currentPerformanceState");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v16 != 0, CFSTR("enabled")));
    v32[0] = v14;
    v32[1] = &__kCFBooleanTrue;
    v31[1] = CFSTR("supported");
    v31[2] = CFSTR("PerformanceStateAssertion");
    v13 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v16));
    v32[2] = v13;
    v15 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 3));
LABEL_12:
    v17 = v15;

    goto LABEL_13;
  }
  v17 = &off_739248;
LABEL_13:
  v18 = g_signpostLog;
  v19 = v18;
  v20 = *(_QWORD *)(a1 + 48);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v19, OS_SIGNPOST_INTERVAL_END, v20, "Replayer-1-serial", (const char *)&unk_4AAB5F, buf, 2u);
  }

  v21 = g_signpostLog;
  v22 = v21;
  v23 = *(_QWORD *)(a1 + 48);
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v21))
  {
    v24 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 67109120;
    v34 = v24;
    _os_signpost_emit_with_name_impl(&dword_0, v22, OS_SIGNPOST_INTERVAL_BEGIN, v23, "Replayer-5-network", "%u. kGTMessageQueryInducedGPUPerfState", buf, 8u);
  }

  v25 = *(void **)(a1 + 40);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:plistPayload:](GTTransportMessage_replayer, "messageWithKind:plistPayload:", objc_msgSend(*(id *)(a1 + 32), "kind"), v17));
  objc_msgSend(v25, "send:inReplyTo:error:", v26, *(_QWORD *)(a1 + 32), 0);

  v27 = g_signpostLog;
  v28 = v27;
  v29 = *(_QWORD *)(a1 + 48);
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v28, OS_SIGNPOST_INTERVAL_END, v29, "Replayer-5-network", (const char *)&unk_4AAB5F, buf, 2u);
  }

  return objc_msgSend((id)g_activityLog, "leaveActivity");
}

void __ProcessMessage_block_invoke_121(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (v3)
  {
    v4 = v3;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
      || (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Streaming APS Counters"))),
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5 != 0,
          v5,
          v4 = v7,
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)))
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        goto LABEL_8;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Streaming APS Profiling")));
      if (v6)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

      v4 = v7;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
LABEL_8:
        objc_msgSend(*(id *)(a1 + 40), "addAPSTimelineData:", v4);
      else
        objc_msgSend(*(id *)(a1 + 40), "addAPSCounterData:", v7);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "addAPSData:", v7);
    }
  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

void __ProcessMessage_block_invoke_135(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  io_registry_entry_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  id MetalPluginName;
  void *v18;
  const char *v19;
  int v20;
  id DerivedDataPayload;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  BOOL v27;
  void *v28;
  BOOL v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id ShaderInfo;
  void *v40;
  NSObject *v41;
  os_signpost_id_t v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  os_signpost_id_t v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  dispatch_semaphore_t v53;
  uint64_t v54;
  uint64_t v55;
  id *v56;
  NSObject *v57;
  _UNKNOWN **v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  BOOL v63;
  dispatch_semaphore_t v64;
  uint64_t v65;
  uint64_t v66;
  id *v67;
  _QWORD *v68;
  NSObject *v69;
  void *v70;
  BOOL v71;
  dispatch_semaphore_t v72;
  uint64_t v73;
  uint64_t v74;
  id *v75;
  void *v76;
  void *v77;
  _QWORD v78[7];
  _QWORD v79[7];
  _QWORD v80[4];
  id v81;
  NSObject *v82;
  uint8_t *v83;
  unsigned int v84;
  uint8_t buf[8];
  uint8_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;

  v2 = a1 + 48;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 8), "defaultDevice"));
  v4 = DEVICEOBJECT(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v5, "acceleratorPort");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 8), "defaultDevice"));
  LODWORD(v5) = objc_msgSend(v7, "supportsFamily:", 1009);

  if (!(_DWORD)v5)
  {
    v84 = 0x7FFFFFFF;
    MetalPluginName = GetMetalPluginName(v6, &v84);
    v18 = (void *)objc_claimAutoreleasedReturnValue(MetalPluginName);
    v20 = IsAGXMetalPlugin(v18, v19);
    DerivedDataPayload = GTMTLReplayHost_generateDerivedDataPayload(**(_QWORD **)(*(_QWORD *)(a1 + 48) + 8), v20);
    v77 = (void *)objc_claimAutoreleasedReturnValue(DerivedDataPayload);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v77));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectPayload"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "attributes"));
    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("UseMTLCounters")));
      v25 = v24 == 0;

      if (!v25)
        objc_msgSend(v22, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("UseMTLCounters"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("UseKicktimestamps"), v76));
      v27 = v26 == 0;

      if (!v27)
        objc_msgSend(v22, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("UseKicktimestamps"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("CoalesceComputeEncoders")));
      v29 = v28 == 0;

      if (!v29)
        objc_msgSend(v22, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("CoalesceComputeEncoders"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("CoalesceBlitEncoders")));
      v31 = v30 == 0;

      if (!v31)
        objc_msgSend(v22, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("CoalesceBlitEncoders"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("GPUState")));
      if (v32)
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v32, CFSTR("GPUState"));

    }
    if (!v20)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectPayload"));
      v38 = objc_msgSend(v37, "mutableCopy");

      if (v38)
      {
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v18, CFSTR("MetalPluginName"));
        ShaderInfo = GTMTLReplayClient_queryShaderInfo(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), (id *)(*(_QWORD *)(a1 + 48) + 256), v38);
      }
      else
      {
        ShaderInfo = GTMTLReplayClient_queryShaderInfo(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), (id *)(*(_QWORD *)(a1 + 48) + 256), 0);
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(ShaderInfo);
      v40 = g_signpostLog;
      v41 = v40;
      v42 = *(_QWORD *)(a1 + 56);
      if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v40))
      {
        v43 = *(_DWORD *)(a1 + 64);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v43;
        _os_signpost_emit_with_name_impl(&dword_0, v41, OS_SIGNPOST_INTERVAL_BEGIN, v42, "Replayer-5-network", "%u. kDYMessageReplayerQueryShaderInfo", buf, 8u);
      }

      v44 = *(void **)(a1 + 32);
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:plistPayload:](GTTransportMessage_replayer, "messageWithKind:plistPayload:", objc_msgSend(*(id *)(a1 + 40), "kind"), v34));
      objc_msgSend(v44, "send:inReplyTo:error:", v45, *(_QWORD *)(a1 + 40), 0);

      v46 = g_signpostLog;
      v47 = v46;
      v48 = *(_QWORD *)(a1 + 56);
      if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v46))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_0, v47, OS_SIGNPOST_INTERVAL_END, v48, "Replayer-5-network", (const char *)&unk_4AAB5F, buf, 2u);
      }

      v22 = v38;
      goto LABEL_50;
    }
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v18, CFSTR("MetalPluginName"));
    if (v84 != 0x7FFFFFFF)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v33, CFSTR("gpuTarget"));

    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("useOverlap"), v76));
    if (v34)
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v34, CFSTR("useOverlap"));
    *(_QWORD *)buf = 0;
    v86 = buf;
    v87 = 0x3032000000;
    v88 = __Block_byref_object_copy__5240;
    v89 = __Block_byref_object_dispose__5241;
    v90 = objc_alloc_init((Class)NSOperationQueue);
    objc_msgSend(*((id *)v86 + 5), "setName:", CFSTR("gputools.GPUToolsDebugger.GPUToolsPlatform.ShaderProfiler.StreamingData.SerialQueue"));
    objc_msgSend(*((id *)v86 + 5), "setMaxConcurrentOperationCount:", 1);
    if (v76)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("GPUTimelineInfo")));
      v36 = v35;
      if (v35)
      {
        if (v84 <= 0x7FFFFFFE)
        {

LABEL_41:
          v50 = objc_autoreleasePoolPush();
          v51 = *(void **)(a1 + 32);
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:plistPayload:](GTTransportMessage_replayer, "messageWithKind:plistPayload:", objc_msgSend(*(id *)(a1 + 40), "kind"), &off_739270));
          objc_msgSend(v51, "send:inReplyTo:error:", v52, *(_QWORD *)(a1 + 40), 0);

          v53 = dispatch_semaphore_create(0);
          v54 = *(_QWORD *)(a1 + 48);
          v55 = *(_QWORD *)(v54 + 8);
          v56 = (id *)(v54 + 256);
          v80[0] = _NSConcreteStackBlock;
          v80[1] = 3221225472;
          v80[2] = __ProcessMessage_block_invoke_146;
          v80[3] = &unk_726010;
          v83 = buf;
          v81 = *(id *)(a1 + 32);
          v57 = v53;
          v82 = v57;
          GTMTLReplayClient_collectGPUShaderTimelineData(v55, v56, v22, v80);
          dispatch_semaphore_wait(v57, 0xFFFFFFFFFFFFFFFFLL);

          objc_autoreleasePoolPop(v50);
LABEL_49:
          _Block_object_dispose(buf, 8);

LABEL_50:
          return;
        }
        v49 = MetalPluginTarget(v18);

        if (v49 >= 0)
          goto LABEL_41;
      }
    }
    v58 = GTMTLReplayClient_embeddedQueryShaderInfo(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), (id *)(*(_QWORD *)(a1 + 48) + 256), v22);
    v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
    v60 = *(void **)(a1 + 32);
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:plistPayload:](GTTransportMessage_replayer, "messageWithKind:plistPayload:", objc_msgSend(*(id *)(a1 + 40), "kind"), v59));
    objc_msgSend(v60, "send:inReplyTo:error:", v61, *(_QWORD *)(a1 + 40), 0);

    if (v59)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("Streaming Shader Profiling Data")));
      v63 = v62 == 0;

      if (!v63)
      {
        v64 = dispatch_semaphore_create(0);
        v65 = *(_QWORD *)(a1 + 48);
        v66 = *(_QWORD *)(v65 + 8);
        v67 = (id *)(v65 + 256);
        v79[0] = _NSConcreteStackBlock;
        v79[1] = 3221225472;
        v79[2] = __ProcessMessage_block_invoke_3;
        v79[3] = &unk_726010;
        v79[6] = buf;
        v68 = v79;
        v79[4] = *(id *)(a1 + 32);
        v69 = v64;
        v79[5] = v69;
        GTMTLReplayClient_streamShaderProfilingData(v66, v67, v22, v79);
LABEL_47:
        dispatch_semaphore_wait(v69, 0xFFFFFFFFFFFFFFFFLL);

        goto LABEL_48;
      }
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("Streaming Timeline Data")));
      v71 = v70 == 0;

      if (!v71)
      {
        v72 = dispatch_semaphore_create(0);
        v73 = *(_QWORD *)(a1 + 48);
        v74 = *(_QWORD *)(v73 + 8);
        v75 = (id *)(v73 + 256);
        v78[0] = _NSConcreteStackBlock;
        v78[1] = 3221225472;
        v78[2] = __ProcessMessage_block_invoke_5;
        v78[3] = &unk_726010;
        v78[6] = buf;
        v68 = v78;
        v78[4] = *(id *)(a1 + 32);
        v69 = v72;
        v78[5] = v69;
        GTMTLReplayClient_collectGPUShaderTimelineData(v74, v75, v22, v78);
        goto LABEL_47;
      }
    }
LABEL_48:

    goto LABEL_49;
  }
  v8 = g_signpostLog;
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 56);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v8))
  {
    v11 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v11;
    _os_signpost_emit_with_name_impl(&dword_0, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "Replayer-5-network", "%u. kDYMessageReplayerQueryShaderInfo", buf, 8u);
  }

  v12 = *(void **)(a1 + 32);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:plistPayload:](GTTransportMessage_replayer, "messageWithKind:plistPayload:", objc_msgSend(*(id *)(a1 + 40), "kind"), &__NSDictionary0__struct));
  objc_msgSend(v12, "send:inReplyTo:error:", v13, *(_QWORD *)(a1 + 40), 0);

  v14 = g_signpostLog;
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 56);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v15, OS_SIGNPOST_INTERVAL_END, v16, "Replayer-5-network", (const char *)&unk_4AAB5F, buf, 2u);
  }

}

void __ProcessMessage_block_invoke_171(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  GTMTLReplayClient_addBatchFilteringRequest(*(void **)(a1 + 32));
  v2 = *(void **)(a1 + 40);
  v3 = objc_msgSend(*(id *)(a1 + 48), "kind");
  v7 = CFSTR("Batch Filtering Request Received");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:plistPayload:](GTTransportMessage_replayer, "messageWithKind:plistPayload:", v3, v5));
  objc_msgSend(v2, "send:inReplyTo:error:", v6, *(_QWORD *)(a1 + 48), 0);

}

void __ProcessMessage_block_invoke_2_174(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  int v5;
  void *v6;
  id Analysis;
  void *v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  int v21;
  int v22;

  v2 = g_signpostLog;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v2))
  {
    v5 = *(_DWORD *)(a1 + 64);
    v21 = 67109120;
    v22 = v5;
    _os_signpost_emit_with_name_impl(&dword_0, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Replayer-4-parallel", "%u. loadAnalysis", (uint8_t *)&v21, 8u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 8), "defaultDevice"));
  Analysis = DYMTLReplayFrameProfiler_loadAnalysis(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(Analysis);

  v9 = g_signpostLog;
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v9))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v10, OS_SIGNPOST_INTERVAL_END, v11, "Replayer-4-parallel", (const char *)&unk_4AAB5F, (uint8_t *)&v21, 2u);
  }

  v12 = g_signpostLog;
  v13 = v12;
  v14 = *(_QWORD *)(a1 + 48);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v12))
  {
    v15 = *(_DWORD *)(a1 + 64);
    v21 = 67109120;
    v22 = v15;
    _os_signpost_emit_with_name_impl(&dword_0, v13, OS_SIGNPOST_INTERVAL_BEGIN, v14, "Replayer-5-network", "%u. kDYMessageReplayerDerivedCounterData", (uint8_t *)&v21, 8u);
  }

  v16 = *(void **)(a1 + 32);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:plistPayload:](GTTransportMessage_replayer, "messageWithKind:plistPayload:", objc_msgSend(*(id *)(a1 + 40), "kind"), v8));
  objc_msgSend(v16, "send:inReplyTo:error:", v17, *(_QWORD *)(a1 + 40), 0);

  v18 = g_signpostLog;
  v19 = v18;
  v20 = *(_QWORD *)(a1 + 48);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v18))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v19, OS_SIGNPOST_INTERVAL_END, v20, "Replayer-5-network", (const char *)&unk_4AAB5F, (uint8_t *)&v21, 2u);
  }

}

void __ProcessMessage_block_invoke_175(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  io_registry_entry_t v5;
  id MetalPluginName;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_semaphore_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  void *v16;
  NSObject *v17;
  _BOOL8 v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  _QWORD *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void **v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  void *v44;
  dispatch_semaphore_t v45;
  id v46;
  uint8_t buf[4];
  int v48;
  const __CFString *v49;
  void *v50;
  const __CFString *v51;
  void *v52;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 8), "defaultDevice"));
  v3 = DEVICEOBJECT(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "acceleratorPort");

  MetalPluginName = GetMetalPluginName(v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(MetalPluginName);
  if (objc_msgSend(v7, "containsString:", CFSTR("AGXMetal")))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attributes"));
    v9 = v8;
    if (!v8)
      GTMTLReplayClient_embeddedDerivedCounterData(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), *(_QWORD *)(a1 + 56) + 256, *(void **)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("collectInBackground")));

    if (v10)
    {
      v11 = dispatch_semaphore_create(0);
      v12 = *(void **)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(_QWORD *)(v13 + 8);
      v15 = (id *)(v13 + 256);
      v16 = *(void **)(a1 + 40);
      v41 = _NSConcreteStackBlock;
      v42 = 3221225472;
      v43 = __ProcessMessage_block_invoke_2_178;
      v44 = &unk_725ED8;
      v45 = v11;
      v46 = v12;
      v17 = v11;
      v18 = GTMTLReplayClient_streamBatchFilteredData(v14, v15, v16, &v41);
      v19 = *(void **)(a1 + 48);
      v20 = objc_msgSend(*(id *)(a1 + 32), "kind", v41, v42, v43, v44);
      v51 = CFSTR("Batch Filtering Started");
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v18));
      v52 = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:plistPayload:](GTTransportMessage_replayer, "messageWithKind:plistPayload:", v20, v22));
      objc_msgSend(v19, "send:inReplyTo:error:", v23, *(_QWORD *)(a1 + 32), 0);

      dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      GTMTLReplayClient_addBatchFilteringRequest(*(void **)(a1 + 40));
      v35 = *(void **)(a1 + 32);
      v34 = (_QWORD *)(a1 + 32);
      v36 = (void *)v34[2];
      v37 = objc_msgSend(v35, "kind");
      v49 = CFSTR("Batch Filtering Request Received");
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      v50 = v38;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:plistPayload:](GTTransportMessage_replayer, "messageWithKind:plistPayload:", v37, v39));
      objc_msgSend(v36, "send:inReplyTo:error:", v40, *v34, 0);

    }
  }
  else
  {
    v24 = GTMTLReplayClient_derivedCounterData(*(id **)(*(_QWORD *)(a1 + 56) + 8), (id *)(*(_QWORD *)(a1 + 56) + 256), *(void **)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v25 = g_signpostLog;
    v26 = v25;
    v27 = *(_QWORD *)(a1 + 64);
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v25))
    {
      v28 = *(_DWORD *)(a1 + 72);
      *(_DWORD *)buf = 67109120;
      v48 = v28;
      _os_signpost_emit_with_name_impl(&dword_0, v26, OS_SIGNPOST_INTERVAL_BEGIN, v27, "Replayer-5-network", "%u. kDYMessageReplayerDerivedCounterData", buf, 8u);
    }

    v29 = *(void **)(a1 + 48);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:plistPayload:](GTTransportMessage_replayer, "messageWithKind:plistPayload:", objc_msgSend(*(id *)(a1 + 32), "kind"), v9));
    objc_msgSend(v29, "send:inReplyTo:error:", v30, *(_QWORD *)(a1 + 32), 0);

    v31 = g_signpostLog;
    v32 = v31;
    v33 = *(_QWORD *)(a1 + 64);
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v32, OS_SIGNPOST_INTERVAL_END, v33, "Replayer-5-network", (const char *)&unk_4AAB5F, buf, 2u);
    }

  }
}

id __ProcessMessage_block_invoke_181(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id Error;
  void *v20;
  void *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  void *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  os_signpost_id_t v32;
  id v34;
  const __CFString *v35;
  uint8_t buf[8];

  objc_msgSend((id)g_activityLog, "enterMessage:", *(_QWORD *)(a1 + 32));
  v2 = g_signpostLog;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v2))
  {
    v5 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v5;
    _os_signpost_emit_with_name_impl(&dword_0, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Replayer-1-serial", "%u. kDYGenerateShaderDebuggerTrace", buf, 8u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attributes"));
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectPayload"));
  v9 = v8;

  v10 = *(uint64_t **)(*(_QWORD *)(a1 + 56) + 8);
  v34 = 0;
  v11 = GTMTLShaderDebugger_generateTrace(v10, v9, &v34);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = v34;
  v14 = v13;
  if (v12)
  {
    v15 = v12;
  }
  else
  {
    v16 = v13;
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      Error = GTShaderDebuggerMakeError(1u, CFSTR("Internal error"), 0, 0, 0);
      v18 = (id)objc_claimAutoreleasedReturnValue(Error);
    }
    v20 = v18;
    v35 = CFSTR("Error");
    *(_QWORD *)buf = v18;
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v35, 1));

  }
  v21 = g_signpostLog;
  v22 = v21;
  v23 = *(_QWORD *)(a1 + 48);
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v22, OS_SIGNPOST_INTERVAL_END, v23, "Replayer-1-serial", (const char *)&unk_4AAB5F, buf, 2u);
  }

  v24 = g_signpostLog;
  v25 = v24;
  v26 = *(_QWORD *)(a1 + 48);
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v24))
  {
    v27 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v27;
    _os_signpost_emit_with_name_impl(&dword_0, v25, OS_SIGNPOST_INTERVAL_BEGIN, v26, "Replayer-5-network", "%u. kDYGenerateShaderDebuggerTrace", buf, 8u);
  }

  v28 = *(void **)(a1 + 40);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:objectPayload:](GTTransportMessage_replayer, "messageWithKind:objectPayload:", objc_msgSend(*(id *)(a1 + 32), "kind"), v15));
  objc_msgSend(v28, "send:inReplyTo:error:", v29, *(_QWORD *)(a1 + 32), 0);

  v30 = g_signpostLog;
  v31 = v30;
  v32 = *(_QWORD *)(a1 + 48);
  if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v31, OS_SIGNPOST_INTERVAL_END, v32, "Replayer-5-network", (const char *)&unk_4AAB5F, buf, 2u);
  }

  return objc_msgSend((id)g_activityLog, "leaveActivity");
}

id __ProcessMessage_block_invoke_182(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  id v5;
  char *DataSource;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  GTMTLReplayObjectMap *v16;

  objc_msgSend((id)g_activityLog, "enterMessage:", *(_QWORD *)(a1 + 32));
  v2 = ArchiveDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 40)));

  v5 = objc_retainAutorelease(v4);
  DataSource = GTMTLReplayController_makeDataSource((const char *)objc_msgSend(v5, "UTF8String"), **(apr_pool_t ***)(a1 + 56));
  v7 = v5;
  v8 = objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:isDirectory:", v7, 1);

  v9 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:relativeToURL:", CFSTR("metadata"), v8);
  v10 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", v9, 0);

  v11 = *(void **)(*(_QWORD *)(a1 + 56) + 280);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DYCaptureEngine.launch_dictionary")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("title")));
  objc_msgSend(v11, "setWindowTitle:", v13);

  v14 = PreferDevice((uint64_t)DataSource);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = -[GTMTLReplayObjectMap initWithDevice:]([GTMTLReplayObjectMap alloc], "initWithDevice:", v15);
  GTMTLReplaySupport_init(v15);
  GTMTLReplayController_initializeArgumentBufferSupport((uint64_t)DataSource, v15, v16);
  GTMTLReplayController_populateUnusedResources(DataSource, v16);
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = GTMTLReplayController_makeController((uint64_t)DataSource, **(apr_pool_t ***)(a1 + 56), v15, v16, 0, 0);
  GTMTLReplayWireframeRenderer_initWithDevice(*(_QWORD *)(a1 + 56) + 96, v15);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

  return objc_msgSend((id)g_activityLog, "leaveActivity");
}

id __ProcessMessage_block_invoke_192(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  int v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  NSNumber *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  _DWORD v21[2];

  objc_msgSend((id)g_activityLog, "enterMessage:", *(_QWORD *)(a1 + 32));
  v2 = g_signpostLog;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v2))
  {
    v5 = *(_DWORD *)(a1 + 64);
    v21[0] = 67109120;
    v21[1] = v5;
    _os_signpost_emit_with_name_impl(&dword_0, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Replayer-1-serial", "%u. kDYMessageUpdateResourceObject", (uint8_t *)v21, 8u);
  }

  v6 = *(_QWORD *)(a1 + 56);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attributes"));
  v9 = (void *)objc_opt_new(NSMutableDictionary, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type")));
  v11 = objc_msgSend(v10, "unsignedIntValue");

  if (v11 == 13)
  {
    v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", UpdateLibraryResource(*(id **)(v6 + 8), v7, v9, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("succeeded"));

  }
  v14 = *(void **)(a1 + 40);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:attributes:objectPayload:](GTTransportMessage_replayer, "messageWithKind:attributes:objectPayload:", objc_msgSend(*(id *)(a1 + 32), "kind"), 0, v9));
  objc_msgSend(v14, "send:inReplyTo:error:", v15, *(_QWORD *)(a1 + 32), 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("succeeded")));
  LODWORD(v15) = objc_msgSend(v16, "BOOLValue");

  if ((_DWORD)v15)
    DisplayAttachmentIfNeeded(*(_QWORD *)(a1 + 56), *(_DWORD *)(a1 + 68), *(_DWORD *)(a1 + 72));
  v17 = g_signpostLog;
  v18 = v17;
  v19 = *(_QWORD *)(a1 + 48);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v17))
  {
    LOWORD(v21[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v18, OS_SIGNPOST_INTERVAL_END, v19, "Replayer-1-serial", (const char *)&unk_4AAB5F, (uint8_t *)v21, 2u);
  }

  return objc_msgSend((id)g_activityLog, "leaveActivity");
}

void __ProcessMessage_block_invoke_193(uint64_t a1)
{
  uint64_t v2;
  uint64_t *AliasStream;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  int v23;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  GTMTLReplayController_debugSubCommandStop(v2, *(_DWORD *)(a1 + 56), 0);
  AliasStream = (uint64_t *)GetAliasStream(*(_QWORD *)(*(_QWORD *)v2 + 24), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56) + *(_QWORD *)(*(_QWORD *)v2 + 80) - 1);
  if (AliasStream)
    v4 = *AliasStream;
  else
    v4 = 0;
  v5 = g_signpostLog;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 72);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v5))
  {
    v8 = *(_DWORD *)(a1 + 80);
    *(_DWORD *)buf = 67109120;
    v23 = v8;
    _os_signpost_emit_with_name_impl(&dword_0, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Replayer-1-serial", "%u. kGTMessageReplayerBeginAccelerationStructureSession", buf, 8u);
  }

  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __ProcessMessage_block_invoke_195;
  v17[3] = &unk_726088;
  v20 = v2;
  v11 = *(_QWORD *)(a1 + 32);
  v18 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 48);
  v19 = v12;
  v21 = v13;
  +[GTAccelerationStructureServerSession sessionWithReplayClient:functionIndex:requestID:transport:dataHandler:accelerationStructureKey:completionHandler:](GTAccelerationStructureServerSession, "sessionWithReplayClient:functionIndex:requestID:transport:dataHandler:accelerationStructureKey:completionHandler:", v9, v10, 0, v11, 0, v4, v17);
  v14 = g_signpostLog;
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 72);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v15, OS_SIGNPOST_INTERVAL_END, v16, "Replayer-1-serial", (const char *)&unk_4AAB5F, buf, 2u);
  }

}

void __ProcessMessage_block_invoke_195(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;

  v5 = a2;
  v6 = a3;
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 48) + 48), 0xFFFFFFFFFFFFFFFFLL);
  v7 = 0;
  do
  {
    ++v7;
    v8 = *(void **)(*(_QWORD *)(a1 + 48) + 56);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v9));

  }
  while (v10);
  v11 = *(void **)(*(_QWORD *)(a1 + 48) + 56);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
  objc_msgSend(v11, "setObject:forKey:", v5, v12);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 48) + 48));
  objc_msgSend(v5, "setSessionID:", v7);
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = __ProcessMessage_block_invoke_2_196;
  v19 = &unk_726940;
  v13 = *(id *)(a1 + 32);
  v23 = v7;
  v20 = v13;
  v21 = v6;
  v22 = *(id *)(a1 + 40);
  v14 = v6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v16));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 264), "addOperation:", v15, v16, v17, v18, v19);

}

void __ProcessMessage_block_invoke_2_196(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[2];

  v2 = objc_msgSend(*(id *)(a1 + 32), "kind");
  v6[0] = CFSTR("sessionId");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56)));
  v6[1] = CFSTR("error");
  v7[0] = v3;
  v7[1] = *(_QWORD *)(a1 + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:objectPayload:](GTTransportMessage_replayer, "messageWithKind:objectPayload:", v2, v4));

  objc_msgSend(*(id *)(a1 + 48), "send:inReplyTo:error:", v5, *(_QWORD *)(a1 + 32), 0);
}

void __ProcessMessage_block_invoke_2_178(uint64_t a1, uint64_t a2)
{
  id v3;

  if (a2)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:plistPayload:](GTTransportMessage_replayer, "messageWithKind:plistPayload:", 4124, a2));
    objc_msgSend(*(id *)(a1 + 40), "send:inReplyTo:error:", v3, 0, 0);

  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void __ProcessMessage_block_invoke_146(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v3 = a2;
  if (v3)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__5240;
    v21 = __Block_byref_object_dispose__5241;
    v22 = 0;
    v4 = objc_autoreleasePoolPush();
    v5 = objc_msgSend(v3, "copy");
    v6 = (void *)v18[5];
    v18[5] = (uint64_t)v5;

    objc_autoreleasePoolPop(v4);
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = __ProcessMessage_block_invoke_2_152;
    v14 = &unk_725FE8;
    v16 = &v17;
    v15 = *(id *)(a1 + 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v11));
    objc_msgSend(v7, "addOperation:", v8, v11, v12, v13, v14);

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "waitUntilAllOperationsAreFinished");
    v9 = *(void **)(a1 + 32);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:plistPayload:](GTTransportMessage_replayer, "messageWithKind:plistPayload:", 4124, &off_739298));
    objc_msgSend(v9, "send:inReplyTo:error:", v10, 0, 0);

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }

}

void __ProcessMessage_block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v3 = a2;
  if (v3)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__5240;
    v21 = __Block_byref_object_dispose__5241;
    v22 = 0;
    v4 = objc_autoreleasePoolPush();
    v5 = objc_msgSend(v3, "copy");
    v6 = (void *)v18[5];
    v18[5] = (uint64_t)v5;

    objc_autoreleasePoolPop(v4);
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = __ProcessMessage_block_invoke_4;
    v14 = &unk_725FE8;
    v16 = &v17;
    v15 = *(id *)(a1 + 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v11));
    objc_msgSend(v7, "addOperation:", v8, v11, v12, v13, v14);

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "waitUntilAllOperationsAreFinished");
    v9 = *(void **)(a1 + 32);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:plistPayload:](GTTransportMessage_replayer, "messageWithKind:plistPayload:", 4124, &off_7392C0));
    objc_msgSend(v9, "send:inReplyTo:error:", v10, 0, 0);

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    NSLog(CFSTR("Streamed All Shader Profiler Data"));
  }

}

void __ProcessMessage_block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v3 = a2;
  if (v3)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__5240;
    v21 = __Block_byref_object_dispose__5241;
    v22 = 0;
    v4 = objc_autoreleasePoolPush();
    v5 = objc_msgSend(v3, "copy");
    v6 = (void *)v18[5];
    v18[5] = (uint64_t)v5;

    objc_autoreleasePoolPop(v4);
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = __ProcessMessage_block_invoke_6;
    v14 = &unk_725FE8;
    v16 = &v17;
    v15 = *(id *)(a1 + 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v11));
    objc_msgSend(v7, "addOperation:", v8, v11, v12, v13, v14);

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "waitUntilAllOperationsAreFinished");
    v9 = *(void **)(a1 + 32);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:plistPayload:](GTTransportMessage_replayer, "messageWithKind:plistPayload:", 4124, &off_7392E8));
    objc_msgSend(v9, "send:inReplyTo:error:", v10, 0, 0);

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }

}

void __ProcessMessage_block_invoke_6(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:plistPayload:](GTTransportMessage_replayer, "messageWithKind:plistPayload:", 4124, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)));
  objc_msgSend(*(id *)(a1 + 32), "send:inReplyTo:error:", v2, 0, 0);

}

void __ProcessMessage_block_invoke_4(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:plistPayload:](GTTransportMessage_replayer, "messageWithKind:plistPayload:", 4124, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)));
  objc_msgSend(*(id *)(a1 + 32), "send:inReplyTo:error:", v2, 0, 0);

}

void __ProcessMessage_block_invoke_2_152(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:plistPayload:](GTTransportMessage_replayer, "messageWithKind:plistPayload:", 4124, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)));
  objc_msgSend(*(id *)(a1 + 32), "send:inReplyTo:error:", v2, 0, 0);

}

void __ProcessMessage_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:attributes:objectPayload:](GTTransportMessage_replayer, "messageWithKind:attributes:objectPayload:", 4105, a2, &__kCFBooleanTrue));
  objc_msgSend(v3, "send:inReplyTo:error:", v4, *(_QWORD *)(a1 + 40), 0);

}

@end
