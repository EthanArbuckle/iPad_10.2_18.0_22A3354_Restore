@implementation GKAchievement(GKChallenge)

- (id)challengeComposeControllerWithMessage:()GKChallenge players:completionHandler:
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __94__GKAchievement_GKChallenge__challengeComposeControllerWithMessage_players_completionHandler___block_invoke;
  v12[3] = &unk_1E59C8E10;
  v13 = v8;
  v9 = v8;
  objc_msgSend(a1, "challengeComposeControllerWithMessage:players:completion:", a3, a4, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)challengeComposeControllerWithMessage:()GKChallenge players:completion:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D252C0], "currentGame");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "internal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "supportsChallenges");

  if ((v13 & 1) != 0)
  {
    v14 = (void *)MEMORY[0x1E0D25280];
    objc_msgSend(a1, "game");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "challengeForGame:andPlayer:withAchievement:", v15, v16, a1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[GKHostedChallengeIssueController hostedIssueControllerWithChallenge:players:defaultMessage:completionHandler:](GKHostedChallengeIssueController, "hostedIssueControllerWithChallenge:players:defaultMessage:completionHandler:", v17, v9, v8, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = (_QWORD *)MEMORY[0x1E0D25460];
    if (!*MEMORY[0x1E0D25460])
      v20 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      -[GKScore(GKChallenge) challengeComposeControllerWithMessage:players:completionHandler:].cold.2();
    if (!*v19)
      v21 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25448], OS_LOG_TYPE_ERROR))
      -[GKScore(GKChallenge) challengeComposeControllerWithMessage:players:completionHandler:].cold.1();
    objc_msgSend(MEMORY[0x1E0D25280], "challengesNotSupportedAlertController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      (*((void (**)(id, void *, _QWORD, _QWORD))v10 + 2))(v10, v18, 0, 0);
  }

  return v18;
}

- (id)challengeComposeControllerWithPlayers:()GKChallenge message:completionHandler:
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (GKApplicationLinkedOnOrAfter())
  {
    if (!*MEMORY[0x1E0D25460])
      v11 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25448], OS_LOG_TYPE_ERROR))
      -[GKAchievement(GKChallenge) challengeComposeControllerWithPlayers:message:completionHandler:].cold.1();
    v12 = 0;
  }
  else
  {
    objc_msgSend(v8, "_gkIncompletePlayersFromPlayerIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __94__GKAchievement_GKChallenge__challengeComposeControllerWithPlayers_message_completionHandler___block_invoke;
    v15[3] = &unk_1E59C8E10;
    v16 = v10;
    objc_msgSend(a1, "challengeComposeControllerWithMessage:players:completionHandler:", v9, v13, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

+ (uint64_t)reportAchievements:()GKChallenge withEligibleChallenges:withCompletionHandler:
{
  return objc_msgSend(a1, "reportAchievements:whileScreeningChallenges:withEligibleChallenges:withCompletionHandler:", a3, 1, a4, a5);
}

- (void)issueChallengeToPlayers:()GKChallenge message:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if (GKApplicationLinkedOnOrAfter())
  {
    if (!*MEMORY[0x1E0D25460])
      v8 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25448], OS_LOG_TYPE_ERROR))
      -[GKAchievement(GKChallenge) issueChallengeToPlayers:message:].cold.1();
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0D25280];
    objc_msgSend(a1, "game");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "challengeForGame:andPlayer:withAchievement:", v10, v11, a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v6, "count");
    if (v13 >= 3)
      v14 = 3;
    else
      v14 = v13;
    objc_msgSend(v6, "subarrayWithRange:", 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "_gkIncompletePlayersFromPlayerIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKHostedChallengeIssueController presentHostedIssueControllerWithChallenge:players:defaultMessage:](GKHostedChallengeIssueController, "presentHostedIssueControllerWithChallenge:players:defaultMessage:", v12, v16, v7);

    v6 = v15;
  }

}

- (void)selectChallengeablePlayerIDs:()GKChallenge withCompletionHandler:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  if (!GKApplicationLinkedOnOrAfter())
  {
    objc_msgSend(v6, "_gkIncompletePlayersFromPlayerIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __81__GKAchievement_GKChallenge__selectChallengeablePlayerIDs_withCompletionHandler___block_invoke;
    v11[3] = &unk_1E59C8E38;
    v12 = v7;
    objc_msgSend(a1, "selectChallengeablePlayers:withCompletionHandler:", v10, v11);

    v9 = v12;
    goto LABEL_8;
  }
  if (!*MEMORY[0x1E0D25460])
    v8 = (id)GKOSLoggers();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25448], OS_LOG_TYPE_ERROR))
  {
    -[GKAchievement(GKChallenge) selectChallengeablePlayerIDs:withCompletionHandler:].cold.1();
    if (!v7)
      goto LABEL_9;
    goto LABEL_6;
  }
  if (v7)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 34, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v9);
LABEL_8:

  }
LABEL_9:

}

- (void)selectChallengeablePlayers:()GKChallenge withCompletionHandler:
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD block[4];
  id v20;
  _QWORD *v21;
  uint64_t *v22;
  _QWORD v23[4];
  id v24;
  NSObject *v25;
  _QWORD *v26;
  uint64_t *v27;
  _QWORD v28[5];
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("GKChallenge+UI.m"), 505, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("players"));

  }
  v9 = dispatch_group_create();
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__12;
  v34 = __Block_byref_object_dispose__12;
  v35 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__12;
  v28[4] = __Block_byref_object_dispose__12;
  v29 = 0;
  v10 = objc_msgSend(a1, "isReplayable");
  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v7);
    v13 = (void *)v31[5];
    v31[5] = v12;
  }
  else
  {
    dispatch_group_enter(v9);
    v14 = (void *)MEMORY[0x1E0D25240];
    objc_msgSend(a1, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "game");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v11;
    v23[1] = 3221225472;
    v23[2] = __79__GKAchievement_GKChallenge__selectChallengeablePlayers_withCompletionHandler___block_invoke;
    v23[3] = &unk_1E59C8E60;
    v26 = v28;
    v24 = v7;
    v27 = &v30;
    v25 = v9;
    objc_msgSend(v14, "loadAchievementWithID:forGame:players:complete:", v15, v16, v24, v23);

    v13 = v24;
  }

  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __79__GKAchievement_GKChallenge__selectChallengeablePlayers_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E59C4A50;
  v20 = v8;
  v21 = v28;
  v22 = &v30;
  v17 = v8;
  dispatch_group_notify(v9, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);

}

- (void)challengeComposeControllerWithPlayers:()GKChallenge message:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_0(&dword_1AB361000, v0, v1, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_11();
}

- (void)issueChallengeToPlayers:()GKChallenge message:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_0(&dword_1AB361000, v0, v1, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_11();
}

- (void)selectChallengeablePlayerIDs:()GKChallenge withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_0(&dword_1AB361000, v0, v1, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_11();
}

@end
