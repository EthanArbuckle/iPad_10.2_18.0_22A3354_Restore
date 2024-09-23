@implementation CAMPreferencesUtilities

+ (double)doubleForKey:(id)a3 applicationID:(id)a4 keyIsValidAndExists:(BOOL *)a5
{
  void *v6;
  double v7;
  double v8;
  BOOL v9;

  v6 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  v7 = 0.0;
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "doubleValue");
    v7 = v8;
    v9 = 1;
    if (!a5)
      goto LABEL_7;
    goto LABEL_6;
  }
  v9 = 0;
  if (a5)
LABEL_6:
    *a5 = v9;
LABEL_7:

  return v7;
}

+ (id)colorForKey:(id)a3 applicationID:(id)a4
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void *v10;
  double v11;
  double *v12;
  void *v13;
  double v15[3];
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "count");
    if ((unint64_t)(v6 - 3) > 1)
    {
LABEL_13:
      v13 = 0;
    }
    else
    {
      v7 = v6;
      v8 = 0;
      v9 = 0;
      v16 = 1.0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          goto LABEL_13;
        }
        objc_msgSend(v10, "doubleValue");
        v15[v8] = v11;
        v9 |= v11 > 1.0;

        ++v8;
      }
      while (v7 != v8);
      if ((v9 & 1) != 0)
      {
        v12 = v15;
        do
        {
          *v12 = *v12 / 255.0;
          ++v12;
          --v7;
        }
        while (v7);
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v15[0], v15[1], v15[2], v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)BOOLInCameraDomainForKey:(id)a3
{
  return CFPreferencesGetAppBooleanValue((CFStringRef)a3, CFSTR("com.apple.camera"), 0) != 0;
}

+ (id)numericDictionaryForKey:(id)a3 defaults:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;

  v5 = a3;
  objc_msgSend(a4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v9, v6, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;
    if (v11)
    {
      v12 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[CAMPreferencesUtilities numericDictionaryForKey:defaults:].cold.1();

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)setDictionary:(id)a3 forKey:(id)a4 defaults:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;

  v7 = a4;
  v8 = a5;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v12;
  if (v10)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[CAMPreferencesUtilities setDictionary:forKey:defaults:].cold.1();

  }
  else if (v9)
  {
    objc_msgSend(v8, "setObject:forKey:", v9, v7);
  }

}

+ (void)numericDictionaryForKey:defaults:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1DB760000, v0, v1, "Failed to read dictionary for key %{public}@: %{public}@");
}

+ (void)setDictionary:forKey:defaults:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1DB760000, v0, v1, "Failed to persist dictionary for key %{public}@: %{public}@");
}

@end
