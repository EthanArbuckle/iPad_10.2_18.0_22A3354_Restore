@implementation SUUIInfoListViewElement

- (SUUIInfoListViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIInfoListViewElement *v9;
  void *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIInfoListViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v12, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_infoListType = objc_msgSend(v10, "isEqualToString:", CFSTR("titleAbove"));

  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIInfoListViewElement *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = (SUUIInfoListViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUIInfoListViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
    self->_infoListType = -[SUUIInfoListViewElement infoListType](v4, "infoListType");

  return v6;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;

  v6[1] = 3221225472;
  v6[2] = __55__SUUIInfoListViewElement_enumerateChildrenUsingBlock___block_invoke;
  v6[3] = &unk_2511F4BE0;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUUIInfoListViewElement;
  v6[0] = MEMORY[0x24BDAC760];
  v4 = v7;
  -[SUUIViewElement enumerateChildrenUsingBlock:](&v5, sel_enumerateChildrenUsingBlock_, v6);

}

void __55__SUUIInfoListViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 56)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int64_t)pageComponentType
{
  if (self->_infoListType == 1)
    return 27;
  else
    return 26;
}

- (int64_t)infoListType
{
  return self->_infoListType;
}

@end
