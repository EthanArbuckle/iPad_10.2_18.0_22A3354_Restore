@implementation MFQuickReplySendAccessoryButton

+ (id)buttonWithType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___MFQuickReplySendAccessoryButton;
  objc_msgSendSuper2(&v11, sel_buttonWithType_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0DC3870], "mf_symbolConfigurationForView:", 24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemImageNamed:withConfiguration:", CFSTR("arrow.up.circle"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setImage:forState:", v6, 2);
  v7 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0DC3870], "mf_symbolConfigurationForView:", 14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemImageNamed:withConfiguration:", CFSTR("arrow.up.circle.fill"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setImage:forState:", v9, 0);
  return v3;
}

@end
