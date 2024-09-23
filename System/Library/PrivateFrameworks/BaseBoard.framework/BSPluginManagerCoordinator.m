@implementation BSPluginManagerCoordinator

+ (id)sharedInstance
{
  if (qword_1ECD39880 != -1)
    dispatch_once(&qword_1ECD39880, &__block_literal_global_10);
  return (id)_MergedGlobals_12;
}

void __44__BSPluginManagerCoordinator_sharedInstance__block_invoke()
{
  BSPluginManagerCoordinator *v0;
  _QWORD *v1;
  id v2;
  void *v3;
  void *v4;
  objc_super v5;

  v0 = [BSPluginManagerCoordinator alloc];
  if (v0)
  {
    v5.receiver = v0;
    v5.super_class = (Class)BSPluginManagerCoordinator;
    v1 = objc_msgSendSuper2(&v5, sel_init);
    if (v1)
    {
      v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v3 = (void *)v1[1];
      v1[1] = v2;

    }
  }
  else
  {
    v1 = 0;
  }
  v4 = (void *)_MergedGlobals_12;
  _MergedGlobals_12 = (uint64_t)v1;

}

- (void)registerPlugins
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BSPluginManagerCoordinator registerPluginsFromBundle:](self, "registerPluginsFromBundle:");

}

- (void)registerPluginsFromBundle:(id)a3
{
  void *v4;
  BSPluginManagerCoordinator *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableDictionary objectForKey:](v5->_managersByBundleID, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[BSPluginManager managerForBundle:]((uint64_t)BSPluginManager, v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        -[NSMutableDictionary setObject:forKey:](v5->_managersByBundleID, "setObject:forKey:", v6, v4);
    }

    objc_sync_exit(v5);
  }

}

- (id)mainPluginManager
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSPluginManagerCoordinator pluginManagerForBundle:](self, "pluginManagerForBundle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)pluginManagerForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BSPluginManagerCoordinator *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = self;
      objc_sync_enter(v7);
      -[BSPluginManagerCoordinator registerPluginsFromBundle:](v7, "registerPluginsFromBundle:", v5);
      -[NSMutableDictionary objectForKey:](v7->_managersByBundleID, "objectForKey:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_exit(v7);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managersByBundleID, 0);
}

@end
