@implementation SUUICarouselViewElement

- (SUUICarouselViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUICarouselViewElement *v9;
  void *v10;
  double v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUICarouselViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v13, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("displayInterval"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      objc_msgSend(v10, "doubleValue");
    else
      v11 = -1.0;
    v9->_displayInterval = v11;

  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUICarouselViewElement *v4;
  void *v5;
  void *v6;
  double v7;
  objc_super v9;

  v4 = (SUUICarouselViewElement *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUICarouselViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v9, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    -[SUUICarouselViewElement displayInterval](v4, "displayInterval");
    self->_displayInterval = v7;
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
  v6[2] = __55__SUUICarouselViewElement_enumerateChildrenUsingBlock___block_invoke;
  v6[3] = &unk_2511F4BE0;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUUICarouselViewElement;
  v6[0] = MEMORY[0x24BDAC760];
  v4 = v7;
  -[SUUIViewElement enumerateChildrenUsingBlock:](&v5, sel_enumerateChildrenUsingBlock_, v6);

}

void __55__SUUICarouselViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  BOOL v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "elementType");
  v4 = (unint64_t)(v3 - 14) > 0x34 || ((1 << (v3 - 14)) & 0x10000800004001) == 0;
  if (!v4 || v3 == 152)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int64_t)pageComponentType
{
  return 18;
}

- (SUUIProgressIndicatorViewElement)progressIndicatorElement
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
  v9 = __Block_byref_object_copy__96;
  v10 = __Block_byref_object_dispose__96;
  v11 = 0;
  -[SUUICarouselViewElement children](self, "children");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__SUUICarouselViewElement_progressIndicatorElement__block_invoke;
  v5[3] = &unk_2511FD8B8;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUUIProgressIndicatorViewElement *)v3;
}

void __51__SUUICarouselViewElement_progressIndicatorElement__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "elementType") == 95)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (double)displayInterval
{
  return self->_displayInterval;
}

@end
