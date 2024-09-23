@implementation ELSEnvironment

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_4);
  return (id)sharedInstance_environment;
}

void __32__ELSEnvironment_sharedInstance__block_invoke()
{
  ELSEnvironment *v0;
  void *v1;

  v0 = objc_alloc_init(ELSEnvironment);
  v1 = (void *)sharedInstance_environment;
  sharedInstance_environment = (uint64_t)v0;

}

- (unint64_t)cloudKitEnvironment
{
  void *v2;
  unint64_t v3;

  +[ELSDefaults sharedInstance](ELSDefaults, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cloudKitEnvironment");

  return v3;
}

- (CKContainerID)cloudKitContainerIdentifier
{
  void *v3;
  int64_t v4;
  void *v5;

  -[ELSEnvironment _containerIdentifierForCloudKitEnvironment:](self, "_containerIdentifierForCloudKitEnvironment:", -[ELSEnvironment cloudKitEnvironment](self, "cloudKitEnvironment"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ELSEnvironment _containerEnvironmentForCloudKitEnvironment:](self, "_containerEnvironmentForCloudKitEnvironment:", -[ELSEnvironment cloudKitEnvironment](self, "cloudKitEnvironment"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9038]), "initWithContainerIdentifier:environment:", v3, v4);

  return (CKContainerID *)v5;
}

- (id)_containerIdentifierForCloudKitEnvironment:(unint64_t)a3
{
  if (a3 <= 2)
    self = *off_24D173CD8[a3];
  return self;
}

- (int64_t)_containerEnvironmentForCloudKitEnvironment:(unint64_t)a3
{
  if (a3 - 1 >= 2)
    return 1;
  else
    return 2;
}

@end
