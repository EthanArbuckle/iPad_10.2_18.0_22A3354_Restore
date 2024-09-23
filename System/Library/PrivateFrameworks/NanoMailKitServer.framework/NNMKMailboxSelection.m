@implementation NNMKMailboxSelection

- (NNMKMailboxSelection)initWithAccounts:(id)a3
{
  id v4;
  NNMKMailboxSelection *v5;
  NNMKMailboxSelection *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NNMKMailboxSelection;
  v5 = -[NNMKMailboxSelection init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[NNMKMailboxSelection _setupWithAccounts:](v5, "_setupWithAccounts:", v4);

  return v6;
}

- (NNMKMailboxSelection)initWithMailboxes:(id)a3
{
  id v4;
  NNMKMailboxSelection *v5;
  NNMKMailboxSelection *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NNMKMailboxSelection;
  v5 = -[NNMKMailboxSelection init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[NNMKMailboxSelection _setupWithMailboxes:](v5, "_setupWithMailboxes:", v4);

  return v6;
}

- (NNMKMailboxSelection)initWithCoder:(id)a3
{
  id v4;
  NNMKMailboxSelection *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *mailboxesWithAllMessagesSyncEnabled;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *aggregatedMailboxes;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NNMKMailboxSelection;
  v5 = -[NNMKMailboxSelection init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyInboxesFilterTypes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_aggregatedMailboxesFilterTypes = objc_msgSend(v6, "unsignedIntegerValue");

    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("kNSCodingKeyMailboxesWithAllMessagesSyncEnabled"));
    v10 = objc_claimAutoreleasedReturnValue();
    mailboxesWithAllMessagesSyncEnabled = v5->_mailboxesWithAllMessagesSyncEnabled;
    v5->_mailboxesWithAllMessagesSyncEnabled = (NSArray *)v10;

    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("kNSCodingKeyInboxes"));
    v15 = objc_claimAutoreleasedReturnValue();
    aggregatedMailboxes = v5->_aggregatedMailboxes;
    v5->_aggregatedMailboxes = (NSArray *)v15;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NNMKMailboxSelection *v4;
  void *v5;
  NNMKMailboxSelection *v6;

  v4 = [NNMKMailboxSelection alloc];
  -[NNMKMailboxSelection allMailboxesSyncEnabled](self, "allMailboxesSyncEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NNMKMailboxSelection initWithMailboxes:](v4, "initWithMailboxes:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t aggregatedMailboxesFilterTypes;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  aggregatedMailboxesFilterTypes = self->_aggregatedMailboxesFilterTypes;
  v7 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", aggregatedMailboxesFilterTypes);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("kNSCodingKeyInboxesFilterTypes"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_mailboxesWithAllMessagesSyncEnabled, CFSTR("kNSCodingKeyMailboxesWithAllMessagesSyncEnabled"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_aggregatedMailboxes, CFSTR("kNSCodingKeyInboxes"));

}

- (BOOL)hasSelection
{
  return -[NSArray count](self->_mailboxesWithAllMessagesSyncEnabled, "count")
      || -[NSArray count](self->_aggregatedMailboxes, "count") != 0;
}

- (void)_setupWithMailboxes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  unsigned int v16;
  void *v17;
  NNMKMailboxSelection *v18;
  uint64_t v19;
  NSArray *mailboxesWithAllMessagesSyncEnabled;
  uint64_t v21;
  NSArray *aggregatedMailboxes;
  NNMKMailboxSelection *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v23 = self;
  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v5);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v13, "type", v23) == 1)
        {
          v14 = (void *)objc_msgSend(v13, "copy");
          objc_msgSend(v4, "addObject:", v14);

        }
        if ((objc_msgSend(v13, "syncEnabled") & 1) != 0 || objc_msgSend(v13, "syncRequested"))
        {
          if (objc_msgSend(v13, "type") == 1
            && ((objc_msgSend(v13, "syncEnabled") & 1) != 0 || objc_msgSend(v13, "syncRequested")))
          {
            ++v10;
            v15 = objc_msgSend(v13, "filterType");
            v16 = objc_msgSend(v13, "hasFilterType:", 1);
            v9 += v16;
            v8 |= v15 ^ v16;
          }
          if (objc_msgSend(v13, "hasFilterType:", 1))
          {
            v17 = (void *)objc_msgSend(v13, "copy");
            objc_msgSend(v24, "addObject:", v17);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
  }

  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    v18 = v23;
  }
  else
  {
    v18 = v23;
    if (objc_msgSend(v4, "count") == v10)
      v8 |= objc_msgSend(v4, "count") == v9;
  }
  objc_msgSend(v24, "allObjects", v23);
  v19 = objc_claimAutoreleasedReturnValue();
  mailboxesWithAllMessagesSyncEnabled = v18->_mailboxesWithAllMessagesSyncEnabled;
  v18->_mailboxesWithAllMessagesSyncEnabled = (NSArray *)v19;

  v18->_aggregatedMailboxesFilterTypes = v8;
  if (v8)
  {
    objc_msgSend(v4, "allObjects");
    v21 = objc_claimAutoreleasedReturnValue();
    aggregatedMailboxes = v18->_aggregatedMailboxes;
    v18->_aggregatedMailboxes = (NSArray *)v21;

  }
}

