@implementation ASCLockupProductDetailsPresentationContext

+ (ASCLockupProductDetailsPresentationContext)defaultPresentationContext
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__ASCLockupProductDetailsPresentationContext_defaultPresentationContext__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultPresentationContext_onceToken != -1)
    dispatch_once(&defaultPresentationContext_onceToken, block);
  return (ASCLockupProductDetailsPresentationContext *)(id)defaultPresentationContext_context;
}

void __72__ASCLockupProductDetailsPresentationContext_defaultPresentationContext__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithPresentationStyle:", 0);
  v2 = (void *)defaultPresentationContext_context;
  defaultPresentationContext_context = v1;

}

- (ASCLockupProductDetailsPresentationContext)initWithPresentationStyle:(int64_t)a3
{
  ASCLockupProductDetailsPresentationContext *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASCLockupProductDetailsPresentationContext;
  result = -[ASCLockupProductDetailsPresentationContext init](&v5, sel_init);
  if (result)
    result->_presentationStyle = a3;
  return result;
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

@end
