@implementation MFMailMenuCommand

- (int64_t)menu
{
  return self->_menu;
}

- (UICommand)command
{
  return self->_command;
}

+ (id)shortcutWithInput:(id)a3 flags:(int64_t)a4 repeatable:(BOOL)a5 menu:(int64_t)a6 action:(SEL)a7
{
  objc_msgSend(a1, "shortcutWithInput:flags:repeatable:menu:action:title:plist:", a3, a4, a5, a6, a7, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)shortcutWithInput:(id)a3 flags:(int64_t)a4 repeatable:(BOOL)a5 menu:(int64_t)a6 action:(SEL)a7 title:(id)a8 plist:(id)a9
{
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v14 = a8;
  objc_msgSend(MEMORY[0x1E0DC3930], "commandWithTitle:image:action:input:modifierFlags:propertyList:", v14, 0, a7, a3, a4, a9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDiscoverabilityTitle:", v14);
  if (!a5)
  {
    objc_msgSend(v15, "_nonRepeatableKeyCommand");
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  +[MFMailMenuCommand shortcutWithCommand:menu:](MFMailMenuCommand, "shortcutWithCommand:menu:", v15, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)shortcutWithCommand:(id)a3 menu:(int64_t)a4
{
  id v5;
  MFMailMenuCommand *v6;

  v5 = a3;
  v6 = -[MFMailMenuCommand initWithCommand:menu:]([MFMailMenuCommand alloc], "initWithCommand:menu:", v5, a4);

  return v6;
}

- (MFMailMenuCommand)initWithCommand:(id)a3 menu:(int64_t)a4
{
  id v7;
  MFMailMenuCommand *v8;
  MFMailMenuCommand *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFMailMenuCommand;
  v8 = -[MFMailMenuCommand init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_command, a3);
    v9->_menu = a4;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_command, 0);
}

@end
