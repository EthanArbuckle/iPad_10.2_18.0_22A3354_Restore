@implementation ASDExtensionMonitor

- (ASDExtensionMonitor)initWithAttributes:(id)a3
{
  id v4;
  ASDExtensionMonitor *v5;
  uint64_t v6;
  NSDictionary *extensionAttributes;
  uint64_t v8;
  NSArray *extensions;
  NSObject *v10;
  void *v11;
  NSDictionary *v12;
  uint64_t v13;
  id matchingContext;
  uint64_t v16;
  objc_super v17;
  id location;
  __int128 buf;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22[2];

  v22[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ASDExtensionMonitor;
  v5 = -[ASDExtensionMonitor init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    extensionAttributes = v5->_extensionAttributes;
    v5->_extensionAttributes = (NSDictionary *)v6;

    v5->_lock._os_unfair_lock_opaque = 0;
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB35D8], "extensionsWithMatchingAttributes:error:", v5->_extensionAttributes, &v16);
    v8 = objc_claimAutoreleasedReturnValue();
    extensions = v5->_extensions;
    v5->_extensions = (NSArray *)v8;

    if (!v5->_extensions)
    {
      v5->_extensions = (NSArray *)MEMORY[0x1E0C9AA60];
      ASDLogHandleForCategory(12);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v16;
        _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "Failed to get extensions: %{public}@", (uint8_t *)&buf, 0xCu);
      }

    }
    objc_initWeak(&location, v5);
    v11 = (void *)MEMORY[0x1E0CB35D8];
    v12 = v5->_extensionAttributes;
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v20 = __49__ASDExtensionMonitor__startMonitoringExtensions__block_invoke;
    v21 = &unk_1E37C0028;
    objc_copyWeak(v22, &location);
    objc_msgSend(v11, "beginMatchingExtensionsWithAttributes:completion:", v12, &buf);
    v13 = objc_claimAutoreleasedReturnValue();
    matchingContext = v5->_matchingContext;
    v5->_matchingContext = (id)v13;

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  id matchingContext;
  objc_super v4;

  if (self)
  {
    objc_msgSend(MEMORY[0x1E0CB35D8], "endMatchingExtensions:", self->_matchingContext);
    matchingContext = self->_matchingContext;
    self->_matchingContext = 0;

  }
  v4.receiver = self;
  v4.super_class = (Class)ASDExtensionMonitor;
  -[ASDExtensionMonitor dealloc](&v4, sel_dealloc);
}

- (NSArray)extensions
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_extensions;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)updateHandler
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)MEMORY[0x19AEC5B88](self->_updateHandler);
  os_unfair_lock_unlock(p_lock);
  v5 = (void *)MEMORY[0x19AEC5B88](v4);

  return v5;
}

- (void)setUpdateHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  id updateHandler;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  v6 = (void *)objc_msgSend(v5, "copy");

  updateHandler = self->_updateHandler;
  self->_updateHandler = v6;

  os_unfair_lock_unlock(p_lock);
}

void __49__ASDExtensionMonitor__startMonitoringExtensions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = (void *)objc_msgSend(v5, "copy");
    if (v8)
    {
      os_unfair_lock_lock_with_options();
      objc_storeStrong((id *)WeakRetained + 4, v8);
      v9 = MEMORY[0x19AEC5B88](*((_QWORD *)WeakRetained + 5));
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 6);
      if (v9)
        (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v8);
    }
    else
    {
      ASDLogHandleForCategory(12);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
      {
        v10 = 138543362;
        v11 = v6;
        _os_log_error_impl(&dword_19A03B000, (os_log_t)v9, OS_LOG_TYPE_ERROR, "Failed to get extensions: %{public}@", (uint8_t *)&v10, 0xCu);
      }
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong(&self->_matchingContext, 0);
  objc_storeStrong((id *)&self->_extensionAttributes, 0);
}

@end
