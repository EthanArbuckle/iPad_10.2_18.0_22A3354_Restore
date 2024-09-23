@implementation ISDimmedDarkEffect

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0C9DDF8];
  v5 = a3;
  objc_msgSend(v4, "vectorWithX:Y:Z:W:", 0.5, 0.0, 0.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.5, 0.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.5, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.1, 0.1, 0.1, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIColorMatrix"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v6, CFSTR("inputRVector"));
  objc_msgSend(v11, "setValue:forKey:", v7, CFSTR("inputGVector"));
  objc_msgSend(v11, "setValue:forKey:", v8, CFSTR("inputBVector"));
  objc_msgSend(v11, "setValue:forKey:", v9, CFSTR("inputAVector"));
  objc_msgSend(v11, "setValue:forKey:", v10, CFSTR("inputBiasVector"));
  objc_msgSend(v11, "setValue:forKey:", v5, *MEMORY[0x1E0C9E1F8]);

  return v11;
}

@end
