@implementation AFUIDebugLogManager

- (AFUIDebugLogManager)init
{
  AFUIDebugLogManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AFUIDebugLogManager;
  v2 = -[AFUIDebugLogManager init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("Siri log manager queue", MEMORY[0x24BDAC9C0]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)captureViewHierarchyLogWithDefaultViewHierarchy:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  _QWORD block[5];
  void (**v13)(_QWORD, _QWORD);
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __82__AFUIDebugLogManager_captureViewHierarchyLogWithDefaultViewHierarchy_completion___block_invoke;
    v14[3] = &unk_24D7A3710;
    v15 = v7;
    v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x219A0D984](v14);
    v11 = v10;
    if (v6)
    {
      ((void (**)(_QWORD, id))v10)[2](v10, v6);
    }
    else
    {
      block[0] = v9;
      block[1] = 3221225472;
      block[2] = __82__AFUIDebugLogManager_captureViewHierarchyLogWithDefaultViewHierarchy_completion___block_invoke_2;
      block[3] = &unk_24D7A1CC8;
      block[4] = self;
      v13 = v10;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }

}

void __82__AFUIDebugLogManager_captureViewHierarchyLogWithDefaultViewHierarchy_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "dataUsingEncoding:", 4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  +[AFUIDebugLog logWithData:mimeType:name:attemptCompression:](AFUIDebugLog, "logWithData:mimeType:name:attemptCompression:", v5, CFSTR("text/*"), CFSTR("siri_view_hierarchy_description.txt"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, 0);

}

void __82__AFUIDebugLogManager_captureViewHierarchyLogWithDefaultViewHierarchy_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x24BEBDB58], "keyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recursiveDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__AFUIDebugLogManager_captureViewHierarchyLogWithDefaultViewHierarchy_completion___block_invoke_3;
  v7[3] = &unk_24D7A25A8;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __82__AFUIDebugLogManager_captureViewHierarchyLogWithDefaultViewHierarchy_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)captureCardLogsSinceTime:(double)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[AFUIDebugLogManager _siriCardLogDirectoryURL](self, "_siriCardLogDirectoryURL");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("^%@-"), CFSTR("siri-card"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIDebugLogManager _captureLogsAtURL:logName:sinceTime:pattern:mimeType:completion:](self, "_captureLogsAtURL:logName:sinceTime:pattern:mimeType:completion:", v8, CFSTR("siri-card"), v7, 0, v6, a3);

}

