@implementation BMLibraryStreamsPruner

+ (void)pruneLearnFromThisAppDisabled:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      _os_log_impl(&dword_18D810000, v5, OS_LOG_TYPE_DEFAULT, "BMLibraryStreamsPruner running pruneLearnFromThisAppDisabled: %@", buf, 0xCu);
    }

    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __56__BMLibraryStreamsPruner_pruneLearnFromThisAppDisabled___block_invoke;
    v13 = &unk_1E2648998;
    v15 = a1;
    v6 = v4;
    v14 = v6;
    v7 = _Block_copy(&v10);
    getBMAppIntentIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v8, CFSTR("learn-from-this-app"), v7, v10, v11, v12, v13);

    getBMIntelligenceEngineInteractionDonationIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v9, CFSTR("learn-from-this-app"), v7);

    if (objc_msgSend(v6, "containsObject:", CFSTR("com.apple.MobileSMS")))
      objc_msgSend(a1, "pruneLearnFromThisAppDisabledForMessages");

  }
}

+ (void)_pruneStreamWithIdentifier:(id)a3 policy:(id)a4 shouldPruneBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  BiomeLibraryNodeBridge();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v11, "streamWithIdentifier:error:", v8, &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v17;

  if (v13)
  {
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v19 = v16;
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = v13;
      _os_log_error_impl(&dword_18D810000, v14, OS_LOG_TYPE_ERROR, "%@ - _pruneStreamWithIdentifier could not find stream for identifier: %@, err: %@", buf, 0x20u);

    }
  }
  else
  {
    objc_msgSend(a1, "_pruneStream:policy:shouldPruneBlock:", v12, v9, v10);
  }

}

+ (void)_pruneStream:(id)a3 policy:(id)a4 shouldPruneBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  __biome_log_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v11;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_18D810000, v10, OS_LOG_TYPE_DEFAULT, "BMLibraryStreamsPruner pruning stream: %@ with policy: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend(v7, "pruner");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deleteWithPolicy:eventsPassingTest:", v8, v9);

}

+ (void)pruneWithInstalledApplications:(id)a3 installedAppExtensions:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD aBlock[4];
  id v23;
  id v24;
  id v25;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D810000, v8, OS_LOG_TYPE_DEFAULT, "BMLibraryStreamsPruner running pruneWithInstalledApplications:installedAppExtensions", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__BMLibraryStreamsPruner_pruneWithInstalledApplications_installedAppExtensions___block_invoke;
  aBlock[3] = &unk_1E2648970;
  v24 = v7;
  v25 = a1;
  v23 = v6;
  v9 = v7;
  v10 = v6;
  v11 = _Block_copy(aBlock);
  getBMAppInFocusIdentifier();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v12, CFSTR("app-uninstall"), v11);

  getBMAppIntentIdentifier();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v13, CFSTR("app-uninstall"), v11);

  getBMSiriRemembersInteractionHistoryIdentifier();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v14, CFSTR("app-uninstall"), v11);

  getBMSiriRemembersMessageHistoryIdentifier();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v15, CFSTR("app-uninstall"), v11);

  getBMSiriRemembersCallHistoryIdentifier();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v16, CFSTR("app-uninstall"), v11);

  getBMSiriRemembersAudioHistoryIdentifier();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v17, CFSTR("app-uninstall"), v11);

  getBMFrontBoardDisplayElementIdentifier();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v18, CFSTR("app-uninstall"), v11);

  getBMScreenTimeAppUsageIdentifier();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v19, CFSTR("app-uninstall"), v11);

  getBMIntelligenceEngineInteractionDonationIdentifier();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v20, CFSTR("app-uninstall"), v11);

  getBMAppLocationActivityIdentifier();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v21, CFSTR("app-uninstall"), v11);

}

