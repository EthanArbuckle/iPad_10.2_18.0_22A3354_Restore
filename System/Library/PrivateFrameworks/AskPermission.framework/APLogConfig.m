@implementation APLogConfig

- (APLogConfig)init
{
  APLogConfig *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *propertyAccessQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)APLogConfig;
  v2 = -[APLogConfig init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.AskPermission.APLogConfig", MEMORY[0x24BDAC9C0]);
    propertyAccessQueue = v2->_propertyAccessQueue;
    v2->_propertyAccessQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

+ (id)sharedConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__APLogConfig_sharedConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedConfig_ap_once_token___COUNTER__ != -1)
    dispatch_once(&sharedConfig_ap_once_token___COUNTER__, block);
  return (id)sharedConfig_ap_once_object___COUNTER__;
}

void __27__APLogConfig_sharedConfig__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_createLogConfigWithSubsystem:category:", CFSTR("com.apple.AskPermission"), CFSTR("general"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedConfig_ap_once_object___COUNTER__;
  sharedConfig_ap_once_object___COUNTER__ = v1;

}

+ (id)sharedDaemonConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__APLogConfig_sharedDaemonConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDaemonConfig_ap_once_token___COUNTER__ != -1)
    dispatch_once(&sharedDaemonConfig_ap_once_token___COUNTER__, block);
  return (id)sharedDaemonConfig_ap_once_object___COUNTER__;
}

void __33__APLogConfig_sharedDaemonConfig__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "sharedConfig");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_createLogConfigWithBaseConfig:subystem:category:", v4, 0, CFSTR("daemon"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sharedDaemonConfig_ap_once_object___COUNTER__;
  sharedDaemonConfig_ap_once_object___COUNTER__ = v2;

}

+ (id)sharedExtensionConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__APLogConfig_sharedExtensionConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedExtensionConfig_ap_once_token___COUNTER__ != -1)
    dispatch_once(&sharedExtensionConfig_ap_once_token___COUNTER__, block);
  return (id)sharedExtensionConfig_ap_once_object___COUNTER__;
}

void __36__APLogConfig_sharedExtensionConfig__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "sharedConfig");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_createLogConfigWithBaseConfig:subystem:category:", v4, 0, CFSTR("extension"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sharedExtensionConfig_ap_once_object___COUNTER__;
  sharedExtensionConfig_ap_once_object___COUNTER__ = v2;

}

+ (id)sharedFrameworkConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__APLogConfig_sharedFrameworkConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedFrameworkConfig_ap_once_token___COUNTER__ != -1)
    dispatch_once(&sharedFrameworkConfig_ap_once_token___COUNTER__, block);
  return (id)sharedFrameworkConfig_ap_once_object___COUNTER__;
}

void __36__APLogConfig_sharedFrameworkConfig__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "sharedConfig");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_createLogConfigWithBaseConfig:subystem:category:", v4, 0, CFSTR("framework"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sharedFrameworkConfig_ap_once_object___COUNTER__;
  sharedFrameworkConfig_ap_once_object___COUNTER__ = v2;

}

+ (id)sharedSettingsConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__APLogConfig_sharedSettingsConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedSettingsConfig_ap_once_token___COUNTER__ != -1)
    dispatch_once(&sharedSettingsConfig_ap_once_token___COUNTER__, block);
  return (id)sharedSettingsConfig_ap_once_object___COUNTER__;
}

void __35__APLogConfig_sharedSettingsConfig__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "sharedConfig");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_createLogConfigWithBaseConfig:subystem:category:", v4, 0, CFSTR("settings"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sharedSettingsConfig_ap_once_object___COUNTER__;
  sharedSettingsConfig_ap_once_object___COUNTER__ = v2;

}

+ (id)sharedPluginConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__APLogConfig_sharedPluginConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPluginConfig_ap_once_token___COUNTER__ != -1)
    dispatch_once(&sharedPluginConfig_ap_once_token___COUNTER__, block);
  return (id)sharedPluginConfig_ap_once_object___COUNTER__;
}

void __33__APLogConfig_sharedPluginConfig__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "sharedConfig");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_createLogConfigWithBaseConfig:subystem:category:", v4, 0, CFSTR("plugin"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sharedPluginConfig_ap_once_object___COUNTER__;
  sharedPluginConfig_ap_once_object___COUNTER__ = v2;

}

+ (id)sharedUIServiceConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__APLogConfig_sharedUIServiceConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedUIServiceConfig_ap_once_token___COUNTER__ != -1)
    dispatch_once(&sharedUIServiceConfig_ap_once_token___COUNTER__, block);
  return (id)sharedUIServiceConfig_ap_once_object___COUNTER__;
}

void __36__APLogConfig_sharedUIServiceConfig__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "sharedConfig");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_createLogConfigWithBaseConfig:subystem:category:", v4, 0, CFSTR("uiservice"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sharedUIServiceConfig_ap_once_object___COUNTER__;
  sharedUIServiceConfig_ap_once_object___COUNTER__ = v2;

}

