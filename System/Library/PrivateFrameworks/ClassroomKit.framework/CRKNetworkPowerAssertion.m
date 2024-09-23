@implementation CRKNetworkPowerAssertion

- (CRKNetworkPowerAssertion)init
{
  CRKNetworkPowerAssertion *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  NSString *name;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CRKNetworkPowerAssertion;
  v2 = -[CRKNetworkPowerAssertion init](&v14, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "processName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "processIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@:%@:%p"), v5, v8, v10, v2);
    v11 = objc_claimAutoreleasedReturnValue();
    name = v2->_name;
    v2->_name = (NSString *)v11;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_80);
  return (id)sharedInstance_sharedInstance;
}

void __42__CRKNetworkPowerAssertion_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

+ (void)increment
{
  id v2;

  objc_msgSend(a1, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "increment");

}

- (void)increment
{
  unint64_t v3;
  CRKNetworkPowerAssertion *v4;
  const __CFString *v5;
  __CFString *v6;
  IOReturn v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (-[CRKNetworkPowerAssertion count](self, "count"))
  {
    IOPMAssertionRetain(self->mPowerAssertion);
    v3 = -[CRKNetworkPowerAssertion count](self, "count") + 1;
    v4 = self;
LABEL_3:
    -[CRKNetworkPowerAssertion setCount:](v4, "setCount:", v3);
    goto LABEL_9;
  }
  if (CRKIsiOS())
    v5 = CFSTR("PreventUserIdleSystemSleep");
  else
    v5 = CFSTR("NetworkClientActive");
  -[CRKNetworkPowerAssertion name](self, "name");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = IOPMAssertionCreateWithName(v5, 0xFFu, v6, &self->mPowerAssertion);

  if (!v7)
  {
    v4 = self;
    v3 = 1;
    goto LABEL_3;
  }
  self->mPowerAssertion = 0;
LABEL_9:
  _CRKLogGeneral_10();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 134217984;
    v10 = -[CRKNetworkPowerAssertion count](self, "count");
    _os_log_impl(&dword_218C99000, v8, OS_LOG_TYPE_INFO, "Incrementing network power assertion to %ld", (uint8_t *)&v9, 0xCu);
  }

}

+ (void)decrement
{
  id v2;

  objc_msgSend(a1, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decrement");

}

- (void)decrement
{
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 138543618;
  v5 = objc_opt_class();
  v6 = 2048;
  v7 = objc_msgSend(a1, "count");
  _os_log_error_impl(&dword_218C99000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Unbalanced number of calls to increment/decrement. self.count = %lu", (uint8_t *)&v4, 0x16u);
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
