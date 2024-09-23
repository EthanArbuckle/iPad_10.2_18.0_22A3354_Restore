@implementation COSettings

- (COSettings)init
{
  return -[COSettings initWithURL:](self, "initWithURL:", 0);
}

- (COSettings)initWithURL:(id)a3
{
  id v4;
  COSettings *v5;
  NSURL *v6;
  NSURL *url;
  OS_dispatch_source *source;
  id clientCallback;
  NSMutableDictionary *settings;
  COSettings *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)COSettings;
  v5 = -[COSettings init](&v13, sel_init);
  if (!v5)
    goto LABEL_6;
  if (v4)
  {
    v6 = (NSURL *)v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", objc_msgSend(CFSTR("/var/mobile/Library/Preferences/com.apple.ConditionInducer.plist"), "UTF8String"), 0, 0);
    v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  url = v5->_url;
  v5->_url = v6;

  source = v5->_source;
  v5->_source = 0;

  clientCallback = v5->_clientCallback;
  v5->_clientCallback = 0;

  settings = v5->_settings;
  v5->_settings = 0;

  v11 = 0;
  if (-[COSettings createSettingsFile](v5, "createSettingsFile"))
LABEL_6:
    v11 = v5;

  return v11;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[COSettings settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[COSettings settings](self, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

  -[COSettings writeSettings](self, "writeSettings");
}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[COSettings settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

  -[COSettings writeSettings](self, "writeSettings");
}

- (void)startMonitoringForChanges:(id)a3
{
  -[COSettings setClientCallback:](self, "setClientCallback:", a3);
  -[COSettings startMonitoringForFileDeletion](self, "startMonitoringForFileDeletion");
}

- (BOOL)createSettingsFile
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[COSettings url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "fileExistsAtPath:", v5))
  {
    v6 = -[COSettings readSettings](self, "readSettings");

    if (v6)
    {
      v7 = 1;
      goto LABEL_10;
    }
  }
  else
  {

  }
  -[COSettings url](self, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "fileExistsAtPath:", v9);

  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[COSettings createSettingsFile].cold.1(self);
    v7 = 0;
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x24BDBCED8]);
    v12 = (void *)objc_msgSend(v11, "initWithDictionary:", MEMORY[0x24BDBD1B8]);
    -[COSettings setSettings:](self, "setSettings:", v12);

    v7 = -[COSettings writeSettings](self, "writeSettings");
  }
LABEL_10:

  return v7;
}

- (BOOL)writeSettings
{
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  dispatch_get_global_queue(-2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __27__COSettings_writeSettings__block_invoke;
  v5[3] = &unk_24E471318;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);
  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return (char)self;
}

void __27__COSettings_writeSettings__block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v5 = objc_msgSend(v3, "writeToURL:error:", v4, &v14);
  v6 = v14;

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BDD0C78];
    v15[0] = *MEMORY[0x24BDD0CB0];
    v15[1] = v8;
    v16[0] = CFSTR("mobile");
    v16[1] = CFSTR("mobile");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v2, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v6;
    objc_msgSend(v7, "setAttributes:ofItemAtPath:error:", v9, v11, &v13);
    v12 = v13;

    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __27__COSettings_writeSettings__block_invoke_cold_1(v2);

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __27__COSettings_writeSettings__block_invoke_cold_2(v2);

  }
}

- (BOOL)readSettings
{
  NSObject *v3;
  void *v4;
  _QWORD block[5];

  dispatch_get_global_queue(-2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__COSettings_readSettings__block_invoke;
  block[3] = &unk_24E4712C8;
  block[4] = self;
  dispatch_sync(v3, block);
  -[COSettings settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v4 != 0;

  return (char)self;
}

void __26__COSettings_readSettings__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v2 = objc_alloc(MEMORY[0x24BDBCED8]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithContentsOfURL:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setSettings:", v4);

  objc_msgSend(*(id *)(a1 + 32), "clientCallback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "clientCallback");
    v7 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v6);

  }
}

- (void)stopMonitoringForFileDeletion
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(-2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__COSettings_stopMonitoringForFileDeletion__block_invoke;
  block[3] = &unk_24E4712C8;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __43__COSettings_stopMonitoringForFileDeletion__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(a1 + 32), "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "source");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v3);

  }
}

