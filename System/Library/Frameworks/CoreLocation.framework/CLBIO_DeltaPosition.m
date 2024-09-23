@implementation CLBIO_DeltaPosition

- (CLBIO_DeltaPosition)initWithX:(double)a3 Y:(double)a4 Z:(double)a5
{
  CLBIO_DeltaPosition *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLBIO_DeltaPosition;
  result = -[CLBIO_DeltaPosition init](&v9, sel_init);
  if (result)
  {
    result->_X = a3;
    result->_Y = a4;
    result->_Z = a5;
  }
  return result;
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
  double X;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double Y;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double Z;
  double v23;

  v5 = objc_opt_class();
  isMemberOfClass = objc_msgSend_isMemberOfClass_(a3, v6, v5, v7);
  if (isMemberOfClass)
  {
    X = self->_X;
    objc_msgSend_X(a3, v9, v10, v11);
    if (X == v16 && (Y = self->_Y, objc_msgSend_Y(a3, v13, v14, v15), Y == v21))
    {
      Z = self->_Z;
      objc_msgSend_Z(a3, v18, v19, v20);
      LOBYTE(isMemberOfClass) = Z == v23;
    }
    else
    {
      LOBYTE(isMemberOfClass) = 0;
    }
  }
  return isMemberOfClass;
}

- (BOOL)isValid
{
  BOOL result;
  double v4;

  result = 0;
  if (fabs(self->_X) != INFINITY)
  {
    v4 = fabs(self->_Y);
    return v4 > INFINITY || v4 < INFINITY;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
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
  uint64_t v18;
  uint64_t v19;

  v5 = (void *)objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  objc_msgSend_X(self, v9, v10, v11);
  objc_msgSend_Y(self, v12, v13, v14);
  objc_msgSend_Z(self, v15, v16, v17);
  return (id)MEMORY[0x1E0DE7D20](v8, sel_initWithX_Y_Z_, v18, v19);
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

  objc_msgSend_X(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeDouble_forKey_(a3, v6, (uint64_t)CFSTR("deltaPositionX"), v7);
  objc_msgSend_Y(self, v8, v9, v10);
  objc_msgSend_encodeDouble_forKey_(a3, v11, (uint64_t)CFSTR("deltaPositionY"), v12);
  objc_msgSend_Z(self, v13, v14, v15);
  objc_msgSend_encodeDouble_forKey_(a3, v16, (uint64_t)CFSTR("deltaPositionZ"), v17);
}

- (CLBIO_DeltaPosition)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  CLBIO_DeltaPosition *v6;
  double v7;
  const char *v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLBIO_DeltaPosition;
  v6 = -[CLBIO_DeltaPosition init](&v15, sel_init);
  if (v6)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, (uint64_t)CFSTR("deltaPositionX"), v5);
    v6->_X = v7;
    objc_msgSend_decodeDoubleForKey_(a3, v8, (uint64_t)CFSTR("deltaPositionY"), v9);
    v6->_Y = v10;
    objc_msgSend_decodeDoubleForKey_(a3, v11, (uint64_t)CFSTR("deltaPositionZ"), v12);
    v6->_Z = v13;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)X
{
  return self->_X;
}

- (double)Y
{
  return self->_Y;
}

- (double)Z
{
  return self->_Z;
}

@end
