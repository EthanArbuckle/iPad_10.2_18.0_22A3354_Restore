@implementation AAUIDevicePINController

- (id)stringsBundle
{
  return (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
}

- (id)title
{
  void *v4;
  void *v5;
  objc_super v6;

  if (-[DevicePINController mode](self, "mode"))
  {
    v6.receiver = self;
    v6.super_class = (Class)AAUIDevicePINController;
    -[DevicePINController title](&v6, sel_title);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CREATE_PASSCODE_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
}

- (id)pinInstructionsPrompt
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  if (-[DevicePINController mode](self, "mode")
    || *(_DWORD *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80548]) != 1)
  {
    v7.receiver = self;
    v7.super_class = (Class)AAUIDevicePINController;
    -[DevicePINController pinInstructionsPrompt](&v7, sel_pinInstructionsPrompt);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "modelSpecificLocalizedStringKeyForKey:", CFSTR("CREATE_PASSCODE_BODY_UPGRADE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_1EA2E2A18, CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
}

- (BOOL)_asyncSetPinCompatible
{
  return 1;
}

@end