uint64_t __80__BMLibraryStreamsPruner_pruneWithInstalledApplications_installedAppExtensions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 48), "shouldPruneStoreEvent:forInstalledApplications:installedAppExtensions:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (void)pruneWithUninstalledBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v4;
    _os_log_impl(&dword_18D810000, v5, OS_LOG_TYPE_DEFAULT, "BMLibraryStreamsPruner running pruneWithUninstalledBundleIdentifier:%@", buf, 0xCu);
  }

  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __63__BMLibraryStreamsPruner_pruneWithUninstalledBundleIdentifier___block_invoke;
  v21 = &unk_1E2648998;
  v22 = v4;
  v23 = a1;
  v6 = v4;
  v7 = _Block_copy(&v18);
  getBMAppInFocusIdentifier();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v8, CFSTR("app-uninstall"), v7, v18, v19, v20, v21);

  getBMAppIntentIdentifier();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v9, CFSTR("app-uninstall"), v7);

  getBMSiriRemembersInteractionHistoryIdentifier();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v10, CFSTR("app-uninstall"), v7);

  getBMSiriRemembersMessageHistoryIdentifier();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v11, CFSTR("app-uninstall"), v7);

  getBMSiriRemembersCallHistoryIdentifier();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v12, CFSTR("app-uninstall"), v7);

  getBMSiriRemembersAudioHistoryIdentifier();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v13, CFSTR("app-uninstall"), v7);

  getBMFrontBoardDisplayElementIdentifier();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v14, CFSTR("app-uninstall"), v7);

  getBMScreenTimeAppUsageIdentifier();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v15, CFSTR("app-uninstall"), v7);

  getBMIntelligenceEngineInteractionDonationIdentifier();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v16, CFSTR("app-uninstall"), v7);

  getBMAppLocationActivityIdentifier();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v17, CFSTR("app-uninstall"), v7);

}

uint64_t __63__BMLibraryStreamsPruner_pruneWithUninstalledBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "shouldPruneStoreEvent:forUninstalledBundleId:", a2, *(_QWORD *)(a1 + 32));
}

+ (void)pruneWithDeletedIntentIdentifiers:(id)a3 bundleId:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD aBlock[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v6;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_18D810000, v8, OS_LOG_TYPE_DEFAULT, "BMLibraryStreamsPruner running pruneWithDeletedIntentIdentifiers:%@ bundleId:%@", buf, 0x16u);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__BMLibraryStreamsPruner_pruneWithDeletedIntentIdentifiers_bundleId___block_invoke;
  aBlock[3] = &unk_1E2648970;
  v19 = v7;
  v20 = a1;
  v18 = v6;
  v9 = v7;
  v10 = v6;
  v11 = _Block_copy(aBlock);
  getBMAppIntentIdentifier();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v12, CFSTR("intent-deletion"), v11);

  getBMSiriRemembersInteractionHistoryIdentifier();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v13, CFSTR("intent-deletion"), v11);

  getBMSiriRemembersMessageHistoryIdentifier();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v14, CFSTR("intent-deletion"), v11);

  getBMSiriRemembersCallHistoryIdentifier();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v15, CFSTR("intent-deletion"), v11);

  getBMSiriRemembersAudioHistoryIdentifier();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v16, CFSTR("intent-deletion"), v11);

}

uint64_t __69__BMLibraryStreamsPruner_pruneWithDeletedIntentIdentifiers_bundleId___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 48), "shouldPruneStoreEvent:forDeletedIntentIdentifiers:bundleId:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (void)pruneWithDeletedIntentGroupIdentifiers:(id)a3 bundleId:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD aBlock[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v6;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_18D810000, v8, OS_LOG_TYPE_DEFAULT, "BMLibraryStreamsPruner running pruneWithDeletedIntentGroupIdentifiers:%@ bundleId:%@", buf, 0x16u);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__BMLibraryStreamsPruner_pruneWithDeletedIntentGroupIdentifiers_bundleId___block_invoke;
  aBlock[3] = &unk_1E2648970;
  v19 = v7;
  v20 = a1;
  v18 = v6;
  v9 = v7;
  v10 = v6;
  v11 = _Block_copy(aBlock);
  getBMAppIntentIdentifier();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v12, CFSTR("intent-deletion"), v11);

  getBMSiriRemembersInteractionHistoryIdentifier();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v13, CFSTR("intent-deletion"), v11);

  getBMSiriRemembersMessageHistoryIdentifier();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v14, CFSTR("intent-deletion"), v11);

  getBMSiriRemembersCallHistoryIdentifier();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v15, CFSTR("intent-deletion"), v11);

  getBMSiriRemembersAudioHistoryIdentifier();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v16, CFSTR("intent-deletion"), v11);

}

