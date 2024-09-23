@implementation CMPedometerData

- (NSNumber)numberOfSteps
{
  return self->fNumberOfSteps;
}

- (NSNumber)numberOfPushes
{
  return self->fNumberOfPushes;
}

- (CMPedometerData)initWithStartDate:(double)a3 endDate:(double)a4 steps:(int)a5 distance:(double)a6 floorsAscended:(id)a7 floorsDescended:(id)a8 recordID:(int64_t)a9 currentPace:(id)a10 currentCadence:(id)a11 firstStepTime:(double)a12 activeTime:(id)a13 sourceId:(id)a14 isOdometerDistance:(id)a15 isOdometerPace:(id)a16 pushes:(int)a17 workoutType:(int)a18 elevationAscended:(id)a19 elevationDescended:(id)a20 distanceSource:(int)a21
{
  uint64_t v28;
  CMPedometerData *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  id v78;
  objc_super v79;

  v28 = *(_QWORD *)&a5;
  v79.receiver = self;
  v79.super_class = (Class)CMPedometerData;
  v31 = -[CMPedometerData init](&v79, sel_init);
  if (v31)
  {
    v78 = a13;
    v32 = objc_alloc(MEMORY[0x1E0C99D68]);
    v31->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v32, v33, v34, v35, v36, a3);
    v37 = objc_alloc(MEMORY[0x1E0C99D68]);
    v31->fEndDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v37, v38, v39, v40, v41, a4);
    v42 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v31->fNumberOfSteps = (NSNumber *)objc_msgSend_initWithInt_(v42, v43, v28, v44, v45);
    v46 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v31->fDistance = (NSNumber *)objc_msgSend_initWithDouble_(v46, v47, v48, v49, v50, a6);
    v31->fFloorsAscended = (NSNumber *)a7;
    v31->fFloorsDescended = (NSNumber *)a8;
    v51 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v31->fRecordId = (NSNumber *)objc_msgSend_initWithInteger_(v51, v52, a9, v53, v54);
    v31->fCurrentPace = (NSNumber *)a10;
    v31->fCurrentCadence = (NSNumber *)a11;
    if (a12 <= 0.0)
    {
      v60 = 0;
    }
    else
    {
      v55 = objc_alloc(MEMORY[0x1E0C99D68]);
      v60 = objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v55, v56, v57, v58, v59, a12, a13);
    }
    v31->fFirstStepTime = (NSDate *)v60;
    v31->fActiveTime = (NSNumber *)v78;
    v31->fSourceId = (NSUUID *)objc_msgSend_copy(a14, v61, v62, v63, v64);
    v31->fIsOdometerDistance = (NSNumber *)a15;
    v31->fIsOdometerPace = (NSNumber *)a15;
    v65 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v31->fNumberOfPushes = (NSNumber *)objc_msgSend_initWithInt_(v65, v66, a17, v67, v68);
    v69 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v31->fWorkoutType = (NSNumber *)objc_msgSend_initWithInt_(v69, v70, a18, v71, v72);
    v31->fElevationAscended = (NSNumber *)a19;
    v31->fElevationDescended = (NSNumber *)a20;
    v73 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v31->fDistanceSource = (NSNumber *)objc_msgSend_initWithInt_(v73, v74, a21, v75, v76);
  }
  return v31;
}

