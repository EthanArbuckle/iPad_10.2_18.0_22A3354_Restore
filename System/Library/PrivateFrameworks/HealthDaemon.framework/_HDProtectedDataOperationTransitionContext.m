@implementation _HDProtectedDataOperationTransitionContext

- (_HDProtectedDataOperationTransitionContext)initWithOldState:(int64_t)a3 newState:(int64_t)a4
{
  _HDProtectedDataOperationTransitionContext *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_HDProtectedDataOperationTransitionContext;
  result = -[_HDProtectedDataOperationTransitionContext init](&v7, sel_init);
  if (result)
  {
    result->_oldState = a3;
    result->_newState = a4;
  }
  return result;
}

- (id)copyWithNewState:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOldState:newState:", self->_oldState, a3);
}

- (BOOL)hasNewState
{
  return self->_newState != 0;
}

- (unint64_t)hash
{
  return self->_newState ^ self->_oldState;
}

- (BOOL)isEqual:(id)a3
{
  _HDProtectedDataOperationTransitionContext *v4;
  BOOL v5;

  v4 = (_HDProtectedDataOperationTransitionContext *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_oldState == v4->_oldState && self->_newState == v4->_newState;
  }

  return v5;
}

- (int64_t)oldState
{
  return self->_oldState;
}

- (int64_t)newState
{
  return self->_newState;
}

@end
