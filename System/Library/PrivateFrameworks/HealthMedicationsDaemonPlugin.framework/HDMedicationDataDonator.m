@implementation HDMedicationDataDonator

- (HDMedicationDataDonator)initWithProfile:(id)a3
{
  id v5;
  HDMedicationDataDonator *v6;
  HDMedicationDataDonator *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDMedicationDataDonator;
  v6 = -[HDMedicationDataDonator init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profileExtension, a3);
    v7->_donationRequiredOnNextUnlock = 0;
    -[HDHealthMedicationsProfileExtension profile](v7->_profileExtension, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerProfileReadyObserver:queue:", v7, 0);

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (BOOL)getDonationRequiredOnNextUnlock
{
  HDMedicationDataDonator *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_donationRequiredOnNextUnlock;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setDonationRequiredOnNextUnlock:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_donationRequiredOnNextUnlock = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)_performDataDonationForProfile:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  HDHealthMedicationsProfileExtension *profileExtension;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  if ((AFDeviceSupportsSiriUOD() & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "shouldOverrideSiriUOD"),
        v8,
        (v9 & 1) != 0))
  {
    v19 = 0;
    -[HDMedicationDataDonator _medicationUserDomainConceptsForProfile:error:](self, "_medicationUserDomainConceptsForProfile:error:", v6, &v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v19;
    if (v10)
    {
      profileExtension = self->_profileExtension;
      v18 = v11;
      -[HDHealthMedicationsProfileExtension createMedicationsDonatorWithError:](profileExtension, "createMedicationsDonatorWithError:", &v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v18;

      if (v13)
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __69__HDMedicationDataDonator__performDataDonationForProfile_completion___block_invoke;
        v15[3] = &unk_1E6E015F0;
        v15[4] = self;
        v17 = v7;
        v16 = v10;
        objc_msgSend(v13, "donateWithOptions:usingDataStream:", 0, v15);

      }
      else
      {
        (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v14);
      }

    }
    else
    {
      (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v11);
      v14 = v11;
    }

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
  }

}

void __69__HDMedicationDataDonator__performDataDonationForProfile_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _HKInitializeLogging();
  HKLogMedication();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1B815E000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Preparing to donate all active medications in the user's list.", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_donateActiveConceptsForStream:activeMedications:error:completion:", v5, *(_QWORD *)(a1 + 40), v6, *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __69__HDMedicationDataDonator__performDataDonationForProfile_completion___block_invoke_cold_1(a1, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)_donateActiveConceptsForStream:(id)a3 activeMedications:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  BOOL v21;
  HDMedicationDataDonator *v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v25 = a6;
  v13 = objc_alloc_init(MEMORY[0x1E0D42BF0]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    while (2)
    {
      v18 = 0;
      v19 = v12;
      do
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        v20 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v18);
        v26 = v19;
        v21 = -[HDMedicationDataDonator _registerItemForDonationForConcept:builder:fullStream:error:](self, "_registerItemForDonationForConcept:builder:fullStream:error:", v20, v13, v10, &v26, v25);
        v12 = v26;

        if (!v21)
        {
          _HKInitializeLogging();
          HKLogMedication();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[HDMedicationDataDonator _donateActiveConceptsForStream:activeMedications:error:completion:].cold.1((uint64_t)self);

          v23 = v25;
          (*((void (**)(id, _QWORD, id))v25 + 2))(v25, 0, v12);

          goto LABEL_13;
        }
        ++v18;
        v19 = v12;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v16)
        continue;
      break;
    }
  }

  v22 = self;
  v23 = v25;
  -[HDMedicationDataDonator _finishStreamingForStream:completion:](v22, "_finishStreamingForStream:completion:", v10, v25);
LABEL_13:

}

