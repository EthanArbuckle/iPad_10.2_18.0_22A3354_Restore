@implementation EDPBMessageHeaders

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  PBRepeatedBOOLClear();
  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  PBRepeatedBOOLClear();
  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  PBRepeatedBOOLClear();
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)EDPBMessageHeaders;
  -[EDPBMessageHeaders dealloc](&v3, sel_dealloc);
}

- (void)setSender:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_sender = a3;
}

- (void)setHasSender:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasSender
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setSenderDomain:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_senderDomain = a3;
}

- (void)setHasSenderDomain:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasSenderDomain
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSenderIsVip:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_senderIsVip = a3;
}

- (void)setHasSenderIsVip:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSenderIsVip
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setSenderContactId:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_senderContactId = a3;
}

- (void)setHasSenderContactId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasSenderContactId
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setUserIsSender:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_userIsSender = a3;
}

- (void)setHasUserIsSender:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasUserIsSender
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (unint64_t)subjectWordsCount
{
  return self->_subjectWords.count;
}

- (int64_t)subjectWords
{
  return self->_subjectWords.list;
}

- (void)clearSubjectWords
{
  PBRepeatedInt64Clear();
}

- (void)addSubjectWords:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)subjectWordsAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_subjectWords;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_subjectWords = &self->_subjectWords;
  count = self->_subjectWords.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_subjectWords->list[a3];
}

- (void)setSubjectWords:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (void)setMessageIsReply:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_messageIsReply = a3;
}

- (void)setHasMessageIsReply:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMessageIsReply
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setMessageIsForwarded:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_messageIsForwarded = a3;
}

- (void)setHasMessageIsForwarded:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMessageIsForwarded
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setUserIsTo:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_userIsTo = a3;
}

- (void)setHasUserIsTo:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasUserIsTo
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setUserIsCc:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_userIsCc = a3;
}

- (void)setHasUserIsCc:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasUserIsCc
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setUserIsBcc:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_userIsBcc = a3;
}

- (void)setHasUserIsBcc:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasUserIsBcc
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setDateReceived:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_dateReceived = a3;
}

- (void)setHasDateReceived:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDateReceived
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setListId:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_listId = a3;
}

- (void)setHasListId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasListId
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (unint64_t)referencesCount
{
  return self->_references.count;
}

- (int64_t)references
{
  return self->_references.list;
}

- (void)clearReferences
{
  PBRepeatedInt64Clear();
}

- (void)addReferences:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)referencesAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_references;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_references = &self->_references;
  count = self->_references.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_references->list[a3];
}

- (void)setReferences:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (unint64_t)toAddressCount
{
  return self->_toAddress.count;
}

- (int64_t)toAddress
{
  return self->_toAddress.list;
}

- (void)clearToAddress
{
  PBRepeatedInt64Clear();
}

- (void)addToAddress:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)toAddressAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_toAddress;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_toAddress = &self->_toAddress;
  count = self->_toAddress.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_toAddress->list[a3];
}

- (void)setToAddress:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (unint64_t)toDomainsCount
{
  return self->_toDomains.count;
}

- (int64_t)toDomains
{
  return self->_toDomains.list;
}

- (void)clearToDomains
{
  PBRepeatedInt64Clear();
}

- (void)addToDomain:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)toDomainAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_toDomains;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_toDomains = &self->_toDomains;
  count = self->_toDomains.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_toDomains->list[a3];
}

- (void)setToDomains:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (unint64_t)toIsVipsCount
{
  return self->_toIsVips.count;
}

- (BOOL)toIsVips
{
  return self->_toIsVips.list;
}

- (void)clearToIsVips
{
  PBRepeatedBOOLClear();
}

- (void)addToIsVip:(BOOL)a3
{
  PBRepeatedBOOLAdd();
}

- (BOOL)toIsVipAtIndex:(unint64_t)a3
{
  $81BD420485C44FDD3B17AC2C53A57F4D *p_toIsVips;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_toIsVips = &self->_toIsVips;
  count = self->_toIsVips.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_toIsVips->list[a3];
}

- (void)setToIsVips:(BOOL *)a3 count:(unint64_t)a4
{
  PBRepeatedBOOLSet();
}

- (unint64_t)toContactIdsCount
{
  return self->_toContactIds.count;
}

- (int64_t)toContactIds
{
  return self->_toContactIds.list;
}

- (void)clearToContactIds
{
  PBRepeatedInt64Clear();
}

- (void)addToContactId:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)toContactIdAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_toContactIds;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_toContactIds = &self->_toContactIds;
  count = self->_toContactIds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_toContactIds->list[a3];
}

- (void)setToContactIds:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (unint64_t)ccAddressCount
{
  return self->_ccAddress.count;
}

- (int64_t)ccAddress
{
  return self->_ccAddress.list;
}

- (void)clearCcAddress
{
  PBRepeatedInt64Clear();
}

- (void)addCcAddress:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)ccAddressAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_ccAddress;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_ccAddress = &self->_ccAddress;
  count = self->_ccAddress.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_ccAddress->list[a3];
}

- (void)setCcAddress:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (unint64_t)ccDomainsCount
{
  return self->_ccDomains.count;
}

- (int64_t)ccDomains
{
  return self->_ccDomains.list;
}

- (void)clearCcDomains
{
  PBRepeatedInt64Clear();
}

- (void)addCcDomain:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)ccDomainAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_ccDomains;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_ccDomains = &self->_ccDomains;
  count = self->_ccDomains.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_ccDomains->list[a3];
}

- (void)setCcDomains:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (unint64_t)ccIsVipsCount
{
  return self->_ccIsVips.count;
}

