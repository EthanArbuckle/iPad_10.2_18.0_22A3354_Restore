@implementation GKScore

void __88__GKScore_GKChallenge__challengeComposeControllerWithMessage_players_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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

uint64_t __88__GKScore_GKChallenge__challengeComposeControllerWithPlayers_message_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
