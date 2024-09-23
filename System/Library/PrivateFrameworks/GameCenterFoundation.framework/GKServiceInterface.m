@implementation GKServiceInterface

+ (id)interface
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "interfaceProtocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "configureInterface:", v4);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)plistClasses
{
  if (plistClasses_onceToken != -1)
    dispatch_once(&plistClasses_onceToken, &__block_literal_global_20);
  return (id)plistClasses_sPlistClasses;
}

void __34__GKServiceInterface_plistClasses__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v10 = (void *)plistClasses_sPlistClasses;
  plistClasses_sPlistClasses = v9;

}

+ (id)interfaceProtocol
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Concrete subclasses must override +[GKServer interfaceProtocol]."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKServiceInterface.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v3, "+[GKServiceInterface interfaceProtocol]", objc_msgSend(v5, "UTF8String"), 48);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v6);
  return 0;
}

@end
