@implementation GDKTSQueryParams

- (GDKTSQueryParams)initWithStartTime:(id)a3 endTime:(id)a4 inclusionType:(int64_t)a5 distanceMinInMeters:(id)a6 distanceMaxInMeters:(id)a7 elevationGainMinInMeters:(id)a8 elevationGainMaxInMeters:(id)a9 durationMinInSeconds:(id)a10 durationMaxInSeconds:(id)a11 roadType:(id)a12 roadName:(id)a13 originId:(id)a14 destinationId:(id)a15
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  const char *v28;
  uint64_t v29;
  GDKTSQueryParams *v30;
  uint64_t v31;
  NSDate *startTime;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  NSDate *endTime;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSNumber *distanceMinInMeters;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSNumber *distanceMaxInMeters;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  NSNumber *elevationGainMinInMeters;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  NSNumber *elevationGainMaxInMeters;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  NSString *roadType;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  NSString *roadName;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  GDEntityIdentifier *originId;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  GDEntityIdentifier *destinationId;
  id v72;
  objc_super v73;

  v19 = a3;
  v72 = a4;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a12;
  v25 = a13;
  v26 = a14;
  v27 = a15;
  v73.receiver = self;
  v73.super_class = (Class)GDKTSQueryParams;
  v30 = -[GDKTSQueryParams init](&v73, sel_init);
  if (v30)
  {
    v31 = objc_msgSend_copy(v19, v28, v29);
    startTime = v30->_startTime;
    v30->_startTime = (NSDate *)v31;

    v35 = objc_msgSend_copy(v72, v33, v34);
    endTime = v30->_endTime;
    v30->_endTime = (NSDate *)v35;

    v30->_inclusionType = a5;
    v39 = objc_msgSend_copy(v20, v37, v38);
    distanceMinInMeters = v30->_distanceMinInMeters;
    v30->_distanceMinInMeters = (NSNumber *)v39;

    v43 = objc_msgSend_copy(v21, v41, v42);
    distanceMaxInMeters = v30->_distanceMaxInMeters;
    v30->_distanceMaxInMeters = (NSNumber *)v43;

    v47 = objc_msgSend_copy(v22, v45, v46);
    elevationGainMinInMeters = v30->_elevationGainMinInMeters;
    v30->_elevationGainMinInMeters = (NSNumber *)v47;

    v51 = objc_msgSend_copy(v23, v49, v50);
    elevationGainMaxInMeters = v30->_elevationGainMaxInMeters;
    v30->_elevationGainMaxInMeters = (NSNumber *)v51;

    v55 = objc_msgSend_copy(v24, v53, v54);
    roadType = v30->_roadType;
    v30->_roadType = (NSString *)v55;

    v59 = objc_msgSend_copy(v25, v57, v58);
    roadName = v30->_roadName;
    v30->_roadName = (NSString *)v59;

    v63 = objc_msgSend_copy(v26, v61, v62);
    originId = v30->_originId;
    v30->_originId = (GDEntityIdentifier *)v63;

    v67 = objc_msgSend_copy(v27, v65, v66);
    destinationId = v30->_destinationId;
    v30->_destinationId = (GDEntityIdentifier *)v67;

  }
  return v30;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  return (id)objc_msgSend_initWithStartTime_endTime_inclusionType_distanceMinInMeters_distanceMaxInMeters_elevationGainMinInMeters_elevationGainMaxInMeters_durationMinInSeconds_durationMaxInSeconds_roadType_roadName_originId_destinationId_(v7, v8, (uint64_t)self->_startTime, self->_endTime, self->_inclusionType, self->_distanceMinInMeters, self->_distanceMaxInMeters, self->_elevationGainMinInMeters, self->_elevationGainMaxInMeters, self->_durationMinInSeconds, self->_durationMaxInSeconds, self->_roadType, self->_roadName, self->_originId, self->_destinationId);
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startTime;
  id v5;
  void *v6;
  const char *v7;
  NSDate *endTime;
  void *v9;
  const char *v10;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSNumber *distanceMinInMeters;
  void *v16;
  const char *v17;
  NSNumber *distanceMaxInMeters;
  void *v19;
  const char *v20;
  NSNumber *elevationGainMinInMeters;
  void *v22;
  const char *v23;
  NSNumber *elevationGainMaxInMeters;
  void *v25;
  const char *v26;
  NSNumber *durationMinInSeconds;
  void *v28;
  const char *v29;
  NSNumber *durationMaxInSeconds;
  void *v31;
  const char *v32;
  NSString *roadType;
  void *v34;
  const char *v35;
  NSString *roadName;
  void *v37;
  const char *v38;
  GDEntityIdentifier *originId;
  void *v40;
  const char *v41;
  GDEntityIdentifier *destinationId;
  const char *v43;
  id v44;

  startTime = self->_startTime;
  v5 = a3;
  NSStringFromSelector(sel_startTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)startTime, v6);

  endTime = self->_endTime;
  NSStringFromSelector(sel_endTime);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)endTime, v9);

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v11, self->_inclusionType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_inclusionType);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v14, (uint64_t)v12, v13);

  distanceMinInMeters = self->_distanceMinInMeters;
  NSStringFromSelector(sel_distanceMinInMeters);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v17, (uint64_t)distanceMinInMeters, v16);

  distanceMaxInMeters = self->_distanceMaxInMeters;
  NSStringFromSelector(sel_distanceMaxInMeters);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v20, (uint64_t)distanceMaxInMeters, v19);

  elevationGainMinInMeters = self->_elevationGainMinInMeters;
  NSStringFromSelector(sel_elevationGainMinInMeters);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v23, (uint64_t)elevationGainMinInMeters, v22);

  elevationGainMaxInMeters = self->_elevationGainMaxInMeters;
  NSStringFromSelector(sel_elevationGainMaxInMeters);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v26, (uint64_t)elevationGainMaxInMeters, v25);

  durationMinInSeconds = self->_durationMinInSeconds;
  NSStringFromSelector(sel_durationMinInSeconds);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v29, (uint64_t)durationMinInSeconds, v28);

  durationMaxInSeconds = self->_durationMaxInSeconds;
  NSStringFromSelector(sel_durationMaxInSeconds);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v32, (uint64_t)durationMaxInSeconds, v31);

  roadType = self->_roadType;
  NSStringFromSelector(sel_roadType);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v35, (uint64_t)roadType, v34);

  roadName = self->_roadName;
  NSStringFromSelector(sel_roadName);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v38, (uint64_t)roadName, v37);

  originId = self->_originId;
  NSStringFromSelector(sel_originId);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v41, (uint64_t)originId, v40);

  destinationId = self->_destinationId;
  NSStringFromSelector(sel_destinationId);
  v44 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v43, (uint64_t)destinationId, v44);

}

