@implementation SUUIHeaderViewElement

- (SUUIHeaderViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  SUUIBrowseHeaderViewElement *v18;
  SUUIHeaderViewElement *p_super;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class();
  if (v11 == objc_opt_class()
    && (objc_msgSend(v8, "getAttribute:", CFSTR("type")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("browse")),
        v12,
        v13))
  {
    v14 = v9;
    v15 = v14;
    if (v14)
    {
      v16 = v14;
      do
      {
        objc_msgSend(v16, "parent");
        v17 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v17;
      }
      while (v17);
    }
    v18 = -[SUUIHeaderViewElement initWithDOMElement:parent:elementFactory:]([SUUIBrowseHeaderViewElement alloc], "initWithDOMElement:parent:elementFactory:", v8, v15, v10);
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)SUUIHeaderViewElement;
    v18 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v21, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
    self = &v18->super;
  }
  p_super = &v18->super;

  return p_super;
}

- (SUUIButtonViewElement)button
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__99;
  v9 = __Block_byref_object_dispose__99;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31__SUUIHeaderViewElement_button__block_invoke;
  v4[3] = &unk_2511F4B90;
  v4[4] = &v5;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SUUIButtonViewElement *)v2;
}

void __31__SUUIHeaderViewElement_button__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (SUUIIKViewElementTypeIsButton(objc_msgSend(v6, "elementType")))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (NSArray)titleLabels
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__SUUIHeaderViewElement_titleLabels__block_invoke;
  v6[3] = &unk_2511F46F8;
  v4 = v3;
  v7 = v4;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v6);

  return (NSArray *)v4;
}

void __36__SUUIHeaderViewElement_titleLabels__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 138)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (int64_t)pageComponentType
{
  return 24;
}

@end
