@implementation HDFeatureAvailabilityStoreServer

- (void)remote_getFeatureOnboardingRecordWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[6];
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = (void (**)(id, _QWORD, id))a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__166;
  v14 = __Block_byref_object_dispose__166;
  v15 = 0;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__HDFeatureAvailabilityStoreServer_remote_getFeatureOnboardingRecordWithCompletion___block_invoke;
  v8[3] = &unk_1E6CF1500;
  v8[4] = self;
  v8[5] = &v10;
  objc_msgSend(v6, "performHighPriorityTransactionsWithError:block:", &v9, v8);
  v7 = v9;

  v4[2](v4, v11[5], v7);
  _Block_object_dispose(&v10, 8);

}

BOOL __84__HDFeatureAvailabilityStoreServer_remote_getFeatureOnboardingRecordWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "featureOnboardingRecordWithError:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (void)remote_getIsCurrentOnboardingVersionCompletedWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[6];
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = (void (**)(id, _QWORD, id))a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__166;
  v14 = __Block_byref_object_dispose__166;
  v15 = 0;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __96__HDFeatureAvailabilityStoreServer_remote_getIsCurrentOnboardingVersionCompletedWithCompletion___block_invoke;
  v8[3] = &unk_1E6CF1500;
  v8[4] = self;
  v8[5] = &v10;
  objc_msgSend(v6, "performHighPriorityTransactionsWithError:block:", &v9, v8);
  v7 = v9;

  v4[2](v4, v11[5], v7);
  _Block_object_dispose(&v10, 8);

}

BOOL __96__HDFeatureAvailabilityStoreServer_remote_getIsCurrentOnboardingVersionCompletedWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "isCurrentOnboardingVersionCompletedWithError:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (void)remote_canCompleteOnboardingForCountryCode:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__166;
  v20 = __Block_byref_object_dispose__166;
  v21 = 0;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90__HDFeatureAvailabilityStoreServer_remote_canCompleteOnboardingForCountryCode_completion___block_invoke;
  v12[3] = &unk_1E6CF1528;
  v14 = &v16;
  v12[4] = self;
  v10 = v6;
  v13 = v10;
  objc_msgSend(v9, "performHighPriorityTransactionsWithError:block:", &v15, v12);
  v11 = v15;

  v7[2](v7, v17[5], v11);
  _Block_object_dispose(&v16, 8);

}

BOOL __90__HDFeatureAvailabilityStoreServer_remote_canCompleteOnboardingForCountryCode_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1[4] + 40), "canCompleteOnboardingForCountryCode:error:", a1[5], a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) != 0;
}

- (void)remote_onboardingEligibilityForCountryCode:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__166;
  v20 = __Block_byref_object_dispose__166;
  v21 = 0;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90__HDFeatureAvailabilityStoreServer_remote_onboardingEligibilityForCountryCode_completion___block_invoke;
  v12[3] = &unk_1E6CF1528;
  v14 = &v16;
  v12[4] = self;
  v10 = v6;
  v13 = v10;
  objc_msgSend(v9, "performHighPriorityTransactionsWithError:block:", &v15, v12);
  v11 = v15;

  v7[2](v7, v17[5], v11);
  _Block_object_dispose(&v16, 8);

}

BOOL __90__HDFeatureAvailabilityStoreServer_remote_onboardingEligibilityForCountryCode_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1[4] + 40), "onboardingEligibilityForCountryCode:error:", a1[5], a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) != 0;
}

- (void)remote_onboardedCountryCodeSupportedStateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[6];
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = (void (**)(id, _QWORD, id))a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__166;
  v14 = __Block_byref_object_dispose__166;
  v15 = 0;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__HDFeatureAvailabilityStoreServer_remote_onboardedCountryCodeSupportedStateWithCompletion___block_invoke;
  v8[3] = &unk_1E6CF1500;
  v8[4] = self;
  v8[5] = &v10;
  objc_msgSend(v6, "performHighPriorityTransactionsWithError:block:", &v9, v8);
  v7 = v9;

  v4[2](v4, v11[5], v7);
  _Block_object_dispose(&v10, 8);

}

