@implementation SUUIColumnViewElement

- (SUUIColumnViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIColumnViewElement *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIColumnViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v14, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("span"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      v11 = objc_msgSend(v10, "integerValue");
      if (v11 <= 1)
        v12 = 1;
      else
        v12 = v11;
    }
    else
    {
      v12 = 1;
    }
    v9->_columnSpan = v12;

  }
  return v9;
}

- (SUUIHeaderViewElement)headerElement
{
  id v2;
  objc_super v4;
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
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  v5[1] = 3221225472;
  v5[2] = __38__SUUIColumnViewElement_headerElement__block_invoke;
  v5[3] = &unk_2511F4B90;
  v5[4] = &v6;
  v4.receiver = self;
  v4.super_class = (Class)SUUIColumnViewElement;
  v5[0] = MEMORY[0x24BDAC760];
  -[SUUIViewElement enumerateChildrenUsingBlock:](&v4, sel_enumerateChildrenUsingBlock_, v5);
  v2 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUUIHeaderViewElement *)v2;
}

void __38__SUUIColumnViewElement_headerElement__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 48)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (id)applyUpdatesWithElement:(id)a3
{
  id v4;
  SUUIColumnViewElement *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUUIColumnViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v7, sel_applyUpdatesWithElement_, v4);
  v5 = (SUUIColumnViewElement *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
    self->_columnSpan = objc_msgSend(v4, "columnSpan");

  return v5;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;
  objc_super v8;

  v4 = a3;
  if (-[SUUIViewElement descendsFromElementWithType:](self, "descendsFromElementWithType:", 17))
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __53__SUUIColumnViewElement_enumerateChildrenUsingBlock___block_invoke;
    v6[3] = &unk_2511F4BE0;
    v7 = v4;
    v5.receiver = self;
    v5.super_class = (Class)SUUIColumnViewElement;
    -[SUUIViewElement enumerateChildrenUsingBlock:](&v5, sel_enumerateChildrenUsingBlock_, v6);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SUUIColumnViewElement;
    -[SUUIViewElement enumerateChildrenUsingBlock:](&v8, sel_enumerateChildrenUsingBlock_, v4);
  }

}

void __53__SUUIColumnViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") != 48)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int64_t)pageComponentType
{
  return 8;
}

- (int64_t)columnSpan
{
  return self->_columnSpan;
}

@end
