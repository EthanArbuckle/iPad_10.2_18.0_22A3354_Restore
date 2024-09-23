@implementation MFMessageCriterion

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
  NSString *expression;
  NSString *v4;
  NSString *v5;

  expression = self->_expression;
  if (!expression)
  {
    -[EFInt64Set commaSeparatedString](self->_libraryIdentifiers, "commaSeparatedString");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_expression;
    self->_expression = v4;

    expression = self->_expression;
  }
  return expression;
}

+ (int64_t)criterionTypeForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Header")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Body")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SenderIsInAddressBook")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SenderIsNotInAddressBook")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SenderHeader")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Account")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AnyMessage")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AnyRecipient")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DateReceived")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DisplayDate")) & 1) != 0)
  {
    v4 = 12;
  }
  else
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DateLastViewed")) & 1) != 0)
      goto LABEL_22;
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DateSent")) & 1) != 0)
    {
      v4 = 10;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SenderIsInAddressHistory")) & 1) != 0)
    {
      v4 = 13;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SenderIsNotInAddressHistory")) & 1) != 0)
    {
      v4 = 14;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AnyRecipientIncludesFullName")) & 1) != 0)
    {
      v4 = 15;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NoRecipientIncludesFullName")) & 1) != 0)
    {
      v4 = 16;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IsDigitallySigned")) & 1) != 0)
    {
      v4 = 17;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IsEncrypted")) & 1) != 0)
    {
      v4 = 18;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PriorityIsNormal")) & 1) != 0)
    {
      v4 = 21;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PriorityIsHigh")) & 1) != 0)
    {
      v4 = 20;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PriorityIsLow")) & 1) != 0)
    {
      v4 = 22;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AnyAttachment")) & 1) != 0)
    {
      v4 = 19;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Mailbox")) & 1) != 0)
    {
      v4 = 23;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MessageNumber")) & 1) != 0)
    {
      v4 = 24;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ExternalID")) & 1) != 0)
    {
      v4 = 36;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Compound")) & 1) != 0)
    {
      v4 = 25;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Flag")) & 1) != 0)
    {
      v4 = 27;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FlagColor")) & 1) != 0)
    {
      v4 = 28;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotInTrashMailbox")) & 1) != 0)
    {
      v4 = 29;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ContainsAttachments")) & 1) != 0)
    {
      v4 = 30;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SpotlightSearch")) & 1) != 0)
    {
      v4 = 33;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ConversationID")) & 1) != 0)
    {
      v4 = 34;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Negation")) & 1) != 0)
    {
      v4 = 26;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MessageIdHash")) & 1) != 0)
    {
      v4 = 38;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GlobalMessageID")) & 1) != 0)
    {
      v4 = 37;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ListIDHash")) & 1) != 0)
    {
      v4 = 39;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DocumentID")) & 1) != 0)
    {
      v4 = 42;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ToRecipient")) & 1) != 0)
    {
      v4 = 40;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CcRecipient")) & 1) != 0)
    {
      v4 = 41;
      goto LABEL_97;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DateLastViewed")) & 1) != 0)
    {
LABEL_22:
      v4 = 43;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CategoryType")) & 1) != 0)
    {
      v4 = 44;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CategoryUserOverrideType")) & 1) != 0)
    {
      v4 = 45;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReadLater")) & 1) != 0)
    {
      v4 = 46;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FollowUpStartDate")) & 1) != 0)
    {
      v4 = 47;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FollowUpEndDate")) & 1) != 0)
    {
      v4 = 48;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SendLater")) & 1) != 0)
    {
      v4 = 49;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unsubscribe")) & 1) != 0)
    {
      v4 = 50;
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SenderBucket")))
    {
      v4 = 51;
    }
    else
    {
      v4 = 1;
    }
  }
LABEL_97:

  return v4;
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
  return -[MFMessageCriterion initWithType:qualifier:expression:](v4, "initWithType:qualifier:expression:", 27, v5, CFSTR("MessageIsDeleted"));
}

+ (id)flaggedMessageCriterion
{
  MFMessageCriterion *v2;

  v2 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 27, 3, CFSTR("MessageIsFlagged"));
  -[MFMessageCriterion setUseFlaggedForUnreadCount:](v2, "setUseFlaggedForUnreadCount:", 1);
  -[MFMessageCriterion setName:](v2, "setName:", CFSTR("FlaggedCriterion"));
  return v2;
}

- (void)setUseFlaggedForUnreadCount:(BOOL)a3
{
  self->_useFlaggedForUnreadCount = a3;
}

+ (id)todayMessageCriterion
{
  MFMessageCriterion *v2;
  void *v3;
  MFMessageCriterion *v4;

  v2 = [MFMessageCriterion alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MFMessageCriterion initWithType:qualifier:expression:](v2, "initWithType:qualifier:expression:", 11, 5, v3);

  -[MFMessageCriterion setDateUnits:](v4, "setDateUnits:", 1);
  -[MFMessageCriterion setDateIsRelative:](v4, "setDateIsRelative:", 1);
  -[MFMessageCriterion setName:](v4, "setName:", CFSTR("TodayCriterion"));
  return v4;
}

- (void)setDateUnits:(int64_t)a3
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
  *((_BYTE *)self + 72) = *((_BYTE *)self + 72) & 0xFD | v3;
}

+ (id)threadMuteMessageCriterion
{
  MFMessageCriterion *v2;

  v2 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 27, 3, CFSTR("MessageConversationIsMuted"));
  -[MFMessageCriterion setName:](v2, "setName:", CFSTR("ThreadMuteCriterionName"));
  return v2;
}

+ (id)hasAttachmentsCriterion
{
  MFMessageCriterion *v2;

  v2 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 27, 3, CFSTR("MFMessageHasAttachments"));
  -[MFMessageCriterion setName:](v2, "setName:", CFSTR("HasAttachmentsCriterion"));
  return v2;
}

+ (id)threadNotifyMessageCriterion
{
  MFMessageCriterion *v2;

  v2 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 27, 3, CFSTR("MessageConversationIsVIP"));
  -[MFMessageCriterion setName:](v2, "setName:", CFSTR("ThreadNotifyCriterionName"));
  return v2;
}

+ (id)includesMeCriterion
{
  MFMessageCriterion *v2;

  v2 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 27, 3, CFSTR("MessageToOrCcContainsAccountAddress"));
  -[MFMessageCriterion setName:](v2, "setName:", CFSTR("IncludesMeCriterion"));
  return v2;
}

+ (id)senderIsVIPCriterion:(BOOL)a3
{
  _BOOL4 v3;
  MFMessageCriterion *v4;
  uint64_t v5;
  MFMessageCriterion *v6;

  v3 = a3;
  v4 = [MFMessageCriterion alloc];
  if (v3)
    v5 = 3;
  else
    v5 = 7;
  v6 = -[MFMessageCriterion initWithType:qualifier:expression:](v4, "initWithType:qualifier:expression:", 27, v5, CFSTR("MessageSenderIsVIP"));
  -[MFMessageCriterion setName:](v6, "setName:", CFSTR("VIPCriterion"));
  return v6;
}

+ (id)sendLaterMessageCriterion
{
  MFMessageCriterion *v2;

  v2 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 49, 7, 0);
  -[MFMessageCriterion setName:](v2, "setName:", CFSTR("SendLaterCriterion"));
  return v2;
}

+ (id)unreadMessageCriterion
{
  MFMessageCriterion *v2;

  v2 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 27, 7, CFSTR("MessageIsRead"));
  -[MFMessageCriterion setName:](v2, "setName:", CFSTR("UnreadCriterion"));
  return v2;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

+ (id)followUpMessageCriterion
{
  void *v3;
  MFMessageCriterion *v4;
  void *v5;
  MFMessageCriterion *v6;
  MFMessageCriterion *v7;
  void *v8;
  MFMessageCriterion *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [MFMessageCriterion alloc];
  objc_msgSend(a1, "expressionForDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MFMessageCriterion initWithType:qualifier:expression:](v4, "initWithType:qualifier:expression:", 47, 5, v5);

  v7 = [MFMessageCriterion alloc];
  objc_msgSend(a1, "expressionForDate:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MFMessageCriterion initWithType:qualifier:expression:](v7, "initWithType:qualifier:expression:", 48, 6, v8);

  v13[0] = v6;
  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMessageCriterion andCompoundCriterionWithCriteria:](MFMessageCriterion, "andCompoundCriterionWithCriteria:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)criterionForMailboxURL:(id)a3
{
  id v3;
  MFMessageCriterion *v4;

  v3 = a3;
  v4 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 23, 3, v3);

  return v4;
}

- (MFMessageCriterion)initWithType:(int64_t)a3 qualifier:(int64_t)a4 expression:(id)a5
{
  id v8;
  MFMessageCriterion *v9;
  MFMessageCriterion *v10;

  v8 = a5;
  v9 = -[MFMessageCriterion init](self, "init");
  v10 = v9;
  if (v9)
  {
    -[MFMessageCriterion setCriterionType:](v9, "setCriterionType:", a3);
    -[MFMessageCriterion setQualifier:](v10, "setQualifier:", a4);
    -[MFMessageCriterion setExpression:](v10, "setExpression:", v8);
  }

  return v10;
}

- (void)setCriterionType:(int64_t)a3
{
  void *v4;

  objc_msgSend((id)objc_opt_class(), "stringForCriterionType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageCriterion setCriterionIdentifier:](self, "setCriterionIdentifier:", v4);

  self->_type = -1;
}

+ (id)stringForCriterionType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x32)
    return 0;
  else
    return off_1E4E8B210[a3 - 1];
}

- (void)setCriterionIdentifier:(id)a3
{
  __CFString *v4;
  NSString *v5;
  NSString *criterionIdentifier;
  __CFString *v7;
  __CFString *v8;

  v7 = (__CFString *)a3;
  if (-[__CFString caseInsensitiveCompare:](v7, "caseInsensitiveCompare:", CFSTR("To or Cc")))
  {
    v4 = v7;
  }
  else
  {

    v4 = CFSTR("AnyRecipient");
  }
  v8 = v4;
  v5 = (NSString *)-[__CFString copy](v4, "copy");
  criterionIdentifier = self->_criterionIdentifier;
  self->_criterionIdentifier = v5;

  self->_type = -1;
}

- (MFMessageCriterion)init
{
  MFMessageCriterion *v2;
  void *v3;
  uint64_t v4;
  NSString *uniqueId;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFMessageCriterion;
  v2 = -[MFMessageCriterion init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    uniqueId = v2->_uniqueId;
    v2->_uniqueId = (NSString *)v4;

    v2->_type = -1;
  }
  return v2;
}

- (void)setQualifier:(int64_t)a3
{
  self->_qualifier = a3;
}

- (void)setExpression:(id)a3
{
  NSString *v4;
  NSString *expression;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  expression = self->_expression;
  self->_expression = v4;

}

+ (id)expressionForDate:(id)a3
{
  MFCriterionExpressionForDate(a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)andCompoundCriterionWithCriteria:(id)a3
{
  id v3;
  MFMessageCriterion *v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == 1)
    {
      objc_msgSend(v3, "lastObject");
      v4 = (MFMessageCriterion *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = objc_alloc_init(MFMessageCriterion);
      -[MFMessageCriterion setCriterionType:](v4, "setCriterionType:", 25);
      -[MFMessageCriterion setAllCriteriaMustBeSatisfied:](v4, "setAllCriteriaMustBeSatisfied:", 1);
      -[MFMessageCriterion setCriteria:](v4, "setCriteria:", v3);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setCriteria:(id)a3
{
  NSArray *v4;
  NSArray *criteria;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  criteria = self->_criteria;
  self->_criteria = v4;

  -[MFMessageCriterion setCriterionType:](self, "setCriterionType:", 25);
}

- (void)setAllCriteriaMustBeSatisfied:(BOOL)a3
{
  *((_BYTE *)self + 72) = *((_BYTE *)self + 72) & 0xFE | a3;
}

- (BOOL)hasLibraryIDCriterion
{
  return -[MFMessageCriterion includesCriterionSatisfyingPredicate:restrictive:](self, "includesCriterionSatisfyingPredicate:restrictive:", isLibraryIDCriterion, 0);
}

- (BOOL)canUseSearchableIndex
{
  return !-[MFMessageCriterion includesCriterionSatisfyingPredicate:restrictive:](self, "includesCriterionSatisfyingPredicate:restrictive:", _criterionCannotUseSearchableIndex, 0);
}

- (BOOL)includesCriterionSatisfyingPredicate:(void *)a3 restrictive:(BOOL)a4
{
  _BOOL8 v4;
  MFMessageCriterion *v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  void *v16;

  v4 = a4;
  v5 = self;
  v6 = -[MFMessageCriterion criterionType](self, "criterionType");
  if (v6 != 26)
  {
    if (v6 != 25)
      return ((uint64_t (*)(MFMessageCriterion *))a3)(v5);
    -[MFMessageCriterion criteria](v5, "criteria");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    v9 = v8;
    if (v4)
    {
      v10 = !-[MFMessageCriterion allCriteriaMustBeSatisfied](v5, "allCriteriaMustBeSatisfied");
      if (!v9)
      {
LABEL_5:
        LOBYTE(v5) = v10;
        goto LABEL_13;
      }
    }
    else
    {
      v10 = 0;
      if (!v8)
        goto LABEL_5;
    }
    v15 = v9 - 1;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v5) = objc_msgSend(v16, "includesCriterionSatisfyingPredicate:restrictive:", a3, v4);

      if (!v15)
        break;
      --v15;
    }
    while (((v10 ^ v5) & 1) == 0);
    goto LABEL_13;
  }
  -[MFMessageCriterion criteria](v5, "criteria");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 != 1)
  {
    LOBYTE(v5) = 0;
    return (char)v5;
  }
  -[MFMessageCriterion criteria](v5, "criteria");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v13, "includesCriterionSatisfyingPredicate:restrictive:", a3, v4);

LABEL_13:
  return (char)v5;
}

- (NSArray)criteria
{
  return self->_criteria;
}

- (MFMessageCriterion)criterionForSQL
{
  void *v3;
  void *v4;

  -[MFMessageCriterion _criterionForSQL](self, "_criterionForSQL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageCriterion suggestion](self, "suggestion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSuggestion:", v4);

  return (MFMessageCriterion *)v3;
}

- (id)_criterionForSQL
{
  MFMessageCriterion *v2;
  MFMessageCriterion *v3;
  unsigned int v4;
  void *v5;
  MFMessageCriterion *v6;

  v2 = self;
  v3 = 0;
  if (v2)
  {
    v4 = 0;
    while (1)
    {
      -[MFMessageCriterion simplifiedCriterion](v2, "simplifiedCriterion");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "fixOnce");
      v6 = (MFMessageCriterion *)objc_claimAutoreleasedReturnValue();

      if (v6 == v2)
      {
        v3 = v6;
        goto LABEL_10;
      }
      v3 = v6;

      if (!v3)
        break;
      v2 = v3;
      if (v4++ >= 9)
        goto LABEL_10;
    }
    v2 = 0;
  }
LABEL_10:

  return v3;
}

- (id)simplifiedCriterion
{
  MFMessageCriterion *v2;
  unsigned int v3;
  MFMessageCriterion *i;
  MFMessageCriterion *v5;

  v2 = self;
  v3 = 0;
  for (i = 0; ; v2 = i)
  {
    -[MFMessageCriterion simplifyOnce](v2, "simplifyOnce");
    v5 = (MFMessageCriterion *)objc_claimAutoreleasedReturnValue();

    if (v5 == v2 || v3 > 9)
      break;
    i = v5;

    ++v3;
  }

  return v5;
}

- (id)simplifyOnce
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  MFMessageCriterion *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  MFMessageCriterion *v15;
  void *v16;
  void *v17;
  MFMessageCriterion *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;

  if (-[MFMessageCriterion criterionType](self, "criterionType") != 25)
    goto LABEL_23;
  -[MFMessageCriterion criteria](self, "criteria");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v23, "count");
  v4 = v3;
  if (!v3)
  {
    v8 = 0;
    goto LABEL_22;
  }
  if (v3 != 1)
  {
    v7 = 0;
    v9 = 0;
    v8 = 0;
    do
    {
      objc_msgSend(v23, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "simplifiedCriterion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "criterionType") == 25
        && ((v12 = -[MFMessageCriterion allCriteriaMustBeSatisfied](self, "allCriteriaMustBeSatisfied"),
             v12 == objc_msgSend(v11, "allCriteriaMustBeSatisfied"))
         || (objc_msgSend(v11, "criteria"),
             v13 = (void *)objc_claimAutoreleasedReturnValue(),
             v14 = objc_msgSend(v13, "count"),
             v13,
             !v14)))
      {
        if (!v7)
        {
          v18 = objc_alloc_init(MFMessageCriterion);
          -[MFMessageCriterion setCriterionType:](v18, "setCriterionType:", 25);
          -[MFMessageCriterion setAllCriteriaMustBeSatisfied:](v18, "setAllCriteriaMustBeSatisfied:", -[MFMessageCriterion allCriteriaMustBeSatisfied](self, "allCriteriaMustBeSatisfied"));
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "subarrayWithRange:", 0, v9);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObjectsFromArray:", v20);

          v8 = v19;
          v7 = v18;
        }
        objc_msgSend(v11, "criteria");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v21);

      }
      else
      {
        if (v11 == v10 || v7)
        {
          v16 = v8;
          v15 = v7;
        }
        else
        {
          v15 = objc_alloc_init(MFMessageCriterion);
          -[MFMessageCriterion setCriterionType:](v15, "setCriterionType:", 25);
          -[MFMessageCriterion setAllCriteriaMustBeSatisfied:](v15, "setAllCriteriaMustBeSatisfied:", -[MFMessageCriterion allCriteriaMustBeSatisfied](self, "allCriteriaMustBeSatisfied"));
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "subarrayWithRange:", 0, v9);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObjectsFromArray:", v17);

        }
        v8 = v16;
        v7 = v15;
        objc_msgSend(v16, "addObject:", v11);
      }

      ++v9;
    }
    while (v4 != v9);
    if (v7)
    {
      -[MFMessageCriterion setCriteria:](v7, "setCriteria:", v8);

      return v7;
    }
LABEL_22:

LABEL_23:
    v7 = self;
    return v7;
  }
  objc_msgSend(v23, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "simplifiedCriterion");
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (MFMessageCriterion *)v6;
  if (!v6)
    goto LABEL_23;
  return v7;
}

- (id)fixOnce
{
  MFMessageCriterion *v2;
  void *v3;
  uint64_t v4;
  MFMessageCriterion *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  MFMessageCriterion *v10;
  void *v11;
  void *v12;
  MFMessageCriterion *v14;
  MFMessageCriterion *v15;

  v2 = self;
  if (-[MFMessageCriterion criterionType](self, "criterionType") != 25)
    goto LABEL_12;
  v15 = v2;
  -[MFMessageCriterion criteria](v15, "criteria");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (!v4)
  {
    v7 = 0;
LABEL_11:

LABEL_12:
    v5 = v2;
    return v5;
  }
  v14 = v2;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  do
  {
    objc_msgSend(v3, "objectAtIndex:", v6, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_criterionForSQL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 != v8 && !v5)
    {
      v10 = objc_alloc_init(MFMessageCriterion);
      -[MFMessageCriterion setCriterionType:](v10, "setCriterionType:", 25);
      -[MFMessageCriterion setAllCriteriaMustBeSatisfied:](v10, "setAllCriteriaMustBeSatisfied:", -[MFMessageCriterion allCriteriaMustBeSatisfied](v15, "allCriteriaMustBeSatisfied"));
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "subarrayWithRange:", 0, v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObjectsFromArray:", v12);

      v7 = v11;
      v5 = v10;
    }
    objc_msgSend(v7, "addObject:", v9);

    ++v6;
  }
  while (v4 != v6);
  v2 = v14;
  if (!v5)
    goto LABEL_11;
  -[MFMessageCriterion setCriteria:](v5, "setCriteria:", v7);

  return v5;
}

- (CSSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setIncludeRelatedMessages:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 72) = *((_BYTE *)self + 72) & 0xFB | v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryIdentifiers, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_expressionLanguages, 0);
  objc_storeStrong((id *)&self->_requiredHeaders, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_expression, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_criterionIdentifier, 0);
}

- (id)criterionByApplyingTransform:(id)a3
{
  void (**v4)(id, MFMessageCriterion *);
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MFMessageCriterion *v16;
  MFMessageCriterion *v17;
  MFMessageCriterion *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, MFMessageCriterion *))a3;
  if (v4)
  {
    v19 = self;
    if (-[MFMessageCriterion criterionType](self, "criterionType") == 25)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      -[MFMessageCriterion criteria](self, "criteria");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v5)
      {
        v6 = 0;
        v7 = 0;
        v8 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v22 != v8)
              objc_enumerationMutation(obj);
            v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v10, "criterionByApplyingTransform:", v4);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v11;
            if (!v7)
            {
              if ((objc_msgSend(v11, "isEqual:", v10) & 1) != 0)
              {
                v7 = 0;
              }
              else
              {
                v13 = (void *)MEMORY[0x1E0C99DE8];
                -[MFMessageCriterion criteria](v19, "criteria");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "subarrayWithRange:", 0, v6 + i);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "arrayWithArray:", v15);
                v7 = (void *)objc_claimAutoreleasedReturnValue();

              }
            }
            if (v12 && (objc_msgSend(v7, "containsObject:", v12) & 1) == 0)
              objc_msgSend(v7, "addObject:", v12);

          }
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          v6 += i;
        }
        while (v5);

        if (v7)
        {
          if (objc_msgSend(v7, "count") == 1)
          {
            objc_msgSend(v7, "lastObject");
            v16 = (MFMessageCriterion *)objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v7, "count"))
          {
            v16 = objc_alloc_init(MFMessageCriterion);
            -[MFMessageCriterion setCriterionType:](v16, "setCriterionType:", 25);
            -[MFMessageCriterion setAllCriteriaMustBeSatisfied:](v16, "setAllCriteriaMustBeSatisfied:", -[MFMessageCriterion allCriteriaMustBeSatisfied](v19, "allCriteriaMustBeSatisfied"));
            -[MFMessageCriterion setCriteria:](v16, "setCriteria:", v7);
          }
          else
          {
            v16 = 0;
          }
          goto LABEL_25;
        }
      }
      else
      {

      }
      v16 = v19;
      v7 = 0;
LABEL_25:

      goto LABEL_26;
    }
    v4[2](v4, self);
    v17 = (MFMessageCriterion *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = self;
  }
  v16 = v17;
LABEL_26:

  return v16;
}

- (id)_SQLExpressionForMailboxCriterion
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;

  -[MFMessageCriterion expression](self, "expression");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MFMessageCriterion qualifier](self, "qualifier");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFC0]), "initWithName:", CFSTR("url"));
  v7 = v6;
  switch(v5)
  {
    case 0uLL:
    case 8uLL:
      objc_msgSend(v6, "contains:caseSensitive:", v4, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      objc_msgSend(v6, "beginsWith:caseSensitive:", v4, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      objc_msgSend(v6, "endsWith:caseSensitive:", v4, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3uLL:
    case 7uLL:
      objc_msgSend(v6, "equalTo:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 4uLL:
      objc_msgSend(v6, "doesNotContain:caseSensitive:", v4, 0);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v9 = (void *)v8;
LABEL_8:
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "ef_SQLExpression");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("mailbox IN (SELECT ROWID FROM mailboxes WHERE %@)"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CriterionAdditions.m"), 1004, CFSTR("Qualifier not supported"));

      v9 = 0;
LABEL_11:
      switch(v5)
      {
        case 3uLL:
        case 7uLL:
          expressionForOperator(v5);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v9, "ef_SQLExpression");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringWithFormat:", CFSTR("mailbox %@ IFNULL((SELECT ROWID FROM mailboxes WHERE %@), -1)"), v11, v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          break;
        case 4uLL:
        case 8uLL:
          goto LABEL_8;
        default:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CriterionAdditions.m"), 1027, CFSTR("Qualifier not supported"));
          v12 = 0;
          break;
      }
      break;
  }

  return v12;
}

- (unsigned)bestBaseTable
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  MFMessageCriterion *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  unsigned int v19;
  BOOL v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (-[MFMessageCriterion criterionType](self, "criterionType") == 25
    && (-[MFMessageCriterion allCriteriaMustBeSatisfied](self, "allCriteriaMustBeSatisfied")
     || (-[MFMessageCriterion criteria](self, "criteria"),
         v3 = (void *)objc_claimAutoreleasedReturnValue(),
         v4 = objc_msgSend(v3, "count"),
         v3,
         v4 == 1)))
  {
    -[MFMessageCriterion criteria](self, "criteria");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  v7 = 0;
  v8 = objc_msgSend(v5, "count");
  if (v8)
  {
    while (1)
    {
      objc_msgSend(v6, "objectAtIndex:", --v8);
      v9 = (MFMessageCriterion *)objc_claimAutoreleasedReturnValue();
      v10 = -[MFMessageCriterion qualifier](v9, "qualifier");
      v11 = -[MFMessageCriterion criterionType](v9, "criterionType");
      -[MFMessageCriterion expression](v9, "expression");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 > 0x33)
        goto LABEL_14;
      if (v11 != 27)
        break;
      if ((objc_msgSend(CFSTR("MFMessageHasAttachments"), "isEqual:", v12) & 1) != 0
        || (objc_msgSend(CFSTR("MessageIsRead"), "isEqual:", v12) & 1) != 0
        || (objc_msgSend(CFSTR("MessageIsFlagged"), "isEqual:", v12) & 1) != 0)
      {
LABEL_37:

        v7 = 32;
        goto LABEL_38;
      }
LABEL_35:

      if (!v8)
        goto LABEL_38;
    }
    if (((1 << v11) & 0x9881401001800) != 0)
      goto LABEL_37;
LABEL_14:
    if (v11 != 23 || v10 != 3)
    {
      if (v11 == 25)
      {
        if (v9 == self)
        {
          -[MFMessageCriterion criteria](self, "criteria");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "count");
          if (!v15)
            goto LABEL_33;
          v16 = v15 - 1;
          do
          {
            objc_msgSend(v14, "objectAtIndex:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "bestBaseTable");

            if (v18 >= 0x20)
              v19 = 32;
            else
              v19 = v18;
            v20 = v16-- != 0;
          }
          while (v20 && v19 > 0x1F);
          if (v19 >= 0x20)
LABEL_33:
            v7 = 32;

        }
        else
        {
          v13 = -[MFMessageCriterion bestBaseTable](v9, "bestBaseTable");
          if (v13 > v7)
            v7 = v13;
        }
      }
      else if (v11 == 5 && v7 <= 8)
      {
        v7 = 8;
      }
    }
    goto LABEL_35;
  }
LABEL_38:

  return v7;
}

- (id)SQLExpressionWithContext:(id)a3 depth:(unsigned int)a4
{
  uint64_t v4;
  int64_t v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  const __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  const __CFString *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  _BOOL4 v51;
  char v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  const __CFString *v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  uint64_t v70;
  const __CFString *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  int v76;
  void *v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  const __CFString *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  const __CFString *v107;
  void *v108;
  uint64_t v109;
  const __CFString *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  NSObject *v121;
  uint64_t v122;
  void *v123;
  int v124;
  MFMessageCriterion *v125;
  void *v126;
  MFMessageCriterion *v127;
  MFMessageCriterion *v128;
  void *v129;
  MFMessageCriterion *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  const __CFString *v136;
  uint64_t v137;
  const __CFString *v138;
  void *v139;
  void *v140;
  char v141;
  _BOOL4 v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  __CFString *v151;
  __CFString *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  int v160;
  int v161;
  int v162;
  int v163;
  const __CFString *v164;
  void *v165;
  int v166;
  uint64_t v167;
  void *v168;
  int v169;
  void *v170;
  uint64_t v171;
  void *v172;
  void *v173;
  void *v174;
  int v175;
  void *v176;
  void *v177;
  int v178;
  id v179;
  void *v180;
  void *v181;
  double v182;
  uint64_t v183;
  void *v184;
  void *v185;
  id v186;
  void *v187;
  id v188;
  __CFString *v189;
  void *v191;
  void *v192;
  uint64_t v193;
  void *v194;
  NSObject *v195;
  _BOOL4 v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  unint64_t v201;
  id v202;
  id *v203;
  void *v204;
  uint64_t v205;
  uint8_t buf[4];
  void *v207;
  _QWORD v208[4];

  v4 = *(_QWORD *)&a4;
  v208[2] = *MEMORY[0x1E0C80C00];
  v203 = (id *)a3;
  v201 = -[MFMessageCriterion qualifier](self, "qualifier");
  v7 = -[MFMessageCriterion criterionType](self, "criterionType");
  v202 = v203[4];
  v8 = 0;
  v9 = 0;
  v10 = 0;
  switch(v7)
  {
    case 1:
      -[MFMessageCriterion criterionIdentifier](self, "criterionIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "lowercaseString");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v44, "isEqual:", *MEMORY[0x1E0D1E5F8]))
      {
        if (*((_BYTE *)v203 + 42))
        {
          if (v201 - 1 > 3)
            v45 = 0;
          else
            v45 = dword_1A59993D0[v201 - 1];
          v133 = (void *)MEMORY[0x1E0CB3940];
          -[MFMessageCriterion expression](self, "expression");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "ef_SQLEscapedString");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v133, "stringWithFormat:", CFSTR("cpsearch(subject, '%@', %d)"), v135, v45);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v8 = 0;
          v9 = 0;
          *((_DWORD *)v203 + 6) |= 0x200u;
          goto LABEL_135;
        }
      }
      else
      {
        if (objc_msgSend(v44, "isEqual:", *MEMORY[0x1E0D1E5B0]))
        {
          v8 = CFSTR("messages.message_id");
          expressionForOperator(v201);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v83 = (void *)MEMORY[0x1E0CB3940];
          -[MFMessageCriterion expression](self, "expression");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "stringWithFormat:", CFSTR("%@ %@ %lld"), CFSTR("messages.message_id"), v9, MFStringHashForMessageIDHeader());
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_135:
          goto LABEL_154;
        }
        MFLogGeneral();
        v121 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v207 = v44;
          _os_log_impl(&dword_1A4F90000, v121, OS_LOG_TYPE_INFO, "Unsupported header criterion %@", buf, 0xCu);
        }

      }
      v8 = 0;
      v9 = 0;
      v17 = 0;
      goto LABEL_135;
    case 9:
      if (!*((_BYTE *)v203 + 42))
        goto LABEL_58;
      -[MFMessageCriterion expression](self, "expression");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "ef_SQLEscapedString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = 4;
      switch(v201)
      {
        case 1uLL:
          v49 = 2;
          goto LABEL_148;
        case 2uLL:
          v49 = 3;
          goto LABEL_148;
        case 3uLL:
          goto LABEL_148;
        case 4uLL:
          v201 = 0;
          goto LABEL_147;
        case 8uLL:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(_to LIKE '%%%@%%' OR cc LIKE '%%%@%%')"), v30, v30);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v201 = 8;
          goto LABEL_150;
        default:
LABEL_147:
          v49 = 0;
LABEL_148:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cpsearch(IFNULL(_to, '') || ' ' || IFNULL(cc, ''), '%@', %d)"), v30, v49);
          v137 = objc_claimAutoreleasedReturnValue();
          break;
      }
      goto LABEL_149;
    case 11:
    case 12:
    case 43:
    case 44:
    case 46:
    case 47:
    case 48:
    case 49:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v202, "columnNameForLookupKey:value:", CFSTR("MFPropertyMapperLookupKeyCriterionType"), v11);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      -[MFMessageCriterion expression](self, "expression");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {

      }
      else if ((v201 | 4) == 7)
      {
        v9 = 0;
        v16 = CFSTR("IS NOT");
        if (v201 == 3)
          v16 = CFSTR("IS");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ NULL"), v8, v16);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        goto LABEL_155;
      }
      -[MFMessageCriterion expression](self, "expression");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D1DE28]);

      if ((v14 & 1) != 0)
      {
        v15 = &unk_1E4F69A48;
LABEL_79:
        v9 = 0;
        objc_msgSend(v202, "columnNameForLookupKey:value:", CFSTR("MFPropertyMapperLookupKeyCriterionType"), v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_216;
      }
      -[MFMessageCriterion expression](self, "expression");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D1DD98]);

      if ((v20 & 1) != 0)
      {
        v15 = &unk_1E4F69A60;
        goto LABEL_79;
      }
      -[MFMessageCriterion expression](self, "expression");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0D1DD88]);

      if ((v22 & 1) != 0)
      {
        v15 = &unk_1E4F69A78;
        goto LABEL_79;
      }
      -[MFMessageCriterion expression](self, "expression");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v75, "isEqualToString:", *MEMORY[0x1E0D1DD30]);

      if (v76)
      {
        v15 = &unk_1E4F69A90;
        goto LABEL_79;
      }
      -[MFMessageCriterion expression](self, "expression");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v85, "hasPrefix:", CFSTR("--compare-field"));

      if (!v86)
      {
        if (!-[MFMessageCriterion dateIsRelative](self, "dateIsRelative"))
        {
LABEL_59:
          v9 = 0;
          v10 = 0;
          goto LABEL_216;
        }
        v122 = v201;
        if (v201 == 6)
        {
          v201 = 5;
        }
        else
        {
          if (v201 == 3)
          {
            -[MFMessageCriterion expression](self, "expression");
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            v124 = objc_msgSend(v123, "intValue");

            v125 = [MFMessageCriterion alloc];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), (v124 + 1));
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            v127 = -[MFMessageCriterion initWithType:qualifier:expression:](v125, "initWithType:qualifier:expression:", v7, 5, v126);

            -[MFMessageCriterion setDateUnits:](v127, "setDateUnits:", -[MFMessageCriterion dateUnits](self, "dateUnits"));
            -[MFMessageCriterion setDateIsRelative:](v127, "setDateIsRelative:", 1);
            v128 = [MFMessageCriterion alloc];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), (v124 - 1));
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            v130 = -[MFMessageCriterion initWithType:qualifier:expression:](v128, "initWithType:qualifier:expression:", v7, 6, v129);

            -[MFMessageCriterion setDateUnits:](v130, "setDateUnits:", -[MFMessageCriterion dateUnits](self, "dateUnits"));
            -[MFMessageCriterion setDateIsRelative:](v130, "setDateIsRelative:", 1);
            v208[0] = v127;
            v208[1] = v130;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v208, 2);
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            +[MFMessageCriterion andCompoundCriterionWithCriteria:](MFMessageCriterion, "andCompoundCriterionWithCriteria:", v131);
            v132 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v132, "SQLExpressionWithContext:depth:", v203, (v4 + 1));
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_73:
            v9 = 0;
            v18 = 0;
            v56 = 3;
