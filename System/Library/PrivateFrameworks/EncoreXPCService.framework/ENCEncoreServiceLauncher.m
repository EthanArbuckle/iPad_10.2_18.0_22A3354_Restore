@implementation ENCEncoreServiceLauncher

- (ENCEncoreServiceLauncher)init
{
  ENCEncoreServiceLauncher *v2;
  uint64_t v3;
  EncoreService *encoreService;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ENCEncoreServiceLauncher;
  v2 = -[ENCEncoreServiceLauncher init](&v6, sel_init);
  if (v2)
  {
    +[EncoreService service](EncoreService, "service");
    v3 = objc_claimAutoreleasedReturnValue();
    encoreService = v2->_encoreService;
    v2->_encoreService = (EncoreService *)v3;

  }
  return v2;
}

- (EncoreService)encoreService
{
  return self->_encoreService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encoreService, 0);
}

@end
