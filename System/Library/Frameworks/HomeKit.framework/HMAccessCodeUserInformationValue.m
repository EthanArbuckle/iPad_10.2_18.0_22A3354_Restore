@implementation HMAccessCodeUserInformationValue

- (HMAccessCodeUserInformationValue)initWithSimpleLabel:(id)a3 labelIdentifier:(id)a4 userUUID:(id)a5 removedUserInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMAccessCodeUserInformationValue *v14;
  uint64_t v15;
  NSString *simpleLabel;
  uint64_t v17;
  NSUUID *labelIdentifier;
  uint64_t v19;
  NSUUID *userUUID;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HMAccessCodeUserInformationValue;
  v14 = -[HMAccessCodeUserInformationValue init](&v22, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    simpleLabel = v14->_simpleLabel;
    v14->_simpleLabel = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    labelIdentifier = v14->_labelIdentifier;
    v14->_labelIdentifier = (NSUUID *)v17;

    v19 = objc_msgSend(v12, "copy");
    userUUID = v14->_userUUID;
    v14->_userUUID = (NSUUID *)v19;

    objc_storeStrong((id *)&v14->_removedUserInfo, a6);
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_9;
  -[HMAccessCodeUserInformationValue simpleLabel](self, "simpleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "simpleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HMFEqualObjects();

  if (!v9)
    goto LABEL_9;
  -[HMAccessCodeUserInformationValue labelIdentifier](self, "labelIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "labelIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HMFEqualObjects();

  if (!v12)
    goto LABEL_9;
  -[HMAccessCodeUserInformationValue userUUID](self, "userUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = HMFEqualObjects();

  if (v15)
  {
    -[HMAccessCodeUserInformationValue removedUserInfo](self, "removedUserInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removedUserInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = HMFEqualObjects();

  }
  else
  {
LABEL_9:
    v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[HMAccessCodeUserInformationValue simpleLabel](self, "simpleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMAccessCodeUserInformationValue labelIdentifier](self, "labelIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HMAccessCodeUserInformationValue userUUID](self, "userUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[HMAccessCodeUserInformationValue removedUserInfo](self, "removedUserInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMAccessCodeUserInformationValue simpleLabel](self, "simpleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMAccessCodeUserInformationValueCodingKeySimpleLabel"));

  -[HMAccessCodeUserInformationValue labelIdentifier](self, "labelIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMAccessCodeUserInformationValueCodingKeyLabelUUID"));

  -[HMAccessCodeUserInformationValue userUUID](self, "userUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMAccessCodeUserInformationValueCodingKeyUserUUID"));

  -[HMAccessCodeUserInformationValue removedUserInfo](self, "removedUserInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMAccessCodeUserInformationValueCodingKeyRemovedUserInfo"));

}

- (HMAccessCodeUserInformationValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMAccessCodeUserInformationValue *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessCodeUserInformationValueCodingKeySimpleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessCodeUserInformationValueCodingKeyLabelUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessCodeUserInformationValueCodingKeyUserUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessCodeUserInformationValueCodingKeyRemovedUserInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HMAccessCodeUserInformationValue initWithSimpleLabel:labelIdentifier:userUUID:removedUserInfo:](self, "initWithSimpleLabel:labelIdentifier:userUUID:removedUserInfo:", v5, v6, v7, v8);
  return v9;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessCodeUserInformationValue simpleLabel](self, "simpleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:value:options:formatter:", CFSTR("simpleLabel"), v4, 2, v5);
  v18[0] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessCodeUserInformationValue labelIdentifier](self, "labelIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("labelIdentifier"), v8);
  v18[1] = v9;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessCodeUserInformationValue userUUID](self, "userUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("userUUID"), v11);
  v18[2] = v12;
  v13 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessCodeUserInformationValue removedUserInfo](self, "removedUserInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("removedUserInfo"), v14);
  v18[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v16;
}

- (NSString)simpleLabel
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)labelIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (HMRemovedUserInfo)removedUserInfo
{
  return (HMRemovedUserInfo *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedUserInfo, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_labelIdentifier, 0);
  objc_storeStrong((id *)&self->_simpleLabel, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
