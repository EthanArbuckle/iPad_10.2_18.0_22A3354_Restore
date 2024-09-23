@implementation CNContactAction

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (BOOL)wrapTitle
{
  return self->_wrapTitle;
}

- (UIColor)color
{
  return self->_color;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (id)target
{
  return self->_target;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNContactAction)initWithContact:(id)a3
{
  id v5;
  CNContactAction *v6;
  CNContactAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNContactAction;
  v6 = -[CNContactAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contact, a3);
    v7->_showBackgroundPlatter = 1;
  }

  return v7;
}

- (void)setWrapTitle:(BOOL)a3
{
  self->_wrapTitle = a3;
}

+ (id)contactActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 destructive:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  CNContactAction *v11;

  v6 = a6;
  v9 = a4;
  v10 = a3;
  v11 = -[CNContactAction initWithTitle:target:selector:destructive:]([CNContactAction alloc], "initWithTitle:target:selector:destructive:", v10, v9, a5, v6);

  return v11;
}

- (CNContactAction)initWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 destructive:(BOOL)a6
{
  id v10;
  id v11;
  CNContactAction *v12;
  uint64_t v13;
  NSString *title;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CNContactAction;
  v12 = -[CNContactAction init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    title = v12->_title;
    v12->_title = (NSString *)v13;

    objc_storeStrong(&v12->_target, a4);
    v12->_selector = a5;
    v12->_destructive = a6;
    v12->_showBackgroundPlatter = 1;
  }

  return v12;
}

- (BOOL)showBackgroundPlatter
{
  return self->_showBackgroundPlatter;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (void)setShowBackgroundPlatter:(BOOL)a3
{
  self->_showBackgroundPlatter = a3;
}

- (void)setGlyphColor:(id)a3
{
  objc_storeStrong((id *)&self->_glyphColor, a3);
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (CNContactAction)init
{
  return -[CNContactAction initWithTitle:target:selector:destructive:](self, "initWithTitle:target:selector:destructive:", 0, 0, 0, 0);
}

- (CNMutableContact)mutableContact
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[CNContactAction contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CNContactAction contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (CNMutableContact *)v5;
}

- (void)performActionWithSender:(id)a3
{
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CNContactAction target](self, "target");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[CNContactAction selector](self, "selector");

    if (v6)
    {
      -[CNContactAction target](self, "target");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, -[CNContactAction selector](self, "selector"), v9);

    }
  }
  -[CNContactAction delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionDidFinish:", self);

}

- (id)description
{
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  -[CNContactAction target](self, "target");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3 && (v4 = (void *)v3, v5 = -[CNContactAction selector](self, "selector"), v4, v5))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = objc_opt_class();
    -[CNContactAction title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactAction target](self, "target");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    NSStringFromSelector(-[CNContactAction selector](self, "selector"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@ %p> \"%@\": -[%@ %@]"), v7, self, v8, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = objc_opt_class();
    -[CNContactAction contact](self, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@ %p> : %@"), v14, self, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (CNContactActionDelegate)delegate
{
  return (CNContactActionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (SEL)selector
{
  return self->_selector;
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (UIColor)glyphColor
{
  return self->_glyphColor;
}

- (BOOL)canPerformAction
{
  return self->_canPerformAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)contactActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5
{
  return (id)objc_msgSend(a1, "contactActionWithTitle:target:selector:destructive:", a3, a4, a5, 0);
}

@end
