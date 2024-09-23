@implementation SGInMemoryAdapter

- (SGInMemoryAdapter)init
{
  SGInMemoryAdapter *v2;
  uint64_t v3;
  NSMutableArray *events;
  uint64_t v5;
  NSMutableDictionary *contacts;
  uint64_t v7;
  NSMutableArray *reminders;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SGInMemoryAdapter;
  v2 = -[SGInMemoryAdapter init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    events = v2->_events;
    v2->_events = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    contacts = v2->_contacts;
    v2->_contacts = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    reminders = v2->_reminders;
    v2->_reminders = (NSMutableArray *)v7;

  }
  return v2;
}

- (void)addEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  NSMutableArray *events;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  SGInMemoryAdapter *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "duplicateKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entityKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serialize");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = self->_events;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (!v10)
  {

    -[NSMutableArray removeObjectsInArray:](self->_events, "removeObjectsInArray:", v8);
LABEL_15:
    events = self->_events;
    v24 = (void *)MEMORY[0x1E0D81638];
    objc_msgSend(v4, "duplicateKey");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "entityKey");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "serialize");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "tupleWithFirst:second:", v27, v4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](events, "addObject:", v28);

    goto LABEL_16;
  }
  v11 = v10;
  v29 = self;
  v30 = v8;
  v12 = *(_QWORD *)v32;
  v13 = 1;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v32 != v12)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
      objc_msgSend(v15, "first", v29);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", v7);

      if (v17)
      {
        objc_msgSend(v4, "creationTimestamp");
        v19 = v18;
        objc_msgSend(v15, "second");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "creationTimestamp");
        v22 = v21;

        if (v19 <= v22)
          v13 = 0;
        else
          objc_msgSend(v30, "addObject:", v15);
      }
    }
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  }
  while (v11);

  self = v29;
  v8 = v30;
  -[NSMutableArray removeObjectsInArray:](v29->_events, "removeObjectsInArray:", v30);
  if ((v13 & 1) != 0)
    goto LABEL_15;
LABEL_16:

}

- (void)addEvents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SGInMemoryAdapter addEvent:](self, "addEvent:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)addContact:(id)a3
{
  NSMutableDictionary *contacts;
  void *v4;
  id v5;
  id v6;

  contacts = self->_contacts;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithLongLong:", objc_msgSend(v5, "masterEntityId"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](contacts, "setObject:forKeyedSubscript:", v5, v6);

}

- (void)cancelEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSMutableArray *events;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(a3, "duplicateKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serialize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  events = self->_events;
  v8 = (void *)MEMORY[0x1E0CB3880];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __33__SGInMemoryAdapter_cancelEvent___block_invoke;
  v11[3] = &unk_1E7DA9EA8;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "predicateWithBlock:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray filterUsingPredicate:](events, "filterUsingPredicate:", v10);

}

- (void)cancelEvents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SGInMemoryAdapter cancelEvent:](self, "cancelEvent:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)confirmOrRejectContact:(id)a3
{
  NSMutableDictionary *contacts;
  id v4;

  contacts = self->_contacts;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a3, "masterEntityId"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](contacts, "removeObjectForKey:", v4);

}

- (NSArray)events
{
  return (NSArray *)-[NSMutableArray _pas_mappedArrayWithTransform:](self->_events, "_pas_mappedArrayWithTransform:", &__block_literal_global_5669);
}

- (NSArray)contacts
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1C3BD4F6C](self, a2);
  -[NSMutableDictionary allValues](self->_contacts, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v3);
  return (NSArray *)v4;
}

- (void)calendarDeleted
{
  -[NSMutableArray removeAllObjects](self->_events, "removeAllObjects");
}

- (void)removeAllStoredPseudoContacts
{
  -[NSMutableDictionary removeAllObjects](self->_contacts, "removeAllObjects");
}

- (void)addReminder:(id)a3
{
  -[NSMutableArray addObject:](self->_reminders, "addObject:", a3);
}

- (void)rejectReminderFromThisDevice:(id)a3
{
  id v4;
  NSMutableArray *reminders;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  reminders = self->_reminders;
  v6 = (void *)MEMORY[0x1E0CB3880];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__SGInMemoryAdapter_rejectReminderFromThisDevice___block_invoke;
  v9[3] = &unk_1E7DA9F10;
  v10 = v4;
  v7 = v4;
  objc_msgSend(v6, "predicateWithBlock:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray filterUsingPredicate:](reminders, "filterUsingPredicate:", v8);

}

- (NSArray)reminders
{
  return &self->_reminders->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminders, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

uint64_t __50__SGInMemoryAdapter_rejectReminderFromThisDevice___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "duplicateKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "duplicateKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serialize");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v4) ^ 1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __27__SGInMemoryAdapter_events__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "second");
}

uint64_t __33__SGInMemoryAdapter_cancelEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

@end
