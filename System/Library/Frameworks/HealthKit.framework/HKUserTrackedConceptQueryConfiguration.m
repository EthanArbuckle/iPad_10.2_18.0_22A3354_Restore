@implementation HKUserTrackedConceptQueryConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKUserTrackedConceptQueryConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = (void *)-[NSArray copy](self->_sortDescriptors, "copy");
  objc_msgSend(v4, "setSortDescriptors:", v5);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKUserTrackedConceptQueryConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKUserTrackedConceptQueryConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSArray *sortDescriptors;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKUserTrackedConceptQueryConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("sortDescriptors"));
    v7 = objc_claimAutoreleasedReturnValue();
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKUserTrackedConceptQueryConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sortDescriptors, CFSTR("sortDescriptors"), v5.receiver, v5.super_class);

}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

@end
