@implementation INSearchForMessagesIntent

- (INSearchForMessagesIntent)initWithRecipients:(id)a3 senders:(id)a4 contents:(id)a5 attributes:(unint64_t)a6 dateTimeRange:(id)a7 identifiers:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  INDateComponentsRange *v19;
  INSearchForMessagesIntent *v20;

  v14 = a8;
  v15 = a7;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = -[INDateComponentsRange initWithDateInterval:onCalendar:inTimeZone:]([INDateComponentsRange alloc], "initWithDateInterval:onCalendar:inTimeZone:", v15, 0, 0);

  v20 = -[INSearchForMessagesIntent initWithRecipients:senders:searchTerms:attributes:dateTimeRange:identifiers:notificationIdentifiers:speakableGroupNames:](self, "initWithRecipients:senders:searchTerms:attributes:dateTimeRange:identifiers:notificationIdentifiers:speakableGroupNames:", v18, v17, v16, a6, v19, v14, 0, 0);
  return v20;
}

- (INSearchForMessagesIntent)initWithRecipients:(id)a3 senders:(id)a4 contents:(id)a5 attributes:(unint64_t)a6 dateTimeRange:(id)a7 identifiers:(id)a8 notificationIdentifiers:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  INDateComponentsRange *v22;
  INSearchForMessagesIntent *v23;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v22 = -[INDateComponentsRange initWithDateInterval:onCalendar:inTimeZone:]([INDateComponentsRange alloc], "initWithDateInterval:onCalendar:inTimeZone:", v18, 0, 0);

  v23 = -[INSearchForMessagesIntent initWithRecipients:senders:searchTerms:attributes:dateTimeRange:identifiers:notificationIdentifiers:speakableGroupNames:](self, "initWithRecipients:senders:searchTerms:attributes:dateTimeRange:identifiers:notificationIdentifiers:speakableGroupNames:", v21, v20, v19, a6, v22, v17, v16, 0);
  return v23;
}

- (int64_t)contentsOperator
{
  return 0;
}

- (id)contentPredicate
{
  return 0;
}

- (id)attributeSet
{
  return 0;
}

- (INSearchForMessagesIntent)initWithRecipients:(NSArray *)recipients senders:(NSArray *)senders searchTerms:(NSArray *)searchTerms attributes:(INMessageAttributeOptions)attributes dateTimeRange:(INDateComponentsRange *)dateTimeRange identifiers:(NSArray *)identifiers notificationIdentifiers:(NSArray *)notificationIdentifiers groupNames:(NSArray *)groupNames
{
  INDateComponentsRange *v14;
  NSArray *v15;
  NSArray *v16;
  NSArray *v17;
  void *v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  INSpeakableString *v24;
  void *v25;
  INSearchForMessagesIntent *v26;
  NSArray *v30;
  NSArray *v31;
  NSArray *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = recipients;
  v31 = senders;
  v30 = searchTerms;
  v14 = dateTimeRange;
  v15 = identifiers;
  v16 = notificationIdentifiers;
  v17 = groupNames;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v19 = v17;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v19);
        v24 = -[INSpeakableString initWithSpokenPhrase:]([INSpeakableString alloc], "initWithSpokenPhrase:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v23));
        objc_msgSend(v18, "addObject:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v21);
  }

  v25 = (void *)objc_msgSend(v18, "copy");
  v26 = -[INSearchForMessagesIntent initWithRecipients:senders:searchTerms:attributes:dateTimeRange:identifiers:notificationIdentifiers:speakableGroupNames:](self, "initWithRecipients:senders:searchTerms:attributes:dateTimeRange:identifiers:notificationIdentifiers:speakableGroupNames:", v32, v31, v30, attributes, v14, v15, v16, v25);

  return v26;
}

