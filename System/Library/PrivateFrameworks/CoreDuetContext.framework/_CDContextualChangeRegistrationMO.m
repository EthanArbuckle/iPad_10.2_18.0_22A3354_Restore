@implementation _CDContextualChangeRegistrationMO

+ (void)hydrateMO:(id)a3 fromRegistration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", v8);

  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v12;
  if (v9)
  {
    objc_msgSend(v6, "setProperties:", v9);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    +[_CDContextualChangeRegistrationMO hydrateMO:fromRegistration:].cold.1((objc_class *)a1, (uint64_t)v10);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCreationDate:", v11);

  objc_msgSend(v6, "setIsMultiDeviceRegistration:", objc_msgSend(v7, "isMultiDeviceRegistration"));
  objc_msgSend(v6, "setIsActive:", 1);

}

+ (id)materializedRegistrationFrom:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3710];
  v5 = objc_opt_class();
  objc_msgSend(v3, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", v5, v6, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;

  if (v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    +[_CDContextualChangeRegistrationMO materializedRegistrationFrom:].cold.1(v3);

  return v7;
}

+ (id)predicateForActiveRegistrationsInBootSession:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "arrayWithCapacity:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isActive = %@"), MEMORY[0x1E0C9AAB0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isMultiDeviceRegistration = %@"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("creationDate >= %@"), v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObject:", v10);
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v11);

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (void)hydrateMO:(objc_class *)a1 fromRegistration:(uint64_t)a2 .cold.1(objc_class *a1, uint64_t a2)
{
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_18DD73000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@: Error setting mo.properties: %@", (uint8_t *)&v4, 0x16u);

  OUTLINED_FUNCTION_3();
}

+ (void)materializedRegistrationFrom:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_fault_impl(&dword_18DD73000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Failed to materialize registration with identifier: %@", (uint8_t *)&v2, 0xCu);

  OUTLINED_FUNCTION_3();
}

@end
