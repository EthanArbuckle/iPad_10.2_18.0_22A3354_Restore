@implementation CLLocationMatchInfo

- (CLLocationMatchInfo)initWithMatchQuality:(int64_t)a3 matchCoordinate:(CLLocationCoordinate2D)a4 matchCourse:(double)a5 matchFormOfWay:(int)a6 matchRoadClass:(int)a7 matchShifted:(BOOL)a8 matchDataArray:(id)a9
{
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  double longitude;
  double latitude;
  CLLocationMatchInfo *v17;
  CLLocationMatchInfoInternal *v18;
  const char *v19;
  objc_super v21;

  v10 = a8;
  v11 = *(_QWORD *)&a7;
  v12 = *(_QWORD *)&a6;
  longitude = a4.longitude;
  latitude = a4.latitude;
  v21.receiver = self;
  v21.super_class = (Class)CLLocationMatchInfo;
  v17 = -[CLLocationMatchInfo init](&v21, sel_init);
  if (v17)
  {
    v18 = [CLLocationMatchInfoInternal alloc];
    v17->_internal = (id)objc_msgSend_initWithMatchQuality_matchCoordinate_matchCourse_matchFormOfWay_matchRoadClass_matchShifted_matchDataArray_(v18, v19, a3, v12, v11, v10, a9, latitude, longitude, a5);
  }
  return v17;
}

- (CLLocationMatchInfo)initWithMatchQuality:(int64_t)a3 matchCoordinate:(CLLocationCoordinate2D)a4 matchCourse:(double)a5 matchFormOfWay:(int)a6 matchRoadClass:(int)a7 matchShifted:(BOOL)a8
{
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  double longitude;
  double latitude;
  CLLocationMatchInfo *v15;
  CLLocationMatchInfoInternal *v16;
  const char *v17;
  objc_super v19;

  v8 = a8;
  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  longitude = a4.longitude;
  latitude = a4.latitude;
  v19.receiver = self;
  v19.super_class = (Class)CLLocationMatchInfo;
  v15 = -[CLLocationMatchInfo init](&v19, sel_init);
  if (v15)
  {
    v16 = [CLLocationMatchInfoInternal alloc];
    v15->_internal = (id)objc_msgSend_initWithMatchQuality_matchCoordinate_matchCourse_matchFormOfWay_matchRoadClass_matchShifted_matchDataArray_(v16, v17, a3, v10, v9, v8, 0, latitude, longitude, a5);
  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLLocationMatchInfo)initWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  double v9;
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
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;

  v6 = objc_msgSend_decodeIntegerForKey_(a3, a2, (uint64_t)CFSTR("kCLLocationMatchInfoCodingKeyMatchQuality"), v3);
  objc_msgSend_decodeDoubleForKey_(a3, v7, (uint64_t)CFSTR("kCLLocationMatchInfoCodingKeyMatchCoordinateLatitude"), v8);
  v10 = v9;
  objc_msgSend_decodeDoubleForKey_(a3, v11, (uint64_t)CFSTR("kCLLocationMatchInfoCodingKeyMatchCoordinateLongitude"), v12);
  v14 = v13;
  objc_msgSend_decodeDoubleForKey_(a3, v15, (uint64_t)CFSTR("kCLLocationMatchInfoCodingKeyMatchCourse"), v16);
  v18 = v17;
  v21 = objc_msgSend_decodeInt32ForKey_(a3, v19, (uint64_t)CFSTR("kCLLocationMatchInfoCodingKeyMatchFormOfWay"), v20);
  v24 = objc_msgSend_decodeInt32ForKey_(a3, v22, (uint64_t)CFSTR("kCLLocationMatchInfoCodingKeyMatchRoadClass"), v23);
  v27 = objc_msgSend_decodeBoolForKey_(a3, v25, (uint64_t)CFSTR("kCLLocationMatchInfoCodingKeyMatchShifted"), v26);
  v28 = objc_opt_class();
  v30 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v29, v28, (uint64_t)CFSTR("kCLLocationMatchInfoCodingKeyMatchDataArray"));
  return (CLLocationMatchInfo *)objc_msgSend_initWithMatchQuality_matchCoordinate_matchCourse_matchFormOfWay_matchRoadClass_matchShifted_matchDataArray_(self, v31, v6, v21, v24, v27, v30, v10, v14, v18);
}

