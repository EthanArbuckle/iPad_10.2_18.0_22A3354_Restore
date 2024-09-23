@implementation SUUIStackTemplateElement

- (SUUIStackTemplateElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIStackTemplateElement *v9;
  void *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIStackTemplateElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v12, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("resetState"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_needsStateReset = objc_msgSend(v10, "BOOLValue");

  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIStackTemplateElement *v4;
  void *v5;
  NSMutableArray *collectionElements;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIStackTemplateElement;
  v4 = (SUUIStackTemplateElement *)a3;
  -[SUUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != self || objc_msgSend(v5, "updateType", v8.receiver, v8.super_class))
  {
    collectionElements = self->_collectionElements;
    self->_collectionElements = 0;

  }
  return v5;
}

- (NSArray)collectionElements
{
  NSMutableArray *collectionElements;
  NSMutableArray *v4;
  NSMutableArray *v5;
  _QWORD v7[5];

  collectionElements = self->_collectionElements;
  if (!collectionElements)
  {
    v4 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
    v5 = self->_collectionElements;
    self->_collectionElements = v4;

    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __46__SUUIStackTemplateElement_collectionElements__block_invoke;
    v7[3] = &unk_2511F46F8;
    v7[4] = self;
    -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v7);
    collectionElements = self->_collectionElements;
  }
  return (NSArray *)collectionElements;
}

void __46__SUUIStackTemplateElement_collectionElements__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v7 = a2;
  v5 = objc_msgSend(v7, "elementType");
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 280);
  if (v5 == 20)
  {
    objc_msgSend(v6, "removeAllObjects");
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __46__SUUIStackTemplateElement_collectionElements__block_invoke_2;
    v8[3] = &unk_2511F46F8;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "enumerateChildrenUsingBlock:", v8);
    *a3 = 1;
  }
  else
  {
    objc_msgSend(v6, "addObject:", v7);
  }

}

uint64_t __46__SUUIStackTemplateElement_collectionElements__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "addObject:", a2);
}

- (SUUIViewElement)collectionHeaderViewElement
{
  SUUIViewElement *collectionHeaderViewElement;
  _QWORD v5[5];

  collectionHeaderViewElement = self->_collectionHeaderViewElement;
  if (!collectionHeaderViewElement)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __55__SUUIStackTemplateElement_collectionHeaderViewElement__block_invoke;
    v5[3] = &unk_2511F46F8;
    v5[4] = self;
    -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v5);
    collectionHeaderViewElement = self->_collectionHeaderViewElement;
  }
  return collectionHeaderViewElement;
}

void __55__SUUIStackTemplateElement_collectionHeaderViewElement__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "elementType") == 107)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 288), a2);

}

- (SUUIIndexBarViewElement)indexBarViewElement
{
  return (SUUIIndexBarViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 53);
}

- (SUUINavigationBarViewElement)navigationBarElement
{
  return (SUUINavigationBarViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 74);
}

- (SUUIToolbarViewElement)toolbarElement
{
  return (SUUIToolbarViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 145);
}

- (int64_t)numberOfSplits
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
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__SUUIStackTemplateElement_numberOfSplits__block_invoke;
  v4[3] = &unk_2511F4B90;
  v4[4] = &v5;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __42__SUUIStackTemplateElement_numberOfSplits__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "elementType");
  if (result == 128)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (BOOL)needsStateReset
{
  return self->_needsStateReset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionHeaderViewElement, 0);
  objc_storeStrong((id *)&self->_collectionElements, 0);
}

@end
