@implementation HKValueHistogramCollectionQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKValueHistogramCollectionQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 7, self->_anchorDate);
  objc_storeStrong(v4 + 8, self->_intervalComponents);
  objc_storeStrong(v4 + 9, self->_quantityRanges);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKValueHistogramCollectionQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKValueHistogramCollectionQueryServerConfiguration *v5;
  uint64_t v6;
  NSDate *anchorDate;
  uint64_t v8;
  NSDateComponents *intervalComponents;
  void *v10;
  uint64_t v11;
  NSArray *quantityRanges;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKValueHistogramCollectionQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anchorDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    anchorDate = v5->_anchorDate;
    v5->_anchorDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intervalComponents"));
    v8 = objc_claimAutoreleasedReturnValue();
    intervalComponents = v5->_intervalComponents;
    v5->_intervalComponents = (NSDateComponents *)v8;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("quantityRanges"));
    v11 = objc_claimAutoreleasedReturnValue();
    quantityRanges = v5->_quantityRanges;
    v5->_quantityRanges = (NSArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKValueHistogramCollectionQueryServerConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchorDate, CFSTR("anchorDate"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_intervalComponents, CFSTR("intervalComponents"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_quantityRanges, CFSTR("quantityRanges"));

}

- (NSDate)anchorDate
{
  return self->_anchorDate;
}

- (void)setAnchorDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDateComponents)intervalComponents
{
  return self->_intervalComponents;
}

- (void)setIntervalComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)quantityRanges
{
  return self->_quantityRanges;
}

- (void)setQuantityRanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantityRanges, 0);
  objc_storeStrong((id *)&self->_intervalComponents, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
}

@end
