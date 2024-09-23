@implementation CMPredictedDistanceBoutMobilityCalibration

- (id)sr_dictionaryRepresentation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *started;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
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
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  _QWORD v50[4];
  _QWORD v51[5];

  v51[4] = *MEMORY[0x1E0C80C00];
  v50[0] = CFSTR("startTime");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  started = (void *)objc_msgSend_startDate(self, a2, v2, v3, v4);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v8, v9, v10, v11);
  v51[0] = objc_msgSend_numberWithDouble_(v6, v12, v13, v14, v15);
  v50[1] = CFSTR("endTime");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v21 = (void *)objc_msgSend_endDate(self, v17, v18, v19, v20);
  objc_msgSend_timeIntervalSinceReferenceDate(v21, v22, v23, v24, v25);
  v51[1] = objc_msgSend_numberWithDouble_(v16, v26, v27, v28, v29);
  v50[2] = CFSTR("cadenceWatch");
  v30 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_cadenceWatch(self, v31, v32, v33, v34);
  v51[2] = objc_msgSend_numberWithDouble_(v30, v35, v36, v37, v38);
  v50[3] = CFSTR("meanWalkingSpeed");
  v39 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_meanWalkingSpeed(self, v40, v41, v42, v43);
  v51[3] = objc_msgSend_numberWithDouble_(v39, v44, v45, v46, v47);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v48, (uint64_t)v51, (uint64_t)v50, 4);
}

- (CMPredictedDistanceBoutMobilityCalibration)initWithRecordId:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 cadenceWatch:(double)a6 cadenceGaitCycle:(double)a7 meanWalkingSpeed:(double)a8 gaitCycleYield:(double)a9
{
  CMPredictedDistanceBoutMobilityCalibration *v16;
  CMPredictedDistanceBoutMobilityCalibration *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CMPredictedDistanceBoutMobilityCalibration;
  v16 = -[CMPredictedDistanceBoutMobilityCalibration init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->fRecordId = a3;
    v16->fStartDate = (NSDate *)a4;
    v17->fEndDate = (NSDate *)a5;
    v17->fCadenceWatch = a6;
    v17->fCadenceGaitCycle = a7;
    v17->fMeanWalkingSpeed = a8;
    v17->fGaitCycleYield = a9;
  }
  return v17;
}

