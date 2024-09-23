@implementation ISTemplateEffect

- (ISTemplateEffect)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISTemplateEffect;
  return -[ISTemplateEffect init](&v3, sel_init);
}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIAreaMinimumAlpha"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C9E1F8];
  objc_msgSend(v5, "setValue:forKey:", v4, *MEMORY[0x1E0C9E1F8]);
  v7 = (void *)MEMORY[0x1E0C9DDF8];
  objc_msgSend(v4, "extent");
  objc_msgSend(v7, "vectorWithCGRect:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v8, *MEMORY[0x1E0C9E1F0]);

  v17 = 0;
  objc_msgSend(MEMORY[0x1E0C9DD90], "_IS_sharedIconCompositorContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v10, &v17, 4, *MEMORY[0x1E0C9E070], 0, 0.0, 0.0, 1.0, 1.0);

  if (HIBYTE(v17))
  {
    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIMaskToAlpha"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", v4, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D3A7A0], "white");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIConstantColorGenerator"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ciColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forKey:", v13, *MEMORY[0x1E0C9E1C0]);

    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CISourceInCompositing"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "outputImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", v15, v6);

    objc_msgSend(v14, "setValue:forKey:", v4, *MEMORY[0x1E0C9E190]);
  }

  return v14;
}

@end
