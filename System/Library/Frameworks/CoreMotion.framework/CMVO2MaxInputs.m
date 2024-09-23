@implementation CMVO2MaxInputs

- (CMVO2MaxInputs)initWithRecordId:(unint64_t)a3 startDate:(id)a4 mets:(double)a5 metSource:(int64_t)a6 heartRate:(double)a7 heartRateConfidence:(double)a8 gradeType:(int64_t)a9 grade:(double)a10 cadence:(double)a11 pace:(double)a12 hasGPS:(BOOL)a13 hasStrideCal:(BOOL)a14 workoutType:(int64_t)a15
{
  CMVO2MaxInputs *v28;
  CMVO2MaxInputs *v29;
  void *v32;
  const char *v33;
  objc_super v34;

  if (!a3)
  {
    v32 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4, a6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMVO2MaxData.mm"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));
  }
  v34.receiver = self;
  v34.super_class = (Class)CMVO2MaxInputs;
  v28 = -[CMVO2MaxInputs init](&v34, sel_init);
  v29 = v28;
  if (v28)
  {
    v28->fRecordId = a3;
    v28->fStartDate = (NSDate *)a4;
    v29->fWorkoutSessionId = 0;
    v29->fMets = a5;
    v29->fMetSource = a6;
    v29->fHeartRate = a7;
    v29->fHeartRateConfidence = a8;
    v29->fGradeType = a9;
    v29->fGrade = a10;
    v29->fCadence = a11;
    v29->fPace = a12;
    v29->fHasGPS = a13;
    v29->fHasStrideCal = a14;
    v29->fWorkoutType = a15;
  }
  return v29;
}

- (CMVO2MaxInputs)initWithSample:(VO2MaxInput *)a3
{
  unint64_t var0;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  CMVO2MaxInputs *hasStrideCal_workoutType;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  var0 = a3->var0;
  v6 = objc_alloc(MEMORY[0x1E0C99D68]);
  v11 = objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v6, v7, v8, v9, v10, a3->var3);
  hasStrideCal_workoutType = (CMVO2MaxInputs *)objc_msgSend_initWithRecordId_startDate_mets_metSource_heartRate_heartRateConfidence_gradeType_grade_cadence_pace_hasGPS_hasStrideCal_workoutType_(self, v12, var0, v11, a3->var11, a3->var7, a3->var9, a3->var10, a3->var2, a3->var4, a3->var5, a3->var8, a3->var13, a3->var14, a3->var12);
  v14 = objc_alloc(MEMORY[0x1E0CB3A28]);
  hasStrideCal_workoutType->fWorkoutSessionId = (NSUUID *)objc_msgSend_initWithUUIDBytes_(v14, v15, (uint64_t)a3->var1, v16, v17);
  return hasStrideCal_workoutType;
}

