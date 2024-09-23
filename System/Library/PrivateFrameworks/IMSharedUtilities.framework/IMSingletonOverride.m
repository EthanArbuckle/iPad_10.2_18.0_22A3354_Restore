@implementation IMSingletonOverride

- (void)didOverrideSingleton:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_setOverriddenSingleton_);
}

- (BOOL)shouldInvokeSelector:(SEL)a3 onSingleton:(id)a4
{
  return 1;
}

- (id)overriddenSingleton
{
  return objc_loadWeakRetained(&self->_overriddenSingleton);
}

- (void)setOverriddenSingleton:(id)a3
{
  objc_storeWeak(&self->_overriddenSingleton, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_overriddenSingleton);
}

@end
