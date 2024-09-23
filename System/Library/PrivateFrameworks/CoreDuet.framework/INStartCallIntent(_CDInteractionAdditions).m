@implementation INStartCallIntent(_CDInteractionAdditions)

- (id)cd_sender
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "contacts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3 == 1)
  {
    objc_msgSend(a1, "contacts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)cd_derivedIntentIdentifier
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "notificationThreadIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v6 = 0;
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  objc_msgSend(a1, "notificationThreadIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
  {
    v6 = 0;
    v2 = 0;
    goto LABEL_8;
  }
  NSStringFromSelector(sel_notificationThreadIdentifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "notificationThreadIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _CDNormalizeString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v6 && v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%@)"), v2, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:

  return v7;
}

- (uint64_t)cd_interactionMechanism
{
  if (objc_msgSend(a1, "callCapability") == 1 && objc_msgSend(a1, "preferredCallProvider") == 1)
    return 16;
  if (objc_msgSend(a1, "callCapability") == 1 && objc_msgSend(a1, "preferredCallProvider") == 2)
    return 11;
  if (objc_msgSend(a1, "callCapability") == 1)
    return 0;
  if (objc_msgSend(a1, "callCapability") == 2 && objc_msgSend(a1, "preferredCallProvider") == 2)
    return 17;
  if (objc_msgSend(a1, "callCapability") == 2)
    return 12;
  return 16;
}

- (uint64_t)cd_groupName
{
  return 0;
}

@end