- (INSearchForMessagesIntent)initWithRecipients:(NSArray *)recipients senders:(NSArray *)senders searchTerms:(NSArray *)searchTerms attributes:(INMessageAttributeOptions)attributes dateTimeRange:(INDateComponentsRange *)dateTimeRange identifiers:(NSArray *)identifiers notificationIdentifiers:(NSArray *)notificationIdentifiers speakableGroupNames:(NSArray *)speakableGroupNames
{
  return -[INSearchForMessagesIntent initWithRecipients:senders:searchTerms:attributes:dateTimeRange:identifiers:notificationIdentifiers:speakableGroupNames:conversationIdentifiers:](self, "initWithRecipients:senders:searchTerms:attributes:dateTimeRange:identifiers:notificationIdentifiers:speakableGroupNames:conversationIdentifiers:", recipients, senders, searchTerms, attributes, dateTimeRange, identifiers, notificationIdentifiers, speakableGroupNames, 0);
}

- (NSArray)groupNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speakableGroupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataStringList(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "spokenPhrase", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "copy");

        objc_msgSend(v5, "addObject:", v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return (NSArray *)v5;
}

- (void)setGroupNames:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  INSpeakableString *v12;
  INSpeakableString *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v12 = [INSpeakableString alloc];
        v13 = -[INSpeakableString initWithSpokenPhrase:](v12, "initWithSpokenPhrase:", v11, (_QWORD)v17);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataStringList(v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");
  objc_msgSend(v14, "setSpeakableGroupName:", v16);

}

