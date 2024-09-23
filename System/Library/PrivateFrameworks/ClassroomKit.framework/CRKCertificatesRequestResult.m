@implementation CRKCertificatesRequestResult

- (CRKCertificatesRequestResult)initWithIsValidRequest:(BOOL)a3 certificateDataCollection:(id)a4
{
  id v6;
  CRKCertificatesRequestResult *v7;
  CRKCertificatesRequestResult *v8;
  uint64_t v9;
  NSArray *certificateDataCollection;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKCertificatesRequestResult;
  v7 = -[CRKCertificatesRequestResult init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_validRequest = a3;
    v9 = objc_msgSend(v6, "copy");
    certificateDataCollection = v8->_certificateDataCollection;
    v8->_certificateDataCollection = (NSArray *)v9;

  }
  return v8;
}

+ (id)invalidResult
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithIsValidRequest:certificateDataCollection:", 0, 0);
}

+ (id)resultWithCertificateDataCollection:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIsValidRequest:certificateDataCollection:", 1, v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKCertificatesRequestResult)initWithCoder:(id)a3
{
  id v4;
  CRKCertificatesRequestResult *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *certificateDataCollection;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKCertificatesRequestResult;
  v5 = -[CRKCertificatesRequestResult init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("validRequest"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_validRequest = objc_msgSend(v6, "BOOLValue");

    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("certificateDataCollection"));
    v10 = objc_claimAutoreleasedReturnValue();
    certificateDataCollection = v5->_certificateDataCollection;
    v5->_certificateDataCollection = (NSArray *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithBool:", -[CRKCertificatesRequestResult isValidRequest](self, "isValidRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("validRequest"));

  -[CRKCertificatesRequestResult certificateDataCollection](self, "certificateDataCollection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("certificateDataCollection"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKCertificatesRequestResult isValidRequest](self, "isValidRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CRKCertificatesRequestResult certificateDataCollection](self, "certificateDataCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CRKCertificatesRequestResult *v4;
  CRKCertificatesRequestResult *v5;
  CRKCertificatesRequestResult *v6;
  BOOL v7;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;

  v4 = (CRKCertificatesRequestResult *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CRKCertificatesRequestResult isEqual:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("CRKCertificatesRequestResult.m"), 78, CFSTR("expected %@, got %@"), v12, v14);

    }
    v7 = -[CRKCertificatesRequestResult isEqualToResult:](self, "isEqualToResult:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToResult:(id)a3
{
  id v4;
  int v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "isValidRequest");
  if (v5 == -[CRKCertificatesRequestResult isValidRequest](self, "isValidRequest"))
  {
    objc_msgSend(v4, "certificateDataCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKCertificatesRequestResult certificateDataCollection](self, "certificateDataCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToArray:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[CRKCertificatesRequestResult isValidRequest](self, "isValidRequest");
  -[CRKCertificatesRequestResult certificateDataCollection](self, "certificateDataCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithIsValidRequest:certificateDataCollection:", v5, v6);

  return v7;
}

- (BOOL)isValidRequest
{
  return self->_validRequest;
}

- (NSArray)certificateDataCollection
{
  return self->_certificateDataCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateDataCollection, 0);
}

@end
