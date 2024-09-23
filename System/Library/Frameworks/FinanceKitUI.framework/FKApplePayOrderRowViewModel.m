@implementation FKApplePayOrderRowViewModel

- (FKApplePayOrderRowViewModel)initWithOrderTypeIdentifier:(id)a3 orderIdentifier:(id)a4 fulfillmentIdentifier:(id)a5 cellConfigurationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FKApplePayOrderRowViewModel *v14;
  uint64_t v15;
  NSString *orderTypeIdentifier;
  uint64_t v17;
  NSString *orderIdentifier;
  uint64_t v19;
  NSString *fulfillmentIdentifier;
  uint64_t v21;
  id cellConfigurationHandler;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)FKApplePayOrderRowViewModel;
  v14 = -[FKApplePayOrderRowViewModel init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    orderTypeIdentifier = v14->_orderTypeIdentifier;
    v14->_orderTypeIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    orderIdentifier = v14->_orderIdentifier;
    v14->_orderIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    fulfillmentIdentifier = v14->_fulfillmentIdentifier;
    v14->_fulfillmentIdentifier = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    cellConfigurationHandler = v14->_cellConfigurationHandler;
    v14->_cellConfigurationHandler = (id)v21;

  }
  return v14;
}

- (void)configureCell:(id)a3
{
  id v4;
  void (**v5)(id, id);

  v4 = a3;
  -[FKApplePayOrderRowViewModel cellConfigurationHandler](self, "cellConfigurationHandler");
  v5 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[NSString copy](self->_orderTypeIdentifier, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_orderIdentifier, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSString copy](self->_fulfillmentIdentifier, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  v11 = objc_msgSend(self->_cellConfigurationHandler, "copy");
  v12 = (void *)v4[4];
  v4[4] = v11;

  return v4;
}

- (NSString)orderTypeIdentifier
{
  return self->_orderTypeIdentifier;
}

- (NSString)orderIdentifier
{
  return self->_orderIdentifier;
}

- (NSString)fulfillmentIdentifier
{
  return self->_fulfillmentIdentifier;
}

- (id)cellConfigurationHandler
{
  return self->_cellConfigurationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cellConfigurationHandler, 0);
  objc_storeStrong((id *)&self->_fulfillmentIdentifier, 0);
  objc_storeStrong((id *)&self->_orderIdentifier, 0);
  objc_storeStrong((id *)&self->_orderTypeIdentifier, 0);
}

@end
