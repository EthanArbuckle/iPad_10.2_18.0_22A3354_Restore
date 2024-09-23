@implementation SUUILockupViewElement

- (SUUILockupViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUILockupViewElement *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SUUILockupViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v16, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("disabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      v11 = objc_msgSend(v10, "BOOLValue") ^ 1;
    else
      LOBYTE(v11) = -1;
    v9->_enabled = v11;
    objc_msgSend(v8, "getAttribute:", CFSTR("selectable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      objc_msgSend(v12, "lowercaseString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_selectable = objc_msgSend(v13, "isEqualToString:", CFSTR("true"));

    }
    objc_msgSend(v8, "getAttribute:", CFSTR("type"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_lockupViewType = SUUILockupViewTypeForString(v14);

  }
  return v9;
}

- (BOOL)containsElementGroups
{
  void *v2;
  BOOL v3;

  -[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 127);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (SUUIFullscreenImageViewElement)fullscreenImage
{
  return (SUUIFullscreenImageViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 42);
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUILockupViewElement *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = (SUUILockupViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUILockupViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_enabled = v4->_enabled;
    self->_lockupViewType = -[SUUILockupViewElement lockupViewType](v4, "lockupViewType");
  }

  return v6;
}

- (BOOL)isEnabled
{
  int enabled;
  objc_super v4;

  enabled = self->_enabled;
  if (enabled != 255)
    return enabled != 0;
  v4.receiver = self;
  v4.super_class = (Class)SUUILockupViewElement;
  return -[SUUIViewElement isEnabled](&v4, sel_isEnabled);
}

- (int64_t)pageComponentType
{
  return 24;
}

- (int64_t)lockupViewType
{
  return self->_lockupViewType;
}

- (BOOL)isSelectable
{
  return self->_selectable;
}

@end
