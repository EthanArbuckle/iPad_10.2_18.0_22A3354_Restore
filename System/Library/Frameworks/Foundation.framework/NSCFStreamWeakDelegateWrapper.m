@implementation NSCFStreamWeakDelegateWrapper

- (NSCFStreamWeakDelegateWrapper)initWithDelegate:(id)a3
{
  NSCFStreamWeakDelegateWrapper *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSCFStreamWeakDelegateWrapper;
  v3 = -[NSCFStreamWeakDelegateWrapper init](&v5, sel_init);
  if (v3)
    _NSObjectStoreWeak();
  return v3;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  _NSObjectStoreWeak();
  v3.receiver = self;
  v3.super_class = (Class)NSCFStreamWeakDelegateWrapper;
  -[NSCFStreamWeakDelegateWrapper dealloc](&v3, sel_dealloc);
}

- (id)retainedDelegate
{
  return (id)_NSObjectLoadWeakRetained();
}

@end
