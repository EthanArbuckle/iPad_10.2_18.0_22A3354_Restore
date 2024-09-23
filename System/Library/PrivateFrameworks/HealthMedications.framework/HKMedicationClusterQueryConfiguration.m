@implementation HKMedicationClusterQueryConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicationClusterQueryConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKMedicationClusterQueryConfiguration *v5;
  uint64_t v6;
  NSArray *scanResult;
  uint64_t v8;
  NSString *machineReadableCode;
  uint64_t v10;
  NSArray *textSearchTokens;
  uint64_t v12;
  NSArray *existingMedications;
  uint64_t v14;
  NSDate *sinceDate;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKMedicationClusterQueryConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_queryType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("QueryType"));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("ScanResult"));
    v6 = objc_claimAutoreleasedReturnValue();
    scanResult = v5->_scanResult;
    v5->_scanResult = (NSArray *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MachineReadableCode"));
    v8 = objc_claimAutoreleasedReturnValue();
    machineReadableCode = v5->_machineReadableCode;
    v5->_machineReadableCode = (NSString *)v8;

    v5->_codeAttributeType = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("CodeAttributeType"));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("TextSearchTokens"));
    v10 = objc_claimAutoreleasedReturnValue();
    textSearchTokens = v5->_textSearchTokens;
    v5->_textSearchTokens = (NSArray *)v10;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("ExistingMedications"));
    v12 = objc_claimAutoreleasedReturnValue();
    existingMedications = v5->_existingMedications;
    v5->_existingMedications = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SinceDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    sinceDate = v5->_sinceDate;
    v5->_sinceDate = (NSDate *)v14;

    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Limit"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMedicationClusterQueryConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_queryType, CFSTR("QueryType"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_scanResult, CFSTR("ScanResult"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_machineReadableCode, CFSTR("MachineReadableCode"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_codeAttributeType, CFSTR("CodeAttributeType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_textSearchTokens, CFSTR("TextSearchTokens"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_existingMedications, CFSTR("ExistingMedications"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sinceDate, CFSTR("SinceDate"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_limit, CFSTR("Limit"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HKMedicationClusterQueryConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v11, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setQueryType:", self->_queryType);
  v5 = (void *)-[NSArray copy](self->_scanResult, "copy");
  objc_msgSend(v4, "setScanResult:", v5);

  v6 = (void *)-[NSString copy](self->_machineReadableCode, "copy");
  objc_msgSend(v4, "setMachineReadableCode:", v6);

  objc_msgSend(v4, "setCodeAttributeType:", self->_codeAttributeType);
  v7 = (void *)-[NSArray copy](self->_textSearchTokens, "copy");
  objc_msgSend(v4, "setTextSearchTokens:", v7);

  v8 = (void *)-[NSArray copy](self->_existingMedications, "copy");
  objc_msgSend(v4, "setExistingMedications:", v8);

  v9 = (void *)-[NSDate copy](self->_sinceDate, "copy");
  objc_msgSend(v4, "setSinceDate:", v9);

  objc_msgSend(v4, "setLimit:", self->_limit);
  return v4;
}

- (int64_t)queryType
{
  return self->_queryType;
}

- (void)setQueryType:(int64_t)a3
{
  self->_queryType = a3;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (NSArray)scanResult
{
  return self->_scanResult;
}

- (void)setScanResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)machineReadableCode
{
  return self->_machineReadableCode;
}

- (void)setMachineReadableCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)codeAttributeType
{
  return self->_codeAttributeType;
}

- (void)setCodeAttributeType:(int64_t)a3
{
  self->_codeAttributeType = a3;
}

- (NSArray)textSearchTokens
{
  return self->_textSearchTokens;
}

- (void)setTextSearchTokens:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)existingMedications
{
  return self->_existingMedications;
}

- (void)setExistingMedications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDate)sinceDate
{
  return self->_sinceDate;
}

- (void)setSinceDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sinceDate, 0);
  objc_storeStrong((id *)&self->_existingMedications, 0);
  objc_storeStrong((id *)&self->_textSearchTokens, 0);
  objc_storeStrong((id *)&self->_machineReadableCode, 0);
  objc_storeStrong((id *)&self->_scanResult, 0);
}

@end
