@implementation HMDHomeLockNotificationContextResolutionResult

- (HMDHomeLockNotificationContextResolutionResult)initWithUserUUID:(id)a3 label:(id)a4 labelIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDHomeLockNotificationContextResolutionResult *v12;
  HMDHomeLockNotificationContextResolutionResult *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDHomeLockNotificationContextResolutionResult;
  v12 = -[HMDHomeLockNotificationContextResolutionResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userUUID, a3);
    objc_storeStrong((id *)&v13->_label, a4);
    objc_storeStrong((id *)&v13->_labelIdentifier, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (!v6)
    goto LABEL_8;
  objc_msgSend(v6, "userUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeLockNotificationContextResolutionResult userUUID](self, "userUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = HMFEqualObjects();

  if (!v10)
    goto LABEL_8;
  objc_msgSend(v7, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeLockNotificationContextResolutionResult label](self, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = HMFEqualObjects();

  if (v13)
  {
    objc_msgSend(v7, "labelIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeLockNotificationContextResolutionResult labelIdentifier](self, "labelIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = HMFEqualObjects();

  }
  else
  {
LABEL_8:
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[HMDHomeLockNotificationContextResolutionResult userUUID](self, "userUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMDHomeLockNotificationContextResolutionResult label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMDHomeLockNotificationContextResolutionResult labelIdentifier](self, "labelIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (HMDHomeLockNotificationContextResolutionResult)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  HMDHomeLockNotificationContextResolutionResult *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDHomeLockNotificationContextResolutionResultUserUUIDCodingKey"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDHomeLockNotificationContextResolutionResultLabelCodingKey"));
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDHomeLockNotificationContextResolutionResultLabelIdentifierCodingKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 | v6)
  {
    self = -[HMDHomeLockNotificationContextResolutionResult initWithUserUUID:label:labelIdentifier:](self, "initWithUserUUID:label:labelIdentifier:", v5, v6, v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDHomeLockNotificationContextResolutionResult userUUID](self, "userUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMDHomeLockNotificationContextResolutionResultUserUUIDCodingKey"));

  -[HMDHomeLockNotificationContextResolutionResult label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMDHomeLockNotificationContextResolutionResultLabelCodingKey"));

  -[HMDHomeLockNotificationContextResolutionResult labelIdentifier](self, "labelIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMDHomeLockNotificationContextResolutionResultLabelIdentifierCodingKey"));

}

- (id)attributeDescriptions
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
  void *v13;
  void *v14;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHomeLockNotificationContextResolutionResult userUUID](self, "userUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("UserUUID"), v4);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHomeLockNotificationContextResolutionResult label](self, "label", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithName:value:options:formatter:", CFSTR("Label"), v7, 2, v8);
  v16[1] = v9;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHomeLockNotificationContextResolutionResult labelIdentifier](self, "labelIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithName:value:options:formatter:", CFSTR("LabelIdentifier"), v11, 2, v12);
  v16[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)labelIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
