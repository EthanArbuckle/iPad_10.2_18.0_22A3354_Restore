@implementation CMOdometerData

- (CMOdometerData)initWithDeltaDistance:(double)a3 startDate:(id)a4 endDate:(id)a5 accuracy:(id)a6 rawSpeed:(id)a7 gpsSpeedAccuracy:(id)a8 timestampGps:(id)a9 deltaGroundAltitude:(id)a10 groundAltitudeUncertainty:(id)a11 originDevice:(int64_t)a12 slope:(id)a13 maxAbsSlope:(id)a14
{
  char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CMOdometerData;
  v21 = -[CMOdometerData init](&v27, sel_init);
  if (v21)
  {
    *((_QWORD *)v21 + 3) = a4;
    *((_QWORD *)v21 + 4) = a5;
    *((_QWORD *)v21 + 6) = (id)objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v22, v23, v24, v25, a3);
    *((_QWORD *)v21 + 9) = a6;
    *((_QWORD *)v21 + 11) = a7;
    *((_QWORD *)v21 + 13) = a8;
    *((_QWORD *)v21 + 14) = a9;
    *((_QWORD *)v21 + 21) = a10;
    *((_QWORD *)v21 + 16) = a11;
    *((_QWORD *)v21 + 5) = a12;
    *((_QWORD *)v21 + 1) = a13;
    *((_QWORD *)v21 + 2) = a14;
    *((_QWORD *)v21 + 10) = 0;
    *((_QWORD *)v21 + 15) = 0;
    *((_QWORD *)v21 + 7) = 0;
    *((_QWORD *)v21 + 8) = 0;
    *(_OWORD *)(v21 + 136) = 0u;
    *(_OWORD *)(v21 + 152) = 0u;
  }
  return (CMOdometerData *)v21;
}

