@implementation _HDStatisticsSyntheticQuantityType

+ (id)syntheticQuantityTypeWithUnderlyingSampleType:(id)a3 aggregationStyle:(int64_t)a4 canonicalUnit:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a3;
  v9 = -[_HDStatisticsSyntheticQuantityType _initWithUnderlyingSampleType:aggregationStyle:canonicalUnit:shouldUseUnderlyingTypeForStatistics:]([_HDStatisticsSyntheticQuantityType alloc], v8, a4, v7, 1);

  return v9;
}

- (id)_initWithUnderlyingSampleType:(uint64_t)a3 aggregationStyle:(void *)a4 canonicalUnit:(char)a5 shouldUseUnderlyingTypeForStatistics:
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v9 = a2;
  v10 = a4;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)_HDStatisticsSyntheticQuantityType;
    a1 = objc_msgSendSuper2(&v16, sel__initWithCode_, objc_msgSend(v9, "code"));
    if (a1)
    {
      v11 = objc_msgSend(v9, "copy");
      v12 = (void *)*((_QWORD *)a1 + 6);
      *((_QWORD *)a1 + 6) = v11;

      *((_QWORD *)a1 + 7) = a3;
      v13 = objc_msgSend(v10, "copy");
      v14 = (void *)*((_QWORD *)a1 + 8);
      *((_QWORD *)a1 + 8) = v13;

      *((_BYTE *)a1 + 40) = a5;
    }
  }

  return a1;
}

+ (id)syntheticQuantityTypeWithUnderlyingSampleType:(id)a3 aggregationStyle:(int64_t)a4 canonicalUnit:(id)a5 shouldUseUnderlyingTypeForStatistics:(BOOL)a6
{
  id v9;
  id v10;
  id v11;

  v9 = a5;
  v10 = a3;
  v11 = -[_HDStatisticsSyntheticQuantityType _initWithUnderlyingSampleType:aggregationStyle:canonicalUnit:shouldUseUnderlyingTypeForStatistics:]([_HDStatisticsSyntheticQuantityType alloc], v10, a4, v9, a6);

  return v11;
}

+ (id)syntheticQuantityTypeWithConfigurationProviding:(id)a3
{
  id v3;
  _HDStatisticsSyntheticQuantityType *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = [_HDStatisticsSyntheticQuantityType alloc];
  objc_msgSend(v3, "underlyingSampleType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "aggregationStyleForStatistics");
  objc_msgSend(v3, "canonicalUnitForStatistics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[_HDStatisticsSyntheticQuantityType _initWithUnderlyingSampleType:aggregationStyle:canonicalUnit:shouldUseUnderlyingTypeForStatistics:](v4, v5, v6, v7, 1);
  return v8;
}

- (int64_t)aggregationStyle
{
  return self->_overriddenAggregationStyle;
}

- (id)canonicalUnit
{
  return self->_overriddenCanonicalUnit;
}

- (Class)dataObjectClass
{
  return (Class)-[HKSampleType dataObjectClass](self->_underlyingSampleType, "dataObjectClass");
}

+ (BOOL)supportsSecureCoding
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("The -%@ method is not available on %@"), v4, objc_opt_class());

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

}

- (_HDStatisticsSyntheticQuantityType)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("The -%@ method is not available on %@"), v6, objc_opt_class());

  return 0;
}

- (HKSampleType)underlyingSampleType
{
  return self->_underlyingSampleType;
}

- (int64_t)overriddenAggregationStyle
{
  return self->_overriddenAggregationStyle;
}

- (HKUnit)overriddenCanonicalUnit
{
  return self->_overriddenCanonicalUnit;
}

- (BOOL)shouldUseUnderlyingTypeForStatistics
{
  return self->_shouldUseUnderlyingTypeForStatistics;
}

- (void)setShouldUseUnderlyingTypeForStatistics:(BOOL)a3
{
  self->_shouldUseUnderlyingTypeForStatistics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overriddenCanonicalUnit, 0);
  objc_storeStrong((id *)&self->_underlyingSampleType, 0);
}

@end
