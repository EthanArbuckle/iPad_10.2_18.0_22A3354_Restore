@implementation ICPersistenceConfiguration

- (NSManagedObjectContext)modernViewContext
{
  return self->_modernViewContext;
}

- (NSManagedObjectContext)legacyViewContext
{
  return self->_legacyViewContext;
}

- (NSManagedObjectContext)modernBackgroundContext
{
  void (**v2)(void);
  void *v3;

  -[ICPersistenceConfiguration makeModernBackgroundContext](self, "makeModernBackgroundContext");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSManagedObjectContext *)v3;
}

- (id)makeModernBackgroundContext
{
  return self->_makeModernBackgroundContext;
}

- (void)setMakeModernBackgroundContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setMakeLegacyBackgroundContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setModernViewContext:(id)a3
{
  objc_storeStrong((id *)&self->_modernViewContext, a3);
}

- (void)setLegacyViewContext:(id)a3
{
  objc_storeStrong((id *)&self->_legacyViewContext, a3);
}

- (NSManagedObjectContext)legacyBackgroundContext
{
  void (**v2)(void);
  void *v3;

  -[ICPersistenceConfiguration makeLegacyBackgroundContext](self, "makeLegacyBackgroundContext");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSManagedObjectContext *)v3;
}

- (id)makeLegacyBackgroundContext
{
  return self->_makeLegacyBackgroundContext;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_makeLegacyBackgroundContext, 0);
  objc_storeStrong((id *)&self->_legacyViewContext, 0);
  objc_storeStrong(&self->_makeModernBackgroundContext, 0);
  objc_storeStrong((id *)&self->_modernViewContext, 0);
}

@end
