@implementation CLVehicleSpeed

- (CLVehicleSpeed)initWithClientVehicleSpeed:(id)a3
{
  double var3;
  double var2;
  double var1;
  double var0;
  CLVehicleSpeed *v7;
  CLVehicleSpeedInternal *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  var3 = a3.var3;
  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v13.receiver = self;
  v13.super_class = (Class)CLVehicleSpeed;
  v7 = -[CLVehicleSpeed init](&v13, sel_init);
  if (v7)
  {
    v8 = [CLVehicleSpeedInternal alloc];
    v7->_internal = (id)objc_msgSend_initWithClientVehicleSpeed_(v8, v9, v10, v11, var0, var1, var2, var3);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLVehicleSpeed)initWithCoder:(id)a3
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
  __int128 v21;
  __int128 v22;

  v21 = 0u;
  v22 = 0u;
  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) != 0)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v6, (uint64_t)CFSTR("kCLVehicleSpeedCodingKeySpeed"), v7);
    v9 = v8;
    objc_msgSend_decodeDoubleForKey_(a3, v10, (uint64_t)CFSTR("kCLVehicleSpeedCodingKeyTimestamp"), v11, *(_QWORD *)&v8);
    *((double *)&v21 + 1) = v12;
    return (CLVehicleSpeed *)objc_msgSend_initWithClientVehicleSpeed_(self, v13, v14, v15, v9, v12, 0.0, 0.0);
  }
  else
  {
    objc_msgSend_decodeValueOfObjCType_at_(a3, v6, (uint64_t)"d", (uint64_t)&v21);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v17, (uint64_t)"d", (uint64_t)&v21 + 8);
    return (CLVehicleSpeed *)objc_msgSend_initWithClientVehicleSpeed_(self, v18, v19, v20, v21, v22);
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
    objc_msgSend_encodeDouble_forKey_(a3, v6, (uint64_t)CFSTR("kCLVehicleSpeedCodingKeySpeed"), v7, internal[1]);
    objc_msgSend_encodeDouble_forKey_(a3, v8, (uint64_t)CFSTR("kCLVehicleSpeedCodingKeyTimestamp"), v9, internal[2]);
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
  v3.super_class = (Class)CLVehicleSpeed;
  -[CLVehicleSpeed dealloc](&v3, sel_dealloc);
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
  return (id)objc_msgSend_stringWithFormat_(v4, v10, (uint64_t)CFSTR("speed %.2f mps @ %@"), v11, v5, v9);
}

- (id)shortDescription
{
  uint64_t v2;
  double v3;
  double v4;
  BOOL v5;
  double v6;

  v3 = *((double *)self->_internal + 1);
  v4 = v3 * 2.23693629;
  v5 = v3 < 0.0;
  v6 = -1.0;
  if (!v5)
    v6 = v4;
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%.0fmph"), v2, *(_QWORD *)&v6);
}

- (double)speed
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
