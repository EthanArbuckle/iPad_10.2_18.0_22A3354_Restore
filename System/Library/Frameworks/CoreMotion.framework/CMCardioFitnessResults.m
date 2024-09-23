@implementation CMCardioFitnessResults

- (CMCardioFitnessResults)initWithRecordId:(unint64_t)a3 startDate:(id)a4 workoutType:(int64_t)a5 sessionId:(id)a6 estimatedVo2Max:(double)a7 durationInSeconds:(double)a8 hrMax:(double)a9 hrMin:(double)a10 variance:(double)a11 filteredVo2Max:(double)a12 sessionType:(int64_t)a13 eligibleForHealthKit:(BOOL)a14 eligibleForCalorimetry:(BOOL)a15 numWorkoutsContrToEstimate:(unint64_t)a16 estimatedHRResponseParam:(double)a17 estimatedHRRecoveryParam:(double)a18 sessionVo2Max:(double)a19
{
  CMCardioFitnessResults *v33;
  CMCardioFitnessResults *v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)CMCardioFitnessResults;
  v33 = -[CMCardioFitnessResults init](&v36, sel_init);
  v34 = v33;
  if (v33)
  {
    v33->fRecordId = a3;
    v33->fStartDate = (NSDate *)a4;
    v34->fWorkoutType = a5;
    v34->fSessionId = (NSUUID *)a6;
    v34->fEstimatedVo2Max = a7;
    v34->fDurationInSeconds = a8;
    v34->fHRMax = a9;
    v34->fHRMin = a10;
    v34->fVariance = a11;
    v34->fFilteredVo2Max = a12;
    v34->fSessionType = a13;
    v34->fEligibleForHealthKit = a14;
    v34->fEligibleForCalorimetry = a15;
    v34->fNumWorkoutsContrToEstimate = a16;
    v34->fEstimatedHRResponseParam = a17;
    v34->fEstimatedHRRecoveryParam = a18;
    v34->fSessionVo2Max = a19;
  }
  return v34;
}