- (BOOL)startMonitoringForFileDeletion
{
  void *v3;
  NSObject *v4;
  char v5;
  _QWORD block[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  dispatch_get_global_queue(-2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__COSettings_startMonitoringForFileDeletion__block_invoke;
  block[3] = &unk_24E471388;
  block[4] = self;
  v8 = v3;
  v9 = &v10;
  v4 = v3;
  dispatch_sync(v4, block);
  v5 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __44__COSettings_startMonitoringForFileDeletion__block_invoke(uint64_t a1)
{
  id v2;
  unsigned int v3;
  dispatch_source_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD handler[4];
  unsigned int v12;
  _QWORD v13[4];
  id v14;
  unsigned int v15;
  id location[2];

  objc_msgSend(*(id *)(a1 + 32), "url");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = open((const char *)objc_msgSend(v2, "fileSystemRepresentation"), 0x8000);

  if ((v3 & 0x80000000) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __44__COSettings_startMonitoringForFileDeletion__block_invoke_cold_1();
  }
  else
  {
    v4 = dispatch_source_create(MEMORY[0x24BDACA28], v3, 1uLL, *(dispatch_queue_t *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setSource:", v4);

    objc_msgSend(*(id *)(a1 + 32), "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_initWeak(location, *(id *)(a1 + 32));
      v6 = MEMORY[0x24BDAC760];
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __44__COSettings_startMonitoringForFileDeletion__block_invoke_7;
      v13[3] = &unk_24E471340;
      objc_copyWeak(&v14, location);
      v15 = v3;
      v7 = (void *)MEMORY[0x2207CD70C](v13);
      objc_msgSend(*(id *)(a1 + 32), "source");
      v8 = objc_claimAutoreleasedReturnValue();
      dispatch_source_set_event_handler(v8, v7);

      objc_msgSend(*(id *)(a1 + 32), "source");
      v9 = objc_claimAutoreleasedReturnValue();
      handler[0] = v6;
      handler[1] = 3221225472;
      handler[2] = __44__COSettings_startMonitoringForFileDeletion__block_invoke_2;
      handler[3] = &__block_descriptor_36_e5_v8__0l;
      v12 = v3;
      dispatch_source_set_cancel_handler(v9, handler);

      objc_msgSend(*(id *)(a1 + 32), "source");
      v10 = objc_claimAutoreleasedReturnValue();
      dispatch_resume(v10);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      objc_destroyWeak(&v14);
      objc_destroyWeak(location);
    }
    else
    {
      close(v3);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Could Not Dispatch Source Create", (uint8_t *)location, 2u);
      }
    }
  }
}

void __44__COSettings_startMonitoringForFileDeletion__block_invoke_7(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    close(*(_DWORD *)(a1 + 40));
    v4 = objc_loadWeakRetained(v2);
    objc_msgSend(v4, "readSettings");

    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "startMonitoringForFileDeletion");

  }
}

uint64_t __44__COSettings_startMonitoringForFileDeletion__block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (NSURL)path
{
  return self->_path;
}

- (NSMutableDictionary)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (OS_dispatch_source)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (id)clientCallback
{
  return self->_clientCallback;
}

- (void)setClientCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong(&self->_clientCallback, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)createSettingsFile
{
  void *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "url");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to read plist at %@", (uint8_t *)&v3, 0xCu);

}

void __27__COSettings_writeSettings__block_invoke_cold_1(id *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "url");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_21F8CF000, MEMORY[0x24BDACB70], v3, "Failed to set attributes on %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __27__COSettings_writeSettings__block_invoke_cold_2(id *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "url");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_21F8CF000, MEMORY[0x24BDACB70], v3, "Failed to write plist to %@ %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __44__COSettings_startMonitoringForFileDeletion__block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could Not Open Settings File", v0, 2u);
}

@end
