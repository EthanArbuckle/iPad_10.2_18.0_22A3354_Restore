@implementation MFMessageCriterion

+ (id)VIPSenderMessageCriterion
{
  MFMessageCriterion *v2;

  v2 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 26, 3, CFSTR("MessageSenderIsVIP"));
  -[MFMessageCriterion setName:](v2, "setName:", CFSTR("VIPCriterion"));
  return v2;
}

- (int64_t)criterionType
{
  int64_t result;

  result = self->_type;
  if (result == -1)
  {
    result = objc_msgSend((id)objc_opt_class(), "criterionTypeForString:", self->_criterionIdentifier);
    self->_type = result;
  }
  return result;
}

- (NSString)expression
{
  NSString *result;

  result = self->_expression;
  if (!result)
  {
    result = (NSString *)-[NSIndexSet mf_commaSeparatedString](self->_libraryIdentifiers, "mf_commaSeparatedString");
    self->_expression = result;
  }
  return result;
}

+ (id)criterionForMailboxURL:(id)a3
{
  return -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 22, 3, a3);
}

- (MFMessageCriterion)initWithType:(int64_t)a3 qualifier:(int)a4 expression:(id)a5
{
  uint64_t v6;
  MFMessageCriterion *v8;
  MFMessageCriterion *v9;

  v6 = *(_QWORD *)&a4;
  v8 = -[MFMessageCriterion init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[MFMessageCriterion setCriterionType:](v8, "setCriterionType:", a3);
    -[MFMessageCriterion setQualifier:](v9, "setQualifier:", v6);
    -[MFMessageCriterion setExpression:](v9, "setExpression:", a5);
  }
  return v9;
}

- (void)setCriterionType:(int64_t)a3
{
  -[MFMessageCriterion setCriterionIdentifier:](self, "setCriterionIdentifier:", objc_msgSend((id)objc_opt_class(), "stringForCriterionType:", a3));
  self->_type = -1;
}

- (MFMessageCriterion)init
{
  MFMessageCriterion *v2;
  const __CFAllocator *v3;
  const __CFUUID *v4;
  CFStringRef v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFMessageCriterion;
  v2 = -[MFMessageCriterion init](&v7, sel_init);
  if (v2)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
    v5 = CFUUIDCreateString(v3, v4);

    v2->_uniqueId = &v5->isa;
    v2->_type = -1;
  }
  return v2;
}

- (void)setQualifier:(int)a3
{
  self->_qualifier = a3;
}

- (void)setCriterionIdentifier:(id)a3
{
  NSString *criterionIdentifier;
  uint64_t v6;
  __CFString *v7;

  criterionIdentifier = self->_criterionIdentifier;
  v6 = objc_msgSend(a3, "caseInsensitiveCompare:", CFSTR("To or Cc"));
  v7 = CFSTR("AnyRecipient");
  if (v6)
    v7 = (__CFString *)a3;
  self->_criterionIdentifier = (NSString *)v7;

  self->_type = -1;
}

+ (id)stringForCriterionType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x26)
    return 0;
  else
    return off_1E81CA758[a3 - 1];
}

- (void)setExpression:(id)a3
{
  NSString *expression;

  expression = self->_expression;
  self->_expression = (NSString *)objc_msgSend(a3, "copy");

}

+ (int64_t)criterionTypeForString:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Header")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Body")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SenderIsInAddressBook")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SenderIsNotInAddressBook")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SenderHeader")) & 1) != 0)
    return 34;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Account")) & 1) != 0)
    return 7;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("AnyMessage")) & 1) != 0)
    return 8;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("AnyRecipient")) & 1) != 0)
    return 9;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DateReceived")) & 1) != 0)
    return 11;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DateLastViewed")) & 1) != 0)
    return 28;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DateSent")) & 1) != 0)
    return 10;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SenderIsInAddressHistory")) & 1) != 0)
    return 12;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SenderIsNotInAddressHistory")) & 1) != 0)
    return 13;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("AnyRecipientIncludesFullName")) & 1) != 0)
    return 14;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NoRecipientIncludesFullName")) & 1) != 0)
    return 15;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("IsDigitallySigned")) & 1) != 0)
    return 16;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("IsEncrypted")) & 1) != 0)
    return 17;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("PriorityIsNormal")) & 1) != 0)
    return 20;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("PriorityIsHigh")) & 1) != 0)
    return 19;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("PriorityIsLow")) & 1) != 0)
    return 21;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("AnyAttachment")) & 1) != 0)
    return 18;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Mailbox")) & 1) != 0)
    return 22;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("MessageNumber")) & 1) != 0)
    return 23;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("ExternalID")) & 1) != 0)
    return 35;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Compound")) & 1) != 0)
    return 24;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Flag")) & 1) != 0)
    return 26;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NotInTrashMailbox")) & 1) != 0)
    return 27;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("ContainsAttachments")) & 1) != 0)
    return 29;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SpotlightSearch")) & 1) != 0)
    return 32;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("ConversationID")) & 1) != 0)
    return 33;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Negation")) & 1) != 0)
    return 25;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("MessageIdHash")) & 1) != 0)
    return 36;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("ListIDHash")) & 1) != 0)
    return 37;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("ToRecipient")) & 1) != 0)
    return 38;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CcRecipient")))
    return 39;
  return 1;
}

+ (id)threadNotifyMessageCriterion
{
  MFMessageCriterion *v2;

  v2 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 26, 3, CFSTR("MessageConversationIsVIP"));
  -[MFMessageCriterion setName:](v2, "setName:", CFSTR("ThreadNotifyCriterionName"));
  return v2;
}

+ (id)includesMeCriterion
{
  MFMessageCriterion *v2;

  v2 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 26, 3, CFSTR("MessageToOrCcContainsAccountAddress"));
  -[MFMessageCriterion setName:](v2, "setName:", CFSTR("IncludesMeCriterion"));
  return v2;
}

+ (id)threadMuteMessageCriterion
{
  MFMessageCriterion *v2;

  v2 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 26, 3, CFSTR("MessageConversationIsMuted"));
  -[MFMessageCriterion setName:](v2, "setName:", CFSTR("ThreadMuteCriterionName"));
  return v2;
}

+ (id)todayMessageCriterion
{
  MFMessageCriterion *v2;
  MFMessageCriterion *v3;

  v2 = [MFMessageCriterion alloc];
  v3 = -[MFMessageCriterion initWithType:qualifier:expression:](v2, "initWithType:qualifier:expression:", 11, 5, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 1));
  -[MFMessageCriterion setDateUnits:](v3, "setDateUnits:", 1);
  -[MFMessageCriterion setDateIsRelative:](v3, "setDateIsRelative:", 1);
  -[MFMessageCriterion setName:](v3, "setName:", CFSTR("TodayCriterion"));
  return v3;
}

+ (id)flaggedMessageCriterion
{
  MFMessageCriterion *v2;

  v2 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 26, 3, CFSTR("MessageIsFlagged"));
  -[MFMessageCriterion setUseFlaggedForUnreadCount:](v2, "setUseFlaggedForUnreadCount:", 1);
  -[MFMessageCriterion setName:](v2, "setName:", CFSTR("FlaggedCriterion"));
  return v2;
}

