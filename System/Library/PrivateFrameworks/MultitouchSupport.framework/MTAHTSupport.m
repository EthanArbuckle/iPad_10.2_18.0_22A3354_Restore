@implementation MTAHTSupport

- (MTAHTSupport)init
{
  MTAHTSupport *v2;
  uint64_t v3;
  NSBundle *bundle;
  uint64_t v5;
  Class AHTDevice;
  uint64_t v7;
  Class AHTInterface;
  MTAHTSupport *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTAHTSupport;
  v2 = -[MTAHTSupport init](&v11, sel_init);
  if (v2
    && (v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1488]), "initWithPath:", CFSTR("/System/Library/PrivateFrameworks/AppleHIDTransportSupport.framework")), bundle = v2->_bundle, v2->_bundle = (NSBundle *)v3, bundle, -[NSBundle load](v2->_bundle, "load")))
  {
    -[NSBundle classNamed:](v2->_bundle, "classNamed:", CFSTR("AHTDevice"));
    v5 = objc_claimAutoreleasedReturnValue();
    AHTDevice = v2->_AHTDevice;
    v2->_AHTDevice = (Class)v5;

    -[NSBundle classNamed:](v2->_bundle, "classNamed:", CFSTR("AHTInterface"));
    v7 = objc_claimAutoreleasedReturnValue();
    AHTInterface = v2->_AHTInterface;
    v2->_AHTInterface = (Class)v7;

    v9 = v2;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__MTAHTSupport_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, block);
  return (id)sharedInstance_instance;
}

void __30__MTAHTSupport_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v1;

}

+ (id)allDevices
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(v2, "AHTDevice"), "performSelector:", sel_allDevices);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)getDeviceInServiceTree:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  io_registry_entry_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v16;
  io_registry_entry_t parent;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  +[MTAHTSupport allDevices](MTAHTSupport, "allDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v19;
LABEL_3:
    v9 = 0;
    v10 = v7;
    while (1)
    {
      if (*(_QWORD *)v19 != v8)
        objc_enumerationMutation(v4);
      v7 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * v9);

      parent = a3;
      v11 = a3;
      if (a3)
      {
        do
        {
          v16 = 0;
          IORegistryEntryGetParentEntry(v11, "IOService", &parent);
          IORegistryEntryGetRegistryEntryID(parent, &v16);
          v12 = v16;
          v13 = objc_msgSend(v7, "registryID");
          v11 = parent;
        }
        while (v12 != v13 && parent != 0);
        if (parent)
          break;
      }
      ++v9;
      v10 = v7;
      if (v9 == v6)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v6)
          goto LABEL_3;

        goto LABEL_16;
      }
    }
  }
  else
  {
LABEL_16:
    v7 = 0;
  }

  return v7;
}

+ (id)allInterfaces
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(v2, "AHTInterface"), "performSelector:", sel_allInterfaces);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)getInterfaceInServiceTree:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  io_registry_entry_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v16;
  io_registry_entry_t parent;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  +[MTAHTSupport allInterfaces](MTAHTSupport, "allInterfaces");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v19;
LABEL_3:
    v9 = 0;
    v10 = v7;
    while (1)
    {
      if (*(_QWORD *)v19 != v8)
        objc_enumerationMutation(v4);
      v7 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * v9);

      parent = a3;
      v11 = a3;
      if (a3)
      {
        do
        {
          v16 = 0;
          IORegistryEntryGetParentEntry(v11, "IOService", &parent);
          IORegistryEntryGetRegistryEntryID(parent, &v16);
          v12 = v16;
          v13 = objc_msgSend(v7, "registryID");
          v11 = parent;
        }
        while (v12 != v13 && parent != 0);
        if (parent)
          break;
      }
      ++v9;
      v10 = v7;
      if (v9 == v6)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v6)
          goto LABEL_3;

        goto LABEL_16;
      }
    }
  }
  else
  {
LABEL_16:
    v7 = 0;
  }

  return v7;
}

- (NSBundle)bundle
{
  return (NSBundle *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBundle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (Class)AHTDevice
{
  return self->_AHTDevice;
}

- (void)setAHTDevice:(Class)a3
{
  objc_storeStrong((id *)&self->_AHTDevice, a3);
}

- (Class)AHTInterface
{
  return self->_AHTInterface;
}

- (void)setAHTInterface:(Class)a3
{
  objc_storeStrong((id *)&self->_AHTInterface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AHTInterface, 0);
  objc_storeStrong((id *)&self->_AHTDevice, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
