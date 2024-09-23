@implementation EMSortableThreadProxy

- (EMSortableThreadProxy)initWithThread:(id)a3 originatingQuery:(id)a4
{
  id v6;
  id v7;
  EMSortableThreadProxy *v8;
  uint64_t v9;
  EMThreadObjectID *objectID;
  void *v11;
  uint64_t v12;
  NSDate *date;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)EMSortableThreadProxy;
  v8 = -[EMSortableThreadProxy init](&v15, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectID");
    v9 = objc_claimAutoreleasedReturnValue();
    objectID = v8->_objectID;
    v8->_objectID = (EMThreadObjectID *)v9;

    objc_msgSend(v7, "sortDescriptors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy _copySortPropertiesForDescriptors:thread:](v8, "_copySortPropertiesForDescriptors:thread:", v11, v6);

    objc_msgSend(v6, "date");
    v12 = objc_claimAutoreleasedReturnValue();
    date = v8->_date;
    v8->_date = (NSDate *)v12;

  }
  return v8;
}

- (void)_copySortPropertiesForDescriptors:(id)a3 thread:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v13, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[EMSortableThreadProxy _setValueFromThreadAndReturnIfChanged:keyPath:isPrimary:](self, "_setValueFromThreadAndReturnIfChanged:keyPath:isPrimary:", v6, v8, 1);
  if ((unint64_t)objc_msgSend(v13, "count") >= 2)
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "key");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[EMSortableThreadProxy _setValueFromThreadAndReturnIfChanged:keyPath:isPrimary:](self, "_setValueFromThreadAndReturnIfChanged:keyPath:isPrimary:", v6, v11, 0);
  }

}

- (id)_setValueFromThreadAndReturnIfChanged:(id)a3 keyPath:(id)a4 isPrimary:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = a4;
  objc_msgSend(a3, "valueForKeyPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMSortableThreadProxy _sortValueForRawValue:keyPath:](self, "_sortValueForRawValue:keyPath:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMSortableThreadProxy primarySortValue](self, "primarySortValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v11)
  {

    v9 = 0;
  }
  else if (v5)
  {
    -[EMSortableThreadProxy setPrimarySortValue:](self, "setPrimarySortValue:", v10);
  }

  return v9;
}

- (id)_sortValueForRawValue:(id)a3 keyPath:(id)a4
{
  id v7;
  int v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = a3;
  v8 = objc_msgSend(a4, "isEqualToString:", CFSTR("flagColors"));
  v9 = v7;
  if (v8)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMSortableThreadProxy.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rawSortValue isKindOfClass:[NSIndexSet class]]"));

      }
      v10 = v7;
      if ((unint64_t)objc_msgSend(v10, "lastIndex") >= 7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMSortableThreadProxy.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("flagColors.lastIndex <= ECMessageFlagColorLast"));

      }
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __55__EMSortableThreadProxy__sortValueForRawValue_keyPath___block_invoke;
      v15[3] = &unk_1E70F6270;
      v15[4] = &v16;
      objc_msgSend(v10, "enumerateIndexesUsingBlock:", v15);

      v11 = v17[3];
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v16, 8);
  }

  return v9;
}

uint64_t __55__EMSortableThreadProxy__sortValueForRawValue_keyPath___block_invoke(uint64_t result, char a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 1 << (6 - a2);
  return result;
}