- (void)_setupWithAccounts:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "mailboxes", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[NNMKMailboxSelection _setupWithMailboxes:](self, "_setupWithMailboxes:", v5);
}

- (NSSet)mailboxesWithAllMessagesSyncEnabledIds
{
  NSSet *mailboxesWithAllMessagesSyncEnabledIds;
  NSSet *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSSet *v11;
  NSSet *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  mailboxesWithAllMessagesSyncEnabledIds = self->_mailboxesWithAllMessagesSyncEnabledIds;
  if (mailboxesWithAllMessagesSyncEnabledIds)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_mailboxesWithAllMessagesSyncEnabled;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "mailboxId", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSSet addObject:](v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v11 = self->_mailboxesWithAllMessagesSyncEnabledIds;
  self->_mailboxesWithAllMessagesSyncEnabledIds = v4;

  mailboxesWithAllMessagesSyncEnabledIds = self->_mailboxesWithAllMessagesSyncEnabledIds;
  if (mailboxesWithAllMessagesSyncEnabledIds)
  {
LABEL_10:
    v12 = mailboxesWithAllMessagesSyncEnabledIds;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v12 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (NSSet)aggregatedMailboxesId
{
  NSSet *aggregatedMailboxesId;
  NSSet *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSSet *v11;
  NSSet *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  aggregatedMailboxesId = self->_aggregatedMailboxesId;
  if (aggregatedMailboxesId)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_aggregatedMailboxes;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "mailboxId", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSSet addObject:](v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v11 = self->_aggregatedMailboxesId;
  self->_aggregatedMailboxesId = v4;

  aggregatedMailboxesId = self->_aggregatedMailboxesId;
  if (aggregatedMailboxesId)
  {
LABEL_10:
    v12 = aggregatedMailboxesId;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v12 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (NSArray)allMailboxesSyncEnabled
{
  void *v2;
  void *v3;

  -[NNMKMailboxSelection allMailboxesSyncEnabledById](self, "allMailboxesSyncEnabledById");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)hasSingleMailboxSelectionOnly
{
  void *v3;
  void *v4;
  BOOL v5;

  -[NNMKMailboxSelection mailboxesWithAllMessagesSyncEnabled](self, "mailboxesWithAllMessagesSyncEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    -[NNMKMailboxSelection aggregatedMailboxes](self, "aggregatedMailboxes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasAggregateMailboxesForAllMessagesOnly
{
  void *v3;
  unint64_t aggregatedMailboxesFilterTypes;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[NNMKMailboxSelection aggregatedMailboxes](self, "aggregatedMailboxes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {

  }
  else
  {
    aggregatedMailboxesFilterTypes = self->_aggregatedMailboxesFilterTypes;

    if (aggregatedMailboxesFilterTypes == 1)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      -[NNMKMailboxSelection mailboxesWithAllMessagesSyncEnabled](self, "mailboxesWithAllMessagesSyncEnabled");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v23;
LABEL_5:
        v9 = 0;
        while (1)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v5);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v9), "type") != 1)
            break;
          if (v7 == ++v9)
          {
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
            if (v7)
              goto LABEL_5;
            goto LABEL_23;
          }
        }
LABEL_26:
        v16 = 0;
        goto LABEL_27;
      }
      goto LABEL_23;
    }
  }
  -[NNMKMailboxSelection aggregatedMailboxes](self, "aggregatedMailboxes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") == 1)
  {
    v11 = self->_aggregatedMailboxesFilterTypes;

    if (!v11)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[NNMKMailboxSelection mailboxesWithAllMessagesSyncEnabled](self, "mailboxesWithAllMessagesSyncEnabled", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v19;
LABEL_17:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v5);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "type") != 1)
            goto LABEL_26;
          if (v13 == ++v15)
          {
            v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v13)
              goto LABEL_17;
            break;
          }
        }
      }
