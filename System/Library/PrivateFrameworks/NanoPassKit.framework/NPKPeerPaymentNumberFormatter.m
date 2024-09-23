@implementation NPKPeerPaymentNumberFormatter

- (NPKPeerPaymentNumberFormatter)init
{
  return -[NPKPeerPaymentNumberFormatter initWithCurrencyCode:](self, "initWithCurrencyCode:", 0);
}

- (NPKPeerPaymentNumberFormatter)initWithCurrencyCode:(id)a3
{
  id v5;
  NPKPeerPaymentNumberFormatter *v6;
  NPKPeerPaymentNumberFormatter *v7;
  uint64_t v8;
  NSNumberFormatter *decimalNumberFormatter;
  uint64_t v10;
  NSNumberFormatter *nonDecimalNumberFormatter;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NPKPeerPaymentNumberFormatter;
  v6 = -[NPKPeerPaymentNumberFormatter init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_currencyCode, a3);
    NPKPeerPaymentDecimalNumberFormatterForCurrencyCode();
    v8 = objc_claimAutoreleasedReturnValue();
    decimalNumberFormatter = v7->_decimalNumberFormatter;
    v7->_decimalNumberFormatter = (NSNumberFormatter *)v8;

    NPKPeerPaymentNumberFormatterForCurrencyCode();
    v10 = objc_claimAutoreleasedReturnValue();
    nonDecimalNumberFormatter = v7->_nonDecimalNumberFormatter;
    v7->_nonDecimalNumberFormatter = (NSNumberFormatter *)v10;

  }
  return v7;
}

- (void)setCurrencyCode:(id)a3
{
  NSNumberFormatter *decimalNumberFormatter;
  id v5;

  if (self->_currencyCode != a3)
  {
    decimalNumberFormatter = self->_decimalNumberFormatter;
    v5 = a3;
    -[NSNumberFormatter setCurrencyCode:](decimalNumberFormatter, "setCurrencyCode:", v5);
    -[NSNumberFormatter setCurrencyCode:](self->_nonDecimalNumberFormatter, "setCurrencyCode:", v5);

  }
}

- (id)stringFromNumber:(id)a3
{
  id v4;
  int HasDecimals;
  uint64_t v6;
  id v7;
  void *v8;

  v4 = a3;
  HasDecimals = NPKPeerPaymentValueHasDecimals(v4);
  v6 = 16;
  if (HasDecimals)
    v6 = 8;
  v7 = *(id *)((char *)&self->super.isa + v6);
  objc_msgSend(v7, "stringFromNumber:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)currencySymbol
{
  return -[NSNumberFormatter currencySymbol](self->_decimalNumberFormatter, "currencySymbol");
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_nonDecimalNumberFormatter, 0);
  objc_storeStrong((id *)&self->_decimalNumberFormatter, 0);
}

@end
