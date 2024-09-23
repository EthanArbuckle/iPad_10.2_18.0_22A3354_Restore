@implementation CLLocationGnssOdometerInfo

- (CLLocationGnssOdometerInfo)initWithOdometer:(double)a3 deltaDistance:(double)a4 deltaDistanceAccuracy:(double)a5
{
  CLLocationGnssOdometerInfo *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLLocationGnssOdometerInfo;
  result = -[CLLocationGnssOdometerInfo init](&v9, sel_init);
  if (result)
  {
    result->_odometer = a3;
    result->_deltaDistance = a4;
    result->_deltaDistanceAccuracy = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLLocationGnssOdometerInfo)initWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  int v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v26;
  const char *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;

  *(double *)&v29 = -1.0;
  *(double *)&v30 = -1.0;
  *(double *)&v28 = -1.0;
  if (objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3))
  {
    v10 = -1.0;
    v11 = -1.0;
    if (objc_msgSend_containsValueForKey_(a3, v6, (uint64_t)CFSTR("odometer"), v7))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v8, (uint64_t)CFSTR("odometer"), v9);
      v11 = v12;
      *(double *)&v30 = v12;
    }
    if (objc_msgSend_containsValueForKey_(a3, v8, (uint64_t)CFSTR("deltaDistance"), v9))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v13, (uint64_t)CFSTR("deltaDistance"), v14);
      v10 = v15;
      *(double *)&v29 = v15;
    }
    v16 = objc_msgSend_containsValueForKey_(a3, v13, (uint64_t)CFSTR("deltaDistanceAccuracy"), v14);
    v20 = -1.0;
    if (v16)
    {
      objc_msgSend_decodeDoubleForKey_(a3, v17, (uint64_t)CFSTR("deltaDistanceAccuracy"), v19);
      *(double *)&v28 = v21;
      return (CLLocationGnssOdometerInfo *)objc_msgSend_initWithOdometer_deltaDistance_deltaDistanceAccuracy_(self, v22, v23, v24, v11, v10, v21);
    }
  }
  else
  {
    objc_msgSend_decodeValueOfObjCType_at_(a3, v6, (uint64_t)"d", (uint64_t)&v30);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v26, (uint64_t)"d", (uint64_t)&v29);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v27, (uint64_t)"d", (uint64_t)&v28);
    v10 = *(double *)&v29;
    v11 = *(double *)&v30;
    v20 = *(double *)&v28;
  }
  return (CLLocationGnssOdometerInfo *)objc_msgSend_initWithOdometer_deltaDistance_deltaDistanceAccuracy_(self, v17, v18, v19, v11, v10, v20);
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
  const char *v13;

  if (objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3))
  {
    objc_msgSend_encodeDouble_forKey_(a3, v6, (uint64_t)CFSTR("odometer"), v7, self->_odometer);
    objc_msgSend_encodeDouble_forKey_(a3, v8, (uint64_t)CFSTR("deltaDistance"), v9, self->_deltaDistance);
    objc_msgSend_encodeDouble_forKey_(a3, v10, (uint64_t)CFSTR("deltaDistanceAccuracy"), v11, self->_deltaDistanceAccuracy);
  }
  else
  {
    objc_msgSend_encodeValueOfObjCType_at_(a3, v6, (uint64_t)"d", (uint64_t)&self->_odometer);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v12, (uint64_t)"d", (uint64_t)&self->_deltaDistance);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v13, (uint64_t)"d", (uint64_t)&self->_deltaDistanceAccuracy);
  }
}

- (double)odometer
{
  return self->_odometer;
}

- (double)deltaDistance
{
  return self->_deltaDistance;
}

- (double)deltaDistanceAccuracy
{
  return self->_deltaDistanceAccuracy;
}

@end
