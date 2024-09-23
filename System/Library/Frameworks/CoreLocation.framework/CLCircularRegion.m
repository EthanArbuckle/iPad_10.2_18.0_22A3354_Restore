@implementation CLCircularRegion

- (void)setReferenceFrame:(int)a3
{
  self->_geoReferenceFrame = a3;
}

- (CLCircularRegion)initWithCenter:(CLLocationCoordinate2D)center radius:(CLLocationDistance)radius identifier:(NSString *)identifier
{
  int v6;

  BYTE2(v6) = 0;
  LOWORD(v6) = 1;
  return (CLCircularRegion *)objc_msgSend_initWithCenter_radius_referenceFrame_allowMonitoringWhenNearby_lowPower_identifier_onBehalfOfBundleId_notifyOnEntry_notifyOnExit_conservativeEntry_emergency_(self, a2, 0, 0, 0, identifier, 0, 1, center.latitude, center.longitude, radius, v6);
}

- (CLCircularRegion)initWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 referenceFrame:(int)a5 allowMonitoringWhenNearby:(BOOL)a6 lowPower:(BOOL)a7 identifier:(id)a8 onBehalfOfBundleId:(id)a9 notifyOnEntry:(BOOL)a10 notifyOnExit:(BOOL)a11 conservativeEntry:(BOOL)a12 emergency:(BOOL)a13
{
  int v14;

  *(_WORD *)((char *)&v14 + 1) = __PAIR16__(a13, a12);
  LOBYTE(v14) = a11;
  return (CLCircularRegion *)objc_msgSend_initWithCenter_radius_referenceFrame_allowMonitoringWhenNearby_lowPower_identifier_onBehalfOfBundleId_notifyOnEntry_notifyOnExit_conservativeEntry_emergency_deviceId_handoffTag_(self, a2, 0, a6, a7, a8, a9, a10, a3.latitude, a3.longitude, a4, v14, 0, 0);
}

- (CLCircularRegion)initWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 referenceFrame:(int)a5 allowMonitoringWhenNearby:(BOOL)a6 lowPower:(BOOL)a7 identifier:(id)a8 onBehalfOfBundleId:(id)a9 notifyOnEntry:(BOOL)a10 notifyOnExit:(BOOL)a11 conservativeEntry:(BOOL)a12 emergency:(BOOL)a13 deviceId:(id)a14 handoffTag:(id)a15
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  CLCircularRegion *result;
  objc_super v23;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v23.receiver = self;
  v23.super_class = (Class)CLCircularRegion;
  result = -[CLRegion initWithIdentifier:onBehalfOf:regionType:notifyOnEntry:notifyOnExit:conservativeEntry:emergency:deviceId:handoffTag:](&v23, sel_initWithIdentifier_onBehalfOf_regionType_notifyOnEntry_notifyOnExit_conservativeEntry_emergency_deviceId_handoffTag_, a8, a9, 1, a10, a11, a12, a13, a14, a15);
  if (result)
  {
    result->_geoCenter.latitude = latitude;
    result->_geoCenter.longitude = longitude;
    result->_geoRadius = a4;
    result->_isLowPower = a7;
    result->_desiredAccuracy = -1.0;
    result->_geoReferenceFrame = a5;
    result->_allowMonitoringWhileNearby = a6;
  }
  return result;
}

- (CLCircularRegion)initWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 identifier:(id)a5 onBehalfOfBundleId:(id)a6
{
  int v7;

  BYTE2(v7) = 0;
  LOWORD(v7) = 1;
  return (CLCircularRegion *)objc_msgSend_initWithCenter_radius_referenceFrame_allowMonitoringWhenNearby_lowPower_identifier_onBehalfOfBundleId_notifyOnEntry_notifyOnExit_conservativeEntry_emergency_(self, a2, 0, 0, 0, a5, a6, 1, a3.latitude, a3.longitude, a4, v7);
}

