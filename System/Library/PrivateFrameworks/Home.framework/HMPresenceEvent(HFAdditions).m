@implementation HMPresenceEvent(HFAdditions)

+ (uint64_t)hf_locationEventTypeForPresenceEventType:()HFAdditions
{
  void *v4;

  if ((unint64_t)(a3 - 1) < 4)
    return qword_1DD6694F0[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Unexpected event type %@"), v4);

  return 0;
}

+ (uint64_t)hf_presenceDisableReasonsForHome:()HFAdditions
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;

  v3 = a3;
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeAccessControlForUser:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "presenceComputationStatus");
  v7 = objc_msgSend(v3, "hf_supportsSharedEventAutomation");

  v8 = v7 ^ 1u;
  if (v6 == 2
    && +[HFUtilities supportsBeingCurrentLocationDevice](HFUtilities, "supportsBeingCurrentLocationDevice"))
  {
    v8 |= 2uLL;
  }
  if (+[HFUtilities supportsBeingCurrentLocationDevice](HFUtilities, "supportsBeingCurrentLocationDevice"))
  {
    +[HFLocationManagerDispatcher sharedDispatcher](HFLocationManagerDispatcher, "sharedDispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "authorizationStatus");

    if ((v10 - 3) >= 2)
      v8 |= 2uLL;
  }

  return v8;
}

- (uint64_t)hf_activationGranularity
{
  uint64_t v2;
  void *v4;

  v2 = objc_msgSend(a1, "presenceEventType");
  if ((unint64_t)(v2 - 1) < 4)
    return qword_1DD669510[v2 - 1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "presenceEventType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Unexpected event type %@"), v4);

  return 0;
}

- (uint64_t)hf_eventType
{
  return objc_msgSend((id)objc_opt_class(), "hf_locationEventTypeForPresenceEventType:", objc_msgSend(a1, "presenceEventType"));
}

@end
