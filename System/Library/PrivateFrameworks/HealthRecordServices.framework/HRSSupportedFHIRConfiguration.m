@implementation HRSSupportedFHIRConfiguration

- (HRSSupportedFHIRConfiguration)init
{
  HRSSupportedFHIRConfiguration *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *releasesTable;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HRSSupportedFHIRConfiguration;
  v2 = -[HRSSupportedFHIRConfiguration init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    releasesTable = v2->_releasesTable;
    v2->_releasesTable = v3;

  }
  return v2;
}

- (id)supportedReleaseForFHIRRelease:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_releasesTable, "objectForKeyedSubscript:", a3);
}

- (BOOL)isSupportedFHIRVersionString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  id v9;

  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD3BA0], "versionFromVersionString:error:", a3, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v4)
  {
    objc_msgSend(v4, "FHIRRelease");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HRSSupportedFHIRConfiguration isSupportedFHIRRelease:](self, "isSupportedFHIRRelease:", v6);

  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      -[HRSSupportedFHIRConfiguration isSupportedFHIRVersionString:].cold.1();
    v7 = 0;
  }

  return v7;
}

- (BOOL)isSupportedFHIRRelease:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_releasesTable, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEBUG))
      -[HRSSupportedFHIRConfiguration isSupportedFHIRRelease:].cold.1();
  }

  return v5 != 0;
}

- (BOOL)isSupportedFHIRResourceType:(id)a3 FHIRVersionString:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  id v12;

  v6 = a3;
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD3BA0], "versionFromVersionString:error:", a4, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v7)
  {
    objc_msgSend(v7, "FHIRRelease");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HRSSupportedFHIRConfiguration isSupportedFHIRResourceType:FHIRRelease:](self, "isSupportedFHIRResourceType:FHIRRelease:", v6, v9);

  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      -[HRSSupportedFHIRConfiguration isSupportedFHIRResourceType:FHIRVersionString:].cold.1();
    v10 = 0;
  }

  return v10;
}

- (BOOL)isSupportedFHIRResourceType:(id)a3 FHIRRelease:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;
  void *v13;
  NSObject *v15;
  id v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_releasesTable, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEBUG))
      -[HRSSupportedFHIRConfiguration isSupportedFHIRRelease:].cold.1();
    goto LABEL_8;
  }
  objc_msgSend(v8, "resourceTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v6);

  if ((v11 & 1) == 0)
  {
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEBUG))
    {
      v15 = v13;
      v17 = 138543874;
      v18 = (id)objc_opt_class();
      v19 = 2114;
      v20 = v7;
      v21 = 2114;
      v22 = v6;
      v16 = v18;
      _os_log_debug_impl(&dword_2163C4000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ FHIR release \"%{public}@\" is supported but resource type \"%{public}@\" is not", (uint8_t *)&v17, 0x20u);

    }
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  v12 = 1;
LABEL_9:

  return v12;
}

- (BOOL)addSupportedFHIRRelease:(id)a3 error:(id *)a4
{
  id v6;
  NSMutableDictionary *releasesTable;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;

  v6 = a3;
  releasesTable = self->_releasesTable;
  objc_msgSend(v6, "FHIRRelease");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](releasesTable, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("%@ already has FHIR release %@ configured, cannot add a second configuration"), self, v6);
  }
  else
  {
    v10 = self->_releasesTable;
    objc_msgSend(v6, "FHIRRelease");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v6, v11);

  }
  return v9 == 0;
}

