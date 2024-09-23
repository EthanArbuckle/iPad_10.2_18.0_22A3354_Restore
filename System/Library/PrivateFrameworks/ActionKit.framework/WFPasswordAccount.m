@implementation WFPasswordAccount

+ (id)accountWithUsername:(id)a3 password:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setUsername:", v6);

  objc_msgSend(v7, "setPassword:", v5);
  return v7;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  BOOL v5;

  -[WFPasswordAccount username](self, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[WFPasswordAccount password](self, "password");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
