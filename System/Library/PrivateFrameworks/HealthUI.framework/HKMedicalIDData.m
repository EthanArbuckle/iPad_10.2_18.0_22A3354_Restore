@implementation HKMedicalIDData

void __79___HKMedicalIDData_HKMedicalIDAddressBookBridge__contactKeysToLoadForMedicalID__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0C96708];
  v6[0] = *MEMORY[0x1E0C96670];
  v6[1] = v2;
  v3 = *MEMORY[0x1E0C967C0];
  v6[2] = *MEMORY[0x1E0C96890];
  v6[3] = v3;
  v6[4] = *MEMORY[0x1E0C96898];
  v6[5] = v0;
  v6[6] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)contactKeysToLoadForMedicalID_contactKeysToFetch;
  contactKeysToLoadForMedicalID_contactKeysToFetch = v4;

}

void __69___HKMedicalIDData_HKMedicalIDAddressBookBridge___contactKeysToFetch__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0C96898];
  v5[0] = *MEMORY[0x1E0C967C0];
  v5[1] = v2;
  v5[2] = *MEMORY[0x1E0C966E8];
  v5[3] = v0;
  v5[4] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_contactKeysToFetch_contactKeys;
  _contactKeysToFetch_contactKeys = v3;

}

@end
