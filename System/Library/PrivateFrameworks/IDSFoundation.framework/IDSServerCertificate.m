@implementation IDSServerCertificate

- (IDSServerCertificate)initWithDataRepresentation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  IDSServerCertificate *v7;
  double v8;
  uint64_t v9;
  NSData *dataRepresentation;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IDSServerCertificate;
  v7 = -[IDSServerCertificate init](&v12, sel_init);
  if (v7)
  {
    v9 = objc_msgSend_copy(v4, v5, v6, v8);
    dataRepresentation = v7->_dataRepresentation;
    v7->_dataRepresentation = (NSData *)v9;

  }
  return v7;
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
  uint64_t v12;
  const char *v13;
  double v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_dataRepresentation(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_hash(v8, v9, v10, v11);
  objc_msgSend_stringWithFormat_(v3, v13, (uint64_t)CFSTR("<%@: %p hash: %lu>"), v14, v4, self, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
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
  char isEqualToData;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_dataRepresentation(v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataRepresentation(self, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToData = objc_msgSend_isEqualToData_(v8, v13, (uint64_t)v12, v14);

  }
  else
  {
    isEqualToData = 0;
  }

  return isEqualToData;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  unint64_t v8;

  objc_msgSend_dataRepresentation(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (NSData)dataRepresentation
{
  return self->_dataRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataRepresentation, 0);
}

@end
