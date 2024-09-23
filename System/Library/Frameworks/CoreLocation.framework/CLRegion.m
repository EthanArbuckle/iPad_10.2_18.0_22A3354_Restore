@implementation CLRegion

- (void)dealloc
{
  objc_super v3;

  *(_OWORD *)&self->_identifier = 0u;
  *(_OWORD *)&self->_handoffTag = 0u;
  v3.receiver = self;
  v3.super_class = (Class)CLRegion;
  -[CLRegion dealloc](&v3, sel_dealloc);
}

- (CLRegion)initWithIdentifier:(id)a3 onBehalfOf:(id)a4 regionType:(int)a5 notifyOnEntry:(BOOL)a6 notifyOnExit:(BOOL)a7 conservativeEntry:(BOOL)a8 emergency:(BOOL)a9 deviceId:(id)a10 handoffTag:(id)a11
{
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  const char *v21;
  NSObject *v22;
  CLRegion *v23;
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
  objc_super v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E29906D0);
    v22 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      v39 = 0;
      v40 = 2082;
      v41 = "";
      _os_log_impl(&dword_18F5B3000, v22, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"identifier is nil\"}", buf, 0x12u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E29906D0);
    }
    v19 = qword_1ECD8E750;
    if (!os_signpost_enabled((os_log_t)qword_1ECD8E750))
      goto LABEL_20;
    *(_DWORD *)buf = 68289026;
    v39 = 0;
    v40 = 2082;
    v41 = "";
    v20 = "identifier is nil";
    v21 = "{\"msg%{public}.0s\":\"identifier is nil\"}";
LABEL_17:
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v20, v21, buf, 0x12u);
LABEL_20:

    return 0;
  }
  if ((unint64_t)objc_msgSend_lengthOfBytesUsingEncoding_(a3, a2, 4, (uint64_t)a4) >= 0x201)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E29906D0);
    v18 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      v39 = 0;
      v40 = 2082;
      v41 = "";
      _os_log_impl(&dword_18F5B3000, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"identifier is too long\"}", buf, 0x12u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E29906D0);
    }
    v19 = qword_1ECD8E750;
    if (!os_signpost_enabled((os_log_t)qword_1ECD8E750))
      goto LABEL_20;
    *(_DWORD *)buf = 68289026;
    v39 = 0;
    v40 = 2082;
    v41 = "";
    v20 = "identifier is too long";
    v21 = "{\"msg%{public}.0s\":\"identifier is too long\"}";
    goto LABEL_17;
  }
  if (a10 && !a11)
    goto LABEL_20;
  v37.receiver = self;
  v37.super_class = (Class)CLRegion;
  v23 = -[CLRegion init](&v37, sel_init);
  if (v23)
  {
    v23->_identifier = (NSString *)objc_msgSend_copy(a3, v25, v26, v27);
    v23->_notifyOnEntry = a6;
    v23->_notifyOnExit = a7;
    v23->_onBehalfOfBundleId = (NSString *)objc_msgSend_copy(a4, v28, v29, v30);
    v23->_type = a5;
    v23->_conservativeEntry = a8;
    v23->_emergency = a9;
    v23->_deviceId = (NSUUID *)objc_msgSend_copy(a10, v31, v32, v33);
    v23->_handoffTag = (NSString *)objc_msgSend_copy(a11, v34, v35, v36);
  }
  return v23;
}

- (CLRegion)initWithClientRegion:(id *)a3
{
  CLRegion *result;
  const char *v5;
  uint64_t v6;
  CLRegion *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  BOOL var7;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CLRegion;
  result = -[CLRegion init](&v14, sel_init);
  if (result)
  {
    v7 = result;
    v8 = objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v5, (uint64_t)a3, v6);
    v11 = objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v9, (uint64_t)a3->var1, v10);
    var7 = a3->var7;
    return (CLRegion *)objc_msgSend_initWithIdentifier_onBehalfOf_regionType_notifyOnEntry_notifyOnExit_conservativeEntry_emergency_(v7, v12, v8, v11, a3->var3, a3->var4, a3->var5, a3->var6, var7);
  }
  return result;
}

- (CLRegion)initCircularRegionWithCenter:(CLLocationCoordinate2D)center radius:(CLLocationDistance)radius identifier:(NSString *)identifier
{
  double longitude;
  double latitude;
  CLCircularRegion *v9;
  const char *v10;
  uint64_t v11;

  longitude = center.longitude;
  latitude = center.latitude;

  v9 = [CLCircularRegion alloc];
  return (CLRegion *)objc_msgSend_initWithCenter_radius_identifier_(v9, v10, (uint64_t)identifier, v11, latitude, longitude, radius);
}

