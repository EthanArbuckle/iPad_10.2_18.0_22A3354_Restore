@implementation ICNoteEditorPillOrnamentBarButtonItem

- (UIToolTipInteraction)toolTipInteraction
{
  return self->_toolTipInteraction;
}

- (void)setUsedInPillOrnament:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  objc_super v19;
  objc_super v20;
  objc_super v21;
  objc_super v22;

  if (self->_usedInPillOrnament != a3)
  {
    self->_usedInPillOrnament = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0DC3520], "borderlessButtonConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setBaseForegroundColor:", v5);

      v22.receiver = self;
      v22.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
      -[ICNoteEditorPillOrnamentBarButtonItem image](&v22, sel_image);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setImage:", v6);

      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v4, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_performButtonAction, 0x2000);
      v21.receiver = self;
      v21.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
      -[ICNoteEditorPillOrnamentBarButtonItem menu](&v21, sel_menu);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMenu:", v8);

      v20.receiver = self;
      v20.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
      -[ICNoteEditorPillOrnamentBarButtonItem menu](&v20, sel_menu);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setShowsMenuAsPrimaryAction:", v9 != 0);

      -[ICNoteEditorPillOrnamentBarButtonItem title](self, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (v11)
      {
        v12 = objc_alloc(MEMORY[0x1E0DC3E60]);
        -[ICNoteEditorPillOrnamentBarButtonItem title](self, "title");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithDefaultToolTip:", v13);
        -[ICNoteEditorPillOrnamentBarButtonItem setToolTipInteraction:](self, "setToolTipInteraction:", v14);

        -[ICNoteEditorPillOrnamentBarButtonItem toolTipInteraction](self, "toolTipInteraction");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addInteraction:", v15);

      }
      v19.receiver = self;
      v19.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
      -[ICNoteEditorPillOrnamentBarButtonItem setCustomView:](&v19, sel_setCustomView_, v7);

    }
    else
    {
      -[ICNoteEditorPillOrnamentBarButtonItem button](self, "button");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorPillOrnamentBarButtonItem toolTipInteraction](self, "toolTipInteraction");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeInteraction:", v17);

      -[ICNoteEditorPillOrnamentBarButtonItem setToolTipInteraction:](self, "setToolTipInteraction:", 0);
      v18.receiver = self;
      v18.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
      -[ICNoteEditorPillOrnamentBarButtonItem setCustomView:](&v18, sel_setCustomView_, 0);
    }
  }
}

- (void)setToolTipInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_toolTipInteraction, a3);
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
  -[ICNoteEditorPillOrnamentBarButtonItem setTitle:](&v12, sel_setTitle_, v4);
  if (-[ICNoteEditorPillOrnamentBarButtonItem isUsedInPillOrnament](self, "isUsedInPillOrnament")
    && objc_msgSend(v4, "length"))
  {
    -[ICNoteEditorPillOrnamentBarButtonItem toolTipInteraction](self, "toolTipInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[ICNoteEditorPillOrnamentBarButtonItem toolTipInteraction](self, "toolTipInteraction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDefaultToolTip:", v4);

    }
    else
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3E60]), "initWithDefaultToolTip:", v4);
      -[ICNoteEditorPillOrnamentBarButtonItem setToolTipInteraction:](self, "setToolTipInteraction:", v9);

      -[ICNoteEditorPillOrnamentBarButtonItem button](self, "button");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorPillOrnamentBarButtonItem toolTipInteraction](self, "toolTipInteraction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addInteraction:", v11);

    }
  }
  else
  {
    -[ICNoteEditorPillOrnamentBarButtonItem button](self, "button");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorPillOrnamentBarButtonItem toolTipInteraction](self, "toolTipInteraction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeInteraction:", v8);

    -[ICNoteEditorPillOrnamentBarButtonItem setToolTipInteraction:](self, "setToolTipInteraction:", 0);
  }

}