- (void)dealloc
{
  NSUUID *fWorkoutSessionId;
  objc_super v4;

  fWorkoutSessionId = self->fWorkoutSessionId;
  if (fWorkoutSessionId)

  v4.receiver = self;
  v4.super_class = (Class)CMVO2MaxInputs;
  -[CMVO2MaxInputs dealloc](&v4, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMVO2MaxInputs)initWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
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
  uint64_t v19;
  double v20;
  double v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  CMVO2MaxInputs *hasStrideCal_workoutType;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;

  v7 = objc_msgSend_decodeIntegerForKey_(a3, a2, (uint64_t)CFSTR("kVO2MaxDataCodingKeyRecordId"), v3, v4);
  v8 = objc_opt_class();
  v11 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kVO2MaxDataCodingKeyStartDate"), v10);
  v16 = objc_msgSend_copy(v11, v12, v13, v14, v15);
  objc_msgSend_decodeDoubleForKey_(a3, v17, (uint64_t)CFSTR("kVO2MaxDataCodingKeyMets"), v18, v19);
  v21 = v20;
  v25 = objc_msgSend_decodeIntegerForKey_(a3, v22, (uint64_t)CFSTR("kVO2MaxDataCodingKeyMetSource"), v23, v24);
  objc_msgSend_decodeDoubleForKey_(a3, v26, (uint64_t)CFSTR("kVO2MaxDataCodingKeyHeartRate"), v27, v28);
  v30 = v29;
  objc_msgSend_decodeDoubleForKey_(a3, v31, (uint64_t)CFSTR("kVO2MaxDataCodingKeyHeartRateConfidence"), v32, v33);
  v35 = v34;
  v39 = objc_msgSend_decodeIntegerForKey_(a3, v36, (uint64_t)CFSTR("kVO2MaxDataCodingKeyGradeType"), v37, v38);
  objc_msgSend_decodeDoubleForKey_(a3, v40, (uint64_t)CFSTR("kVO2MaxDataCodingKeyGrade"), v41, v42);
  v44 = v43;
  objc_msgSend_decodeDoubleForKey_(a3, v45, (uint64_t)CFSTR("kVO2MaxDataCodingKeyCadence"), v46, v47);
  v49 = v48;
  objc_msgSend_decodeDoubleForKey_(a3, v50, (uint64_t)CFSTR("kVO2MaxDataCodingKeyPace"), v51, v52);
  v54 = v53;
  v58 = objc_msgSend_decodeBoolForKey_(a3, v55, (uint64_t)CFSTR("kVO2MaxDataCodingKeyHasGPS"), v56, v57);
  v62 = objc_msgSend_decodeBoolForKey_(a3, v59, (uint64_t)CFSTR("kVO2MaxDataCodingKeyHasStrideCal"), v60, v61);
  v66 = objc_msgSend_decodeIntegerForKey_(a3, v63, (uint64_t)CFSTR("kVO2MaxDataCodingKeyWorkoutType"), v64, v65);
  hasStrideCal_workoutType = (CMVO2MaxInputs *)objc_msgSend_initWithRecordId_startDate_mets_metSource_heartRate_heartRateConfidence_gradeType_grade_cadence_pace_hasGPS_hasStrideCal_workoutType_(self, v67, v7, v16, v25, v39, v58, v62, v21, v30, v35, v44, v49, v54, v66);
  v69 = objc_opt_class();
  v72 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v70, v69, (uint64_t)CFSTR("kVO2MaxDataCodingKeyWorkoutSessionId"), v71);
  hasStrideCal_workoutType->fWorkoutSessionId = (NSUUID *)objc_msgSend_copy(v72, v73, v74, v75, v76);
  return hasStrideCal_workoutType;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  NSDate *fStartDate;
  unint64_t fRecordId;
  float fMets;
  float32x2_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  _OWORD v24[7];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[32];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v26 = 0;
  fRecordId = self->fRecordId;
  fStartDate = self->fStartDate;
  v25 = fRecordId;
  fMets = self->fMets;
  *((float *)&v26 + 2) = fMets;
  objc_msgSend_timeIntervalSinceReferenceDate(fStartDate, a2, (uint64_t)a3, v3, v4);
  v10 = vcvt_f32_f64(*(float64x2_t *)&self->fHeartRate);
  *(_QWORD *)&v27 = v11;
  *((float32x2_t *)&v27 + 1) = v10;
  *(_QWORD *)&v28 = 0xFFEFFFFFFFFFFFFFLL;
  DWORD2(v28) = self->fGradeType;
  *(double *)&v29 = self->fGrade;
  WORD4(v29) = *(_WORD *)&self->fHasGPS;
  HIDWORD(v29) = self->fMetSource;
  *(_QWORD *)v30 = self->fWorkoutType;
  *(_OWORD *)&v30[8] = *(_OWORD *)&self->fCadence;
  v30[24] = 0;
  objc_msgSend_getUUIDBytes_(self->fWorkoutSessionId, v12, (uint64_t)&v25 + 8, v13, v14);
  v15 = (void *)objc_opt_class();
  v19 = (void *)objc_msgSend_allocWithZone_(v15, v16, (uint64_t)a3, v17, v18);
  v24[4] = v29;
  v24[5] = *(_OWORD *)v30;
  v24[6] = *(_OWORD *)&v30[16];
  v24[0] = v25;
  v24[1] = v26;
  v24[2] = v27;
  v24[3] = v28;
  return (id)objc_msgSend_initWithSample_(v19, v20, (uint64_t)v24, v21, v22);
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
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, (uint64_t)CFSTR("kVO2MaxDataCodingKeyRecordId"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kVO2MaxDataCodingKeyStartDate"), v7);
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->fWorkoutSessionId, (uint64_t)CFSTR("kVO2MaxDataCodingKeyWorkoutSessionId"), v9);
  objc_msgSend_encodeDouble_forKey_(a3, v10, (uint64_t)CFSTR("kVO2MaxDataCodingKeyMets"), v11, v12, self->fMets);
  objc_msgSend_encodeInteger_forKey_(a3, v13, self->fMetSource, (uint64_t)CFSTR("kVO2MaxDataCodingKeyMetSource"), v14);
  objc_msgSend_encodeDouble_forKey_(a3, v15, (uint64_t)CFSTR("kVO2MaxDataCodingKeyHeartRate"), v16, v17, self->fHeartRate);
  objc_msgSend_encodeDouble_forKey_(a3, v18, (uint64_t)CFSTR("kVO2MaxDataCodingKeyHeartRateConfidence"), v19, v20, self->fHeartRateConfidence);
  objc_msgSend_encodeInteger_forKey_(a3, v21, self->fGradeType, (uint64_t)CFSTR("kVO2MaxDataCodingKeyGradeType"), v22);
  objc_msgSend_encodeDouble_forKey_(a3, v23, (uint64_t)CFSTR("kVO2MaxDataCodingKeyGrade"), v24, v25, self->fGrade);
  objc_msgSend_encodeDouble_forKey_(a3, v26, (uint64_t)CFSTR("kVO2MaxDataCodingKeyCadence"), v27, v28, self->fCadence);
  objc_msgSend_encodeDouble_forKey_(a3, v29, (uint64_t)CFSTR("kVO2MaxDataCodingKeyPace"), v30, v31, self->fPace);
  objc_msgSend_encodeBool_forKey_(a3, v32, self->fHasGPS, (uint64_t)CFSTR("kVO2MaxDataCodingKeyHasGPS"), v33);
  objc_msgSend_encodeBool_forKey_(a3, v34, self->fHasStrideCal, (uint64_t)CFSTR("kVO2MaxDataCodingKeyHasStrideCal"), v35);
  objc_msgSend_encodeInteger_forKey_(a3, v36, self->fWorkoutType, (uint64_t)CFSTR("kVO2MaxDataCodingKeyWorkoutType"), v37);
}