+ (id)hasAttachmentsCriterion
{
  MFMessageCriterion *v2;

  v2 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 26, 3, CFSTR("MFMessageHasAttachments"));
  -[MFMessageCriterion setName:](v2, "setName:", CFSTR("HasAttachmentsCriterion"));
  return v2;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setUseFlaggedForUnreadCount:(BOOL)a3
{
  self->_useFlaggedForUnreadCount = a3;
}

- (void)setDateUnits:(int)a3
{
  self->_dateUnitType = a3;
}

- (void)setDateIsRelative:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 68) = *((_BYTE *)self + 68) & 0xFD | v3;
}

+ (id)criteriaFromDefaultsArray:(id)a3
{
  return (id)objc_msgSend(a1, "criteriaFromDefaultsArray:removingRecognizedKeys:", a3, 1);
}

+ (id)criteriaFromDefaultsArray:(id)a3 removingRecognizedKeys:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v16 != v10)
        objc_enumerationMutation(a3);
      v12 = objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:andRemoveRecognizedKeysIfMutable:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), v4);
      if (v12)
      {
        v13 = (void *)v12;
        if (!v9)
          v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
        objc_msgSend(v9, "addObject:", v13);
      }
    }
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v8);
  return v9;
}

+ (id)defaultsArrayFromCriteria:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v13;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(a3);
      v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "dictionaryRepresentation");
      if (v9)
      {
        v10 = v9;
        if (!v6)
          v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
        objc_msgSend(v6, "addObject:", v10);
      }
    }
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  }
  while (v5);
  return v6;
}

- (MFMessageCriterion)initWithCriterion:(id)a3 expression:(id)a4
{
  MFMessageCriterion *v6;
  MFMessageCriterion *v7;

  v6 = -[MFMessageCriterion init](self, "init");
  v7 = v6;
  if (v6)
  {
    -[MFMessageCriterion setCriterionIdentifier:](v6, "setCriterionIdentifier:", a3);
    -[MFMessageCriterion setExpression:](v7, "setExpression:", a4);
  }
  return v7;
}

- (MFMessageCriterion)initWithDictionary:(id)a3
{
  return -[MFMessageCriterion initWithDictionary:andRemoveRecognizedKeysIfMutable:](self, "initWithDictionary:andRemoveRecognizedKeysIfMutable:", a3, 1);
}

- (MFMessageCriterion)initWithDictionary:(id)a3 andRemoveRecognizedKeysIfMutable:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  MFMessageCriterion *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  MFMessageCriterion *v18;
  char v19;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("Qualifier"));
  v8 = -[MFMessageCriterion initWithCriterion:expression:](self, "initWithCriterion:expression:", objc_msgSend(a3, "objectForKey:", CFSTR("Header")), objc_msgSend(a3, "objectForKey:", CFSTR("Expression")));
  if (v8)
  {
    v9 = objc_msgSend(a3, "objectForKey:", CFSTR("CriterionUniqueId"));
    if (v9)
    {
      v10 = (void *)v9;

      v8->_uniqueId = (NSString *)v10;
    }
    -[MFMessageCriterion setQualifier:](v8, "setQualifier:", -[MFMessageCriterion messageRuleQualifierForString:](v8, "messageRuleQualifierForString:", v7));
    -[MFMessageCriterion setAllCriteriaMustBeSatisfied:](v8, "setAllCriteriaMustBeSatisfied:", objc_msgSend(a3, "mf_BOOLForKey:", CFSTR("AllCriteriaMustBeSatisfied")));
    if (-[MFMessageCriterion criterionType](v8, "criterionType") == 7
      && !+[MailAccount accountWithPath:](MailAccount, "accountWithPath:", v8->_expression))
    {
      v21 = objc_msgSend(a3, "objectForKey:", CFSTR("AccountURL"));
      if (v21)
      {
        v22 = (void *)objc_msgSend(+[MailAccount infoForURL:](MailAccount, "infoForURL:", objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v21)), "objectForKey:", CFSTR("Account"));
        if (v22)
          -[MFMessageCriterion setExpression:](v8, "setExpression:", objc_msgSend(v22, "tildeAbbreviatedPath"));
      }
    }
    v11 = objc_msgSend(a3, "objectForKey:", CFSTR("Name"));
    if (v11)
      -[MFMessageCriterion setName:](v8, "setName:", v11);
    if (-[MFMessageCriterion criterionType](v8, "criterionType") == 24)
    {
      v12 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("Criteria"));
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(v12);
            v18 = -[MFMessageCriterion initWithDictionary:andRemoveRecognizedKeysIfMutable:]([MFMessageCriterion alloc], "initWithDictionary:andRemoveRecognizedKeysIfMutable:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), v4);
            objc_msgSend(v13, "addObject:", v18);

          }
          v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v15);
      }
      -[MFMessageCriterion setCriteria:](v8, "setCriteria:", v13);

    }
    else if (-[MFMessageCriterion criterionType](v8, "criterionType") == 11
           || -[MFMessageCriterion criterionType](v8, "criterionType") == 28)
    {
      v8->_dateUnitType = objc_msgSend(a3, "mf_integerForKey:", CFSTR("DateUnitType"));
      if (objc_msgSend(a3, "mf_BOOLForKey:", CFSTR("DateIsRelative")))
        v19 = 2;
      else
        v19 = 0;
      *((_BYTE *)v8 + 68) = *((_BYTE *)v8 + 68) & 0xFD | v19;
    }
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a3, "removeObjectForKey:", CFSTR("Qualifier"));
        objc_msgSend(a3, "removeObjectForKey:", CFSTR("Header"));
        objc_msgSend(a3, "removeObjectForKey:", CFSTR("Expression"));
      }
    }
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMessageCriterion;
  -[MFMessageCriterion dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  int v6;
  int v7;

  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_8:
      LOBYTE(v5) = 0;
      return v5;
    }
    v5 = -[NSString isEqualToString:](-[MFMessageCriterion criterionIdentifier](self, "criterionIdentifier"), "isEqualToString:", objc_msgSend(a3, "criterionIdentifier"));
    if (v5)
    {
      v6 = -[MFMessageCriterion qualifier](self, "qualifier");
      if (v6 != objc_msgSend(a3, "qualifier"))
        goto LABEL_8;
      v7 = -[MFMessageCriterion includeRemoteBodyContent](self, "includeRemoteBodyContent");
      if (v7 != objc_msgSend(a3, "includeRemoteBodyContent"))
        goto LABEL_8;
      if (-[MFMessageCriterion criterionType](self, "criterionType") == 24)
      {
        if (!-[NSArray isEqualToArray:](-[MFMessageCriterion criteria](self, "criteria"), "isEqualToArray:", objc_msgSend(a3, "criteria")))goto LABEL_8;
      }
      else
      {
        v5 = -[NSString isEqualToString:](-[MFMessageCriterion expression](self, "expression"), "isEqualToString:", objc_msgSend(a3, "expression"));
        if (!v5)
          return v5;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSArray *v3;

  if (-[MFMessageCriterion criterionType](self, "criterionType") == 24)
    v3 = -[MFMessageCriterion criteria](self, "criteria");
  else
    v3 = -[MFMessageCriterion expression](self, "expression");
  return -[NSArray hash](v3, "hash");
}

- (id)descriptionWithDepth:(unsigned int)a3
{
  __CFString *v5;
  unsigned int v6;
  NSArray *v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSString *v15;
  id v16;
  NSString *v17;
  const __CFString *v18;
  void *v19;
  NSString *v20;
  const __CFString *v21;
  _BOOL4 v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  __CFString *v27;
  NSString *v28;
  const __CFString *v29;
  id v30;
  const __CFString *v31;
  NSString *p_isa;
  const __CFString *v33;

  v5 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 4 * a3);
  if (a3)
  {
    v6 = a3;
    do
    {
      --v6;
      -[__CFString appendString:](v5, "appendString:", CFSTR("    "));
    }
    while (v6);
  }
  if (-[MFMessageCriterion criterionType](self, "criterionType") == 24)
  {
    v7 = -[MFMessageCriterion criteria](self, "criteria");
    v8 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v9 = -[NSArray count](v7, "count");
    if (v9)
    {
      v10 = v9;
      -[__CFString appendString:](v8, "appendString:", CFSTR("\n"));
      v11 = a3 + 1;
      v12 = v10 - 1;
      do
        -[__CFString appendString:](v8, "appendString:", objc_msgSend(-[NSArray objectAtIndex:](v7, "objectAtIndex:", v12--), "descriptionWithDepth:", v11));
      while (v12 != -1);
    }
    else
    {
      -[__CFString appendString:](v8, "appendString:", CFSTR("(none)"));
    }
    v19 = (void *)MEMORY[0x1E0CB3940];
    v20 = -[MFMessageCriterion criterionIdentifier](self, "criterionIdentifier");
    if (-[MFMessageCriterion name](self, "name"))
      v21 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  Name: %@\n"), v5, -[MFMessageCriterion name](self, "name"));
    else
      v21 = &stru_1E81CBE50;
    v22 = -[MFMessageCriterion allCriteriaMustBeSatisfied](self, "allCriteriaMustBeSatisfied");
    v23 = CFSTR("No");
    if (v22)
      v23 = CFSTR("Yes");
    p_isa = &v5->isa;
    v33 = v8;
    v30 = v5;
    v31 = v23;
    v28 = v20;
    v29 = v21;
    v24 = CFSTR("%@Criterion: %@\n%@%@  All criteria must be satisfied: %@\n%@  Criteria: %@");
    v27 = v5;
LABEL_23:
    v25 = v19;
    return (id)objc_msgSend(v25, "stringWithFormat:", v24, v27, v28, v29, v30, v31, p_isa, v33);
  }
  if (-[MFMessageCriterion criterionType](self, "criterionType") == 25)
  {
    if (-[NSArray count](-[MFMessageCriterion criteria](self, "criteria"), "count"))
      v13 = objc_msgSend(-[NSArray firstObject](-[MFMessageCriterion criteria](self, "criteria"), "firstObject"), "descriptionWithDepth:", a3 + 1);
    else
      v13 = 0;
    v19 = (void *)MEMORY[0x1E0CB3940];
    v29 = v5;
    v30 = (id)v13;
    v27 = v5;
    v28 = -[MFMessageCriterion criterionIdentifier](self, "criterionIdentifier");
    v24 = CFSTR("%@Criterion: %@\n%@ Sub-Criterion: \n%@");
    goto LABEL_23;
  }
  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = -[MFMessageCriterion criterionIdentifier](self, "criterionIdentifier");
  v16 = -[MFMessageCriterion _qualifierString](self, "_qualifierString");
  v17 = -[MFMessageCriterion expression](self, "expression");
  if (-[MFMessageCriterion name](self, "name"))
    v18 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  Name: %@\n"), v5, -[MFMessageCriterion name](self, "name"));
  else
    v18 = &stru_1E81CBE50;
  p_isa = v17;
  v33 = v18;
  v30 = v16;
  v31 = v5;
  v28 = v15;
  v29 = v5;
  v24 = CFSTR("%@Criterion: %@\n%@  Qualifier: %@\n%@  Expression: %@\n%@");
  v27 = v5;
  v25 = v14;
  return (id)objc_msgSend(v25, "stringWithFormat:", v24, v27, v28, v29, v30, v31, p_isa, v33);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> %@"), objc_opt_class(), self, -[MFMessageCriterion descriptionWithDepth:](self, "descriptionWithDepth:", 0));
}

