@implementation CMRecoverySession

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
  const __CFString *v30;
  void *v31;
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
  const char *v45;
  _QWORD v47[4];
  _QWORD v48[5];

  v48[4] = *MEMORY[0x1E0C80C00];
  v47[0] = CFSTR("startTime");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  started = (void *)objc_msgSend_startDate(self, a2, v2, v3, v4);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v8, v9, v10, v11);
  v48[0] = objc_msgSend_numberWithDouble_(v6, v12, v13, v14, v15);
  v47[1] = CFSTR("workoutSessionId");
  v20 = (void *)objc_msgSend_workoutSessionId(self, v16, v17, v18, v19);
  v25 = objc_msgSend_UUIDString(v20, v21, v22, v23, v24);
  v30 = &stru_1E295ADC8;
  if (v25)
    v30 = (const __CFString *)v25;
  v48[1] = v30;
  v47[2] = CFSTR("activityEndTime");
  v31 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_activityEndTime(self, v26, v27, v28, v29);
  v48[2] = objc_msgSend_numberWithDouble_(v31, v32, v33, v34, v35);
  v47[3] = CFSTR("hrRecovery");
  v36 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_hrRecovery(self, v37, v38, v39, v40);
  v48[3] = objc_msgSend_numberWithDouble_(v36, v41, v42, v43, v44);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v45, (uint64_t)v48, (uint64_t)v47, 4);
}

- (CMRecoverySession)initWithRecordId:(unint64_t)a3 startDate:(id)a4 activityEndTime:(double)a5 workoutSessionId:(id)a6 workoutType:(int64_t)a7 hrRecovery:(double)a8 lambda:(double)a9 hrMax:(double)a10 hrMinAdjusted:(double)a11 recoveryOnsetTime:(double)a12 steadyStateHR:(double)a13 status:(int64_t)a14 sessionHrRecovery:(double)a15 peakHR:(double)a16 hrRecoveryReference:(double)a17
{
  CMRecoverySession *v30;
  CMRecoverySession *v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)CMRecoverySession;
  v30 = -[CMRecoverySession init](&v33, sel_init);
  v31 = v30;
  if (v30)
  {
    v30->fRecordId = a3;
    v30->fStartDate = (NSDate *)a4;
    v31->fActivityEndTime = a5;
    v31->fWorkoutSessionId = (NSUUID *)a6;
    v31->fWorkoutType = a7;
    v31->fHrRecovery = a8;
    v31->fLambda = a9;
    v31->fHrMax = a10;
    v31->fHrMinAdjusted = a11;
    v31->fRecoveryOnsetTime = a12;
    v31->fSteadyStateHR = a13;
    v31->fStatus = a14;
    v31->fSessionHrRecovery = a15;
    v31->fPeakHR = a16;
    v31->fHrRecoveryReference = a17;
  }
  return v31;
}

