@implementation CMSmoothGaitMetrics

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
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  _QWORD v56[5];
  _QWORD v57[6];

  v57[5] = *MEMORY[0x1E0C80C00];
  v56[0] = CFSTR("startTime");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  started = (void *)objc_msgSend_startDate(self, a2, v2, v3, v4);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v8, v9, v10, v11);
  v16 = objc_msgSend_numberWithDouble_(v6, v12, v13, v14, v15);
  v21 = &stru_1E295ADC8;
  if (v16)
    v21 = (const __CFString *)v16;
  v57[0] = v21;
  v56[1] = CFSTR("walkingSpeed");
  v22 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_walkingSpeed(self, v17, v18, v19, v20);
  v57[1] = objc_msgSend_numberWithDouble_(v22, v23, v24, v25, v26);
  v56[2] = CFSTR("stepLength");
  v27 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_stepLength(self, v28, v29, v30, v31);
  v57[2] = objc_msgSend_numberWithDouble_(v27, v32, v33, v34, v35);
  v56[3] = CFSTR("distance");
  v36 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_distance(self, v37, v38, v39, v40);
  v57[3] = objc_msgSend_numberWithDouble_(v36, v41, v42, v43, v44);
  v56[4] = CFSTR("doubleSupportPercentage");
  v45 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_doubleSupportPercentage(self, v46, v47, v48, v49);
  v57[4] = objc_msgSend_numberWithDouble_(v45, v50, v51, v52, v53);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v54, (uint64_t)v57, (uint64_t)v56, 5);
}

- (CMSmoothGaitMetrics)initWithRecordId:(unint64_t)a3 startDate:(id)a4 walkingSpeed:(double)a5 stepLength:(double)a6 cycleTime:(double)a7 distance:(double)a8 doubleSupportPercentage:(double)a9 asymmetryProbability:(double)a10 numGaitMetrics:(unsigned int)a11
{
  CMSmoothGaitMetrics *v20;
  CMSmoothGaitMetrics *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CMSmoothGaitMetrics;
  v20 = -[CMSmoothGaitMetrics init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->fRecordId = a3;
    v20->fStartDate = (NSDate *)a4;
    v21->fWalkingSpeed = a5;
    v21->fStepLength = a6;
    v21->fCycleTime = a7;
    v21->fDistance = a8;
    v21->fDoubleSupportPercentage = a9;
    v21->fAsymmetryProbability = a10;
    v21->fNumGaitMetrics = a11;
  }
  return v21;
}