BOOL __92__HDFeatureAvailabilityStoreServer_remote_onboardedCountryCodeSupportedStateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "onboardedCountryCodeSupportedStateWithError:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (void)remote_getIsFeatureCapabilitySupportedOnActivePairedDeviceWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[6];
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = (void (**)(id, _QWORD, id))a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__166;
  v14 = __Block_byref_object_dispose__166;
  v15 = 0;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __109__HDFeatureAvailabilityStoreServer_remote_getIsFeatureCapabilitySupportedOnActivePairedDeviceWithCompletion___block_invoke;
  v8[3] = &unk_1E6CF1500;
  v8[4] = self;
  v8[5] = &v10;
  objc_msgSend(v6, "performHighPriorityTransactionsWithError:block:", &v9, v8);
  v7 = v9;

  v4[2](v4, v11[5], v7);
  _Block_object_dispose(&v10, 8);

}

BOOL __109__HDFeatureAvailabilityStoreServer_remote_getIsFeatureCapabilitySupportedOnActivePairedDeviceWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "isFeatureCapabilitySupportedOnActivePairedDeviceWithError:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (void)remote_earliestDateLowestOnboardingVersionCompletedWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[6];
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = (void (**)(id, _QWORD, id))a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__166;
  v14 = __Block_byref_object_dispose__166;
  v15 = 0;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __102__HDFeatureAvailabilityStoreServer_remote_earliestDateLowestOnboardingVersionCompletedWithCompletion___block_invoke;
  v8[3] = &unk_1E6CF1500;
  v8[4] = self;
  v8[5] = &v10;
  objc_msgSend(v6, "performHighPriorityTransactionsWithError:block:", &v9, v8);
  v7 = v9;

  v4[2](v4, v11[5], v7);
  _Block_object_dispose(&v10, 8);

}

BOOL __102__HDFeatureAvailabilityStoreServer_remote_earliestDateLowestOnboardingVersionCompletedWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "earliestDateLowestOnboardingVersionCompletedWithError:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (void)remote_getPairedFeatureAttributesWithCompletion:(id)a3
{
  HDFeatureAvailabilityExtension *extension;
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  extension = self->_extension;
  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDFeatureAvailabilityExtension pairedFeatureAttributesWithError:](extension, "pairedFeatureAttributesWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (void)remote_getFeatureAvailabilityRequirementsWithCompletion:(id)a3
{
  HDFeatureAvailabilityExtension *extension;
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  extension = self->_extension;
  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDFeatureAvailabilityExtension featureAvailabilityRequirementsWithError:](extension, "featureAvailabilityRequirementsWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (void)remote_getRegionAvailabilityWithCompletion:(id)a3
{
  HDFeatureAvailabilityExtension *extension;
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  extension = self->_extension;
  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDFeatureAvailabilityExtension regionAvailabilityWithError:](extension, "regionAvailabilityWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (uint64_t)_hasWriteEntitlementWithError:(uint64_t)result
{
  id *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (result)
  {
    v3 = (id *)result;
    objc_msgSend((id)result, "client");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entitlements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasEntitlement:", *MEMORY[0x1E0CB4F08]);

    if ((v6 & 1) != 0)
      return 1;
    objc_msgSend(v3, "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "entitlements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0CB4F10];
    objc_msgSend(v3[5], "featureIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend(v8, "arrayEntitlement:containsString:", v9, v10);

    if ((v9 & 1) != 0)
    {
      return 1;
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v3[5], "featureIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hk_error:format:", 4, CFSTR("Unauthorized access to modify availability of feature %@"), v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        if (a2)
          *a2 = objc_retainAutorelease(v13);
        else
          _HKLogDroppedError();
      }

      return 0;
    }
  }
  return result;
}

- (void)remote_setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, id);
  char v16;
  id v17;
  id v18;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v18 = 0;
  v15 = (void (**)(id, _QWORD, id))a7;
  v16 = -[HDFeatureAvailabilityStoreServer _hasWriteEntitlementWithError:]((uint64_t)self, &v18);
  v17 = v18;
  if ((v16 & 1) != 0)
    -[HDFeatureAvailabilityExtension setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:](self->_extension, "setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:", v12, a4, v13, v14, v15);
  else
    v15[2](v15, 0, v17);

}

- (void)remote_saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  char v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a5;
  v21 = 0;
  v12 = -[HDFeatureAvailabilityStoreServer _hasWriteEntitlementWithError:]((uint64_t)self, &v21);
  v13 = v21;
  if ((v12 & 1) != 0)
  {
    objc_msgSend(v9, "featureIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDFeatureAvailabilityExtension featureIdentifier](self->_extension, "featureIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

    if ((v16 & 1) != 0)
    {
      -[HDFeatureAvailabilityExtension saveOnboardingCompletion:settings:completion:](self->_extension, "saveOnboardingCompletion:settings:completion:", v9, v10, v11);
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = objc_opt_class();
      objc_msgSend(v9, "featureIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v18, a2, CFSTR("Cannot save onboarding for feature %@"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, 0, v20);

    }
  }
  else
  {
    v11[2](v11, 0, v13);
  }

}

- (void)remote_setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  char v11;
  id v12;
  id v13;

  v8 = a3;
  v9 = a4;
  v13 = 0;
  v10 = (void (**)(id, _QWORD, id))a5;
  v11 = -[HDFeatureAvailabilityStoreServer _hasWriteEntitlementWithError:]((uint64_t)self, &v13);
  v12 = v13;
  if ((v11 & 1) != 0)
    -[HDFeatureAvailabilityExtension setFeatureSettingData:forKey:completion:](self->_extension, "setFeatureSettingData:forKey:completion:", v8, v9, v10);
  else
    v10[2](v10, 0, v12);

}

- (void)remote_setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  char v11;
  id v12;
  id v13;

  v8 = a3;
  v9 = a4;
  v13 = 0;
  v10 = (void (**)(id, _QWORD, id))a5;
  v11 = -[HDFeatureAvailabilityStoreServer _hasWriteEntitlementWithError:]((uint64_t)self, &v13);
  v12 = v13;
  if ((v11 & 1) != 0)
    -[HDFeatureAvailabilityExtension setFeatureSettingString:forKey:completion:](self->_extension, "setFeatureSettingString:forKey:completion:", v8, v9, v10);
  else
    v10[2](v10, 0, v12);

}

