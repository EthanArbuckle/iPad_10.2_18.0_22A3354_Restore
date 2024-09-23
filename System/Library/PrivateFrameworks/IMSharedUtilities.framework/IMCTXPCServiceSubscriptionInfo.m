@implementation IMCTXPCServiceSubscriptionInfo

- (id)subscriptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[IMCTXPCServiceSubscriptionInfo subscriptionInfo](self, "subscriptionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscriptionsInUse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMCTXPCServiceSubscriptionInfo subscriptionFilterPredicate](self, "subscriptionFilterPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v8 = v6;

  return v8;
}

- (CTXPCServiceSubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (id)subscriptionFilterPredicate
{
  return (id)MEMORY[0x1E0DE7D20](MEMORY[0x1E0CB3880], sel_predicateWithBlock_);
}

- (id)preferredOrDefaultSubscriptionContext
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[IMCTXPCServiceSubscriptionInfo __im_preferredSubscriptionContext](self, "__im_preferredSubscriptionContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[IMCTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v9, "phoneNumber");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "length"))
          {

LABEL_14:
            v3 = v9;
            goto LABEL_15;
          }
          objc_msgSend(v9, "labelID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "length");

          if (v12)
            goto LABEL_14;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v3 = 0;
        if (v6)
          continue;
        break;
      }
    }
    else
    {
      v3 = 0;
    }
LABEL_15:

  }
  return v3;
}

- (IMCTXPCServiceSubscriptionInfo)initWithSubscriptionInfo:(id)a3
{
  id v5;
  IMCTXPCServiceSubscriptionInfo *v6;
  IMCTXPCServiceSubscriptionInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMCTXPCServiceSubscriptionInfo;
  v6 = -[IMCTXPCServiceSubscriptionInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_subscriptionInfo, a3);

  return v7;
}

- (id)allSubscriptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[IMCTXPCServiceSubscriptionInfo subscriptionInfo](self, "subscriptionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMCTXPCServiceSubscriptionInfo subscriptionFilterPredicate](self, "subscriptionFilterPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v8 = v6;

  return v8;
}

- (id)__im_subscriptionContextOrDefaultForForSimID:(id)a3 phoneNumber:(id)a4
{
  void *v5;

  -[IMCTXPCServiceSubscriptionInfo __im_subscriptionContextForForSimID:phoneNumber:](self, "__im_subscriptionContextForForSimID:phoneNumber:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[IMCTXPCServiceSubscriptionInfo preferredOrDefaultSubscriptionContext](self, "preferredOrDefaultSubscriptionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)__im_subscriptionContextForForSimID:(id)a3 phoneNumber:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  id v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length") || objc_msgSend(v6, "length"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[IMCTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    v9 = 0;
    if (v8)
    {
      v10 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "phoneNumber");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "length") && objc_msgSend(v7, "length"))
          {
            objc_msgSend(v12, "phoneNumber");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = MEMORY[0x1A1AE7F68](v14, v7);

          }
          else
          {
            v15 = 0;
          }

          if (objc_msgSend(v6, "length"))
          {
            objc_msgSend(v12, "labelID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqualToString:", v6);

            if ((v15 & 1) != 0)
              goto LABEL_20;
            if (v17)
            {
              v18 = v12;

              v9 = v18;
            }
          }
          else if ((v15 & 1) != 0)
          {
LABEL_20:
            v8 = v12;
            goto LABEL_21;
          }
        }
        v8 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_21:

  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  if (v8)
    v19 = v8;
  else
    v19 = v9;
  v20 = v19;

  return v20;
}

- (id)__im_preferredSubscriptionContext
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[IMCTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "phoneNumber");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "length");
        if (v9
          || (objc_msgSend(v7, "labelID"), v2 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v2, "length")))
        {
          objc_msgSend(v7, "userDefaultVoice");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "BOOLValue");

          if (v9)
          {

            if (v11)
              goto LABEL_17;
          }
          else
          {

            if ((v11 & 1) != 0)
            {
LABEL_17:
              v4 = v7;
              goto LABEL_18;
            }
          }
        }
        else
        {

        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_18:

  return v4;
}

