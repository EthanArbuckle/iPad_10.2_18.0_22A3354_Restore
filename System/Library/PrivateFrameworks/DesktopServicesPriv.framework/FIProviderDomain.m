@implementation FIProviderDomain

- (FIProviderDomain)initWithDomain:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  int v7;
  void *v8;
  FIProviderDomain *v9;

  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isUsingFPFS");
  if (v7)
  {
    objc_msgSend(v5, "storageURLs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = -[FIProviderDomain initWithDomainID:cachePolicy:rootURL:domain:](self, "initWithDomainID:cachePolicy:rootURL:domain:", v6, 1, v8, v5);
  if (v7)
  {

  }
  return v9;
}

- (FIProviderDomain)initWithDomainID:(id)a3 cachePolicy:(unint64_t)a4 rootURL:(id)a5 domain:(id)a6
{
  id v11;
  id v12;
  id v13;
  FIProviderDomain *v14;
  void **p_rootURL;
  uint64_t v16;
  void *v17;
  FIProviderDomain *v18;
  objc_super v20;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)FIProviderDomain;
  v14 = -[FIProviderDomain init](&v20, sel_init);
  if (objc_msgSend(v11, "length"))
  {
    objc_storeStrong((id *)&v14->_domainID, a3);
    v14->_cachePolicy = a4;
    p_rootURL = (void **)&v14->_rootURL;
    objc_storeStrong((id *)&v14->_rootURL, a5);
    objc_storeStrong((id *)&v14->_domain, a6);
    if (!v14->_domain && !*p_rootURL && -[FIProviderDomain isiCloudDriveProvider](v14, "isiCloudDriveProvider"))
    {
      objc_msgSend((id)FPProviderDomainClass(), "rootURLForProviderDomainID:cachePolicy:error:", v11, 1, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *p_rootURL;
      *p_rootURL = (void *)v16;

    }
    v18 = v14;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  FIProviderDomain *v4;
  FIProviderDomain *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (FIProviderDomain *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_cast<FIProviderDomain,objc_object * {__strong}>(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "domainID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", self->_domainID);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_domainID, "hash");
}

- (BOOL)isUsingFPFS
{
  FPProviderDomain *domain;

  domain = self->_domain;
  if (domain)
    return -[FPProviderDomain isUsingFPFS](domain, "isUsingFPFS");
  if (-[FIProviderDomain isiCloudDriveProvider](self, "isiCloudDriveProvider"))
    return 1;
  return self->_rootURL != 0;
}

- (BOOL)isFPv2
{
  void *v3;
  _BOOL4 v4;
  TString *v5;
  TString *v6;
  TString v8;
  TString v9;

  -[FIProviderDomain identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FIProviderDomain isUsingFPFS](self, "isUsingFPFS"))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v5 = v3;
    v9.fString.fRef = &stru_1E8752DF8;
    CFRetain(&stru_1E8752DF8);
    TString::SetStringRefAsImmutable(&v9, v5);

    if (IsLocalStorageDomainID(&v9))
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      v6 = v5;
      v8.fString.fRef = &stru_1E8752DF8;
      CFRetain(&stru_1E8752DF8);
      TString::SetStringRefAsImmutable(&v8, v6);

      v4 = !IsExternalDeviceDomainID(&v8);
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v8.fString.fRef);
    }
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v9.fString.fRef);
  }

  return v4;
}

- (NSString)identifier
{
  return self->_domainID;
}

- (unint64_t)disconnectionState
{
  FPProviderDomain *domain;

  domain = self->_domain;
  if (domain)
    return -[FPProviderDomain disconnectionState](domain, "disconnectionState");
  else
    return 2;
}

- (BOOL)isiCloudDriveProvider
{
  FPProviderDomain *domain;
  TString *v5;
  TString v6;

  domain = self->_domain;
  if (domain)
    return -[FPProviderDomain isiCloudDriveProvider](domain, "isiCloudDriveProvider");
  v5 = self->_domainID;
  v6.fString.fRef = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  TString::SetStringRefAsImmutable(&v6, v5);

  LOBYTE(v5) = IsICloudDriveDomainID(&v6);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v6.fString.fRef);
  return (char)v5;
}

