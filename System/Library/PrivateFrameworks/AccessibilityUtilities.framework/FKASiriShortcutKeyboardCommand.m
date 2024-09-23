@implementation FKASiriShortcutKeyboardCommand

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)commandWithSiriShortcutIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSiriShortcutIdentifier:", v4);

  return v5;
}

- (FKASiriShortcutKeyboardCommand)initWithSiriShortcutIdentifier:(id)a3
{
  id v5;
  FKASiriShortcutKeyboardCommand *v6;
  FKASiriShortcutKeyboardCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FKASiriShortcutKeyboardCommand;
  v6 = -[AXSSKeyboardCommand initWithType:](&v9, sel_initWithType_, CFSTR("SiriShortcut"));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_siriShortcutIdentifier, a3);

  return v7;
}

- (FKASiriShortcutKeyboardCommand)initWithCoder:(id)a3
{
  id v4;
  FKASiriShortcutKeyboardCommand *v5;
  FKASiriShortcutKeyboardCommand *v6;
  void *v7;
  char v8;
  uint64_t v9;
  NSString *siriShortcutIdentifier;
  FKASiriShortcutKeyboardCommand *v11;
  NSObject *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FKASiriShortcutKeyboardCommand;
  v5 = -[AXSSKeyboardCommand initWithCoder:](&v14, sel_initWithCoder_, v4);
  v6 = v5;
  if (!v5)
    goto LABEL_4;
  -[AXSSKeyboardCommand type](v5, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("SiriShortcut"));

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("siriShortcut"));
    v9 = objc_claimAutoreleasedReturnValue();
    siriShortcutIdentifier = v6->_siriShortcutIdentifier;
    v6->_siriShortcutIdentifier = (NSString *)v9;

LABEL_4:
    v11 = v6;
    goto LABEL_8;
  }
  FKALogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[FKASiriShortcutKeyboardCommand initWithCoder:].cold.1(v6, v12);

  v11 = 0;
LABEL_8:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FKASiriShortcutKeyboardCommand;
  v4 = a3;
  -[AXSSKeyboardCommand encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[FKASiriShortcutKeyboardCommand siriShortcutIdentifier](self, "siriShortcutIdentifier", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("siriShortcut"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[FKASiriShortcutKeyboardCommand siriShortcutIdentifier](self, "siriShortcutIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithSiriShortcutIdentifier:", v5);

  return v6;
}

- (AXSiriShortcut)shortcut
{
  void *v3;
  void *v4;
  void *v5;

  +[AXSiriShortcutsManager sharedManager](AXSiriShortcutsManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FKASiriShortcutKeyboardCommand siriShortcutIdentifier](self, "siriShortcutIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortcutForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (AXSiriShortcut *)v5;
}

- (id)localizedName
{
  void *v2;
  void *v3;

  -[FKASiriShortcutKeyboardCommand shortcut](self, "shortcut");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortcutName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqualToCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "siriShortcutIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FKASiriShortcutKeyboardCommand siriShortcutIdentifier](self, "siriShortcutIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FKASiriShortcutKeyboardCommand;
  v3 = -[AXSSKeyboardCommand hash](&v7, sel_hash);
  -[FKASiriShortcutKeyboardCommand siriShortcutIdentifier](self, "siriShortcutIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FKASiriShortcutKeyboardCommand;
  -[AXSSKeyboardCommand description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FKASiriShortcutKeyboardCommand siriShortcutIdentifier](self, "siriShortcutIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", shortcut identifier: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)perform
{
  void *v3;
  id v4;

  +[AXSiriShortcutsManager sharedManager](AXSiriShortcutsManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FKASiriShortcutKeyboardCommand shortcut](self, "shortcut");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performShortcut:", v3);

}

- (NSString)siriShortcutIdentifier
{
  return self->_siriShortcutIdentifier;
}

- (void)setShortcut:(id)a3
{
  objc_storeStrong((id *)&self->_shortcut, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_siriShortcutIdentifier, 0);
}

- (void)initWithCoder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_fault_impl(&dword_18C62B000, a2, OS_LOG_TYPE_FAULT, "Unexpectedly decoded shortcut keyboard command with different type: %@", (uint8_t *)&v4, 0xCu);

}

@end
