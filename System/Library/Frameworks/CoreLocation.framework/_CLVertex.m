@implementation _CLVertex

- (_CLVertex)initWithCoordinate:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  _CLVertex *result;
  objc_super v6;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v6.receiver = self;
  v6.super_class = (Class)_CLVertex;
  result = -[_CLVertex init](&v6, sel_init);
  if (result)
  {
    result->_coordinate.latitude = latitude;
    result->_coordinate.longitude = longitude;
  }
  return result;
}

- (_CLVertex)initWithClientCoordinate:(id)a3
{
  double var1;
  double var0;
  _CLVertex *result;
  objc_super v6;

  var1 = a3.var1;
  var0 = a3.var0;
  v6.receiver = self;
  v6.super_class = (Class)_CLVertex;
  result = -[_CLVertex init](&v6, sel_init);
  if (result)
  {
    result->_coordinate.latitude = var0;
    result->_coordinate.longitude = var1;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_CLVertex;
  -[_CLVertex dealloc](&v2, sel_dealloc);
}

- (double)getDistanceFrom:(CLLocationCoordinate2D)a3
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

  longitude = a3.longitude;
  latitude = a3.latitude;
  objc_msgSend_coordinate(self, a2, v3, v4);
  v9 = v8;
  objc_msgSend_coordinate(self, v10, v11, v12);
  return sub_18F5BD12C(latitude, longitude, v9, v13);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CLVertex)initWithCoder:(id)a3
{
  uint64_t v3;
  CLLocationDegrees v6;
  const char *v7;
  uint64_t v8;
  CLLocationDegrees v9;

  objc_msgSend_decodeDoubleForKey_(a3, a2, (uint64_t)CFSTR("kCLVertexCodingKeyLatitude"), v3);
  self->_coordinate.latitude = v6;
  objc_msgSend_decodeDoubleForKey_(a3, v7, (uint64_t)CFSTR("kCLVertexCodingKeyLongitude"), v8);
  self->_coordinate.longitude = v9;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  double v13;

  objc_msgSend_coordinate(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeDouble_forKey_(a3, v6, (uint64_t)CFSTR("kCLVertexCodingKeyLatitude"), v7);
  objc_msgSend_coordinate(self, v8, v9, v10);
  objc_msgSend_encodeDouble_forKey_(a3, v11, (uint64_t)CFSTR("kCLVertexCodingKeyLongitude"), v12, v13);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_coordinate(self, v5, v6, v7);
  return (id)MEMORY[0x1E0DE7D20](v4, sel_initWithCoordinate_, v8, v9);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int isMemberOfClass;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;

  if (self == a3)
  {
    LOBYTE(isMemberOfClass) = 1;
  }
  else
  {
    v5 = objc_opt_class();
    isMemberOfClass = objc_msgSend_isMemberOfClass_(a3, v6, v5, v7);
    if (isMemberOfClass)
    {
      objc_msgSend_coordinate(self, v9, v10, v11);
      v13 = v12;
      objc_msgSend_coordinate(a3, v14, v15, v16);
      if (v13 == v20)
      {
        objc_msgSend_coordinate(self, v17, v18, v19);
        v22 = v21;
        objc_msgSend_coordinate(a3, v23, v24, v25);
        LOBYTE(isMemberOfClass) = v22 == v26;
      }
      else
      {
        LOBYTE(isMemberOfClass) = 0;
      }
    }
  }
  return isMemberOfClass;
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
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_coordinate(self, a2, v2, v3);
  v7 = v6;
  objc_msgSend_coordinate(self, v8, v9, v10);
  return (id)objc_msgSend_stringWithFormat_(v5, v11, (uint64_t)CFSTR("#polygon,_CLVertex (latitude:'%.07lf', longitude:'%.07lf')"), v12, v7, v13);
}

- (unint64_t)hash
{
  uint64_t v2;
  unint64_t v3;

  v3 = (unint64_t)&qword_18F775000;
  LODWORD(v3) = llround(self->_coordinate.latitude * 100000.0);
  LODWORD(v2) = llround(self->_coordinate.longitude * 100000.0);
  return v3 | (v2 << 32);
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

@end