- (CMOdometerData)initWithDistance:(id)a3 startDate:(id)a4 endDate:(id)a5 currentSpeed:(id)a6 averageSpeed:(id)a7
{
  char *v12;
  id v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CMOdometerData;
  v12 = -[CMOdometerData init](&v15, sel_init);
  if (v12)
  {
    *((_QWORD *)v12 + 3) = a4;
    *((_QWORD *)v12 + 4) = a5;
    *((_QWORD *)v12 + 7) = a6;
    *((_QWORD *)v12 + 8) = a7;
    v13 = a3;
    *((_QWORD *)v12 + 5) = 0;
    *((_QWORD *)v12 + 6) = v13;
    *((_QWORD *)v12 + 1) = 0;
    *((_QWORD *)v12 + 2) = 0;
    *(_OWORD *)(v12 + 72) = 0u;
    *(_OWORD *)(v12 + 88) = 0u;
    *(_OWORD *)(v12 + 104) = 0u;
    *(_OWORD *)(v12 + 120) = 0u;
    *(_OWORD *)(v12 + 136) = 0u;
    *(_OWORD *)(v12 + 152) = 0u;
    *((_QWORD *)v12 + 21) = 0;
  }
  return (CMOdometerData *)v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMOdometerData;
  -[CMOdometerData dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  _QWORD *started;
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
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
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
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  started = (_QWORD *)objc_msgSend_initWithDistance_startDate_endDate_currentSpeed_averageSpeed_(v9, v10, (uint64_t)self->_distance, (uint64_t)self->_startDate, (uint64_t)self->_endDate, self->_currentSpeed, self->_averageSpeed);
  started[9] = objc_msgSend_copy(self->_accuracy, v12, v13, v14, v15);
  started[10] = objc_msgSend_copy(self->_gpsAltitude, v16, v17, v18, v19);
  started[11] = objc_msgSend_copy(self->_rawSpeed, v20, v21, v22, v23);
  started[12] = objc_msgSend_copy(self->_odometer, v24, v25, v26, v27);
  started[13] = objc_msgSend_copy(self->_gpsSpeedAccuracy, v28, v29, v30, v31);
  started[14] = objc_msgSend_copy(self->_timestampGps, v32, v33, v34, v35);
  started[15] = objc_msgSend_copy(self->_groundAltitude, v36, v37, v38, v39);
  started[16] = objc_msgSend_copy(self->_groundAltitudeUncertainty, v40, v41, v42, v43);
  started[17] = objc_msgSend_copy(self->_smoothedGPSAltitude, v44, v45, v46, v47);
  started[18] = objc_msgSend_copy(self->_smoothedGPSAltitudeUncertainty, v48, v49, v50, v51);
  started[19] = objc_msgSend_copy(self->_gpsCourseRadians, v52, v53, v54, v55);
  started[20] = objc_msgSend_copy(self->_gpsCourseAccuracy, v56, v57, v58, v59);
  started[5] = self->_originDevice;
  started[21] = objc_msgSend_copy(self->_deltaGroundAltitude, v60, v61, v62, v63);
  started[1] = objc_msgSend_copy(self->_slope, v64, v65, v66, v67);
  started[2] = objc_msgSend_copy(self->_maxAbsSlope, v68, v69, v70, v71);
  return started;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMOdometerData)initWithCoder:(id)a3
{
  CMOdometerData *v4;
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
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  objc_super v69;

  v69.receiver = self;
  v69.super_class = (Class)CMOdometerData;
  v4 = -[CMOdometerData init](&v69, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_startDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMOdometerDataCodingKeyStartDate"), v7);
    v8 = objc_opt_class();
    v4->_endDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMOdometerDataCodingKeyEndDate"), v10);
    v11 = objc_opt_class();
    v4->_distance = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCMOdometerDataCodingKeyDistance"), v13);
    v14 = objc_opt_class();
    v4->_currentSpeed = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v15, v14, (uint64_t)CFSTR("kCMOdometerDataCodingKeyCurrentSpeed"), v16);
    v17 = objc_opt_class();
    v4->_averageSpeed = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v18, v17, (uint64_t)CFSTR("kCMOdometerDataCodingKeyAverageSpeed"), v19);
    v20 = objc_opt_class();
    v4->_accuracy = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v21, v20, (uint64_t)CFSTR("kCMOdometerDataCodingKeyAccuracy"), v22);
    v23 = objc_opt_class();
    v4->_gpsAltitude = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v24, v23, (uint64_t)CFSTR("kCMOdometerDataCodingKeyGPSAltitude"), v25);
    v26 = objc_opt_class();
    v4->_rawSpeed = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v27, v26, (uint64_t)CFSTR("kCMOdometerDataCodingKeyRawSpeed"), v28);
    v29 = objc_opt_class();
    v4->_odometer = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v30, v29, (uint64_t)CFSTR("kCMOdometerDataCodingKeyOdometer"), v31);
    v32 = objc_opt_class();
    v4->_gpsSpeedAccuracy = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v33, v32, (uint64_t)CFSTR("kCMOdometerDataCodingKeyGPSSpeedAccuracy"), v34);
    v35 = objc_opt_class();
    v4->_timestampGps = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v36, v35, (uint64_t)CFSTR("kCMOdometerDataCodingKeyTimestampGPS"), v37);
    v38 = objc_opt_class();
    v4->_groundAltitude = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v39, v38, (uint64_t)CFSTR("kCMOdometerDataCodingKeyGroundAltitude"), v40);
    v41 = objc_opt_class();
    v4->_groundAltitudeUncertainty = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v42, v41, (uint64_t)CFSTR("kCMOdometerDataCodingKeyGroundAltitudeUncertainty"), v43);
    v44 = objc_opt_class();
    v4->_smoothedGPSAltitude = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v45, v44, (uint64_t)CFSTR("kCMOdometerDataCodingKeySmoothedGPSAltitude"), v46);
    v47 = objc_opt_class();
    v4->_smoothedGPSAltitudeUncertainty = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v48, v47, (uint64_t)CFSTR("kCMOdometerDataCodingKeySmoothedGPSAltitudeUncertainty"), v49);
    v50 = objc_opt_class();
    v4->_gpsCourseRadians = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v51, v50, (uint64_t)CFSTR("kCMOdometerDataCodingKeyGPSCourseRadians"), v52);
    v53 = objc_opt_class();
    v4->_gpsCourseAccuracy = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v54, v53, (uint64_t)CFSTR("kCMOdometerDataCodingKeyGPSCourseAccuracy"), v55);
    v4->_originDevice = objc_msgSend_decodeIntegerForKey_(a3, v56, (uint64_t)CFSTR("kCMOdometerDataCodingKeyOriginDevice"), v57, v58);
    v59 = objc_opt_class();
    v4->_deltaGroundAltitude = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v60, v59, (uint64_t)CFSTR("kCMOdometerDataCodingKeyDeltaGroundAltitude"), v61);
    v62 = objc_opt_class();
    v4->_slope = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v63, v62, (uint64_t)CFSTR("kCMOdometerDataCodingKeySlope"), v64);
    v65 = objc_opt_class();
    v4->_maxAbsSlope = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v66, v65, (uint64_t)CFSTR("kCMOdometerDataCodingKeyMaxAbsSlope"), v67);
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
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_startDate, (uint64_t)CFSTR("kCMOdometerDataCodingKeyStartDate"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_endDate, (uint64_t)CFSTR("kCMOdometerDataCodingKeyEndDate"), v7);
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->_distance, (uint64_t)CFSTR("kCMOdometerDataCodingKeyDistance"), v9);
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->_currentSpeed, (uint64_t)CFSTR("kCMOdometerDataCodingKeyCurrentSpeed"), v11);
  objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)self->_averageSpeed, (uint64_t)CFSTR("kCMOdometerDataCodingKeyAverageSpeed"), v13);
  objc_msgSend_encodeObject_forKey_(a3, v14, (uint64_t)self->_accuracy, (uint64_t)CFSTR("kCMOdometerDataCodingKeyAccuracy"), v15);
  objc_msgSend_encodeObject_forKey_(a3, v16, (uint64_t)self->_gpsAltitude, (uint64_t)CFSTR("kCMOdometerDataCodingKeyGPSAltitude"), v17);
  objc_msgSend_encodeObject_forKey_(a3, v18, (uint64_t)self->_rawSpeed, (uint64_t)CFSTR("kCMOdometerDataCodingKeyRawSpeed"), v19);
  objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)self->_odometer, (uint64_t)CFSTR("kCMOdometerDataCodingKeyOdometer"), v21);
  objc_msgSend_encodeObject_forKey_(a3, v22, (uint64_t)self->_gpsSpeedAccuracy, (uint64_t)CFSTR("kCMOdometerDataCodingKeyGPSSpeedAccuracy"), v23);
  objc_msgSend_encodeObject_forKey_(a3, v24, (uint64_t)self->_timestampGps, (uint64_t)CFSTR("kCMOdometerDataCodingKeyTimestampGPS"), v25);
  objc_msgSend_encodeObject_forKey_(a3, v26, (uint64_t)self->_groundAltitude, (uint64_t)CFSTR("kCMOdometerDataCodingKeyGroundAltitude"), v27);
  objc_msgSend_encodeObject_forKey_(a3, v28, (uint64_t)self->_groundAltitudeUncertainty, (uint64_t)CFSTR("kCMOdometerDataCodingKeyGroundAltitudeUncertainty"), v29);
  objc_msgSend_encodeObject_forKey_(a3, v30, (uint64_t)self->_smoothedGPSAltitude, (uint64_t)CFSTR("kCMOdometerDataCodingKeySmoothedGPSAltitude"), v31);
  objc_msgSend_encodeObject_forKey_(a3, v32, (uint64_t)self->_smoothedGPSAltitudeUncertainty, (uint64_t)CFSTR("kCMOdometerDataCodingKeySmoothedGPSAltitudeUncertainty"), v33);
  objc_msgSend_encodeObject_forKey_(a3, v34, (uint64_t)self->_gpsCourseRadians, (uint64_t)CFSTR("kCMOdometerDataCodingKeyGPSCourseRadians"), v35);
  objc_msgSend_encodeObject_forKey_(a3, v36, (uint64_t)self->_gpsCourseAccuracy, (uint64_t)CFSTR("kCMOdometerDataCodingKeyGPSCourseAccuracy"), v37);
  objc_msgSend_encodeInteger_forKey_(a3, v38, self->_originDevice, (uint64_t)CFSTR("kCMOdometerDataCodingKeyOriginDevice"), v39);
  objc_msgSend_encodeObject_forKey_(a3, v40, (uint64_t)self->_deltaGroundAltitude, (uint64_t)CFSTR("kCMOdometerDataCodingKeyDeltaGroundAltitude"), v41);
  objc_msgSend_encodeObject_forKey_(a3, v42, (uint64_t)self->_slope, (uint64_t)CFSTR("kCMOdometerDataCodingKeySlope"), v43);
  objc_msgSend_encodeObject_forKey_(a3, v44, (uint64_t)self->_maxAbsSlope, (uint64_t)CFSTR("kCMOdometerDataCodingKeyMaxAbsSlope"), v45);
}

