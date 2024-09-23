@implementation ABFacebookMigrator

- (ABFacebookMigrator)initWithAddressBook:(void *)a3
{
  void *v5;
  ABFacebookMigrator *v6;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ABFacebookMigrator initWithAddressBook:accountStore:](self, "initWithAddressBook:accountStore:", a3, v5);

  return v6;
}

- (ABFacebookMigrator)initWithAddressBook:(void *)a3 accountStore:(id)a4
{
  id v7;
  ABFacebookMigrator *v8;
  void *v9;
  ABFacebookMigrator *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ABFacebookMigrator;
  v8 = -[ABFacebookMigrator init](&v12, sel_init);
  if (v8)
  {
    if (a3)
      v9 = (void *)CFRetain(a3);
    else
      v9 = 0;
    v8->_addressBook = v9;
    objc_storeStrong((id *)&v8->_accountStore, a4);
    v8->_facebookSource = 0;
    v8->_mayHaveFacebookSource = 0;
    v10 = v8;
  }

  return v8;
}

- (void)dealloc
{
  void *addressBook;
  void *facebookSource;
  objc_super v5;

  addressBook = self->_addressBook;
  if (addressBook)
    CFRelease(addressBook);
  facebookSource = self->_facebookSource;
  if (facebookSource)
    CFRelease(facebookSource);
  v5.receiver = self;
  v5.super_class = (Class)ABFacebookMigrator;
  -[ABFacebookMigrator dealloc](&v5, sel_dealloc);
}

+ (BOOL)isSourceFacebook:(void *)a3
{
  void *v4;

  ABAccountStoreGetAccountTypeForSource(0, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "isAccountTypeFacebook:", v4);

  return (char)a1;
}

+ (BOOL)isAccountTypeFacebook:(id)a3
{
  return objc_msgSend(CFSTR("com.apple.account.facebookLegacy"), "isEqualToString:", a3);
}

+ (BOOL)mayHaveFacebookContacts:(void *)a3
{
  ABFacebookMigrator *v3;
  char v4;

  v3 = -[ABFacebookMigrator initWithAddressBook:]([ABFacebookMigrator alloc], "initWithAddressBook:", a3);
  -[ABFacebookMigrator _detectFacebookSource](v3, "_detectFacebookSource");
  if (-[ABFacebookMigrator facebookSource](v3, "facebookSource"))
    v4 = 1;
  else
    v4 = -[ABFacebookMigrator mayHaveFacebookSource](v3, "mayHaveFacebookSource");

  return v4;
}

- (void)setCheckDone:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[ABFacebookMigrator addressBook](self, "addressBook", a3);
  ABAddressBookSetIntegerProperty((uint64_t)v3, (uint64_t)CFSTR("FacebookCheckDone"), 1, v4, v5, v6, v7, v8, v9);
}

- (BOOL)isCheckDone
{
  return ABAddressBookGetIntegerProperty((uint64_t)-[ABFacebookMigrator addressBook](self, "addressBook")) == 1;
}

- (BOOL)canMergeFacebookContacts
{
  if (-[ABFacebookMigrator isCheckDone](self, "isCheckDone"))
    return 0;
  -[ABFacebookMigrator _detectFacebookSource](self, "_detectFacebookSource");
  if (!-[ABFacebookMigrator facebookSource](self, "facebookSource"))
  {
    if (!-[ABFacebookMigrator mayHaveFacebookSource](self, "mayHaveFacebookSource"))
      -[ABFacebookMigrator setCheckDone:](self, "setCheckDone:", 1);
    return 0;
  }
  if (!-[ABFacebookMigrator facebookContactsCount](self, "facebookContactsCount"))
  {
    -[ABFacebookMigrator deleteFacebookContacts](self, "deleteFacebookContacts");
    return 0;
  }
  -[ABFacebookMigrator setMergeDestinationSourceID:](self, "setMergeDestinationSourceID:", -[ABFacebookMigrator findBestMergeDestinationSourceID](self, "findBestMergeDestinationSourceID"));
  return 1;
}

- (void)mergeFacebookContacts
{
  -[ABFacebookMigrator _startDatabaseDoctorToPerformAction:](self, "_startDatabaseDoctorToPerformAction:", CFSTR("MergeFacebookContacts"));
}

- (void)deleteFacebookContacts
{
  -[ABFacebookMigrator _startDatabaseDoctorToPerformAction:](self, "_startDatabaseDoctorToPerformAction:", CFSTR("DeleteFacebookContacts"));
}

