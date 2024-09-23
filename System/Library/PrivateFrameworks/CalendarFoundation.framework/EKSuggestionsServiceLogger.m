@implementation EKSuggestionsServiceLogger

+ (void)logEventShowedNotificationWithUniqueKey:(id)a3
{
  id v3;
  id v4;

  if (a3)
  {
    v3 = a3;
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v3, 8, 4);

  }
}

+ (void)logEventEngagedNotificationWithUniqueKey:(id)a3
{
  id v3;
  id v4;

  if (a3)
  {
    v3 = a3;
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v3, 8, 5);

  }
}

+ (void)logEventDismissedNotificationWithUniqueKey:(id)a3
{
  id v3;
  id v4;

  if (a3)
  {
    v3 = a3;
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v3, 8, 8);

  }
}

+ (void)logEventRejectedNotificationWithUniqueKey:(id)a3
{
  id v3;
  id v4;

  if (a3)
  {
    v3 = a3;
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v3, 8, 7);

  }
}

+ (void)logEventConfirmedNotificationWithUniqueKey:(id)a3
{
  id v3;
  id v4;

  if (a3)
  {
    v3 = a3;
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v3, 8, 6);

  }
}

+ (void)logEventConfirmedInboxWithUniqueKey:(id)a3
{
  id v3;
  id v4;

  if (a3)
  {
    v3 = a3;
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v3, 9, 6);

  }
}

+ (void)logEventRejectedInboxWithUniqueKey:(id)a3
{
  id v3;
  id v4;

  if (a3)
  {
    v3 = a3;
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v3, 9, 7);

  }
}

+ (void)logEventShowedDetailsWithUniqueKey:(id)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v5 = a3;
  v3 = +[CalEntitlementsVerifier currentProcessIsFirstPartyCalendarApp](CalEntitlementsVerifier, "currentProcessIsFirstPartyCalendarApp");
  if (v5 && v3)
  {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v5, 10, 4);

  }
}

+ (void)logEventConfirmedDetailsWithUniqueKey:(id)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v5 = a3;
  v3 = +[CalEntitlementsVerifier currentProcessIsFirstPartyCalendarApp](CalEntitlementsVerifier, "currentProcessIsFirstPartyCalendarApp");
  if (v5 && v3)
  {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v5, 10, 6);

  }
}

+ (void)logEventRejectedDetailsWithUniqueKey:(id)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v5 = a3;
  v3 = +[CalEntitlementsVerifier currentProcessIsFirstPartyCalendarApp](CalEntitlementsVerifier, "currentProcessIsFirstPartyCalendarApp");
  if (v5 && v3)
  {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v5, 10, 7);

  }
}

+ (void)logEventShowedTimeToLeaveNotificationWithUniqueKey:(id)a3
{
  id v3;
  id v4;

  if (a3)
  {
    v3 = a3;
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v3, 18, 4);

  }
}

+ (Class)_SGSuggestionsServiceClass
{
  return (Class)EKWeakLinkClass(CFSTR("SGSuggestionsService"), 0x11uLL);
}

@end
