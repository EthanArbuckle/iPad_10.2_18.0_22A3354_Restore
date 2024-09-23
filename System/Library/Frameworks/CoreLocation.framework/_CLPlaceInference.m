@implementation _CLPlaceInference

- (id)_initWithRTPlaceInference:(id)a3
{
  CLLocation *v5;
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
  id v16;
  CLLocation *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  id v24;
  CLPlacemark *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;

  v5 = [CLLocation alloc];
  v9 = (void *)objc_msgSend_mapItem(a3, v6, v7, v8);
  v13 = objc_msgSend_location(v9, v10, v11, v12);
  v16 = (id)objc_msgSend__initWithRTLocation_(v5, v14, v13, v15);
  v17 = [CLLocation alloc];
  v21 = objc_msgSend_referenceLocation(a3, v18, v19, v20);
  v24 = (id)objc_msgSend__initWithRTLocation_(v17, v22, v21, v23);
  v25 = [CLPlacemark alloc];
  v29 = objc_msgSend_mapItem(a3, v26, v27, v28);
  v31 = (id)objc_msgSend__initWithRTMapItem_location_(v25, v30, v29, (uint64_t)v16);
  v35 = objc_msgSend_userType(a3, v32, v33, v34);
  v38 = objc_msgSend__userSpecificPlaceTypeFromRTUserType_(_CLPlaceInference, v36, v35, v37);
  v42 = objc_msgSend_placeType(a3, v39, v40, v41);
  v45 = objc_msgSend__placeInferencePlaceTypeFromRTPlaceType_(_CLPlaceInference, v43, v42, v44);
  objc_msgSend_confidence(a3, v46, v47, v48);
  v50 = v49;
  v54 = objc_msgSend_preferredName(a3, v51, v52, v53);
  v58 = objc_msgSend_loiIdentifier(a3, v55, v56, v57);
  return (id)objc_msgSend_initWithUserType_placeType_placemark_referenceLocation_confidence_preferredName_loiIdentifier_(self, v59, v38, v45, v31, v24, v54, v58, v50);
}

+ (unint64_t)_userSpecificPlaceTypeFromRTUserType:(unint64_t)a3
{
  NSObject *v3;
  char *v5;
  uint8_t buf[1640];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a3 >= 5)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990230);
    v3 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_FAULT, "Please update userSpecificPlaceTypeFromRTUserType", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990230);
      v5 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "+[_CLPlaceInference(_CLRoutineExtensions) _userSpecificPlaceTypeFromRTUserType:]", "CoreLocation: %s\n", v5);
      if (v5 != (char *)buf)
        free(v5);
    }
    return 0;
  }
  return a3;
}

+ (unint64_t)_placeInferencePlaceTypeFromRTPlaceType:(unint64_t)a3
{
  NSObject *v4;
  char *v5;
  uint8_t buf[1640];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a3 < 5)
    return qword_18F772000[a3];
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990230);
  v4 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v4, OS_LOG_TYPE_FAULT, "Please update placeInferencePlaceTypeFromRTPlaceType", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990230);
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "+[_CLPlaceInference(_CLRoutineExtensions) _placeInferencePlaceTypeFromRTPlaceType:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf)
      free(v5);
  }
  return 2;
}

