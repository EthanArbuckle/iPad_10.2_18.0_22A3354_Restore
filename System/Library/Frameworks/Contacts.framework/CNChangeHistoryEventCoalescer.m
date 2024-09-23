@implementation CNChangeHistoryEventCoalescer

+ (id)coalescingLog
{
  if (coalescingLog_cn_once_token_0 != -1)
    dispatch_once(&coalescingLog_cn_once_token_0, &__block_literal_global_4);
  return (id)coalescingLog_cn_once_object_0;
}

void __46__CNChangeHistoryEventCoalescer_coalescingLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "change-history-coalescing");
  v1 = (void *)coalescingLog_cn_once_object_0;
  coalescingLog_cn_once_object_0 = (uint64_t)v0;

}

+ (id)coalesceEvents:(id)a3
{
  id v3;
  CNChangeHistoryEventCoalescer *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(CNChangeHistoryEventCoalescer);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "acceptEventVisitor:", v4, (_QWORD)v12);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[CNChangeHistoryEventCoalescer events](v4, "events");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CNChangeHistoryEventCoalescer)init
{
  CNChangeHistoryEventCoalescer *v2;
  uint64_t v3;
  NSMutableArray *controlEvents;
  uint64_t v5;
  CNMutableOrderedDictionary *addedContacts;
  uint64_t v7;
  CNMutableOrderedDictionary *updatedContacts;
  uint64_t v9;
  CNMutableOrderedDictionary *deletedContacts;
  uint64_t v11;
  CNMutableOrderedDictionary *addedGroups;
  uint64_t v13;
  CNMutableOrderedDictionary *updatedGroups;
  uint64_t v15;
  CNMutableOrderedDictionary *deletedGroups;
  uint64_t v17;
  NSMutableArray *contactLinkingEvents;
  uint64_t v19;
  NSMutableArray *groupMembershipEvents;
  uint64_t v21;
  NSMutableArray *otherContactEvents;
  CNChangeHistoryEventCoalescer *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CNChangeHistoryEventCoalescer;
  v2 = -[CNChangeHistoryEventCoalescer init](&v25, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    controlEvents = v2->_controlEvents;
    v2->_controlEvents = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    addedContacts = v2->_addedContacts;
    v2->_addedContacts = (CNMutableOrderedDictionary *)v5;

    v7 = objc_opt_new();
    updatedContacts = v2->_updatedContacts;
    v2->_updatedContacts = (CNMutableOrderedDictionary *)v7;

    v9 = objc_opt_new();
    deletedContacts = v2->_deletedContacts;
    v2->_deletedContacts = (CNMutableOrderedDictionary *)v9;

    v11 = objc_opt_new();
    addedGroups = v2->_addedGroups;
    v2->_addedGroups = (CNMutableOrderedDictionary *)v11;

    v13 = objc_opt_new();
    updatedGroups = v2->_updatedGroups;
    v2->_updatedGroups = (CNMutableOrderedDictionary *)v13;

    v15 = objc_opt_new();
    deletedGroups = v2->_deletedGroups;
    v2->_deletedGroups = (CNMutableOrderedDictionary *)v15;

    v17 = objc_opt_new();
    contactLinkingEvents = v2->_contactLinkingEvents;
    v2->_contactLinkingEvents = (NSMutableArray *)v17;

    v19 = objc_opt_new();
    groupMembershipEvents = v2->_groupMembershipEvents;
    v2->_groupMembershipEvents = (NSMutableArray *)v19;

    v21 = objc_opt_new();
    otherContactEvents = v2->_otherContactEvents;
    v2->_otherContactEvents = (NSMutableArray *)v21;

    v23 = v2;
  }

  return v2;
}