+ (id)emetConfiguration
{
  id v3;
  void *v4;
  HRSSupportedFHIRRelease *v5;
  HRSSupportedFHIRRelease *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v11;

  v3 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("AllergyIntolerance"), CFSTR("Condition"), CFSTR("DiagnosticReport"), CFSTR("Immunization"), CFSTR("MedicationDispense"), CFSTR("MedicationOrder"), CFSTR("MedicationStatement"), CFSTR("Observation"), CFSTR("Patient"), CFSTR("Procedure"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [HRSSupportedFHIRRelease alloc];
  v6 = -[HRSSupportedFHIRRelease initWithFHIRRelease:resourceTypes:](v5, "initWithFHIRRelease:resourceTypes:", *MEMORY[0x24BDD2BF0], v4);
  v11 = 0;
  v7 = objc_msgSend(v3, "addSupportedFHIRRelease:error:", v6, &v11);
  v8 = v11;
  if ((v7 & 1) == 0)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      +[HRSSupportedFHIRConfiguration emetConfiguration].cold.1((uint64_t)a1, (uint64_t)v8, v9);
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HRSSupportedFHIRConfiguration *v4;
  NSMutableDictionary *releasesTable;
  void *v6;
  char v7;

  v4 = (HRSSupportedFHIRConfiguration *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      releasesTable = self->_releasesTable;
      -[HRSSupportedFHIRConfiguration releasesTable](v4, "releasesTable");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSMutableDictionary isEqualToDictionary:](releasesTable, "isEqualToDictionary:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSMutableDictionary hash](self->_releasesTable, "hash");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NSMutableDictionary allValues](self->_releasesTable, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_map:", &__block_literal_global_11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %p supported releases: %@>"), v7, self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __44__HRSSupportedFHIRConfiguration_description__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "FHIRRelease");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)-[NSMutableDictionary copy](self->_releasesTable, "copy");
  objc_msgSend(v4, "setReleasesTable:", v5);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_releasesTable, CFSTR("ReleasesTable"));
}

- (HRSSupportedFHIRConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  HRSSupportedFHIRConfiguration *v10;
  uint64_t v11;
  NSMutableDictionary *releasesTable;
  HRSSupportedFHIRConfiguration *v13;
  objc_super v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ReleasesTable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)HRSSupportedFHIRConfiguration;
    v10 = -[HRSSupportedFHIRConfiguration init](&v15, sel_init);
    if (v10)
    {
      v11 = objc_msgSend(v9, "mutableCopy");
      releasesTable = v10->_releasesTable;
      v10->_releasesTable = (NSMutableDictionary *)v11;

    }
    self = v10;
    v13 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v13 = 0;
  }

  return v13;
}

- (NSMutableDictionary)releasesTable
{
  return self->_releasesTable;
}

- (void)setReleasesTable:(id)a3
{
  objc_storeStrong((id *)&self->_releasesTable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_releasesTable, 0);
}

- (void)isSupportedFHIRVersionString:.cold.1()
{
  void *v0;
  NSObject *v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(v2);
  v3 = (id)OUTLINED_FUNCTION_1_4();
  objc_msgSend(v0, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_0(&dword_2163C4000, v1, v5, "%{public}@ isSupportedFHIRVersionString: %{public}@", v6);

  OUTLINED_FUNCTION_1_3();
}

- (void)isSupportedFHIRRelease:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_1_4();
  v3 = OUTLINED_FUNCTION_2_2(v2);
  OUTLINED_FUNCTION_4_0(&dword_2163C4000, v4, v5, "%{public}@ FHIR release \"%{public}@\" is not supported", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_3();
}

- (void)isSupportedFHIRResourceType:FHIRVersionString:.cold.1()
{
  void *v0;
  NSObject *v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(v2);
  v3 = (id)OUTLINED_FUNCTION_1_4();
  objc_msgSend(v0, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_0(&dword_2163C4000, v1, v5, "%{public}@ isSupportedFHIRResourceType:FHIRVersionString: %{public}@", v6);

  OUTLINED_FUNCTION_1_3();
}

+ (void)emetConfiguration
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  OUTLINED_FUNCTION_3_0(&dword_2163C4000, a3, (uint64_t)a3, "%{public}@ failed to add DSTU-2 release to Emet configuration: %{public}@", (uint8_t *)&v3);
}

@end