- (void)_detectFacebookSource
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  const void *v8;
  void *v9;
  void *v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[ABFacebookMigrator isCheckDone](self, "isCheckDone"))
  {
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v3 = (id)ABAddressBookCopyArrayOfAllSourcesIncludingDisabledSources((uint64_t)-[ABFacebookMigrator addressBook](self, "addressBook"), 1);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v11 = 0;
      v6 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(const void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (ABRecordGetIntValue((uint64_t)v8, kABSourceTypeProperty))
          {
            -[ABFacebookMigrator accountStore](self, "accountStore");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            ABAccountStoreGetAccountTypeForSource(v9, (uint64_t)v8);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            if (v10)
            {
              if (+[ABFacebookMigrator isAccountTypeFacebook:](ABFacebookMigrator, "isAccountTypeFacebook:", v10))
              {
                -[ABFacebookMigrator setFacebookSource:](self, "setFacebookSource:", CFRetain(v8));

                goto LABEL_17;
              }
            }
            else
            {
              v11 = 1;
            }

          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }
    else
    {
      v11 = 0;
    }
LABEL_17:

    if (-[ABFacebookMigrator facebookSource](self, "facebookSource"))
      -[ABFacebookMigrator setFacebookContactsCount:](self, "setFacebookContactsCount:", ABAddressBookGetPersonCountInSource((uint64_t)-[ABFacebookMigrator addressBook](self, "addressBook"), -[ABFacebookMigrator facebookSource](self, "facebookSource")));
    else
      -[ABFacebookMigrator setMayHaveFacebookSource:](self, "setMayHaveFacebookSource:", v11 & 1);

  }
}

- (int)findBestMergeDestinationSourceID
{
  ABRecordRef v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  ABAccountScorer *v7;
  ABAccountScorer *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  ABAccountScorer *v12;
  void *v13;
  void *v14;
  ABAccountScorer *v15;
  double v16;
  double v17;
  double v18;
  ABAccountScorer *v19;
  double v20;
  double v21;
  double v22;
  ABAccountScorer *v23;
  ABRecordID v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const void *v32;
  void *v33;
  id obj;
  unsigned int RecordID;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = ABAddressBookCopyDefaultSource(-[ABFacebookMigrator addressBook](self, "addressBook"));
  RecordID = ABRecordGetRecordID(v3);
  CFRelease(v3);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v4 = (id)ABAddressBookCopyArrayOfAllAccounts((uint64_t)-[ABFacebookMigrator addressBook](self, "addressBook"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (!v5)
  {

    v7 = 0;
    goto LABEL_16;
  }
  v6 = v5;
  obj = v4;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v38;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v38 != v9)
        objc_enumerationMutation(obj);
      v11 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
      v12 = [ABAccountScorer alloc];
      v13 = -[ABFacebookMigrator addressBook](self, "addressBook");
      -[ABFacebookMigrator accountStore](self, "accountStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[ABAccountScorer initWithAddressBook:accountStore:account:defaultSourceID:](v12, "initWithAddressBook:accountStore:account:defaultSourceID:", v13, v14, v11, RecordID);

      -[ABAccountScorer calculateScore](v15, "calculateScore");
      -[ABAccountScorer score](v15, "score");
      v17 = v16;
      -[ABAccountScorer score](v8, "score");
      if (v17 <= v18)
      {
        -[ABAccountScorer score](v15, "score");
        v21 = v20;
        -[ABAccountScorer score](v7, "score");
        v19 = v15;
        if (v21 <= v22)
          goto LABEL_10;
      }
      else
      {
        v19 = v8;

        v7 = v19;
        v8 = v15;
      }
      v23 = v15;

      v7 = v19;
LABEL_10:

    }
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  }
  while (v6);
  v4 = obj;

  if (!v8)
  {
LABEL_16:
    v32 = ABAddressBookCopyLocalSource((uint64_t)-[ABFacebookMigrator addressBook](self, "addressBook"));
    v24 = ABRecordGetRecordID(v32);
    CFRelease(v32);
    v8 = 0;
    goto LABEL_18;
  }
  v24 = -[ABAccountScorer sourceID](v8, "sourceID");
  -[ABAccountScorer accountType](v8, "accountType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABAccountScorer accountType](v7, "accountType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "isEqualToString:", v26);

  if (v27)
  {
    v28 = (void *)MEMORY[0x1E0CB3940];
    -[ABAccountScorer accountTypeDescription](v8, "accountTypeDescription");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABAccountScorer accountDisambiguationDescription](v8, "accountDisambiguationDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%@ - %@"), v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABFacebookMigrator setDestinationDescription:](self, "setDestinationDescription:", v31);

  }
  else
  {
    -[ABAccountScorer accountTypeDescription](v8, "accountTypeDescription");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABFacebookMigrator setDestinationDescription:](self, "setDestinationDescription:", v33);

  }