- (id)dictionaryRepresentation
{
  void *v3;
  id v4;
  NSString *criterionIdentifier;
  NSString *expression;
  MailAccount *v7;
  NSString *name;
  void *v9;
  NSArray *criteria;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v4 = -[MFMessageCriterion _qualifierString](self, "_qualifierString");
  objc_msgSend(v3, "setObject:forKey:", self->_uniqueId, CFSTR("CriterionUniqueId"));
  criterionIdentifier = self->_criterionIdentifier;
  if (criterionIdentifier && !-[NSString isEqualToString:](criterionIdentifier, "isEqualToString:", &stru_1E81CBE50))
    objc_msgSend(v3, "setObject:forKey:", self->_criterionIdentifier, CFSTR("Header"));
  expression = self->_expression;
  if (expression && !-[NSString isEqualToString:](expression, "isEqualToString:", &stru_1E81CBE50))
    objc_msgSend(v3, "setObject:forKey:", self->_expression, CFSTR("Expression"));
  if (v4 && (objc_msgSend(v4, "isEqualToString:", &stru_1E81CBE50) & 1) == 0)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("Qualifier"));
  if (-[MFMessageCriterion criterionType](self, "criterionType") == 7)
  {
    v7 = +[MailAccount accountWithPath:](MailAccount, "accountWithPath:", self->_expression);
    if (v7)
    {
      v21 = CFSTR("Account");
      v22[0] = v7;
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(+[MailAccount URLForInfo:](MailAccount, "URLForInfo:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1)), "absoluteString"), CFSTR("AccountURL"));
    }
  }
  name = self->_name;
  if (name && !-[NSString isEqualToString:](name, "isEqualToString:", &stru_1E81CBE50))
    objc_msgSend(v3, "setObject:forKey:", self->_name, CFSTR("Name"));
  if (-[MFMessageCriterion criterionType](self, "criterionType") == 24)
  {
    if (-[NSArray count](self->_criteria, "count"))
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_criteria, "count"));
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      criteria = self->_criteria;
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](criteria, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(criteria);
            objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation"));
          }
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](criteria, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v12);
      }
      objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("Criteria"));

    }
    objc_msgSend(v3, "mf_setBool:forKey:", *((_BYTE *)self + 68) & 1, CFSTR("AllCriteriaMustBeSatisfied"));
  }
  else if (-[MFMessageCriterion criterionType](self, "criterionType") == 11
         || -[MFMessageCriterion criterionType](self, "criterionType") == 28)
  {
    objc_msgSend(v3, "mf_setBool:forKey:", (*((unsigned __int8 *)self + 68) >> 1) & 1, CFSTR("DateIsRelative"));
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), self->_dateUnitType), CFSTR("DateUnitType"));
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  int v6;
  unsigned int v7;

  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:qualifier:expression:", -[MFMessageCriterion criterionType](self, "criterionType"), -[MFMessageCriterion qualifier](self, "qualifier"), -[MFMessageCriterion expression](self, "expression"));
  *(_QWORD *)(v5 + 8) = -[NSString copyWithZone:](self->_criterionIdentifier, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 32) = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 40) = -[NSString copyWithZone:](self->_uniqueId, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 56) = -[NSArray copyWithZone:](self->_criteria, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 72) = -[NSArray copyWithZone:](self->_requiredHeaders, "copyWithZone:", a3);
  *(_DWORD *)(v5 + 64) = self->_dateUnitType;
  v6 = *(_BYTE *)(v5 + 68) & 0xFE | *((_BYTE *)self + 68) & 1;
  *(_BYTE *)(v5 + 68) = v6;
  v7 = v6 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)self + 68) >> 1) & 1));
  *(_BYTE *)(v5 + 68) = v7;
  *(_QWORD *)(v5 + 88) = self->_libraryIdentifiers;
  *(_BYTE *)(v5 + 80) = self->_preferFullTextSearch;
  *(_BYTE *)(v5 + 81) = self->_useFlaggedForUnreadCount;
  *(_BYTE *)(v5 + 68) = *((_BYTE *)self + 68) & 4 | v7 & 0xFB;
  *(_BYTE *)(v5 + 82) = self->_expressionIsSanitized;
  *(_BYTE *)(v5 + 83) = self->_includeRemoteBodyContent;
  return (id)v5;
}

