@implementation CKActionMenuItem

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CKActionMenuItem;
  -[CKActionMenuItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(-[CKActionMenuItem action](self, "action"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ action: %@ enabled: %d highlighted: %d selected: %d"), v4, v5, -[CKActionMenuItem isEnabled](self, "isEnabled"), -[CKActionMenuItem isHighlighted](self, "isHighlighted"), -[CKActionMenuItem isSelected](self, "isSelected"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)itemWithImageTemplate:(id)a3 tintColor:(id)a4 highlightedTintColor:(id)a5 target:(id)a6 action:(SEL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  CKActionMenuItemImageView *v16;
  void *v17;

  v11 = a3;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  if (objc_msgSend(v11, "renderingMode") != 2)
  {
    objc_msgSend(v11, "imageWithRenderingMode:", 2);
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v15;
  }
  v16 = -[CKActionMenuItemImageView initWithImage:tintColor:highlightedTintColor:]([CKActionMenuItemImageView alloc], "initWithImage:tintColor:highlightedTintColor:", v11, v14, v13);

  v17 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithView:label:target:action:", v16, 0, v12, a7);
  return v17;
}

- (CKActionMenuItem)initWithView:(id)a3 label:(id)a4 target:(id)a5 action:(SEL)a6
{
  id v10;
  id v11;
  id v12;
  CKActionMenuItem *v13;
  CKActionMenuItem *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CKActionMenuItem;
  v13 = -[CKActionMenuItem init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    -[CKActionMenuItem setView:](v13, "setView:", v10);
    -[CKActionMenuItem setLabel:](v14, "setLabel:", v11);
    -[CKActionMenuItem setTarget:](v14, "setTarget:", v12);
    -[CKActionMenuItem setAction:](v14, "setAction:", a6);
    v14->_enabled = 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "setEnabled:animated:", -[CKActionMenuItem isEnabled](v14, "isEnabled"), 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "setHighlighted:animated:", -[CKActionMenuItem isHighlighted](v14, "isHighlighted"), 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "setSelected:animated:", -[CKActionMenuItem isSelected](v14, "isSelected"), 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "setEnabled:animated:", -[CKActionMenuItem isEnabled](v14, "isEnabled"), 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "setHighlighted:animated:", -[CKActionMenuItem isHighlighted](v14, "isHighlighted"), 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "setSelected:animated:", -[CKActionMenuItem isSelected](v14, "isSelected"), 0);
    objc_msgSend(v11, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = 0.75;
    objc_msgSend(v15, "setShadowOpacity:", v16);

    objc_msgSend(v11, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

    objc_msgSend(v11, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setShadowRadius:", 3.0);

  }
  return v14;
}

- (CKActionMenuItem)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[CKActionMenuItem init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Don't call %@. Use the designated initializer instead."), v5);

  return 0;
}

- (void)setEnabled:(BOOL)a3
{
  -[CKActionMenuItem setEnabled:animated:](self, "setEnabled:animated:", a3, 0);
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  id v8;

  if (self->_enabled != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_enabled = a3;
    -[CKActionMenuItem view](self, "view");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "setEnabled:animated:", v5, v4);
    -[CKActionMenuItem label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "setEnabled:animated:", v5, v4);

  }
}

- (void)setHighlighted:(BOOL)a3
{
  -[CKActionMenuItem setHighlighted:animated:](self, "setHighlighted:animated:", a3, 0);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  id v8;

  if (self->_highlighted != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_highlighted = a3;
    -[CKActionMenuItem view](self, "view");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "setHighlighted:animated:", v5, v4);
    -[CKActionMenuItem label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "setHighlighted:animated:", v5, v4);

  }
}

- (void)setSelected:(BOOL)a3
{
  -[CKActionMenuItem setSelected:animated:](self, "setSelected:animated:", a3, 0);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  id v8;

  if (self->_selected != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_selected = a3;
    -[CKActionMenuItem view](self, "view");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "setSelected:animated:", v5, v4);
    -[CKActionMenuItem label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "setSelected:animated:", v5, v4);

  }
}

- (void)updateForState:(int64_t)a3 touchInside:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v6;
  uint64_t v7;

  v4 = a4;
  if ((unint64_t)(a3 - 1) < 2)
  {
    v6 = a4;
    v7 = 1;
LABEL_6:
    -[CKActionMenuItem setHighlighted:animated:](self, "setHighlighted:animated:", v6, v7);
    return;
  }
  if (a3 != 3)
  {
    if (a3 != 4)
      return;
    v6 = 0;
    v7 = 0;
    goto LABEL_6;
  }
  -[CKActionMenuItem setHighlighted:animated:](self, "setHighlighted:animated:", 0, 1);
  if (v4)
    -[CKActionMenuItem sendAction](self, "sendAction");
}

- (void)sendAction
{
  const char *v3;
  void *v4;
  id v5;

  if (-[CKActionMenuItem action](self, "action"))
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = -[CKActionMenuItem action](self, "action");
    -[CKActionMenuItem target](self, "target");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendAction:to:from:forEvent:", v3, v4, self, 0);

  }
}

+ (void)animate:(id)a3 completion:(id)a4
{
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 327686, a3, a4, 0.25, 0.0);
}

- (CKActionMenuItemView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (CKActionMenuItemView)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong(&self->_target, a3);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
