@implementation CertInfoActionButton

void __53___CertInfoActionButton_initWithTitle_isDestructive___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("InstallButton"), v12);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stretchableImageWithLeftCapWidth:topCapHeight:", 3, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_installButtonImage;
  _installButtonImage = v1;

  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("InstallButtonPressed"), v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stretchableImageWithLeftCapWidth:topCapHeight:", 3, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_installButtonPressedImage;
  _installButtonPressedImage = v4;

  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("RemoveButton"), v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stretchableImageWithLeftCapWidth:topCapHeight:", 3, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_removeButtonImage;
  _removeButtonImage = v7;

  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("RemoveButtonPressed"), v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stretchableImageWithLeftCapWidth:topCapHeight:", 3, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_removeButtonPressedImage;
  _removeButtonPressedImage = v10;

}

@end
