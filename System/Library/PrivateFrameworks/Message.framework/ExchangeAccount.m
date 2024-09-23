@implementation ExchangeAccount

+ (id)accountTypeString
{
  return CFSTR("Exchange");
}

- (Class)connectionClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_syncOnly_defaultValueForShouldStoreJunkOnServer
{
  return 1;
}

- (BOOL)storeDraftsOnServer
{
  return -[MFAccount _BOOLForAccountInfoKey:defaultValue:](self, "_BOOLForAccountInfoKey:defaultValue:", CFSTR("StoreDraftsOnServer"), 1);
}

- (BOOL)storeSentMessagesOnServer
{
  return -[MFAccount _BOOLForAccountInfoKey:defaultValue:](self, "_BOOLForAccountInfoKey:defaultValue:", CFSTR("StoreSentMessagesOnServer"), 1);
}

- (id)_defaultSpecialMailboxNameForType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 4)
    return CFSTR("Sent Items");
  if (a3 == 3)
  {
    v5 = CFSTR("Deleted Items");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = self;
    v7.super_class = (Class)ExchangeAccount;
    -[MailAccount _defaultSpecialMailboxNameForType:](&v7, sel__defaultSpecialMailboxNameForType_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)filterMailboxList:(id)a3 forMailbox:(id)a4 options:(int64_t)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a4;
  if ((unint64_t)(a5 - 1) <= 1)
    -[ExchangeAccount _filterMailboxList:forMailboxWithPath:iisServer:](self, "_filterMailboxList:forMailboxWithPath:iisServer:", v9, v8, 0);

}

- (void)_filterMailboxList:(id)a3 forMailboxWithPath:(id)a4 iisServer:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v7 = a4;
  v8 = a5;
  if (!v16 || !objc_msgSend(v16, "count"))
    goto LABEL_22;
  if (v7)
  {
    v9 = objc_msgSend(v7, "length");
    v10 = v9 == 0;
    if (!v8)
    {
      if (v9)
        goto LABEL_22;
      goto LABEL_13;
    }
LABEL_9:
    if (objc_msgSend(v8, "length"))
      v11 = 0;
    else
      v11 = v10;
    if (!v11)
      goto LABEL_22;
    goto LABEL_13;
  }
  if (v8)
  {
    v10 = 1;
    goto LABEL_9;
  }
LABEL_13:
  v12 = objc_msgSend(v16, "count");
  if (v12)
  {
    v13 = v12 - 1;
    do
    {
      objc_msgSend(v16, "objectAtIndex:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", CFSTR("MailboxName"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(CFSTR("Contacts"), "isEqualToString:", v15) & 1) != 0
        || (objc_msgSend(CFSTR("Calendar"), "isEqualToString:", v15) & 1) != 0
        || (objc_msgSend(CFSTR("Journal"), "isEqualToString:", v15) & 1) != 0
        || (objc_msgSend(CFSTR("Notes"), "isEqualToString:", v15) & 1) != 0
        || objc_msgSend(CFSTR("Tasks"), "isEqualToString:", v15))
      {
        objc_msgSend(v16, "removeObjectAtIndex:", v13);
      }

      --v13;
    }
    while (v13 != -1);
  }
LABEL_22:

}

- (BOOL)shouldFetchACEDBInfoForError:(id)a3
{
  return 0;
}

@end
