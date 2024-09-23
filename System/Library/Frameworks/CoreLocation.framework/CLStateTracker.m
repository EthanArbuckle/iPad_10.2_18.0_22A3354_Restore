@implementation CLStateTracker

- (void)dealloc
{
  objc_super v3;

  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)CLStateTracker;
  -[CLStateTracker dealloc](&v3, sel_dealloc);
}

- (CLStateTracker)initWithQueue:(id)a3
{
  CLStateTracker *v3;
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLStateTracker;
  v3 = -[CLStateTracker init](&v7, sel_init);
  if (v3)
  {
    objc_initWeak(&location, v3);
    objc_copyWeak(&v5, &location);
    v3->_handle = os_state_add_handler();
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (BOOL)dumpState:(void *)a3 withSize:(unint64_t)a4 hints:(os_state_hints_s *)a5
{
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  int v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *ClassName;
  __int16 v18;
  const char *Name;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E748 != -1)
    dispatch_once(&qword_1ECD8E748, &unk_1E2990AB0);
  v7 = qword_1ECD8E740;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_FAULT))
  {
    v12 = 68289538;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2082;
    ClassName = object_getClassName(self);
    v18 = 2082;
    Name = sel_getName(a2);
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Subclass should have overriden this\", \"class\":%{public, location:escape_only}s, \"SEL\":%{public, location:escape_only}s}", (uint8_t *)&v12, 0x26u);
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2990AB0);
  }
  v8 = qword_1ECD8E740;
  if (os_signpost_enabled((os_log_t)qword_1ECD8E740))
  {
    v9 = object_getClassName(self);
    v10 = sel_getName(a2);
    v12 = 68289538;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2082;
    ClassName = v9;
    v18 = 2082;
    Name = v10;
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Subclass should have overriden this", "{\"msg%{public}.0s\":\"Subclass should have overriden this\", \"class\":%{public, location:escape_only}s, \"SEL\":%{public, location:escape_only}s}", (uint8_t *)&v12, 0x26u);
  }
  return 0;
}

+ (unint64_t)trackerStateSize
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *ClassName;
  __int16 v15;
  const char *Name;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E748 != -1)
    dispatch_once(&qword_1ECD8E748, &unk_1E2990AB0);
  v4 = qword_1ECD8E740;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_FAULT))
  {
    v9 = 68289538;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2082;
    ClassName = object_getClassName(a1);
    v15 = 2082;
    Name = sel_getName(a2);
    _os_log_impl(&dword_18F5B3000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Subclass should have overriden this\", \"class\":%{public, location:escape_only}s, \"SEL\":%{public, location:escape_only}s}", (uint8_t *)&v9, 0x26u);
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2990AB0);
  }
  v5 = qword_1ECD8E740;
  if (os_signpost_enabled((os_log_t)qword_1ECD8E740))
  {
    v6 = object_getClassName(a1);
    v7 = sel_getName(a2);
    v9 = 68289538;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2082;
    ClassName = v6;
    v15 = 2082;
    Name = v7;
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Subclass should have overriden this", "{\"msg%{public}.0s\":\"Subclass should have overriden this\", \"class\":%{public, location:escape_only}s, \"SEL\":%{public, location:escape_only}s}", (uint8_t *)&v9, 0x26u);
  }
  return 0;
}

+ (const)trackerStateTypeName
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *ClassName;
  __int16 v15;
  const char *Name;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E748 != -1)
    dispatch_once(&qword_1ECD8E748, &unk_1E2990AB0);
  v4 = qword_1ECD8E740;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_FAULT))
  {
    v9 = 68289538;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2082;
    ClassName = object_getClassName(a1);
    v15 = 2082;
    Name = sel_getName(a2);
    _os_log_impl(&dword_18F5B3000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Subclass should have overriden this\", \"class\":%{public, location:escape_only}s, \"SEL\":%{public, location:escape_only}s}", (uint8_t *)&v9, 0x26u);
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2990AB0);
  }
  v5 = qword_1ECD8E740;
  if (os_signpost_enabled((os_log_t)qword_1ECD8E740))
  {
    v6 = object_getClassName(a1);
    v7 = sel_getName(a2);
    v9 = 68289538;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2082;
    ClassName = v6;
    v15 = 2082;
    Name = v7;
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Subclass should have overriden this", "{\"msg%{public}.0s\":\"Subclass should have overriden this\", \"class\":%{public, location:escape_only}s, \"SEL\":%{public, location:escape_only}s}", (uint8_t *)&v9, 0x26u);
  }
  return "UnknownStateTracker";
}

- (void)identifier
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *ClassName;
  __int16 v15;
  const char *Name;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E748 != -1)
    dispatch_once(&qword_1ECD8E748, &unk_1E2990AB0);
  v4 = qword_1ECD8E740;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_FAULT))
  {
    v9 = 68289538;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2082;
    ClassName = object_getClassName(self);
    v15 = 2082;
    Name = sel_getName(a2);
    _os_log_impl(&dword_18F5B3000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Subclass should have overriden this\", \"class\":%{public, location:escape_only}s, \"SEL\":%{public, location:escape_only}s}", (uint8_t *)&v9, 0x26u);
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2990AB0);
  }
  v5 = qword_1ECD8E740;
  if (os_signpost_enabled((os_log_t)qword_1ECD8E740))
  {
    v6 = object_getClassName(self);
    v7 = sel_getName(a2);
    v9 = 68289538;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2082;
    ClassName = v6;
    v15 = 2082;
    Name = v7;
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Subclass should have overriden this", "{\"msg%{public}.0s\":\"Subclass should have overriden this\", \"class\":%{public, location:escape_only}s, \"SEL\":%{public, location:escape_only}s}", (uint8_t *)&v9, 0x26u);
  }
  return self;
}

@end
