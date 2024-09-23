@implementation GKChallengeServicePrivateInterface

+ (id)interfaceProtocol
{
  return &unk_1EF4D33D0;
}

+ (void)configureInterface:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_getActiveLeaderboardChallengeDetailsForPlayerID_bundleID_allowStaleChallengeDetailsData_completionHandler_, 0, 1);

}

@end
