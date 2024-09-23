@implementation _CLPolygonalRegion

- (_CLPolygonalRegion)initWithVertices:(id)a3 identifier:(id)a4
{
  unint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *Object;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  double v46;
  NSObject *v47;
  _CLPolygonalRegion *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v54;
  char *v55;
  objc_super v56;
  int v57;
  unint64_t v58;
  __int16 v59;
  uint64_t v60;
  uint8_t buf[4];
  unint64_t v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = objc_msgSend_count(a3, a2, (uint64_t)a3, (uint64_t)a4);
    v11 = v7;
    if (v7 >= 0x66)
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E29909F0);
      v12 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349312;
        v62 = v11;
        v63 = 2050;
        v64 = 101;
        _os_log_impl(&dword_18F5B3000, v12, OS_LOG_TYPE_ERROR, "#polygon,number of vertices (%{public}lu) mustn't exceed %{public}lu", buf, 0x16u);
      }
      if (!sub_18F5C4AE0(115, 0))
        return 0;
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E29909F0);
      v57 = 134349312;
      v58 = v11;
      v59 = 2050;
      v60 = 101;
LABEL_43:
      v55 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[_CLPolygonalRegion initWithVertices:identifier:]", "CoreLocation: %s\n", v55);
      if (v55 != (char *)buf)
        free(v55);
      return 0;
    }
    if (v7 <= 3)
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E29909F0);
      v13 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349312;
        v62 = v11;
        v63 = 2050;
        v64 = 4;
        _os_log_impl(&dword_18F5B3000, v13, OS_LOG_TYPE_ERROR, "#polygon,number of vertices (%{public}lu) must be greater or equal than %{public}lu", buf, 0x16u);
      }
      if (!sub_18F5C4AE0(115, 0))
        return 0;
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E29909F0);
      v57 = 134349312;
      v58 = v11;
      v59 = 2050;
      v60 = 4;
      goto LABEL_43;
    }
    Object = (void *)objc_msgSend_lastObject(a3, v8, v9, v10);
    objc_msgSend_coordinate(Object, v15, v16, v17);
    v19 = v18;
    v23 = (void *)objc_msgSend_firstObject(a3, v20, v21, v22);
    objc_msgSend_coordinate(v23, v24, v25, v26);
    if (v19 != v30
      || (v31 = (void *)objc_msgSend_lastObject(a3, v27, v28, v29),
          objc_msgSend_coordinate(v31, v32, v33, v34),
          v36 = v35,
          v40 = (void *)objc_msgSend_firstObject(a3, v37, v38, v39),
          objc_msgSend_coordinate(v40, v41, v42, v43),
          v36 != v46))
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E29909F0);
      v47 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F5B3000, v47, OS_LOG_TYPE_ERROR, "#polygon,monitoring requires a valid connected polygon where first and last coordinates are the same", buf, 2u);
      }
      if (!sub_18F5C4AE0(115, 0))
        return 0;
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E29909F0);
      LOWORD(v57) = 0;
      goto LABEL_43;
    }
    v49 = (void *)objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v44, (uint64_t)a3, v45);
    if (v11 != objc_msgSend_count(v49, v50, v51, v52) + 1)
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E29909F0);
      v54 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F5B3000, v54, OS_LOG_TYPE_ERROR, "#polygon,All vertices, except for the first and last equals, have to be unique", buf, 2u);
      }
      if (!sub_18F5C4AE0(115, 0))
        return 0;
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E29909F0);
      LOWORD(v57) = 0;
      goto LABEL_43;
    }
  }
  v56.receiver = self;
  v56.super_class = (Class)_CLPolygonalRegion;
  v48 = -[CLRegion initWithIdentifier:andRegionType:](&v56, sel_initWithIdentifier_andRegionType_, a4, 2);
  if (v48)
  {
    v48->_vertices = (NSArray *)a3;
    v48->_allowMonitoringWhileNearby = 0;
  }
  return v48;
}

