@implementation AXPIOSPlatformElement

+ (id)platformElementWithTranslationObject:(id)a3 rootParent:(id)a4
{
  id v5;
  id v6;
  AXPIOSPlatformElement *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[AXPIOSPlatformElement initWithAccessibilityContainer:]([AXPIOSPlatformElement alloc], "initWithAccessibilityContainer:", v5);

  -[AXPIOSPlatformElement setTranslation:](v7, "setTranslation:", v6);
  return v7;
}

+ (id)platformElementWithTranslationObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[AXPTranslator_iOS sharedInstance](AXPTranslator_iOS, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iosPlatformElementFromTranslation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "platformElementWithTranslationObject:rootParent:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (AXPTranslationObject)translation
{
  return self->translation;
}

- (void)setTranslation:(id)a3
{
  objc_storeStrong((id *)&self->translation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->translation, 0);
}

@end
