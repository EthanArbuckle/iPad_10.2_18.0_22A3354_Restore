@implementation ECAppleToken2AuthScheme

+ (id)allocWithZone:(_NSZone *)a3
{
  id v6;
  objc_super v7;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot directly allocate a %@ object, use +sharedInstance instead."), a1);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], objc_claimAutoreleasedReturnValue(), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___ECAppleToken2AuthScheme;
  return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

+ (ECAppleToken2AuthScheme)appleToken2AuthScheme
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ECAppleToken2AuthScheme_appleToken2AuthScheme__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (appleToken2AuthScheme_predicate != -1)
    dispatch_once(&appleToken2AuthScheme_predicate, block);
  return (ECAppleToken2AuthScheme *)(id)appleToken2AuthScheme_sharedInstance;
}

void __48__ECAppleToken2AuthScheme_appleToken2AuthScheme__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___ECAppleToken2AuthScheme;
  v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_allocWithZone_, 0), "init");
  v2 = (void *)appleToken2AuthScheme_sharedInstance;
  appleToken2AuthScheme_sharedInstance = v1;

}

- (void)dealloc
{
  uint64_t v3;
  id v4;
  objc_super v5;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot deallocate a %@ object."), objc_opt_class());
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], objc_claimAutoreleasedReturnValue(), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)ECAppleToken2AuthScheme;
  -[ECAppleToken2AuthScheme dealloc](&v5, sel_dealloc);
}

- (id)name
{
  return CFSTR("ATOKEN2");
}

- (id)humanReadableName
{
  return 0;
}

- (unsigned)applescriptScheme
{
  return 1635020594;
}

- (BOOL)requiresUsername
{
  return 0;
}

- (BOOL)requiresPassword
{
  return 0;
}

- (id)supportedSASLMechanisms
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("ATOKEN2"));
}

@end
