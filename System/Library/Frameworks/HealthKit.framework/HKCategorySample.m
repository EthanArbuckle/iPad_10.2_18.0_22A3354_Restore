@implementation HKCategorySample

+ (HKCategorySample)categorySampleWithType:(HKCategoryType *)type value:(NSInteger)value startDate:(NSDate *)startDate endDate:(NSDate *)endDate device:(HKDevice *)device metadata:(NSDictionary *)metadata
{
  HKCategoryType *v14;
  NSDate *v15;
  NSDate *v16;
  HKDevice *v17;
  NSDictionary *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  _QWORD v25[5];

  v14 = type;
  v15 = startDate;
  v16 = endDate;
  v17 = device;
  v18 = metadata;
  if (!v15)
  {
    v20 = 2.22507386e-308;
    if (v16)
      goto LABEL_3;
LABEL_5:
    v22 = 2.22507386e-308;
    goto LABEL_6;
  }
  -[NSDate timeIntervalSinceReferenceDate](v15, "timeIntervalSinceReferenceDate");
  v20 = v19;
  if (!v16)
    goto LABEL_5;
LABEL_3:
  -[NSDate timeIntervalSinceReferenceDate](v16, "timeIntervalSinceReferenceDate");
  v22 = v21;
LABEL_6:
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __83__HKCategorySample_categorySampleWithType_value_startDate_endDate_device_metadata___block_invoke;
  v25[3] = &__block_descriptor_40_e26_v16__0__HKCategorySample_8l;
  v25[4] = value;
  v23 = (void *)objc_msgSend(a1, "_newSampleWithType:startDate:endDate:device:metadata:config:", v14, v17, v18, v25, v20, v22);

  return (HKCategorySample *)v23;
}

uint64_t __83__HKCategorySample_categorySampleWithType_value_startDate_endDate_device_metadata___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setValue:", *(_QWORD *)(a1 + 32));
}

- (void)_setValue:(int64_t)a3
{
  self->_value = a3;
}

- (NSInteger)value
{
  void *v3;
  NSInteger v4;

  -[HKCategorySample categoryType](self, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_categoryValueForValue:", self->_value);

  return v4;
}

- (id)_valueDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_value);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HKCategorySample)init
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

+ (HKCategorySample)categorySampleWithType:(HKCategoryType *)type value:(NSInteger)value startDate:(NSDate *)startDate endDate:(NSDate *)endDate metadata:(NSDictionary *)metadata
{
  return (HKCategorySample *)objc_msgSend(a1, "categorySampleWithType:value:startDate:endDate:device:metadata:", type, value, startDate, endDate, 0, metadata);
}

+ (HKCategorySample)categorySampleWithType:(HKCategoryType *)type value:(NSInteger)value startDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
  return (HKCategorySample *)objc_msgSend(a1, "categorySampleWithType:value:startDate:endDate:device:metadata:", type, value, startDate, endDate, 0, 0);
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int64_t value;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HKCategorySample;
  -[HKSample _validateWithConfiguration:](&v19, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[HKCategorySample categoryType](self, "categoryType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[HKCategorySample categoryType](self, "categoryType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "_acceptsValue:", self->_value) & 1) != 0)
      {
        v7 = 0;
      }
      else
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v15 = objc_opt_class();
        value = self->_value;
        -[HKCategorySample categoryType](self, "categoryType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v15, a2, CFSTR("Value %ld is not compatible with type %@"), value, v17);
        v7 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = objc_opt_class();
      -[HKCategorySample categoryType](self, "categoryType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v12, a2, CFSTR("Data type %@ must be of type %@"), v13, objc_opt_class());
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

+ (id)_categorySamplesSplittingDurationWithType:(id)a3 value:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 device:(id)a7 metadata:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  int64_t v31;
  void *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (objc_msgSend(v14, "isMaximumDurationRestricted")
    && (objc_msgSend(v16, "timeIntervalSinceDate:", v15),
        v20 = v19,
        objc_msgSend(v14, "maximumAllowedDuration"),
        v20 > v21))
  {
    _HKInitializeLogging();
    v22 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v34 = v14;
      v35 = 2112;
      v36 = v15;
      v37 = 2112;
      v38 = v16;
      _os_log_fault_impl(&dword_19A0E6000, v22, OS_LOG_TYPE_FAULT, "Data duration is longer than allowed for type %@, start date %@, end date %@", buf, 0x20u);
    }
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __102__HKCategorySample__categorySamplesSplittingDurationWithType_value_startDate_endDate_device_metadata___block_invoke;
    v26[3] = &unk_1E37F6948;
    v30 = a1;
    v27 = v14;
    v31 = a4;
    v28 = v17;
    v29 = v18;
    objc_msgSend(a1, "_enumerateValidIntervalsWithStartDate:endDate:sampleType:block:", v15, v16, v27, v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v27;
  }
  else
  {
    objc_msgSend(a1, "categorySampleWithType:value:startDate:endDate:device:metadata:", v14, a4, v15, v16, v17, v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

uint64_t __102__HKCategorySample__categorySamplesSplittingDurationWithType_value_startDate_endDate_device_metadata___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 56), "categorySampleWithType:value:startDate:endDate:device:metadata:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), a2, a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKCategorySample)initWithCoder:(id)a3
{
  id v4;
  HKCategorySample *v5;
  uint64_t v6;
  void *v7;
  char v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKCategorySample;
  v5 = -[HKSample initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("value"));
    -[HKCategorySample categoryType](v5, "categoryType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_acceptsValue:", v6);

    if ((v8 & 1) == 0)
    {
      v9 = +[_HKBehavior isAppleInternalInstall](_HKBehavior, "isAppleInternalInstall");
      _HKInitializeLogging();
      v10 = (void *)HKLogDefault;
      if (v9)
      {
        if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
          -[HKCategorySample initWithCoder:].cold.1(v10, v5, v6);
      }
      else if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        -[HKCategorySample categoryType](v5, "categoryType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v12;
        _os_log_impl(&dword_19A0E6000, v11, OS_LOG_TYPE_DEFAULT, "Invalid value received for %@, setting value to 0", buf, 0xCu);

      }
      -[HKCategorySample categoryType](v5, "categoryType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v13, "_defaultValue");

    }
    v5->_value = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKCategorySample;
  v4 = a3;
  -[HKSample encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_value, CFSTR("value"), v5.receiver, v5.super_class);

}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v8.receiver = self;
    v8.super_class = (Class)HKCategorySample;
    if (-[HKSample isEquivalent:](&v8, sel_isEquivalent_, v5))
      v6 = self->_value == v5[12];
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "categoryType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = a3;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_ERROR, "Invalid value %ld received for %@, setting value to 0", (uint8_t *)&v7, 0x16u);

}

@end
