@implementation CLHeading

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLHeading;
  -[CLHeading dealloc](&v3, sel_dealloc);
}

- (CLHeading)initWithClientHeading:(id *)a3
{
  CLHeading *v4;
  CLHeadingInternal *v5;
  __int128 v6;
  __int128 v7;
  const char *v8;
  uint64_t v9;
  _OWORD v11[5];
  uint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CLHeading;
  v4 = -[CLHeading init](&v13, sel_init);
  if (v4)
  {
    v5 = [CLHeadingInternal alloc];
    v6 = *(_OWORD *)&a3->var6;
    v11[2] = *(_OWORD *)&a3->var4;
    v11[3] = v6;
    v11[4] = *(_OWORD *)&a3->var8;
    v12 = *(_QWORD *)&a3->var10;
    v7 = *(_OWORD *)&a3->var2;
    v11[0] = *(_OWORD *)&a3->var0;
    v11[1] = v7;
    v4->_internal = (id)objc_msgSend_initWithClientHeading_(v5, v8, (uint64_t)v11, v9);
  }
  return v4;
}

- (CLLocationDirection)trueHeading
{
  return *((double *)self->_internal + 5);
}

- (CLLocationDirection)headingAccuracy
{
  return *((double *)self->_internal + 6);
}

- (NSDate)timestamp
{
  uint64_t v2;
  uint64_t v3;

  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], a2, v2, v3, *((double *)self->_internal + 7));
}

