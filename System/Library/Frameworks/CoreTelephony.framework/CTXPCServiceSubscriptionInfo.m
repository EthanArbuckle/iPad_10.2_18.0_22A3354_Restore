@implementation CTXPCServiceSubscriptionInfo

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSubscriptions:", v6);

  return v4;
}

- (void)setSubscriptions:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptions, a3);
}

- (id)redactedDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  const char *v9;
  void *v10;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR(" subscriptions="));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(obj);
        if (v6 + i)
          v9 = ", ";
        else
          v9 = "";
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "redactedDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%s%@"), v9, v10);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v6 += i;
    }
    while (v5);
  }

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (NSArray)subscriptionsInUse
{
  void *v3;
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

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isSimPresent"))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" subscriptions=%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (NSArray)subscriptions
{
  return self->_subscriptions;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_subscriptions, CFSTR("subscriptions"));
}

- (CTXPCServiceSubscriptionInfo)initWithCoder:(id)a3
{
  id v4;
  CTXPCServiceSubscriptionInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *subscriptions;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTXPCServiceSubscriptionInfo;
  v5 = -[CTXPCServiceSubscriptionInfo init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("subscriptions"));
    v9 = objc_claimAutoreleasedReturnValue();
    subscriptions = v5->_subscriptions;
    v5->_subscriptions = (NSArray *)v9;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionsValid, 0);
  objc_storeStrong((id *)&self->_subscriptionsInUse, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
}

- (NSArray)subscriptionsValid
{
  void *v3;
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

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CTXPCServiceSubscriptionInfo subscriptions](self, "subscriptions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isSimPresent") && objc_msgSend(v9, "isSimGood"))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  CTXPCServiceSubscriptionInfo *v4;
  NSArray *subscriptions;
  void *v6;
  void *v7;
  char v8;

  v4 = (CTXPCServiceSubscriptionInfo *)a3;
  if (v4 == self)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = 0;
    goto LABEL_9;
  }
  subscriptions = self->_subscriptions;
  if (subscriptions)
    goto LABEL_6;
  -[CTXPCServiceSubscriptionInfo subscriptions](v4, "subscriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_7:
    v8 = 1;
    goto LABEL_9;
  }
  subscriptions = self->_subscriptions;
LABEL_6:
  -[CTXPCServiceSubscriptionInfo subscriptions](v4, "subscriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSArray isEqualToArray:](subscriptions, "isEqualToArray:", v7);

LABEL_9:
  return v8;
}

- (void)setSubscriptionsInUse:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionsInUse, a3);
}

- (void)setSubscriptionsValid:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionsValid, a3);
}

@end
