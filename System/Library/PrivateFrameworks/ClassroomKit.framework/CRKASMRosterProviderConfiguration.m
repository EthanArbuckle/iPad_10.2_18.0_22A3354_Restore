@implementation CRKASMRosterProviderConfiguration

+ (CRKASMRosterProviderConfiguration)studentRosterConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;

  +[CRKClassKitFacadeFactory makeStudentClassKitFacade](CRKClassKitFacadeFactory, "makeStudentClassKitFacade");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKConcreteClassKitRosterRequirements studentRosterRequirementsWithClassKitFacade:](CRKConcreteClassKitRosterRequirements, "studentRosterRequirementsWithClassKitFacade:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKASMCredentialStoreFactory studentCredentialStore](CRKASMCredentialStoreFactory, "studentCredentialStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc((Class)a1);
  LOBYTE(v9) = objc_msgSend(a1, "userCachingEnabled");
  v7 = (void *)objc_msgSend(v6, "initWithUserCommonNamePrefix:trustedUserCommonNamePrefix:classKitFacade:rosterRequirements:credentialStore:maxCourseUsersCount:maxCourseTrustedUsersCount:rosterMutationTimeout:userCachingEnabled:", CFSTR("member: ASM"), CFSTR("leader: ASM"), v3, v4, v5, 100, 60.0, 15, v9);

  return (CRKASMRosterProviderConfiguration *)v7;
}

+ (CRKASMRosterProviderConfiguration)instructorRosterConfiguration
{
  void *v3;
  void *v4;

  +[CRKASMCredentialStoreFactory instructorCredentialStore](CRKASMCredentialStoreFactory, "instructorCredentialStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "instructorRosterConfigurationWithCredentialStore:personaAdoption:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CRKASMRosterProviderConfiguration *)v4;
}

+ (CRKASMRosterProviderConfiguration)instructorRosterWithoutKeychainConfiguration
{
  void *v3;
  void *v4;

  +[CRKASMCredentialStoreFactory instructorCredentialStoreWithoutKeychain](CRKASMCredentialStoreFactory, "instructorCredentialStoreWithoutKeychain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "instructorRosterConfigurationWithCredentialStore:personaAdoption:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CRKASMRosterProviderConfiguration *)v4;
}

+ (CRKASMRosterProviderConfiguration)instructorRosterWithoutKeychainAndWithPersonaAdoptionConfiguration
{
  void *v3;
  void *v4;

  +[CRKASMCredentialStoreFactory instructorCredentialStoreWithoutKeychain](CRKASMCredentialStoreFactory, "instructorCredentialStoreWithoutKeychain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "instructorRosterConfigurationWithCredentialStore:personaAdoption:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CRKASMRosterProviderConfiguration *)v4;
}

- (CRKASMRosterProviderConfiguration)initWithUserCommonNamePrefix:(id)a3 trustedUserCommonNamePrefix:(id)a4 classKitFacade:(id)a5 rosterRequirements:(id)a6 credentialStore:(id)a7 maxCourseUsersCount:(int64_t)a8 maxCourseTrustedUsersCount:(int64_t)a9 rosterMutationTimeout:(double)a10 userCachingEnabled:(BOOL)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  CRKASMRosterProviderConfiguration *v24;
  uint64_t v26;

  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = (void *)objc_opt_new();
  LOBYTE(v26) = a11;
  v24 = -[CRKASMRosterProviderConfiguration initWithUserCommonNamePrefix:trustedUserCommonNamePrefix:classKitFacade:rosterRequirements:credentialStore:maxCourseUsersCount:maxCourseTrustedUsersCount:rosterMutationTimeout:userCachingEnabled:osTransactionPrimitives:transactionReleaseDelay:](self, "initWithUserCommonNamePrefix:trustedUserCommonNamePrefix:classKitFacade:rosterRequirements:credentialStore:maxCourseUsersCount:maxCourseTrustedUsersCount:rosterMutationTimeout:userCachingEnabled:osTransactionPrimitives:transactionReleaseDelay:", v22, v21, v20, v19, v18, a8, a10, 10.0, a9, v26, v23);

  return v24;
}

