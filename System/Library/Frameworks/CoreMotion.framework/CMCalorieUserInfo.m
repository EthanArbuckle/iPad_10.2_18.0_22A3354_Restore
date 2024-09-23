@implementation CMCalorieUserInfo

- (CMCalorieUserInfo)initWithAge:(double)a3 gender:(int64_t)a4 height:(double)a5 weight:(double)a6
{
  return (CMCalorieUserInfo *)objc_msgSend_initWithAge_gender_height_weight_condition_betaBlockerUse_(self, a2, a4, 0, 0, a3, a5, a6);
}

- (CMCalorieUserInfo)initWithAge:(double)a3 gender:(int64_t)a4 height:(double)a5 weight:(double)a6 condition:(int64_t)a7
{
  return (CMCalorieUserInfo *)objc_msgSend_initWithAge_gender_height_weight_condition_betaBlockerUse_(self, a2, a4, a7, 0, a3, a5, a6);
}

- (CMCalorieUserInfo)initWithAge:(double)a3 gender:(int64_t)a4 height:(double)a5 weight:(double)a6 condition:(int64_t)a7 betaBlockerUse:(BOOL)a8
{
  CMCalorieUserInfo *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CMCalorieUserInfo;
  result = -[CMCalorieUserInfo init](&v15, sel_init);
  if (result)
  {
    result->fAge = a3;
    result->fGender = a4;
    result->fHeight = a5;
    result->fWeight = a6;
    result->fCondition = a7;
    result->fBetaBlockerUse = a8;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMCalorieUserInfo;
  -[CMLogItem dealloc](&v2, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMCalorieUserInfo)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMCalorieUserInfo *v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CMCalorieUserInfo;
  v7 = -[CMLogItem initWithCoder:](&v27, sel_initWithCoder_);
  if (v7)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, (uint64_t)CFSTR("kCalorieUserInfoCodingKeyAge"), v5, v6);
    v7->fAge = v8;
    v7->fGender = objc_msgSend_decodeIntegerForKey_(a3, v9, (uint64_t)CFSTR("kCalorieUserInfoCodingKeyGender"), v10, v11);
    objc_msgSend_decodeDoubleForKey_(a3, v12, (uint64_t)CFSTR("kCalorieUserInfoCodingKeyHeight"), v13, v14);
    v7->fHeight = v15;
    objc_msgSend_decodeDoubleForKey_(a3, v16, (uint64_t)CFSTR("kCalorieUserInfoCodingKeyWeight"), v17, v18);
    v7->fWeight = v19;
    v7->fCondition = objc_msgSend_decodeIntegerForKey_(a3, v20, (uint64_t)CFSTR("kCalorieUserInfoCodingKeyCondition"), v21, v22);
    v7->fBetaBlockerUse = objc_msgSend_decodeBoolForKey_(a3, v23, (uint64_t)CFSTR("kCalorieUserInfoCodingKeyBetaBlockerUse"), v24, v25);
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  return (id)objc_msgSend_initWithAge_gender_height_weight_condition_betaBlockerUse_(v9, v10, self->fGender, self->fCondition, self->fBetaBlockerUse, self->fAge, self->fHeight, self->fWeight);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CMCalorieUserInfo;
  -[CMLogItem encodeWithCoder:](&v20, sel_encodeWithCoder_);
  objc_msgSend_encodeDouble_forKey_(a3, v5, (uint64_t)CFSTR("kCalorieUserInfoCodingKeyAge"), v6, v7, self->fAge);
  objc_msgSend_encodeInteger_forKey_(a3, v8, self->fGender, (uint64_t)CFSTR("kCalorieUserInfoCodingKeyGender"), v9);
  objc_msgSend_encodeDouble_forKey_(a3, v10, (uint64_t)CFSTR("kCalorieUserInfoCodingKeyHeight"), v11, v12, self->fHeight);
  objc_msgSend_encodeDouble_forKey_(a3, v13, (uint64_t)CFSTR("kCalorieUserInfoCodingKeyWeight"), v14, v15, self->fWeight);
  objc_msgSend_encodeInteger_forKey_(a3, v16, self->fCondition, (uint64_t)CFSTR("kCalorieUserInfoCodingKeyCondition"), v17);
  objc_msgSend_encodeBool_forKey_(a3, v18, self->fBetaBlockerUse, (uint64_t)CFSTR("kCalorieUserInfoCodingKeyBetaBlockerUse"), v19);
}

- (double)age
{
  return self->fAge;
}

- (int64_t)gender
{
  return self->fGender;
}

- (double)height
{
  return self->fHeight;
}

- (double)weight
{
  return self->fWeight;
}

- (int64_t)condition
{
  return self->fCondition;
}

- (BOOL)betaBlockerUse
{
  return self->fBetaBlockerUse;
}

+ (id)genderString:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Female");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return (id)v3;
  else
    return CFSTR("Male");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_age(self, v6, v7, v8, v9);
  v11 = v10;
  v16 = objc_msgSend_gender(self, v12, v13, v14, v15);
  v20 = objc_msgSend_genderString_(CMCalorieUserInfo, v17, v16, v18, v19);
  objc_msgSend_height(self, v21, v22, v23, v24);
  v26 = v25;
  objc_msgSend_weight(self, v27, v28, v29, v30);
  v32 = v31;
  v37 = objc_msgSend_condition(self, v33, v34, v35, v36);
  v42 = objc_msgSend_betaBlockerUse(self, v38, v39, v40, v41);
  return (id)objc_msgSend_stringWithFormat_(v3, v43, (uint64_t)CFSTR("%@, <age %f, gender %@, height %f, weight %f, condition %ld, betaBlockerUse %d>"), v44, v45, v5, v11, v20, v26, v32, v37, v42);
}

@end
