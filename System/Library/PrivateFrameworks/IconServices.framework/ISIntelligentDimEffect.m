@implementation ISIntelligentDimEffect

- (ISIntelligentDimEffect)init
{
  ISIntelligentDimEffect *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISIntelligentDimEffect;
  v2 = -[ISIntelligentDimEffect init](&v5, sel_init);
  if (v2)
  {
    +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_flagDimming = objc_msgSend(v3, "isFlagDimmedDedicatedAssetsEnabled");

  }
  return v2;
}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  ISDimmingConversion *v13;
  uint64_t v14;
  const void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1AF423108]();
  v9 = v7;
  +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isDarkIconDimmingEnabled");

  v12 = v9;
  if (v11)
  {
    v13 = -[ISDimmingConversion initWithCGImage:]([ISDimmingConversion alloc], "initWithCGImage:", objc_msgSend(v9, "CGImage"));
    v12 = v9;
    if (-[ISDimmingConversion isDimmable](v13, "isDimmable"))
    {
      v14 = -[ISDimmingConversion createDimmedImage](v13, "createDimmedImage");
      v12 = v9;
      if (v14)
      {
        v15 = (const void *)v14;
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCGImage:", v14);

        CFRelease(v15);
        if (-[ISIntelligentDimEffect flagDimming](self, "flagDimming"))
        {
          v16 = (void *)MEMORY[0x1E0C9DDC8];
          objc_msgSend(MEMORY[0x1E0C9DD80], "magentaColor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "imageWithColor:", v17);
          v18 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v18;
        }
      }
    }

  }
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CICrop"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0C9DDF8];
  objc_msgSend(v12, "extent");
  objc_msgSend(v20, "vectorWithCGRect:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setValue:forKey:", v21, CFSTR("inputRectangle"));

  objc_msgSend(v19, "setValue:forKey:", v12, *MEMORY[0x1E0C9E1F8]);
  objc_autoreleasePoolPop(v8);

  return v19;
}

- (BOOL)flagDimming
{
  return self->_flagDimming;
}

- (void)setFlagDimming:(BOOL)a3
{
  self->_flagDimming = a3;
}

@end
