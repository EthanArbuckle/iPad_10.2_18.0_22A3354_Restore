@implementation IDSPhoneSubscription

+ (id)CTSIMSFromPhoneSubscriptions:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          sub_190720F24(*(void **)(*((_QWORD *)&v13 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v4, "addObject:", v10, (_QWORD)v13);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    v11 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

+ (id)phoneSubscriptionsFromCTSIMs:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          +[IDSPhoneSubscription phoneSubscriptionWithSIM:](IDSPhoneSubscription, "phoneSubscriptionWithSIM:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    v11 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

+ (id)phoneSubscriptionWithSIM:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v4 = a3;
    v5 = objc_msgSend(v4, "slot");
    v6 = 1;
    if (v5 == 1)
      v6 = 2;
    if (v5 == 2)
      v7 = 0;
    else
      v7 = v6;
    objc_msgSend(v4, "SIMIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "phoneSubscriptionWithSubscriptionSlot:andLabelID:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (IDSPhoneSubscription)initWithSubscriptionSlot:(int64_t)a3 labelID:(id)a4
{
  id v7;
  IDSPhoneSubscription *v8;
  IDSPhoneSubscription *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IDSPhoneSubscription;
  v8 = -[IDSPhoneSubscription init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_subscriptionSlot = a3;
    objc_storeStrong((id *)&v8->_labelID, a4);
  }

  return v9;
}

+ (id)phoneSubscriptionWithSubscriptionSlot:(int64_t)a3 andLabelID:(id)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;

  v6 = a4;
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "length") != 0;
  else
    v8 = 0;
  v9 = 0;
  if ((unint64_t)(a3 - 1) < 2)
    v8 = 1;
  if ((unint64_t)a3 <= 2 && v8)
    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSubscriptionSlot:labelID:", a3, v7);

  return v9;
}

+ (id)phoneSubscriptionWithSubscriptionSlot:(int64_t)a3
{
  return (id)objc_msgSend(a1, "phoneSubscriptionWithSubscriptionSlot:andLabelID:", a3, 0);
}

+ (id)phoneSubscriptionWithLabelID:(id)a3
{
  return (id)objc_msgSend(a1, "phoneSubscriptionWithSubscriptionSlot:andLabelID:", 0, a3);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; slot: %d; labelID: %@>"),
               objc_opt_class(),
               self,
               self->_subscriptionSlot,
               self->_labelID);
}

- (BOOL)isEqual:(id)a3
{
  IDSPhoneSubscription *v4;
  BOOL v5;

  v4 = (IDSPhoneSubscription *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[IDSPhoneSubscription isEqualToPhoneSubscription:](self, "isEqualToPhoneSubscription:", v4);
  }

  return v5;
}

- (BOOL)isEqualToPhoneSubscription:(id)a3
{
  _QWORD *v4;
  NSString *labelID;
  char v6;

  v4 = a3;
  if (self->_subscriptionSlot == v4[1])
  {
    labelID = self->_labelID;
    if (labelID == (NSString *)v4[2])
      v6 = 1;
    else
      v6 = -[NSString isEqual:](labelID, "isEqual:");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  int64_t subscriptionSlot;

  subscriptionSlot = self->_subscriptionSlot;
  return -[NSString hash](self->_labelID, "hash") ^ subscriptionSlot;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t subscriptionSlot;
  id v5;

  subscriptionSlot = self->_subscriptionSlot;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", subscriptionSlot, CFSTR("subSlot"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_labelID, CFSTR("subLableID"));

}

- (IDSPhoneSubscription)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  IDSPhoneSubscription *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("subSlot"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subLableID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[IDSPhoneSubscription initWithSubscriptionSlot:labelID:](self, "initWithSubscriptionSlot:labelID:", v5, v6);
  return v7;
}

- (int64_t)subscriptionSlot
{
  return self->_subscriptionSlot;
}

- (void)setSubscriptionSlot:(int64_t)a3
{
  self->_subscriptionSlot = a3;
}

- (NSString)labelID
{
  return self->_labelID;
}

- (void)setLabelID:(id)a3
{
  objc_storeStrong((id *)&self->_labelID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelID, 0);
}

@end
