@implementation MFMailMessageRelationshipAnalyzer

+ (id)analysisOfConversation:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMessages:relationships:", a3, objc_msgSend(a1, "analyzeMessages:myEmailAddresses:", a3, objc_msgSend(a1, "myEmailAddresses")));
}

- (MFMailMessageRelationshipAnalyzer)initWithMessages:(id)a3 relationships:(id)a4
{
  MFMailMessageRelationshipAnalyzer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFMailMessageRelationshipAnalyzer;
  v6 = -[MFMailMessageRelationshipAnalyzer init](&v8, sel_init);
  if (v6)
  {
    v6->_messages = (NSArray *)objc_msgSend(a3, "copy");
    v6->_relationships = (NSArray *)objc_msgSend(a4, "copy");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMailMessageRelationshipAnalyzer;
  -[MFMailMessageRelationshipAnalyzer dealloc](&v3, sel_dealloc);
}

- (unint64_t)relationOfMessage:(id)a3
{
  NSUInteger v4;

  v4 = -[NSArray indexOfObject:](self->_messages, "indexOfObject:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return objc_msgSend(-[NSArray objectAtIndex:](self->_relationships, "objectAtIndex:", v4), "unsignedIntegerValue");
}

+ (id)analyzeMessages:(id)a3 myEmailAddresses:(id)a4
{
  uint64_t v7;
  void *v8;
  _QWORD v10[8];

  v7 = objc_msgSend(a3, "firstObject");
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(a1, "sendersOfMessage:", v7));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__MFMailMessageRelationshipAnalyzer_analyzeMessages_myEmailAddresses___block_invoke;
  v10[3] = &unk_1E81CB290;
  v10[4] = a1;
  v10[5] = v7;
  v10[6] = v8;
  v10[7] = a4;
  return (id)objc_msgSend(a3, "ef_map:", v10);
}

uint64_t __70__MFMailMessageRelationshipAnalyzer_analyzeMessages_myEmailAddresses___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = objc_msgSend(*(id *)(a1 + 32), "relationOfMessage:toMessage:previousSenders:myEmailAddresses:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 32), "sendersOfMessage:", a2));
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
}

+ (id)sendersOfMessage:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v4, "addObjectsFromArray:", objc_msgSend(a3, "senders"));
  return (id)objc_msgSend(v4, "ef_map:", &__block_literal_global_14);
}

uint64_t __54__MFMailMessageRelationshipAnalyzer_sendersOfMessage___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mf_uncommentedAddress");
}

+ (unint64_t)relationOfMessage:(id)a3 toMessage:(id)a4
{
  return objc_msgSend(a1, "relationOfMessage:toMessage:previousSenders:myEmailAddresses:", a3, a4, 0, objc_msgSend(a1, "myEmailAddresses"));
}

+ (unint64_t)relationOfMessage:(id)a3 toMessage:(id)a4 previousSenders:(id)a5 myEmailAddresses:(id)a6
{
  if ((objc_msgSend(a4, "isEqual:") & 1) != 0)
    return 0;
  if (objc_msgSend(a1, "isMessage:responseToMessage:previousSenders:myEmailAddresses:", a3, a4, a5, a6))
  {
    if (objc_msgSend(a1, "isMessageDraft:", a3))
      return 2;
    else
      return 1;
  }
  else if (objc_msgSend(a1, "isMessage:forwardOfMessage:myEmailAddresses:", a3, a4, a6))
  {
    return 3;
  }
  else
  {
    return 0;
  }
}

+ (BOOL)isMessage:(id)a3 responseToMessage:(id)a4 previousSenders:(id)a5 myEmailAddresses:(id)a6
{
  int v10;

  v10 = objc_msgSend(a1, "isMessage:sentByAddress:", a3, a6);
  if (v10)
  {
    if ((objc_msgSend(a1, "isMessage:addressedToPreviousSender:", a3, a5) & 1) != 0)
      LOBYTE(v10) = 1;
    else
      LOBYTE(v10) = objc_msgSend(a1, "isMessage:addressedToMailingListForMessage:", a3, a4);
  }
  return v10;
}

+ (BOOL)isMessage:(id)a3 addressedToPreviousSender:(id)a4
{
  void *v5;
  _QWORD v7[5];

  v5 = (void *)objc_msgSend(a1, "recipientsOfMessage:", a3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__MFMailMessageRelationshipAnalyzer_isMessage_addressedToPreviousSender___block_invoke;
  v7[3] = &unk_1E81CB2F8;
  v7[4] = a4;
  return objc_msgSend(v5, "ef_any:", v7);
}

uint64_t __73__MFMailMessageRelationshipAnalyzer_isMessage_addressedToPreviousSender___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_msgSend(a2, "mf_uncommentedAddress"));
}

+ (BOOL)isMessage:(id)a3 addressedToMailingListForMessage:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];

  v6 = (void *)objc_msgSend(a4, "headersIfAvailable");
  v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "firstHeaderForKey:", *MEMORY[0x1E0D1E590]), "mf_uncommentedAddress");
  v8 = objc_msgSend(v7, "length");
  if (v8)
  {
    v9 = (void *)objc_msgSend(a1, "recipientsOfMessage:", a3);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __80__MFMailMessageRelationshipAnalyzer_isMessage_addressedToMailingListForMessage___block_invoke;
    v11[3] = &unk_1E81CB2F8;
    v11[4] = v7;
    LOBYTE(v8) = objc_msgSend(v9, "ef_any:", v11);
  }
  return v8;
}

uint64_t __80__MFMailMessageRelationshipAnalyzer_isMessage_addressedToMailingListForMessage___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mf_containsSubstring:options:", *(_QWORD *)(a1 + 32), 1);
}

+ (id)recipientsOfMessage:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a3, "to"), "ef_map:", &__block_literal_global_7);
}

uint64_t __57__MFMailMessageRelationshipAnalyzer_recipientsOfMessage___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mf_uncommentedAddress");
}

+ (BOOL)isMessageDraft:(id)a3
{
  return objc_msgSend((id)objc_msgSend(a3, "mailbox"), "type") == 5;
}

+ (BOOL)isMessage:(id)a3 forwardOfMessage:(id)a4 myEmailAddresses:(id)a5
{
  return objc_msgSend(a1, "isMessage:sentByAddress:", a3, a5);
}

+ (id)myEmailAddresses
{
  void *v2;

  v2 = (void *)objc_msgSend(+[MailAccount activeAccounts](MailAccount, "activeAccounts"), "ef_map:", &__block_literal_global_10);
  return (id)objc_msgSend((id)objc_msgSend(v2, "ef_filter:", *MEMORY[0x1E0D1ED88]), "ef_flatten");
}

uint64_t __53__MFMailMessageRelationshipAnalyzer_myEmailAddresses__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "emailAddressesAndAliasesList");
}

+ (BOOL)isMessage:(id)a3 sentByAddress:(id)a4
{
  uint64_t v5;
  _QWORD v7[5];

  v5 = objc_msgSend((id)objc_msgSend(a3, "firstSender"), "mf_uncommentedAddress");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__MFMailMessageRelationshipAnalyzer_isMessage_sentByAddress___block_invoke;
  v7[3] = &unk_1E81CB2F8;
  v7[4] = v5;
  return objc_msgSend(a4, "ef_any:", v7);
}

uint64_t __61__MFMailMessageRelationshipAnalyzer_isMessage_sentByAddress___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "mf_caseInsensitiveIsEqualToString:", objc_msgSend(a2, "mf_uncommentedAddress"));
}

@end
