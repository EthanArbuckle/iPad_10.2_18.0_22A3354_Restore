@implementation FHAmountAggregateFeature

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FHAmountAggregateFeature;
  v4 = a3;
  -[FHAggregateFeature encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHAmountAggregateFeature amount](self, "amount", v6.receiver, v6.super_class), CFSTR("amount"));
  -[FHAmountAggregateFeature comparator](self, "comparator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("comparator"));

}

- (FHAmountAggregateFeature)initWithCoder:(id)a3
{
  id v4;
  FHAmountAggregateFeature *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FHAmountAggregateFeature;
  v5 = -[FHAmountAggregateFeature init](&v8, sel_init);
  if (v5)
  {
    -[FHAmountAggregateFeature setAmount:](v5, "setAmount:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("amount")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("comparator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHAmountAggregateFeature setComparator:](v5, "setComparator:", v6);

  }
  return v5;
}

- (FHAmountAggregateFeature)initWithAmount:(unint64_t)a3 comparator:(id)a4
{
  id v7;
  FHAmountAggregateFeature *v8;
  FHAmountAggregateFeature *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FHAmountAggregateFeature;
  v8 = -[FHAmountAggregateFeature init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[FHAggregateFeature setType:](v8, "setType:", 1);
    v9->_amount = a3;
    objc_storeStrong((id *)&v9->_comparator, a4);
  }

  return v9;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("amount"), self->_amount);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("comparator"), self->_comparator);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3;
  int64_t v4;
  void *v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FHAmountAggregateFeature;
  v3 = -[FHAggregateFeature hash](&v8, sel_hash);
  v4 = -[FHAmountAggregateFeature amount](self, "amount") - v3 + 32 * v3;
  -[FHAmountAggregateFeature comparator](self, "comparator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  FHAmountAggregateFeature *v4;
  FHAmountAggregateFeature *v5;
  int64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  objc_super v11;

  v4 = (FHAmountAggregateFeature *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
         && (v11.receiver = self,
             v11.super_class = (Class)FHAmountAggregateFeature,
             -[FHAggregateFeature isEqual:](&v11, sel_isEqual_, v5))
         && (v6 = -[FHAmountAggregateFeature amount](self, "amount"),
             v6 == -[FHAmountAggregateFeature amount](v5, "amount")))
  {
    -[FHAmountAggregateFeature comparator](self, "comparator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHAmountAggregateFeature comparator](v5, "comparator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7 == v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)comparator
{
  return self->_comparator;
}

- (void)setComparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)amount
{
  return self->_amount;
}

- (void)setAmount:(int64_t)a3
{
  self->_amount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparator, 0);
}

@end
