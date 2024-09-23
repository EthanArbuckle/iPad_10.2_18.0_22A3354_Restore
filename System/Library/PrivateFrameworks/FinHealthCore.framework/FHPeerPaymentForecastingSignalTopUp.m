@implementation FHPeerPaymentForecastingSignalTopUp

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FHPeerPaymentForecastingSignalTopUp;
  -[FHPeerPaymentForecastingSignal encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (FHPeerPaymentForecastingSignalTopUp)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FHPeerPaymentForecastingSignalTopUp;
  return -[FHPeerPaymentForecastingSignal initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (FHPeerPaymentForecastingSignalTopUp)init
{
  FHPeerPaymentForecastingSignalTopUp *v2;
  FHPeerPaymentForecastingSignalTopUp *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FHPeerPaymentForecastingSignalTopUp;
  v2 = -[FHPeerPaymentForecastingSignalTopUp init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[FHPeerPaymentForecastingSignal setForecastingType:](v2, "setForecastingType:", 5);
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)FHPeerPaymentForecastingSignalTopUp;
  -[FHPeerPaymentForecastingSignal description](&v6, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  return v3;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FHPeerPaymentForecastingSignalTopUp;
  return -[FHPeerPaymentForecastingSignal hash](&v3, sel_hash);
}

- (BOOL)isEqual:(id)a3
{
  FHPeerPaymentForecastingSignalTopUp *v4;
  FHPeerPaymentForecastingSignalTopUp *v5;
  unint64_t v6;
  BOOL v7;

  v4 = (FHPeerPaymentForecastingSignalTopUp *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = -[FHPeerPaymentForecastingSignal forecastingType](self, "forecastingType");
    v7 = v6 == -[FHPeerPaymentForecastingSignal forecastingType](v5, "forecastingType");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
