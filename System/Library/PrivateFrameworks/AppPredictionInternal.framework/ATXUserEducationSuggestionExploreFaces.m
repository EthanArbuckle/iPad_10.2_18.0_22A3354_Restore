@implementation ATXUserEducationSuggestionExploreFaces

void __64__ATXUserEducationSuggestionExploreFaces_Internal__logFeedback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  objc_super v7;

  v2 = *(_QWORD *)(a1 + 32);
  v7.receiver = *(id *)(a1 + 40);
  v7.super_class = (Class)&off_1EF9DA330;
  objc_msgSendSuper2(&v7, sel_logFeedback_, v2);
  v3 = objc_msgSend(*(id *)(a1 + 32), "feedbackType");
  if (v3 == 6 || v3 == 4)
  {
    +[ATXUserEducationSuggestionServer sharedInstance](ATXUserEducationSuggestionServer, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exploreFacesServer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelBacklightEventSubscription");
  }
  else
  {
    if (v3 != 1)
      return;
    +[ATXUserEducationSuggestionServer sharedInstance](ATXUserEducationSuggestionServer, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exploreFacesServer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startUpSubscriberToBacklightBiomeStreamForTheFirstTime");
  }

}

@end