- (void)captureSiriSpeechLogsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[AFUIDebugLogManager _queue](self, "_queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __59__AFUIDebugLogManager_captureSiriSpeechLogsWithCompletion___block_invoke;
    v6[3] = &unk_24D7A1CC8;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __59__AFUIDebugLogManager_captureSiriSpeechLogsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "_siriLogDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("SpeechLogs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  v19 = 0;
  objc_msgSend(v4, "_captureLogsInDirectoryAtURL:matchingPattern:withMimeType:attemptCompression:limit:error:", v3, CFSTR(".*\\.spx$"), CFSTR("audio/speex"), 0, 5, &v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v19;
  v7 = *(void **)(a1 + 32);
  v18 = 0;
  objc_msgSend(v7, "_captureLogsInDirectoryAtURL:matchingPattern:withMimeType:attemptCompression:limit:error:", v3, CFSTR(".*\\.opx$"), CFSTR("audio/opus"), 0, 5, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;
  v10 = *(void **)(a1 + 32);
  v17 = 0;
  objc_msgSend(v10, "_captureLogsInDirectoryAtURL:matchingPattern:withMimeType:attemptCompression:limit:error:", v3, CFSTR(".*\\.wav$"), CFSTR("audio/wav"), 0, 5, &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v17;
  if (v5 || v8 || v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v5)
      objc_msgSend(v15, "addObjectsFromArray:", v5);
    if (v8)
      objc_msgSend(v16, "addObjectsFromArray:", v8);
    if (v11)
      objc_msgSend(v16, "addObjectsFromArray:", v11);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    if (v9)
      v13 = v9;
    else
      v13 = v12;
    if (v6)
      v14 = v6;
    else
      v14 = v13;
    (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v14);
  }

}

- (void)captureSiriVoiceTriggerLogsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[AFUIDebugLogManager _queue](self, "_queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __65__AFUIDebugLogManager_captureSiriVoiceTriggerLogsWithCompletion___block_invoke;
    v6[3] = &unk_24D7A1CC8;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __65__AFUIDebugLogManager_captureSiriVoiceTriggerLogsWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  BOOL v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
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
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id obj;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  id v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDD1580]);
  objc_msgSend(*(id *)(a1 + 32), "_uniqueTemporaryFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("VoiceTrigger"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = 0;
  LODWORD(v3) = objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v66);
  v5 = v66;
  if ((_DWORD)v3)
    v6 = v5 == 0;
  else
    v6 = 0;
  if (v6)
  {
    objc_msgSend(v4, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_baseLogDirectoryURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("VoiceTrigger"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("audio"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 32);
    v50 = v12;
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x24BDBCBF0];
    v65 = 0;
    v48 = v15;
    objc_msgSend(v13, "_contentsOfDirectoryAtURL:matchingPattern:sortedByDateWithResourceKey:error:", v14, CFSTR(".*\\.log$"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;

    v51 = v4;
    v53 = a1;
    if (v16 && (unint64_t)objc_msgSend(v16, "count") >= 6)
    {
      objc_msgSend(v16, "subarrayWithRange:", 0, 5);
      v17 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v17;
    }
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = v16;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v62 != v20)
            objc_enumerationMutation(obj);
          v22 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "path");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("/bin/cp %@ %@"), v23, v9);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[AFUIDebugLogManager executeSystemCommand:stdoutTo:](AFUIDebugLogManager, "executeSystemCommand:stdoutTo:", v24, 0);

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
      }
      while (v19);
    }

    v25 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v52);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v47;
    objc_msgSend(v25, "_contentsOfDirectoryAtURL:matchingPattern:sortedByDateWithResourceKey:error:", v26, CFSTR(".*\\.*$"), v48, &v60);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v60;

    if (v27 && (unint64_t)objc_msgSend(v27, "count") >= 0x1F)
    {
      objc_msgSend(v27, "subarrayWithRange:", 0, 30);
      v28 = objc_claimAutoreleasedReturnValue();

      v27 = (void *)v28;
    }
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v29 = v27;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v57 != v32)
            objc_enumerationMutation(v29);
          v34 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * j), "path");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringWithFormat:", CFSTR("/bin/cp %@ %@"), v35, v9);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          +[AFUIDebugLogManager executeSystemCommand:stdoutTo:](AFUIDebugLogManager, "executeSystemCommand:stdoutTo:", v36, 0);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
      }
      while (v31);
    }
    v37 = v29;

    v38 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/SAT"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringWithFormat:", CFSTR("/bin/cp -r %@ %@"), CFSTR("/var/mobile/Library/VoiceTrigger/SAT"), v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[AFUIDebugLogManager executeSystemCommand:stdoutTo:](AFUIDebugLogManager, "executeSystemCommand:stdoutTo:", v40, 0);

    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/codec_dump.txt"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[AFUIDebugLogManager executeSystemCommand:stdoutTo:](AFUIDebugLogManager, "executeSystemCommand:stdoutTo:", CFSTR("/usr/local/bin/codecctl AppleCS42L71Audio dump"), v41);

    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/IOBorealisOwl_dump.txt"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[AFUIDebugLogManager executeSystemCommand:stdoutTo:](AFUIDebugLogManager, "executeSystemCommand:stdoutTo:", CFSTR("/usr/sbin/ioreg -c com_apple_audio_IOBorealisOwl -r -w 0"), v42);

    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/boreaowlctl_dump.txt"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[AFUIDebugLogManager executeSystemCommand:stdoutTo:](AFUIDebugLogManager, "executeSystemCommand:stdoutTo:", CFSTR("/usr/local/bin/boreaowlctl --dump-fw"), v43);

    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/AppleEmbeddedAudioDevice_dump.txt"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[AFUIDebugLogManager executeSystemCommand:stdoutTo:](AFUIDebugLogManager, "executeSystemCommand:stdoutTo:", CFSTR("/usr/sbin/ioreg -c AppleEmbeddedAudioDevice -r -w 0"), v44);

    a1 = v53;
    v45 = *(void **)(v53 + 32);
    v55 = v49;
    v4 = v51;
    objc_msgSend(v45, "_archiveLogDirectoryAtURL:name:error:", v51, CFSTR("voicetrigger.tar.gz"), &v55);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v55;

    objc_msgSend(v51, "URLByDeletingLastPathComponent");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeItemAtURL:error:", v46, 0);

  }
  else
  {
    v7 = v5;
    v8 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)captureSiriTTSAudioWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  if (a3)
  {
    v4 = (void (**)(id, void *, id))a3;
    -[AFUIDebugLogManager _baseLogDirectoryURL](self, "_baseLogDirectoryURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("VoiceServices"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
    -[AFUIDebugLogManager _captureLogsInDirectoryAtURL:matchingPattern:withMimeType:attemptCompression:limit:error:](self, "_captureLogsInDirectoryAtURL:matchingPattern:withMimeType:attemptCompression:limit:error:", v6, CFSTR(".*\\.wav$"), CFSTR("audio/wav"), 0, 10, &v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    v4[2](v4, v7, v8);

  }
}

+ (int)executeSystemCommand:(id)a3 stdoutTo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  os_log_t *v9;
  const char **v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  int v14;
  os_log_t v15;
  int v16;
  pid_t v18[2];
  posix_spawnattr_t v19;
  posix_spawn_file_actions_t v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v19 = 0;
  v20 = 0;
  *(_QWORD *)v18 = 0;
  v9 = (os_log_t *)MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    +[AFUIDebugLogManager executeSystemCommand:stdoutTo:].cold.2();
  v10 = (const char **)malloc_type_calloc(v8 + 1, 8uLL, 0x10040436913F5uLL);
  v11 = v8;
  if (v8)
  {
    v12 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndex:", v12);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10[v12] = (const char *)objc_msgSend(v13, "cStringUsingEncoding:", 1);

      ++v12;
    }
    while (v11 != v12);
  }
  v10[v11] = 0;
  posix_spawnattr_init(&v19);
  posix_spawnattr_setflags(&v19, 0);
  if (v6)
  {
    posix_spawn_file_actions_init(&v20);
    posix_spawn_file_actions_addopen(&v20, 1, (const char *)objc_msgSend(objc_retainAutorelease(v6), "cStringUsingEncoding:", 1), 521, 0x1A0u);
    sync();
    v14 = posix_spawn(v18, *v10, &v20, &v19, (char *const *)v10, 0);
    posix_spawn_file_actions_destroy(&v20);
  }
  else
  {
    v14 = posix_spawn(v18, *v10, 0, &v19, (char *const *)v10, 0);
  }
  posix_spawnattr_destroy(&v19);
  if (v14)
  {
    v15 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      +[AFUIDebugLogManager executeSystemCommand:stdoutTo:].cold.1((uint64_t *)v10, v15, v14);
    v16 = 0;
  }
  else
  {
    waitpid(v18[0], &v18[1], 0);
    if ((v18[1] & 0x7F) != 0)
      v16 = -1;
    else
      v16 = BYTE1(v18[1]);
  }
  free(v10);

  return v16;
}

