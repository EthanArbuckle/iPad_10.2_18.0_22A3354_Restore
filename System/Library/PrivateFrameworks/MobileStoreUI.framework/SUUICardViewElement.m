@implementation SUUICardViewElement

- (SUUICardViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUICardViewElement *v9;
  void *v10;
  char v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUICardViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v13, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("disabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      v11 = objc_msgSend(v10, "BOOLValue") ^ 1;
    else
      v11 = -1;
    v9->_enabled = v11;

  }
  return v9;
}

- (int64_t)cardType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SUUICardViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cardType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SUUICardElementTypeForString(v3);

  return v4;
}

- (BOOL)isAdCard
{
  void *v2;
  void *v3;
  char v4;

  -[SUUICardViewElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("isAdCard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUICardViewElement *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = (SUUICardViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUICardViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
    self->_enabled = v4->_enabled;

  return v6;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;

  v6[1] = 3221225472;
  v6[2] = __51__SUUICardViewElement_enumerateChildrenUsingBlock___block_invoke;
  v6[3] = &unk_2511F4BE0;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUUICardViewElement;
  v6[0] = MEMORY[0x24BDAC760];
  v4 = v7;
  -[SUUIViewElement enumerateChildrenUsingBlock:](&v5, sel_enumerateChildrenUsingBlock_, v6);

}

void __51__SUUICardViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  BOOL v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "elementType");
  v4 = (unint64_t)(v3 - 7) > 0x3B || ((1 << (v3 - 7)) & 0x8801E0002000023) == 0;
  if (!v4 || (unint64_t)(v3 - 108) <= 0x2C && ((1 << (v3 - 108)) & 0x100040800001) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int64_t)pageComponentType
{
  return 24;
}

- (BOOL)isEnabled
{
  int enabled;
  objc_super v4;

  enabled = self->_enabled;
  if (enabled != 255)
    return enabled != 0;
  v4.receiver = self;
  v4.super_class = (Class)SUUICardViewElement;
  return -[SUUIViewElement isEnabled](&v4, sel_isEnabled);
}

@end
