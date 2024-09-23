@implementation CRKClassKitFacadeFactory

+ (id)makeStudentClassKitFacade
{
  void *v3;
  void *v4;
  CRKDataSeparationBlockingClassKitFacade *v5;

  objc_msgSend(a1, "makeBaseClassKitFacadeWithPersonaAdoption:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKDynamicDataObserverClassKitFacade dynamicDataObserverFacadeWithClassKitFacade:expectedUserRole:](CRKDynamicDataObserverClassKitFacade, "dynamicDataObserverFacadeWithClassKitFacade:expectedUserRole:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(a1, "dataSeparationEnabled") & 1) == 0)
  {
    v5 = -[CRKDataSeparationBlockingClassKitFacade initWithClassKitFacade:]([CRKDataSeparationBlockingClassKitFacade alloc], "initWithClassKitFacade:", v4);

    v4 = v5;
  }
  return v4;
}

+ (id)makeInstructorClassKitFacadeWithPersonaAdoption:(BOOL)a3
{
  void *v4;
  void *v5;
  int v6;
  __objc2_class **v7;
  void *v8;

  objc_msgSend(a1, "makeBaseClassKitFacadeWithPersonaAdoption:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKDynamicDataObserverClassKitFacade dynamicDataObserverFacadeWithClassKitFacade:expectedUserRole:](CRKDynamicDataObserverClassKitFacade, "dynamicDataObserverFacadeWithClassKitFacade:expectedUserRole:", v4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(a1, "dataSeparationEnabled");
  v7 = off_24D9C5F50;
  if (!v6)
    v7 = off_24D9C5B00;
  v8 = (void *)objc_msgSend(objc_alloc(*v7), "initWithClassKitFacade:", v5);

  return v8;
}

+ (id)makeBaseClassKitFacadeWithPersonaAdoption:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  CRKPersonaAdoptingClassKitFacade *v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  if (v3 && objc_msgSend(a1, "currentPlatformRequiresPersonaAdoption"))
  {
    v6 = [CRKPersonaAdoptingClassKitFacade alloc];
    v7 = (void *)objc_opt_new();
    v8 = -[CRKPersonaAdoptingClassKitFacade initWithClassKitFacade:personaBlockPerformer:](v6, "initWithClassKitFacade:personaBlockPerformer:", v5, v7);

    v5 = (void *)v8;
  }
  return v5;
}

+ (BOOL)currentPlatformRequiresPersonaAdoption
{
  void *v2;
  int v3;

  if (CRKIsiOS())
  {
    +[CRKSystemInfo sharedSystemInfo](CRKSystemInfo, "sharedSystemInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEphemeralMultiUser") ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

+ (BOOL)dataSeparationEnabled
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "makeFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDataSeparationEnabled");

  return v4;
}

@end