- (CRKASMRosterProviderConfiguration)initWithUserCommonNamePrefix:(id)a3 trustedUserCommonNamePrefix:(id)a4 classKitFacade:(id)a5 rosterRequirements:(id)a6 credentialStore:(id)a7 maxCourseUsersCount:(int64_t)a8 maxCourseTrustedUsersCount:(int64_t)a9 rosterMutationTimeout:(double)a10 userCachingEnabled:(BOOL)a11 osTransactionPrimitives:(id)a12 transactionReleaseDelay:(double)a13
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  CRKASMRosterProviderConfiguration *v25;
  uint64_t v26;
  NSString *userCommonNamePrefix;
  uint64_t v28;
  NSString *trustedUserCommonNamePrefix;
  uint64_t v30;
  NSMapTable *userCache;
  uint64_t v32;
  NSMapTable *trustedUserCache;
  id v36;
  objc_super v37;

  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v24 = a7;
  v36 = a12;
  v37.receiver = self;
  v37.super_class = (Class)CRKASMRosterProviderConfiguration;
  v25 = -[CRKASMRosterProviderConfiguration init](&v37, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v20, "copy");
    userCommonNamePrefix = v25->_userCommonNamePrefix;
    v25->_userCommonNamePrefix = (NSString *)v26;

    v28 = objc_msgSend(v21, "copy");
    trustedUserCommonNamePrefix = v25->_trustedUserCommonNamePrefix;
    v25->_trustedUserCommonNamePrefix = (NSString *)v28;

    objc_storeStrong((id *)&v25->_classKitFacade, a5);
    objc_storeStrong((id *)&v25->_rosterRequirements, a6);
    objc_storeStrong((id *)&v25->_credentialStore, a7);
    v25->_maxCourseUsersCount = a8;
    v25->_maxCourseTrustedUsersCount = a9;
    v25->_rosterMutationTimeout = a10;
    objc_storeStrong((id *)&v25->_osTransactionPrimitives, a12);
    v25->_transactionReleaseDelay = a13;
    if (a11)
    {
      objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
      v30 = objc_claimAutoreleasedReturnValue();
      userCache = v25->_userCache;
      v25->_userCache = (NSMapTable *)v30;

      objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
      v32 = objc_claimAutoreleasedReturnValue();
      trustedUserCache = v25->_trustedUserCache;
      v25->_trustedUserCache = (NSMapTable *)v32;

    }
  }

  return v25;
}

+ (id)instructorRosterConfigurationWithCredentialStore:(id)a3 personaAdoption:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;

  v4 = a4;
  v6 = a3;
  +[CRKClassKitFacadeFactory makeInstructorClassKitFacadeWithPersonaAdoption:](CRKClassKitFacadeFactory, "makeInstructorClassKitFacadeWithPersonaAdoption:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKConcreteClassKitRosterRequirements instructorRosterRequirementsWithClassKitFacade:](CRKConcreteClassKitRosterRequirements, "instructorRosterRequirementsWithClassKitFacade:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc((Class)a1);
  LOBYTE(v12) = objc_msgSend(a1, "userCachingEnabled");
  v10 = (void *)objc_msgSend(v9, "initWithUserCommonNamePrefix:trustedUserCommonNamePrefix:classKitFacade:rosterRequirements:credentialStore:maxCourseUsersCount:maxCourseTrustedUsersCount:rosterMutationTimeout:userCachingEnabled:", CFSTR("leader: ASM"), CFSTR("member: ASM"), v7, v8, v6, 15, 60.0, 100, v12);

  return v10;
}

+ (BOOL)userCachingEnabled
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "makeFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isASMUserCachingEnabled");

  return v4;
}

- (NSString)userCommonNamePrefix
{
  return self->_userCommonNamePrefix;
}

- (NSString)trustedUserCommonNamePrefix
{
  return self->_trustedUserCommonNamePrefix;
}

- (CRKClassKitFacade)classKitFacade
{
  return self->_classKitFacade;
}

- (CRKClassKitRosterRequirements)rosterRequirements
{
  return self->_rosterRequirements;
}

- (CRKASMCredentialStore)credentialStore
{
  return self->_credentialStore;
}

- (int64_t)maxCourseUsersCount
{
  return self->_maxCourseUsersCount;
}

- (int64_t)maxCourseTrustedUsersCount
{
  return self->_maxCourseTrustedUsersCount;
}

- (double)rosterMutationTimeout
{
  return self->_rosterMutationTimeout;
}

- (NSMapTable)userCache
{
  return self->_userCache;
}

- (NSMapTable)trustedUserCache
{
  return self->_trustedUserCache;
}

- (CRKOSTransactionPrimitives)osTransactionPrimitives
{
  return self->_osTransactionPrimitives;
}

- (double)transactionReleaseDelay
{
  return self->_transactionReleaseDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osTransactionPrimitives, 0);
  objc_storeStrong((id *)&self->_trustedUserCache, 0);
  objc_storeStrong((id *)&self->_userCache, 0);
  objc_storeStrong((id *)&self->_credentialStore, 0);
  objc_storeStrong((id *)&self->_rosterRequirements, 0);
  objc_storeStrong((id *)&self->_classKitFacade, 0);
  objc_storeStrong((id *)&self->_trustedUserCommonNamePrefix, 0);
  objc_storeStrong((id *)&self->_userCommonNamePrefix, 0);
}

@end
