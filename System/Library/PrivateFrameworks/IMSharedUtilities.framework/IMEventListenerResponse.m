@implementation IMEventListenerResponse

- (IMEventListenerResponse)initWithSuccess:(BOOL)a3 userInfo:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  IMEventListenerResponse *v11;
  IMEventListenerResponse *v12;
  BOOL v13;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IMEventListenerResponse;
  v11 = -[IMEventListenerResponse init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_userInfo, a4);
    objc_storeStrong((id *)&v12->_error, a5);
    if (v10)
      v13 = 0;
    else
      v13 = a3;
    v12->_success = v13;
  }

  return v12;
}

- (NSString)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (-[IMEventListenerResponse didSucceed](self, "didSucceed"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  -[IMEventListenerResponse error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMEventListenerResponse userInfo](self, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("command succeeded: %@, error: %@, userInfo: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)didSucceed
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