uint64_t __74__BMLibraryStreamsPruner_pruneWithDeletedIntentGroupIdentifiers_bundleId___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 48), "shouldPruneStoreEvent:forDeletedGroupIdentifiers:bundleId:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (void)pruneSiriAndDictationHistory
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD aBlock[5];
  uint8_t buf[16];

  __biome_log_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D810000, v3, OS_LOG_TYPE_DEFAULT, "BMLibraryStreamsPruner running pruneSiriAndDictationHistory", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__BMLibraryStreamsPruner_pruneSiriAndDictationHistory__block_invoke;
  aBlock[3] = &__block_descriptor_40_e26_B24__0__BMStoreEvent_8_B16l;
  aBlock[4] = a1;
  v4 = _Block_copy(aBlock);
  getBMAppIntentIdentifier();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v5, CFSTR("delete-siri-dictation-history"), v4);

  getBMSiriRemembersInteractionHistoryIdentifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v6, CFSTR("delete-siri-dictation-history"), &__block_literal_global_13);

  getBMSiriRemembersMessageHistoryIdentifier();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v7, CFSTR("delete-siri-dictation-history"), &__block_literal_global_13);

  getBMSiriRemembersCallHistoryIdentifier();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v8, CFSTR("delete-siri-dictation-history"), &__block_literal_global_13);

  getBMSiriRemembersAssistantSuggestionsIdentifier();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v9, CFSTR("delete-siri-dictation-history"), &__block_literal_global_13);

  getBMSiriRemembersAudioHistoryIdentifier();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v10, CFSTR("delete-siri-dictation-history"), &__block_literal_global_13);

  getBMSiriAppSelectionMusicIdentifier();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v11, CFSTR("delete-siri-dictation-history"), &__block_literal_global_13);

  getBMIntelligenceEngineInteractionDonationIdentifier();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v12, CFSTR("delete-siri-dictation-history"), &__block_literal_global_13);

  getBMSiriExecutionIdentifier();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v13, CFSTR("delete-siri-dictation-history"), &__block_literal_global_13);

  getBMSiriFeedbackLearningUserInteractionsIdentifier();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v14, CFSTR("delete-siri-dictation-history"), &__block_literal_global_13);

  getBMSiriPostSiriEngagementIdentifier();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v15, CFSTR("delete-siri-dictation-history"), &__block_literal_global_13);

  getBMSiriPrivateLearningSELFEventIdentifier();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v16, CFSTR("delete-siri-dictation-history"), &__block_literal_global_13);

  getBMSiriRemembersIntentIdentifier();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v17, CFSTR("delete-siri-dictation-history"), &__block_literal_global_13);

  getBMSiriSELFProcessedEventIdentifier();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v18, CFSTR("delete-siri-dictation-history"), &__block_literal_global_13);

  getBMDictationUserEditIdentifier();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v19, CFSTR("delete-siri-dictation-history"), &__block_literal_global_13);

  getBMProactiveHarvestingSiriQueryIdentifier();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v20, CFSTR("delete-siri-dictation-history"), &__block_literal_global_13);

  getBMSiriDictationIdentifier();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v21, CFSTR("delete-siri-dictation-history"), &__block_literal_global_13);

  getBMSiriRemembersExplicitRequestsIdentifier();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v22, CFSTR("delete-siri-dictation-history"), &__block_literal_global_13);

  getBMSiriServiceIdentifier();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v23, CFSTR("delete-siri-dictation-history"), &__block_literal_global_13);

}

uint64_t __54__BMLibraryStreamsPruner_pruneSiriAndDictationHistory__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldPruneStoreEventForSiriAndDictationHistoryDeletion:", a2);
}

uint64_t __54__BMLibraryStreamsPruner_pruneSiriAndDictationHistory__block_invoke_2()
{
  return 1;
}

