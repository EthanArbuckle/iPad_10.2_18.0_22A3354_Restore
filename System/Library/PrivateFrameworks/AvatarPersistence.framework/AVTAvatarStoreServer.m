@implementation AVTAvatarStoreServer

+ (id)defaultServer
{
  return (id)objc_msgSend(a1, "defaultServerWithImageHandlingDelegate:", 0);
}

+ (id)defaultServerWithImageHandlingDelegate:(id)a3
{
  id v3;
  AVTCoreDataStoreServer *v4;
  void *v5;
  AVTCoreDataStoreServer *v6;

  v3 = a3;
  v4 = [AVTCoreDataStoreServer alloc];
  +[AVTCoreEnvironment defaultEnvironment](AVTCoreEnvironment, "defaultEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AVTCoreDataStoreServer initWithEnvironment:imageHandlingDelegate:](v4, "initWithEnvironment:imageHandlingDelegate:", v5, v3);

  return v6;
}

@end
