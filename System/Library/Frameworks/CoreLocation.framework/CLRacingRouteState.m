@implementation CLRacingRouteState

- (CLRacingRouteState)initWithLatitude:(double)a3 longitude:(double)a4 altitude:(double)a5 odometer:(double)a6 timestamp:(double)a7 timeSinceStart:(double)a8 offRouteTime:(double)a9 distanceSinceStart:(double)a10 offRouteDistance:(double)a11 averagePace:(double)a12 distanceAlongReference:(double)a13
{
  CLRacingRouteState *result;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CLRacingRouteState;
  result = -[CLRacingRouteState init](&v22, sel_init);
  if (result)
  {
    result->_latitude = a3;
    result->_longitude = a4;
    result->_altitude = a5;
    result->_odometer = a6;
    result->_timestamp = a7;
    result->_timeSinceStart = a8;
    result->_offRouteTime = a9;
    result->_distanceSinceStart = a10;
    result->_offRouteDistance = a11;
    result->_averagePace = a12;
    result->_distanceAlongReference = a13;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CLRacingRouteState *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = [CLRacingRouteState alloc];
  return (id)objc_msgSend_initWithLatitude_longitude_altitude_odometer_timestamp_timeSinceStart_offRouteTime_distanceSinceStart_offRouteDistance_averagePace_distanceAlongReference_(v4, v5, v6, v7, self->_latitude, self->_longitude, self->_altitude, self->_odometer, self->_timestamp, self->_timeSinceStart, self->_offRouteTime, self->_distanceSinceStart, *(_QWORD *)&self->_offRouteDistance, *(_QWORD *)&self->_averagePace, *(_QWORD *)&self->_distanceAlongReference);
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
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;

  objc_msgSend_latitude(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeDouble_forKey_(a3, v6, (uint64_t)CFSTR("latitude"), v7);
  objc_msgSend_longitude(self, v8, v9, v10);
  objc_msgSend_encodeDouble_forKey_(a3, v11, (uint64_t)CFSTR("longitude"), v12);
  objc_msgSend_altitude(self, v13, v14, v15);
  objc_msgSend_encodeDouble_forKey_(a3, v16, (uint64_t)CFSTR("altitude"), v17);
  objc_msgSend_odometer(self, v18, v19, v20);
  objc_msgSend_encodeDouble_forKey_(a3, v21, (uint64_t)CFSTR("odometer"), v22);
  objc_msgSend_timestamp(self, v23, v24, v25);
  objc_msgSend_encodeDouble_forKey_(a3, v26, (uint64_t)CFSTR("timestamp"), v27);
  objc_msgSend_timeSinceStart(self, v28, v29, v30);
  objc_msgSend_encodeDouble_forKey_(a3, v31, (uint64_t)CFSTR("timeSinceStart"), v32);
  objc_msgSend_offRouteTime(self, v33, v34, v35);
  objc_msgSend_encodeDouble_forKey_(a3, v36, (uint64_t)CFSTR("offRouteTime"), v37);
  objc_msgSend_distanceSinceStart(self, v38, v39, v40);
  objc_msgSend_encodeDouble_forKey_(a3, v41, (uint64_t)CFSTR("distanceSinceStart"), v42);
  objc_msgSend_offRouteDistance(self, v43, v44, v45);
  objc_msgSend_encodeDouble_forKey_(a3, v46, (uint64_t)CFSTR("offRouteDistance"), v47);
  objc_msgSend_averagePace(self, v48, v49, v50);
  objc_msgSend_encodeDouble_forKey_(a3, v51, (uint64_t)CFSTR("averagePace"), v52);
  objc_msgSend_distanceAlongReference(self, v53, v54, v55);
  objc_msgSend_encodeDouble_forKey_(a3, v56, (uint64_t)CFSTR("distanceAlongReference"), v57);
}

- (CLRacingRouteState)initWithCoder:(id)a3
{
  CLRacingRouteState *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  double v26;
  const char *v27;
  uint64_t v28;
  double v29;
  double v30;
  const char *v31;
  uint64_t v32;
  double v33;
  double v34;
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
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v50;
  double v51;

  v4 = [CLRacingRouteState alloc];
  objc_msgSend_decodeDoubleForKey_(a3, v5, (uint64_t)CFSTR("latitude"), v6);
  v51 = v7;
  objc_msgSend_decodeDoubleForKey_(a3, v8, (uint64_t)CFSTR("longitude"), v9);
  v50 = v10;
  objc_msgSend_decodeDoubleForKey_(a3, v11, (uint64_t)CFSTR("altitude"), v12);
  v14 = v13;
  objc_msgSend_decodeDoubleForKey_(a3, v15, (uint64_t)CFSTR("odometer"), v16);
  v18 = v17;
  objc_msgSend_decodeDoubleForKey_(a3, v19, (uint64_t)CFSTR("timestamp"), v20);
  v22 = v21;
  objc_msgSend_decodeDoubleForKey_(a3, v23, (uint64_t)CFSTR("timeSinceStart"), v24);
  v26 = v25;
  objc_msgSend_decodeDoubleForKey_(a3, v27, (uint64_t)CFSTR("offRouteTime"), v28);
  v30 = v29;
  objc_msgSend_decodeDoubleForKey_(a3, v31, (uint64_t)CFSTR("distanceSinceStart"), v32);
  v34 = v33;
  objc_msgSend_decodeDoubleForKey_(a3, v35, (uint64_t)CFSTR("offRouteDistance"), v36);
  v38 = v37;
  objc_msgSend_decodeDoubleForKey_(a3, v39, (uint64_t)CFSTR("averagePace"), v40);
  v42 = v41;
  objc_msgSend_decodeDoubleForKey_(a3, v43, (uint64_t)CFSTR("distanceAlongReference"), v44);
  return (CLRacingRouteState *)objc_msgSend_initWithLatitude_longitude_altitude_odometer_timestamp_timeSinceStart_offRouteTime_distanceSinceStart_offRouteDistance_averagePace_distanceAlongReference_(v4, v45, v46, v47, v51, v50, v14, v18, v22, v26, v30, v34, v38, v42, v48);
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)odometer
{
  return self->_odometer;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)timeSinceStart
{
  return self->_timeSinceStart;
}

- (double)offRouteTime
{
  return self->_offRouteTime;
}

- (double)distanceSinceStart
{
  return self->_distanceSinceStart;
}

- (double)offRouteDistance
{
  return self->_offRouteDistance;
}

- (double)averagePace
{
  return self->_averagePace;
}

- (double)distanceAlongReference
{
  return self->_distanceAlongReference;
}

@end