- (CLLocationDirection)magneticHeading
{
  return *((double *)self->_internal + 4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLHeading)initWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  _OWORD v36[5];
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = 0;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v38 = 0u;
  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) != 0)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v6, (uint64_t)CFSTR("kCLHeadingCodingKeyMagneticHeading"), v7);
    *((_QWORD *)&v39 + 1) = v8;
    objc_msgSend_decodeDoubleForKey_(a3, v9, (uint64_t)CFSTR("kCLHeadingCodingKeyTrueHeading"), v10);
    *(_QWORD *)&v40 = v11;
    objc_msgSend_decodeDoubleForKey_(a3, v12, (uint64_t)CFSTR("kCLHeadingCodingKeyAccuracy"), v13);
    *((_QWORD *)&v40 + 1) = v14;
    objc_msgSend_decodeDoubleForKey_(a3, v15, (uint64_t)CFSTR("kCLHeadingCodingKeyX"), v16);
    *(_QWORD *)&v38 = v17;
    objc_msgSend_decodeDoubleForKey_(a3, v18, (uint64_t)CFSTR("kCLHeadingCodingKeyY"), v19);
    *((_QWORD *)&v38 + 1) = v20;
    objc_msgSend_decodeDoubleForKey_(a3, v21, (uint64_t)CFSTR("kCLHeadingCodingKeyZ"), v22);
    *(_QWORD *)&v39 = v23;
    objc_msgSend_decodeDoubleForKey_(a3, v24, (uint64_t)CFSTR("kCLHeadingCodingKeyTimestamp"), v25);
    *(_QWORD *)&v41 = v28;
  }
  else
  {
    objc_msgSend_decodeValueOfObjCType_at_(a3, v6, (uint64_t)"d", (uint64_t)&v39 + 8);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v29, (uint64_t)"d", (uint64_t)&v40);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v30, (uint64_t)"d", (uint64_t)&v40 + 8);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v31, (uint64_t)"d", (uint64_t)&v38);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v32, (uint64_t)"d", (uint64_t)&v38 + 8);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v33, (uint64_t)"d", (uint64_t)&v39);
    objc_msgSend_decodeValueOfObjCType_at_(a3, v34, (uint64_t)"d", (uint64_t)&v41);
  }
  v36[2] = v40;
  v36[3] = v41;
  v36[4] = v42;
  v37 = v43;
  v36[0] = v38;
  v36[1] = v39;
  return (CLHeading *)objc_msgSend_initWithClientHeading_(self, v26, (uint64_t)v36, v27);
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
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;

  internal = (double *)self->_internal;
  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) != 0)
  {
    objc_msgSend_encodeDouble_forKey_(a3, v6, (uint64_t)CFSTR("kCLHeadingCodingKeyMagneticHeading"), v7, internal[4]);
    objc_msgSend_encodeDouble_forKey_(a3, v8, (uint64_t)CFSTR("kCLHeadingCodingKeyTrueHeading"), v9, internal[5]);
    objc_msgSend_encodeDouble_forKey_(a3, v10, (uint64_t)CFSTR("kCLHeadingCodingKeyAccuracy"), v11, internal[6]);
    objc_msgSend_encodeDouble_forKey_(a3, v12, (uint64_t)CFSTR("kCLHeadingCodingKeyX"), v13, internal[1]);
    objc_msgSend_encodeDouble_forKey_(a3, v14, (uint64_t)CFSTR("kCLHeadingCodingKeyY"), v15, internal[2]);
    objc_msgSend_encodeDouble_forKey_(a3, v16, (uint64_t)CFSTR("kCLHeadingCodingKeyZ"), v17, internal[3]);
    objc_msgSend_encodeDouble_forKey_(a3, v18, (uint64_t)CFSTR("kCLHeadingCodingKeyTimestamp"), v19, internal[7]);
  }
  else
  {
    objc_msgSend_encodeValueOfObjCType_at_(a3, v6, (uint64_t)"d", (uint64_t)(internal + 4));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v20, (uint64_t)"d", (uint64_t)(internal + 5));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v21, (uint64_t)"d", (uint64_t)(internal + 6));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v22, (uint64_t)"d", (uint64_t)(internal + 1));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v23, (uint64_t)"d", (uint64_t)(internal + 2));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v24, (uint64_t)"d", (uint64_t)(internal + 3));
    objc_msgSend_encodeValueOfObjCType_at_(a3, v25, (uint64_t)"d", (uint64_t)(internal + 7));
  }
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
  _OWORD *internal;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  __int128 v14;

  internal = self->_internal;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v14 = internal[2];
  v6 = *((_QWORD *)internal + 6);
  v7 = *((_QWORD *)internal + 1);
  v8 = *((_QWORD *)internal + 2);
  v9 = *((_QWORD *)internal + 3);
  v10 = objc_msgSend_timestamp(self, a2, v2, v3);
  return (id)objc_msgSend_stringWithFormat_(v5, v11, (uint64_t)CFSTR("magneticHeading %.2f trueHeading %.2f accuracy %.2f x %+.3f y %+.3f z %+.3f @ %@"), v12, v14, v6, v7, v8, v9, v10);
}

- (id)shortDescription
{
  uint64_t v2;
  double *internal;
  double v4;
  uint64_t v5;
  double v6;
  const __CFString *v7;

  internal = (double *)self->_internal;
  v4 = internal[5];
  if (v4 >= 0.0)
  {
    v5 = 116;
  }
  else
  {
    v4 = internal[4];
    v5 = 109;
  }
  v6 = internal[6];
  v7 = CFSTR("±");
  if (v6 < 0.0)
    v7 = &stru_1E2993188;
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%.2f%c %@%.2f° %d (%.1f,%.1f,%.1f) %.1fµT %.1f°"), v2, *(_QWORD *)&v4, v5, v7, *(_QWORD *)&v6, *((unsigned int *)internal + 22), *((_QWORD *)internal + 1), *((_QWORD *)internal + 2), *((_QWORD *)internal + 3), *((_QWORD *)internal + 9), *((_QWORD *)internal + 10));
}

- (CLHeadingComponentValue)x
{
  return *((double *)self->_internal + 1);
}

- (CLHeadingComponentValue)y
{
  return *((double *)self->_internal + 2);
}

- (CLHeadingComponentValue)z
{
  return *((double *)self->_internal + 3);
}

@end