- (NSString)criterionIdentifier
{
  if (self->_criterionIdentifier)
    return self->_criterionIdentifier;
  else
    return (NSString *)CFSTR("From");
}

- (id)_qualifierString
{
  return -[MFMessageCriterion stringForMessageRuleQualifier:](self, "stringForMessageRuleQualifier:", self->_qualifier);
}

- (id)_headersRequiredForEvaluation
{
  id result;
  uint64_t v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  result = self->_requiredHeaders;
  if (!result)
  {
    _MFLockGlobalLock();
    if (self->_requiredHeaders)
    {
LABEL_26:
      _MFUnlockGlobalLock();
      return self->_requiredHeaders;
    }
    v4 = -[MFMessageCriterion criterionType](self, "criterionType");
    if (v4 <= 18)
    {
      if ((unint64_t)(v4 - 14) < 2 || v4 == 9)
      {
        v7 = *MEMORY[0x1E0D1E520];
        v25[0] = *MEMORY[0x1E0D1E600];
        v25[1] = v7;
        v8 = *MEMORY[0x1E0D1E5D8];
        v25[2] = *MEMORY[0x1E0D1E5F0];
        v25[3] = v8;
        v25[4] = *MEMORY[0x1E0D1E518];
        v5 = (void *)MEMORY[0x1E0C99D20];
        v6 = v25;
        v9 = 5;
LABEL_24:
        v11 = (void *)objc_msgSend(v5, "arrayWithObjects:count:", v6, v9);
LABEL_25:
        self->_requiredHeaders = (NSArray *)v11;
        goto LABEL_26;
      }
    }
    else
    {
      if ((unint64_t)(v4 - 19) < 3)
      {
        v22 = *MEMORY[0x1E0D1E628];
        v5 = (void *)MEMORY[0x1E0C99D20];
        v6 = &v22;
LABEL_23:
        v9 = 1;
        goto LABEL_24;
      }
      if (v4 == 38)
      {
        v24 = *MEMORY[0x1E0D1E600];
        v5 = (void *)MEMORY[0x1E0C99D20];
        v6 = &v24;
        goto LABEL_23;
      }
      if (v4 == 39)
      {
        v23 = *MEMORY[0x1E0D1E520];
        v5 = (void *)MEMORY[0x1E0C99D20];
        v6 = &v23;
        goto LABEL_23;
      }
    }
    v10 = -[NSString componentsSeparatedByString:](-[MFMessageCriterion criterionIdentifier](self, "criterionIdentifier"), "componentsSeparatedByString:", CFSTR(" or "));
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v10, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v10);
          v16 = objc_msgSend(MEMORY[0x1E0D460C8], "uniqueHeaderKeyStringForString:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
          if (v16)
            objc_msgSend(v11, "addObject:", v16);
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }
    goto LABEL_25;
  }
  return result;
}

+ (void)_updateAddressComments:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (_allAddressComments)
    objc_msgSend((id)_allAddressComments, "removeAllObjects", a3);
  else
    _allAddressComments = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = +[MailAccount allEmailAddressesIncludingFullUserName:includeReceiveAliases:](MailAccount, "allEmailAddressesIncludingFullUserName:includeReceiveAliases:", 1, 1);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "mf_addressComment"), "lowercaseString");
        if (v8)
        {
          v9 = v8;
          if (!+[MailAccount accountContainingEmailAddress:](MailAccount, "accountContainingEmailAddress:", v8))objc_msgSend((id)_allAddressComments, "addObject:", v9);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
}

- (BOOL)_evaluateCompoundCriterion:(id)a3
{
  int v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = -[MFMessageCriterion allCriteriaMustBeSatisfied](self, "allCriteriaMustBeSatisfied");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = -[MFMessageCriterion criteria](self, "criteria", 0);
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      v11 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "doesMessageSatisfyCriterion:", a3);
      if (v5 != v11)
        break;
      if (v8 == ++v10)
      {
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          goto LABEL_3;
        return v11;
      }
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  return v11;
}

- (BOOL)_evaluateFlagCriterion:(id)a3
{
  unint64_t v5;
  uint64_t v6;
  NSString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = -[MFMessageCriterion expression](self, "expression");
  v9[0] = &unk_1E81EA170;
  v5 = MFMessageFlagsByApplyingDictionary(0, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1));
  v6 = objc_msgSend(a3, "messageFlags");
  if (-[MFMessageCriterion qualifier](self, "qualifier") == 3)
    return (v6 & v5) != 0;
  else
    return (v6 & v5) == 0;
}