+ (void)pruneSiriDisabled
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD aBlock[5];
  uint8_t buf[16];

  __biome_log_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D810000, v3, OS_LOG_TYPE_DEFAULT, "BMLibraryStreamsPruner running pruneSiriDisabled", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__BMLibraryStreamsPruner_pruneSiriDisabled__block_invoke;
  aBlock[3] = &__block_descriptor_40_e26_B24__0__BMStoreEvent_8_B16l;
  aBlock[4] = a1;
  v4 = _Block_copy(aBlock);
  getBMAppIntentIdentifier();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v5, CFSTR("disable-siri"), v4);

  getBMSiriRemembersInteractionHistoryIdentifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v6, CFSTR("disable-siri"), &__block_literal_global_6_0);

  getBMSiriRemembersMessageHistoryIdentifier();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v7, CFSTR("disable-siri"), &__block_literal_global_6_0);

  getBMSiriRemembersCallHistoryIdentifier();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v8, CFSTR("disable-siri"), &__block_literal_global_6_0);

  getBMSiriRemembersAssistantSuggestionsIdentifier();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v9, CFSTR("disable-siri"), &__block_literal_global_6_0);

  getBMSiriRemembersAudioHistoryIdentifier();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v10, CFSTR("disable-siri"), &__block_literal_global_6_0);

  getBMSiriAppSelectionMusicIdentifier();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v11, CFSTR("disable-siri"), &__block_literal_global_6_0);

  getBMIntelligenceEngineInteractionDonationIdentifier();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v12, CFSTR("disable-siri"), &__block_literal_global_6_0);

  getBMSiriExecutionIdentifier();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v13, CFSTR("disable-siri"), &__block_literal_global_6_0);

  getBMSiriFeedbackLearningUserInteractionsIdentifier();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v14, CFSTR("disable-siri"), &__block_literal_global_6_0);

  getBMSiriPostSiriEngagementIdentifier();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v15, CFSTR("disable-siri"), &__block_literal_global_6_0);

  getBMSiriPrivateLearningSELFEventIdentifier();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v16, CFSTR("disable-siri"), &__block_literal_global_6_0);

  getBMSiriRemembersIntentIdentifier();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v17, CFSTR("disable-siri"), &__block_literal_global_6_0);

  getBMSiriSELFProcessedEventIdentifier();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v18, CFSTR("disable-siri"), &__block_literal_global_6_0);

  getBMDictationUserEditIdentifier();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v19, CFSTR("disable-siri"), &__block_literal_global_6_0);

  getBMProactiveHarvestingSiriQueryIdentifier();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v20, CFSTR("disable-siri"), &__block_literal_global_6_0);

  getBMSiriDictationIdentifier();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v21, CFSTR("disable-siri"), &__block_literal_global_6_0);

  getBMSiriRemembersExplicitRequestsIdentifier();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v22, CFSTR("disable-siri"), &__block_literal_global_6_0);

  getBMSiriServiceIdentifier();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v23, CFSTR("disable-siri"), &__block_literal_global_6_0);

}

uint64_t __43__BMLibraryStreamsPruner_pruneSiriDisabled__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldPruneStoreEventForSiriDisabled:", a2);
}

uint64_t __43__BMLibraryStreamsPruner_pruneSiriDisabled__block_invoke_2()
{
  return 1;
}

+ (void)pruneForResetPrivacyAndLocationWarnings
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getBMLocationSemanticIdentifier(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BMLibraryStreamsPruner.m"), 32, CFSTR("%s"), OUTLINED_FUNCTION_0_11());

  __break(1u);
}

uint64_t __65__BMLibraryStreamsPruner_pruneForResetPrivacyAndLocationWarnings__block_invoke()
{
  return 1;
}

uint64_t __56__BMLibraryStreamsPruner_pruneLearnFromThisAppDisabled___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "shouldPruneStoreEvent:forLearnFromThisAppDisabledBundleIdentifiers:", a2, *(_QWORD *)(a1 + 32));
}

+ (void)pruneLearnFromThisAppDisabledForMessages
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getBMAutonamingMessagesMessageIdsIdentifier(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BMLibraryStreamsPruner.m"), 45, CFSTR("%s"), OUTLINED_FUNCTION_0_11());

  __break(1u);
}

uint64_t __66__BMLibraryStreamsPruner_pruneLearnFromThisAppDisabledForMessages__block_invoke()
{
  return 1;
}

+ (void)pruneForResetKeyboardDictionary
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getBMKeyboardTokenFrequencyIdentifier(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BMLibraryStreamsPruner.m"), 36, CFSTR("%s"), OUTLINED_FUNCTION_0_11());

  __break(1u);
}

uint64_t __57__BMLibraryStreamsPruner_pruneForResetKeyboardDictionary__block_invoke()
{
  return 1;
}

