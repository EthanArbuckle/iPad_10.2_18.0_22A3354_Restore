@implementation CNUIContactsEnvironmentServicesProvider

+ (id)recentsManagerWithSchedulerProvider:(id)a3
{
  Class (__cdecl *v3)();
  id v4;
  id v5;
  void *v6;

  v3 = (Class (__cdecl *)())getCRRecentContactsLibraryClass[0];
  v4 = a3;
  v5 = objc_alloc_init(v3());
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13CE8]), "initWithRecentsLibrary:schedulerProvider:", v5, v4);

  return v6;
}

+ (id)idsIDQueryControllerWrapper
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0D13D10]);
  -[objc_class sharedInstance](getIDSIDQueryControllerClass_47532(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithController:", v3);

  return v4;
}

+ (id)defaultUserActionFetcher
{
  return objc_alloc_init(MEMORY[0x1E0D13CF8]);
}

+ (id)capabilities
{
  return objc_alloc_init(MEMORY[0x1E0D13C60]);
}

+ (id)applicationWorkspace
{
  return objc_alloc_init(MEMORY[0x1E0D13C70]);
}

+ (id)suggestionsService
{
  void *v2;

  objc_msgSend((Class)getSGSuggestionsServiceClass[0](), "serviceForContacts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSyncTimeout:", 0.2);
  return v2;
}

@end