+ (VO2MaxInput)VO2MaxInputFromCMVO2MaxInputs:(SEL)a3
{
  uint64_t v4;
  uint64_t v5;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *started;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v79;
  const char *v80;

  if (!a4)
  {
    v79 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a3, 0, v4, v5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v79, v80, (uint64_t)a3, (uint64_t)a2, (uint64_t)CFSTR("CMVO2MaxData.mm"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sample"));
  }
  retstr->var0 = objc_msgSend_recordId(a4, a3, (uint64_t)a4, v4, v5);
  *(_QWORD *)&retstr->var1[8] = 0;
  *(_QWORD *)retstr->var1 = 0;
  objc_msgSend_mets(a4, v8, v9, v10, v11);
  *(float *)&v12 = v12;
  retstr->var2 = *(float *)&v12;
  started = (void *)objc_msgSend_startDate(a4, v13, v14, v15, v16);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v18, v19, v20, v21);
  retstr->var3 = v22;
  objc_msgSend_heartRate(a4, v23, v24, v25, v26);
  *(float *)&v27 = v27;
  retstr->var4 = *(float *)&v27;
  objc_msgSend_heartRateConfidence(a4, v28, v29, v30, v31);
  *(float *)&v32 = v32;
  retstr->var5 = *(float *)&v32;
  retstr->var6 = -1.79769313e308;
  retstr->var7 = objc_msgSend_gradeType(a4, v33, v34, v35, v36);
  objc_msgSend_grade(a4, v37, v38, v39, v40);
  retstr->var8 = v41;
  retstr->var9 = objc_msgSend_hasGPS(a4, v42, v43, v44, v45);
  retstr->var10 = objc_msgSend_hasStrideCal(a4, v46, v47, v48, v49);
  retstr->var11 = objc_msgSend_metSource(a4, v50, v51, v52, v53);
  retstr->var12 = objc_msgSend_workoutType(a4, v54, v55, v56, v57);
  objc_msgSend_cadence(a4, v58, v59, v60, v61);
  retstr->var13 = v62;
  objc_msgSend_pace(a4, v63, v64, v65, v66);
  retstr->var14 = v67;
  retstr->var15 = 0;
  v72 = (void *)objc_msgSend_workoutSessionId(a4, v68, v69, v70, v71);
  return (VO2MaxInput *)objc_msgSend_getUUIDBytes_(v72, v73, (uint64_t)retstr->var1, v74, v75);
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
  int isEqual;
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
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
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
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  double v96;
  double v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  double v106;
  double v107;
  double v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  double v117;
  double v118;
  double v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  double v128;
  int hasGPS;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  int hasStrideCal;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_19;
  v9 = objc_msgSend_recordId(self, v5, v6, v7, v8);
  if (v9 != objc_msgSend_recordId(a3, v10, v11, v12, v13))
    goto LABEL_19;
  if (!objc_msgSend_startDate(self, v14, v15, v16, v17) && !objc_msgSend_startDate(a3, v18, v19, v20, v21)
    || (started = (void *)objc_msgSend_startDate(self, v18, v19, v20, v21),
        v27 = objc_msgSend_startDate(a3, v23, v24, v25, v26),
        (isEqual = objc_msgSend_isEqualToDate_(started, v28, v27, v29, v30)) != 0))
  {
    if (!objc_msgSend_workoutSessionId(self, v18, v19, v20, v21)
      && !objc_msgSend_workoutSessionId(a3, v32, v33, v34, v35)
      || (v36 = (void *)objc_msgSend_workoutSessionId(self, v32, v33, v34, v35),
          v41 = objc_msgSend_workoutSessionId(a3, v37, v38, v39, v40),
          (isEqual = objc_msgSend_isEqual_(v36, v42, v41, v43, v44)) != 0))
    {
      objc_msgSend_mets(self, v32, v33, v34, v35);
      v46 = v45;
      objc_msgSend_mets(a3, v47, v48, v49, v50);
      if (v46 != v55)
        goto LABEL_19;
      v56 = objc_msgSend_metSource(self, v51, v52, v53, v54);
      if (v56 != objc_msgSend_metSource(a3, v57, v58, v59, v60))
        goto LABEL_19;
      objc_msgSend_heartRate(self, v61, v62, v63, v64);
      v66 = v65;
      objc_msgSend_heartRate(a3, v67, v68, v69, v70);
      if (v66 != v75)
        goto LABEL_19;
      objc_msgSend_heartRateConfidence(self, v71, v72, v73, v74);
      v77 = v76;
      objc_msgSend_heartRateConfidence(a3, v78, v79, v80, v81);
      if (v77 != v86)
        goto LABEL_19;
      v87 = objc_msgSend_gradeType(self, v82, v83, v84, v85);
      if (v87 != objc_msgSend_gradeType(a3, v88, v89, v90, v91))
        goto LABEL_19;
      objc_msgSend_grade(self, v92, v93, v94, v95);
      v97 = v96;
      objc_msgSend_grade(a3, v98, v99, v100, v101);
      if (v97 != v106)
        goto LABEL_19;
      objc_msgSend_cadence(self, v102, v103, v104, v105);
      v108 = v107;
      objc_msgSend_cadence(a3, v109, v110, v111, v112);
      if (v108 != v117
        || (objc_msgSend_pace(self, v113, v114, v115, v116),
            v119 = v118,
            objc_msgSend_pace(a3, v120, v121, v122, v123),
            v119 != v128)
        || (hasGPS = objc_msgSend_hasGPS(self, v124, v125, v126, v127),
            hasGPS != objc_msgSend_hasGPS(a3, v130, v131, v132, v133))
        || (hasStrideCal = objc_msgSend_hasStrideCal(self, v134, v135, v136, v137),
            hasStrideCal != objc_msgSend_hasStrideCal(a3, v139, v140, v141, v142)))
      {
LABEL_19:
        LOBYTE(isEqual) = 0;
        return isEqual;
      }
      v147 = objc_msgSend_workoutType(self, v143, v144, v145, v146);
      LOBYTE(isEqual) = v147 == objc_msgSend_workoutType(a3, v148, v149, v150, v151);
    }
  }
  return isEqual;
}