- (NSArray)events
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "addObjectsFromArray:", self->_controlEvents);
  -[CNMutableOrderedDictionary allObjects](self->_addedContacts, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[CNMutableOrderedDictionary allObjects](self->_updatedContacts, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  -[CNMutableOrderedDictionary allObjects](self->_deletedContacts, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  -[CNMutableOrderedDictionary allObjects](self->_addedGroups, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  -[CNMutableOrderedDictionary allObjects](self->_updatedGroups, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v8);

  -[CNMutableOrderedDictionary allObjects](self->_deletedGroups, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  objc_msgSend(v3, "addObjectsFromArray:", self->_contactLinkingEvents);
  objc_msgSend(v3, "addObjectsFromArray:", self->_groupMembershipEvents);
  objc_msgSend(v3, "addObjectsFromArray:", self->_otherContactEvents);
  return (NSArray *)v3;
}

- (void)visitDropEverythingEvent:(id)a3
{
  -[NSMutableArray addObject:](self->_controlEvents, "addObject:", a3);
}

- (void)visitAddContactEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  CNChangeHistoryUpdateContactEvent *v11;
  void *v12;
  CNChangeHistoryUpdateContactEvent *v13;
  NSObject *v14;
  CNChangeHistoryUpdateContactEvent *v15;
  void *v16;
  CNChangeHistoryUpdateContactEvent *v17;

  v4 = a3;
  objc_msgSend(v4, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNMutableOrderedDictionary objectForKeyedSubscript:](self->_addedContacts, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "coalescingLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CNChangeHistoryEventCoalescer visitAddContactEvent:].cold.3();

    -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](self->_addedContacts, "setObject:forKeyedSubscript:", v4, v6);
  }
  else
  {
    -[CNMutableOrderedDictionary objectForKeyedSubscript:](self->_updatedContacts, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend((id)objc_opt_class(), "coalescingLog");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CNChangeHistoryEventCoalescer visitAddContactEvent:].cold.2();

      v11 = [CNChangeHistoryUpdateContactEvent alloc];
      objc_msgSend(v4, "contact");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[CNChangeHistoryUpdateContactEvent initWithContact:imagesChanged:](v11, "initWithContact:imagesChanged:", v12, 1);
      -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](self->_updatedContacts, "setObject:forKeyedSubscript:", v13, v6);

    }
    else
    {
      -[CNMutableOrderedDictionary objectForKeyedSubscript:](self->_deletedContacts, "objectForKeyedSubscript:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend((id)objc_opt_class(), "coalescingLog");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[CNChangeHistoryEventCoalescer visitAddContactEvent:].cold.1();

        -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](self->_deletedContacts, "setObject:forKeyedSubscript:", 0, v6);
        v15 = [CNChangeHistoryUpdateContactEvent alloc];
        objc_msgSend(v4, "contact");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[CNChangeHistoryUpdateContactEvent initWithContact:imagesChanged:](v15, "initWithContact:imagesChanged:", v16, 1);
        -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](self->_updatedContacts, "setObject:forKeyedSubscript:", v17, v6);

      }
      else
      {
        -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](self->_addedContacts, "setObject:forKeyedSubscript:", v4, v6);
      }
    }

  }
}

- (void)visitUpdateContactEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  CNChangeHistoryAddContactEvent *v9;
  void *v10;
  void *v11;
  CNChangeHistoryAddContactEvent *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  CNMutableOrderedDictionary *deletedContacts;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNMutableOrderedDictionary objectForKeyedSubscript:](self->_addedContacts, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "coalescingLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CNChangeHistoryEventCoalescer visitUpdateContactEvent:].cold.3();

    v9 = [CNChangeHistoryAddContactEvent alloc];
    objc_msgSend(v4, "contact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CNChangeHistoryAddContactEvent initWithContact:containerIdentifier:](v9, "initWithContact:containerIdentifier:", v10, v11);
    -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](self->_addedContacts, "setObject:forKeyedSubscript:", v12, v6);

  }
  else
  {
    -[CNMutableOrderedDictionary objectForKeyedSubscript:](self->_updatedContacts, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend((id)objc_opt_class(), "coalescingLog");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[CNChangeHistoryEventCoalescer visitUpdateContactEvent:].cold.2();

      -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](self->_updatedContacts, "setObject:forKeyedSubscript:", v4, v6);
    }
    else
    {
      -[CNMutableOrderedDictionary objectForKeyedSubscript:](self->_deletedContacts, "objectForKeyedSubscript:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend((id)objc_opt_class(), "coalescingLog");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[CNChangeHistoryEventCoalescer visitUpdateContactEvent:].cold.1();

        -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](self->_updatedContacts, "setObject:forKeyedSubscript:", v4, v6);
        deletedContacts = self->_deletedContacts;
        v17 = 0;
      }
      else
      {
        deletedContacts = self->_updatedContacts;
        v17 = v4;
      }
      -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](deletedContacts, "setObject:forKeyedSubscript:", v17, v6);

    }
  }

}

- (void)visitDeleteContactEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;

  v4 = a3;
  objc_msgSend(v4, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutableOrderedDictionary objectForKeyedSubscript:](self->_addedContacts, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "coalescingLog");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[CNChangeHistoryEventCoalescer visitDeleteContactEvent:].cold.3();

    -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](self->_addedContacts, "setObject:forKeyedSubscript:", 0, v5);
  }
  else
  {
    -[CNMutableOrderedDictionary objectForKeyedSubscript:](self->_updatedContacts, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend((id)objc_opt_class(), "coalescingLog");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[CNChangeHistoryEventCoalescer visitDeleteContactEvent:].cold.2();

      -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](self->_updatedContacts, "setObject:forKeyedSubscript:", 0, v5);
      -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](self->_deletedContacts, "setObject:forKeyedSubscript:", v4, v5);
    }
    else
    {
      -[CNMutableOrderedDictionary objectForKeyedSubscript:](self->_deletedContacts, "objectForKeyedSubscript:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend((id)objc_opt_class(), "coalescingLog");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[CNChangeHistoryEventCoalescer visitDeleteContactEvent:].cold.1();

      }
      -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](self->_deletedContacts, "setObject:forKeyedSubscript:", v4, v5);

    }
  }

}

