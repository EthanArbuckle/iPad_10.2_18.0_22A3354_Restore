@implementation MFRemoteSearchResults

- (MFRemoteSearchResults)init
{
  MFRemoteSearchResults *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mailboxToRemoteIdDictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFRemoteSearchResults;
  v2 = -[MFRemoteSearchResults init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mailboxToRemoteIdDictionary = v2->_mailboxToRemoteIdDictionary;
    v2->_mailboxToRemoteIdDictionary = v3;

  }
  return v2;
}

- (void)addRemoteID:(id)a3 mailbox:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[MFRemoteSearchResults mailboxToRemoteIdDictionary](self, "mailboxToRemoteIdDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[MFRemoteSearchResults mailboxToRemoteIdDictionary](self, "mailboxToRemoteIdDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v6);

    v8 = v9;
  }
  objc_msgSend(v8, "addObject:", v11);

}

- (void)addRemoteIDs:(id)a3 mailbox:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "stringValue", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFRemoteSearchResults addRemoteID:mailbox:](self, "addRemoteID:mailbox:", v12, v7);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[MFRemoteSearchResults mailboxToRemoteIdDictionary](self, "mailboxToRemoteIdDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__MFRemoteSearchResults_count__block_invoke;
  v5[3] = &unk_1E4E8E858;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __30__MFRemoteSearchResults_count__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v4, "count");

}

- (void)enumerateMailboxesAndRemoteIDsUsingBlock:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFRemoteSearchResults mailboxToRemoteIdDictionary](self, "mailboxToRemoteIdDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

- (NSDate)continueOffset
{
  return self->_continueOffset;
}

- (void)setContinueOffset:(id)a3
{
  objc_storeStrong((id *)&self->_continueOffset, a3);
}

- (NSMutableDictionary)mailboxToRemoteIdDictionary
{
  return self->_mailboxToRemoteIdDictionary;
}

- (void)setMailboxToRemoteIdDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxToRemoteIdDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxToRemoteIdDictionary, 0);
  objc_storeStrong((id *)&self->_continueOffset, 0);
}

@end