- (CMPredictedDistanceBoutMobilityCalibration)initWithSample:(WalkingSpeedStrideCal *)a3 recordId:(unint64_t)a4
{
  CMPredictedDistanceBoutMobilityCalibration *v6;
  CMPredictedDistanceBoutMobilityCalibration *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CMPredictedDistanceBoutMobilityCalibration;
  v6 = -[CMPredictedDistanceBoutMobilityCalibration init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->fRecordId = a4;
    v8 = objc_alloc(MEMORY[0x1E0C99D68]);
    v7->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v8, v9, v10, v11, v12, a3->var0);
    v13 = objc_alloc(MEMORY[0x1E0C99D68]);
    v7->fEndDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v13, v14, v15, v16, v17, a3->var1);
    v7->fCadenceWatch = a3->var2;
    v7->fCadenceGaitCycle = a3->var3;
    v7->fMeanWalkingSpeed = a3->var4;
    v7->fGaitCycleYield = a3->var5;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMPredictedDistanceBoutMobilityCalibration;
  -[CMPredictedDistanceBoutMobilityCalibration dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMPredictedDistanceBoutMobilityCalibration)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMPredictedDistanceBoutMobilityCalibration *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)CMPredictedDistanceBoutMobilityCalibration;
  v7 = -[CMPredictedDistanceBoutMobilityCalibration init](&v41, sel_init);
  if (v7)
  {
    v7->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCMPredictedDistanceBoutMobilityCalibrationCodingKeyRecordId"), v5, v6);
    v8 = objc_opt_class();
    v11 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMPredictedDistanceBoutMobilityCalibrationCodingKeyStartDate"), v10);
    v7->fStartDate = (NSDate *)objc_msgSend_copy(v11, v12, v13, v14, v15);
    v16 = objc_opt_class();
    v19 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v17, v16, (uint64_t)CFSTR("kCMPredictedDistanceBoutMobilityCalibrationCodingKeyEndDate"), v18);
    v7->fEndDate = (NSDate *)objc_msgSend_copy(v19, v20, v21, v22, v23);
    objc_msgSend_decodeDoubleForKey_(a3, v24, (uint64_t)CFSTR("kCMPredictedDistanceBoutMobilityCalibrationCodingKeyCadenceWatch"), v25, v26);
    v7->fCadenceWatch = v27;
    objc_msgSend_decodeDoubleForKey_(a3, v28, (uint64_t)CFSTR("kCMPredictedDistanceBoutMobilityCalibrationCodingKeyCadenceGaitCycle"), v29, v30);
    v7->fCadenceGaitCycle = v31;
    objc_msgSend_decodeDoubleForKey_(a3, v32, (uint64_t)CFSTR("kCMPredictedDistanceBoutMobilityCalibrationCodingKeyMeanWalkingSpeed"), v33, v34);
    v7->fMeanWalkingSpeed = v35;
    objc_msgSend_decodeDoubleForKey_(a3, v36, (uint64_t)CFSTR("kCMPredictedDistanceBoutMobilityCalibrationCodingKeyGaitCycleYield"), v37, v38);
    v7->fGaitCycleYield = v39;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double fMeanWalkingSpeed;
  double fGaitCycleYield;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  __int128 v25;
  _QWORD v26[2];
  __int128 v27;
  double v28;
  double v29;

  objc_msgSend_timeIntervalSinceReferenceDate(self->fStartDate, a2, (uint64_t)a3, v3, v4);
  v8 = v7;
  objc_msgSend_timeIntervalSinceReferenceDate(self->fEndDate, v9, v10, v11, v12);
  v14 = v13;
  v25 = *(_OWORD *)&self->fCadenceWatch;
  fMeanWalkingSpeed = self->fMeanWalkingSpeed;
  fGaitCycleYield = self->fGaitCycleYield;
  v17 = (void *)objc_opt_class();
  v21 = (void *)objc_msgSend_allocWithZone_(v17, v18, (uint64_t)a3, v19, v20);
  v26[0] = v8;
  v26[1] = v14;
  v27 = v25;
  v28 = fMeanWalkingSpeed;
  v29 = fGaitCycleYield;
  return (id)objc_msgSend_initWithSample_recordId_(v21, v22, (uint64_t)v26, self->fRecordId, v23);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
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
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, (uint64_t)CFSTR("kCMPredictedDistanceBoutMobilityCalibrationCodingKeyRecordId"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kCMPredictedDistanceBoutMobilityCalibrationCodingKeyStartDate"), v7);
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->fEndDate, (uint64_t)CFSTR("kCMPredictedDistanceBoutMobilityCalibrationCodingKeyEndDate"), v9);
  objc_msgSend_encodeDouble_forKey_(a3, v10, (uint64_t)CFSTR("kCMPredictedDistanceBoutMobilityCalibrationCodingKeyCadenceWatch"), v11, v12, self->fCadenceWatch);
  objc_msgSend_encodeDouble_forKey_(a3, v13, (uint64_t)CFSTR("kCMPredictedDistanceBoutMobilityCalibrationCodingKeyCadenceGaitCycle"), v14, v15, self->fCadenceGaitCycle);
  objc_msgSend_encodeDouble_forKey_(a3, v16, (uint64_t)CFSTR("kCMPredictedDistanceBoutMobilityCalibrationCodingKeyMeanWalkingSpeed"), v17, v18, self->fMeanWalkingSpeed);
  objc_msgSend_encodeDouble_forKey_(a3, v19, (uint64_t)CFSTR("kCMPredictedDistanceBoutMobilityCalibrationCodingKeyGaitCycleYield"), v20, v21, self->fGaitCycleYield);
}