- (CMPedometerData)initWithCoder:(id)a3
{
  CMPedometerData *v4;
  uint64_t v5;
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
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  objc_super v63;

  v63.receiver = self;
  v63.super_class = (Class)CMPedometerData;
  v4 = -[CMPedometerData init](&v63, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->fStartDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMPedometerDataCodingKeyStartDate"), v7);
    v8 = objc_opt_class();
    v4->fEndDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMPedometerDataCodingKeyEndDate"), v10);
    v11 = objc_opt_class();
    v4->fNumberOfSteps = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCMPedometerDataCodingKeyNumberOfSteps"), v13);
    v14 = objc_opt_class();
    v4->fDistance = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v15, v14, (uint64_t)CFSTR("kCMPedometerDataCodingKeyDistance"), v16);
    v17 = objc_opt_class();
    v4->fFloorsAscended = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v18, v17, (uint64_t)CFSTR("kCMPedometerDataCodingKeyFloorAscended"), v19);
    v20 = objc_opt_class();
    v4->fFloorsDescended = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v21, v20, (uint64_t)CFSTR("kCMPedometerDataCodingKeyFloorDescended"), v22);
    v23 = objc_opt_class();
    v4->fRecordId = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v24, v23, (uint64_t)CFSTR("kCMPedometerDataCodingKeyRecordId"), v25);
    v26 = objc_opt_class();
    v4->fCurrentPace = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v27, v26, (uint64_t)CFSTR("kCMPedometerDataCodingKeyPace"), v28);
    v29 = objc_opt_class();
    v4->fCurrentCadence = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v30, v29, (uint64_t)CFSTR("kCMPedometerDataCodingKeyCurrentCadence"), v31);
    v32 = objc_opt_class();
    v4->fFirstStepTime = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v33, v32, (uint64_t)CFSTR("kCMPedometerDataCodingKeyFirstStepTime"), v34);
    v35 = objc_opt_class();
    v4->fActiveTime = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v36, v35, (uint64_t)CFSTR("kCMPedometerDataCodingKeyActiveTime"), v37);
    v38 = objc_opt_class();
    v4->fSourceId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v39, v38, (uint64_t)CFSTR("kCMPedometerDatacodingKeyUUID"), v40);
    v41 = objc_opt_class();
    v4->fIsOdometerDistance = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v42, v41, (uint64_t)CFSTR("kCMPedometerDataCodingKeyIsOdometerDistance"), v43);
    v44 = objc_opt_class();
    v4->fIsOdometerPace = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v45, v44, (uint64_t)CFSTR("kCMPedometerDataCodingKeyIsOdometerPace"), v46);
    v47 = objc_opt_class();
    v4->fNumberOfPushes = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v48, v47, (uint64_t)CFSTR("kCMPedometerDataCodingKeyNumberOfPushes"), v49);
    v50 = objc_opt_class();
    v4->fWorkoutType = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v51, v50, (uint64_t)CFSTR("kCMPedometerDataCodingKeyWorkoutType"), v52);
    v53 = objc_opt_class();
    v4->fElevationAscended = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v54, v53, (uint64_t)CFSTR("kCMPedometerDataCodingKeyElevationAscended"), v55);
    v56 = objc_opt_class();
    v4->fElevationDescended = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v57, v56, (uint64_t)CFSTR("kCMPedometerDataCodingKeyElevationDescended"), v58);
    v59 = objc_opt_class();
    v4->fDistanceSource = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v60, v59, (uint64_t)CFSTR("kCMPedometerDataCodingKeyDistanceSource"), v61);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMPedometerData;
  -[CMPedometerData dealloc](&v3, sel_dealloc);
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
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
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
  const char *v40;
  uint64_t v41;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kCMPedometerDataCodingKeyStartDate"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fEndDate, (uint64_t)CFSTR("kCMPedometerDataCodingKeyEndDate"), v7);
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->fNumberOfSteps, (uint64_t)CFSTR("kCMPedometerDataCodingKeyNumberOfSteps"), v9);
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->fDistance, (uint64_t)CFSTR("kCMPedometerDataCodingKeyDistance"), v11);
  objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)self->fFloorsAscended, (uint64_t)CFSTR("kCMPedometerDataCodingKeyFloorAscended"), v13);
  objc_msgSend_encodeObject_forKey_(a3, v14, (uint64_t)self->fFloorsDescended, (uint64_t)CFSTR("kCMPedometerDataCodingKeyFloorDescended"), v15);
  objc_msgSend_encodeObject_forKey_(a3, v16, (uint64_t)self->fRecordId, (uint64_t)CFSTR("kCMPedometerDataCodingKeyRecordId"), v17);
  objc_msgSend_encodeObject_forKey_(a3, v18, (uint64_t)self->fCurrentPace, (uint64_t)CFSTR("kCMPedometerDataCodingKeyPace"), v19);
  objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)self->fCurrentCadence, (uint64_t)CFSTR("kCMPedometerDataCodingKeyCurrentCadence"), v21);
  objc_msgSend_encodeObject_forKey_(a3, v22, (uint64_t)self->fFirstStepTime, (uint64_t)CFSTR("kCMPedometerDataCodingKeyFirstStepTime"), v23);
  objc_msgSend_encodeObject_forKey_(a3, v24, (uint64_t)self->fActiveTime, (uint64_t)CFSTR("kCMPedometerDataCodingKeyActiveTime"), v25);
  objc_msgSend_encodeObject_forKey_(a3, v26, (uint64_t)self->fSourceId, (uint64_t)CFSTR("kCMPedometerDatacodingKeyUUID"), v27);
  objc_msgSend_encodeObject_forKey_(a3, v28, (uint64_t)self->fIsOdometerDistance, (uint64_t)CFSTR("kCMPedometerDataCodingKeyIsOdometerDistance"), v29);
  objc_msgSend_encodeObject_forKey_(a3, v30, (uint64_t)self->fIsOdometerPace, (uint64_t)CFSTR("kCMPedometerDataCodingKeyIsOdometerPace"), v31);
  objc_msgSend_encodeObject_forKey_(a3, v32, (uint64_t)self->fNumberOfPushes, (uint64_t)CFSTR("kCMPedometerDataCodingKeyNumberOfPushes"), v33);
  objc_msgSend_encodeObject_forKey_(a3, v34, (uint64_t)self->fWorkoutType, (uint64_t)CFSTR("kCMPedometerDataCodingKeyWorkoutType"), v35);
  objc_msgSend_encodeObject_forKey_(a3, v36, (uint64_t)self->fElevationAscended, (uint64_t)CFSTR("kCMPedometerDataCodingKeyElevationAscended"), v37);
  objc_msgSend_encodeObject_forKey_(a3, v38, (uint64_t)self->fElevationDescended, (uint64_t)CFSTR("kCMPedometerDataCodingKeyElevationDescended"), v39);
  objc_msgSend_encodeObject_forKey_(a3, v40, (uint64_t)self->fDistanceSource, (uint64_t)CFSTR("kCMPedometerDataCodingKeyDistanceSource"), v41);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSNumber)floorsDescended
{
  return self->fFloorsDescended;
}

