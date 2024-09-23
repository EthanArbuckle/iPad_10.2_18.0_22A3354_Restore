@implementation CCUIContextMenuItem

- (CCUIContextMenuItem)initWithMenuElement:(id)a3
{
  id v6;
  CCUIContextMenuItem *v7;
  CCUIContextMenuItem *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CCUIContextMenuItem.m"), 14, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("menuElement != nil"));

  }
  v11.receiver = self;
  v11.super_class = (Class)CCUIContextMenuItem;
  v7 = -[CCUIContextMenuItem init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_menuElement, a3);

  return v8;
}

- (UIMenuElement)menuElement
{
  return self->_menuElement;
}

- (void)setMenuElement:(id)a3
{
  objc_storeStrong((id *)&self->_menuElement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuElement, 0);
}

@end
