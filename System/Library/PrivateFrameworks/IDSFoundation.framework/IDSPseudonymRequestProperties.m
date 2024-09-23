@implementation IDSPseudonymRequestProperties

+ (id)defaultProperties
{
  id v2;
  const char *v3;
  uint64_t v4;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend_setRequestTimeoutInterval_(v2, v3, v4, 600.0);
  return v2;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: %p requestTimeoutInterval: %f>"), self->_requestTimeoutInterval, v5, self, *(_QWORD *)&self->_requestTimeoutInterval);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_requestTimeoutInterval;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSPseudonymRequestProperties)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  IDSPseudonymRequestProperties *v6;
  double v7;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IDSPseudonymRequestProperties;
  v6 = -[IDSPseudonymRequestProperties init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend_decodeDoubleForKey_(v4, v5, (uint64_t)CFSTR("timeout"), v7);
    v6->_requestTimeoutInterval = v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeDouble_forKey_(a3, a2, (uint64_t)CFSTR("timeout"), self->_requestTimeoutInterval);
}

- (double)requestTimeoutInterval
{
  return self->_requestTimeoutInterval;
}

- (void)setRequestTimeoutInterval:(double)a3
{
  self->_requestTimeoutInterval = a3;
}

@end