- (CLRegion)initWithIdentifier:(id)a3
{
  CLRegion *result;
  const char *v5;
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLRegion;
  result = -[CLRegion init](&v7, sel_init);
  if (result)
  {
    v6 = 0;
    return (CLRegion *)objc_msgSend_initWithIdentifier_onBehalfOf_regionType_notifyOnEntry_notifyOnExit_conservativeEntry_emergency_(result, v5, (uint64_t)a3, 0, 1, 1, 1, 0, v6);
  }
  return result;
}

- (CLRegion)initWithIdentifier:(id)a3 andRegionType:(int)a4
{
  uint64_t v4;
  CLRegion *result;
  const char *v7;
  char v8;
  objc_super v9;

  v4 = *(_QWORD *)&a4;
  v9.receiver = self;
  v9.super_class = (Class)CLRegion;
  result = -[CLRegion init](&v9, sel_init);
  if (result)
  {
    v8 = 0;
    return (CLRegion *)objc_msgSend_initWithIdentifier_onBehalfOf_regionType_notifyOnEntry_notifyOnExit_conservativeEntry_emergency_(result, v7, (uint64_t)a3, 0, v4, 1, 1, 0, v8);
  }
  return result;
}

- (CLRegion)initWithIdentifier:(id)a3 onBehalfOf:(id)a4 regionType:(int)a5 notifyOnEntry:(BOOL)a6 notifyOnExit:(BOOL)a7 conservativeEntry:(BOOL)a8 emergency:(BOOL)a9
{
  return (CLRegion *)objc_msgSend_initWithIdentifier_onBehalfOf_regionType_notifyOnEntry_notifyOnExit_conservativeEntry_emergency_deviceId_handoffTag_(self, a2, (uint64_t)a3, (uint64_t)a4, *(_QWORD *)&a5, a6, a7, a8, a9, 0, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLRegion)initWithCoder:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CLCircularRegion *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  id v17;
  uint64_t v18;
  const char *v19;
  id v20;
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
  char v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  char v60;
  int v61;

  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(self, v6, v5, v7))
  {

    v11 = [CLCircularRegion alloc];
    return (CLRegion *)MEMORY[0x1E0DE7D20](v11, sel_initLegacyObjectWithCoder_, a3, v58);
  }
  else
  {
    v61 = 0;
    if ((objc_msgSend_allowsKeyedCoding(a3, v8, v9, v10) & 1) != 0)
    {
      v15 = objc_opt_class();
      v17 = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v16, v15, (uint64_t)CFSTR("kCLRegionCodingKeyIdentifier"));
      v18 = objc_opt_class();
      v20 = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v19, v18, (uint64_t)CFSTR("kCLRegionCodingKeyOnBehalfOfBundleId"));
      v23 = objc_msgSend_decodeBoolForKey_(a3, v21, (uint64_t)CFSTR("kCLRegionCodingKeyNotifyOnEntry"), v22);
      HIBYTE(v61) = v23;
      v26 = objc_msgSend_decodeBoolForKey_(a3, v24, (uint64_t)CFSTR("kCLRegionCodingKeyNotifyOnExit"), v25);
      BYTE2(v61) = v26;
      v29 = objc_msgSend_decodeBoolForKey_(a3, v27, (uint64_t)CFSTR("kCLRegionCodingKeyConservativeEntry"), v28);
      BYTE1(v61) = v29;
      v32 = objc_msgSend_decodeBoolForKey_(a3, v30, (uint64_t)CFSTR("kCLRegionCodingKeyEmergency"), v31);
      LOBYTE(v61) = v32;
      if (objc_msgSend_containsValueForKey_(a3, v33, (uint64_t)CFSTR("kCLRegionCodingKeyRegionType"), v34))
        v37 = objc_msgSend_decodeIntForKey_(a3, v35, (uint64_t)CFSTR("kCLRegionCodingKeyRegionType"), v36);
      else
        v37 = 1;
      v54 = objc_opt_class();
      v48 = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v55, v54, (uint64_t)CFSTR("kCLRegionCodingKeyDeviceId"));
      v56 = objc_opt_class();
      v52 = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v57, v56, (uint64_t)CFSTR("kCLRegionCodingKeyHandoffTag"));
    }
    else
    {
      v17 = (id)objc_msgSend_decodeObject(a3, v12, v13, v14);
      v20 = (id)objc_msgSend_decodeObject(a3, v38, v39, v40);
      objc_msgSend_decodeValueOfObjCType_at_(a3, v41, (uint64_t)"B", (uint64_t)&v61 + 3);
      objc_msgSend_decodeValueOfObjCType_at_(a3, v42, (uint64_t)"B", (uint64_t)&v61 + 2);
      objc_msgSend_decodeValueOfObjCType_at_(a3, v43, (uint64_t)"B", (uint64_t)&v61 + 1);
      objc_msgSend_decodeValueOfObjCType_at_(a3, v44, (uint64_t)"B", (uint64_t)&v61);
      v48 = (id)objc_msgSend_decodeObject(a3, v45, v46, v47);
      v52 = (id)objc_msgSend_decodeObject(a3, v49, v50, v51);
      v23 = HIBYTE(v61) != 0;
      v26 = BYTE2(v61) != 0;
      v29 = BYTE1(v61) != 0;
      v32 = v61 != 0;
      v37 = 1;
    }
    v60 = v32;
    return (CLRegion *)objc_msgSend_initWithIdentifier_onBehalfOf_regionType_notifyOnEntry_notifyOnExit_conservativeEntry_emergency_deviceId_handoffTag_(self, v53, (uint64_t)v17, (uint64_t)v20, v37, v23, v26, v29, v60, v48, v52);
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
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
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  const char *v35;
  uint64_t v36;
  NSString *identifier;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  const char *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  char v56;
  char v57;
  char v58;
  char v59;

  v6 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(self, v7, v6, v8))
  {
    v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, CFSTR("CLRegion.m"), 263, CFSTR("CLRegion is an abstract class. Use one of the derived classes"));
  }
  else
  {
    v14 = objc_msgSend_notifyOnEntry(self, v9, v10, v11);
    v59 = v14;
    v18 = objc_msgSend_notifyOnExit(self, v15, v16, v17);
    v58 = v18;
    v22 = objc_msgSend_conservativeEntry(self, v19, v20, v21);
    v57 = v22;
    v26 = objc_msgSend_emergency(self, v23, v24, v25);
    v56 = v26;
    v30 = objc_msgSend_type(self, v27, v28, v29);
    v34 = objc_msgSend_allowsKeyedCoding(a3, v31, v32, v33);
    identifier = self->_identifier;
    if ((v34 & 1) != 0)
    {
      objc_msgSend_encodeObject_forKey_(a3, v35, (uint64_t)identifier, (uint64_t)CFSTR("kCLRegionCodingKeyIdentifier"));
      objc_msgSend_encodeObject_forKey_(a3, v38, (uint64_t)self->_onBehalfOfBundleId, (uint64_t)CFSTR("kCLRegionCodingKeyOnBehalfOfBundleId"));
      objc_msgSend_encodeBool_forKey_(a3, v39, v14, (uint64_t)CFSTR("kCLRegionCodingKeyNotifyOnEntry"));
      objc_msgSend_encodeBool_forKey_(a3, v40, v18, (uint64_t)CFSTR("kCLRegionCodingKeyNotifyOnExit"));
      objc_msgSend_encodeBool_forKey_(a3, v41, v22, (uint64_t)CFSTR("kCLRegionCodingKeyConservativeEntry"));
      objc_msgSend_encodeBool_forKey_(a3, v42, v26, (uint64_t)CFSTR("kCLRegionCodingKeyEmergency"));
      objc_msgSend_encodeInt_forKey_(a3, v43, v30, (uint64_t)CFSTR("kCLRegionCodingKeyRegionType"));
      objc_msgSend_encodeObject_forKey_(a3, v44, (uint64_t)self->_deviceId, (uint64_t)CFSTR("kCLRegionCodingKeyDeviceId"));
      objc_msgSend_encodeObject_forKey_(a3, v45, (uint64_t)self->_handoffTag, (uint64_t)CFSTR("kCLRegionCodingKeyHandoffTag"));
    }
    else
    {
      objc_msgSend_encodeObject_(a3, v35, (uint64_t)identifier, v36);
      objc_msgSend_encodeObject_(a3, v46, (uint64_t)self->_onBehalfOfBundleId, v47);
      objc_msgSend_encodeValueOfObjCType_at_(a3, v48, (uint64_t)"B", (uint64_t)&v59);
      objc_msgSend_encodeValueOfObjCType_at_(a3, v49, (uint64_t)"B", (uint64_t)&v58);
      objc_msgSend_encodeValueOfObjCType_at_(a3, v50, (uint64_t)"B", (uint64_t)&v57);
      objc_msgSend_encodeValueOfObjCType_at_(a3, v51, (uint64_t)"B", (uint64_t)&v56);
      objc_msgSend_encodeObject_(a3, v52, (uint64_t)self->_deviceId, v53);
      objc_msgSend_encodeObject_(a3, v54, (uint64_t)self->_handoffTag, v55);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  BOOL emergency;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  emergency = self->_emergency;
  return (id)objc_msgSend_initWithIdentifier_onBehalfOf_regionType_notifyOnEntry_notifyOnExit_conservativeEntry_emergency_deviceId_handoffTag_(v8, v9, (uint64_t)self->_identifier, (uint64_t)self->_onBehalfOfBundleId, self->_type, self->_notifyOnEntry, self->_notifyOnExit, self->_conservativeEntry, emergency, self->_deviceId, self->_handoffTag);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  int isMemberOfClass;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  char isEqual;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;

  if (self == a3)
  {
    LOBYTE(isMemberOfClass) = 1;
  }
  else
  {
    v47 = v4;
    v48 = v3;
    v9 = objc_opt_class();
    if ((objc_msgSend_isMemberOfClass_(a3, v10, v9, v11) & 1) != 0
      || (v15 = objc_opt_class(), objc_msgSend_isMemberOfClass_(self, v16, v15, v17))
      && (v18 = objc_opt_class(), (objc_msgSend_isMemberOfClass_(a3, v19, v18, v20) & 1) != 0)
      || (v21 = objc_opt_class(), (isMemberOfClass = objc_msgSend_isMemberOfClass_(self, v22, v21, v23)) != 0)
      && (v25 = objc_opt_class(), (isMemberOfClass = objc_msgSend_isMemberOfClass_(a3, v26, v25, v27)) != 0))
    {
      if (objc_msgSend_onBehalfOfBundleId(self, v12, v13, v14, v6, v5, v47, v48)
        || objc_msgSend_onBehalfOfBundleId(a3, v28, v29, v30))
      {
        v31 = (void *)objc_msgSend_onBehalfOfBundleId(self, v28, v29, v30);
        v35 = objc_msgSend_onBehalfOfBundleId(a3, v32, v33, v34);
        isEqual = objc_msgSend_isEqual_(v31, v36, v35, v37);
      }
      else
      {
        isEqual = 1;
      }
      v39 = (void *)objc_msgSend_identifier(self, v28, v29, v30);
      v43 = objc_msgSend_identifier(a3, v40, v41, v42);
      LOBYTE(isMemberOfClass) = objc_msgSend_isEqualToString_(v39, v44, v43, v45) & isEqual;
    }
  }
  return isMemberOfClass;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_identifier(self, a2, v2, v3);
  return objc_msgSend_hash(v4, v5, v6, v7);
}

- (BOOL)containsCoordinate:(CLLocationCoordinate2D)coordinate
{
  uint64_t v3;
  uint64_t v4;
  double longitude;
  double latitude;
  double v8;
  double v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;

  longitude = coordinate.longitude;
  latitude = coordinate.latitude;
  objc_msgSend_center(self, a2, v3, v4);
  v9 = v8;
  objc_msgSend_center(self, v10, v11, v12);
  v14 = sub_18F5BD12C(latitude, longitude, v9, v13);
  objc_msgSend_radius(self, v15, v16, v17);
  return v14 <= v18;
}

- (id)description
{
  uint64_t v2;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("CLRegion (identifier:'%@')"), v2, self->_identifier);
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

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)notifyOnEntry
{
  return self->_notifyOnEntry;
}

- (void)setNotifyOnEntry:(BOOL)notifyOnEntry
{
  self->_notifyOnEntry = notifyOnEntry;
}

- (BOOL)notifyOnExit
{
  return self->_notifyOnExit;
}

- (void)setNotifyOnExit:(BOOL)notifyOnExit
{
  self->_notifyOnExit = notifyOnExit;
}

- (NSUUID)deviceId
{
  return self->_deviceId;
}

- (NSString)handoffTag
{
  return self->_handoffTag;
}

- (NSString)onBehalfOfBundleId
{
  return self->_onBehalfOfBundleId;
}

- (void)setOnBehalfOfBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)conservativeEntry
{
  return self->_conservativeEntry;
}

- (void)setConservativeEntry:(BOOL)a3
{
  self->_conservativeEntry = a3;
}

- (int)referenceFrame
{
  return self->_referenceFrame;
}

- (void)setReferenceFrame:(int)a3
{
  self->_referenceFrame = a3;
}

- (BOOL)emergency
{
  return self->_emergency;
}

- (void)setEmergency:(BOOL)a3
{
  self->_emergency = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

@end
