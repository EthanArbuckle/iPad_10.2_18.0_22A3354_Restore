@implementation SizeContext

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_55);
  return (id)sharedInstance_sharedInstance_0;
}

- (id)viewHierarchyForCurrentContext
{
  void *v4;
  void *v5;

  if (-[NSMutableArray count](self->_windowContextStack, "count"))
  {
    -[NSMutableArray lastObject](self->_windowContextStack, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (_shouldAssertOnUnknownWindow_onceToken != -1)
      dispatch_once(&_shouldAssertOnUnknownWindow_onceToken, &__block_literal_global_39);
    if (_shouldAssertOnUnknownWindow_shouldAssert)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKUIDeviceCapabilities.m"), 202, CFSTR("Multiple windows exist, and we do not have a view hierarchy from which to derive the current sizing context."));

      v4 = 0;
    }
    else
    {
      EKUIMainWindowForMultiwindowError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v4;
}

- (BOOL)hasViewHierarchyForCurrentContext
{
  if (_shouldAssertOnUnknownWindow_onceToken != -1)
    dispatch_once(&_shouldAssertOnUnknownWindow_onceToken, &__block_literal_global_39);
  return !_shouldAssertOnUnknownWindow_shouldAssert || -[NSMutableArray count](self->_windowContextStack, "count") != 0;
}

- (void)pushContextWithViewHierarchy:(id)a3
{
  -[NSMutableArray addObject:](self->_windowContextStack, "addObject:", a3);
}

- (void)popContextFromViewHierarchy:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  if (_shouldAssertOnUnknownWindow_onceToken != -1)
    dispatch_once(&_shouldAssertOnUnknownWindow_onceToken, &__block_literal_global_39);
  if (_shouldAssertOnUnknownWindow_shouldAssert)
  {
    -[NSMutableArray lastObject](self->_windowContextStack, "lastObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 != v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKUIDeviceCapabilities.m"), 187, CFSTR("Attempting to pop an object that's not on top of the stack."));

    }
  }
  -[NSMutableArray removeLastObject](self->_windowContextStack, "removeLastObject");

}

void __29__SizeContext_sharedInstance__block_invoke()
{
  SizeContext *v0;
  void *v1;

  v0 = objc_alloc_init(SizeContext);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

- (SizeContext)init
{
  SizeContext *v2;
  uint64_t v3;
  NSMutableArray *windowContextStack;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SizeContext;
  v2 = -[SizeContext init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v3 = objc_claimAutoreleasedReturnValue();
    windowContextStack = v2->_windowContextStack;
    v2->_windowContextStack = (NSMutableArray *)v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowContextStack, 0);
}

@end
