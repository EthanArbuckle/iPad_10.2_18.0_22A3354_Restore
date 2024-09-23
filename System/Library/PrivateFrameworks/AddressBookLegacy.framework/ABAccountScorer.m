@implementation ABAccountScorer

- (ABAccountScorer)initWithAddressBook:(void *)a3 accountStore:(id)a4 account:(void *)a5 defaultSourceID:(int)a6
{
  id v11;
  ABAccountScorer *v12;
  ABAccountScorer *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ABAccountScorer;
  v12 = -[ABAccountScorer init](&v15, sel_init);
  if (v12)
  {
    v12->_addressBook = (void *)CFRetain(a3);
    objc_storeStrong((id *)&v12->_accountStore, a4);
    v12->_account = (void *)CFRetain(a5);
    v12->_score = 0.0;
    v12->_sourceID = -1;
    v12->_defaultSourceID = a6;
    v13 = v12;
  }

  return v12;
}

- (void)dealloc
{
  void *addressBook;
  void *account;
  objc_super v5;

  addressBook = self->_addressBook;
  if (addressBook)
    CFRelease(addressBook);
  account = self->_account;
  if (account)
    CFRelease(account);
  v5.receiver = self;
  v5.super_class = (Class)ABAccountScorer;
  -[ABAccountScorer dealloc](&v5, sel_dealloc);
}

- (NSString)accountTypeDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)ABAccountCopyIdentifier(-[ABAccountScorer account](self, "account"));
  -[ABAccountScorer accountStore](self, "accountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountWithIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "accountType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountTypeDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)accountDisambiguationDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)ABAccountCopyIdentifier(-[ABAccountScorer account](self, "account"));
  -[ABAccountScorer accountStore](self, "accountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountWithIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)calculateScore
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  int v13;
  double v14;
  _QWORD v15[6];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C8F0A8];
  v15[0] = *MEMORY[0x1E0C8F030];
  v15[1] = v3;
  v16[0] = &unk_1E3CB95E8;
  v16[1] = &unk_1E3CB95F8;
  v4 = *MEMORY[0x1E0C8F060];
  v15[2] = *MEMORY[0x1E0C8F160];
  v15[3] = v4;
  v16[2] = &unk_1E3CB9608;
  v16[3] = &unk_1E3CB9618;
  v5 = *MEMORY[0x1E0C8F080];
  v15[4] = *MEMORY[0x1E0C8F0B8];
  v15[5] = v5;
  v16[4] = &unk_1E3CB9628;
  v16[5] = &unk_1E3CB9638;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABAccountScorer accountStore](self, "accountStore");
  v7 = objc_claimAutoreleasedReturnValue();
  ABAccountStoreGetAccountTypeForAccount((void *)v7, -[ABAccountScorer account](self, "account"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABAccountScorer setAccountType:](self, "setAccountType:", v8);

  -[ABAccountScorer accountType](self, "accountType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = +[ABFacebookMigrator isAccountTypeFacebook:](ABFacebookMigrator, "isAccountTypeFacebook:", v9);

  if ((v7 & 1) == 0)
  {
    -[ABAccountScorer setSourceID:](self, "setSourceID:", -[ABAccountScorer _findBestSourceID](self, "_findBestSourceID"));
    if (-[ABAccountScorer sourceID](self, "sourceID") != -1)
    {
      -[ABAccountScorer accountType](self, "accountType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        objc_msgSend(v11, "doubleValue");
      else
        v12 = 1.0;
      -[ABAccountScorer setScore:](self, "setScore:", v12);
      v13 = -[ABAccountScorer sourceID](self, "sourceID");
      if (v13 == -[ABAccountScorer defaultSourceID](self, "defaultSourceID"))
      {
        -[ABAccountScorer score](self, "score");
        -[ABAccountScorer setScore:](self, "setScore:", v14 + 0.5);
      }

    }
  }

}

- (int)_findBestSourceID
{
  ABRecordRef DefaultSourceForAccount;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const void *v10;
  ABRecordID RecordID;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  DefaultSourceForAccount = ABAddressBookGetDefaultSourceForAccount(-[ABAccountScorer addressBook](self, "addressBook"), (uint64_t)-[ABAccountScorer account](self, "account"));
  if (DefaultSourceForAccount)
    return ABRecordGetRecordID(DefaultSourceForAccount);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)ABAddressBookCopyArrayOfAllSourcesInAccount((uint64_t)-[ABAccountScorer addressBook](self, "addressBook"), -[ABAccountScorer account](self, "account"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(const void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (!ABSourceIsContentReadonly((uint64_t)v10))
        {
          RecordID = ABRecordGetRecordID(v10);
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  RecordID = -1;
LABEL_13:

  return RecordID;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSString)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(id)a3
{
  objc_storeStrong((id *)&self->_accountType, a3);
}

- (int)sourceID
{
  return self->_sourceID;
}

- (void)setSourceID:(int)a3
{
  self->_sourceID = a3;
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

- (void)account
{
  return self->_account;
}

- (void)setAccount:(void *)a3
{
  self->_account = a3;
}

- (int)defaultSourceID
{
  return self->_defaultSourceID;
}

- (void)setDefaultSourceID:(int)a3
{
  self->_defaultSourceID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
}

@end