- (void)encodeWithCoder:(id)a3
{
  double *internal;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;

  internal = (double *)self->_internal;
  objc_msgSend_encodeInteger_forKey_(a3, a2, *((_QWORD *)internal + 1), (uint64_t)CFSTR("kCLLocationMatchInfoCodingKeyMatchQuality"));
  objc_msgSend_encodeDouble_forKey_(a3, v5, (uint64_t)CFSTR("kCLLocationMatchInfoCodingKeyMatchCoordinateLatitude"), v6, internal[2]);
  objc_msgSend_encodeDouble_forKey_(a3, v7, (uint64_t)CFSTR("kCLLocationMatchInfoCodingKeyMatchCoordinateLongitude"), v8, internal[3]);
  objc_msgSend_encodeDouble_forKey_(a3, v9, (uint64_t)CFSTR("kCLLocationMatchInfoCodingKeyMatchCourse"), v10, internal[4]);
  objc_msgSend_encodeInt32_forKey_(a3, v11, *((unsigned int *)internal + 10), (uint64_t)CFSTR("kCLLocationMatchInfoCodingKeyMatchFormOfWay"));
  objc_msgSend_encodeInt32_forKey_(a3, v12, *((unsigned int *)internal + 11), (uint64_t)CFSTR("kCLLocationMatchInfoCodingKeyMatchRoadClass"));
  objc_msgSend_encodeBool_forKey_(a3, v13, *((unsigned __int8 *)internal + 48), (uint64_t)CFSTR("kCLLocationMatchInfoCodingKeyMatchShifted"));
  objc_msgSend_encodeObject_forKey_(a3, v14, *((_QWORD *)internal + 7), (uint64_t)CFSTR("kCLLocationMatchInfoCodingKeyMatchDataArray"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLLocationMatchInfo;
  -[CLLocationMatchInfo dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  _QWORD *v8;
  const char *v9;
  uint64_t v10;

  v5 = (void *)objc_opt_class();
  v8 = (_QWORD *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v8[1] = objc_msgSend_copyWithZone_(self->_internal, v9, (uint64_t)a3, v10);
  return v8;
}

- (id)description
{
  uint64_t v2;
  _QWORD *internal;

  internal = self->_internal;
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("matchQuality %ld matchCoordinate <%+.8f,%+.8f> matchCourse %.2f matchFormOfWay %d matchRoadClass %d matchShifted %d"), v2, internal[1], internal[2], internal[3], internal[4], *((unsigned int *)internal + 10), *((unsigned int *)internal + 11), *((unsigned __int8 *)internal + 48));
}

- (id)shortDescription
{
  uint64_t v2;
  _QWORD *internal;

  internal = self->_internal;
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%ld <%+.8f,%+.8f> %.2f %d %d %d"), v2, internal[1], internal[2], internal[3], internal[4], *((unsigned int *)internal + 10), *((unsigned int *)internal + 11), *((unsigned __int8 *)internal + 48));
}

- (int64_t)matchQuality
{
  return *((_QWORD *)self->_internal + 1);
}

- (CLLocationCoordinate2D)matchCoordinate
{
  double *internal;
  double v3;
  double v4;
  CLLocationCoordinate2D result;

  internal = (double *)self->_internal;
  v3 = internal[2];
  v4 = internal[3];
  result.longitude = v4;
  result.latitude = v3;
  return result;
}

- (double)matchCourse
{
  return *((double *)self->_internal + 4);
}

- (int)matchFormOfWay
{
  return *((_DWORD *)self->_internal + 10);
}

- (int)matchRoadClass
{
  return *((_DWORD *)self->_internal + 11);
}

- (BOOL)isMatchShifted
{
  return *((_BYTE *)self->_internal + 48);
}

- (NSData)matchDataArray
{
  return (NSData *)*((_QWORD *)self->_internal + 7);
}

@end
