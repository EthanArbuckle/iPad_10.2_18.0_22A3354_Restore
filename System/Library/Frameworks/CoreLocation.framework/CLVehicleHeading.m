@implementation CLVehicleHeading

- (CLVehicleHeading)initWithClientVehicleHeading:(id)a3
{
  double var1;
  double var0;
  CLVehicleHeading *v5;
  CLVehicleHeadingInternal *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  var1 = a3.var1;
  var0 = a3.var0;
  v11.receiver = self;
  v11.super_class = (Class)CLVehicleHeading;
  v5 = -[CLVehicleHeading init](&v11, sel_init);
  if (v5)
  {
    v6 = [CLVehicleHeadingInternal alloc];
    v5->_internal = (id)objc_msgSend_initWithClientVehicleHeading_(v6, v7, v8, v9, var0, var1);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLVehicleHeading)initWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  double v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;

  v21 = 0.0;
  v22 = 0.0;
  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) != 0)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v6, (uint64_t)CFSTR("kCLVehicleHeadingCodingKeyTrueHeading"), v7);
    v9 = v8;
    objc_msgSend_decodeDoubleForKey_(a3, v10, (uint64_t)CFSTR("kCLVehicleHeadingCodingKeyTimestamp"), v11, *(_QWORD *)&v8);
    v22 = v12;
    return (CLVehicleHeading *)objc_msgSend_initWithClientVehicleHeading_(self, v13, v14, v15, v9, v12);
  }
  else
  {
    objc_msgSend_decodeValueOfObjCType_at_(a3, v6, (uint64_t)"d", (uint64_t)&v21);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v17, (uint64_t)"d", (uint64_t)&v22);
    return (CLVehicleHeading *)objc_msgSend_initWithClientVehicleHeading_(self, v18, v19, v20, v21, v22);
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  double *internal;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;

  internal = (double *)self->_internal;
  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) != 0)
  {
    objc_msgSend_encodeDouble_forKey_(a3, v6, (uint64_t)CFSTR("kCLVehicleHeadingCodingKeyTrueHeading"), v7, internal[1]);
    objc_msgSend_encodeDouble_forKey_(a3, v8, (uint64_t)CFSTR("kCLVehicleHeadingCodingKeyTimestamp"), v9, internal[2]);
  }
  else
  {
    objc_msgSend_encodeValueOfObjCType_at_(a3, v6, (uint64_t)"d", (uint64_t)(internal + 1));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v10, (uint64_t)"d", (uint64_t)(internal + 2));
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLVehicleHeading;
  -[CLVehicleHeading dealloc](&v3, sel_dealloc);
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
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = *((_QWORD *)self->_internal + 1);
  v6 = (void *)MEMORY[0x1E0CB3578];
  v7 = objc_msgSend_timestamp(self, a2, v2, v3);
  v9 = objc_msgSend_localizedStringFromDate_dateStyle_timeStyle_(v6, v8, v7, 1, 4);
  return (id)objc_msgSend_stringWithFormat_(v4, v10, (uint64_t)CFSTR("trueHeading %.2f @ %@"), v11, v5, v9);
}

- (id)shortDescription
{
  uint64_t v2;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%.2f"), v2, *((_QWORD *)self->_internal + 1));
}

- (double)trueHeading
{
  return *((double *)self->_internal + 1);
}

- (NSDate)timestamp
{
  uint64_t v2;
  uint64_t v3;

  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], a2, v2, v3, *((double *)self->_internal + 2));
}

@end
