@implementation CMWorkoutPhysicalEffort

- (CMWorkoutPhysicalEffort)initWithRecordId:(unint64_t)a3 startDate:(id)a4 mets:(double)a5 gradeType:(int64_t)a6 grade:(double)a7 userMets:(double)a8 metsSource:(int64_t)a9
{
  CMWorkoutPhysicalEffort *v16;
  CMWorkoutPhysicalEffort *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CMWorkoutPhysicalEffort;
  v16 = -[CMWorkoutPhysicalEffort init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->fRecordId = a3;
    v16->fStartDate = (NSDate *)a4;
    v17->fMets = a5;
    v17->fGradeType = a6;
    v17->fGrade = a7;
    v17->fUserMets = a8;
    v17->fMetsSource = a9;
  }
  return v17;
}

- (CMWorkoutPhysicalEffort)initWithSample:(HRRecoveryInputWR *)a3
{
  CMWorkoutPhysicalEffort *v4;
  CMWorkoutPhysicalEffort *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMWorkoutPhysicalEffort;
  v4 = -[CMWorkoutPhysicalEffort init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->fRecordId = a3->var0;
    v6 = objc_alloc(MEMORY[0x1E0C99D68]);
    v5->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v6, v7, v8, v9, v10, a3->var1);
    v5->fMets = a3->var2;
    v5->fGradeType = a3->var3;
    v5->fGrade = a3->var4;
    v5->fUserMets = a3->var5;
    v5->fMetsSource = a3->var6;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMWorkoutPhysicalEffort;
  -[CMWorkoutPhysicalEffort dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMWorkoutPhysicalEffort)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMWorkoutPhysicalEffort *v7;
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
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)CMWorkoutPhysicalEffort;
  v7 = -[CMWorkoutPhysicalEffort init](&v35, sel_init);
  if (v7)
  {
    v7->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCMWorkoutPhysicalEffortCodingKeyRecordId"), v5, v6);
    v8 = objc_opt_class();
    v11 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMWorkoutPhysicalEffortCodingKeyStartDate"), v10);
    v7->fStartDate = (NSDate *)objc_msgSend_copy(v11, v12, v13, v14, v15);
    objc_msgSend_decodeDoubleForKey_(a3, v16, (uint64_t)CFSTR("kCMWorkoutPhysicalEffortCodingKeyMets"), v17, v18);
    v7->fMets = v19;
    v7->fGradeType = objc_msgSend_decodeIntegerForKey_(a3, v20, (uint64_t)CFSTR("kCMWorkoutPhysicalEffortCodingKeyGradeType"), v21, v22);
    objc_msgSend_decodeDoubleForKey_(a3, v23, (uint64_t)CFSTR("kCMWorkoutPhysicalEffortCodingKeyGrade"), v24, v25);
    v7->fGrade = v26;
    objc_msgSend_decodeDoubleForKey_(a3, v27, (uint64_t)CFSTR("kCMWorkoutPhysicalEffortCodingKeyUserMets"), v28, v29);
    v7->fUserMets = v30;
    v7->fMetsSource = objc_msgSend_decodeIntegerForKey_(a3, v31, (uint64_t)CFSTR("kCMWorkoutPhysicalEffortCodingKeyMetsSource"), v32, v33);
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
  double fMets;
  int64_t fGradeType;
  double fGrade;
  double fUserMets;
  int64_t fMetsSource;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[3];
  int v25;
  double v26;
  double v27;
  int v28;

  fRecordId = self->fRecordId;
  objc_msgSend_timeIntervalSinceReferenceDate(self->fStartDate, a2, (uint64_t)a3, v3, v4);
  v9 = v8;
  fMets = self->fMets;
  fGradeType = self->fGradeType;
  fGrade = self->fGrade;
  fUserMets = self->fUserMets;
  fMetsSource = self->fMetsSource;
  v15 = (void *)objc_opt_class();
  v19 = (void *)objc_msgSend_allocWithZone_(v15, v16, (uint64_t)a3, v17, v18);
  v24[0] = fRecordId;
  v24[1] = v9;
  *(double *)&v24[2] = fMets;
  v25 = fGradeType;
  v26 = fGrade;
  v27 = fUserMets;
  v28 = fMetsSource;
  return (id)objc_msgSend_initWithSample_(v19, v20, (uint64_t)v24, v21, v22);
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
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, (uint64_t)CFSTR("kCMWorkoutPhysicalEffortCodingKeyRecordId"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kCMWorkoutPhysicalEffortCodingKeyStartDate"), v7);
  objc_msgSend_encodeDouble_forKey_(a3, v8, (uint64_t)CFSTR("kCMWorkoutPhysicalEffortCodingKeyMets"), v9, v10, self->fMets);
  objc_msgSend_encodeInteger_forKey_(a3, v11, self->fGradeType, (uint64_t)CFSTR("kCMWorkoutPhysicalEffortCodingKeyGradeType"), v12);
  objc_msgSend_encodeDouble_forKey_(a3, v13, (uint64_t)CFSTR("kCMWorkoutPhysicalEffortCodingKeyGrade"), v14, v15, self->fGrade);
  objc_msgSend_encodeDouble_forKey_(a3, v16, (uint64_t)CFSTR("kCMWorkoutPhysicalEffortCodingKeyUserMets"), v17, v18, self->fUserMets);
  objc_msgSend_encodeInteger_forKey_(a3, v19, self->fMetsSource, (uint64_t)CFSTR("kCMWorkoutPhysicalEffortCodingKeyMetsSource"), v20);
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
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  double v63;
  double v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  v9 = objc_msgSend_recordId(self, v5, v6, v7, v8);
  if (v9 != objc_msgSend_recordId(a3, v10, v11, v12, v13))
    goto LABEL_11;
  if (!objc_msgSend_startDate(self, v14, v15, v16, v17) && !objc_msgSend_startDate(a3, v18, v19, v20, v21)
    || (started = (void *)objc_msgSend_startDate(self, v18, v19, v20, v21),
        v27 = objc_msgSend_startDate(a3, v23, v24, v25, v26),
        (isEqualToDate = objc_msgSend_isEqualToDate_(started, v28, v27, v29, v30)) != 0))
  {
    objc_msgSend_mets(self, v18, v19, v20, v21);
    v33 = v32;
    objc_msgSend_mets(a3, v34, v35, v36, v37);
    if (v33 == v42)
    {
      v43 = objc_msgSend_gradeType(self, v38, v39, v40, v41);
      if (v43 == objc_msgSend_gradeType(a3, v44, v45, v46, v47))
      {
        objc_msgSend_grade(self, v48, v49, v50, v51);
        v53 = v52;
        objc_msgSend_grade(a3, v54, v55, v56, v57);
        if (v53 == v62)
        {
          objc_msgSend_userMets(self, v58, v59, v60, v61);
          v64 = v63;
          objc_msgSend_userMets(a3, v65, v66, v67, v68);
          if (v64 == v73)
          {
            v74 = objc_msgSend_metsSource(self, v69, v70, v71, v72);
            LOBYTE(isEqualToDate) = v74 == objc_msgSend_metsSource(a3, v75, v76, v77, v78);
            return isEqualToDate;
          }
        }
      }
    }
LABEL_11:
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

- (double)mets
{
  return self->fMets;
}

- (int64_t)gradeType
{
  return self->fGradeType;
}

- (double)grade
{
  return self->fGrade;
}

- (double)userMets
{
  return self->fUserMets;
}

- (int64_t)metsSource
{
  return self->fMetsSource;
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
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_recordId(self, v6, v7, v8, v9);
  started = objc_msgSend_startDate(self, v11, v12, v13, v14);
  objc_msgSend_mets(self, v16, v17, v18, v19);
  v21 = v20;
  v26 = objc_msgSend_gradeType(self, v22, v23, v24, v25);
  objc_msgSend_grade(self, v27, v28, v29, v30);
  v32 = v31;
  objc_msgSend_userMets(self, v33, v34, v35, v36);
  v38 = v37;
  v43 = objc_msgSend_metsSource(self, v39, v40, v41, v42);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v44, (uint64_t)CFSTR("%@, <recordId, %lu, startDate, %@, mets, %f, gradeType, %lu, grade, %f, userMets, %f, metsSource, %lu>"), v45, v46, v5, v10, started, v21, v26, v32, v38, v43);
}

+ (HRRecoveryInputWR)inputFromPreparedStatement:(SEL)a3
{
  HRRecoveryInputWR *result;

  retstr->var0 = sqlite3_column_int(a4, 0);
  retstr->var1 = sqlite3_column_double(a4, 1);
  retstr->var2 = sqlite3_column_double(a4, 2);
  retstr->var3 = sqlite3_column_int(a4, 3);
  retstr->var4 = sqlite3_column_double(a4, 4);
  retstr->var5 = sqlite3_column_double(a4, 5);
  result = (HRRecoveryInputWR *)sqlite3_column_int(a4, 6);
  retstr->var6 = (int)result;
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

- (CMWorkoutPhysicalEffort)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  CMWorkoutPhysicalEffort *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
  {
    v15.receiver = self;
    v15.super_class = (Class)CMWorkoutPhysicalEffort;
    v8 = -[CMWorkoutPhysicalEffort init](&v15, sel_init);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3710];
      v10 = objc_opt_class();
      v12 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v9, v11, v10, (uint64_t)a3, 0);
      if (v12)
      {
        v13 = (void *)v12;

        return (CMWorkoutPhysicalEffort *)v13;
      }
    }
  }
  else
  {

    return 0;
  }
  return v8;
}

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
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  _QWORD v45[4];
  _QWORD v46[5];

  v46[4] = *MEMORY[0x1E0C80C00];
  v45[0] = CFSTR("startTime");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  started = (void *)objc_msgSend_startDate(self, a2, v2, v3, v4);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v8, v9, v10, v11);
  v46[0] = objc_msgSend_numberWithDouble_(v6, v12, v13, v14, v15);
  v45[1] = CFSTR("mets");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_mets(self, v17, v18, v19, v20);
  v46[1] = objc_msgSend_numberWithDouble_(v16, v21, v22, v23, v24);
  v45[2] = CFSTR("grade");
  v25 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_grade(self, v26, v27, v28, v29);
  v46[2] = objc_msgSend_numberWithDouble_(v25, v30, v31, v32, v33);
  v45[3] = CFSTR("userMets");
  v34 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_userMets(self, v35, v36, v37, v38);
  v46[3] = objc_msgSend_numberWithDouble_(v34, v39, v40, v41, v42);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v43, (uint64_t)v46, (uint64_t)v45, 4);
}

@end