- (unint64_t)recordId
{
  return self->fRecordId;
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSUUID)workoutSessionId
{
  return self->fWorkoutSessionId;
}

- (double)mets
{
  return self->fMets;
}

- (int64_t)metSource
{
  return self->fMetSource;
}

- (double)heartRate
{
  return self->fHeartRate;
}

- (double)heartRateConfidence
{
  return self->fHeartRateConfidence;
}

- (int64_t)gradeType
{
  return self->fGradeType;
}

- (double)grade
{
  return self->fGrade;
}

- (double)cadence
{
  return self->fCadence;
}

- (double)pace
{
  return self->fPace;
}

- (BOOL)hasGPS
{
  return self->fHasGPS;
}

- (BOOL)hasStrideCal
{
  return self->fHasStrideCal;
}

- (int64_t)workoutType
{
  return self->fWorkoutType;
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
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unsigned int hasGPS;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unsigned int hasStrideCal;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_recordId(self, v6, v7, v8, v9);
  started = objc_msgSend_startDate(self, v11, v12, v13, v14);
  v20 = objc_msgSend_workoutSessionId(self, v16, v17, v18, v19);
  objc_msgSend_mets(self, v21, v22, v23, v24);
  v26 = v25;
  v31 = objc_msgSend_metSource(self, v27, v28, v29, v30);
  objc_msgSend_heartRate(self, v32, v33, v34, v35);
  v37 = v36;
  objc_msgSend_heartRateConfidence(self, v38, v39, v40, v41);
  v43 = v42;
  v48 = objc_msgSend_gradeType(self, v44, v45, v46, v47);
  objc_msgSend_grade(self, v49, v50, v51, v52);
  v54 = v53;
  objc_msgSend_cadence(self, v55, v56, v57, v58);
  v60 = v59;
  objc_msgSend_pace(self, v61, v62, v63, v64);
  v66 = v65;
  hasGPS = objc_msgSend_hasGPS(self, v67, v68, v69, v70);
  hasStrideCal = objc_msgSend_hasStrideCal(self, v72, v73, v74, v75);
  v81 = objc_msgSend_workoutType(self, v77, v78, v79, v80);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v82, (uint64_t)CFSTR("%@, <recordId %lu, startDate, %@, workoutSessionId %@, mets, %.3f, metSource, %lu, hr, %.3f, hrConf, %.3f, gradeType, %lu, grade, %.3f, cadence, %.3f, pace, %.3f, hasGPS, %d, hasStrideCal, %d, workoutType, %lu>"), v83, v84, v5, v10, started, v20, v26, v31, v37, v43, v48, v54, v60, v66, hasGPS, hasStrideCal,
                       v81);
}

