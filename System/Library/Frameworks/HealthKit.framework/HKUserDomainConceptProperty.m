@implementation HKUserDomainConceptProperty

- (HKUserDomainConceptProperty)init
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

- (HKUserDomainConceptProperty)initWithType:(int64_t)a3 version:(int64_t)a4 timestamp:(double)a5 deleted:(BOOL)a6
{
  HKUserDomainConceptProperty *v11;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HKUserDomainConceptProperty;
  v11 = -[HKUserDomainConceptProperty init](&v14, sel_init);
  if (HKIsDeprecatedPropertyType(a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("HKUserDomainConceptProperty.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("HKIsDeprecatedPropertyType(type) == NO"));

    if (!v11)
      return v11;
    goto LABEL_3;
  }
  if (v11)
  {
LABEL_3:
    v11->_type = a3;
    v11->_version = a4;
    v11->_timestamp = a5;
    v11->_deleted = a6;
  }
  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  int64_t version;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  HKStringFromUserDomainConceptPropertyType(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_deleted)
    v5 = CFSTR(" DELETED");
  else
    v5 = &stru_1E37FD4C0;
  version = self->_version;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_timestamp);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUserDomainConceptProperty valueDescription](self, "valueDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@%@ %ld, (%@), %@>"), v4, v5, version, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)mergeListsOfPropertiesWithType:(int64_t)a3 intoListOfProperties:(id)a4 fromListOfProperties:(id)a5 options:(unint64_t)a6
{
  char v6;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  double v19;
  double v20;
  id v23;
  void *v25;
  void *v26;
  _QWORD v27[6];
  _QWORD v28[6];

  v6 = a6;
  v11 = a4;
  v12 = a5;
  v13 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __112__HKUserDomainConceptProperty_mergeListsOfPropertiesWithType_intoListOfProperties_fromListOfProperties_options___block_invoke;
  v28[3] = &__block_descriptor_48_e37_B16__0__HKUserDomainConceptProperty_8l;
  v28[4] = a3;
  v28[5] = a1;
  if ((objc_msgSend(v11, "hk_allObjectsPassTest:", v28) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKUserDomainConceptProperty.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[intoListOfProperties hk_allObjectsPassTest:^BOOL(HKUserDomainConceptProperty *property) { return property.type == type && [property isKindOfClass:self]; }]"));

  }
  v27[0] = v13;
  v27[1] = 3221225472;
  v27[2] = __112__HKUserDomainConceptProperty_mergeListsOfPropertiesWithType_intoListOfProperties_fromListOfProperties_options___block_invoke_2;
  v27[3] = &__block_descriptor_48_e37_B16__0__HKUserDomainConceptProperty_8l;
  v27[4] = a3;
  v27[5] = a1;
  if ((objc_msgSend(v12, "hk_allObjectsPassTest:", v27) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKUserDomainConceptProperty.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[fromListOfProperties hk_allObjectsPassTest:^BOOL(HKUserDomainConceptProperty *property) { return property.type == type && [property isKindOfClass:self]; }]"));

  }
  v14 = objc_msgSend(v12, "count");
  v15 = v11;
  if (v14)
  {
    v16 = objc_msgSend(v11, "count");
    v15 = v12;
    if (v16)
    {
      v17 = MaximumVersionForListOfProperties(v11);
      v18 = MaximumVersionForListOfProperties(v12);
      v19 = MaximumTimestampForListOfProperties(v11);
      v20 = MaximumTimestampForListOfProperties(v12);
      v15 = v12;
      if (v18 <= v17)
      {
        if (v20 > v19 && v18 == v17 && (v6 & 1) == 0)
          v15 = v12;
        else
          v15 = v11;
      }
    }
  }
  v23 = v15;

  return v23;
}

uint64_t __112__HKUserDomainConceptProperty_mergeListsOfPropertiesWithType_intoListOfProperties_fromListOfProperties_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;

  v3 = a2;
  if (objc_msgSend(v3, "type") == *(_QWORD *)(a1 + 32))
    isKindOfClass = objc_opt_isKindOfClass();
  else
    isKindOfClass = 0;

  return isKindOfClass & 1;
}

uint64_t __112__HKUserDomainConceptProperty_mergeListsOfPropertiesWithType_intoListOfProperties_fromListOfProperties_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;

  v3 = a2;
  if (objc_msgSend(v3, "type") == *(_QWORD *)(a1 + 32))
    isKindOfClass = objc_opt_isKindOfClass();
  else
    isKindOfClass = 0;

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  return self->_version ^ self->_type ^ self->_deleted ^ (unint64_t)self->_timestamp;
}

- (BOOL)isEqual:(id)a3
{
  HKUserDomainConceptProperty *v4;
  HKUserDomainConceptProperty *v5;
  BOOL v6;

  v4 = (HKUserDomainConceptProperty *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = self->_type == v5->_type
        && self->_version == v5->_version
        && self->_timestamp == v5->_timestamp
        && self->_deleted == v5->_deleted;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timestamp"), self->_timestamp);
  objc_msgSend(v5, "encodeBool:forKey:", self->_deleted, CFSTR("deleted"));

}

- (HKUserDomainConceptProperty)initWithCoder:(id)a3
{
  id v4;
  HKUserDomainConceptProperty *v5;
  uint64_t v6;
  HKUserDomainConceptProperty *v7;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKUserDomainConceptProperty;
  v5 = -[HKUserDomainConceptProperty init](&v10, sel_init);
  if (!v5)
    goto LABEL_5;
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  if (!HKIsDeprecatedPropertyType(v6))
  {
    v5->_type = v6;
    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    v5->_timestamp = v8;
    v5->_deleted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deleted"));
LABEL_5:
    v7 = v5;
    goto LABEL_6;
  }
  v7 = 0;
LABEL_6:

  return v7;
}

- (void)unitTesting_setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)version
{
  return self->_version;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (id)valueDescription
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