- (BOOL)isEqual:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *started;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  int isEqualToDate;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  double v56;
  double v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  double v67;
  double v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  double v78;
  double v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  double v84;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_13;
  v9 = objc_msgSend_recordId(self, v5, v6, v7, v8);
  if (v9 != objc_msgSend_recordId(a3, v10, v11, v12, v13))
    goto LABEL_13;
  if (!objc_msgSend_startDate(self, v14, v15, v16, v17) && !objc_msgSend_startDate(a3, v18, v19, v20, v21)
    || (started = (void *)objc_msgSend_startDate(self, v18, v19, v20, v21),
        v27 = objc_msgSend_startDate(a3, v23, v24, v25, v26),
        (isEqualToDate = objc_msgSend_isEqualToDate_(started, v28, v27, v29, v30)) != 0))
  {
    if (!objc_msgSend_endDate(self, v18, v19, v20, v21) && !objc_msgSend_endDate(a3, v32, v33, v34, v35)
      || (v36 = (void *)objc_msgSend_endDate(self, v32, v33, v34, v35),
          v41 = objc_msgSend_endDate(a3, v37, v38, v39, v40),
          (isEqualToDate = objc_msgSend_isEqualToDate_(v36, v42, v41, v43, v44)) != 0))
    {
      objc_msgSend_cadenceWatch(self, v32, v33, v34, v35);
      v46 = v45;
      objc_msgSend_cadenceWatch(a3, v47, v48, v49, v50);
      if (v46 == v55)
      {
        objc_msgSend_cadenceGaitCycle(self, v51, v52, v53, v54);
        v57 = v56;
        objc_msgSend_cadenceGaitCycle(a3, v58, v59, v60, v61);
        if (v57 == v66)
        {
          objc_msgSend_meanWalkingSpeed(self, v62, v63, v64, v65);
          v68 = v67;
          objc_msgSend_meanWalkingSpeed(a3, v69, v70, v71, v72);
          if (v68 == v77)
          {
            objc_msgSend_gaitCycleYield(self, v73, v74, v75, v76);
            v79 = v78;
            objc_msgSend_gaitCycleYield(a3, v80, v81, v82, v83);
            LOBYTE(isEqualToDate) = v79 == v84;
            return isEqualToDate;
          }
        }
      }
LABEL_13:
      LOBYTE(isEqualToDate) = 0;
    }
  }
  return isEqualToDate;
}

- (unint64_t)recordId
{
  return self->fRecordId;
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSDate)endDate
{
  return self->fEndDate;
}

- (double)cadenceWatch
{
  return self->fCadenceWatch;
}

- (double)cadenceGaitCycle
{
  return self->fCadenceGaitCycle;
}

- (double)meanWalkingSpeed
{
  return self->fMeanWalkingSpeed;
}

- (double)gaitCycleYield
{
  return self->fGaitCycleYield;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t started;
  const char *v16;
  uint64_t v17;
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
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_recordId(self, v6, v7, v8, v9);
  started = objc_msgSend_startDate(self, v11, v12, v13, v14);
  v20 = objc_msgSend_endDate(self, v16, v17, v18, v19);
  objc_msgSend_cadenceWatch(self, v21, v22, v23, v24);
  v26 = v25;
  objc_msgSend_cadenceGaitCycle(self, v27, v28, v29, v30);
  v32 = v31;
  objc_msgSend_meanWalkingSpeed(self, v33, v34, v35, v36);
  v38 = v37;
  objc_msgSend_gaitCycleYield(self, v39, v40, v41, v42);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v43, (uint64_t)CFSTR("%@, <recordId, %lu, startDate, %@, endDate, %@, cadenceWatch, %f, cadenceGaitCycle, %f, meanWalkingSpeed, %f, gaitCycleYield, %f>"), v44, v45, v5, v10, started, v20, v26, v32, v38, v46);
}

+ (WalkingSpeedStrideCal)inputFromPreparedStatement:(SEL)a3
{
  WalkingSpeedStrideCal *result;

  retstr->var0 = sqlite3_column_double(a4, 1);
  retstr->var1 = sqlite3_column_double(a4, 2);
  retstr->var2 = sqlite3_column_double(a4, 3);
  retstr->var3 = sqlite3_column_double(a4, 4);
  retstr->var4 = sqlite3_column_double(a4, 5);
  retstr->var5 = sqlite3_column_double(a4, 6);
  return result;
}

- (id)binarySampleRepresentation
{
  void *v3;
  const char *v4;
  id v5;

  v3 = (void *)MEMORY[0x194001B4C](self, a2);
  v5 = (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v4, (uint64_t)self, 1, 0);
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (CMPredictedDistanceBoutMobilityCalibration)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  CMPredictedDistanceBoutMobilityCalibration *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
  {
    v15.receiver = self;
    v15.super_class = (Class)CMPredictedDistanceBoutMobilityCalibration;
    v8 = -[CMPredictedDistanceBoutMobilityCalibration init](&v15, sel_init);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3710];
      v10 = objc_opt_class();
      v12 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v9, v11, v10, (uint64_t)a3, 0);
      if (v12)
      {
        v13 = (void *)v12;

        return (CMPredictedDistanceBoutMobilityCalibration *)v13;
      }
    }
  }
  else
  {

    return 0;
  }
  return v8;
}

@end
