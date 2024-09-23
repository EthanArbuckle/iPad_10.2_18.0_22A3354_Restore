@implementation CalConferenceUtilities

+ (BOOL)conferenceURLHasAllowedScheme:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v12;

  v3 = a3;
  if (conferenceURLHasAllowedScheme__onceToken != -1)
    dispatch_once(&conferenceURLHasAllowedScheme__onceToken, &__block_literal_global_17);
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend((id)conferenceURLHasAllowedScheme__alwaysAllowedSchemes, "containsObject:", v5) & 1) == 0)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("file")) & 1) != 0)
    {
      v6 = 0;
      goto LABEL_17;
    }
    v12 = 0;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA58A8]), "initWithURL:error:", v3, &v12);
    v8 = v12;
    v9 = v8;
    if (v7)
    {
      objc_msgSend(v7, "bundleRecord");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v6 = -[NSObject developerType](v10, "developerType") == 3;
LABEL_15:

LABEL_16:
          goto LABEL_17;
        }
      }
    }
    else
    {
      if (!v8)
      {
        v6 = 0;
        goto LABEL_16;
      }
      objc_msgSend((id)objc_opt_class(), "_logHandle");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[CalConferenceUtilities conferenceURLHasAllowedScheme:].cold.1((uint64_t)v9, v10);
    }
    v6 = 0;
    goto LABEL_15;
  }
  v6 = 1;
LABEL_17:

  return v6;
}

void __56__CalConferenceUtilities_conferenceURLHasAllowedScheme___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E2A9B608);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conferenceURLHasAllowedScheme__alwaysAllowedSchemes;
  conferenceURLHasAllowedScheme__alwaysAllowedSchemes = v0;

}

+ (id)_logHandle
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CalConferenceUtilities__logHandle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_logHandle_onceToken != -1)
    dispatch_once(&_logHandle_onceToken, block);
  return (id)_logHandle_logHandle;
}

void __36__CalConferenceUtilities__logHandle__block_invoke()
{
  objc_class *v0;
  os_log_t v1;
  void *v2;
  id v3;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.CalendarFoundation", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)_logHandle_logHandle;
  _logHandle_logHandle = (uint64_t)v1;

}

+ (void)conferenceURLHasAllowedScheme:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18FC12000, a2, OS_LOG_TYPE_ERROR, "Error getting claim binding for URL, error: %@", (uint8_t *)&v2, 0xCu);
}

@end