- (BOOL)_evaluateHeaderCriterion:(id)a3
{
  NSString *v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _BOOL4 v22;
  id obj;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSString *v29;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = -[MFMessageCriterion expression](self, "expression");
  v6 = -[MFMessageCriterion qualifier](self, "qualifier");
  if (v6 == 3 || v5 && -[NSString length](v5, "length"))
  {
    v25 = (void *)objc_msgSend(a3, "headers");
    v31 = 0u;
    v32 = 0u;
    v7 = v6 == 4;
    v33 = 0u;
    v34 = 0u;
    obj = -[MFMessageCriterion _headersRequiredForEvaluation](self, "_headersRequiredForEvaluation");
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v27)
    {
      v26 = *(_QWORD *)v32;
      LOBYTE(v8) = 1;
      v29 = v5;
LABEL_6:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v32 != v26)
          objc_enumerationMutation(obj);
        if ((v8 & 1) == 0)
          break;
        v10 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v9);
        v11 = (void *)objc_msgSend(v25, "copyHeadersForKey:", v10);
        v30 = objc_msgSend(MEMORY[0x1E0D460C8], "isStructuredHeaderKey:", v10);
        v12 = objc_msgSend(v11, "count");
        v13 = v12;
        v28 = v9;
        if (v6 != 3 || v12)
        {
          if (v12)
          {
            v14 = 0;
            while (1)
            {
              v15 = objc_msgSend(v11, "objectAtIndex:", v14);
              if (v15 && (v16 = v15, -[NSString length](v5, "length")))
              {
                if ((v30 & 1) != 0)
                  v17 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D460C8], "addressListFromEncodedString:", v16), "ef_flatMap:", &__block_literal_global_7);
                else
                  v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v16, 0);
                v18 = v17;
                v19 = objc_msgSend(v17, "count");
                if (v19)
                {
                  v20 = v19;
                  v21 = 1;
                  do
                  {
                    v22 = -[MFMessageCriterion _evaluatePartOfStructure:](self, "_evaluatePartOfStructure:", objc_msgSend(v18, "objectAtIndex:", v21 - 1));
                    if (v6 == 4)
                      v7 &= v22;
                    else
                      v7 = v22;
                    if (v6 == 4)
                      v8 = v22;
                    else
                      v8 = !v22;
                    if (v21 >= v20)
                      break;
                    ++v21;
                  }
                  while ((v8 & 1) != 0);
                }
                else
                {
                  v8 = 1;
                }

                v5 = v29;
                if (!v8)
                  goto LABEL_37;
              }
              else
              {
                LOBYTE(v8) = 1;
              }
              if (++v14 >= v13)
                goto LABEL_37;
            }
          }
        }
        else
        {
          v7 |= -[NSString length](v5, "length") == 0;
        }
        LOBYTE(v8) = 1;
LABEL_37:

        v9 = v28 + 1;
        if (v28 + 1 == v27)
        {
          v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          if (v27)
            goto LABEL_6;
          return v7 & 1;
        }
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7 & 1;
}

uint64_t __47__MFMessageCriterion__evaluateHeaderCriterion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "mf_addressComment");
  v4 = objc_msgSend(a2, "mf_uncommentedAddress");
  if (v4 && v3)
  {
    v11[0] = v4;
    v11[1] = v3;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = v11;
    v7 = 2;
  }
  else
  {
    if (v4)
    {
      v10 = v4;
      v5 = (void *)MEMORY[0x1E0C99D20];
      v6 = &v10;
    }
    else
    {
      if (!v3)
        return MEMORY[0x1E0C9AA60];
      v9 = v3;
      v5 = (void *)MEMORY[0x1E0C99D20];
      v6 = &v9;
    }
    v7 = 1;
  }
  return objc_msgSend(v5, "arrayWithObjects:count:", v6, v7);
}

- (BOOL)_evaluateSenderHeaderCriterion:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(a3, "firstSender");
  v5 = objc_msgSend(v4, "mf_addressComment");
  return -[MFMessageCriterion _evaluatePartOfStructure:](self, "_evaluatePartOfStructure:", objc_msgSend(v4, "mf_uncommentedAddress"))|| -[MFMessageCriterion _evaluatePartOfStructure:](self, "_evaluatePartOfStructure:", v5);
}

- (BOOL)_evaluatePartOfStructure:(id)a3
{
  NSString *v5;
  int v6;
  int v7;
  uint64_t v8;
  BOOL result;
  uint64_t v11;
  uint64_t v12;

  if (a3)
  {
    v5 = -[MFMessageCriterion expression](self, "expression");
    v6 = -[MFMessageCriterion qualifier](self, "qualifier");
    v7 = 0;
    v8 = 393;
    switch(v6)
    {
      case 1:
        goto LABEL_12;
      case 2:
        v7 = 0;
        v8 = 397;
        goto LABEL_12;
      case 3:
        return objc_msgSend(a3, "localizedCaseInsensitiveCompare:", v5) == 0;
      case 4:
        v7 = 1;
        goto LABEL_11;
      case 7:
        return objc_msgSend(a3, "localizedCaseInsensitiveCompare:", v5) != 0;
      default:
        v7 = 0;
LABEL_11:
        v8 = 385;
LABEL_12:
        v11 = objc_msgSend(a3, "length");
        v12 = objc_msgSend(a3, "rangeOfString:options:range:locale:", v5, v8, 0, v11, objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"));
        if (v7)
          result = v12 == 0x7FFFFFFFFFFFFFFFLL;
        else
          result = v12 != 0x7FFFFFFFFFFFFFFFLL;
        break;
    }
  }
  else
  {
    return -[MFMessageCriterion qualifier](self, "qualifier") == 4;
  }
  return result;
}

- (BOOL)_evaluateAddressBookCriterion:(id)a3
{
  return 0;
}

- (BOOL)_evaluateFullNameCriterion:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  char v27;
  NSObject *v28;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "headers");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_msgSend(v5, "copyAddressListForTo");
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v6, "addObjectsFromArray:", v7);

  v8 = (void *)objc_msgSend(v5, "copyAddressListForCc");
  if (objc_msgSend(v8, "count"))
    objc_msgSend(v6, "addObjectsFromArray:", v8);

  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v15 = objc_msgSend((id)objc_msgSend(v14, "mf_addressComment"), "lowercaseString");
        if (v15)
        {
          v16 = v15;
          if (objc_msgSend(v14, "caseInsensitiveCompare:", v15))
            objc_msgSend(v9, "addObject:", v16);
        }
      }
      v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v11);
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v17 = (void *)_allAddressComments;
  v18 = objc_msgSend((id)_allAddressComments, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v33;
    while (2)
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v33 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        v23 = objc_msgSend(v9, "count");
        if (v23)
        {
          v24 = v23 - 1;
          while (!objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", v24), "isEqualToString:", v22))
          {
            if (v24-- == 0)
              goto LABEL_27;
          }
          v28 = MFLogGeneral();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            v30 = objc_msgSend((id)objc_msgSend(a3, "subject"), "ef_publicDescription");
            v31 = objc_msgSend(v22, "UTF8String");
            *(_DWORD *)buf = 138543618;
            v41 = v30;
            v42 = 2080;
            v43 = v31;
            _os_log_debug_impl(&dword_1C8839000, v28, OS_LOG_TYPE_DEBUG, "[LogJunkMailActivity] '%{public}@' is addressed to known full name '%s'", buf, 0x16u);
          }
          v27 = 1;
          return v27 ^ (-[MFMessageCriterion criterionType](self, "criterionType") != 14);
        }
LABEL_27:
        ;
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
      v27 = 0;
      if (v19)
        continue;
      break;
    }
  }
  else
  {
    v27 = 0;
  }
  return v27 ^ (-[MFMessageCriterion criterionType](self, "criterionType") != 14);
}

- (BOOL)_evaluateIsDigitallySignedCriterion:(id)a3
{
  objc_msgSend(a3, "calculateAttachmentInfoFromBody:", objc_msgSend(a3, "messageBodyUpdatingFlags:", 0));
  return ((unint64_t)objc_msgSend(a3, "messageFlags") >> 23) & 1;
}

- (BOOL)_evaluateIsEncryptedCriterion:(id)a3
{
  objc_msgSend(a3, "calculateAttachmentInfoFromBody:", objc_msgSend(a3, "messageBodyUpdatingFlags:", 0));
  return ((unint64_t)objc_msgSend(a3, "messageFlags") >> 3) & 1;
}

- (BOOL)_evaluatePriorityIsNormalCriterion:(id)a3
{
  return objc_msgSend(a3, "priority") == 3;
}

