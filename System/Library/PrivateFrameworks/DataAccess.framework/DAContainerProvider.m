@implementation DAContainerProvider

+ (id)providerWithContactStore:(id)a3
{
  id v3;
  _DAContactsContainerProvider *v4;

  v3 = a3;
  v4 = -[_DAContactsContainerProvider initWithContactStore:]([_DAContactsContainerProvider alloc], "initWithContactStore:", v3);

  return v4;
}

+ (id)providerWithAddressBook:(void *)a3
{
  return -[_DAABLegacyContainerProvider initWithAddressBook:]([_DAABLegacyContainerProvider alloc], "initWithAddressBook:", a3);
}

- (id)containerWithExternalIdentifier:(id)a3 forAccountWithExternalIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("containerWithExternalIdentifier:forAccountWithExternalIdentifier is abstract"), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (id)allContainers
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("allContainers is abstract"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)allContainersForAccountWithExternalIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("allContainersForAccountWithExternalIdentifier is abstract"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (id)createNewContainerWithType:(int)a3 name:(id)a4 externalIdentifier:(id)a5 constraintsPath:(id)a6 syncData:(id)a7 contentReadonly:(BOOL)a8 propertiesReadonly:(BOOL)a9 forAccount:(id)a10
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a10;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("createNewContainerWithType is abstract"), 0);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v18);
}

- (void)setDefaultContainer:(id)a3 withLocalDBHelper:(id)a4 onlyIfNotSet:(BOOL)a5
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("setDefaultContainer:onlyIfNotSet: is abstract"), 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v8);
}

- (BOOL)setLastSyncDateForContainer:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("setLastSyncDateForContainer: is abstract"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (void)mergeAllRecordsIntoContainer:(id)a3 shouldInsertChangeHistoryRecords:(BOOL)a4
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("mergeAllRecordIntoContainer: is abstract"), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v5);
}

@end