- (CMSmoothGaitMetrics)initWithSample:(SmoothedGaitMetrics *)a3
{
  CMSmoothGaitMetrics *v4;
  CMSmoothGaitMetrics *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float var3;
  float var5;
  double var4;
  int8x16_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CMSmoothGaitMetrics;
  v4 = -[CMSmoothGaitMetrics init](&v16, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->fRecordId = a3->var0;
    v6 = objc_alloc(MEMORY[0x1E0C99D68]);
    v5->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v6, v7, v8, v9, v10, a3->var1);
    var3 = a3->var3;
    var5 = a3->var5;
    var4 = a3->var4;
    v5->fWalkingSpeed = a3->var2;
    v5->fStepLength = var4;
    v14 = (int8x16_t)vcvtq_f64_f32(*(float32x2_t *)&a3->var6);
    *(int8x16_t *)&v5->fCycleTime = vextq_s8(v14, v14, 8uLL);
    v5->fDoubleSupportPercentage = var3;
    v5->fAsymmetryProbability = var5;
    v5->fNumGaitMetrics = a3->var8;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMSmoothGaitMetrics;
  -[CMSmoothGaitMetrics dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSmoothGaitMetrics)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMSmoothGaitMetrics *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)CMSmoothGaitMetrics;
  v7 = -[CMSmoothGaitMetrics init](&v44, sel_init);
  if (v7)
  {
    v7->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCMSmoothGaitMetricsCodingKeyRecordId"), v5, v6);
    v8 = objc_opt_class();
    v11 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMSmoothGaitMetricsCodingKeyStartDate"), v10);
    v7->fStartDate = (NSDate *)objc_msgSend_copy(v11, v12, v13, v14, v15);
    objc_msgSend_decodeDoubleForKey_(a3, v16, (uint64_t)CFSTR("kCMSmoothGaitMetricsCodingKeyWalkingSpeed"), v17, v18);
    v7->fWalkingSpeed = v19;
    objc_msgSend_decodeDoubleForKey_(a3, v20, (uint64_t)CFSTR("kCMSmoothGaitMetricsCodingKeyStepLength"), v21, v22);
    v7->fStepLength = v23;
    objc_msgSend_decodeDoubleForKey_(a3, v24, (uint64_t)CFSTR("kCMSmoothGaitMetricsCodingKeyCycleTime"), v25, v26);
    v7->fCycleTime = v27;
    objc_msgSend_decodeDoubleForKey_(a3, v28, (uint64_t)CFSTR("kCMSmoothGaitMetricsCodingKeyDistance"), v29, v30);
    v7->fDistance = v31;
    objc_msgSend_decodeDoubleForKey_(a3, v32, (uint64_t)CFSTR("kCMSmoothGaitMetricsCodingKeyDoubleSupportPercentage"), v33, v34);
    v7->fDoubleSupportPercentage = v35;
    objc_msgSend_decodeDoubleForKey_(a3, v36, (uint64_t)CFSTR("kCMSmoothGaitMetricsCodingKeyAsymmetryProbability"), v37, v38);
    v7->fAsymmetryProbability = v39;
    v7->fNumGaitMetrics = objc_msgSend_decodeInt32ForKey_(a3, v40, (uint64_t)CFSTR("kCMSmoothGaitMetricsCodingKeyNumGaitMetrics"), v41, v42);
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t fRecordId;
  uint64_t v8;
  uint64_t v9;
  float fWalkingSpeed;
  float fDoubleSupportPercentage;
  float fStepLength;
  float fAsymmetryProbability;
  unsigned int fNumGaitMetrics;
  int32x2_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  int v25;
  uint64_t v26;
  float v27;
  float v28;
  float v29;
  float v30;
  int32x2_t v31;
  unsigned int v32;

  fRecordId = self->fRecordId;
  objc_msgSend_timeIntervalSinceReferenceDate(self->fStartDate, a2, (uint64_t)a3, v3, v4);
  v9 = v8;
  fWalkingSpeed = self->fWalkingSpeed;
  fDoubleSupportPercentage = self->fDoubleSupportPercentage;
  fStepLength = self->fStepLength;
  fAsymmetryProbability = self->fAsymmetryProbability;
  fNumGaitMetrics = self->fNumGaitMetrics;
  v15 = (int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->fCycleTime);
  v16 = (void *)objc_opt_class();
  v20 = (void *)objc_msgSend_allocWithZone_(v16, v17, (uint64_t)a3, v18, v19);
  v25 = fRecordId;
  v26 = v9;
  v27 = fWalkingSpeed;
  v28 = fDoubleSupportPercentage;
  v29 = fStepLength;
  v30 = fAsymmetryProbability;
  v31 = vrev64_s32(v15);
  v32 = fNumGaitMetrics;
  return (id)objc_msgSend_initWithSample_(v20, v21, (uint64_t)&v25, v22, v23);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, (uint64_t)CFSTR("kCMSmoothGaitMetricsCodingKeyRecordId"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kCMSmoothGaitMetricsCodingKeyStartDate"), v7);
  objc_msgSend_encodeDouble_forKey_(a3, v8, (uint64_t)CFSTR("kCMSmoothGaitMetricsCodingKeyWalkingSpeed"), v9, v10, self->fWalkingSpeed);
  objc_msgSend_encodeDouble_forKey_(a3, v11, (uint64_t)CFSTR("kCMSmoothGaitMetricsCodingKeyStepLength"), v12, v13, self->fStepLength);
  objc_msgSend_encodeDouble_forKey_(a3, v14, (uint64_t)CFSTR("kCMSmoothGaitMetricsCodingKeyCycleTime"), v15, v16, self->fCycleTime);
  objc_msgSend_encodeDouble_forKey_(a3, v17, (uint64_t)CFSTR("kCMSmoothGaitMetricsCodingKeyDistance"), v18, v19, self->fDistance);
  objc_msgSend_encodeDouble_forKey_(a3, v20, (uint64_t)CFSTR("kCMSmoothGaitMetricsCodingKeyDoubleSupportPercentage"), v21, v22, self->fDoubleSupportPercentage);
  objc_msgSend_encodeDouble_forKey_(a3, v23, (uint64_t)CFSTR("kCMSmoothGaitMetricsCodingKeyAsymmetryProbability"), v24, v25, self->fAsymmetryProbability);
  objc_msgSend_encodeInt32_forKey_(a3, v26, self->fNumGaitMetrics, (uint64_t)CFSTR("kCMSmoothGaitMetricsCodingKeyNumGaitMetrics"), v27);
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
  double v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  double v65;
  double v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  double v75;
  double v76;
  double v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  double v87;
  double v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  double v97;
  int v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;

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
    objc_msgSend_walkingSpeed(self, v18, v19, v20, v21);
    v33 = v32;
    objc_msgSend_walkingSpeed(a3, v34, v35, v36, v37);
    if (v33 == v42)
    {
      objc_msgSend_stepLength(self, v38, v39, v40, v41);
      v44 = v43;
      objc_msgSend_stepLength(a3, v45, v46, v47, v48);
      if (v44 == v53)
      {
        objc_msgSend_cycleTime(self, v49, v50, v51, v52);
        v55 = v54;
        objc_msgSend_cycleTime(a3, v56, v57, v58, v59);
        if (v55 == v64)
        {
          objc_msgSend_distance(self, v60, v61, v62, v63);
          v66 = v65;
          objc_msgSend_distance(a3, v67, v68, v69, v70);
          if (v66 == v75)
          {
            objc_msgSend_doubleSupportPercentage(self, v71, v72, v73, v74);
            v77 = v76;
            objc_msgSend_doubleSupportPercentage(a3, v78, v79, v80, v81);
            if (v77 == v86)
            {
              objc_msgSend_asymmetryProbability(self, v82, v83, v84, v85);
              v88 = v87;
              objc_msgSend_asymmetryProbability(a3, v89, v90, v91, v92);
              if (v88 == v97)
              {
                v98 = objc_msgSend_numGaitMetrics(self, v93, v94, v95, v96);
                LOBYTE(isEqualToDate) = v98 == objc_msgSend_numGaitMetrics(a3, v99, v100, v101, v102);
                return isEqualToDate;
              }
            }
          }
        }
      }
    }
LABEL_13:
    LOBYTE(isEqualToDate) = 0;
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

- (double)walkingSpeed
{
  return self->fWalkingSpeed;
}

- (double)stepLength
{
  return self->fStepLength;
}

- (double)cycleTime
{
  return self->fCycleTime;
}

- (double)distance
{
  return self->fDistance;
}

- (double)doubleSupportPercentage
{
  return self->fDoubleSupportPercentage;
}

- (double)asymmetryProbability
{
  return self->fAsymmetryProbability;
}

- (unsigned)numGaitMetrics
{
  return self->fNumGaitMetrics;
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
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_recordId(self, v6, v7, v8, v9);
  started = objc_msgSend_startDate(self, v11, v12, v13, v14);
  objc_msgSend_walkingSpeed(self, v16, v17, v18, v19);
  v21 = v20;
  objc_msgSend_stepLength(self, v22, v23, v24, v25);
  v27 = v26;
  objc_msgSend_cycleTime(self, v28, v29, v30, v31);
  v33 = v32;
  objc_msgSend_distance(self, v34, v35, v36, v37);
  v39 = v38;
  objc_msgSend_doubleSupportPercentage(self, v40, v41, v42, v43);
  v45 = v44;
  objc_msgSend_asymmetryProbability(self, v46, v47, v48, v49);
  v51 = v50;
  v56 = objc_msgSend_numGaitMetrics(self, v52, v53, v54, v55);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v57, (uint64_t)CFSTR("%@, <recordId, %lu, startDate, %@, walkingSpeed, %f, stepLength, %f, cycleTime, %f, distance, %f, doubleSupportPercentage, %f, asymmetryProbability, %f, numGaitMetrics, %d>"), v58, v59, v5, v10, started, v21, v27, v33, v39, v45, v51, v56);
}

+ (SmoothedGaitMetrics)inputFromPreparedStatement:(SEL)a3
{
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  SmoothedGaitMetrics *result;

  retstr->var0 = sqlite3_column_int(a4, 0);
  retstr->var1 = sqlite3_column_double(a4, 1);
  v6 = sqlite3_column_double(a4, 2);
  retstr->var2 = v6;
  v7 = sqlite3_column_double(a4, 6);
  retstr->var3 = v7;
  v8 = sqlite3_column_double(a4, 3);
  retstr->var4 = v8;
  v9 = sqlite3_column_double(a4, 7);
  retstr->var5 = v9;
  v10 = sqlite3_column_double(a4, 5);
  retstr->var6 = v10;
  v11 = sqlite3_column_double(a4, 4);
  retstr->var7 = v11;
  result = (SmoothedGaitMetrics *)sqlite3_column_int(a4, 8);
  retstr->var8 = result;
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

- (CMSmoothGaitMetrics)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  CMSmoothGaitMetrics *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
  {
    v15.receiver = self;
    v15.super_class = (Class)CMSmoothGaitMetrics;
    v8 = -[CMSmoothGaitMetrics init](&v15, sel_init);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3710];
      v10 = objc_opt_class();
      v12 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v9, v11, v10, (uint64_t)a3, 0);
      if (v12)
      {
        v13 = (void *)v12;

        return (CMSmoothGaitMetrics *)v13;
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