- (void)remote_setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  char v11;
  id v12;
  id v13;

  v8 = a3;
  v9 = a4;
  v13 = 0;
  v10 = (void (**)(id, _QWORD, id))a5;
  v11 = -[HDFeatureAvailabilityStoreServer _hasWriteEntitlementWithError:]((uint64_t)self, &v13);
  v12 = v13;
  if ((v11 & 1) != 0)
    -[HDFeatureAvailabilityExtension setFeatureSettingNumber:forKey:completion:](self->_extension, "setFeatureSettingNumber:forKey:completion:", v8, v9, v10);
  else
    v10[2](v10, 0, v12);

}

- (void)remote_removeFeatureSettingValueForKey:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  char v8;
  id v9;
  id v10;

  v6 = a3;
  v10 = 0;
  v7 = (void (**)(id, _QWORD, id))a4;
  v8 = -[HDFeatureAvailabilityStoreServer _hasWriteEntitlementWithError:]((uint64_t)self, &v10);
  v9 = v10;
  if ((v8 & 1) != 0)
    -[HDFeatureAvailabilityExtension removeFeatureSettingValueForKey:completion:](self->_extension, "removeFeatureSettingValueForKey:completion:", v6, v7);
  else
    v7[2](v7, 0, v9);

}

- (void)remote_resetOnboardingWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  char v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = (void (**)(id, _QWORD, id))a3;
  v5 = -[HDFeatureAvailabilityStoreServer _hasWriteEntitlementWithError:]((uint64_t)self, &v7);
  v6 = v7;
  if ((v5 & 1) != 0)
    -[HDFeatureAvailabilityExtension resetOnboardingWithCompletion:](self->_extension, "resetOnboardingWithCompletion:", v4);
  else
    v4[2](v4, 0, v6);

}

- (void)remote_startObservingChangesWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  int v6;
  HDFeatureAvailabilityStoreServer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering for extension changes", (uint8_t *)&v6, 0xCu);
  }

  -[HDFeatureAvailabilityExtension registerObserver:queue:](self->_extension, "registerObserver:queue:", self, self->_queue);
  v4[2](v4, 1, 0);

}

- (void)remote_stopObservingChanges
{
  NSObject *v3;
  int v4;
  HDFeatureAvailabilityStoreServer *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unregistering for extension changes", (uint8_t *)&v4, 0xCu);
  }

  -[HDFeatureAvailabilityExtension unregisterObserver:](self->_extension, "unregisterObserver:", self);
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  HDFeatureAvailabilityStoreServer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying client of onboarding completion update", (uint8_t *)&v6, 0xCu);
  }

  -[HDFeatureAvailabilityStoreServer _clientRemoteObjectProxy](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "client_featureAvailabilityExtensionDidUpdateOnboardingCompletion");

}

