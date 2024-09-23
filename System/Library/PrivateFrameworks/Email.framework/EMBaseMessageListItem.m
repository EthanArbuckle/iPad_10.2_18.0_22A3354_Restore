@implementation EMBaseMessageListItem

- (EMMessageRepository)repository
{
  void *v4;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EMBaseMessageListItem;
  -[EMRepositoryObject repository](&v7, sel_repository);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMBaseMessageListItem.m"), 34, CFSTR("Wrong repository type"));

    }
  }
  return (EMMessageRepository *)v4;
}

- (void)setRepository:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMBaseMessageListItem.m"), 34, CFSTR("Wrong repository type"));

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)EMBaseMessageListItem;
  -[EMRepositoryObject setRepository:](&v7, sel_setRepository_, v5);

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__EMBaseMessageListItem_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_2 != -1)
    dispatch_once(&log_onceToken_2, block);
  return (OS_os_log *)(id)log_log_2;
}

void __28__EMBaseMessageListItem_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_2;
  log_log_2 = (uint64_t)v1;

}

- (EMBaseMessageListItem)initWithObjectID:(id)a3
{
  id v5;

  v5 = a3;
  -[EMBaseMessageListItem doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMBaseMessageListItem initWithObjectID:]", "EMBaseMessageListItem.m", 99, "0");
}

- (EMBaseMessageListItem)initWithObjectID:(id)a3 baseBuilder:(id)a4
{
  id v7;
  id v8;
  EMBaseMessageListItem *v9;
  EMBaseMessageListItem *v10;
  void *v12;
  EMBaseMessageListItem *v13;
  id v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMBaseMessageListItem.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("builderBlock"));

  }
  v15.receiver = self;
  v15.super_class = (Class)EMBaseMessageListItem;
  v9 = -[EMObject initWithObjectID:](&v15, sel_initWithObjectID_, v7);
  v10 = v9;
  if (v9)
  {
    v13 = v9;
    v14 = v8;
    ECAllowNetworkActivityButLog();

  }
  return v10;
}

uint64_t __54__EMBaseMessageListItem_initWithObjectID_baseBuilder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_commonInitWithBaseBuilder:", *(_QWORD *)(a1 + 40));
}

- (void)_commonInitWithBaseBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  self->_mailboxesLock._os_unfair_lock_opaque = 0;
  v7 = v4;
  (*((void (**)(id, EMBaseMessageListItem *))v4 + 2))(v4, self);
  -[EMBaseMessageListItem displayDate](self, "displayDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[EMBaseMessageListItem date](self, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMBaseMessageListItem setDisplayDate:](self, "setDisplayDate:", v6);

  }
}

