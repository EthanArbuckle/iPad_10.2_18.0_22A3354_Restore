@implementation HKMedicationScheduleItemQueryConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKMedicationScheduleItemQueryConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[HKMedicationScheduleItemQueryConfiguration fromDate](self, "fromDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFromDate:", v5);

  -[HKMedicationScheduleItemQueryConfiguration toDate](self, "toDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToDate:", v6);

  -[HKMedicationScheduleItemQueryConfiguration identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v7);

  -[HKMedicationScheduleItemQueryConfiguration sortDescriptors](self, "sortDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v8);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicationScheduleItemQueryConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKMedicationScheduleItemQueryConfiguration *v5;
  uint64_t v6;
  NSDate *fromDate;
  uint64_t v8;
  NSDate *toDate;
  uint64_t v10;
  NSString *identifier;
  void *v12;
  uint64_t v13;
  NSArray *sortDescriptors;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKMedicationScheduleItemQueryConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FromDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    fromDate = v5->_fromDate;
    v5->_fromDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ToDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    toDate = v5->_toDate;
    v5->_toDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("SortDescriptors"));
    v13 = objc_claimAutoreleasedReturnValue();
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMedicationScheduleItemQueryConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_fromDate, CFSTR("FromDate"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_toDate, CFSTR("ToDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("Identifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sortDescriptors, CFSTR("SortDescriptors"));

}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (void)setFromDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)toDate
{
  return self->_toDate;
}

- (void)setToDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_toDate, 0);
  objc_storeStrong((id *)&self->_fromDate, 0);
}

@end
