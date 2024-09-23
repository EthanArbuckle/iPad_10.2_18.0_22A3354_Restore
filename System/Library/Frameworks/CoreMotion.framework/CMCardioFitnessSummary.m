@implementation CMCardioFitnessSummary

- (id)sr_dictionaryRepresentation
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (CMCardioFitnessSummary)initWithRecordId:(unint64_t)a3 startDate:(id)a4 workoutType:(int64_t)a5 sessionId:(id)a6 durationInSeconds:(double)a7 pointCount:(unint64_t)a8 hrMax:(double)a9 hrMin:(double)a10 meanHr:(double)a11 meanVo2:(double)a12 meanSpeed:(double)a13 meanGrade:(double)a14 meanHrConfidence:(double)a15 meanHrCadenceAgreement:(double)a16 meanCadence:(double)a17 vo2MaxModelSource:(int64_t)a18 sessionType:(int64_t)a19
{
  CMCardioFitnessSummary *v33;
  CMCardioFitnessSummary *v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)CMCardioFitnessSummary;
  v33 = -[CMCardioFitnessSummary init](&v36, sel_init);
  v34 = v33;
  if (v33)
  {
    v33->fRecordId = a3;
    v33->fStartDate = (NSDate *)a4;
    v34->fWorkoutType = a5;
    v34->fSessionId = (NSUUID *)a6;
    v34->fDurationInSeconds = a7;
    v34->fPointCount = a8;
    v34->fHRMax = a9;
    v34->fHRMin = a10;
    v34->fMeanHr = a11;
    v34->fMeanVo2 = a12;
    v34->fMeanSpeed = a13;
    v34->fMeanGrade = a14;
    v34->fMeanHrConfidence = a15;
    v34->fMeanHrCadenceAgreement = a16;
    v34->fMeanCadence = a17;
    v34->fVo2MaxModelSource = a18;
    v34->fSessionType = a19;
  }
  return v34;
}

