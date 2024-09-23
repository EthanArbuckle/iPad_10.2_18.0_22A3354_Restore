@implementation NSString(_INIntentsImpl)

- (id)intents_encodeForPlistRepresentationWithParameters:()_INIntentsImpl
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "widgetPlistableRepresentationWithParameters:error:", v4, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = a1;
  }
  v6 = v5;

  return v6;
}

+ (id)intents_makeFromWidgetPlistableRepresentation:()_INIntentsImpl
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "copy");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    +[INDeferredLocalizedString makeFromWidgetPlistableRepresentation:error:](INDeferredLocalizedString, "makeFromWidgetPlistableRepresentation:error:", v3, 0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_7:

  return v5;
}

@end
