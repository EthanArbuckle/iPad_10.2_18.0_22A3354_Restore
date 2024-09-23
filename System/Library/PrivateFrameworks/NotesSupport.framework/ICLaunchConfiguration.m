@implementation ICLaunchConfiguration

- (ICLaunchConfiguration)initWithDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ICLaunchConfiguration *v20;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Environment"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("-PPTLaunchTest"));

  if ((v6 & 1) != 0)
    v7 = 1;
  else
    v7 = ICLaunchConfigurationEnvironmentWithString(v4);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Container"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICLaunchConfiguration nonDefaultValueForValue:](ICLaunchConfiguration, "nonDefaultValueForValue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ResetContainer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ResetCloud"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ResetState"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("LocalAccountArchiveName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICLaunchConfiguration nonDefaultValueForValue:](ICLaunchConfiguration, "nonDefaultValueForValue:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CloudAccountArchiveName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICLaunchConfiguration nonDefaultValueForValue:](ICLaunchConfiguration, "nonDefaultValueForValue:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[ICLaunchConfiguration initWithEnvironment:container:resetsContainer:resetsCloud:resetsState:localAccountArchive:cloudAccountArchive:](self, "initWithEnvironment:container:resetsContainer:resetsCloud:resetsState:localAccountArchive:cloudAccountArchive:", v7, v9, v11, v13, v15, v17, v19);
  return v20;
}

+ (id)nonDefaultValueForValue:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Default")))
    v4 = 0;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (ICLaunchConfiguration)initWithEnvironment:(unint64_t)a3 container:(id)a4 resetsContainer:(BOOL)a5 resetsCloud:(BOOL)a6 resetsState:(BOOL)a7 localAccountArchive:(id)a8 cloudAccountArchive:(id)a9
{
  id v15;
  id v16;
  id v17;
  ICLaunchConfiguration *v18;
  ICLaunchConfiguration *v19;
  objc_super v22;

  v15 = a4;
  v16 = a8;
  v17 = a9;
  v22.receiver = self;
  v22.super_class = (Class)ICLaunchConfiguration;
  v18 = -[ICLaunchConfiguration init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_environment = a3;
    objc_storeStrong((id *)&v18->_container, a4);
    v19->_resetsContainer = a5;
    v19->_resetsCloud = a6;
    v19->_resetsState = a7;
    objc_storeStrong((id *)&v19->_localAccountArchiveName, a8);
    objc_storeStrong((id *)&v19->_cloudAccountArchiveName, a9);
  }

  return v19;
}

- (unint64_t)environment
{
  return self->_environment;
}

- (BOOL)resetsState
{
  return self->_resetsState;
}

- (BOOL)resetsContainer
{
  return self->_resetsContainer;
}

- (BOOL)resetsCloud
{
  return self->_resetsCloud;
}

- (NSString)localAccountArchiveName
{
  return self->_localAccountArchiveName;
}

- (NSString)container
{
  return self->_container;
}

- (NSString)cloudAccountArchiveName
{
  return self->_cloudAccountArchiveName;
}

+ (ICLaunchConfiguration)currentConfiguration
{
  if (currentConfiguration_onceToken != -1)
    dispatch_once(&currentConfiguration_onceToken, &__block_literal_global_12);
  return (ICLaunchConfiguration *)(id)currentConfiguration_s_currentConfiguration;
}

void __45__ICLaunchConfiguration_currentConfiguration__block_invoke()
{
  ICLaunchConfiguration *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = [ICLaunchConfiguration alloc];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[ICLaunchConfiguration initWithDictionary:](v0, "initWithDictionary:", v1);
  v3 = (void *)currentConfiguration_s_currentConfiguration;
  currentConfiguration_s_currentConfiguration = v2;

}

+ (ICLaunchConfiguration)userInterfaceTesting
{
  if (userInterfaceTesting_onceToken != -1)
    dispatch_once(&userInterfaceTesting_onceToken, &__block_literal_global_19);
  return (ICLaunchConfiguration *)(id)userInterfaceTesting_s_userInterfaceTesting;
}

void __45__ICLaunchConfiguration_userInterfaceTesting__block_invoke()
{
  ICLaunchConfiguration *v0;
  void *v1;

  v0 = -[ICLaunchConfiguration initWithEnvironment:container:resetsContainer:resetsCloud:resetsState:localAccountArchive:cloudAccountArchive:]([ICLaunchConfiguration alloc], "initWithEnvironment:container:resetsContainer:resetsCloud:resetsState:localAccountArchive:cloudAccountArchive:", 2, CFSTR("User Interface Testing"), 1, 0, 1, CFSTR("User Interface Testing"), 0);
  v1 = (void *)userInterfaceTesting_s_userInterfaceTesting;
  userInterfaceTesting_s_userInterfaceTesting = (uint64_t)v0;

}

- (NSArray)launchArguments
{
  uint64_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[16];

  v31[14] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-%@"), CFSTR("Environment"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v30;
  NSStringFromICLaunchConfigurationEnvironment(-[ICLaunchConfiguration environment](self, "environment"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v29;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-%@"), CFSTR("Container"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v28;
  -[ICLaunchConfiguration container](self, "container");
  v3 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v3;
  v4 = CFSTR("Default");
  if (v3)
    v4 = (const __CFString *)v3;
  v31[3] = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-%@"), CFSTR("ResetContainer"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v26;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICLaunchConfiguration resetsContainer](self, "resetsContainer"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v24;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-%@"), CFSTR("ResetCloud"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v23;
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICLaunchConfiguration resetsCloud](self, "resetsCloud"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@"), v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-%@"), CFSTR("ResetState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[8] = v8;
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICLaunchConfiguration resetsState](self, "resetsState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[9] = v11;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-%@"), CFSTR("LocalAccountArchiveName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[10] = v12;
  -[ICLaunchConfiguration localAccountArchiveName](self, "localAccountArchiveName");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = CFSTR("Default");
  v31[11] = v15;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-%@"), CFSTR("CloudAccountArchiveName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[12] = v16;
  -[ICLaunchConfiguration cloudAccountArchiveName](self, "cloudAccountArchiveName");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = CFSTR("Default");
  v31[13] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v20;
}

- (void)setEnvironment:(unint64_t)a3
{
  self->_environment = a3;
}

- (void)setContainer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setResetsCloud:(BOOL)a3
{
  self->_resetsCloud = a3;
}

- (void)setResetsContainer:(BOOL)a3
{
  self->_resetsContainer = a3;
}

- (void)setResetsState:(BOOL)a3
{
  self->_resetsState = a3;
}

- (void)setLocalAccountArchiveName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setCloudAccountArchiveName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudAccountArchiveName, 0);
  objc_storeStrong((id *)&self->_localAccountArchiveName, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