- (id)initNearbyAllowedWithVertices:(id)a3 identifier:(id)a4
{
  id result;

  result = (id)objc_msgSend_initWithVertices_identifier_(self, a2, (uint64_t)a3, (uint64_t)a4);
  if (result)
    *((_BYTE *)result + 80) = 1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_vertices = 0;
  v3.receiver = self;
  v3.super_class = (Class)_CLPolygonalRegion;
  -[CLRegion dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CLPolygonalRegion)initWithCoder:(id)a3
{
  uint64_t v3;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _CLPolygonalRegion *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  char v21;
  void *v23;
  const char *v24;
  objc_super v25;

  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    v23 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, (uint64_t)self, CFSTR("CLPolygonalRegion.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[decoder allowsKeyedCoding]"));
  }
  v25.receiver = self;
  v25.super_class = (Class)_CLPolygonalRegion;
  v10 = -[CLRegion initWithCoder:](&v25, sel_initWithCoder_, a3);
  if (v10)
  {
    v11 = objc_opt_class();
    v13 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCLPolygonalRegionCodingKeyVertices"));
    if (objc_msgSend_containsValueForKey_(a3, v14, (uint64_t)CFSTR("kCLPolygonalRegionCodingKeyReferenceFrame"), v15))v18 = objc_msgSend_decodeIntForKey_(a3, v16, (uint64_t)CFSTR("kCLPolygonalRegionCodingKeyReferenceFrame"), v17);
    else
      v18 = 0;
    if (objc_msgSend_containsValueForKey_(a3, v16, (uint64_t)CFSTR("kCLPolygonalRegionCodingKeyMonitoringNearby"), v17))v21 = objc_msgSend_decodeBoolForKey_(a3, v19, (uint64_t)CFSTR("kCLPolygonalRegionCodingKeyMonitoringNearby"), v20);
    else
      v21 = 0;
    objc_msgSend_setType_(v10, v19, 2, v20);
    v10->_vertices = (NSArray *)v13;
    v10->_allowMonitoringWhileNearby = v21;
    v10->_geoReferenceFrame = v18;
  }
  return v10;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  const char *v24;
  void *v25;
  const char *v26;
  objc_super v27;

  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    v25 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, (uint64_t)self, CFSTR("CLPolygonalRegion.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[encoder allowsKeyedCoding]"));
  }
  v27.receiver = self;
  v27.super_class = (Class)_CLPolygonalRegion;
  -[CLRegion encodeWithCoder:](&v27, sel_encodeWithCoder_, a3);
  v13 = objc_msgSend_vertices(self, v10, v11, v12);
  v17 = objc_msgSend_geoReferenceFrame(self, v14, v15, v16);
  v21 = objc_msgSend_allowMonitoringWhileNearby(self, v18, v19, v20);
  objc_msgSend_encodeObject_forKey_(a3, v22, v13, (uint64_t)CFSTR("kCLPolygonalRegionCodingKeyVertices"));
  objc_msgSend_encodeInt_forKey_(a3, v23, v17, (uint64_t)CFSTR("kCLPolygonalRegionCodingKeyReferenceFrame"));
  objc_msgSend_encodeBool_forKey_(a3, v24, v21, (uint64_t)CFSTR("kCLPolygonalRegionCodingKeyMonitoringNearby"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_CLPolygonalRegion;
  v7 = -[CLRegion copyWithZone:](&v19, sel_copyWithZone_, a3);
  if (v7)
  {
    v7[80] = objc_msgSend_allowMonitoringWhileNearby(self, v4, v5, v6);
    *((_DWORD *)v7 + 21) = objc_msgSend_geoReferenceFrame(self, v8, v9, v10);
    v14 = (void *)objc_msgSend_vertices(self, v11, v12, v13);
    *((_QWORD *)v7 + 11) = objc_msgSend_copy(v14, v15, v16, v17);
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
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend_identifier(self, a2, v2, v3);
  v10 = (void *)objc_msgSend_vertices(self, v7, v8, v9);
  v14 = objc_msgSend_count(v10, v11, v12, v13);
  return (id)objc_msgSend_stringWithFormat_(v5, v15, (uint64_t)CFSTR("_CLPolygonalRegion (identifier:'%@', count:'%lu')"), v16, v6, v14);
}

- (BOOL)containsCoordinate:(CLLocationCoordinate2D)a3
{
  return ((uint64_t (*)(_CLPolygonalRegion *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_pointInPolygonWithCoordinate_withDistanceToBorder_, 0);
}

- (BOOL)containsCoordinate:(CLLocationCoordinate2D)a3 withDistanceToBorder:(double *)a4
{
  return ((uint64_t (*)(_CLPolygonalRegion *, char *, double *))MEMORY[0x1E0DE7D20])(self, sel_pointInPolygonWithCoordinate_withDistanceToBorder_, a4);
}

- (BOOL)pointInPolygonWithCoordinate:(CLLocationCoordinate2D)a3 withDistanceToBorder:(double *)a4
{
  uint64_t v4;
  double latitude;
  double longitude;
  NSArray *vertices;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  int v26;
  unint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v42;
  BOOL v43;
  BOOL v44;
  _BOOL4 v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  long double v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  char *v55;
  NSObject *v56;
  uint64_t v57;
  char *v59;
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  int v63;
  uint64_t v64;

  latitude = a3.latitude;
  v64 = *MEMORY[0x1E0C80C00];
  if (a3.longitude < -180.0
    || (longitude = a3.longitude, a3.longitude > 180.0)
    || a3.latitude > 90.0
    || a3.latitude < -90.0)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E29909F0);
    v52 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v52, OS_LOG_TYPE_ERROR, "#polygon,#warning invalid coordinate", buf, 2u);
    }
    LOBYTE(v26) = 0;
    if (!sub_18F5C4AE0(115, 0))
      return v26 & 1;
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      goto LABEL_78;
    goto LABEL_64;
  }
  vertices = self->_vertices;
  if (!vertices)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E29909F0);
    v53 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v53, OS_LOG_TYPE_ERROR, "#polygon,#warning No points data found for polygon", buf, 2u);
    }
    LOBYTE(v26) = 0;
    if (!sub_18F5C4AE0(115, 0))
      return v26 & 1;
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      goto LABEL_78;
LABEL_64:
    v55 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[_CLPolygonalRegion pointInPolygonWithCoordinate:withDistanceToBorder:]", "CoreLocation: %s\n", v55);
    if (v55 != (char *)buf)
      free(v55);
    LOBYTE(v26) = 0;
    return v26 & 1;
  }
  if (!a4)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E29909F0);
    v54 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v54, OS_LOG_TYPE_ERROR, "#polygon,#warning distanceToBorder is nil", buf, 2u);
    }
    LOBYTE(v26) = 0;
    if (!sub_18F5C4AE0(115, 0))
      return v26 & 1;
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 == -1)
      goto LABEL_64;
