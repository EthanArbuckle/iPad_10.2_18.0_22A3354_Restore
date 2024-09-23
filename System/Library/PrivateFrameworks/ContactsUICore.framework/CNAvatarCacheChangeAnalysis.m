@implementation CNAvatarCacheChangeAnalysis

- (CNAvatarCacheChangeAnalysis)initWithCurrentChangeHistoryToken:(id)a3 identifiersOfAffectedContacts:(id)a4
{
  id v6;
  id v7;
  CNAvatarCacheChangeAnalysis *v8;
  uint64_t v9;
  NSData *currentChangeHistoryToken;
  uint64_t v11;
  NSArray *identifiersOfAffectedContacts;
  CNAvatarCacheChangeAnalysis *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNAvatarCacheChangeAnalysis;
  v8 = -[CNAvatarCacheChangeAnalysis init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    currentChangeHistoryToken = v8->_currentChangeHistoryToken;
    v8->_currentChangeHistoryToken = (NSData *)v9;

    v11 = objc_msgSend(v7, "copy");
    identifiersOfAffectedContacts = v8->_identifiersOfAffectedContacts;
    v8->_identifiersOfAffectedContacts = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("identifiers"), self->_identifiersOfAffectedContacts);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("token"), self->_currentChangeHistoryToken);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSData)currentChangeHistoryToken
{
  return self->_currentChangeHistoryToken;
}

- (NSArray)identifiersOfAffectedContacts
{
  return self->_identifiersOfAffectedContacts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersOfAffectedContacts, 0);
  objc_storeStrong((id *)&self->_currentChangeHistoryToken, 0);
}

@end