- (BOOL)_evaluatePriorityIsHighCriterion:(id)a3
{
  return objc_msgSend(a3, "priority") < 3;
}

- (BOOL)_evaluatePriorityIsLowCriterion:(id)a3
{
  return objc_msgSend(a3, "priority") > 3;
}

- (BOOL)_evaluateAttachmentCriterion:(id)a3
{
  NSString *v5;
  NSString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = -[MFMessageCriterion expression](self, "expression");
  if (v5)
  {
    v6 = v5;
    if (-[NSString isEqualToString:](v5, "isEqualToString:", &stru_1E81CBE50))
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      v7 = (void *)objc_msgSend(a3, "messageBodyUpdatingFlags:", 0);
      v8 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
      v9 = objc_msgSend(v8, "error");
      objc_msgSend(v8, "setError:", 0);
      objc_msgSend(a3, "calculateAttachmentInfoFromBody:", v7);
      v10 = objc_msgSend((id)objc_msgSend(v8, "error"), "code");
      objc_msgSend(v8, "setError:", v9);
      LOBYTE(v5) = 0;
      if ((unint64_t)(v10 - 1037) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v5 = (NSString *)objc_msgSend(a3, "numberOfAttachments");
        if (v5)
        {
          v11 = -[MFMessageCriterion qualifier](self, "qualifier");
          v12 = (void *)objc_msgSend(v7, "attachments");
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v5 = (NSString *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v5)
          {
            v13 = (uint64_t)v5;
            v14 = *(_QWORD *)v19;
            while (2)
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v19 != v14)
                  objc_enumerationMutation(v12);
                v16 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "mimePart"), "attachmentFilename");
                switch(v11)
                {
                  case 3:
                    if ((objc_msgSend(v16, "isEqualToString:", v6) & 1) != 0)
                      goto LABEL_22;
                    break;
                  case 2:
                    if ((objc_msgSend(v16, "hasSuffix:", v6) & 1) != 0)
                    {
LABEL_22:
                      LOBYTE(v5) = 1;
                      return (char)v5;
                    }
                    break;
                  case 1:
                    if ((objc_msgSend(v16, "hasPrefix:", v6) & 1) != 0)
                      goto LABEL_22;
                    break;
                  default:
                    LOBYTE(v5) = v11 == 4
                                      * (objc_msgSend(v16, "rangeOfString:options:", v6, 1) == 0x7FFFFFFFFFFFFFFFLL);
                    return (char)v5;
                }
              }
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
              LOBYTE(v5) = 0;
              if (v13)
                continue;
              break;
            }
          }
        }
      }
    }
  }
  return (char)v5;
}

- (BOOL)_evaluateAccountCriterion:(id)a3
{
  MailAccount *v4;

  v4 = +[MailAccount accountWithPath:](MailAccount, "accountWithPath:", -[MFMessageCriterion expression](self, "expression"));
  return objc_msgSend(a3, "account") == (_QWORD)v4;
}

- (BOOL)_evaluateAddressHistoryCriterion:(id)a3
{
  return 0;
}

- (BOOL)_evaluateDateCriterion:(id)a3
{
  NSString *v5;
  int v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  v5 = -[MFMessageCriterion expression](self, "expression");
  v6 = -[MFMessageCriterion qualifier](self, "qualifier");
  v7 = -[MFMessageCriterion criterionType](self, "criterionType");
  if (!v5)
    return 0;
  v8 = v7;
  if (-[NSString intValue](v5, "intValue") < 1)
    return 0;
  if (v8 == 11)
  {
    v9 = (void *)objc_msgSend(a3, "dateReceived");
  }
  else
  {
    if (v8 != 10)
      return 0;
    v9 = (void *)objc_msgSend(a3, "dateSent");
  }
  objc_msgSend(v9, "timeIntervalSince1970");
  v11 = v10;
  -[NSString doubleValue](v5, "doubleValue");
  if (v6 == 6)
    return v11 >= v12;
  return v6 == 5 && v11 <= v12;
}

- (BOOL)_evaluateConversationIDCriterion:(id)a3
{
  uint64_t v5;
  BOOL result;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = -[NSString longLongValue](-[MFMessageCriterion expression](self, "expression"), "longLongValue");
  if (-[MFMessageCriterion qualifier](self, "qualifier") == 3)
    return objc_msgSend(a3, "conversationID") == v5;
  if (-[MFMessageCriterion qualifier](self, "qualifier") == 7)
    return objc_msgSend(a3, "conversationID") != v5;
  v7 = MFLogGeneral();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v8)
  {
    v9 = 134218240;
    v10 = -[MFMessageCriterion qualifier](self, "qualifier");
    v11 = 2048;
    v12 = -[MFMessageCriterion criterionType](self, "criterionType");
    _os_log_impl(&dword_1C8839000, v7, OS_LOG_TYPE_DEFAULT, "#Warning Unhandled qualifier %ld for type %ld", (uint8_t *)&v9, 0x16u);
    return 0;
  }
  return result;
}

- (BOOL)_evaluateMailboxCriterion:(id)a3
{
  return -[MFMessageCriterion qualifier](self, "qualifier") == 3
      && -[NSString isEqualToString:](-[MFMessageCriterion expression](self, "expression"), "isEqualToString:", objc_msgSend(a3, "originalMailboxURL"));
}

- (BOOL)doesMessageSatisfyCriterion:(id)a3
{
  int64_t v5;
  BOOL result;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = -[MFMessageCriterion criterionType](self, "criterionType") - 1;
  result = 1;
  switch(v5)
  {
    case 0:
    case 8:
    case 37:
    case 38:
      result = -[MFMessageCriterion _evaluateHeaderCriterion:](self, "_evaluateHeaderCriterion:", a3);
      break;
    case 2:
    case 3:
      result = -[MFMessageCriterion _evaluateAddressBookCriterion:](self, "_evaluateAddressBookCriterion:", a3);
      break;
    case 6:
      result = -[MFMessageCriterion _evaluateAccountCriterion:](self, "_evaluateAccountCriterion:", a3);
      break;
    case 7:
      return result;
    case 9:
    case 10:
      result = -[MFMessageCriterion _evaluateDateCriterion:](self, "_evaluateDateCriterion:", a3);
      break;
    case 11:
    case 12:
      result = -[MFMessageCriterion _evaluateAddressHistoryCriterion:](self, "_evaluateAddressHistoryCriterion:", a3);
      break;
    case 13:
    case 14:
      result = -[MFMessageCriterion _evaluateFullNameCriterion:](self, "_evaluateFullNameCriterion:", a3);
      break;
    case 15:
      result = -[MFMessageCriterion _evaluateIsDigitallySignedCriterion:](self, "_evaluateIsDigitallySignedCriterion:", a3);
      break;
    case 16:
      result = -[MFMessageCriterion _evaluateIsEncryptedCriterion:](self, "_evaluateIsEncryptedCriterion:", a3);
      break;
    case 17:
      result = -[MFMessageCriterion _evaluateAttachmentCriterion:](self, "_evaluateAttachmentCriterion:", a3);
      break;
    case 18:
      result = -[MFMessageCriterion _evaluatePriorityIsHighCriterion:](self, "_evaluatePriorityIsHighCriterion:", a3);
      break;
    case 19:
      result = -[MFMessageCriterion _evaluatePriorityIsNormalCriterion:](self, "_evaluatePriorityIsNormalCriterion:", a3);
      break;
    case 20:
      result = -[MFMessageCriterion _evaluatePriorityIsLowCriterion:](self, "_evaluatePriorityIsLowCriterion:", a3);
      break;
    case 21:
      result = -[MFMessageCriterion _evaluateMailboxCriterion:](self, "_evaluateMailboxCriterion:", a3);
      break;
    case 23:
      result = -[MFMessageCriterion _evaluateCompoundCriterion:](self, "_evaluateCompoundCriterion:", a3);
      break;
    case 25:
      result = -[MFMessageCriterion _evaluateFlagCriterion:](self, "_evaluateFlagCriterion:", a3);
      break;
    case 32:
      result = -[MFMessageCriterion _evaluateConversationIDCriterion:](self, "_evaluateConversationIDCriterion:", a3);
      break;
    case 33:
      result = -[MFMessageCriterion _evaluateSenderHeaderCriterion:](self, "_evaluateSenderHeaderCriterion:", a3);
      break;
    default:
      v7 = MFLogGeneral();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (v8)
      {
        v9 = 134217984;
        v10 = -[MFMessageCriterion criterionType](self, "criterionType");
        _os_log_impl(&dword_1C8839000, v7, OS_LOG_TYPE_DEFAULT, "#Warning Unhandled criterion type %ld", (uint8_t *)&v9, 0xCu);
        result = 0;
      }
      break;
  }
  return result;
}

