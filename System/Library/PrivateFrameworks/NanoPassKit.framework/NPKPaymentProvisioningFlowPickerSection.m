@implementation NPKPaymentProvisioningFlowPickerSection

+ (id)sectionWithTitle:(id)a3 productType:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sectionWithTitle:footer:productType:items:", v8, 0, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)sectionWithTitle:(id)a3 productType:(id)a4 items:(id)a5
{
  return (id)objc_msgSend(a1, "sectionWithTitle:footer:productType:items:", a3, 0, a4, a5);
}

+ (id)sectionWithTitle:(id)a3 footer:(id)a4 productType:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sectionWithTitle:footer:productType:items:", v11, v10, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)sectionWithTitle:(id)a3 footer:(id)a4 productType:(id)a5 items:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init((Class)a1);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    v16 = (void *)*((_QWORD *)v14 + 1);
    *((_QWORD *)v14 + 1) = v15;

    v17 = objc_msgSend(v11, "copy");
    v18 = (void *)*((_QWORD *)v14 + 2);
    *((_QWORD *)v14 + 2) = v17;

    v19 = (void *)MEMORY[0x24BDBCEB8];
    v20 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v19, "arrayWithArray:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)*((_QWORD *)v14 + 3);
    *((_QWORD *)v14 + 3) = v21;

    objc_storeStrong((id *)v14 + 4, a5);
  }

  return v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[NPKPaymentProvisioningFlowPickerSection title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowPickerSection footer](self, "footer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowPickerSection items](self, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p title \"%@\" footer \"%@\" items %@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isTransitSection
{
  void *v2;
  char v3;

  -[NPKPaymentProvisioningFlowPickerSection productType](self, "productType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToNumber:", &unk_24D0564E8);

  return v3;
}

- (BOOL)isPaymentSection
{
  void *v2;
  char v3;

  -[NPKPaymentProvisioningFlowPickerSection productType](self, "productType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToNumber:", &unk_24D056500);

  return v3;
}

- (BOOL)isEMoneySection
{
  void *v2;
  char v3;

  -[NPKPaymentProvisioningFlowPickerSection productType](self, "productType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToNumber:", &unk_24D056518);

  return v3;
}

- (BOOL)isAppleBalanceSection
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  -[NPKPaymentProvisioningFlowPickerSection productType](self, "productType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToNumber:", &unk_24D056530);

  if (!v4)
    return 0;
  -[NPKPaymentProvisioningFlowPickerSection items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pk_containsObjectPassingTest:", &__block_literal_global_2);

  return v6;
}

uint64_t __64__NPKPaymentProvisioningFlowPickerSection_isAppleBalanceSection__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "products");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pk_containsObjectPassingTest:", &__block_literal_global_66);

  return v3;
}

uint64_t __64__NPKPaymentProvisioningFlowPickerSection_isAppleBalanceSection__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAppleBalanceProduct");
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableArray)items
{
  return self->_items;
}

- (NSNumber)productType
{
  return self->_productType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
