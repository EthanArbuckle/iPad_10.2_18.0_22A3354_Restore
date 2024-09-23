@implementation BLSHTapToRadarFiler

+ (void)fileRadar:(id)a3 log:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_get_global_queue(2, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__BLSHTapToRadarFiler_fileRadar_log_completion___block_invoke;
  block[3] = &unk_24D1BC550;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  dispatch_async(v10, block);

}

void __48__BLSHTapToRadarFiler_fileRadar_log_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "toURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v3, "openURL:withOptions:error:", v2, MEMORY[0x24BDBD1B8], &v7);
  v4 = v7;

  v5 = *(NSObject **)(a1 + 40);
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __48__BLSHTapToRadarFiler_fileRadar_log_completion___block_invoke_cold_1((uint64_t)v2, (uint64_t)v4, v5);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v2;
    _os_log_impl(&dword_2145AC000, v5, OS_LOG_TYPE_DEFAULT, "filed Tap-To-Radar %@", buf, 0xCu);
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, BOOL, id))(v6 + 16))(v6, v4 == 0, v4);

}

void __48__BLSHTapToRadarFiler_fileRadar_log_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_2145AC000, log, OS_LOG_TYPE_ERROR, "could not file Tap-To-Radar %@ %@", (uint8_t *)&v3, 0x16u);
}

@end