- (BOOL)ccIsVips
{
  return self->_ccIsVips.list;
}

- (void)clearCcIsVips
{
  PBRepeatedBOOLClear();
}

- (void)addCcIsVip:(BOOL)a3
{
  PBRepeatedBOOLAdd();
}

- (BOOL)ccIsVipAtIndex:(unint64_t)a3
{
  $81BD420485C44FDD3B17AC2C53A57F4D *p_ccIsVips;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_ccIsVips = &self->_ccIsVips;
  count = self->_ccIsVips.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_ccIsVips->list[a3];
}

- (void)setCcIsVips:(BOOL *)a3 count:(unint64_t)a4
{
  PBRepeatedBOOLSet();
}

- (unint64_t)ccContactIdsCount
{
  return self->_ccContactIds.count;
}

- (int64_t)ccContactIds
{
  return self->_ccContactIds.list;
}

- (void)clearCcContactIds
{
  PBRepeatedInt64Clear();
}

- (void)addCcContactId:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)ccContactIdAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_ccContactIds;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_ccContactIds = &self->_ccContactIds;
  count = self->_ccContactIds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_ccContactIds->list[a3];
}

- (void)setCcContactIds:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (unint64_t)bccAddressCount
{
  return self->_bccAddress.count;
}

- (int64_t)bccAddress
{
  return self->_bccAddress.list;
}

- (void)clearBccAddress
{
  PBRepeatedInt64Clear();
}

- (void)addBccAddress:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)bccAddressAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_bccAddress;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_bccAddress = &self->_bccAddress;
  count = self->_bccAddress.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_bccAddress->list[a3];
}

- (void)setBccAddress:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (unint64_t)bccDomainsCount
{
  return self->_bccDomains.count;
}

- (int64_t)bccDomains
{
  return self->_bccDomains.list;
}

- (void)clearBccDomains
{
  PBRepeatedInt64Clear();
}

- (void)addBccDomain:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)bccDomainAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_bccDomains;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_bccDomains = &self->_bccDomains;
  count = self->_bccDomains.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_bccDomains->list[a3];
}

- (void)setBccDomains:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (unint64_t)bccIsVipsCount
{
  return self->_bccIsVips.count;
}

- (BOOL)bccIsVips
{
  return self->_bccIsVips.list;
}

- (void)clearBccIsVips
{
  PBRepeatedBOOLClear();
}

- (void)addBccIsVip:(BOOL)a3
{
  PBRepeatedBOOLAdd();
}

- (BOOL)bccIsVipAtIndex:(unint64_t)a3
{
  $81BD420485C44FDD3B17AC2C53A57F4D *p_bccIsVips;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_bccIsVips = &self->_bccIsVips;
  count = self->_bccIsVips.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_bccIsVips->list[a3];
}

- (void)setBccIsVips:(BOOL *)a3 count:(unint64_t)a4
{
  PBRepeatedBOOLSet();
}

- (unint64_t)bccContactIdsCount
{
  return self->_bccContactIds.count;
}

- (int64_t)bccContactIds
{
  return self->_bccContactIds.list;
}

- (void)clearBccContactIds
{
  PBRepeatedInt64Clear();
}

- (void)addBccContactId:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)bccContactIdAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_bccContactIds;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_bccContactIds = &self->_bccContactIds;
  count = self->_bccContactIds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_bccContactIds->list[a3];
}

