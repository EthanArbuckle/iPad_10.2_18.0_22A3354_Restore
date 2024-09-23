@implementation CRKFetchStagedAdHocIdentityCertificateResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchStagedAdHocIdentityCertificateResultObject)initWithCoder:(id)a3
{
  id v4;
  CRKFetchStagedAdHocIdentityCertificateResultObject *v5;
  void *v6;
  uint64_t v7;
  NSData *stagedAdHocIdentityCertificate;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKFetchStagedAdHocIdentityCertificateResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("stagedAdHocIdentityCertificate"));
    v7 = objc_claimAutoreleasedReturnValue();
    stagedAdHocIdentityCertificate = v5->_stagedAdHocIdentityCertificate;
    v5->_stagedAdHocIdentityCertificate = (NSData *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKFetchStagedAdHocIdentityCertificateResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CRKFetchStagedAdHocIdentityCertificateResultObject stagedAdHocIdentityCertificate](self, "stagedAdHocIdentityCertificate", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("stagedAdHocIdentityCertificate"));

}

- (NSData)stagedAdHocIdentityCertificate
{
  return self->_stagedAdHocIdentityCertificate;
}

- (void)setStagedAdHocIdentityCertificate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedAdHocIdentityCertificate, 0);
}

@end