+ (void)pruneWithDeletedContactIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl(&dword_18D810000, v5, OS_LOG_TYPE_DEFAULT, "BMLibraryStreamsPruner running pruneWithDeletedContactIdentifiers: %@", buf, 0xCu);
  }

  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __61__BMLibraryStreamsPruner_pruneWithDeletedContactIdentifiers___block_invoke;
  v12 = &unk_1E2648998;
  v13 = v4;
  v14 = a1;
  v6 = v4;
  v7 = _Block_copy(&v9);
  getBMIntelligenceEngineInteractionDonationIdentifier();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pruneStreamWithIdentifier:policy:shouldPruneBlock:", v8, CFSTR("contact-deleted"), v7, v9, v10, v11, v12);

}

uint64_t __61__BMLibraryStreamsPruner_pruneWithDeletedContactIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "shouldPruneStoreEvent:forDeletedContactIdentifiers:", a2, *(_QWORD *)(a1 + 32));
}

+ (BOOL)shouldPruneStoreEvent:(id)a3 forInstalledApplications:(id)a4 installedAppExtensions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  int v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "eventBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(a1, "bundleIdentifiersFromStoreEvent:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      v13 = objc_msgSend(v9, "intersectsSet:", v12);
      v14 = (v13 | objc_msgSend(v10, "intersectsSet:", v12)) ^ 1;
    }
    else
    {
      LOBYTE(v14) = 0;
    }

  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

+ (BOOL)shouldPruneStoreEvent:(id)a3 forUninstalledBundleId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "bundleIdentifiersFromStoreEvent:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
      v10 = objc_msgSend(v9, "containsObject:", v7);
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)shouldPruneStoreEvent:(id)a3 forDeletedIntentIdentifiers:(id)a4 bundleId:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  NSObject *v16;

  v8 = a3;
  v9 = a4;
  v10 = (unint64_t)a5;
  objc_msgSend(v8, "eventBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(a1, "intentIdentifierFromStoreEvent:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "bundleIdentifiersFromStoreEvent:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (!(v10 | v13))
    {
LABEL_3:
      v15 = 1;
LABEL_13:

      goto LABEL_14;
    }
    if (v12)
    {
      if (objc_msgSend((id)v13, "containsObject:", v10)
        && (objc_msgSend(v9, "containsObject:", v12) & 1) != 0)
      {
        goto LABEL_3;
      }
    }
    else
    {
      __biome_log_for_category();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[BMLibraryStreamsPruner shouldPruneStoreEvent:forDeletedIntentIdentifiers:bundleId:].cold.1();

      objc_msgSend(v14, "containsObject:", v10);
    }
    v15 = 0;
    goto LABEL_13;
  }
  v15 = 0;
LABEL_14:

  return v15;
}

