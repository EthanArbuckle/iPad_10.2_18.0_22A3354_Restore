@implementation NSDictionary(CKMultiFrameImage)

- (NSObject)ckmfi_numberArrayForKey:()CKMultiFrameImage
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSObject *v11;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v6 = v5;
      v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v15 != v9)
              objc_enumerationMutation(v6);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              IMLogHandleForCategory();
              v12 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
                -[NSDictionary(CKMultiFrameImage) ckmfi_numberArrayForKey:].cold.1();

              goto LABEL_18;
            }
          }
          v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v8)
            continue;
          break;
        }
      }

      v11 = v6;
    }
    else
    {
      IMLogHandleForCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[NSDictionary(CKMultiFrameImage) ckmfi_numberArrayForKey:].cold.2();
LABEL_18:
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)ckmfi_numberForKey:()CKMultiFrameImage
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(a1, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NSDictionary(CKMultiFrameImage) ckmfi_numberForKey:].cold.1();

    goto LABEL_7;
  }
  v6 = v5;
LABEL_8:

  return v6;
}

- (void)ckmfi_numberArrayForKey:()CKMultiFrameImage .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Object in array for key \"%@\" is of unexpected type, expected NSNumber, returning nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)ckmfi_numberArrayForKey:()CKMultiFrameImage .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Object for key \"%@\" is of unexpected type, expected NSArray, returning nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)ckmfi_numberForKey:()CKMultiFrameImage .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Object for key \"%@\" is of unexpected type, expected NSNumber, returning nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
