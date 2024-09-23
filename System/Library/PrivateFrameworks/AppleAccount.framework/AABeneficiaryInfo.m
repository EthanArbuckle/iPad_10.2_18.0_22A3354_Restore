@implementation AABeneficiaryInfo

- (AABeneficiaryInfo)initWithBeneficiaryID:(id)a3 benefactorAltDSID:(id)a4 handle:(id)a5
{
  id v9;
  AABeneficiaryInfo *v10;
  AABeneficiaryInfo *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AABeneficiaryInfo;
  v10 = -[AABeneficiary initWithBeneficiaryID:benefactorAltDSID:](&v13, sel_initWithBeneficiaryID_benefactorAltDSID_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_handle, a5);

  return v11;
}

- (AABeneficiaryInfo)initWithCoder:(id)a3
{
  id v4;
  AABeneficiaryInfo *v5;
  uint64_t v6;
  NSString *handle;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AABeneficiaryInfo;
  v5 = -[AABeneficiary initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_handle"));
    v6 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (NSString *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AABeneficiaryInfo;
  v4 = -[AABeneficiary copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_handle, "copy");
  v6 = (void *)v4[4];
  v4[4] = v5;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AABeneficiaryInfo;
  v4 = a3;
  -[AABeneficiary encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_handle, CFSTR("_handle"), v5.receiver, v5.super_class);

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *handle;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AABeneficiary accessKey](self, "accessKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "claimTokenString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AABeneficiary accessKey](self, "accessKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wrappingKeyString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  v18.receiver = self;
  v18.super_class = (Class)AABeneficiaryInfo;
  -[AABeneficiary description](&v18, sel_description);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  handle = self->_handle;
  -[AABeneficiary accessKey](self, "accessKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "claimTokenString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AABeneficiary accessKey](self, "accessKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "wrappingKeyString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ \nHandle: %@ \nClaim Code: %@\nAccess Key: %@\nFull Access Key: %@"), v10, handle, v13, v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (NSString)handle
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
