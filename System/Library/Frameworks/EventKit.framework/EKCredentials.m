@implementation EKCredentials

+ (id)credentialsWithUsername:(id)a3 password:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = (_QWORD *)objc_opt_new();
  v8 = (void *)v7[1];
  v7[1] = v5;
  v9 = v5;

  v10 = (void *)v7[2];
  v7[2] = v6;

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)EKCredentials;
  -[EKCredentials description](&v9, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_password)
    v6 = CFSTR("******");
  else
    v6 = 0;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] username: [%@], password: [%@]"), v4, self->_username, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)password
{
  return self->_password;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
