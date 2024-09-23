@implementation ODIGestaltHlpr

+ (id)getSharedInstance
{
  if (getSharedInstance_once != -1)
    dispatch_once(&getSharedInstance_once, &__block_literal_global);
  return (id)getSharedInstance_sharedInstance;
}

void __35__ODIGestaltHlpr_getSharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)getSharedInstance_sharedInstance;
  getSharedInstance_sharedInstance = v0;

}

- (BOOL)hasPKASupport
{
  id v2;
  char v3;

  v2 = -[ODIGestaltHlpr copyAnswer:](self, "copyAnswer:", CFSTR("HasPKA"));
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (id)copyAnswer:(__CFString *)a3
{
  if (a3)
    return (id)MGCopyAnswer();
  else
    return 0;
}

- (int64_t)sikaVersion
{
  id v3;
  id v4;
  int64_t v5;

  v3 = -[ODIGestaltHlpr copyAnswer:](self, "copyAnswer:", CFSTR("ssIPnsZyWHPGC5sg3Pzkiw"));
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v3, "BOOLValue"))
  {
    v4 = -[ODIGestaltHlpr copyAnswer:](self, "copyAnswer:", CFSTR("ssIPnsZyWHPGC5sg3Pzkiw"));
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("t8015")))
        v5 = 1;
      else
        v5 = 2;
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