+ (VO2MaxInput)inputFromPreparedStatement:(SEL)a3
{
  float v6;
  float v7;
  float v8;
  const unsigned __int8 *v9;

  retstr->var0 = sqlite3_column_int64(a4, 0);
  *(_QWORD *)&retstr->var1[8] = 0;
  *(_QWORD *)retstr->var1 = 0;
  v6 = sqlite3_column_double(a4, 3);
  retstr->var2 = v6;
  retstr->var3 = sqlite3_column_double(a4, 2);
  v7 = sqlite3_column_double(a4, 5);
  retstr->var4 = v7;
  v8 = sqlite3_column_double(a4, 6);
  retstr->var5 = v8;
  retstr->var6 = sqlite3_column_double(a4, 15);
  retstr->var7 = sqlite3_column_int(a4, 7);
  retstr->var8 = sqlite3_column_double(a4, 8);
  retstr->var9 = sqlite3_column_int(a4, 9) != 0;
  retstr->var10 = sqlite3_column_int(a4, 10) != 0;
  retstr->var11 = sqlite3_column_int(a4, 4);
  retstr->var12 = sqlite3_column_int(a4, 11);
  retstr->var13 = sqlite3_column_double(a4, 12);
  retstr->var14 = sqlite3_column_double(a4, 13);
  retstr->var15 = sqlite3_column_int(a4, 14) != 0;
  v9 = sqlite3_column_text(a4, 1);
  return (VO2MaxInput *)uuid_parse((const char *)v9, retstr->var1);
}

