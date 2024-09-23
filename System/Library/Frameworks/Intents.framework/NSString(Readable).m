@implementation NSString(Readable)

- (id)_intents_readableTitleWithLocalizer:()Readable metadata:
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizeForLanguage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_intents_localizedCopyWithLocalizer:()Readable
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizeForLanguage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
