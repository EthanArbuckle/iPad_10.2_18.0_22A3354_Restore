@implementation HMDIDSActivityRegistrationModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_13 != -1)
    dispatch_once(&hmbProperties_onceToken_13, &__block_literal_global_15_175731);
  return (id)hmbProperties_properties_14;
}

+ (HMBModelInfiniteQuery)registeredDevicesQuery
{
  if (registeredDevicesQuery_onceToken != -1)
    dispatch_once(&registeredDevicesQuery_onceToken, &__block_literal_global_22_175722);
  return (HMBModelInfiniteQuery *)(id)registeredDevicesQuery_query;
}

+ (id)hmbQueries
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "registeredDevicesQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __57__HMDIDSActivityRegistrationModel_registeredDevicesQuery__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0D32C90];
  v5 = CFSTR("subjectDeviceIdentifier");
  objc_msgSend(MEMORY[0x1E0D32C98], "argumentWithPropertyName:", CFSTR("subjectDeviceIdentifier"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "queryWithSQLPredicate:sequenceArgumentName:indexedProperties:arguments:", CFSTR("subjectDeviceIdentifier == :subjectDeviceIdentifier"), CFSTR("subjectDeviceIdentifier"), &unk_1E8B32310, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)registeredDevicesQuery_query;
  registeredDevicesQuery_query = v3;

}

void __48__HMDIDSActivityRegistrationModel_hmbProperties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("subjectDeviceIdentifier");
  v0 = (void *)MEMORY[0x1E0D32C80];
  v1 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D32C88], "queryableField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fieldWithClass:options:", v1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("subActivities");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)hmbProperties_properties_14;
  hmbProperties_properties_14 = v6;

}

@end