- (GDKTSQueryParams)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  void *v55;
  uint64_t v56;
  GDKTSQueryParams *started;
  void *v59;
  void *v60;
  void *v61;
  void *v62;

  v3 = a3;
  v4 = objc_opt_class();
  NSStringFromSelector(sel_startTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v6, v4, v5);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_opt_class();
  NSStringFromSelector(sel_endTime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v9, v7, v8);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  NSStringFromSelector(sel_inclusionType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v12, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (int)objc_msgSend_intValue(v13, v14, v15);

  v16 = objc_opt_class();
  NSStringFromSelector(sel_distanceMinInMeters);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v18, v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_opt_class();
  NSStringFromSelector(sel_distanceMaxInMeters);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v22, v20, v21);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_opt_class();
  NSStringFromSelector(sel_elevationGainMinInMeters);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v25, v23, v24);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_opt_class();
  NSStringFromSelector(sel_elevationGainMaxInMeters);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v28, v26, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_opt_class();
  NSStringFromSelector(sel_durationMinInSeconds);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v32, v30, v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = objc_opt_class();
  NSStringFromSelector(sel_durationMaxInSeconds);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v36, v34, v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = objc_opt_class();
  NSStringFromSelector(sel_roadType);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v40, v38, v39);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = objc_opt_class();
  NSStringFromSelector(sel_roadName);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v43, v41, v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = objc_opt_class();
  NSStringFromSelector(sel_originId);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v47, v45, v46);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = objc_opt_class();
  NSStringFromSelector(sel_destinationId);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v51, v49, v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  started = (GDKTSQueryParams *)objc_msgSend_initWithStartTime_endTime_inclusionType_distanceMinInMeters_distanceMaxInMeters_elevationGainMinInMeters_elevationGainMaxInMeters_durationMinInSeconds_durationMaxInSeconds_roadType_roadName_originId_destinationId_(self, v53, (uint64_t)v62, v61, v56, v19, v60, v59, v29, v33, v37, v55, v44, v48, v52);
  return started;
}

- (id)description
{
  id v3;
  const char *v4;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  return (id)objc_msgSend_initWithFormat_(v3, v4, (uint64_t)CFSTR("GDKTSQueryParams<startTime: %@, endTime: %@, minDistance: %@, maxDistance: %@, minDuration: %@, maxDuration: %@, roadType: %@, roadName: %@, originId: %@, destinationId: %@>"), self->_startTime, self->_endTime, self->_distanceMinInMeters, self->_distanceMaxInMeters, self->_durationMinInSeconds, self->_durationMaxInSeconds, self->_roadType, self->_roadName, self->_originId, self->_destinationId);
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (int64_t)inclusionType
{
  return self->_inclusionType;
}

- (NSNumber)distanceMinInMeters
{
  return self->_distanceMinInMeters;
}

- (NSNumber)distanceMaxInMeters
{
  return self->_distanceMaxInMeters;
}

- (NSNumber)elevationGainMinInMeters
{
  return self->_elevationGainMinInMeters;
}

- (NSNumber)elevationGainMaxInMeters
{
  return self->_elevationGainMaxInMeters;
}

- (NSNumber)durationMinInSeconds
{
  return self->_durationMinInSeconds;
}

- (NSNumber)durationMaxInSeconds
{
  return self->_durationMaxInSeconds;
}

- (NSString)roadType
{
  return self->_roadType;
}

- (NSString)roadName
{
  return self->_roadName;
}

- (GDEntityIdentifier)originId
{
  return self->_originId;
}

- (GDEntityIdentifier)destinationId
{
  return self->_destinationId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationId, 0);
  objc_storeStrong((id *)&self->_originId, 0);
  objc_storeStrong((id *)&self->_roadName, 0);
  objc_storeStrong((id *)&self->_roadType, 0);
  objc_storeStrong((id *)&self->_durationMaxInSeconds, 0);
  objc_storeStrong((id *)&self->_durationMinInSeconds, 0);
  objc_storeStrong((id *)&self->_elevationGainMaxInMeters, 0);
  objc_storeStrong((id *)&self->_elevationGainMinInMeters, 0);
  objc_storeStrong((id *)&self->_distanceMaxInMeters, 0);
  objc_storeStrong((id *)&self->_distanceMinInMeters, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)roadTypeForString:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int64_t v6;
  const char *v7;
  const char *v8;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("freeway")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("arterial")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("collector")) & 1) != 0)
  {
    v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("local")))
  {
    v6 = 4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
