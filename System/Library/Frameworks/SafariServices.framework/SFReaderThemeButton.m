@implementation SFReaderThemeButton

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if ((SFShouldHandleSelectionForPresses() & 1) != 0)
  {
    -[SFReaderThemeButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x2000);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SFReaderThemeButton;
    -[SFReaderThemeButton pressesBegan:withEvent:](&v8, sel_pressesBegan_withEvent_, v6, v7);
  }

}

- (id)focusEffect
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0DC37D8];
  v3 = (void *)MEMORY[0x1E0DC3508];
  -[SFReaderThemeButton bounds](self, "bounds");
  objc_msgSend(v3, "bezierPathWithOvalInRect:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