LABEL_110:
            v201 = v56;
            goto LABEL_155;
          }
          if (v201 == 5)
            v122 = 6;
          v201 = v122;
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v197 = (void *)objc_claimAutoreleasedReturnValue();
        switch(-[MFMessageCriterion dateUnits](self, "dateUnits"))
        {
          case 0:
            -[MFMessageCriterion expression](self, "expression");
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            v159 = 0;
            v160 = 0;
            v161 = 0;
            v162 = 0;
            v163 = -(int)objc_msgSend(v158, "intValue");
            goto LABEL_213;
          case 1:
            -[MFMessageCriterion expression](self, "expression");
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            v178 = objc_msgSend(v177, "intValue");

            objc_msgSend(v197, "components:fromDate:", 224, v199);
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v159, "setDay:", v201 == 6);
            objc_msgSend(v159, "setHour:", -objc_msgSend(v159, "hour"));
            objc_msgSend(v159, "setMinute:", -objc_msgSend(v159, "minute"));
            objc_msgSend(v159, "setSecond:", -objc_msgSend(v159, "second"));
            objc_msgSend(v197, "dateByAddingComponents:toDate:options:", v159, v199, 0);
            v167 = objc_claimAutoreleasedReturnValue();
            v163 = 0;
            v161 = 0;
            v162 = 0;
            v160 = -v178;
            goto LABEL_208;
          case 2:
            -[MFMessageCriterion expression](self, "expression");
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            v169 = objc_msgSend(v168, "intValue");

            if (v201 == 6)
            {
              objc_msgSend(v197, "components:fromDate:", 16, v199);
              v170 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v170, "setDay:", 7);
              objc_msgSend(v197, "dateByAddingComponents:toDate:options:", v170, v199, 0);
              v171 = objc_claimAutoreleasedReturnValue();

              v172 = (void *)v171;
              v173 = v170;
            }
            else
            {
              v173 = 0;
              v172 = v199;
            }
            v200 = v172;
            objc_msgSend(v197, "components:fromDate:", 736);
            v159 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v159, "setDay:", -objc_msgSend(v159, "weekday"));
            objc_msgSend(v159, "setHour:", -objc_msgSend(v159, "hour"));
            objc_msgSend(v159, "setMinute:", -objc_msgSend(v159, "minute"));
            objc_msgSend(v159, "setSecond:", -objc_msgSend(v159, "second"));
            objc_msgSend(v197, "dateByAddingComponents:toDate:options:", v159, v200, 0);
            v163 = 0;
            v161 = 0;
            v162 = 0;
            v158 = v200;
            v199 = (void *)objc_claimAutoreleasedReturnValue();
            v160 = -7 * v169;
            goto LABEL_213;
          case 3:
            -[MFMessageCriterion expression](self, "expression");
            v174 = (void *)objc_claimAutoreleasedReturnValue();
            v175 = objc_msgSend(v174, "intValue");

            objc_msgSend(v197, "components:fromDate:", 240, v199);
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v159, "setMonth:", v201 == 6);
            objc_msgSend(v159, "setDay:", 1 - objc_msgSend(v159, "day"));
            objc_msgSend(v159, "setHour:", -objc_msgSend(v159, "hour"));
            objc_msgSend(v159, "setMinute:", -objc_msgSend(v159, "minute"));
            objc_msgSend(v159, "setSecond:", -objc_msgSend(v159, "second"));
            objc_msgSend(v197, "dateByAddingComponents:toDate:options:", v159, v199, 0);
            v167 = objc_claimAutoreleasedReturnValue();
            v163 = 0;
            v160 = 0;
            v162 = 0;
            v161 = -v175;
            goto LABEL_208;
          case 4:
            -[MFMessageCriterion expression](self, "expression");
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            v166 = objc_msgSend(v165, "intValue");

            objc_msgSend(v197, "components:fromDate:", 248, v199);
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v159, "setYear:", v201 == 6);
            objc_msgSend(v159, "setMonth:", 1 - objc_msgSend(v159, "month"));
            objc_msgSend(v159, "setDay:", 1 - objc_msgSend(v159, "day"));
            objc_msgSend(v159, "setHour:", -objc_msgSend(v159, "hour"));
            objc_msgSend(v159, "setMinute:", -objc_msgSend(v159, "minute"));
            objc_msgSend(v159, "setSecond:", -objc_msgSend(v159, "second"));
            objc_msgSend(v197, "dateByAddingComponents:toDate:options:", v159, v199, 0);
            v167 = objc_claimAutoreleasedReturnValue();
            v163 = 0;
            v160 = 0;
            v161 = 0;
            v162 = -v166;
