@implementation CRKASMConcreteCourse

- (CRKASMConcreteCourse)initWithBackingClass:(id)a3 location:(id)a4 persons:(id)a5 trustedPersons:(id)a6 identityVendor:(id)a7 manageableLocationIDs:(id)a8 environment:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  CRKASMConcreteCourse *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *backingClassObjectID;
  uint64_t v26;
  CRKASMCertificateVendor *certificateVendor;
  void *v28;
  void *v29;
  uint64_t v30;
  DMFControlGroupIdentifier *identifier;
  CRKASMConcreteLocation *v32;
  CRKASMLocation *location;
  uint64_t v34;
  NSString *name;
  uint64_t v36;
  NSArray *users;
  uint64_t v38;
  NSSet *trustedUserIdentifiers;
  void *v40;
  uint64_t v41;
  NSDate *creationDate;
  id v44;
  objc_super v45;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v44 = a7;
  v19 = a8;
  v20 = a9;
  v45.receiver = self;
  v45.super_class = (Class)CRKASMConcreteCourse;
  v21 = -[CRKASMConcreteCourse init](&v45, sel_init);
  if (v21)
  {
    objc_msgSend((id)objc_opt_class(), "trustedUsersFromPersons:environment:", v18, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    backingClassObjectID = v21->_backingClassObjectID;
    v21->_backingClassObjectID = (NSString *)v24;

    objc_storeStrong((id *)&v21->_identityVendor, a7);
    objc_msgSend(v20, "certificateVendor");
    v26 = objc_claimAutoreleasedReturnValue();
    certificateVendor = v21->_certificateVendor;
    v21->_certificateVendor = (CRKASMCertificateVendor *)v26;

    v28 = (void *)MEMORY[0x24BE2C7E8];
    objc_msgSend(v15, "objectID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "crk_identifierWithOpaqueString:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    identifier = v21->_identifier;
    v21->_identifier = (DMFControlGroupIdentifier *)v30;

    v21->_mascot = +[CRKClassKitColorAndMascotUtility mascotForClass:](CRKClassKitColorAndMascotUtility, "mascotForClass:", v15);
    v21->_color = +[CRKClassKitColorAndMascotUtility colorForClass:](CRKClassKitColorAndMascotUtility, "colorForClass:", v15);
    objc_storeStrong((id *)&v21->_trustedUsers, v22);
    v32 = -[CRKASMConcreteLocation initWithBackingLocation:]([CRKASMConcreteLocation alloc], "initWithBackingLocation:", v16);
    location = v21->_location;
    v21->_location = (CRKASMLocation *)v32;

    objc_msgSend((id)objc_opt_class(), "courseNameForClass:", v15);
    v34 = objc_claimAutoreleasedReturnValue();
    name = v21->_name;
    v21->_name = (NSString *)v34;

    objc_msgSend((id)objc_opt_class(), "usersFromPersons:environment:", v17, v20);
    v36 = objc_claimAutoreleasedReturnValue();
    users = v21->_users;
    v21->_users = (NSArray *)v36;

    objc_msgSend((id)objc_opt_class(), "trustedUserIdentifierForTrustedUsers:", v22);
    v38 = objc_claimAutoreleasedReturnValue();
    trustedUserIdentifiers = v21->_trustedUserIdentifiers;
    v21->_trustedUserIdentifiers = (NSSet *)v38;

    if ((objc_msgSend(v15, "isEditable") & 1) != 0)
    {
      objc_msgSend(v16, "objectID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v21->_editable = objc_msgSend(v19, "containsObject:", v40);

    }
    else
    {
      v21->_editable = 0;
    }
    objc_msgSend(v15, "dateCreated");
    v41 = objc_claimAutoreleasedReturnValue();
    creationDate = v21->_creationDate;
    v21->_creationDate = (NSDate *)v41;

  }
  return v21;
}

- (CRKIdentity)identity
{
  void *v2;
  void *v3;

  -[CRKASMConcreteCourse identityVendor](self, "identityVendor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CRKIdentity *)v3;
}

- (NSSet)allTrustedUserCertificates
{
  void *v3;
  void *v4;
  void *v5;

  -[CRKASMConcreteCourse certificateVendor](self, "certificateVendor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteCourse trustedUserIdentifiers](self, "trustedUserIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "certificatesForUserIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;

  -[CRKASMConcreteCourse identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CRKASMConcreteCourse name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[CRKASMConcreteCourse mascot](self, "mascot");
  v8 = v6 ^ v7 ^ -[CRKASMConcreteCourse color](self, "color");
  v9 = -[CRKASMConcreteCourse isEditable](self, "isEditable");
  -[CRKASMConcreteCourse users](self, "users");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8 ^ v9 ^ objc_msgSend(v10, "hash");
  -[CRKASMConcreteCourse trustedUsers](self, "trustedUsers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");
  -[CRKASMConcreteCourse identityVendor](self, "identityVendor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");
  -[CRKASMConcreteCourse certificateVendor](self, "certificateVendor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[CRKASMConcreteCourse location](self, "location");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11 ^ v17 ^ objc_msgSend(v18, "hash");
  -[CRKASMConcreteCourse creationDate](self, "creationDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 ^ objc_msgSend(v20, "hash");

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  CRKASMConcreteCourse *v8;
  CRKASMConcreteCourse *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  CRKASMConcreteCourse *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(CFSTR("identifier, name, mascot, color, editable, users, trustedUsers, identityVendor, certificateVendor, location, creationDate"), "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_3;
  v28[3] = &unk_24D9C7230;
  v7 = v6;
  v29 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v28);

  v8 = self;
  v9 = (CRKASMConcreteCourse *)v4;
  v10 = v7;
  if (v8 == v9)
  {
    v21 = 1;
  }
  else if (-[CRKASMConcreteCourse isMemberOfClass:](v9, "isMemberOfClass:", objc_opt_class()))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v23 = v10;
      v14 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * i);
          v17 = v9;
          -[CRKASMConcreteCourse valueForKey:](v8, "valueForKey:", v16);
          v18 = objc_claimAutoreleasedReturnValue();
          -[CRKASMConcreteCourse valueForKey:](v17, "valueForKey:", v16);
          v19 = objc_claimAutoreleasedReturnValue();

          if (v18 | v19)
          {
            v20 = objc_msgSend((id)v18, "isEqual:", v19);

            if (!v20)
            {
              v21 = 0;
              goto LABEL_16;
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v13)
          continue;
        break;
      }
      v21 = 1;
LABEL_16:
      v10 = v23;
    }
    else
    {
      v21 = 1;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  void *v18;

  v17 = (void *)MEMORY[0x24BDD17C8];
  v16 = objc_opt_class();
  -[CRKASMConcreteCourse identifier](self, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteCourse name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKASMConcreteCourse mascot](self, "mascot"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKASMConcreteCourse color](self, "color"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CRKASMConcreteCourse isEditable](self, "isEditable");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  v9 = v8;
  -[CRKASMConcreteCourse users](self, "users");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteCourse trustedUsers](self, "trustedUsers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteCourse location](self, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteCourse creationDate](self, "creationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@: %p { identifier = %@, name = %@, mascot = %@, color = %@, editable = %@, users = %@, trustedUsers = %@, location = %@, creationDate = %@ }>"), v16, self, v3, v4, v5, v6, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)trustedUserIdentifierForTrustedUsers:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(a3, "crk_mapUsingBlock:", &__block_literal_global_20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __61__CRKASMConcreteCourse_trustedUserIdentifierForTrustedUsers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

+ (id)courseNameForClass:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v3, "className");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v8, "copy");

  }
  return v7;
}

+ (id)usersFromPersons:(id)a3 environment:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__CRKASMConcreteCourse_usersFromPersons_environment___block_invoke;
  v9[3] = &unk_24D9C7AF0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "crk_mapUsingBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __53__CRKASMConcreteCourse_usersFromPersons_environment___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "userFactory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userForPerson:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)trustedUsersFromPersons:(id)a3 environment:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__CRKASMConcreteCourse_trustedUsersFromPersons_environment___block_invoke;
  v9[3] = &unk_24D9C7B18;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "crk_mapUsingBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __60__CRKASMConcreteCourse_trustedUsersFromPersons_environment___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "userFactory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trustedUserForPerson:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)color
{
  return self->_color;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (DMFControlGroupIdentifier)identifier
{
  return self->_identifier;
}

- (CRKASMLocation)location
{
  return self->_location;
}

- (unint64_t)mascot
{
  return self->_mascot;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)trustedUsers
{
  return self->_trustedUsers;
}

- (NSArray)users
{
  return self->_users;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)backingClassObjectID
{
  return self->_backingClassObjectID;
}

- (CRKASMIdentityVendor)identityVendor
{
  return self->_identityVendor;
}

- (CRKASMCertificateVendor)certificateVendor
{
  return self->_certificateVendor;
}

- (NSSet)trustedUserIdentifiers
{
  return self->_trustedUserIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedUserIdentifiers, 0);
  objc_storeStrong((id *)&self->_certificateVendor, 0);
  objc_storeStrong((id *)&self->_identityVendor, 0);
  objc_storeStrong((id *)&self->_backingClassObjectID, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_users, 0);
  objc_storeStrong((id *)&self->_trustedUsers, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
