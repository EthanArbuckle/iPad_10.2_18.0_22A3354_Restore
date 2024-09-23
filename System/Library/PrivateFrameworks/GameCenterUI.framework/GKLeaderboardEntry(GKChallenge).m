@implementation GKLeaderboardEntry(GKChallenge)

- (id)challengeComposeControllerWithMessage:()GKChallenge players:completionHandler:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "_gkScore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "challengeComposeControllerWithMessage:players:completionHandler:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)challengeComposeControllerWithMessage:()GKChallenge players:completion:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "_gkScore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "challengeComposeControllerWithMessage:players:completion:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