- (void)capturePreviousConversationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[AFUIDebugLogManager _queue](self, "_queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__AFUIDebugLogManager_capturePreviousConversationWithCompletion___block_invoke;
    block[3] = &unk_24D7A1BA8;
    v7 = v4;
    dispatch_async(v5, block);

  }
}

void __65__AFUIDebugLogManager_capturePreviousConversationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  AFUIFileURLForConversationWithIdentifier(CFSTR("PreviousConversation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v2, 0, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  if (v3)
  {
    +[AFUIDebugLog logWithData:mimeType:name:attemptCompression:](AFUIDebugLog, "logWithData:mimeType:name:attemptCompression:", v3, CFSTR("application/x-plist"), CFSTR("PreviousConversation"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_captureLogsAtURL:(id)a3 logName:(id)a4 sinceTime:(double)a5 completion:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "stringWithFormat:", CFSTR("^%@_.*\\.log$"), v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[AFUIDebugLogManager _captureLogsAtURL:logName:sinceTime:pattern:mimeType:completion:](self, "_captureLogsAtURL:logName:sinceTime:pattern:mimeType:completion:", v13, v12, v14, CFSTR("text/plain"), v11, a5);

}

- (void)_captureLogsAtURL:(id)a3 logName:(id)a4 sinceTime:(double)a5 pattern:(id)a6 mimeType:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  double v26;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (v18)
  {
    -[AFUIDebugLogManager _queue](self, "_queue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __87__AFUIDebugLogManager__captureLogsAtURL_logName_sinceTime_pattern_mimeType_completion___block_invoke;
    block[3] = &unk_24D7A3760;
    block[4] = self;
    v21 = v14;
    v22 = v16;
    v26 = a5;
    v23 = v17;
    v24 = v15;
    v25 = v18;
    dispatch_async(v19, block);

  }
}

void __87__AFUIDebugLogManager__captureLogsAtURL_logName_sinceTime_pattern_mimeType_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id obj;
  uint64_t v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  double v46;
  id v47;
  _BYTE v48[128];
  _QWORD v49[3];

  v49[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v49[0] = *MEMORY[0x24BDBCBE0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  objc_msgSend(v3, "_contentsOfDirectoryAtURL:matchingPattern:includingPropertiesForKeys:error:", v4, v5, v6, &v47);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v47;

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemUptime");
    v37 = a1;
    v11 = v10 - *(double *)(a1 + 80);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD1758];
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __87__AFUIDebugLogManager__captureLogsAtURL_logName_sinceTime_pattern_mimeType_completion___block_invoke_2;
    v44[3] = &unk_24D7A3738;
    v34 = v12;
    v45 = v34;
    v46 = v11;
    objc_msgSend(v13, "predicateWithBlock:", v44);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v7;
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v15;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v41;
      while (2)
      {
        v19 = 0;
        v20 = v8;
        do
        {
          if (*(_QWORD *)v41 != v18)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v19);
          v39 = v20;
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v21, 1, &v39);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v39;

          if (!v22)
          {
            v29 = v2;
            v27 = obj;
            a1 = v37;
            v2 = 0;
            v26 = v34;
            v7 = v35;
            goto LABEL_16;
          }
          v23 = *(_QWORD *)(v37 + 56);
          objc_msgSend(v21, "lastPathComponent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[AFUIDebugLog logWithData:mimeType:name:attemptCompression:](AFUIDebugLog, "logWithData:mimeType:name:attemptCompression:", v22, v23, v24, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v2, "addObject:", v25);
          ++v19;
          v20 = v8;
        }
        while (v17 != v19);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        if (v17)
          continue;
        break;
      }
    }

    if (v2)
    {
      a1 = v37;
      v26 = v34;
      v7 = v35;
      if (!objc_msgSend(v2, "count"))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-latest"), *(_QWORD *)(v37 + 64));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v37 + 40), "URLByAppendingPathComponent:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "URLByAppendingPathExtension:", CFSTR("log"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = v8;
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v29, 1, &v38);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v38;

        if (v30)
        {
          objc_msgSend(v29, "lastPathComponent");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          +[AFUIDebugLog logWithData:mimeType:name:attemptCompression:](AFUIDebugLog, "logWithData:mimeType:name:attemptCompression:", v30, CFSTR("text/plain"), v32, 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v2, "addObject:", v33);
        }

        v8 = v31;
LABEL_16:

      }
    }
    else
    {
      a1 = v37;
      v26 = v34;
      v7 = v35;
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

BOOL __87__AFUIDebugLogManager__captureLogsAtURL_logName_sinceTime_pattern_mimeType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  char v5;
  id v6;
  id v7;
  double v8;
  _BOOL8 v9;
  id v11;
  id v12;

  v3 = a2;
  v12 = 0;
  v4 = *MEMORY[0x24BDBCBE0];
  v11 = 0;
  v5 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v12, v4, &v11);
  v6 = v12;
  v7 = v11;
  if ((v5 & 1) == 0 && os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __87__AFUIDebugLogManager__captureLogsAtURL_logName_sinceTime_pattern_mimeType_completion___block_invoke_2_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceDate:", v6);
  v9 = v8 <= *(double *)(a1 + 40);

  return v9;
}

- (void)_captureFileAtURL:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, void *, id);
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = (void (**)(id, void *, id))a4;
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v5, 1, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (v7)
  {
    objc_msgSend(v5, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[AFUIDebugLog logWithData:mimeType:name:attemptCompression:](AFUIDebugLog, "logWithData:mimeType:name:attemptCompression:", v7, 0, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v6[2](v6, v10, v8);
  }
  else
  {
    v6[2](v6, 0, v8);
  }

}

- (id)_archiveLogDirectoryAtURL:(id)a3 name:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a3;
  -[AFUIDebugLogManager _uniqueTemporaryFileURL](self, "_uniqueTemporaryFileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v10, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByDeletingLastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastPathComponent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringWithFormat:", CFSTR("/usr/bin/tar czf %@ -C %@ %@"), v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[AFUIDebugLogManager executeSystemCommand:stdoutTo:](AFUIDebugLogManager, "executeSystemCommand:stdoutTo:", v16, 0))
  {
    if (a5)
    {
      v21[0] = *MEMORY[0x24BDD0FC8];
      v21[1] = CFSTR("ArchiveCommand");
      v22[0] = CFSTR("Unable to archive directory.");
      v22[1] = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[AFUIDebugError debugErrorWithCode:userInfo:](AFUIDebugError, "debugErrorWithCode:userInfo:", 3, v17);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      a5 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v10, 0, a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      +[AFUIDebugLog logWithData:mimeType:name:attemptCompression:](AFUIDebugLog, "logWithData:mimeType:name:attemptCompression:", v18, CFSTR("application/x-gtar"), v8, 0);
      a5 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a5 = 0;
    }

  }
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "removeItemAtURL:error:", v10, 0);

  return a5;
}

