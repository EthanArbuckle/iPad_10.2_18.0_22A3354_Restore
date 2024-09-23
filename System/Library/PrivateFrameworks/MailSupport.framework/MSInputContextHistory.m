@implementation MSInputContextHistory

- (MSInputContextHistory)initWithThreadIdentifier:(id)a3 senderEmailAddress:(id)a4 toRecipients:(id)a5 ccRecipients:(id)a6 subject:(id)a7 hasCustomSignature:(BOOL)a8 showSmartReplySuggestions:(BOOL)a9 originalMessageCategorySubtype:(id)a10 originalContentMessages:(id)a11
{
  _BOOL8 v11;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  MSInputContextHistory *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v31;
  id v32;
  objc_super v33;

  v11 = a8;
  v32 = a3;
  v31 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a10;
  v21 = a11;
  v33.receiver = self;
  v33.super_class = (Class)MSInputContextHistory;
  v22 = -[MSInputContextHistory init](&v33, sel_init);
  if (v22)
  {
    v23 = (void *)objc_msgSend(v32, "copy");
    -[MSInputContextHistory setThreadIdentifier:](v22, "setThreadIdentifier:", v23);

    -[MSInputContextHistory setSenderEmailAddress:](v22, "setSenderEmailAddress:", v31);
    v24 = *MEMORY[0x1E0D1ED88];
    objc_msgSend(v17, "ef_filter:", *MEMORY[0x1E0D1ED88]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSInputContextHistory setToRecipients:](v22, "setToRecipients:", v25);

    objc_msgSend(v18, "ef_filter:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSInputContextHistory setCcRecipients:](v22, "setCcRecipients:", v26);

    v27 = (void *)objc_msgSend(v19, "copy");
    -[MSInputContextHistory setSubject:](v22, "setSubject:", v27);

    -[MSInputContextHistory setHasCustomSignature:](v22, "setHasCustomSignature:", v11);
    -[MSInputContextHistory setShowSmartReplySuggestions:](v22, "setShowSmartReplySuggestions:", a9);
    v28 = (void *)objc_msgSend(v20, "copy");
    -[MSInputContextHistory setOriginalMessageCategorySubtype:](v22, "setOriginalMessageCategorySubtype:", v28);

    -[MSInputContextHistory setOriginalContentMessages:](v22, "setOriginalContentMessages:", v21);
    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[MSInputContextHistory setParticipantsByEmailAddress:](v22, "setParticipantsByEmailAddress:", v29);

  }
  return v22;
}

- (NSDictionary)toRecipientNamesByEmailAddress
{
  NSDictionary *toRecipientNamesByEmailAddress;
  void *v4;
  NSDictionary *v5;
  NSDictionary *v6;

  toRecipientNamesByEmailAddress = self->_toRecipientNamesByEmailAddress;
  if (!toRecipientNamesByEmailAddress)
  {
    -[MSInputContextHistory toRecipients](self, "toRecipients");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSInputContextHistory _participantNamesByEmailAddressFromRecipients:](self, "_participantNamesByEmailAddressFromRecipients:", v4);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_toRecipientNamesByEmailAddress;
    self->_toRecipientNamesByEmailAddress = v5;

    toRecipientNamesByEmailAddress = self->_toRecipientNamesByEmailAddress;
  }
  return toRecipientNamesByEmailAddress;
}

- (NSDictionary)ccRecipientNamesByEmailAddress
{
  NSDictionary *ccRecipientNamesByEmailAddress;
  void *v4;
  NSDictionary *v5;
  NSDictionary *v6;

  ccRecipientNamesByEmailAddress = self->_ccRecipientNamesByEmailAddress;
  if (!ccRecipientNamesByEmailAddress)
  {
    -[MSInputContextHistory ccRecipients](self, "ccRecipients");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSInputContextHistory _participantNamesByEmailAddressFromRecipients:](self, "_participantNamesByEmailAddressFromRecipients:", v4);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_ccRecipientNamesByEmailAddress;
    self->_ccRecipientNamesByEmailAddress = v5;

    ccRecipientNamesByEmailAddress = self->_ccRecipientNamesByEmailAddress;
  }
  return ccRecipientNamesByEmailAddress;
}

