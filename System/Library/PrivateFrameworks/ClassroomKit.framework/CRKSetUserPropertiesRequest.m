@implementation CRKSetUserPropertiesRequest

- (CRKSetUserPropertiesRequest)initWithUser:(id)a3
{
  id v4;
  CRKSetUserPropertiesRequest *v5;
  uint64_t v6;
  NSString *userIdentifier;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSNumber *useMeCardIfAvailable;

  v4 = a3;
  v5 = -[CATTaskRequest init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "userIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v6;

    objc_msgSend(v4, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v5->_displayName, v9);
    if (!v8)

    objc_msgSend(v4, "givenName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v5->_givenName, v11);
    if (!v10)

    objc_msgSend(v4, "familyName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v5->_familyName, v13);
    if (!v12)

    objc_msgSend(v4, "phoneticGivenName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v5->_phoneticGivenName, v15);
    if (!v14)

    objc_msgSend(v4, "phoneticFamilyName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v5->_phoneticFamilyName, v17);
    if (!v16)

    objc_msgSend(v4, "userSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v18)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v5->_userSource, v19);
    if (!v18)

    objc_msgSend(v4, "userImageData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v20)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v5->_imageData, v21);
    if (!v20)

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "shouldUseMeCardIfAvailable"));
    v22 = objc_claimAutoreleasedReturnValue();
    useMeCardIfAvailable = v5->_useMeCardIfAvailable;
    v5->_useMeCardIfAvailable = (NSNumber *)v22;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSetUserPropertiesRequest)initWithCoder:(id)a3
{
  id v4;
  CRKSetUserPropertiesRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *userIdentifier;
  void *v9;
  uint64_t v10;
  DMFControlGroupIdentifier *courseIdentifier;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSString *displayName;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSString *givenName;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSString *familyName;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSString *phoneticGivenName;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSString *phoneticFamilyName;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSString *userSource;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSData *imageData;
  void *v47;
  uint64_t v48;
  NSNumber *useMeCardIfAvailable;
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)CRKSetUserPropertiesRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v51, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("userIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("courseIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    courseIdentifier = v5->_courseIdentifier;
    v5->_courseIdentifier = (DMFControlGroupIdentifier *)v10;

    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("displayName"));
    v15 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v15;

    v17 = (void *)MEMORY[0x24BDBCF20];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("givenName"));
    v20 = objc_claimAutoreleasedReturnValue();
    givenName = v5->_givenName;
    v5->_givenName = (NSString *)v20;

    v22 = (void *)MEMORY[0x24BDBCF20];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("familyName"));
    v25 = objc_claimAutoreleasedReturnValue();
    familyName = v5->_familyName;
    v5->_familyName = (NSString *)v25;

    v27 = (void *)MEMORY[0x24BDBCF20];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("phoneticGivenName"));
    v30 = objc_claimAutoreleasedReturnValue();
    phoneticGivenName = v5->_phoneticGivenName;
    v5->_phoneticGivenName = (NSString *)v30;

    v32 = (void *)MEMORY[0x24BDBCF20];
    v33 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("phoneticFamilyName"));
    v35 = objc_claimAutoreleasedReturnValue();
    phoneticFamilyName = v5->_phoneticFamilyName;
    v5->_phoneticFamilyName = (NSString *)v35;

    v37 = (void *)MEMORY[0x24BDBCF20];
    v38 = objc_opt_class();
    objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("userSource"));
    v40 = objc_claimAutoreleasedReturnValue();
    userSource = v5->_userSource;
    v5->_userSource = (NSString *)v40;

    v42 = (void *)MEMORY[0x24BDBCF20];
    v43 = objc_opt_class();
    objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v44, CFSTR("imageData"));
    v45 = objc_claimAutoreleasedReturnValue();
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v45;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, CFSTR("useMeCardIfAvailable"));
    v48 = objc_claimAutoreleasedReturnValue();
    useMeCardIfAvailable = v5->_useMeCardIfAvailable;
    v5->_useMeCardIfAvailable = (NSNumber *)v48;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CRKSetUserPropertiesRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v15, sel_encodeWithCoder_, v4);
  -[CRKSetUserPropertiesRequest userIdentifier](self, "userIdentifier", v15.receiver, v15.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("userIdentifier"));

  -[CRKSetUserPropertiesRequest courseIdentifier](self, "courseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("courseIdentifier"));

  -[CRKSetUserPropertiesRequest displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("displayName"));

  -[CRKSetUserPropertiesRequest givenName](self, "givenName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("givenName"));

  -[CRKSetUserPropertiesRequest familyName](self, "familyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("familyName"));

  -[CRKSetUserPropertiesRequest phoneticGivenName](self, "phoneticGivenName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("phoneticGivenName"));

  -[CRKSetUserPropertiesRequest phoneticFamilyName](self, "phoneticFamilyName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("phoneticFamilyName"));

  -[CRKSetUserPropertiesRequest userSource](self, "userSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("userSource"));

  -[CRKSetUserPropertiesRequest imageData](self, "imageData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("imageData"));

  -[CRKSetUserPropertiesRequest useMeCardIfAvailable](self, "useMeCardIfAvailable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("useMeCardIfAvailable"));

}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (void)setCourseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_courseIdentifier, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)phoneticGivenName
{
  return self->_phoneticGivenName;
}

- (void)setPhoneticGivenName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)phoneticFamilyName
{
  return self->_phoneticFamilyName;
}

- (void)setPhoneticFamilyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)userSource
{
  return self->_userSource;
}

- (void)setUserSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)useMeCardIfAvailable
{
  return self->_useMeCardIfAvailable;
}

- (void)setUseMeCardIfAvailable:(id)a3
{
  objc_storeStrong((id *)&self->_useMeCardIfAvailable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useMeCardIfAvailable, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_userSource, 0);
  objc_storeStrong((id *)&self->_phoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_phoneticGivenName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_courseIdentifier, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

@end
