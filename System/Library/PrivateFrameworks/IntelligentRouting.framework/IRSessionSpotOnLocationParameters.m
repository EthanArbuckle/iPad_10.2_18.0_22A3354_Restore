@implementation IRSessionSpotOnLocationParameters

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  IRSessionSpotOnLocationParameters *v4;

  v4 = objc_alloc_init(IRSessionSpotOnLocationParameters);
  v4->_resetAllBrokerDiscoveredCandidates = -[IRSessionSpotOnLocationParameters resetAllBrokerDiscoveredCandidates](self, "resetAllBrokerDiscoveredCandidates");
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  _BOOL8 resetAllBrokerDiscoveredCandidates;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  resetAllBrokerDiscoveredCandidates = self->_resetAllBrokerDiscoveredCandidates;
  v5 = a3;
  objc_msgSend(v3, "numberWithBool:", resetAllBrokerDiscoveredCandidates);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("resetAllBrokerDiscoveredCandidates"));

}

- (IRSessionSpotOnLocationParameters)initWithCoder:(id)a3
{
  id v4;
  IRSessionSpotOnLocationParameters *v5;
  IRSessionSpotOnLocationParameters *v6;
  IRSessionSpotOnLocationParameters *v7;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IRSessionSpotOnLocationParameters;
  v5 = -[IRSessionSpotOnLocationParameters init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resetAllBrokerDiscoveredCandidates"));
    v6 = (IRSessionSpotOnLocationParameters *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = -[IRSessionSpotOnLocationParameters BOOLValue](v6, "BOOLValue");

      v5->_resetAllBrokerDiscoveredCandidates = v8;
      v7 = v5;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_resetAllBrokerDiscoveredCandidates);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", resetAllBrokerDiscoveredCandidates: %@"), v7);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  char v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[IRSessionSpotOnLocationParameters resetAllBrokerDiscoveredCandidates](self, "resetAllBrokerDiscoveredCandidates");
    v7 = objc_msgSend(v5, "resetAllBrokerDiscoveredCandidates");

    v8 = v6 ^ v7 ^ 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_resetAllBrokerDiscoveredCandidates ^ 0x1FLL;
}

- (BOOL)resetAllBrokerDiscoveredCandidates
{
  return self->_resetAllBrokerDiscoveredCandidates;
}

- (void)setResetAllBrokerDiscoveredCandidates:(BOOL)a3
{
  self->_resetAllBrokerDiscoveredCandidates = a3;
}

@end