- (NSDictionary)recipientNamesByEmailAddress
{
  NSDictionary *recipientNamesByEmailAddress;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  NSDictionary *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  NSDictionary *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  MSInputContextHistory *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  recipientNamesByEmailAddress = self->_recipientNamesByEmailAddress;
  if (!recipientNamesByEmailAddress)
  {
    v32 = self;
    -[MSInputContextHistory senderEmailAddress](self, "senderEmailAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSInputContextHistory _participantNameAndEmailAddressFromEmailAddress:](v32, "_participantNameAndEmailAddressFromEmailAddress:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v5;
    objc_msgSend(v5, "first");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "second");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSInputContextHistory originalContentMessages](v32, "originalContentMessages");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_new();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __53__MSInputContextHistory_recipientNamesByEmailAddress__block_invoke;
    v42[3] = &unk_1E716DD70;
    v42[4] = v32;
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCCCFE8](v42);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v30;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v39;
      v10 = *MEMORY[0x1E0D1ED90];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v39 != v9)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if (((*(uint64_t (**)(uint64_t, void *))(v10 + 16))(v10, v12) & 1) == 0)
          {
            objc_msgSend(v12, "sender");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *, void *))v7)[2](v7, v13, v6);

            objc_msgSend(v12, "toList");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "ccList");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v36 = 0u;
            v37 = 0u;
            v34 = 0u;
            v35 = 0u;
            v17 = v16;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
            if (v18)
            {
              v19 = *(_QWORD *)v35;
              do
              {
                for (j = 0; j != v18; ++j)
                {
                  if (*(_QWORD *)v35 != v19)
                    objc_enumerationMutation(v17);
                  ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j), v6);
                }
                v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
              }
              while (v18);
            }

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
    v21 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    -[MSInputContextHistory ccRecipientNamesByEmailAddress](v32, "ccRecipientNamesByEmailAddress");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary addEntriesFromDictionary:](v21, "addEntriesFromDictionary:", v22);

    -[MSInputContextHistory toRecipientNamesByEmailAddress](v32, "toRecipientNamesByEmailAddress");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary addEntriesFromDictionary:](v21, "addEntriesFromDictionary:", v23);

    if (v31)
    {
      -[NSDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", v31);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24 == 0;

      if (v25)
        -[NSDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v29, v31);
    }
    v26 = v32->_recipientNamesByEmailAddress;
    v32->_recipientNamesByEmailAddress = v21;

    recipientNamesByEmailAddress = v32->_recipientNamesByEmailAddress;
  }
  return recipientNamesByEmailAddress;
}

void __53__MSInputContextHistory_recipientNamesByEmailAddress__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(a2, "emailAddressValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_participantNameAndEmailAddressFromEmailAddress:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "second");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "first");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, v9);

  }
}

- (NSSet)firstPerson
{
  NSSet *firstPerson;
  void *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  NSSet *v8;

  firstPerson = self->_firstPerson;
  if (!firstPerson)
  {
    -[MSInputContextHistory senderEmailAddress](self, "senderEmailAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSInputContextHistory _participantNameAndEmailAddressFromEmailAddress:](self, "_participantNameAndEmailAddressFromEmailAddress:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "first");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
    else
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v8 = self->_firstPerson;
    self->_firstPerson = v7;

    firstPerson = self->_firstPerson;
  }
  return firstPerson;
}

- (NSSet)primaryRecipients
{
  NSSet *primaryRecipients;
  void *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  NSSet *v8;

  primaryRecipients = self->_primaryRecipients;
  if (!primaryRecipients)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[MSInputContextHistory toRecipientNamesByEmailAddress](self, "toRecipientNamesByEmailAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v6);
    v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v8 = self->_primaryRecipients;
    self->_primaryRecipients = v7;

    primaryRecipients = self->_primaryRecipients;
  }
  return primaryRecipients;
}

- (NSSet)secondaryRecipients
{
  NSSet *secondaryRecipients;
  void *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  NSSet *v8;

  secondaryRecipients = self->_secondaryRecipients;
  if (!secondaryRecipients)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[MSInputContextHistory toRecipientNamesByEmailAddress](self, "toRecipientNamesByEmailAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v6);
    v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v8 = self->_secondaryRecipients;
    self->_secondaryRecipients = v7;

    secondaryRecipients = self->_secondaryRecipients;
  }
  return secondaryRecipients;
}

- (NSDictionary)infoDict
{
  NSDictionary *infoDict;
  void *v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
  void *v8;
  void *v9;
  void *v10;
  NSDictionary **p_infoDict;
  NSDictionary *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  infoDict = self->_infoDict;
  if (!infoDict)
  {
    v4 = (void *)MEMORY[0x1E0C99E08];
    v14 = CFSTR("hasCustomSignature");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MSInputContextHistory hasCustomSignature](self, "hasCustomSignature"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithDictionary:", v6);
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    -[MSInputContextHistory subject](self, "subject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[NSDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v8, CFSTR("subject"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MSInputContextHistory showSmartReplySuggestions](self, "showSmartReplySuggestions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v9, CFSTR("showSmartReplySuggestions"));

    -[MSInputContextHistory originalMessageCategorySubtype](self, "originalMessageCategorySubtype");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v10, CFSTR("messageCategorySubtype"));
    v12 = self->_infoDict;
    p_infoDict = &self->_infoDict;
    *p_infoDict = v7;

    infoDict = *p_infoDict;
  }
  return infoDict;
}

