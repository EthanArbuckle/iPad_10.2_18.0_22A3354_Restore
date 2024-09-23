@implementation SUUIShelfViewElement

- (SUUIShelfViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  SUUIDynamicShelfViewElement *v12;
  uint64_t numberOfRows;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *slideshowTitle;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class();
  if (v11 == objc_opt_class())
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("entityProviderID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    if (v15)
    {
      v12 = -[SUUIShelfViewElement initWithDOMElement:parent:elementFactory:]([SUUIDynamicShelfViewElement alloc], "initWithDOMElement:parent:elementFactory:", v8, v9, v10);
LABEL_12:

      goto LABEL_13;
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SUUIShelfViewElement;
  v12 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v20, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v12)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("rowCount"));
    self = (SUUIShelfViewElement *)objc_claimAutoreleasedReturnValue();
    if (-[SUUIShelfViewElement length](self, "length"))
    {
      numberOfRows = -[SUUIShelfViewElement integerValue](self, "integerValue");
      v12->super._numberOfRows = numberOfRows;
    }
    else
    {
      numberOfRows = v12->super._numberOfRows;
    }
    if (numberOfRows <= 1)
      v16 = 1;
    else
      v16 = numberOfRows;
    v12->super._numberOfRows = v16;
    objc_msgSend(v8, "getAttribute:", CFSTR("slideshowTitle"));
    v17 = objc_claimAutoreleasedReturnValue();
    slideshowTitle = v12->super._slideshowTitle;
    v12->super._slideshowTitle = (NSString *)v17;

    goto LABEL_12;
  }
LABEL_13:

  return &v12->super;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIShelfViewElement *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *slideshowTitle;
  objc_super v10;

  v4 = (SUUIShelfViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIShelfViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_numberOfRows = -[SUUIShelfViewElement numberOfRows](v4, "numberOfRows");
    -[SUUIShelfViewElement slideshowTitle](v4, "slideshowTitle");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    slideshowTitle = self->_slideshowTitle;
    self->_slideshowTitle = v7;

  }
  return v6;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  SUUIShelfViewElement *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __52__SUUIShelfViewElement_enumerateChildrenUsingBlock___block_invoke;
  v5[3] = &unk_2511FC880;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)SUUIShelfViewElement;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[SUUIViewElement enumerateChildrenUsingBlock:](&v4, sel_enumerateChildrenUsingBlock_, v5);

}

void __52__SUUIShelfViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "elementType");
  v4 = (unint64_t)(v3 - 14) > 0x34 || ((1 << (v3 - 14)) & 0x10000800004001) == 0;
  if (!v4 || v3 == 152)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296);
    if (!v5 || (*(unsigned int (**)(uint64_t, id))(v5 + 16))(v5, v6))
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (int64_t)pageComponentType
{
  return 22;
}

- (int64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (NSString)slideshowTitle
{
  return self->_slideshowTitle;
}

- (id)shelfItemViewElementValidator
{
  return self->_shelfItemViewElementValidator;
}

- (void)setShelfItemViewElementValidator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shelfItemViewElementValidator, 0);
  objc_storeStrong((id *)&self->_slideshowTitle, 0);
}

@end