LABEL_208:
            v158 = v199;
            v199 = (void *)v167;
LABEL_213:

            v176 = v159;
            break;
          default:
            v176 = 0;
            v163 = 0;
            v160 = 0;
            v161 = 0;
            v162 = 0;
            break;
        }
        v179 = objc_alloc_init(MEMORY[0x1E0C99D78]);

        objc_msgSend(v179, "setYear:", v162);
        objc_msgSend(v179, "setMonth:", v161);
        objc_msgSend(v179, "setDay:", v160);
        objc_msgSend(v179, "setSecond:", v163);
        objc_msgSend(v197, "dateByAddingComponents:toDate:options:", v179, v199, 0);
        v180 = (void *)objc_claimAutoreleasedReturnValue();

        v181 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v180, "timeIntervalSince1970");
        objc_msgSend(v181, "stringWithFormat:", CFSTR("%d"), (int)v182);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = 0;
        goto LABEL_215;
      }
      if (v201 > 6 || ((1 << v201) & 0x68) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CriterionAdditions.m"), 646, CFSTR("Only =, <, > are supported for date comparision"));

      }
      -[MFMessageCriterion expression](self, "expression");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "componentsSeparatedByString:", CFSTR(","));
      v89 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v89, "count") != 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v194, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CriterionAdditions.m"), 649, CFSTR("Magic comparision must be $magicString,$field,$offset"));

      }
      objc_msgSend(v89, "objectAtIndexedSubscript:", 1);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "objectAtIndexedSubscript:", 2);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "doubleValue");
      v93 = v92;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend((id)objc_opt_class(), "criterionTypeForString:", v90));
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v202, "columnNameForLookupKey:value:", CFSTR("MFPropertyMapperLookupKeyCriterionType"), v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();

      expressionForOperator(v201);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ (%@ + %lf)"), v8, v9, v95, v93);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_154:
      v18 = 0;
LABEL_155:
      if (v17)
      {
        v10 = 0;
      }
      else
      {
LABEL_215:
        v10 = 0;
        if (!v18)
        {
LABEL_216:
          -[MFMessageCriterion expression](self, "expression");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v183 = (uint64_t)v9;
        if (!v9)
        {
          expressionForOperator(v201);
          v183 = objc_claimAutoreleasedReturnValue();
        }
        v184 = (void *)MEMORY[0x1E0CB3940];
        v185 = v10;
        if (!v10)
        {
          v186 = v18;
          objc_msgSend(v186, "ef_SQLEscapedString");
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          if (v201 >= 8)
          {
            v188 = v186;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", off_1E4E88C78[v201], v187);
            v188 = (id)objc_claimAutoreleasedReturnValue();
          }
          v185 = v188;

        }
        objc_msgSend(v184, "stringWithFormat:", CFSTR("%@ %@ %@"), v8, v183, v185);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {

          v10 = 0;
        }
        v9 = (__CFString *)v183;
      }
      v189 = v17;

      return v189;
    case 23:
      v8 = 0;
      -[MFMessageCriterion _SQLExpressionForMailboxCriterion](self, "_SQLExpressionForMailboxCriterion");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      v18 = 0;
      goto LABEL_155;
    case 24:
      if (v201 == 7)
      {
        v105 = (void *)MEMORY[0x1E0CB3940];
        -[MFMessageCriterion expression](self, "expression");
        v106 = objc_claimAutoreleasedReturnValue();
        v98 = (void *)v106;
        v107 = &stru_1E4F1C8F8;
        if (v106)
          v107 = (const __CFString *)v106;
        objc_msgSend(v105, "stringWithFormat:", CFSTR("messages.ROWID NOT IN (%@)"), v107);
        v100 = objc_claimAutoreleasedReturnValue();
        goto LABEL_109;
      }
      if (v201 != 3)
      {
        v9 = 0;
        v10 = 0;
        v8 = CFSTR("messages.ROWID");
        goto LABEL_216;
      }
      v34 = (void *)MEMORY[0x1E0CB3940];
      -[MFMessageCriterion expression](self, "expression");
      v35 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v35;
      v36 = &stru_1E4F1C8F8;
      if (v35)
        v36 = (const __CFString *)v35;
      objc_msgSend(v34, "stringWithFormat:", CFSTR("messages.ROWID IN (%@)"), v36);
      v28 = objc_claimAutoreleasedReturnValue();
      goto LABEL_72;
    case 25:
      -[MFMessageCriterion criteria](self, "criteria");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v50, "count") < 2)
      {
        if (objc_msgSend(v50, "count") == 1)
        {
          objc_msgSend(v50, "lastObject");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "SQLExpressionWithContext:depth:", v203, v4);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v17 = CFSTR("NULL");
        }
        goto LABEL_191;
      }
      v51 = -[MFMessageCriterion allCriteriaMustBeSatisfied](self, "allCriteriaMustBeSatisfied");
      v52 = v4 > 1 || v51;
      if ((v52 & 1) != 0)
      {
        v17 = 0;
        goto LABEL_167;
      }
      v196 = v51;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = objc_msgSend(v50, "count");
      if (!v113)
        goto LABEL_163;
      v114 = v113 - 1;
      while (1)
      {
        objc_msgSend(v50, "objectAtIndex:", v114);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v115, "criterionType") == 25)
          break;
        *(_DWORD *)buf = -1431655766;
        v116 = objc_msgSend(v115, "bestBaseTable");
        *(_DWORD *)buf = v116;
        if (v116 <= *((_DWORD *)v203 + 7))
          break;
        objc_msgSend(v115, "SQLExpressionWithTables:baseTable:protectedDataAvailable:searchableIndexManager:mailboxIDs:propertyMapper:", buf, v116, *((unsigned __int8 *)v203 + 42), v203[1], v203[2], v202);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = (void *)MEMORY[0x1E0CB3940];
        tablesForBaseTableAndOtherTables(*(int *)buf, 0);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "stringWithFormat:", CFSTR("SELECT messages.ROWID FROM %@ WHERE %@"), v119, v117);
        v120 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v198, "addObject:", v120);
        if (--v114 == -1)
          goto LABEL_163;
      }
      objc_msgSend(v198, "removeAllObjects");

LABEL_163:
      if (objc_msgSend(v198, "count"))
      {
        v139 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v198, "componentsJoinedByString:", CFSTR(" UNION "));
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "stringWithFormat:", CFSTR("messages.ROWID IN (%@)"), v140);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = 0;
      }

      v51 = v196;
LABEL_167:
      if (v17)
        v141 = 1;
      else
        v141 = v51;
      if ((v141 & 1) == 0)
      {
        v142 = v51;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        v144 = objc_msgSend(v50, "count");
        if (v144)
        {
          v145 = 0;
          while (1)
          {
            objc_msgSend(v50, "objectAtIndex:", v145);
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v146, "criterionType") != 23 || objc_msgSend(v146, "qualifier") != 3)
              break;
            objc_msgSend(v146, "expression");
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v147, "ef_SQLExpression");
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "addObject:", v148);

            if (v144 == ++v145)
              goto LABEL_178;
          }
          objc_msgSend(v143, "removeAllObjects");

        }
LABEL_178:
        if (objc_msgSend(v143, "count"))
        {
          v149 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v143, "componentsJoinedByString:", CFSTR(", "));
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v149, "stringWithFormat:", CFSTR("mailbox IN (SELECT rowid FROM mailboxes WHERE url IN (%@))"), v150);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v17 = 0;
        }

        v51 = v142;
      }
      if (!v17)
      {
        v151 = CFSTR(" OR ");
        if (v51)
          v151 = CFSTR(" AND ");
        v152 = v151;
        objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithUTF8String:", "(");
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v153 = objc_msgSend(v50, "count");
        if (v153)
        {
          v154 = 0;
          v155 = (v4 + 1);
          do
          {
            objc_msgSend(v50, "objectAtIndex:", v154);
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            if (v154)
              -[__CFString appendString:](v17, "appendString:", v152);
            objc_msgSend(v156, "SQLExpressionWithContext:depth:", v203, v155);
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString appendString:](v17, "appendString:", v157);

            ++v154;
          }
          while (v153 != v154);
        }
        -[__CFString appendString:](v17, "appendString:", CFSTR(")"));

      }
LABEL_191:

LABEL_152:
      v8 = 0;