- (_CLPlaceInference)initWithUserType:(unint64_t)a3 placeType:(unint64_t)a4 placemark:(id)a5 referenceLocation:(id)a6 confidence:(double)a7 preferredName:(id)a8 loiIdentifier:(id)a9
{
  _CLPlaceInference *v16;
  _CLPlaceInference *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_CLPlaceInference;
  v16 = -[_CLPlaceInference init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_userType = a3;
    v16->_placeType = a4;
    v16->_placemark = (CLPlacemark *)a5;
    v17->_referenceLocation = (CLLocation *)a6;
    v17->_confidence = a7;
    v17->_preferredName = (NSString *)a8;
    v17->__loiIdentifier = (NSUUID *)a9;
  }
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CLPlaceInference;
  -[_CLPlaceInference dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CLPlaceInference)initWithCoder:(id)a3
{
  uint64_t v3;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  double v32;
  double v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  void *v42;
  const char *v43;

  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    v42 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v43, (uint64_t)a2, (uint64_t)self, CFSTR("CLPlaceInference.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[decoder allowsKeyedCoding]"));
  }
  v10 = objc_opt_class();
  v12 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v11, v10, (uint64_t)CFSTR("kCLPlaceInferenceUserType"));
  v16 = objc_msgSend_unsignedIntegerValue(v12, v13, v14, v15);
  v17 = objc_opt_class();
  v19 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v18, v17, (uint64_t)CFSTR("kCLPlaceInferencePlaceType"));
  v23 = objc_msgSend_unsignedIntegerValue(v19, v20, v21, v22);
  v24 = objc_opt_class();
  v26 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v25, v24, (uint64_t)CFSTR("kCLPlaceInferencePlacemark"));
  v27 = objc_opt_class();
  v29 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v28, v27, (uint64_t)CFSTR("kCLPlaceInferenceReferenceLocation"));
  objc_msgSend_decodeDoubleForKey_(a3, v30, (uint64_t)CFSTR("kCLPlaceInferenceConfidence"), v31);
  v33 = v32;
  v34 = objc_opt_class();
  v36 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v35, v34, (uint64_t)CFSTR("kCLPlaceInferencePreferredName"));
  v37 = objc_opt_class();
  v39 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v38, v37, (uint64_t)CFSTR("kCLPlaceInferenceLoiIdentifier"));
  return (_CLPlaceInference *)objc_msgSend_initWithUserType_placeType_placemark_referenceLocation_confidence_preferredName_loiIdentifier_(self, v40, v16, v23, v26, v29, v36, v39, v33);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  void *v22;
  const char *v23;

  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    v22 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, (uint64_t)self, CFSTR("CLPlaceInference.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[encoder allowsKeyedCoding]"));
  }
  v10 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v7, self->_userType, v9);
  objc_msgSend_encodeObject_forKey_(a3, v11, v10, (uint64_t)CFSTR("kCLPlaceInferenceUserType"));
  v14 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v12, self->_placeType, v13);
  objc_msgSend_encodeObject_forKey_(a3, v15, v14, (uint64_t)CFSTR("kCLPlaceInferencePlaceType"));
  objc_msgSend_encodeObject_forKey_(a3, v16, (uint64_t)self->_placemark, (uint64_t)CFSTR("kCLPlaceInferencePlacemark"));
  objc_msgSend_encodeObject_forKey_(a3, v17, (uint64_t)self->_referenceLocation, (uint64_t)CFSTR("kCLPlaceInferenceReferenceLocation"));
  objc_msgSend_encodeDouble_forKey_(a3, v18, (uint64_t)CFSTR("kCLPlaceInferenceConfidence"), v19, self->_confidence);
  objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)self->_preferredName, (uint64_t)CFSTR("kCLPlaceInferencePreferredName"));
  objc_msgSend_encodeObject_forKey_(a3, v21, (uint64_t)self->__loiIdentifier, (uint64_t)CFSTR("kCLPlaceInferenceLoiIdentifier"));
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
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
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (void *)objc_msgSend_referenceLocation(self, a2, v2, v3);
  objc_msgSend_coordinate(v6, v7, v8, v9);
  v11 = v10;
  v15 = (void *)objc_msgSend_referenceLocation(self, v12, v13, v14);
  objc_msgSend_coordinate(v15, v16, v17, v18);
  v20 = v19;
  v24 = (void *)objc_msgSend_referenceLocation(self, v21, v22, v23);
  objc_msgSend_horizontalAccuracy(v24, v25, v26, v27);
  v29 = v28;
  v33 = objc_msgSend_userType(self, v30, v31, v32);
  v37 = objc_msgSend_placeType(self, v34, v35, v36);
  v41 = objc_msgSend_placemark(self, v38, v39, v40);
  v45 = objc_msgSend_preferredName(self, v42, v43, v44);
  objc_msgSend_confidence(self, v46, v47, v48);
  v50 = v49;
  v54 = objc_msgSend__loiIdentifier(self, v51, v52, v53);
  return (id)objc_msgSend_stringWithFormat_(v5, v55, (uint64_t)CFSTR("CLPlaceInference, ref, <%f,%f> +/- %f, userType, %lu, placeType, %lu, placemark, %@, preferredName, %@, confidence, %f, related loi identifier, %@"), v56, v11, v20, v29, v33, v37, v41, v45, v50, v54);
}

- (unint64_t)userType
{
  return self->_userType;
}

- (unint64_t)placeType
{
  return self->_placeType;
}

- (CLPlacemark)placemark
{
  return self->_placemark;
}

- (CLLocation)referenceLocation
{
  return self->_referenceLocation;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSString)preferredName
{
  return self->_preferredName;
}

- (NSUUID)_loiIdentifier
{
  return self->__loiIdentifier;
}

@end