- (CLLocationDistance)deltaDistance
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  CLLocationDistance result;

  objc_msgSend_doubleValue(self->_distance, a2, v2, v3, v4);
  return result;
}

- (CLLocationAccuracy)deltaDistanceAccuracy
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSNumber *accuracy;
  CLLocationAccuracy result;

  accuracy = self->_accuracy;
  if (!accuracy)
    return -1.0;
  objc_msgSend_doubleValue(accuracy, a2, v2, v3, v4);
  return result;
}

- (CLLocationSpeed)speed
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSNumber *rawSpeed;
  CLLocationSpeed result;

  rawSpeed = self->_rawSpeed;
  if (!rawSpeed)
    return -1.0;
  objc_msgSend_doubleValue(rawSpeed, a2, v2, v3, v4);
  return result;
}

- (CLLocationSpeedAccuracy)speedAccuracy
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSNumber *gpsSpeedAccuracy;
  CLLocationSpeedAccuracy result;

  gpsSpeedAccuracy = self->_gpsSpeedAccuracy;
  if (!gpsSpeedAccuracy)
    return -1.0;
  objc_msgSend_doubleValue(gpsSpeedAccuracy, a2, v2, v3, v4);
  return result;
}

- (NSDate)gpsDate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSNumber *timestampGps;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  timestampGps = self->_timestampGps;
  v6 = (void *)MEMORY[0x1E0C99D68];
  if (!timestampGps)
    return (NSDate *)objc_msgSend_date(MEMORY[0x1E0C99D68], a2, v2, v3, v4);
  objc_msgSend_doubleValue(timestampGps, a2, v2, v3, v4);
  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v6, v7, v8, v9, v10);
}

