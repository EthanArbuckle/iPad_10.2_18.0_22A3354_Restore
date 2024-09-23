@implementation IKPlayerShouldHandleStateChangeEventUserInfo

- (IKPlayerShouldHandleStateChangeEventUserInfo)initWithState:(int64_t)a3
{
  return -[IKPlayerShouldHandleStateChangeEventUserInfo initWithState:requestedTime:](self, "initWithState:requestedTime:", a3, 0.0);
}

- (IKPlayerShouldHandleStateChangeEventUserInfo)initWithState:(int64_t)a3 oldState:(int64_t)a4
{
  return -[IKPlayerShouldHandleStateChangeEventUserInfo initWithState:oldState:requestedTime:](self, "initWithState:oldState:requestedTime:", a3, a4, 0.0);
}

- (IKPlayerShouldHandleStateChangeEventUserInfo)initWithState:(int64_t)a3 requestedTime:(double)a4
{
  IKPlayerShouldHandleStateChangeEventUserInfo *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IKPlayerShouldHandleStateChangeEventUserInfo;
  result = -[IKPlayerStateChangeEventUserInfo initWithState:](&v6, sel_initWithState_, a3);
  if (result)
  {
    result->_shouldHandle = 1;
    result->_requestedTime = a4;
    result->_proposedTime = a4;
  }
  return result;
}

- (IKPlayerShouldHandleStateChangeEventUserInfo)initWithState:(int64_t)a3 oldState:(int64_t)a4 requestedTime:(double)a5
{
  IKPlayerShouldHandleStateChangeEventUserInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IKPlayerShouldHandleStateChangeEventUserInfo;
  result = -[IKPlayerStateChangeEventUserInfo initWithState:oldState:](&v7, sel_initWithState_oldState_, a3, a4);
  if (result)
  {
    result->_shouldHandle = 1;
    result->_requestedTime = a5;
    result->_proposedTime = a5;
  }
  return result;
}

- (void)processReturnJSValue:(id)a3 inContext:(id)a4
{
  void *v5;
  double v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isNull"))
  {
    self->_shouldHandle = 0;
  }
  else if (objc_msgSend(v7, "isBoolean"))
  {
    self->_shouldHandle = objc_msgSend(v7, "toBool");
  }
  else if (objc_msgSend(v7, "isNumber"))
  {
    objc_msgSend(v7, "toNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    self->_proposedTime = v6;

  }
}

- (double)requestedTime
{
  return self->_requestedTime;
}

- (BOOL)shouldHandle
{
  return self->_shouldHandle;
}

- (double)proposedTime
{
  return self->_proposedTime;
}

@end
