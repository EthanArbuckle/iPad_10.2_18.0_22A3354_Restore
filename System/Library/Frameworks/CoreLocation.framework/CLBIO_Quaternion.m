@implementation CLBIO_Quaternion

- (CLBIO_Quaternion)initWithX:(double)a3 Y:(double)a4 Z:(double)a5 W:(double)a6
{
  CLBIO_Quaternion *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLBIO_Quaternion;
  result = -[CLBIO_Quaternion init](&v11, sel_init);
  if (result)
  {
    result->_X = a3;
    result->_Y = a4;
    result->_Z = a5;
    result->_W = a6;
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
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double W;
  double v28;

  v5 = objc_opt_class();
  isMemberOfClass = objc_msgSend_isMemberOfClass_(a3, v6, v5, v7);
  if (isMemberOfClass)
  {
    X = self->_X;
    objc_msgSend_X(a3, v9, v10, v11);
    if (X == v16
      && (Y = self->_Y, objc_msgSend_Y(a3, v13, v14, v15), Y == v21)
      && (Z = self->_Z, objc_msgSend_Z(a3, v18, v19, v20), Z == v26))
    {
      W = self->_W;
      objc_msgSend_W(a3, v23, v24, v25);
      LOBYTE(isMemberOfClass) = W == v28;
    }
    else
    {
      LOBYTE(isMemberOfClass) = 0;
    }
  }
  return isMemberOfClass;
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
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = (void *)objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  objc_msgSend_X(self, v9, v10, v11);
  objc_msgSend_Y(self, v12, v13, v14);
  objc_msgSend_Z(self, v15, v16, v17);
  objc_msgSend_W(self, v18, v19, v20);
  return (id)MEMORY[0x1E0DE7D20](v8, sel_initWithX_Y_Z_W_, v21, v22);
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

  objc_msgSend_X(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeDouble_forKey_(a3, v6, (uint64_t)CFSTR("quaternionX"), v7);
  objc_msgSend_Y(self, v8, v9, v10);
  objc_msgSend_encodeDouble_forKey_(a3, v11, (uint64_t)CFSTR("quaternionY"), v12);
  objc_msgSend_Z(self, v13, v14, v15);
  objc_msgSend_encodeDouble_forKey_(a3, v16, (uint64_t)CFSTR("quaternionZ"), v17);
  objc_msgSend_W(self, v18, v19, v20);
  objc_msgSend_encodeDouble_forKey_(a3, v21, (uint64_t)CFSTR("quaternionW"), v22);
}

- (CLBIO_Quaternion)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  CLBIO_Quaternion *v6;
  double v7;
  const char *v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CLBIO_Quaternion;
  v6 = -[CLBIO_Quaternion init](&v18, sel_init);
  if (v6)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, (uint64_t)CFSTR("quaternionX"), v5);
    v6->_X = v7;
    objc_msgSend_decodeDoubleForKey_(a3, v8, (uint64_t)CFSTR("quaternionY"), v9);
    v6->_Y = v10;
    objc_msgSend_decodeDoubleForKey_(a3, v11, (uint64_t)CFSTR("quaternionZ"), v12);
    v6->_Z = v13;
    objc_msgSend_decodeDoubleForKey_(a3, v14, (uint64_t)CFSTR("quaternionW"), v15);
    v6->_W = v16;
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

- (double)W
{
  return self->_W;
}

@end
