@implementation SUUIMenuViewElement

- (SUUIMenuViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIMenuViewElement *v9;
  void *v10;
  char v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIMenuViewElement;
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

- (void)dispatchEventOfType:(unint64_t)a3 forItemAtIndex:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__SUUIMenuViewElement_dispatchEventOfType_forItemAtIndex___block_invoke;
  v4[3] = &__block_descriptor_48_e36_v32__0__SUUIItemViewElement_8Q16_B24l;
  v4[4] = a4;
  v4[5] = a3;
  -[SUUIMenuViewElement _enumerateItemElementsUsingBlock:](self, "_enumerateItemElementsUsingBlock:", v4);
}

uint64_t __58__SUUIMenuViewElement_dispatchEventOfType_forItemAtIndex___block_invoke(uint64_t result, void *a2, uint64_t a3, _BYTE *a4)
{
  if (*(_QWORD *)(result + 32) == a3)
  {
    result = objc_msgSend(a2, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", *(_QWORD *)(result + 40), 1, 1, 0, 0);
    *a4 = 1;
  }
  return result;
}

- (NSArray)menuItemTitles
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__SUUIMenuViewElement_menuItemTitles__block_invoke;
  v6[3] = &unk_2511FA058;
  v4 = v3;
  v7 = v4;
  -[SUUIMenuViewElement _enumerateItemElementsUsingBlock:](self, "_enumerateItemElementsUsingBlock:", v6);

  return (NSArray *)v4;
}

void __37__SUUIMenuViewElement_menuItemTitles__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "itemText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

- (int64_t)selectedItemIndex
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = -1;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__SUUIMenuViewElement_selectedItemIndex__block_invoke;
  v4[3] = &unk_2511FA030;
  v4[4] = &v5;
  -[SUUIMenuViewElement _enumerateItemElementsUsingBlock:](self, "_enumerateItemElementsUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __40__SUUIMenuViewElement_selectedItemIndex__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isSelected");
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (SUUIItemViewElement)titleItem
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
  v8 = __Block_byref_object_copy__78;
  v9 = __Block_byref_object_dispose__78;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __32__SUUIMenuViewElement_titleItem__block_invoke;
  v4[3] = &unk_2511FA030;
  v4[4] = &v5;
  -[SUUIMenuViewElement _enumerateItemElementsUsingBlock:](self, "_enumerateItemElementsUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SUUIItemViewElement *)v2;
}

void __32__SUUIMenuViewElement_titleItem__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "isSelected"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
  else if (!a3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIMenuViewElement *v4;
  SUUIMenuViewElement *v5;
  SUUIMenuViewElement *v6;
  objc_super v8;

  v4 = (SUUIMenuViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUIMenuViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (SUUIMenuViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
    self->_enabled = v4->_enabled;

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
  v4.super_class = (Class)SUUIMenuViewElement;
  return -[SUUIViewElement isEnabled](&v4, sel_isEnabled);
}

- (void)_enumerateItemElementsUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD v9[4];

  v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__SUUIMenuViewElement__enumerateItemElementsUsingBlock___block_invoke;
  v6[3] = &unk_2511F8088;
  v5 = v4;
  v7 = v5;
  v8 = v9;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v6);

  _Block_object_dispose(v9, 8);
}

void __56__SUUIMenuViewElement__enumerateItemElementsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "elementType") == 59)
  {
    objc_msgSend(v5, "itemText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }

  }
}

- (SUUILabelViewElement)menuLabel
{
  return self->_menuLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuLabel, 0);
}

@end
