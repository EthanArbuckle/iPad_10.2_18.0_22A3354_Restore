@implementation CNContactStoreConfiguration

- (CNContactStoreConfiguration)init
{
  CNContactStoreConfiguration *v2;
  uint64_t v3;
  CNContactsEnvironment *environment;
  CNContactStoreConfiguration *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNContactStoreConfiguration;
  v2 = -[CNContactStoreConfiguration init](&v7, sel_init);
  if (v2)
  {
    +[CNContactsEnvironment currentEnvironment](CNContactsEnvironment, "currentEnvironment");
    v3 = objc_claimAutoreleasedReturnValue();
    environment = v2->_environment;
    v2->_environment = (CNContactsEnvironment *)v3;

    v2->_includeLocalContacts = 1;
    v2->_includeSharedPhotoContacts = 1;
    v5 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_assumedIdentity, 0);
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (void)setIncludeLocalContacts:(BOOL)a3
{
  self->_includeLocalContacts = a3;
}

- (void)setUseInProcessMapperExclusively:(BOOL)a3
{
  self->_useInProcessMapperExclusively = a3;
}

- (void)setIncludeDonatedContacts:(BOOL)a3
{
  self->_includeDonatedContacts = a3;
}

- (void)setIncludeSuggestedContacts:(BOOL)a3
{
  self->_includeSuggestedContacts = a3;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (void)setIncludeIncludeManagedAppleIDs:(BOOL)a3
{
  self->_includeIncludeManagedAppleIDs = a3;
}

- (CNContactsEnvironment)environment
{
  return self->_environment;
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (BOOL)isContactProvider
{
  return self->_isContactProvider;
}

- (OS_tcc_identity)assumedIdentity
{
  return self->_assumedIdentity;
}

- (BOOL)includeSuggestedContacts
{
  return self->_includeSuggestedContacts;
}

- (BOOL)includeLocalContacts
{
  return self->_includeLocalContacts;
}

- (BOOL)includeIncludeManagedAppleIDs
{
  return self->_includeIncludeManagedAppleIDs;
}

- (BOOL)includeDonatedContacts
{
  return self->_includeDonatedContacts;
}

- (BOOL)includeSharedPhotoContacts
{
  return self->_includeSharedPhotoContacts;
}

- (BOOL)useOutOfProcessMapperExclusively
{
  return self->_useOutOfProcessMapperExclusively;
}

- (BOOL)useInProcessMapperExclusively
{
  return self->_useInProcessMapperExclusively;
}

- (BOOL)leaveSingleStoresUnwrapped
{
  return self->_leaveSingleStoresUnwrapped;
}

- (void)setAssumedIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_assumedIdentity, a3);
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("includeLocalContacts"), self->_includeLocalContacts);
  v5 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("includeSuggestedContacts"), self->_includeSuggestedContacts);
  v6 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("includeDonatedContacts"), self->_includeDonatedContacts);
  v7 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("includeIncludeManagedAppleIDs"), self->_includeIncludeManagedAppleIDs);
  v8 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("includeSharedPhotoContacts"), self->_includeSharedPhotoContacts);
  v9 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("useOutOfProcessMapperExclusively"), self->_useOutOfProcessMapperExclusively);
  v10 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("useInProcessMapperExclusively"), self->_useInProcessMapperExclusively);
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", self->_assumedIdentity, CFSTR("assumedIdentity"));
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", self->_environment, CFSTR("environment"));
  v13 = (id)objc_msgSend(v3, "appendObject:withName:", self->_managedConfiguration, CFSTR("managedConfiguration"));
  v14 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("isContactProvider"), self->_isContactProvider);
  objc_msgSend(v3, "build");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)setIncludeSharedPhotoContacts:(BOOL)a3
{
  self->_includeSharedPhotoContacts = a3;
}

- (void)setUseOutOfProcessMapperExclusively:(BOOL)a3
{
  self->_useOutOfProcessMapperExclusively = a3;
}

- (void)setIsContactProvider:(BOOL)a3
{
  self->_isContactProvider = a3;
}

- (void)setLeaveSingleStoresUnwrapped:(BOOL)a3
{
  self->_leaveSingleStoresUnwrapped = a3;
}

@end
