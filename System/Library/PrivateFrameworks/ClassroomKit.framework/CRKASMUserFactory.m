@implementation CRKASMUserFactory

- (CRKASMUserFactory)initWithConfiguration:(id)a3 certificateVendor:(id)a4
{
  id v7;
  id v8;
  CRKASMUserFactory *v9;
  CRKASMUserFactory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKASMUserFactory;
  v9 = -[CRKASMUserFactory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v10->_certificateVendor, a4);
  }

  return v10;
}

- (id)userForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[CRKASMUserFactory cachedUserForPerson:](self, "cachedUserForPerson:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[CRKASMUserFactory makeUserForPerson:](self, "makeUserForPerson:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)trustedUserForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[CRKASMUserFactory cachedTrustedUserForPerson:](self, "cachedTrustedUserForPerson:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[CRKASMUserFactory makeTrustedUserForPerson:](self, "makeTrustedUserForPerson:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)cachedUserForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CRKASMUserFactory configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(self) = -[CRKASMUserFactory isUser:suitableForPerson:](self, "isUser:suitableForPerson:", v8, v4);
  if ((_DWORD)self)
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

- (id)makeUserForPerson:(id)a3
{
  id v4;
  CRKASMConcreteUser *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[CRKASMConcreteUser initWithBackingPerson:]([CRKASMConcreteUser alloc], "initWithBackingPerson:", v4);
  -[CRKASMUserFactory configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKey:", v5, v8);
  return v5;
}

- (id)cachedTrustedUserForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CRKASMUserFactory configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trustedUserCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(self) = -[CRKASMUserFactory isUser:suitableForPerson:](self, "isUser:suitableForPerson:", v8, v4);
  if ((_DWORD)self)
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

- (id)makeTrustedUserForPerson:(id)a3
{
  id v4;
  CRKASMConcreteTrustedUser *v5;
  void *v6;
  CRKASMConcreteTrustedUser *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = [CRKASMConcreteTrustedUser alloc];
  -[CRKASMUserFactory certificateVendor](self, "certificateVendor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CRKASMConcreteTrustedUser initWithBackingPerson:certificateVendor:](v5, "initWithBackingPerson:certificateVendor:", v4, v6);

  -[CRKASMUserFactory configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trustedUserCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKey:", v7, v10);
  return v7;
}

- (BOOL)isUser:(id)a3 suitableForPerson:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    v8 = a4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CRKASMUserFactory isUser:suitableForPerson:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("CRKASMUserFactory.m"), 91, CFSTR("expected %@, got %@"), v16, v18);

    }
    objc_msgSend(v7, "backingPersonInitialModificationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateLastModified");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v9, "isEqualToDate:", v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CRKASMUserFactory configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  CRKASMUserFactory *v8;
  CRKASMUserFactory *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  CRKASMUserFactory *v17;
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
  objc_msgSend(CFSTR("configuration"), "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_1;
  v28[3] = &unk_24D9C7230;
  v7 = v6;
  v29 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v28);

  v8 = self;
  v9 = (CRKASMUserFactory *)v4;
  v10 = v7;
  if (v8 == v9)
  {
    v21 = 1;
  }
  else if (-[CRKASMUserFactory isMemberOfClass:](v9, "isMemberOfClass:", objc_opt_class()))
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
          -[CRKASMUserFactory valueForKey:](v8, "valueForKey:", v16);
          v18 = objc_claimAutoreleasedReturnValue();
          -[CRKASMUserFactory valueForKey:](v17, "valueForKey:", v16);
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

- (CRKASMRosterProviderConfiguration)configuration
{
  return self->_configuration;
}

- (CRKASMCertificateVendor)certificateVendor
{
  return self->_certificateVendor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateVendor, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
