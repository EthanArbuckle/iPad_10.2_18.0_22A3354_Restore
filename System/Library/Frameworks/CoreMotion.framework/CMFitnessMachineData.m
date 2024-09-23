@implementation CMFitnessMachineData

+ (BOOL)isAvailable
{
  if ((sub_18F1F7758() & 1) == 0)
    sub_18F1F77DC();
  return 0;
}

- (CMFitnessMachineData)initWithTimestamp:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  CMFitnessMachineData *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CMFitnessMachineData *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  void *v20;
  const char *v21;
  objc_super v22;

  if (!a3)
  {
    v20 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMFitnessMachineData.mm"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timestamp"));
  }
  v22.receiver = self;
  v22.super_class = (Class)CMFitnessMachineData;
  v7 = -[CMFitnessMachineData init](&v22, sel_init);
  v12 = v7;
  if (v7)
  {
    objc_msgSend_initializeVariables(v7, v8, v9, v10, v11);
    objc_msgSend_timeIntervalSinceReferenceDate(a3, v13, v14, v15, v16);
    v12->fTimestamp = v17;
  }
  return v12;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMFitnessMachineData;
  -[CMFitnessMachineData dealloc](&v2, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMFitnessMachineData)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMFitnessMachineData *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
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
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
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
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  objc_super v79;

  v79.receiver = self;
  v79.super_class = (Class)CMFitnessMachineData;
  v7 = -[CMFitnessMachineData init](&v79, sel_init);
  if (v7)
  {
    if (objc_msgSend_containsValueForKey_(a3, v4, (uint64_t)CFSTR("kCMFitnessMachineDataKeyTimestamp"), v5, v6))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v8, (uint64_t)CFSTR("kCMFitnessMachineDataKeyTimestamp"), v9, v10);
      v7->fTimestamp = v11;
    }
    if (objc_msgSend_containsValueForKey_(a3, v8, (uint64_t)CFSTR("kCMFitnessMachineDataKeyElapsedTime"), v9, v10))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v12, (uint64_t)CFSTR("kCMFitnessMachineDataKeyElapsedTime"), v13, v14);
      v7->_elapsedTime = v15;
    }
    if (objc_msgSend_containsValueForKey_(a3, v12, (uint64_t)CFSTR("kCMFitnessMachineDataKeyTotalEnergy"), v13, v14))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v16, (uint64_t)CFSTR("kCMFitnessMachineDataKeyTotalEnergy"), v17, v18);
      v7->_totalEnergy = v19;
    }
    if (objc_msgSend_containsValueForKey_(a3, v16, (uint64_t)CFSTR("kCMFitnessMachineDataKeyTotalDistance"), v17, v18))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v20, (uint64_t)CFSTR("kCMFitnessMachineDataKeyTotalDistance"), v21, v22);
      v7->_totalDistance = v23;
    }
    if (objc_msgSend_containsValueForKey_(a3, v20, (uint64_t)CFSTR("kCMFitnessMachineDataKeyTotalElevationAscended"), v21, v22))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v24, (uint64_t)CFSTR("kCMFitnessMachineDataKeyTotalElevationAscended"), v25, v26);
      v7->_totalElevationAscended = v27;
    }
    if (objc_msgSend_containsValueForKey_(a3, v24, (uint64_t)CFSTR("kCMFitnessMachineDataKeyTotalStrideCount"), v25, v26))v7->_totalStrideCount = objc_msgSend_decodeInt64ForKey_(a3, v28, (uint64_t)CFSTR("kCMFitnessMachineDataKeyTotalStrideCount"), v29, v30);
    if (objc_msgSend_containsValueForKey_(a3, v28, (uint64_t)CFSTR("kCMFitnessMachineDataKeyTotalStrokeCount"), v29, v30))v7->_totalStrokeCount = objc_msgSend_decodeInt64ForKey_(a3, v31, (uint64_t)CFSTR("kCMFitnessMachineDataKeyTotalStrokeCount"), v32, v33);
    if (objc_msgSend_containsValueForKey_(a3, v31, (uint64_t)CFSTR("kCMFitnessMachineDataKeyTotalFloorsClimbed"), v32, v33))v7->_totalFloorsClimbed = objc_msgSend_decodeInt64ForKey_(a3, v34, (uint64_t)CFSTR("kCMFitnessMachineDataKeyTotalFloorsClimbed"), v35, v36);
    if (objc_msgSend_containsValueForKey_(a3, v34, (uint64_t)CFSTR("kCMFitnessMachineDataKeyInstantaneousSpeed"), v35, v36))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v37, (uint64_t)CFSTR("kCMFitnessMachineDataKeyInstantaneousSpeed"), v38, v39);
      v7->_instantaneousSpeed = v40;
    }
    if (objc_msgSend_containsValueForKey_(a3, v37, (uint64_t)CFSTR("kCMFitnessMachineDataKeyInstantaneousCadence"), v38, v39))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v41, (uint64_t)CFSTR("kCMFitnessMachineDataKeyInstantaneousCadence"), v42, v43);
      v7->_instantaneousCadence = v44;
    }
    if (objc_msgSend_containsValueForKey_(a3, v41, (uint64_t)CFSTR("kCMFitnessMachineDataKeyInstantaneousPower"), v42, v43))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v45, (uint64_t)CFSTR("kCMFitnessMachineDataKeyInstantaneousPower"), v46, v47);
      v7->_instantaneousPower = v48;
    }
    if (objc_msgSend_containsValueForKey_(a3, v45, (uint64_t)CFSTR("kCMFitnessMachineDataKeyInclination"), v46, v47))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v49, (uint64_t)CFSTR("kCMFitnessMachineDataKeyInclination"), v50, v51);
      v7->_inclination = v52;
    }
    if (objc_msgSend_containsValueForKey_(a3, v49, (uint64_t)CFSTR("kCMFitnessMachineDataKeyResistanceLevel"), v50, v51))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v53, (uint64_t)CFSTR("kCMFitnessMachineDataKeyResistanceLevel"), v54, v55);
      v7->_resistanceLevel = v56;
    }
    if (objc_msgSend_containsValueForKey_(a3, v53, (uint64_t)CFSTR("kCMFitnessMachineDataKeyDeviceIdentifier"), v54, v55))
    {
      v60 = objc_opt_class();
      v7->_deviceIdentifier = (NSString *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v61, v60, (uint64_t)CFSTR("kCMFitnessMachineDataKeyDeviceIdentifier"), v62);
    }
    if (objc_msgSend_containsValueForKey_(a3, v57, (uint64_t)CFSTR("kCMFitnessMachineDataKeyManufacturer"), v58, v59))
    {
      v66 = objc_opt_class();
      v7->_manufacturer = (NSString *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v67, v66, (uint64_t)CFSTR("kCMFitnessMachineDataKeyManufacturer"), v68);
    }
    if (objc_msgSend_containsValueForKey_(a3, v63, (uint64_t)CFSTR("kCMFitnessMachineDataKeyModel"), v64, v65))
    {
      v72 = objc_opt_class();
      v7->_model = (NSString *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v73, v72, (uint64_t)CFSTR("kCMFitnessMachineDataKeyModel"), v74);
    }
    if (objc_msgSend_containsValueForKey_(a3, v69, (uint64_t)CFSTR("kCMFitnessMachineDataKeyExternalFitnessType"), v70, v71))v7->_externalFitnessType = objc_msgSend_decodeIntForKey_(a3, v75, (uint64_t)CFSTR("kCMFitnessMachineDataKeyExternalFitnessType"), v76, v77);
  }
  return v7;
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
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
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
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], v10, v11, v12, v13, self->fTimestamp);
  v18 = (void *)objc_msgSend_initWithTimestamp_(v9, v15, v14, v16, v17);
  objc_msgSend_setElapsedTime_(v18, v19, v20, v21, v22, self->_elapsedTime);
  objc_msgSend_setTotalEnergy_(v18, v23, v24, v25, v26, self->_totalEnergy);
  objc_msgSend_setTotalDistance_(v18, v27, v28, v29, v30, self->_totalDistance);
  objc_msgSend_setTotalElevationAscended_(v18, v31, v32, v33, v34, self->_totalElevationAscended);
  objc_msgSend_setTotalStrideCount_(v18, v35, self->_totalStrideCount, v36, v37);
  objc_msgSend_setTotalStrokeCount_(v18, v38, self->_totalStrokeCount, v39, v40);
  objc_msgSend_setTotalFloorsClimbed_(v18, v41, self->_totalFloorsClimbed, v42, v43);
  objc_msgSend_setInstantaneousSpeed_(v18, v44, v45, v46, v47, self->_instantaneousSpeed);
  objc_msgSend_setInstantaneousCadence_(v18, v48, v49, v50, v51, self->_instantaneousCadence);
  objc_msgSend_setInstantaneousPower_(v18, v52, v53, v54, v55, self->_instantaneousPower);
  objc_msgSend_setInclination_(v18, v56, v57, v58, v59, self->_inclination);
  objc_msgSend_setResistanceLevel_(v18, v60, v61, v62, v63, self->_resistanceLevel);
  objc_msgSend_setModel_(v18, v64, (uint64_t)self->_model, v65, v66);
  objc_msgSend_setDeviceIdentifier_(v18, v67, (uint64_t)self->_deviceIdentifier, v68, v69);
  objc_msgSend_setManufacturer_(v18, v70, (uint64_t)self->_manufacturer, v71, v72);
  objc_msgSend_setExternalFitnessType_(v18, v73, self->_externalFitnessType, v74, v75);
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
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
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;

  objc_msgSend_encodeDouble_forKey_(a3, a2, (uint64_t)CFSTR("kCMFitnessMachineDataKeyTimestamp"), v3, v4, self->fTimestamp);
  objc_msgSend_encodeDouble_forKey_(a3, v7, (uint64_t)CFSTR("kCMFitnessMachineDataKeyElapsedTime"), v8, v9, self->_elapsedTime);
  objc_msgSend_encodeDouble_forKey_(a3, v10, (uint64_t)CFSTR("kCMFitnessMachineDataKeyTotalEnergy"), v11, v12, self->_totalEnergy);
  objc_msgSend_encodeDouble_forKey_(a3, v13, (uint64_t)CFSTR("kCMFitnessMachineDataKeyTotalDistance"), v14, v15, self->_totalDistance);
  objc_msgSend_encodeDouble_forKey_(a3, v16, (uint64_t)CFSTR("kCMFitnessMachineDataKeyTotalElevationAscended"), v17, v18, self->_totalElevationAscended);
  objc_msgSend_encodeInt64_forKey_(a3, v19, self->_totalStrideCount, (uint64_t)CFSTR("kCMFitnessMachineDataKeyTotalStrideCount"), v20);
  objc_msgSend_encodeInt64_forKey_(a3, v21, self->_totalStrokeCount, (uint64_t)CFSTR("kCMFitnessMachineDataKeyTotalStrokeCount"), v22);
  objc_msgSend_encodeInt64_forKey_(a3, v23, self->_totalFloorsClimbed, (uint64_t)CFSTR("kCMFitnessMachineDataKeyTotalFloorsClimbed"), v24);
  objc_msgSend_encodeDouble_forKey_(a3, v25, (uint64_t)CFSTR("kCMFitnessMachineDataKeyInstantaneousSpeed"), v26, v27, self->_instantaneousSpeed);
  objc_msgSend_encodeDouble_forKey_(a3, v28, (uint64_t)CFSTR("kCMFitnessMachineDataKeyInstantaneousCadence"), v29, v30, self->_instantaneousCadence);
  objc_msgSend_encodeDouble_forKey_(a3, v31, (uint64_t)CFSTR("kCMFitnessMachineDataKeyInstantaneousPower"), v32, v33, self->_instantaneousPower);
  objc_msgSend_encodeDouble_forKey_(a3, v34, (uint64_t)CFSTR("kCMFitnessMachineDataKeyInclination"), v35, v36, self->_inclination);
  objc_msgSend_encodeDouble_forKey_(a3, v37, (uint64_t)CFSTR("kCMFitnessMachineDataKeyResistanceLevel"), v38, v39, self->_resistanceLevel);
  objc_msgSend_encodeObject_forKey_(a3, v40, (uint64_t)self->_deviceIdentifier, (uint64_t)CFSTR("kCMFitnessMachineDataKeyDeviceIdentifier"), v41);
  objc_msgSend_encodeObject_forKey_(a3, v42, (uint64_t)self->_manufacturer, (uint64_t)CFSTR("kCMFitnessMachineDataKeyManufacturer"), v43);
  objc_msgSend_encodeObject_forKey_(a3, v44, (uint64_t)self->_model, (uint64_t)CFSTR("kCMFitnessMachineDataKeyModel"), v45);
  objc_msgSend_encodeInt_forKey_(a3, v46, self->_externalFitnessType, (uint64_t)CFSTR("kCMFitnessMachineDataKeyExternalFitnessType"), v47);
}