- (NSURL)_baseLogDirectoryURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", CFSTR("/var/mobile/Library/Logs/CrashReporter"), 1);
}

- (id)_captureLogsInDirectoryAtURL:(id)a3 matchingPattern:(id)a4 withMimeType:(id)a5 attemptCompression:(BOOL)a6 limit:(int64_t)a7 error:(id *)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  BOOL v21;
  id v22;
  unint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v33 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x24BDBCBF0];
  v35 = 0;
  -[AFUIDebugLogManager _contentsOfDirectoryAtURL:matchingPattern:sortedByDateWithResourceKey:error:](self, "_contentsOfDirectoryAtURL:matchingPattern:sortedByDateWithResourceKey:error:", v14, v15, v17, &v35);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v35;
  v20 = v19;
  if (v18)
    v21 = a7 < 1;
  else
    v21 = 1;
  if (v21)
  {
    v22 = v19;
    if (!v19)
      goto LABEL_17;
    goto LABEL_15;
  }
  v30 = a8;
  v31 = v15;
  v32 = v14;
  v23 = 0;
  while (1)
  {
    if (objc_msgSend(v18, "count", v30, v31, v32) <= v23)
    {
      v22 = v20;
      goto LABEL_14;
    }
    objc_msgSend(v18, "objectAtIndex:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_alloc(MEMORY[0x24BDBCE50]);
    v34 = v20;
    v26 = (void *)objc_msgSend(v25, "initWithContentsOfURL:options:error:", v24, 1, &v34);
    v22 = v34;

    if (!v26)
      break;
    objc_msgSend(v24, "lastPathComponent");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[AFUIDebugLog logWithData:mimeType:name:attemptCompression:](AFUIDebugLog, "logWithData:mimeType:name:attemptCompression:", v26, v33, v27, v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v28);

    ++v23;
    v20 = v22;
    if (a7 == v23)
      goto LABEL_14;
  }

  v16 = 0;
LABEL_14:
  v15 = v31;
  v14 = v32;
  a8 = v30;
  if (v22)
  {
LABEL_15:

    v16 = 0;
    if (a8)
      *a8 = objc_retainAutorelease(v22);
  }
LABEL_17:

  return v16;
}

