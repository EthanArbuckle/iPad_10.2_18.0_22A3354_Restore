@implementation DDMessagesCustomAction

+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4
{
  char HasType;
  void *v5;

  HasType = (char)a4;
  if (a4)
  {
    +[DDDetectionController messagesActionHandler](DDDetectionController, "messagesActionHandler", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      HasType = DDResultHasType();
    else
      HasType = 0;

  }
  return HasType;
}

- (id)localizedName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  DDLocalizedString(CFSTR("Send %@"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v3, DDResultGetMatchedString());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)iconName
{
  return CFSTR("applepaycash");
}

- (void)performFromView:(id)a3
{
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self->super._result)
  {
    +[DDDetectionController messagesActionHandler](DDDetectionController, "messagesActionHandler", a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      if (DDResultHasType())
        DDResultCurrencyExtraction();
    }

  }
}

@end