- (OS_os_log)OSLogObject
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[6];
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  -[APLogConfig propertyAccessQueue](self, "propertyAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__APLogConfig_OSLogObject__block_invoke;
  block[3] = &unk_24DB1AF38;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(v3, block);

  v5 = (void *)v12[5];
  if (!v5)
  {
    -[APLogConfig propertyAccessQueue](self, "propertyAccessQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __26__APLogConfig_OSLogObject__block_invoke_2;
    v9[3] = &unk_24DB1AF38;
    v9[4] = self;
    v9[5] = &v11;
    dispatch_barrier_sync(v6, v9);

    v5 = (void *)v12[5];
  }
  v7 = v5;
  _Block_object_dispose(&v11, 8);

  return (OS_os_log *)v7;
}

void __26__APLogConfig_OSLogObject__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "backingOSLogObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id *__26__APLogConfig_OSLogObject__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id *result;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  id v12;
  os_log_t v13;
  uint64_t v14;
  void *v15;

  objc_msgSend(*(id *)(a1 + 32), "backingOSLogObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(_QWORD *)(v5 + 40);
  result = (id *)(v5 + 40);
  if (!v7)
  {
    objc_storeStrong(result, MEMORY[0x24BDACB70]);
    objc_msgSend(*(id *)(a1 + 32), "subsystem");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "category");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (!v10)
        return (id *)objc_msgSend(*(id *)(a1 + 32), "setBackingOSLogObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      objc_msgSend(*(id *)(a1 + 32), "subsystem");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = (const char *)objc_msgSend(v8, "UTF8String");
      objc_msgSend(*(id *)(a1 + 32), "category");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v13 = os_log_create(v11, (const char *)objc_msgSend(v12, "UTF8String"));
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
    return (id *)objc_msgSend(*(id *)(a1 + 32), "setBackingOSLogObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v9.receiver = self;
  v9.super_class = (Class)APLogConfig;
  -[APLogConfig description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: {\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[APLogConfig category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("  category: %@\n"), v6);

  -[APLogConfig subsystem](self, "subsystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("  subsystem: %@\n"), v7);

  objc_msgSend(v5, "appendString:", CFSTR("}"));
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[APLogConfig category](self, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[APLogConfig subsystem](self, "subsystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  APLogConfig *v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;

  v5 = (APLogConfig *)a3;
  if (self == v5)
  {
    v7 = 1;
    goto LABEL_18;
  }
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    -[APLogConfig category](self, "category");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 || (-[APLogConfig category](v5, "category"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[APLogConfig category](self, "category");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[APLogConfig category](v5, "category");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (v8)
      {

        if (!v11)
          goto LABEL_3;
      }
      else
      {

        if ((v11 & 1) == 0)
          goto LABEL_3;
      }
    }
    -[APLogConfig subsystem](self, "subsystem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 || (-[APLogConfig subsystem](v5, "subsystem"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[APLogConfig subsystem](self, "subsystem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[APLogConfig subsystem](v5, "subsystem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14) ^ 1;

      if (v12)
      {
LABEL_17:

        v7 = v15 ^ 1;
        goto LABEL_18;
      }
    }
    else
    {
      LOBYTE(v15) = 0;
    }

    goto LABEL_17;
  }
LABEL_3:
  v7 = 0;
LABEL_18:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  APLogConfig *v5;
  void *v6;
  uint64_t v7;
  NSString *category;
  void *v9;
  uint64_t v10;
  NSString *subsystem;

  v5 = -[APLogConfig init](+[APLogConfig allocWithZone:](APLogConfig, "allocWithZone:"), "init");
  -[APLogConfig category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  category = v5->_category;
  v5->_category = (NSString *)v7;

  -[APLogConfig subsystem](self, "subsystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyWithZone:", a3);
  subsystem = v5->_subsystem;
  v5->_subsystem = (NSString *)v10;

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  APMutableLogConfig *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = -[APLogConfig init](+[APMutableLogConfig allocWithZone:](APMutableLogConfig, "allocWithZone:"), "init");
  -[APLogConfig category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[APLogConfig setCategory:](v5, "setCategory:", v7);

  -[APLogConfig subsystem](self, "subsystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[APLogConfig setSubsystem:](v5, "setSubsystem:", v9);

  return v5;
}

+ (id)_createLogConfigWithSubsystem:(id)a3 category:(id)a4
{
  return (id)objc_msgSend(a1, "_createLogConfigWithBaseConfig:subystem:category:", 0, a3, a4);
}

+ (id)_createLogConfigWithBaseConfig:(id)a3 subystem:(id)a4 category:(id)a5
{
  id v7;
  id v8;
  id v9;
  APMutableLogConfig *v10;
  APMutableLogConfig *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
    v10 = (APMutableLogConfig *)objc_msgSend(v7, "mutableCopy");
  else
    v10 = objc_alloc_init(APMutableLogConfig);
  v11 = v10;
  if (v8)
    -[APLogConfig setSubsystem:](v10, "setSubsystem:", v8);
  if (v9)
    -[APLogConfig setCategory:](v11, "setCategory:", v9);
  v12 = (void *)-[APMutableLogConfig copy](v11, "copy");

  return v12;
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (void)setSubsystem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_os_log)backingOSLogObject
{
  return self->_backingOSLogObject;
}

- (void)setBackingOSLogObject:(id)a3
{
  objc_storeStrong((id *)&self->_backingOSLogObject, a3);
}

- (OS_dispatch_queue)propertyAccessQueue
{
  return self->_propertyAccessQueue;
}

- (void)setPropertyAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_propertyAccessQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyAccessQueue, 0);
  objc_storeStrong((id *)&self->_backingOSLogObject, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end