- (CMCardioFitnessResults)initWithSample:(VO2MaxOutput *)a3
{
  CMCardioFitnessResults *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CMCardioFitnessResults;
  v4 = -[CMCardioFitnessResults init](&v16, sel_init);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v9 = (void *)objc_msgSend_initWithUUIDBytes_(v5, v6, (uint64_t)a3->var8, v7, v8);
    v4->fRecordId = a3->var0;
    v10 = objc_alloc(MEMORY[0x1E0C99D68]);
    v4->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v10, v11, v12, v13, v14, a3->var2);
    v4->fWorkoutType = a3->var4;
    v4->fSessionId = (NSUUID *)v9;
    v4->fEstimatedVo2Max = a3->var3;
    v4->fDurationInSeconds = a3->var5;
    v4->fHRMax = a3->var6;
    v4->fHRMin = a3->var7;
    v4->fVariance = a3->var9;
    v4->fFilteredVo2Max = a3->var10;
    v4->fSessionType = a3->var11;
    v4->fEligibleForHealthKit = a3->var12;
    v4->fEligibleForCalorimetry = a3->var13;
    v4->fNumWorkoutsContrToEstimate = a3->var14;
    v4->fEstimatedHRResponseParam = a3->var15;
    v4->fEstimatedHRRecoveryParam = a3->var16;
    v4->fSessionVo2Max = a3->var17;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMCardioFitnessResults;
  -[CMCardioFitnessResults dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMCardioFitnessResults)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMCardioFitnessResults *v7;
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
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  objc_super v71;

  v71.receiver = self;
  v71.super_class = (Class)CMCardioFitnessResults;
  v7 = -[CMCardioFitnessResults init](&v71, sel_init);
  if (v7)
  {
    v7->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyRecordId"), v5, v6);
    v8 = objc_opt_class();
    v11 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyStartDate"), v10);
    v7->fStartDate = (NSDate *)objc_msgSend_copy(v11, v12, v13, v14, v15);
    v7->fWorkoutType = objc_msgSend_decodeIntegerForKey_(a3, v16, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyWorkoutType"), v17, v18);
    v19 = objc_opt_class();
    v7->fSessionId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v20, v19, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeySessionId"), v21);
    objc_msgSend_decodeDoubleForKey_(a3, v22, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyEstimatedVO2Max"), v23, v24);
    v7->fEstimatedVo2Max = v25;
    objc_msgSend_decodeDoubleForKey_(a3, v26, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyDurationInSeconds"), v27, v28);
    v7->fDurationInSeconds = v29;
    objc_msgSend_decodeDoubleForKey_(a3, v30, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyHRMax"), v31, v32);
    v7->fHRMax = v33;
    objc_msgSend_decodeDoubleForKey_(a3, v34, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyHRMin"), v35, v36);
    v7->fHRMin = v37;
    objc_msgSend_decodeDoubleForKey_(a3, v38, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyVariance"), v39, v40);
    v7->fVariance = v41;
    objc_msgSend_decodeDoubleForKey_(a3, v42, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyFilteredVO2Max"), v43, v44);
    v7->fFilteredVo2Max = v45;
    v7->fSessionType = objc_msgSend_decodeIntegerForKey_(a3, v46, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeySessionType"), v47, v48);
    v7->fEligibleForHealthKit = objc_msgSend_decodeBoolForKey_(a3, v49, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyEligibleForHealthKit"), v50, v51);
    v7->fEligibleForCalorimetry = objc_msgSend_decodeBoolForKey_(a3, v52, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyEligibleForCalorimetry"), v53, v54);
    v7->fNumWorkoutsContrToEstimate = (int)objc_msgSend_decodeInt32ForKey_(a3, v55, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyNumWorkoutsContrToEstimate"), v56, v57);
    objc_msgSend_decodeDoubleForKey_(a3, v58, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyEstimatedHRResponseParam"), v59, v60);
    v7->fEstimatedHRResponseParam = v61;
    objc_msgSend_decodeDoubleForKey_(a3, v62, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyEstimatedHRRecoveryParam"), v63, v64);
    v7->fEstimatedHRRecoveryParam = v65;
    objc_msgSend_decodeDoubleForKey_(a3, v66, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeySessionVo2Max"), v67, v68);
    v7->fSessionVo2Max = v69;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  NSDate *fStartDate;
  unint64_t fRecordId;
  double fEstimatedVo2Max;
  uint64_t v10;
  NSUUID *fSessionId;
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
  _OWORD v24[9];
  unint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[32];
  _BYTE v32[32];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  *(_QWORD *)&v27 = 0;
  fRecordId = self->fRecordId;
  fStartDate = self->fStartDate;
  v25 = fRecordId;
  objc_msgSend_timeIntervalSinceReferenceDate(fStartDate, a2, (uint64_t)a3, v3, v4);
  fEstimatedVo2Max = self->fEstimatedVo2Max;
  *((_QWORD *)&v27 + 1) = v10;
  *(double *)&v28 = fEstimatedVo2Max;
  fSessionId = self->fSessionId;
  *((_QWORD *)&v28 + 1) = self->fWorkoutType;
  v29 = *(_OWORD *)&self->fDurationInSeconds;
  v30 = *(unint64_t *)&self->fHRMin;
  *(_DWORD *)&v31[24] = self->fSessionType;
  v31[28] = self->fEligibleForHealthKit;
  v31[29] = self->fEligibleForCalorimetry;
  *(_DWORD *)v32 = self->fNumWorkoutsContrToEstimate;
  *(_QWORD *)v31 = 0;
  *(_OWORD *)&v31[8] = *(_OWORD *)&self->fVariance;
  *(_OWORD *)&v32[8] = *(_OWORD *)&self->fEstimatedHRResponseParam;
  *(double *)&v32[24] = self->fSessionVo2Max;
  objc_msgSend_getUUIDBytes_(fSessionId, v12, (uint64_t)&v30 + 8, v13, v14);
  v15 = (void *)objc_opt_class();
  v19 = (void *)objc_msgSend_allocWithZone_(v15, v16, (uint64_t)a3, v17, v18);
  v24[6] = *(_OWORD *)&v31[16];
  v24[7] = *(_OWORD *)v32;
  v24[8] = *(_OWORD *)&v32[16];
  v24[2] = v28;
  v24[3] = v29;
  v24[4] = v30;
  v24[5] = *(_OWORD *)v31;
  v24[0] = v25;
  v24[1] = v27;
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
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyRecordId"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyStartDate"), v7);
  objc_msgSend_encodeInteger_forKey_(a3, v8, self->fWorkoutType, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyWorkoutType"), v9);
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->fSessionId, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeySessionId"), v11);
  objc_msgSend_encodeDouble_forKey_(a3, v12, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyEstimatedVO2Max"), v13, v14, self->fEstimatedVo2Max);
  objc_msgSend_encodeDouble_forKey_(a3, v15, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyDurationInSeconds"), v16, v17, self->fDurationInSeconds);
  objc_msgSend_encodeDouble_forKey_(a3, v18, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyHRMax"), v19, v20, self->fHRMax);
  objc_msgSend_encodeDouble_forKey_(a3, v21, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyHRMin"), v22, v23, self->fHRMin);
  objc_msgSend_encodeDouble_forKey_(a3, v24, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyVariance"), v25, v26, self->fVariance);
  objc_msgSend_encodeDouble_forKey_(a3, v27, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyFilteredVO2Max"), v28, v29, self->fFilteredVo2Max);
  objc_msgSend_encodeInteger_forKey_(a3, v30, self->fSessionType, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeySessionType"), v31);
  objc_msgSend_encodeBool_forKey_(a3, v32, self->fEligibleForHealthKit, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyEligibleForHealthKit"), v33);
  objc_msgSend_encodeBool_forKey_(a3, v34, self->fEligibleForCalorimetry, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyEligibleForCalorimetry"), v35);
  objc_msgSend_encodeInteger_forKey_(a3, v36, self->fNumWorkoutsContrToEstimate, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyNumWorkoutsContrToEstimate"), v37);
  objc_msgSend_encodeDouble_forKey_(a3, v38, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyEstimatedHRResponseParam"), v39, v40, self->fEstimatedHRResponseParam);
  objc_msgSend_encodeDouble_forKey_(a3, v41, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeyEstimatedHRRecoveryParam"), v42, v43, self->fEstimatedHRRecoveryParam);
  objc_msgSend_encodeDouble_forKey_(a3, v44, (uint64_t)CFSTR("kCMCardioFitnessResultsCodingKeySessionVo2Max"), v45, v46, self->fSessionVo2Max);
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
  void *started;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  double v69;
  double v70;
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
  double v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  double v103;
  double v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  double v109;
  double v110;
  double v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  double v116;
  BOOL v117;
  double v119;
  double v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  double v125;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v9 = objc_msgSend_recordId(self, v5, v6, v7, v8);
  if (v9 != objc_msgSend_recordId(a3, v10, v11, v12, v13))
    goto LABEL_23;
  if (objc_msgSend_startDate(self, v14, v15, v16, v17) || objc_msgSend_startDate(a3, v14, v15, v16, v17))
  {
    started = (void *)objc_msgSend_startDate(self, v14, v15, v16, v17);
    v23 = objc_msgSend_startDate(a3, v19, v20, v21, v22);
    if (!objc_msgSend_isEqualToDate_(started, v24, v23, v25, v26))
      goto LABEL_23;
  }
  v27 = objc_msgSend_workoutType(self, v14, v15, v16, v17);
  if (v27 != objc_msgSend_workoutType(a3, v28, v29, v30, v31))
    goto LABEL_23;
  if (objc_msgSend_sessionId(self, v14, v15, v16, v17) || objc_msgSend_sessionId(a3, v14, v15, v16, v17))
  {
    v32 = (void *)objc_msgSend_sessionId(self, v14, v15, v16, v17);
    v37 = objc_msgSend_sessionId(a3, v33, v34, v35, v36);
    if (!objc_msgSend_isEqual_(v32, v38, v37, v39, v40))
      goto LABEL_23;
  }
  objc_msgSend_estimatedVo2Max(self, v14, v15, v16, v17);
  v42 = v41;
  objc_msgSend_estimatedVo2Max(a3, v43, v44, v45, v46);
  if (v42 != v47)
    goto LABEL_23;
  objc_msgSend_durationInSeconds(self, v14, v15, v16, v17);
  v49 = v48;
  objc_msgSend_durationInSeconds(a3, v50, v51, v52, v53);
  if (v49 != v54)
    goto LABEL_23;
  objc_msgSend_hrMax(self, v14, v15, v16, v17);
  v56 = v55;
  objc_msgSend_hrMax(a3, v57, v58, v59, v60);
  if (v56 != v61)
    goto LABEL_23;
  objc_msgSend_hrMin(self, v14, v15, v16, v17);
  v63 = v62;
  objc_msgSend_hrMin(a3, v64, v65, v66, v67);
  if (v63 != v68)
    goto LABEL_23;
  objc_msgSend_variance(self, v14, v15, v16, v17);
  v70 = v69;
  objc_msgSend_variance(a3, v71, v72, v73, v74);
  if (v70 != v75)
    goto LABEL_23;
  objc_msgSend_filteredVo2Max(self, v14, v15, v16, v17);
  v77 = v76;
  objc_msgSend_filteredVo2Max(a3, v78, v79, v80, v81);
  if (v77 != v82)
    goto LABEL_23;
  v83 = objc_msgSend_sessionType(self, v14, v15, v16, v17);
  if (v83 == objc_msgSend_sessionType(a3, v84, v85, v86, v87)
    && (v88 = objc_msgSend_eligibleForHealthKit(self, v14, v15, v16, v17),
        v88 == objc_msgSend_eligibleForHealthKit(a3, v89, v90, v91, v92))
    && (v93 = objc_msgSend_eligibleForCalorimetry(self, v14, v15, v16, v17),
        v93 == objc_msgSend_eligibleForCalorimetry(a3, v94, v95, v96, v97))
    && (v98 = objc_msgSend_numWorkoutsContrToEstimate(self, v14, v15, v16, v17),
        v98 == objc_msgSend_numWorkoutsContrToEstimate(a3, v99, v100, v101, v102))
    && (objc_msgSend_estimatedHRResponseParam(self, v14, v15, v16, v17),
        v104 = v103,
        objc_msgSend_estimatedHRResponseParam(a3, v105, v106, v107, v108),
        v104 == v109))
  {
    objc_msgSend_estimatedHRRecoveryParam(self, v14, v15, v16, v17);
    v111 = v110;
    objc_msgSend_estimatedHRRecoveryParam(a3, v112, v113, v114, v115);
    v117 = v111 == v116;
  }
  else
  {
LABEL_23:
    v117 = 0;
  }
  objc_msgSend_sessionVo2Max(self, v14, v15, v16, v17);
  v120 = v119;
  objc_msgSend_sessionVo2Max(a3, v121, v122, v123, v124);
  return v120 == v125 && v117;
}

- (unint64_t)recordId
{
  return self->fRecordId;
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (int64_t)workoutType
{
  return self->fWorkoutType;
}

- (NSUUID)sessionId
{
  return self->fSessionId;
}

- (double)estimatedVo2Max
{
  return self->fEstimatedVo2Max;
}

- (double)durationInSeconds
{
  return self->fDurationInSeconds;
}

- (double)hrMax
{
  return self->fHRMax;
}

- (double)hrMin
{
  return self->fHRMin;
}

- (double)variance
{
  return self->fVariance;
}

- (double)filteredVo2Max
{
  return self->fFilteredVo2Max;
}

- (int64_t)sessionType
{
  return self->fSessionType;
}

- (BOOL)eligibleForHealthKit
{
  return self->fEligibleForHealthKit;
}

- (BOOL)eligibleForCalorimetry
{
  return self->fEligibleForCalorimetry;
}

- (unint64_t)numWorkoutsContrToEstimate
{
  return self->fNumWorkoutsContrToEstimate;
}

- (double)estimatedHRResponseParam
{
  return self->fEstimatedHRResponseParam;
}

- (double)estimatedHRRecoveryParam
{
  return self->fEstimatedHRRecoveryParam;
}

- (double)sessionVo2Max
{
  return self->fSessionVo2Max;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t started;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
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
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unsigned int v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  NSString *v108;
  void *v109;

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_sessionVo2Max(self, a2, v2, v3, v4);
  v11 = objc_msgSend_stringWithFormat_(v6, v7, (uint64_t)CFSTR(", sessionVo2Max, %f"), v8, v9, v10);
  v109 = (void *)MEMORY[0x1E0CB3940];
  v12 = (objc_class *)objc_opt_class();
  v108 = NSStringFromClass(v12);
  v17 = objc_msgSend_recordId(self, v13, v14, v15, v16);
  started = objc_msgSend_startDate(self, v18, v19, v20, v21);
  v27 = objc_msgSend_workoutType(self, v23, v24, v25, v26);
  v32 = (void *)objc_msgSend_sessionId(self, v28, v29, v30, v31);
  v37 = objc_msgSend_UUIDString(v32, v33, v34, v35, v36);
  objc_msgSend_estimatedVo2Max(self, v38, v39, v40, v41);
  v43 = v42;
  objc_msgSend_durationInSeconds(self, v44, v45, v46, v47);
  v49 = v48;
  objc_msgSend_hrMax(self, v50, v51, v52, v53);
  v55 = v54;
  objc_msgSend_hrMin(self, v56, v57, v58, v59);
  v61 = v60;
  objc_msgSend_variance(self, v62, v63, v64, v65);
  v67 = v66;
  objc_msgSend_filteredVo2Max(self, v68, v69, v70, v71);
  v73 = v72;
  v78 = objc_msgSend_sessionType(self, v74, v75, v76, v77);
  v83 = objc_msgSend_eligibleForHealthKit(self, v79, v80, v81, v82);
  LODWORD(v6) = objc_msgSend_eligibleForCalorimetry(self, v84, v85, v86, v87);
  v92 = objc_msgSend_numWorkoutsContrToEstimate(self, v88, v89, v90, v91);
  objc_msgSend_estimatedHRResponseParam(self, v93, v94, v95, v96);
  v98 = v97;
  objc_msgSend_estimatedHRRecoveryParam(self, v99, v100, v101, v102);
  return (NSString *)objc_msgSend_stringWithFormat_(v109, v103, (uint64_t)CFSTR("%@, <recordId, %lu, startDate, %@, workoutType, %ld, sessionId, %@, estimatedVo2Max, %f, durationInSeconds, %f, hrMax, %f, hrMin, %f, variance, %f, filteredVo2Max, %f, sessionType, %ld, eligibleForHealthKit, %d, eligibleForCalorimetry, %d, numWorkoutsContrToEstimate, %lu, estimatedHRResponseParam, %f, estimatedHRRecoveryParam, %f%@>"), v104, v105, v108, v17, started, v27, v37, v43, v49, v55, v61, v67, v73, v78, v83, v6,
                       v92,
                       v98,
                       v106,
                       v11);
}

+ (VO2MaxOutput)inputFromPreparedStatement:(SEL)a3
{
  int v6;
  double v7;
  const unsigned __int8 *v8;

  v6 = sqlite3_column_int(a4, 0);
  *(_QWORD *)retstr->var1 = 0;
  *(_QWORD *)&retstr->var1[8] = 0;
  retstr->var0 = v6;
  retstr->var2 = sqlite3_column_double(a4, 1);
  retstr->var3 = sqlite3_column_double(a4, 3);
  retstr->var4 = sqlite3_column_int(a4, 2);
  retstr->var5 = sqlite3_column_double(a4, 4);
  retstr->var6 = sqlite3_column_double(a4, 5);
  v7 = sqlite3_column_double(a4, 6);
  *(_QWORD *)retstr->var8 = 0;
  retstr = (VO2MaxOutput *)((char *)retstr + 72);
  retstr[-1].var17 = v7;
  *(_QWORD *)retstr->var1 = 0;
  *(double *)&retstr->var1[8] = sqlite3_column_double(a4, 8);
  retstr->var2 = sqlite3_column_double(a4, 9);
  LODWORD(retstr->var3) = (int)sqlite3_column_double(a4, 10);
  BYTE4(retstr->var3) = sqlite3_column_int(a4, 11) != 0;
  BYTE5(retstr->var3) = sqlite3_column_int(a4, 12) != 0;
  LODWORD(retstr->var4) = sqlite3_column_int(a4, 13);
  retstr->var5 = sqlite3_column_double(a4, 14);
  retstr->var6 = sqlite3_column_double(a4, 15);
  retstr->var7 = sqlite3_column_double(a4, 16);
  v8 = sqlite3_column_text(a4, 7);
  return (VO2MaxOutput *)uuid_parse((const char *)v8, (unsigned __int8 *)retstr);
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

- (CMCardioFitnessResults)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  CMCardioFitnessResults *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
  {
    v15.receiver = self;
    v15.super_class = (Class)CMCardioFitnessResults;
    v8 = -[CMCardioFitnessResults init](&v15, sel_init);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3710];
      v10 = objc_opt_class();
      v12 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v9, v11, v10, (uint64_t)a3, 0);
      if (v12)
      {
        v13 = (void *)v12;

        return (CMCardioFitnessResults *)v13;
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
  void *v7;
  void *started;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  _QWORD v101[8];
  _QWORD v102[9];

  v102[8] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99E08];
  v101[0] = CFSTR("startTime");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  started = (void *)objc_msgSend_startDate(self, a2, v2, v3, v4);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v9, v10, v11, v12);
  v102[0] = objc_msgSend_numberWithDouble_(v7, v13, v14, v15, v16);
  v101[1] = CFSTR("sessionId");
  v21 = (void *)objc_msgSend_sessionId(self, v17, v18, v19, v20);
  v26 = objc_msgSend_UUIDString(v21, v22, v23, v24, v25);
  v31 = &stru_1E295ADC8;
  if (v26)
    v31 = (const __CFString *)v26;
  v102[1] = v31;
  v101[2] = CFSTR("estimatedVo2Max");
  v32 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_estimatedVo2Max(self, v27, v28, v29, v30);
  v102[2] = objc_msgSend_numberWithDouble_(v32, v33, v34, v35, v36);
  v101[3] = CFSTR("durationInSeconds");
  v37 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_durationInSeconds(self, v38, v39, v40, v41);
  v102[3] = objc_msgSend_numberWithDouble_(v37, v42, v43, v44, v45);
  v101[4] = CFSTR("hrMax");
  v46 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_hrMax(self, v47, v48, v49, v50);
  v102[4] = objc_msgSend_numberWithDouble_(v46, v51, v52, v53, v54);
  v101[5] = CFSTR("hrMin");
  v55 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_hrMin(self, v56, v57, v58, v59);
  v102[5] = objc_msgSend_numberWithDouble_(v55, v60, v61, v62, v63);
  v101[6] = CFSTR("sessionType");
  v64 = (void *)MEMORY[0x1E0CB37E8];
  v69 = objc_msgSend_sessionType(self, v65, v66, v67, v68);
  v102[6] = objc_msgSend_numberWithInteger_(v64, v70, v69, v71, v72);
  v101[7] = CFSTR("numWorkoutsContrToEstimate");
  v73 = (void *)MEMORY[0x1E0CB37E8];
  v78 = objc_msgSend_numWorkoutsContrToEstimate(self, v74, v75, v76, v77);
  v102[7] = objc_msgSend_numberWithUnsignedInteger_(v73, v79, v78, v80, v81);
  v83 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v82, (uint64_t)v102, (uint64_t)v101, 8);
  v87 = (void *)objc_msgSend_dictionaryWithDictionary_(v6, v84, v83, v85, v86);
  v88 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_sessionVo2Max(self, v89, v90, v91, v92);
  v97 = objc_msgSend_numberWithDouble_(v88, v93, v94, v95, v96);
  objc_msgSend_setObject_forKeyedSubscript_(v87, v98, v97, (uint64_t)CFSTR("sessionVo2Max"), v99);
  return v87;
}

@end
