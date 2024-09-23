@implementation APSMultiUserFS

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  return (id)sharedInstance_instance_0;
}

void __32__APSMultiUserFS_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  APSMultiUserFS *v2;
  void *v3;

  +[APSMultiUserMode sharedInstance](APSMultiUserMode, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isMultiUser");

  v2 = -[APSMultiUserFS initWithIsMultiUserMode:]([APSMultiUserFS alloc], "initWithIsMultiUserMode:", v1);
  v3 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = (uint64_t)v2;

}

- (APSMultiUserFS)initWithIsMultiUserMode:(BOOL)a3
{
  APSMultiUserFS *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)APSMultiUserFS;
  result = -[APSMultiUserFS init](&v5, sel_init);
  if (result)
    result->_isMultiUser = a3;
  return result;
}

- (id)systemPath
{
  NSString *systemPathCache;
  uint64_t v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  systemPathCache = self->_systemPathCache;
  if (!systemPathCache)
  {
    v4 = container_system_path_for_identifier();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v4, 4);
      v7 = self->_systemPathCache;
      self->_systemPathCache = v6;

      free(v5);
    }
    systemPathCache = self->_systemPathCache;
  }
  return systemPathCache;
}

- (BOOL)isMultiUser
{
  return self->_isMultiUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemPathCache, 0);
}

@end
