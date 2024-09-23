@implementation _ICPortraitLexiconSource

- (_ICPortraitLexiconSource)init
{
  _ICPortraitLexiconSource *v2;
  uint64_t v3;
  PPContactStore *contactStore;
  uint64_t v5;
  PPNamedEntityStore *namedEntityStore;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_ICPortraitLexiconSource;
  v2 = -[_ICPortraitLexiconSource init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    contactStore = v2->_contactStore;
    v2->_contactStore = (PPContactStore *)v3;

    -[_ICPortraitLexiconSource _makePPNamedEntityStore](v2, "_makePPNamedEntityStore");
    v5 = objc_claimAutoreleasedReturnValue();
    namedEntityStore = v2->_namedEntityStore;
    v2->_namedEntityStore = (PPNamedEntityStore *)v5;

  }
  return v2;
}

- (id)_makePPNamedEntityStore
{
  if (_makePPNamedEntityStore_onceToken != -1)
    dispatch_once(&_makePPNamedEntityStore_onceToken, &__block_literal_global_1);
  return (id)_makePPNamedEntityStore_store;
}

- (void)startLoadingWithManager:(id)a3
{
  NSObject *v4;
  PPContactNameRecordLoadingDelegate *v5;
  PPContactNameRecordLoadingDelegate *contactDelegate;
  PPContactStore *contactStore;
  PPContactNameRecordLoadingDelegate *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  PPNamedEntityRecordLoadingDelegate *v17;
  PPNamedEntityRecordLoadingDelegate *namedEntityDelegate;
  id v19;
  void *v20;
  void *v21;
  PPNamedEntityStore *namedEntityStore;
  PPNamedEntityRecordLoadingDelegate *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  uint8_t buf[16];

  objc_storeWeak((id *)&self->_manager, a3);
  _ICPersNamedEntityOSLogFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22716D000, v4, OS_LOG_TYPE_INFO, "_ICPortraitLexiconSource loading data", buf, 2u);
  }

  -[_ICPortraitLexiconSource _makeContactDelegate](self, "_makeContactDelegate");
  v5 = (PPContactNameRecordLoadingDelegate *)objc_claimAutoreleasedReturnValue();
  contactDelegate = self->_contactDelegate;
  self->_contactDelegate = v5;

  contactStore = self->_contactStore;
  v8 = self->_contactDelegate;
  v33 = 0;
  -[PPContactStore loadContactNameRecordsAndMonitorChangesWithDelegate:error:](contactStore, "loadContactNameRecordsAndMonitorChangesWithDelegate:error:", v8, &v33);
  v9 = v33;
  if (v9)
  {
    _ICPersContactOSLogFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_ICPortraitLexiconSource startLoadingWithManager:].cold.2((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);

  }
  -[_ICPortraitLexiconSource _makeNamedEntityDelegate](self, "_makeNamedEntityDelegate");
  v17 = (PPNamedEntityRecordLoadingDelegate *)objc_claimAutoreleasedReturnValue();
  namedEntityDelegate = self->_namedEntityDelegate;
  self->_namedEntityDelegate = v17;

  v19 = objc_alloc_init(MEMORY[0x24BE71B08]);
  +[_ICPortraitUtilities acceptedSourceBundleIds](_ICPortraitUtilities, "acceptedSourceBundleIds");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setMatchingSourceBundleIds:", v20);

  +[_ICPortraitUtilities excludedAlgorithms](_ICPortraitUtilities, "excludedAlgorithms");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setExcludingAlgorithms:", v21);

  namedEntityStore = self->_namedEntityStore;
  v23 = self->_namedEntityDelegate;
  v32 = 0;
  -[PPNamedEntityStore loadNamedEntityRecordsAndMonitorChangesWithDelegate:query:error:](namedEntityStore, "loadNamedEntityRecordsAndMonitorChangesWithDelegate:query:error:", v23, v19, &v32);
  v24 = v32;
  if (v24)
  {
    _ICPersNamedEntityOSLogFacility();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[_ICPortraitLexiconSource startLoadingWithManager:].cold.1((uint64_t)v24, v25, v26, v27, v28, v29, v30, v31);

  }
}

