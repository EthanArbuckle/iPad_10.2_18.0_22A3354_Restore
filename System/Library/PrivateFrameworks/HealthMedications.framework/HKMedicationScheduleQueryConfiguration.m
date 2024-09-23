@implementation HKMedicationScheduleQueryConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicationScheduleQueryConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKMedicationScheduleQueryConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSArray *sortDescriptors;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKMedicationScheduleQueryConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Limit"));
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("SortDescriptors"));
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
  v5.super_class = (Class)HKMedicationScheduleQueryConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_limit, CFSTR("Limit"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sortDescriptors, CFSTR("SortDescriptors"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKMedicationScheduleQueryConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setLimit:", self->_limit);
  objc_msgSend(v4, "setSortDescriptors:", self->_sortDescriptors);
  return v4;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

@end