- (void)visitAddGroupEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  CNChangeHistoryUpdateGroupEvent *v11;
  void *v12;
  CNChangeHistoryUpdateGroupEvent *v13;
  NSObject *v14;
  CNChangeHistoryUpdateGroupEvent *v15;
  void *v16;
  CNChangeHistoryUpdateGroupEvent *v17;
  CNMutableOrderedDictionary *deletedGroups;
  id v19;

  v4 = a3;
  objc_msgSend(v4, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNMutableOrderedDictionary objectForKeyedSubscript:](self->_addedGroups, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "coalescingLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CNChangeHistoryEventCoalescer visitAddGroupEvent:].cold.3();

    -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](self->_addedGroups, "setObject:forKeyedSubscript:", v4, v6);
  }
  else
  {
    -[CNMutableOrderedDictionary objectForKeyedSubscript:](self->_updatedGroups, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend((id)objc_opt_class(), "coalescingLog");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CNChangeHistoryEventCoalescer visitAddGroupEvent:].cold.2();

      v11 = [CNChangeHistoryUpdateGroupEvent alloc];
      objc_msgSend(v4, "group");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[CNChangeHistoryUpdateGroupEvent initWithGroup:](v11, "initWithGroup:", v12);
      -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](self->_updatedGroups, "setObject:forKeyedSubscript:", v13, v6);

    }
    else
    {
      -[CNMutableOrderedDictionary objectForKeyedSubscript:](self->_deletedGroups, "objectForKeyedSubscript:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend((id)objc_opt_class(), "coalescingLog");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[CNChangeHistoryEventCoalescer visitAddGroupEvent:].cold.1();

        v15 = [CNChangeHistoryUpdateGroupEvent alloc];
        objc_msgSend(v4, "group");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[CNChangeHistoryUpdateGroupEvent initWithGroup:](v15, "initWithGroup:", v16);
        -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](self->_updatedGroups, "setObject:forKeyedSubscript:", v17, v6);

        deletedGroups = self->_deletedGroups;
        v19 = 0;
      }
      else
      {
        deletedGroups = self->_addedGroups;
        v19 = v4;
      }
      -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](deletedGroups, "setObject:forKeyedSubscript:", v19, v6);
    }

  }
}

- (void)visitUpdateGroupEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  CNChangeHistoryAddGroupEvent *v9;
  void *v10;
  void *v11;
  CNChangeHistoryAddGroupEvent *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  CNMutableOrderedDictionary *deletedGroups;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNMutableOrderedDictionary objectForKeyedSubscript:](self->_addedGroups, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "coalescingLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CNChangeHistoryEventCoalescer visitUpdateContactEvent:].cold.3();

    v9 = [CNChangeHistoryAddGroupEvent alloc];
    objc_msgSend(v4, "group");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CNChangeHistoryAddGroupEvent initWithGroup:containerIdentifier:](v9, "initWithGroup:containerIdentifier:", v10, v11);
    -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](self->_addedGroups, "setObject:forKeyedSubscript:", v12, v6);

  }
  else
  {
    -[CNMutableOrderedDictionary objectForKeyedSubscript:](self->_updatedGroups, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend((id)objc_opt_class(), "coalescingLog");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[CNChangeHistoryEventCoalescer visitUpdateContactEvent:].cold.2();

      -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](self->_updatedGroups, "setObject:forKeyedSubscript:", v4, v6);
    }
    else
    {
      -[CNMutableOrderedDictionary objectForKeyedSubscript:](self->_deletedGroups, "objectForKeyedSubscript:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend((id)objc_opt_class(), "coalescingLog");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[CNChangeHistoryEventCoalescer visitUpdateContactEvent:].cold.1();

        -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](self->_updatedGroups, "setObject:forKeyedSubscript:", v4, v6);
        deletedGroups = self->_deletedGroups;
        v17 = 0;
      }
      else
      {
        deletedGroups = self->_updatedGroups;
        v17 = v4;
      }
      -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](deletedGroups, "setObject:forKeyedSubscript:", v17, v6);

    }
  }

}

