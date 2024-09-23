@implementation DOCPostLaunchBuffer

- (void)performAfterLaunch:(id)a3
{
  -[DOCPostLaunchBuffer performAfterLaunchAlwaysAsync:block:](self, "performAfterLaunchAlwaysAsync:block:", 1, a3);
}

+ (DOCPostLaunchBuffer)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_4);
  return (DOCPostLaunchBuffer *)(id)shared_sharedInstance;
}

void __29__DOCPostLaunchBuffer_shared__block_invoke()
{
  DOCPostLaunchBuffer *v0;
  void *v1;

  v0 = -[DOCOperationBuffer initWithLabel:]([DOCPostLaunchBuffer alloc], "initWithLabel:", CFSTR("postLaunch"));
  v1 = (void *)shared_sharedInstance;
  shared_sharedInstance = (uint64_t)v0;

}

- (DOCPostLaunchBuffer)initWithLabel:(id)a3 targetQueue:(id)a4
{
  DOCPostLaunchBuffer *v4;
  dispatch_time_t v5;
  _QWORD block[4];
  DOCPostLaunchBuffer *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DOCPostLaunchBuffer;
  v4 = -[DOCOperationBuffer initWithLabel:targetQueue:](&v9, sel_initWithLabel_targetQueue_, a3, a4);
  if (v4)
  {
    v5 = dispatch_time(0, 5000000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__DOCPostLaunchBuffer_initWithLabel_targetQueue___block_invoke;
    block[3] = &unk_24C0FE168;
    v8 = v4;
    dispatch_after(v5, MEMORY[0x24BDAC9B8], block);

  }
  return v4;
}

- (void)performAfterLaunchAlwaysAsync:(BOOL)a3 block:(id)a4
{
  void (**v6)(_QWORD);
  BOOL v7;
  int v8;
  void (**v9)(_QWORD);

  v6 = (void (**)(_QWORD))a4;
  v9 = v6;
  if (a3
    || (v7 = -[DOCOperationBuffer locked](self, "locked"), v6 = v9, v7)
    || (v8 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"), v6 = v9, !v8))
  {
    -[DOCOperationBuffer buffer:](self, "buffer:", v6);
  }
  else
  {
    v9[2](v9);
  }

}

uint64_t __49__DOCPostLaunchBuffer_initWithLabel_targetQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

@end
