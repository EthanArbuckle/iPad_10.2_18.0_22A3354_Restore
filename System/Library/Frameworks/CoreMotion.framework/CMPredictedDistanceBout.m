@implementation CMPredictedDistanceBout

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
  uint64_t v35;
  const char *v36;
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
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  _QWORD v86[8];
  _QWORD v87[9];

  v87[8] = *MEMORY[0x1E0C80C00];
  v86[0] = CFSTR("startTime");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  started = (void *)objc_msgSend_startDate(self, a2, v2, v3, v4);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v8, v9, v10, v11);
  v87[0] = objc_msgSend_numberWithDouble_(v6, v12, v13, v14, v15);
  v86[1] = CFSTR("endTime");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v21 = (void *)objc_msgSend_endDate(self, v17, v18, v19, v20);
  objc_msgSend_timeIntervalSinceReferenceDate(v21, v22, v23, v24, v25);
  v87[1] = objc_msgSend_numberWithDouble_(v16, v26, v27, v28, v29);
  v86[2] = CFSTR("stepCount");
  v30 = (void *)MEMORY[0x1E0CB37E8];
  v35 = objc_msgSend_stepCount(self, v31, v32, v33, v34);
  v87[2] = objc_msgSend_numberWithUnsignedInt_(v30, v36, v35, v37, v38);
  v86[3] = CFSTR("distance");
  v39 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_distance(self, v40, v41, v42, v43);
  v87[3] = objc_msgSend_numberWithDouble_(v39, v44, v45, v46, v47);
  v86[4] = CFSTR("activeTime");
  v48 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_activeTime(self, v49, v50, v51, v52);
  v87[4] = objc_msgSend_numberWithDouble_(v48, v53, v54, v55, v56);
  v86[5] = CFSTR("elevationAsc");
  v57 = (void *)MEMORY[0x1E0CB37E8];
  v62 = objc_msgSend_elevationAsc(self, v58, v59, v60, v61);
  v87[5] = objc_msgSend_numberWithUnsignedInt_(v57, v63, v62, v64, v65);
  v86[6] = CFSTR("elevationDesc");
  v66 = (void *)MEMORY[0x1E0CB37E8];
  v71 = objc_msgSend_elevationDesc(self, v67, v68, v69, v70);
  v87[6] = objc_msgSend_numberWithUnsignedInt_(v66, v72, v71, v73, v74);
  v86[7] = CFSTR("boutType");
  v75 = (void *)MEMORY[0x1E0CB37E8];
  v80 = objc_msgSend_boutType(self, v76, v77, v78, v79);
  v87[7] = objc_msgSend_numberWithInteger_(v75, v81, v80, v82, v83);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v84, (uint64_t)v87, (uint64_t)v86, 8);
}

- (CMPredictedDistanceBout)initWithRecordId:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 stepCount:(unsigned int)a6 distance:(double)a7 activeTime:(double)a8 elevationAsc:(unsigned int)a9 elevationDesc:(unsigned int)a10 stepCountGPS:(unsigned int)a11 distanceGPS:(double)a12 boutType:(int64_t)a13
{
  CMPredictedDistanceBout *v22;
  CMPredictedDistanceBout *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CMPredictedDistanceBout;
  v22 = -[CMPredictedDistanceBout init](&v25, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->fRecordId = a3;
    v22->fStartDate = (NSDate *)a4;
    v23->fEndDate = (NSDate *)a5;
    v23->fStepCount = a6;
    v23->fDistance = a7;
    v23->fActiveTime = a8;
    v23->fElevationAsc = a9;
    v23->fElevationDesc = a10;
    v23->fStepCountGPS = a11;
    v23->fDistanceGPS = a12;
    v23->fBoutType = a13;
  }
  return v23;
}

