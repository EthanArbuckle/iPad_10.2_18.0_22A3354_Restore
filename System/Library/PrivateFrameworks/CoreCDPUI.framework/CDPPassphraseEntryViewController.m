@implementation CDPPassphraseEntryViewController

- (CDPPassphraseEntryViewController)init
{
  CDPPassphraseEntryViewController *v2;
  CDPPassphraseEntryViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CDPPassphraseEntryViewController;
  v2 = -[DevicePINController init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[DevicePINController setMode:](v2, "setMode:", 3);
    -[DevicePINController setShouldDismissWhenDone:](v3, "setShouldDismissWhenDone:", 0);
    objc_msgSend(MEMORY[0x24BE75530], "appearance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextColor:", v5);

    objc_msgSend(MEMORY[0x24BE75530], "appearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

  }
  return v3;
}

- (id)stringsBundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

- (BOOL)showSimplePINCancelButtonOnLeft
{
  return 1;
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

@end
