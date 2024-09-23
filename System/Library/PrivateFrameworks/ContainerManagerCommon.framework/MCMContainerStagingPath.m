@implementation MCMContainerStagingPath

- (MCMContainerPath)destinationContainerPath
{
  return self->_destinationContainerPath;
}

- (void)setDestinationContainerPath:(id)a3
{
  objc_storeStrong((id *)&self->_destinationContainerPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationContainerPath, 0);
}

+ (Class)_containerClassPathClass
{
  return (Class)objc_opt_class();
}

+ (id)stagingContainerPathForDestinationContainerPath:(id)a3 stagingPathIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "containerClassPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMContainerPath containerPathForUserIdentity:containerClass:containerPathIdentifier:](MCMContainerStagingPath, "containerPathForUserIdentity:containerClass:containerPathIdentifier:", v8, objc_msgSend(v7, "containerClass"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setDestinationContainerPath:", v6);
  return v9;
}

@end
