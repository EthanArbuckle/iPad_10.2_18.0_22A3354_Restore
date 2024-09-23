@implementation MCUIApplicationCell

- (void)setApplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[MCUIApplicationCell setAccessoryType:](self, "setAccessoryType:", 0);
  -[MCUIApplicationCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  objc_msgSend(MEMORY[0x1E0CEA718], "valueCellConfiguration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v5);

  objc_msgSend(v4, "iconForVariant:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v6);

  objc_msgSend(v4, "misStateString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setSecondaryText:", v7);
  -[MCUIApplicationCell setContentConfiguration:](self, "setContentConfiguration:", v8);

}

@end
