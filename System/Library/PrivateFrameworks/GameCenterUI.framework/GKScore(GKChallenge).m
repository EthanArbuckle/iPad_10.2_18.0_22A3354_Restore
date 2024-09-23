@implementation GKScore(GKChallenge)

- (id)challengeComposeControllerWithMessage:()GKChallenge players:completionHandler:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  _QWORD *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;

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
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __88__GKScore_GKChallenge__challengeComposeControllerWithMessage_players_completionHandler___block_invoke;
    v19[3] = &unk_1E59C8E10;
    v20 = v10;
    objc_msgSend(a1, "challengeComposeControllerWithMessage:players:completion:", v8, v9, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (_QWORD *)MEMORY[0x1E0D25460];
    if (!*MEMORY[0x1E0D25460])
      v16 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      -[GKScore(GKChallenge) challengeComposeControllerWithMessage:players:completionHandler:].cold.2();
    if (!*v15)
      v17 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25448], OS_LOG_TYPE_ERROR))
      -[GKScore(GKChallenge) challengeComposeControllerWithMessage:players:completionHandler:].cold.1();
    objc_msgSend(MEMORY[0x1E0D25280], "challengesNotSupportedAlertController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      (*((void (**)(id, void *, _QWORD, _QWORD))v10 + 2))(v10, v14, 0, 0);
  }

  return v14;
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
    objc_msgSend(v14, "challengeForGame:andPlayer:withScore:", v15, v16, a1);
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
      -[GKScore(GKChallenge) challengeComposeControllerWithPlayers:message:completionHandler:].cold.1();
    v12 = 0;
  }
  else
  {
    objc_msgSend(v8, "_gkIncompletePlayersFromPlayerIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __88__GKScore_GKChallenge__challengeComposeControllerWithPlayers_message_completionHandler___block_invoke;
    v15[3] = &unk_1E59C8E10;
    v16 = v10;
    objc_msgSend(a1, "challengeComposeControllerWithMessage:players:completionHandler:", v9, v13, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

+ (uint64_t)reportScores:()GKChallenge withEligibleChallenges:withCompletionHandler:
{
  return objc_msgSend(a1, "reportScores:whileScreeningChallenges:withEligibleChallenges:withCompletionHandler:", a3, 1, a4, a5);
}

+ (void)reportLeaderboardScores:()GKChallenge withEligibleChallenges:withCompletionHandler:
{
  void *v7;
  id v8;
  id v9;
  id v10;

  v7 = (void *)MEMORY[0x1E0D25320];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "convertToGKScore:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "reportScores:withEligibleChallenges:withCompletionHandler:", v10, v9, v8);

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
      -[GKScore(GKChallenge) issueChallengeToPlayers:message:].cold.1();
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0D25280];
    objc_msgSend(a1, "game");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "challengeForGame:andPlayer:withScore:", v10, v11, a1);
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

- (void)challengeComposeControllerWithMessage:()GKChallenge players:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1AB361000, v0, v1, "To use Challenges related features, please opt in for your game on App Store Connect.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)challengeComposeControllerWithMessage:()GKChallenge players:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1AB361000, v0, v1, "Developer tried to issue a challenge while this game has not enabled Challenge feature on Apple Store Connect", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
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

@end