- (void)updateFromThread:(id)a3 addingAdditionalInformation:(BOOL)a4 query:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  EMSortableThreadProxyAdditionalProperties *v13;
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
  id v25;

  v25 = a3;
  v8 = a5;
  objc_msgSend(v8, "sortDescriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMSortableThreadProxy _copySortPropertiesForDescriptors:thread:](self, "_copySortPropertiesForDescriptors:thread:", v9, v25);

  objc_msgSend(v25, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMSortableThreadProxy setDate:](self, "setDate:", v10);

  if (a4
    || (-[EMSortableThreadProxy properties](self, "properties"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    -[EMSortableThreadProxy properties](self, "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v13 = objc_alloc_init(EMSortableThreadProxyAdditionalProperties);
      -[EMSortableThreadProxy setProperties:](self, "setProperties:", v13);

    }
    objc_msgSend(v25, "displayMessageObjectID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "displayDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy setDisplayDate:](self, "setDisplayDate:", v15);

    objc_msgSend(v25, "readLater");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy setReadLater:](self, "setReadLater:", v16);

    objc_msgSend(v25, "sendLaterDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy setSendLaterDate:](self, "setSendLaterDate:", v17);

    -[EMSortableThreadProxy setDisplayMessageGlobalID:](self, "setDisplayMessageGlobalID:", objc_msgSend(v14, "globalMessageID"));
    objc_msgSend(v25, "senderList");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy setSenderList:](self, "setSenderList:", v18);

    objc_msgSend(v25, "toList");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy setToList:](self, "setToList:", v19);

    objc_msgSend(v25, "ccList");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy setCcList:](self, "setCcList:", v20);

    objc_msgSend(v25, "flags");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy setFlags:](self, "setFlags:", v21);

    -[EMSortableThreadProxy setHasUnflagged:](self, "setHasUnflagged:", objc_msgSend(v25, "hasUnflagged"));
    objc_msgSend(v25, "flagColors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy setFlagColors:](self, "setFlagColors:", v22);

    -[EMSortableThreadProxy setIsVIP:](self, "setIsVIP:", objc_msgSend(v25, "isVIP"));
    -[EMSortableThreadProxy setIsBlocked:](self, "setIsBlocked:", objc_msgSend(v25, "isBlocked"));
    -[EMSortableThreadProxy setHasAttachments:](self, "setHasAttachments:", objc_msgSend(v25, "hasAttachments"));
    -[EMSortableThreadProxy setIsAuthenticated:](self, "setIsAuthenticated:", objc_msgSend(v25, "isAuthenticated"));
    -[EMSortableThreadProxy setNumberOfMessagesInThread:](self, "setNumberOfMessagesInThread:", objc_msgSend(v25, "count"));
    objc_msgSend(v25, "mailboxObjectIDs");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy setMailboxObjectIDs:](self, "setMailboxObjectIDs:", v23);

    objc_msgSend(v25, "generatedSummary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy setGeneratedSummary:](self, "setGeneratedSummary:", v24);

  }
}

