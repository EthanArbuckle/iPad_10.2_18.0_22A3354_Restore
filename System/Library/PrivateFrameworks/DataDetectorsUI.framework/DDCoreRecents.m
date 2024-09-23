@implementation DDCoreRecents

+ (void)addResultToRecents:(id)a3 eventDate:(id)a4 subject:(id)a5 weight:(id)a6 metadata:(id)a7 userInitiated:(BOOL)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD activity_block[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  BOOL v29;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke;
  activity_block[3] = &unk_1E4258DF0;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v27 = v16;
  v28 = v17;
  v29 = a8;
  v18 = v17;
  v19 = v16;
  v20 = v15;
  v21 = v14;
  v22 = v13;
  _os_activity_initiate(&dword_19EFBB000, "Add Data Detectors result to Core Recents", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.datadetectors.AddToRecentsService"));
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5816B0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);

  objc_msgSend(v2, "resume");
  v4 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke_2;
  v16[3] = &unk_1E4258DC8;
  v5 = v2;
  v17 = v5;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke_cold_1((uint64_t)v6);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v12 = *(unsigned __int8 *)(a1 + 72);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke_7;
  v14[3] = &unk_1E4258168;
  v15 = v5;
  v13 = v5;
  objc_msgSend(v6, "addResultToRecents:eventDate:subject:weight:metadata:userInitiated:completionBlock:", v7, v8, v9, v10, v11, v12, v14);

}

void __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke_2_cold_1((uint64_t)v3);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

uint64_t __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke_7(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke_7_cold_1();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

+ (void)addResultToRecents:(id)a3 associatedResults:(id)a4 weight:(id)a5 context:(id)a6 userInitiated:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v7 = a7;
  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (objc_msgSend(v18, "category") - 4 >= 0xFFFFFFFE)
  {
    if (!v12
      || (beginDateOfEventResults(v12, v14, 0, 0, 0), (v15 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ReferenceDate"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("EventTitle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("CoreRecents"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "addResultToRecents:eventDate:subject:weight:metadata:userInitiated:", v18, v15, v16, v13, v17, v7);

  }
}

void __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_debug_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Got proxy %@", (uint8_t *)&v1, 0xCu);
}

void __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke_2_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_fault_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Error caught while adding an address to the recents: %@", (uint8_t *)&v1, 0xCu);
}

void __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke_7_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Failed adding the result to recents", v0, 2u);
}

@end
