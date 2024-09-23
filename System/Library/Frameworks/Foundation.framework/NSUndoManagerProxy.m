@implementation NSUndoManagerProxy

- (NSUndoManagerProxy)initWithManager:(id)a3
{
  self->_manager = (NSUndoManager *)a3;
  return self;
}

- (void)setTargetClass:(Class)a3
{
  self->_targetClass = a3;
}

- (NSUndoManagerProxy)retain
{
  NSUndoManager *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = self->_manager;
  v5.receiver = self;
  v5.super_class = (Class)NSUndoManagerProxy;
  return -[NSProxy retain](&v5, sel_retain);
}

- (BOOL)_tryRetain
{
  _BOOL4 v3;
  NSUndoManager *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSUndoManagerProxy;
  v3 = -[NSProxy _tryRetain](&v6, sel__tryRetain);
  if (v3)
    v4 = self->_manager;
  return v3;
}

- (void)release
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSUndoManagerProxy;
  -[NSProxy release](&v3, sel_release);
}

- (void)superRelease
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = self;
  v2.super_class = (Class)NSUndoManagerProxy;
  -[NSProxy release](&v2, sel_release);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return -[NSUndoManager _methodSignatureForTargetSelector:](self->_manager, "_methodSignatureForTargetSelector:", a3);
}

- (void)forwardInvocation:(id)a3
{
  -[NSUndoManager _forwardTargetInvocation:](self->_manager, "_forwardTargetInvocation:", a3);
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_class *targetClass;
  BOOL v4;

  targetClass = self->_targetClass;
  v4 = targetClass != 0;
  if (targetClass != a3 && targetClass != 0)
  {
    do
    {
      targetClass = class_getSuperclass(targetClass);
      v4 = targetClass != 0;
    }
    while (targetClass != a3 && targetClass);
  }
  return v4;
}

@end