- (CLCircularRegion)initWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 identifier:(id)a5 nearbyAllowed:(BOOL)a6
{
  CLCircularRegion *result;

  result = (CLCircularRegion *)objc_msgSend_initWithCenter_radius_identifier_(self, a2, (uint64_t)a5, a6, a3.latitude, a3.longitude, a4);
  if (result)
    result->_allowMonitoringWhileNearby = a6;
  return result;
}

- (id)initNearbyAllowedWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 identifier:(id)a5
{
  int v6;

  BYTE2(v6) = 0;
  LOWORD(v6) = 1;
  return (id)objc_msgSend_initWithCenter_radius_referenceFrame_allowMonitoringWhenNearby_lowPower_identifier_onBehalfOfBundleId_notifyOnEntry_notifyOnExit_conservativeEntry_emergency_(self, a2, 0, 1, 0, a5, 0, 1, a3.latitude, a3.longitude, a4, v6);
}

- (id)initForLowPowerWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 identifier:(id)a5
{
  int v6;

  BYTE2(v6) = 0;
  LOWORD(v6) = 1;
  return (id)objc_msgSend_initWithCenter_radius_referenceFrame_allowMonitoringWhenNearby_lowPower_identifier_onBehalfOfBundleId_notifyOnEntry_notifyOnExit_conservativeEntry_emergency_(self, a2, 0, 0, 1, a5, 0, 1, a3.latitude, a3.longitude, a4, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLCircularRegion)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  int v36;
  __int16 v37;
  int v38;
  uint64_t v39;
  __int128 v40;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)CLCircularRegion;
  v7 = -[CLRegion initWithCoder:](&v41, sel_initWithCoder_);
  if (v7)
  {
    v40 = 0uLL;
    v39 = 0;
    v38 = 0;
    v37 = 0;
    v36 = 0;
    if ((objc_msgSend_allowsKeyedCoding(a3, v4, v5, v6) & 1) != 0)
    {
      objc_msgSend_decodeDoubleForKey_(a3, v8, (uint64_t)CFSTR("kCLCircularRegionCodingKeyCenterLatitude"), v9);
      *(_QWORD *)&v40 = v10;
      objc_msgSend_decodeDoubleForKey_(a3, v11, (uint64_t)CFSTR("kCLCircularRegionCodingKeyCenterLongitude"), v12);
      *((_QWORD *)&v40 + 1) = v13;
      objc_msgSend_decodeDoubleForKey_(a3, v14, (uint64_t)CFSTR("kCLCircularRegionCodingKeyRadius"), v15);
      v39 = v16;
      if (objc_msgSend_containsValueForKey_(a3, v17, (uint64_t)CFSTR("reserved"), v18))
        v38 = objc_msgSend_decodeIntForKey_(a3, v19, (uint64_t)CFSTR("reserved"), v20);
      if (objc_msgSend_containsValueForKey_(a3, v19, (uint64_t)CFSTR("kCLCircularRegionCodingKeyMonitoringNearby"), v20))HIBYTE(v37) = objc_msgSend_decodeBoolForKey_(a3, v21, (uint64_t)CFSTR("kCLCircularRegionCodingKeyMonitoringNearby"), v22);
      if (objc_msgSend_containsValueForKey_(a3, v21, (uint64_t)CFSTR("kCLCircularRegionCodingKeyLowPower"), v22))LOBYTE(v37) = objc_msgSend_decodeBoolForKey_(a3, v23, (uint64_t)CFSTR("kCLCircularRegionCodingKeyLowPower"), v24);
      if (_os_feature_enabled_impl()
        && objc_msgSend_containsValueForKey_(a3, v25, (uint64_t)CFSTR("kCLCircularRegionEncodedKeyVersion"), v26))
      {
        objc_msgSend_decodeIntForKey_(a3, v27, (uint64_t)CFSTR("kCLCircularRegionEncodedKeyVersion"), v28);
      }
    }
    else
    {
      objc_msgSend_decodeValueOfObjCType_at_(a3, v8, (uint64_t)"d", (uint64_t)&v40);
      objc_msgSend_decodeValueOfObjCType_at_(a3, v29, (uint64_t)"d", (uint64_t)&v40 + 8);
      objc_msgSend_decodeValueOfObjCType_at_(a3, v30, (uint64_t)"d", (uint64_t)&v39);
      objc_msgSend_decodeValueOfObjCType_at_(a3, v31, (uint64_t)"i", (uint64_t)&v38);
      objc_msgSend_decodeValueOfObjCType_at_(a3, v32, (uint64_t)"B", (uint64_t)&v37 + 1);
      objc_msgSend_decodeValueOfObjCType_at_(a3, v33, (uint64_t)"B", (uint64_t)&v37);
      if (_os_feature_enabled_impl())
        objc_msgSend_decodeValueOfObjCType_at_(a3, v34, (uint64_t)"i", (uint64_t)&v36);
    }
    *(_OWORD *)(v7 + 104) = v40;
    *((_QWORD *)v7 + 11) = v39;
    *((_DWORD *)v7 + 21) = v38;
    *((_WORD *)v7 + 40) = v37;
    *((_QWORD *)v7 + 12) = 0xBFF0000000000000;
  }
  return (CLCircularRegion *)v7;
}

