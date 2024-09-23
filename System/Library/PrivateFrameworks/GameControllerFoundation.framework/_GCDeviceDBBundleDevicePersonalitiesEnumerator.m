@implementation _GCDeviceDBBundleDevicePersonalitiesEnumerator

- (_GCDeviceDBBundleDevicePersonalitiesEnumerator)initWithBundle:(id)a3 personalityPaths:(id)a4
{
  NSBundle *v6;
  NSEnumerator *v7;
  _GCDeviceDBBundleDevicePersonalitiesEnumerator *v8;
  NSBundle *bundle;
  NSBundle *v10;
  NSEnumerator *personalitiesPaths;
  objc_super v13;

  v6 = (NSBundle *)a3;
  v7 = (NSEnumerator *)a4;
  v13.receiver = self;
  v13.super_class = (Class)_GCDeviceDBBundleDevicePersonalitiesEnumerator;
  v8 = -[_GCDeviceDBBundleDevicePersonalitiesEnumerator init](&v13, sel_init);
  bundle = v8->_bundle;
  v8->_bundle = v6;
  v10 = v6;

  personalitiesPaths = v8->_personalitiesPaths;
  v8->_personalitiesPaths = v7;

  return v8;
}

- (id)nextObject
{
  _GCDeviceDBPersonality *v2;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  _GCDeviceDBPersonality *v7;
  _GCDeviceDBPersonality *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  NSObject *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v4 = 0;
  v23 = *MEMORY[0x1E0C80C00];
  while (1)
  {
    v5 = v4;
    -[NSEnumerator nextObject](self->_personalitiesPaths, "nextObject", v15);
    v4 = objc_claimAutoreleasedReturnValue();

    if (!v4)
      break;
    -[NSBundle URLForResource:withExtension:](self->_bundle, "URLForResource:withExtension:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = [_GCDeviceDBPersonality alloc];
      v18 = 0;
      v8 = -[_GCDeviceDBPersonality initWithURL:error:](v7, "initWithURL:error:", v6, &v18);
      v9 = v18;
      v10 = v9;
      if (v8)
      {
        v2 = v8;
        v11 = 1;
      }
      else
      {
        v16 = -[NSObject code](v9, "code");
        _gc_log_devicedb();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v16 == 5)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v6, "path");
            v17 = objc_claimAutoreleasedReturnValue();
            -[NSObject localizedFailureReason](v10, "localizedFailureReason");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v20 = v17;
            v21 = 2114;
            v22 = v15;
            _os_log_debug_impl(&dword_1DC79E000, v13, OS_LOG_TYPE_DEBUG, "📦 Skipping loading device personality at '%@': %{public}@.", buf, 0x16u);

          }
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v10;
          _os_log_fault_impl(&dword_1DC79E000, v13, OS_LOG_TYPE_FAULT, "📦 Error loading device personality: %@", buf, 0xCu);
        }

        v11 = 2;
      }

    }
    else
    {
      _gc_log_devicedb();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_fault_impl(&dword_1DC79E000, v10, OS_LOG_TYPE_FAULT, "📦 Device personality file does not exist: %@.", buf, 0xCu);
      }
      v11 = 2;
    }

    if (v11 != 2)
      goto LABEL_19;
  }
  v2 = 0;
LABEL_19:

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalitiesPaths, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
