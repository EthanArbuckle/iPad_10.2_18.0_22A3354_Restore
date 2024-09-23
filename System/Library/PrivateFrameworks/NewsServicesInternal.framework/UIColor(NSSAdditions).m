@implementation UIColor(NSSAdditions)

+ (id)nss_dynamicColor:()NSSAdditions withDarkStyleVariant:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CEAB40];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "traitCollectionWithUserInterfaceStyle:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = v9;
  v14[0] = v7;
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "_dynamicColorWithColorsByTraitCollection:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
