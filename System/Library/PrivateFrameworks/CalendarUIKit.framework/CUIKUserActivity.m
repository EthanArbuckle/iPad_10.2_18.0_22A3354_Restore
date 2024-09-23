@implementation CUIKUserActivity

- (void)updateActivity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[CUIKUserActivity activityTitle](self, "activityTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:", v4);

  -[CUIKUserActivity activitySubtitle](self, "activitySubtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v13, "contentAttributeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    if (!v7)
    {
      v8 = objc_alloc((Class)EKWeakLinkClass());
      objc_msgSend(v13, "activityType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v8, "initWithItemContentType:", v9);

    }
    -[CUIKUserActivity activitySubtitle](self, "activitySubtitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSubtitle:", v10);

    objc_msgSend(v13, "setContentAttributeSet:", v7);
  }
  -[CUIKUserActivity activityKeywords](self, "activityKeywords");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setKeywords:", v11);

  -[CUIKUserActivity dictionary](self, "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUserInfo:", v12);

  objc_msgSend(v13, "_setEligibleForUserActivityIndexing:", 1);
  objc_msgSend(v13, "_setEligibleForUserActivityPublicIndexing:", 0);
  objc_msgSend(v13, "_setEligibleForUserActivityHandoff:", 1);
  objc_msgSend(v13, "_setEligibleForUserActivityReminders:", 1);

}

- (NSString)activitySubtitle
{
  return self->_activitySubtitle;
}

- (NSString)activityTitle
{
  return self->_activityTitle;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setActivityTitle:(id)a3
{
  objc_storeStrong((id *)&self->_activityTitle, a3);
}

- (void)setActivitySubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_activitySubtitle, a3);
}

- (CUIKUserActivity)initWithType:(unint64_t)a3
{
  CUIKUserActivity *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUIKUserActivity;
  result = -[CUIKUserActivity init](&v5, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_version = 65537;
  }
  return result;
}

- (NSSet)activityKeywords
{
  return self->_activityKeywords;
}

- (id)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("com.apple.calendarUIKit.userActivity.type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("com.apple.calendarUIKit.userActivity.version");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityKeywords, 0);
  objc_storeStrong((id *)&self->_activitySubtitle, 0);
  objc_storeStrong((id *)&self->_activityTitle, 0);
}

- (CUIKUserActivity)initWithDictionary:(id)a3
{
  id v4;
  CUIKUserActivity *v5;
  unint64_t v6;
  NSObject *v7;
  CUIKUserActivity *v8;
  char v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CUIKUserActivity;
  v5 = -[CUIKUserActivity init](&v12, sel_init);
  if (!v5)
    goto LABEL_12;
  v5->_type = objc_msgSend((id)objc_opt_class(), "_typeFromDictionary:", v4);
  v11 = 0;
  v6 = objc_msgSend((id)objc_opt_class(), "_unsignedIntegerFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.version"), &v11);
  v5->_version = v6;
  if (!v11)
  {
    if (v6 <= 0x10001)
    {
      if (v6 != 65537)
      {
        +[CUIKLogSubsystem continuity](CUIKLogSubsystem, "continuity");
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[CUIKUserActivity initWithDictionary:].cold.2();
        goto LABEL_5;
      }
    }
    else if ((v6 & 0xFFFE0000) != 0)
    {
      +[CUIKLogSubsystem continuity](CUIKLogSubsystem, "continuity");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CUIKUserActivity initWithDictionary:].cold.1();
      goto LABEL_5;
    }
LABEL_12:
    v8 = v5;
    goto LABEL_13;
  }
  +[CUIKLogSubsystem continuity](CUIKLogSubsystem, "continuity");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[CUIKUserActivity initWithDictionary:].cold.3();
LABEL_5:

  v8 = 0;
LABEL_13:

  return v8;
}

+ (id)activityForDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  NSObject *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(a1, "_typeFromDictionary:", v4);
  v6 = v5;
  switch(v5)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      break;
    default:
      switch(v5)
      {
        case 4097:
          if ((objc_msgSend(a1, "_BOOLFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.tomorrow"), 0) & 1) != 0)goto LABEL_4;
          v6 = 4097;
          break;
        case 4098:
        case 4099:
          goto LABEL_6;
        case 4100:
