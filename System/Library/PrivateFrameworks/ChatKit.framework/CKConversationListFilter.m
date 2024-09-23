@implementation CKConversationListFilter

- (id)_inboxSubPredicate
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7[2];
  id location;

  v3 = -[CKConversationListFilter inbox](self, "inbox");
  if (v3)
  {
    location = 0;
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E0CB3880];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53__CKConversationListFilter_Inbox___inboxSubPredicate__block_invoke;
    v6[3] = &unk_1E27580D0;
    objc_copyWeak(v7, &location);
    v7[1] = v3;
    objc_msgSend(v4, "predicateWithBlock:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(v7);
    objc_destroyWeak(&location);
  }
  return v3;
}

uint64_t __53__CKConversationListFilter_Inbox___inboxSubPredicate__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;

  if (!a2)
    return 0;
  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = objc_msgSend(WeakRetained, "_conversation:matchesInbox:", v4, *(_QWORD *)(a1 + 40));

  return v6;
}

- (BOOL)_conversation:(id)a3 matchesInbox:(unint64_t)a4
{
  id v6;
  void *v7;
  BOOL v8;
  int v10;
  int v11;
  void *v12;

  v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 0uLL:
      goto LABEL_10;
    case 1uLL:
      v11 = objc_msgSend(v6, "isKnownSender");
      LODWORD(self) = v11 & objc_msgSend(v7, "wasKnownSender");
      break;
    case 2uLL:
      v10 = objc_msgSend(v6, "isKnownSender");
      LODWORD(self) = v10 & objc_msgSend(v7, "wasKnownSender") ^ 1;
      break;
    case 3uLL:
      if (-[CKConversationListFilter _isSpamFilteredConversation:](self, "_isSpamFilteredConversation:", v6))
        LOBYTE(self) = -[CKConversationListFilter _spamFilterInboxForConversation:](self, "_spamFilterInboxForConversation:", v7) != 0;
      else
LABEL_10:
        LOBYTE(self) = 1;
      break;
    case 4uLL:
    case 5uLL:
    case 0xFuLL:
      v8 = -[CKConversationListFilter _conversation:matchesSpamFilterInboxGroup:](self, "_conversation:matchesSpamFilterInboxGroup:", v6, -[CKConversationListFilter _spamFilterInboxGroupForConversationListInbox:](self, "_spamFilterInboxGroupForConversationListInbox:", a4));
      goto LABEL_4;
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
      v8 = -[CKConversationListFilter _conversation:matchesSpamFilterInbox:](self, "_conversation:matchesSpamFilterInbox:", v6, -[CKConversationListFilter _spamFilterInboxForConversationListInbox:](self, "_spamFilterInboxForConversationListInbox:", a4));
LABEL_4:
      LOBYTE(self) = v8;
      break;
    case 0x13uLL:
      objc_msgSend(v6, "chat");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(self) = objc_msgSend(v12, "recoverableMessagesCount") != 0;

      break;
    default:
      LOBYTE(self) = 0;
      break;
  }

  return (char)self;
}

- (BOOL)_isSpamFilteredConversation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v3 = a3;
  if (!CKMessageSpamFilteringEnabled())
    goto LABEL_3;
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35910], "smsService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
    goto LABEL_3;
  if (objc_msgSend(v3, "wasDetectedAsSMSCategory"))
    v8 = objc_msgSend(v3, "isKnownSender") ^ 1;
  else
LABEL_3:
    LOBYTE(v8) = 0;

  return v8;
}

- (unint64_t)_spamFilterInboxForConversation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "spamCategory");
  v6 = objc_msgSend(v4, "spamSubCategory");

  return -[CKConversationListFilter _spamFilterInboxForCategory:subCategory:](self, "_spamFilterInboxForCategory:subCategory:", v5, v6);
}

- (unint64_t)_spamFilterInboxGroupForConversationListInbox:(unint64_t)a3
{
  unint64_t result;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  id v7;

  result = 0;
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 0x13uLL:
      v4 = (void *)MEMORY[0x1E0C99DA0];
      v5 = *MEMORY[0x1E0C99768];
      v6 = CFSTR("Attempted to convert non-spam message conversation list inbox to a spam filter inbox group");
      goto LABEL_7;
    case 5uLL:
      return 1;
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
      v4 = (void *)MEMORY[0x1E0C99DA0];
      v5 = *MEMORY[0x1E0C99768];
      v6 = CFSTR("Attempted to convert conversation list spam inbox to a spam inbox group");
LABEL_7:
      objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v7);
    case 0xFuLL:
      result = 2;
      break;
    default:
      return result;
  }
  return result;
}

