@implementation LACKeyBagProvider

- (LACKeyBagProvider)init
{
  LACKeyBagProvider *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *userKeybags;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LACKeyBagProvider;
  v2 = -[LACKeyBagProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    userKeybags = v2->_userKeybags;
    v2->_userKeybags = v3;

  }
  return v2;
}

+ (LACKeyBagProvider)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_7);
  return (LACKeyBagProvider *)(id)sharedInstance_sharedInstance_3;
}

void __35__LACKeyBagProvider_sharedInstance__block_invoke()
{
  LACKeyBagProvider *v0;
  void *v1;

  v0 = objc_alloc_init(LACKeyBagProvider);
  v1 = (void *)sharedInstance_sharedInstance_3;
  sharedInstance_sharedInstance_3 = (uint64_t)v0;

}

- (id)keybagForUserId:(unsigned int)a3
{
  uint64_t v3;
  NSMutableDictionary *userKeybags;
  void *v6;
  LACKeyBagMKBAdapter *v7;
  NSMutableDictionary *v8;
  void *v9;

  v3 = *(_QWORD *)&a3;
  userKeybags = self->_userKeybags;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](userKeybags, "objectForKeyedSubscript:", v6);
  v7 = (LACKeyBagMKBAdapter *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = -[LACKeyBagMKBAdapter initWithUserId:]([LACKeyBagMKBAdapter alloc], "initWithUserId:", v3);
    v8 = self->_userKeybags;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userKeybags, 0);
}

@end