LABEL_4:
          v6 = 4100;
          break;
        default:
          goto LABEL_7;
      }
      break;
  }
LABEL_6:
  v7 = (objc_class *)objc_opt_class();
  if (!v7)
  {
LABEL_7:
    +[CUIKLogSubsystem continuity](CUIKLogSubsystem, "continuity");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CUIKUserActivity activityForDictionary:].cold.1(v6);

    v7 = 0;
  }
  v9 = (void *)objc_msgSend([v7 alloc], "initWithDictionary:", v4);

  return v9;
}

+ (id)activityForActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "activityForDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActivityTitle:", v7);

  objc_msgSend(v4, "contentAttributeSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActivitySubtitle:", v9);

  objc_msgSend(v4, "_keywords");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setActivityKeywords:", v10);
  return v6;
}

+ (BOOL)_BOOLFromDictionary:(id)a3 key:(id)a4 error:(BOOL *)a5
{
  void *v6;
  char v7;
  BOOL v8;

  objc_msgSend(a3, "objectForKeyedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "BOOLValue");
      v8 = 0;
      if (!a5)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  v7 = 0;
  v8 = 1;
  if (a5)
LABEL_6:
    *a5 = v8;
LABEL_7:

  return v7;
}

+ (int64_t)_integerFromDictionary:(id)a3 key:(id)a4 error:(BOOL *)a5
{
  void *v6;
  int64_t v7;
  BOOL v8;

  objc_msgSend(a3, "objectForKeyedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "integerValue");
      v8 = 0;
      if (!a5)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  v7 = 0;
  v8 = 1;
  if (a5)
LABEL_6:
    *a5 = v8;
LABEL_7:

  return v7;
}

+ (unint64_t)_unsignedIntegerFromDictionary:(id)a3 key:(id)a4 error:(BOOL *)a5
{
  void *v6;
  unint64_t v7;
  BOOL v8;

  objc_msgSend(a3, "objectForKeyedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "unsignedIntegerValue");
      v8 = 0;
      if (!a5)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  v7 = 0;
  v8 = 1;
  if (a5)
LABEL_6:
    *a5 = v8;
LABEL_7:

  return v7;
}

+ (double)_doubleFromDictionary:(id)a3 key:(id)a4 error:(BOOL *)a5
{
  void *v6;
  double v7;
  double v8;
  BOOL v9;

  objc_msgSend(a3, "objectForKeyedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0.0;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      v7 = v8;
      v9 = 0;
      if (!a5)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  v9 = 1;
  if (a5)
LABEL_6:
    *a5 = v9;
LABEL_7:

  return v7;
}

+ (id)_stringFromDictionary:(id)a3 key:(id)a4 error:(BOOL *)a5
{
  void *v6;
  id v7;
  BOOL v8;

  objc_msgSend(a3, "objectForKeyedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      v8 = 0;
      if (!a5)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  v7 = 0;
  v8 = 1;
  if (a5)
LABEL_6:
    *a5 = v8;
LABEL_7:

  return v7;
}

+ (unint64_t)_typeFromDictionary:(id)a3
{
  unint64_t result;
  NSObject *v4;
  char v5;

  v5 = 0;
  result = objc_msgSend(a1, "_unsignedIntegerFromDictionary:key:error:", a3, CFSTR("com.apple.calendarUIKit.userActivity.type"), &v5);
  if (v5)
  {
    +[CUIKLogSubsystem continuity](CUIKLogSubsystem, "continuity");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[CUIKUserActivity _typeFromDictionary:].cold.1();

    return 0;
  }
  return result;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setActivityKeywords:(id)a3
{
  objc_storeStrong((id *)&self->_activityKeywords, a3);
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
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
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, v0, v1, "incompatible version in continuation dictionary", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, v0, v1, "invalid version in continuation dictionary", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, v0, v1, "failed to extract version from continuation dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)activityForDictionary:(uint64_t)a1 .cold.1(uint64_t a1)
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
  OUTLINED_FUNCTION_2_0(&dword_1B8A6A000, v2, v3, "invalid CUIKUserActivityType: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4_0();
}

+ (void)_typeFromDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, v0, v1, "failed to extract activity type from continuation dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