- (CMCardioFitnessSummary)initWithSample:(VO2MaxSummary *)a3
{
  CMCardioFitnessSummary *v4;
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
  uint64_t v15;
  __int128 v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CMCardioFitnessSummary;
  v4 = -[CMCardioFitnessSummary init](&v18, sel_init);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v9 = objc_msgSend_initWithUUIDBytes_(v5, v6, (uint64_t)a3->var3, v7, v8);
    v4->fRecordId = a3->var0;
    v10 = objc_alloc(MEMORY[0x1E0C99D68]);
    v4->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v10, v11, v12, v13, v14, a3->var1);
    v4->fWorkoutType = a3->var2;
    v4->fSessionId = (NSUUID *)v9;
    v4->fDurationInSeconds = a3->var4;
    v4->fPointCount = a3->var5;
    v4->fHRMax = a3->var7;
    v4->fHRMin = a3->var6;
    v4->fMeanHr = a3->var8;
    v4->fMeanVo2 = a3->var11;
    v4->fMeanSpeed = a3->var12;
    v4->fMeanGrade = a3->var13;
    v4->fMeanHrConfidence = a3->var9;
    v4->fMeanHrCadenceAgreement = a3->var10;
    v4->fMeanCadence = a3->var14;
    v15 = *(_QWORD *)&a3->var21;
    *(_QWORD *)&v16 = (int)v15;
    *((_QWORD *)&v16 + 1) = SHIDWORD(v15);
    *(_OWORD *)&v4->fVo2MaxModelSource = v16;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMCardioFitnessSummary;
  -[CMCardioFitnessSummary dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMCardioFitnessSummary)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMCardioFitnessSummary *v7;
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
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
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
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  objc_super v72;

  v72.receiver = self;
  v72.super_class = (Class)CMCardioFitnessSummary;
  v7 = -[CMCardioFitnessSummary init](&v72, sel_init);
  if (v7)
  {
    v7->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyRecordId"), v5, v6);
    v8 = objc_opt_class();
    v11 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyStartDate"), v10);
    v7->fStartDate = (NSDate *)objc_msgSend_copy(v11, v12, v13, v14, v15);
    v7->fWorkoutType = objc_msgSend_decodeIntegerForKey_(a3, v16, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyWorkoutType"), v17, v18);
    v19 = objc_opt_class();
    v7->fSessionId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v20, v19, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeySessionId"), v21);
    objc_msgSend_decodeDoubleForKey_(a3, v22, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyDurationInSeconds"), v23, v24);
    v7->fDurationInSeconds = v25;
    v7->fPointCount = objc_msgSend_decodeInt64ForKey_(a3, v26, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyPointCount"), v27, v28);
    objc_msgSend_decodeDoubleForKey_(a3, v29, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyHRMax"), v30, v31);
    v7->fHRMax = v32;
    objc_msgSend_decodeDoubleForKey_(a3, v33, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyHRMin"), v34, v35);
    v7->fHRMin = v36;
    objc_msgSend_decodeDoubleForKey_(a3, v37, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyMeanHR"), v38, v39);
    v7->fMeanHr = v40;
    objc_msgSend_decodeDoubleForKey_(a3, v41, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyMeanVO2"), v42, v43);
    v7->fMeanVo2 = v44;
    objc_msgSend_decodeDoubleForKey_(a3, v45, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyMeanSpeed"), v46, v47);
    v7->fMeanSpeed = v48;
    objc_msgSend_decodeDoubleForKey_(a3, v49, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyMeanGrade"), v50, v51);
    v7->fMeanGrade = v52;
    objc_msgSend_decodeDoubleForKey_(a3, v53, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyMeanHRConfidence"), v54, v55);
    v7->fMeanHrConfidence = v56;
    objc_msgSend_decodeDoubleForKey_(a3, v57, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyMeanHRCadenceAgreement"), v58, v59);
    v7->fMeanHrCadenceAgreement = v60;
    objc_msgSend_decodeDoubleForKey_(a3, v61, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyMeanCadence"), v62, v63);
    v7->fMeanCadence = v64;
    v7->fVo2MaxModelSource = objc_msgSend_decodeIntegerForKey_(a3, v65, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyVO2MaxModelSource"), v66, v67);
    v7->fSessionType = objc_msgSend_decodeIntegerForKey_(a3, v68, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeySessionType"), v69, v70);
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  NSDate *fStartDate;
  unint64_t fRecordId;
  uint64_t v9;
  __int128 v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD v23[11];
  int32x2_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[32];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  int32x2_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  fRecordId = self->fRecordId;
  fStartDate = self->fStartDate;
  *(_QWORD *)&v25 = fRecordId;
  objc_msgSend_timeIntervalSinceReferenceDate(fStartDate, a2, (uint64_t)a3, v3, v4);
  *((_QWORD *)&v25 + 1) = v9;
  *(_QWORD *)&v27 = 0;
  v26 = 0uLL;
  *((_QWORD *)&v27 + 1) = *(_QWORD *)&self->fDurationInSeconds;
  *(_QWORD *)v28 = self->fPointCount;
  *(int8x16_t *)&v28[8] = vextq_s8(*(int8x16_t *)&self->fHRMax, *(int8x16_t *)&self->fHRMax, 8uLL);
  *(double *)&v28[24] = self->fMeanHr;
  v10 = *(_OWORD *)&self->fMeanVo2;
  v29 = *(_OWORD *)&self->fMeanHrConfidence;
  v30 = v10;
  *(double *)&v10 = self->fMeanCadence;
  *(double *)&v31 = self->fMeanGrade;
  *((_QWORD *)&v31 + 1) = v10;
  v33 = 0u;
  v34 = 0u;
  v32 = 0u;
  v35 = vmovn_s64(*(int64x2_t *)&self->fVo2MaxModelSource);
  objc_msgSend_getUUIDBytes_(self->fSessionId, v11, (uint64_t)&v26 + 8, v12, v13);
  v14 = (void *)objc_opt_class();
  v18 = (void *)objc_msgSend_allocWithZone_(v14, v15, (uint64_t)a3, v16, v17);
  v23[8] = v32;
  v23[9] = v33;
  v23[10] = v34;
  v24 = v35;
  v23[4] = *(_OWORD *)&v28[16];
  v23[5] = v29;
  v23[6] = v30;
  v23[7] = v31;
  v23[0] = v25;
  v23[1] = v26;
  v23[2] = v27;
  v23[3] = *(_OWORD *)v28;
  return (id)objc_msgSend_initWithSample_(v18, v19, (uint64_t)v23, v20, v21);
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
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
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
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyRecordId"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyStartDate"), v7);
  objc_msgSend_encodeInteger_forKey_(a3, v8, self->fWorkoutType, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyWorkoutType"), v9);
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->fSessionId, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeySessionId"), v11);
  objc_msgSend_encodeDouble_forKey_(a3, v12, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyDurationInSeconds"), v13, v14, self->fDurationInSeconds);
  objc_msgSend_encodeInt64_forKey_(a3, v15, self->fPointCount, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyPointCount"), v16);
  objc_msgSend_encodeDouble_forKey_(a3, v17, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyHRMax"), v18, v19, self->fHRMax);
  objc_msgSend_encodeDouble_forKey_(a3, v20, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyHRMin"), v21, v22, self->fHRMin);
  objc_msgSend_encodeDouble_forKey_(a3, v23, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyMeanHR"), v24, v25, self->fMeanHr);
  objc_msgSend_encodeDouble_forKey_(a3, v26, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyMeanVO2"), v27, v28, self->fMeanVo2);
  objc_msgSend_encodeDouble_forKey_(a3, v29, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyMeanSpeed"), v30, v31, self->fMeanSpeed);
  objc_msgSend_encodeDouble_forKey_(a3, v32, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyMeanGrade"), v33, v34, self->fMeanGrade);
  objc_msgSend_encodeDouble_forKey_(a3, v35, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyMeanHRConfidence"), v36, v37, self->fMeanHrConfidence);
  objc_msgSend_encodeDouble_forKey_(a3, v38, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyMeanHRCadenceAgreement"), v39, v40, self->fMeanHrCadenceAgreement);
  objc_msgSend_encodeDouble_forKey_(a3, v41, (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyMeanCadence"), v42, v43, self->fMeanCadence);
  objc_msgSend_encodeInteger_forKey_(a3, v44, SLODWORD(self->fVo2MaxModelSource), (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeyVO2MaxModelSource"), v45);
  objc_msgSend_encodeInteger_forKey_(a3, v46, SLODWORD(self->fSessionType), (uint64_t)CFSTR("kCMCardioFitnessSummaryCodingKeySessionType"), v47);
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
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
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
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  double v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  double v84;
  double v85;
  double v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  double v95;
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
  double v129;
  double v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  double v139;
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
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  double v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_23;
  v9 = objc_msgSend_recordId(self, v5, v6, v7, v8);
  if (v9 != objc_msgSend_recordId(a3, v10, v11, v12, v13))
    goto LABEL_23;
  if (!objc_msgSend_startDate(self, v14, v15, v16, v17) && !objc_msgSend_startDate(a3, v18, v19, v20, v21)
    || (started = (void *)objc_msgSend_startDate(self, v18, v19, v20, v21),
        v27 = objc_msgSend_startDate(a3, v23, v24, v25, v26),
        (isEqual = objc_msgSend_isEqualToDate_(started, v28, v27, v29, v30)) != 0))
  {
    if (!objc_msgSend_sessionId(self, v18, v19, v20, v21) && !objc_msgSend_sessionId(a3, v32, v33, v34, v35)
      || (v36 = (void *)objc_msgSend_sessionId(self, v32, v33, v34, v35),
          v41 = objc_msgSend_sessionId(a3, v37, v38, v39, v40),
          (isEqual = objc_msgSend_isEqual_(v36, v42, v41, v43, v44)) != 0))
    {
      v45 = objc_msgSend_workoutType(self, v32, v33, v34, v35);
      if (v45 == objc_msgSend_workoutType(a3, v46, v47, v48, v49))
      {
        objc_msgSend_durationInSeconds(self, v50, v51, v52, v53);
        v55 = v54;
        objc_msgSend_durationInSeconds(a3, v56, v57, v58, v59);
        if (v55 == v64)
        {
          v65 = objc_msgSend_pointCount(self, v60, v61, v62, v63);
          if (v65 == objc_msgSend_pointCount(a3, v66, v67, v68, v69))
          {
            objc_msgSend_hrMax(self, v70, v71, v72, v73);
            v75 = v74;
            objc_msgSend_hrMax(a3, v76, v77, v78, v79);
            if (v75 == v84)
            {
              objc_msgSend_hrMin(self, v80, v81, v82, v83);
              v86 = v85;
              objc_msgSend_hrMin(a3, v87, v88, v89, v90);
              if (v86 == v95)
              {
                objc_msgSend_meanHr(self, v91, v92, v93, v94);
                v97 = v96;
                objc_msgSend_meanHr(a3, v98, v99, v100, v101);
                if (v97 == v106)
                {
                  objc_msgSend_meanVo2(self, v102, v103, v104, v105);
                  v108 = v107;
                  objc_msgSend_meanVo2(a3, v109, v110, v111, v112);
                  if (v108 == v117)
                  {
                    objc_msgSend_meanSpeed(self, v113, v114, v115, v116);
                    v119 = v118;
                    objc_msgSend_meanSpeed(a3, v120, v121, v122, v123);
                    if (v119 == v128)
                    {
                      objc_msgSend_meanGrade(self, v124, v125, v126, v127);
                      v130 = v129;
                      objc_msgSend_meanGrade(a3, v131, v132, v133, v134);
                      if (v130 == v139)
                      {
                        objc_msgSend_meanHrConfidence(self, v135, v136, v137, v138);
                        v141 = v140;
                        objc_msgSend_meanHrConfidence(a3, v142, v143, v144, v145);
                        if (v141 == v150)
                        {
                          objc_msgSend_meanHrCadenceAgreement(self, v146, v147, v148, v149);
                          v152 = v151;
                          objc_msgSend_meanHrCadenceAgreement(a3, v153, v154, v155, v156);
                          if (v152 == v161)
                          {
                            objc_msgSend_meanCadence(self, v157, v158, v159, v160);
                            v163 = v162;
                            objc_msgSend_meanCadence(a3, v164, v165, v166, v167);
                            if (v163 == v172)
                            {
                              v173 = objc_msgSend_vo2MaxModelSource(self, v168, v169, v170, v171);
                              if (v173 == objc_msgSend_vo2MaxModelSource(a3, v174, v175, v176, v177))
                              {
                                v182 = objc_msgSend_sessionType(self, v178, v179, v180, v181);
                                LOBYTE(isEqual) = v182 == objc_msgSend_sessionType(a3, v183, v184, v185, v186);
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
        }
      }
LABEL_23:
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

- (int64_t)workoutType
{
  return self->fWorkoutType;
}

- (NSUUID)sessionId
{
  return self->fSessionId;
}

- (double)durationInSeconds
{
  return self->fDurationInSeconds;
}

- (unint64_t)pointCount
{
  return self->fPointCount;
}

- (double)hrMax
{
  return self->fHRMax;
}

- (double)hrMin
{
  return self->fHRMin;
}

- (double)meanHr
{
  return self->fMeanHr;
}

- (double)meanVo2
{
  return self->fMeanVo2;
}

- (double)meanSpeed
{
  return self->fMeanSpeed;
}

- (double)meanGrade
{
  return self->fMeanGrade;
}

- (double)meanHrConfidence
{
  return self->fMeanHrConfidence;
}

- (double)meanHrCadenceAgreement
{
  return self->fMeanHrCadenceAgreement;
}

- (double)meanCadence
{
  return self->fMeanCadence;
}

- (int64_t)vo2MaxModelSource
{
  return self->fVo2MaxModelSource;
}

- (int64_t)sessionType
{
  return self->fSessionType;
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
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
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
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v108;
  uint64_t v109;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_recordId(self, v6, v7, v8, v9);
  started = objc_msgSend_startDate(self, v11, v12, v13, v14);
  v20 = objc_msgSend_workoutType(self, v16, v17, v18, v19);
  v25 = (void *)objc_msgSend_sessionId(self, v21, v22, v23, v24);
  v30 = objc_msgSend_UUIDString(v25, v26, v27, v28, v29);
  objc_msgSend_durationInSeconds(self, v31, v32, v33, v34);
  v109 = v35;
  v40 = objc_msgSend_pointCount(self, v36, v37, v38, v39);
  objc_msgSend_hrMax(self, v41, v42, v43, v44);
  v108 = v45;
  objc_msgSend_hrMin(self, v46, v47, v48, v49);
  v51 = v50;
  objc_msgSend_meanHr(self, v52, v53, v54, v55);
  v57 = v56;
  objc_msgSend_meanVo2(self, v58, v59, v60, v61);
  v63 = v62;
  objc_msgSend_meanSpeed(self, v64, v65, v66, v67);
  v69 = v68;
  objc_msgSend_meanGrade(self, v70, v71, v72, v73);
  v75 = v74;
  objc_msgSend_meanHrConfidence(self, v76, v77, v78, v79);
  v81 = v80;
  objc_msgSend_meanHrCadenceAgreement(self, v82, v83, v84, v85);
  v87 = v86;
  objc_msgSend_meanCadence(self, v88, v89, v90, v91);
  v93 = v92;
  v98 = objc_msgSend_vo2MaxModelSource(self, v94, v95, v96, v97);
  v103 = objc_msgSend_sessionType(self, v99, v100, v101, v102);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v104, (uint64_t)CFSTR("%@, <recordId, %lu, startDate, %@, workoutType, %ld, sessionId, %@, durationInSeconds, %f, pointCount, %llu, hrMax, %f, hrMin, %f, meanHr, %f, meanVo2, %f, meanSpeed, %f, meanGrade, %f, meanHrConfidence, %f, meanHrCadenceAgreement, %f, meanCadence, %f, vo2MaxModelSource, %ld, sessionType, %ld>"), v105, v106, v5, v10, started, v20, v30, v109, v40, v108, v51, v57, v63, v69, v75, v81,
                       v87,
                       v93,
                       v98,
                       v103);
}

+ (VO2MaxSummary)inputFromPreparedStatement:(SEL)a3
{
  VO2MaxSummary *v5;
  int v6;
  const unsigned __int8 *v7;

  v5 = retstr;
  retstr->var0 = sqlite3_column_int(a4, 0);
  v5->var1 = sqlite3_column_double(a4, 1);
  v6 = sqlite3_column_int(a4, 2);
  *(_QWORD *)v5->var3 = 0;
  v5 = (VO2MaxSummary *)((char *)v5 + 24);
  *(_QWORD *)&v5[-1].var21 = v6;
  v5->var1 = 0.0;
  *(double *)&v5->var2 = sqlite3_column_double(a4, 4);
  *(_QWORD *)v5->var3 = sqlite3_column_int(a4, 5);
  *(double *)&v5->var3[8] = sqlite3_column_double(a4, 7);
  v5->var4 = sqlite3_column_double(a4, 6);
  *(double *)&v5->var5 = sqlite3_column_double(a4, 8);
  v5->var6 = sqlite3_column_double(a4, 12);
  v5->var7 = sqlite3_column_double(a4, 13);
  v5->var8 = sqlite3_column_double(a4, 9);
  v5->var9 = sqlite3_column_double(a4, 10);
  v5->var10 = sqlite3_column_double(a4, 11);
  v5->var11 = sqlite3_column_double(a4, 14);
  *(_OWORD *)&v5->var12 = 0u;
  *(_OWORD *)&v5->var14 = 0u;
  *(_OWORD *)&v5->var16 = 0u;
  LODWORD(v5->var18) = sqlite3_column_int(a4, 15);
  HIDWORD(v5->var18) = sqlite3_column_int(a4, 16);
  v7 = sqlite3_column_text(a4, 3);
  return (VO2MaxSummary *)uuid_parse((const char *)v7, (unsigned __int8 *)v5);
}

- (double)meanMaxMets
{
  return self->_meanMaxMets;
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

- (CMCardioFitnessSummary)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  CMCardioFitnessSummary *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
  {
    v15.receiver = self;
    v15.super_class = (Class)CMCardioFitnessSummary;
    v8 = -[CMCardioFitnessSummary init](&v15, sel_init);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3710];
      v10 = objc_opt_class();
      v12 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v9, v11, v10, (uint64_t)a3, 0);
      if (v12)
      {
        v13 = (void *)v12;

        return (CMCardioFitnessSummary *)v13;
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
