@implementation HMAccessCodeUserInformation

- (HMAccessCodeUserInformation)initWithSimpleLabel:(id)a3
{
  return -[HMAccessCodeUserInformation initWithSimpleLabel:labelIdentifier:user:removedUserInfo:](self, "initWithSimpleLabel:labelIdentifier:user:removedUserInfo:", a3, 0, 0, 0);
}

- (HMAccessCodeUserInformation)initWithSimpleLabel:(id)a3 labelIdentifier:(id)a4
{
  return -[HMAccessCodeUserInformation initWithSimpleLabel:labelIdentifier:user:removedUserInfo:](self, "initWithSimpleLabel:labelIdentifier:user:removedUserInfo:", a3, a4, 0, 0);
}

- (HMAccessCodeUserInformation)initWithUser:(id)a3
{
  return -[HMAccessCodeUserInformation initWithSimpleLabel:labelIdentifier:user:removedUserInfo:](self, "initWithSimpleLabel:labelIdentifier:user:removedUserInfo:", 0, 0, a3, 0);
}

- (HMAccessCodeUserInformation)initWithRemovedUserInfo:(id)a3
{
  return -[HMAccessCodeUserInformation initWithSimpleLabel:labelIdentifier:user:removedUserInfo:](self, "initWithSimpleLabel:labelIdentifier:user:removedUserInfo:", 0, 0, 0, a3);
}

- (HMAccessCodeUserInformation)initWithSimpleLabel:(id)a3 labelIdentifier:(id)a4 user:(id)a5 removedUserInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMAccessCodeUserInformation *v14;
  uint64_t v15;
  NSString *simpleLabel;
  uint64_t v17;
  NSUUID *labelIdentifier;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMAccessCodeUserInformation;
  v14 = -[HMAccessCodeUserInformation init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    simpleLabel = v14->_simpleLabel;
    v14->_simpleLabel = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    labelIdentifier = v14->_labelIdentifier;
    v14->_labelIdentifier = (NSUUID *)v17;

    objc_storeStrong((id *)&v14->_user, a5);
    objc_storeStrong((id *)&v14->_removedUserInfo, a6);
  }

  return v14;
}

- (id)createAccessCodeUserInformationValue
{
  HMAccessCodeUserInformationValue *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMAccessCodeUserInformationValue *v9;

  v3 = [HMAccessCodeUserInformationValue alloc];
  -[HMAccessCodeUserInformation simpleLabel](self, "simpleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessCodeUserInformation labelIdentifier](self, "labelIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessCodeUserInformation user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessCodeUserInformation removedUserInfo](self, "removedUserInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMAccessCodeUserInformationValue initWithSimpleLabel:labelIdentifier:userUUID:removedUserInfo:](v3, "initWithSimpleLabel:labelIdentifier:userUUID:removedUserInfo:", v4, v5, v7, v8);

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
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessCodeUserInformation simpleLabel](self, "simpleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:options:formatter:", CFSTR("simpleLabel"), v18, 2, v4);
  v19[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessCodeUserInformation labelIdentifier](self, "labelIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithName:value:options:formatter:", CFSTR("labelIdentifier"), v7, 2, v8);
  v19[1] = v9;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessCodeUserInformation user](self, "user");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("user"), v11);
  v19[2] = v12;
  v13 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessCodeUserInformation removedUserInfo](self, "removedUserInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("removedUserInfo"), v14);
  v19[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
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

- (HMUser)user
{
  return (HMUser *)objc_getProperty(self, a2, 24, 1);
}

- (HMRemovedUserInfo)removedUserInfo
{
  return (HMRemovedUserInfo *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedUserInfo, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_labelIdentifier, 0);
  objc_storeStrong((id *)&self->_simpleLabel, 0);
}

+ (HMAccessCodeUserInformation)userInformationWithValue:(id)a3 home:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  HMAccessCodeUserInformation *v9;
  void *v10;
  void *v11;
  void *v12;
  HMAccessCodeUserInformation *v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "userUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "userUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userWithUUID:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = [HMAccessCodeUserInformation alloc];
  objc_msgSend(v5, "simpleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "labelIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removedUserInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMAccessCodeUserInformation initWithSimpleLabel:labelIdentifier:user:removedUserInfo:](v9, "initWithSimpleLabel:labelIdentifier:user:removedUserInfo:", v10, v11, v7, v12);

  return v13;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