- (NSNumber)floorsAscended
{
  return self->fFloorsAscended;
}

- (NSNumber)elevationDescended
{
  return self->fElevationDescended;
}

- (NSNumber)elevationAscended
{
  return self->fElevationAscended;
}

- (NSNumber)distance
{
  return self->fDistance;
}

- (NSNumber)activeTime
{
  return self->fActiveTime;
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
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
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
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
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
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v18 = (_QWORD *)objc_msgSend_init(v9, v10, v11, v12, v13);
  if (v18)
  {
    v18[1] = objc_msgSend_copy(self->fStartDate, v14, v15, v16, v17);
    v18[2] = objc_msgSend_copy(self->fEndDate, v19, v20, v21, v22);
    v18[3] = objc_msgSend_copy(self->fNumberOfSteps, v23, v24, v25, v26);
    v18[4] = objc_msgSend_copy(self->fDistance, v27, v28, v29, v30);
    v18[5] = objc_msgSend_copy(self->fFloorsAscended, v31, v32, v33, v34);
    v18[6] = objc_msgSend_copy(self->fFloorsDescended, v35, v36, v37, v38);
    v18[7] = objc_msgSend_copy(self->fRecordId, v39, v40, v41, v42);
    v18[8] = objc_msgSend_copy(self->fCurrentPace, v43, v44, v45, v46);
    v18[9] = objc_msgSend_copy(self->fCurrentCadence, v47, v48, v49, v50);
    v18[10] = objc_msgSend_copy(self->fFirstStepTime, v51, v52, v53, v54);
    v18[11] = objc_msgSend_copy(self->fActiveTime, v55, v56, v57, v58);
    v18[12] = objc_msgSend_copy(self->fSourceId, v59, v60, v61, v62);
    v18[13] = objc_msgSend_copy(self->fIsOdometerDistance, v63, v64, v65, v66);
    v18[14] = objc_msgSend_copy(self->fIsOdometerPace, v67, v68, v69, v70);
    v18[15] = objc_msgSend_copy(self->fNumberOfPushes, v71, v72, v73, v74);
    v18[16] = objc_msgSend_copy(self->fWorkoutType, v75, v76, v77, v78);
    v18[17] = objc_msgSend_copy(self->fElevationAscended, v79, v80, v81, v82);
    v18[18] = objc_msgSend_copy(self->fElevationDescended, v83, v84, v85, v86);
    v18[19] = objc_msgSend_copy(self->fDistanceSource, v87, v88, v89, v90);
  }
  return v18;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t started;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t active;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v54;

  v54 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  started = objc_msgSend_startDate(self, v5, v6, v7, v8);
  v14 = objc_msgSend_endDate(self, v10, v11, v12, v13);
  v19 = objc_msgSend_numberOfSteps(self, v15, v16, v17, v18);
  v24 = objc_msgSend_distance(self, v20, v21, v22, v23);
  v29 = objc_msgSend_floorsAscended(self, v25, v26, v27, v28);
  v34 = objc_msgSend_floorsDescended(self, v30, v31, v32, v33);
  v39 = objc_msgSend_currentPace(self, v35, v36, v37, v38);
  v44 = objc_msgSend_currentCadence(self, v40, v41, v42, v43);
  active = objc_msgSend_averageActivePace(self, v45, v46, v47, v48);
  return (NSString *)objc_msgSend_stringWithFormat_(v54, v50, (uint64_t)CFSTR("%@,<startDate %@ endDate %@ steps %@ distance %@ floorsAscended %@ floorsDescended %@ currentPace %@ currentCadence %@ averageActivePace %@>"), v51, v52, v4, started, v14, v19, v24, v29, v34, v39, v44, active);
}

