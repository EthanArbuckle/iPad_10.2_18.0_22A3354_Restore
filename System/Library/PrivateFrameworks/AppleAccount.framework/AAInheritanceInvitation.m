@implementation AAInheritanceInvitation

- (AAInheritanceInvitation)initWithBeneficiaryID:(id)a3 beneficiaryHandle:(id)a4
{
  return -[AAInheritanceInvitation initWithBeneficiaryID:beneficiaryHandle:beneficiaryFirstName:beneficiaryLastName:beneficiaryDisplayName:status:](self, "initWithBeneficiaryID:beneficiaryHandle:beneficiaryFirstName:beneficiaryLastName:beneficiaryDisplayName:status:", a3, a4, 0, 0, 0, 1);
}

- (AAInheritanceInvitation)initWithBeneficiaryID:(id)a3 beneficiaryHandle:(id)a4 beneficiaryFirstName:(id)a5 beneficiaryLastName:(id)a6 beneficiaryDisplayName:(id)a7 status:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  AAInheritanceInvitation *v18;
  AAInheritanceInvitation *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)AAInheritanceInvitation;
  v18 = -[AAInheritanceInvitation init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_beneficiaryID, a3);
    objc_storeStrong((id *)&v19->_beneficiaryHandle, a4);
    objc_storeStrong((id *)&v19->_beneficiaryFirstName, a5);
    objc_storeStrong((id *)&v19->_beneficiaryLastName, a6);
    objc_storeStrong((id *)&v19->_beneficiaryDisplayName, a7);
    v19->_status = a8;
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *beneficiaryID;
  id v5;
  id v6;

  beneficiaryID = self->_beneficiaryID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", beneficiaryID, CFSTR("_beneficiaryID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beneficiaryHandle, CFSTR("_beneficiaryHandle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beneficiaryFirstName, CFSTR("_beneficiaryFirstName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beneficiaryLastName, CFSTR("_beneficiaryLastName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beneficiaryDisplayName, CFSTR("_beneficiaryHandle"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_status);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("_status"));

}

- (AAInheritanceInvitation)initWithCoder:(id)a3
{
  id v4;
  AAInheritanceInvitation *v5;
  uint64_t v6;
  NSUUID *beneficiaryID;
  uint64_t v8;
  NSString *beneficiaryHandle;
  uint64_t v10;
  NSString *beneficiaryFirstName;
  uint64_t v12;
  NSString *beneficiaryLastName;
  uint64_t v14;
  NSString *beneficiaryDisplayName;
  void *v16;

  v4 = a3;
  v5 = -[AAInheritanceInvitation init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_beneficiaryID"));
    v6 = objc_claimAutoreleasedReturnValue();
    beneficiaryID = v5->_beneficiaryID;
    v5->_beneficiaryID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_beneficiaryHandle"));
    v8 = objc_claimAutoreleasedReturnValue();
    beneficiaryHandle = v5->_beneficiaryHandle;
    v5->_beneficiaryHandle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_beneficiaryFirstName"));
    v10 = objc_claimAutoreleasedReturnValue();
    beneficiaryFirstName = v5->_beneficiaryFirstName;
    v5->_beneficiaryFirstName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_beneficiaryLastName"));
    v12 = objc_claimAutoreleasedReturnValue();
    beneficiaryLastName = v5->_beneficiaryLastName;
    v5->_beneficiaryLastName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_beneficiaryHandle"));
    v14 = objc_claimAutoreleasedReturnValue();
    beneficiaryDisplayName = v5->_beneficiaryDisplayName;
    v5->_beneficiaryDisplayName = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_status"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = objc_msgSend(v16, "integerValue");

  }
  return v5;
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
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSUUID copy](self->_beneficiaryID, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_beneficiaryHandle, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSString copy](self->_beneficiaryFirstName, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  v11 = -[NSString copy](self->_beneficiaryLastName, "copy");
  v12 = (void *)v4[4];
  v4[4] = v11;

  v13 = -[NSString copy](self->_beneficiaryDisplayName, "copy");
  v14 = (void *)v4[5];
  v4[5] = v13;

  v4[6] = self->_status;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  AAInheritanceInvitation *v4;
  AAInheritanceInvitation *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (AAInheritanceInvitation *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AAInheritanceInvitation beneficiaryID](self, "beneficiaryID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAInheritanceInvitation beneficiaryID](v5, "beneficiaryID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)_statusDescription
{
  int64_t v2;

  v2 = -[AAInheritanceInvitation status](self, "status");
  if ((unint64_t)(v2 + 1) > 5)
    return 0;
  else
    return *(&off_1E416EE98 + v2 + 1);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[AAInheritanceInvitation _statusDescription](self, "_statusDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> Inheritance Invitation with Status: %@ \nBeneficiary ID: %@ \nBeneficiary Handle: %@ \nBeneficiary FirstName: %@, \nBeneficiary LastName: %@ \nBeneficiary DisplayName: %@"), v4, self, v5, self->_beneficiaryID, self->_beneficiaryHandle, self->_beneficiaryFirstName, self->_beneficiaryLastName, self->_beneficiaryDisplayName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSUUID)beneficiaryID
{
  return self->_beneficiaryID;
}

- (NSString)beneficiaryHandle
{
  return self->_beneficiaryHandle;
}

- (NSString)beneficiaryFirstName
{
  return self->_beneficiaryFirstName;
}

- (NSString)beneficiaryLastName
{
  return self->_beneficiaryLastName;
}

- (NSString)beneficiaryDisplayName
{
  return self->_beneficiaryDisplayName;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beneficiaryDisplayName, 0);
  objc_storeStrong((id *)&self->_beneficiaryLastName, 0);
  objc_storeStrong((id *)&self->_beneficiaryFirstName, 0);
  objc_storeStrong((id *)&self->_beneficiaryHandle, 0);
  objc_storeStrong((id *)&self->_beneficiaryID, 0);
}

@end
