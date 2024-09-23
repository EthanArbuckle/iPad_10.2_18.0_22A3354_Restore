@implementation BPSRemoveSystemDeletedAppFromSpecifiers

void ___BPSRemoveSystemDeletedAppFromSpecifiers_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    objc_msgSend(v8, "rangeOfString:options:", CFSTR("com.apple."), 9);
    if (v9)
    {
      +[BPSBridgeAppContext shared](BPSBridgeAppContext, "shared");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "watchAppInstallStates");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "integerValue");

      if (v13 != 2)
        objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
    }
  }
  else
  {
    objc_msgSend(v5, "identifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rangeOfString:options:", CFSTR("com.apple."), 9);
    if (v14)
    {
      bps_utility_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412290;
        v17 = v8;
        _os_log_impl(&dword_21147E000, v15, OS_LOG_TYPE_DEFAULT, "Unable to check removal of %@: because there is no bundle ID mapping", (uint8_t *)&v16, 0xCu);
      }

    }
  }

}

@end
