@implementation BMRule

- (BMRule)initWithAntecedent:(id)a3 consequent:(id)a4 support:(double)a5 confidence:(double)a6
{
  return -[BMRule initWithAntecedent:consequent:support:confidence:basketCount:absoluteSupport:absoluteAntecedentSupport:absoluteConsequentSupport:](self, "initWithAntecedent:consequent:support:confidence:basketCount:absoluteSupport:absoluteAntecedentSupport:absoluteConsequentSupport:", a3, a4, 0, 0, 0, 0, a5, a6);
}

- (BMRule)initWithAntecedent:(id)a3 consequent:(id)a4 support:(double)a5 confidence:(double)a6 basketCount:(unint64_t)a7 absoluteSupport:(unint64_t)a8 absoluteAntecedentSupport:(unint64_t)a9 absoluteConsequentSupport:(unint64_t)a10
{
  return -[BMRule initWithAntecedent:consequent:support:confidence:basketCount:absoluteSupport:absoluteAntecedentSupport:absoluteConsequentSupport:uniqueDaysLastWeek:uniqueDaysTotal:](self, "initWithAntecedent:consequent:support:confidence:basketCount:absoluteSupport:absoluteAntecedentSupport:absoluteConsequentSupport:uniqueDaysLastWeek:uniqueDaysTotal:", a3, a4, a7, a8, a9, a10, a5, a6, 0, 0);
}

- (BMRule)initWithAntecedent:(id)a3 consequent:(id)a4 support:(double)a5 confidence:(double)a6 basketCount:(unint64_t)a7 absoluteSupport:(unint64_t)a8 absoluteAntecedentSupport:(unint64_t)a9 absoluteConsequentSupport:(unint64_t)a10 uniqueDaysLastWeek:(unint64_t)a11 uniqueDaysTotal:(unint64_t)a12
{
  id v21;
  id v22;
  BMRule *v23;
  BMRule *v24;
  objc_super v26;

  v21 = a3;
  v22 = a4;
  v26.receiver = self;
  v26.super_class = (Class)BMRule;
  v23 = -[BMRule init](&v26, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_antecedent, a3);
    objc_storeStrong((id *)&v24->_consequent, a4);
    v24->_support = a5;
    v24->_confidence = a6;
    v24->_basketCount = a7;
    v24->_absoluteSupport = a8;
    v24->_absoluteAntecedentSupport = a9;
    v24->_absoluteConsequentSupport = a10;
    v24->_uniqueDaysLastWeek = a11;
    v24->_uniqueDaysTotal = a12;
  }

  return v24;
}

- (double)lift
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = (double)-[BMRule absoluteAntecedentSupport](self, "absoluteAntecedentSupport");
  v4 = v3 / (double)-[BMRule basketCount](self, "basketCount");
  v5 = (double)-[BMRule absoluteConsequentSupport](self, "absoluteConsequentSupport");
  v6 = v5 / (double)-[BMRule basketCount](self, "basketCount");
  -[BMRule support](self, "support");
  return v7 / (v4 * v6);
}

- (double)conviction
{
  double v3;
  double v4;
  double v5;

  v3 = (double)-[BMRule absoluteConsequentSupport](self, "absoluteConsequentSupport");
  v4 = 1.0 - v3 / (double)-[BMRule basketCount](self, "basketCount");
  -[BMRule confidence](self, "confidence");
  return v4 / (1.0 - v5);
}

