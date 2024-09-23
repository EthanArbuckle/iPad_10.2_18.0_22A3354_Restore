@implementation CRUpdateProgressCommand

- (CRUpdateProgressCommand)init
{
  CRUpdateProgressCommand *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRUpdateProgressCommand;
  result = -[CRUpdateProgressCommand init](&v3, sel_init);
  if (result)
    result->_animatesProgress = 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRUpdateProgressCommand *v5;
  void *v6;
  void *v7;

  v5 = objc_alloc_init(CRUpdateProgressCommand);
  -[CRUpdateProgressCommand userInfo](self, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[CRUpdateProgressCommand setUserInfo:](v5, "setUserInfo:", v7);

  -[CRUpdateProgressCommand setCommandDirection:](v5, "setCommandDirection:", -[CRUpdateProgressCommand commandDirection](self, "commandDirection"));
  return v5;
}

- (unint64_t)commandDirection
{
  return self->commandDirection;
}

- (void)setCommandDirection:(unint64_t)a3
{
  self->commandDirection = a3;
}

- (NSDictionary)userInfo
{
  return self->userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)event
{
  return self->_event;
}

- (void)setEvent:(unint64_t)a3
{
  self->_event = a3;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (BOOL)animatesProgress
{
  return self->_animatesProgress;
}

- (void)setAnimatesProgress:(BOOL)a3
{
  self->_animatesProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->userInfo, 0);
}

@end
