@implementation CLRouteBoundingBox

- (CLRouteBoundingBox)initWithMinLatitude:(double)a3 maxLatitude:(double)a4 minLongitude:(double)a5 maxLongitude:(double)a6 nRows:(int)a7 nColumns:(int)a8
{
  CLRouteBoundingBox *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLRouteBoundingBox;
  result = -[CLRouteBoundingBox init](&v15, sel_init);
  if (result)
  {
    result->_minLatitude = a3;
    result->_maxLatitude = a4;
    result->_minLongitude = a5;
    result->_maxLongitude = a6;
    result->_nRows = a7;
    result->_nColumns = a8;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CLRouteBoundingBox *v4;
  const char *v5;

  v4 = [CLRouteBoundingBox alloc];
  return (id)objc_msgSend_initWithMinLatitude_maxLatitude_minLongitude_maxLongitude_nRows_nColumns_(v4, v5, self->_nRows, self->_nColumns, self->_minLatitude, self->_maxLatitude, self->_minLongitude, self->_maxLongitude);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;

  objc_msgSend_minLatitude(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeDouble_forKey_(a3, v6, (uint64_t)CFSTR("minLatitude"), v7);
  objc_msgSend_maxLatitude(self, v8, v9, v10);
  objc_msgSend_encodeDouble_forKey_(a3, v11, (uint64_t)CFSTR("maxLatitude"), v12);
  objc_msgSend_minLongitude(self, v13, v14, v15);
  objc_msgSend_encodeDouble_forKey_(a3, v16, (uint64_t)CFSTR("minLongitude"), v17);
  objc_msgSend_maxLongitude(self, v18, v19, v20);
  objc_msgSend_encodeDouble_forKey_(a3, v21, (uint64_t)CFSTR("maxLongitude"), v22);
  v26 = objc_msgSend_nRows(self, v23, v24, v25);
  objc_msgSend_encodeInt_forKey_(a3, v27, v26, (uint64_t)CFSTR("nRows"));
  v31 = objc_msgSend_nColumns(self, v28, v29, v30);
  objc_msgSend_encodeInt_forKey_(a3, v32, v31, (uint64_t)CFSTR("nColumns"));
}

- (CLRouteBoundingBox)initWithCoder:(id)a3
{
  CLRouteBoundingBox *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;

  v4 = [CLRouteBoundingBox alloc];
  objc_msgSend_decodeDoubleForKey_(a3, v5, (uint64_t)CFSTR("minLatitude"), v6);
  v8 = v7;
  objc_msgSend_decodeDoubleForKey_(a3, v9, (uint64_t)CFSTR("maxLatitude"), v10);
  v12 = v11;
  objc_msgSend_decodeDoubleForKey_(a3, v13, (uint64_t)CFSTR("minLongitude"), v14);
  v16 = v15;
  objc_msgSend_decodeDoubleForKey_(a3, v17, (uint64_t)CFSTR("maxLongitude"), v18);
  v20 = v19;
  v23 = objc_msgSend_decodeIntForKey_(a3, v21, (uint64_t)CFSTR("nRows"), v22);
  v26 = objc_msgSend_decodeIntForKey_(a3, v24, (uint64_t)CFSTR("nColumns"), v25);
  return (CLRouteBoundingBox *)objc_msgSend_initWithMinLatitude_maxLatitude_minLongitude_maxLongitude_nRows_nColumns_(v4, v27, v23, v26, v8, v12, v16, v20);
}

- (double)minLatitude
{
  return self->_minLatitude;
}

- (double)maxLatitude
{
  return self->_maxLatitude;
}

- (double)minLongitude
{
  return self->_minLongitude;
}

- (double)maxLongitude
{
  return self->_maxLongitude;
}

- (int)nRows
{
  return self->_nRows;
}

- (int)nColumns
{
  return self->_nColumns;
}

@end