- (CMPredictedDistanceBout)initWithSample:(CLPredictedWalkDistanceBoutEntry *)a3
{
  CMPredictedDistanceBout *v4;
  CMPredictedDistanceBout *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CMPredictedDistanceBout;
  v4 = -[CMPredictedDistanceBout init](&v17, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->fRecordId = a3->var0;
    v6 = objc_alloc(MEMORY[0x1E0C99D68]);
    v5->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v6, v7, v8, v9, v10, a3->var1);
    v11 = objc_alloc(MEMORY[0x1E0C99D68]);
    v5->fEndDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v11, v12, v13, v14, v15, a3->var2);
    v5->fStepCount = a3->var3;
    v5->fDistance = a3->var4;
    v5->fActiveTime = a3->var5;
    v5->fElevationAsc = a3->var6;
    v5->fElevationDesc = a3->var7;
    v5->fStepCountGPS = a3->var8;
    v5->fDistanceGPS = a3->var9;
    v5->fBoutType = a3->var10;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMPredictedDistanceBout;
  -[CMPredictedDistanceBout dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMPredictedDistanceBout)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMPredictedDistanceBout *v7;
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
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
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
  uint64_t v46;
  double v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)CMPredictedDistanceBout;
  v7 = -[CMPredictedDistanceBout init](&v52, sel_init);
  if (v7)
  {
    v7->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCMPredictedDistanceBoutCodingKeyRecordId"), v5, v6);
    v8 = objc_opt_class();
    v11 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMPredictedDistanceBoutCodingKeyStartDate"), v10);
    v7->fStartDate = (NSDate *)objc_msgSend_copy(v11, v12, v13, v14, v15);
    v16 = objc_opt_class();
    v19 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v17, v16, (uint64_t)CFSTR("kCMPredictedDistanceBoutCodingKeyEndDate"), v18);
    v7->fEndDate = (NSDate *)objc_msgSend_copy(v19, v20, v21, v22, v23);
    v7->fStepCount = objc_msgSend_decodeInt32ForKey_(a3, v24, (uint64_t)CFSTR("kCMPredictedDistanceBoutCodingKeyStepCount"), v25, v26);
    objc_msgSend_decodeDoubleForKey_(a3, v27, (uint64_t)CFSTR("kCMPredictedDistanceBoutCodingKeyDistance"), v28, v29);
    v7->fDistance = v30;
    objc_msgSend_decodeDoubleForKey_(a3, v31, (uint64_t)CFSTR("kCMPredictedDistanceBoutCodingKeyActiveTime"), v32, v33);
    v7->fActiveTime = v34;
    v7->fElevationAsc = objc_msgSend_decodeInt32ForKey_(a3, v35, (uint64_t)CFSTR("kCMPredictedDistanceBoutCodingKeyElevationAsc"), v36, v37);
    v7->fElevationDesc = objc_msgSend_decodeInt32ForKey_(a3, v38, (uint64_t)CFSTR("kCMPredictedDistanceBoutCodingKeyElevationDesc"), v39, v40);
    v7->fStepCountGPS = objc_msgSend_decodeInt32ForKey_(a3, v41, (uint64_t)CFSTR("kCMPredictedDistanceBoutCodingKeyStepCountGPS"), v42, v43);
    objc_msgSend_decodeDoubleForKey_(a3, v44, (uint64_t)CFSTR("kCMPredictedDistanceBoutCodingKeyDistanceGPS"), v45, v46);
    v7->fDistanceGPS = v47;
    v7->fBoutType = objc_msgSend_decodeIntegerForKey_(a3, v48, (uint64_t)CFSTR("kCMPredictedDistanceBoutCodingKeyBoutType"), v49, v50);
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
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int fStepCount;
  double fDistance;
  double fActiveTime;
  unsigned int fStepCountGPS;
  double fDistanceGPS;
  int64_t fBoutType;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  int v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  double v36;
  double v37;
  uint64_t v38;
  unsigned int v39;
  double v40;
  int v41;
  __int128 v42;
  _BYTE v43[28];

  fRecordId = self->fRecordId;
  objc_msgSend_timeIntervalSinceReferenceDate(self->fStartDate, a2, (uint64_t)a3, v3, v4);
  v9 = v8;
  objc_msgSend_timeIntervalSinceReferenceDate(self->fEndDate, v10, v11, v12, v13);
  v15 = v14;
  fStepCount = self->fStepCount;
  fDistance = self->fDistance;
  fActiveTime = self->fActiveTime;
  fStepCountGPS = self->fStepCountGPS;
  fDistanceGPS = self->fDistanceGPS;
  fBoutType = self->fBoutType;
  v22 = *(_QWORD *)&self->fElevationAsc;
  v23 = (void *)objc_opt_class();
  v27 = (void *)objc_msgSend_allocWithZone_(v23, v24, (uint64_t)a3, v25, v26);
  v32 = fRecordId;
  v33 = v9;
  v34 = v15;
  v35 = fStepCount;
  v36 = fDistance;
  v37 = fActiveTime;
  v38 = v22;
  v39 = fStepCountGPS;
  v40 = fDistanceGPS;
  v41 = fBoutType;
  v42 = 0u;
  memset(v43, 0, sizeof(v43));
  return (id)objc_msgSend_initWithSample_(v27, v28, (uint64_t)&v32, v29, v30);
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
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, (uint64_t)CFSTR("kCMPredictedDistanceBoutCodingKeyRecordId"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kCMPredictedDistanceBoutCodingKeyStartDate"), v7);
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->fEndDate, (uint64_t)CFSTR("kCMPredictedDistanceBoutCodingKeyEndDate"), v9);
  objc_msgSend_encodeInt32_forKey_(a3, v10, self->fStepCount, (uint64_t)CFSTR("kCMPredictedDistanceBoutCodingKeyStepCount"), v11);
  objc_msgSend_encodeDouble_forKey_(a3, v12, (uint64_t)CFSTR("kCMPredictedDistanceBoutCodingKeyDistance"), v13, v14, self->fDistance);
  objc_msgSend_encodeDouble_forKey_(a3, v15, (uint64_t)CFSTR("kCMPredictedDistanceBoutCodingKeyActiveTime"), v16, v17, self->fActiveTime);
  objc_msgSend_encodeInt32_forKey_(a3, v18, self->fElevationAsc, (uint64_t)CFSTR("kCMPredictedDistanceBoutCodingKeyElevationAsc"), v19);
  objc_msgSend_encodeInt32_forKey_(a3, v20, self->fElevationDesc, (uint64_t)CFSTR("kCMPredictedDistanceBoutCodingKeyElevationDesc"), v21);
  objc_msgSend_encodeInt32_forKey_(a3, v22, self->fStepCountGPS, (uint64_t)CFSTR("kCMPredictedDistanceBoutCodingKeyStepCountGPS"), v23);
  objc_msgSend_encodeDouble_forKey_(a3, v24, (uint64_t)CFSTR("kCMPredictedDistanceBoutCodingKeyDistanceGPS"), v25, v26, self->fDistanceGPS);
  objc_msgSend_encodeInteger_forKey_(a3, v27, self->fBoutType, (uint64_t)CFSTR("kCMPredictedDistanceBoutCodingKeyBoutType"), v28);
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
  int v45;
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
  int v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  const char *v95;
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
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_17;
  v9 = objc_msgSend_recordId(self, v5, v6, v7, v8);
  if (v9 != objc_msgSend_recordId(a3, v10, v11, v12, v13))
    goto LABEL_17;
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
      v45 = objc_msgSend_stepCount(self, v32, v33, v34, v35);
      if (v45 == objc_msgSend_stepCount(a3, v46, v47, v48, v49))
      {
        objc_msgSend_distance(self, v50, v51, v52, v53);
        v55 = v54;
        objc_msgSend_distance(a3, v56, v57, v58, v59);
        if (v55 == v64)
        {
          objc_msgSend_activeTime(self, v60, v61, v62, v63);
          v66 = v65;
          objc_msgSend_activeTime(a3, v67, v68, v69, v70);
          if (v66 == v75)
          {
            v76 = objc_msgSend_elevationAsc(self, v71, v72, v73, v74);
            if (v76 == objc_msgSend_elevationAsc(a3, v77, v78, v79, v80))
            {
              v85 = objc_msgSend_elevationDesc(self, v81, v82, v83, v84);
              if (v85 == objc_msgSend_elevationDesc(a3, v86, v87, v88, v89))
              {
                v94 = objc_msgSend_stepCountGPS(self, v90, v91, v92, v93);
                if (v94 == objc_msgSend_stepCountGPS(a3, v95, v96, v97, v98))
                {
                  objc_msgSend_distanceGPS(self, v99, v100, v101, v102);
                  v104 = v103;
                  objc_msgSend_distanceGPS(a3, v105, v106, v107, v108);
                  if (v104 == v113)
                  {
                    v114 = objc_msgSend_boutType(self, v109, v110, v111, v112);
                    LOBYTE(isEqualToDate) = v114 == objc_msgSend_boutType(a3, v115, v116, v117, v118);
                    return isEqualToDate;
                  }
                }
              }
            }
          }
        }
      }
