@implementation CUIKUserActivityWithSource

- (CUIKUserActivityWithSource)initWithSource:(id)a3 type:(unint64_t)a4
{
  id v6;
  CUIKUserActivityWithSource *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *sourceHost;
  void *v11;
  uint64_t v12;
  NSString *sourceOwner;
  CUIKUserActivityWithSource *v14;
  NSObject *v16;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CUIKUserActivityWithSource;
  v7 = -[CUIKUserActivity initWithType:](&v17, sel_initWithType_, a4);
  if (!v7)
    goto LABEL_8;
  v8 = v6 ? objc_msgSend(v6, "sourceType") : 0;
  v7->_sourceType = v8;
  if (!-[CUIKUserActivityWithSource _requiresHostAndOwner](v7, "_requiresHostAndOwner"))
    goto LABEL_8;
  objc_msgSend(v6, "serverHost");
  v9 = objc_claimAutoreleasedReturnValue();
  sourceHost = v7->_sourceHost;
  v7->_sourceHost = (NSString *)v9;

  if (!v7->_sourceHost)
  {
    +[CUIKLogSubsystem continuity](CUIKLogSubsystem, "continuity");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CUIKUserActivityWithSource initWithSource:type:].cold.1();
    goto LABEL_14;
  }
  objc_msgSend(v6, "ownerAddresses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "anyObject");
  v12 = objc_claimAutoreleasedReturnValue();
  sourceOwner = v7->_sourceOwner;
  v7->_sourceOwner = (NSString *)v12;

  if (!v7->_sourceOwner)
  {
    +[CUIKLogSubsystem continuity](CUIKLogSubsystem, "continuity");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CUIKUserActivityWithSource initWithSource:type:].cold.2();
LABEL_14:

    v14 = 0;
    goto LABEL_9;
  }
LABEL_8:
  v14 = v7;
LABEL_9:

  return v14;
}

- (CUIKUserActivityWithSource)initWithDictionary:(id)a3
{
  id v4;
  CUIKUserActivityWithSource *v5;
  unint64_t v6;
  uint64_t v7;
  int64_t v8;
  NSObject *v9;
  NSObject *v10;
  CUIKUserActivityWithSource *v11;
  uint64_t v12;
  NSString *sourceHost;
  uint64_t v14;
  NSString *sourceOwner;
  char v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CUIKUserActivityWithSource;
  v5 = -[CUIKUserActivity initWithDictionary:](&v18, sel_initWithDictionary_, v4);
  if (!v5)
    goto LABEL_18;
  v17 = 0;
  v6 = objc_msgSend((id)objc_opt_class(), "_unsignedIntegerFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.sourceType"), &v17);
  v7 = v6;
  if (v6 >= 8)
  {
    +[CUIKLogSubsystem continuity](CUIKLogSubsystem, "continuity");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CUIKUserActivityWithSource initWithDictionary:].cold.4(v7);

    v8 = 0;
  }
  else
  {
    v8 = qword_1B8BA4560[v6];
  }
  v5->_sourceType = v8;
  if (!v17)
  {
    if (-[CUIKUserActivityWithSource _requiresHostAndOwner](v5, "_requiresHostAndOwner"))
    {
      objc_msgSend((id)objc_opt_class(), "_stringFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.sourceHost"), &v17);
      v12 = objc_claimAutoreleasedReturnValue();
      sourceHost = v5->_sourceHost;
      v5->_sourceHost = (NSString *)v12;

      if (v17)
      {
        +[CUIKLogSubsystem continuity](CUIKLogSubsystem, "continuity");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[CUIKUserActivityWithSource initWithDictionary:].cold.2();
        goto LABEL_10;
      }
      objc_msgSend((id)objc_opt_class(), "_stringFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.sourceOwner"), &v17);
      v14 = objc_claimAutoreleasedReturnValue();
      sourceOwner = v5->_sourceOwner;
      v5->_sourceOwner = (NSString *)v14;

      if (v17)
      {
        +[CUIKLogSubsystem continuity](CUIKLogSubsystem, "continuity");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[CUIKUserActivityWithSource initWithDictionary:].cold.1();
        goto LABEL_10;
      }
    }