- (NSDate)timestamp
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], a2, v2, v3, v4, self->fTimestamp);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("%@, <timestamp, %f, elapsedTime, %f, totalEnergy, %f, totalDistance, %f, totalElevationAscended, %f,  totalStrideCount, %ld, totalStokeCount, %ld,totalFloorsClimbed, %ld, instantaneousSpeed, %f, instantaneousCadence, %f, instantaneousPower, %f, inclination, %f, resistanceLevel, %f>"), v7, v8, v5, *(_QWORD *)&self->fTimestamp, *(_QWORD *)&self->_elapsedTime, *(_QWORD *)&self->_totalEnergy, *(_QWORD *)&self->_totalDistance, *(_QWORD *)&self->_totalElevationAscended, self->_totalStrideCount, self->_totalStrokeCount, self->_totalFloorsClimbed, *(_QWORD *)&self->_instantaneousSpeed, *(_QWORD *)&self->_instantaneousCadence, *(_QWORD *)&self->_instantaneousPower, *(_QWORD *)&self->_inclination, *(_QWORD *)&self->_resistanceLevel);
}

- (void)convertToCLFitnessMachineData:(_CLFitnessMachineData *)a3 deviceId:(int)a4
{
  double fTimestamp;
  int64_t totalFloorsClimbed;
  double instantaneousSpeed;
  double instantaneousCadence;
  double instantaneousPower;
  int externalFitnessType;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  double v13;
  int v14;
  int v15;

  fTimestamp = self->fTimestamp;
  totalFloorsClimbed = self->_totalFloorsClimbed;
  instantaneousSpeed = self->_instantaneousSpeed;
  instantaneousCadence = self->_instantaneousCadence;
  instantaneousPower = self->_instantaneousPower;
  externalFitnessType = self->_externalFitnessType;
  v10 = *(_OWORD *)&self->_elapsedTime;
  v11 = *(_OWORD *)&self->_totalDistance;
  *(_OWORD *)&a3->var5 = *(_OWORD *)&self->_totalStrideCount;
  a3->var7 = totalFloorsClimbed;
  v12 = *(_OWORD *)&self->_inclination;
  a3->var0 = fTimestamp;
  *(_OWORD *)&a3->var1 = v10;
  *(_OWORD *)&a3->var3 = v11;
  a3->var8 = instantaneousSpeed;
  a3->var9 = 1.79769313e308;
  a3->var11 = instantaneousCadence;
  a3->var12 = 1.79769313e308;
  a3->var14 = instantaneousPower;
  a3->var15 = 1.79769313e308;
  *(_OWORD *)&a3->var17 = v12;
  a3->var19 = 1.79769313e308;
  a3->var20 = externalFitnessType;
  v13 = self->_instantaneousPower;
  a3->var21 = 1;
  if (v13 >= 1.79769313e308)
  {
    v14 = -1;
  }
  else
  {
    a3->var15 = self->fTimestamp;
    v14 = a4;
  }
  a3->var16 = v14;
  if (self->_instantaneousSpeed >= 1.79769313e308)
  {
    v15 = -1;
  }
  else
  {
    a3->var9 = self->fTimestamp;
    v15 = a4;
  }
  a3->var10 = v15;
  if (self->_instantaneousCadence >= 1.79769313e308)
    a4 = -1;
  else
    a3->var12 = self->fTimestamp;
  a3->var13 = a4;
}

