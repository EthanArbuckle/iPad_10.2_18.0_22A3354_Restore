@implementation CRKASMConcreteRoster

- (CRKASMConcreteRoster)initWithOrganization:(id)a3 user:(id)a4 courses:(id)a5 certificateVendor:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CRKASMConcreteRoster *v15;
  CRKASMConcreteRoster *v16;
  uint64_t v17;
  NSArray *courses;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CRKASMConcreteRoster;
  v15 = -[CRKASMConcreteRoster init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_organization, a3);
    objc_storeStrong((id *)&v16->_user, a4);
    v17 = objc_msgSend(v13, "copy");
    courses = v16->_courses;
    v16->_courses = (NSArray *)v17;

    objc_storeStrong((id *)&v16->_certificateVendor, a6);
  }

  return v16;
}

- (NSSet)allTrustedUserCertificates
{
  void *v3;
  void *v4;
  void *v5;

  -[CRKASMConcreteRoster certificateVendor](self, "certificateVendor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteRoster allTrustedUserIdentifiers](self, "allTrustedUserIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "certificatesForUserIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (id)allTrustedUserIdentifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[CRKASMConcreteRoster courses](self, "courses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v9, "trustedUsers", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "identifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v15);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  v16 = (void *)objc_msgSend(v3, "copy");
  return v16;
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

  -[CRKASMConcreteRoster organization](self, "organization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CRKASMConcreteRoster user](self, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[CRKASMConcreteRoster courses](self, "courses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[CRKASMConcreteRoster certificateVendor](self, "certificateVendor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  CRKASMConcreteRoster *v8;
  CRKASMConcreteRoster *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  CRKASMConcreteRoster *v17;
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
  objc_msgSend(CFSTR("organization, user, courses, certificateVendor"), "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke;
  v28[3] = &unk_24D9C7230;
  v7 = v6;
  v29 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v28);

  v8 = self;
  v9 = (CRKASMConcreteRoster *)v4;
  v10 = v7;
  if (v8 == v9)
  {
    v21 = 1;
  }
  else if (-[CRKASMConcreteRoster isMemberOfClass:](v9, "isMemberOfClass:", objc_opt_class()))
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
          -[CRKASMConcreteRoster valueForKey:](v8, "valueForKey:", v16);
          v18 = objc_claimAutoreleasedReturnValue();
          -[CRKASMConcreteRoster valueForKey:](v17, "valueForKey:", v16);
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

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRKASMConcreteRoster courses](self, "courses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteRoster user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteRoster organization](self, "organization");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { courses = %@, user = %@, organization = %@ }>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (CRKASMOrganization)organization
{
  return self->_organization;
}

- (CRKASMUser)user
{
  return self->_user;
}

- (NSArray)courses
{
  return self->_courses;
}

- (CRKASMCertificateVendor)certificateVendor
{
  return self->_certificateVendor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateVendor, 0);
  objc_storeStrong((id *)&self->_courses, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_organization, 0);
}

@end
