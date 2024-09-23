@implementation IDSSignInServiceUserInfo

- (IDSSignInServiceUserInfo)initWithUserType:(unint64_t)a3 status:(unint64_t)a4
{
  NSObject *v7;
  IDSSignInServiceUserInfo *v8;
  IDSSignInServiceUserInfo *v9;
  objc_super v11;

  if (_IDSRunningInDaemon())
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907E949C();

    v8 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)IDSSignInServiceUserInfo;
    v9 = -[IDSSignInServiceUserInfo init](&v11, sel_init);
    if (v9)
    {
      v9->_type = a3;
      v9->_status = a4;
    }
    self = v9;
    v8 = self;
  }

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  const __CFString *v6;
  unint64_t status;
  unint64_t type;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = 0;
  v6 = CFSTR("AppleID");
  type = self->_type;
  status = self->_status;
  if (type != 1)
    v6 = 0;
  if (!type)
    v6 = CFSTR("Phone");
  if (status <= 3)
    v5 = off_1E2C61968[status];
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> Type: %@ Status: %@"), v4, self, v6, v5);
}

- (unint64_t)status
{
  return self->_status;
}

- (unint64_t)type
{
  return self->_type;
}

@end