- (BOOL)_registerItemForDonationForConcept:(id)a3 builder:(id)a4 fullStream:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  BOOL v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc(MEMORY[0x1E0CB68B8]);
  objc_msgSend(v10, "semanticIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithSemanticIdentifierString:", v15);

  objc_msgSend(v10, "freeTextMedicationName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v10, "freeTextMedicationName");
  else
    -[HDMedicationDataDonator _findPreferredNameForConcept:](self, "_findPreferredNameForConcept:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "underlyingIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v11, "setItemType:itemId:error:", 19, v19, a6);

  if (-[HDMedicationDataDonator _checkBuilderAndCancelIfErrorForBuilder:fullStream:](self, "_checkBuilderAndCancelIfErrorForBuilder:fullStream:", v11, v12)&& (v21 = (id)objc_msgSend(v11, "addFieldWithType:value:error:", 850, v18, a6), -[HDMedicationDataDonator _checkBuilderAndCancelIfErrorForBuilder:fullStream:](self, "_checkBuilderAndCancelIfErrorForBuilder:fullStream:", v11, v12))&& (objc_msgSend(v10, "userSpecifiedName"), v22 = (void *)objc_claimAutoreleasedReturnValue(), v23 = objc_unsafeClaimAutoreleasedReturnValue((id)objc_msgSend(v11,
                                                            "addFieldWithType:value:error:",
                                                            851,
                                                            v22,
                                                            a6)),
        v22,
        -[HDMedicationDataDonator _checkBuilderAndCancelIfErrorForBuilder:fullStream:](self, "_checkBuilderAndCancelIfErrorForBuilder:fullStream:", v11, v12)))
  {
    objc_msgSend(v11, "buildItemWithError:", a6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = -[HDMedicationDataDonator _registerItemForStream:item:error:](self, "_registerItemForStream:item:error:", v12, v24, a6);
    }
    else
    {
      objc_msgSend(v12, "cancel");
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (BOOL)_registerItemForStream:(id)a3 item:(id)a4 error:(id *)a5
{
  char v7;
  NSObject *v8;

  v7 = objc_msgSend(a3, "registerItem:error:", a4, a5);
  if ((v7 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[HDMedicationDataDonator _registerItemForStream:item:error:].cold.1((uint64_t)self, a5, v8);

  }
  return v7;
}

- (void)_finishStreamingForStream:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__HDMedicationDataDonator__finishStreamingForStream_completion___block_invoke;
  v8[3] = &unk_1E6E01618;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "finish:", v8);

}

void __64__HDMedicationDataDonator__finishStreamingForStream_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  HKLogMedication();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__HDMedicationDataDonator__finishStreamingForStream_completion___block_invoke_cold_1(a1);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1B815E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finished data donation.", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_medicationUserDomainConceptsForProfile:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB6D48];
  v6 = a3;
  objc_msgSend(v5, "medicationUserDomainConceptTypeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifier();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D29840];
  v20[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateMatchingAllPredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v6, "userDomainConceptManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __73__HDMedicationDataDonator__medicationUserDomainConceptsForProfile_error___block_invoke;
  v18[3] = &unk_1E6E00218;
  v19 = v12;
  v14 = v12;
  LODWORD(a4) = objc_msgSend(v13, "enumerateUserDomainConceptsWithPredicate:error:enumerationHandler:", v11, a4, v18);

  if ((_DWORD)a4)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  return v16;
}

uint64_t __73__HDMedicationDataDonator__medicationUserDomainConceptsForProfile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

- (BOOL)_checkBuilderAndCancelIfErrorForBuilder:(id)a3 fullStream:(id)a4
{
  if (!a3)
    objc_msgSend(a4, "cancel");
  return a3 != 0;
}

- (id)_findPreferredNameForConcept:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "displayNameComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "medicationDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)profileDidBecomeReady:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HDHealthMedicationsProfileExtension profile](self->_profileExtension, "profile", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addProtectedDataObserver:", self);

  -[HDHealthMedicationsProfileExtension profile](self->_profileExtension, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userDomainConceptManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addUserDomainConceptObserver:queue:", self, 0);

  -[HDMedicationDataDonator _donateWithReason:](self, "_donateWithReason:", CFSTR("Profile did become ready. Triggering data donation."));
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  if (-[HDMedicationDataDonator donationRequiredOnNextUnlock](self, "donationRequiredOnNextUnlock", a3))
  {
    if (v4)
      -[HDMedicationDataDonator _donateWithReason:](self, "_donateWithReason:", CFSTR("Did observe protected database becoming ready and donation needed. Triggering data donation."));
  }
}

- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4
{
  -[HDMedicationDataDonator _donateIfUDCListChangedForUDCArray:manager:](self, "_donateIfUDCListChangedForUDCArray:manager:", a4, a3);
}

- (void)userDomainConceptManager:(id)a3 didUpdateUserDomainConcepts:(id)a4
{
  -[HDMedicationDataDonator _donateIfUDCListChangedForUDCArray:manager:](self, "_donateIfUDCListChangedForUDCArray:manager:", a4, a3);
}

- (void)didRecieveThirdPartyMigrationNotification
{
  -[HDMedicationDataDonator _donateWithReason:](self, "_donateWithReason:", CFSTR("Recieved third party db migration notification. Triggering data donation."));
}

- (void)_donateIfUDCListChangedForUDCArray:(id)a3 manager:(id)a4
{
  if (-[HDMedicationDataDonator _medicationUDCHasChangedForUDCArray:](self, "_medicationUDCHasChangedForUDCArray:", a3, a4))
  {
    -[HDMedicationDataDonator _donateWithReason:](self, "_donateWithReason:", CFSTR("Did observe change of user domain concept(s) list. Triggering data donation."));
  }
}

- (BOOL)_medicationUDCHasChangedForUDCArray:(id)a3
{
  return objc_msgSend(a3, "hk_containsObjectPassingTest:", &__block_literal_global_15);
}

uint64_t __63__HDMedicationDataDonator__medicationUDCHasChangedForUDCArray___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_donateWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  HDMedicationDataDonator *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  HKLogMedication();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1B815E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] %@", buf, 0x16u);
  }

  -[HDMedicationDataDonator setDonationRequiredOnNextUnlock:](self, "setDonationRequiredOnNextUnlock:", 0);
  -[HDHealthMedicationsProfileExtension profile](self->_profileExtension, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__HDMedicationDataDonator__donateWithReason___block_invoke;
  v7[3] = &unk_1E6E011F0;
  v7[4] = self;
  -[HDMedicationDataDonator _performDataDonationForProfile:completion:](self, "_performDataDonationForProfile:completion:", v6, v7);

}