- (id)_participantNamesByEmailAddressFromRecipients:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        -[MSInputContextHistory _participantNameAndEmailAddressFromEmailAddress:](self, "_participantNameAndEmailAddressFromEmailAddress:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9), (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "second");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "first");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v13);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)_participantNameAndEmailAddressFromEmailAddress:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D1ED90] + 16))() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[MSInputContextHistory participantsByEmailAddress](self, "participantsByEmailAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v5 = v7;
    }
    else
    {
      objc_msgSend(v4, "displayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ec_personNameComponents");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "simpleAddress");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        if (!v9)
        {
          v9 = objc_alloc_init(MEMORY[0x1E0CB3850]);
          objc_msgSend(v9, "setGivenName:", v10);
        }
        objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", v10, v9);
        v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }
      -[MSInputContextHistory participantsByEmailAddress](self, "participantsByEmailAddress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v5, v4);

    }
  }

  return v5;
}

- (NSString)ef_publicDescription
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[3];

  v33[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternal");

  if (v4)
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6C8]), "initWithStyle:", 2);
    -[MSInputContextHistory senderEmailAddress](self, "senderEmailAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[MSInputContextHistory senderEmailAddress](self, "senderEmailAddress");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v31 = (void *)MEMORY[0x1E0C9AA60];
    }

    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSInputContextHistory threadIdentifier](self, "threadIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringFromEmailAddressList:", v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSInputContextHistory toRecipients](self, "toRecipients");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringFromEmailAddressList:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSInputContextHistory ccRecipients](self, "ccRecipients");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringFromEmailAddressList:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0D1EF48];
    -[MSInputContextHistory subject](self, "subject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ec_partiallyRedactedStringForSubjectOrSummary:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MSInputContextHistory hasCustomSignature](self, "hasCustomSignature");
    v18 = -[MSInputContextHistory showSmartReplySuggestions](self, "showSmartReplySuggestions");
    -[MSInputContextHistory originalMessageCategorySubtype](self, "originalMessageCategorySubtype");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSInputContextHistory originalContentMessages](self, "originalContentMessages");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");
    -[MSInputContextHistory originalContentMessages](self, "originalContentMessages");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p>\n\tthreadIdentifier:%@\n\tsenderEmailAddress:%@\n\ttoRecipients:%@\n\tccRecipients:%@\n\tsubject:%@\n\thasCustomSignature:%d\n\tshowSmartReplySuggestions:%d\n\toriginalMessageCategorySubtype:%@\n\toriginalContentMessages: (%lu) %@\n"), v29, self, v28, v27, v26, v30, v16, v17, v18, v19, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v23;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p>"), v9, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v10;
  }
}

