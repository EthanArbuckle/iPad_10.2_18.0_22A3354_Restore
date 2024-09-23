@implementation CoreTextGraphicsContextProvider

+ (id)sharedProvider
{
  if (sharedProvider_once != -1)
    dispatch_once(&sharedProvider_once, &__block_literal_global_23);
  return (id)sharedProvider_sharedPvdr;
}

uint64_t __49__CoreTextGraphicsContextProvider_sharedProvider__block_invoke()
{
  sharedProvider_sharedPvdr = objc_alloc_init(CoreTextGraphicsContextProvider);
  return objc_msgSend(MEMORY[0x24BEBB4D8], "setTextGraphicsContextProviderClass:", objc_opt_class());
}

+ (id)graphicsContextForApplicationFrameworkContext:(int64_t)a3
{
  return +[CoreTextGraphicsContextProvider sharedProvider](CoreTextGraphicsContextProvider, "sharedProvider", a3);
}

+ (Class)colorClassForApplicationFrameworkContext:(int64_t)a3
{
  return (Class)objc_opt_class();
}

- (BOOL)isFlipped
{
  return 1;
}

- (BOOL)isDrawingToScreen
{
  return 1;
}

- (CGContext)CGContext
{
  return -[CoreGraphicsContext CGContext](+[CoreGraphicsContext current](CoreGraphicsContext, "current"), "CGContext");
}

- (void)saveGraphicsState
{
  CGContext *v2;

  v2 = -[CoreGraphicsContext CGContext](+[CoreGraphicsContext current](CoreGraphicsContext, "current"), "CGContext");
  if (v2)
    CGContextSaveGState(v2);
}

- (void)restoreGraphicsState
{
  CGContext *v2;

  v2 = -[CoreGraphicsContext CGContext](+[CoreGraphicsContext current](CoreGraphicsContext, "current"), "CGContext");
  if (v2)
    CGContextRestoreGState(v2);
}

- (void)becomeCurrentGraphicsContextDuringBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

@end
