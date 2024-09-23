@implementation HUCCOpenURLHandler

- (HUCCOpenURLHandler)initWithCCModuleContext:(id)a3
{
  id v5;
  HUCCOpenURLHandler *v6;
  HUCCOpenURLHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUCCOpenURLHandler;
  v6 = -[HUCCOpenURLHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (id)openURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BE6B608];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_230FE2EC4;
  v10[3] = &unk_24FFD8228;
  v10[4] = self;
  v11 = v4;
  v6 = v4;
  objc_msgSend_futureWithErrorOnlyHandlerAdapterBlock_(v5, v7, (uint64_t)v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CCUIContentModuleContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
