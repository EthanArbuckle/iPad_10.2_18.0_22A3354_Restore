@implementation _CLSignificantRegion

- (_CLSignificantRegion)initWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 identifier:(id)a5
{
  return (_CLSignificantRegion *)MEMORY[0x1E0DE7D20](self, sel_initWithCenter_radius_identifier_onBehalfOfBundleId_referenceFrame_, a5, 0);
}

- (_CLSignificantRegion)initWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 identifier:(id)a5 onBehalfOfBundleId:(id)a6 referenceFrame:(int)a7
{
  __int16 v8;

  v8 = 0;
  return (_CLSignificantRegion *)objc_msgSend_initWithCenter_radius_referenceFrame_lowPower_identifier_onBehalfOfBundleId_notifyOnEntry_notifyOnExit_conservativeEntry_emergency_deviceId_handoffTag_(self, a2, *(uint64_t *)&a7, 0, a5, a6, 1, 1, a3.latitude, a3.longitude, a4, v8, 0, 0);
}

- (_CLSignificantRegion)initWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 referenceFrame:(int)a5 lowPower:(BOOL)a6 identifier:(id)a7 onBehalfOfBundleId:(id)a8 notifyOnEntry:(BOOL)a9 notifyOnExit:(BOOL)a10 conservativeEntry:(BOOL)a11 emergency:(BOOL)a12 deviceId:(id)a13 handoffTag:(id)a14
{
  NSObject *v14;
  NSObject *v15;
  _CLSignificantRegion *v16;
  _CLSignificantRegion *v18;
  const char *v19;
  uint64_t v20;
  char *v21;
  int v22;
  objc_super v23;
  __int16 v24;
  uint8_t buf[1640];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a6)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990BD0);
    v14 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v14, OS_LOG_TYPE_FAULT, "LowPower not supported for this object/platform", buf, 2u);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990BD0);
    v24 = 0;
LABEL_23:
    v21 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[_CLSignificantRegion initWithCenter:radius:referenceFrame:lowPower:identifier:onBehalfOfBundleId:notifyOnEntry:notifyOnExit:conservativeEntry:emergency:deviceId:handoffTag:]", "CoreLocation: %s\n", v21);
    if (v21 != (char *)buf)
      free(v21);
    return 0;
  }
  if (a11)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990BD0);
    v15 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v15, OS_LOG_TYPE_FAULT, "Conservative not supported for this object/platform", buf, 2u);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990BD0);
    v24 = 0;
    goto LABEL_23;
  }
  v23.receiver = self;
  v23.super_class = (Class)_CLSignificantRegion;
  BYTE2(v22) = a12;
  LOWORD(v22) = a10;
  v18 = -[CLCircularRegion initWithCenter:radius:referenceFrame:allowMonitoringWhenNearby:lowPower:identifier:onBehalfOfBundleId:notifyOnEntry:notifyOnExit:conservativeEntry:emergency:deviceId:handoffTag:](&v23, sel_initWithCenter_radius_referenceFrame_allowMonitoringWhenNearby_lowPower_identifier_onBehalfOfBundleId_notifyOnEntry_notifyOnExit_conservativeEntry_emergency_deviceId_handoffTag_, *(_QWORD *)&a5, 0, 0, a7, a8, a9, a3.latitude, a3.longitude, a4, v22, a13, a14);
  v16 = v18;
  if (v18)
    objc_msgSend_setType_(v18, v19, 3, v20);
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CLSignificantRegion)initWithCoder:(id)a3
{
  uint64_t v3;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _CLSignificantRegion *v10;
  const char *v11;
  uint64_t v12;
  _CLSignificantRegion *v13;
  void *v15;
  const char *v16;
  objc_super v17;

  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLSignificantRegion.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[decoder allowsKeyedCoding]"));
  }
  v17.receiver = self;
  v17.super_class = (Class)_CLSignificantRegion;
  v10 = -[CLCircularRegion initWithCoder:](&v17, sel_initWithCoder_, a3);
  v13 = v10;
  if (v10)
    objc_msgSend_setType_(v10, v11, 3, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  objc_super v17;

  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLSignificantRegion.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[encoder allowsKeyedCoding]"));
  }
  v17.receiver = self;
  v17.super_class = (Class)_CLSignificantRegion;
  -[CLCircularRegion encodeWithCoder:](&v17, sel_encodeWithCoder_, a3);
  v13 = objc_msgSend_type(self, v10, v11, v12);
  objc_msgSend_encodeInt_forKey_(a3, v14, v13, (uint64_t)CFSTR("kCLSignificantRegionCodingKeyType"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_CLSignificantRegion;
  v7 = -[CLCircularRegion copyWithZone:](&v12, sel_copyWithZone_, a3);
  if (v7)
  {
    v8 = objc_msgSend_type(self, v4, v5, v6);
    objc_msgSend_setType_(v7, v9, v8, v10);
  }
  return v7;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend_identifier(self, a2, v2, v3);
  objc_msgSend_geoCenter(self, v7, v8, v9);
  v11 = v10;
  objc_msgSend_geoCenter(self, v12, v13, v14);
  v16 = v15;
  objc_msgSend_geoRadius(self, v17, v18, v19);
  v21 = v20;
  v25 = objc_msgSend_geoReferenceFrame(self, v22, v23, v24);
  return (id)objc_msgSend_stringWithFormat_(v5, v26, (uint64_t)CFSTR("CLSignificantRegion (identifier:'%@', center:<%+.8f,%+.8f>, radius:%.2fm, frame:%d)"), v27, v6, v11, v16, v21, v25);
}

- (unint64_t)hash
{
  unint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_CLSignificantRegion;
  v3 = -[CLCircularRegion hash](&v8, sel_hash);
  return v3 ^ objc_msgSend_type(self, v4, v5, v6);
}

@end
