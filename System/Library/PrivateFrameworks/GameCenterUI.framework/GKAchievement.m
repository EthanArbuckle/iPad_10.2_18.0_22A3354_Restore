@implementation GKAchievement

void __94__GKAchievement_GKChallenge__challengeComposeControllerWithMessage_players_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(a4, "_gkPlayersIDsFromPlayers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, uint64_t, void *))(v8 + 16))(v8, v9, a3, v7);

}

uint64_t __94__GKAchievement_GKChallenge__challengeComposeControllerWithPlayers_message_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __81__GKAchievement_GKChallenge__selectChallengeablePlayerIDs_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    objc_msgSend(a2, "_gkPlayersIDsFromPlayers");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

  }
}

void __79__GKAchievement_GKChallenge__selectChallengeablePlayers_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  if (v5 && !v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", *(_QWORD *)(a1 + 32));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v13, "isCompleted", (_QWORD)v18))
          {
            objc_msgSend(v13, "player");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "removeObject:", v14);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "array");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __79__GKAchievement_GKChallenge__selectChallengeablePlayers_withCompletionHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  id v7;

  v1 = a1[4];
  if (v1)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
    if (v3)
    {
      v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16);
      v5 = a1[4];
      v6 = 0;
LABEL_7:
      v4(v5, v6, v3);
      return;
    }
    v6 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    if (v6)
    {
      v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16);
      v5 = a1[4];
      v3 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v7, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));

  }
}

@end
