@implementation AVAppStoreBehavior

- (void)setBehaviorContext:(id)a3
{
  objc_storeWeak((id *)&self->_behaviorContext, a3);
}

+ (Class)behaviorContextClass
{
  return (Class)objc_opt_class();
}

+ (AVAppStoreBehavior)behaviorWithFirstGenerationEmbeddedPlayer
{
  AVAppStoreBehavior *v2;

  v2 = objc_alloc_init(AVAppStoreBehavior);
  v2->_prefersFirstGenerationControlsWhenEmbeddedInline = 1;
  return v2;
}

- (void)willMoveToContext:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[AVAppStoreBehavior prefersFirstGenerationControlsWhenEmbeddedInline](self, "prefersFirstGenerationControlsWhenEmbeddedInline"))
  {
    objc_msgSend(v5, "playerViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setControlsGeneration:", 0);

  }
}

- (BOOL)prefersFirstGenerationControlsWhenEmbeddedInline
{
  return self->_prefersFirstGenerationControlsWhenEmbeddedInline;
}

- (AVAppStoreBehaviorContext)behaviorContext
{
  return (AVAppStoreBehaviorContext *)objc_loadWeakRetained((id *)&self->_behaviorContext);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_behaviorContext);
}

@end