LABEL_23:
      v16 = 1;
LABEL_27:

      return v16;
    }
  }
  else
  {

  }
  return 0;
}

- (BOOL)containsMailboxFilter:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "mailboxIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    v6 = objc_msgSend(v4, "isFilteredByType");

    if ((v6 & 1) == 0)
    {
      -[NNMKMailboxSelection mailboxesWithAllMessagesSyncEnabledIds](self, "mailboxesWithAllMessagesSyncEnabledIds");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mailboxIds");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v10) = objc_msgSend(v7, "containsObject:", v9);

      goto LABEL_16;
    }
  }
  else
  {

  }
  v10 = -[NNMKMailboxSelection isMailboxFilterEnabled:](self, "isMailboxFilterEnabled:", objc_msgSend(v4, "mailboxType"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v4, "mailboxIds", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[NNMKMailboxSelection aggregatedMailboxesId](self, "aggregatedMailboxesId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v10 &= objc_msgSend(v17, "containsObject:", v16);

        if (v10 != 1)
        {
          LOBYTE(v10) = 0;
          goto LABEL_15;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v10 = 1;
      if (v13)
        continue;
      break;
    }
  }
LABEL_15:

LABEL_16:
  return v10;
}

+ (unint64_t)firstFilterTypeFromTypes:(unint64_t)a3
{
  unint64_t result;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  result = objc_msgSend(&unk_24FA10DD0, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v9;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v6)
        objc_enumerationMutation(&unk_24FA10DD0);
      result = objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "unsignedIntegerValue");
      if ((result & a3) != 0)
        break;
      if (v5 == ++v7)
      {
        result = objc_msgSend(&unk_24FA10DD0, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        v5 = result;
        if (result)
          goto LABEL_3;
        return result;
      }
    }
  }
  return result;
}

- (NSMutableDictionary)allMailboxesSyncEnabledById
{
  NSMutableDictionary *allMailboxesSyncEnabledById;
  NSMutableDictionary *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  allMailboxesSyncEnabledById = self->_allMailboxesSyncEnabledById;
  if (allMailboxesSyncEnabledById)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NNMKMailboxSelection mailboxesWithAllMessagesSyncEnabled](self, "mailboxesWithAllMessagesSyncEnabled", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "mailboxId");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v12 = self->_allMailboxesSyncEnabledById;
  self->_allMailboxesSyncEnabledById = v4;

  allMailboxesSyncEnabledById = self->_allMailboxesSyncEnabledById;
  if (allMailboxesSyncEnabledById)
  {
LABEL_10:
    v13 = allMailboxesSyncEnabledById;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

- (id)mailboxWithId:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NNMKMailboxSelection allMailboxesSyncEnabledById](self, "allMailboxesSyncEnabledById");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isMailboxFilterEnabled:(unint64_t)a3
{
  return (self->_aggregatedMailboxesFilterTypes & a3) != 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  -[NNMKMailboxSelection allMailboxesSyncEnabled](self, "allMailboxesSyncEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(v4, "allMailboxesSyncEnabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 != v8)
    goto LABEL_14;
  v9 = -[NNMKMailboxSelection aggregatedMailboxesFilterTypes](self, "aggregatedMailboxesFilterTypes");
  if (v9 == objc_msgSend(v4, "aggregatedMailboxesFilterTypes"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[NNMKMailboxSelection allMailboxesSyncEnabled](self, "allMailboxesSyncEnabled", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v4, "allMailboxesSyncEnabledById");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "mailboxId");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18 || (v19 = objc_msgSend(v18, "filterType"), v19 != objc_msgSend(v15, "filterType")))
          {

            v20 = 0;
            goto LABEL_18;
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        v20 = 1;
        if (v12)
          continue;
        break;
      }
    }
    else
    {
      v20 = 1;
    }
