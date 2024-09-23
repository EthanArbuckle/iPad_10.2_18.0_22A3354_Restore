@implementation ATXSpotlightZKWTrialClientWrapper

- (int64_t)alternateRecentsRanking
{
  _PASLock *lock;
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  lock = self->_lock;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__ATXSpotlightZKWTrialClientWrapper_alternateRecentsRanking__block_invoke;
  v5[3] = &unk_1E4D5C3B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_2, &__block_literal_global_78);
  return (id)sharedInstance__pasExprOnceResult_13;
}

void __50__ATXSpotlightZKWTrialClientWrapper_updateFactors__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_INFO, "ATXSpotlightZKWTrialClientWrapper: Updating factors", v14, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "refreshEnrollmentInformation");
  objc_msgSend(*(id *)(a1 + 32), "stringForFactor:", CFSTR("codepathIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v3[1];
  v3[1] = v6;

  objc_msgSend(*(id *)(a1 + 32), "longForFactor:", CFSTR("ZKWSuggestionsMaxCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "longValue");
  v10 = 4;
  if (v9)
    v10 = v9;
  v3[2] = v10;

  objc_msgSend(*(id *)(a1 + 32), "BOOLForFactor:", CFSTR("ZKWNSUASuggestions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)v3 + 24) = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(*(id *)(a1 + 32), "BOOLForFactor:", CFSTR("ZKWShowNSUASuggestionsAsAppLaunches"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)v3 + 25) = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(*(id *)(a1 + 32), "longForFactor:", CFSTR("ZKWAlternateRecentsRanking"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v3[4] = objc_msgSend(v13, "longValue");

}

uint64_t __60__ATXSpotlightZKWTrialClientWrapper_alternateRecentsRanking__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(a2 + 32);
  return result;
}

void __51__ATXSpotlightZKWTrialClientWrapper_sharedInstance__block_invoke()
{
  void *v0;
  ATXSpotlightZKWTrialClientWrapper *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A85A4F90]();
  v1 = -[ATXSpotlightZKWTrialClientWrapper initWithClientIdentifier:]([ATXSpotlightZKWTrialClientWrapper alloc], "initWithClientIdentifier:", 232);
  v2 = (void *)sharedInstance__pasExprOnceResult_13;
  sharedInstance__pasExprOnceResult_13 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXSpotlightZKWTrialClientWrapper)initWithClientIdentifier:(int)a3
{
  ATXSpotlightZKWTrialClientWrapper *v3;
  id v4;
  void *v5;
  uint64_t v6;
  _PASLock *lock;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ATXSpotlightZKWTrialClientWrapper;
  v3 = -[ATXTrialClientWrapper initWithClientIdentifier:namespaceName:](&v9, sel_initWithClientIdentifier_namespaceName_, *(_QWORD *)&a3, CFSTR("SPOTLIGHT_UI"));
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D815F0]);
    v5 = (void *)objc_opt_new();
    v6 = objc_msgSend(v4, "initWithGuardedData:", v5);
    lock = v3->_lock;
    v3->_lock = (_PASLock *)v6;

    -[ATXSpotlightZKWTrialClientWrapper updateFactors](v3, "updateFactors");
  }
  return v3;
}

- (void)updateFactors
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__ATXSpotlightZKWTrialClientWrapper_updateFactors__block_invoke;
  v3[3] = &unk_1E4D5C388;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

- (id)codePathIdForSuggestionsMaxCount
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9FDF73BF-DFFD-48E8-81C9-13570F689942"));
}

- (BOOL)matchesSuggestionsMaxCount
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[ATXSpotlightZKWTrialClientWrapper codepathIDs](self, "codepathIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSpotlightZKWTrialClientWrapper codePathIdForSuggestionsMaxCount](self, "codePathIdForSuggestionsMaxCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsString:", v5);

  return v6;
}

- (id)codePathForAlternateRecentsControl
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("060589A5-DF6F-4C6A-A954-1E87CE792C96"));
}

- (id)codePathForAlternateRecentsTreatment
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("A0E6F9C0-EC33-4884-88D8-36ED11E3E541"));
}

- (BOOL)matchesAlternateRecentsControlCodePath
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[ATXSpotlightZKWTrialClientWrapper codepathIDs](self, "codepathIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSpotlightZKWTrialClientWrapper codePathForAlternateRecentsControl](self, "codePathForAlternateRecentsControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsString:", v5);

  return v6;
}

- (BOOL)matchesAlternateRecentsTreatmentCodePath
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[ATXSpotlightZKWTrialClientWrapper codepathIDs](self, "codepathIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSpotlightZKWTrialClientWrapper codePathForAlternateRecentsTreatment](self, "codePathForAlternateRecentsTreatment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsString:", v5);

  return v6;
}

- (id)codepathIDs
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__18;
  v10 = __Block_byref_object_dispose__18;
  lock = self->_lock;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__ATXSpotlightZKWTrialClientWrapper_codepathIDs__block_invoke;
  v5[3] = &unk_1E4D5C3B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__ATXSpotlightZKWTrialClientWrapper_codepathIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 8));
}

- (int64_t)suggestionsMaxCount
{
  _PASLock *lock;
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  lock = self->_lock;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__ATXSpotlightZKWTrialClientWrapper_suggestionsMaxCount__block_invoke;
  v5[3] = &unk_1E4D5C3B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __56__ATXSpotlightZKWTrialClientWrapper_suggestionsMaxCount__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(a2 + 16);
  return result;
}

- (BOOL)nsuaSuggestions
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  lock = self->_lock;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__ATXSpotlightZKWTrialClientWrapper_nsuaSuggestions__block_invoke;
  v5[3] = &unk_1E4D5C3B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__ATXSpotlightZKWTrialClientWrapper_nsuaSuggestions__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 24);
  return result;
}

- (BOOL)showNSUASuggestionsAsAppLaunches
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  lock = self->_lock;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__ATXSpotlightZKWTrialClientWrapper_showNSUASuggestionsAsAppLaunches__block_invoke;
  v5[3] = &unk_1E4D5C3B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __69__ATXSpotlightZKWTrialClientWrapper_showNSUASuggestionsAsAppLaunches__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 25);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