- (id)initLegacyObjectWithCoder:(id)a3
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
  id v20;
  const char *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  int v28;
  const char *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  int v44;
  int v45;
  int v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  int v56;
  unsigned int v57;
  double v58;
  double v59;
  double v60;
  __int16 v61;
  unsigned __int8 v62;
  unsigned __int8 v63;

  v63 = 1;
  v62 = 1;
  v61 = 0;
  v59 = 0.0;
  v60 = 0.0;
  v58 = 0.0;
  v57 = 0;
  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) != 0)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v6, (uint64_t)CFSTR("kCLRegionCodingKeyCenterLatitude"), v7);
    v9 = v8;
    v59 = v8;
    objc_msgSend_decodeDoubleForKey_(a3, v10, (uint64_t)CFSTR("kCLRegionCodingKeyCenterLongitude"), v11);
    v13 = v12;
    v60 = v12;
    objc_msgSend_decodeDoubleForKey_(a3, v14, (uint64_t)CFSTR("kCLRegionCodingKeyRadius"), v15);
    v17 = v16;
    v58 = v16;
    v20 = (id)objc_msgSend_decodeObjectForKey_(a3, v18, (uint64_t)CFSTR("kCLRegionCodingKeyIdentifier"), v19);
    v23 = (id)objc_msgSend_decodeObjectForKey_(a3, v21, (uint64_t)CFSTR("kCLRegionCodingKeyOnBehalfOfBundleId"), v22);
    if (objc_msgSend_containsValueForKey_(a3, v24, (uint64_t)CFSTR("kCLRegionCodingKeyNotifyOnEntry"), v25))
    {
      v28 = objc_msgSend_decodeBoolForKey_(a3, v26, (uint64_t)CFSTR("kCLRegionCodingKeyNotifyOnEntry"), v27);
      v63 = v28;
    }
    else
    {
      v28 = 1;
    }
    if (objc_msgSend_containsValueForKey_(a3, v26, (uint64_t)CFSTR("kCLRegionCodingKeyNotifyOnExit"), v27))
    {
      v44 = objc_msgSend_decodeBoolForKey_(a3, v47, (uint64_t)CFSTR("kCLRegionCodingKeyNotifyOnExit"), v48);
      v62 = v44;
    }
    else
    {
      v44 = 1;
    }
    if (objc_msgSend_containsValueForKey_(a3, v47, (uint64_t)CFSTR("kCLRegionCodingKeyConservativeEntry"), v48))
    {
      v45 = objc_msgSend_decodeBoolForKey_(a3, v49, (uint64_t)CFSTR("kCLRegionCodingKeyConservativeEntry"), v50);
      HIBYTE(v61) = v45;
    }
    else
    {
      v45 = 0;
    }
    if (objc_msgSend_containsValueForKey_(a3, v49, (uint64_t)CFSTR("reserved"), v50))
    {
      v43 = objc_msgSend_decodeIntForKey_(a3, v51, (uint64_t)CFSTR("reserved"), v52);
      v57 = v43;
    }
    else
    {
      v43 = 0;
    }
    v46 = objc_msgSend_containsValueForKey_(a3, v51, (uint64_t)CFSTR("kCLRegionCodingKeyEmergency"), v52);
    if (v46)
    {
      LOBYTE(v46) = objc_msgSend_decodeBoolForKey_(a3, v42, (uint64_t)CFSTR("kCLRegionCodingKeyEmergency"), v53);
      LOBYTE(v61) = v46;
    }
  }
  else
  {
    objc_msgSend_decodeValueOfObjCType_at_(a3, v6, (uint64_t)"d", (uint64_t)&v59);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v29, (uint64_t)"d", (uint64_t)&v60);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v30, (uint64_t)"d", (uint64_t)&v58);
    v20 = (id)objc_msgSend_decodeObject(a3, v31, v32, v33);
    v23 = (id)objc_msgSend_decodeObject(a3, v34, v35, v36);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v37, (uint64_t)"B", (uint64_t)&v63);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v38, (uint64_t)"B", (uint64_t)&v62);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v39, (uint64_t)"B", (uint64_t)&v61 + 1);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v40, (uint64_t)"i", (uint64_t)&v57);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v41, (uint64_t)"B", (uint64_t)&v61);
    v17 = v58;
    v9 = v59;
    v43 = v57;
    v28 = v63;
    v44 = v62;
    v45 = HIBYTE(v61);
    v13 = v60;
    LOBYTE(v46) = (_BYTE)v61 != 0;
  }
  BYTE2(v56) = v46;
  BYTE1(v56) = v45 != 0;
  LOBYTE(v56) = v44 != 0;
  v54 = (void *)objc_msgSend_initWithCenter_radius_referenceFrame_allowMonitoringWhenNearby_lowPower_identifier_onBehalfOfBundleId_notifyOnEntry_notifyOnExit_conservativeEntry_emergency_(self, v42, v43, 0, 0, v20, v23, v28 != 0, v9, v13, v17, v56);

  return v54;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
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
  double v19;
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
  uint64_t isLowPower;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  int v51;
  char v52;
  char v53;
  int v54;
  double v55;
  double v56;
  double v57;
  objc_super v58;

  v58.receiver = self;
  v58.super_class = (Class)CLCircularRegion;
  -[CLRegion encodeWithCoder:](&v58, sel_encodeWithCoder_);
  objc_msgSend_center(self, v5, v6, v7);
  v9 = v8;
  v56 = v8;
  objc_msgSend_center(self, v10, v11, v12);
  v14 = v13;
  v57 = v13;
  objc_msgSend_radius(self, v15, v16, v17);
  v19 = v18;
  v55 = v18;
  v23 = objc_msgSend_geoReferenceFrame(self, v20, v21, v22);
  v54 = v23;
  v27 = objc_msgSend_allowMonitoringWhileNearby(self, v24, v25, v26);
  v53 = v27;
  isLowPower = objc_msgSend_isLowPower(self, v28, v29, v30);
  v52 = isLowPower;
  v51 = 1;
  if ((objc_msgSend_allowsKeyedCoding(a3, v32, v33, v34) & 1) != 0)
  {
    objc_msgSend_encodeDouble_forKey_(a3, v35, (uint64_t)CFSTR("kCLCircularRegionCodingKeyCenterLatitude"), v36, v9);
    objc_msgSend_encodeDouble_forKey_(a3, v37, (uint64_t)CFSTR("kCLCircularRegionCodingKeyCenterLongitude"), v38, v14);
    objc_msgSend_encodeDouble_forKey_(a3, v39, (uint64_t)CFSTR("kCLCircularRegionCodingKeyRadius"), v40, v19);
    objc_msgSend_encodeInt_forKey_(a3, v41, v23, (uint64_t)CFSTR("reserved"));
    objc_msgSend_encodeBool_forKey_(a3, v42, v27, (uint64_t)CFSTR("kCLCircularRegionCodingKeyMonitoringNearby"));
    objc_msgSend_encodeBool_forKey_(a3, v43, isLowPower, (uint64_t)CFSTR("kCLCircularRegionCodingKeyLowPower"));
    if (_os_feature_enabled_impl())
      objc_msgSend_encodeInt_forKey_(a3, v44, 1, (uint64_t)CFSTR("kCLCircularRegionEncodedKeyVersion"));
  }
  else
  {
    objc_msgSend_encodeValueOfObjCType_at_(a3, v35, (uint64_t)"d", (uint64_t)&v56);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v45, (uint64_t)"d", (uint64_t)&v57);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v46, (uint64_t)"d", (uint64_t)&v55);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v47, (uint64_t)"i", (uint64_t)&v54);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v48, (uint64_t)"B", (uint64_t)&v53);
    objc_msgSend_encodeValueOfObjCType_at_(a3, v49, (uint64_t)"B", (uint64_t)&v52);
    if (_os_feature_enabled_impl())
      objc_msgSend_encodeValueOfObjCType_at_(a3, v50, (uint64_t)"i", (uint64_t)&v51);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
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
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)CLCircularRegion;
  v4 = -[CLRegion copyWithZone:](&v30, sel_copyWithZone_, a3);
  v8 = v4;
  if (v4)
  {
    v9 = v4 + 104;
    objc_msgSend_center(self, v5, v6, v7);
    *v9 = v10;
    v8[14] = v11;
    objc_msgSend_radius(self, v12, v13, v14);
    v8[11] = v15;
    objc_msgSend_desiredAccuracy(self, v16, v17, v18);
    v8[12] = v19;
    *((_DWORD *)v8 + 21) = objc_msgSend_geoReferenceFrame(self, v20, v21, v22);
    *((_BYTE *)v8 + 81) = objc_msgSend_allowMonitoringWhileNearby(self, v23, v24, v25);
    *((_BYTE *)v8 + 80) = objc_msgSend_isLowPower(self, v26, v27, v28);
  }
  return v8;
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
  const char *v20;
  uint64_t v21;
  uint64_t v22;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend_identifier(self, a2, v2, v3);
  objc_msgSend_center(self, v7, v8, v9);
  v11 = v10;
  objc_msgSend_center(self, v12, v13, v14);
  v16 = v15;
  objc_msgSend_radius(self, v17, v18, v19);
  return (id)objc_msgSend_stringWithFormat_(v5, v20, (uint64_t)CFSTR("CLCircularRegion (identifier:'%@', center:<%+.8f,%+.8f>, radius:%.2fm)"), v21, v6, v11, v16, v22);
}

