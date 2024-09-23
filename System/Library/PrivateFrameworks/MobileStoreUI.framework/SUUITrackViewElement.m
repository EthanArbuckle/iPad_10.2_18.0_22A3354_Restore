@implementation SUUITrackViewElement

- (SUUITrackViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUITrackViewElement *v9;
  void *v10;
  int v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUITrackViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v14, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("disabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      v11 = objc_msgSend(v10, "BOOLValue") ^ 1;
    else
      LOBYTE(v11) = -1;
    v9->_enabled = v11;
    objc_msgSend(v8, "getAttribute:", CFSTR("selected"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
      v9->_selected = objc_msgSend(v12, "BOOLValue");

  }
  return v9;
}

- (SUUIActionsViewElement)swipeActions
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__80;
  v10 = __Block_byref_object_dispose__80;
  v11 = 0;
  -[SUUITrackViewElement children](self, "children");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__SUUITrackViewElement_swipeActions__block_invoke;
  v5[3] = &unk_2511FC330;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUUIActionsViewElement *)v3;
}

void __36__SUUITrackViewElement_swipeActions__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "elementType") == 3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUITrackViewElement *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = (SUUITrackViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUITrackViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_enabled = v4->_enabled;
    self->_selected = v4->_selected;
  }

  return v6;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;

  v6[1] = 3221225472;
  v6[2] = __52__SUUITrackViewElement_enumerateChildrenUsingBlock___block_invoke;
  v6[3] = &unk_2511F4BE0;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUUITrackViewElement;
  v6[0] = MEMORY[0x24BDAC760];
  v4 = v7;
  -[SUUIViewElement enumerateChildrenUsingBlock:](&v5, sel_enumerateChildrenUsingBlock_, v6);

}

void __52__SUUITrackViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") != 3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)isEnabled
{
  int enabled;
  objc_super v4;

  enabled = self->_enabled;
  if (enabled != 255)
    return enabled != 0;
  v4.receiver = self;
  v4.super_class = (Class)SUUITrackViewElement;
  return -[SUUIViewElement isEnabled](&v4, sel_isEnabled);
}

- (BOOL)isSelected
{
  return self->_selected;
}

@end
