@implementation UIButtonConfiguration(ChatKitAdditions)

+ (uint64_t)ckCreateButtonConfigurationWithType:()ChatKitAdditions withTitle:
{
  return objc_msgSend(a1, "ckCreateButtonConfigurationWithType:withImage:withTitle:withFont:", a3, 0, a4, 0);
}

+ (uint64_t)ckCreateButtonConfigurationWithType:()ChatKitAdditions withTitle:withFont:
{
  return objc_msgSend(a1, "ckCreateButtonConfigurationWithType:withImage:withTitle:withFont:", a3, 0, a4, a5);
}

+ (uint64_t)ckCreateButtonConfigurationWithType:()ChatKitAdditions withImage:
{
  return objc_msgSend(a1, "ckCreateButtonConfigurationWithType:withImage:withTitle:withFont:", a3, a4, 0, 0);
}

+ (id)ckCreateButtonConfigurationWithType:()ChatKitAdditions withImage:withTitle:withFont:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CEA3A8], "plainButtonConfiguration");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      objc_msgSend(MEMORY[0x1E0CEA3A8], "grayButtonConfiguration");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      objc_msgSend(MEMORY[0x1E0CEA3A8], "tintedButtonConfiguration");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      objc_msgSend(MEMORY[0x1E0CEA3A8], "filledButtonConfiguration");
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v13 = (void *)v12;
      if (v9)
        goto LABEL_9;
      goto LABEL_10;
    default:
      v13 = 0;
      if (!v9)
        goto LABEL_10;
LABEL_9:
      objc_msgSend(v13, "setImage:", v9);
LABEL_10:
      if (v10)
      {
        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v11, *MEMORY[0x1E0DC1138]);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v10, v14);
          objc_msgSend(v13, "setAttributedTitle:", v15);

        }
        else
        {
          objc_msgSend(v13, "setTitle:", v10);
        }
      }

      return v13;
  }
}

@end
