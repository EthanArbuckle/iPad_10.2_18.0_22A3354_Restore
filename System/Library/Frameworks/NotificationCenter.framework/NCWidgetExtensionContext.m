@implementation NCWidgetExtensionContext

void __77___NCWidgetExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  NSString *v7;
  NSString *v8;
  CGSize *v9;
  NSString *v10;
  NSString *v11;
  CGSize *v12;
  char v13;
  id v14;
  id v15;

  objc_msgSend(a2, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v14 = v6;
    objc_msgSend(v6, "objectForKey:", CFSTR("NCExtensionItemUserInfoInitialMaxLessSize"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = (CGSize *)(a1[4] + 24);
      *v9 = CGSizeFromString(v7);
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    }

    v6 = v14;
  }
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v15 = v6;
    objc_msgSend(v6, "objectForKey:", CFSTR("NCExtensionItemUserInfoInitialMaxMoreSize"));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = (CGSize *)(a1[4] + 40);
      *v12 = CGSizeFromString(v10);
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    }

    v6 = v15;
  }
  v13 = *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v13)
    v13 = *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) != 0;
  *a4 = v13;

}

void __55___NCWidgetExtensionContext_openURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE38320];
  v14[0] = *MEMORY[0x24BE38310];
  v14[1] = v2;
  v15[0] = MEMORY[0x24BDBD1C8];
  v15[1] = MEMORY[0x24BDBD1C8];
  v14[2] = *MEMORY[0x24BE382E0];
  v15[2] = CFSTR("NCAppLaunchOriginWidget");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  v6 = objc_msgSend(v4, "openSensitiveURL:withOptions:error:", v5, v3, &v13);
  v7 = v13;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    NSLog(CFSTR("%s failed: %@"), "-[_NCWidgetExtensionContext openURL:completionHandler:]_block_invoke", v7);
  if (*(_QWORD *)(a1 + 40))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55___NCWidgetExtensionContext_openURL_completionHandler___block_invoke_2;
    block[3] = &unk_24DB74070;
    v8 = *(id *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v11 = v8;
    v12 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __55___NCWidgetExtensionContext_openURL_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

@end
