@implementation EMSortableThreadProxyAdditionalProperties

- (NSDate)displayDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDisplayDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (EMReadLater)readLater
{
  return (EMReadLater *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReadLater:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDate)sendLaterDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSendLaterDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unint64_t)numberOfMessagesInThread
{
  return self->_numberOfMessagesInThread;
}

- (void)setNumberOfMessagesInThread:(unint64_t)a3
{
  self->_numberOfMessagesInThread = a3;
}

- (int64_t)displayMessageGlobalID
{
  return self->_displayMessageGlobalID;
}

- (void)setDisplayMessageGlobalID:(int64_t)a3
{
  self->_displayMessageGlobalID = a3;
}

- (BOOL)hasUnflagged
{
  return self->_hasUnflagged;
}

- (void)setHasUnflagged:(BOOL)a3
{
  self->_hasUnflagged = a3;
}

- (BOOL)isVIP
{
  return self->_isVIP;
}

- (void)setIsVIP:(BOOL)a3
{
  self->_isVIP = a3;
}

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (void)setIsBlocked:(BOOL)a3
{
  self->_isBlocked = a3;
}

- (BOOL)hasAttachments
{
  return self->_hasAttachments;
}

- (void)setHasAttachments:(BOOL)a3
{
  self->_hasAttachments = a3;
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (void)setIsAuthenticated:(BOOL)a3
{
  self->_isAuthenticated = a3;
}

- (NSArray)senderList
{
  return self->_senderList;
}

- (void)setSenderList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)toList
{
  return self->_toList;
}

- (void)setToList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)ccList
{
  return self->_ccList;
}

- (void)setCcList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (ECMessageFlags)flags
{
  return self->_flags;
}

- (void)setFlags:(id)a3
{
  objc_storeStrong((id *)&self->_flags, a3);
}

- (NSIndexSet)flagColors
{
  return self->_flagColors;
}

- (void)setFlagColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)mailboxObjectIDs
{
  return self->_mailboxObjectIDs;
}

- (void)setMailboxObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxObjectIDs, a3);
}

- (EMGeneratedSummary)generatedSummary
{
  return self->_generatedSummary;
}

- (void)setGeneratedSummary:(id)a3
{
  objc_storeStrong((id *)&self->_generatedSummary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedSummary, 0);
  objc_storeStrong((id *)&self->_mailboxObjectIDs, 0);
  objc_storeStrong((id *)&self->_flagColors, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_ccList, 0);
  objc_storeStrong((id *)&self->_toList, 0);
  objc_storeStrong((id *)&self->_senderList, 0);
  objc_storeStrong((id *)&self->_sendLaterDate, 0);
  objc_storeStrong((id *)&self->_readLater, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
}

@end
