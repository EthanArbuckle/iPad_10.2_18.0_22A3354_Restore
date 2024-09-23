@implementation SRError

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithCode:userInfo:", a3, v6);

  return v7;
}

+ (id)errorWithCode:(int64_t)a3 localizedFailureReason:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithCode:localizedFailureReason:", a3, v6);

  return v7;
}

+ (id)errorWithCode:(int64_t)a3
{
  return _objc_msgSend(a1, "errorWithCode:userInfo:", a3, 0);
}

- (SRError)initWithCode:(int64_t)a3 userInfo:(id)a4
{
  return -[SRError initWithDomain:code:userInfo:](self, "initWithDomain:code:userInfo:", CFSTR("com.apple.siri.ErrorDomain"), a3, a4);
}

- (SRError)initWithCode:(int64_t)a3 localizedFailureReason:(id)a4
{
  id v6;
  void *v7;
  SRError *v8;
  NSErrorUserInfoKey v10;
  id v11;

  v10 = NSLocalizedFailureReasonErrorKey;
  v11 = a4;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));

  v8 = -[SRError initWithCode:userInfo:](self, "initWithCode:userInfo:", a3, v7);
  return v8;
}

- (SRError)initWithCode:(int64_t)a3
{
  return -[SRError initWithCode:userInfo:](self, "initWithCode:userInfo:", a3, 0);
}

@end