- (int)messageRuleQualifierForString:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("BeginsWith")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("EndsWith")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("IsEqualTo")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("IsNotEqualTo")) & 1) != 0)
    return 7;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DoesNotContain")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("IsLessThan")) & 1) != 0)
    return 5;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("IsGreaterThan")) & 1) != 0)
    return 6;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("ASCIIContains")))
    return 8;
  return 0;
}

- (id)stringForMessageRuleQualifier:(int)a3
{
  if (a3 > 8)
    return 0;
  else
    return off_1E81CA710[a3];
}

- (NSArray)criteria
{
  return self->_criteria;
}

- (void)setCriteria:(id)a3
{
  NSArray *criteria;

  criteria = self->_criteria;
  if (criteria != a3)
  {

    self->_criteria = (NSArray *)objc_msgSend(a3, "copy");
  }
  -[MFMessageCriterion setCriterionType:](self, "setCriterionType:", 24);
}

- (BOOL)allCriteriaMustBeSatisfied
{
  return *((_BYTE *)self + 68) & 1;
}

- (void)setAllCriteriaMustBeSatisfied:(BOOL)a3
{
  *((_BYTE *)self + 68) = *((_BYTE *)self + 68) & 0xFE | a3;
}

- (int)dateUnits
{
  return self->_dateUnitType;
}

- (BOOL)dateIsRelative
{
  return (*((unsigned __int8 *)self + 68) >> 1) & 1;
}

- (id)dateFromExpression
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[NSString doubleValue](-[MFMessageCriterion expression](self, "expression"), "doubleValue");
  return (id)objc_msgSend(v2, "dateWithTimeIntervalSince1970:");
}

+ (id)expressionForDate:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "timeIntervalSince1970");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%f"), v4);
}

- (id)simplifyOnce
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  MFMessageCriterion *v6;
  void *v8;
  uint64_t i;
  id v10;
  id v11;
  int v12;

  if (-[MFMessageCriterion criterionType](self, "criterionType") == 24
    && (v3 = -[MFMessageCriterion criteria](self, "criteria"), (v4 = -[NSArray count](v3, "count")) != 0))
  {
    v5 = v4;
    if (v4 == 1)
    {
      v6 = (MFMessageCriterion *)objc_msgSend(-[NSArray lastObject](v3, "lastObject"), "simplifiedCriterion");
    }
    else
    {
      v6 = 0;
      v8 = 0;
      for (i = 0; i != v5; ++i)
      {
        v10 = -[NSArray objectAtIndex:](v3, "objectAtIndex:", i);
        v11 = (id)objc_msgSend(v10, "simplifiedCriterion");
        if (objc_msgSend(v11, "criterionType") == 24
          && ((v12 = -[MFMessageCriterion allCriteriaMustBeSatisfied](self, "allCriteriaMustBeSatisfied"),
               v12 == objc_msgSend(v11, "allCriteriaMustBeSatisfied"))
           || !objc_msgSend((id)objc_msgSend(v11, "criteria"), "count")))
        {
          if (!v6)
          {
            v6 = objc_alloc_init(MFMessageCriterion);
            -[MFMessageCriterion setCriterionType:](v6, "setCriterionType:", 24);
            -[MFMessageCriterion setAllCriteriaMustBeSatisfied:](v6, "setAllCriteriaMustBeSatisfied:", -[MFMessageCriterion allCriteriaMustBeSatisfied](self, "allCriteriaMustBeSatisfied"));
            v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            objc_msgSend(v8, "addObjectsFromArray:", -[NSArray subarrayWithRange:](v3, "subarrayWithRange:", 0, i));
          }
          objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(v11, "criteria"));
        }
        else
        {
          if (v11 != v10 && !v6)
          {
            v6 = objc_alloc_init(MFMessageCriterion);
            -[MFMessageCriterion setCriterionType:](v6, "setCriterionType:", 24);
            -[MFMessageCriterion setAllCriteriaMustBeSatisfied:](v6, "setAllCriteriaMustBeSatisfied:", -[MFMessageCriterion allCriteriaMustBeSatisfied](self, "allCriteriaMustBeSatisfied"));
            v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            objc_msgSend(v8, "addObjectsFromArray:", -[NSArray subarrayWithRange:](v3, "subarrayWithRange:", 0, i));
          }
          objc_msgSend(v8, "addObject:", v11);
        }
      }
      if (v6)
        -[MFMessageCriterion setCriteria:](v6, "setCriteria:", v8);
    }
  }
  else
  {
    v6 = 0;
  }
  if (v6)
    return v6;
  else
    return self;
}

- (id)simplifiedCriterion
{
  unsigned int v2;
  MFMessageCriterion *v3;

  v2 = 0;
  do
  {
    v3 = self;
    self = -[MFMessageCriterion simplifyOnce](self, "simplifyOnce");
    if (self == v3)
      break;
  }
  while (v2++ < 0xA);
  return self;
}

+ (id)criterionForMailbox:(id)a3
{
  return (id)objc_msgSend(a1, "criterionForMailboxURL:", objc_msgSend(a3, "URLString"));
}

+ (id)criterionForAccount:(id)a3
{
  return -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 22, 1, objc_msgSend(a3, "URLString"));
}

+ (id)criterionExcludingMailboxes:(id)a3
{
  id result;

  result = (id)objc_msgSend(a3, "count");
  if (result)
    return +[MFMessageCriterion notCriterionWithCriterion:](MFMessageCriterion, "notCriterionWithCriterion:", +[MFMessageCriterion orCompoundCriterionWithCriteria:](MFMessageCriterion, "orCompoundCriterionWithCriteria:", objc_msgSend(a3, "ef_map:", &__block_literal_global_182)));
  return result;
}