- (BOOL)__im_hasMultipleSubscriptions
{
  void *v2;
  BOOL v3;

  -[IMCTXPCServiceSubscriptionInfo allSubscriptions](self, "allSubscriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 2;

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMCTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMCTXPCServiceSubscriptionInfo allSubscriptions](self, "allSubscriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("IMCTXPCServiceSubscriptionInfo: activeSubscriptions %@ allSubscriptions: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)__im_subscriptionsWithMMSSupport
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[IMCTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "phoneNumber");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "labelID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = +[IMCTSMSUtilities IMMMSSupportedAndConfiguredForPhoneNumber:simID:](IMCTSMSUtilities, "IMMMSSupportedAndConfiguredForPhoneNumber:simID:", v10, v11);

        if (v12)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)__im_subscriptionsWithRCSSupport
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[IMCTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        +[IMCTRCSUtilitiesManager sharedManager](IMCTRCSUtilitiesManager, "sharedManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "phoneNumber");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "labelID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v9, "supportedForPhoneNumber:simID:", v10, v11);

        if (v12)
          objc_msgSend(v14, "addObject:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  return v14;
}

- (BOOL)__im_containsPhoneNumber:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[IMCTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v9, "phoneNumber");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "length"))
          {
            objc_msgSend(v9, "phoneNumber");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = MEMORY[0x1A1AE7F68](v11, v4);

            if ((v12 & 1) != 0)
            {
              LOBYTE(v6) = 1;
              goto LABEL_15;
            }
          }
          else
          {

          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }
LABEL_15:

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)__im_onlyHasActiveSlots
{
  void *v2;
  BOOL v3;

  -[IMCTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 2;

  return v3;
}

- (NSArray)phoneNumbersOfActiveSubscriptions
{
  NSArray *phoneNumbersOfActiveSubscriptions;
  id v4;
  void *v5;
  NSArray *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  phoneNumbersOfActiveSubscriptions = self->_phoneNumbersOfActiveSubscriptions;
  if (!phoneNumbersOfActiveSubscriptions)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[IMCTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSArray *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[IMCTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v12, "phoneNumber");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "length"))
          {
            objc_msgSend(v12, "phoneNumber");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            IMChatCanonicalIDSIDsForAddress(v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "_stripFZIDPrefix");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
              v17 = v16;
            else
              v17 = v13;
            -[NSArray addObject:](v6, "addObject:", v17);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

    v18 = self->_phoneNumbersOfActiveSubscriptions;
    self->_phoneNumbersOfActiveSubscriptions = v6;

    phoneNumbersOfActiveSubscriptions = self->_phoneNumbersOfActiveSubscriptions;
  }
  return phoneNumbersOfActiveSubscriptions;
}

- (id)__im_preferredDataSubscriptionContext
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[IMCTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "phoneNumber");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "length");
        if (v9
          || (objc_msgSend(v7, "labelID"), v2 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v2, "length")))
        {
          objc_msgSend(v7, "userDataPreferred");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "BOOLValue");

          if (v9)
          {

            if (v11)
              goto LABEL_17;
          }
          else
          {

            if ((v11 & 1) != 0)
            {
LABEL_17:
              v4 = v7;
              goto LABEL_18;
            }
          }
        }
        else
        {

        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_18:

  return v4;
}

