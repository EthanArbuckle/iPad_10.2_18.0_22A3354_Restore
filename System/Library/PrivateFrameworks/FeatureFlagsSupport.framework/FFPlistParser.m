@implementation FFPlistParser

- (id)parseSubscriptionsFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SubscriptionClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SubscriptionContents"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v4, "isEqualToString:", CFSTR("FFMinimumPhaseInReleaseSubscription")))
  {
    +[FFMinimumPhaseInReleaseSubscription decodeFromDictionary:](FFMinimumPhaseInReleaseSubscription, "decodeFromDictionary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
