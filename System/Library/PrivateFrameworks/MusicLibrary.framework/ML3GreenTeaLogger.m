@implementation ML3GreenTeaLogger

- (void)logAccess
{
  double v3;
  double v4;
  double lastLogTime;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3;
  os_unfair_lock_lock(&self->_lock);
  lastLogTime = self->_lastLogTime;
  os_unfair_lock_unlock(&self->_lock);
  if (v4 - lastLogTime > 0.1)
  {
    os_unfair_lock_lock(&self->_lock);
    self->_lastLogTime = v4;
    os_unfair_lock_unlock(&self->_lock);
    getCTGreenTeaOsLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v8 = -[NSString UTF8String](self->_accessor, "UTF8String");
        v9 = 136315138;
        v10 = v8;
        _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_INFO, "MediaLibrary accessed by %s", (uint8_t *)&v9, 0xCu);
      }
    }

  }
}

- (ML3GreenTeaLogger)initWithAccessorName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  ML3GreenTeaLogger *v8;
  ML3GreenTeaLogger *v9;
  objc_super v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (ML3GreenTeaIsLoggableBundleIdentifier(v6))
  {
    v11.receiver = self;
    v11.super_class = (Class)ML3GreenTeaLogger;
    v8 = -[ML3GreenTeaLogger init](&v11, sel_init);
    if (v8)
    {
      v8->_logger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
      objc_storeStrong((id *)&v8->_accessor, v6);
      v8->_lock._os_unfair_lock_opaque = 0;
      v8->_lastLogTime = 0.0;
    }
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessor, 0);
}

- (void)dealloc
{
  objc_super v3;

  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)ML3GreenTeaLogger;
  -[ML3GreenTeaLogger dealloc](&v3, sel_dealloc);
}

- (void)beginLogAccessInterval
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  getCTGreenTeaOsLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = -[NSString UTF8String](self->_accessor, "UTF8String");
    v6 = 136315138;
    v7 = v5;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_INFO, "MediaLibrary accessed begun by %s", (uint8_t *)&v6, 0xCu);
  }

}

- (void)endLogAccessInterval
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  getCTGreenTeaOsLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = -[NSString UTF8String](self->_accessor, "UTF8String");
    v6 = 136315138;
    v7 = v5;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_INFO, "MediaLibrary accessed ended by %s", (uint8_t *)&v6, 0xCu);
  }

}

+ (void)logOnceForAccessor:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (ML3GreenTeaIsLoggableBundleIdentifier(v5))
  {
    ct_green_tea_logger_create();
    getCTGreenTeaOsLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 136315138;
      v10 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_INFO, "MediaLibrary accessed by %s", (uint8_t *)&v9, 0xCu);
    }

    ct_green_tea_logger_destroy();
  }

}

@end
