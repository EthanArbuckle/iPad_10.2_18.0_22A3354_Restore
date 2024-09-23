@implementation ECAPOPAuthScheme

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
  v7.super_class = (Class)&OBJC_METACLASS___ECAPOPAuthScheme;
  return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

+ (ECAPOPAuthScheme)apopAuthScheme
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__ECAPOPAuthScheme_apopAuthScheme__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (apopAuthScheme_predicate != -1)
    dispatch_once(&apopAuthScheme_predicate, block);
  return (ECAPOPAuthScheme *)(id)apopAuthScheme_sharedInstance;
}

void __34__ECAPOPAuthScheme_apopAuthScheme__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___ECAPOPAuthScheme;
  v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_allocWithZone_, 0), "init");
  v2 = (void *)apopAuthScheme_sharedInstance;
  apopAuthScheme_sharedInstance = v1;

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
  v5.super_class = (Class)ECAPOPAuthScheme;
  -[ECAPOPAuthScheme dealloc](&v5, sel_dealloc);
}

- (id)name
{
  return CFSTR("X-APOP");
}

- (id)humanReadableName
{
  return (id)_EFLocalizedString();
}

- (unsigned)applescriptScheme
{
  return 1633775727;
}

@end
