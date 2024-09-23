@implementation _CLLocationGroundAltitude

- (_CLLocationGroundAltitude)initWithEstimate:(double)a3 uncertainty:(double)a4
{
  uint64_t v4;

  return (_CLLocationGroundAltitude *)objc_msgSend_initWithEstimate_uncertainty_undulation_undulationModel_(self, a2, 0xFFFFFFFFLL, v4, a3, a4, 0.0);
}

- (_CLLocationGroundAltitude)initWithEstimate:(double)a3 uncertainty:(double)a4 undulation:(double)a5 undulationModel:(int)a6
{
  _CLLocationGroundAltitude *result;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_CLLocationGroundAltitude;
  result = -[_CLLocationGroundAltitude init](&v13, sel_init);
  if (result)
  {
    result->_estimate = a3;
    result->_uncertainty = a4;
    result->_undulationModel = a6;
    v11 = sqrt(a4 * a4 + 900.0);
    if (a6 != -1)
      v11 = a4;
    if (a4 <= 0.0)
      v11 = a4;
    v12 = -0.0;
    if (a4 > 0.0 && a6 != -1)
      v12 = a5;
    result->_isAltitudeWgs84Available = a4 > 0.0 && a6 != -1;
    result->_undulation = a5;
    result->_altitudeWgs84 = v12 + a3;
    result->_uncertaintyWgs84 = v11;
  }
  return result;
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
  const char *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;

  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) != 0)
  {
    objc_msgSend_encodeDouble_forKey_(a3, v6, (uint64_t)CFSTR("kCLLocationCodingKeyGroundAltitudeEstimate"), v7, self->_estimate);
    objc_msgSend_encodeDouble_forKey_(a3, v8, (uint64_t)CFSTR("kCLLocationCodingKeyGroundAltitudeUncertainty"), v9, self->_uncertainty);
    objc_msgSend_encodeDouble_forKey_(a3, v10, (uint64_t)CFSTR("kCLLocationCodingKeyGroundAltitudeUndulation"), v11, self->_undulation);
    objc_msgSend_encodeInt_forKey_(a3, v12, self->_undulationModel, (uint64_t)CFSTR("kCLLocationCodingKeyGroundAltitudeUndulationModel"));
  }
  else
  {
    objc_msgSend_encodeValueOfObjCType_at_(a3, v6, (uint64_t)"d", (uint64_t)&self->_estimate);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v13, (uint64_t)"d", (uint64_t)&self->_uncertainty);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v14, (uint64_t)"d", (uint64_t)&self->_undulation);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v15, (uint64_t)"i", (uint64_t)&self->_undulationModel);
  }
}

- (_CLLocationGroundAltitude)initWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  double v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  unsigned int v29;
  double v30;
  double v31;
  double v32;

  v31 = -1.0;
  v32 = 0.0;
  v30 = 0.0;
  v29 = -1;
  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) != 0)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v6, (uint64_t)CFSTR("kCLLocationCodingKeyGroundAltitudeEstimate"), v7);
    v9 = v8;
    v32 = v8;
    objc_msgSend_decodeDoubleForKey_(a3, v10, (uint64_t)CFSTR("kCLLocationCodingKeyGroundAltitudeUncertainty"), v11);
    v13 = v12;
    v31 = v12;
    objc_msgSend_decodeDoubleForKey_(a3, v14, (uint64_t)CFSTR("kCLLocationCodingKeyGroundAltitudeUndulation"), v15);
    v17 = v16;
    v30 = v16;
    v20 = objc_msgSend_decodeIntForKey_(a3, v18, (uint64_t)CFSTR("kCLLocationCodingKeyGroundAltitudeUndulationModel"), v19);
    v29 = v20;
    return (_CLLocationGroundAltitude *)objc_msgSend_initWithEstimate_uncertainty_undulation_undulationModel_(self, v21, v20, v22, v9, v13, v17);
  }
  else
  {
    objc_msgSend_decodeValueOfObjCType_at_(a3, v6, (uint64_t)"d", (uint64_t)&v32);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v24, (uint64_t)"d", (uint64_t)&v31);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v25, (uint64_t)"d", (uint64_t)&v30);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v26, (uint64_t)"i", (uint64_t)&v29);
    return (_CLLocationGroundAltitude *)objc_msgSend_initWithEstimate_uncertainty_undulation_undulationModel_(self, v27, v29, v28, v32, v31, v30);
  }
}

- (double)altitude
{
  double result;

  ((void (*)(_CLLocationGroundAltitude *, char *))MEMORY[0x1E0DE7D20])(self, sel_estimate);
  return result;
}

- (double)estimate
{
  return self->_estimate;
}

- (double)uncertainty
{
  return self->_uncertainty;
}

- (double)undulation
{
  return self->_undulation;
}

- (int)undulationModel
{
  return self->_undulationModel;
}

- (BOOL)isAltitudeWgs84Available
{
  return self->_isAltitudeWgs84Available;
}

- (double)altitudeWgs84
{
  return self->_altitudeWgs84;
}

- (double)uncertaintyWgs84
{
  return self->_uncertaintyWgs84;
}

@end
