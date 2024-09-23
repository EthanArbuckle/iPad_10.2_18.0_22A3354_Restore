@implementation DPStrings

void __35___DPStrings_databaseDirectoryPath__block_invoke()
{
  void *v0;

  v0 = (void *)databaseDirectoryPath__DPDatabaseDirectoryPath;
  databaseDirectoryPath__DPDatabaseDirectoryPath = (uint64_t)CFSTR("/var/mobile/Library/DifferentialPrivacy/");

}

void __34___DPStrings_reportsDirectoryPath__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "databaseDirectoryPath");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%@"), v4, CFSTR("Reports"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)reportsDirectoryPath__DPReportsDirectoryPath;
  reportsDirectoryPath__DPReportsDirectoryPath = v2;

}

void __42___DPStrings_transparencyLogDirectoryPath__block_invoke()
{
  void *v0;

  v0 = (void *)transparencyLogDirectoryPath__DPTransparencyLogDirectoryPath;
  transparencyLogDirectoryPath__DPTransparencyLogDirectoryPath = (uint64_t)CFSTR("/var/mobile/Library/Logs/Dedisco");

}

void __33___DPStrings_tokensDirectoryPath__block_invoke()
{
  void *v0;

  v0 = (void *)tokensDirectoryPath__DPDediscoTokensDirectoryPath;
  tokensDirectoryPath__DPDediscoTokensDirectoryPath = (uint64_t)CFSTR("/var/mobile/Library/PPM/PAT/");

}

void __26___DPStrings_keyNamesPath__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("/System/Library/DifferentialPrivacy/Configuration/"), CFSTR("com.apple.dprivacyd.keynames.plist"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyNamesPath__DPKeyNamesPlist;
  keyNamesPath__DPKeyNamesPlist = v0;

}

void __31___DPStrings_keyPropertiesPath__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("/System/Library/DifferentialPrivacy/Configuration/"), CFSTR("com.apple.dprivacyd.keyproperties.plist"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPropertiesPath__DPKeyPropertiesPlist;
  keyPropertiesPath__DPKeyPropertiesPlist = v0;

}

void __34___DPStrings_budgetPropertiesPath__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("/System/Library/DifferentialPrivacy/Configuration/"), CFSTR("com.apple.dprivacyd.budgetproperties.plist"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)budgetPropertiesPath__DPBudgetPropertiesPlist;
  budgetPropertiesPath__DPBudgetPropertiesPlist = v0;

}

void __37___DPStrings_algorithmParametersPath__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("/System/Library/DifferentialPrivacy/Configuration/"), CFSTR("com.apple.dprivacyd.algorithmparameters.plist"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)algorithmParametersPath__DPAlgorithmParametersPlist;
  algorithmParametersPath__DPAlgorithmParametersPlist = v0;

}

void __37___DPStrings_namespaceParametersPath__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("/System/Library/DifferentialPrivacy/Configuration/"), CFSTR("com.apple.dprivacyd.namespaceparameters.plist"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)namespaceParametersPath__DPNamespaceParametersPlist;
  namespaceParametersPath__DPNamespaceParametersPlist = v0;

}

void __36___DPStrings_dataTypeParametersPath__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("/System/Library/DifferentialPrivacy/Configuration/"), CFSTR("com.apple.dprivacyd.datatypeparameters.plist"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dataTypeParametersPath__DPDataTypeParametersPlist;
  dataTypeParametersPath__DPDataTypeParametersPlist = v0;

}

void __43___DPStrings_runtimeBlacklistDirectoryPath__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "databaseDirectoryPath");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@/%@"), v4, CFSTR("Configuration/Blacklists/"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)runtimeBlacklistDirectoryPath__DPBlacklistRuntimeDirectoryPath;
  runtimeBlacklistDirectoryPath__DPBlacklistRuntimeDirectoryPath = v2;

}

@end
