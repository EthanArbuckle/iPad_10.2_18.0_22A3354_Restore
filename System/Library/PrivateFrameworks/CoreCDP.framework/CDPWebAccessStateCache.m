@implementation CDPWebAccessStateCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_7);
  return (id)sharedInstance_cache;
}

void __40__CDPWebAccessStateCache_sharedInstance__block_invoke()
{
  CDPWebAccessStateCache *v0;
  void *v1;

  v0 = objc_alloc_init(CDPWebAccessStateCache);
  v1 = (void *)sharedInstance_cache;
  sharedInstance_cache = (uint64_t)v0;

}

- (CDPWebAccessStateCache)init
{
  CDPWebAccessStateCache *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CDPWebAccessStateCache;
  v2 = -[CDPWebAccessStateCache init](&v4, sel_init);
  -[CDPWebAccessStateCache setWebAccessStatus:](v2, "setWebAccessStatus:", 0);
  return v2;
}

- (unint64_t)webAccessStatus
{
  return self->_webAccessStatus;
}

- (void)setWebAccessStatus:(unint64_t)a3
{
  self->_webAccessStatus = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

@end