- (CLLocationDistance)deltaAltitude
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSNumber *deltaGroundAltitude;
  CLLocationDistance result;

  deltaGroundAltitude = self->_deltaGroundAltitude;
  if (!deltaGroundAltitude)
    return 0.0;
  objc_msgSend_doubleValue(deltaGroundAltitude, a2, v2, v3, v4);
  return result;
}

- (CLLocationAccuracy)verticalAccuracy
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSNumber *groundAltitudeUncertainty;
  CLLocationAccuracy result;

  if (!self->_deltaGroundAltitude)
    return -1.0;
  groundAltitudeUncertainty = self->_groundAltitudeUncertainty;
  if (!groundAltitudeUncertainty)
    return -1.0;
  objc_msgSend_doubleValue(groundAltitudeUncertainty, a2, v2, v3, v4);
  return result;
}

- (NSNumber)slope
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSNumber *result;
  double v7;

  result = self->_groundAltitudeUncertainty;
  if (result)
  {
    objc_msgSend_doubleValue(result, a2, v2, v3, v4);
    if (v7 <= 0.0)
      return 0;
    else
      return self->_slope;
  }
  return result;
}

- (NSNumber)maxAbsSlope
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSNumber *result;
  double v7;

  result = self->_groundAltitudeUncertainty;
  if (result)
  {
    objc_msgSend_doubleValue(result, a2, v2, v3, v4);
    if (v7 <= 0.0)
      return 0;
    else
      return self->_maxAbsSlope;
  }
  return result;
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
  uint64_t started;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
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
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  started = objc_msgSend_startDate(self, v6, v7, v8, v9);
  v15 = objc_msgSend_endDate(self, v11, v12, v13, v14);
  objc_msgSend_deltaDistance(self, v16, v17, v18, v19);
  v21 = v20;
  objc_msgSend_deltaDistanceAccuracy(self, v22, v23, v24, v25);
  v27 = v26;
  objc_msgSend_speed(self, v28, v29, v30, v31);
  v33 = v32;
  objc_msgSend_speedAccuracy(self, v34, v35, v36, v37);
  v39 = v38;
  v44 = objc_msgSend_gpsDate(self, v40, v41, v42, v43);
  objc_msgSend_deltaAltitude(self, v45, v46, v47, v48);
  v50 = v49;
  objc_msgSend_verticalAccuracy(self, v51, v52, v53, v54);
  v56 = v55;
  v61 = objc_msgSend_originDevice(self, v57, v58, v59, v60);
  v66 = objc_msgSend_deltaGroundAltitude(self, v62, v63, v64, v65);
  v71 = objc_msgSend_slope(self, v67, v68, v69, v70);
  v76 = objc_msgSend_maxAbsSlope(self, v72, v73, v74, v75);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v77, (uint64_t)CFSTR("%@,<startDate %@, endDate %@, deltaDistance %f, deltaDistanceAccuracy %f, speed %f, speedAccuracy %f, gpsDate %@, deltaAltitude %f, verticalAccuracy %f, originDevice %d, deltaGroundAltitude %@, currentSlope %@, maxAbsoluteSlope %@>"), v78, v79, v5, started, v15, v21, v27, v33, v39, v44, v50, v56, v61, v66, v71, v76);
}

