@implementation _CLLSLLocationCoordinate

- (_CLLSLLocationCoordinate)initWithLatitude:(double)a3 longitude:(double)a4
{
  _CLLSLLocationCoordinate *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CLLSLLocationCoordinate;
  result = -[_CLLSLLocationCoordinate init](&v7, sel_init);
  if (result)
  {
    result->_latitude = a3;
    result->_longitude = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id result;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  result = (id)objc_msgSend_init(v8, v9, v10, v11);
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_latitude;
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_longitude;
  return result;
}

- (_CLLSLLocationCoordinate)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  _CLLSLLocationCoordinate *v6;
  double v7;
  const char *v8;
  uint64_t v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_CLLSLLocationCoordinate;
  v6 = -[_CLLSLLocationCoordinate init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, (uint64_t)CFSTR("latitude"), v5);
    v6->_latitude = v7;
    objc_msgSend_decodeDoubleForKey_(a3, v8, (uint64_t)CFSTR("longitude"), v9);
    v6->_longitude = v10;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;

  objc_msgSend_encodeDouble_forKey_(a3, a2, (uint64_t)CFSTR("latitude"), v3, self->_latitude);
  objc_msgSend_encodeDouble_forKey_(a3, v6, (uint64_t)CFSTR("longitude"), v7, self->_longitude);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  objc_msgSend_latitude(self, a2, v2, v3);
  v7 = v6;
  objc_msgSend_longitude(self, v8, v9, v10);
  return (id)objc_msgSend_stringWithFormat_(v5, v11, (uint64_t)CFSTR("<_CLLSLLocationCoordinate: %p> { .latitude = %f, .longitude = %f }"), v12, self, v7, v13);
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

@end
