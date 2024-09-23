@implementation HKDrugInteractionSeverity

- (HKDrugInteractionSeverity)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKDrugInteractionSeverity)initWithSeverityLevel:(unint64_t)a3 validRegionCodes:(id)a4
{
  id v6;
  HKDrugInteractionSeverity *v7;
  HKDrugInteractionSeverity *v8;
  uint64_t v9;
  NSSet *validRegionCodes;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKDrugInteractionSeverity;
  v7 = -[HKDrugInteractionSeverity init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_severityLevel = a3;
    v9 = objc_msgSend(v6, "copy");
    validRegionCodes = v8->_validRegionCodes;
    v8->_validRegionCodes = (NSSet *)v9;

  }
  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  HKStringFromDrugInteractionSeverityLevel(self->_severityLevel);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet allObjects](self->_validRegionCodes, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p severity level:%@, valid region codes:[%@]"), v4, self, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  unint64_t severityLevel;

  severityLevel = self->_severityLevel;
  return -[NSSet hash](self->_validRegionCodes, "hash") ^ severityLevel;
}

- (BOOL)isEqual:(id)a3
{
  HKDrugInteractionSeverity *v4;
  HKDrugInteractionSeverity *v5;
  NSSet *validRegionCodes;
  NSSet *v7;
  char v8;

  v4 = (HKDrugInteractionSeverity *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (self->_severityLevel != v5->_severityLevel)
        goto LABEL_9;
      validRegionCodes = self->_validRegionCodes;
      v7 = v5->_validRegionCodes;
      if (validRegionCodes == v7)
      {
        v8 = 1;
        goto LABEL_11;
      }
      if (v7)
        v8 = -[NSSet isEqualToSet:](validRegionCodes, "isEqualToSet:");
      else
LABEL_9:
        v8 = 0;
LABEL_11:

      goto LABEL_12;
    }
    v8 = 0;
  }
LABEL_12:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t severityLevel;
  id v5;

  severityLevel = self->_severityLevel;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", severityLevel, CFSTR("SeverityLevel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_validRegionCodes, CFSTR("ValidRegionCodes"));

}

- (HKDrugInteractionSeverity)initWithCoder:(id)a3
{
  id v4;
  HKDrugInteractionSeverity *v5;
  void *v6;
  uint64_t v7;
  NSSet *validRegionCodes;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKDrugInteractionSeverity;
  v5 = -[HKDrugInteractionSeverity init](&v10, sel_init);
  if (v5)
  {
    v5->_severityLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SeverityLevel"));
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForSetOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("ValidRegionCodes"));
    v7 = objc_claimAutoreleasedReturnValue();
    validRegionCodes = v5->_validRegionCodes;
    v5->_validRegionCodes = (NSSet *)v7;

  }
  return v5;
}

- (unint64_t)severityLevel
{
  return self->_severityLevel;
}

- (NSSet)validRegionCodes
{
  return self->_validRegionCodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validRegionCodes, 0);
}

@end
