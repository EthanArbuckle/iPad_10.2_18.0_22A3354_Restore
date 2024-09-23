@implementation MSUUpdateBrainLoader

- (MSUUpdateBrainLoader)initWithDictionary:(id)a3
{
  MSUUpdateBrainLoader *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSUUpdateBrainLoader;
  v4 = -[MSUUpdateBrainLoader init](&v6, sel_init);
  if (v4)
    v4->_attributesDict = (NSDictionary *)a3;
  return v4;
}

- (void)loadUpdateBrainWithOptions:(id)a3 progressHandler:(id)a4
{
  NSObject *global_queue;
  _QWORD block[7];

  global_queue = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__MSUUpdateBrainLoader_loadUpdateBrainWithOptions_progressHandler___block_invoke;
  block[3] = &unk_24CBCF2C0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(global_queue, block);
}

uint64_t __67__MSUUpdateBrainLoader_loadUpdateBrainWithOptions_progressHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  _QWORD v7[5];
  id v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if (objc_msgSend(*(id *)(a1 + 32), "attributesDict"))
    objc_msgSend(v2, "setObject:forKey:", objc_msgSend(*(id *)(a1 + 32), "attributesDict"), CFSTR("AssetProperties"));
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("ClientOptions"));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__MSUUpdateBrainLoader_loadUpdateBrainWithOptions_progressHandler___block_invoke_2;
  v7[3] = &unk_24CBCF298;
  v7[4] = *(_QWORD *)(a1 + 48);
  v4 = perform_command_with_progress("LoadBrain", v2, 0, 0, (const __CFString **)&v8, (uint64_t)v7);
  v5 = *(_QWORD *)(a1 + 48);
  if (!v4)
    return (*(uint64_t (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v8);
  v9 = CFSTR("MSUAssetOperation");
  v10[0] = CFSTR("MSUAssetOperationCompleted");
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1), 0);
}

uint64_t __67__MSUUpdateBrainLoader_loadUpdateBrainWithOptions_progressHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 0;
}

- (BOOL)cancel:(id *)a3
{
  return 1;
}

- (void)adjustOptions:(id)a3 completion:(id)a4
{
  if (a3)
    (*((void (**)(id, id))a4 + 2))(a4, 0);
}

- (int64_t)requiredDiskSpace:(id *)a3
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSUUpdateBrainLoader;
  -[MSUUpdateBrainLoader dealloc](&v3, sel_dealloc);
}

- (NSDictionary)attributesDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAttributesDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

@end
