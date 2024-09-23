@implementation NSArray

void __58__NSArray_GKCollectionUtils___gkMapConcurrentlyWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(v6 + 8 * a3);
  *(_QWORD *)(v6 + 8 * a3) = v5;

}

void __46__NSArray_GKCollectionUtils___gkMapWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);
    v2 = v3;
  }

}

void __49__NSArray_GKCollectionUtils___gkFilterWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);
    v2 = v3;
  }

}

void __57__NSArray_GKCollectionUtils___gkSubarraysByKeyWithBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *(_QWORD *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);
    }
    objc_msgSend(v4, "addObject:", v5);

  }
}

void __60__NSArray_GKCollectionUtils___gkFoldWithInitialValue_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t, id);
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t, id))(v6 + 16);
  v11 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v7(v6, a2, a3, v11);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

uint64_t __59__NSArray_GKCollectionUtils___gkContainsObjectPassingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *a4 = result;
  return result;
}

id __56__NSArray_ScopedIDs___gkUpdateInternalPlayersScopedIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_msgSend(v2, "scopedIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 0;
  else
    v4 = v2;
  v5 = v4;

  return v5;
}

void __56__NSArray_ScopedIDs___gkUpdateInternalPlayersScopedIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "playerID", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setScopedIDs:", v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id __70__NSArray_GKPlayerCanonicalization___gkIncompletePlayersFromPlayerIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("expected legacy playerID, got %@"), v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ ([playerID isKindOfClass:[NSString class]])\n[%s (%s:%d)]"), v4, "-[NSArray(GKPlayerCanonicalization) _gkIncompletePlayersFromPlayerIDs]_block_invoke", objc_msgSend(v6, "UTF8String"), 1023);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
  }
  +[GKPlayer playerFromPlayerID:](GKPlayer, "playerFromPlayerID:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __61__NSArray_GKPlayerCanonicalization___gkPlayersIDsFromPlayers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("expected GKPlayer, got %@"), v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ ([player isKindOfClass:[GKPlayer class]])\n[%s (%s:%d)]"), v4, "-[NSArray(GKPlayerCanonicalization) _gkPlayersIDsFromPlayers]_block_invoke", objc_msgSend(v6, "UTF8String"), 1031);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
  }
  objc_msgSend(v2, "internal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playerID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __63__NSArray_GKPlayerCanonicalization___gkPlayersIDsFromInternals__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("expected GKPlayerInternal, got %@"), v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ ([internal isKindOfClass:[GKPlayerInternal class]])\n[%s (%s:%d)]"), v4, "-[NSArray(GKPlayerCanonicalization) _gkPlayersIDsFromInternals]_block_invoke", objc_msgSend(v6, "UTF8String"), 1039);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
  }
  objc_msgSend(v2, "playerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __60__NSArray_GKPlayerCanonicalization___gkPlayersFromInternals__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("expected GKPlayerInternal, got %@"), v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ ([internal isKindOfClass:[GKPlayerInternal class]])\n[%s (%s:%d)]"), v4, "-[NSArray(GKPlayerCanonicalization) _gkPlayersFromInternals]_block_invoke", objc_msgSend(v6, "UTF8String"), 1047);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
  }
  +[GKPlayer canonicalizedPlayerForInternal:](GKPlayer, "canonicalizedPlayerForInternal:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __60__NSArray_GKPlayerCanonicalization___gkInternalsFromPlayers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("expected GKPlayer, got %@"), v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ ([player isKindOfClass:[GKPlayer class]])\n[%s (%s:%d)]"), v4, "-[NSArray(GKPlayerCanonicalization) _gkInternalsFromPlayers]_block_invoke", objc_msgSend(v6, "UTF8String"), 1057);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
  }
  objc_msgSend(v2, "internal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v10 = GKOSLoggers();
      v9 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __60__NSArray_GKPlayerCanonicalization___gkInternalsFromPlayers__block_invoke_cold_1(v9);
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v8, "playerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v13 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v14 = GKOSLoggers();
      v13 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __60__NSArray_GKPlayerCanonicalization___gkInternalsFromPlayers__block_invoke_cold_2();
    goto LABEL_14;
  }
  v12 = v8;
LABEL_15:

  return v12;
}

uint64_t __69__NSArray_GKPlayerCanonicalization___gkInternalsFromUncheckedPlayers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "internal");
}

void __71__NSArray_GKPlayerCanonicalization___gkValidatePlayersForReturnFromAPI__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v20 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastPathComponent");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ ([player isKindOfClass:[GKPlayer class]])\n[%s (%s:%d)]"), v3, "-[NSArray(GKPlayerCanonicalization) _gkValidatePlayersForReturnFromAPI]_block_invoke", objc_msgSend(v5, "UTF8String"), 1084);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v6);
  }
  objc_msgSend(v20, "alias");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastPathComponent");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ (player.alias != ((void *)0))\n[%s (%s:%d)]"), v9, "-[NSArray(GKPlayerCanonicalization) _gkValidatePlayersForReturnFromAPI]_block_invoke", objc_msgSend(v11, "UTF8String"), 1085);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v12);
  }
  objc_msgSend(v20, "internal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "playerID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastPathComponent");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ (player.internal.playerID != ((void *)0))\n[%s (%s:%d)]"), v16, "-[NSArray(GKPlayerCanonicalization) _gkValidatePlayersForReturnFromAPI]_block_invoke", objc_msgSend(v18, "UTF8String"), 1086);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v19);
  }

}

id __62__NSArray_GKGuestPlayerFilters___gkNonGuestPlayersFromPlayers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isGuestPlayer") & 1) != 0 || (objc_msgSend(v2, "isLocalPlayer") & 1) != 0)
    v3 = 0;
  else
    v3 = v2;

  return v3;
}

id __59__NSArray_GKGuestPlayerFilters___gkGuestPlayersFromPlayers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (objc_msgSend(v2, "isGuestPlayer"))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

void __60__NSArray_GKPlayerCanonicalization___gkInternalsFromPlayers__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BCDE3000, log, OS_LOG_TYPE_DEBUG, "filtering unauthenticated local player internal", v1, 2u);
}

void __60__NSArray_GKPlayerCanonicalization___gkInternalsFromPlayers__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1BCDE3000, v0, v1, "filtering player internal with nil playerID %@", v2);
  OUTLINED_FUNCTION_2();
}

@end