- (id)_clientRemoteObjectProxy
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(a1, "client");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "connection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "remoteObjectProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)featureAvailabilityProvidingDidUpdatePairedDeviceCapability:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  HDFeatureAvailabilityStoreServer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying client of paired device capability update", (uint8_t *)&v6, 0xCu);
  }

  -[HDFeatureAvailabilityStoreServer _clientRemoteObjectProxy](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "client_featureAvailabilityExtensionDidUpdatePairedDeviceCapability");

}

- (void)featureAvailabilityProvidingDidUpdateSettings:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  HDFeatureAvailabilityStoreServer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying client of settings update", (uint8_t *)&v6, 0xCu);
  }

  -[HDFeatureAvailabilityStoreServer _clientRemoteObjectProxy](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "client_featureAvailabilityProvidingDidUpdateSettings");

}

- (void)featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  HDFeatureAvailabilityStoreServer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying client of onboarding completion data becoming available", (uint8_t *)&v6, 0xCu);
  }

  -[HDFeatureAvailabilityStoreServer _clientRemoteObjectProxy](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "client_featureAvailabilityExtensionDidUpdateOnboardingCompletion");

}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  OS_dispatch_queue *v27;
  OS_dispatch_queue *queue;
  void *v29;
  void *v30;
  HDFeatureAvailabilityStoreServer *v31;
  NSObject *v32;
  void *v33;
  OS_dispatch_queue *v34;
  OS_dispatch_queue *v35;
  uint64_t v36;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  HDFeatureAvailabilityStoreServer *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v39 = v12;
  objc_msgSend(v12, "profile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "profileExtensionsConformingToProtocol:", &unk_1EF1B52D8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v42;
LABEL_3:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v19)
        objc_enumerationMutation(v16);
      v21 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v20);
      objc_msgSend(v11, "featureIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "featureAvailabilityExtensionForFeatureIdentifier:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        break;
      if (v18 == ++v20)
      {
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
        if (v18)
          goto LABEL_3;
        goto LABEL_9;
      }
    }

    v30 = v39;
    v29 = v40;
    v31 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:]([HDFeatureAvailabilityStoreServer alloc], "initWithUUID:configuration:client:delegate:", v40, v11, v39, v13);
    _HKInitializeLogging();
    HKLogInfrastructure();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "featureIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v46 = v31;
      v47 = 2114;
      v48 = v23;
      v49 = 2114;
      v50 = v33;
      _os_log_impl(&dword_1B7802000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Using profile extension %{public}@ for feature %{public}@", buf, 0x20u);

    }
    v34 = v23;
    v35 = v34;
    if (v31)
    {
      objc_storeStrong((id *)&v31->_extension, v23);
      HKCreateSerialDispatchQueue();
      v36 = objc_claimAutoreleasedReturnValue();
      queue = v31->_queue;
      v31->_queue = (OS_dispatch_queue *)v36;
      v26 = v35;
      goto LABEL_19;
    }
    v26 = v34;
  }
  else
  {
LABEL_9:

    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = objc_opt_class();
    objc_msgSend(v11, "featureIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v25, a2, CFSTR("No profile extension providing feature availability for %@"), v26);
    v27 = (OS_dispatch_queue *)(id)objc_claimAutoreleasedReturnValue();
    queue = v27;
    if (v27)
    {
      v30 = v39;
      v29 = v40;
      if (a7)
      {
        v31 = 0;
        *a7 = objc_retainAutorelease(v27);
      }
      else
      {
        _HKLogDroppedError();
        v31 = 0;
      }
      v35 = queue;
    }
    else
    {
      v31 = 0;
      v35 = 0;
      v30 = v39;
      v29 = v40;
    }
LABEL_19:

  }
  return v31;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v21;
  void *v22;
  id v23;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "entitlements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasEntitlement:", *MEMORY[0x1E0CB4F08]);

  if ((v10 & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v8, "entitlements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CB4F10];
  objc_msgSend(v7, "featureIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = objc_msgSend(v11, "arrayEntitlement:containsString:", v12, v13);

  if ((v12 & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v8, "entitlements");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hasEntitlement:", *MEMORY[0x1E0CB4EF8]);

  if ((v15 & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v8, "entitlements");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0CB4F00];
  objc_msgSend(v7, "featureIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = objc_msgSend(v16, "arrayEntitlement:containsString:", v17, v18);

  if ((v17 & 1) != 0)
  {
LABEL_5:
    v19 = 1;
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v7, "featureIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hk_error:format:", 4, CFSTR("Unauthorized access to availability of feature %@"), v22);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v23);
      else
        _HKLogDroppedError();
    }

    v19 = 0;
  }

  return v19;
}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6708], "taskIdentifier");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end
