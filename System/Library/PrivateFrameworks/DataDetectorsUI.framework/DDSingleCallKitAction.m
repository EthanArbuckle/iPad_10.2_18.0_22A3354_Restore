@implementation DDSingleCallKitAction

- (DDSingleCallKitAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  DDSingleCallKitAction *v5;
  uint64_t v6;
  NSArray *callProviders;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DDSingleCallKitAction;
  v5 = -[DDTelephoneNumberAction initWithURL:result:context:](&v9, sel_initWithURL_result_context_, a3, a4, a5);
  if (v5)
  {
    +[DDCallKitAction callKitProviders](DDCallKitAction, "callKitProviders");
    v6 = objc_claimAutoreleasedReturnValue();
    callProviders = v5->_callProviders;
    v5->_callProviders = (NSArray *)v6;

  }
  return v5;
}

+ (BOOL)isAvailable
{
  void *v2;
  BOOL v3;

  +[DDCallKitAction callKitProviders](DDCallKitAction, "callKitProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 1;

  return v3;
}

- (id)localizedName
{
  void *v2;
  void *v3;

  -[DDSingleCallKitAction callProvider](self, "callProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)callProvider
{
  return -[NSArray firstObject](self->_callProviders, "firstObject");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callProviders, 0);
}

@end