LABEL_17:
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

- (unsigned)stepCount
{
  return self->fStepCount;
}

- (double)distance
{
  return self->fDistance;
}

- (double)activeTime
{
  return self->fActiveTime;
}

- (unsigned)elevationAsc
{
  return self->fElevationAsc;
}

- (unsigned)elevationDesc
{
  return self->fElevationDesc;
}

- (unsigned)stepCountGPS
{
  return self->fStepCountGPS;
}

- (double)distanceGPS
{
  return self->fDistanceGPS;
}

- (int64_t)boutType
{
  return self->fBoutType;
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
  const char *v26;
  uint64_t v27;
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
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
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
  const char *v64;
  uint64_t v65;
  uint64_t v66;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_recordId(self, v6, v7, v8, v9);
  started = objc_msgSend_startDate(self, v11, v12, v13, v14);
  v20 = objc_msgSend_endDate(self, v16, v17, v18, v19);
  v25 = objc_msgSend_stepCount(self, v21, v22, v23, v24);
  objc_msgSend_distance(self, v26, v27, v28, v29);
  v31 = v30;
  objc_msgSend_activeTime(self, v32, v33, v34, v35);
  v37 = v36;
  v42 = objc_msgSend_elevationAsc(self, v38, v39, v40, v41);
  v47 = objc_msgSend_elevationDesc(self, v43, v44, v45, v46);
  v52 = objc_msgSend_stepCountGPS(self, v48, v49, v50, v51);
  objc_msgSend_distanceGPS(self, v53, v54, v55, v56);
  v58 = v57;
  v63 = objc_msgSend_boutType(self, v59, v60, v61, v62);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v64, (uint64_t)CFSTR("%@, <recordId, %lu, startDate, %@, endDate, %@, stepCount, %d, distance, %f, activeTime, %f, elevationAsc, %d, elevationDesc, %d, stepCountGPS, %d, distanceGPS, %f, boutType, %ld>"), v65, v66, v5, v10, started, v20, v25, v31, v37, v42, v47, v52, v58, v63);
}

