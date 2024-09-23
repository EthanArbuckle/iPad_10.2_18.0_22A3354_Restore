@implementation NTKComplicationBundleHelper

+ (id)supportedComplicationFamiliesForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v4 = a3;
  objc_msgSend(a1, "_complicationFamilyToTemplateFileNameMapping:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundlePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__NTKComplicationBundleHelper_supportedComplicationFamiliesForBundle___block_invoke;
  v15[3] = &unk_1E6BD15B0;
  v16 = v6;
  v17 = v7;
  v9 = v8;
  v18 = v9;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v15);
  v12 = v18;
  v13 = v9;

  return v13;
}

void __70__NTKComplicationBundleHelper_supportedComplicationFamiliesForBundle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "fileExistsAtPath:", v7))
  {
    v8 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "integerValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
  else
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __70__NTKComplicationBundleHelper_supportedComplicationFamiliesForBundle___block_invoke_cold_1();

  }
}

+ (id)localizedComplicationTemplateForFamily:(int64_t)a3 bundle:(id)a4 localization:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a1, "_templateForFamily:bundle:", a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedComplicationTemplateForTemplate:bundle:localization:", v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)localizedComplicationDescriptionForFamily:(int64_t)a3 bundle:(id)a4 localization:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "bundlePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0C99D50]);
  objc_msgSend(v9, "stringByAppendingPathComponent:", *MEMORY[0x1E0C93E78]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithContentsOfFile:options:error:", v11, 1, 0);

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v12, 0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C94540], "providerWithJSONObjectRepresentation:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedTextProviderWithBundle:forLocalization:", v7, v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
        goto LABEL_15;
      }
      _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        +[NTKComplicationBundleHelper localizedComplicationDescriptionForFamily:bundle:localization:].cold.2(a3, v18);

    }
    else
    {
      _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[NTKComplicationBundleHelper localizedComplicationDescriptionForFamily:bundle:localization:].cold.3();
    }
    v17 = 0;
    goto LABEL_14;
  }
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    +[NTKComplicationBundleHelper localizedComplicationDescriptionForFamily:bundle:localization:].cold.1();
  v17 = 0;
LABEL_15:

  return v17;
}

+ (id)localizedComplicationTemplateForTemplate:(id)a3 bundle:(id)a4 localization:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __92__NTKComplicationBundleHelper_localizedComplicationTemplateForTemplate_bundle_localization___block_invoke;
  v16[3] = &unk_1E6BD15D8;
  v10 = v7;
  v17 = v10;
  v18 = v8;
  v19 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "enumerateTextProviderKeysWithBlock:", v16);
  v13 = v19;
  v14 = v10;

  return v14;
}

void __92__NTKComplicationBundleHelper_localizedComplicationTemplateForTemplate_bundle_localization___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "valueForKey:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedTextProviderWithBundle:forLocalization:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v5, v4);

}

+ (id)_templateForFamily:(int64_t)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;

  v6 = a4;
  objc_msgSend(v6, "bundlePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_complicationFamilyToTemplateFileNameMapping:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[NTKComplicationBundleHelper _templateForFamily:bundle:].cold.1(a3, (uint64_t)v6, v13);
    goto LABEL_9;
  }
  v11 = objc_alloc(MEMORY[0x1E0C99D50]);
  objc_msgSend(v7, "stringByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "initWithContentsOfFile:options:error:", v12, 1, 0);

  if (!v13)
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[NTKComplicationBundleHelper _templateForFamily:bundle:].cold.2();

LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v13, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94158], "complicationTemplateWithJSONObjectRepresentation:bundle:purpose:", v14, v6, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v15;
}

+ (id)_complicationFamilyToTemplateFileNameMapping:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;

  v3 = a3;
  objc_msgSend(v3, "bundlePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", *MEMORY[0x1E0C93E80]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v5, 1, 0);
    if (!v6)
    {
      _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[NTKComplicationBundleHelper localizedComplicationDescriptionForFamily:bundle:localization:].cold.1();
      v9 = 0;
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C93E88]);
      v8 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v8;
        v9 = v8;
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[NTKComplicationBundleHelper _complicationFamilyToTemplateFileNameMapping:].cold.3();

    }
    else
    {
      _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[NTKComplicationBundleHelper localizedComplicationDescriptionForFamily:bundle:localization:].cold.3();
    }
    v9 = 0;
    goto LABEL_18;
  }
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    +[NTKComplicationBundleHelper _complicationFamilyToTemplateFileNameMapping:].cold.1();
  v9 = 0;
LABEL_20:

  return v9;
}

void __70__NTKComplicationBundleHelper_supportedComplicationFamiliesForBundle___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1B72A3000, v0, (uint64_t)v0, "Error: Complication Descriptor %@ for family %@ specified in manifiest cannot be found, family will be omitted", v1);
  OUTLINED_FUNCTION_1();
}

+ (void)localizedComplicationDescriptionForFamily:bundle:localization:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Error: unable to retreive contents of file %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)localizedComplicationDescriptionForFamily:(uint64_t)a1 bundle:(NSObject *)a2 localization:.cold.2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint8_t buf[4];
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "Error: descriptions: value for '%@' is not a dictionary", buf, 0xCu);

}

+ (void)localizedComplicationDescriptionForFamily:bundle:localization:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Error: contents of file (%@) is not a dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_templateForFamily:(NSObject *)a3 bundle:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  CLKStringForComplicationFamily();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_2(&dword_1B72A3000, a3, v6, "Error: unable to create a filename for family (%@) in bundle %@ when looking up complication template", (uint8_t *)&v7);

}

+ (void)_templateForFamily:bundle:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Error: unable to retrieve template specified in manifest %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_complicationFamilyToTemplateFileNameMapping:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1B72A3000, v0, (uint64_t)v0, "Error: unable to build path to complication template file (%@) with bundle (%@)", v1);
  OUTLINED_FUNCTION_1();
}

+ (void)_complicationFamilyToTemplateFileNameMapping:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Error: complication manifest: value for '%@' is not a dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
