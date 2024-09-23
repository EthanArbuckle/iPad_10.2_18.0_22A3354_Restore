@implementation AVZoomingBehavior

+ (Class)behaviorContextClass
{
  return (Class)objc_opt_class();
}

- (AVZoomingBehaviorContext)behaviorContext
{
  return (AVZoomingBehaviorContext *)objc_loadWeakRetained((id *)&self->_behaviorContext);
}

- (void)setBehaviorContext:(id)a3
{
  objc_storeWeak((id *)&self->_behaviorContext, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_behaviorContext);
}

@end
