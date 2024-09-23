@implementation CCUIContentModulePresentationContext

- (int64_t)environment
{
  return self->_environment;
}

+ (id)defaultControlCenterPresentationContext
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__CCUIContentModulePresentationContext_defaultControlCenterPresentationContext__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultControlCenterPresentationContext_onceToken != -1)
    dispatch_once(&defaultControlCenterPresentationContext_onceToken, block);
  return (id)defaultControlCenterPresentationContext_defaultControlCenterPresentationContext;
}

void __79__CCUIContentModulePresentationContext_defaultControlCenterPresentationContext__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithEnvironment:", 0);
  v2 = (void *)defaultControlCenterPresentationContext_defaultControlCenterPresentationContext;
  defaultControlCenterPresentationContext_defaultControlCenterPresentationContext = v1;

}

+ (id)defaultControlCenterPresentationContextProtectingSensitiveUI
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__CCUIContentModulePresentationContext_defaultControlCenterPresentationContextProtectingSensitiveUI__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultControlCenterPresentationContextProtectingSensitiveUI_onceToken != -1)
    dispatch_once(&defaultControlCenterPresentationContextProtectingSensitiveUI_onceToken, block);
  return (id)defaultControlCenterPresentationContextProtectingSensitiveUI_defaultControlCenterPresentationContextProtectingSensitiveUI;
}

void __100__CCUIContentModulePresentationContext_defaultControlCenterPresentationContextProtectingSensitiveUI__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithEnvironment:", 1);
  v2 = (void *)defaultControlCenterPresentationContextProtectingSensitiveUI_defaultControlCenterPresentationContextProtectingSensitiveUI;
  defaultControlCenterPresentationContextProtectingSensitiveUI_defaultControlCenterPresentationContextProtectingSensitiveUI = v1;

}

+ (id)defaultAlertPresentationContext
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__CCUIContentModulePresentationContext_defaultAlertPresentationContext__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultAlertPresentationContext_onceToken[0] != -1)
    dispatch_once(defaultAlertPresentationContext_onceToken, block);
  return (id)defaultAlertPresentationContext_defaultTransientOverlayPresentationContext;
}

void __71__CCUIContentModulePresentationContext_defaultAlertPresentationContext__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithEnvironment:", 2);
  v2 = (void *)defaultAlertPresentationContext_defaultTransientOverlayPresentationContext;
  defaultAlertPresentationContext_defaultTransientOverlayPresentationContext = v1;

}

- (CCUIContentModulePresentationContext)initWithEnvironment:(int64_t)a3
{
  CCUIContentModulePresentationContext *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIContentModulePresentationContext;
  result = -[CCUIContentModulePresentationContext init](&v5, sel_init);
  if (result)
    result->_environment = a3;
  return result;
}

- (unint64_t)hash
{
  return self->_environment;
}

@end
