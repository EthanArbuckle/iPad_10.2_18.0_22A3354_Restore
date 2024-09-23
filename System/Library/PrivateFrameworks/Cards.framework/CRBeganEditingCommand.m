@implementation CRBeganEditingCommand

- (id)copyWithZone:(_NSZone *)a3
{
  CRBeganEditingCommand *v5;
  void *v6;
  void *v7;

  v5 = objc_alloc_init(CRBeganEditingCommand);
  -[CRBeganEditingCommand userInfo](self, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[CRBeganEditingCommand setUserInfo:](v5, "setUserInfo:", v7);

  -[CRBeganEditingCommand setCommandDirection:](v5, "setCommandDirection:", -[CRBeganEditingCommand commandDirection](self, "commandDirection"));
  return v5;
}

- (unint64_t)commandDirection
{
  if (self->_commandDirection)
    return self->_commandDirection;
  else
    return 2;
}

- (void)setCommandDirection:(unint64_t)a3
{
  self->_commandDirection = a3;
}

- (NSDictionary)userInfo
{
  return self->userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->userInfo, 0);
}

@end
