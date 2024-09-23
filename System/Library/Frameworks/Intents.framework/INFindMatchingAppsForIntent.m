@implementation INFindMatchingAppsForIntent

void __INFindMatchingAppsForIntent_block_invoke_154(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "valueForKey:", CFSTR("_plugIn"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("containingUrl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__69069;
  v17 = __Block_byref_object_dispose__69070;
  v18 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __INFindMatchingAppsForIntent_block_invoke_2;
  v12[3] = &unk_1E228F770;
  v12[4] = &v13;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
  v9 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v10 = v14[5];
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315906;
    v20 = "INFindMatchingAppsForIntent_block_invoke";
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_18BEBC000, v9, OS_LOG_TYPE_INFO, "%s found matching system & non-system apps: %@ for intent: %@ with error: %@", buf, 0x2Au);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  _Block_object_dispose(&v13, 8);

}

void __INFindMatchingAppsForIntent_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v14;
  else
    v3 = 0;
  v4 = v3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForBundleURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v9 = *(void **)(v8 + 40);
        if (v9)
        {
          v10 = v9;
          v11 = *(void **)(v8 + 40);
          *(_QWORD *)(v8 + 40) = v10;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v11 = *(void **)(v13 + 40);
          *(_QWORD *)(v13 + 40) = v12;
        }

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v7);
      }

    }
  }

}

void __INFindMatchingAppsForIntent_block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  objc_class *v2;
  objc_class *v3;
  objc_class *v4;
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[21];
  _QWORD v45[23];

  v45[21] = *MEMORY[0x1E0C80C00];
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v43;
  v45[0] = &unk_1E23F9930;
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v42;
  v45[1] = &unk_1E23F9948;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v41;
  v45[2] = &unk_1E23F9960;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v40;
  v45[3] = &unk_1E23F9978;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v39;
  v45[4] = &unk_1E23F9990;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v44[5] = v38;
  v45[5] = &unk_1E23F99A8;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v44[6] = v37;
  v45[6] = &unk_1E23F99C0;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v44[7] = v36;
  v45[7] = &unk_1E23F99D8;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v44[8] = v35;
  v45[8] = &unk_1E23F99F0;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v44[9] = v34;
  v45[9] = &unk_1E23F9A08;
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v44[10] = v33;
  v45[10] = &unk_1E23F9A20;
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44[11] = v12;
  v45[11] = &unk_1E23F9A38;
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v44[12] = v14;
  v45[12] = &unk_1E23F9A50;
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44[13] = v16;
  v45[13] = &unk_1E23F9A68;
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44[14] = v18;
  v45[14] = &unk_1E23F9A80;
  v19 = (objc_class *)objc_opt_class();
  NSStringFromClass(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44[15] = v20;
  v45[15] = &unk_1E23F9A98;
  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v44[16] = v22;
  v45[16] = &unk_1E23F9AB0;
  v23 = (objc_class *)objc_opt_class();
  NSStringFromClass(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44[17] = v24;
  v45[17] = &unk_1E23F9AC8;
  v25 = (objc_class *)objc_opt_class();
  NSStringFromClass(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v44[18] = v26;
  v45[18] = &unk_1E23F9AE0;
  v27 = (objc_class *)objc_opt_class();
  NSStringFromClass(v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v44[19] = v28;
  v45[19] = &unk_1E23F9AF8;
  v29 = (objc_class *)objc_opt_class();
  NSStringFromClass(v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44[20] = v30;
  v45[20] = &unk_1E23F9B10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 21);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)INFindMatchingAppsForIntent_matchingSystemAppBundleIdentifiersByIntentName;
  INFindMatchingAppsForIntent_matchingSystemAppBundleIdentifiersByIntentName = v31;

}

@end