- (void)setBccContactIds:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)EDPBMessageHeaders;
  -[EDPBMessageHeaders description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPBMessageHeaders dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int16 v11;
  void *v12;
  void *v13;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sender);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sender"));

    has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_senderDomain);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("sender_domain"));

    has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_senderIsVip);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("sender_is_vip"));

    has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_senderContactId);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("sender_contact_id"));

    has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userIsSender);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("user_is_sender"));

  }
  PBRepeatedInt64NSArray();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("subject_words"));

  v11 = (__int16)self->_has;
  if ((v11 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_messageIsReply);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("message_is_reply"));

    v11 = (__int16)self->_has;
  }
  if ((v11 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_messageIsForwarded);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("message_is_forwarded"));

    v11 = (__int16)self->_has;
  }
  if ((v11 & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userIsTo);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("user_is_to"));

    v11 = (__int16)self->_has;
  }
  if ((v11 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userIsCc);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("user_is_cc"));

    v11 = (__int16)self->_has;
  }
  if ((v11 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userIsBcc);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("user_is_bcc"));

    v11 = (__int16)self->_has;
  }
  if ((v11 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_dateReceived);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("date_received"));

    v11 = (__int16)self->_has;
  }
  if ((v11 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_listId);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("list_id"));

  }
  PBRepeatedInt64NSArray();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("references"));

  PBRepeatedInt64NSArray();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("to_address"));

  PBRepeatedInt64NSArray();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("to_domain"));

  PBRepeatedBOOLNSArray();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("to_is_vip"));

  PBRepeatedInt64NSArray();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("to_contact_id"));

  PBRepeatedInt64NSArray();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("cc_address"));

  PBRepeatedInt64NSArray();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("cc_domain"));

  PBRepeatedBOOLNSArray();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("cc_is_vip"));

  PBRepeatedInt64NSArray();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("cc_contact_id"));

  PBRepeatedInt64NSArray();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("bcc_address"));

  PBRepeatedInt64NSArray();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("bcc_domain"));

  PBRepeatedBOOLNSArray();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("bcc_is_vip"));

  PBRepeatedInt64NSArray();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("bcc_contact_id"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return EDPBMessageHeadersReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  unint64_t v6;
  __int16 v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  $A58966F474337DCABE012981F76706F5 *p_bccContactIds;
  unint64_t v21;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteSint64Field();
    has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteSint64Field();
    has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
  {
    PBDataWriterWriteSint64Field();
    has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_subjectWords.count)
  {
    PBDataWriterPlaceMark();
    if (self->_subjectWords.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteSint64Field();
        ++v6;
      }
      while (v6 < self->_subjectWords.count);
    }
    PBDataWriterRecallMark();
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = (__int16)self->_has;
  }
  if ((v7 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = (__int16)self->_has;
  }
  if ((v7 & 0x800) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = (__int16)self->_has;
  }
  if ((v7 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = (__int16)self->_has;
  }
  if ((v7 & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = (__int16)self->_has;
  }
  if ((v7 & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v7 = (__int16)self->_has;
  }
  if ((v7 & 2) != 0)
    PBDataWriterWriteSint64Field();
  if (self->_references.count)
  {
    PBDataWriterPlaceMark();
    if (self->_references.count)
    {
      v8 = 0;
      do
      {
        PBDataWriterWriteSint64Field();
        ++v8;
      }
      while (v8 < self->_references.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_toAddress.count)
  {
    PBDataWriterPlaceMark();
    if (self->_toAddress.count)
    {
      v9 = 0;
      do
      {
        PBDataWriterWriteSint64Field();
        ++v9;
      }
      while (v9 < self->_toAddress.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_toDomains.count)
  {
    PBDataWriterPlaceMark();
    if (self->_toDomains.count)
    {
      v10 = 0;
      do
      {
        PBDataWriterWriteSint64Field();
        ++v10;
      }
      while (v10 < self->_toDomains.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_toIsVips.count)
  {
    PBDataWriterPlaceMark();
    if (self->_toIsVips.count)
    {
      v11 = 0;
      do
      {
        PBDataWriterWriteBOOLField();
        ++v11;
      }
      while (v11 < self->_toIsVips.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_toContactIds.count)
  {
    PBDataWriterPlaceMark();
    if (self->_toContactIds.count)
    {
      v12 = 0;
      do
      {
        PBDataWriterWriteSint64Field();
        ++v12;
      }
      while (v12 < self->_toContactIds.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_ccAddress.count)
  {
    PBDataWriterPlaceMark();
    if (self->_ccAddress.count)
    {
      v13 = 0;
      do
      {
        PBDataWriterWriteSint64Field();
        ++v13;
      }
      while (v13 < self->_ccAddress.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_ccDomains.count)
  {
    PBDataWriterPlaceMark();
    if (self->_ccDomains.count)
    {
      v14 = 0;
      do
      {
        PBDataWriterWriteSint64Field();
        ++v14;
      }
      while (v14 < self->_ccDomains.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_ccIsVips.count)
  {
    PBDataWriterPlaceMark();
    if (self->_ccIsVips.count)
    {
      v15 = 0;
      do
      {
        PBDataWriterWriteBOOLField();
        ++v15;
      }
      while (v15 < self->_ccIsVips.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_ccContactIds.count)
  {
    PBDataWriterPlaceMark();
    if (self->_ccContactIds.count)
    {
      v16 = 0;
      do
      {
        PBDataWriterWriteSint64Field();
        ++v16;
      }
      while (v16 < self->_ccContactIds.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_bccAddress.count)
  {
    PBDataWriterPlaceMark();
    if (self->_bccAddress.count)
    {
      v17 = 0;
      do
      {
        PBDataWriterWriteSint64Field();
        ++v17;
      }
      while (v17 < self->_bccAddress.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_bccDomains.count)
  {
    PBDataWriterPlaceMark();
    if (self->_bccDomains.count)
    {
      v18 = 0;
      do
      {
        PBDataWriterWriteSint64Field();
        ++v18;
      }
      while (v18 < self->_bccDomains.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_bccIsVips.count)
  {
    PBDataWriterPlaceMark();
    if (self->_bccIsVips.count)
    {
      v19 = 0;
      do
      {
        PBDataWriterWriteBOOLField();
        ++v19;
      }
      while (v19 < self->_bccIsVips.count);
    }
    PBDataWriterRecallMark();
  }
  p_bccContactIds = &self->_bccContactIds;
  if (p_bccContactIds->count)
  {
    PBDataWriterPlaceMark();
    if (p_bccContactIds->count)
    {
      v21 = 0;
      do
      {
        PBDataWriterWriteSint64Field();
        ++v21;
      }
      while (v21 < p_bccContactIds->count);
    }
    PBDataWriterRecallMark();
  }

}

- (void)copyTo:(id)a3
{
  __int16 has;
  unint64_t v5;
  uint64_t i;
  __int16 v7;
  unint64_t v8;
  uint64_t j;
  unint64_t v10;
  uint64_t k;
  unint64_t v12;
  uint64_t m;
  unint64_t v14;
  uint64_t n;
  unint64_t v16;
  uint64_t ii;
  unint64_t v18;
  uint64_t jj;
  unint64_t v20;
  uint64_t kk;
  unint64_t v22;
  uint64_t mm;
  unint64_t v24;
  uint64_t nn;
  unint64_t v26;
  uint64_t i1;
  unint64_t v28;
  uint64_t i2;
  unint64_t v30;
  uint64_t i3;
  unint64_t v32;
  uint64_t i4;
  _QWORD *v34;

  v34 = a3;
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v34[45] = self->_sender;
    *((_WORD *)v34 + 196) |= 4u;
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_74;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v34[47] = self->_senderDomain;
  *((_WORD *)v34 + 196) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_75:
    v34[46] = self->_senderContactId;
    *((_WORD *)v34 + 196) |= 8u;
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_74:
  *((_BYTE *)v34 + 386) = self->_senderIsVip;
  *((_WORD *)v34 + 196) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_75;
LABEL_5:
  if ((has & 0x400) != 0)
  {
LABEL_6:
    *((_BYTE *)v34 + 389) = self->_userIsSender;
    *((_WORD *)v34 + 196) |= 0x400u;
  }
LABEL_7:
  if (-[EDPBMessageHeaders subjectWordsCount](self, "subjectWordsCount"))
  {
    objc_msgSend(v34, "clearSubjectWords");
    v5 = -[EDPBMessageHeaders subjectWordsCount](self, "subjectWordsCount");
    if (v5)
    {
      for (i = 0; i != v5; ++i)
        objc_msgSend(v34, "addSubjectWords:", -[EDPBMessageHeaders subjectWordsAtIndex:](self, "subjectWordsAtIndex:", i));
    }
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x40) != 0)
  {
    *((_BYTE *)v34 + 385) = self->_messageIsReply;
    *((_WORD *)v34 + 196) |= 0x40u;
    v7 = (__int16)self->_has;
    if ((v7 & 0x20) == 0)
    {
LABEL_13:
      if ((v7 & 0x800) == 0)
        goto LABEL_14;
      goto LABEL_79;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_13;
  }
  *((_BYTE *)v34 + 384) = self->_messageIsForwarded;
  *((_WORD *)v34 + 196) |= 0x20u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x800) == 0)
  {
LABEL_14:
    if ((v7 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_80;
  }
LABEL_79:
  *((_BYTE *)v34 + 390) = self->_userIsTo;
  *((_WORD *)v34 + 196) |= 0x800u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x200) == 0)
  {
LABEL_15:
    if ((v7 & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_81;
  }
LABEL_80:
  *((_BYTE *)v34 + 388) = self->_userIsCc;
  *((_WORD *)v34 + 196) |= 0x200u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x100) == 0)
  {
LABEL_16:
    if ((v7 & 1) == 0)
      goto LABEL_17;
LABEL_82:
    v34[43] = self->_dateReceived;
    *((_WORD *)v34 + 196) |= 1u;
    if ((*(_WORD *)&self->_has & 2) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_81:
  *((_BYTE *)v34 + 387) = self->_userIsBcc;
  *((_WORD *)v34 + 196) |= 0x100u;
  v7 = (__int16)self->_has;
  if ((v7 & 1) != 0)
    goto LABEL_82;
LABEL_17:
  if ((v7 & 2) != 0)
  {
LABEL_18:
    v34[44] = self->_listId;
    *((_WORD *)v34 + 196) |= 2u;
  }
LABEL_19:
  if (-[EDPBMessageHeaders referencesCount](self, "referencesCount"))
  {
    objc_msgSend(v34, "clearReferences");
    v8 = -[EDPBMessageHeaders referencesCount](self, "referencesCount");
    if (v8)
    {
      for (j = 0; j != v8; ++j)
        objc_msgSend(v34, "addReferences:", -[EDPBMessageHeaders referencesAtIndex:](self, "referencesAtIndex:", j));
    }
  }
  if (-[EDPBMessageHeaders toAddressCount](self, "toAddressCount"))
  {
    objc_msgSend(v34, "clearToAddress");
    v10 = -[EDPBMessageHeaders toAddressCount](self, "toAddressCount");
    if (v10)
    {
      for (k = 0; k != v10; ++k)
        objc_msgSend(v34, "addToAddress:", -[EDPBMessageHeaders toAddressAtIndex:](self, "toAddressAtIndex:", k));
    }
  }
  if (-[EDPBMessageHeaders toDomainsCount](self, "toDomainsCount"))
  {
    objc_msgSend(v34, "clearToDomains");
    v12 = -[EDPBMessageHeaders toDomainsCount](self, "toDomainsCount");
    if (v12)
    {
      for (m = 0; m != v12; ++m)
        objc_msgSend(v34, "addToDomain:", -[EDPBMessageHeaders toDomainAtIndex:](self, "toDomainAtIndex:", m));
    }
  }
  if (-[EDPBMessageHeaders toIsVipsCount](self, "toIsVipsCount"))
  {
    objc_msgSend(v34, "clearToIsVips");
    v14 = -[EDPBMessageHeaders toIsVipsCount](self, "toIsVipsCount");
    if (v14)
    {
      for (n = 0; n != v14; ++n)
        objc_msgSend(v34, "addToIsVip:", -[EDPBMessageHeaders toIsVipAtIndex:](self, "toIsVipAtIndex:", n));
    }
  }
  if (-[EDPBMessageHeaders toContactIdsCount](self, "toContactIdsCount"))
  {
    objc_msgSend(v34, "clearToContactIds");
    v16 = -[EDPBMessageHeaders toContactIdsCount](self, "toContactIdsCount");
    if (v16)
    {
      for (ii = 0; ii != v16; ++ii)
        objc_msgSend(v34, "addToContactId:", -[EDPBMessageHeaders toContactIdAtIndex:](self, "toContactIdAtIndex:", ii));
    }
  }
  if (-[EDPBMessageHeaders ccAddressCount](self, "ccAddressCount"))
  {
    objc_msgSend(v34, "clearCcAddress");
    v18 = -[EDPBMessageHeaders ccAddressCount](self, "ccAddressCount");
    if (v18)
    {
      for (jj = 0; jj != v18; ++jj)
        objc_msgSend(v34, "addCcAddress:", -[EDPBMessageHeaders ccAddressAtIndex:](self, "ccAddressAtIndex:", jj));
    }
  }
  if (-[EDPBMessageHeaders ccDomainsCount](self, "ccDomainsCount"))
  {
    objc_msgSend(v34, "clearCcDomains");
    v20 = -[EDPBMessageHeaders ccDomainsCount](self, "ccDomainsCount");
    if (v20)
    {
      for (kk = 0; kk != v20; ++kk)
        objc_msgSend(v34, "addCcDomain:", -[EDPBMessageHeaders ccDomainAtIndex:](self, "ccDomainAtIndex:", kk));
    }
  }
  if (-[EDPBMessageHeaders ccIsVipsCount](self, "ccIsVipsCount"))
  {
    objc_msgSend(v34, "clearCcIsVips");
    v22 = -[EDPBMessageHeaders ccIsVipsCount](self, "ccIsVipsCount");
    if (v22)
    {
      for (mm = 0; mm != v22; ++mm)
        objc_msgSend(v34, "addCcIsVip:", -[EDPBMessageHeaders ccIsVipAtIndex:](self, "ccIsVipAtIndex:", mm));
    }
  }
  if (-[EDPBMessageHeaders ccContactIdsCount](self, "ccContactIdsCount"))
  {
    objc_msgSend(v34, "clearCcContactIds");
    v24 = -[EDPBMessageHeaders ccContactIdsCount](self, "ccContactIdsCount");
    if (v24)
    {
      for (nn = 0; nn != v24; ++nn)
        objc_msgSend(v34, "addCcContactId:", -[EDPBMessageHeaders ccContactIdAtIndex:](self, "ccContactIdAtIndex:", nn));
    }
  }
  if (-[EDPBMessageHeaders bccAddressCount](self, "bccAddressCount"))
  {
    objc_msgSend(v34, "clearBccAddress");
    v26 = -[EDPBMessageHeaders bccAddressCount](self, "bccAddressCount");
    if (v26)
    {
      for (i1 = 0; i1 != v26; ++i1)
        objc_msgSend(v34, "addBccAddress:", -[EDPBMessageHeaders bccAddressAtIndex:](self, "bccAddressAtIndex:", i1));
    }
  }
  if (-[EDPBMessageHeaders bccDomainsCount](self, "bccDomainsCount"))
  {
    objc_msgSend(v34, "clearBccDomains");
    v28 = -[EDPBMessageHeaders bccDomainsCount](self, "bccDomainsCount");
    if (v28)
    {
      for (i2 = 0; i2 != v28; ++i2)
        objc_msgSend(v34, "addBccDomain:", -[EDPBMessageHeaders bccDomainAtIndex:](self, "bccDomainAtIndex:", i2));
    }
  }
  if (-[EDPBMessageHeaders bccIsVipsCount](self, "bccIsVipsCount"))
  {
    objc_msgSend(v34, "clearBccIsVips");
    v30 = -[EDPBMessageHeaders bccIsVipsCount](self, "bccIsVipsCount");
    if (v30)
    {
      for (i3 = 0; i3 != v30; ++i3)
        objc_msgSend(v34, "addBccIsVip:", -[EDPBMessageHeaders bccIsVipAtIndex:](self, "bccIsVipAtIndex:", i3));
    }
  }
  if (-[EDPBMessageHeaders bccContactIdsCount](self, "bccContactIdsCount"))
  {
    objc_msgSend(v34, "clearBccContactIds");
    v32 = -[EDPBMessageHeaders bccContactIdsCount](self, "bccContactIdsCount");
    if (v32)
    {
      for (i4 = 0; i4 != v32; ++i4)
        objc_msgSend(v34, "addBccContactId:", -[EDPBMessageHeaders bccContactIdAtIndex:](self, "bccContactIdAtIndex:", i4));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v4 + 360) = self->_sender;
    *(_WORD *)(v4 + 392) |= 4u;
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v4 + 376) = self->_senderDomain;
  *(_WORD *)(v4 + 392) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *(_BYTE *)(v4 + 386) = self->_senderIsVip;
  *(_WORD *)(v4 + 392) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_19:
  *(_QWORD *)(v4 + 368) = self->_senderContactId;
  *(_WORD *)(v4 + 392) |= 8u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_6:
    *(_BYTE *)(v4 + 389) = self->_userIsSender;
    *(_WORD *)(v4 + 392) |= 0x400u;
  }
LABEL_7:
  PBRepeatedInt64Copy();
  v7 = (__int16)self->_has;
  if ((v7 & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 385) = self->_messageIsReply;
    *(_WORD *)(v5 + 392) |= 0x40u;
    v7 = (__int16)self->_has;
    if ((v7 & 0x20) == 0)
    {
LABEL_9:
      if ((v7 & 0x800) == 0)
        goto LABEL_10;
      goto LABEL_23;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_9;
  }
  *(_BYTE *)(v5 + 384) = self->_messageIsForwarded;
  *(_WORD *)(v5 + 392) |= 0x20u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x800) == 0)
  {
LABEL_10:
    if ((v7 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *(_BYTE *)(v5 + 390) = self->_userIsTo;
  *(_WORD *)(v5 + 392) |= 0x800u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x200) == 0)
  {
LABEL_11:
    if ((v7 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  *(_BYTE *)(v5 + 388) = self->_userIsCc;
  *(_WORD *)(v5 + 392) |= 0x200u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x100) == 0)
  {
LABEL_12:
    if ((v7 & 1) == 0)
      goto LABEL_13;
LABEL_26:
    *(_QWORD *)(v5 + 344) = self->_dateReceived;
    *(_WORD *)(v5 + 392) |= 1u;
    if ((*(_WORD *)&self->_has & 2) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_25:
  *(_BYTE *)(v5 + 387) = self->_userIsBcc;
  *(_WORD *)(v5 + 392) |= 0x100u;
  v7 = (__int16)self->_has;
  if ((v7 & 1) != 0)
    goto LABEL_26;
LABEL_13:
  if ((v7 & 2) != 0)
  {
LABEL_14:
    *(_QWORD *)(v5 + 352) = self->_listId;
    *(_WORD *)(v5 + 392) |= 2u;
  }
LABEL_15:
  PBRepeatedInt64Copy();
  PBRepeatedInt64Copy();
  PBRepeatedInt64Copy();
  PBRepeatedBOOLCopy();
  PBRepeatedInt64Copy();
  PBRepeatedInt64Copy();
  PBRepeatedInt64Copy();
  PBRepeatedBOOLCopy();
  PBRepeatedInt64Copy();
  PBRepeatedInt64Copy();
  PBRepeatedInt64Copy();
  PBRepeatedBOOLCopy();
  PBRepeatedInt64Copy();
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_97;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 196);
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_sender != *((_QWORD *)v4 + 45))
      goto LABEL_97;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_97;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_senderDomain != *((_QWORD *)v4 + 47))
      goto LABEL_97;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_97;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0)
      goto LABEL_97;
    if (self->_senderIsVip)
    {
      if (!*((_BYTE *)v4 + 386))
        goto LABEL_97;
    }
    else if (*((_BYTE *)v4 + 386))
    {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_97;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_senderContactId != *((_QWORD *)v4 + 46))
      goto LABEL_97;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 196) & 0x400) == 0)
      goto LABEL_97;
    if (self->_userIsSender)
    {
      if (!*((_BYTE *)v4 + 389))
        goto LABEL_97;
    }
    else if (*((_BYTE *)v4 + 389))
    {
      goto LABEL_97;
    }
  }
  else if ((*((_WORD *)v4 + 196) & 0x400) != 0)
  {
    goto LABEL_97;
  }
  if (!PBRepeatedInt64IsEqual())
    goto LABEL_97;
  v7 = (__int16)self->_has;
  v8 = *((_WORD *)v4 + 196);
  if ((v7 & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0)
      goto LABEL_97;
    if (self->_messageIsReply)
    {
      if (!*((_BYTE *)v4 + 385))
        goto LABEL_97;
    }
    else if (*((_BYTE *)v4 + 385))
    {
      goto LABEL_97;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_97;
  }
  if ((v7 & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0)
      goto LABEL_97;
    if (self->_messageIsForwarded)
    {
      if (!*((_BYTE *)v4 + 384))
        goto LABEL_97;
    }
    else if (*((_BYTE *)v4 + 384))
    {
      goto LABEL_97;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 196) & 0x800) == 0)
      goto LABEL_97;
    if (self->_userIsTo)
    {
      if (!*((_BYTE *)v4 + 390))
        goto LABEL_97;
    }
    else if (*((_BYTE *)v4 + 390))
    {
      goto LABEL_97;
    }
  }
  else if ((*((_WORD *)v4 + 196) & 0x800) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 196) & 0x200) == 0)
      goto LABEL_97;
    if (self->_userIsCc)
    {
      if (!*((_BYTE *)v4 + 388))
        goto LABEL_97;
    }
    else if (*((_BYTE *)v4 + 388))
    {
      goto LABEL_97;
    }
  }
  else if ((*((_WORD *)v4 + 196) & 0x200) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 196) & 0x100) != 0)
    {
      if (self->_userIsBcc)
      {
        if (!*((_BYTE *)v4 + 387))
          goto LABEL_97;
        goto LABEL_74;
      }
      if (!*((_BYTE *)v4 + 387))
        goto LABEL_74;
    }
LABEL_97:
    IsEqual = 0;
    goto LABEL_98;
  }
  if ((*((_WORD *)v4 + 196) & 0x100) != 0)
    goto LABEL_97;
LABEL_74:
  if ((v7 & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_dateReceived != *((_QWORD *)v4 + 43))
      goto LABEL_97;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_97;
  }
  if ((v7 & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_listId != *((_QWORD *)v4 + 44))
      goto LABEL_97;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_97;
  }
  if (!PBRepeatedInt64IsEqual()
    || !PBRepeatedInt64IsEqual()
    || !PBRepeatedInt64IsEqual()
    || !PBRepeatedBOOLIsEqual()
    || !PBRepeatedInt64IsEqual()
    || !PBRepeatedInt64IsEqual()
    || !PBRepeatedInt64IsEqual()
    || !PBRepeatedBOOLIsEqual()
    || !PBRepeatedInt64IsEqual()
    || !PBRepeatedInt64IsEqual()
    || !PBRepeatedInt64IsEqual()
    || !PBRepeatedBOOLIsEqual())
  {
    goto LABEL_97;
  }
  IsEqual = PBRepeatedInt64IsEqual();
LABEL_98:

  return IsEqual;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v4 = 2654435761 * self->_sender;
    if ((has & 0x10) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_senderDomain;
      if ((has & 0x80) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v4 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_senderIsVip;
    if ((has & 8) != 0)
      goto LABEL_5;
LABEL_10:
    v7 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v6 = 0;
  if ((has & 8) == 0)
    goto LABEL_10;
LABEL_5:
  v7 = 2654435761 * self->_senderContactId;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_userIsSender;
    goto LABEL_12;
  }
LABEL_11:
  v8 = 0;
LABEL_12:
  v9 = PBRepeatedInt64Hash();
  v10 = (__int16)self->_has;
  if ((v10 & 0x40) != 0)
  {
    v11 = 2654435761 * self->_messageIsReply;
    if ((v10 & 0x20) != 0)
    {
LABEL_14:
      v12 = 2654435761 * self->_messageIsForwarded;
      if ((*(_WORD *)&self->_has & 0x800) != 0)
        goto LABEL_15;
      goto LABEL_22;
    }
  }
  else
  {
    v11 = 0;
    if ((v10 & 0x20) != 0)
      goto LABEL_14;
  }
  v12 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_15:
    v13 = 2654435761 * self->_userIsTo;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_16;
    goto LABEL_23;
  }
LABEL_22:
  v13 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_16:
    v14 = 2654435761 * self->_userIsCc;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_17;
    goto LABEL_24;
  }
LABEL_23:
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_17:
    v15 = 2654435761 * self->_userIsBcc;
    if ((v10 & 1) != 0)
      goto LABEL_18;
LABEL_25:
    v16 = 0;
    if ((v10 & 2) != 0)
      goto LABEL_19;
LABEL_26:
    v17 = 0;
    goto LABEL_27;
  }
LABEL_24:
  v15 = 0;
  if ((v10 & 1) == 0)
    goto LABEL_25;
LABEL_18:
  v16 = 2654435761u * self->_dateReceived;
  if ((v10 & 2) == 0)
    goto LABEL_26;
LABEL_19:
  v17 = 2654435761 * self->_listId;
LABEL_27:
  v18 = v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v11 ^ v12 ^ v13 ^ v14 ^ v9 ^ v15 ^ v16 ^ v17 ^ PBRepeatedInt64Hash();
  v19 = PBRepeatedInt64Hash();
  v20 = v19 ^ PBRepeatedInt64Hash();
  v21 = v18 ^ v20 ^ PBRepeatedBOOLHash();
  v22 = PBRepeatedInt64Hash();
  v23 = v22 ^ PBRepeatedInt64Hash();
  v24 = v23 ^ PBRepeatedInt64Hash();
  v25 = v21 ^ v24 ^ PBRepeatedBOOLHash();
  v26 = PBRepeatedInt64Hash();
  v27 = v26 ^ PBRepeatedInt64Hash();
  v28 = v27 ^ PBRepeatedInt64Hash();
  v29 = v28 ^ PBRepeatedBOOLHash();
  return v25 ^ v29 ^ PBRepeatedInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  __int16 v4;
  uint64_t v5;
  uint64_t i;
  __int16 v7;
  uint64_t v8;
  uint64_t j;
  uint64_t v10;
  uint64_t k;
  uint64_t v12;
  uint64_t m;
  uint64_t v14;
  uint64_t n;
  uint64_t v16;
  uint64_t ii;
  uint64_t v18;
  uint64_t jj;
  uint64_t v20;
  uint64_t kk;
  uint64_t v22;
  uint64_t mm;
  uint64_t v24;
  uint64_t nn;
  uint64_t v26;
  uint64_t i1;
  uint64_t v28;
  uint64_t i2;
  uint64_t v30;
  uint64_t i3;
  uint64_t v32;
  uint64_t i4;
  id v34;

  v34 = a3;
  v4 = *((_WORD *)v34 + 196);
  if ((v4 & 4) != 0)
  {
    self->_sender = *((_QWORD *)v34 + 45);
    *(_WORD *)&self->_has |= 4u;
    v4 = *((_WORD *)v34 + 196);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_60;
    }
  }
  else if ((v4 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_senderDomain = *((_QWORD *)v34 + 47);
  *(_WORD *)&self->_has |= 0x10u;
  v4 = *((_WORD *)v34 + 196);
  if ((v4 & 0x80) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
    goto LABEL_61;
  }
LABEL_60:
  self->_senderIsVip = *((_BYTE *)v34 + 386);
  *(_WORD *)&self->_has |= 0x80u;
  v4 = *((_WORD *)v34 + 196);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_61:
  self->_senderContactId = *((_QWORD *)v34 + 46);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v34 + 196) & 0x400) != 0)
  {
LABEL_6:
    self->_userIsSender = *((_BYTE *)v34 + 389);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_7:
  v5 = objc_msgSend(v34, "subjectWordsCount");
  if (v5)
  {
    for (i = 0; i != v5; ++i)
      -[EDPBMessageHeaders addSubjectWords:](self, "addSubjectWords:", objc_msgSend(v34, "subjectWordsAtIndex:", i));
  }
  v7 = *((_WORD *)v34 + 196);
  if ((v7 & 0x40) != 0)
  {
    self->_messageIsReply = *((_BYTE *)v34 + 385);
    *(_WORD *)&self->_has |= 0x40u;
    v7 = *((_WORD *)v34 + 196);
    if ((v7 & 0x20) == 0)
    {
LABEL_12:
      if ((v7 & 0x800) == 0)
        goto LABEL_13;
      goto LABEL_65;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_12;
  }
  self->_messageIsForwarded = *((_BYTE *)v34 + 384);
  *(_WORD *)&self->_has |= 0x20u;
  v7 = *((_WORD *)v34 + 196);
  if ((v7 & 0x800) == 0)
  {
LABEL_13:
    if ((v7 & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_66;
  }
LABEL_65:
  self->_userIsTo = *((_BYTE *)v34 + 390);
  *(_WORD *)&self->_has |= 0x800u;
  v7 = *((_WORD *)v34 + 196);
  if ((v7 & 0x200) == 0)
  {
LABEL_14:
    if ((v7 & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_67;
  }
LABEL_66:
  self->_userIsCc = *((_BYTE *)v34 + 388);
  *(_WORD *)&self->_has |= 0x200u;
  v7 = *((_WORD *)v34 + 196);
  if ((v7 & 0x100) == 0)
  {
LABEL_15:
    if ((v7 & 1) == 0)
      goto LABEL_16;
    goto LABEL_68;
  }
LABEL_67:
  self->_userIsBcc = *((_BYTE *)v34 + 387);
  *(_WORD *)&self->_has |= 0x100u;
  v7 = *((_WORD *)v34 + 196);
  if ((v7 & 1) == 0)
  {
LABEL_16:
    if ((v7 & 2) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_68:
  self->_dateReceived = *((_QWORD *)v34 + 43);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)v34 + 196) & 2) != 0)
  {
LABEL_17:
    self->_listId = *((_QWORD *)v34 + 44);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_18:
  v8 = objc_msgSend(v34, "referencesCount");
  if (v8)
  {
    for (j = 0; j != v8; ++j)
      -[EDPBMessageHeaders addReferences:](self, "addReferences:", objc_msgSend(v34, "referencesAtIndex:", j));
  }
  v10 = objc_msgSend(v34, "toAddressCount");
  if (v10)
  {
    for (k = 0; k != v10; ++k)
      -[EDPBMessageHeaders addToAddress:](self, "addToAddress:", objc_msgSend(v34, "toAddressAtIndex:", k));
  }
  v12 = objc_msgSend(v34, "toDomainsCount");
  if (v12)
  {
    for (m = 0; m != v12; ++m)
      -[EDPBMessageHeaders addToDomain:](self, "addToDomain:", objc_msgSend(v34, "toDomainAtIndex:", m));
  }
  v14 = objc_msgSend(v34, "toIsVipsCount");
  if (v14)
  {
    for (n = 0; n != v14; ++n)
      -[EDPBMessageHeaders addToIsVip:](self, "addToIsVip:", objc_msgSend(v34, "toIsVipAtIndex:", n));
  }
  v16 = objc_msgSend(v34, "toContactIdsCount");
  if (v16)
  {
    for (ii = 0; ii != v16; ++ii)
      -[EDPBMessageHeaders addToContactId:](self, "addToContactId:", objc_msgSend(v34, "toContactIdAtIndex:", ii));
  }
  v18 = objc_msgSend(v34, "ccAddressCount");
  if (v18)
  {
    for (jj = 0; jj != v18; ++jj)
      -[EDPBMessageHeaders addCcAddress:](self, "addCcAddress:", objc_msgSend(v34, "ccAddressAtIndex:", jj));
  }
  v20 = objc_msgSend(v34, "ccDomainsCount");
  if (v20)
  {
    for (kk = 0; kk != v20; ++kk)
      -[EDPBMessageHeaders addCcDomain:](self, "addCcDomain:", objc_msgSend(v34, "ccDomainAtIndex:", kk));
  }
  v22 = objc_msgSend(v34, "ccIsVipsCount");
  if (v22)
  {
    for (mm = 0; mm != v22; ++mm)
      -[EDPBMessageHeaders addCcIsVip:](self, "addCcIsVip:", objc_msgSend(v34, "ccIsVipAtIndex:", mm));
  }
  v24 = objc_msgSend(v34, "ccContactIdsCount");
  if (v24)
  {
    for (nn = 0; nn != v24; ++nn)
      -[EDPBMessageHeaders addCcContactId:](self, "addCcContactId:", objc_msgSend(v34, "ccContactIdAtIndex:", nn));
  }
  v26 = objc_msgSend(v34, "bccAddressCount");
  if (v26)
  {
    for (i1 = 0; i1 != v26; ++i1)
      -[EDPBMessageHeaders addBccAddress:](self, "addBccAddress:", objc_msgSend(v34, "bccAddressAtIndex:", i1));
  }
  v28 = objc_msgSend(v34, "bccDomainsCount");
  if (v28)
  {
    for (i2 = 0; i2 != v28; ++i2)
      -[EDPBMessageHeaders addBccDomain:](self, "addBccDomain:", objc_msgSend(v34, "bccDomainAtIndex:", i2));
  }
  v30 = objc_msgSend(v34, "bccIsVipsCount");
  if (v30)
  {
    for (i3 = 0; i3 != v30; ++i3)
      -[EDPBMessageHeaders addBccIsVip:](self, "addBccIsVip:", objc_msgSend(v34, "bccIsVipAtIndex:", i3));
  }
  v32 = objc_msgSend(v34, "bccContactIdsCount");
  if (v32)
  {
    for (i4 = 0; i4 != v32; ++i4)
      -[EDPBMessageHeaders addBccContactId:](self, "addBccContactId:", objc_msgSend(v34, "bccContactIdAtIndex:", i4));
  }

}

- (int64_t)sender
{
  return self->_sender;
}

- (int64_t)senderDomain
{
  return self->_senderDomain;
}

- (BOOL)senderIsVip
{
  return self->_senderIsVip;
}

- (int64_t)senderContactId
{
  return self->_senderContactId;
}

- (BOOL)userIsSender
{
  return self->_userIsSender;
}

- (BOOL)messageIsReply
{
  return self->_messageIsReply;
}

- (BOOL)messageIsForwarded
{
  return self->_messageIsForwarded;
}

- (BOOL)userIsTo
{
  return self->_userIsTo;
}

- (BOOL)userIsCc
{
  return self->_userIsCc;
}

- (BOOL)userIsBcc
{
  return self->_userIsBcc;
}

- (unint64_t)dateReceived
{
  return self->_dateReceived;
}

- (int64_t)listId
{
  return self->_listId;
}

@end