LABEL_153:
      v9 = 0;
      goto LABEL_154;
    case 26:
      -[MFMessageCriterion criteria](self, "criteria");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "count");

      if (v62 != 1)
        goto LABEL_58;
      -[MFMessageCriterion criteria](self, "criteria");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "firstObject");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "SQLExpressionWithContext:depth:", v203, (v4 + 1));
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NOT (%@)"), v65);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_152;
    case 27:
      -[MFMessageCriterion expression](self, "expression");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v37, "isEqual:", CFSTR("MessageIsServerSearchResult")))
      {
        v204 = v37;
        v205 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v205, &v204, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        MFMessageFlagsByApplyingDictionary(0, v38);

        EFStringWithInt64();
        v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v40 = CFSTR("0");
        if (v201 == 3)
          v40 = v39;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(messages.flags & %@) = %@"), v39, v40);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v9 = 0;
        v18 = 0;
        goto LABEL_33;
      }
      if ((objc_msgSend(v37, "isEqual:", CFSTR("MessageIsRead")) & 1) != 0)
      {
        v79 = CFSTR("read = %d");
LABEL_115:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v79, v201 == 3);
        v112 = objc_claimAutoreleasedReturnValue();
        goto LABEL_116;
      }
      if (objc_msgSend(v37, "isEqual:", CFSTR("MessageIsFlagged")))
      {
        v79 = CFSTR("flagged = %d");
        goto LABEL_115;
      }
      if (objc_msgSend(v37, "isEqual:", CFSTR("MessageIsDeleted")))
      {
        v136 = CFSTR("likely");
        if (v201 == 3)
          v136 = CFSTR("unlikely");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(deleted = %d)"), v136, v201 == 3);
        v112 = objc_claimAutoreleasedReturnValue();
        goto LABEL_116;
      }
      if (objc_msgSend(v37, "isEqual:", CFSTR("MessageIsJournaled")))
      {
        v138 = CFSTR("likely");
        if (v201 == 3)
          v138 = CFSTR("unlikely");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(journaled = %d)"), v138, v201 == 3);
        v112 = objc_claimAutoreleasedReturnValue();
LABEL_116:
        v17 = (__CFString *)v112;
        v9 = 0;
        v18 = 0;
LABEL_117:

        v8 = 0;
        goto LABEL_155;
      }
      if (objc_msgSend(v37, "isEqual:", CFSTR("MessageSenderIsVIP")))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sender_vip = %d"), v201 == 3);
        v112 = objc_claimAutoreleasedReturnValue();
        goto LABEL_116;
      }
      if ((objc_msgSend(v37, "isEqual:", CFSTR("MessageConversationIsVIP")) & 1) != 0)
      {
        v164 = CFSTR("messages.conversation_id in (select rowid from conversations where flags = 1)");
LABEL_236:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v164);
        v112 = objc_claimAutoreleasedReturnValue();
        goto LABEL_116;
      }
      if ((objc_msgSend(v37, "isEqual:", CFSTR("MessageConversationIsMuted")) & 1) != 0)
      {
        v164 = CFSTR("messages.conversation_id in (select rowid from conversations where flags = 4)");
        goto LABEL_236;
      }
      if ((objc_msgSend(v37, "isEqual:", CFSTR("MFMessageHasAttachments")) & 1) != 0)
      {
        v164 = CFSTR("((messages.flags&(63<<10))>>10) BETWEEN 1 AND 62");
        goto LABEL_236;
      }
      if ((objc_msgSend(v37, "isEqual:", CFSTR("MessageToContainsAccountAddress")) & 1) != 0)
      {
        v164 = CFSTR("(messages.flags&(1<<39)) > 0");
        goto LABEL_236;
      }
      if ((objc_msgSend(v37, "isEqual:", CFSTR("MessageCcContainsAccountAddress")) & 1) != 0)
      {
        v164 = CFSTR("(messages.flags&(1<<40)) > 0");
        goto LABEL_236;
      }
      if (objc_msgSend(v37, "isEqual:", CFSTR("MessageToOrCcContainsAccountAddress")))
      {
        v164 = CFSTR("(messages.flags&(3<<39)) > 0");
        goto LABEL_236;
      }
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("YES"), v37, 0);
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
      MFMessageFlagsByApplyingDictionary(0, v39);
      EFStringWithInt64();
      v193 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v193;
      if (v201 == 3)
      {
        v9 = CFSTR("and64");
      }
      else
      {
        if (v201 != 7)
        {
          MFLogGeneral();
          v195 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v195, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v207) = v201;
            _os_log_impl(&dword_1A4F90000, v195, OS_LOG_TYPE_DEFAULT, "#Warning unsupported qualifier %d in flag criterion", buf, 8u);
          }

          v9 = 0;
          goto LABEL_246;
        }
        v9 = CFSTR("not and64");
      }
      if (v193)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(messages.flags, %@)"), v9, v193);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_33:

        goto LABEL_117;
      }
LABEL_246:
      v17 = 0;
      goto LABEL_33;
    case 28:
      v29 = (void *)MEMORY[0x1E0CB3940];
      -[MFMessageCriterion expression](self, "expression");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("flag_color = %d"), objc_msgSend(v30, "intValue"));
      v31 = objc_claimAutoreleasedReturnValue();
      goto LABEL_66;
    case 33:
      v46 = v201 - 1;
      if (v201 - 1 >= 4)
      {
        v47 = 0;
      }
      else
      {
        v201 = qword_1A5999390[v46];
        v47 = qword_1A59993B0[v46];
      }
      v77 = (void *)MEMORY[0x1E0CB3940];
      -[MFMessageCriterion expression](self, "expression");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "ef_SQLEscapedString");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "stringWithFormat:", CFSTR("cpsearch(IFNULL(sender, '') || ' ' || IFNULL(subject, '') || ' ' || IFNULL(_to, '') || ' ' || IFNULL(cc, ''), '%@', %d)"), v78, v47);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_151;
    case 34:
      if (v201 == 3)
        v66 = CFSTR("messages.conversation_id IN (%@)");
      else
        v66 = CFSTR("messages.conversation_id NOT IN (%@)");
      v67 = -[MFMessageCriterion expressionIsSanitized](self, "expressionIsSanitized");
      v68 = (void *)MEMORY[0x1E0CB3940];
      if (v67)
      {
        -[MFMessageCriterion expression](self, "expression");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "stringWithFormat:", v66, v30);
        v31 = objc_claimAutoreleasedReturnValue();
LABEL_66:
        v17 = (__CFString *)v31;
      }
      else
      {
        -[MFMessageCriterion expression](self, "expression");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "ef_SQLEscapedString");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "stringWithFormat:", v66, v73);
        v74 = objc_claimAutoreleasedReturnValue();
LABEL_83:
        v17 = (__CFString *)v74;

      }
      goto LABEL_151;
    case 35:
      if (!*((_BYTE *)v203 + 42))
        goto LABEL_58;
      -[MFMessageCriterion expression](self, "expression");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "ef_SQLEscapedString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = 4;
      switch(v201)
      {
        case 1uLL:
          v42 = 2;
          goto LABEL_144;
        case 2uLL:
          v42 = 3;
          goto LABEL_144;
        case 3uLL:
          goto LABEL_144;
        case 4uLL:
          v42 = 1;
          goto LABEL_144;
        case 8uLL:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sender LIKE '%%%@%%'"), v30);
          v137 = objc_claimAutoreleasedReturnValue();
          break;
        default:
          v42 = 0;
LABEL_144:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cpsearch(sender, '%@', %d)"), v30, v42);
          v137 = objc_claimAutoreleasedReturnValue();
          break;
      }
LABEL_149:
      v17 = (__CFString *)v137;
LABEL_150:
      *((_DWORD *)v203 + 6) |= 0x200u;
LABEL_151:

      goto LABEL_152;
    case 36:
      v9 = 0;
      v10 = 0;
      v8 = CFSTR("messages.external_id");
      goto LABEL_216;
    case 37:
      if (v201 == 7)
      {
        v96 = (void *)MEMORY[0x1E0CB3940];
        -[MFMessageCriterion expression](self, "expression");
        v97 = objc_claimAutoreleasedReturnValue();
        v98 = (void *)v97;
        v99 = &stru_1E4F1C8F8;
        if (v97)
          v99 = (const __CFString *)v97;
        objc_msgSend(v96, "stringWithFormat:", CFSTR("messages.global_message_id NOT IN (%@)"), v99);
        v100 = objc_claimAutoreleasedReturnValue();
        goto LABEL_109;
      }
      if (v201 != 3)
      {
        v8 = CFSTR("messages.global_message_id");
        expressionForOperator(v201);
        v101 = objc_claimAutoreleasedReturnValue();
        v102 = (void *)MEMORY[0x1E0CB3940];
        -[MFMessageCriterion expression](self, "expression");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "stringWithFormat:", CFSTR("%@ %@ %@"), CFSTR("messages.global_message_id"), v101, v103);
        v104 = objc_claimAutoreleasedReturnValue();
        goto LABEL_112;
      }
      v24 = (void *)MEMORY[0x1E0CB3940];
      -[MFMessageCriterion expression](self, "expression");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      v27 = &stru_1E4F1C8F8;
      if (v25)
        v27 = (const __CFString *)v25;
      objc_msgSend(v24, "stringWithFormat:", CFSTR("messages.global_message_id IN (%@)"), v27);
      v28 = objc_claimAutoreleasedReturnValue();
      goto LABEL_72;
    case 38:
      if (v201 == 7)
      {
        v108 = (void *)MEMORY[0x1E0CB3940];
        -[MFMessageCriterion expression](self, "expression");
        v109 = objc_claimAutoreleasedReturnValue();
        v98 = (void *)v109;
        v110 = &stru_1E4F1C8F8;
        if (v109)
          v110 = (const __CFString *)v109;
        objc_msgSend(v108, "stringWithFormat:", CFSTR("messages.message_id NOT IN (%@)"), v110);
        v100 = objc_claimAutoreleasedReturnValue();
LABEL_109:
        v17 = (__CFString *)v100;

        v8 = 0;
        v9 = 0;
        v18 = 0;
        v56 = 7;
        goto LABEL_110;
      }
      if (v201 != 3)
      {
        v8 = CFSTR("messages.message_id");
        expressionForOperator(v201);
        v101 = objc_claimAutoreleasedReturnValue();
        v111 = (void *)MEMORY[0x1E0CB3940];
        -[MFMessageCriterion expression](self, "expression");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "stringWithFormat:", CFSTR("%@ %@ %@"), CFSTR("messages.message_id"), v101, v103);
        v104 = objc_claimAutoreleasedReturnValue();
LABEL_112:
        v17 = (__CFString *)v104;

        v18 = 0;
        v9 = (__CFString *)v101;
        goto LABEL_155;
      }
      v69 = (void *)MEMORY[0x1E0CB3940];
      -[MFMessageCriterion expression](self, "expression");
      v70 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v70;
      v71 = &stru_1E4F1C8F8;
      if (v70)
        v71 = (const __CFString *)v70;
      objc_msgSend(v69, "stringWithFormat:", CFSTR("messages.message_id IN (%@)"), v71);
      v28 = objc_claimAutoreleasedReturnValue();
LABEL_72:
      v17 = (__CFString *)v28;

      v8 = 0;
      goto LABEL_73;
    case 39:
      if (v201 != 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v191, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CriterionAdditions.m"), 831, CFSTR("Only MessageRuleIsEqualTo is supported for ListIDHashCriterionType"));

      }
      -[MFMessageCriterion expression](self, "expression");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "longLongValue");

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("messages.list_id_hash = %lld"), v33);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_152;
    case 40:
    case 41:
      goto LABEL_216;
    case 42:
      if (v201 != 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v192 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v192, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CriterionAdditions.m"), 837, CFSTR("Only MessageRuleIsEqualTo is supported for DocumentIDCriterionType"));

      }
      -[MFMessageCriterion expression](self, "expression");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v30, "ef_SQLEscapedString");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "stringWithFormat:", CFSTR("messages.document_id = '%@'"), v73);
      v74 = objc_claimAutoreleasedReturnValue();
      goto LABEL_83;
    case 50:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 50);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v202, "columnNameForLookupKey:value:", CFSTR("MFPropertyMapperLookupKeyCriterionType"), v57);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v58 = (void *)MEMORY[0x1E0CB3940];
      expressionForOperator(v201);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageCriterion expression](self, "expression");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "stringWithFormat:", CFSTR("%@ %@ %@"), v8, v59, v60);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_153;
    case 51:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 51);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v202, "columnNameForLookupKey:value:", CFSTR("MFPropertyMapperLookupKeyCriterionType"), v53);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v54 = (void *)MEMORY[0x1E0CB3940];
      if (v201 == 8)
      {
        -[MFMessageCriterion expression](self, "expression");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "stringWithFormat:", CFSTR("ifnull(%@, %ld) IN (%@)"), v8, 0, v55);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v9 = 0;
        v18 = 0;
        v56 = 8;
        goto LABEL_110;
      }
      expressionForOperator(v201);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageCriterion expression](self, "expression");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "stringWithFormat:", CFSTR("ifnull(%@, %ld) %@ %@"), v8, 0, v81, v82);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_153;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CriterionAdditions.m"), 968, CFSTR("unsupported criterion type %ld"), v7);

LABEL_58:
      v8 = 0;
      goto LABEL_59;
  }
}

- (int64_t)qualifier
{
  return self->_qualifier;
}

- (BOOL)allCriteriaMustBeSatisfied
{
  return *((_BYTE *)self + 72) & 1;
}

- (BOOL)isEqual:(id)a3
{
  MFMessageCriterion *v4;
  MFMessageCriterion *v5;
  void *v6;
  void *v7;
  char v8;
  int64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v17;
  void *v18;

  v4 = (MFMessageCriterion *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MFMessageCriterion criterionIdentifier](self, "criterionIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageCriterion criterionIdentifier](v5, "criterionIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if ((v8 & 1) == 0)
        goto LABEL_10;
      v9 = -[MFMessageCriterion qualifier](self, "qualifier");
      if (v9 != -[MFMessageCriterion qualifier](v5, "qualifier"))
        goto LABEL_10;
      -[MFMessageCriterion suggestion](self, "suggestion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageCriterion suggestion](v5, "suggestion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = EFObjectsAreEqual();

      if ((v12 & 1) != 0)
      {
        if (-[MFMessageCriterion criterionType](self, "criterionType") == 25)
        {
          -[MFMessageCriterion criteria](self, "criteria");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFMessageCriterion criteria](v5, "criteria");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqualToArray:", v14);
        }
        else
        {
          -[MFMessageCriterion expression](self, "expression");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFMessageCriterion expression](v5, "expression");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13 == v14)
          {
            v15 = 1;
          }
          else
          {
            -[MFMessageCriterion expression](self, "expression");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[MFMessageCriterion expression](v5, "expression");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v17, "isEqualToString:", v18);

          }
        }

      }
      else
      {
LABEL_10:
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

+ (id)orCompoundCriterionWithCriteria:(id)a3
{
  id v3;
  MFMessageCriterion *v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == 1)
    {
      objc_msgSend(v3, "lastObject");
      v4 = (MFMessageCriterion *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = objc_alloc_init(MFMessageCriterion);
      -[MFMessageCriterion setCriterionType:](v4, "setCriterionType:", 25);
      -[MFMessageCriterion setAllCriteriaMustBeSatisfied:](v4, "setAllCriteriaMustBeSatisfied:", 0);
      -[MFMessageCriterion setCriteria:](v4, "setCriteria:", v3);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)criteriaFromDefaultsArray:(id)a3 removingRecognizedKeys:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
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
  v6 = a3;
  v7 = 0;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = objc_alloc((Class)a1);
        v13 = (void *)objc_msgSend(v12, "initWithDictionary:andRemoveRecognizedKeysIfMutable:", v11, v4, (_QWORD)v15);
        if (v13)
        {
          if (!v7)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
            v7 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v7, "addObject:", v13);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v7;
}

- (BOOL)_containsNotCriterion
{
  int64_t v3;
  void *v4;
  char v5;

  v3 = -[MFMessageCriterion criterionType](self, "criterionType");
  if (v3 == 26)
    return 1;
  if (v3 != 25)
    return 0;
  -[MFMessageCriterion criteria](self, "criteria");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ef_any:", &__block_literal_global_2);

  return v5;
}

uint64_t __61__MFMessageCriterion_LibraryAdditions___containsNotCriterion__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_containsNotCriterion");
}

- (id)_evaluateFTSCriterionWithIndexManager:(id)a3 mailboxIDs:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  MFMessageCriterion *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[MFMessageCriterion criterionType](self, "criterionType");
  if (v8 == 25)
  {
    if (-[MFMessageCriterion _containsNotCriterion](self, "_containsNotCriterion"))
    {
      -[MFMessageCriterion criteria](self, "criteria");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __89__MFMessageCriterion_LibraryAdditions___evaluateFTSCriterionWithIndexManager_mailboxIDs___block_invoke;
      v28[3] = &unk_1E4E88C18;
      v29 = v6;
      v30 = v7;
      objc_msgSend(v13, "ef_map:", v28);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_alloc_init(MFMessageCriterion);
      -[MFMessageCriterion setCriterionType:](v12, "setCriterionType:", 25);
      -[MFMessageCriterion setAllCriteriaMustBeSatisfied:](v12, "setAllCriteriaMustBeSatisfied:", -[MFMessageCriterion allCriteriaMustBeSatisfied](self, "allCriteriaMustBeSatisfied"));
      -[MFMessageCriterion setCriteria:](v12, "setCriteria:", v14);

      goto LABEL_14;
    }
  }
  else if (v8 == 26)
  {
    -[MFMessageCriterion criteria](self, "criteria");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_evaluateFTSCriterionWithIndexManager:mailboxIDs:", v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFMessageCriterion notCriterionWithCriterion:](MFMessageCriterion, "notCriterionWithCriterion:", v11);
    v12 = (MFMessageCriterion *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  v15 = (void *)objc_opt_class();
  -[MFMessageCriterion spotlightQueryExpression](self, "spotlightQueryExpression");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "searchableItemResultForExpression:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EF08], "indexSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v17, "identifiers", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v25;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v19);
        objc_msgSend(v18, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v22++), "integerValue"));
      }
      while (v20 != v22);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v20);
  }

  v12 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 24, 3, 0);
  -[MFMessageCriterion setLibraryIdentifiers:](v12, "setLibraryIdentifiers:", v18);