- (void)setWorkoutSessionId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
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

- (CMVO2MaxInputs)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  CMVO2MaxInputs *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
  {
    v15.receiver = self;
    v15.super_class = (Class)CMVO2MaxInputs;
    v8 = -[CMVO2MaxInputs init](&v15, sel_init);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3710];
      v10 = objc_opt_class();
      v12 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v9, v11, v10, (uint64_t)a3, 0);
      if (v12)
      {
        v13 = (void *)v12;

        return (CMVO2MaxInputs *)v13;
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
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *started;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const __CFString *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  _QWORD v85[8];
  _QWORD v86[9];

  v86[8] = *MEMORY[0x1E0C80C00];
  objc_msgSend_heartRateConfidence(self, a2, v2, v3, v4);
  if (v10 >= 0.6)
  {
    objc_msgSend_heartRateConfidence(self, v6, v7, v8, v9);
    if (v12 >= 0.8)
    {
      objc_msgSend_heartRateConfidence(self, v6, v7, v8, v9);
      if (v13 >= 1.0)
        v11 = 3;
      else
        v11 = 2;
    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }
  v85[0] = CFSTR("startTime");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  started = (void *)objc_msgSend_startDate(self, v6, v7, v8, v9);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v16, v17, v18, v19);
  v86[0] = objc_msgSend_numberWithDouble_(v14, v20, v21, v22, v23);
  v85[1] = CFSTR("workoutSessionId");
  v28 = (void *)objc_msgSend_workoutSessionId(self, v24, v25, v26, v27);
  v33 = objc_msgSend_UUIDString(v28, v29, v30, v31, v32);
  v38 = &stru_1E295ADC8;
  if (v33)
    v38 = (const __CFString *)v33;
  v86[1] = v38;
  v85[2] = CFSTR("mets");
  v39 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_mets(self, v34, v35, v36, v37);
  v86[2] = objc_msgSend_numberWithDouble_(v39, v40, v41, v42, v43);
  v85[3] = CFSTR("heartRate");
  v44 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_heartRate(self, v45, v46, v47, v48);
  v86[3] = objc_msgSend_numberWithDouble_(v44, v49, v50, v51, v52);
  v85[4] = CFSTR("heartRateConfidence");
  v86[4] = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v53, v11, v54, v55);
  v85[5] = CFSTR("grade");
  v56 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_grade(self, v57, v58, v59, v60);
  v86[5] = objc_msgSend_numberWithDouble_(v56, v61, v62, v63, v64);
  v85[6] = CFSTR("cadence");
  v65 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_cadence(self, v66, v67, v68, v69);
  v86[6] = objc_msgSend_numberWithDouble_(v65, v70, v71, v72, v73);
  v85[7] = CFSTR("pace");
  v74 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_pace(self, v75, v76, v77, v78);
  v86[7] = objc_msgSend_numberWithDouble_(v74, v79, v80, v81, v82);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v83, (uint64_t)v86, (uint64_t)v85, 8);
}

@end