- (id)changeFrom:(id)a3
{
  +[EMMessageListItemChange changeFrom:to:](EMMessageListItemChange, "changeFrom:to:", a3, self);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("readLaterDate")))
  {
    -[EMBaseMessageListItem readLater](self, "readLater");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)EMBaseMessageListItem;
    -[EMBaseMessageListItem valueForUndefinedKey:](&v8, sel_valueForUndefinedKey_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)arePropertiesEqual:(id)a3
{
  EMBaseMessageListItem *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  int64_t v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  int64_t v19;
  int64_t v20;
  int64_t v21;
  void *v22;
  char v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;

  v4 = (EMBaseMessageListItem *)a3;
  if (v4 == self)
  {
    v23 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[EMObject objectID](self, "objectID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMObject objectID](v4, "objectID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (EFObjectsAreEqual())
      {
        -[EMBaseMessageListItem subject](self, "subject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMBaseMessageListItem subject](v4, "subject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (EFObjectsAreEqual())
        {
          -[EMBaseMessageListItem mailboxObjectIDs](self, "mailboxObjectIDs");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[EMBaseMessageListItem mailboxObjectIDs](v4, "mailboxObjectIDs");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (EFObjectsAreEqual())
          {
            -[EMBaseMessageListItem senderAddress](self, "senderAddress");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[EMBaseMessageListItem senderAddress](v4, "senderAddress");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (EFObjectsAreEqual())
            {
              -[EMBaseMessageListItem flags](self, "flags");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              -[EMBaseMessageListItem flags](v4, "flags");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if (!EFObjectsAreEqual())
                goto LABEL_36;
              v12 = -[EMBaseMessageListItem isVIP](self, "isVIP");
              if (v12 != -[EMBaseMessageListItem isVIP](v4, "isVIP"))
                goto LABEL_36;
              v13 = -[EMBaseMessageListItem isBlocked](self, "isBlocked");
              if (v13 == -[EMBaseMessageListItem isBlocked](v4, "isBlocked")
                && (v14 = -[EMBaseMessageListItem unsubscribeType](self, "unsubscribeType"),
                    v14 == -[EMBaseMessageListItem unsubscribeType](v4, "unsubscribeType"))
                && (v15 = -[EMBaseMessageListItem isToMe](self, "isToMe"),
                    v15 == -[EMBaseMessageListItem isToMe](v4, "isToMe"))
                && (v16 = -[EMBaseMessageListItem isCCMe](self, "isCCMe"),
                    v16 == -[EMBaseMessageListItem isCCMe](v4, "isCCMe"))
                && (v17 = -[EMBaseMessageListItem hasAttachments](self, "hasAttachments"),
                    v17 == -[EMBaseMessageListItem hasAttachments](v4, "hasAttachments"))
                && (v18 = -[EMBaseMessageListItem isAuthenticated](self, "isAuthenticated"),
                    v18 == -[EMBaseMessageListItem isAuthenticated](v4, "isAuthenticated"))
                && (v19 = -[EMBaseMessageListItem conversationNotificationLevel](self, "conversationNotificationLevel"),
                    v19 == -[EMBaseMessageListItem conversationNotificationLevel](v4, "conversationNotificationLevel")))
              {
                -[EMBaseMessageListItem brandIndicatorLocation](self, "brandIndicatorLocation");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                -[EMBaseMessageListItem brandIndicatorLocation](v4, "brandIndicatorLocation");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                if (EFObjectsAreEqual())
                {
                  -[EMBaseMessageListItem date](self, "date");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  -[EMBaseMessageListItem date](v4, "date");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  if (EFObjectsAreEqual())
                  {
                    -[EMBaseMessageListItem displayDate](self, "displayDate");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    -[EMBaseMessageListItem displayDate](v4, "displayDate");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    if (EFObjectsAreEqual())
                    {
                      -[EMBaseMessageListItem readLater](self, "readLater");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      -[EMBaseMessageListItem readLater](v4, "readLater");
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      if (EFObjectsAreEqual())
                      {
                        -[EMBaseMessageListItem sendLaterDate](self, "sendLaterDate");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        -[EMBaseMessageListItem sendLaterDate](v4, "sendLaterDate");
                        v38 = (void *)objc_claimAutoreleasedReturnValue();
                        if (EFObjectsAreEqual())
                        {
                          -[EMBaseMessageListItem followUp](self, "followUp");
                          v37 = (void *)objc_claimAutoreleasedReturnValue();
                          -[EMBaseMessageListItem followUp](v4, "followUp");
                          v36 = (void *)objc_claimAutoreleasedReturnValue();
                          if (EFObjectsAreEqual())
                          {
                            -[EMBaseMessageListItem category](self, "category");
                            v35 = (void *)objc_claimAutoreleasedReturnValue();
                            -[EMBaseMessageListItem category](v4, "category");
                            v34 = (void *)objc_claimAutoreleasedReturnValue();
                            if (EFObjectsAreEqual())
                            {
                              -[EMBaseMessageListItem groupedSenderMessageListItems](self, "groupedSenderMessageListItems");
                              v33 = (void *)objc_claimAutoreleasedReturnValue();
                              -[EMBaseMessageListItem groupedSenderMessageListItems](v4, "groupedSenderMessageListItems");
                              v32 = (void *)objc_claimAutoreleasedReturnValue();
                              if (EFArraysAreEqual()
                                && (v20 = -[EMBaseMessageListItem businessID](self, "businessID"),
                                    v20 == -[EMBaseMessageListItem businessID](v4, "businessID")))
                              {
                                -[EMBaseMessageListItem summary](self, "summary");
                                v31 = (void *)objc_claimAutoreleasedReturnValue();
                                -[EMBaseMessageListItem summary](v4, "summary");
                                v30 = (void *)objc_claimAutoreleasedReturnValue();
                                if (EFObjectsAreEqual()
                                  && (v21 = -[EMBaseMessageListItem conversationID](self, "conversationID"),
                                      v21 == -[EMBaseMessageListItem conversationID](v4, "conversationID")))
                                {
                                  -[EMBaseMessageListItem toList](self, "toList");
                                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[EMBaseMessageListItem toList](v4, "toList");
                                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (EFArraysAreEqual())
                                  {
                                    -[EMBaseMessageListItem ccList](self, "ccList");
                                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                                    -[EMBaseMessageListItem ccList](v4, "ccList");
                                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                                    if (EFArraysAreEqual())
                                    {
                                      -[EMBaseMessageListItem bccList](self, "bccList");
                                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                                      -[EMBaseMessageListItem bccList](v4, "bccList");
                                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                                      v23 = EFArraysAreEqual();

                                    }
                                    else
                                    {
                                      v23 = 0;
                                    }

                                  }
                                  else
                                  {
                                    v23 = 0;
                                  }

                                }
                                else
                                {
                                  v23 = 0;
                                }

                              }
                              else
                              {
                                v23 = 0;
                              }

                            }
                            else
                            {
                              v23 = 0;
                            }

                          }
                          else
                          {
                            v23 = 0;
                          }

                        }
                        else
                        {
                          v23 = 0;
                        }

                      }
                      else
                      {
                        v23 = 0;
                      }

                    }
                    else
                    {
                      v23 = 0;
                    }

                  }
                  else
                  {
                    v23 = 0;
                  }

                }
                else
                {
                  v23 = 0;
                }

              }
              else
              {
LABEL_36:
                v23 = 0;
              }

            }
            else
            {
              v23 = 0;
            }

          }
          else
          {
            v23 = 0;
          }

        }
        else
        {
          v23 = 0;
        }

      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  int64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  int64_t v19;
  id v20;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v36.receiver = self;
  v36.super_class = (Class)EMBaseMessageListItem;
  -[EMObject debugDescription](&v36, sel_debugDescription);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMBaseMessageListItem mailboxObjectIDs](self, "mailboxObjectIDs");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "debugDescription");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMBaseMessageListItem senderAddress](self, "senderAddress");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "debugDescription");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMBaseMessageListItem subject](self, "subject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "debugDescription");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMBaseMessageListItem category](self, "category");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "debugDescription");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = -[EMBaseMessageListItem businessID](self, "businessID");
  -[EMBaseMessageListItem toList](self, "toList");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMBaseMessageListItem ccList](self, "ccList");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "debugDescription");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMBaseMessageListItem bccList](self, "bccList");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "debugDescription");
  v19 = v5;
  v33 = (void *)v4;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMBaseMessageListItem flags](self, "flags");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EMBaseMessageListItem conversationNotificationLevel](self, "conversationNotificationLevel");
  if (-[EMBaseMessageListItem isVIP](self, "isVIP"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v18 = v8;
  if (-[EMBaseMessageListItem isBlocked](self, "isBlocked"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = -[EMBaseMessageListItem unsubscribeType](self, "unsubscribeType");
  -[EMBaseMessageListItem conversationID](self, "conversationID");
  EFStringWithInt64();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMBaseMessageListItem date](self, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMBaseMessageListItem displayDate](self, "displayDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMBaseMessageListItem summary](self, "summary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMBaseMessageListItem generatedSummary](self, "generatedSummary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "debugDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n\tMailboxes:%@\n\tSenderAddress:%@\n\tSubject:%@ \n\tCategory:%@\n\tBusinessID:%llu\n\tToList:%@ \n\tCCList:%@ \n\tBCCList:%@ \n\tFlags:%@ \n\tConversationNotificationLevel:%ld \n\tIsVIP:%@ \n\tIsBlocked:%@ \n\tUnsubscribeType:%ld \n\tConversationID:%@ \n\tDate:%@ \n\tDisplayDate:%@ \n\tSummary:%@\tGenerated Summary:%@"), v35, v34, v30, v28, v33, v19, v6, v24, v21, v23, v7, v18, v9, v10, v11, v12,
    v17,
    v16,
    v13);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  return (NSString *)v20;
}

- (NSString)ef_publicDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int64_t v24;
  const __CFString *v25;
  int64_t v26;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int64_t v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  int64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __CFString *v55;
  __CFString *v56;
  void *v57;
  objc_super v58;
  objc_super v59;

  -[EMBaseMessageListItem mailboxesIfAvailable](self, "mailboxesIfAvailable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountIfAvailable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[EMBaseMessageListItem supportsArchiving](self, "supportsArchiving");
    NSStringFromBOOL();
    v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_3:
      -[EMBaseMessageListItem shouldArchiveByDefault](self, "shouldArchiveByDefault");
      NSStringFromBOOL();
      v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    v56 = CFSTR("?");
    if (v6)
      goto LABEL_3;
  }
  v55 = CFSTR("?");
LABEL_6:
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isInternal");

  if (v8)
  {
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6C8]), "initWithStyle:", 2);
    v42 = (void *)MEMORY[0x1E0CB3940];
    v59.receiver = self;
    v59.super_class = (Class)EMBaseMessageListItem;
    -[EMObject ef_publicDescription](&v59, sel_ef_publicDescription);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMObject objectID](self, "objectID");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMBaseMessageListItem mailboxObjectIDs](self, "mailboxObjectIDs");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMBaseMessageListItem senderAddress](self, "senderAddress");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "emailAddressValue");
    v50 = objc_claimAutoreleasedReturnValue();
    -[EMBaseMessageListItem subject](self, "subject");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMBaseMessageListItem category](self, "category");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    EMShortStringForCategory(v48);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[EMBaseMessageListItem businessID](self, "businessID");
    -[EMBaseMessageListItem toList](self, "toList");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "stringFromEmailAddressList:", v46);
    v10 = objc_claimAutoreleasedReturnValue();
    -[EMBaseMessageListItem ccList](self, "ccList");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "stringFromEmailAddressList:", v45);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMBaseMessageListItem bccList](self, "bccList");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "stringFromEmailAddressList:", v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMBaseMessageListItem flags](self, "flags");
    v12 = objc_claimAutoreleasedReturnValue();
    v38 = -[EMBaseMessageListItem conversationNotificationLevel](self, "conversationNotificationLevel");
    if (-[EMBaseMessageListItem isVIP](self, "isVIP"))
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    v36 = v13;
    if (-[EMBaseMessageListItem isBlocked](self, "isBlocked"))
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v34 = v14;
    v33 = -[EMBaseMessageListItem unsubscribeType](self, "unsubscribeType");
    -[EMBaseMessageListItem conversationID](self, "conversationID");
    EFStringWithInt64();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMBaseMessageListItem date](self, "date");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMBaseMessageListItem displayDate](self, "displayDate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMBaseMessageListItem readLater](self, "readLater");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "ef_publicDescription");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMBaseMessageListItem followUp](self, "followUp");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "ef_publicDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0D1EF48];
    -[EMBaseMessageListItem summary](self, "summary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ec_partiallyRedactedStringForSubjectOrSummary:", v31);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMBaseMessageListItem generatedSummary](self, "generatedSummary");
    v18 = v9;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "ef_publicDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)v12;
    v28 = v12;
    v20 = (void *)v10;
    objc_msgSend(v42, "stringWithFormat:", CFSTR("%@\n\tObjectID:%@\n\tMailboxes:%@\n\tSenderAddress:%@\n\tSubject:%@ \n\tCategory:%@\n\tBusinessID:%llu\n\tToList:%@ \n\tCCList:%@ \n\tBCCList:%@ \n\tFlags:%@ \n\tConversationNotificationLevel:%ld \n\tIsVIP:%@ \n\tIsBlocked:%@ \n\tUnsubscribeType:%ld \n\tConversationID:%@ \n\tDate:%@ \n\tDisplayDate:%@ \n\tRemind Me:%@ \n\tFollow Up:%@ \n\tSummary:%@ \n\tGenerated Summary:%@ \n\tSupportsArchiving:%@ \n\tShouldArchive:%@"), v54, v53, v51, v50, v49, v47, v18, v10, v11, v43, v28, v38, v36, v34, v33, v41,
      v40,
      v39,
      v35,
      v15,
      v17,
      v19,
      v56,
      v55);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)v50;
  }
  else
  {
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F088]), "initWithHash:", -[EMBaseMessageListItem conversationID](self, "conversationID"));
    v23 = (void *)MEMORY[0x1E0CB3940];
    v58.receiver = self;
    v58.super_class = (Class)EMBaseMessageListItem;
    -[EMObject ef_publicDescription](&v58, sel_ef_publicDescription);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "ef_publicDescription");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMBaseMessageListItem flags](self, "flags");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "ef_publicDescription");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[EMBaseMessageListItem conversationNotificationLevel](self, "conversationNotificationLevel");
    if (-[EMBaseMessageListItem isBlocked](self, "isBlocked"))
      v25 = CFSTR("YES");
    else
      v25 = CFSTR("NO");
    v26 = -[EMBaseMessageListItem unsubscribeType](self, "unsubscribeType");
    -[EMBaseMessageListItem date](self, "date");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("%@ \n\tConversationID:%@ \n\tFlags:%@ \n\tConversationNotificationLevel:%ld \n\tIsBlocked:%@ \n\tunsubscribeType:%ld \n\tDate:%@ \n\tSupports Archiving:%@ \n\tShould Archive By Default:%@"), v54, v53, v52, v24, v25, v26, v22, v56, v55);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v21;
}

