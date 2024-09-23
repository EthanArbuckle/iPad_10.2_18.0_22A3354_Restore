@implementation FKApplePayBarcodeRowViewModel

- (FKApplePayBarcodeRowViewModel)initWithCellConfigurationHandler:(id)a3
{
  id v4;
  FKApplePayBarcodeRowViewModel *v5;
  uint64_t v6;
  id cellConfigurationHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FKApplePayBarcodeRowViewModel;
  v5 = -[FKApplePayBarcodeRowViewModel init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    cellConfigurationHandler = v5->_cellConfigurationHandler;
    v5->_cellConfigurationHandler = (id)v6;

  }
  return v5;
}

- (void)configureCell:(id)a3
{
  id v4;
  void (**v5)(id, id);

  v4 = a3;
  -[FKApplePayBarcodeRowViewModel cellConfigurationHandler](self, "cellConfigurationHandler");
  v5 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = objc_msgSend(self->_cellConfigurationHandler, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (id)cellConfigurationHandler
{
  return self->_cellConfigurationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cellConfigurationHandler, 0);
}

@end
