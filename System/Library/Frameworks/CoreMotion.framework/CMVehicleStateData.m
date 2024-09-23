@implementation CMVehicleStateData

- (CMVehicleStateData)initWithTimeRange:(id)a3 vehicleName:(id)a4 vehicleModelName:(id)a5 vehicleBluetoothAddress:(id)a6
{
  char *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMVehicleStateData;
  v10 = -[CMVehicleStateData init](&v12, sel_init);
  if (v10)
  {
    *((_QWORD *)v10 + 1) = a3;
    *((_QWORD *)v10 + 2) = a4;
    *((_QWORD *)v10 + 3) = a5;
    *((_QWORD *)v10 + 4) = a6;
    *(_OWORD *)(v10 + 40) = xmmword_18F505C10;
  }
  return (CMVehicleStateData *)v10;
}

- (CMVehicleStateData)initWithTimestamp:(id)a3 state:(unint64_t)a4 hints:(unint64_t)a5
{
  CMVehicleStateData *v8;
  CMMotionTimeRange *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CMVehicleStateData;
  v8 = -[CMVehicleStateData init](&v26, sel_init);
  if (v8)
  {
    v9 = [CMMotionTimeRange alloc];
    objc_msgSend_timeIntervalSinceReferenceDate(a3, v10, v11, v12, v13);
    v15 = v14;
    objc_msgSend_timeIntervalSinceReferenceDate(a3, v16, v17, v18, v19);
    v8->fTimeRange = (CMMotionTimeRange *)(id)objc_msgSend_initWithStartDate_endDate_(v9, v20, v21, v22, v23, v15, v24);
    v8->fVehicleName = 0;
    v8->fVehicleModelName = 0;
    v8->fVehicleBluetoothAddress = 0;
    v8->fVehicularState = a4;
    v8->fVehicularHints = a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMVehicleStateData;
  -[CMVehicleStateData dealloc](&v3, sel_dealloc);
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
  uint64_t v18;
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

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v18 = objc_msgSend_init(v9, v10, v11, v12, v13);
  if (v18)
  {
    *(_QWORD *)(v18 + 8) = objc_msgSend_copy(self->fTimeRange, v14, v15, v16, v17);
    *(_QWORD *)(v18 + 16) = objc_msgSend_copy(self->fVehicleName, v19, v20, v21, v22);
    *(_QWORD *)(v18 + 24) = objc_msgSend_copy(self->fVehicleModelName, v23, v24, v25, v26);
    *(_QWORD *)(v18 + 32) = objc_msgSend_copy(self->fVehicleBluetoothAddress, v27, v28, v29, v30);
    *(_OWORD *)(v18 + 40) = *(_OWORD *)&self->fVehicularState;
  }
  return (id)v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMVehicleStateData)initWithCoder:(id)a3
{
  CMVehicleStateData *v4;
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
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CMVehicleStateData;
  v4 = -[CMVehicleStateData init](&v24, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->fTimeRange = (CMMotionTimeRange *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMVehicleStateDataCodingKeyTimeRange"), v7);
    v8 = objc_opt_class();
    v4->fVehicleName = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMVehicleStateDataCodingKeyVehicleName"), v10);
    v11 = objc_opt_class();
    v4->fVehicleModelName = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCMVehicleStateDataCodingKeyVehicleModelName"), v13);
    v14 = objc_opt_class();
    v4->fVehicleBluetoothAddress = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v15, v14, (uint64_t)CFSTR("kCMVehicleStateDataCodingKeyVehicleBluetoothAddress"), v16);
    v4->fVehicularState = objc_msgSend_decodeIntegerForKey_(a3, v17, (uint64_t)CFSTR("kCMVehicleStateDataCodingKeyState"), v18, v19);
    v4->fVehicularHints = objc_msgSend_decodeIntegerForKey_(a3, v20, (uint64_t)CFSTR("kCMVehicleStateDataCodingKeyHints"), v21, v22);
  }
  return v4;
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

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->fTimeRange, (uint64_t)CFSTR("kCMVehicleStateDataCodingKeyTimeRange"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fVehicleName, (uint64_t)CFSTR("kCMVehicleStateDataCodingKeyVehicleName"), v7);
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->fVehicleModelName, (uint64_t)CFSTR("kCMVehicleStateDataCodingKeyVehicleModelName"), v9);
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->fVehicleBluetoothAddress, (uint64_t)CFSTR("kCMVehicleStateDataCodingKeyVehicleBluetoothAddress"), v11);
  objc_msgSend_encodeInteger_forKey_(a3, v12, self->fVehicularState, (uint64_t)CFSTR("kCMVehicleStateDataCodingKeyState"), v13);
  objc_msgSend_encodeInteger_forKey_(a3, v14, self->fVehicularHints, (uint64_t)CFSTR("kCMVehicleStateDataCodingKeyHints"), v15);
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t started;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
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
  void *v45;
  const char *v46;
  uint64_t v47;
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
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v69;

  v69 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v9 = (void *)objc_msgSend_timeRange(self, v5, v6, v7, v8);
  started = objc_msgSend_startDate(v9, v10, v11, v12, v13);
  v19 = (void *)objc_msgSend_timeRange(self, v15, v16, v17, v18);
  v24 = objc_msgSend_endDate(v19, v20, v21, v22, v23);
  v29 = objc_msgSend_deviceId(self, v25, v26, v27, v28);
  v34 = objc_msgSend_vehicleName(self, v30, v31, v32, v33);
  v39 = objc_msgSend_vehicleModelName(self, v35, v36, v37, v38);
  v44 = objc_msgSend_vehicleBluetoothAddress(self, v40, v41, v42, v43);
  v45 = (void *)MEMORY[0x1E0CB37E8];
  v50 = objc_msgSend_vehicularState(self, v46, v47, v48, v49);
  v54 = objc_msgSend_numberWithUnsignedInteger_(v45, v51, v50, v52, v53);
  v55 = (void *)MEMORY[0x1E0CB37E8];
  v60 = objc_msgSend_vehicularHints(self, v56, v57, v58, v59);
  v64 = objc_msgSend_numberWithUnsignedInteger_(v55, v61, v60, v62, v63);
  return (id)objc_msgSend_stringWithFormat_(v69, v65, (uint64_t)CFSTR("%@,<startDate %@, endDate %@, deviceId %@, vehicleName %@, vehicleModelName %@, vehicleBluetoothAddress %@, state %@, hints %@>"), v66, v67, v4, started, v24, v29, v34, v39, v44, v54, v64);
}

- (CMMotionTimeRange)timeRange
{
  return self->fTimeRange;
}

- (NSString)deviceId
{
  NSString *result;

  result = self->fVehicleName;
  if (!result)
    return self->fVehicleBluetoothAddress;
  return result;
}

- (NSString)vehicleName
{
  return self->fVehicleName;
}

- (NSString)vehicleModelName
{
  return self->fVehicleModelName;
}

- (NSString)vehicleBluetoothAddress
{
  return self->fVehicleBluetoothAddress;
}

- (unint64_t)vehicularState
{
  return self->fVehicularState;
}

- (unint64_t)vehicularHints
{
  return self->fVehicularHints;
}

@end
