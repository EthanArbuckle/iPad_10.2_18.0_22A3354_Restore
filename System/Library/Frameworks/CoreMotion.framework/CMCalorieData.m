@implementation CMCalorieData

- (CMCalorieData)initWithWorkoutType:(int64_t)a3 duration:(double)a4 mets:(double)a5 basalMets:(double)a6 totalCalories:(double)a7 basalCalories:(double)a8
{
  CMCalorieData *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CMCalorieData;
  result = -[CMCalorieData init](&v15, sel_init);
  if (result)
  {
    result->fWorkoutType = a3;
    result->fDuration = a4;
    result->fMets = a5;
    result->fBasalMets = a6;
    result->fTotalCalories = a7;
    result->fBasalCalories = a8;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMCalorieData;
  -[CMCalorieData dealloc](&v2, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMCalorieData)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMCalorieData *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
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
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)CMCalorieData;
  v7 = -[CMCalorieData init](&v29, sel_init);
  if (v7)
  {
    v7->fWorkoutType = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCalorieDataCodingKeyWorkoutType"), v5, v6);
    objc_msgSend_decodeDoubleForKey_(a3, v8, (uint64_t)CFSTR("kCalorieDataCodingKeyDuration"), v9, v10);
    v7->fDuration = v11;
    objc_msgSend_decodeDoubleForKey_(a3, v12, (uint64_t)CFSTR("kCalorieDataCodingKeyMets"), v13, v14);
    v7->fMets = v15;
    objc_msgSend_decodeDoubleForKey_(a3, v16, (uint64_t)CFSTR("kCalorieDataCodingKeyBasalMets"), v17, v18);
    v7->fBasalMets = v19;
    objc_msgSend_decodeDoubleForKey_(a3, v20, (uint64_t)CFSTR("kCalorieDataCodingKeyTotalCalories"), v21, v22);
    v7->fTotalCalories = v23;
    objc_msgSend_decodeDoubleForKey_(a3, v24, (uint64_t)CFSTR("kCalorieDataCodingKeyBasalCalories"), v25, v26);
    v7->fBasalCalories = v27;
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
  uint64_t v11;
  uint64_t v12;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  return (id)objc_msgSend_initWithWorkoutType_duration_mets_basalMets_totalCalories_basalCalories_(v9, v10, self->fWorkoutType, v11, v12, self->fDuration, self->fMets, self->fBasalMets, self->fTotalCalories, self->fBasalCalories);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fWorkoutType, (uint64_t)CFSTR("kCalorieDataCodingKeyWorkoutType"), v3);
  objc_msgSend_encodeDouble_forKey_(a3, v6, (uint64_t)CFSTR("kCalorieDataCodingKeyDuration"), v7, v8, self->fDuration);
  objc_msgSend_encodeDouble_forKey_(a3, v9, (uint64_t)CFSTR("kCalorieDataCodingKeyMets"), v10, v11, self->fMets);
  objc_msgSend_encodeDouble_forKey_(a3, v12, (uint64_t)CFSTR("kCalorieDataCodingKeyBasalMets"), v13, v14, self->fBasalMets);
  objc_msgSend_encodeDouble_forKey_(a3, v15, (uint64_t)CFSTR("kCalorieDataCodingKeyTotalCalories"), v16, v17, self->fTotalCalories);
  objc_msgSend_encodeDouble_forKey_(a3, v18, (uint64_t)CFSTR("kCalorieDataCodingKeyBasalCalories"), v19, v20, self->fBasalCalories);
}

- (int64_t)workoutType
{
  return self->fWorkoutType;
}

- (double)duration
{
  return self->fDuration;
}

- (NSNumber)mets
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSNumber *)objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, v2, v3, v4, self->fMets);
}

- (NSNumber)basalMets
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSNumber *)objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, v2, v3, v4, self->fBasalMets);
}

- (NSNumber)totalCalories
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSNumber *)objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, v2, v3, v4, self->fTotalCalories);
}

- (NSNumber)basalCalories
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSNumber *)objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, v2, v3, v4, self->fBasalCalories);
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
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v9 = objc_msgSend_workoutName_(CMWorkout, v6, self->fWorkoutType, v7, v8);
  objc_msgSend_duration(self, v10, v11, v12, v13);
  v15 = v14;
  v20 = (void *)objc_msgSend_mets(self, v16, v17, v18, v19);
  v25 = objc_msgSend_stringValue(v20, v21, v22, v23, v24);
  v30 = (void *)objc_msgSend_basalMets(self, v26, v27, v28, v29);
  v35 = objc_msgSend_stringValue(v30, v31, v32, v33, v34);
  v40 = (void *)objc_msgSend_totalCalories(self, v36, v37, v38, v39);
  v45 = objc_msgSend_stringValue(v40, v41, v42, v43, v44);
  v50 = (void *)objc_msgSend_basalCalories(self, v46, v47, v48, v49);
  v55 = objc_msgSend_stringValue(v50, v51, v52, v53, v54);
  return (id)objc_msgSend_stringWithFormat_(v3, v56, (uint64_t)CFSTR("%@, <workoutType %@, duration %f, mets %@, basalmets, %@, totalCalories %@, basalCalories %@>"), v57, v58, v5, v9, v15, v25, v35, v45, v55);
}

@end