LABEL_18:

  return v24;
}

- (void)_startDatabaseDoctorToPerformAction:(id)a3
{
  const void *AccountForSource;
  CFTypeRef v5;
  const void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v22 = a3;
  AccountForSource = (const void *)ABAddressBookGetAccountForSource((uint64_t)-[ABFacebookMigrator addressBook](self, "addressBook"), (uint64_t)-[ABFacebookMigrator facebookSource](self, "facebookSource"));
  if (AccountForSource)
  {
    v5 = ABAccountCopyIdentifier(AccountForSource);
    if (v5)
    {
      v6 = v5;
      v7 = -[ABFacebookMigrator addressBook](self, "addressBook");
      ABAddressBookSetValueForProperty((uint64_t)v7, (uint64_t)v22, (uint64_t)v6, v8, v9, v10, v11, v12, v20);
      CFRelease(v6);
      if (objc_msgSend(v22, "isEqualToString:", CFSTR("MergeFacebookContacts")))
      {
        v13 = -[ABFacebookMigrator addressBook](self, "addressBook");
        v14 = -[ABFacebookMigrator mergeDestinationSourceID](self, "mergeDestinationSourceID");
        ABAddressBookSetIntegerProperty((uint64_t)v13, (uint64_t)CFSTR("MergeFacebookContactsToSourceID"), v14, v15, v16, v17, v18, v19, v21);
      }
      ABStartDatabaseDoctor((uint64_t)-[ABFacebookMigrator addressBook](self, "addressBook"));
    }
  }

}

- (void)performPendingMergeOrDeleteAction
{
  uint64_t v3;
  const void *v4;
  const void *v5;
  uint64_t IntegerProperty;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  const void *v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if (!-[ABFacebookMigrator isCheckDone](self, "isCheckDone"))
  {
    v3 = ABAddressBookCopyValueForProperty((uint64_t)-[ABFacebookMigrator addressBook](self, "addressBook"));
    if (v3)
    {
      v4 = (const void *)v3;
      v5 = ABAddressBookCopyAccountWithIdentifier((uint64_t)-[ABFacebookMigrator addressBook](self, "addressBook"), v3);
      CFRelease(v4);
      IntegerProperty = ABAddressBookGetIntegerProperty((uint64_t)-[ABFacebookMigrator addressBook](self, "addressBook"));
      if (v5)
      {
        if (-[ABFacebookMigrator _mergeContactsFromAccount:toDestinationSourceID:](self, "_mergeContactsFromAccount:toDestinationSourceID:", v5, IntegerProperty))
        {
          v7 = -[ABFacebookMigrator _removeContactsAccount:](self, "_removeContactsAccount:", v5);
          CFRelease(v5);
          if (v7)
          {
            v8 = -[ABFacebookMigrator addressBook](self, "addressBook");
            ABAddressBookSetValueForProperty((uint64_t)v8, (uint64_t)CFSTR("MergeFacebookContacts"), 0, v9, v10, v11, v12, v13, v24);
            -[ABFacebookMigrator setCheckDone:](self, "setCheckDone:", 1);
          }
        }
        else
        {
          CFRelease(v5);
        }
      }
    }
    v14 = ABAddressBookCopyValueForProperty((uint64_t)-[ABFacebookMigrator addressBook](self, "addressBook"));
    if (v14)
    {
      v15 = (const void *)v14;
      v16 = ABAddressBookCopyAccountWithIdentifier((uint64_t)-[ABFacebookMigrator addressBook](self, "addressBook"), v14);
      CFRelease(v15);
      if (v16)
      {
        v17 = -[ABFacebookMigrator _removeContactsAccount:](self, "_removeContactsAccount:", v16);
        CFRelease(v16);
        if (v17)
        {
          v18 = -[ABFacebookMigrator addressBook](self, "addressBook");
          ABAddressBookSetValueForProperty((uint64_t)v18, (uint64_t)CFSTR("DeleteFacebookContacts"), 0, v19, v20, v21, v22, v23, v24);
          -[ABFacebookMigrator setCheckDone:](self, "setCheckDone:", 1);
        }
      }
    }
  }
}