- (unint64_t)_spamFilterInboxForConversationListInbox:(unint64_t)a3
{
  unint64_t result;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  id v7;

  result = 0;
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 0x13uLL:
      v4 = (void *)MEMORY[0x1E0C99DA0];
      v5 = *MEMORY[0x1E0C99768];
      v6 = CFSTR("Attempted to convert non-spam message conversation list inbox to a spam filter inbox");
      goto LABEL_17;
    case 5uLL:
    case 0xFuLL:
      v4 = (void *)MEMORY[0x1E0C99DA0];
      v5 = *MEMORY[0x1E0C99768];
      v6 = CFSTR("Attempted to convert conversation list spam inbox group to a spam filter inbox");
LABEL_17:
      objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v7);
    case 6uLL:
      result = 1;
      break;
    case 7uLL:
      result = 2;
      break;
    case 8uLL:
      result = 3;
      break;
    case 9uLL:
      result = 4;
      break;
    case 0xAuLL:
      result = 5;
      break;
    case 0xBuLL:
      result = 6;
      break;
    case 0xCuLL:
      result = 7;
      break;
    case 0xDuLL:
      result = 8;
      break;
    case 0xEuLL:
      result = 9;
      break;
    case 0x10uLL:
      result = 10;
      break;
    case 0x11uLL:
      result = 11;
      break;
    case 0x12uLL:
      result = 12;
      break;
    default:
      return result;
  }
  return result;
}

- (unint64_t)_spamFilterInboxGroupForInbox:(unint64_t)a3
{
  if (a3 - 1 > 0xB)
    return 0;
  else
    return qword_18E7CB7B0[a3 - 1];
}

- (BOOL)_conversation:(id)a3 matchesSpamFilterInbox:(unint64_t)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (-[CKConversationListFilter _isSpamFilteredConversation:](self, "_isSpamFilteredConversation:", v6))
    v7 = -[CKConversationListFilter _spamFilterInboxForConversation:](self, "_spamFilterInboxForConversation:", v6) == a4;
  else
    v7 = 0;

  return v7;
}

- (BOOL)_conversation:(id)a3 matchesSpamFilterInboxGroup:(unint64_t)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (-[CKConversationListFilter _isSpamFilteredConversation:](self, "_isSpamFilteredConversation:", v6))
    v7 = -[CKConversationListFilter _spamFilterInboxGroupForInbox:](self, "_spamFilterInboxGroupForInbox:", -[CKConversationListFilter _spamFilterInboxForConversation:](self, "_spamFilterInboxForConversation:", v6)) == a4;
  else
    v7 = 0;

  return v7;
}

- (unint64_t)_spamFilterInboxForCategory:(int64_t)a3 subCategory:(int64_t)a4
{
  unint64_t result;

  switch(a4)
  {
    case 0:
      result = -[CKConversationListFilter _defaultSpamFilterInboxForCategory:](self, "_defaultSpamFilterInboxForCategory:", a3);
      break;
    case 1:
      result = 9;
      break;
    case 2:
      result = 1;
      break;
    case 3:
      result = 2;
      break;
    case 4:
      result = 3;
      break;
    case 5:
      result = 4;
      break;
    case 6:
      result = 5;
      break;
    case 7:
      result = 6;
      break;
    case 8:
      result = 7;
      break;
    case 9:
      result = 8;
      break;
    case 10:
      result = 12;
      break;
    case 11:
      result = 10;
      break;
    case 12:
      result = 11;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (unint64_t)_defaultSpamFilterInboxForCategory:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  id v6;

  if (a3 == 3)
    return 12;
  if (a3 == 4)
    return 9;
  if ((unint64_t)a3 < 2)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Attempted to convert non-spam message filter action to a spam filter inbox"), 0, v3, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return 0;
}

- (id)_initWithInbox:(unint64_t)a3 unreadOnly:(BOOL)a4 focusConfiguration:(id)a5
{
  id v8;
  CKConversationListFilter *v9;
  CKConversationListFilter *v10;
  uint64_t v11;
  DNDConfiguration *focusConfiguration;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKConversationListFilter;
  v9 = -[CKConversationListFilter init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_inbox = a3;
    v9->_unreadOnly = a4;
    v11 = objc_msgSend(v8, "copy");
    focusConfiguration = v10->_focusConfiguration;
    v10->_focusConfiguration = (DNDConfiguration *)v11;

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CKConversationListFilter *v4;
  BOOL v5;

  v4 = (CKConversationListFilter *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CKConversationListFilter isEqualToConversationListFilter:](self, "isEqualToConversationListFilter:", v4);
  }

  return v5;
}

- (BOOL)isEqualToConversationListFilter:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  DNDConfiguration *focusConfiguration;
  char v7;

  v4 = a3;
  v5 = v4;
  if (self->_inbox == v4[2] && self->_unreadOnly == *((unsigned __int8 *)v4 + 8))
  {
    focusConfiguration = self->_focusConfiguration;
    if ((unint64_t)focusConfiguration | v5[3])
      v7 = -[DNDConfiguration isEqual:](focusConfiguration, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = self->_inbox ^ self->_unreadOnly;
  return v2 ^ -[DNDConfiguration hash](self->_focusConfiguration, "hash");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; inbox = %ld, unreadOnly = %ld, focusConfiguration = %@>"),
               objc_opt_class(),
               self,
               self->_inbox,
               self->_unreadOnly,
               self->_focusConfiguration);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CKConversationListFilter _initWithInbox:unreadOnly:focusConfiguration:]([CKConversationListFilter alloc], "_initWithInbox:unreadOnly:focusConfiguration:", self->_inbox, self->_unreadOnly, self->_focusConfiguration);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t inbox;
  id v5;

  inbox = self->_inbox;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", inbox, CFSTR("i"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_unreadOnly, CFSTR("u"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_focusConfiguration, CFSTR("f"));

}