LABEL_18:
    v11 = v5;
    goto LABEL_19;
  }
  +[CUIKLogSubsystem continuity](CUIKLogSubsystem, "continuity");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[CUIKUserActivityWithSource initWithDictionary:].cold.3();
LABEL_10:

  v11 = 0;
LABEL_19:

  return v11;
}

- (id)dictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t sourceType;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  objc_super v12;

  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v12.receiver = self;
  v12.super_class = (Class)CUIKUserActivityWithSource;
  -[CUIKUserActivity dictionary](&v12, sel_dictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  v6 = (void *)MEMORY[0x1E0CB37E8];
  sourceType = self->_sourceType;
  if (sourceType >= 7)
  {
    +[CUIKLogSubsystem continuity](CUIKLogSubsystem, "continuity");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CUIKUserActivityWithSource dictionary].cold.1(sourceType);

    v8 = 0;
  }
  else
  {
    v8 = sourceType + 1;
  }
  objc_msgSend(v6, "numberWithUnsignedInteger:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("com.apple.calendarUIKit.userActivity.sourceType"));

  if (-[CUIKUserActivityWithSource _requiresHostAndOwner](self, "_requiresHostAndOwner"))
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_sourceHost, CFSTR("com.apple.calendarUIKit.userActivity.sourceHost"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_sourceOwner, CFSTR("com.apple.calendarUIKit.userActivity.sourceOwner"));
  }
  return v5;
}

- (unint64_t)isMatchForSource:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t sourceType;
  void *v7;
  unint64_t v8;
  void *v9;
  int v10;
  NSUInteger v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "sourceType");
  if (v5 && (sourceType = self->_sourceType) != 0)
  {
    if (v5 == sourceType)
    {
      if (-[CUIKUserActivityWithSource _requiresHostAndOwner](self, "_requiresHostAndOwner"))
      {
        objc_msgSend(v4, "serverHost");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "length"))
        {
          if (!objc_msgSend(v7, "isEqualToString:", self->_sourceHost))
            goto LABEL_16;
        }
        else if (-[NSString length](self->_sourceHost, "length"))
        {
          goto LABEL_16;
        }
        objc_msgSend(v4, "ownerAddresses");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
        {
          v10 = objc_msgSend(v9, "containsObject:", self->_sourceOwner);

          if (v10)
          {
LABEL_14:
            v8 = 1;
LABEL_17:

            goto LABEL_18;
          }
        }
        else
        {
          v11 = -[NSString length](self->_sourceOwner, "length");

          if (!v11)
            goto LABEL_14;
        }
LABEL_16:
        v8 = 0;
        goto LABEL_17;
      }
      v8 = 1;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 2;
  }
LABEL_18:

  return v8;
}

- (BOOL)_requiresHostAndOwner
{
  return (unint64_t)(self->_sourceType - 1) < 2;
}

- (BOOL)_supportsConsistentExternalIDAcrossDevices:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFBLL) == 2;
}

- (BOOL)_supportsConsistentExternalIDAcrossDevices
{
  return -[CUIKUserActivityWithSource _supportsConsistentExternalIDAcrossDevices:](self, "_supportsConsistentExternalIDAcrossDevices:", self->_sourceType);
}

- (BOOL)_isLocalSource
{
  return self->_sourceType == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceOwner, 0);
  objc_storeStrong((id *)&self->_sourceHost, 0);
}

- (void)initWithSource:type:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, v0, v1, "failed to extract host from EKSource", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithSource:type:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, v0, v1, "failed to extract owner from EKSource", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, v0, v1, "failed to extract source owner from continuation dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDictionary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, v0, v1, "failed to extract source host from continuation dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDictionary:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, v0, v1, "failed to extract source type from continuation dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDictionary:(uint64_t)a1 .cold.4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_1B8A6A000, v2, v3, "Invalid CUIKUserActivitySourceType: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)dictionary
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_1B8A6A000, v2, v3, "Invalid EKSourceType: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4_0();
}

@end