+ (BOOL)shouldPruneStoreEvent:(id)a3 forDeletedGroupIdentifiers:(id)a4 bundleId:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "eventBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(a1, "intentGroupIdentifierFromStoreEvent:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = objc_msgSend(v8, "containsObject:", v10);
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)shouldPruneStoreEventForSiriAndDictationHistoryDeletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_msgSend(v4, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "isDonatedBySiriFromStoreEvent:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = objc_msgSend(v6, "BOOLValue");
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)shouldPruneStoreEventForSiriDisabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_msgSend(v4, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "isDonatedBySiriFromStoreEvent:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = objc_msgSend(v6, "BOOLValue");
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)shouldPruneStoreEvent:(id)a3 forLearnFromThisAppDisabledBundleIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "bundleIdentifiersFromStoreEvent:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = objc_msgSend(v7, "intersectsSet:", v9);
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)shouldPruneStoreEvent:(id)a3 forDeletedContactIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "contactIdentifiersFromStoreEvent:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = objc_msgSend(v7, "intersectsSet:", v9);
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)bundleIdentifiersFromStoreEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  id v28;
  void *v29;
  NSObject *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD aBlock[4];
  id v42;
  _QWORD v43[5];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__BMLibraryStreamsPruner_bundleIdentifiersFromStoreEvent___block_invoke;
    aBlock[3] = &unk_1E2648A60;
    v7 = v5;
    v42 = v7;
    v8 = _Block_copy(aBlock);
    v44 = 0;
    v45 = &v44;
    v46 = 0x2050000000;
    v9 = (void *)getBMAppInFocusClass_softClass;
    v47 = getBMAppInFocusClass_softClass;
    if (!getBMAppInFocusClass_softClass)
    {
      v43[0] = v6;
      v43[1] = 3221225472;
      v43[2] = __getBMAppInFocusClass_block_invoke;
      v43[3] = &unk_1E2647EA8;
      v43[4] = &v44;
      __getBMAppInFocusClass_block_invoke((uint64_t)v43);
      v9 = (void *)v45[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v44, 8);
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v4;
      if (objc_msgSend(v11, "launchType") == 3)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v12 = (id)objc_claimAutoreleasedReturnValue();

LABEL_41:
        goto LABEL_42;
      }
      objc_msgSend(v11, "bundleID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, void *))v8 + 2))(v8, v13);

      objc_msgSend(v11, "parentBundleID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, void *))v8 + 2))(v8, v14);

      objc_msgSend(v11, "extensionHostID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, void *))v8 + 2))(v8, v15);

    }
    else
    {
      getBMAppIntentClass();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        getBMSiriInteractionHistoryClass();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (getBMSiriMessageHistoryClass(), (objc_opt_isKindOfClass() & 1) != 0)
          || (getBMSiriCallHistoryClass(), (objc_opt_isKindOfClass() & 1) != 0)
          || (getBMSiriAssistantSuggestionsClass(), (objc_opt_isKindOfClass() & 1) != 0)
          || (getBMSiriAudioHistoryClass(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v4, "interaction");
          v11 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "appBundleId");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(void *, void *))v8 + 2))(v8, v16);

          goto LABEL_40;
        }
        getBMFrontBoardDisplayElementClass();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v4, "bundleIdentifier");
          v11 = (id)objc_claimAutoreleasedReturnValue();
          (*((void (**)(void *, id))v8 + 2))(v8, v11);
          goto LABEL_40;
        }
        getBMScreenTimeAppUsageClass();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          getBMIntelligenceEngineInteractionClass();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = v4;
            v37 = 0u;
            v38 = 0u;
            v39 = 0u;
            v40 = 0u;
            objc_msgSend(v11, "candidateInteractions");
            obj = (id)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
            if (v17)
            {
              v18 = *(_QWORD *)v38;
              do
              {
                for (i = 0; i != v17; ++i)
                {
                  if (*(_QWORD *)v38 != v18)
                    objc_enumerationMutation(obj);
                  objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "candidateId");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "bundleId");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  (*((void (**)(void *, void *))v8 + 2))(v8, v21);

                }
                v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
              }
              while (v17);
            }

            v35 = 0u;
            v36 = 0u;
            v33 = 0u;
            v34 = 0u;
            objc_msgSend(v11, "tupleInteraction");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "candidateIds");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v48, 16);
            if (v24)
            {
              v25 = *(_QWORD *)v34;
              do
              {
                for (j = 0; j != v24; ++j)
                {
                  if (*(_QWORD *)v34 != v25)
                    objc_enumerationMutation(v23);
                  objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "bundleId");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  (*((void (**)(void *, void *))v8 + 2))(v8, v27);

                }
                v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v48, 16);
              }
              while (v24);
            }

          }
          else
          {
            getBMAppLocationActivityClass();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              __biome_log_for_category();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
                +[BMLibraryStreamsPruner bundleIdentifiersFromStoreEvent:].cold.1();

              v12 = 0;
              goto LABEL_41;
            }
            v28 = v4;
            objc_msgSend(v28, "bundleID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(void *, void *))v8 + 2))(v8, v29);

            objc_msgSend(v28, "sourceBundleID");
            v11 = (id)objc_claimAutoreleasedReturnValue();

            (*((void (**)(void *, id))v8 + 2))(v8, v11);
          }
          goto LABEL_40;
        }
      }
      objc_msgSend(v4, "bundleID");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, id))v8 + 2))(v8, v11);
    }
LABEL_40:

    v12 = v7;
    goto LABEL_41;
  }
  v12 = 0;
LABEL_42:

  return v12;
}

void __58__BMLibraryStreamsPruner_bundleIdentifiersFromStoreEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_msgSend(v3, "isEqualToString:", &stru_1E2672FA8);
    v4 = v6;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
      v4 = v6;
    }
  }

}

