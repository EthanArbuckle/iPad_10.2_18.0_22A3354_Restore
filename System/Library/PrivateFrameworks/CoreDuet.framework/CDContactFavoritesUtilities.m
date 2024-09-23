@implementation CDContactFavoritesUtilities

void __46___CDContactFavoritesUtilities_sharedInstance__block_invoke()
{
  void *v0;
  _CDContactFavoritesUtilities *v1;
  void *v2;

  v0 = (void *)MEMORY[0x193FEE914]();
  v1 = objc_alloc_init(_CDContactFavoritesUtilities);
  v2 = (void *)sharedInstance__pasExprOnceResult_2;
  sharedInstance__pasExprOnceResult_2 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void __54___CDContactFavoritesUtilities_favoriteContactEntries__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "entries");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __50___CDContactFavoritesUtilities_entriesForContact___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "entriesForContact:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

@end
