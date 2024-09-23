@implementation CXServiceDomain

- (CXServiceDomain)initWithName:(id)a3 machName:(id)a4
{
  id v6;
  id v7;
  CXServiceDomain *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSString *machName;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CXServiceDomain;
  v8 = -[CXServiceDomain init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    machName = v8->_machName;
    v8->_machName = (NSString *)v11;

  }
  return v8;
}

+ (id)callKitServiceDomain
{
  if (callKitServiceDomain_onceToken != -1)
    dispatch_once(&callKitServiceDomain_onceToken, &__block_literal_global_5);
  return (id)callKitServiceDomain_sServiceDomain;
}

void __39__CXServiceDomain_callKitServiceDomain__block_invoke()
{
  CXServiceDomain *v0;
  void *v1;

  v0 = -[CXServiceDomain initWithName:machName:]([CXServiceDomain alloc], "initWithName:machName:", CFSTR("com.apple.callkit"), CFSTR("com.apple.callkit.service"));
  v1 = (void *)callKitServiceDomain_sServiceDomain;
  callKitServiceDomain_sServiceDomain = (uint64_t)v0;

}

- (NSString)name
{
  return self->_name;
}

- (NSString)machName
{
  return self->_machName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