+ (id)intentIdentifierFromStoreEvent:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  objc_msgSend(a3, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_12;
  getBMAppIntentClass();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    getBMSiriInteractionHistoryClass();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (getBMSiriMessageHistoryClass(), (objc_opt_isKindOfClass() & 1) != 0)
      || (getBMSiriCallHistoryClass(), (objc_opt_isKindOfClass() & 1) != 0)
      || (getBMSiriAudioHistoryClass(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v3, "interaction");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appIntentInteractionIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      +[BMLibraryStreamsPruner intentIdentifierFromStoreEvent:].cold.1();

LABEL_12:
    v4 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v3, "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v4;
}

+ (id)intentGroupIdentifierFromStoreEvent:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  objc_msgSend(a3, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_12;
  getBMAppIntentClass();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    getBMSiriInteractionHistoryClass();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (getBMSiriMessageHistoryClass(), (objc_opt_isKindOfClass() & 1) != 0)
      || (getBMSiriCallHistoryClass(), (objc_opt_isKindOfClass() & 1) != 0)
      || (getBMSiriAudioHistoryClass(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v3, "interaction");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "groupIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      +[BMLibraryStreamsPruner intentGroupIdentifierFromStoreEvent:].cold.1();

LABEL_12:
    v4 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v3, "groupIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v4;
}

+ (id)isDonatedBySiriFromStoreEvent:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  objc_msgSend(a3, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  getBMAppIntentClass();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      +[BMLibraryStreamsPruner isDonatedBySiriFromStoreEvent:].cold.1();

    goto LABEL_7;
  }
  v4 = objc_msgSend(v3, "donatedBySiri");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v4);
LABEL_8:

  return v5;
}

+ (id)contactIdentifiersFromStoreEvent:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void (**v6)(void *, void *);
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  NSObject *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD aBlock[4];
  id v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__BMLibraryStreamsPruner_contactIdentifiersFromStoreEvent___block_invoke;
    aBlock[3] = &unk_1E2648A60;
    v5 = v4;
    v34 = v5;
    v6 = (void (**)(void *, void *))_Block_copy(aBlock);
    getBMIntelligenceEngineInteractionClass();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v3;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend(v7, "candidateInteractions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v30 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "candidateId");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "identifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v6[2](v6, v14);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
        }
        while (v10);
      }

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_msgSend(v7, "tupleInteraction", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "candidateIds");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v26;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v26 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v6[2](v6, v21);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
        }
        while (v18);
      }

      v22 = v5;
    }
    else
    {
      __biome_log_for_category();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        +[BMLibraryStreamsPruner contactIdentifiersFromStoreEvent:].cold.1();

      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

void __59__BMLibraryStreamsPruner_contactIdentifiersFromStoreEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_msgSend(v3, "isEqualToString:", &stru_1E2672FA8);
    v4 = v6;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
      v4 = v6;
    }
  }

}

+ (void)shouldPruneStoreEvent:forDeletedIntentIdentifiers:bundleId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v2 = 138412546;
  v3 = OUTLINED_FUNCTION_4_0();
  v4 = 2112;
  v5 = v1;
  _os_log_error_impl(&dword_18D810000, v0, OS_LOG_TYPE_ERROR, "%@ could not find identifier from event: %@", (uint8_t *)&v2, 0x16u);
}

+ (void)bundleIdentifiersFromStoreEvent:.cold.1()
{
  objc_class *v0;
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_18D810000, v3, v4, "%@ - unhandled class in bundleIdentifiersFromStoreEvent: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_0();
}

+ (void)intentIdentifierFromStoreEvent:.cold.1()
{
  void *v0;
  objc_class *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_9_0();
  v1 = (objc_class *)OUTLINED_FUNCTION_4_0();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_2_0(&dword_18D810000, v4, v5, "%@ - unhandled class in intentIdentifierFromStoreEvent: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

+ (void)intentGroupIdentifierFromStoreEvent:.cold.1()
{
  void *v0;
  objc_class *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_9_0();
  v1 = (objc_class *)OUTLINED_FUNCTION_4_0();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_2_0(&dword_18D810000, v4, v5, "%@ - unhandled class in intentGroupIdentifierFromStoreEvent: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

+ (void)isDonatedBySiriFromStoreEvent:.cold.1()
{
  void *v0;
  objc_class *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_9_0();
  v1 = (objc_class *)OUTLINED_FUNCTION_4_0();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_2_0(&dword_18D810000, v4, v5, "%@ - unhandled class in isDonatedBySiriFromStoreEvent: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

+ (void)contactIdentifiersFromStoreEvent:.cold.1()
{
  void *v0;
  objc_class *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_9_0();
  v1 = (objc_class *)OUTLINED_FUNCTION_4_0();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_2_0(&dword_18D810000, v4, v5, "%@ - unhandled class in bundleIdentifiersFromStoreEvent: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

@end
