@implementation WBSParsecDSession

+ (void)sendLaunchFeedbackWithEvent:(char)a3 isPrivate:(char)a4 usesLoweredSearchBar:
{
  uint64_t v7;
  NSObject *v8;
  _QWORD block[6];
  char v10;

  objc_opt_self();
  if ((a3 & 1) == 0)
  {
    v7 = objc_msgSend(MEMORY[0x1E0D8A860], "currentQueryID");
    dispatch_get_global_queue(-32768, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__WBSParsecDSession_FeedbackHelpers__sendLaunchFeedbackWithEvent_isPrivate_usesLoweredSearchBar___block_invoke;
    block[3] = &__block_descriptor_49_e5_v8__0l;
    block[4] = a2;
    block[5] = v7;
    v10 = a4;
    dispatch_async(v8, block);

  }
}

void __97__WBSParsecDSession_FeedbackHelpers__sendLaunchFeedbackWithEvent_isPrivate_usesLoweredSearchBar___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[UniversalSearchSession sharedSession](UniversalSearchSession, "sharedSession");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "feedbackDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchViewAppearedBecauseOfEvent:forQueryID:usesLoweredSearchBar:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

+ (void)sendSuspendFeedbackWithEvent:(char)a3 isPrivate:
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_opt_self();
  if ((a3 & 1) == 0)
  {
    v5 = objc_msgSend(MEMORY[0x1E0D8A860], "currentQueryID");
    +[UniversalSearchSession sharedSession](UniversalSearchSession, "sharedSession");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "feedbackDispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchViewDisappearedBecauseOfEvent:forQueryID:", a2, v5);

    objc_msgSend(v8, "feedbackDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "flush");

  }
}

@end