- (id)flagDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMObject objectID](self, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMBaseMessageListItem conversationID](self, "conversationID");
  EFStringWithInt64();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMBaseMessageListItem flags](self, "flags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> ObjectID:%@, ConversationID:%@, Flags:%@"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMBaseMessageListItem)initWithCoder:(id)a3
{
  id v4;
  EMBaseMessageListItem *v5;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMBaseMessageListItem;
  v5 = -[EMObject initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__EMBaseMessageListItem_initWithCoder___block_invoke;
    v7[3] = &unk_1E70F21C8;
    v8 = v4;
    -[EMBaseMessageListItem _commonInitWithBaseBuilder:](v5, "_commonInitWithBaseBuilder:", v7);

  }
  return v5;
}

void __39__EMBaseMessageListItem_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;

  v50 = a2;
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_subject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setSubject:", v3);

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("EFPropertyKey_mailboxObjectIDs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setMailboxObjectIDs:", v8);

  v9 = *(void **)(a1 + 32);
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "decodeObjectOfClasses:forKey:", v12, CFSTR("EFPropertyKey_senderAddress"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setSenderAddress:", v13);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_flags"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setFlags:", v14);

  objc_msgSend(v50, "setIsVIP:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", CFSTR("EFPropertyKey_isVIP")));
  objc_msgSend(v50, "setIsBlocked:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", CFSTR("EFPropertyKey_isBlocked")));
  objc_msgSend(v50, "setUnsubscribeType:", objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", CFSTR("EFPropertyKey_unsubscribeType")));
  objc_msgSend(v50, "setIsToMe:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", CFSTR("EFPropertyKey_isToMe")));
  objc_msgSend(v50, "setIsCCMe:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", CFSTR("EFPropertyKey_isCCMe")));
  objc_msgSend(v50, "setHasAttachments:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", CFSTR("EFPropertyKey_hasAttachments")));
  objc_msgSend(v50, "setIsAuthenticated:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", CFSTR("EFPropertyKey_isAuthenticated")));
  v15 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "decodeObjectOfClasses:forKey:", v16, CFSTR("EFPropertyKey_conversationNotificationLevel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setConversationNotificationLevel:", objc_msgSend(v17, "integerValue"));

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_brandIndicatorLocation"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setBrandIndicatorLocation:", v18);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_date"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setDate:", v19);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_displayDate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setDisplayDate:", v20);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_readLater"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setReadLater:", v21);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_sendLaterDate"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setSendLaterDate:", v22);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_followUp"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setFollowUp:", v23);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_category"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setCategory:", v24);

  v25 = *(void **)(a1 + 32);
  v26 = (void *)MEMORY[0x1E0C99E60];
  v27 = objc_opt_class();
  objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "decodeObjectOfClasses:forKey:", v28, CFSTR("EFPropertyKey_groupedSenderMessageListItems"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setGroupedSenderMessageListItems:", v29);

  objc_msgSend(v50, "setBusinessID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", CFSTR("EFPropertyKey_businessID")));
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_summary"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setSummary:", v30);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_generatedSummary"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setGeneratedSummary:", v31);

  objc_msgSend(v50, "setConversationID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", CFSTR("EFPropertyKey_conversationID")));
  v32 = *(void **)(a1 + 32);
  v33 = (void *)MEMORY[0x1E0C99E60];
  v34 = objc_opt_class();
  v35 = objc_opt_class();
  objc_msgSend(v33, "setWithObjects:", v34, v35, objc_opt_class(), 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "decodeObjectOfClasses:forKey:", v36, CFSTR("EFPropertyKey_toList"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setToList:", v37);

  v38 = *(void **)(a1 + 32);
  v39 = (void *)MEMORY[0x1E0C99E60];
  v40 = objc_opt_class();
  v41 = objc_opt_class();
  objc_msgSend(v39, "setWithObjects:", v40, v41, objc_opt_class(), 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "decodeObjectOfClasses:forKey:", v42, CFSTR("EFPropertyKey_ccList"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setCcList:", v43);

  v44 = *(void **)(a1 + 32);
  v45 = (void *)MEMORY[0x1E0C99E60];
  v46 = objc_opt_class();
  v47 = objc_opt_class();
  objc_msgSend(v45, "setWithObjects:", v46, v47, objc_opt_class(), 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "decodeObjectOfClasses:forKey:", v48, CFSTR("EFPropertyKey_bccList"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setBccList:", v49);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)EMBaseMessageListItem;
  -[EMObject encodeWithCoder:](&v23, sel_encodeWithCoder_, v4);
  -[EMBaseMessageListItem subject](self, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_subject"));

  -[EMBaseMessageListItem mailboxObjectIDs](self, "mailboxObjectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_mailboxObjectIDs"));

  -[EMBaseMessageListItem senderAddress](self, "senderAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_senderAddress"));

  -[EMBaseMessageListItem flags](self, "flags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("EFPropertyKey_flags"));

  objc_msgSend(v4, "encodeBool:forKey:", -[EMBaseMessageListItem isVIP](self, "isVIP"), CFSTR("EFPropertyKey_isVIP"));
  objc_msgSend(v4, "encodeBool:forKey:", -[EMBaseMessageListItem isBlocked](self, "isBlocked"), CFSTR("EFPropertyKey_isBlocked"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[EMBaseMessageListItem unsubscribeType](self, "unsubscribeType"), CFSTR("EFPropertyKey_unsubscribeType"));
  objc_msgSend(v4, "encodeBool:forKey:", -[EMBaseMessageListItem isToMe](self, "isToMe"), CFSTR("EFPropertyKey_isToMe"));
  objc_msgSend(v4, "encodeBool:forKey:", -[EMBaseMessageListItem isCCMe](self, "isCCMe"), CFSTR("EFPropertyKey_isCCMe"));
  objc_msgSend(v4, "encodeBool:forKey:", -[EMBaseMessageListItem hasAttachments](self, "hasAttachments"), CFSTR("EFPropertyKey_hasAttachments"));
  objc_msgSend(v4, "encodeBool:forKey:", -[EMBaseMessageListItem isAuthenticated](self, "isAuthenticated"), CFSTR("EFPropertyKey_isAuthenticated"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[EMBaseMessageListItem conversationNotificationLevel](self, "conversationNotificationLevel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("EFPropertyKey_conversationNotificationLevel"));

  -[EMBaseMessageListItem brandIndicatorLocation](self, "brandIndicatorLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("EFPropertyKey_brandIndicatorLocation"));

  -[EMBaseMessageListItem date](self, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("EFPropertyKey_date"));

  -[EMBaseMessageListItem displayDate](self, "displayDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("EFPropertyKey_displayDate"));

  -[EMBaseMessageListItem readLater](self, "readLater");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("EFPropertyKey_readLater"));

  -[EMBaseMessageListItem sendLaterDate](self, "sendLaterDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("EFPropertyKey_sendLaterDate"));

  -[EMBaseMessageListItem followUp](self, "followUp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("EFPropertyKey_followUp"));

  -[EMBaseMessageListItem category](self, "category");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("EFPropertyKey_category"));

  -[EMBaseMessageListItem groupedSenderMessageListItems](self, "groupedSenderMessageListItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("EFPropertyKey_groupedSenderMessageListItems"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[EMBaseMessageListItem businessID](self, "businessID"), CFSTR("EFPropertyKey_businessID"));
  -[EMBaseMessageListItem summary](self, "summary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("EFPropertyKey_summary"));

  -[EMBaseMessageListItem generatedSummary](self, "generatedSummary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("EFPropertyKey_generatedSummary"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[EMBaseMessageListItem conversationID](self, "conversationID"), CFSTR("EFPropertyKey_conversationID"));
  -[EMBaseMessageListItem toList](self, "toList");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("EFPropertyKey_toList"));

  -[EMBaseMessageListItem ccList](self, "ccList");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("EFPropertyKey_ccList"));

  -[EMBaseMessageListItem bccList](self, "bccList");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("EFPropertyKey_bccList"));

}

- (EMCollectionItemID)itemID
{
  -[EMBaseMessageListItem doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMBaseMessageListItem itemID]", "EMBaseMessageListItem.m", 458, "0");
}

- (unint64_t)count
{
  return 1;
}

- (NSArray)mailboxObjectIDs
{
  os_unfair_lock_s *p_mailboxesLock;
  NSArray *v4;

  p_mailboxesLock = &self->_mailboxesLock;
  os_unfair_lock_lock(&self->_mailboxesLock);
  v4 = self->_mailboxObjectIDs;
  os_unfair_lock_unlock(p_mailboxesLock);
  return v4;
}

- (void)setMailboxObjectIDs:(id)a3
{
  NSArray *v4;
  NSArray *mailboxObjectIDs;
  NSArray *mailboxes;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_mailboxesLock);
  if ((EFArraysAreEqual() & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v7, "copy");
    mailboxObjectIDs = self->_mailboxObjectIDs;
    self->_mailboxObjectIDs = v4;

    mailboxes = self->_mailboxes;
    self->_mailboxes = 0;

    self->_isEditable = 0;
  }
  os_unfair_lock_unlock(&self->_mailboxesLock);

}

- (NSArray)mailboxes
{
  os_unfair_lock_s *p_mailboxesLock;
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  p_mailboxesLock = &self->_mailboxesLock;
  os_unfair_lock_lock(&self->_mailboxesLock);
  v4 = self->_mailboxes;
  os_unfair_lock_unlock(p_mailboxesLock);
  if (!v4)
  {
    -[EMBaseMessageListItem repository](self, "repository");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mailboxRepository");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0D1EEC0];
      -[EMBaseMessageListItem repository](self, "repository");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "mailboxRepository");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMBaseMessageListItem mailboxObjectIDs](self, "mailboxObjectIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mailboxesForObjectIDs:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "combine:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "result:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ef_filter:", *MEMORY[0x1E0D1ED88]);
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[EMBaseMessageListItem log](EMBaseMessageListItem, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[EMBaseMessageListItem mailboxes].cold.1(v14);

      v4 = (NSArray *)MEMORY[0x1E0C9AA60];
    }

  }
  return v4;
}

- (NSArray)mailboxesIfAvailable
{
  os_unfair_lock_s *p_mailboxesLock;
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  p_mailboxesLock = &self->_mailboxesLock;
  os_unfair_lock_lock(&self->_mailboxesLock);
  v4 = self->_mailboxes;
  os_unfair_lock_unlock(p_mailboxesLock);
  if (!v4)
  {
    -[EMBaseMessageListItem repository](self, "repository");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mailboxRepository");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[EMBaseMessageListItem mailboxObjectIDs](self, "mailboxObjectIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mailboxesIfAvailableForObjectIDs:", v7);
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[EMBaseMessageListItem log](EMBaseMessageListItem, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[EMBaseMessageListItem mailboxesIfAvailable].cold.1(v8);

      v4 = (NSArray *)MEMORY[0x1E0C9AA60];
    }

  }
  return v4;
}

- (void)setMailboxes:(id)a3
{
  NSArray *v4;
  NSArray *mailboxes;
  NSArray *v6;
  NSArray *mailboxObjectIDs;
  id v8;

  v8 = a3;
  os_unfair_lock_lock(&self->_mailboxesLock);
  v4 = (NSArray *)objc_msgSend(v8, "copy");
  mailboxes = self->_mailboxes;
  self->_mailboxes = v4;

  objc_msgSend(v8, "ef_mapSelector:", sel_objectID);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  mailboxObjectIDs = self->_mailboxObjectIDs;
  self->_mailboxObjectIDs = v6;

  self->_isEditable = 0;
  os_unfair_lock_unlock(&self->_mailboxesLock);

}

- (BOOL)hasUnflagged
{
  void *v2;
  char v3;

  -[EMBaseMessageListItem flags](self, "flags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "flagged") ^ 1;

  return v3;
}

- (void)setHasUnflagged:(BOOL)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  BOOL v10;

  v5 = objc_alloc(MEMORY[0x1E0D1E778]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__EMBaseMessageListItem_setHasUnflagged___block_invoke;
  v9[3] = &__block_descriptor_33_e38_v16__0___ECMessageFlagChangeBuilder__8l;
  v10 = a3;
  v8 = (id)objc_msgSend(v5, "initWithBuilder:", v9);
  -[EMBaseMessageListItem flags](self, "flags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flagsAfterChangingFlags:flagsWereChanged:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMBaseMessageListItem setFlags:](self, "setFlags:", v7);

}

uint64_t __41__EMBaseMessageListItem_setHasUnflagged___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "changesFlaggedTo:", *(_BYTE *)(a1 + 32) == 0);
}

- (NSIndexSet)flagColors
{
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;

  -[EMBaseMessageListItem flags](self, "flags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "flagged");

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB36B8]);
    -[EMBaseMessageListItem flags](self, "flags");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithIndex:", objc_msgSend(v6, "flagColor"));

  }
  else
  {
    v7 = 0;
  }
  return (NSIndexSet *)v7;
}

- (void)setFlagColors:(id)a3
{
  void *v4;
  int v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  v11 = a3;
  -[EMBaseMessageListItem flags](self, "flags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "flagged");

  if (v5)
  {
    v6 = objc_msgSend(v11, "firstIndex");
    if (v6 <= 6)
    {
      v7 = objc_alloc(MEMORY[0x1E0D1E778]);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __39__EMBaseMessageListItem_setFlagColors___block_invoke;
      v12[3] = &__block_descriptor_40_e38_v16__0___ECMessageFlagChangeBuilder__8l;
      v12[4] = v6;
      v8 = (void *)objc_msgSend(v7, "initWithBuilder:", v12);
      -[EMBaseMessageListItem flags](self, "flags");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "flagsAfterChangingFlags:flagsWereChanged:", v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMBaseMessageListItem setFlags:](self, "setFlags:", v10);

    }
  }

}

uint64_t __39__EMBaseMessageListItem_setFlagColors___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "changesFlagColorTo:", *(_QWORD *)(a1 + 32));
}

- (NSArray)senderList
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[EMBaseMessageListItem senderAddress](self, "senderAddress");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v4;
}

- (void)setSenderList:(id)a3
{
  id v4;

  objc_msgSend(a3, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EMBaseMessageListItem setSenderAddress:](self, "setSenderAddress:");

}

- (void)setDisplayMessageItemID:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMBaseMessageListItem.m"), 572, CFSTR("displayMessageItemID cannot be set on EMMessage"));

}

- (EFFuture)displayMessage
{
  return (EFFuture *)objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", self);
}

- (BOOL)deleteMovesToTrash
{
  void *v2;
  BOOL v3;

  -[EMBaseMessageListItem mailboxes](self, "mailboxes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[EMMailbox deleteMovesToTrashForMailboxes:](EMMailbox, "deleteMovesToTrashForMailboxes:", v2);

  return v3;
}

- (BOOL)supportsArchiving
{
  void *v2;
  BOOL v3;

  -[EMBaseMessageListItem mailboxes](self, "mailboxes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[EMMailbox supportsArchivingForMailboxes:](EMMailbox, "supportsArchivingForMailboxes:", v2);

  return v3;
}

- (BOOL)shouldArchiveByDefault
{
  void *v2;
  BOOL v3;

  -[EMBaseMessageListItem mailboxes](self, "mailboxes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[EMMailbox supportsArchivingForMailboxes:](EMMailbox, "supportsArchivingForMailboxes:", v2))
    v3 = +[EMMailbox shouldArchiveByDefaultForMailboxes:](EMMailbox, "shouldArchiveByDefaultForMailboxes:", v2);
  else
    v3 = 0;

  return v3;
}

- (BOOL)isEditable
{
  unint64_t isEditable;
  void *v4;
  int v5;

  isEditable = self->_isEditable;
  if (!isEditable)
  {
    -[EMBaseMessageListItem mailboxes](self, "mailboxes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ef_any:", &__block_literal_global_1);

    isEditable = 1;
    if (v5)
      isEditable = 2;
    self->_isEditable = isEditable;
  }
  return isEditable == 2;
}

BOOL __35__EMBaseMessageListItem_isEditable__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "type") == 5 || objc_msgSend(v2, "type") == 6;

  return v3;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSDate)displayDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDisplayDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (ECSubject)subject
{
  return (ECSubject *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSubject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSArray)groupedSenderMessageListItems
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setGroupedSenderMessageListItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)summary
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSummary:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (EMGeneratedSummary)generatedSummary
{
  return (EMGeneratedSummary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setGeneratedSummary:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (ECMessageFlags)flags
{
  return (ECMessageFlags *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFlags:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BOOL)isVIP
{
  return self->_isVIP;
}

- (void)setIsVIP:(BOOL)a3
{
  self->_isVIP = a3;
}

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (void)setIsBlocked:(BOOL)a3
{
  self->_isBlocked = a3;
}

- (int64_t)unsubscribeType
{
  return self->_unsubscribeType;
}

- (void)setUnsubscribeType:(int64_t)a3
{
  self->_unsubscribeType = a3;
}

- (BOOL)hasAttachments
{
  return self->_hasAttachments;
}

- (void)setHasAttachments:(BOOL)a3
{
  self->_hasAttachments = a3;
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (void)setIsAuthenticated:(BOOL)a3
{
  self->_isAuthenticated = a3;
}

- (int64_t)conversationNotificationLevel
{
  return self->_conversationNotificationLevel;
}

- (void)setConversationNotificationLevel:(int64_t)a3
{
  self->_conversationNotificationLevel = a3;
}

- (NSURL)brandIndicatorLocation
{
  return self->_brandIndicatorLocation;
}

- (void)setBrandIndicatorLocation:(id)a3
{
  objc_storeStrong((id *)&self->_brandIndicatorLocation, a3);
}

- (int64_t)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(int64_t)a3
{
  self->_conversationID = a3;
}

- (NSArray)toList
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setToList:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (NSArray)ccList
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCcList:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (EMReadLater)readLater
{
  return (EMReadLater *)objc_getProperty(self, a2, 168, 1);
}

- (void)setReadLater:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSDate)sendLaterDate
{
  return (NSDate *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSendLaterDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (EMFollowUp)followUp
{
  return (EMFollowUp *)objc_getProperty(self, a2, 184, 1);
}

- (void)setFollowUp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (EMCategory)category
{
  return (EMCategory *)objc_getProperty(self, a2, 192, 1);
}

- (void)setCategory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (int64_t)businessID
{
  return self->_businessID;
}

- (void)setBusinessID:(int64_t)a3
{
  self->_businessID = a3;
}

- (BOOL)isToMe
{
  return self->_isToMe;
}

- (void)setIsToMe:(BOOL)a3
{
  self->_isToMe = a3;
}

- (BOOL)isCCMe
{
  return self->_isCCMe;
}

- (void)setIsCCMe:(BOOL)a3
{
  self->_isCCMe = a3;
}

- (ECEmailAddressConvertible)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
  objc_storeStrong((id *)&self->_senderAddress, a3);
}

- (NSArray)bccList
{
  return self->_bccList;
}

- (void)setBccList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bccList, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_followUp, 0);
  objc_storeStrong((id *)&self->_sendLaterDate, 0);
  objc_storeStrong((id *)&self->_readLater, 0);
  objc_storeStrong((id *)&self->_ccList, 0);
  objc_storeStrong((id *)&self->_toList, 0);
  objc_storeStrong((id *)&self->_brandIndicatorLocation, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_generatedSummary, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_groupedSenderMessageListItems, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_mailboxObjectIDs, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
}

- (void)mailboxes
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B99BB000, log, OS_LOG_TYPE_FAULT, "No mailboxes or mailbox repository set", v1, 2u);
}

- (void)mailboxesIfAvailable
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B99BB000, log, OS_LOG_TYPE_ERROR, "No mailboxes or mailbox repository set", v1, 2u);
}

@end
