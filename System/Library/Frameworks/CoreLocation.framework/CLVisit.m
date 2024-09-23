@implementation CLVisit

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLVisit)initWithCoder:(id)a3
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
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;

  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    v24 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, (uint64_t)self, CFSTR("CLVisit.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[decoder allowsKeyedCoding]"));
  }
  objc_msgSend_decodeDoubleForKey_(a3, v7, (uint64_t)CFSTR("kCLVisitCodingKeyLatitude"), v9);
  objc_msgSend_decodeDoubleForKey_(a3, v10, (uint64_t)CFSTR("kCLVisitCodingKeyLongitude"), v11);
  objc_msgSend_decodeDoubleForKey_(a3, v12, (uint64_t)CFSTR("kCLVisitCodingKeyHorizontalAccuracy"), v13);
  v14 = objc_opt_class();
  v16 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v15, v14, (uint64_t)CFSTR("kCLVisitCodingKeyArrivalDate"));
  v17 = objc_opt_class();
  v19 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v18, v17, (uint64_t)CFSTR("kCLVisitCodingKeyDepartureDate"));
  v20 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(a3, v21, v20, (uint64_t)CFSTR("kCLVisitCodingKeyDetectionDate"));
  v22 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(a3, v23, v22, (uint64_t)CFSTR("kCLVisitCodingKeyPlaceInference"));
  return (CLVisit *)MEMORY[0x1E0DE7D20](self, sel_initWithCoordinate_horizontalAccuracy_arrivalDate_departureDate_detectionDate_placeInference_, v16, v19);
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
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  const char *v44;

  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    v43 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v43, v44, (uint64_t)a2, (uint64_t)self, CFSTR("CLVisit.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[encoder allowsKeyedCoding]"));
  }
  objc_msgSend_coordinate(self, v7, v8, v9);
  objc_msgSend_encodeDouble_forKey_(a3, v10, (uint64_t)CFSTR("kCLVisitCodingKeyLatitude"), v11);
  objc_msgSend_coordinate(self, v12, v13, v14);
  objc_msgSend_encodeDouble_forKey_(a3, v15, (uint64_t)CFSTR("kCLVisitCodingKeyLongitude"), v16, v17);
  objc_msgSend_horizontalAccuracy(self, v18, v19, v20);
  objc_msgSend_encodeDouble_forKey_(a3, v21, (uint64_t)CFSTR("kCLVisitCodingKeyHorizontalAccuracy"), v22);
  v26 = objc_msgSend_arrivalDate(self, v23, v24, v25);
  objc_msgSend_encodeObject_forKey_(a3, v27, v26, (uint64_t)CFSTR("kCLVisitCodingKeyArrivalDate"));
  v31 = objc_msgSend_departureDate(self, v28, v29, v30);
  objc_msgSend_encodeObject_forKey_(a3, v32, v31, (uint64_t)CFSTR("kCLVisitCodingKeyDepartureDate"));
  v36 = objc_msgSend_detectionDate(self, v33, v34, v35);
  objc_msgSend_encodeObject_forKey_(a3, v37, v36, (uint64_t)CFSTR("kCLVisitCodingKeyDetectionDate"));
  v41 = objc_msgSend__placeInference(self, v38, v39, v40);
  objc_msgSend_encodeObject_forKey_(a3, v42, v41, (uint64_t)CFSTR("kCLVisitCodingKeyPlaceInference"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
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
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;

  v5 = objc_msgSend_allocWithZone_(CLVisit, a2, (uint64_t)a3, v3);
  objc_msgSend_coordinate(self, v6, v7, v8);
  objc_msgSend_horizontalAccuracy(self, v9, v10, v11);
  v15 = objc_msgSend_arrivalDate(self, v12, v13, v14);
  v19 = objc_msgSend_departureDate(self, v16, v17, v18);
  objc_msgSend_detectionDate(self, v20, v21, v22);
  objc_msgSend__placeInference(self, v23, v24, v25);
  return (id)MEMORY[0x1E0DE7D20](v5, sel_initWithCoordinate_horizontalAccuracy_arrivalDate_departureDate_detectionDate_placeInference_, v15, v19);
}

- (CLVisit)initWithCoordinate:(CLLocationCoordinate2D)a3 horizontalAccuracy:(double)a4 arrivalDate:(id)a5 departureDate:(id)a6 detectionDate:(id)a7 placeInference:(id)a8
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  CLVisit *v18;
  objc_super v20;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v20.receiver = self;
  v20.super_class = (Class)CLVisit;
  v18 = -[CLVisit init](&v20, sel_init);
  if (v18)
  {
    if (a6)
    {
      if (a5)
      {
LABEL_4:
        v18->_coordinate.latitude = latitude;
        v18->_coordinate.longitude = longitude;
        v18->_horizontalAccuracy = a4;
        v18->_arrivalDate = (NSDate *)a5;
        v18->_departureDate = (NSDate *)a6;
        v18->_detectionDate = (NSDate *)a7;
        v18->__placeInference = (_CLPlaceInference *)a8;
        return v18;
      }
    }
    else
    {
      a6 = (id)objc_msgSend_distantFuture(MEMORY[0x1E0C99D68], v15, v16, v17);
      if (a5)
        goto LABEL_4;
    }
    a5 = (id)objc_msgSend_distantPast(MEMORY[0x1E0C99D68], v15, v16, v17);
    goto LABEL_4;
  }
  return v18;
}