- (id)_contentsOfDirectoryAtURL:(id)a3 matchingPattern:(id)a4 includingPropertiesForKeys:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", a4, 17, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v9, v10, 0, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)MEMORY[0x24BDD1758];
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __98__AFUIDebugLogManager__contentsOfDirectoryAtURL_matchingPattern_includingPropertiesForKeys_error___block_invoke;
      v18[3] = &unk_24D7A3788;
      v19 = v11;
      objc_msgSend(v14, "predicateWithBlock:", v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "filteredArrayUsingPredicate:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

BOOL __98__AFUIDebugLogManager__contentsOfDirectoryAtURL_matchingPattern_includingPropertiesForKeys_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")) != 0;

  return v4;
}

- (id)_contentsOfDirectoryAtURL:(id)a3 matchingPattern:(id)a4 sortedByDateWithResourceKey:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  v25 = 0;
  v26[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIDebugLogManager _contentsOfDirectoryAtURL:matchingPattern:includingPropertiesForKeys:error:](self, "_contentsOfDirectoryAtURL:matchingPattern:includingPropertiesForKeys:error:", v10, v11, v13, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __99__AFUIDebugLogManager__contentsOfDirectoryAtURL_matchingPattern_sortedByDateWithResourceKey_error___block_invoke;
    v17[3] = &unk_24D7A37B0;
    v18 = v12;
    v19 = &v20;
    objc_msgSend(v14, "sortedArrayUsingComparator:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  if (v21[5])
  {

    v15 = 0;
    if (a6)
      *a6 = objc_retainAutorelease((id)v21[5]);
  }

  _Block_object_dispose(&v20, 8);
  return v15;
}

uint64_t __99__AFUIDebugLogManager__contentsOfDirectoryAtURL_matchingPattern_sortedByDateWithResourceKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  char v8;
  id v9;
  os_log_t *v10;
  NSObject *v11;
  id *v12;
  char v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id obj;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  obj = 0;
  v25 = 0;
  v7 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v8 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v25, *(_QWORD *)(a1 + 32), &obj);
  v9 = v25;
  objc_storeStrong(v7, obj);
  v10 = (os_log_t *)MEMORY[0x24BE08FB0];
  if ((v8 & 1) == 0)
  {
    v11 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 136315906;
      v27 = "-[AFUIDebugLogManager _contentsOfDirectoryAtURL:matchingPattern:sortedByDateWithResourceKey:error:]_block_invoke";
      v28 = 2114;
      v29 = v18;
      v30 = 2114;
      v31 = v5;
      v32 = 2114;
      v33 = v19;
      _os_log_error_impl(&dword_217514000, v11, OS_LOG_TYPE_ERROR, "%s Unable to get %{public}@ for file at %{public}@: %{public}@", buf, 0x2Au);
    }
  }
  v22 = 0;
  v23 = 0;
  v12 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v13 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v23, *(_QWORD *)(a1 + 32), &v22);
  v14 = v23;
  objc_storeStrong(v12, v22);
  if ((v13 & 1) == 0)
  {
    v15 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 32);
      v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 136315906;
      v27 = "-[AFUIDebugLogManager _contentsOfDirectoryAtURL:matchingPattern:sortedByDateWithResourceKey:error:]_block_invoke";
      v28 = 2114;
      v29 = v20;
      v30 = 2114;
      v31 = v6;
      v32 = 2114;
      v33 = v21;
      _os_log_error_impl(&dword_217514000, v15, OS_LOG_TYPE_ERROR, "%s Unable to get %{public}@ for file at %{public}@: %{public}@", buf, 0x2Au);
    }
  }
  v16 = objc_msgSend(v14, "compare:", v9);

  return v16;
}

