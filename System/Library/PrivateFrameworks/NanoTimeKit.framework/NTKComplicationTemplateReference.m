@implementation NTKComplicationTemplateReference

- (NTKComplicationTemplateReference)initWithPath:(id)a3 existingTemplate:(id)a4
{
  id v6;
  id v7;
  NTKComplicationTemplateReference *v8;
  uint64_t v9;
  NSString *path;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKComplicationTemplateReference;
  v8 = -[NTKComplicationTemplateReference init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    path = v8->_path;
    v8->_path = (NSString *)v9;

    objc_storeWeak((id *)&v8->_cachedTemplate, v7);
    v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (CLKComplicationTemplate)complicationTemplate
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NTKComplicationTemplateReference _lock_complicationTemplate](self, "_lock_complicationTemplate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (CLKComplicationTemplate *)v4;
}

- (id)_lock_complicationTemplate
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  NSString *path;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v13;
  id v14;
  uint8_t buf[4];
  NTKComplicationTemplateReference *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_cachedTemplate);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
  }
  else
  {
    path = self->_path;
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", path, 0, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;
    if (v7)
    {
      v13 = v8;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v13);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v13;

      if (v9)
      {
        objc_storeWeak((id *)&self->_cachedTemplate, v9);
        v9 = v9;
        v5 = v9;
      }
      else
      {
        _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v16 = self;
          v17 = 2112;
          v18 = v10;
          _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "NTKComplicationTemplateReference %p: failed to decode template: %@", buf, 0x16u);
        }

        v5 = 0;
      }
    }
    else
    {
      _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v16 = self;
        v17 = 2112;
        v18 = v8;
        _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "NTKComplicationTemplateReference %p: failed to load data: %@", buf, 0x16u);
      }
      v5 = 0;
      v10 = v8;
    }

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKComplicationTemplateReference)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NTKComplicationTemplateReference *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[NTKComplicationTemplateReference initWithPath:existingTemplate:](self, "initWithPath:existingTemplate:", v5, 0);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_path, CFSTR("path"));
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_destroyWeak((id *)&self->_cachedTemplate);
}

@end