- (CLVisit)initWithCoordinate:(CLLocationCoordinate2D)a3 horizontalAccuracy:(double)a4 arrivalDate:(id)a5 departureDate:(id)a6 detectionDate:(id)a7
{
  return (CLVisit *)MEMORY[0x1E0DE7D20](self, sel_initWithCoordinate_horizontalAccuracy_arrivalDate_departureDate_detectionDate_placeInference_, a5, a6);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLVisit;
  -[CLVisit dealloc](&v3, sel_dealloc);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;

  if (objc_msgSend_hasArrivalDate(self, a2, v2, v3))
  {
    v8 = (void *)objc_msgSend_arrivalDate(self, v5, v6, v7);
    v12 = (const __CFString *)objc_msgSend_description(v8, v9, v10, v11);
  }
  else
  {
    v12 = CFSTR("-");
  }
  if (objc_msgSend_hasDepartureDate(self, v5, v6, v7))
  {
    v16 = (void *)objc_msgSend_departureDate(self, v13, v14, v15);
    v20 = (const __CFString *)objc_msgSend_description(v16, v17, v18, v19);
  }
  else
  {
    v20 = CFSTR("-");
  }
  v21 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_coordinate(self, v13, v14, v15);
  v23 = v22;
  objc_msgSend_coordinate(self, v24, v25, v26);
  v28 = v27;
  objc_msgSend_horizontalAccuracy(self, v29, v30, v31);
  v33 = v32;
  v37 = objc_msgSend__placeInference(self, v34, v35, v36);
  return (id)objc_msgSend_stringWithFormat_(v21, v38, (uint64_t)CFSTR("<%+.8f,%+.8f> +/- %.2fm (%@ to %@) %@"), v39, v23, v28, v33, v12, v20, v37);
}

- (BOOL)hasArrivalDate
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  v4 = (void *)objc_msgSend_arrivalDate(self, a2, v2, v3);
  v8 = objc_msgSend_distantPast(MEMORY[0x1E0C99D68], v5, v6, v7);
  return objc_msgSend_isEqual_(v4, v9, v8, v10) ^ 1;
}

- (BOOL)hasDepartureDate
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  v4 = (void *)objc_msgSend_departureDate(self, a2, v2, v3);
  v8 = objc_msgSend_distantFuture(MEMORY[0x1E0C99D68], v5, v6, v7);
  return objc_msgSend_isEqual_(v4, v9, v8, v10) ^ 1;
}

- (NSDate)arrivalDate
{
  return self->_arrivalDate;
}

- (NSDate)departureDate
{
  return self->_departureDate;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (CLLocationAccuracy)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (NSDate)detectionDate
{
  return self->_detectionDate;
}

- (_CLPlaceInference)_placeInference
{
  return self->__placeInference;
}

@end
