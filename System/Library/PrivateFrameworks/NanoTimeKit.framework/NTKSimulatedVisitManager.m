@implementation NTKSimulatedVisitManager

- (NTKSimulatedVisitManager)init
{
  NTKSimulatedVisitManager *v2;
  NSObject *v3;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKSimulatedVisitManager;
  v2 = -[NTKSimulatedVisitManager init](&v6, sel_init);
  if (v2)
  {
    _NTKLoggingObjectForDomain(12, (uint64_t)"NTKLoggingDomainLocation");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "NTKSimulatedVisitManager initialized.", v5, 2u);
    }

  }
  return v2;
}

- (id)startVisitUpdatesWithIdentifier:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__NTKSimulatedVisitManager_startVisitUpdatesWithIdentifier_handler___block_invoke;
  v8[3] = &unk_1E6BCE3C8;
  v8[4] = self;
  v9 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

  return &stru_1E6BDC918;
}

void __68__NTKSimulatedVisitManager_startVisitUpdatesWithIdentifier_handler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "currentVisit");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "anyVisit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, _QWORD))(v2 + 16))(v2, v4, v3, 0);

}

- (id)currentVisit
{
  return +[NTKVisitManager fallbackVisit](NTKVisitManager, "fallbackVisit");
}

- (id)previousVisit
{
  return +[NTKVisitManager fallbackVisit](NTKVisitManager, "fallbackVisit");
}

@end