- (void)setMenu:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  if (-[ICNoteEditorPillOrnamentBarButtonItem isUsedInPillOrnament](self, "isUsedInPillOrnament"))
  {
    -[ICNoteEditorPillOrnamentBarButtonItem button](self, "button");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMenu:", v4);

    -[ICNoteEditorPillOrnamentBarButtonItem button](self, "button");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShowsMenuAsPrimaryAction:", v4 != 0);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
    -[ICNoteEditorPillOrnamentBarButtonItem setMenu:](&v7, sel_setMenu_, v4);
  }

}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
  -[ICNoteEditorPillOrnamentBarButtonItem setImage:](&v8, sel_setImage_, v4);
  if (-[ICNoteEditorPillOrnamentBarButtonItem isUsedInPillOrnament](self, "isUsedInPillOrnament"))
  {
    -[ICNoteEditorPillOrnamentBarButtonItem button](self, "button");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setImage:", v4);
    -[ICNoteEditorPillOrnamentBarButtonItem button](self, "button");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConfiguration:", v6);

  }
}

- (void)setAction:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super *v8;
  ICNoteEditorPillOrnamentBarButtonItem *v9;
  objc_super v10;
  objc_super v11;
  objc_super v12;

  if (-[ICNoteEditorPillOrnamentBarButtonItem isUsedInPillOrnament](self, "isUsedInPillOrnament"))
  {
    if (-[ICNoteEditorPillOrnamentBarButtonItem action](self, "action"))
    {
      -[ICNoteEditorPillOrnamentBarButtonItem button](self, "button");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11.receiver = self;
      v11.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
      -[ICNoteEditorPillOrnamentBarButtonItem target](&v11, sel_target);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10.receiver = self;
      v10.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
      objc_msgSend(v5, "removeTarget:action:forControlEvents:", v6, -[ICNoteEditorPillOrnamentBarButtonItem action](&v10, sel_action), 0x2000);

    }
    if (a3)
    {
      -[ICNoteEditorPillOrnamentBarButtonItem button](self, "button");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_performButtonAction, 0x2000);

    }
    v9 = self;
    v8 = (objc_super *)&v9;
  }
  else
  {
    v12.receiver = self;
    v8 = &v12;
  }
  v8->super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
  -[objc_super setAction:](v8, sel_setAction_, a3, v9);
}

- (id)menu
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[ICNoteEditorPillOrnamentBarButtonItem isUsedInPillOrnament](self, "isUsedInPillOrnament"))
  {
    -[ICNoteEditorPillOrnamentBarButtonItem button](self, "button");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "menu");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
    -[ICNoteEditorPillOrnamentBarButtonItem menu](&v6, sel_menu);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)isUsedInPillOrnament
{
  return self->_usedInPillOrnament;
}

- (UIButton)button
{
  void *v3;
  void *v4;
  objc_super v6;

  if (!-[ICNoteEditorPillOrnamentBarButtonItem isUsedInPillOrnament](self, "isUsedInPillOrnament"))
    return (UIButton *)0;
  objc_opt_class();
  v6.receiver = self;
  v6.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
  -[ICNoteEditorPillOrnamentBarButtonItem customView](&v6, sel_customView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIButton *)v4;
}

- (void)performButtonAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void (*v10)(void *, id, ICNoteEditorPillOrnamentBarButtonItem *);
  void *v11;
  id v12;
  objc_super v13;
  objc_super v14;
  objc_super v15;
  objc_super v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
  -[ICNoteEditorPillOrnamentBarButtonItem target](&v17, sel_target);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICProtocolCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "makeKeyWindow");
  }
  v16.receiver = self;
  v16.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
  v7 = -[ICNoteEditorPillOrnamentBarButtonItem action](&v16, sel_action);
  if (v7)
  {
    v8 = v7;
    v15.receiver = self;
    v15.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
    -[ICNoteEditorPillOrnamentBarButtonItem target](&v15, sel_target);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void (*)(void *, id, ICNoteEditorPillOrnamentBarButtonItem *))objc_msgSend(v9, "methodForSelector:", v8);

    if (v10)
    {
      v14.receiver = self;
      v14.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
      -[ICNoteEditorPillOrnamentBarButtonItem target](&v14, sel_target);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13.receiver = self;
      v13.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
      v12 = -[ICNoteEditorPillOrnamentBarButtonItem action](&v13, sel_action);
      v10(v11, v12, self);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolTipInteraction, 0);
}

@end
