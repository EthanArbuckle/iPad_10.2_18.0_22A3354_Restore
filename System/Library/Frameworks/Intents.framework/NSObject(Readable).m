@implementation NSObject(Readable)

- (uint64_t)_intents_readableTitleWithLocalizer:()Readable
{
  return objc_msgSend(a1, "_intents_readableTitleWithLocalizer:metadata:", a3, 0);
}

- (id)_intents_readableTitleWithLocalizer:()Readable metadata:
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "performSelector:withObject:", sel_descriptionWithLocale_, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (uint64_t)_intents_readableSubtitleWithLocalizer:()Readable
{
  return objc_msgSend(a1, "_intents_readableSubtitleWithLocalizer:metadata:", a3, 0);
}

- (uint64_t)_intents_readableSubtitleWithLocalizer:()Readable metadata:
{
  return 0;
}

- (uint64_t)_intents_displayImageWithLocalizer:()Readable
{
  return 0;
}

- (id)_intents_localizedCopyWithLocalizer:()Readable
{
  id v2;

  if (objc_msgSend(a1, "conformsToProtocol:", &unk_1EE039048))
    v2 = (id)objc_msgSend(a1, "copy");
  else
    v2 = a1;
  return v2;
}

- (uint64_t)_intents_readableTitleForLanguage:()Readable
{
  return objc_msgSend(a1, "_intents_readableTitleForLanguage:withMetadata:", a3, 0);
}

- (id)_intents_readableTitleForLanguage:()Readable withMetadata:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_intents_readableTitleWithLocalizer:metadata:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (uint64_t)_intents_readableSubtitleForLanguage:()Readable
{
  return objc_msgSend(a1, "_intents_readableSubtitleForLanguage:withMetadata:", a3, 0);
}

- (id)_intents_readableSubtitleForLanguage:()Readable withMetadata:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_intents_readableSubtitleWithLocalizer:metadata:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_intents_displayImageForLanguage:()Readable
{
  void *v2;
  void *v3;

  +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_intents_displayImageWithLocalizer:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_intents_localizedCopyForLanguage:()Readable
{
  void *v2;
  void *v3;

  +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_intents_localizedCopyWithLocalizer:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
