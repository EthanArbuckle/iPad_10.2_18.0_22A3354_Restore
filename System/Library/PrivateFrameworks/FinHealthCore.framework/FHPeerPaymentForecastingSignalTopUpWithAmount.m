@implementation FHPeerPaymentForecastingSignalTopUpWithAmount

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FHPeerPaymentForecastingSignalTopUpWithAmount;
  v4 = a3;
  -[FHPeerPaymentForecastingSignalTopUp encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_amount, CFSTR("amount"), v5.receiver, v5.super_class);

}

- (FHPeerPaymentForecastingSignalTopUpWithAmount)initWithCoder:(id)a3
{
  id v4;
  FHPeerPaymentForecastingSignalTopUpWithAmount *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FHPeerPaymentForecastingSignalTopUpWithAmount;
  v5 = -[FHPeerPaymentForecastingSignalTopUp initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHPeerPaymentForecastingSignalTopUpWithAmount setAmount:](v5, "setAmount:", v6);

  }
  return v5;
}

- (FHPeerPaymentForecastingSignalTopUpWithAmount)init
{
  FHPeerPaymentForecastingSignalTopUpWithAmount *v2;
  FHPeerPaymentForecastingSignalTopUpWithAmount *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FHPeerPaymentForecastingSignalTopUpWithAmount;
  v2 = -[FHPeerPaymentForecastingSignalTopUp init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[FHPeerPaymentForecastingSignal setForecastingType:](v2, "setForecastingType:", 6);
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", &stru_250C67C70);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)FHPeerPaymentForecastingSignalTopUpWithAmount;
  -[FHPeerPaymentForecastingSignalTopUp description](&v6, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("amount"), self->_amount);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FHPeerPaymentForecastingSignalTopUpWithAmount;
  v3 = -[FHPeerPaymentForecastingSignalTopUp hash](&v7, sel_hash);
  -[FHPeerPaymentForecastingSignalTopUpWithAmount amount](self, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") + 43 * v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  FHPeerPaymentForecastingSignalTopUpWithAmount *v4;
  FHPeerPaymentForecastingSignalTopUpWithAmount *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (FHPeerPaymentForecastingSignalTopUpWithAmount *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
         && (v6 = -[FHPeerPaymentForecastingSignal forecastingType](self, "forecastingType"),
             v6 == -[FHPeerPaymentForecastingSignal forecastingType](v5, "forecastingType")))
  {
    -[FHPeerPaymentForecastingSignalTopUpWithAmount amount](self, "amount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHPeerPaymentForecastingSignalTopUpWithAmount amount](v5, "amount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
