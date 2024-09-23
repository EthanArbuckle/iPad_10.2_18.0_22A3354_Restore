@implementation GKOSLoggers

void __GKOSLoggers_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;
  os_log_t v12;
  void *v13;
  os_log_t v14;
  void *v15;
  os_log_t v16;
  void *v17;
  os_log_t v18;
  void *v19;
  os_log_t v20;
  void *v21;
  os_log_t v22;
  void *v23;
  os_log_t v24;
  void *v25;
  os_log_t v26;
  void *v27;
  os_log_t v28;
  void *v29;
  os_log_t v30;
  void *v31;
  os_log_t v32;
  void *v33;
  os_log_t v34;
  void *v35;
  os_log_t v36;
  void *v37;
  os_log_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[20];
  _QWORD v63[22];

  v63[20] = *MEMORY[0x1E0C80C00];
  v0 = os_log_create("com.apple.GameKit", "General");
  v1 = (void *)os_log_GKGeneral;
  os_log_GKGeneral = (uint64_t)v0;

  v2 = os_log_create("com.apple.GameKit", "Error");
  v3 = (void *)os_log_GKError;
  os_log_GKError = (uint64_t)v2;

  v4 = os_log_create("com.apple.GameKit", "Match");
  v5 = (void *)os_log_GKMatch;
  os_log_GKMatch = (uint64_t)v4;

  v6 = os_log_create("com.apple.GameKit", "Daemon");
  v7 = (void *)os_log_GKDaemon;
  os_log_GKDaemon = (uint64_t)v6;

  v8 = os_log_create("com.apple.GameKit", "Cache");
  v9 = (void *)os_log_GKCache;
  os_log_GKCache = (uint64_t)v8;

  v10 = os_log_create("com.apple.GameKit", "LRUCache");
  v11 = (void *)os_log_GKLRUCache;
  os_log_GKLRUCache = (uint64_t)v10;

  v12 = os_log_create("com.apple.GameKit", "Perf");
  v13 = (void *)os_log_GKPerf;
  os_log_GKPerf = (uint64_t)v12;

  v14 = os_log_create("com.apple.GameKit", "HTTP");
  v15 = (void *)os_log_GKHTTP;
  os_log_GKHTTP = (uint64_t)v14;

  v16 = os_log_create("com.apple.GameKit", "Hosted");
  v17 = (void *)os_log_GKHosted;
  os_log_GKHosted = (uint64_t)v16;

  v18 = os_log_create("com.apple.GameKit", "Dispatch");
  v19 = (void *)os_log_GKDispatch;
  os_log_GKDispatch = (uint64_t)v18;

  v20 = os_log_create("com.apple.GameKit", "Developer");
  v21 = (void *)os_log_GKDeveloper;
  os_log_GKDeveloper = (uint64_t)v20;

  v22 = os_log_create("com.apple.GameKit", "Trace");
  v23 = (void *)os_log_GKTrace;
  os_log_GKTrace = (uint64_t)v22;

  v24 = os_log_create("com.apple.GameKit", "Account");
  v25 = (void *)os_log_GKAccount;
  os_log_GKAccount = (uint64_t)v24;

  v26 = os_log_create("com.apple.GameKit", "AccountError");
  v27 = (void *)os_log_GKAccountError;
  os_log_GKAccountError = (uint64_t)v26;

  v28 = os_log_create("com.apple.GameKit", "CollectionView");
  v29 = (void *)os_log_GKCollectionView;
  os_log_GKCollectionView = (uint64_t)v28;

  v30 = os_log_create("com.apple.GameKit", "Contacts");
  v31 = (void *)os_log_GKContacts;
  os_log_GKContacts = (uint64_t)v30;

  v32 = os_log_create("com.apple.GameKit", "ActivityFeed");
  v33 = (void *)os_log_GKActivityFeed;
  os_log_GKActivityFeed = (uint64_t)v32;

  v34 = os_log_create("com.apple.GameKit", "Onboarding");
  v35 = (void *)os_log_GKOnboarding;
  os_log_GKOnboarding = (uint64_t)v34;

  v36 = os_log_create("com.apple.GameKit", "Friending");
  v37 = (void *)os_log_GKFriending;
  os_log_GKFriending = (uint64_t)v36;

  v38 = os_log_create("com.apple.GameKit", "FastSync");
  v39 = (void *)os_log_GKFastSync;
  os_log_GKFastSync = (uint64_t)v38;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "General");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v61;
  v63[0] = os_log_GKGeneral;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "Error");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v60;
  v63[1] = os_log_GKError;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "Match");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v59;
  v63[2] = os_log_GKMatch;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "Daemon");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v58;
  v63[3] = os_log_GKDaemon;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "Cache");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v62[4] = v57;
  v63[4] = os_log_GKCache;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "LRUCache");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v62[5] = v56;
  v63[5] = os_log_GKLRUCache;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "Perf");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v62[6] = v55;
  v63[6] = os_log_GKPerf;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "HTTP");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v62[7] = v54;
  v63[7] = os_log_GKHTTP;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "Hosted");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v62[8] = v53;
  v63[8] = os_log_GKHosted;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "Dispatch");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v62[9] = v52;
  v63[9] = os_log_GKDispatch;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "Developer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v62[10] = v51;
  v63[10] = os_log_GKDeveloper;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "Trace");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v62[11] = v40;
  v63[11] = os_log_GKTrace;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "Account");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v62[12] = v41;
  v63[12] = os_log_GKAccount;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "AccountError");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v62[13] = v42;
  v63[13] = os_log_GKAccountError;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "CollectionView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v62[14] = v43;
  v63[14] = os_log_GKCollectionView;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "Contacts");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v62[15] = v44;
  v63[15] = os_log_GKContacts;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "ActivityFeed");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v62[16] = v45;
  v63[16] = os_log_GKActivityFeed;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "Onboarding");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v62[17] = v46;
  v63[17] = os_log_GKOnboarding;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "Friending");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v62[18] = v47;
  v63[18] = os_log_GKFriending;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "FastSync");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v62[19] = v48;
  v63[19] = os_log_GKFastSync;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 20);
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = (void *)sOSLogCategories;
  sOSLogCategories = v49;

}

@end