LABEL_18:

  }
  else
  {
LABEL_14:
    v20 = 0;
  }

  return v20;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("Mailboxes: ["));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NNMKMailboxSelection mailboxesWithAllMessagesSyncEnabledIds](self, "mailboxesWithAllMessagesSyncEnabledIds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@ ,"), *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendString:", CFSTR("], "));
  objc_msgSend(v3, "appendString:", CFSTR("Aggregated: ["));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NNMKMailboxSelection aggregatedMailboxesId](self, "aggregatedMailboxesId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@ ,"), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v11);
  }

  objc_msgSend(v3, "appendString:", CFSTR("], "));
  objc_msgSend(v3, "appendString:", CFSTR("Filters: ["));
  if (-[NNMKMailboxSelection isMailboxFilterEnabled:](self, "isMailboxFilterEnabled:", 1))
    objc_msgSend(v3, "appendString:", CFSTR("All, "));
  if (-[NNMKMailboxSelection isMailboxFilterEnabled:](self, "isMailboxFilterEnabled:", 2))
    objc_msgSend(v3, "appendString:", CFSTR("VIP, "));
  if (-[NNMKMailboxSelection isMailboxFilterEnabled:](self, "isMailboxFilterEnabled:", 8))
    objc_msgSend(v3, "appendString:", CFSTR("Unread, "));
  if (-[NNMKMailboxSelection isMailboxFilterEnabled:](self, "isMailboxFilterEnabled:", 4))
    objc_msgSend(v3, "appendString:", CFSTR("Flagged, "));
  if (-[NNMKMailboxSelection isMailboxFilterEnabled:](self, "isMailboxFilterEnabled:", 16))
    objc_msgSend(v3, "appendString:", CFSTR("ToOrCC, "));
  if (-[NNMKMailboxSelection isMailboxFilterEnabled:](self, "isMailboxFilterEnabled:", 32))
    objc_msgSend(v3, "appendString:", CFSTR("ImportThread, "));
  if (-[NNMKMailboxSelection isMailboxFilterEnabled:](self, "isMailboxFilterEnabled:", 64))
    objc_msgSend(v3, "appendString:", CFSTR("Today"));
  objc_msgSend(v3, "appendString:", CFSTR("]"));
  return v3;
}

+ (id)mailboxChangesApplyingSelection:(id)a3 previousSelection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  char v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v25 = v6;
  objc_msgSend(v6, "allMailboxesSyncEnabledById");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v26 = v5;
  objc_msgSend(v5, "allMailboxesSyncEnabledById");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v16, "mailboxId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          objc_msgSend(v7, "addObject:", v16);
LABEL_12:
          objc_msgSend(v8, "addObject:", v16);
          goto LABEL_13;
        }
        objc_msgSend(v16, "mailboxId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObjectForKey:", v19);

        if ((objc_msgSend(v16, "isEqual:", v18) & 1) == 0)
        {
          objc_msgSend(v7, "addObject:", v16);
          v20 = objc_msgSend(v18, "hasFilterType:", 1);
          v21 = objc_msgSend(v16, "hasFilterType:", 1);
          if (!v20 || (v21 & 1) == 0)
            goto LABEL_12;
        }
LABEL_13:

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v13);
  }

  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "setMailboxesToUpdate:", v7);
  objc_msgSend(v22, "setMailboxesToReSync:", v8);
  objc_msgSend(v9, "allValues");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setMailboxesToDisableSync:", v23);

  return v22;
}

- (NSArray)mailboxesWithAllMessagesSyncEnabled
{
  return self->_mailboxesWithAllMessagesSyncEnabled;
}

- (void)setMailboxesWithAllMessagesSyncEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxesWithAllMessagesSyncEnabled, a3);
}

- (void)setMailboxesWithAllMessagesSyncEnabledIds:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxesWithAllMessagesSyncEnabledIds, a3);
}

- (NSArray)aggregatedMailboxes
{
  return self->_aggregatedMailboxes;
}

- (void)setAggregatedMailboxes:(id)a3
{
  objc_storeStrong((id *)&self->_aggregatedMailboxes, a3);
}

- (void)setAggregatedMailboxesId:(id)a3
{
  objc_storeStrong((id *)&self->_aggregatedMailboxesId, a3);
}

- (unint64_t)aggregatedMailboxesFilterTypes
{
  return self->_aggregatedMailboxesFilterTypes;
}

- (void)setAggregatedMailboxesFilterTypes:(unint64_t)a3
{
  self->_aggregatedMailboxesFilterTypes = a3;
}

- (void)setAllMailboxesSyncEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_allMailboxesSyncEnabled, a3);
}

- (void)setAllMailboxesSyncEnabledById:(id)a3
{
  objc_storeStrong((id *)&self->_allMailboxesSyncEnabledById, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allMailboxesSyncEnabledById, 0);
  objc_storeStrong((id *)&self->_allMailboxesSyncEnabled, 0);
  objc_storeStrong((id *)&self->_aggregatedMailboxesId, 0);
  objc_storeStrong((id *)&self->_aggregatedMailboxes, 0);
  objc_storeStrong((id *)&self->_mailboxesWithAllMessagesSyncEnabledIds, 0);
  objc_storeStrong((id *)&self->_mailboxesWithAllMessagesSyncEnabled, 0);
}

@end
