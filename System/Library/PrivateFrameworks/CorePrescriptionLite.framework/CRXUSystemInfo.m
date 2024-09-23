@implementation CRXUSystemInfo

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__CRXUSystemInfo_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance___once__LINE___2 != -1)
    dispatch_once(&sharedInstance___once__LINE___2, block);
  return (id)sharedInstance_instance_2;
}

void __32__CRXUSystemInfo_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance_2;
  sharedInstance_instance_2 = (uint64_t)v1;

}

- (CRXUSystemInfo)init
{
  CRXUSystemInfo *v2;
  NSString *modelName;
  uint64_t v4;
  objc_super v6;
  utsname v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v6.receiver = self;
  v6.super_class = (Class)CRXUSystemInfo;
  v2 = -[CRXUSystemInfo init](&v6, sel_init);
  if (v2)
  {
    memset(&v7, 0, 512);
    if (uname(&v7))
    {
      modelName = v2->_modelName;
      v2->_modelName = (NSString *)CFSTR("Unknown");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7.machine);
      v4 = objc_claimAutoreleasedReturnValue();
      modelName = v2->_modelName;
      v2->_modelName = (NSString *)v4;
    }

  }
  return v2;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelName, 0);
}

@end
