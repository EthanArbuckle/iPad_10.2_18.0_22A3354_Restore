@implementation SUUIDynamicShelfMenuBarViewElement

- (SUUIViewElement)cellTemplateViewElement
{
  SUUIViewElement *cellTemplateViewElement;
  _QWORD v5[5];

  cellTemplateViewElement = self->_cellTemplateViewElement;
  if (!cellTemplateViewElement)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __61__SUUIDynamicShelfMenuBarViewElement_cellTemplateViewElement__block_invoke;
    v5[3] = &unk_2511F46F8;
    v5[4] = self;
    -[SUUIShelfMenuBarViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v5);
    cellTemplateViewElement = self->_cellTemplateViewElement;
  }
  return cellTemplateViewElement;
}

void __61__SUUIDynamicShelfMenuBarViewElement_cellTemplateViewElement__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 328), a2);
  *a3 = 1;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIDynamicShelfMenuBarViewElement *v4;
  void *v5;
  void *v6;
  SUUIViewElement *v7;
  SUUIViewElement *cellTemplateViewElement;
  objc_super v10;

  v4 = (SUUIDynamicShelfMenuBarViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIDynamicShelfMenuBarViewElement;
  -[SUUIShelfMenuBarViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    -[SUUIDynamicShelfMenuBarViewElement cellTemplateViewElement](v4, "cellTemplateViewElement");
    v7 = (SUUIViewElement *)objc_claimAutoreleasedReturnValue();
    cellTemplateViewElement = self->_cellTemplateViewElement;
    self->_cellTemplateViewElement = v7;

  }
  return v6;
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
  v5.super_class = (Class)SUUIDynamicShelfMenuBarViewElement;
  -[SUUIShelfViewElement setShelfItemViewElementValidator:](&v5, sel_setShelfItemViewElementValidator_, a3);
  cellTemplateViewElement = self->_cellTemplateViewElement;
  self->_cellTemplateViewElement = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellTemplateViewElement, 0);
}

@end