- (id)calculateChangeFromThread:(id)a3
{
  id v4;
  EMMessageListItemChange *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
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
  char v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  char v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  char v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  char v69;
  void *v70;
  EMMessageListItemChange *v71;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;

  v4 = a3;
  v5 = objc_alloc_init(EMMessageListItemChange);
  objc_msgSend(v4, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v80 = v7;
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "key");
  v9 = objc_claimAutoreleasedReturnValue();

  v79 = (void *)v9;
  -[EMSortableThreadProxy _setValueFromThreadAndReturnIfChanged:keyPath:isPrimary:](self, "_setValueFromThreadAndReturnIfChanged:keyPath:isPrimary:", v4, v9, 1);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10 != 0;
  v81 = (void *)v10;
  if (v10)
    -[EMMessageListItemChange setValue:forKeyPath:](v5, "setValue:forKeyPath:", v10, v79);
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "key");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[EMSortableThreadProxy _setValueFromThreadAndReturnIfChanged:keyPath:isPrimary:](self, "_setValueFromThreadAndReturnIfChanged:keyPath:isPrimary:", v4, v13, 0);
    v14 = objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[EMMessageListItemChange setValue:forKeyPath:](v5, "setValue:forKeyPath:", v14, v79);
      v11 = 1;
    }

    v81 = (void *)v14;
  }
  objc_msgSend(v4, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMSortableThreadProxy date](self, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToDate:", v16);

  if ((v17 & 1) == 0)
  {
    objc_msgSend(v4, "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setDate:](v5, "setDate:", v18);

    v11 = 1;
  }
  -[EMSortableThreadProxy properties](self, "properties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v4, "displayMessageObjectID");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v73, "globalMessageID");
    if (v20 != -[EMSortableThreadProxy displayMessageGlobalID](self, "displayMessageGlobalID"))
    {
      objc_msgSend(v4, "subject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (!v21)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[EMMessageListItemChange setSubject:](v5, "setSubject:", v22);
      if (!v21)

      objc_msgSend(v4, "summary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (!v23)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[EMMessageListItemChange setSummary:](v5, "setSummary:", v24);
      if (!v23)

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "unsubscribeType"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMessageListItemChange setUnsubscribeType:](v5, "setUnsubscribeType:", v25);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "conversationNotificationLevel"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMessageListItemChange setConversationNotificationLevel:](v5, "setConversationNotificationLevel:", v26);

      objc_msgSend(v4, "followUp");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (!v27)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[EMMessageListItemChange setFollowUp:](v5, "setFollowUp:", v28);
      if (!v27)

      objc_msgSend(v4, "displayMessageItemID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMessageListItemChange setDisplayMessageItemID:](v5, "setDisplayMessageItemID:", v29);

      LOBYTE(v11) = 1;
    }
    objc_msgSend(v4, "displayDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy displayDate](self, "displayDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqualToDate:", v31);

    if ((v32 & 1) == 0)
    {
      objc_msgSend(v4, "displayDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMessageListItemChange setDisplayDate:](v5, "setDisplayDate:", v33);

      LOBYTE(v11) = 1;
    }
    objc_msgSend(v4, "sendLaterDate");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy sendLaterDate](self, "sendLaterDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = EFObjectsAreEqual();

    if ((v35 & 1) == 0)
    {
      v36 = v77;
      if (!v77)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[EMMessageListItemChange setSendLaterDate:](v5, "setSendLaterDate:", v36);
      if (!v77)

      LOBYTE(v11) = 1;
    }
    objc_msgSend(v4, "readLater");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy readLater](self, "readLater");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = EFObjectsAreEqual();

    if ((v38 & 1) == 0)
    {
      v39 = v76;
      if (!v76)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[EMMessageListItemChange setReadLater:](v5, "setReadLater:", v39);
      if (!v76)

      LOBYTE(v11) = 1;
    }
    objc_msgSend(v4, "senderList");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy senderList](self, "senderList");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = EFArraysAreEqual();

    if ((v41 & 1) == 0)
    {
      -[EMMessageListItemChange setSenderList:](v5, "setSenderList:", v75);
      LOBYTE(v11) = 1;
    }
    objc_msgSend(v4, "toList");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy toList](self, "toList");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = EFArraysAreEqual();

    if ((v43 & 1) == 0)
    {
      -[EMMessageListItemChange setToList:](v5, "setToList:", v74);
      LOBYTE(v11) = 1;
    }
    objc_msgSend(v4, "ccList");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy ccList](self, "ccList");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = EFArraysAreEqual();

    if ((v45 & 1) == 0)
    {
      -[EMMessageListItemChange setCcList:](v5, "setCcList:", v78);
      LOBYTE(v11) = 1;
    }
    objc_msgSend(v4, "flags");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy flags](self, "flags");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = EFObjectsAreEqual();

    if ((v48 & 1) == 0)
    {
      -[EMMessageListItemChange setFlags:](v5, "setFlags:", v46);
      LOBYTE(v11) = 1;
    }
    v49 = objc_msgSend(v4, "hasUnflagged");
    if ((_DWORD)v49 != -[EMSortableThreadProxy hasUnflagged](self, "hasUnflagged"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMessageListItemChange setHasUnflagged:](v5, "setHasUnflagged:", v50);

      LOBYTE(v11) = 1;
    }
    objc_msgSend(v4, "flagColors");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy flagColors](self, "flagColors");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = EFObjectsAreEqual();

    if ((v53 & 1) == 0)
    {
      v54 = v51;
      if (!v51)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[EMMessageListItemChange setFlagColors:](v5, "setFlagColors:", v54);
      if (!v51)

      LOBYTE(v11) = 1;
    }
    v55 = objc_msgSend(v4, "isVIP");
    if ((_DWORD)v55 != -[EMSortableThreadProxy isVIP](self, "isVIP"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMessageListItemChange setIsVIP:](v5, "setIsVIP:", v56);

      LOBYTE(v11) = 1;
    }
    v57 = objc_msgSend(v4, "isBlocked");
    if ((_DWORD)v57 != -[EMSortableThreadProxy isBlocked](self, "isBlocked"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMessageListItemChange setIsBlocked:](v5, "setIsBlocked:", v58);

      LOBYTE(v11) = 1;
    }
    v59 = -[EMSortableThreadProxy hasAttachments](self, "hasAttachments");
    if ((_DWORD)v59 != -[EMSortableThreadProxy hasAttachments](self, "hasAttachments"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMessageListItemChange setHasAttachments:](v5, "setHasAttachments:", v60);

      LOBYTE(v11) = 1;
    }
    v61 = -[EMSortableThreadProxy isAuthenticated](self, "isAuthenticated");
    if ((_DWORD)v61 != -[EMSortableThreadProxy isAuthenticated](self, "isAuthenticated"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMessageListItemChange setIsAuthenticated:](v5, "setIsAuthenticated:", v62);

      LOBYTE(v11) = 1;
    }
    v63 = objc_msgSend(v4, "count");
    if (v63 != -[EMSortableThreadProxy numberOfMessagesInThread](self, "numberOfMessagesInThread"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMessageListItemChange setCount:](v5, "setCount:", v64);

      LOBYTE(v11) = 1;
    }
    objc_msgSend(v4, "mailboxObjectIDs");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy mailboxObjectIDs](self, "mailboxObjectIDs");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if ((EFArraysAreEqual() & 1) == 0)
    {
      -[EMMessageListItemChange setMailboxObjectIDs:](v5, "setMailboxObjectIDs:", v65);
      LOBYTE(v11) = 1;
    }
    objc_msgSend(v4, "generatedSummary");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSortableThreadProxy generatedSummary](self, "generatedSummary");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v67, "isEqual:", v68);

    if ((v69 & 1) == 0)
    {
      v70 = v67;
      if (!v67)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[EMMessageListItemChange setGeneratedSummary:](v5, "setGeneratedSummary:", v70);
      if (!v67)

      LOBYTE(v11) = 1;
    }

    if (v11)
      goto LABEL_73;
