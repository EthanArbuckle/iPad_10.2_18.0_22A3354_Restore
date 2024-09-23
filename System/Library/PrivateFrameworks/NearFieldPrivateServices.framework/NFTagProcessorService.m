@implementation NFTagProcessorService

- (BOOL)canRun
{
  return 1;
}

- (id)serviceName
{
  return CFSTR("com.apple.stockholm.services.NFTagProcessorService");
}

- (void)processURL:(id)a3 forNDEFTag:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v16[0] = CFSTR("URL");
  v9 = a4;
  objc_msgSend(a3, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("TAG");
  v17[0] = v10;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = 3221225472;
  v14[2] = __65__NFTagProcessorService_processURL_forNDEFTag_completionHandler___block_invoke;
  v14[3] = &unk_25136D5D0;
  v15 = v8;
  v13.receiver = self;
  v13.super_class = (Class)NFTagProcessorService;
  v14[0] = MEMORY[0x24BDAC760];
  v12 = v8;
  -[NFPrivateService runService:withCompletion:](&v13, sel_runService_withCompletion_, v11, v14);

}

void __65__NFTagProcessorService_processURL_forNDEFTag_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Error"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Actionable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "BOOLValue");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