- (INConditionalOperator)groupNamesOperator
{
  void *v2;
  void *v3;
  void *v4;
  INConditionalOperator v5;

  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speakableGroupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "conditionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (id)_typedBackingStore
{
  void *v2;
  void *v3;
  id v4;

  -[INIntent backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_metadata
{
  void *v2;
  void *v3;

  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 9;
}

- (id)_categoryVerb
{
  return CFSTR("Search");
}

- (INSearchForMessagesIntent)initWithRecipients:(NSArray *)recipients senders:(NSArray *)senders searchTerms:(NSArray *)searchTerms attributes:(INMessageAttributeOptions)attributes dateTimeRange:(INDateComponentsRange *)dateTimeRange identifiers:(NSArray *)identifiers notificationIdentifiers:(NSArray *)notificationIdentifiers speakableGroupNames:(NSArray *)speakableGroupNames conversationIdentifiers:(NSArray *)conversationIdentifiers
{
  NSArray *v17;
  NSArray *v18;
  NSArray *v19;
  INDateComponentsRange *v20;
  NSArray *v21;
  NSArray *v22;
  NSArray *v23;
  NSArray *v24;
  INSearchForMessagesIntent *v25;
  INSearchForMessagesIntent *v26;
  objc_super v28;

  v17 = recipients;
  v18 = senders;
  v19 = searchTerms;
  v20 = dateTimeRange;
  v21 = identifiers;
  v22 = notificationIdentifiers;
  v23 = speakableGroupNames;
  v24 = conversationIdentifiers;
  v28.receiver = self;
  v28.super_class = (Class)INSearchForMessagesIntent;
  v25 = -[INIntent init](&v28, sel_init);
  v26 = v25;
  if (v25)
  {
    -[INSearchForMessagesIntent setRecipients:](v25, "setRecipients:", v17);
    -[INSearchForMessagesIntent setSenders:](v26, "setSenders:", v18);
    -[INSearchForMessagesIntent setSearchTerms:](v26, "setSearchTerms:", v19);
    -[INSearchForMessagesIntent setAttributes:](v26, "setAttributes:", attributes);
    -[INSearchForMessagesIntent setDateTimeRange:](v26, "setDateTimeRange:", v20);
    -[INSearchForMessagesIntent setIdentifiers:](v26, "setIdentifiers:", v21);
    -[INSearchForMessagesIntent setNotificationIdentifiers:](v26, "setNotificationIdentifiers:", v22);
    -[INSearchForMessagesIntent setSpeakableGroupNames:](v26, "setSpeakableGroupNames:", v23);
    -[INSearchForMessagesIntent setConversationIdentifiers:](v26, "setConversationIdentifiers:", v24);
  }

  return v26;
}

- (NSArray)recipients
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromContacts(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (INConditionalOperator)recipientsOperator
{
  void *v2;
  void *v3;
  void *v4;
  INConditionalOperator v5;

  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "condition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (void)setRecipients:(id)a3
{
  void *v4;
  _INPBContactList *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipient");
  v5 = (_INPBContactList *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = objc_alloc_init(_INPBContactList);
    -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRecipient:", v5);

  }
  INIntentSlotValueTransformToContacts(v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBContactList setContacts:](v5, "setContacts:", v7);

}

- (NSArray)senders
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromContacts(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (INConditionalOperator)sendersOperator
{
  void *v2;
  void *v3;
  void *v4;
  INConditionalOperator v5;

  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "condition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (void)setSenders:(id)a3
{
  void *v4;
  _INPBContactList *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sender");
  v5 = (_INPBContactList *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = objc_alloc_init(_INPBContactList);
    -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSender:", v5);

  }
  INIntentSlotValueTransformToContacts(v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBContactList setContacts:](v5, "setContacts:", v7);

}

- (NSArray)searchTerms
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchTerm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dataStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromStrings(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (INConditionalOperator)searchTermsOperator
{
  void *v2;
  void *v3;
  void *v4;
  INConditionalOperator v5;

  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchTerm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "conditionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (void)setSearchTerms:(id)a3
{
  void *v4;
  _INPBStringList *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchTerm");
  v5 = (_INPBStringList *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = objc_alloc_init(_INPBStringList);
    -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSearchTerm:", v5);

  }
  INIntentSlotValueTransformToStrings(v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBStringList setDataStrings:](v5, "setDataStrings:", v7);

}

- (INMessageAttributeOptions)attributes
{
  void *v3;
  uint64_t v4;
  INMessageAttributeOptions v5;
  uint64_t i;
  void *v7;

  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "attributesCount");

  v5 = 0;
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v7, "attributeAtIndex:", i))
      {
        case 1u:
          v5 |= 1uLL;
          break;
        case 2u:
          v5 |= 2uLL;
          break;
        case 3u:
          v5 |= 4uLL;
          break;
        case 4u:
          v5 |= 8uLL;
          break;
        case 5u:
          v5 |= 0x10uLL;
          break;
        default:
          break;
      }

    }
  }
  return v5;
}

- (void)setAttributes:(unint64_t)a3
{
  void *v5;
  _QWORD v6[5];

  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearAttributes");

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__INSearchForMessagesIntent_setAttributes___block_invoke;
  v6[3] = &unk_1E2295130;
  v6[4] = self;
  INMessageAttributeOptionsEnumerateBackingTypes(a3, v6);
}

- (INDateComponentsRange)dateTimeRange
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateTimeRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDateTimeRange(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INDateComponentsRange *)v4;
}

- (void)setDateTimeRange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDateTimeRange(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDateTimeRange:", v5);
}

- (NSArray)identifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dataStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromStrings(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (INConditionalOperator)identifiersOperator
{
  void *v2;
  void *v3;
  void *v4;
  INConditionalOperator v5;

  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "conditionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (void)setIdentifiers:(id)a3
{
  void *v4;
  _INPBStringList *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (_INPBStringList *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = objc_alloc_init(_INPBStringList);
    -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIdentifier:", v5);

  }
  INIntentSlotValueTransformToStrings(v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBStringList setDataStrings:](v5, "setDataStrings:", v7);

}

- (NSArray)notificationIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dataStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromStrings(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (INConditionalOperator)notificationIdentifiersOperator
{
  void *v2;
  void *v3;
  void *v4;
  INConditionalOperator v5;

  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "conditionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (void)setNotificationIdentifiers:(id)a3
{
  void *v4;
  _INPBStringList *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationIdentifier");
  v5 = (_INPBStringList *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = objc_alloc_init(_INPBStringList);
    -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNotificationIdentifier:", v5);

  }
  INIntentSlotValueTransformToStrings(v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBStringList setDataStrings:](v5, "setDataStrings:", v7);

}

- (NSArray)speakableGroupNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speakableGroupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dataStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataStrings(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (INConditionalOperator)speakableGroupNamesOperator
{
  void *v2;
  void *v3;
  void *v4;
  INConditionalOperator v5;

  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speakableGroupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "conditionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (void)setSpeakableGroupNames:(id)a3
{
  void *v4;
  _INPBDataStringList *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speakableGroupName");
  v5 = (_INPBDataStringList *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = objc_alloc_init(_INPBDataStringList);
    -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSpeakableGroupName:", v5);

  }
  INIntentSlotValueTransformToDataStrings(v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBDataStringList setDataStrings:](v5, "setDataStrings:", v7);

}

- (NSArray)conversationIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dataStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromStrings(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (INConditionalOperator)conversationIdentifiersOperator
{
  void *v2;
  void *v3;
  void *v4;
  INConditionalOperator v5;

  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "conditionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (void)setConversationIdentifiers:(id)a3
{
  void *v4;
  _INPBStringList *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationIdentifier");
  v5 = (_INPBStringList *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = objc_alloc_init(_INPBStringList);
    -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConversationIdentifier:", v5);

  }
  INIntentSlotValueTransformToStrings(v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBStringList setDataStrings:](v5, "setDataStrings:", v7);

}

- (id)_dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v31[9];
  _QWORD v32[11];

  v32[9] = *MEMORY[0x1E0C80C00];
  v31[0] = CFSTR("recipients");
  -[INSearchForMessagesIntent recipients](self, "recipients");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v3;
  v32[0] = v3;
  v31[1] = CFSTR("senders");
  -[INSearchForMessagesIntent senders](self, "senders");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v5;
  v32[1] = v5;
  v31[2] = CFSTR("searchTerms");
  -[INSearchForMessagesIntent searchTerms](self, "searchTerms");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v7;
  v32[2] = v7;
  v31[3] = CFSTR("attributes");
  INMessageAttributeOptionsGetNames(-[INSearchForMessagesIntent attributes](self, "attributes"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v9;
  v32[3] = v9;
  v31[4] = CFSTR("dateTimeRange");
  -[INSearchForMessagesIntent dateTimeRange](self, "dateTimeRange");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v30 = v4;
  v23 = (void *)v11;
  v32[4] = v11;
  v31[5] = CFSTR("identifiers");
  -[INSearchForMessagesIntent identifiers](self, "identifiers");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v29 = v6;
  v22 = (void *)v13;
  v32[5] = v13;
  v31[6] = CFSTR("notificationIdentifiers");
  -[INSearchForMessagesIntent notificationIdentifiers](self, "notificationIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[6] = v16;
  v31[7] = CFSTR("speakableGroupNames");
  -[INSearchForMessagesIntent speakableGroupNames](self, "speakableGroupNames");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[7] = v18;
  v31[8] = CFSTR("conversationIdentifiers");
  -[INSearchForMessagesIntent conversationIdentifiers](self, "conversationIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[8] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 9);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (!v19)

  if (!v17)
  if (!v15)

  if (!v14)
  if (!v12)

  if (!v10)
  if (!v8)

  if (!v29)
  if (!v30)

  return v28;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;

  v6 = a4;
  -[INSearchForMessagesIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v6;
  v26 = v7;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v8, "recipient");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "contacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedContactsFromContacts(v9, a3, v31);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "setContacts:", v28);
  objc_msgSend(v8, "sender");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contacts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedContactsFromContacts(v11, a3, v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setContacts:", v27);
  objc_msgSend(v8, "searchTerm");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataStrings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedStringsFromStrings(v13, a3, v31);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setDataStrings:", v25);
  objc_msgSend(v7, "dateTimeRange");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v14, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDateTimeRange:", v15);

  objc_msgSend(v8, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dataStrings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedStringsFromStrings(v17, a3, v31);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setDataStrings:", v18);
  objc_msgSend(v8, "notificationIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dataStrings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedStringsFromStrings(v20, a3, v31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setDataStrings:", v21);
  objc_msgSend(v8, "conversationIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dataStrings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedStringsFromStrings(v23, a3, v31);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setDataStrings:", v24);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)domain
{
  return CFSTR("Messages");
}

- (id)verb
{
  return CFSTR("SearchForMessages");
}

void __43__INSearchForMessagesIntent_setAttributes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_typedBackingStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAttribute:", a2);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
