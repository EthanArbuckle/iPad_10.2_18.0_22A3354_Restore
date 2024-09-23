@implementation ICAppContext

- (ICAppContext)initWithCloudContext:(id)a3 contextOptions:(unint64_t)a4 viewContext:(id)a5 backgroundContextCreator:(id)a6 deviceManagementRestrictionsManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ICAppContext *v17;
  ICAppContext *v18;
  void *v19;
  id backgroundContextCreator;
  objc_super v22;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)ICAppContext;
  v17 = -[ICAppContext init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_cloudContext, a3);
    v18->_contextOptions = a4;
    objc_storeStrong((id *)&v18->_viewContext, a5);
    v19 = _Block_copy(v15);
    backgroundContextCreator = v18->_backgroundContextCreator;
    v18->_backgroundContextCreator = v19;

    objc_storeStrong((id *)&v18->_deviceManagementRestrictionsManager, a7);
  }

  return v18;
}

- (BOOL)hasContextOptions:(unint64_t)a3
{
  return (a3 & ~-[ICAppContext contextOptions](self, "contextOptions")) == 0;
}

- (id)makeBackgroundContext
{
  void *v3;
  void (**v4)(void);
  void *v5;

  -[ICAppContext backgroundContextCreator](self, "backgroundContextCreator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICAppContext backgroundContextCreator](self, "backgroundContextCreator");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (ICCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (NSManagedObjectContext)viewContext
{
  return self->_viewContext;
}

- (ICDeviceManagementRestrictionsManager)deviceManagementRestrictionsManager
{
  return self->_deviceManagementRestrictionsManager;
}

- (unint64_t)contextOptions
{
  return self->_contextOptions;
}

- (void)setContextOptions:(unint64_t)a3
{
  self->_contextOptions = a3;
}

- (id)backgroundContextCreator
{
  return self->_backgroundContextCreator;
}

- (void)setBackgroundContextCreator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backgroundContextCreator, 0);
  objc_storeStrong((id *)&self->_deviceManagementRestrictionsManager, 0);
  objc_storeStrong((id *)&self->_viewContext, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
}

@end
