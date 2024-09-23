@implementation EMUndoIndividualAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMUndoIndividualAction)initWithCoder:(id)a3
{
  id v4;
  EMUndoIndividualAction *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *messageDatabaseIDs;
  uint64_t v11;
  NSURL *destinationMailboxURL;
  uint64_t v13;
  ECMessageFlagChange *flagChange;
  uint64_t v15;
  NSDate *readLaterDate;
  uint64_t v17;
  EMFollowUp *followUp;
  uint64_t v19;
  EMCategory *category;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)EMUndoIndividualAction;
  v5 = -[EMUndoIndividualAction init](&v22, sel_init);
  if (v5)
  {
    v5->_actionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_actionType"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("EFPropertyKey_messageDatabaseIDs"));
    v9 = objc_claimAutoreleasedReturnValue();
    messageDatabaseIDs = v5->_messageDatabaseIDs;
    v5->_messageDatabaseIDs = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_destinationMailboxURL"));
    v11 = objc_claimAutoreleasedReturnValue();
    destinationMailboxURL = v5->_destinationMailboxURL;
    v5->_destinationMailboxURL = (NSURL *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_flagChange"));
    v13 = objc_claimAutoreleasedReturnValue();
    flagChange = v5->_flagChange;
    v5->_flagChange = (ECMessageFlagChange *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_readLaterDate"));
    v15 = objc_claimAutoreleasedReturnValue();
    readLaterDate = v5->_readLaterDate;
    v5->_readLaterDate = (NSDate *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_followUp"));
    v17 = objc_claimAutoreleasedReturnValue();
    followUp = v5->_followUp;
    v5->_followUp = (EMFollowUp *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_category"));
    v19 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (EMCategory *)v19;

    v5->_blockSender = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_blockSender"));
    v5->_conversationID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("EFPropertyKey_conversationID"));
    v5->_conversationNotificationLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_conversationNotificationLevel"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "encodeInteger:forKey:", -[EMUndoIndividualAction actionType](self, "actionType"), CFSTR("EFPropertyKey_actionType"));
  -[EMUndoIndividualAction messageDatabaseIDs](self, "messageDatabaseIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_messageDatabaseIDs"));

  -[EMUndoIndividualAction destinationMailboxURL](self, "destinationMailboxURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_destinationMailboxURL"));

  -[EMUndoIndividualAction flagChange](self, "flagChange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_flagChange"));

  -[EMUndoIndividualAction readLaterDate](self, "readLaterDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_readLaterDate"));

  -[EMUndoIndividualAction followUp](self, "followUp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("EFPropertyKey_followUp"));

  -[EMUndoIndividualAction category](self, "category");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("EFPropertyKey_category"));

  objc_msgSend(v10, "encodeBool:forKey:", -[EMUndoIndividualAction blockSender](self, "blockSender"), CFSTR("EFPropertyKey_blockSender"));
  objc_msgSend(v10, "encodeInt64:forKey:", -[EMUndoIndividualAction conversationID](self, "conversationID"), CFSTR("EFPropertyKey_conversationID"));
  objc_msgSend(v10, "encodeInteger:forKey:", -[EMUndoIndividualAction conversationNotificationLevel](self, "conversationNotificationLevel"), CFSTR("EFPropertyKey_conversationNotificationLevel"));

}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (NSArray)messageDatabaseIDs
{
  return self->_messageDatabaseIDs;
}

- (void)setMessageDatabaseIDs:(id)a3
{
  objc_storeStrong((id *)&self->_messageDatabaseIDs, a3);
}

- (ECMessageFlagChange)flagChange
{
  return self->_flagChange;
}

- (void)setFlagChange:(id)a3
{
  objc_storeStrong((id *)&self->_flagChange, a3);
}

- (NSURL)destinationMailboxURL
{
  return self->_destinationMailboxURL;
}

- (void)setDestinationMailboxURL:(id)a3
{
  objc_storeStrong((id *)&self->_destinationMailboxURL, a3);
}

- (NSDate)readLaterDate
{
  return self->_readLaterDate;
}

- (void)setReadLaterDate:(id)a3
{
  objc_storeStrong((id *)&self->_readLaterDate, a3);
}

- (EMFollowUp)followUp
{
  return self->_followUp;
}

- (void)setFollowUp:(id)a3
{
  objc_storeStrong((id *)&self->_followUp, a3);
}

- (BOOL)blockSender
{
  return self->_blockSender;
}

- (void)setBlockSender:(BOOL)a3
{
  self->_blockSender = a3;
}

- (int64_t)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(int64_t)a3
{
  self->_conversationID = a3;
}

- (int64_t)conversationNotificationLevel
{
  return self->_conversationNotificationLevel;
}

- (void)setConversationNotificationLevel:(int64_t)a3
{
  self->_conversationNotificationLevel = a3;
}

- (EMCategory)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_followUp, 0);
  objc_storeStrong((id *)&self->_readLaterDate, 0);
  objc_storeStrong((id *)&self->_destinationMailboxURL, 0);
  objc_storeStrong((id *)&self->_flagChange, 0);
  objc_storeStrong((id *)&self->_messageDatabaseIDs, 0);
}

@end