- (CMRecoverySession)initWithSample:(HRRecoverySession *)a3
{
  CMRecoverySession *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CMRecoverySession;
  v4 = -[CMRecoverySession init](&v16, sel_init);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v9 = objc_msgSend_initWithUUIDBytes_(v5, v6, (uint64_t)a3->var4, v7, v8);
    v4->fRecordId = a3->var0;
    v10 = objc_alloc(MEMORY[0x1E0C99D68]);
    v4->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v10, v11, v12, v13, v14, a3->var1);
    v4->fActivityEndTime = a3->var2;
    v4->fWorkoutSessionId = (NSUUID *)v9;
    v4->fWorkoutType = a3->var5;
    v4->fHrRecovery = a3->var6;
    v4->fLambda = a3->var7;
    v4->fHrMax = a3->var8;
    v4->fHrMinAdjusted = a3->var9;
    v4->fRecoveryOnsetTime = a3->var10;
    v4->fSteadyStateHR = a3->var11;
    v4->fStatus = a3->var12;
    v4->fSessionHrRecovery = a3->var13;
    v4->fPeakHR = a3->var14;
    v4->fHrRecoveryReference = a3->var15;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMRecoverySession;
  -[CMRecoverySession dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMRecoverySession)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMRecoverySession *v7;
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
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
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
  double v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  objc_super v66;

  v66.receiver = self;
  v66.super_class = (Class)CMRecoverySession;
  v7 = -[CMRecoverySession init](&v66, sel_init);
  if (v7)
  {
    v7->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyRecordId"), v5, v6);
    v8 = objc_opt_class();
    v11 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyStartDate"), v10);
    v7->fStartDate = (NSDate *)objc_msgSend_copy(v11, v12, v13, v14, v15);
    objc_msgSend_decodeDoubleForKey_(a3, v16, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyActivityEndTime"), v17, v18);
    v7->fActivityEndTime = v19;
    v20 = objc_opt_class();
    v7->fWorkoutSessionId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v21, v20, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyWorkoutSessionId"), v22);
    v7->fWorkoutType = objc_msgSend_decodeIntegerForKey_(a3, v23, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyWorkoutType"), v24, v25);
    objc_msgSend_decodeDoubleForKey_(a3, v26, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyHRRecovery"), v27, v28);
    v7->fHrRecovery = v29;
    objc_msgSend_decodeDoubleForKey_(a3, v30, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyLambda"), v31, v32);
    v7->fLambda = v33;
    objc_msgSend_decodeDoubleForKey_(a3, v34, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyHRMax"), v35, v36);
    v7->fHrMax = v37;
    objc_msgSend_decodeDoubleForKey_(a3, v38, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyHRMinAdjusted"), v39, v40);
    v7->fHrMinAdjusted = v41;
    objc_msgSend_decodeDoubleForKey_(a3, v42, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyRecoveryOnsetTime"), v43, v44);
    v7->fRecoveryOnsetTime = v45;
    objc_msgSend_decodeDoubleForKey_(a3, v46, (uint64_t)CFSTR("kCMRecoverySessionCodingKeySteadyStateHR"), v47, v48);
    v7->fSteadyStateHR = v49;
    v7->fStatus = objc_msgSend_decodeIntegerForKey_(a3, v50, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyStatus"), v51, v52);
    objc_msgSend_decodeDoubleForKey_(a3, v53, (uint64_t)CFSTR("kCMRecoverySessionCodingKeySessionHRRecovery"), v54, v55);
    v7->fSessionHrRecovery = v56;
    objc_msgSend_decodeDoubleForKey_(a3, v57, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyPeakHR"), v58, v59);
    v7->fPeakHR = v60;
    objc_msgSend_decodeDoubleForKey_(a3, v61, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyHRRecoveryReference"), v62, v63);
    v7->fHrRecoveryReference = v64;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  NSDate *fStartDate;
  unint64_t fRecordId;
  double fActivityEndTime;
  uint64_t v10;
  __int128 v11;
  NSUUID *fWorkoutSessionId;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD v25[10];
  __int128 v26;
  double v27;
  uint64_t v28;
  __int128 v29;
  _BYTE v30[64];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  fRecordId = self->fRecordId;
  fStartDate = self->fStartDate;
  *(_QWORD *)&v26 = fRecordId;
  objc_msgSend_timeIntervalSinceReferenceDate(fStartDate, a2, (uint64_t)a3, v3, v4);
  fActivityEndTime = self->fActivityEndTime;
  *((_QWORD *)&v26 + 1) = v10;
  v27 = fActivityEndTime;
  v11 = *(_OWORD *)&self->fHrMax;
  *(_OWORD *)&v30[8] = *(_OWORD *)&self->fHrRecovery;
  fWorkoutSessionId = self->fWorkoutSessionId;
  *(_QWORD *)v30 = self->fWorkoutType;
  *(_DWORD *)&v30[56] = self->fStatus;
  v28 = 0;
  v29 = 0uLL;
  *(_OWORD *)&v30[24] = v11;
  *(_OWORD *)&v30[40] = *(_OWORD *)&self->fRecoveryOnsetTime;
  v31 = *(_OWORD *)&self->fSessionHrRecovery;
  v32 = *(unint64_t *)&self->fHrRecoveryReference;
  *(_QWORD *)&v33 = 0;
  WORD4(v33) = 0;
  objc_msgSend_getUUIDBytes_(fWorkoutSessionId, v13, (uint64_t)&v29, v14, v15);
  v16 = (void *)objc_opt_class();
  v20 = (void *)objc_msgSend_allocWithZone_(v16, v17, (uint64_t)a3, v18, v19);
  v25[6] = *(_OWORD *)&v30[48];
  v25[7] = v31;
  v25[8] = v32;
  v25[9] = v33;
  v25[2] = v29;
  v25[3] = *(_OWORD *)v30;
  v25[4] = *(_OWORD *)&v30[16];
  v25[5] = *(_OWORD *)&v30[32];
  v25[0] = v26;
  v25[1] = *(unint64_t *)&v27;
  return (id)objc_msgSend_initWithSample_(v20, v21, (uint64_t)v25, v22, v23);
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
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyRecordId"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyStartDate"), v7);
  objc_msgSend_encodeDouble_forKey_(a3, v8, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyActivityEndTime"), v9, v10, self->fActivityEndTime);
  objc_msgSend_encodeObject_forKey_(a3, v11, (uint64_t)self->fWorkoutSessionId, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyWorkoutSessionId"), v12);
  objc_msgSend_encodeInteger_forKey_(a3, v13, self->fWorkoutType, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyWorkoutType"), v14);
  objc_msgSend_encodeDouble_forKey_(a3, v15, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyHRRecovery"), v16, v17, self->fHrRecovery);
  objc_msgSend_encodeDouble_forKey_(a3, v18, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyLambda"), v19, v20, self->fLambda);
  objc_msgSend_encodeDouble_forKey_(a3, v21, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyHRMax"), v22, v23, self->fHrMax);
  objc_msgSend_encodeDouble_forKey_(a3, v24, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyHRMinAdjusted"), v25, v26, self->fHrMinAdjusted);
  objc_msgSend_encodeDouble_forKey_(a3, v27, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyRecoveryOnsetTime"), v28, v29, self->fRecoveryOnsetTime);
  objc_msgSend_encodeDouble_forKey_(a3, v30, (uint64_t)CFSTR("kCMRecoverySessionCodingKeySteadyStateHR"), v31, v32, self->fSteadyStateHR);
  objc_msgSend_encodeInteger_forKey_(a3, v33, self->fStatus, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyStatus"), v34);
  objc_msgSend_encodeDouble_forKey_(a3, v35, (uint64_t)CFSTR("kCMRecoverySessionCodingKeySessionHRRecovery"), v36, v37, self->fHrRecovery);
  objc_msgSend_encodeDouble_forKey_(a3, v38, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyPeakHR"), v39, v40, self->fPeakHR);
  objc_msgSend_encodeDouble_forKey_(a3, v41, (uint64_t)CFSTR("kCMRecoverySessionCodingKeyHRRecoveryReference"), v42, v43, self->fHrRecoveryReference);
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
  double v98;
  double v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  double v108;
  double v109;
  double v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  double v119;
  double v120;
  double v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  double v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  double v140;
  double v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  double v150;
  double v151;
  double v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  double v161;
  double v162;
  double v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  double v168;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_21;
  v9 = objc_msgSend_recordId(self, v5, v6, v7, v8);
  if (v9 != objc_msgSend_recordId(a3, v10, v11, v12, v13))
    goto LABEL_21;
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
      objc_msgSend_activityEndTime(self, v32, v33, v34, v35);
      v46 = v45;
      objc_msgSend_activityEndTime(a3, v47, v48, v49, v50);
      if (v46 == v55)
      {
        v56 = objc_msgSend_workoutType(self, v51, v52, v53, v54);
        if (v56 == objc_msgSend_workoutType(a3, v57, v58, v59, v60))
        {
          objc_msgSend_hrRecovery(self, v61, v62, v63, v64);
          v66 = v65;
          objc_msgSend_hrRecovery(a3, v67, v68, v69, v70);
          if (v66 == v75)
          {
            objc_msgSend_lambda(self, v71, v72, v73, v74);
            v77 = v76;
            objc_msgSend_lambda(a3, v78, v79, v80, v81);
            if (v77 == v86)
            {
              objc_msgSend_hrMax(self, v82, v83, v84, v85);
              v88 = v87;
              objc_msgSend_hrMax(a3, v89, v90, v91, v92);
              if (v88 == v97)
              {
                objc_msgSend_hrMinAdjusted(self, v93, v94, v95, v96);
                v99 = v98;
                objc_msgSend_hrMinAdjusted(a3, v100, v101, v102, v103);
                if (v99 == v108)
                {
                  objc_msgSend_recoveryOnsetTime(self, v104, v105, v106, v107);
                  v110 = v109;
                  objc_msgSend_recoveryOnsetTime(a3, v111, v112, v113, v114);
                  if (v110 == v119)
                  {
                    objc_msgSend_steadyStateHR(self, v115, v116, v117, v118);
                    v121 = v120;
                    objc_msgSend_steadyStateHR(a3, v122, v123, v124, v125);
                    if (v121 == v130)
                    {
                      v131 = objc_msgSend_status(self, v126, v127, v128, v129);
                      if (v131 == objc_msgSend_status(a3, v132, v133, v134, v135))
                      {
                        objc_msgSend_hrRecovery(self, v136, v137, v138, v139);
                        v141 = v140;
                        objc_msgSend_hrRecovery(a3, v142, v143, v144, v145);
                        if (v141 == v150)
                        {
                          objc_msgSend_peakHR(self, v146, v147, v148, v149);
                          v152 = v151;
                          objc_msgSend_peakHR(a3, v153, v154, v155, v156);
                          if (v152 == v161)
                          {
                            objc_msgSend_hrRecoveryReference(self, v157, v158, v159, v160);
                            v163 = v162;
                            objc_msgSend_hrRecoveryReference(a3, v164, v165, v166, v167);
                            LOBYTE(isEqual) = v163 == v168;
                            return isEqual;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_21:
      LOBYTE(isEqual) = 0;
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

- (double)activityEndTime
{
  return self->fActivityEndTime;
}

- (NSUUID)workoutSessionId
{
  return self->fWorkoutSessionId;
}

- (int64_t)workoutType
{
  return self->fWorkoutType;
}

- (double)hrRecovery
{
  return self->fHrRecovery;
}

- (double)lambda
{
  return self->fLambda;
}

- (double)hrMax
{
  return self->fHrMax;
}

- (double)hrMinAdjusted
{
  return self->fHrMinAdjusted;
}

- (double)recoveryOnsetTime
{
  return self->fRecoveryOnsetTime;
}

- (double)steadyStateHR
{
  return self->fSteadyStateHR;
}

- (int64_t)status
{
  return self->fStatus;
}

- (double)sessionHrRecovery
{
  return self->fSessionHrRecovery;
}

- (double)peakHR
{
  return self->fPeakHR;
}

- (double)hrRecoveryReference
{
  return self->fHrRecoveryReference;
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
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
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
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
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
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_recordId(self, v6, v7, v8, v9);
  started = objc_msgSend_startDate(self, v11, v12, v13, v14);
  v16 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend_activityEndTime(self, v17, v18, v19, v20);
  v25 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v16, v21, v22, v23, v24);
  v30 = (void *)objc_msgSend_workoutSessionId(self, v26, v27, v28, v29);
  v35 = objc_msgSend_UUIDString(v30, v31, v32, v33, v34);
  v40 = objc_msgSend_workoutType(self, v36, v37, v38, v39);
  objc_msgSend_hrRecovery(self, v41, v42, v43, v44);
  v46 = v45;
  objc_msgSend_lambda(self, v47, v48, v49, v50);
  v52 = v51;
  objc_msgSend_hrMax(self, v53, v54, v55, v56);
  v58 = v57;
  objc_msgSend_hrMinAdjusted(self, v59, v60, v61, v62);
  v64 = v63;
  v65 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend_recoveryOnsetTime(self, v66, v67, v68, v69);
  v74 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v65, v70, v71, v72, v73);
  objc_msgSend_steadyStateHR(self, v75, v76, v77, v78);
  v80 = v79;
  v85 = objc_msgSend_status(self, v81, v82, v83, v84);
  objc_msgSend_sessionHrRecovery(self, v86, v87, v88, v89);
  v91 = v90;
  objc_msgSend_peakHR(self, v92, v93, v94, v95);
  v97 = v96;
  objc_msgSend_hrRecoveryReference(self, v98, v99, v100, v101);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v102, (uint64_t)CFSTR("%@, <recordId, %lu, startDate, %@, activityEndTime, %@, workoutSessionId %@, workoutType, %lu, hrRecovery, %f, lambda, %f, hrMax, %f, hrMinAdjusted, %f, recoveryOnsetTime, %@, steadyStateHR, %f, status, %lu, sessionHrRecovery, %f, peakHR, %f, hrRecoveryReference, %f>"), v103, v104, v5, v10, started, v25, v35, v40, v46, v52, v58, v64, v74, v80, v85, v91,
                       v97,
                       v105);
}

+ (HRRecoverySession)inputFromPreparedStatement:(SEL)a3
{
  HRRecoverySession *v5;
  double v6;
  const unsigned __int8 *v7;

  v5 = retstr;
  retstr->var0 = sqlite3_column_int(a4, 0);
  v5->var1 = sqlite3_column_double(a4, 1);
  v6 = sqlite3_column_double(a4, 2);
  *(_QWORD *)v5->var4 = 0;
  v5 = (HRRecoverySession *)((char *)v5 + 32);
  v5[-1].var17 = v6;
  *(_QWORD *)&v5[-1].var18 = 0;
  v5->var1 = 0.0;
  *(_QWORD *)&v5->var2 = sqlite3_column_int(a4, 4);
  v5->var3 = sqlite3_column_double(a4, 5);
  *(double *)v5->var4 = sqlite3_column_double(a4, 6);
  *(double *)&v5->var4[8] = sqlite3_column_double(a4, 7);
  *(double *)&v5->var5 = sqlite3_column_double(a4, 8);
  v5->var6 = sqlite3_column_double(a4, 9);
  v5->var7 = sqlite3_column_double(a4, 10);
  LODWORD(v5->var8) = sqlite3_column_int(a4, 11);
  v5->var9 = sqlite3_column_double(a4, 12);
  v5->var10 = sqlite3_column_double(a4, 13);
  v5->var11 = sqlite3_column_double(a4, 14);
  *(_QWORD *)&v5->var12 = 0;
  v5->var13 = 0.0;
  LOWORD(v5->var14) = 0;
  v7 = sqlite3_column_text(a4, 3);
  return (HRRecoverySession *)uuid_parse((const char *)v7, (unsigned __int8 *)v5);
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

- (CMRecoverySession)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  CMRecoverySession *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
  {
    v15.receiver = self;
    v15.super_class = (Class)CMRecoverySession;
    v8 = -[CMRecoverySession init](&v15, sel_init);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3710];
      v10 = objc_opt_class();
      v12 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v9, v11, v10, (uint64_t)a3, 0);
      if (v12)
      {
        v13 = (void *)v12;

        return (CMRecoverySession *)v13;
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