- (id)_makeContactDelegate
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE71AE0]), "initWithName:", CFSTR("ICPortraitLexiconSource"));
  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __48___ICPortraitLexiconSource__makeContactDelegate__block_invoke;
  v16[3] = &unk_24EF717A8;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v3, "setContactNameRecordsSetup:", v16);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __48___ICPortraitLexiconSource__makeContactDelegate__block_invoke_2;
  v14[3] = &unk_24EF717D0;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v3, "setContactNameRecordsHandler:", v14);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __48___ICPortraitLexiconSource__makeContactDelegate__block_invoke_3;
  v12[3] = &unk_24EF717F8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v3, "setContactNameRecordsCompletion:", v12);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __48___ICPortraitLexiconSource__makeContactDelegate__block_invoke_4;
  v10[3] = &unk_24EF717A8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "setRecentContactNameRecordsSetup:", v10);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __48___ICPortraitLexiconSource__makeContactDelegate__block_invoke_5;
  v8[3] = &unk_24EF717D0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "setRecentContactNameRecordsHandler:", v8);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __48___ICPortraitLexiconSource__makeContactDelegate__block_invoke_6;
  v6[3] = &unk_24EF717F8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "setRecentContactNameRecordsCompletion:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  return v3;
}

- (id)_makeNamedEntityDelegate
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE71B18]), "initWithName:", CFSTR("ICPortraitLexiconSource"));
  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __52___ICPortraitLexiconSource__makeNamedEntityDelegate__block_invoke;
  v18[3] = &unk_24EF717A8;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v3, "setNamedEntityRecordsSetup:", v18);
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __52___ICPortraitLexiconSource__makeNamedEntityDelegate__block_invoke_2;
  v16[3] = &unk_24EF71820;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v3, "setNamedEntityRecordsHandler:", v16);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __52___ICPortraitLexiconSource__makeNamedEntityDelegate__block_invoke_3;
  v14[3] = &unk_24EF717F8;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v3, "setNamedEntityRecordsCompletion:", v14);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __52___ICPortraitLexiconSource__makeNamedEntityDelegate__block_invoke_4;
  v12[3] = &unk_24EF717A8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v3, "setRecentNamedEntityRecordsSetup:", v12);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __52___ICPortraitLexiconSource__makeNamedEntityDelegate__block_invoke_5;
  v10[3] = &unk_24EF71820;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "setRecentNamedEntityRecordsHandler:", v10);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __52___ICPortraitLexiconSource__makeNamedEntityDelegate__block_invoke_6;
  v8[3] = &unk_24EF717F8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "setRecentNamedEntityRecordsCompletion:", v8);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __52___ICPortraitLexiconSource__makeNamedEntityDelegate__block_invoke_7;
  v6[3] = &unk_24EF717F8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "setResetNamedEntityRecordData:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  return v3;
}

- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5
{
  int v5;
  int v6;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (v6 == 3)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE71AF0]), "initWithOfferedString:", v8);
LABEL_15:
    v10 = v9;
    _ICPersNamedEntityOSLogFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[_ICPortraitLexiconSource provideFeedbackForString:type:style:].cold.1(v5, v6, v11);

    -[PPNamedEntityStore registerFeedback:completion:](self->_namedEntityStore, "registerFeedback:completion:", v10, 0);
    goto LABEL_18;
  }
  if (v6 == 1 && v5 == 1)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE71AF0]), "initWithExplicitlyEngagedString:", v8);
    goto LABEL_15;
  }
  if (v6 == 1 && v5 == 2)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE71AF0]), "initWithImplicitlyEngagedString:", v8);
    goto LABEL_15;
  }
  if (v6 == 2 && v5 == 1)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE71AF0]), "initWithExplicitlyRejectedString:", v8);
    goto LABEL_15;
  }
  if (v6 == 2 && v5 == 2)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE71AF0]), "initWithImplicitlyRejectedString:", v8);
    goto LABEL_15;
  }
  _ICPersNamedEntityOSLogFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[_ICPortraitLexiconSource provideFeedbackForString:type:style:].cold.2(v6, v5, v10);
LABEL_18:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedEntityDelegate, 0);
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
  objc_storeStrong((id *)&self->_contactDelegate, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_destroyWeak((id *)&self->_manager);
}

- (void)startLoadingWithManager:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_22716D000, a2, a3, "failed to load named entity records from Portrait: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)startLoadingWithManager:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_22716D000, a2, a3, "failed to load contact name records from Portrait: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)provideFeedbackForString:(unsigned __int8)a1 type:(int)a2 style:(os_log_t)log .cold.1(unsigned __int8 a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = a2;
  v4 = 1024;
  v5 = a1;
  _os_log_debug_impl(&dword_22716D000, log, OS_LOG_TYPE_DEBUG, "Feedback received by _ICPortraitLexiconSource with type = %d, style = %d", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_5();
}

- (void)provideFeedbackForString:(int)a1 type:(int)a2 style:(os_log_t)log .cold.2(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_22716D000, log, OS_LOG_TYPE_ERROR, "Error: feedback received by _ICPortraitLexiconSource with unknown type or style: %d / %d", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_5();
}

@end
