@implementation ISLegibilityEffect

- (ISLegibilityEffect)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISLegibilityEffect;
  return -[ISLegibilityEffect init](&v3, sel_init);
}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;

  v5 = (objc_class *)MEMORY[0x1E0D3A7A0];
  v32 = a4;
  v31 = a3;
  v6 = (void *)objc_msgSend([v5 alloc], "initWithWhite:alpha:", 1.0, 1.0);
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIConstantColorGenerator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ciColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C9E1C0];
  objc_msgSend(v7, "setValue:forKey:", v8, *MEMORY[0x1E0C9E1C0]);

  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIDifferenceBlendMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "outputImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0C9E1F8];
  objc_msgSend(v10, "setValue:forKey:", v11, *MEMORY[0x1E0C9E1F8]);

  v13 = *MEMORY[0x1E0C9E190];
  objc_msgSend(v10, "setValue:forKey:", v31, *MEMORY[0x1E0C9E190]);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithWhite:alpha:", 1.0, 0.25);
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIConstantColorGenerator"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ciColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setValue:forKey:", v16, v9);

  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CISourceOverCompositing"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "outputImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValue:forKey:", v18, v12);

  objc_msgSend(v10, "outputImage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValue:forKey:", v19, v13);

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithWhite:alpha:", 0.0, 0.43);
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIConstantColorGenerator"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ciColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setValue:forKey:", v22, v9);

  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIMultiplyBlendMode"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "outputImage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setValue:forKey:", v24, v12);

  objc_msgSend(v17, "outputImage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setValue:forKey:", v25, v13);

  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIColorBlendMode"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setValue:forKey:", v31, v12);

  objc_msgSend(v23, "outputImage");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setValue:forKey:", v27, v13);

  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CISourceInCompositing"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "outputImage");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setValue:forKey:", v29, v12);

  objc_msgSend(v28, "setValue:forKey:", v32, v13);
  return v28;
}

@end
