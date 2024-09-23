@implementation _HKCurrentActivitySummaryQueryServerConfiguration

- (_HKCurrentActivitySummaryQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKCurrentActivitySummaryQueryServerConfiguration *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *collectionIntervals;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HKCurrentActivitySummaryQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
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

- (NSDictionary)collectionIntervals
{
  return self->_collectionIntervals;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIntervals, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_HKCurrentActivitySummaryQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSDictionary copy](self->_collectionIntervals, "copy");
  v6 = (void *)v4[7];
  v4[7] = v5;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKCurrentActivitySummaryQueryServerConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_collectionIntervals, CFSTR("intervals"), v5.receiver, v5.super_class);

}

- (void)setCollectionIntervals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

@end
