@implementation AXUINSBundleOverride

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSBundle");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)infoDictionary
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXUINSBundleOverride;
  -[AXUINSBundleOverride infoDictionary](&v8, sel_infoDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (mainBundleFakesSystemExtension)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXUINSBundleOverride isEqual:](self, "isEqual:", v4);

    if (v5)
    {
      v6 = (void *)objc_msgSend(v3, "mutableCopy");
      objc_msgSend(v6, "setObject:forKey:", &unk_24D4A1F68, CFSTR("NSExtension"));

      v3 = v6;
    }
  }
  return v3;
}

@end
