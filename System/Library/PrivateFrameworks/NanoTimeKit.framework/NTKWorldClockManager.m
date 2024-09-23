@implementation NTKWorldClockManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_32);
  return (id)sharedManager___sharedInstance;
}

void __37__NTKWorldClockManager_sharedManager__block_invoke()
{
  NTKWorldClockManager *v0;
  void *v1;

  v0 = objc_alloc_init(NTKWorldClockManager);
  v1 = (void *)sharedManager___sharedInstance;
  sharedManager___sharedInstance = (uint64_t)v0;

}

- (NTKWorldClockManager)init
{
  NTKWorldClockManager *v2;
  uint64_t v3;
  WorldClockManager *frameworkManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKWorldClockManager;
  v2 = -[NTKWorldClockManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D4FAC8], "sharedManager");
    v3 = objc_claimAutoreleasedReturnValue();
    frameworkManager = v2->_frameworkManager;
    v2->_frameworkManager = (WorldClockManager *)v3;

    v2->_frameworkLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (NSArray)cities
{
  os_unfair_lock_s *p_frameworkLock;
  void *v4;
  void *v5;

  p_frameworkLock = &self->_frameworkLock;
  os_unfair_lock_lock(&self->_frameworkLock);
  -[WorldClockManager cities](self->_frameworkManager, "cities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_frameworkLock);
  return (NSArray *)v5;
}

- (void)loadCities
{
  os_unfair_lock_s *p_frameworkLock;

  p_frameworkLock = &self->_frameworkLock;
  os_unfair_lock_lock(&self->_frameworkLock);
  -[WorldClockManager loadCities](self->_frameworkManager, "loadCities");
  os_unfair_lock_unlock(p_frameworkLock);
}

- (BOOL)checkIfCitiesModified
{
  NTKWorldClockManager *v2;
  os_unfair_lock_s *p_frameworkLock;

  v2 = self;
  p_frameworkLock = &self->_frameworkLock;
  os_unfair_lock_lock(&self->_frameworkLock);
  LOBYTE(v2) = -[WorldClockManager checkIfCitiesModified](v2->_frameworkManager, "checkIfCitiesModified");
  os_unfair_lock_unlock(p_frameworkLock);
  return (char)v2;
}

- (void)saveCities
{
  os_unfair_lock_s *p_frameworkLock;

  p_frameworkLock = &self->_frameworkLock;
  os_unfair_lock_lock(&self->_frameworkLock);
  -[WorldClockManager saveCities](self->_frameworkManager, "saveCities");
  os_unfair_lock_unlock(p_frameworkLock);
}

- (BOOL)canAddCity
{
  NTKWorldClockManager *v2;
  os_unfair_lock_s *p_frameworkLock;

  v2 = self;
  p_frameworkLock = &self->_frameworkLock;
  os_unfair_lock_lock(&self->_frameworkLock);
  LOBYTE(v2) = -[WorldClockManager canAddCity](v2->_frameworkManager, "canAddCity");
  os_unfair_lock_unlock(p_frameworkLock);
  return (char)v2;
}

- (unint64_t)addCity:(id)a3
{
  os_unfair_lock_s *p_frameworkLock;
  id v5;
  unint64_t v6;

  p_frameworkLock = &self->_frameworkLock;
  v5 = a3;
  os_unfair_lock_lock(p_frameworkLock);
  v6 = -[WorldClockManager addCity:](self->_frameworkManager, "addCity:", v5);

  os_unfair_lock_unlock(p_frameworkLock);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameworkManager, 0);
}

@end