void __45__HDMedicationDataDonator__donateWithReason___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __45__HDMedicationDataDonator__donateWithReason___block_invoke_cold_1(a1);

    if (objc_msgSend(v5, "hk_isDatabaseAccessibilityError"))
      objc_msgSend(*(id *)(a1 + 32), "setDonationRequiredOnNextUnlock:", 1);
  }

}

- (BOOL)donationRequiredOnNextUnlock
{
  return self->_donationRequiredOnNextUnlock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileExtension, 0);
}

void __69__HDMedicationDataDonator__performDataDonationForProfile_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1B815E000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] [Error] Stream was nil, unable to donate medications.", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_donateActiveConceptsForStream:(uint64_t)a1 activeMedications:error:completion:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v1, v2, "[%{public}@] [Error] Error while registering item for donation, unable to donate medication: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_registerItemForStream:(uint64_t)a1 item:(_QWORD *)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_0(&dword_1B815E000, (uint64_t)a2, a3, "[%{public}@] [Error] Failed to register item during data donation %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

void __64__HDMedicationDataDonator__finishStreamingForStream_completion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v1, v2, "[%{public}@] [Error] Failed to finish stream during data donation %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __45__HDMedicationDataDonator__donateWithReason___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v1, v2, "[%{public}@] [Error] Failed to donate items due to error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

@end
