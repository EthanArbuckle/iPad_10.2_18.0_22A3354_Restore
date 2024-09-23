@implementation AVEditBehavior

+ (Class)behaviorContextClass
{
  return (Class)objc_opt_class();
}

- (AVEditBehaviorContext)behaviorContext
{
  return (AVEditBehaviorContext *)objc_loadWeakRetained((id *)&self->_behaviorContext);
}

- (void)setBehaviorContext:(id)a3
{
  objc_storeWeak((id *)&self->_behaviorContext, a3);
}

- (AVEditBehaviorDelegate)delegate
{
  return (AVEditBehaviorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_behaviorContext);
}

@end
