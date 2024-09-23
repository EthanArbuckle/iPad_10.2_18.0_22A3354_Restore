@implementation PHCameraSmartSharingIdentity

- (PHCameraSmartSharingIdentity)initWithPhoneNumber:(id)a3 emailAddress:(id)a4 contactIdentifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHCameraSmartSharingIdentity *v11;
  uint64_t v12;
  NSString *phoneNumber;
  uint64_t v14;
  NSString *emailAddress;
  uint64_t v16;
  NSArray *contactIdentifiers;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PHCameraSmartSharingIdentity;
  v11 = -[PHCameraSmartSharingIdentity init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    phoneNumber = v11->_phoneNumber;
    v11->_phoneNumber = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    emailAddress = v11->_emailAddress;
    v11->_emailAddress = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    contactIdentifiers = v11->_contactIdentifiers;
    v11->_contactIdentifiers = (NSArray *)v16;

  }
  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCameraSmartSharingIdentity phoneNumber](self, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCameraSmartSharingIdentity emailAddress](self, "emailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCameraSmartSharingIdentity contactIdentifiers](self, "contactIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; phoneNumber:%@ emailAddress:%@ contactIdentifier:%@>"),
    v5,
    self,
    v6,
    v7,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  PHCameraSmartSharingIdentity *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = (PHCameraSmartSharingIdentity *)a3;
  if (v5 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PHCameraSmartSharingIdentity phoneNumber](self, "phoneNumber");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6
        || (-[PHCameraSmartSharingIdentity phoneNumber](v5, "phoneNumber"),
            (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[PHCameraSmartSharingIdentity phoneNumber](self, "phoneNumber");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHCameraSmartSharingIdentity phoneNumber](v5, "phoneNumber");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

        if (v6)
        {

          if (!v9)
            goto LABEL_19;
        }
        else
        {

          if ((v9 & 1) == 0)
            goto LABEL_19;
        }
      }
      -[PHCameraSmartSharingIdentity emailAddress](self, "emailAddress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        -[PHCameraSmartSharingIdentity emailAddress](v5, "emailAddress");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
        {
LABEL_14:
          -[PHCameraSmartSharingIdentity contactIdentifiers](self, "contactIdentifiers");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15
            || (-[PHCameraSmartSharingIdentity contactIdentifiers](v5, "contactIdentifiers"),
                (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[PHCameraSmartSharingIdentity contactIdentifiers](self, "contactIdentifiers");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHCameraSmartSharingIdentity contactIdentifiers](v5, "contactIdentifiers");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v16, "isEqual:", v17);

            if (v15)
            {
LABEL_23:

              goto LABEL_20;
            }
          }
          else
          {
            v10 = 1;
          }

          goto LABEL_23;
        }
      }
      -[PHCameraSmartSharingIdentity emailAddress](self, "emailAddress");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHCameraSmartSharingIdentity emailAddress](v5, "emailAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (v11)
      {

        if (v14)
          goto LABEL_14;
      }
      else
      {

        if ((v14 & 1) != 0)
          goto LABEL_14;
      }
    }
LABEL_19:
    v10 = 0;
    goto LABEL_20;
  }
  v10 = 1;
LABEL_20:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PHCameraSmartSharingIdentity phoneNumber](self, "phoneNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[PHCameraSmartSharingIdentity phoneNumber](self, "phoneNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hash");

  }
  else
  {
    v6 = 0;
  }
  -[PHCameraSmartSharingIdentity emailAddress](self, "emailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[PHCameraSmartSharingIdentity emailAddress](self, "emailAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 ^= objc_msgSend(v9, "hash");

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PHCameraSmartSharingIdentity contactIdentifiers](self, "contactIdentifiers", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v6 ^= objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14++), "hash");
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

  return v6;
}

- (PHCameraSmartSharingIdentity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PHCameraSmartSharingIdentity *v9;
  NSObject *v11;
  uint8_t v12[16];

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("emailAddress"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClasses:forKey:", v7, CFSTR("contactIdentifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length") || objc_msgSend(v6, "length") || objc_msgSend(v8, "count"))
  {
    self = -[PHCameraSmartSharingIdentity initWithPhoneNumber:emailAddress:contactIdentifiers:](self, "initWithPhoneNumber:emailAddress:contactIdentifiers:", v5, v6, v8);
    v9 = self;
  }
  else
  {
    PLPhotoKitGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_ERROR, "[PHCameraSmartSharingIdentity] decode fail, no valid properties", v12, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PHCameraSmartSharingIdentity phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("phoneNumber"));

  -[PHCameraSmartSharingIdentity emailAddress](self, "emailAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("emailAddress"));

  -[PHCameraSmartSharingIdentity contactIdentifiers](self, "contactIdentifiers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("contactIdentifiers"));

}

- (NSString)phoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)emailAddress
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)contactIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
