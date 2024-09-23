@implementation CalCalendarLocalAccountInfo

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  return (id)sharedInstance_sharedInstance;
}

void __45__CalCalendarLocalAccountInfo_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

- (BOOL)addressIsAccountOwner:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "stringRemovingMailto");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0C298], "defaultProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "matchesOneOfMyEmails:", v3);

  return v5;
}

- (BOOL)addressURLIsAccountOwner:(id)a3
{
  void *v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CalCalendarLocalAccountInfo addressIsAccountOwner:](self, "addressIsAccountOwner:", v4);

  return (char)self;
}

@end
