@implementation SUUIBrowseItemViewElement

- (SUUIBrowseItemViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIBrowseItemViewElement *v9;
  void *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIBrowseItemViewElement;
  v9 = -[SUUIItemViewElement initWithDOMElement:parent:elementFactory:](&v12, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("expands"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(&v9->super._selected + 1) = objc_msgSend(v10, "BOOLValue");

  }
  return v9;
}

- (SUUIImageViewElement)decorationImage
{
  return (SUUIImageViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 29);
}

- (NSArray)metadata
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__SUUIBrowseItemViewElement_metadata__block_invoke;
  v6[3] = &unk_2511F46F8;
  v4 = v3;
  v7 = v4;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v6);

  return (NSArray *)v4;
}

void __37__SUUIBrowseItemViewElement_metadata__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 138)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIBrowseItemViewElement *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = (SUUIBrowseItemViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUIBrowseItemViewElement;
  -[SUUIItemViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
    *(&self->super._selected + 1) = -[SUUIBrowseItemViewElement expands](v4, "expands");

  return v6;
}

- (int64_t)pageComponentType
{
  return 16;
}

- (BOOL)expands
{
  return *(&self->super._selected + 1);
}

@end