- (void)visitDeleteGroupEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  objc_msgSend(v4, "groupIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutableOrderedDictionary objectForKeyedSubscript:](self->_addedGroups, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](self->_addedGroups, "setObject:forKeyedSubscript:", 0, v5);
    objc_msgSend((id)objc_opt_class(), "coalescingLog");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[CNChangeHistoryEventCoalescer visitDeleteContactEvent:].cold.3();
  }
  else
  {
    -[CNMutableOrderedDictionary objectForKeyedSubscript:](self->_updatedGroups, "objectForKeyedSubscript:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend((id)objc_opt_class(), "coalescingLog");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[CNChangeHistoryEventCoalescer visitDeleteContactEvent:].cold.2();

      -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](self->_updatedGroups, "setObject:forKeyedSubscript:", 0, v5);
      -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](self->_deletedGroups, "setObject:forKeyedSubscript:", v4, v5);
    }
    else
    {
      -[CNMutableOrderedDictionary objectForKeyedSubscript:](self->_deletedGroups, "objectForKeyedSubscript:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend((id)objc_opt_class(), "coalescingLog");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[CNChangeHistoryEventCoalescer visitDeleteContactEvent:].cold.1();

      }
      -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](self->_deletedGroups, "setObject:forKeyedSubscript:", v4, v5);

    }
  }

}

- (void)visitAddMemberToGroupEvent:(id)a3
{
  -[NSMutableArray addObject:](self->_groupMembershipEvents, "addObject:", a3);
}

- (void)visitRemoveMemberFromGroupEvent:(id)a3
{
  -[NSMutableArray addObject:](self->_groupMembershipEvents, "addObject:", a3);
}

- (void)visitAddSubgroupToGroupEvent:(id)a3
{
  -[NSMutableArray addObject:](self->_groupMembershipEvents, "addObject:", a3);
}

- (void)visitRemoveSubgroupFromGroupEvent:(id)a3
{
  -[NSMutableArray addObject:](self->_groupMembershipEvents, "addObject:", a3);
}

- (void)visitLinkContactsEvent:(id)a3
{
  -[NSMutableArray addObject:](self->_contactLinkingEvents, "addObject:", a3);
}

- (void)visitUnlinkContactEvent:(id)a3
{
  -[NSMutableArray addObject:](self->_contactLinkingEvents, "addObject:", a3);
}

- (void)visitPreferredContactForImageEvent:(id)a3
{
  -[NSMutableArray addObject:](self->_otherContactEvents, "addObject:", a3);
}

- (void)visitPreferredContactForNameEvent:(id)a3
{
  -[NSMutableArray addObject:](self->_otherContactEvents, "addObject:", a3);
}

- (void)visitDifferentMeCardEvent:(id)a3
{
  -[NSMutableArray addObject:](self->_otherContactEvents, "addObject:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherContactEvents, 0);
  objc_storeStrong((id *)&self->_groupMembershipEvents, 0);
  objc_storeStrong((id *)&self->_contactLinkingEvents, 0);
  objc_storeStrong((id *)&self->_deletedGroups, 0);
  objc_storeStrong((id *)&self->_updatedGroups, 0);
  objc_storeStrong((id *)&self->_addedGroups, 0);
  objc_storeStrong((id *)&self->_deletedContacts, 0);
  objc_storeStrong((id *)&self->_updatedContacts, 0);
  objc_storeStrong((id *)&self->_addedContacts, 0);
  objc_storeStrong((id *)&self->_controlEvents, 0);
}

- (void)visitAddContactEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Change history protocol error: Delete + Add (%{public}@); will treat as an Update.",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)visitAddContactEvent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Change history coalescing: Change history protocol error: Update + Add (%{public}@); will treat as an Update.",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)visitAddContactEvent:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Change history coalescing: Change history protocol error: Add + Add (%{public}@); will treat as a single Add.",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)visitUpdateContactEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Change history protocol error: Delete + Update (%{public}@); will treat as an Update.",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)visitUpdateContactEvent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_18F8BD000, v0, v1, "Change history coalescing: Update + Update -> Update (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)visitUpdateContactEvent:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_18F8BD000, v0, v1, "Change history coalescing: Add + Update -> Add (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)visitDeleteContactEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Change history protocol error: Delete + Delete (%{public}@); will treat as a single Delete.",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)visitDeleteContactEvent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_18F8BD000, v0, v1, "Change history coalescing: Update + Delete -> Delete (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)visitDeleteContactEvent:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_18F8BD000, v0, v1, "Change history coalescing: Add + Delete -> Delete (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)visitAddGroupEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_18F8BD000, v0, v1, "Change history coalescing: Delete + Add -> Update (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)visitAddGroupEvent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Change history protocol error: Update + Add (%{public}@); will treat as an Update.",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)visitAddGroupEvent:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Change history protocol error: Add + Add (%{public}@); will treat as a single Add.",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2_0();
}

@end
