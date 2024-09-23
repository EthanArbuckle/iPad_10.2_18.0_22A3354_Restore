@implementation FMPastDateComponentsFormatter

- (id)stringForObjectValue:(id)a3 withReferenceDate:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  BOOL v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  int v32;
  id v33;
  id v35;
  id v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[NSDateComponentsFormatter allowedUnits](self, "allowedUnits");
      if (!v8)
        goto LABEL_8;
      v9 = 0;
      do
      {
        v9 += v8 & 1;
        v10 = v8 > 1;
        v8 >>= 1;
      }
      while (v10);
      if (v9 != 1)
      {
        if (v9)
        {
          LogCategory_Unspecified();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            -[FMPastDateComponentsFormatter stringForObjectValue:withReferenceDate:].cold.2(v11, v21, v22, v23, v24, v25, v26, v27);
          goto LABEL_15;
        }
LABEL_8:
        LogCategory_Unspecified();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[FMPastDateComponentsFormatter stringForObjectValue:withReferenceDate:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
LABEL_15:
        v19 = 0;
LABEL_26:

        goto LABEL_27;
      }
      v11 = v6;
      v37 = 0;
      if (-[NSDateComponentsFormatter allowedUnits](self, "allowedUnits") == 128)
      {
        v20 = -[NSObject second](v11, "second");
      }
      else if (-[NSDateComponentsFormatter allowedUnits](self, "allowedUnits") == 64)
      {
        v20 = -[NSObject minute](v11, "minute");
      }
      else
      {
        if (-[NSDateComponentsFormatter allowedUnits](self, "allowedUnits") != 32)
          goto LABEL_21;
        v20 = -[NSObject hour](v11, "hour");
      }
      if (v20 < 0)
      {
        -[NSDateComponentsFormatter unitsStyle](self, "unitsStyle");
        -[NSDateComponentsFormatter formattingContext](self, "formattingContext");
        -[NSDateComponentsFormatter calendar](self, "calendar");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "locale");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localeIdentifier");
        v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v31, "UTF8String");
        ureldatefmt_open();

        v32 = ureldatefmt_formatNumeric();
        v37 = 0;
        v33 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 2 * (v32 + 1)));
        objc_msgSend(v33, "mutableBytes");
        objc_msgSend(v33, "length");
        ureldatefmt_formatNumeric();
        ureldatefmt_close();
        v35 = objc_alloc(MEMORY[0x1E0CB3940]);
        v36 = objc_retainAutorelease(v33);
        v28 = (id)objc_msgSend(v35, "initWithCharacters:length:", objc_msgSend(v36, "mutableBytes"), v32);

        v19 = v28;
LABEL_25:

        goto LABEL_26;
      }
LABEL_21:
      LogCategory_Unspecified();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[FMPastDateComponentsFormatter stringForObjectValue:withReferenceDate:].cold.3((uint64_t)v11, v28);
      v19 = 0;
      goto LABEL_25;
    }
  }
  v19 = 0;
LABEL_27:

  return v19;
}

- (void)stringForObjectValue:(uint64_t)a3 withReferenceDate:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9967000, a1, a3, "FMPastDateComponentsFormatter called with without specifying allowedUnits!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)stringForObjectValue:(uint64_t)a3 withReferenceDate:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9967000, a1, a3, "FMPastDateComponentsFormatter called with more than one allowedUnit specified!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)stringForObjectValue:(uint64_t)a1 withReferenceDate:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9967000, a2, OS_LOG_TYPE_ERROR, "FMPastDateComponentsFormatter called with unsupported argument: %@", (uint8_t *)&v2, 0xCu);
}

- (void)stringForObjectValue:(uint64_t)a3 withReferenceDate:(uint64_t)a4 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1C9967000, a2, a3, "ureldatefmt_open error: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)stringForObjectValue:(uint64_t)a3 withReferenceDate:(uint64_t)a4 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1C9967000, a2, a3, "ureldatefmt_formatNumeric error: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
