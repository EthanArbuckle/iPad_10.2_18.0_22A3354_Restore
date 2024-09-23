@implementation CNArchiver

+ (id)os_log
{
  if (os_log_cn_once_token_1_12 != -1)
    dispatch_once(&os_log_cn_once_token_1_12, &__block_literal_global_63);
  return (id)os_log_cn_once_object_1_12;
}

void __20__CNArchiver_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "archiver");
  v1 = (void *)os_log_cn_once_object_1_12;
  os_log_cn_once_object_1_12 = (uint64_t)v0;

}

+ (id)encodeObject:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, a4);
}

+ (id)decodeObjectOfClass:(Class)a3 data:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "decodeObjectOfClass:associatedClasses:data:error:", a3, MEMORY[0x1E0C9AA60], a4, a5);
}

+ (id)decodeObjectOfClass:(Class)a3 associatedClasses:(id)a4 data:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v44;
  id v45;
  id v46[3];
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v44 = a4;
  v9 = a5;
  v46[0] = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v9, v46);
  v11 = v46[0];
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v44);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", a3);
    v13 = *MEMORY[0x1E0CB2CD0];
    v45 = v11;
    objc_msgSend(v10, "decodeTopLevelObjectOfClasses:forKey:error:", v12, v13, &v45);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v45;

    if (v14)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v14;
LABEL_22:

        v11 = v15;
        objc_msgSend(v10, "finishDecoding");
        goto LABEL_23;
      }
      if (objc_msgSend(v44, "count"))
      {
        objc_msgSend(v44, "_cn_map:", &__block_literal_global_8_1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "componentsJoinedByString:", CFSTR(", "));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("or %@, by association"), v36);
      }
      else
      {
        v37 = CFSTR("no associated classes");
      }
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("The decoded object was of type %@, but an object of type %@ (%@) was expected"), objc_opt_class(), a3, v37);
      v47 = *MEMORY[0x1E0CB2938];
      v48[0] = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNFoundationError errorWithCode:userInfo:](CNFoundationError, "errorWithCode:userInfo:", 6, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (a6)
        *a6 = objc_retainAutorelease(v40);

    }
    else
    {
      objc_msgSend(a1, "os_log");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        +[CNArchiver decodeObjectOfClass:associatedClasses:data:error:].cold.3((uint64_t)v15, v26, v27, v28, v29, v30, v31, v32);

      +[CNFoundationError errorWithCode:underlyingError:](CNFoundationError, "errorWithCode:underlyingError:", 6, v15);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (a6)
        *a6 = objc_retainAutorelease(v33);

    }
    v16 = 0;
    goto LABEL_22;
  }
  objc_msgSend(a1, "os_log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    +[CNArchiver decodeObjectOfClass:associatedClasses:data:error:].cold.1((uint64_t)v11, v17, v18, v19, v20, v21, v22, v23);

  +[CNFoundationError errorWithCode:underlyingError:](CNFoundationError, "errorWithCode:underlyingError:", 6, v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (a6)
    *a6 = objc_retainAutorelease(v24);

  v16 = 0;
LABEL_23:

  return v16;
}

NSString *__63__CNArchiver_decodeObjectOfClass_associatedClasses_data_error___block_invoke(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

+ (void)decodeObjectOfClass:(uint64_t)a3 associatedClasses:(uint64_t)a4 data:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_18F80C000, a2, a3, "error initializing unarchiver: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_10();
}

+ (void)decodeObjectOfClass:(uint64_t)a3 associatedClasses:(uint64_t)a4 data:(uint64_t)a5 error:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_18F80C000, a2, a3, "exception while unarchiving object: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_10();
}

+ (void)decodeObjectOfClass:(uint64_t)a3 associatedClasses:(uint64_t)a4 data:(uint64_t)a5 error:(uint64_t)a6 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_18F80C000, a2, a3, "error unarchiving object: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_10();
}

@end
