@implementation SUUIDynamicShelfViewElement

- (SUUIViewElement)cellTemplateViewElement
{
  SUUIViewElement *cellTemplateViewElement;
  _QWORD v5[5];

  cellTemplateViewElement = self->_cellTemplateViewElement;
  if (!cellTemplateViewElement)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __54__SUUIDynamicShelfViewElement_cellTemplateViewElement__block_invoke;
    v5[3] = &unk_2511F46F8;
    v5[4] = self;
    -[SUUIShelfViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v5);
    cellTemplateViewElement = self->_cellTemplateViewElement;
  }
  return cellTemplateViewElement;
}

void __54__SUUIDynamicShelfViewElement_cellTemplateViewElement__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 304), a2);
  *a3 = 1;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIDynamicShelfViewElement *v4;
  void *v5;
  SUUIViewElement *cellTemplateViewElement;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIDynamicShelfViewElement;
  v4 = (SUUIDynamicShelfViewElement *)a3;
  -[SUUIShelfViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != self || objc_msgSend(v5, "updateType", v8.receiver, v8.super_class))
  {
    cellTemplateViewElement = self->_cellTemplateViewElement;
    self->_cellTemplateViewElement = 0;

  }
  return v5;
}

- (BOOL)isDynamicContainer
{
  return 1;
}

- (void)setShelfItemViewElementValidator:(id)a3
{
  SUUIViewElement *cellTemplateViewElement;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIDynamicShelfViewElement;
  -[SUUIShelfViewElement setShelfItemViewElementValidator:](&v5, sel_setShelfItemViewElementValidator_, a3);
  cellTemplateViewElement = self->_cellTemplateViewElement;
  self->_cellTemplateViewElement = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellTemplateViewElement, 0);
}

@end