- (NSDate)endDate
{
  return self->fEndDate;
}

- (NSNumber)currentPace
{
  return self->fCurrentPace;
}

- (NSNumber)currentCadence
{
  return self->fCurrentCadence;
}

- (NSNumber)averageActivePace
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  objc_msgSend_doubleValue(self->fDistance, a2, v2, v3, v4);
  if (v10 == 0.0)
    return 0;
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_doubleValue(self->fActiveTime, v6, v7, v8, v9);
  v13 = v12;
  objc_msgSend_doubleValue(self->fDistance, v14, v15, v16, v17);
  return (NSNumber *)objc_msgSend_numberWithDouble_(v11, v19, v20, v21, v22, v13 / v18);
}

- (NSDate)firstStepTime
{
  return self->fFirstStepTime;
}

- (int64_t)recordId
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_integerValue(self->fRecordId, a2, v2, v3, v4);
}

- (NSUUID)sourceId
{
  return self->fSourceId;
}

- (BOOL)isOdometerDistance
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_BOOLValue(self->fIsOdometerDistance, a2, v2, v3, v4);
}

- (BOOL)isOdometerPace
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_BOOLValue(self->fIsOdometerPace, a2, v2, v3, v4);
}

- (NSNumber)workoutType
{
  return self->fWorkoutType;
}

- (NSNumber)distanceSource
{
  return self->fDistanceSource;
}

+ (id)maxPedometerEntries
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], a2, 250, v2, v3);
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

- (CMPedometerData)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  CMPedometerData *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
  {
    v15.receiver = self;
    v15.super_class = (Class)CMPedometerData;
    v8 = -[CMPedometerData init](&v15, sel_init);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3710];
      v10 = objc_opt_class();
      v12 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v9, v11, v10, (uint64_t)a3, 0);
      if (v12)
      {
        v13 = (void *)v12;

        return (CMPedometerData *)v13;
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
