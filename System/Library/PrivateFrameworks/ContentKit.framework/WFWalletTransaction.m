@implementation WFWalletTransaction

- (WFWalletTransaction)initWithIdentifier:(id)a3 transactionDescription:(id)a4 merchant:(id)a5 currencyAmount:(id)a6 paymentMethod:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  WFWalletTransaction *v17;
  uint64_t v18;
  NSString *identifier;
  uint64_t v20;
  NSString *transactionDescription;
  uint64_t v22;
  INCurrencyAmount *currencyAmount;
  WFWalletTransaction *v24;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)WFWalletTransaction;
  v17 = -[WFWalletTransaction init](&v26, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    transactionDescription = v17->_transactionDescription;
    v17->_transactionDescription = (NSString *)v20;

    objc_storeStrong((id *)&v17->_merchant, a5);
    v22 = objc_msgSend(v15, "copy");
    currencyAmount = v17->_currencyAmount;
    v17->_currencyAmount = (INCurrencyAmount *)v22;

    objc_storeStrong((id *)&v17->_paymentMethod, a7);
    v24 = v17;
  }

  return v17;
}

- (NSString)wfName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[WFWalletTransaction transactionDescription](self, "transactionDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[WFWalletTransaction merchant](self, "merchant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayName");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (WFWalletTransaction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WFWalletTransaction *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchant"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyAmount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentMethod"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[WFWalletTransaction initWithIdentifier:transactionDescription:merchant:currencyAmount:paymentMethod:](self, "initWithIdentifier:transactionDescription:merchant:currencyAmount:paymentMethod:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[WFWalletTransaction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[WFWalletTransaction transactionDescription](self, "transactionDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("transactionDescription"));

  -[WFWalletTransaction merchant](self, "merchant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("merchant"));

  -[WFWalletTransaction currencyAmount](self, "currencyAmount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("currencyAmount"));

  -[WFWalletTransaction paymentMethod](self, "paymentMethod");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("paymentMethod"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)transactionDescription
{
  return self->_transactionDescription;
}

- (WFWalletMerchant)merchant
{
  return self->_merchant;
}

- (INCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (INPaymentMethod)paymentMethod
{
  return self->_paymentMethod;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentMethod, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_transactionDescription, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
