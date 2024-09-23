@implementation NPKPaymentProvisioningFlowPickerItem

+ (id)itemWithIdentifier:(id)a3 title:(id)a4 products:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc_init((Class)a1);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)v12 + 3, a3);
    v14 = objc_msgSend(v10, "copy");
    v15 = (void *)v13[1];
    v13[1] = v14;

    v16 = objc_msgSend(v11, "copy");
    v17 = (void *)v13[2];
    v13[2] = v16;

  }
  return v13;
}

+ (id)itemWithIdentifier:(id)a3 products:(id)a4
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init((Class)a1);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)v9 + 3, a3);
    v11 = objc_msgSend(v8, "copy");
    v12 = (void *)v10[2];
    v10[2] = v11;

  }
  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[NPKPaymentProvisioningFlowPickerItem title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowPickerItem products](self, "products");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p title \"%@\" products %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)products
{
  return self->_products;
}

- (void)setProducts:(id)a3
{
  objc_storeStrong((id *)&self->_products, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_products, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
