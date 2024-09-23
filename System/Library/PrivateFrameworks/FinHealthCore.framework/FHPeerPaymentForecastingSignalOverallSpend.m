@implementation FHPeerPaymentForecastingSignalOverallSpend

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FHPeerPaymentForecastingSignalOverallSpend;
  v4 = a3;
  -[FHPeerPaymentForecastingSignal encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_amount, CFSTR("amount"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_direction, CFSTR("direction"));

}

- (FHPeerPaymentForecastingSignalOverallSpend)initWithCoder:(id)a3
{
  id v4;
  FHPeerPaymentForecastingSignalOverallSpend *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FHPeerPaymentForecastingSignalOverallSpend;
  v5 = -[FHPeerPaymentForecastingSignal initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHPeerPaymentForecastingSignalOverallSpend setAmount:](v5, "setAmount:", v6);

    -[FHPeerPaymentForecastingSignalOverallSpend setDirection:](v5, "setDirection:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("direction")));
  }

  return v5;
}

- (FHPeerPaymentForecastingSignalOverallSpend)init
{
  FHPeerPaymentForecastingSignalOverallSpend *v2;
  FHPeerPaymentForecastingSignalOverallSpend *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FHPeerPaymentForecastingSignalOverallSpend;
  v2 = -[FHPeerPaymentForecastingSignalOverallSpend init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[FHPeerPaymentForecastingSignal setForecastingType:](v2, "setForecastingType:", 1);
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
  v6.super_class = (Class)FHPeerPaymentForecastingSignalOverallSpend;
  -[FHPeerPaymentForecastingSignal description](&v6, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("amount"), self->_amount);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("direction"), self->_direction);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FHPeerPaymentForecastingSignalOverallSpend;
  v3 = -[FHPeerPaymentForecastingSignal hash](&v7, sel_hash);
  -[FHPeerPaymentForecastingSignalOverallSpend amount](self, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") + 43 * v3;

  return -[FHPeerPaymentForecastingSignalOverallSpend direction](self, "direction") + 43 * v5;
}

- (BOOL)isEqual:(id)a3
{
  FHPeerPaymentForecastingSignalOverallSpend *v4;
  FHPeerPaymentForecastingSignalOverallSpend *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int64_t v9;
  BOOL v10;

  v4 = (FHPeerPaymentForecastingSignalOverallSpend *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if (v4
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
         && (v6 = -[FHPeerPaymentForecastingSignal forecastingType](self, "forecastingType"),
             v6 == -[FHPeerPaymentForecastingSignal forecastingType](v5, "forecastingType")))
  {
    -[FHPeerPaymentForecastingSignalOverallSpend amount](self, "amount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHPeerPaymentForecastingSignalOverallSpend amount](v5, "amount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      v9 = -[FHPeerPaymentForecastingSignalOverallSpend direction](self, "direction");
      v10 = v9 == -[FHPeerPaymentForecastingSignalOverallSpend direction](v5, "direction");
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