LABEL_14:
  return v12;
}

id __89__MFMessageCriterion_LibraryAdditions___evaluateFTSCriterionWithIndexManager_mailboxIDs___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "_evaluateFTSCriterionWithIndexManager:mailboxIDs:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_collapsedMessageNumberCriterion:(id)a3 allMustBeSatisfied:(BOOL)a4 collapsedIndexes:(id *)a5
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  MFMessageCriterion *v21;
  MFMessageCriterion *v22;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = a3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "criterionType");
        objc_msgSend(v12, "libraryIdentifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v12, "qualifier");
        if (v13 == 24 && v15 == 3 && v14 != 0)
        {
          v18 = v9 + i;
          if (v6)
          {
            objc_msgSend(v7, "addIndex:", v18);
            if (!v8)
            {
              objc_msgSend(v6, "libraryIdentifiers");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v8 = (void *)objc_msgSend(v19, "mutableCopy");

            }
            if (a4)
              objc_msgSend(v8, "intersectIndexes:", v14);
            else
              objc_msgSend(v8, "addIndexes:", v14);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", v18);
            v20 = objc_claimAutoreleasedReturnValue();

            v6 = v12;
            v7 = (id)v20;
          }
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      v9 += i;
    }
    while (v5);

    if (v8)
    {
      v21 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 24, 3, 0);
      -[MFMessageCriterion setLibraryIdentifiers:](v21, "setLibraryIdentifiers:", v8);
      if (a5 && v21)
      {
        v7 = objc_retainAutorelease(v7);
        *a5 = v7;
      }
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {

    v21 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
  }
  v22 = v21;

  return v22;
}

- (id)_resolveWithIndexManager:(id)a3 mailboxIDs:(id)a4
{
  MFMessageCriterion *v6;
  void *v7;
  id v8;
  MFMessageCriterion *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  int v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  MFMessageCriterion *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  MFMessageCriterion *v29;
  void *v31;
  _BOOL4 v32;
  MFMessageCriterion *v33;
  id v34;
  id v35;
  id obj;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v35 = a4;
  if (-[MFMessageCriterion canUseSearchableIndex](self, "canUseSearchableIndex"))
  {
    -[MFMessageCriterion _evaluateFTSCriterionWithIndexManager:mailboxIDs:](self, "_evaluateFTSCriterionWithIndexManager:mailboxIDs:", v34, v35);
    v6 = (MFMessageCriterion *)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }
  if (-[MFMessageCriterion criterionType](self, "criterionType") != 25)
  {
    v9 = 0;
    goto LABEL_45;
  }
  -[MFMessageCriterion suggestion](self, "suggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v8 = 0;

  -[MFMessageCriterion criteria](self, "criteria");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[MFMessageCriterion allCriteriaMustBeSatisfied](self, "allCriteriaMustBeSatisfied");
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v31;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  v33 = self;
  if (!v10)
  {

    goto LABEL_34;
  }
  v11 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v39;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v39 != v13)
        objc_enumerationMutation(obj);
      v15 = *(id *)(*((_QWORD *)&v38 + 1) + 8 * i);
      v16 = objc_msgSend(v15, "canUseSearchableIndex");
      v17 = v16;
      if (!v16)
      {
        if (objc_msgSend(v15, "criterionType") == 25)
        {
          objc_msgSend(v15, "_resolveWithIndexManager:mailboxIDs:", v34, v35);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18 != v15)
          {

            v15 = v19;
            if (v8)
              goto LABEL_27;
            goto LABEL_26;
          }

          if (!v8)
            goto LABEL_29;
        }
        else if (!v8)
        {
          goto LABEL_29;
        }
LABEL_25:
        if (v8)
          goto LABEL_27;
        goto LABEL_26;
      }
      if (v11)
      {
        objc_msgSend(v11, "addObject:", v15);
        goto LABEL_25;
      }
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v15, 0);
      if (v8)
        goto LABEL_27;
LABEL_26:
      v20 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(obj, "subarrayWithRange:", 0, v12 + i);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "arrayWithArray:", v21);
      v8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_27:
      if ((v17 & 1) == 0)
        objc_msgSend(v8, "addObject:", v15);
LABEL_29:

    }
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    v12 += i;
  }
  while (v10);

  if (v11)
    goto LABEL_35;
LABEL_34:
  -[MFMessageCriterion suggestion](v33, "suggestion");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 == 0;

  v11 = 0;
  if (!v23)
  {
LABEL_35:
    v24 = objc_alloc_init(MFMessageCriterion);
    -[MFMessageCriterion setCriterionType:](v24, "setCriterionType:", 25);
    -[MFMessageCriterion setAllCriteriaMustBeSatisfied:](v24, "setAllCriteriaMustBeSatisfied:", v32);
    -[MFMessageCriterion setCriteria:](v24, "setCriteria:", v11);
    -[MFMessageCriterion suggestion](v33, "suggestion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageCriterion setSuggestion:](v24, "setSuggestion:", v25);

    -[MFMessageCriterion _evaluateFTSCriterionWithIndexManager:mailboxIDs:](v24, "_evaluateFTSCriterionWithIndexManager:mailboxIDs:", v34, v35);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v26);

  }
  if (v8)
  {
    v37 = 0;
    -[MFMessageCriterion _collapsedMessageNumberCriterion:allMustBeSatisfied:collapsedIndexes:](v33, "_collapsedMessageNumberCriterion:allMustBeSatisfied:collapsedIndexes:", v8, v32, &v37);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v37;
    if (v27)
    {
      objc_msgSend(v8, "removeObjectsAtIndexes:", v28);
      objc_msgSend(v8, "insertObject:atIndex:", v27, 0);
    }
    if (objc_msgSend(v8, "count") == 1)
    {
      objc_msgSend(v8, "objectAtIndex:", 0);
      v9 = (MFMessageCriterion *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = objc_alloc_init(MFMessageCriterion);
      -[MFMessageCriterion setCriterionType:](v9, "setCriterionType:", 25);
      -[MFMessageCriterion setAllCriteriaMustBeSatisfied:](v9, "setAllCriteriaMustBeSatisfied:", v32);
      -[MFMessageCriterion setCriteria:](v9, "setCriteria:", v8);
    }

  }
  else
  {
    v9 = 0;
  }

  self = v33;
LABEL_45:
  if (v9)
    v29 = v9;
  else
    v29 = self;
  v6 = v29;

LABEL_49:
  return v6;
}

- (id)SQLExpressionWithTables:(unsigned int *)a3 baseTable:(unsigned int)a4 protectedDataAvailable:(BOOL)a5 searchableIndexManager:(id)a6 mailboxIDs:(id)a7 propertyMapper:(id)a8
{
  id v15;
  id v16;
  void *v17;
  _MFSQLGenerationContext *v18;
  void *v19;
  id v21;
  void *v22;

  v15 = a6;
  v16 = a7;
  v21 = a8;
  v22 = v15;
  -[MFMessageCriterion _resolveWithIndexManager:mailboxIDs:](self, "_resolveWithIndexManager:mailboxIDs:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v17, "hasLibraryIDCriterion");
  v18 = objc_alloc_init(_MFSQLGenerationContext);
  objc_storeStrong((id *)&v18->searchableIndexManager, a6);
  objc_storeStrong((id *)&v18->mailboxIDs, a7);
  v18->tables = *a3;
  v18->baseTable = a4;
  objc_storeStrong((id *)&v18->propertyMapper, a8);
  v18->usedBaseTable = 0;
  v18->haveLibraryIDCriterion = (char)self;
  v18->protectedDataAvailable = a5;
  objc_msgSend(v17, "SQLExpressionWithContext:depth:", v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *a3 = v18->tables;

  return v19;
}

- (void)_addCriteriaSatisfyingPredicate:(void *)a3 toCollector:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (((unsigned int (*)(MFMessageCriterion *))a3)(self))
  {
    objc_msgSend(v6, "addObject:", self);
  }
  else if (-[MFMessageCriterion criterionType](self, "criterionType") == 25)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[MFMessageCriterion criteria](self, "criteria", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "_addCriteriaSatisfyingPredicate:toCollector:", a3, v6);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (id)criteriaSatisfyingPredicate:(void *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageCriterion _addCriteriaSatisfyingPredicate:toCollector:](self, "_addCriteriaSatisfyingPredicate:toCollector:", a3, v5);
  return v5;
}

- (id)extractedDateCriterion
{
  void *v2;
  void *v3;

  -[MFMessageCriterion criteriaSatisfyingPredicate:](self, "criteriaSatisfyingPredicate:", _isDateCriterion);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    +[MFMessageCriterion orCompoundCriterionWithCriteria:](MFMessageCriterion, "orCompoundCriterionWithCriteria:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)extractedUnreadCriterion
{
  void *v2;
  void *v3;

  -[MFMessageCriterion criteriaSatisfyingPredicate:](self, "criteriaSatisfyingPredicate:", _isUnreadCriterion);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    +[MFMessageCriterion unreadMessageCriterion](MFMessageCriterion, "unreadMessageCriterion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (EMSearchableIndexQueryExpression)spotlightQueryExpression
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v19 = 0;
  -[MFMessageCriterion suggestion](self, "suggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageCriterion _spotlightQuerySearchString:hasSuggestion:](self, "_spotlightQuerySearchString:hasSuggestion:", &v19, v3 != 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v19;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = %@"), *MEMORY[0x1E0CA60F8], *MEMORY[0x1E0CEC4D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    v8 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@ == '*'"), *MEMORY[0x1E0CA6800]);
    v9 = (void *)MEMORY[0x1E0D1E310];
    v21[0] = v6;
    v21[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "queryStringByJoiningQueries:withOperand:", v10, 2);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  if (v4)
  {
    v12 = (void *)MEMORY[0x1E0D1E310];
    v20[0] = v6;
    v20[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "queryStringByJoiningQueries:withOperand:", v13, 1);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = v6;
  }
  v15 = (void *)MEMORY[0x1E0D1E318];
  -[MFMessageCriterion suggestion](self, "suggestion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "expressionWithQueryString:searchString:updatedSuggestion:", v14, v5, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (EMSearchableIndexQueryExpression *)v17;
}

- (id)_attributesForHeaderCriterion
{
  void *v3;
  uint64_t *v4;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[MFMessageCriterion criterionType](self, "criterionType") != 1)
    return 0;
  -[MFMessageCriterion criterionIdentifier](self, "criterionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)*MEMORY[0x1E0D1E5F8], "isEqual:", v3))
  {
    v8[0] = *MEMORY[0x1E0CA68D8];
    v4 = v8;
  }
  else
  {
    if ((objc_msgSend((id)*MEMORY[0x1E0D1E600], "isEqual:", v3) & 1) == 0
      && !objc_msgSend((id)*MEMORY[0x1E0D1E520], "isEqual:", v3))
    {
      v6 = 0;
      goto LABEL_9;
    }
    v7 = *MEMORY[0x1E0CA67D8];
    v4 = &v7;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v6;
}

- (id)_comparisonOperationMatchingValue:(id)a3 qualifier:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(v5, "em_stringForQuotingWithCharacter:", 39);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a4 >= 9)
    __assert_rtn("-[MFMessageCriterion(MFLibrarySearchableIndexAdditions) _comparisonOperationMatchingValue:qualifier:]", "LibrarySearchableIndex.m", 107, "0 && \"unexpected qualifier type\");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", off_1E4E89740[a4], v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_queryWithAttributes:(id)a3 matchingValue:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  -[MFMessageCriterion _queryWithAttributes:matchingValue:qualifier:](self, "_queryWithAttributes:matchingValue:qualifier:", v6, v7, -[MFMessageCriterion qualifier](self, "qualifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_queryWithAttributes:(id)a3 matchingValue:(id)a4 qualifier:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v8 = a3;
  v9 = a4;
  -[MFMessageCriterion _comparisonOperationMatchingValue:qualifier:](self, "_comparisonOperationMatchingValue:qualifier:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __102__MFMessageCriterion_MFLibrarySearchableIndexAdditions___queryWithAttributes_matchingValue_qualifier___block_invoke;
  v16[3] = &unk_1E4E89668;
  v11 = v10;
  v17 = v11;
  objc_msgSend(v8, "ef_map:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 == 7)
    v13 = 1;
  else
    v13 = 2;
  objc_msgSend(MEMORY[0x1E0D1E310], "queryStringByJoiningQueries:withOperand:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __102__MFMessageCriterion_MFLibrarySearchableIndexAdditions___queryWithAttributes_matchingValue_qualifier___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), a2, *(_QWORD *)(a1 + 32));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)criteriaForSpotlightCriteria:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __86__MFMessageCriterion_MFLibrarySearchableIndexAdditions__criteriaForSpotlightCriteria___block_invoke;
  v20[3] = &unk_1E4E89690;
  v7 = v4;
  v21 = v7;
  v8 = v5;
  v22 = v8;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v20);
  if (objc_msgSend(v8, "count"))
  {
    v14 = v6;
    v15 = 3221225472;
    v16 = __86__MFMessageCriterion_MFLibrarySearchableIndexAdditions__criteriaForSpotlightCriteria___block_invoke_2;
    v17 = &unk_1E4E896D8;
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = v9;
    v10 = v7;
    v19 = v10;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v14);
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &__block_literal_global_43, v14, v15, v16, v17);
    objc_msgSend(v10, "addObjectsFromArray:", v9);

  }
  v11 = v22;
  v12 = v7;

  return v12;
}

void __86__MFMessageCriterion_MFLibrarySearchableIndexAdditions__criteriaForSpotlightCriteria___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  if (_criterionCannotUseSearchableIndex(v7))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  }
  else
  {
    objc_msgSend(v7, "expression");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v3);

    }
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

void __86__MFMessageCriterion_MFLibrarySearchableIndexAdditions__criteriaForSpotlightCriteria___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "ef_map:", &__block_literal_global_11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", &unk_1E4F69AC0)
    && objc_msgSend(v4, "containsObject:", &unk_1E4F69AD8)
    && objc_msgSend(v4, "containsObject:", &unk_1E4F69AF0)
    && objc_msgSend(v4, "containsObject:", &unk_1E4F69B08)
    && objc_msgSend(v4, "containsObject:", &unk_1E4F69B20))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v7);
  }

}

id __86__MFMessageCriterion_MFLibrarySearchableIndexAdditions__criteriaForSpotlightCriteria___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v2, "criterionType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __86__MFMessageCriterion_MFLibrarySearchableIndexAdditions__criteriaForSpotlightCriteria___block_invoke_42(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCriterionType:", 33);
}

