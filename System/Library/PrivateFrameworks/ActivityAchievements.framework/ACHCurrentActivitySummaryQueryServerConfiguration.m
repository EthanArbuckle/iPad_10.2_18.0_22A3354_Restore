@implementation ACHCurrentActivitySummaryQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ACHCurrentActivitySummaryQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[ACHCurrentActivitySummaryQueryServerConfiguration collectionIntervals](self, "collectionIntervals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCollectionIntervals:", v6);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACHCurrentActivitySummaryQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  ACHCurrentActivitySummaryQueryServerConfiguration *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *collectionIntervals;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ACHCurrentActivitySummaryQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("intervals"));
    v10 = objc_claimAutoreleasedReturnValue();
    collectionIntervals = v5->_collectionIntervals;
    v5->_collectionIntervals = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACHCurrentActivitySummaryQueryServerConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[ACHCurrentActivitySummaryQueryServerConfiguration collectionIntervals](self, "collectionIntervals", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("intervals"));

}

- (NSDictionary)collectionIntervals
{
  return self->_collectionIntervals;
}

- (void)setCollectionIntervals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIntervals, 0);
}

@end