- (NSURL)_siriLogDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF48];
  AFLogDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (id)_siriCardLogDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF48];
  AFLogDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("CardLogs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_uniqueTemporaryFileURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDBCF48];
  NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (OS_dispatch_queue)_queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (void)executeSystemCommand:(int)a3 stdoutTo:.cold.1(uint64_t *a1, void *a2, int a3)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  v5 = a2;
  v7 = 136315650;
  v8 = "+[AFUIDebugLogManager executeSystemCommand:stdoutTo:]";
  v9 = 2082;
  v10 = v4;
  v11 = 2082;
  v12 = strerror(a3);
  OUTLINED_FUNCTION_0_1(&dword_217514000, v5, v6, "%s Failed to spawn %{public}s: %{public}s", (uint8_t *)&v7);

}

+ (void)executeSystemCommand:stdoutTo:.cold.2()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_217514000, v0, OS_LOG_TYPE_ERROR, "%s Running Command ---> %{public}@", (uint8_t *)v1, 0x16u);
}

void __87__AFUIDebugLogManager__captureLogsAtURL_logName_sinceTime_pattern_mimeType_completion___block_invoke_2_cold_1()
{
  __int16 v0;
  uint64_t v1;
  NSObject *v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_1();
  v4 = v0;
  v5 = v1;
  OUTLINED_FUNCTION_0_1(&dword_217514000, v2, (uint64_t)v2, "%s Couldn't get modification date for log at %{public}@: %{public}@", (uint8_t *)v3);
}

@end