- (BOOL)updateRootURLIfDetached
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  NSURL *rootURL;

  if (!self->_domain)
  {
    -[FIProviderDomain rootURL](self, "rootURL");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[FIProviderDomain urlForKnownFolder:](self, "urlForKnownFolder:", 1);
      v4 = objc_claimAutoreleasedReturnValue();
      if (IsEqual(v3, v4))
      {

LABEL_6:
        rootURL = self->_rootURL;
        self->_rootURL = 0;

        goto LABEL_7;
      }
      -[FIProviderDomain urlForKnownFolder:](self, "urlForKnownFolder:", 2);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = IsEqual(v3, v5);

      if (v6)
        goto LABEL_6;
    }
LABEL_7:

  }
  return 0;
}

- (NSURL)rootURL
{
  FPProviderDomain *v3;
  void *v4;
  NSURL *v5;

  v3 = self->_domain;
  if (!v3)
  {
    -[FIProviderDomain asyncFetchedDomain](self, "asyncFetchedDomain");
    v3 = (FPProviderDomain *)objc_claimAutoreleasedReturnValue();
  }
  if (-[FIProviderDomain isUsingFPFS](self, "isUsingFPFS"))
  {
    -[FPProviderDomain storageURLs](v3, "storageURLs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (NSURL *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = self->_rootURL;
  }

  return v5;
}

- (BOOL)isMainiCloudDriveDomain
{
  FPProviderDomain *domain;
  TString *v5;
  TString v6;

  domain = self->_domain;
  if (domain)
    return -[FPProviderDomain isMainiCloudDriveDomain](domain, "isMainiCloudDriveDomain");
  v5 = self->_domainID;
  v6.fString.fRef = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  TString::SetStringRefAsImmutable(&v6, v5);

  LOBYTE(v5) = IsMainICloudDriveDomainID(&v6);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v6.fString.fRef);
  return (char)v5;
}

- (BOOL)isDataSeparatedDomain
{
  FPProviderDomain *domain;
  TString *v5;
  TString v6;

  domain = self->_domain;
  if (domain)
    return -[FPProviderDomain isDataSeparatedDomain](domain, "isDataSeparatedDomain");
  v5 = self->_domainID;
  v6.fString.fRef = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  TString::SetStringRefAsImmutable(&v6, v5);

  LOBYTE(v5) = IsDataSeparatedDomainID(&v6);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v6.fString.fRef);
  return (char)v5;
}

- (BOOL)isLocalStorageDomain
{
  TString *v2;
  TString v4;

  v2 = self->_domainID;
  v4.fString.fRef = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  TString::SetStringRefAsImmutable(&v4, v2);

  LOBYTE(v2) = IsLocalStorageDomainID(&v4);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v4.fString.fRef);
  return (char)v2;
}

- (BOOL)isExternalDeviceDomain
{
  TString *v2;
  TString v4;

  v2 = self->_domainID;
  v4.fString.fRef = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  TString::SetStringRefAsImmutable(&v4, v2);

  LOBYTE(v2) = IsExternalDeviceDomainID(&v4);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v4.fString.fRef);
  return (char)v2;
}