+ (CLPredictedWalkDistanceBoutEntry)inputFromPreparedStatement:(SEL)a3
{
  CLPredictedWalkDistanceBoutEntry *result;

  retstr->var0 = sqlite3_column_int(a4, 0);
  retstr->var1 = sqlite3_column_double(a4, 1);
  retstr->var2 = sqlite3_column_double(a4, 2);
  retstr->var3 = sqlite3_column_int(a4, 3);
  retstr->var4 = sqlite3_column_double(a4, 4);
  retstr->var5 = sqlite3_column_double(a4, 5);
  retstr->var6 = sqlite3_column_int(a4, 6);
  retstr->var7 = sqlite3_column_int(a4, 7);
  retstr->var8 = sqlite3_column_int(a4, 8);
  retstr->var9 = sqlite3_column_double(a4, 9);
  result = (CLPredictedWalkDistanceBoutEntry *)sqlite3_column_int(a4, 10);
  retstr->var10 = (int)result;
  *(_OWORD *)&retstr->var11 = 0u;
  *(_OWORD *)((char *)&retstr->var13 + 4) = 0u;
  *(_OWORD *)&retstr->var15 = 0u;
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

- (CMPredictedDistanceBout)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  CMPredictedDistanceBout *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
  {
    v15.receiver = self;
    v15.super_class = (Class)CMPredictedDistanceBout;
    v8 = -[CMPredictedDistanceBout init](&v15, sel_init);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3710];
      v10 = objc_opt_class();
      v12 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v9, v11, v10, (uint64_t)a3, 0);
      if (v12)
      {
        v13 = (void *)v12;

        return (CMPredictedDistanceBout *)v13;
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
