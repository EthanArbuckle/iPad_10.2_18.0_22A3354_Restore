@implementation FKApplePayRowViewModelCollection

- (FKApplePayRowViewModelCollection)initWithOrderRowViewModel:(id)a3 barcodeRowViewModel:(id)a4 receiptRowViewModel:(id)a5
{
  id v8;
  id v9;
  id v10;
  FKApplePayRowViewModelCollection *v11;
  uint64_t v12;
  FKApplePayOrderRowViewModel *orderRowViewModel;
  uint64_t v14;
  FKApplePayBarcodeRowViewModel *barcodeRowViewModel;
  uint64_t v16;
  FKApplePayReceiptRowViewModel *receiptRowViewModel;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FKApplePayRowViewModelCollection;
  v11 = -[FKApplePayRowViewModelCollection init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    orderRowViewModel = v11->_orderRowViewModel;
    v11->_orderRowViewModel = (FKApplePayOrderRowViewModel *)v12;

    v14 = objc_msgSend(v9, "copy");
    barcodeRowViewModel = v11->_barcodeRowViewModel;
    v11->_barcodeRowViewModel = (FKApplePayBarcodeRowViewModel *)v14;

    v16 = objc_msgSend(v10, "copy");
    receiptRowViewModel = v11->_receiptRowViewModel;
    v11->_receiptRowViewModel = (FKApplePayReceiptRowViewModel *)v16;

  }
  return v11;
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
  v5 = -[FKApplePayOrderRowViewModel copy](self->_orderRowViewModel, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[FKApplePayBarcodeRowViewModel copy](self->_barcodeRowViewModel, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[FKApplePayReceiptRowViewModel copy](self->_receiptRowViewModel, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  return v4;
}

- (FKApplePayOrderRowViewModel)orderRowViewModel
{
  return self->_orderRowViewModel;
}

- (FKApplePayBarcodeRowViewModel)barcodeRowViewModel
{
  return self->_barcodeRowViewModel;
}

- (FKApplePayReceiptRowViewModel)receiptRowViewModel
{
  return self->_receiptRowViewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiptRowViewModel, 0);
  objc_storeStrong((id *)&self->_barcodeRowViewModel, 0);
  objc_storeStrong((id *)&self->_orderRowViewModel, 0);
}

@end