- (id)_spotlightQuerySearchString:(id *)a3 hasSuggestion:(BOOL)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v33;
  void *v34;
  _QWORD v35[5];
  BOOL v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[2];
  _QWORD v47[3];

  v47[2] = *MEMORY[0x1E0C80C00];
  if (-[MFMessageCriterion criterionType](self, "criterionType") == 25)
  {
    -[MFMessageCriterion criteria](self, "criteria");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageCriterion criteriaForSpotlightCriteria:](self, "criteriaForSpotlightCriteria:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageCriterion setCriteria:](self, "setCriteria:", v8);

  }
  v9 = -[MFMessageCriterion criterionType](self, "criterionType");
  v10 = 0;
  if (v9 > 24)
  {
    if (v9 > 39)
    {
      if ((unint64_t)(v9 - 40) >= 2)
        goto LABEL_30;
      goto LABEL_19;
    }
    switch(v9)
    {
      case 25:
        v37 = 0;
        v38 = &v37;
        v39 = 0x3032000000;
        v40 = __Block_byref_object_copy__3;
        v41 = __Block_byref_object_dispose__3;
        v42 = 0;
        -[MFMessageCriterion criteria](self, "criteria");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __99__MFMessageCriterion_MFLibrarySearchableIndexAdditions___spotlightQuerySearchString_hasSuggestion___block_invoke;
        v35[3] = &unk_1E4E89720;
        v35[4] = &v37;
        v36 = a4;
        objc_msgSend(v28, "ef_compactMap:", v35);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[MFMessageCriterion allCriteriaMustBeSatisfied](self, "allCriteriaMustBeSatisfied"))
          v30 = 1;
        else
          v30 = 2;
        objc_msgSend(MEMORY[0x1E0D1E310], "queryStringByJoiningQueries:withOperand:", v29, v30);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *a3 = objc_retainAutorelease((id)v38[5]);

        _Block_object_dispose(&v37, 8);
        break;
      case 33:
        -[MFMessageCriterion expression](self, "expression");
        v10 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        break;
      case 35:
        if (!a4)
        {
          v13 = *MEMORY[0x1E0CA6030];
          v46[0] = *MEMORY[0x1E0CA6048];
          v46[1] = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFMessageCriterion expression](self, "expression");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFMessageCriterion _queryWithAttributes:matchingValue:](self, "_queryWithAttributes:matchingValue:", v14, v15);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          break;
        }
        goto LABEL_29;
    }
  }
  else
  {
    if (v9 > 8)
    {
      if (v9 != 9)
      {
        if (v9 != 11)
        {
          if (v9 == 23)
          {
            v44 = *MEMORY[0x1E0CA6480];
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[MFMessageCriterion expression](self, "expression");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[MFMessageCriterion _queryWithAttributes:matchingValue:](self, "_queryWithAttributes:matchingValue:", v11, v12);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_30;
        }
        if (!a4)
        {
          v21 = (void *)MEMORY[0x1E0C99D68];
          -[MFMessageCriterion expression](self, "expression");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "doubleValue");
          objc_msgSend(v21, "dateWithTimeIntervalSince1970:");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "timeIntervalSinceReferenceDate");
          v25 = v24;

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("$time.absolute(%f)"), v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = *MEMORY[0x1E0CA6A08];
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFMessageCriterion _queryWithAttributes:matchingValue:](self, "_queryWithAttributes:matchingValue:", v27, v26);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_30;
        }
LABEL_29:
        v10 = 0;
        goto LABEL_30;
      }
LABEL_19:
      if (!a4)
      {
        v18 = *MEMORY[0x1E0CA67D0];
        v47[0] = *MEMORY[0x1E0CA67D8];
        v47[1] = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFMessageCriterion expression](self, "expression");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFMessageCriterion _queryWithAttributes:matchingValue:](self, "_queryWithAttributes:matchingValue:", v19, v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_30;
      }
      goto LABEL_29;
    }
    if (v9 == 1)
    {
      if (!a4)
      {
        -[MFMessageCriterion _attributesForHeaderCriterion](self, "_attributesForHeaderCriterion");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "count"))
        {
          -[MFMessageCriterion expression](self, "expression");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFMessageCriterion _queryWithAttributes:matchingValue:](self, "_queryWithAttributes:matchingValue:", v33, v34);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v10 = 0;
        }

        goto LABEL_30;
      }
      goto LABEL_29;
    }
    if (v9 == 2)
    {
      v45 = *MEMORY[0x1E0CA6910];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageCriterion expression](self, "expression");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageCriterion _queryWithAttributes:matchingValue:](self, "_queryWithAttributes:matchingValue:", v16, v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_30:
  if (objc_msgSend(v10, "length") && -[MFMessageCriterion qualifier](self, "qualifier") == 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("!(%@)"), v10);
    v31 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v31;
  }
  return v10;
}

id __99__MFMessageCriterion_MFLibrarySearchableIndexAdditions___spotlightQuerySearchString_hasSuggestion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id obj;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v2 + 40);
  objc_msgSend(a2, "_spotlightQuerySearchString:hasSuggestion:", &obj, *(unsigned __int8 *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v2 + 40), obj);
  return v3;
}

- (NSString)ef_publicDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MFMessageCriterion descriptionWithDepth:redacted:](self, "descriptionWithDepth:redacted:", 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)unreadCountCriterion
{
  _BOOL4 v2;
  MFMessageCriterion *v3;
  uint64_t v4;
  __CFString **v5;

  v2 = -[MFMessageCriterion useFlaggedForUnreadCount](self, "useFlaggedForUnreadCount");
  v3 = [MFMessageCriterion alloc];
  if (v2)
    v4 = 3;
  else
    v4 = 7;
  v5 = MFMessageIsFlagged;
  if (!v2)
    v5 = MessageIsRead;
  return -[MFMessageCriterion initWithType:qualifier:expression:](v3, "initWithType:qualifier:expression:", 27, v4, *v5);
}

+ (id)criteriaFromDefaultsArray:(id)a3
{
  objc_msgSend(a1, "criteriaFromDefaultsArray:removingRecognizedKeys:", a3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)defaultsArrayFromCriteria:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "dictionaryRepresentation", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          if (!v4)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
            v4 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v4, "addObject:", v8);
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v4;
}

+ (id)criterionFromDefaultsDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", v4);

  return v5;
}

+ (id)defaultsDictionaryFromCriterion:(id)a3
{
  objc_msgSend(a3, "dictionaryRepresentation");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MFMessageCriterion)initWithCriterion:(id)a3 expression:(id)a4
{
  id v6;
  id v7;
  MFMessageCriterion *v8;
  MFMessageCriterion *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[MFMessageCriterion init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[MFMessageCriterion setCriterionIdentifier:](v8, "setCriterionIdentifier:", v6);
    -[MFMessageCriterion setExpression:](v9, "setExpression:", v7);
  }

  return v9;
}

- (MFMessageCriterion)initWithDictionary:(id)a3
{
  return -[MFMessageCriterion initWithDictionary:andRemoveRecognizedKeysIfMutable:](self, "initWithDictionary:andRemoveRecognizedKeysIfMutable:", a3, 1);
}

- (MFMessageCriterion)initWithDictionary:(id)a3 andRemoveRecognizedKeysIfMutable:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  MFMessageCriterion *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  MFMessageCriterion *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  MFMessageCriterion *v21;
  unint64_t v22;
  char v23;
  id v24;
  MFMessageCriterion *v25;
  void *v27;
  id obj;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v4 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("Qualifier"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("Header"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("Expression"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MFMessageCriterion initWithCriterion:expression:](self, "initWithCriterion:expression:", v31, v6);

  if (v7)
  {
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("CriterionUniqueId"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    if (obj)
      objc_storeStrong((id *)&v7->_uniqueId, obj);
    -[MFMessageCriterion setQualifier:](v7, "setQualifier:", -[MFMessageCriterion messageRuleQualifierForString:](v7, "messageRuleQualifierForString:", v30));
    -[MFMessageCriterion setAllCriteriaMustBeSatisfied:](v7, "setAllCriteriaMustBeSatisfied:", objc_msgSend(v32, "mf_BOOLForKey:", CFSTR("AllCriteriaMustBeSatisfied")));
    if (-[MFMessageCriterion criterionType](v7, "criterionType") == 7)
    {
      +[MailAccount accountWithPath:](MailAccount, "accountWithPath:", v7->_expression);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(v32, "objectForKey:", CFSTR("AccountURL"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          +[MailAccount infoForURL:](MailAccount, "infoForURL:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "objectForKey:", CFSTR("Account"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "path");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[MFMessageCriterion setExpression:](v7, "setExpression:", v14);

          }
        }

      }
    }
    objc_msgSend(v32, "objectForKey:", CFSTR("Name"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      -[MFMessageCriterion setName:](v7, "setName:", v29);
    if (-[MFMessageCriterion criterionType](v7, "criterionType") == 25)
    {
      objc_msgSend(v32, "objectForKey:", CFSTR("Criteria"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v27, "count"));
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v16 = v27;
      v17 = 0;
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v34;
        do
        {
          v20 = 0;
          v21 = v17;
          do
          {
            if (*(_QWORD *)v34 != v19)
              objc_enumerationMutation(v16);
            v17 = -[MFMessageCriterion initWithDictionary:andRemoveRecognizedKeysIfMutable:]([MFMessageCriterion alloc], "initWithDictionary:andRemoveRecognizedKeysIfMutable:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v20), v4);

            objc_msgSend(v15, "addObject:", v17);
            ++v20;
            v21 = v17;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v18);
      }

      -[MFMessageCriterion setCriteria:](v7, "setCriteria:", v15);
    }
    else
    {
      v22 = -[MFMessageCriterion criterionType](v7, "criterionType");
      if (v22 <= 0x30 && ((1 << v22) & 0x1880000001C00) != 0)
      {
        v7->_dateUnitType = (int)objc_msgSend(v32, "mf_integerForKey:", CFSTR("DateUnitType"));
        if (objc_msgSend(v32, "mf_BOOLForKey:", CFSTR("DateIsRelative")))
          v23 = 2;
        else
          v23 = 0;
        *((_BYTE *)v7 + 72) = *((_BYTE *)v7 + 72) & 0xFD | v23;
      }
    }
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = v32;
        objc_msgSend(v24, "removeObjectForKey:", CFSTR("Qualifier"));
        objc_msgSend(v24, "removeObjectForKey:", CFSTR("Header"));
        objc_msgSend(v24, "removeObjectForKey:", CFSTR("Expression"));

      }
    }
    v25 = v7;

  }
  return v7;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  if (-[MFMessageCriterion criterionType](self, "criterionType") == 25)
    -[MFMessageCriterion criteria](self, "criteria");
  else
    -[MFMessageCriterion expression](self, "expression");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (id)descriptionWithDepth:(unsigned int)a3 redacted:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  void *v27;
  __CFString *v28;
  _BOOL4 v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  void *v35;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 4 * a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a3 + 1;
  while (--v8)
    objc_msgSend(v7, "appendString:", CFSTR("    "));
  if (-[MFMessageCriterion criterionType](self, "criterionType") == 25)
  {
    -[MFMessageCriterion criteria](self, "criteria");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "count");
    if (v11)
    {
      objc_msgSend(v10, "appendString:", CFSTR("\n"));
      v12 = a3 + 1;
      v13 = v11 - 1;
      do
      {
        objc_msgSend(v9, "objectAtIndex:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "descriptionWithDepth:redacted:", v12, v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appendString:", v15);

        --v13;
      }
      while (v13 != -1);
    }
    else
    {
      objc_msgSend(v10, "appendString:", CFSTR("(none)"));
    }
    v25 = (void *)0x1E0CB3000;
    v26 = (void *)MEMORY[0x1E0CB3940];
    -[MFMessageCriterion criterionIdentifier](self, "criterionIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageCriterion name](self, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v27 = (void *)MEMORY[0x1E0CB3940];
      -[MFMessageCriterion name](self, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("%@  Name: %@\n"), v7, v25);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = &stru_1E4F1C8F8;
    }
    v29 = -[MFMessageCriterion allCriteriaMustBeSatisfied](self, "allCriteriaMustBeSatisfied");
    v30 = CFSTR("No");
    if (v29)
      v30 = CFSTR("Yes");
    objc_msgSend(v26, "stringWithFormat:", CFSTR("%@Criterion: %@\n%@%@  All criteria must be satisfied: %@\n%@  Criteria: %@"), v7, v23, v28, v7, v30, v7, v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {

    }
LABEL_30:

LABEL_31:
    goto LABEL_32;
  }
  if (-[MFMessageCriterion criterionType](self, "criterionType") != 26)
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    -[MFMessageCriterion criterionIdentifier](self, "criterionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageCriterion _qualifierString](self, "_qualifierString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v22 = (void *)MEMORY[0x1E0D1EF48];
      -[MFMessageCriterion expression](self, "expression");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "partiallyRedactedStringForString:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[MFMessageCriterion expression](self, "expression");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v24;
    }
    -[MFMessageCriterion name](self, "name");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = (void *)MEMORY[0x1E0CB3940];
      -[MFMessageCriterion name](self, "name");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("%@  Name: %@\n"), v7, v35);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = &stru_1E4F1C8F8;
    }
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@Criterion: %@\n%@  Qualifier: %@\n%@  Expression: %@\n%@"), v7, v9, v7, v10, v7, v24, v33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {

    }
    if (!v4)
      goto LABEL_31;
    goto LABEL_30;
  }
  -[MFMessageCriterion criteria](self, "criteria");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v16, "count");

  if (v9)
  {
    -[MFMessageCriterion criteria](self, "criteria");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "descriptionWithDepth:redacted:", a3 + 1, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v19 = (void *)MEMORY[0x1E0CB3940];
  -[MFMessageCriterion criterionIdentifier](self, "criterionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@Criterion: %@\n%@ Sub-Criterion: \n%@"), v7, v10, v7, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:

  return v20;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MFMessageCriterion descriptionWithDepth:redacted:](self, "descriptionWithDepth:redacted:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *criterionIdentifier;
  NSString *expression;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *name;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageCriterion _qualifierString](self, "_qualifierString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", self->_uniqueId, CFSTR("CriterionUniqueId"));
  criterionIdentifier = self->_criterionIdentifier;
  if (criterionIdentifier && !-[NSString isEqualToString:](criterionIdentifier, "isEqualToString:", &stru_1E4F1C8F8))
    objc_msgSend(v3, "setObject:forKey:", self->_criterionIdentifier, CFSTR("Header"));
  expression = self->_expression;
  if (expression && !-[NSString isEqualToString:](expression, "isEqualToString:", &stru_1E4F1C8F8))
    objc_msgSend(v3, "setObject:forKey:", self->_expression, CFSTR("Expression"));
  if (v4 && (objc_msgSend(v4, "isEqualToString:", &stru_1E4F1C8F8) & 1) == 0)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("Qualifier"));
  if (-[MFMessageCriterion criterionType](self, "criterionType") == 7)
  {
    +[MailAccount accountWithPath:](MailAccount, "accountWithPath:", self->_expression);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
    {
      v27 = CFSTR("Account");
      v28[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[MailAccount URLForInfo:](MailAccount, "URLForInfo:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "absoluteString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("AccountURL"));

    }
  }
  name = self->_name;
  if (name && !-[NSString isEqualToString:](name, "isEqualToString:", &stru_1E4F1C8F8))
    objc_msgSend(v3, "setObject:forKey:", self->_name, CFSTR("Name"));
  if (-[MFMessageCriterion criterionType](self, "criterionType") == 25)
  {
    if (-[NSArray count](self->_criteria, "count"))
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_criteria, "count"));
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v14 = self->_criteria;
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v23;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v23 != v16)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v17), "dictionaryRepresentation");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v18);

            ++v17;
          }
          while (v15 != v17);
          v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v15);
      }

      objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("Criteria"));
    }
    objc_msgSend(v3, "mf_setBool:forKey:", *((_BYTE *)self + 72) & 1, CFSTR("AllCriteriaMustBeSatisfied"));
  }
  else
  {
    v19 = -[MFMessageCriterion criterionType](self, "criterionType");
    if (v19 <= 0x30 && ((1 << v19) & 0x1880000001C00) != 0)
    {
      objc_msgSend(v3, "mf_setBool:forKey:", (*((unsigned __int8 *)self + 72) >> 1) & 1, CFSTR("DateIsRelative"));
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), self->_dateUnitType);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("DateUnitType"));

    }
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;

  v5 = objc_alloc((Class)objc_opt_class());
  v6 = -[MFMessageCriterion criterionType](self, "criterionType");
  v7 = -[MFMessageCriterion qualifier](self, "qualifier");
  -[MFMessageCriterion expression](self, "expression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "initWithType:qualifier:expression:", v6, v7, v8);

  v10 = -[NSString copyWithZone:](self->_criterionIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v9 + 8);
  *(_QWORD *)(v9 + 8) = v10;

  v12 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v13 = *(void **)(v9 + 32);
  *(_QWORD *)(v9 + 32) = v12;

  v14 = -[NSString copyWithZone:](self->_uniqueId, "copyWithZone:", a3);
  v15 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v14;

  v16 = -[NSArray copyWithZone:](self->_criteria, "copyWithZone:", a3);
  v17 = *(void **)(v9 + 56);
  *(_QWORD *)(v9 + 56) = v16;

  v18 = -[NSArray copyWithZone:](self->_requiredHeaders, "copyWithZone:", a3);
  v19 = *(void **)(v9 + 80);
  *(_QWORD *)(v9 + 80) = v18;

  *(_QWORD *)(v9 + 64) = self->_dateUnitType;
  v20 = *(_BYTE *)(v9 + 72) & 0xFE | *((_BYTE *)self + 72) & 1;
  *(_BYTE *)(v9 + 72) = v20;
  *(_BYTE *)(v9 + 72) = v20 & 0xFD | *((_BYTE *)self + 72) & 2;
  objc_storeStrong((id *)(v9 + 112), self->_libraryIdentifiers);
  *(_BYTE *)(v9 + 88) = self->_preferFullTextSearch;
  *(_BYTE *)(v9 + 89) = self->_useFlaggedForUnreadCount;
  *(_BYTE *)(v9 + 72) = *(_BYTE *)(v9 + 72) & 0xFB | *((_BYTE *)self + 72) & 4;
  *(_BYTE *)(v9 + 90) = self->_expressionIsSanitized;
  return (id)v9;
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
  NSArray *requiredHeaders;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSArray *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSArray *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[6];

  v26[5] = *MEMORY[0x1E0C80C00];
  requiredHeaders = self->_requiredHeaders;
  if (!requiredHeaders)
  {
    _MFLockGlobalLock();
    if (self->_requiredHeaders)
    {
LABEL_25:
      _MFUnlockGlobalLock();
      requiredHeaders = self->_requiredHeaders;
      return requiredHeaders;
    }
    v4 = -[MFMessageCriterion criterionType](self, "criterionType");
    if (v4 <= 19)
    {
      if ((unint64_t)(v4 - 15) < 2 || v4 == 9)
      {
        v6 = *MEMORY[0x1E0D1E520];
        v26[0] = *MEMORY[0x1E0D1E600];
        v26[1] = v6;
        v7 = *MEMORY[0x1E0D1E5D8];
        v26[2] = *MEMORY[0x1E0D1E5F0];
        v26[3] = v7;
        v26[4] = *MEMORY[0x1E0D1E518];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 5);
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
    }
    else
    {
      if ((unint64_t)(v4 - 20) < 3)
      {
        v23 = *MEMORY[0x1E0D1E628];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
        v5 = objc_claimAutoreleasedReturnValue();
LABEL_23:
        v10 = (NSArray *)v5;
LABEL_24:
        v16 = self->_requiredHeaders;
        self->_requiredHeaders = v10;

        goto LABEL_25;
      }
      if (v4 == 40)
      {
        v25 = *MEMORY[0x1E0D1E600];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      if (v4 == 41)
      {
        v24 = *MEMORY[0x1E0D1E520];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
    }
    -[MFMessageCriterion criterionIdentifier](self, "criterionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(" or "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(MEMORY[0x1E0D460C8], "uniqueHeaderKeyStringForString:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14), (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            -[NSArray addObject:](v10, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    goto LABEL_24;
  }
  return requiredHeaders;
}

- (BOOL)_evaluateCompoundCriterion:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[MFMessageCriterion allCriteriaMustBeSatisfied](self, "allCriteriaMustBeSatisfied");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MFMessageCriterion criteria](self, "criteria", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v6);
      v10 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "doesMessageSatisfyCriterion:", v4);
      if (v5 != v10)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)_evaluateNotCriterion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[MFMessageCriterion criteria](self, "criteria", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "doesMessageSatisfyCriterion:", v4) & 1) != 0)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)_evaluateFlagCriterion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  BOOL v9;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MFMessageCriterion expression](self, "expression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  v12[0] = &unk_1E4F69C70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MFMessageFlagsByApplyingDictionary(0, v6);
  v8 = objc_msgSend(v4, "messageFlags");
  if (-[MFMessageCriterion qualifier](self, "qualifier") == 3)
    v9 = (v8 & v7) != 0;
  else
    v9 = (v8 & v7) == 0;

  return v9;
}

