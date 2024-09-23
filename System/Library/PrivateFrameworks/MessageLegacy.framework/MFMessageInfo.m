@implementation MFMessageInfo

- (BOOL)read
{
  return (*((unsigned __int8 *)self + 8) >> 1) & 1;
}

- (void)setRead:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xFD | v3;
}

- (BOOL)flagged
{
  return *((_BYTE *)self + 8) & 1;
}

- (void)setFlagged:(BOOL)a3
{
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xFE | a3;
}

- (BOOL)deleted
{
  return (*((unsigned __int8 *)self + 8) >> 2) & 1;
}

- (void)setDeleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xFB | v3;
}

- (BOOL)uidIsLibraryID
{
  return (*((unsigned __int8 *)self + 8) >> 3) & 1;
}

- (void)setUidIsLibraryID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xF7 | v3;
}

- (BOOL)isKnownToHaveAttachments
{
  return (*((unsigned __int8 *)self + 8) >> 4) & 1;
}

- (void)setKnownToHaveAttachments:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xEF | v3;
}

- (BOOL)isVIP
{
  return (*((unsigned __int8 *)self + 8) >> 5) & 1;
}

- (void)setIsVIP:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xDF | v3;
}

+ (int64_t)newGenerationNumber
{
  unint64_t v2;
  int64_t result;

  do
  {
    v2 = __ldxr(&__globalGenerationNumber);
    result = v2 + 1;
  }
  while (__stxr(v2 + 1, &__globalGenerationNumber));
  return result;
}

- (MFMessageInfo)init
{
  MFMessageInfo *result;
  unint64_t v3;
  unint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFMessageInfo;
  result = -[MFMessageInfo init](&v5, sel_init);
  if (result)
  {
    do
    {
      v3 = __ldxr(&__globalGenerationNumber);
      v4 = v3 + 1;
    }
    while (__stxr(v4, &__globalGenerationNumber));
    result->_generationNumber = v4;
  }
  return result;
}

- (MFMessageInfo)initWithUid:(unsigned int)a3 mailboxID:(unsigned int)a4 messageID:(int64_t)a5 dateReceivedInterval:(unsigned int)a6 dateSentInterval:(unsigned int)a7 conversationHash:(int64_t)a8 read:(BOOL)a9 knownToHaveAttachments:(BOOL)a10 flagged:(BOOL)a11 isVIP:(BOOL)a12
{
  MFMessageInfo *result;
  char v19;
  char v20;
  char v21;

  result = -[MFMessageInfo init](self, "init");
  if (result)
  {
    result->_uid = a3;
    result->_dateReceivedInterval = a6;
    result->_sortUid = a3;
    result->_sortDateReceivedInterval = a6;
    result->_dateSentInterval = a7;
    result->_mailboxID = a4;
    result->_conversationHash = a8;
    result->_messageIDHash = a5;
    if (a9)
      v19 = 2;
    else
      v19 = 0;
    if (a10)
      v20 = 16;
    else
      v20 = 0;
    if (a12)
      v21 = 32;
    else
      v21 = 0;
    *((_BYTE *)result + 8) = v20 | v19 | a11 | v21 | *((_BYTE *)result + 8) & 0xCC;
  }
  return result;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
  self->_sortUid = a3;
}

- (void)setDateReceivedInterval:(unsigned int)a3
{
  self->_dateReceivedInterval = a3;
  self->_sortDateReceivedInterval = a3;
}

- (int64_t)generationCompare:(id)a3
{
  int64_t v3;
  int64_t generationNumber;
  BOOL v5;
  int64_t v6;

  v3 = *((_QWORD *)a3 + 6);
  generationNumber = self->_generationNumber;
  v5 = v3 <= generationNumber;
  v6 = v3 < generationNumber;
  if (v5)
    return v6;
  else
    return -1;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int uid;

  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && (uid = self->_uid) != 0
      && *((_DWORD *)a3 + 5) == uid
      && *((_DWORD *)a3 + 4) == self->_mailboxID;
}

- (unint64_t)hash
{
  unint64_t result;

  result = self->_uid;
  if (!(_DWORD)result)
    -[MFMessageInfo hash].cold.1();
  return result;
}

