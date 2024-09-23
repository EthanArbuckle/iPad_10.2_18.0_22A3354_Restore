@implementation AFUIDebugError

+ (id)debugErrorWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCode:userInfo:", a3, v6);

  return v7;
}

- (AFUIDebugError)initWithCode:(int64_t)a3 userInfo:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFUIDebugError;
  return -[AFUIDebugError initWithDomain:code:userInfo:](&v5, sel_initWithDomain_code_userInfo_, CFSTR("com.apple.siri.DebugErrorDomain"), a3, a4);
}

@end