LABEL_78:
    dispatch_once(&qword_1ECD8E758, &unk_1E29909F0);
    goto LABEL_64;
  }
  v10 = (void *)objc_msgSend_objectAtIndex_(vertices, a2, 0, v4);
  objc_msgSend_coordinate(v10, v11, v12, v13);
  v15 = v14;
  objc_msgSend_coordinate(v10, v16, v17, v18);
  v20 = v19;
  if ((unint64_t)objc_msgSend_count(self->_vertices, v21, v22, v23) >= 2)
  {
    v26 = 0;
    v27 = 1;
    while (1)
    {
      v28 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->_vertices, v24, v27, v25);
      objc_msgSend_coordinate(v28, v29, v30, v31);
      v33 = v32;
      objc_msgSend_coordinate(v28, v34, v35, v36);
      if (v33 != v15 || v40 != v20)
        break;
      v33 = v15;
      v42 = v20;
LABEL_42:
      ++v27;
      v20 = v42;
      v15 = v33;
      if (v27 >= objc_msgSend_count(self->_vertices, v37, v38, v39))
        goto LABEL_68;
    }
    v42 = v40;
    if ((latitude >= v15 || latitude <= v33) && (latitude <= v15 || latitude >= v33)
      || (v40 <= longitude ? (v43 = v20 <= longitude) : (v43 = 0), v43))
    {
      if (latitude != v15 || (latitude > v33 ? (v44 = v20 <= longitude) : (v44 = 1), v44))
      {
        v45 = latitude == v33;
        if (latitude <= v15)
          v45 = 0;
        if (v40 <= longitude)
          v45 = 0;
        v26 ^= v45;
        goto LABEL_35;
      }
    }
    else if (v20 + (v40 - v20) * ((latitude - v15) / (v33 - v15)) <= longitude)
    {
      goto LABEL_35;
    }
    v26 ^= 1u;
LABEL_35:
    v46 = v33 - v15;
    v47 = v40 - v20;
    v48 = ((longitude - v20) * (v42 - v20) + (latitude - v15) * (v33 - v15)) / (v47 * v47 + v46 * v46);
    if (v48 <= 0.0)
    {
      v49 = v15;
      v50 = v20;
    }
    else
    {
      v49 = v33;
      v50 = v42;
      if (v48 < 1.0)
      {
        v49 = v15 + v48 * v46;
        v50 = v20 + v48 * v47;
      }
    }
    v51 = sub_18F5BD12C(latitude, longitude, v49, v50);
    if (*a4 < 0.0 || v51 < *a4)
      *a4 = v51;
    goto LABEL_42;
  }
  LOBYTE(v26) = 0;
LABEL_68:
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E29909F0);
  v56 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
  {
    v57 = *(_QWORD *)a4;
    *(_DWORD *)buf = 134218240;
    v61 = v57;
    v62 = 1024;
    v63 = v26 & 1;
    _os_log_impl(&dword_18F5B3000, v56, OS_LOG_TYPE_DEBUG, "#polygon,distanceToBorder,%.3lf,inRegion %d", buf, 0x12u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E29909F0);
    v59 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[_CLPolygonalRegion pointInPolygonWithCoordinate:withDistanceToBorder:]", "CoreLocation: %s\n", v59);
    if (v59 != (char *)buf)
      free(v59);
  }
  return v26 & 1;
}

- (NSArray)vertices
{
  return self->_vertices;
}

- (int)geoReferenceFrame
{
  return self->_geoReferenceFrame;
}

- (void)setGeoReferenceFrame:(int)a3
{
  self->_geoReferenceFrame = a3;
}

- (BOOL)allowMonitoringWhileNearby
{
  return self->_allowMonitoringWhileNearby;
}

@end
