@implementation CRRequestUserConfirmationCommand

- (id)copyWithZone:(_NSZone *)a3
{
  CRRequestUserConfirmationCommand *v5;
  void *v6;
  void *v7;

  v5 = objc_alloc_init(CRRequestUserConfirmationCommand);
  -[CRRequestUserConfirmationCommand userInfo](self, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[CRRequestUserConfirmationCommand setUserInfo:](v5, "setUserInfo:", v7);

  -[CRRequestUserConfirmationCommand setCommandDirection:](v5, "setCommandDirection:", -[CRRequestUserConfirmationCommand commandDirection](self, "commandDirection"));
  return v5;
}

- (NSDictionary)userInfo
{
  return self->userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)commandDirection
{
  return self->commandDirection;
}

- (void)setCommandDirection:(unint64_t)a3
{
  self->commandDirection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->userInfo, 0);
}

@end
