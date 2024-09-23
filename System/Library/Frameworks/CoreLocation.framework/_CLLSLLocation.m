@implementation _CLLSLLocation

- (_CLLSLLocation)initWithLatitude:(double)a3 longitude:(double)a4
{
  _CLLSLLocationCoordinate *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;

  v7 = [_CLLSLLocationCoordinate alloc];
  v11 = (id)objc_msgSend_initWithLatitude_longitude_(v7, v8, v9, v10, a3, a4);
  return (_CLLSLLocation *)MEMORY[0x1E0DE7D20](self, sel_initWithCoordinate_altitude_timetamp_, v11, v12);
}

- (_CLLSLLocation)initWithCoordinate:(id)a3
{
  return (_CLLSLLocation *)((uint64_t (*)(_CLLSLLocation *, char *, id))MEMORY[0x1E0DE7D20])(self, sel_initWithCoordinate_altitude_timetamp_, a3);
}

- (_CLLSLLocation)initWithLatitude:(double)a3 longitude:(double)a4 altitude:(double)a5 timetamp:(double)a6
{
  _CLLSLLocationCoordinate *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v9 = [_CLLSLLocationCoordinate alloc];
  v13 = (id)objc_msgSend_initWithLatitude_longitude_(v9, v10, v11, v12, a3, a4);
  return (_CLLSLLocation *)MEMORY[0x1E0DE7D20](self, sel_initWithCoordinate_altitude_timetamp_, v13, v14);
}

- (_CLLSLLocation)initWithCoordinate:(id)a3 altitude:(double)a4 timetamp:(double)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  _CLLSLLocation *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_CLLSLLocation;
  v11 = -[_CLLSLLocation init](&v13, sel_init);
  if (v11)
  {
    v11->_coordinate = (_CLLSLLocationCoordinate *)objc_msgSend_copy(a3, v8, v9, v10);
    v11->_altitude = a4;
    v11->_timestamp = a5;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CLLSLLocation;
  -[_CLLSLLocation dealloc](&v3, sel_dealloc);
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
  uint64_t v12;
  const char *v13;
  uint64_t v14;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  *(_QWORD *)(v12 + 8) = objc_msgSend_copyWithZone_(self->_coordinate, v13, (uint64_t)a3, v14);
  *(double *)(v12 + 16) = self->_altitude;
  *(double *)(v12 + 24) = self->_timestamp;
  return (id)v12;
}

- (_CLLSLLocation)initWithCoder:(id)a3
{
  _CLLSLLocation *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_CLLSLLocation;
  v4 = -[_CLLSLLocation init](&v14, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_coordinate = (_CLLSLLocationCoordinate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("coordinate"));
    objc_msgSend_decodeDoubleForKey_(a3, v7, (uint64_t)CFSTR("altitude"), v8);
    v4->_altitude = v9;
    objc_msgSend_decodeDoubleForKey_(a3, v10, (uint64_t)CFSTR("timestamp"), v11);
    v4->_timestamp = v12;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_coordinate, (uint64_t)CFSTR("coordinate"));
  objc_msgSend_encodeDouble_forKey_(a3, v5, (uint64_t)CFSTR("altitude"), v6, self->_altitude);
  objc_msgSend_encodeDouble_forKey_(a3, v7, (uint64_t)CFSTR("timestamp"), v8, self->_timestamp);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend_descriptionWithMemberIndent_endIndent_(self, a2, (uint64_t)CFSTR("\t"), (uint64_t)&stru_1E2993188);
}

- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4
{
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_msgSend_coordinate(self, a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_altitude(self, v9, v10, v11);
  v13 = v12;
  objc_msgSend_timestamp(self, v14, v15, v16);
  return (id)objc_msgSend_stringWithFormat_(v7, v17, (uint64_t)CFSTR("<_CLLSLLocation: %p> {\n%@.coordinate = %@,\n%@.altitude = %f,\n%@.timestamp = %f\n%@}"), v18, self, a3, v8, a3, v13, a3, v19, a4);
}

- (_CLLSLLocationCoordinate)coordinate
{
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end