- (unint64_t)hash
{
  unint64_t v3;
  NSString *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;
  objc_super v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLCircularRegion;
  v3 = -[CLRegion hash](&v11, sel_hash);
  v10.receiver = self;
  v10.super_class = (Class)CLCircularRegion;
  if (-[CLRegion onBehalfOfBundleId](&v10, sel_onBehalfOfBundleId))
  {
    v9.receiver = self;
    v9.super_class = (Class)CLCircularRegion;
    v4 = -[CLRegion onBehalfOfBundleId](&v9, sel_onBehalfOfBundleId);
    v3 ^= objc_msgSend_hash(v4, v5, v6, v7);
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLCircularRegion;
  return -[CLRegion isEqual:](&v4, sel_isEqual_, a3);
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

- (CLLocationCoordinate2D)center
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_geoCenter.latitude;
  longitude = self->_geoCenter.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (CLLocationDistance)radius
{
  return self->_geoRadius;
}

- (int)referenceFrame
{
  return self->_geoReferenceFrame;
}

- (CLLocationCoordinate2D)geoCenter
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_geoCenter.latitude;
  longitude = self->_geoCenter.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (double)geoRadius
{
  return self->_geoRadius;
}

- (int)geoReferenceFrame
{
  return self->_geoReferenceFrame;
}

- (void)setGeoReferenceFrame:(int)a3
{
  self->_geoReferenceFrame = a3;
}

- (BOOL)isLowPower
{
  return self->_isLowPower;
}

- (double)desiredAccuracy
{
  return self->_desiredAccuracy;
}

- (BOOL)allowMonitoringWhileNearby
{
  return self->_allowMonitoringWhileNearby;
}

@end