- (BOOL)_evaluateFlagColorCriterion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  v4 = a3;
  -[MFMessageCriterion expression](self, "expression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v7 = objc_msgSend(v4, "messageFlags");
  LOBYTE(self) = (((v7 >> 41) & 7) == v6) & (v7 >> 4) ^ (-[MFMessageCriterion qualifier](self, "qualifier") != 3);

  return (char)self;
}

- (BOOL)_evaluateHeaderCriterion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  char v27;
  void *v28;
  unint64_t v29;
  void *v30;
  int64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = v4;
  -[MFMessageCriterion expression](self, "expression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v5;
  v31 = -[MFMessageCriterion qualifier](self, "qualifier");
  if (v31 == 3 || v5 && objc_msgSend(v5, "length"))
  {
    objc_msgSend(v4, "headers");
    v6 = objc_claimAutoreleasedReturnValue();
    -[MFMessageCriterion _headersRequiredForEvaluation](self, "_headersRequiredForEvaluation");
    v25 = (void *)v6;
    v7 = v31 == 4;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v8)
    {
      v24 = *(_QWORD *)v33;
      LOBYTE(v9) = 1;
LABEL_6:
      v23 = v8;
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(obj);
        if (!v9)
          break;
        v11 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v10);
        v30 = (void *)objc_msgSend(v25, "copyHeadersForKey:", v11);
        v27 = objc_msgSend(MEMORY[0x1E0D460C8], "isStructuredHeaderKey:", v11);
        v29 = objc_msgSend(v30, "count");
        v26 = v10;
        if (v31 != 3 || v29)
        {
          if (v29)
          {
            v12 = 0;
            do
            {
              objc_msgSend(v30, "objectAtIndex:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (v13 && objc_msgSend(v28, "length"))
              {
                if ((v27 & 1) != 0)
                {
                  objc_msgSend(MEMORY[0x1E0D460C8], "addressListFromEncodedString:", v13);
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "ef_flatMap:", &__block_literal_global_16);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v13, 0);
                }
                v16 = objc_msgSend(v15, "count");
                if (v16)
                {
                  v17 = 1;
                  do
                  {
                    objc_msgSend(v15, "objectAtIndex:", v17 - 1);
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    v9 = -[MFMessageCriterion _evaluatePartOfStructure:](self, "_evaluatePartOfStructure:", v18);

                    if (v31 == 4)
                      v7 &= v9;
                    else
                      v7 = v9;
                    if (v31 != 4)
                      LOBYTE(v9) = !v9;
                    if (v17 >= v16)
                      break;
                    ++v17;
                  }
                  while (v9);
                }
                else
                {
                  LOBYTE(v9) = 1;
                }

              }
              else
              {
                LOBYTE(v9) = 1;
              }

            }
            while (++v12 < v29 && v9);
            goto LABEL_39;
          }
        }
        else
        {
          v7 |= objc_msgSend(v28, "length") == 0;
        }
        LOBYTE(v9) = 1;
LABEL_39:

        v10 = v26 + 1;
        if (v26 + 1 == v23)
        {
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          if (v8)
            goto LABEL_6;
          break;
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

id __47__MFMessageCriterion__evaluateHeaderCriterion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void *v16;
  void *v18;
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v2, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  v8 = v2;
  objc_msgSend(v8, "emailAddressValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "simpleAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v8, "stringValue");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  if (v13 && v7)
  {
    v20[0] = v13;
    v20[1] = v7;
    v14 = (void **)v20;
    v15 = 2;
  }
  else
  {
    if (v13)
    {
      v19 = v13;
      v14 = &v19;
    }
    else
    {
      if (!v7)
      {
        v16 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_16;
      }
      v18 = v7;
      v14 = &v18;
    }
    v15 = 1;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v16;
}

- (BOOL)_evaluateSenderHeaderCriterion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;

  objc_msgSend(a3, "firstSender");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emailAddressValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v4, "stringValue");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  v10 = v4;
  objc_msgSend(v10, "emailAddressValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "simpleAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v10, "stringValue");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  v16 = -[MFMessageCriterion _evaluatePartOfStructure:](self, "_evaluatePartOfStructure:", v15)
     || -[MFMessageCriterion _evaluatePartOfStructure:](self, "_evaluatePartOfStructure:", v9);

  return v16;
}

- (BOOL)_evaluatePartOfStructure:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  int v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  if (v4)
  {
    -[MFMessageCriterion expression](self, "expression");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MFMessageCriterion qualifier](self, "qualifier");
    v7 = 0;
    v8 = 393;
    switch(v6)
    {
      case 1:
        goto LABEL_9;
      case 2:
        v7 = 0;
        v8 = 397;
        goto LABEL_9;
      case 3:
        v9 = objc_msgSend(v4, "localizedCaseInsensitiveCompare:", v5) == 0;
        goto LABEL_13;
      case 4:
        v7 = 1;
        goto LABEL_8;
      case 7:
        v9 = objc_msgSend(v4, "localizedCaseInsensitiveCompare:", v5) != 0;
        goto LABEL_13;
      default:
        v7 = 0;
LABEL_8:
        v8 = 385;
LABEL_9:
        v10 = objc_msgSend(v4, "length");
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "rangeOfString:options:range:locale:", v5, v8, 0, v10, v11);

        if (v7)
          v9 = v12 == 0x7FFFFFFFFFFFFFFFLL;
        else
          v9 = v12 != 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:

        break;
    }
  }
  else
  {
    v9 = -[MFMessageCriterion qualifier](self, "qualifier") == 4;
  }

  return v9;
}

- (BOOL)_evaluateAddressBookCriterion:(id)a3
{
  return 0;
}

- (BOOL)_evaluateFullNameCriterion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "headers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v22, "copyAddressListForTo", v3);
  v21 = v4;
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v3, "addObjectsFromArray:", v4);
  v5 = (void *)objc_msgSend(v22, "copyAddressListForCc");
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v3, "addObjectsFromArray:", v5);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v7);
        v11 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v11, "emailAddressValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "displayName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v15 = v13;
        }
        else
        {
          objc_msgSend(v11, "stringValue");
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = v15;

        objc_msgSend(v16, "lowercaseString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17 && objc_msgSend(v11, "caseInsensitiveCompare:", v17))
          objc_msgSend(v6, "addObject:", v17);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  v18 = -[MFMessageCriterion criterionType](self, "criterionType") != 15;
  return v18;
}

- (BOOL)_evaluateIsDigitallySignedCriterion:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  objc_msgSend(v3, "messageBodyUpdatingFlags:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calculateAttachmentInfoFromBody:", v4);

  v5 = ((unint64_t)objc_msgSend(v3, "messageFlags") >> 23) & 1;
  return v5;
}

- (BOOL)_evaluateIsEncryptedCriterion:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  objc_msgSend(v3, "messageBodyUpdatingFlags:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calculateAttachmentInfoFromBody:", v4);

  v5 = ((unint64_t)objc_msgSend(v3, "messageFlags") >> 3) & 1;
  return v5;
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
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MFMessageCriterion expression](self, "expression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isEqualToString:", &stru_1E4F1C8F8) & 1) == 0)
  {
    objc_msgSend(v4, "messageBodyUpdatingFlags:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "error");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setError:", 0);
    objc_msgSend(v4, "calculateAttachmentInfoFromBody:", v21);
    objc_msgSend(v8, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "code");

    objc_msgSend(v8, "setError:", v20);
    if ((unint64_t)(v10 - 1037) <= 0xFFFFFFFFFFFFFFFDLL && objc_msgSend(v4, "numberOfAttachments"))
    {
      v11 = -[MFMessageCriterion qualifier](self, "qualifier");
      objc_msgSend(v21, "attachments");
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v23;
LABEL_8:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v15), "mimePart");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "attachmentFilename");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          switch(v11)
          {
            case 1:
              v18 = objc_msgSend(v17, "hasPrefix:", v6);
              break;
            case 2:
              v18 = objc_msgSend(v17, "hasSuffix:", v6);
              break;
            case 3:
              v18 = objc_msgSend(v17, "isEqualToString:", v6);
              break;
            default:
              v7 = v11 == 4 * (objc_msgSend(v17, "rangeOfString:options:", v6, 1) == 0x7FFFFFFFFFFFFFFFLL);
              goto LABEL_24;
          }
          if ((v18 & 1) != 0)
          {
            v7 = 1;
LABEL_24:

            goto LABEL_25;
          }

          if (v13 == ++v15)
          {
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
            if (v13)
              goto LABEL_8;
            break;
          }
        }
      }
      v7 = 0;
LABEL_25:

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_evaluateAccountCriterion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  -[MFMessageCriterion expression](self, "expression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount accountWithPath:](MailAccount, "accountWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == v6;

  return v8;
}

- (BOOL)_evaluateAddressHistoryCriterion:(id)a3
{
  return 0;
}

- (BOOL)_evaluateDateCriterion:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  uint64_t v21;
  void *v23;
  void *v24;
  void *v25;
  double v26;

  v4 = a3;
  -[MFMessageCriterion expression](self, "expression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MFMessageCriterion qualifier](self, "qualifier");
  v7 = -[MFMessageCriterion criterionType](self, "criterionType");
  if (!v5)
    goto LABEL_25;
  v8 = v7;
  if ((int)objc_msgSend(v5, "intValue") < 1)
    goto LABEL_25;
  v9 = 0;
  v10 = 0;
  if (v8 > 46)
  {
    switch(v8)
    {
      case '/':
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_25;
        objc_msgSend(v4, "followUp");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "startDate");
        v13 = objc_claimAutoreleasedReturnValue();
        break;
      case '0':
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_25;
        objc_msgSend(v4, "followUp");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "endDate");
        v13 = objc_claimAutoreleasedReturnValue();
        break;
      case '1':
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v4, "sendLaterDate");
          v11 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
LABEL_25:
        v10 = 0;
        v9 = 0;
        goto LABEL_26;
      default:
        goto LABEL_26;
    }
    v9 = (void *)v13;

LABEL_22:
    objc_msgSend(v9, "timeIntervalSince1970");
    v15 = v14;
    objc_msgSend(v5, "doubleValue");
    v17 = v16;
    if (-[MFMessageCriterion dateIsRelative](self, "dateIsRelative"))
    {
      v18 = objc_msgSend(v5, "integerValue");
      v19 = (void *)objc_opt_new();
      v20 = -[MFMessageCriterion dateUnits](self, "dateUnits");
      v21 = -v18;
      switch(v20)
      {
        case 0:
          objc_msgSend(v19, "setSecond:", v21);
          break;
        case 1:
          objc_msgSend(v19, "setDay:", v21);
          break;
        case 2:
          objc_msgSend(v19, "setWeekOfYear:", v21);
          break;
        case 3:
          objc_msgSend(v19, "setMonth:", v21);
          break;
        case 4:
          objc_msgSend(v19, "setYear:", v21);
          break;
        default:
          break;
      }
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_opt_new();
      objc_msgSend(v23, "dateByAddingComponents:toDate:options:", v19, v24, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "timeIntervalSince1970");
      v17 = v26;

    }
    else if (v6 != 6)
    {
      if (v6 != 5 || v15 > v17)
        goto LABEL_37;
LABEL_30:
      v10 = 1;
      goto LABEL_26;
    }
    if (v15 < v17)
    {
LABEL_37:
      v10 = 0;
      goto LABEL_26;
    }
    goto LABEL_30;
  }
  switch(v8)
  {
    case 10:
      objc_msgSend(v4, "dateSent");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 11:
      goto LABEL_14;
    case 12:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "displayDate");
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_16:
        v9 = (void *)v11;
        goto LABEL_22;
      }
LABEL_14:
      objc_msgSend(v4, "dateReceived");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
  }
LABEL_26:

  return v10;
}

- (BOOL)_evaluateConversationIDCriterion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  NSObject *v8;
  int v10;
  int64_t v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MFMessageCriterion expression](self, "expression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "longLongValue");

  if (-[MFMessageCriterion qualifier](self, "qualifier") == 3)
  {
    v7 = objc_msgSend(v4, "conversationID") == v6;
  }
  else if (-[MFMessageCriterion qualifier](self, "qualifier") == 7)
  {
    v7 = objc_msgSend(v4, "conversationID") != v6;
  }
  else
  {
    MFLogGeneral();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218240;
      v11 = -[MFMessageCriterion qualifier](self, "qualifier");
      v12 = 2048;
      v13 = -[MFMessageCriterion criterionType](self, "criterionType");
      _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEFAULT, "#Warning Unhandled qualifier %ld for type %ld", (uint8_t *)&v10, 0x16u);
    }

    v7 = 0;
  }

  return v7;
}

- (BOOL)_evaluateMailboxCriterion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (-[MFMessageCriterion qualifier](self, "qualifier") == 3)
  {
    -[MFMessageCriterion expression](self, "expression");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalMailboxURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_evaluateReadLaterCriterion:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "readLater");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_evaluateSenderBucketCriterion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "senderBucket"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[MFMessageCriterion qualifier](self, "qualifier") == 8)
    {
      -[MFMessageCriterion expression](self, "expression");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(", "));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v8, "containsObject:", v6);
    }
    else
    {
      if (-[MFMessageCriterion qualifier](self, "qualifier") != 3)
      {
        v10 = 0;
        goto LABEL_9;
      }
      -[MFMessageCriterion expression](self, "expression");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", v6);
    }
    v10 = v9;