id __50__MFMessageCriterion_criterionExcludingMailboxes___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[MFMessageCriterion criterionForMailbox:](MFMessageCriterion, "criterionForMailbox:", a2);
}

+ (id)messageIsDeletedCriterion:(BOOL)a3
{
  _BOOL4 v3;
  MFMessageCriterion *v4;
  uint64_t v5;

  v3 = a3;
  v4 = [MFMessageCriterion alloc];
  if (v3)
    v5 = 3;
  else
    v5 = 7;
  return -[MFMessageCriterion initWithType:qualifier:expression:](v4, "initWithType:qualifier:expression:", 26, v5, CFSTR("MessageIsDeleted"));
}

+ (id)messageIsJournaledCriterion:(BOOL)a3
{
  _BOOL4 v3;
  MFMessageCriterion *v4;
  uint64_t v5;

  v3 = a3;
  v4 = [MFMessageCriterion alloc];
  if (v3)
    v5 = 3;
  else
    v5 = 7;
  return -[MFMessageCriterion initWithType:qualifier:expression:](v4, "initWithType:qualifier:expression:", 26, v5, CFSTR("MessageIsJournaled"));
}

+ (id)criterionForNotDeletedConversationID:(int64_t)a3
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = +[MFMessageCriterion messageIsDeletedCriterion:](MFMessageCriterion, "messageIsDeletedCriterion:", 0);
  v5[1] = +[MFMessageCriterion criterionForConversationID:](MFMessageCriterion, "criterionForConversationID:", a3);
  return +[MFMessageCriterion andCompoundCriterionWithCriteria:](MFMessageCriterion, "andCompoundCriterionWithCriteria:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2));
}

+ (id)criterionForConversationID:(int64_t)a3
{
  return -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 33, 3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), a3));
}

+ (id)criterionForLibraryID:(id)a3
{
  return -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 23, 3, a3);
}

+ (id)messageIsServerSearchResultCriterion:(BOOL)a3
{
  _BOOL4 v3;
  MFMessageCriterion *v4;
  uint64_t v5;

  v3 = a3;
  v4 = [MFMessageCriterion alloc];
  if (v3)
    v5 = 3;
  else
    v5 = 7;
  return -[MFMessageCriterion initWithType:qualifier:expression:](v4, "initWithType:qualifier:expression:", 26, v5, CFSTR("MessageIsServerSearchResult"));
}

- (BOOL)isVIPCriterion
{
  return -[MFMessageCriterion criterionType](self, "criterionType") == 26
      && -[NSString isEqualToString:](-[MFMessageCriterion expression](self, "expression"), "isEqualToString:", CFSTR("MessageSenderIsVIP"));
}

+ (id)unreadMessageCriterion
{
  MFMessageCriterion *v2;

  v2 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 26, 7, CFSTR("MessageIsRead"));
  -[MFMessageCriterion setName:](v2, "setName:", CFSTR("UnreadCriterion"));
  return v2;
}

+ (id)readMessageCriterion
{
  MFMessageCriterion *v2;

  v2 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 26, 3, CFSTR("MessageIsRead"));
  -[MFMessageCriterion setName:](v2, "setName:", CFSTR("ReadCriterion"));
  return v2;
}

+ (id)toMeCriterion
{
  MFMessageCriterion *v2;

  v2 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 26, 3, CFSTR("MessageToContainsAccountAddress"));
  -[MFMessageCriterion setName:](v2, "setName:", CFSTR("ToMeCriterionName"));
  return v2;
}

+ (id)ccMeCriterion
{
  MFMessageCriterion *v2;

  v2 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 26, 3, CFSTR("MessageCcContainsAccountAddress"));
  -[MFMessageCriterion setName:](v2, "setName:", CFSTR("CcMeCriterionName"));
  return v2;
}

+ (id)criterionForDateReceivedOlderThanDate:(id)a3
{
  return -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 11, 5, objc_msgSend(a1, "expressionForDate:", a3));
}

+ (id)notCriterionWithCriterion:(id)a3
{
  MFMessageCriterion *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = objc_alloc_init(MFMessageCriterion);
  v6[0] = a3;
  -[MFMessageCriterion setCriteria:](v4, "setCriteria:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1));
  -[MFMessageCriterion setCriterionType:](v4, "setCriterionType:", 25);
  return v4;
}

+ (id)andCompoundCriterionWithCriteria:(id)a3
{
  id result;
  MFMessageCriterion *v5;

  result = (id)objc_msgSend(a3, "count");
  if (result)
  {
    if (objc_msgSend(a3, "count") == 1)
    {
      v5 = (MFMessageCriterion *)(id)objc_msgSend(a3, "lastObject");
    }
    else
    {
      v5 = objc_alloc_init(MFMessageCriterion);
      -[MFMessageCriterion setCriterionType:](v5, "setCriterionType:", 24);
      -[MFMessageCriterion setAllCriteriaMustBeSatisfied:](v5, "setAllCriteriaMustBeSatisfied:", 1);
      -[MFMessageCriterion setCriteria:](v5, "setCriteria:", a3);
    }
    return v5;
  }
  return result;
}

+ (id)orCompoundCriterionWithCriteria:(id)a3
{
  id result;
  MFMessageCriterion *v5;

  result = (id)objc_msgSend(a3, "count");
  if (result)
  {
    if (objc_msgSend(a3, "count") == 1)
    {
      v5 = (MFMessageCriterion *)(id)objc_msgSend(a3, "lastObject");
    }
    else
    {
      v5 = objc_alloc_init(MFMessageCriterion);
      -[MFMessageCriterion setCriterionType:](v5, "setCriterionType:", 24);
      -[MFMessageCriterion setAllCriteriaMustBeSatisfied:](v5, "setAllCriteriaMustBeSatisfied:", 0);
      -[MFMessageCriterion setCriteria:](v5, "setCriteria:", a3);
    }
    return v5;
  }
  return result;
}

- (int)qualifier
{
  return self->_qualifier;
}

- (NSIndexSet)libraryIdentifiers
{
  return self->_libraryIdentifiers;
}

- (void)setLibraryIdentifiers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (BOOL)preferFullTextSearch
{
  return self->_preferFullTextSearch;
}

- (void)setPreferFullTextSearch:(BOOL)a3
{
  self->_preferFullTextSearch = a3;
}

- (BOOL)useFlaggedForUnreadCount
{
  return self->_useFlaggedForUnreadCount;
}

- (BOOL)includeRelatedMessages
{
  return (*((unsigned __int8 *)self + 68) >> 2) & 1;
}

- (void)setIncludeRelatedMessages:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 68) = *((_BYTE *)self + 68) & 0xFB | v3;
}

- (BOOL)expressionIsSanitized
{
  return self->_expressionIsSanitized;
}

- (void)setExpressionIsSanitized:(BOOL)a3
{
  self->_expressionIsSanitized = a3;
}

- (BOOL)includeRemoteBodyContent
{
  return self->_includeRemoteBodyContent;
}

- (void)setIncludeRemoteBodyContent:(BOOL)a3
{
  self->_includeRemoteBodyContent = a3;
}

- (NSString)name
{
  return self->_name;
}

@end
