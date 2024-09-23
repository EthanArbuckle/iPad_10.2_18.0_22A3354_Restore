@implementation _CNACDPeopleSuggesterFacade

- (id)suggestPeopleWithContext:(id)a3 settings:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0D15908], "peopleSuggester");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContext:", v7);
  objc_msgSend(v9, "setSettings:", v8);
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__1;
  v32 = __Block_byref_object_dispose__1;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "schedulerProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "immediateScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __71___CNACDPeopleSuggesterFacade_suggestPeopleWithContext_settings_error___block_invoke;
  v18[3] = &unk_1E70DECA0;
  v20 = &v22;
  v13 = v9;
  v19 = v13;
  v21 = &v28;
  objc_msgSend(v12, "performBlock:qualityOfService:", v18, 4);

  v14 = (void *)v29[5];
  v15 = (id)v23[5];
  v16 = v15;
  if (a5 && !v15)
    *a5 = objc_retainAutorelease(v14);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

@end