LABEL_75:
    v71 = 0;
    goto LABEL_76;
  }
  if (!v11)
    goto LABEL_75;
LABEL_73:
  v71 = v5;
LABEL_76:

  return v71;
}

- (int64_t)conversationID
{
  void *v2;
  int64_t v3;

  -[EMSortableThreadProxy objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "conversationID");

  return v3;
}

- (id)_targetForSelector:(SEL)a3
{
  EMSortableThreadProxy *v4;
  EMSortableThreadProxy *v5;
  EMSortableThreadProxy *v6;

  -[EMSortableThreadProxy properties](self, "properties");
  v4 = (EMSortableThreadProxy *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = v4;
  else
    v5 = self;
  v6 = v5;

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v5;
  BOOL v6;
  objc_super v8;

  -[EMSortableThreadProxy properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)EMSortableThreadProxy;
    v6 = -[EMSortableThreadProxy respondsToSelector:](&v8, sel_respondsToSelector_, a3);
  }

  return v6;
}

- (NSString)ef_publicDescription
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[EMSortableThreadProxy primarySortValue](self, "primarySortValue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D1EF48], "fullyOrPartiallyRedactedStringForString:", v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[%lld - %@]"), -[EMSortableThreadProxy conversationID](self, "conversationID"), v4);

  return (NSString *)v6;
}

- (EMThreadObjectID)objectID
{
  return self->_objectID;
}

- (id)primarySortValue
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setPrimarySortValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (EMSortableThreadProxyAdditionalProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong(&self->_primarySortValue, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

@end
