@implementation CLRoutePoint

- (CLRoutePoint)initWithLatitude:(double)a3 longitude:(double)a4 altitude:(double)a5 odometer:(double)a6 timestamp:(double)a7 signalEnvironmentType:(int)a8
{
  CLRoutePoint *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLRoutePoint;
  result = -[CLRoutePoint init](&v15, sel_init);
  if (result)
  {
    result->_latitude_deg = a3;
    result->_longitude_deg = a4;
    result->_altitude_m = a5;
    result->_odometer_m = a6;
    result->_timestamp_s = a7;
    result->_signalEnvironmentType = a8;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  const char *v34;
  uint64_t v35;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_latitude_deg(self, v5, v6, v7);
  v9 = v8;
  objc_msgSend_longitude_deg(self, v10, v11, v12);
  v14 = v13;
  objc_msgSend_altitude_m(self, v15, v16, v17);
  v19 = v18;
  objc_msgSend_odometer_m(self, v20, v21, v22);
  v24 = v23;
  objc_msgSend_timestamp_s(self, v25, v26, v27);
  v29 = v28;
  v33 = objc_msgSend_signalEnvironmentType(self, v30, v31, v32);
  return (id)objc_msgSend_stringWithFormat_(v3, v34, (uint64_t)CFSTR("<%@ latitude: %.7lf, longitude: %.7lf, altitude: %.3lf, odometer: %.3lf, timestamp: %.3lf, signalEnvironment: %d>"), v35, v4, v9, v14, v19, v24, v29, v33);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  double v6;
  double v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  int v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;

  objc_msgSend_latitude_deg(self, a2, (uint64_t)a3, v3);
  v7 = v6;
  objc_msgSend_latitude_deg(a3, v8, v9, v10);
  if (vabdd_f64(v7, v14) >= 0.0000001)
    return 0;
  objc_msgSend_longitude_deg(self, v11, v12, v13);
  v16 = v15;
  objc_msgSend_longitude_deg(a3, v17, v18, v19);
  if (vabdd_f64(v16, v23) >= 0.0000001)
    return 0;
  objc_msgSend_altitude_m(self, v20, v21, v22);
  v25 = v24;
  objc_msgSend_altitude_m(a3, v26, v27, v28);
  if (vabdd_f64(v25, v32) >= 0.0000001)
    return 0;
  objc_msgSend_odometer_m(self, v29, v30, v31);
  v34 = v33;
  objc_msgSend_odometer_m(a3, v35, v36, v37);
  if (vabdd_f64(v34, v41) >= 0.0000001)
    return 0;
  objc_msgSend_timestamp_s(self, v38, v39, v40);
  v43 = v42;
  objc_msgSend_timestamp_s(a3, v44, v45, v46);
  if (vabdd_f64(v43, v50) >= 0.0000001)
    return 0;
  v51 = objc_msgSend_signalEnvironmentType(self, v47, v48, v49);
  return v51 == objc_msgSend_signalEnvironmentType(a3, v52, v53, v54);
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_latitude_deg(self, a2, v2, v3);
  v9 = (void *)objc_msgSend_numberWithDouble_(v5, v6, v7, v8);
  v13 = objc_msgSend_hash(v9, v10, v11, v12);
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_longitude_deg(self, v15, v16, v17);
  v21 = (void *)objc_msgSend_numberWithDouble_(v14, v18, v19, v20);
  v25 = objc_msgSend_hash(v21, v22, v23, v24) ^ v13;
  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_altitude_m(self, v27, v28, v29);
  v33 = (void *)objc_msgSend_numberWithDouble_(v26, v30, v31, v32);
  v37 = objc_msgSend_hash(v33, v34, v35, v36);
  v38 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_odometer_m(self, v39, v40, v41);
  v45 = (void *)objc_msgSend_numberWithDouble_(v38, v42, v43, v44);
  v49 = v25 ^ v37 ^ objc_msgSend_hash(v45, v46, v47, v48);
  v50 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_timestamp_s(self, v51, v52, v53);
  v57 = (void *)objc_msgSend_numberWithDouble_(v50, v54, v55, v56);
  v61 = objc_msgSend_hash(v57, v58, v59, v60);
  return v49 ^ v61 ^ objc_msgSend_signalEnvironmentType(self, v62, v63, v64);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
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
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  objc_msgSend_latitude_deg(self, v13, v14, v15);
  *(_QWORD *)(v12 + 16) = v16;
  objc_msgSend_longitude_deg(self, v17, v18, v19);
  *(_QWORD *)(v12 + 24) = v20;
  objc_msgSend_altitude_m(self, v21, v22, v23);
  *(_QWORD *)(v12 + 32) = v24;
  objc_msgSend_odometer_m(self, v25, v26, v27);
  *(_QWORD *)(v12 + 40) = v28;
  objc_msgSend_timestamp_s(self, v29, v30, v31);
  *(_QWORD *)(v12 + 48) = v32;
  *(_DWORD *)(v12 + 8) = objc_msgSend_signalEnvironmentType(self, v33, v34, v35);
  return (id)v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;

  objc_msgSend_latitude_deg(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeDouble_forKey_(a3, v6, (uint64_t)CFSTR("latitude"), v7);
  objc_msgSend_longitude_deg(self, v8, v9, v10);
  objc_msgSend_encodeDouble_forKey_(a3, v11, (uint64_t)CFSTR("longitude"), v12);
  objc_msgSend_altitude_m(self, v13, v14, v15);
  objc_msgSend_encodeDouble_forKey_(a3, v16, (uint64_t)CFSTR("altitude"), v17);
  objc_msgSend_odometer_m(self, v18, v19, v20);
  objc_msgSend_encodeDouble_forKey_(a3, v21, (uint64_t)CFSTR("odometer"), v22);
  objc_msgSend_timestamp_s(self, v23, v24, v25);
  objc_msgSend_encodeDouble_forKey_(a3, v26, (uint64_t)CFSTR("timestamp"), v27);
  v31 = objc_msgSend_signalEnvironmentType(self, v28, v29, v30);
  objc_msgSend_encodeInteger_forKey_(a3, v32, v31, (uint64_t)CFSTR("signalEnvironment"));
}

- (CLRoutePoint)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  CLRoutePoint *v6;
  double v7;
  const char *v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CLRoutePoint;
  v6 = -[CLRoutePoint init](&v23, sel_init);
  if (v6)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, (uint64_t)CFSTR("latitude"), v5);
    v6->_latitude_deg = v7;
    objc_msgSend_decodeDoubleForKey_(a3, v8, (uint64_t)CFSTR("longitude"), v9);
    v6->_longitude_deg = v10;
    objc_msgSend_decodeDoubleForKey_(a3, v11, (uint64_t)CFSTR("altitude"), v12);
    v6->_altitude_m = v13;
    objc_msgSend_decodeDoubleForKey_(a3, v14, (uint64_t)CFSTR("odometer"), v15);
    v6->_odometer_m = v16;
    objc_msgSend_decodeDoubleForKey_(a3, v17, (uint64_t)CFSTR("timestamp"), v18);
    v6->_timestamp_s = v19;
    v6->_signalEnvironmentType = objc_msgSend_decodeIntegerForKey_(a3, v20, (uint64_t)CFSTR("signalEnvironment"), v21);
  }
  return v6;
}

- (double)latitude_deg
{
  return self->_latitude_deg;
}

- (double)longitude_deg
{
  return self->_longitude_deg;
}

- (double)altitude_m
{
  return self->_altitude_m;
}

- (double)odometer_m
{
  return self->_odometer_m;
}

- (double)timestamp_s
{
  return self->_timestamp_s;
}

- (int)signalEnvironmentType
{
  return self->_signalEnvironmentType;
}

@end