- (CMFitnessMachineData)initWithExernalBikeSensorData:(double)a3 speed:(double)a4 cadence:(double)a5 power:(double)a6 model:(id)a7 deviceIdentifier:(id)a8 manufacturer:(id)a9 externalFitnessType:(int)a10
{
  CMFitnessMachineData *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CMFitnessMachineData *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CMFitnessMachineData;
  v18 = -[CMFitnessMachineData init](&v25, sel_init);
  v23 = v18;
  if (v18)
  {
    objc_msgSend_initializeVariables(v18, v19, v20, v21, v22);
    v23->fTimestamp = a3;
    v23->_instantaneousCadence = a5;
    v23->_instantaneousPower = a6;
    v23->_instantaneousSpeed = a4;
    v23->_manufacturer = (NSString *)a9;
    v23->_model = (NSString *)a7;
    v23->_deviceIdentifier = (NSString *)a8;
    v23->_externalFitnessType = a10;
  }
  return v23;
}

- (void)initializeVariables
{
  int64x2_t v2;

  v2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *(int64x2_t *)&self->_elapsedTime = v2;
  *(int64x2_t *)&self->_totalDistance = v2;
  *(int64x2_t *)&self->_totalStrideCount = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  self->_totalFloorsClimbed = 0x7FFFFFFFFFFFFFFFLL;
  *(int64x2_t *)&self->_instantaneousSpeed = v2;
  *(int64x2_t *)&self->_instantaneousPower = v2;
  self->_resistanceLevel = 1.79769313e308;
  self->_deviceIdentifier = (NSString *)&stru_1E295ADC8;
  self->_manufacturer = (NSString *)&stru_1E295ADC8;
  self->_model = (NSString *)&stru_1E295ADC8;
  self->_externalFitnessType = 0;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(double)a3
{
  self->_elapsedTime = a3;
}

- (double)totalEnergy
{
  return self->_totalEnergy;
}

- (void)setTotalEnergy:(double)a3
{
  self->_totalEnergy = a3;
}

- (double)totalDistance
{
  return self->_totalDistance;
}

- (void)setTotalDistance:(double)a3
{
  self->_totalDistance = a3;
}

- (double)totalElevationAscended
{
  return self->_totalElevationAscended;
}

- (void)setTotalElevationAscended:(double)a3
{
  self->_totalElevationAscended = a3;
}

- (int64_t)totalStrideCount
{
  return self->_totalStrideCount;
}

- (void)setTotalStrideCount:(int64_t)a3
{
  self->_totalStrideCount = a3;
}

- (int64_t)totalStrokeCount
{
  return self->_totalStrokeCount;
}

- (void)setTotalStrokeCount:(int64_t)a3
{
  self->_totalStrokeCount = a3;
}

- (int64_t)totalFloorsClimbed
{
  return self->_totalFloorsClimbed;
}

- (void)setTotalFloorsClimbed:(int64_t)a3
{
  self->_totalFloorsClimbed = a3;
}

- (double)instantaneousSpeed
{
  return self->_instantaneousSpeed;
}

- (void)setInstantaneousSpeed:(double)a3
{
  self->_instantaneousSpeed = a3;
}

- (double)instantaneousCadence
{
  return self->_instantaneousCadence;
}

- (void)setInstantaneousCadence:(double)a3
{
  self->_instantaneousCadence = a3;
}

- (double)instantaneousPower
{
  return self->_instantaneousPower;
}

- (void)setInstantaneousPower:(double)a3
{
  self->_instantaneousPower = a3;
}

- (double)inclination
{
  return self->_inclination;
}

- (void)setInclination:(double)a3
{
  self->_inclination = a3;
}

- (double)resistanceLevel
{
  return self->_resistanceLevel;
}

- (void)setResistanceLevel:(double)a3
{
  self->_resistanceLevel = a3;
}

- (int)externalFitnessType
{
  return self->_externalFitnessType;
}

- (void)setExternalFitnessType:(int)a3
{
  self->_externalFitnessType = a3;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  self->_deviceIdentifier = (NSString *)a3;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
  self->_manufacturer = (NSString *)a3;
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  self->_model = (NSString *)a3;
}

@end
