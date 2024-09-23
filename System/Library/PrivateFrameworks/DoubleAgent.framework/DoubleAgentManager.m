@implementation DoubleAgentManager

+ (id)defaultManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__DoubleAgentManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_once != -1)
    dispatch_once(&defaultManager_once, block);
  return (id)defaultManager_manager;
}

void __36__DoubleAgentManager_defaultManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultManager_manager;
  defaultManager_manager = (uint64_t)v1;

}

- (DoubleAgentManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DoubleAgentManager;
  return -[DoubleAgentManager init](&v3, sel_init);
}

- (void)lookupXattrIn:(int)a3 fileSize:(int64_t)a4 named:(id)a5 reply:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  AppleDoubleParser *v11;
  _QWORD v12[4];
  id v13;

  v8 = *(_QWORD *)&a3;
  v9 = a5;
  v10 = a6;
  v11 = -[AppleDoubleParser initWithFileDescriptor:fileSize:isAllocateXattr:]([AppleDoubleParser alloc], "initWithFileDescriptor:fileSize:isAllocateXattr:", v8, a4, 0);
  if (v11)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __57__DoubleAgentManager_lookupXattrIn_fileSize_named_reply___block_invoke;
    v12[3] = &unk_250B89FF8;
    v13 = v10;
    -[AppleDoubleParser lookupXattrNamed:reply:](v11, "lookupXattrNamed:reply:", v9, v12);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v10 + 2))(v10, 93, 0, 0);
  }

}

uint64_t __57__DoubleAgentManager_lookupXattrIn_fileSize_named_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)allocateXattrIn:(int)a3 fileSize:(int64_t)a4 named:(id)a5 sized:(unint64_t)a6 how:(unsigned int)a7 reply:(id)a8
{
  uint64_t v9;
  uint64_t v12;
  id v13;
  id v14;
  AppleDoubleParser *v15;
  _QWORD v16[4];
  id v17;

  v9 = *(_QWORD *)&a7;
  v12 = *(_QWORD *)&a3;
  v13 = a5;
  v14 = a8;
  v15 = -[AppleDoubleParser initWithFileDescriptor:fileSize:isAllocateXattr:]([AppleDoubleParser alloc], "initWithFileDescriptor:fileSize:isAllocateXattr:", v12, a4, 1);
  if (v15)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __69__DoubleAgentManager_allocateXattrIn_fileSize_named_sized_how_reply___block_invoke;
    v16[3] = &unk_250B8A020;
    v17 = v14;
    -[AppleDoubleParser allocateXattrNamed:sized:how:reply:](v15, "allocateXattrNamed:sized:how:reply:", v13, a6, v9, v16);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v14 + 2))(v14, 93, 0);
  }

}

uint64_t __69__DoubleAgentManager_allocateXattrIn_fileSize_named_sized_how_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)listXattrsIn:(int)a3 fileSize:(int64_t)a4 reply:(id)a5
{
  uint64_t v6;
  void (**v7)(id, _QWORD, void *);
  AppleDoubleParser *v8;
  void *v9;
  _QWORD v10[4366];

  v6 = *(_QWORD *)&a3;
  v10[4365] = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, _QWORD, void *))a5;
  v8 = -[AppleDoubleParser initWithFileDescriptor:fileSize:isAllocateXattr:]([AppleDoubleParser alloc], "initWithFileDescriptor:fileSize:isAllocateXattr:", v6, a4, 0);
  if (v8)
  {
    bzero(v10, 0x8868uLL);
    -[AppleDoubleParser listXattrs:](v8, "listXattrs:", v10);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v10, 34920);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v9);

  }
  else
  {
    v7[2](v7, 93, 0);
  }

}

- (void)removeXattrOf:(int)a3 fileSize:(int64_t)a4 named:(id)a5 reply:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  AppleDoubleParser *v11;
  _QWORD v12[4];
  id v13;

  v8 = *(_QWORD *)&a3;
  v9 = a5;
  v10 = a6;
  v11 = -[AppleDoubleParser initWithFileDescriptor:fileSize:isAllocateXattr:]([AppleDoubleParser alloc], "initWithFileDescriptor:fileSize:isAllocateXattr:", v8, a4, 0);
  if (v11)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __57__DoubleAgentManager_removeXattrOf_fileSize_named_reply___block_invoke;
    v12[3] = &unk_250B89FB0;
    v13 = v10;
    -[AppleDoubleParser removeXattrNamed:reply:](v11, "removeXattrNamed:reply:", v9, v12);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v10, 93, 0);
  }

}

uint64_t __57__DoubleAgentManager_removeXattrOf_fileSize_named_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