LABEL_9:
    goto LABEL_10;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (BOOL)doesMessageSatisfyCriterion:(id)a3
{
  id v4;
  BOOL v5;
  BOOL v6;
  NSObject *v8;
  int v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 1;
  switch(-[MFMessageCriterion criterionType](self, "criterionType"))
  {
    case 1:
    case 9:
    case 40:
    case 41:
      v6 = -[MFMessageCriterion _evaluateHeaderCriterion:](self, "_evaluateHeaderCriterion:", v4);
      goto LABEL_23;
    case 3:
    case 4:
      v6 = -[MFMessageCriterion _evaluateAddressBookCriterion:](self, "_evaluateAddressBookCriterion:", v4);
      goto LABEL_23;
    case 7:
      v6 = -[MFMessageCriterion _evaluateAccountCriterion:](self, "_evaluateAccountCriterion:", v4);
      goto LABEL_23;
    case 8:
      break;
    case 10:
    case 11:
    case 12:
    case 47:
    case 48:
    case 49:
      v6 = -[MFMessageCriterion _evaluateDateCriterion:](self, "_evaluateDateCriterion:", v4);
      goto LABEL_23;
    case 13:
    case 14:
      v6 = -[MFMessageCriterion _evaluateAddressHistoryCriterion:](self, "_evaluateAddressHistoryCriterion:", v4);
      goto LABEL_23;
    case 15:
    case 16:
      v6 = -[MFMessageCriterion _evaluateFullNameCriterion:](self, "_evaluateFullNameCriterion:", v4);
      goto LABEL_23;
    case 17:
      v6 = -[MFMessageCriterion _evaluateIsDigitallySignedCriterion:](self, "_evaluateIsDigitallySignedCriterion:", v4);
      goto LABEL_23;
    case 18:
      v6 = -[MFMessageCriterion _evaluateIsEncryptedCriterion:](self, "_evaluateIsEncryptedCriterion:", v4);
      goto LABEL_23;
    case 19:
      v6 = -[MFMessageCriterion _evaluateAttachmentCriterion:](self, "_evaluateAttachmentCriterion:", v4);
      goto LABEL_23;
    case 20:
      v6 = -[MFMessageCriterion _evaluatePriorityIsHighCriterion:](self, "_evaluatePriorityIsHighCriterion:", v4);
      goto LABEL_23;
    case 21:
      v6 = -[MFMessageCriterion _evaluatePriorityIsNormalCriterion:](self, "_evaluatePriorityIsNormalCriterion:", v4);
      goto LABEL_23;
    case 22:
      v6 = -[MFMessageCriterion _evaluatePriorityIsLowCriterion:](self, "_evaluatePriorityIsLowCriterion:", v4);
      goto LABEL_23;
    case 23:
      v6 = -[MFMessageCriterion _evaluateMailboxCriterion:](self, "_evaluateMailboxCriterion:", v4);
      goto LABEL_23;
    case 25:
      v6 = -[MFMessageCriterion _evaluateCompoundCriterion:](self, "_evaluateCompoundCriterion:", v4);
      goto LABEL_23;
    case 26:
      v6 = -[MFMessageCriterion _evaluateNotCriterion:](self, "_evaluateNotCriterion:", v4);
      goto LABEL_23;
    case 27:
      v6 = -[MFMessageCriterion _evaluateFlagCriterion:](self, "_evaluateFlagCriterion:", v4);
      goto LABEL_23;
    case 28:
      v6 = -[MFMessageCriterion _evaluateFlagColorCriterion:](self, "_evaluateFlagColorCriterion:", v4);
      goto LABEL_23;
    case 34:
      v6 = -[MFMessageCriterion _evaluateConversationIDCriterion:](self, "_evaluateConversationIDCriterion:", v4);
      goto LABEL_23;
    case 35:
      v6 = -[MFMessageCriterion _evaluateSenderHeaderCriterion:](self, "_evaluateSenderHeaderCriterion:", v4);
      goto LABEL_23;
    case 46:
      v6 = -[MFMessageCriterion _evaluateReadLaterCriterion:](self, "_evaluateReadLaterCriterion:", v4);
      goto LABEL_23;
    case 51:
      v6 = -[MFMessageCriterion _evaluateSenderBucketCriterion:](self, "_evaluateSenderBucketCriterion:", v4);
LABEL_23:
      v5 = v6;
      break;
    default:
      MFLogGeneral();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 134217984;
        v10 = -[MFMessageCriterion criterionType](self, "criterionType");
        _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEFAULT, "#Warning Unhandled criterion type %ld", (uint8_t *)&v9, 0xCu);
      }

      v5 = 0;
      break;
  }

  return v5;
}

- (int64_t)messageRuleQualifierForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BeginsWith")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EndsWith")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IsEqualTo")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IsNotEqualTo")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DoesNotContain")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IsLessThan")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IsGreaterThan")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ASCIIContains")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)stringForMessageRuleQualifier:(int64_t)a3
{
  if ((unint64_t)a3 > 8)
    return 0;
  else
    return off_1E4E8B1C8[a3];
}

- (int64_t)dateUnits
{
  return self->_dateUnitType;
}

- (BOOL)dateIsRelative
{
  return (*((unsigned __int8 *)self + 72) >> 1) & 1;
}

- (id)dateFromExpression
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[MFMessageCriterion expression](self, "expression");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  objc_msgSend(v2, "dateWithTimeIntervalSince1970:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)criterionForMailbox:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "URLString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "criterionForMailboxURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)criterionForAccount:(id)a3
{
  id v3;
  MFMessageCriterion *v4;
  void *v5;
  MFMessageCriterion *v6;

  v3 = a3;
  v4 = [MFMessageCriterion alloc];
  objc_msgSend(v3, "URLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MFMessageCriterion initWithType:qualifier:expression:](v4, "initWithType:qualifier:expression:", 23, 1, v5);

  return v6;
}

+ (id)criterionExcludingMailboxes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "ef_map:", &__block_literal_global_234);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFMessageCriterion orCompoundCriterionWithCriteria:](MFMessageCriterion, "orCompoundCriterionWithCriteria:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFMessageCriterion notCriterionWithCriterion:](MFMessageCriterion, "notCriterionWithCriterion:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __50__MFMessageCriterion_criterionExcludingMailboxes___block_invoke(uint64_t a1, uint64_t a2)
{
  +[MFMessageCriterion criterionForMailbox:](MFMessageCriterion, "criterionForMailbox:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
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
  return -[MFMessageCriterion initWithType:qualifier:expression:](v4, "initWithType:qualifier:expression:", 27, v5, CFSTR("MessageIsJournaled"));
}

+ (id)criterionForNotDeletedConversationID:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[MFMessageCriterion messageIsDeletedCriterion:](MFMessageCriterion, "messageIsDeletedCriterion:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  +[MFMessageCriterion criterionForConversationID:](MFMessageCriterion, "criterionForConversationID:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMessageCriterion andCompoundCriterionWithCriteria:](MFMessageCriterion, "andCompoundCriterionWithCriteria:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)criterionForConversationID:(int64_t)a3
{
  void *v3;
  MFMessageCriterion *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 34, 3, v3);

  return v4;
}

+ (id)criterionForLibraryID:(id)a3
{
  id v3;
  MFMessageCriterion *v4;

  v3 = a3;
  v4 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 24, 3, v3);

  return v4;
}

+ (id)criterionForDocumentID:(id)a3
{
  id v3;
  MFMessageCriterion *v4;

  v3 = a3;
  v4 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 42, 3, v3);

  return v4;
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
  return -[MFMessageCriterion initWithType:qualifier:expression:](v4, "initWithType:qualifier:expression:", 27, v5, CFSTR("MessageIsServerSearchResult"));
}

- (BOOL)isVIPCriterion
{
  void *v3;
  char v4;

  if (-[MFMessageCriterion criterionType](self, "criterionType") != 27)
    return 0;
  -[MFMessageCriterion expression](self, "expression");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("MessageSenderIsVIP"));

  return v4;
}

+ (id)criterionForFlagColor:(unint64_t)a3
{
  MFMessageCriterion *v4;
  void *v5;
  void *v6;
  MFMessageCriterion *v7;

  v4 = [MFMessageCriterion alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MFMessageCriterion initWithType:qualifier:expression:](v4, "initWithType:qualifier:expression:", 28, 3, v6);

  -[MFMessageCriterion setName:](v7, "setName:", CFSTR("FlagColorCriterion"));
  return v7;
}

+ (id)readMessageCriterion
{
  MFMessageCriterion *v2;

  v2 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 27, 3, CFSTR("MessageIsRead"));
  -[MFMessageCriterion setName:](v2, "setName:", CFSTR("ReadCriterion"));
  return v2;
}

+ (id)toMeCriterion
{
  MFMessageCriterion *v2;

  v2 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 27, 3, CFSTR("MessageToContainsAccountAddress"));
  -[MFMessageCriterion setName:](v2, "setName:", CFSTR("ToMeCriterionName"));
  return v2;
}

+ (id)ccMeCriterion
{
  MFMessageCriterion *v2;

  v2 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 27, 3, CFSTR("MessageCcContainsAccountAddress"));
  -[MFMessageCriterion setName:](v2, "setName:", CFSTR("CcMeCriterionName"));
  return v2;
}

+ (id)yesterdayMessageCriterion
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setDay:", -1);
  +[MFMessageCriterion _todayDateComponents](MFMessageCriterion, "_todayDateComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMessageCriterion _criterionForDateReceivedBetweenDateComponents:endDateComponents:](MFMessageCriterion, "_criterionForDateReceivedBetweenDateComponents:endDateComponents:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setName:", CFSTR("YesterdayCriterion"));
  return v4;
}

+ (id)lastWeekMessageCriterion
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setWeekOfYear:", -1);
  +[MFMessageCriterion _todayDateComponents](MFMessageCriterion, "_todayDateComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMessageCriterion _criterionForDateReceivedBetweenDateComponents:endDateComponents:](MFMessageCriterion, "_criterionForDateReceivedBetweenDateComponents:endDateComponents:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setName:", CFSTR("LastWeekCriterion"));
  return v4;
}

+ (id)readLaterMessageCriterion
{
  MFMessageCriterion *v2;

  v2 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 46, 7, 0);
  -[MFMessageCriterion setName:](v2, "setName:", CFSTR("ReadLaterCriterion"));
  return v2;
}

+ (id)messageCriterionForUnsubscribeTypeNotMatching:(int64_t)a3
{
  MFMessageCriterion *v4;
  void *v5;
  void *v6;
  MFMessageCriterion *v7;

  v4 = [MFMessageCriterion alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MFMessageCriterion initWithType:qualifier:expression:](v4, "initWithType:qualifier:expression:", 50, 7, v6);

  -[MFMessageCriterion setName:](v7, "setName:", CFSTR("UnsubscribeCriterion"));
  return v7;
}

+ (id)_todayDateComponents
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "components:fromDate:", 542, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_criterionForDateReceivedBetweenDateComponents:(id)a3 endDateComponents:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateFromComponents:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingComponents:toDate:options:", v5, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMessageCriterion _criterionForDateReceivedBetween:endDate:](MFMessageCriterion, "_criterionForDateReceivedBetween:endDate:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_criterionForDateReceivedBetween:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[MFMessageCriterion criterionForDateReceivedNewerThanDate:](MFMessageCriterion, "criterionForDateReceivedNewerThanDate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMessageCriterion criterionForDateReceivedOlderThanDate:](MFMessageCriterion, "criterionForDateReceivedOlderThanDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMessageCriterion andCompoundCriterionWithCriteria:](MFMessageCriterion, "andCompoundCriterionWithCriteria:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)criterionForDateReceivedOlderThanDate:(id)a3
{
  id v4;
  MFMessageCriterion *v5;
  void *v6;
  MFMessageCriterion *v7;

  v4 = a3;
  v5 = [MFMessageCriterion alloc];
  objc_msgSend(a1, "expressionForDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MFMessageCriterion initWithType:qualifier:expression:](v5, "initWithType:qualifier:expression:", 11, 5, v6);

  return v7;
}

+ (id)criterionForDateReceivedNewerThanDate:(id)a3
{
  id v4;
  MFMessageCriterion *v5;
  void *v6;
  MFMessageCriterion *v7;

  v4 = a3;
  v5 = [MFMessageCriterion alloc];
  objc_msgSend(a1, "expressionForDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MFMessageCriterion initWithType:qualifier:expression:](v5, "initWithType:qualifier:expression:", 11, 6, v6);

  return v7;
}

+ (id)notCriterionWithCriterion:(id)a3
{
  id v3;
  MFMessageCriterion *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MFMessageCriterion);
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageCriterion setCriteria:](v4, "setCriteria:", v5);

    -[MFMessageCriterion setCriterionType:](v4, "setCriterionType:", 26);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)matchEverythingCriterion
{
  id v2;
  void *v3;
  MFMessageCriterion *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("%lld"), *MEMORY[0x1E0D1DC08]);
  v4 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 24, 7, v3);

  return v4;
}

+ (id)matchNothingCriterion
{
  id v2;
  void *v3;
  MFMessageCriterion *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("%lld"), *MEMORY[0x1E0D1DC08]);
  v4 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 24, 3, v3);

  return v4;
}

+ (id)criterionForCategoryType:(unint64_t)a3
{
  MFMessageCriterion *v3;
  void *v4;
  MFMessageCriterion *v5;

  v3 = [MFMessageCriterion alloc];
  EMStringFromCategoryType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MFMessageCriterion initWithType:qualifier:expression:](v3, "initWithType:qualifier:expression:", 44, 0, v4);

  return v5;
}

+ (id)criterionForCategorizationHasUserOverride
{
  return -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 45, 3, CFSTR("1"));
}

- (void)tokenizeUsingTokenizationHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[MFMessageCriterion expression](self, "expression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
    goto LABEL_5;
  if (-[MFMessageCriterion qualifier](self, "qualifier") == 8
    || (v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", v5), v9, v9))
  {
    v4[2](v4, v5);
LABEL_5:
    v10 = v5;
    goto LABEL_6;
  }
  v11 = (void *)MEMORY[0x1E0C99DC8];
  -[MFMessageCriterion expressionLanguages](self, "expressionLanguages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ef_localesFromLanguages:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "ef_stringByRemovingQuotedSubstringsForLocales:tokenizationHandler:", v13, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "length"))
  {
    objc_msgSend(v14, "ef_stringByRemovingTokenizedLinksUsingTokenizationHandler:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(v13, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ef_wordComponentsForLocale:minimumWordLength:", v15, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v22;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v22 != v19)
              objc_enumerationMutation(v17);
            v4[2](v4, *(void **)(*((_QWORD *)&v21 + 1) + 8 * v20++));
          }
          while (v18 != v20);
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v18);
      }

    }
  }
  else
  {
    v10 = v14;
  }

LABEL_6:
}

- (NSArray)expressionLanguages
{
  return self->_expressionLanguages;
}

- (void)setExpressionLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (EFInt64Set)libraryIdentifiers
{
  return self->_libraryIdentifiers;
}

- (void)setLibraryIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_libraryIdentifiers, a3);
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
  return (*((unsigned __int8 *)self + 72) >> 2) & 1;
}

- (BOOL)expressionIsSanitized
{
  return self->_expressionIsSanitized;
}

- (void)setExpressionIsSanitized:(BOOL)a3
{
  self->_expressionIsSanitized = a3;
}

- (NSString)name
{
  return self->_name;
}

- (id)daSearchPredicate
{
  if (daSearchPredicate_onceToken != -1)
    dispatch_once(&daSearchPredicate_onceToken, &__block_literal_global_73_0);
  return (id)objc_msgSend((id)daSearchPredicate_criterionConverter, "predicateFromMessageCriterion:", self);
}

uint64_t __49__MFMessageCriterion_DASearch__daSearchPredicate__block_invoke()
{
  _MFDASearchCriterionConverterDelegate *v0;
  void *v1;
  MFMessageCriterionConverter *v2;
  void *v3;

  v0 = objc_alloc_init(_MFDASearchCriterionConverterDelegate);
  v1 = (void *)daSearchPredicate_converterDelegate;
  daSearchPredicate_converterDelegate = (uint64_t)v0;

  v2 = objc_alloc_init(MFMessageCriterionConverter);
  v3 = (void *)daSearchPredicate_criterionConverter;
  daSearchPredicate_criterionConverter = (uint64_t)v2;

  return objc_msgSend((id)daSearchPredicate_criterionConverter, "setDelegate:", daSearchPredicate_converterDelegate);
}

@end