- (double)rulePowerFactor
{
  double v3;
  double v4;
  double v5;

  -[BMRule support](self, "support");
  v4 = v3;
  -[BMRule confidence](self, "confidence");
  return v4 * v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  id v19;
  id v20;

  v19 = (id)MEMORY[0x24BDD17C8];
  -[BMRule antecedent](self, "antecedent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMRule consequent](self, "consequent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[BMRule absoluteSupport](self, "absoluteSupport"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[BMRule support](self, "support");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[BMRule confidence](self, "confidence");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[BMRule lift](self, "lift");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[BMRule conviction](self, "conviction");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD16E0];
  -[BMRule rulePowerFactor](self, "rulePowerFactor");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[BMRule uniqueDaysLastWeek](self, "uniqueDaysLastWeek"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[BMRule uniqueDaysTotal](self, "uniqueDaysTotal"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("{%@}->{%@}, absolute support: %@, support: %@, confidence: %@, lift: %@, conviction: %@, rulePowerFactor: %@, uniqueDaysLastWeek: %@, uniqueDaysTotal: %@"), v18, v3, v4, v6, v8, v10, v12, v14, v15, v16);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  v5 = v4;
  objc_msgSend(v5, "antecedent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMRule antecedent](self, "antecedent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToSet:", v7))
    goto LABEL_8;
  objc_msgSend(v5, "consequent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMRule consequent](self, "consequent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToSet:", v9)
    || (objc_msgSend(v5, "support"), v11 = v10, -[BMRule support](self, "support"), v11 != v12))
  {

LABEL_8:
    goto LABEL_9;
  }
  objc_msgSend(v5, "confidence");
  v14 = v13;
  -[BMRule confidence](self, "confidence");
  v16 = v15;

  if (v14 != v16)
  {
LABEL_9:
    v17 = 0;
    goto LABEL_10;
  }
  v17 = 1;
LABEL_10:

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  double v7;
  unint64_t v8;
  double v9;
  unint64_t v10;

  -[BMRule antecedent](self, "antecedent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[BMRule consequent](self, "consequent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[BMRule support](self, "support");
  v8 = v6 ^ vcvtd_n_u64_f64(v7, 0x40uLL);
  -[BMRule confidence](self, "confidence");
  v10 = v8 ^ vcvtd_n_u64_f64(v9, 0x40uLL);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BMRule)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  BMRule *v23;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("antecedent"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, CFSTR("consequent"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("support"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValue");
  v12 = v11;
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confidence"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "doubleValue");
  v14 = v13;
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("basketCount"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v27, "unsignedLongValue");
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("absoluteSupport"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v15, "unsignedLongValue");
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("absoluteAntecedentSupport"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedLongValue");
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("absoluteConsequentSupport"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedLongValue");
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueDaysLastWeek"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedLongValue");
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueDaysTotal"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (BMRule *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAntecedent:consequent:support:confidence:basketCount:absoluteSupport:absoluteAntecedentSupport:absoluteConsequentSupport:uniqueDaysLastWeek:uniqueDaysTotal:", v31, v29, v26, v25, v17, v19, v12, v14, v21, objc_msgSend(v22, "unsignedLongValue"));
  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *antecedent;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  antecedent = self->_antecedent;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", antecedent, CFSTR("antecedent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_consequent, CFSTR("consequent"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_support);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("support"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_confidence);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("confidence"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", self->_basketCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("basketCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", self->_absoluteSupport);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("absoluteSupport"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", self->_absoluteAntecedentSupport);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("absoluteAntecedentSupport"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", self->_absoluteConsequentSupport);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("absoluteConsequentSupport"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", self->_uniqueDaysLastWeek);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("uniqueDaysLastWeek"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", self->_uniqueDaysTotal);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("uniqueDaysTotal"));

}

- (NSSet)antecedent
{
  return self->_antecedent;
}

- (NSSet)consequent
{
  return self->_consequent;
}

- (double)support
{
  return self->_support;
}

- (double)confidence
{
  return self->_confidence;
}

- (unint64_t)basketCount
{
  return self->_basketCount;
}

- (unint64_t)absoluteSupport
{
  return self->_absoluteSupport;
}

- (unint64_t)absoluteAntecedentSupport
{
  return self->_absoluteAntecedentSupport;
}

- (unint64_t)absoluteConsequentSupport
{
  return self->_absoluteConsequentSupport;
}

- (unint64_t)uniqueDaysLastWeek
{
  return self->_uniqueDaysLastWeek;
}

- (unint64_t)uniqueDaysTotal
{
  return self->_uniqueDaysTotal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consequent, 0);
  objc_storeStrong((id *)&self->_antecedent, 0);
}

@end
