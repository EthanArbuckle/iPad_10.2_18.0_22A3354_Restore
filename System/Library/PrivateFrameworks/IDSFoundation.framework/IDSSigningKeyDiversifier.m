@implementation IDSSigningKeyDiversifier

- (IDSSigningKeyDiversifier)initWithDiversifier:(id)a3 trackingPreventionSecret:(id)a4
{
  id v7;
  id v8;
  void *v9;
  IDSSigningKeyDiversifier *v10;
  IDSSigningKeyDiversifier *v11;
  id *p_isa;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)IDSSigningKeyDiversifier;
    v11 = -[IDSSigningKeyDiversifier init](&v14, sel_init);
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_diversifier, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v10 = self;
  }

  return v10;
}

- (IDSSigningKeyDiversifier)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  IDSSigningKeyDiversifier *v15;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("dS"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, v11, CFSTR("tPS"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (IDSSigningKeyDiversifier *)objc_msgSend_initWithDiversifier_trackingPreventionSecret_(self, v13, (uint64_t)v8, v14, v12);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  double v15;
  id v16;

  v4 = a3;
  objc_msgSend_diversifier(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, CFSTR("dS"));

  objc_msgSend_trackingPreventionSecret(self, v11, v12, v13);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v16, v15, CFSTR("tPS"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  IDSSigningKeyDiversifier *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;

  v3 = self;
  objc_msgSend_diversifier(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trackingPreventionSecret(v3, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_initWithDiversifier_trackingPreventionSecret_(v3, v12, (uint64_t)v7, v13, v11);

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  IDSSigningKeyDiversifier *v4;
  IDSSigningKeyDiversifier *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  char isEqual;

  v4 = (IDSSigningKeyDiversifier *)a3;
  if (self == v4)
  {
    isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_diversifier(v5, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_diversifier(self, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqual_(v9, v14, (uint64_t)v13, v15))
      {
        objc_msgSend_trackingPreventionSecret(v5, v16, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_trackingPreventionSecret(self, v20, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v19, v24, (uint64_t)v23, v25);

      }
      else
      {
        isEqual = 0;
      }

    }
    else
    {
      isEqual = 0;
    }
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  unint64_t v17;

  objc_msgSend_diversifier(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_trackingPreventionSecret(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_trackingPreventionSecret(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_diversifier(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v13, (uint64_t)CFSTR("<%@: %p tPS: %@, div: %@>"), v14, v4, self, v8, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSString)diversifier
{
  return self->_diversifier;
}

- (void)setDiversifier:(id)a3
{
  objc_storeStrong((id *)&self->_diversifier, a3);
}

- (NSData)trackingPreventionSecret
{
  return self->_trackingPreventionSecret;
}

- (void)setTrackingPreventionSecret:(id)a3
{
  objc_storeStrong((id *)&self->_trackingPreventionSecret, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingPreventionSecret, 0);
  objc_storeStrong((id *)&self->_diversifier, 0);
}

@end
