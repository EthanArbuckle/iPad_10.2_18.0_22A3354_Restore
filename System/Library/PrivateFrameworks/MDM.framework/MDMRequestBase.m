@implementation MDMRequestBase

+ (NSString)requestType
{
  return (NSString *)&stru_24EB6A400;
}

+ (unint64_t)requiredAccessRights
{
  return 0;
}

- (BOOL)isRequestAllowedWithError:(id *)a3
{
  _BOOL4 v5;

  if (-[MDMRequestBase isUserEnrollment](self, "isUserEnrollment")
    || (v5 = -[MDMRequestBase _validateAccessRights:requiredAccessRights:error:](self, "_validateAccessRights:requiredAccessRights:error:", -[MDMRequestBase accessRights](self, "accessRights"), objc_msgSend((id)objc_opt_class(), "requiredAccessRights"), a3)))
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)shouldBlockUserSwitch
{
  return 1;
}

- (BOOL)_validateAccessRights:(unint64_t)a3 requiredAccessRights:(unint64_t)a4 error:(id *)a5
{
  unint64_t v6;

  v6 = a4 & a3;
  if ((a4 & a3) != a4 && a5 != 0)
  {
    -[MDMRequestBase _notAuthorizedError](self, "_notAuthorizedError");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 == a4;
}

- (id)_notAuthorizedError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12007, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)channelType
{
  return self->_channelType;
}

- (void)setChannelType:(unint64_t)a3
{
  self->_channelType = a3;
}

- (MDMRequestHandlerProtocol)delegate
{
  return (MDMRequestHandlerProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)accessRights
{
  return self->_accessRights;
}

- (void)setAccessRights:(unint64_t)a3
{
  self->_accessRights = a3;
}

- (BOOL)isUserEnrollment
{
  return self->_isUserEnrollment;
}

- (void)setIsUserEnrollment:(BOOL)a3
{
  self->_isUserEnrollment = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