- (NSString)description
{
  uint64_t sortUid;
  const __CFString *v4;
  const __CFString *v5;
  id v6;
  id v7;

  sortUid = self->_sortUid;
  if (self->_uid == (_DWORD)sortUid)
    v4 = &stru_1E81CBE50;
  else
    v4 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", sortUid=%u"), sortUid);
  if (self->_dateReceivedInterval == self->_sortDateReceivedInterval)
    v5 = &stru_1E81CBE50;
  else
    v5 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", sortReceived=%u"), self->_sortDateReceivedInterval);
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F088]), "initWithHash:", self->_conversationHash);
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F088]), "initWithHash:", self->_messageIDHash);
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; uid=%u; mailboxID=%U; conversation=%@; messageID=%@; received=%u%@%@; %@;>"),
                       objc_opt_class(),
                       self,
                       self->_uid,
                       self->_mailboxID,
                       objc_msgSend(v6, "ef_publicDescription"),
                       objc_msgSend(v7, "ef_publicDescription"),
                       self->_dateReceivedInterval,
                       v4,
                       v5,
                       -[MFMessageInfo _flagDescription](self, "_flagDescription"));
}

- (id)_flagDescription
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  _BOOL4 v7;
  const __CFString *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MFMessageInfo read](self, "read");
  v4 = objc_msgSend(v3, "stringWithFormat:", CFSTR("read=%@"), NSStringFromBOOL());
  if (-[MFMessageInfo flagged](self, "flagged"))
    v5 = CFSTR(", flagged=YES");
  else
    v5 = &stru_1E81CBE50;
  if (-[MFMessageInfo isVIP](self, "isVIP"))
    v6 = CFSTR(", isVIP=YES");
  else
    v6 = &stru_1E81CBE50;
  v7 = -[MFMessageInfo isKnownToHaveAttachments](self, "isKnownToHaveAttachments");
  v8 = CFSTR(", hasAttachments=YES");
  if (!v7)
    v8 = &stru_1E81CBE50;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("flags={ %@%@%@%@ }"), v4, v5, v6, v8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  char v5;
  void *v6;
  uint64_t v8;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = *((_BYTE *)self + 8);
  BYTE3(v8) = (v5 & 0x20) != 0;
  BYTE2(v8) = v5 & 1;
  BYTE1(v8) = (v5 & 0x10) != 0;
  LOBYTE(v8) = (v5 & 2) != 0;
  v6 = (void *)objc_msgSend(v4, "initWithUid:mailboxID:messageID:dateReceivedInterval:dateSentInterval:conversationHash:read:knownToHaveAttachments:flagged:isVIP:", self->_uid, self->_mailboxID, self->_messageIDHash, self->_dateReceivedInterval, self->_dateSentInterval, self->_conversationHash, v8);
  objc_msgSend(v6, "setUidIsLibraryID:", -[MFMessageInfo uidIsLibraryID](self, "uidIsLibraryID"));
  return v6;
}

- (unsigned)dateSentInterval
{
  return self->_dateSentInterval;
}

- (void)setDateSentInterval:(unsigned int)a3
{
  self->_dateSentInterval = a3;
}

- (int64_t)conversationHash
{
  return self->_conversationHash;
}

- (void)setConversationHash:(int64_t)a3
{
  self->_conversationHash = a3;
}

- (unsigned)mailboxID
{
  return self->_mailboxID;
}

- (void)setMailboxID:(unsigned int)a3
{
  self->_mailboxID = a3;
}

- (int64_t)generationNumber
{
  return self->_generationNumber;
}

- (unsigned)uid
{
  return self->_uid;
}

- (unsigned)dateReceivedInterval
{
  return self->_dateReceivedInterval;
}

- (int64_t)messageIDHash
{
  return self->_messageIDHash;
}

- (void)setMessageIDHash:(int64_t)a3
{
  self->_messageIDHash = a3;
}

- (unsigned)sortUid
{
  return self->_sortUid;
}

- (void)setSortUid:(unsigned int)a3
{
  self->_sortUid = a3;
}

- (unsigned)sortDateReceivedInterval
{
  return self->_sortDateReceivedInterval;
}

- (void)setSortDateReceivedInterval:(unsigned int)a3
{
  self->_sortDateReceivedInterval = a3;
}

- (void)hash
{
  __assert_rtn("-[MFMessageInfo hash]", "MFMessageInfo.m", 116, "0 && \"Tried to get the hash of an object that had no UID\");
}

@end