- (BOOL)_mergeContactsFromAccount:(void *)a3 toDestinationSourceID:(int)a4
{
  ABRecordRef SourceWithRecordID;
  const void *v7;
  ABPropertyID v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  SourceWithRecordID = ABAddressBookGetSourceWithRecordID(-[ABFacebookMigrator addressBook](self, "addressBook"), a4);
  if (SourceWithRecordID)
  {
    v7 = SourceWithRecordID;
    if (!ABRecordGetIntValue((uint64_t)SourceWithRecordID, kABSourceTypeProperty))
    {
      v8 = kABSourceEnabledProperty;
      if (!ABRecordGetIntValue((uint64_t)v7, kABSourceEnabledProperty))
        ABRecordSetValue(v7, v8, (CFTypeRef)*MEMORY[0x1E0C9AE50], 0);
    }
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = (id)ABAddressBookCopyArrayOfAllSourcesInAccount((uint64_t)-[ABFacebookMigrator addressBook](self, "addressBook"), a3);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v9);
          v12 |= ABAddressBookMergeRecordsInSourceIntoSource((const __CFString *)-[ABFacebookMigrator addressBook](self, "addressBook", (_QWORD)v16), *(const void **)(*((_QWORD *)&v16 + 1) + 8 * i), v7);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }
  return v12 & 1;
}

- (BOOL)_removeContactsAccount:(void *)a3
{
  BOOL v4;

  v4 = ABAddressBookRemoveRecord(-[ABFacebookMigrator addressBook](self, "addressBook"), a3, 0);
  return v4 & ABAddressBookSave(-[ABFacebookMigrator addressBook](self, "addressBook"), 0);
}

+ (BOOL)removeFacebookSensitiveInformation:(CPSqliteConnection *)a3
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;

  v5 = objc_msgSend(a1, "_findFacebookStoreID:");
  if ((_DWORD)v5 == -1)
    return 1;
  v6 = v5;
  v7 = objc_msgSend(a1, "_performQuery:withStoreID:connection:", CFSTR("delete from ABMultiValue where     record_id in (select ROWID from ABPerson where storeid = ?)     and property = 22     and value like \"%.facebook.com%\";"),
         v5,
         a3);
  v8 = v7 & objc_msgSend(a1, "_performQuery:withStoreID:connection:", CFSTR("delete from ABMultiValueEntry where parent_id in     (select abmv.UID from ABMultiValue as abmv join ABMultiValueEntry as abmve on abmv.UID = abmve.parent_id where         abmv.record_id in (select ROWID from ABPerson where StoreID = ?)         and abmv.property = 46         and abmve.key in (select ROWID from ABMultiValueEntryKey where value like \"service\")         and abmve.value like \"facebook\");"),
              v6,
              a3);
  return v8 & objc_msgSend(a1, "_performQuery:withStoreID:connection:", CFSTR("delete from ABMultiValue where     record_id in (select ROWID from ABPerson where storeid = ?)     and property = 46     and UID not in (select parent_id from ABMultiValueEntry);"),
                v6,
                a3);
}

+ (int)_findFacebookStoreID:(CPSqliteConnection *)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (CPSqliteConnectionStatementForSQL())
  {
    CPSqliteStatementSendResults();
    CPSqliteStatementReset();
  }

  return -1;
}

+ (BOOL)_performQuery:(id)a3 withStoreID:(int)a4 connection:(CPSqliteConnection *)a5
{
  uint64_t v6;
  int v7;

  v6 = CPSqliteConnectionStatementForSQL();
  if (v6)
  {
    sqlite3_bind_int(*(sqlite3_stmt **)(v6 + 8), 1, a4);
    v7 = CPSqliteStatementPerform();
    CPSqliteStatementReset();
    LOBYTE(v6) = v7 == 101;
  }
  return v6;
}

- (unint64_t)facebookContactsCount
{
  return self->_facebookContactsCount;
}

- (void)setFacebookContactsCount:(unint64_t)a3
{
  self->_facebookContactsCount = a3;
}

- (NSString)destinationDescription
{
  return self->_destinationDescription;
}

- (void)setDestinationDescription:(id)a3
{
  objc_storeStrong((id *)&self->_destinationDescription, a3);
}

- (void)addressBook
{
  return self->_addressBook;
}

- (void)setAddressBook:(void *)a3
{
  self->_addressBook = a3;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (void)facebookSource
{
  return self->_facebookSource;
}

- (void)setFacebookSource:(void *)a3
{
  self->_facebookSource = a3;
}

- (int)mergeDestinationSourceID
{
  return self->_mergeDestinationSourceID;
}

- (void)setMergeDestinationSourceID:(int)a3
{
  self->_mergeDestinationSourceID = a3;
}

- (BOOL)mayHaveFacebookSource
{
  return self->_mayHaveFacebookSource;
}

- (void)setMayHaveFacebookSource:(BOOL)a3
{
  self->_mayHaveFacebookSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_destinationDescription, 0);
}

@end
