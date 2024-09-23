@implementation FHPeerPaymentForecastingSignalPerson

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FHPeerPaymentForecastingSignalPerson;
  v4 = a3;
  -[FHPeerPaymentForecastingSignal encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_personId, CFSTR("personId"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_direction, CFSTR("direction"));

}

- (FHPeerPaymentForecastingSignalPerson)initWithCoder:(id)a3
{
  id v4;
  FHPeerPaymentForecastingSignalPerson *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FHPeerPaymentForecastingSignalPerson;
  v5 = -[FHPeerPaymentForecastingSignal initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHPeerPaymentForecastingSignalPerson setPersonId:](v5, "setPersonId:", v6);

    -[FHPeerPaymentForecastingSignalPerson setDirection:](v5, "setDirection:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("direction")));
  }

  return v5;
}

- (FHPeerPaymentForecastingSignalPerson)init
{
  FHPeerPaymentForecastingSignalPerson *v2;
  FHPeerPaymentForecastingSignalPerson *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FHPeerPaymentForecastingSignalPerson;
  v2 = -[FHPeerPaymentForecastingSignalPerson init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[FHPeerPaymentForecastingSignal setForecastingType:](v2, "setForecastingType:", 2);
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
  v6.super_class = (Class)FHPeerPaymentForecastingSignalPerson;
  -[FHPeerPaymentForecastingSignal description](&v6, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("personId"), self->_personId);
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
  v7.super_class = (Class)FHPeerPaymentForecastingSignalPerson;
  v3 = -[FHPeerPaymentForecastingSignal hash](&v7, sel_hash);
  -[FHPeerPaymentForecastingSignalPerson personId](self, "personId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") + 43 * v3;

  return -[FHPeerPaymentForecastingSignalPerson direction](self, "direction") + 43 * v5;
}

- (BOOL)isEqual:(id)a3
{
  FHPeerPaymentForecastingSignalPerson *v4;
  FHPeerPaymentForecastingSignalPerson *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int64_t v9;
  BOOL v10;

  v4 = (FHPeerPaymentForecastingSignalPerson *)a3;
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
    -[FHPeerPaymentForecastingSignalPerson personId](self, "personId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHPeerPaymentForecastingSignalPerson personId](v5, "personId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      v9 = -[FHPeerPaymentForecastingSignalPerson direction](self, "direction");
      v10 = v9 == -[FHPeerPaymentForecastingSignalPerson direction](v5, "direction");
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

- (NSString)personId
{
  return self->_personId;
}

- (void)setPersonId:(id)a3
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
  objc_storeStrong((id *)&self->_personId, 0);
}

@end
