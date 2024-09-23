@implementation stolenUSBLocalStorageClient

+ (id)newManager
{
  return (id)objc_msgSend(a1, "newConnectionForService:", CFSTR("machp://com.apple.filesystems.localLiveFiles"));
}

- (id)loadVolumes:(id)a3 ofType:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v17;
  _QWORD v18[6];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__5;
  v30 = __Block_byref_object_dispose__5;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__5;
  v24 = __Block_byref_object_dispose__5;
  v25 = 0;
  fskit_std_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[stolenUSBLocalStorageClient loadVolumes:ofType:withError:].cold.1();

  v11 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE60470]);
  v12 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __60__stolenUSBLocalStorageClient_loadVolumes_ofType_withError___block_invoke;
  v19[3] = &unk_250C32768;
  v19[4] = &v26;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __60__stolenUSBLocalStorageClient_loadVolumes_ofType_withError___block_invoke_2;
  v18[3] = &unk_250C332D8;
  v18[4] = &v26;
  v18[5] = &v20;
  objc_msgSend(v13, "addDisk:fileSystemType:reply:", v8, v9, v18);
  if (v27[5] || !objc_msgSend((id)v21[5], "count"))
  {
    if (a5)
      *a5 = objc_retainAutorelease((id)v27[5]);
  }
  else
  {
    fskit_std_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v17 = v21[5];
      *(_DWORD *)buf = 136315906;
      v33 = "-[stolenUSBLocalStorageClient loadVolumes:ofType:withError:]";
      v34 = 2112;
      v35 = v8;
      v36 = 2112;
      v37 = v9;
      v38 = 2112;
      v39 = v17;
      _os_log_debug_impl(&dword_23B2A6000, v14, OS_LOG_TYPE_DEBUG, "%s:finish:%@:%@:%@", buf, 0x2Au);
    }

  }
  v15 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

- (void)loadVolumes:ofType:withError:.cold.1()
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
  OUTLINED_FUNCTION_1_0();
  v4 = v0;
  v5 = v1;
  OUTLINED_FUNCTION_4_2(&dword_23B2A6000, v2, (uint64_t)v2, "%s:start:%@:%@", (uint8_t *)v3);
  OUTLINED_FUNCTION_8();
}

@end