- (id)__im_switchSubscriptionContextFromSubscriptionContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    goto LABEL_14;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[IMCTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v6)
  {

LABEL_14:
    -[IMCTXPCServiceSubscriptionInfo preferredOrDefaultSubscriptionContext](self, "preferredOrDefaultSubscriptionContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      v12 = objc_msgSend(v11, "slotID");
      if (v12 != objc_msgSend(v4, "slotID"))
      {
        v13 = v11;

        v8 = v13;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v7);

  if (!v8)
    goto LABEL_14;
LABEL_15:

  return v8;
}

- (id)__im_switchSubscriptionContextFromPhoneNumber:(id)a3 simID:(id)a4
{
  void *v5;
  void *v6;

  -[IMCTXPCServiceSubscriptionInfo __im_subscriptionContextForForSimID:phoneNumber:](self, "__im_subscriptionContextForForSimID:phoneNumber:", a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMCTXPCServiceSubscriptionInfo __im_switchSubscriptionContextFromSubscriptionContext:](self, "__im_switchSubscriptionContextFromSubscriptionContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)__im_phoneNumberForSlotID:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[IMCTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "slotID") == a3)
        {
          objc_msgSend(v9, "phoneNumber");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          IMChatCanonicalIDSIDsForAddress(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "_stripFZIDPrefix");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)__im_phoneNumberForSlotIDOrDefault:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[IMCTXPCServiceSubscriptionInfo __im_phoneNumberForSlotID:](self, "__im_phoneNumberForSlotID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    -[IMCTXPCServiceSubscriptionInfo preferredOrDefaultSubscriptionContext](self, "preferredOrDefaultSubscriptionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "phoneNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    IMChatCanonicalIDSIDsForAddress(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_stripFZIDPrefix");
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  return v4;
}

- (id)__im_labelForPhoneNumber:(id)a3 simID:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[IMCTXPCServiceSubscriptionInfo __im_subscriptionContextForForSimID:phoneNumber:](self, "__im_subscriptionContextForForSimID:phoneNumber:", a4, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(v4, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)__imSlotIDSForPhoneNumber:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[IMCTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        if (v4)
        {
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v11, "phoneNumber");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = IMSharedHelperAreObjectsLogicallySame(v12, v4);

          if (v13)
            v8 = objc_msgSend(v11, "slotID");
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)__imSIMIDForSubscriptionSlot:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[IMCTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "slotID") == a3)
        {
          objc_msgSend(v10, "labelID");
          v11 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)__im_subscriptionContextForForSlotID:(int64_t)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = (id)a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[IMCTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if ((id)objc_msgSend(v9, "slotID") == v3)
          {
            v3 = v9;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
    v3 = 0;
LABEL_12:

  }
  return v3;
}

- (id)__im_subscriptionContextOrDefaultForForSlotID:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[IMCTXPCServiceSubscriptionInfo __im_subscriptionContextForForSlotID:](self, "__im_subscriptionContextForForSlotID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[IMCTXPCServiceSubscriptionInfo preferredOrDefaultSubscriptionContext](self, "preferredOrDefaultSubscriptionContext");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)__im_subscriptionContextForPhoneNumber:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[IMCTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "phoneNumber");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "length"))
          {
            objc_msgSend(v9, "phoneNumber");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = MEMORY[0x1A1AE7F68](v11, v4);

            if (v12)
            {
              v6 = v9;
              goto LABEL_15;
            }
          }
          else
          {

          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }
LABEL_15:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)__im_subscriptionContextForForSimID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[IMCTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "labelID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "length"))
          {
            objc_msgSend(v9, "labelID");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "isEqualToString:", v4);

            if (v12)
            {
              v6 = v9;
              goto LABEL_15;
            }
          }
          else
          {

          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }
LABEL_15:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)__im_subscriptionContextForPhoneNumberOrDefault:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  IMCTXPCServiceSubscriptionInfo *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v16 = self;
    -[IMCTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        if (MEMORY[0x1A1AE7D10](v4))
        {
          objc_msgSend(v10, "phoneNumber");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "length"))
          {
            v12 = (void *)MEMORY[0x1E0D34CC8];
            objc_msgSend(v10, "phoneNumber");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v12) = objc_msgSend(v12, "isPhoneNumber:equivalentToExistingPhoneNumber:", v13, v4);

            if ((v12 & 1) != 0)
            {
              v14 = v10;

              self = v16;
              if (v14)
                goto LABEL_17;
              goto LABEL_16;
            }
          }
          else
          {

          }
        }
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v7)
            goto LABEL_4;
          break;
        }
      }
    }

    self = v16;
  }
LABEL_16:
  -[IMCTXPCServiceSubscriptionInfo preferredOrDefaultSubscriptionContext](self, "preferredOrDefaultSubscriptionContext");
  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v14;
}

- (id)__im_subscriptionContextForSenderIdentity:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[IMCTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (+[IMSenderIdentityManager isTUSenderIdentity:equalToSubscriptionContext:](IMSenderIdentityManager, "isTUSenderIdentity:equalToSubscriptionContext:", v4, v9))
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_senderIdentityManager
{
  return +[IMSenderIdentityManager sharedInstance](IMSenderIdentityManager, "sharedInstance");
}

- (id)__im_contactPreferredSubscriptionContextForChatHandleIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[IMCTXPCServiceSubscriptionInfo _senderIdentityManager](self, "_senderIdentityManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bestSenderIdentityForHandleIDs:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[IMCTXPCServiceSubscriptionInfo __im_subscriptionContextForSenderIdentity:](self, "__im_subscriptionContextForSenderIdentity:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setPhoneNumbersOfActiveSubscriptions:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumbersOfActiveSubscriptions, a3);
}

- (void)setSubscriptionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
  objc_storeStrong((id *)&self->_phoneNumbersOfActiveSubscriptions, 0);
}

@end
