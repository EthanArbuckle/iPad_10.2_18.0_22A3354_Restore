@implementation FKApplePayReceiptRowViewModel

- (FKApplePayReceiptRowViewModel)initWithReceiptName:(id)a3 cellConfigurationHandler:(id)a4 cellSelectionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  FKApplePayReceiptRowViewModel *v11;
  uint64_t v12;
  NSString *receiptName;
  uint64_t v14;
  id cellConfigurationHandler;
  uint64_t v16;
  id cellSelectionHandler;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FKApplePayReceiptRowViewModel;
  v11 = -[FKApplePayReceiptRowViewModel init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    receiptName = v11->_receiptName;
    v11->_receiptName = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    cellConfigurationHandler = v11->_cellConfigurationHandler;
    v11->_cellConfigurationHandler = (id)v14;

    v16 = objc_msgSend(v10, "copy");
    cellSelectionHandler = v11->_cellSelectionHandler;
    v11->_cellSelectionHandler = (id)v16;

  }
  return v11;
}

- (void)configureCell:(id)a3
{
  id v4;
  void (**v5)(id, id);

  v4 = a3;
  -[FKApplePayReceiptRowViewModel cellConfigurationHandler](self, "cellConfigurationHandler");
  v5 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (void)didSelectCell
{
  void (**v2)(void);

  -[FKApplePayReceiptRowViewModel cellSelectionHandler](self, "cellSelectionHandler");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

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

  v4 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[NSString copy](self->_receiptName, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = objc_msgSend(self->_cellConfigurationHandler, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = objc_msgSend(self->_cellSelectionHandler, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  return v4;
}

- (NSString)receiptName
{
  return self->_receiptName;
}

- (id)cellConfigurationHandler
{
  return self->_cellConfigurationHandler;
}

- (id)cellSelectionHandler
{
  return self->_cellSelectionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cellSelectionHandler, 0);
  objc_storeStrong(&self->_cellConfigurationHandler, 0);
  objc_storeStrong((id *)&self->_receiptName, 0);
}

@end
