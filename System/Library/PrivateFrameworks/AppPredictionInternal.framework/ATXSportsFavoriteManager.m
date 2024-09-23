@implementation ATXSportsFavoriteManager

+ (void)favoritesWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC8848], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__ATXSportsFavoriteManager_favoritesWithCompletion___block_invoke;
  v6[3] = &unk_1E82E6830;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "favoritesWithCompletion:", v6);

}

uint64_t __52__ATXSportsFavoriteManager_favoritesWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v6;

  if (a2 | a4)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    __52__ATXSportsFavoriteManager_favoritesWithCompletion___block_invoke_cold_1(v6);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)isOnboarded:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC8848], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__ATXSportsFavoriteManager_isOnboarded___block_invoke;
  v6[3] = &unk_1E82E6858;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "isOnboarded:", v6);

}

uint64_t __40__ATXSportsFavoriteManager_isOnboarded___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __52__ATXSportsFavoriteManager_favoritesWithCompletion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "-[WLKSportsFavoriteManager favoritesWithCompletion:] returned a nil response and error", v1, 2u);
}

@end
