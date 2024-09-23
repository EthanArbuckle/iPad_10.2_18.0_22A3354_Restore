@implementation DDMatchMoneyAmount

- (DDMatchMoneyAmount)initWithDDScannerResult:(id)a3
{
  id v4;
  DDMatchMoneyAmount *v5;
  int v6;
  id v7;
  id v8;
  id v10;
  double v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DDMatchMoneyAmount;
  v5 = -[DDMatch initWithDDScannerResult:](&v12, sel_initWithDDScannerResult_, v4);
  if (v5)
  {
    v10 = 0;
    v11 = 0.0;
    v6 = objc_msgSend(v4, "getMoneyAmount:currency:", &v11, &v10);
    v7 = v10;
    v8 = v10;
    if (v6)
    {
      objc_storeStrong((id *)&v5->_currency, v7);
      v5->_amount = v11;
    }

  }
  return v5;
}

- (NSString)currency
{
  return self->_currency;
}

- (double)amount
{
  return self->_amount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currency, 0);
}

@end
