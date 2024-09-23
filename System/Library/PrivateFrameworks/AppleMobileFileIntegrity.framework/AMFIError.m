@implementation AMFIError

- (AMFIError)initWithAMFIErrorCode:(int64_t)a3 withURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  AMFIError *v10;

  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB3308]);
  errorStringForAMFIErrorCode(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB2D50]);

  v10 = -[AMFIError initWithDomain:code:userInfo:](self, "initWithDomain:code:userInfo:", CFSTR("AppleMobileFileIntegrityError"), a3, v8);
  return v10;
}

- (AMFIError)initWithMISError:(int)a3 withURL:(id)a4
{
  id v6;
  AMFIError *v7;

  v6 = a4;
  v7 = -[AMFIError initWithAMFIErrorCode:withURL:](self, "initWithAMFIErrorCode:withURL:", errorCodeForMISError(a3), v6);

  return v7;
}

@end
