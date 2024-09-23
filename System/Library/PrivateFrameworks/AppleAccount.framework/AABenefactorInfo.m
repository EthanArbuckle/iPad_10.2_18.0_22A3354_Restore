@implementation AABenefactorInfo

- (AABenefactorInfo)initWithBeneficiaryID:(id)a3 benefactorAltDSID:(id)a4
{
  return -[AABenefactorInfo initWithBeneficiaryID:benefactorAltDSID:handle:](self, "initWithBeneficiaryID:benefactorAltDSID:handle:", a3, a4, 0);
}

- (AABenefactorInfo)initWithBeneficiaryID:(id)a3 benefactorAltDSID:(id)a4 handle:(id)a5
{
  return -[AABenefactorInfo initWithBeneficiaryID:handle:status:](self, "initWithBeneficiaryID:handle:status:", a3, a5, 1);
}

- (AABenefactorInfo)initWithBeneficiaryID:(id)a3 handle:(id)a4 status:(int64_t)a5
{
  id v9;
  id v10;
  AABenefactorInfo *v11;
  AABenefactorInfo *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AABenefactorInfo;
  v11 = -[AABenefactorInfo init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_beneficiaryID, a3);
    objc_storeStrong((id *)&v12->_handle, a4);
    v12->_status = a5;
  }

  return v12;
}

- (AABenefactorInfo)initWithCoder:(id)a3
{
  id v4;
  AABenefactorInfo *v5;
  uint64_t v6;
  NSUUID *beneficiaryID;
  uint64_t v8;
  AKInheritanceAccessKey *accessKey;
  uint64_t v10;
  NSString *handle;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AABenefactorInfo;
  v5 = -[AABenefactorInfo init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_beneficiaryID"));
    v6 = objc_claimAutoreleasedReturnValue();
    beneficiaryID = v5->_beneficiaryID;
    v5->_beneficiaryID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_accessKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    accessKey = v5->_accessKey;
    v5->_accessKey = (AKInheritanceAccessKey *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_handle"));
    v10 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_status"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = objc_msgSend(v12, "integerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *beneficiaryID;
  id v5;
  id v6;

  beneficiaryID = self->_beneficiaryID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", beneficiaryID, CFSTR("_beneficiaryID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessKey, CFSTR("_accessKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_handle, CFSTR("_handle"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_status);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("_status"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSUUID copy](self->_beneficiaryID, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[AKInheritanceAccessKey copy](self->_accessKey, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_handle, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v4[5] = self->_status;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_statusDescription
{
  int64_t v2;

  v2 = -[AABenefactorInfo status](self, "status");
  if ((unint64_t)(v2 + 1) > 5)
    return 0;
  else
    return *(&off_1E416E5E8 + v2 + 1);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSUUID *beneficiaryID;
  NSString *handle;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AABenefactorInfo accessKey](self, "accessKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "claimTokenString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AABenefactorInfo accessKey](self, "accessKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wrappingKeyString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_opt_class();
  beneficiaryID = self->_beneficiaryID;
  handle = self->_handle;
  -[AABenefactorInfo _statusDescription](self, "_statusDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AABenefactorInfo accessKey](self, "accessKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "claimTokenString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AABenefactorInfo accessKey](self, "accessKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "wrappingKeyString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p> \nBeneficiaryID: %@ \nBenefactor Handle: %@ \nStatus: %@ \nClaim Code: %@\nAccess Key: %@\nFull Access Key: %@"), v8, self, beneficiaryID, handle, v11, v13, v15, v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (NSUUID)beneficiaryID
{
  return self->_beneficiaryID;
}

- (NSString)benefactorAltDSID
{
  return self->_benefactorAltDSID;
}

- (AKInheritanceAccessKey)accessKey
{
  return self->_accessKey;
}

- (void)setAccessKey:(id)a3
{
  objc_storeStrong((id *)&self->_accessKey, a3);
}

- (NSString)handle
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_accessKey, 0);
  objc_storeStrong((id *)&self->_benefactorAltDSID, 0);
  objc_storeStrong((id *)&self->_beneficiaryID, 0);
}

@end
