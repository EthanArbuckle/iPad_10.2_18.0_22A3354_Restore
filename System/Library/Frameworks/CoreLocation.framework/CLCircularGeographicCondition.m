@implementation CLCircularGeographicCondition

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLCircularGeographicCondition)initWithCenter:(CLLocationCoordinate2D)center radius:(CLLocationDistance)radius
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  CLCircularGeographicCondition *result;
  objc_super v8;

  longitude = center.longitude;
  latitude = center.latitude;
  v8.receiver = self;
  v8.super_class = (Class)CLCircularGeographicCondition;
  result = -[CLCondition initCondition](&v8, sel_initCondition);
  if (result)
  {
    result->_center.latitude = latitude;
    result->_center.longitude = longitude;
    result->_radius = radius;
  }
  return result;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_center(self, a2, v2, v3);
  v7 = v6;
  objc_msgSend_center(self, v8, v9, v10);
  v12 = v11;
  objc_msgSend_radius(self, v13, v14, v15);
  return (id)objc_msgSend_stringWithFormat_(v5, v16, (uint64_t)CFSTR("CLCircularGeographicCondition(center:<%+.8f, %+.8f>, radius: %.2fm)"), v17, v7, v12, v18);
}

- (BOOL)isEqual:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v27;
  double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;

  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  objc_msgSend_center(a3, v5, v6, v7);
  v9 = round(v8 * 1000000.0);
  objc_msgSend_center(self, v10, v11, v12);
  if (vabdd_f64(v9, round(v16 * 1000000.0)) > 2.22044605e-16)
    return 0;
  objc_msgSend_center(a3, v13, v14, v15);
  v18 = round(v17 * 1000000.0);
  objc_msgSend_center(self, v19, v20, v21);
  if (vabdd_f64(v18, round(v25 * 1000000.0)) > 2.22044605e-16)
    return 0;
  objc_msgSend_radius(a3, v22, v23, v24);
  v28 = round(v27 * 1000000.0);
  objc_msgSend_radius(self, v29, v30, v31);
  return vabdd_f64(v28, round(v32 * 1000000.0)) <= 2.22044605e-16;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  double v5;
  unint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;

  objc_msgSend_center(self, a2, v2, v3);
  v6 = vcvtad_u64_f64(v5 * 1000000.0);
  objc_msgSend_center(self, v7, v8, v9);
  v11 = vcvtad_u64_f64(v10 * 1000000.0) ^ v6;
  objc_msgSend_radius(self, v12, v13, v14);
  return v11 ^ vcvtad_u64_f64(v15 * 1000000.0);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;

  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    v23 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, (uint64_t)self, CFSTR("CLCircularGeographicCondition.mm"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coder.allowsKeyedCoding"));
  }
  objc_msgSend_center(self, v7, v8, v9);
  objc_msgSend_encodeDouble_forKey_(a3, v10, (uint64_t)CFSTR("kCircularGeographicConditionCodingKeyCenterLatitude"), v11);
  objc_msgSend_center(self, v12, v13, v14);
  objc_msgSend_encodeDouble_forKey_(a3, v15, (uint64_t)CFSTR("kCircularGeographicConditionCodingKeyCenterLongitude"), v16, v17);
  objc_msgSend_radius(self, v18, v19, v20);
  objc_msgSend_encodeDouble_forKey_(a3, v21, (uint64_t)CFSTR("kCircularGeographicConditionCodingKeyRadius"), v22);
}

- (CLCircularGeographicCondition)initWithCoder:(id)a3
{
  uint64_t v3;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    v14 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, (uint64_t)self, CFSTR("CLCircularGeographicCondition.mm"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("decoder.allowsKeyedCoding"));
  }
  objc_msgSend_decodeDoubleForKey_(a3, v7, (uint64_t)CFSTR("kCircularGeographicConditionCodingKeyCenterLatitude"), v9);
  objc_msgSend_decodeDoubleForKey_(a3, v10, (uint64_t)CFSTR("kCircularGeographicConditionCodingKeyCenterLongitude"), v11);
  objc_msgSend_decodeDoubleForKey_(a3, v12, (uint64_t)CFSTR("kCircularGeographicConditionCodingKeyRadius"), v13);
  return (CLCircularGeographicCondition *)MEMORY[0x1E0DE7D20](self, sel_initWithCenter_radius_, v16, v17);
}

- (CLLocationCoordinate2D)center
{
  double v2;
  double v3;
  _QWORD v4[2];
  CLLocationCoordinate2D result;

  objc_copyStruct(v4, &self->_center, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (CLLocationDistance)radius
{
  return self->_radius;
}

@end