- (BOOL)supportsSyncingTrash
{
  FPProviderDomain *domain;
  int v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  TDSMutex *p_lock;
  char v11;

  domain = self->_domain;
  if (domain)
    return -[FPProviderDomain supportsSyncingTrash](domain, "supportsSyncingTrash");
  if (self->_rootURL)
  {
    p_lock = &self->_lock;
    v11 = 1;
    TDSMutex::lock(&self->_lock);
    if (self->_cachedSyncsTrash.__engaged_)
    {
      LOBYTE(v5) = self->_cachedSyncsTrash.var0.__null_state_ != 0;
      std::unique_lock<TDSMutex>::~unique_lock[abi:ne180100]((uint64_t)&p_lock);
    }
    else
    {
      std::unique_lock<TDSMutex>::~unique_lock[abi:ne180100]((uint64_t)&p_lock);
      -[NSURL URLByAppendingPathComponent:isDirectory:](self->_rootURL, "URLByAppendingPathComponent:isDirectory:", CFSTR(".Trash"), 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      v5 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v9, *MEMORY[0x1E0C999D0], 0);
      v7 = v9;
      v8 = v7;
      if (v5)
        LOWORD(v5) = objc_msgSend(v7, "BOOLValue");
      p_lock = &self->_lock;
      v11 = 1;
      TDSMutex::lock(&self->_lock);
      self->_cachedSyncsTrash = (optional<BOOL>)(v5 | 0x100);
      std::unique_lock<TDSMutex>::~unique_lock[abi:ne180100]((uint64_t)&p_lock);

    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)urlForKnownFolder:(unint64_t)a3
{
  return 0;
}

- (unint64_t)replicatedKnownFolders
{
  return 0;
}

- (BOOL)expectFPItems
{
  FPProviderDomain *v3;
  BOOL v4;

  v3 = self->_domain;
  if (!v3)
  {
    -[FIProviderDomain asyncFetchedDomain](self, "asyncFetchedDomain");
    v3 = (FPProviderDomain *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      return 0;
  }
  v4 = (-[FPProviderDomain disconnectionState](v3, "disconnectionState") & 0xFFFFFFFFFFFFFFFELL) != 6;

  return v4;
}

- (BOOL)supportsEnumeration
{
  FPProviderDomain *domain;

  domain = self->_domain;
  if (domain)
    return -[FPProviderDomain supportsEnumeration](domain, "supportsEnumeration");
  else
    return 1;
}

- (id)description
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  TString *v9;
  void *v10;
  void *v11;
  void *v12;
  TString v13;

  if (self->_domain)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ domain:%@>"), objc_opt_class(), self->_domain);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[FIProviderDomain asyncResultAvailable](self, "asyncResultAvailable"))
    {
      -[FIProviderDomain asyncFetchedDomain](self, "asyncFetchedDomain");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        -[FIProviderDomain asyncError](self, "asyncError");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "description");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v5 = 0;
    }
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = objc_opt_class();
    v9 = self->_domainID;
    v13.fString.fRef = &stru_1E8752DF8;
    CFRetain(&stru_1E8752DF8);
    TString::SetStringRefAsImmutable(&v13, v9);

    SanitizedStr(&v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SanitizedURL(self->_rootURL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@ domainID:%@ rootURL:%@ asyncState: %@>"), v8, v10, v11, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v13.fString.fRef);
    return v12;
  }
}

+ (id)providerDomainForDomain:(id)a3
{
  id v3;
  FIProviderDomain *v4;

  v3 = a3;
  v4 = -[FIProviderDomain initWithDomain:]([FIProviderDomain alloc], "initWithDomain:", v3);

  return v4;
}

+ (id)providerDomainForID:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  FIProviderDomainFetcher *v6;
  uint64_t v7;
  void *v8;

  v6 = (FIProviderDomainFetcher *)a3;
  v7 = FIProviderDomainFetcher::Singleton(v6);
  FIProviderDomainFetcher::FetchDomainForID(v7, v6, a4, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)providerDomainForRootURL:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  FIProviderDomainFetcher *v7;
  std::mutex *v8;
  void *v9;

  v7 = (FIProviderDomainFetcher *)a3;
  v8 = (std::mutex *)FIProviderDomainFetcher::Singleton(v7);
  FIProviderDomainFetcher::FetchDomainForURL(v8, v7, 0, a4, (uint64_t)a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)providerDomainForURL:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  FIProviderDomainFetcher *v7;
  std::mutex *v8;
  void *v9;

  v7 = (FIProviderDomainFetcher *)a3;
  v8 = (std::mutex *)FIProviderDomainFetcher::Singleton(v7);
  FIProviderDomainFetcher::FetchDomainForURL(v8, v7, 0, a4, (uint64_t)a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)providerDomainForItem:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  FIProviderDomain *v9;

  v7 = a3;
  objc_msgSend((id)FPProviderDomainClass(), "providerDomainForItem:cachePolicy:error:", v7, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = -[FIProviderDomain initWithDomain:]([FIProviderDomain alloc], "initWithDomain:", v8);
  else
    v9 = 0;

  return v9;
}

+ (id)rootURLForProviderDomainID:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;

  v7 = a3;
  objc_msgSend((id)FPProviderDomainClass(), "rootURLForProviderDomainID:cachePolicy:error:", v7, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)domainID
{
  return self->_domainID;
}

- (FPProviderDomain)domain
{
  return self->_domain;
}

- (BOOL)asyncResultAvailable
{
  return self->_asyncResultAvailable;
}

- (void)setAsyncResultAvailable:(BOOL)a3
{
  self->_asyncResultAvailable = a3;
}

- (FPProviderDomain)asyncFetchedDomain
{
  return (FPProviderDomain *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAsyncFetchedDomain:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSError)asyncError
{
  return (NSError *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAsyncError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncError, 0);
  objc_storeStrong((id *)&self->_asyncFetchedDomain, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_domainID, 0);
  TDSMutex::~TDSMutex(&self->_lock);
  objc_storeStrong((id *)&self->_rootURL, 0);
}

- (id).cxx_construct
{
  self->_cachedSyncsTrash = 0;
  TDSMutex::TDSMutex(&self->_lock, 0);
  return self;
}

@end