- (id)relativeTimestampGps
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *started;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  if (!objc_msgSend_startDate(self, a2, v2, v3, v4) || !objc_msgSend_timestampGps(self, v6, v7, v8, v9))
    return 0;
  started = (void *)objc_msgSend_startDate(self, v10, v11, v12, v13);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v15, v16, v17, v18);
  v20 = v19;
  v25 = (void *)objc_msgSend_timestampGps(self, v21, v22, v23, v24);
  objc_msgSend_doubleValue(v25, v26, v27, v28, v29);
  return (id)objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v31, v32, v33, v34, v20 - v30);
}

- (void)updateStartDate:(id)a3
{

  self->_startDate = (NSDate *)a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (CMOdometerOriginDevice)originDevice
{
  return self->_originDevice;
}

- (NSNumber)distance
{
  return self->_distance;
}

- (void)setDistance:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSNumber)currentSpeed
{
  return self->_currentSpeed;
}

- (void)setCurrentSpeed:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSNumber)averageSpeed
{
  return self->_averageSpeed;
}

- (void)setAverageSpeed:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSNumber)accuracy
{
  return self->_accuracy;
}

- (void)setAccuracy:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSNumber)gpsAltitude
{
  return self->_gpsAltitude;
}

- (void)setGpsAltitude:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)rawSpeed
{
  return self->_rawSpeed;
}

- (void)setRawSpeed:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)odometer
{
  return self->_odometer;
}

- (void)setOdometer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)gpsSpeedAccuracy
{
  return self->_gpsSpeedAccuracy;
}

- (void)setGpsSpeedAccuracy:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)timestampGps
{
  return self->_timestampGps;
}

- (void)setTimestampGps:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSNumber)groundAltitude
{
  return self->_groundAltitude;
}

- (void)setGroundAltitude:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSNumber)groundAltitudeUncertainty
{
  return self->_groundAltitudeUncertainty;
}

- (void)setGroundAltitudeUncertainty:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSNumber)smoothedGPSAltitude
{
  return self->_smoothedGPSAltitude;
}

- (void)setSmoothedGPSAltitude:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSNumber)smoothedGPSAltitudeUncertainty
{
  return self->_smoothedGPSAltitudeUncertainty;
}

- (void)setSmoothedGPSAltitudeUncertainty:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (NSNumber)gpsCourseRadians
{
  return self->_gpsCourseRadians;
}

- (void)setGpsCourseRadians:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (NSNumber)gpsCourseAccuracy
{
  return self->_gpsCourseAccuracy;
}

- (void)setGpsCourseAccuracy:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (NSNumber)deltaGroundAltitude
{
  return self->_deltaGroundAltitude;
}

- (void)setDeltaGroundAltitude:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
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

- (CMOdometerData)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  CMOdometerData *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
  {
    v15.receiver = self;
    v15.super_class = (Class)CMOdometerData;
    v8 = -[CMOdometerData init](&v15, sel_init);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3710];
      v10 = objc_opt_class();
      v12 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v9, v11, v10, (uint64_t)a3, 0);
      if (v12)
      {
        v13 = (void *)v12;

        return (CMOdometerData *)v13;
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