- (BOOL)isEqual:(id)a3
{
  MSInputContextHistory *v4;
  MSInputContextHistory *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  char v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = (MSInputContextHistory *)a3;
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MSInputContextHistory threadIdentifier](self, "threadIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSInputContextHistory threadIdentifier](v5, "threadIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (EFStringsAreEqual())
      {
        -[MSInputContextHistory senderEmailAddress](self, "senderEmailAddress");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSInputContextHistory senderEmailAddress](v5, "senderEmailAddress");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (EFObjectsAreEqual())
        {
          -[MSInputContextHistory toRecipients](self, "toRecipients");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSInputContextHistory toRecipients](v5, "toRecipients");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (EFObjectsAreEqual())
          {
            -[MSInputContextHistory ccRecipients](self, "ccRecipients");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[MSInputContextHistory ccRecipients](v5, "ccRecipients");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (EFObjectsAreEqual())
            {
              -[MSInputContextHistory subject](self, "subject");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[MSInputContextHistory subject](v5, "subject");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (EFStringsAreEqual()
                && (v12 = -[MSInputContextHistory hasCustomSignature](self, "hasCustomSignature"),
                    v12 == -[MSInputContextHistory hasCustomSignature](v5, "hasCustomSignature"))
                && (v13 = -[MSInputContextHistory showSmartReplySuggestions](self, "showSmartReplySuggestions"),
                    v13 == -[MSInputContextHistory showSmartReplySuggestions](v5, "showSmartReplySuggestions")))
              {
                -[MSInputContextHistory originalMessageCategorySubtype](self, "originalMessageCategorySubtype");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[MSInputContextHistory originalMessageCategorySubtype](v5, "originalMessageCategorySubtype");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (EFStringsAreEqual())
                {
                  -[MSInputContextHistory originalContentMessages](self, "originalContentMessages");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MSInputContextHistory originalContentMessages](v5, "originalContentMessages");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v14 = EFObjectsAreEqual();

                }
                else
                {
                  v14 = 0;
                }

              }
              else
              {
                v14 = 0;
              }

            }
            else
            {
              v14 = 0;
            }

          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;

  -[MSInputContextHistory threadIdentifier](self, "threadIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[MSInputContextHistory senderEmailAddress](self, "senderEmailAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  -[MSInputContextHistory toRecipients](self, "toRecipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[MSInputContextHistory ccRecipients](self, "ccRecipients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");

  -[MSInputContextHistory subject](self, "subject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  v13 = -[MSInputContextHistory hasCustomSignature](self, "hasCustomSignature");
  v14 = -[MSInputContextHistory showSmartReplySuggestions](self, "showSmartReplySuggestions");
  -[MSInputContextHistory originalMessageCategorySubtype](self, "originalMessageCategorySubtype");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash");

  -[MSInputContextHistory originalContentMessages](self, "originalContentMessages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 33 * (33 * (33 * (33 * (33 * (33 * (33 * (33 * v4 + v6) + v8) + v10) + v12) + v13) + v14) + v16)
      + objc_msgSend(v17, "hash")
      + 0x2A36040A9121;

  return v18;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void)setThreadIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (ECEmailAddress)senderEmailAddress
{
  return self->_senderEmailAddress;
}

- (void)setSenderEmailAddress:(id)a3
{
  objc_storeStrong((id *)&self->_senderEmailAddress, a3);
}

- (NSArray)toRecipients
{
  return self->_toRecipients;
}

- (void)setToRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_toRecipients, a3);
}

- (NSArray)ccRecipients
{
  return self->_ccRecipients;
}

- (void)setCcRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_ccRecipients, a3);
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)hasCustomSignature
{
  return self->_hasCustomSignature;
}

- (void)setHasCustomSignature:(BOOL)a3
{
  self->_hasCustomSignature = a3;
}

- (BOOL)showSmartReplySuggestions
{
  return self->_showSmartReplySuggestions;
}

- (void)setShowSmartReplySuggestions:(BOOL)a3
{
  self->_showSmartReplySuggestions = a3;
}

- (NSString)originalMessageCategorySubtype
{
  return self->_originalMessageCategorySubtype;
}

- (void)setOriginalMessageCategorySubtype:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)originalContentMessages
{
  return self->_originalContentMessages;
}

- (void)setOriginalContentMessages:(id)a3
{
  objc_storeStrong((id *)&self->_originalContentMessages, a3);
}

- (void)setRecipientNamesByEmailAddress:(id)a3
{
  objc_storeStrong((id *)&self->_recipientNamesByEmailAddress, a3);
}

- (void)setFirstPerson:(id)a3
{
  objc_storeStrong((id *)&self->_firstPerson, a3);
}

- (void)setPrimaryRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_primaryRecipients, a3);
}

- (void)setSecondaryRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryRecipients, a3);
}

- (void)setInfoDict:(id)a3
{
  objc_storeStrong((id *)&self->_infoDict, a3);
}

- (void)setToRecipientNamesByEmailAddress:(id)a3
{
  objc_storeStrong((id *)&self->_toRecipientNamesByEmailAddress, a3);
}

- (void)setCcRecipientNamesByEmailAddress:(id)a3
{
  objc_storeStrong((id *)&self->_ccRecipientNamesByEmailAddress, a3);
}

- (NSMutableDictionary)participantsByEmailAddress
{
  return self->_participantsByEmailAddress;
}

- (void)setParticipantsByEmailAddress:(id)a3
{
  objc_storeStrong((id *)&self->_participantsByEmailAddress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantsByEmailAddress, 0);
  objc_storeStrong((id *)&self->_ccRecipientNamesByEmailAddress, 0);
  objc_storeStrong((id *)&self->_toRecipientNamesByEmailAddress, 0);
  objc_storeStrong((id *)&self->_infoDict, 0);
  objc_storeStrong((id *)&self->_secondaryRecipients, 0);
  objc_storeStrong((id *)&self->_primaryRecipients, 0);
  objc_storeStrong((id *)&self->_firstPerson, 0);
  objc_storeStrong((id *)&self->_recipientNamesByEmailAddress, 0);
  objc_storeStrong((id *)&self->_originalContentMessages, 0);
  objc_storeStrong((id *)&self->_originalMessageCategorySubtype, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_ccRecipients, 0);
  objc_storeStrong((id *)&self->_toRecipients, 0);
  objc_storeStrong((id *)&self->_senderEmailAddress, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
}

@end
