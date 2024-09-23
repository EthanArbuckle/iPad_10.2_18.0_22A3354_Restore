@implementation CoreGraphicsContext

+ (CoreGraphicsContext)current
{
  return *(CoreGraphicsContext **)_current();
}

- (CoreGraphicsContext)initWithCGContext:(CGContext *)a3
{
  CoreGraphicsContext *result;
  objc_super v6;

  if (_once != -1)
    dispatch_once(&_once, &__block_literal_global_5);
  v6.receiver = self;
  v6.super_class = (Class)CoreGraphicsContext;
  result = -[CoreGraphicsContext init](&v6, sel_init);
  if (result)
    result->_ctx = a3;
  return result;
}

id __41__CoreGraphicsContext_initWithCGContext___block_invoke()
{
  Class v0;
  Class v1;
  id result;

  v0 = NSClassFromString(CFSTR("UIGraphicsRenderer"));
  if (!v0)
    return +[CoreTextGraphicsContextProvider sharedProvider](CoreTextGraphicsContextProvider, "sharedProvider");
  v1 = v0;
  _pushContextIMP = (uint64_t (*)(_QWORD, _QWORD))-[objc_class instanceMethodForSelector:](v0, "instanceMethodForSelector:", sel_pushContext_);
  result = (id)-[objc_class instanceMethodForSelector:](v1, "instanceMethodForSelector:", sel_popContext_);
  _popContextIMP = (uint64_t (*)(_QWORD, _QWORD))result;
  return result;
}

- (void)push
{
  _QWORD *v2;
  uint64_t v3;
  BOOL v4;

  v2 = (_QWORD *)_current();
  *(_QWORD *)(v3 + 8) = *v2;
  *v2 = v3;
  if (_pushContextIMP)
    v4 = _popContextIMP == 0;
  else
    v4 = 1;
  if (!v4)
    _pushContextIMP(0, sel_pushContext_);
}

- (void)pop
{
  _QWORD *v2;
  uint64_t v3;
  BOOL v4;

  v2 = (_QWORD *)_current();
  *v2 = v3;
  if (_pushContextIMP)
    v4 = _popContextIMP == 0;
  else
    v4 = 1;
  if (!v4)
    _popContextIMP(0, sel_popContext_);
}

- (BOOL)__createsImages
{
  return 0;
}

- (CGContext)CGContext
{
  return self->_ctx;
}

@end
