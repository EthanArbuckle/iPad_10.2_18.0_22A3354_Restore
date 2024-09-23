@implementation MTRApplicationLauncherClusterApplicationEPStruct

- (MTRApplicationLauncherClusterApplicationEPStruct)init
{
  MTRApplicationLauncherClusterApplicationEPStruct *v2;
  uint64_t v3;
  MTRApplicationLauncherClusterApplicationStruct *application;
  NSNumber *endpoint;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRApplicationLauncherClusterApplicationEPStruct;
  v2 = -[MTRApplicationLauncherClusterApplicationEPStruct init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    application = v2->_application;
    v2->_application = (MTRApplicationLauncherClusterApplicationStruct *)v3;

    endpoint = v2->_endpoint;
    v2->_endpoint = 0;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRApplicationLauncherClusterApplicationEPStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRApplicationLauncherClusterApplicationEPStruct);
  objc_msgSend_application(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setApplication_(v4, v8, (uint64_t)v7);

  objc_msgSend_endpoint(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEndpoint_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: application:%@; endpoint:%@; >"),
    v5,
    self->_application,
    self->_endpoint);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRApplicationLauncherClusterApplicationStruct)application
{
  return self->_application;
}

- (void)setApplication:(MTRApplicationLauncherClusterApplicationStruct *)application
{
  objc_setProperty_nonatomic_copy(self, a2, application, 8);
}

- (NSNumber)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(NSNumber *)endpoint
{
  objc_setProperty_nonatomic_copy(self, a2, endpoint, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end
