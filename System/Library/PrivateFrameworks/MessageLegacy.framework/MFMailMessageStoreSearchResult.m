@implementation MFMailMessageStoreSearchResult

- (MFMailMessageStoreSearchResult)init
{
  MFMailMessageStoreSearchResult *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFMailMessageStoreSearchResult;
  v2 = -[MFMailMessageStoreSearchResult init](&v4, sel_init);
  if (v2)
    v2->_mailboxToRemoteIdDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMailMessageStoreSearchResult;
  -[MFMailMessageStoreSearchResult dealloc](&v3, sel_dealloc);
}

- (void)addRemoteID:(id)a3 mailbox:(id)a4
{
  id v7;

  v7 = (id)-[NSMutableDictionary objectForKeyedSubscript:](-[MFMailMessageStoreSearchResult mailboxToRemoteIdDictionary](self, "mailboxToRemoteIdDictionary"), "objectForKeyedSubscript:", a4);
  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](-[MFMailMessageStoreSearchResult mailboxToRemoteIdDictionary](self, "mailboxToRemoteIdDictionary"), "setObject:forKeyedSubscript:", v7, a4);
  }
  objc_msgSend(v7, "addObject:", a3);
}

- (unint64_t)count
{
  NSMutableDictionary *v2;
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
  v2 = -[MFMailMessageStoreSearchResult mailboxToRemoteIdDictionary](self, "mailboxToRemoteIdDictionary");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__MFMailMessageStoreSearchResult_count__block_invoke;
  v5[3] = &unk_1E81CB380;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v2, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__MFMailMessageStoreSearchResult_count__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (void)enumerateMailboxesAndRemoteIDsUsingBlock:(id)a3
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](-[MFMailMessageStoreSearchResult mailboxToRemoteIdDictionary](self, "mailboxToRemoteIdDictionary"), "enumerateKeysAndObjectsUsingBlock:", a3);
}

- (NSDate)continueOffset
{
  return self->_continueOffset;
}

- (void)setContinueOffset:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSMutableDictionary)mailboxToRemoteIdDictionary
{
  return self->_mailboxToRemoteIdDictionary;
}

- (void)setMailboxToRemoteIdDictionary:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
