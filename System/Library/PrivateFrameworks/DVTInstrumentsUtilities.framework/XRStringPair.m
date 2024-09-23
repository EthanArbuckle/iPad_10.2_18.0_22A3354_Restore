@implementation XRStringPair

- (XRStringPair)initWithFirst:(id)a3 second:(id)a4
{
  id v7;
  id v8;
  XRStringPair *v9;
  XRStringPair *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)XRStringPair;
  v9 = -[XRStringPair init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_first, a3);
    objc_storeStrong((id *)&v10->_second, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XRStringPair)initWithCoder:(id)a3
{
  id v4;
  XRStringPair *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *first;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *second;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)XRStringPair;
  v5 = -[XRStringPair init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_first"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    first = v5->_first;
    v5->_first = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("_second"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    second = v5->_second;
    v5->_second = (NSString *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *first;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  first = self->_first;
  v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)first, (uint64_t)CFSTR("_first"), v6);
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_second, (uint64_t)CFSTR("_second"), v8);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  char isEqualToString;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend_first(self, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_first(v5, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v10, v16, (uint64_t)v15, v17, v18))
    {
      objc_msgSend_second(self, v19, v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_second(v5, v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v23, v29, (uint64_t)v28, v30, v31);

    }
    else
    {
      isEqualToString = 0;
    }

  }
  else
  {
    isEqualToString = 0;
  }

  return isEqualToString;
}

- (id)copyWithZone:(_NSZone *)a3
{
  XRStringPair *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *second;

  v4 = [XRStringPair alloc];
  objc_msgSend_first(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_second(self, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  second = (void *)objc_msgSend_initWithFirst_second_(v4, v15, (uint64_t)v9, (uint64_t)v14, v16);

  return second;
}

- (unint64_t)hashValue
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;

  objc_msgSend_first(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_hash(v6, v7, v8, v9, v10);
  objc_msgSend_second(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_hash(v16, v17, v18, v19, v20) ^ v11;

  return v21;
}

- (NSString)first
{
  return self->_first;
}

- (NSString)second
{
  return self->_second;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_second, 0);
  objc_storeStrong((id *)&self->_first, 0);
}

@end