- (CKConversationListFilter)initWithCoder:(id)a3
{
  id v4;
  CKConversationListFilter *v5;
  uint64_t v6;
  DNDConfiguration *focusConfiguration;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKConversationListFilter;
  v5 = -[CKConversationListFilter init](&v9, sel_init);
  if (v5)
  {
    v5->_inbox = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("i"));
    v5->_unreadOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("u"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", MEMORY[0x193FF3C18](CFSTR("DNDConfiguration"), CFSTR("DoNotDisturb")), CFSTR("f"));
    v6 = objc_claimAutoreleasedReturnValue();
    focusConfiguration = v5->_focusConfiguration;
    v5->_focusConfiguration = (DNDConfiguration *)v6;

  }
  return v5;
}

- (unint64_t)inbox
{
  return self->_inbox;
}

- (BOOL)unreadOnly
{
  return self->_unreadOnly;
}

- (DNDConfiguration)focusConfiguration
{
  return self->_focusConfiguration;
}

- (NSPredicate)cachedConversationPredicate
{
  return self->_cachedConversationPredicate;
}

- (void)setCachedConversationPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_cachedConversationPredicate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedConversationPredicate, 0);
  objc_storeStrong((id *)&self->_focusConfiguration, 0);
}

+ (CKConversationListFilter)defaultFilter
{
  return (CKConversationListFilter *)-[CKConversationListFilter _initWithInbox:unreadOnly:focusConfiguration:]([CKConversationListFilter alloc], "_initWithInbox:unreadOnly:focusConfiguration:", 0, 0, 0);
}

- (id)filterByChangingInbox:(unint64_t)a3
{
  return -[CKConversationListFilter _initWithInbox:unreadOnly:focusConfiguration:]([CKConversationListFilter alloc], "_initWithInbox:unreadOnly:focusConfiguration:", a3, self->_unreadOnly, self->_focusConfiguration);
}

- (id)filterByChangingUnreadOnly:(BOOL)a3
{
  return -[CKConversationListFilter _initWithInbox:unreadOnly:focusConfiguration:]([CKConversationListFilter alloc], "_initWithInbox:unreadOnly:focusConfiguration:", self->_inbox, a3, self->_focusConfiguration);
}

- (id)filterByChangingFocusConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[CKConversationListFilter _initWithInbox:unreadOnly:focusConfiguration:]([CKConversationListFilter alloc], "_initWithInbox:unreadOnly:focusConfiguration:", self->_inbox, self->_unreadOnly, v4);

  return v5;
}

- (NSPredicate)conversationPredicate
{
  NSPredicate *cachedConversationPredicate;
  NSPredicate **p_cachedConversationPredicate;
  NSPredicate *v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  p_cachedConversationPredicate = &self->_cachedConversationPredicate;
  cachedConversationPredicate = self->_cachedConversationPredicate;
  if (!cachedConversationPredicate)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[CKConversationListFilter _inboxSubPredicate](self, "_inboxSubPredicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v6, "addObject:", v7);
    -[CKConversationListFilter _unreadOnlySubPredicate](self, "_unreadOnlySubPredicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v6, "addObject:", v8);
    -[CKConversationListFilter _focusConfigurationSubPredicate](self, "_focusConfigurationSubPredicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v6, "addObject:", v9);
    if (objc_msgSend(v6, "count"))
    {
      if (objc_msgSend(v6, "count") != 1)
      {
        v11 = (void *)MEMORY[0x1E0CB3528];
        v12 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(v11, "andPredicateWithSubpredicates:", v12);
        v4 = (NSPredicate *)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
      objc_msgSend(v6, "firstObject");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v4 = (NSPredicate *)v10;
LABEL_15:
    objc_storeStrong((id *)p_cachedConversationPredicate, v4);

    return v4;
  }
  v4 = cachedConversationPredicate;
  return v4;
}

- (id)_unreadOnlySubPredicate
{
  void *v2;

  if (-[CKConversationListFilter unreadOnly](self, "unreadOnly"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_229);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

uint64_t __62__CKConversationListFilter_Predicate___unreadOnlySubPredicate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  unsigned int v4;

  v2 = a2;
  v3 = objc_msgSend(v2, "hasUnreadMessages");
  v4 = objc_msgSend(v2, "shouldHoldInUnreadFilter");

  return v3 | v4;
}

- (id)_focusConfigurationSubPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CKConversationListFilter focusConfiguration](self, "focusConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0CB3880];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __66__CKConversationListFilter_Focus___focusConfigurationSubPredicate__block_invoke;
    v7[3] = &unk_1E2755280;
    v8 = v2;
    objc_msgSend(v4, "predicateWithBlock:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __66__CKConversationListFilter_Focus___focusConfigurationSubPredicate__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "participantDNDContactHandles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(MEMORY[0x1E0D39850], "focusConfiguration:matchesConversationWithHandles:", *(_QWORD *)(a1 + 32), v5);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

@end
