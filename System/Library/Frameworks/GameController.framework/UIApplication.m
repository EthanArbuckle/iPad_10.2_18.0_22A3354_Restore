@implementation UIApplication

- (id)_gameControllerApplicationComponent
{
  if (a1)
  {
    if (_gameControllerApplicationComponent_onceToken != -1)
      dispatch_once(&_gameControllerApplicationComponent_onceToken, &__block_literal_global_42);
    a1 = (id)_gameControllerApplicationComponent_Component;
  }
  return a1;
}

void __88__UIApplication_GameControllerApplicationComponent___gameControllerApplicationComponent__block_invoke()
{
  _GCApplicationComponent *v0;
  void *v1;
  objc_super v2;

  v0 = [_GCApplicationComponent alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)_GCApplicationComponent;
    v0 = (_GCApplicationComponent *)objc_msgSendSuper2(&v2, sel_init);
  }
  v1 = (void *)_gameControllerApplicationComponent_Component;
  _gameControllerApplicationComponent_Component = (uint64_t)v0;

}

@end
