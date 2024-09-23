@implementation EDPBModelFeaturesImportant

- (void)setUnknownFeatureCount:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_unknownFeatureCount = a3;
}

- (void)setHasUnknownFeatureCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasUnknownFeatureCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCcContainsContact:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_ccContainsContact = a3;
}

- (void)setHasCcContainsContact:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasCcContainsContact
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCcIsTopDirectAddressesBasedOnRespond:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_ccIsTopDirectAddressesBasedOnRespond = a3;
}

- (void)setHasCcIsTopDirectAddressesBasedOnRespond:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasCcIsTopDirectAddressesBasedOnRespond
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setCcIsTopDirectAddressesBasedOnScroll:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_ccIsTopDirectAddressesBasedOnScroll = a3;
}

- (void)setHasCcIsTopDirectAddressesBasedOnScroll:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasCcIsTopDirectAddressesBasedOnScroll
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setCcIsTopDirectAddressesBasedOnSend:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_ccIsTopDirectAddressesBasedOnSend = a3;
}

- (void)setHasCcIsTopDirectAddressesBasedOnSend:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasCcIsTopDirectAddressesBasedOnSend
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setCcIsTopDirectAddressesBasedOnView:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_ccIsTopDirectAddressesBasedOnView = a3;
}

- (void)setHasCcIsTopDirectAddressesBasedOnView:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasCcIsTopDirectAddressesBasedOnView
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setCcIsTopIndirectAddressesBasedOnRespond:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_ccIsTopIndirectAddressesBasedOnRespond = a3;
}

- (void)setHasCcIsTopIndirectAddressesBasedOnRespond:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasCcIsTopIndirectAddressesBasedOnRespond
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setCcIsTopIndirectAddressesBasedOnScroll:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_ccIsTopIndirectAddressesBasedOnScroll = a3;
}

- (void)setHasCcIsTopIndirectAddressesBasedOnScroll:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasCcIsTopIndirectAddressesBasedOnScroll
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setCcIsTopIndirectAddressesBasedOnSend:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_ccIsTopIndirectAddressesBasedOnSend = a3;
}

- (void)setHasCcIsTopIndirectAddressesBasedOnSend:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasCcIsTopIndirectAddressesBasedOnSend
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setCcIsTopIndirectAddressesBasedOnView:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_ccIsTopIndirectAddressesBasedOnView = a3;
}

- (void)setHasCcIsTopIndirectAddressesBasedOnView:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasCcIsTopIndirectAddressesBasedOnView
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setCcIsVip:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_ccIsVip = a3;
}

- (void)setHasCcIsVip:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasCcIsVip
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setFromListId:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_fromListId = a3;
}

- (void)setHasFromListId:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasFromListId
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setMessageIsForward:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_messageIsForward = a3;
}

- (void)setHasMessageIsForward:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasMessageIsForward
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setMessageIsReply:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_messageIsReply = a3;
}

- (void)setHasMessageIsReply:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasMessageIsReply
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setNumRecipients:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_numRecipients = a3;
}

- (void)setHasNumRecipients:(BOOL)a3
{
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasNumRecipients
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setSenderIsContact:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_senderIsContact = a3;
}

- (void)setHasSenderIsContact:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasSenderIsContact
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setSenderIsTopDirectAddressesBasedOnRespond:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_senderIsTopDirectAddressesBasedOnRespond = a3;
}

- (void)setHasSenderIsTopDirectAddressesBasedOnRespond:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasSenderIsTopDirectAddressesBasedOnRespond
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setSenderIsTopDirectAddressesBasedOnScroll:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_senderIsTopDirectAddressesBasedOnScroll = a3;
}

- (void)setHasSenderIsTopDirectAddressesBasedOnScroll:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasSenderIsTopDirectAddressesBasedOnScroll
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setSenderIsTopDirectAddressesBasedOnSend:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_senderIsTopDirectAddressesBasedOnSend = a3;
}

- (void)setHasSenderIsTopDirectAddressesBasedOnSend:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasSenderIsTopDirectAddressesBasedOnSend
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSenderIsTopDirectAddressesBasedOnView:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_senderIsTopDirectAddressesBasedOnView = a3;
}

- (void)setHasSenderIsTopDirectAddressesBasedOnView:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasSenderIsTopDirectAddressesBasedOnView
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setSenderIsTopIndirectAddressesBasedOnRespond:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_senderIsTopIndirectAddressesBasedOnRespond = a3;
}

- (void)setHasSenderIsTopIndirectAddressesBasedOnRespond:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasSenderIsTopIndirectAddressesBasedOnRespond
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setSenderIsTopIndirectAddressesBasedOnScroll:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_senderIsTopIndirectAddressesBasedOnScroll = a3;
}

- (void)setHasSenderIsTopIndirectAddressesBasedOnScroll:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasSenderIsTopIndirectAddressesBasedOnScroll
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setSenderIsTopIndirectAddressesBasedOnSend:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_senderIsTopIndirectAddressesBasedOnSend = a3;
}

- (void)setHasSenderIsTopIndirectAddressesBasedOnSend:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasSenderIsTopIndirectAddressesBasedOnSend
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setSenderIsTopIndirectAddressesBasedOnView:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_senderIsTopIndirectAddressesBasedOnView = a3;
}

- (void)setHasSenderIsTopIndirectAddressesBasedOnView:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasSenderIsTopIndirectAddressesBasedOnView
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setSenderIsVip:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_senderIsVip = a3;
}

- (void)setHasSenderIsVip:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasSenderIsVip
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setSubjectIsTopWordsBasedOnRespond:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_subjectIsTopWordsBasedOnRespond = a3;
}

- (void)setHasSubjectIsTopWordsBasedOnRespond:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasSubjectIsTopWordsBasedOnRespond
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setSubjectIsTopWordsBasedOnScroll:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_subjectIsTopWordsBasedOnScroll = a3;
}

- (void)setHasSubjectIsTopWordsBasedOnScroll:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasSubjectIsTopWordsBasedOnScroll
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setSubjectIsTopWordsBasedOnSend:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_subjectIsTopWordsBasedOnSend = a3;
}

- (void)setHasSubjectIsTopWordsBasedOnSend:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasSubjectIsTopWordsBasedOnSend
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setSubjectIsTopWordsBasedOnView:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_subjectIsTopWordsBasedOnView = a3;
}

- (void)setHasSubjectIsTopWordsBasedOnView:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasSubjectIsTopWordsBasedOnView
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (int)timeReceived
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_timeReceived;
  else
    return 0;
}

- (void)setTimeReceived:(int)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_timeReceived = a3;
}

- (void)setHasTimeReceived:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasTimeReceived
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)timeReceivedAsString:(int)a3
{
  if (a3 < 4)
    return off_1E949F7A0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTimeReceived:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NIGHT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORNING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AFTERNOON")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EVENING")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setToContainsContact:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_toContainsContact = a3;
}

- (void)setHasToContainsContact:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasToContainsContact
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setToIsTopDirectAddressesBasedOnRespond:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_toIsTopDirectAddressesBasedOnRespond = a3;
}

- (void)setHasToIsTopDirectAddressesBasedOnRespond:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasToIsTopDirectAddressesBasedOnRespond
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setToIsTopDirectAddressesBasedOnScroll:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_toIsTopDirectAddressesBasedOnScroll = a3;
}

- (void)setHasToIsTopDirectAddressesBasedOnScroll:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasToIsTopDirectAddressesBasedOnScroll
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setToIsTopDirectAddressesBasedOnSend:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_toIsTopDirectAddressesBasedOnSend = a3;
}

- (void)setHasToIsTopDirectAddressesBasedOnSend:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasToIsTopDirectAddressesBasedOnSend
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setToIsTopDirectAddressesBasedOnView:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_toIsTopDirectAddressesBasedOnView = a3;
}

- (void)setHasToIsTopDirectAddressesBasedOnView:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasToIsTopDirectAddressesBasedOnView
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setToIsTopIndirectAddressesBasedOnRespond:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_toIsTopIndirectAddressesBasedOnRespond = a3;
}

- (void)setHasToIsTopIndirectAddressesBasedOnRespond:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasToIsTopIndirectAddressesBasedOnRespond
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setToIsTopIndirectAddressesBasedOnScroll:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_toIsTopIndirectAddressesBasedOnScroll = a3;
}

- (void)setHasToIsTopIndirectAddressesBasedOnScroll:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasToIsTopIndirectAddressesBasedOnScroll
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setToIsTopIndirectAddressesBasedOnSend:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_toIsTopIndirectAddressesBasedOnSend = a3;
}

- (void)setHasToIsTopIndirectAddressesBasedOnSend:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasToIsTopIndirectAddressesBasedOnSend
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setToIsTopIndirectAddressesBasedOnView:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_toIsTopIndirectAddressesBasedOnView = a3;
}

- (void)setHasToIsTopIndirectAddressesBasedOnView:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasToIsTopIndirectAddressesBasedOnView
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setToIsVip:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_toIsVip = a3;
}

- (void)setHasToIsVip:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasToIsVip
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setUserIsBcc:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_userIsBcc = a3;
}

- (void)setHasUserIsBcc:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasUserIsBcc
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)setUserIsCc:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_userIsCc = a3;
}

- (void)setHasUserIsCc:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasUserIsCc
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setUserIsSender:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_userIsSender = a3;
}

- (void)setHasUserIsSender:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasUserIsSender
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setUserIsTo:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_userIsTo = a3;
}

- (void)setHasUserIsTo:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($97E03A411929B79E081860F9A198F5DE)(*(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasUserIsTo
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
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
  v8.super_class = (Class)EDPBModelFeaturesImportant;
  -[EDPBModelFeaturesImportant description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPBModelFeaturesImportant dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $97E03A411929B79E081860F9A198F5DE has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v32;
  void *v33;
  uint64_t timeReceived;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_unknownFeatureCount);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("unknown_feature_count"));

    has = self->_has;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ccContainsContact);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("cc_contains_contact"));

    has = self->_has;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ccIsTopDirectAddressesBasedOnRespond);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("cc_is_top_direct_addresses_based_on_respond"));

    has = self->_has;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ccIsTopDirectAddressesBasedOnScroll);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("cc_is_top_direct_addresses_based_on_scroll"));

    has = self->_has;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ccIsTopDirectAddressesBasedOnSend);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("cc_is_top_direct_addresses_based_on_send"));

    has = self->_has;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ccIsTopDirectAddressesBasedOnView);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("cc_is_top_direct_addresses_based_on_view"));

    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ccIsTopIndirectAddressesBasedOnRespond);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("cc_is_top_indirect_addresses_based_on_respond"));

    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ccIsTopIndirectAddressesBasedOnScroll);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("cc_is_top_indirect_addresses_based_on_scroll"));

    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ccIsTopIndirectAddressesBasedOnSend);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("cc_is_top_indirect_addresses_based_on_send"));

    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ccIsTopIndirectAddressesBasedOnView);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("cc_is_top_indirect_addresses_based_on_view"));

    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ccIsVip);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("cc_is_vip"));

    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_fromListId);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("from_list_id"));

    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_messageIsForward);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("message_is_forward"));

    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_messageIsReply);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("message_is_reply"));

    has = self->_has;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numRecipients);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("num_recipients"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_senderIsContact);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("sender_is_contact"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_senderIsTopDirectAddressesBasedOnRespond);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("sender_is_top_direct_addresses_based_on_respond"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_senderIsTopDirectAddressesBasedOnScroll);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("sender_is_top_direct_addresses_based_on_scroll"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_senderIsTopDirectAddressesBasedOnSend);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("sender_is_top_direct_addresses_based_on_send"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_senderIsTopDirectAddressesBasedOnView);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("sender_is_top_direct_addresses_based_on_view"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_senderIsTopIndirectAddressesBasedOnRespond);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("sender_is_top_indirect_addresses_based_on_respond"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_senderIsTopIndirectAddressesBasedOnScroll);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("sender_is_top_indirect_addresses_based_on_scroll"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_senderIsTopIndirectAddressesBasedOnSend);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("sender_is_top_indirect_addresses_based_on_send"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_senderIsTopIndirectAddressesBasedOnView);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("sender_is_top_indirect_addresses_based_on_view"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_senderIsVip);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("sender_is_vip"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_subjectIsTopWordsBasedOnRespond);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("subject_is_top_words_based_on_respond"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_subjectIsTopWordsBasedOnScroll);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("subject_is_top_words_based_on_scroll"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_subjectIsTopWordsBasedOnSend);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("subject_is_top_words_based_on_send"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_subjectIsTopWordsBasedOnView);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("subject_is_top_words_based_on_view"));

    has = self->_has;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    timeReceived = self->_timeReceived;
    if (timeReceived >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_timeReceived);
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = off_1E949F7A0[timeReceived];
    }
    objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("time_received"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_toContainsContact);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("to_contains_contact"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_toIsTopDirectAddressesBasedOnRespond);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("to_is_top_direct_addresses_based_on_respond"));

    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_toIsTopDirectAddressesBasedOnScroll);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("to_is_top_direct_addresses_based_on_scroll"));

    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_toIsTopDirectAddressesBasedOnSend);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("to_is_top_direct_addresses_based_on_send"));

    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_toIsTopDirectAddressesBasedOnView);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("to_is_top_direct_addresses_based_on_view"));

    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_toIsTopIndirectAddressesBasedOnRespond);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("to_is_top_indirect_addresses_based_on_respond"));

    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_toIsTopIndirectAddressesBasedOnScroll);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("to_is_top_indirect_addresses_based_on_scroll"));

    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x2000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_toIsTopIndirectAddressesBasedOnSend);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("to_is_top_indirect_addresses_based_on_send"));

    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_toIsTopIndirectAddressesBasedOnView);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("to_is_top_indirect_addresses_based_on_view"));

    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x8000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_toIsVip);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("to_is_vip"));

    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userIsBcc);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("user_is_bcc"));

    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userIsCc);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("user_is_cc"));

    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userIsSender);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("user_is_sender"));

    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x80000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userIsTo);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("user_is_to"));

  }
  v50 = v3;

  return v50;
}

- (BOOL)readFrom:(id)a3
{
  return EDPBModelFeaturesImportantReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $97E03A411929B79E081860F9A198F5DE has;
  id v5;

  v5 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = self->_has;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x2000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x8000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x80000000000) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  $97E03A411929B79E081860F9A198F5DE has;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    v4[4] = self->_unknownFeatureCount;
    *((_QWORD *)v4 + 8) |= 4uLL;
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_49;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v4 + 20) = self->_ccContainsContact;
  *((_QWORD *)v4 + 8) |= 8uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_50;
  }
LABEL_49:
  *((_BYTE *)v4 + 21) = self->_ccIsTopDirectAddressesBasedOnRespond;
  *((_QWORD *)v4 + 8) |= 0x10uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_51;
  }
LABEL_50:
  *((_BYTE *)v4 + 22) = self->_ccIsTopDirectAddressesBasedOnScroll;
  *((_QWORD *)v4 + 8) |= 0x20uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_52;
  }
LABEL_51:
  *((_BYTE *)v4 + 23) = self->_ccIsTopDirectAddressesBasedOnSend;
  *((_QWORD *)v4 + 8) |= 0x40uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_53;
  }
LABEL_52:
  *((_BYTE *)v4 + 24) = self->_ccIsTopDirectAddressesBasedOnView;
  *((_QWORD *)v4 + 8) |= 0x80uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_54;
  }
LABEL_53:
  *((_BYTE *)v4 + 25) = self->_ccIsTopIndirectAddressesBasedOnRespond;
  *((_QWORD *)v4 + 8) |= 0x100uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_55;
  }
LABEL_54:
  *((_BYTE *)v4 + 26) = self->_ccIsTopIndirectAddressesBasedOnScroll;
  *((_QWORD *)v4 + 8) |= 0x200uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_56;
  }
LABEL_55:
  *((_BYTE *)v4 + 27) = self->_ccIsTopIndirectAddressesBasedOnSend;
  *((_QWORD *)v4 + 8) |= 0x400uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_57;
  }
LABEL_56:
  *((_BYTE *)v4 + 28) = self->_ccIsTopIndirectAddressesBasedOnView;
  *((_QWORD *)v4 + 8) |= 0x800uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_58;
  }
LABEL_57:
  *((_BYTE *)v4 + 29) = self->_ccIsVip;
  *((_QWORD *)v4 + 8) |= 0x1000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_59;
  }
LABEL_58:
  *((_BYTE *)v4 + 30) = self->_fromListId;
  *((_QWORD *)v4 + 8) |= 0x2000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_60;
  }
LABEL_59:
  *((_BYTE *)v4 + 31) = self->_messageIsForward;
  *((_QWORD *)v4 + 8) |= 0x4000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_16;
    goto LABEL_61;
  }
LABEL_60:
  *((_BYTE *)v4 + 32) = self->_messageIsReply;
  *((_QWORD *)v4 + 8) |= 0x8000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_62;
  }
LABEL_61:
  v4[2] = self->_numRecipients;
  *((_QWORD *)v4 + 8) |= 1uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_63;
  }
LABEL_62:
  *((_BYTE *)v4 + 33) = self->_senderIsContact;
  *((_QWORD *)v4 + 8) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_64;
  }
LABEL_63:
  *((_BYTE *)v4 + 34) = self->_senderIsTopDirectAddressesBasedOnRespond;
  *((_QWORD *)v4 + 8) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_20;
    goto LABEL_65;
  }
LABEL_64:
  *((_BYTE *)v4 + 35) = self->_senderIsTopDirectAddressesBasedOnScroll;
  *((_QWORD *)v4 + 8) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_66;
  }
LABEL_65:
  *((_BYTE *)v4 + 36) = self->_senderIsTopDirectAddressesBasedOnSend;
  *((_QWORD *)v4 + 8) |= 0x80000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_22;
    goto LABEL_67;
  }
LABEL_66:
  *((_BYTE *)v4 + 37) = self->_senderIsTopDirectAddressesBasedOnView;
  *((_QWORD *)v4 + 8) |= 0x100000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_23;
    goto LABEL_68;
  }
LABEL_67:
  *((_BYTE *)v4 + 38) = self->_senderIsTopIndirectAddressesBasedOnRespond;
  *((_QWORD *)v4 + 8) |= 0x200000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_24;
    goto LABEL_69;
  }
LABEL_68:
  *((_BYTE *)v4 + 39) = self->_senderIsTopIndirectAddressesBasedOnScroll;
  *((_QWORD *)v4 + 8) |= 0x400000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_25;
    goto LABEL_70;
  }
LABEL_69:
  *((_BYTE *)v4 + 40) = self->_senderIsTopIndirectAddressesBasedOnSend;
  *((_QWORD *)v4 + 8) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_26;
    goto LABEL_71;
  }
LABEL_70:
  *((_BYTE *)v4 + 41) = self->_senderIsTopIndirectAddressesBasedOnView;
  *((_QWORD *)v4 + 8) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_27;
    goto LABEL_72;
  }
LABEL_71:
  *((_BYTE *)v4 + 42) = self->_senderIsVip;
  *((_QWORD *)v4 + 8) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_28;
    goto LABEL_73;
  }
LABEL_72:
  *((_BYTE *)v4 + 43) = self->_subjectIsTopWordsBasedOnRespond;
  *((_QWORD *)v4 + 8) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_29;
    goto LABEL_74;
  }
LABEL_73:
  *((_BYTE *)v4 + 44) = self->_subjectIsTopWordsBasedOnScroll;
  *((_QWORD *)v4 + 8) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_30;
    goto LABEL_75;
  }
LABEL_74:
  *((_BYTE *)v4 + 45) = self->_subjectIsTopWordsBasedOnSend;
  *((_QWORD *)v4 + 8) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_31;
    goto LABEL_76;
  }
LABEL_75:
  *((_BYTE *)v4 + 46) = self->_subjectIsTopWordsBasedOnView;
  *((_QWORD *)v4 + 8) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_32;
    goto LABEL_77;
  }
LABEL_76:
  v4[3] = self->_timeReceived;
  *((_QWORD *)v4 + 8) |= 2uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_33;
    goto LABEL_78;
  }
LABEL_77:
  *((_BYTE *)v4 + 47) = self->_toContainsContact;
  *((_QWORD *)v4 + 8) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_34;
    goto LABEL_79;
  }
LABEL_78:
  *((_BYTE *)v4 + 48) = self->_toIsTopDirectAddressesBasedOnRespond;
  *((_QWORD *)v4 + 8) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_35;
    goto LABEL_80;
  }
LABEL_79:
  *((_BYTE *)v4 + 49) = self->_toIsTopDirectAddressesBasedOnScroll;
  *((_QWORD *)v4 + 8) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_36;
    goto LABEL_81;
  }
LABEL_80:
  *((_BYTE *)v4 + 50) = self->_toIsTopDirectAddressesBasedOnSend;
  *((_QWORD *)v4 + 8) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_36:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_37;
    goto LABEL_82;
  }
LABEL_81:
  *((_BYTE *)v4 + 51) = self->_toIsTopDirectAddressesBasedOnView;
  *((_QWORD *)v4 + 8) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_37:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_38;
    goto LABEL_83;
  }
LABEL_82:
  *((_BYTE *)v4 + 52) = self->_toIsTopIndirectAddressesBasedOnRespond;
  *((_QWORD *)v4 + 8) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_38:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_39;
    goto LABEL_84;
  }
LABEL_83:
  *((_BYTE *)v4 + 53) = self->_toIsTopIndirectAddressesBasedOnScroll;
  *((_QWORD *)v4 + 8) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_39:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_40;
    goto LABEL_85;
  }
LABEL_84:
  *((_BYTE *)v4 + 54) = self->_toIsTopIndirectAddressesBasedOnSend;
  *((_QWORD *)v4 + 8) |= 0x2000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_40:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_41;
    goto LABEL_86;
  }
LABEL_85:
  *((_BYTE *)v4 + 55) = self->_toIsTopIndirectAddressesBasedOnView;
  *((_QWORD *)v4 + 8) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_42;
    goto LABEL_87;
  }
LABEL_86:
  *((_BYTE *)v4 + 56) = self->_toIsVip;
  *((_QWORD *)v4 + 8) |= 0x8000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_42:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_43;
    goto LABEL_88;
  }
LABEL_87:
  *((_BYTE *)v4 + 57) = self->_userIsBcc;
  *((_QWORD *)v4 + 8) |= 0x10000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_43:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_44;
LABEL_89:
    *((_BYTE *)v4 + 59) = self->_userIsSender;
    *((_QWORD *)v4 + 8) |= 0x40000000000uLL;
    if ((*(_QWORD *)&self->_has & 0x80000000000) == 0)
      goto LABEL_46;
    goto LABEL_45;
  }
LABEL_88:
  *((_BYTE *)v4 + 58) = self->_userIsCc;
  *((_QWORD *)v4 + 8) |= 0x20000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
    goto LABEL_89;
LABEL_44:
  if ((*(_QWORD *)&has & 0x80000000000) != 0)
  {
LABEL_45:
    *((_BYTE *)v4 + 60) = self->_userIsTo;
    *((_QWORD *)v4 + 8) |= 0x80000000000uLL;
  }
LABEL_46:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  $97E03A411929B79E081860F9A198F5DE has;
  id v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    *(_DWORD *)(v4 + 16) = self->_unknownFeatureCount;
    *(_QWORD *)(v4 + 64) |= 4uLL;
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_49;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v4 + 20) = self->_ccContainsContact;
  *(_QWORD *)(v4 + 64) |= 8uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_50;
  }
LABEL_49:
  *(_BYTE *)(v4 + 21) = self->_ccIsTopDirectAddressesBasedOnRespond;
  *(_QWORD *)(v4 + 64) |= 0x10uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_51;
  }
LABEL_50:
  *(_BYTE *)(v4 + 22) = self->_ccIsTopDirectAddressesBasedOnScroll;
  *(_QWORD *)(v4 + 64) |= 0x20uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_52;
  }
LABEL_51:
  *(_BYTE *)(v4 + 23) = self->_ccIsTopDirectAddressesBasedOnSend;
  *(_QWORD *)(v4 + 64) |= 0x40uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_53;
  }
LABEL_52:
  *(_BYTE *)(v4 + 24) = self->_ccIsTopDirectAddressesBasedOnView;
  *(_QWORD *)(v4 + 64) |= 0x80uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_54;
  }
LABEL_53:
  *(_BYTE *)(v4 + 25) = self->_ccIsTopIndirectAddressesBasedOnRespond;
  *(_QWORD *)(v4 + 64) |= 0x100uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_55;
  }
LABEL_54:
  *(_BYTE *)(v4 + 26) = self->_ccIsTopIndirectAddressesBasedOnScroll;
  *(_QWORD *)(v4 + 64) |= 0x200uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_56;
  }
LABEL_55:
  *(_BYTE *)(v4 + 27) = self->_ccIsTopIndirectAddressesBasedOnSend;
  *(_QWORD *)(v4 + 64) |= 0x400uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_57;
  }
LABEL_56:
  *(_BYTE *)(v4 + 28) = self->_ccIsTopIndirectAddressesBasedOnView;
  *(_QWORD *)(v4 + 64) |= 0x800uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_58;
  }
LABEL_57:
  *(_BYTE *)(v4 + 29) = self->_ccIsVip;
  *(_QWORD *)(v4 + 64) |= 0x1000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_59;
  }
LABEL_58:
  *(_BYTE *)(v4 + 30) = self->_fromListId;
  *(_QWORD *)(v4 + 64) |= 0x2000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_60;
  }
LABEL_59:
  *(_BYTE *)(v4 + 31) = self->_messageIsForward;
  *(_QWORD *)(v4 + 64) |= 0x4000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_16;
    goto LABEL_61;
  }
LABEL_60:
  *(_BYTE *)(v4 + 32) = self->_messageIsReply;
  *(_QWORD *)(v4 + 64) |= 0x8000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_62;
  }
LABEL_61:
  *(_DWORD *)(v4 + 8) = self->_numRecipients;
  *(_QWORD *)(v4 + 64) |= 1uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_63;
  }
LABEL_62:
  *(_BYTE *)(v4 + 33) = self->_senderIsContact;
  *(_QWORD *)(v4 + 64) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_64;
  }
LABEL_63:
  *(_BYTE *)(v4 + 34) = self->_senderIsTopDirectAddressesBasedOnRespond;
  *(_QWORD *)(v4 + 64) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_20;
    goto LABEL_65;
  }
LABEL_64:
  *(_BYTE *)(v4 + 35) = self->_senderIsTopDirectAddressesBasedOnScroll;
  *(_QWORD *)(v4 + 64) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_66;
  }
LABEL_65:
  *(_BYTE *)(v4 + 36) = self->_senderIsTopDirectAddressesBasedOnSend;
  *(_QWORD *)(v4 + 64) |= 0x80000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_22;
    goto LABEL_67;
  }
LABEL_66:
  *(_BYTE *)(v4 + 37) = self->_senderIsTopDirectAddressesBasedOnView;
  *(_QWORD *)(v4 + 64) |= 0x100000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_23;
    goto LABEL_68;
  }
LABEL_67:
  *(_BYTE *)(v4 + 38) = self->_senderIsTopIndirectAddressesBasedOnRespond;
  *(_QWORD *)(v4 + 64) |= 0x200000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_24;
    goto LABEL_69;
  }
LABEL_68:
  *(_BYTE *)(v4 + 39) = self->_senderIsTopIndirectAddressesBasedOnScroll;
  *(_QWORD *)(v4 + 64) |= 0x400000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_25;
    goto LABEL_70;
  }
LABEL_69:
  *(_BYTE *)(v4 + 40) = self->_senderIsTopIndirectAddressesBasedOnSend;
  *(_QWORD *)(v4 + 64) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_26;
    goto LABEL_71;
  }
LABEL_70:
  *(_BYTE *)(v4 + 41) = self->_senderIsTopIndirectAddressesBasedOnView;
  *(_QWORD *)(v4 + 64) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_27;
    goto LABEL_72;
  }
LABEL_71:
  *(_BYTE *)(v4 + 42) = self->_senderIsVip;
  *(_QWORD *)(v4 + 64) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_28;
    goto LABEL_73;
  }
LABEL_72:
  *(_BYTE *)(v4 + 43) = self->_subjectIsTopWordsBasedOnRespond;
  *(_QWORD *)(v4 + 64) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_29;
    goto LABEL_74;
  }
LABEL_73:
  *(_BYTE *)(v4 + 44) = self->_subjectIsTopWordsBasedOnScroll;
  *(_QWORD *)(v4 + 64) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_30;
    goto LABEL_75;
  }
LABEL_74:
  *(_BYTE *)(v4 + 45) = self->_subjectIsTopWordsBasedOnSend;
  *(_QWORD *)(v4 + 64) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_31;
    goto LABEL_76;
  }
LABEL_75:
  *(_BYTE *)(v4 + 46) = self->_subjectIsTopWordsBasedOnView;
  *(_QWORD *)(v4 + 64) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_32;
    goto LABEL_77;
  }
LABEL_76:
  *(_DWORD *)(v4 + 12) = self->_timeReceived;
  *(_QWORD *)(v4 + 64) |= 2uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_33;
    goto LABEL_78;
  }
LABEL_77:
  *(_BYTE *)(v4 + 47) = self->_toContainsContact;
  *(_QWORD *)(v4 + 64) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_34;
    goto LABEL_79;
  }
LABEL_78:
  *(_BYTE *)(v4 + 48) = self->_toIsTopDirectAddressesBasedOnRespond;
  *(_QWORD *)(v4 + 64) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_35;
    goto LABEL_80;
  }
LABEL_79:
  *(_BYTE *)(v4 + 49) = self->_toIsTopDirectAddressesBasedOnScroll;
  *(_QWORD *)(v4 + 64) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_36;
    goto LABEL_81;
  }
LABEL_80:
  *(_BYTE *)(v4 + 50) = self->_toIsTopDirectAddressesBasedOnSend;
  *(_QWORD *)(v4 + 64) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_36:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_37;
    goto LABEL_82;
  }
LABEL_81:
  *(_BYTE *)(v4 + 51) = self->_toIsTopDirectAddressesBasedOnView;
  *(_QWORD *)(v4 + 64) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_37:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_38;
    goto LABEL_83;
  }
LABEL_82:
  *(_BYTE *)(v4 + 52) = self->_toIsTopIndirectAddressesBasedOnRespond;
  *(_QWORD *)(v4 + 64) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_38:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_39;
    goto LABEL_84;
  }
LABEL_83:
  *(_BYTE *)(v4 + 53) = self->_toIsTopIndirectAddressesBasedOnScroll;
  *(_QWORD *)(v4 + 64) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_39:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_40;
    goto LABEL_85;
  }
LABEL_84:
  *(_BYTE *)(v4 + 54) = self->_toIsTopIndirectAddressesBasedOnSend;
  *(_QWORD *)(v4 + 64) |= 0x2000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_40:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_41;
    goto LABEL_86;
  }
LABEL_85:
  *(_BYTE *)(v4 + 55) = self->_toIsTopIndirectAddressesBasedOnView;
  *(_QWORD *)(v4 + 64) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_42;
    goto LABEL_87;
  }
LABEL_86:
  *(_BYTE *)(v4 + 56) = self->_toIsVip;
  *(_QWORD *)(v4 + 64) |= 0x8000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_42:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_43;
    goto LABEL_88;
  }
LABEL_87:
  *(_BYTE *)(v4 + 57) = self->_userIsBcc;
  *(_QWORD *)(v4 + 64) |= 0x10000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_43:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_44;
LABEL_89:
    *(_BYTE *)(v4 + 59) = self->_userIsSender;
    *(_QWORD *)(v4 + 64) |= 0x40000000000uLL;
    if ((*(_QWORD *)&self->_has & 0x80000000000) == 0)
      goto LABEL_46;
    goto LABEL_45;
  }
LABEL_88:
  *(_BYTE *)(v4 + 58) = self->_userIsCc;
  *(_QWORD *)(v4 + 64) |= 0x20000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
    goto LABEL_89;
LABEL_44:
  if ((*(_QWORD *)&has & 0x80000000000) != 0)
  {
LABEL_45:
    *(_BYTE *)(v4 + 60) = self->_userIsTo;
    *(_QWORD *)(v4 + 64) |= 0x80000000000uLL;
  }
LABEL_46:
  v6 = (id)v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $97E03A411929B79E081860F9A198F5DE has;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_344;
  has = self->_has;
  v6 = *((_QWORD *)v4 + 8);
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_unknownFeatureCount != *((_DWORD *)v4 + 4))
      goto LABEL_344;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0)
      goto LABEL_344;
    if (self->_ccContainsContact)
    {
      if (!*((_BYTE *)v4 + 20))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 20))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0)
      goto LABEL_344;
    if (self->_ccIsTopDirectAddressesBasedOnRespond)
    {
      if (!*((_BYTE *)v4 + 21))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 21))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0)
      goto LABEL_344;
    if (self->_ccIsTopDirectAddressesBasedOnScroll)
    {
      if (!*((_BYTE *)v4 + 22))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 22))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0)
      goto LABEL_344;
    if (self->_ccIsTopDirectAddressesBasedOnSend)
    {
      if (!*((_BYTE *)v4 + 23))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 23))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0)
      goto LABEL_344;
    if (self->_ccIsTopDirectAddressesBasedOnView)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0)
      goto LABEL_344;
    if (self->_ccIsTopIndirectAddressesBasedOnRespond)
    {
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 25))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0)
      goto LABEL_344;
    if (self->_ccIsTopIndirectAddressesBasedOnScroll)
    {
      if (!*((_BYTE *)v4 + 26))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 26))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0)
      goto LABEL_344;
    if (self->_ccIsTopIndirectAddressesBasedOnSend)
    {
      if (!*((_BYTE *)v4 + 27))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 27))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0)
      goto LABEL_344;
    if (self->_ccIsTopIndirectAddressesBasedOnView)
    {
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 28))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0)
      goto LABEL_344;
    if (self->_ccIsVip)
    {
      if (!*((_BYTE *)v4 + 29))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 29))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0)
      goto LABEL_344;
    if (self->_fromListId)
    {
      if (!*((_BYTE *)v4 + 30))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 30))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0)
      goto LABEL_344;
    if (self->_messageIsForward)
    {
      if (!*((_BYTE *)v4 + 31))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 31))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0)
      goto LABEL_344;
    if (self->_messageIsReply)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_numRecipients != *((_DWORD *)v4 + 2))
      goto LABEL_344;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0)
      goto LABEL_344;
    if (self->_senderIsContact)
    {
      if (!*((_BYTE *)v4 + 33))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 33))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0)
      goto LABEL_344;
    if (self->_senderIsTopDirectAddressesBasedOnRespond)
    {
      if (!*((_BYTE *)v4 + 34))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 34))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0)
      goto LABEL_344;
    if (self->_senderIsTopDirectAddressesBasedOnScroll)
    {
      if (!*((_BYTE *)v4 + 35))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 35))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0)
      goto LABEL_344;
    if (self->_senderIsTopDirectAddressesBasedOnSend)
    {
      if (!*((_BYTE *)v4 + 36))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 36))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0)
      goto LABEL_344;
    if (self->_senderIsTopDirectAddressesBasedOnView)
    {
      if (!*((_BYTE *)v4 + 37))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 37))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0)
      goto LABEL_344;
    if (self->_senderIsTopIndirectAddressesBasedOnRespond)
    {
      if (!*((_BYTE *)v4 + 38))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 38))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0)
      goto LABEL_344;
    if (self->_senderIsTopIndirectAddressesBasedOnScroll)
    {
      if (!*((_BYTE *)v4 + 39))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 39))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0)
      goto LABEL_344;
    if (self->_senderIsTopIndirectAddressesBasedOnSend)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0)
      goto LABEL_344;
    if (self->_senderIsTopIndirectAddressesBasedOnView)
    {
      if (!*((_BYTE *)v4 + 41))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 41))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0)
      goto LABEL_344;
    if (self->_senderIsVip)
    {
      if (!*((_BYTE *)v4 + 42))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 42))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0)
      goto LABEL_344;
    if (self->_subjectIsTopWordsBasedOnRespond)
    {
      if (!*((_BYTE *)v4 + 43))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 43))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0)
      goto LABEL_344;
    if (self->_subjectIsTopWordsBasedOnScroll)
    {
      if (!*((_BYTE *)v4 + 44))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 44))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0)
      goto LABEL_344;
    if (self->_subjectIsTopWordsBasedOnSend)
    {
      if (!*((_BYTE *)v4 + 45))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 45))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x10000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v6 & 0x20000000) == 0)
      goto LABEL_344;
    if (self->_subjectIsTopWordsBasedOnView)
    {
      if (!*((_BYTE *)v4 + 46))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 46))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x20000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_timeReceived != *((_DWORD *)v4 + 3))
      goto LABEL_344;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v6 & 0x40000000) == 0)
      goto LABEL_344;
    if (self->_toContainsContact)
    {
      if (!*((_BYTE *)v4 + 47))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 47))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x40000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v6 & 0x80000000) == 0)
      goto LABEL_344;
    if (self->_toIsTopDirectAddressesBasedOnRespond)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x80000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    if ((v6 & 0x100000000) == 0)
      goto LABEL_344;
    if (self->_toIsTopDirectAddressesBasedOnScroll)
    {
      if (!*((_BYTE *)v4 + 49))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 49))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x100000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    if ((v6 & 0x200000000) == 0)
      goto LABEL_344;
    if (self->_toIsTopDirectAddressesBasedOnSend)
    {
      if (!*((_BYTE *)v4 + 50))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 50))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x200000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
    if ((v6 & 0x400000000) == 0)
      goto LABEL_344;
    if (self->_toIsTopDirectAddressesBasedOnView)
    {
      if (!*((_BYTE *)v4 + 51))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 51))
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x400000000) != 0)
  {
    goto LABEL_344;
  }
  v7 = *((_QWORD *)v4 + 8);
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
    if ((v7 & 0x800000000) == 0)
      goto LABEL_344;
    if (self->_toIsTopIndirectAddressesBasedOnRespond)
    {
      if (!*((_BYTE *)v4 + 52))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 52))
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x800000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
    if ((v7 & 0x1000000000) == 0)
      goto LABEL_344;
    if (self->_toIsTopIndirectAddressesBasedOnScroll)
    {
      if (!*((_BYTE *)v4 + 53))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 53))
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x1000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x2000000000) != 0)
  {
    if ((v7 & 0x2000000000) == 0)
      goto LABEL_344;
    if (self->_toIsTopIndirectAddressesBasedOnSend)
    {
      if (!*((_BYTE *)v4 + 54))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 54))
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x2000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
    if ((v7 & 0x4000000000) == 0)
      goto LABEL_344;
    if (self->_toIsTopIndirectAddressesBasedOnView)
    {
      if (!*((_BYTE *)v4 + 55))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 55))
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x4000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x8000000000) != 0)
  {
    if ((v7 & 0x8000000000) == 0)
      goto LABEL_344;
    if (self->_toIsVip)
    {
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 56))
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x8000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
    if ((v7 & 0x10000000000) == 0)
      goto LABEL_344;
    if (self->_userIsBcc)
    {
      if (!*((_BYTE *)v4 + 57))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 57))
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x10000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
    if ((v7 & 0x20000000000) == 0)
      goto LABEL_344;
    if (self->_userIsCc)
    {
      if (!*((_BYTE *)v4 + 58))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 58))
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x20000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
  {
    if ((v7 & 0x40000000000) == 0)
      goto LABEL_344;
    if (self->_userIsSender)
    {
      if (!*((_BYTE *)v4 + 59))
        goto LABEL_344;
    }
    else if (*((_BYTE *)v4 + 59))
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x40000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x80000000000) != 0)
  {
    if ((v7 & 0x80000000000) != 0)
    {
      if (self->_userIsTo)
      {
        if (*((_BYTE *)v4 + 60))
        {
LABEL_342:
          v8 = 1;
          goto LABEL_345;
        }
      }
      else if (!*((_BYTE *)v4 + 60))
      {
        goto LABEL_342;
      }
    }
LABEL_344:
    v8 = 0;
    goto LABEL_345;
  }
  v8 = (v7 & 0x80000000000) == 0;
LABEL_345:

  return v8;
}

- (unint64_t)hash
{
  $97E03A411929B79E081860F9A198F5DE has;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    v47 = 2654435761 * self->_unknownFeatureCount;
    if ((*(_BYTE *)&has & 8) != 0)
    {
LABEL_3:
      v46 = 2654435761 * self->_ccContainsContact;
      if ((*(_BYTE *)&has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_48;
    }
  }
  else
  {
    v47 = 0;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_3;
  }
  v46 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_4:
    v45 = 2654435761 * self->_ccIsTopDirectAddressesBasedOnRespond;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_49;
  }
LABEL_48:
  v45 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_5:
    v44 = 2654435761 * self->_ccIsTopDirectAddressesBasedOnScroll;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_6;
    goto LABEL_50;
  }
LABEL_49:
  v44 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_6:
    v43 = 2654435761 * self->_ccIsTopDirectAddressesBasedOnSend;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_7;
    goto LABEL_51;
  }
LABEL_50:
  v43 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_7:
    v42 = 2654435761 * self->_ccIsTopDirectAddressesBasedOnView;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_8;
    goto LABEL_52;
  }
LABEL_51:
  v42 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_8:
    v41 = 2654435761 * self->_ccIsTopIndirectAddressesBasedOnRespond;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_9;
    goto LABEL_53;
  }
LABEL_52:
  v41 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_9:
    v40 = 2654435761 * self->_ccIsTopIndirectAddressesBasedOnScroll;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_10;
    goto LABEL_54;
  }
LABEL_53:
  v40 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_10:
    v39 = 2654435761 * self->_ccIsTopIndirectAddressesBasedOnSend;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_11;
    goto LABEL_55;
  }
LABEL_54:
  v39 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_11:
    v38 = 2654435761 * self->_ccIsTopIndirectAddressesBasedOnView;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_12;
    goto LABEL_56;
  }
LABEL_55:
  v38 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_12:
    v37 = 2654435761 * self->_ccIsVip;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_13;
    goto LABEL_57;
  }
LABEL_56:
  v37 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_13:
    v36 = 2654435761 * self->_fromListId;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_14;
    goto LABEL_58;
  }
LABEL_57:
  v36 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_14:
    v35 = 2654435761 * self->_messageIsForward;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_15;
    goto LABEL_59;
  }
LABEL_58:
  v35 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_15:
    v34 = 2654435761 * self->_messageIsReply;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_16;
    goto LABEL_60;
  }
LABEL_59:
  v34 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_16:
    v33 = 2654435761 * self->_numRecipients;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_17;
    goto LABEL_61;
  }
LABEL_60:
  v33 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_17:
    v32 = 2654435761 * self->_senderIsContact;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_18;
    goto LABEL_62;
  }
LABEL_61:
  v32 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_18:
    v31 = 2654435761 * self->_senderIsTopDirectAddressesBasedOnRespond;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_19;
    goto LABEL_63;
  }
LABEL_62:
  v31 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_19:
    v30 = 2654435761 * self->_senderIsTopDirectAddressesBasedOnScroll;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_20;
    goto LABEL_64;
  }
LABEL_63:
  v30 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_20:
    v3 = 2654435761 * self->_senderIsTopDirectAddressesBasedOnSend;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_21;
    goto LABEL_65;
  }
LABEL_64:
  v3 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_21:
    v4 = 2654435761 * self->_senderIsTopDirectAddressesBasedOnView;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_22;
    goto LABEL_66;
  }
LABEL_65:
  v4 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_22:
    v5 = 2654435761 * self->_senderIsTopIndirectAddressesBasedOnRespond;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_23;
    goto LABEL_67;
  }
LABEL_66:
  v5 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_23:
    v6 = 2654435761 * self->_senderIsTopIndirectAddressesBasedOnScroll;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_24;
    goto LABEL_68;
  }
LABEL_67:
  v6 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_24:
    v7 = 2654435761 * self->_senderIsTopIndirectAddressesBasedOnSend;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_25;
    goto LABEL_69;
  }
LABEL_68:
  v7 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_25:
    v8 = 2654435761 * self->_senderIsTopIndirectAddressesBasedOnView;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_26;
    goto LABEL_70;
  }
LABEL_69:
  v8 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_26:
    v9 = 2654435761 * self->_senderIsVip;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_27;
    goto LABEL_71;
  }
LABEL_70:
  v9 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_27:
    v10 = 2654435761 * self->_subjectIsTopWordsBasedOnRespond;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_28;
    goto LABEL_72;
  }
LABEL_71:
  v10 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_28:
    v11 = 2654435761 * self->_subjectIsTopWordsBasedOnScroll;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_29;
    goto LABEL_73;
  }
LABEL_72:
  v11 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_29:
    v12 = 2654435761 * self->_subjectIsTopWordsBasedOnSend;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_30;
    goto LABEL_74;
  }
LABEL_73:
  v12 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_30:
    v13 = 2654435761 * self->_subjectIsTopWordsBasedOnView;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_31;
    goto LABEL_75;
  }
LABEL_74:
  v13 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_31:
    v14 = 2654435761 * self->_timeReceived;
    if ((*(_DWORD *)&has & 0x40000000) != 0)
      goto LABEL_32;
    goto LABEL_76;
  }
LABEL_75:
  v14 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_32:
    v15 = 2654435761 * self->_toContainsContact;
    if ((*(_DWORD *)&has & 0x80000000) != 0)
      goto LABEL_33;
    goto LABEL_77;
  }
LABEL_76:
  v15 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_33:
    v16 = 2654435761 * self->_toIsTopDirectAddressesBasedOnRespond;
    if ((*(_QWORD *)&has & 0x100000000) != 0)
      goto LABEL_34;
    goto LABEL_78;
  }
LABEL_77:
  v16 = 0;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
LABEL_34:
    v17 = 2654435761 * self->_toIsTopDirectAddressesBasedOnScroll;
    if ((*(_QWORD *)&has & 0x200000000) != 0)
      goto LABEL_35;
    goto LABEL_79;
  }
LABEL_78:
  v17 = 0;
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
LABEL_35:
    v18 = 2654435761 * self->_toIsTopDirectAddressesBasedOnSend;
    if ((*(_QWORD *)&has & 0x400000000) != 0)
      goto LABEL_36;
    goto LABEL_80;
  }
LABEL_79:
  v18 = 0;
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
LABEL_36:
    v19 = 2654435761 * self->_toIsTopDirectAddressesBasedOnView;
    if ((*(_QWORD *)&has & 0x800000000) != 0)
      goto LABEL_37;
    goto LABEL_81;
  }
LABEL_80:
  v19 = 0;
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
LABEL_37:
    v20 = 2654435761 * self->_toIsTopIndirectAddressesBasedOnRespond;
    if ((*(_QWORD *)&has & 0x1000000000) != 0)
      goto LABEL_38;
    goto LABEL_82;
  }
LABEL_81:
  v20 = 0;
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
LABEL_38:
    v21 = 2654435761 * self->_toIsTopIndirectAddressesBasedOnScroll;
    if ((*(_QWORD *)&has & 0x2000000000) != 0)
      goto LABEL_39;
    goto LABEL_83;
  }
LABEL_82:
  v21 = 0;
  if ((*(_QWORD *)&has & 0x2000000000) != 0)
  {
LABEL_39:
    v22 = 2654435761 * self->_toIsTopIndirectAddressesBasedOnSend;
    if ((*(_QWORD *)&has & 0x4000000000) != 0)
      goto LABEL_40;
    goto LABEL_84;
  }
LABEL_83:
  v22 = 0;
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
LABEL_40:
    v23 = 2654435761 * self->_toIsTopIndirectAddressesBasedOnView;
    if ((*(_QWORD *)&has & 0x8000000000) != 0)
      goto LABEL_41;
    goto LABEL_85;
  }
LABEL_84:
  v23 = 0;
  if ((*(_QWORD *)&has & 0x8000000000) != 0)
  {
LABEL_41:
    v24 = 2654435761 * self->_toIsVip;
    if ((*(_QWORD *)&has & 0x10000000000) != 0)
      goto LABEL_42;
    goto LABEL_86;
  }
LABEL_85:
  v24 = 0;
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
LABEL_42:
    v25 = 2654435761 * self->_userIsBcc;
    if ((*(_QWORD *)&has & 0x20000000000) != 0)
      goto LABEL_43;
    goto LABEL_87;
  }
LABEL_86:
  v25 = 0;
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
LABEL_43:
    v26 = 2654435761 * self->_userIsCc;
    if ((*(_QWORD *)&has & 0x40000000000) != 0)
      goto LABEL_44;
LABEL_88:
    v27 = 0;
    if ((*(_QWORD *)&has & 0x80000000000) != 0)
      goto LABEL_45;
LABEL_89:
    v28 = 0;
    return v46 ^ v47 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_87:
  v26 = 0;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
    goto LABEL_88;
LABEL_44:
  v27 = 2654435761 * self->_userIsSender;
  if ((*(_QWORD *)&has & 0x80000000000) == 0)
    goto LABEL_89;
LABEL_45:
  v28 = 2654435761 * self->_userIsTo;
  return v46 ^ v47 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 4) != 0)
  {
    self->_unknownFeatureCount = *((_DWORD *)v4 + 4);
    *(_QWORD *)&self->_has |= 4uLL;
    v5 = *((_QWORD *)v4 + 8);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_49;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_ccContainsContact = *((_BYTE *)v4 + 20);
  *(_QWORD *)&self->_has |= 8uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_50;
  }
LABEL_49:
  self->_ccIsTopDirectAddressesBasedOnRespond = *((_BYTE *)v4 + 21);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_51;
  }
LABEL_50:
  self->_ccIsTopDirectAddressesBasedOnScroll = *((_BYTE *)v4 + 22);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_52;
  }
LABEL_51:
  self->_ccIsTopDirectAddressesBasedOnSend = *((_BYTE *)v4 + 23);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x80) == 0)
  {
LABEL_7:
    if ((v5 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_53;
  }
LABEL_52:
  self->_ccIsTopDirectAddressesBasedOnView = *((_BYTE *)v4 + 24);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x100) == 0)
  {
LABEL_8:
    if ((v5 & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_54;
  }
LABEL_53:
  self->_ccIsTopIndirectAddressesBasedOnRespond = *((_BYTE *)v4 + 25);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x200) == 0)
  {
LABEL_9:
    if ((v5 & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_55;
  }
LABEL_54:
  self->_ccIsTopIndirectAddressesBasedOnScroll = *((_BYTE *)v4 + 26);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x400) == 0)
  {
LABEL_10:
    if ((v5 & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_56;
  }
LABEL_55:
  self->_ccIsTopIndirectAddressesBasedOnSend = *((_BYTE *)v4 + 27);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x800) == 0)
  {
LABEL_11:
    if ((v5 & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_57;
  }
LABEL_56:
  self->_ccIsTopIndirectAddressesBasedOnView = *((_BYTE *)v4 + 28);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x1000) == 0)
  {
LABEL_12:
    if ((v5 & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_58;
  }
LABEL_57:
  self->_ccIsVip = *((_BYTE *)v4 + 29);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x2000) == 0)
  {
LABEL_13:
    if ((v5 & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_59;
  }
LABEL_58:
  self->_fromListId = *((_BYTE *)v4 + 30);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x4000) == 0)
  {
LABEL_14:
    if ((v5 & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_60;
  }
LABEL_59:
  self->_messageIsForward = *((_BYTE *)v4 + 31);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x8000) == 0)
  {
LABEL_15:
    if ((v5 & 1) == 0)
      goto LABEL_16;
    goto LABEL_61;
  }
LABEL_60:
  self->_messageIsReply = *((_BYTE *)v4 + 32);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 1) == 0)
  {
LABEL_16:
    if ((v5 & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_62;
  }
LABEL_61:
  self->_numRecipients = *((_DWORD *)v4 + 2);
  *(_QWORD *)&self->_has |= 1uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x10000) == 0)
  {
LABEL_17:
    if ((v5 & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_63;
  }
LABEL_62:
  self->_senderIsContact = *((_BYTE *)v4 + 33);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x20000) == 0)
  {
LABEL_18:
    if ((v5 & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_64;
  }
LABEL_63:
  self->_senderIsTopDirectAddressesBasedOnRespond = *((_BYTE *)v4 + 34);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x40000) == 0)
  {
LABEL_19:
    if ((v5 & 0x80000) == 0)
      goto LABEL_20;
    goto LABEL_65;
  }
LABEL_64:
  self->_senderIsTopDirectAddressesBasedOnScroll = *((_BYTE *)v4 + 35);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x80000) == 0)
  {
LABEL_20:
    if ((v5 & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_66;
  }
LABEL_65:
  self->_senderIsTopDirectAddressesBasedOnSend = *((_BYTE *)v4 + 36);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x100000) == 0)
  {
LABEL_21:
    if ((v5 & 0x200000) == 0)
      goto LABEL_22;
    goto LABEL_67;
  }
LABEL_66:
  self->_senderIsTopDirectAddressesBasedOnView = *((_BYTE *)v4 + 37);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x200000) == 0)
  {
LABEL_22:
    if ((v5 & 0x400000) == 0)
      goto LABEL_23;
    goto LABEL_68;
  }
LABEL_67:
  self->_senderIsTopIndirectAddressesBasedOnRespond = *((_BYTE *)v4 + 38);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x400000) == 0)
  {
LABEL_23:
    if ((v5 & 0x800000) == 0)
      goto LABEL_24;
    goto LABEL_69;
  }
LABEL_68:
  self->_senderIsTopIndirectAddressesBasedOnScroll = *((_BYTE *)v4 + 39);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x800000) == 0)
  {
LABEL_24:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_25;
    goto LABEL_70;
  }
LABEL_69:
  self->_senderIsTopIndirectAddressesBasedOnSend = *((_BYTE *)v4 + 40);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_25:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_26;
    goto LABEL_71;
  }
LABEL_70:
  self->_senderIsTopIndirectAddressesBasedOnView = *((_BYTE *)v4 + 41);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_26:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_27;
    goto LABEL_72;
  }
LABEL_71:
  self->_senderIsVip = *((_BYTE *)v4 + 42);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_27:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_28;
    goto LABEL_73;
  }
LABEL_72:
  self->_subjectIsTopWordsBasedOnRespond = *((_BYTE *)v4 + 43);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_28:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_29;
    goto LABEL_74;
  }
LABEL_73:
  self->_subjectIsTopWordsBasedOnScroll = *((_BYTE *)v4 + 44);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_29:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_30;
    goto LABEL_75;
  }
LABEL_74:
  self->_subjectIsTopWordsBasedOnSend = *((_BYTE *)v4 + 45);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_30:
    if ((v5 & 2) == 0)
      goto LABEL_31;
    goto LABEL_76;
  }
LABEL_75:
  self->_subjectIsTopWordsBasedOnView = *((_BYTE *)v4 + 46);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 2) == 0)
  {
LABEL_31:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_32;
    goto LABEL_77;
  }
LABEL_76:
  self->_timeReceived = *((_DWORD *)v4 + 3);
  *(_QWORD *)&self->_has |= 2uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_32:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_33;
    goto LABEL_78;
  }
LABEL_77:
  self->_toContainsContact = *((_BYTE *)v4 + 47);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_33:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_34;
    goto LABEL_79;
  }
LABEL_78:
  self->_toIsTopDirectAddressesBasedOnRespond = *((_BYTE *)v4 + 48);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_34:
    if ((v5 & 0x200000000) == 0)
      goto LABEL_35;
    goto LABEL_80;
  }
LABEL_79:
  self->_toIsTopDirectAddressesBasedOnScroll = *((_BYTE *)v4 + 49);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_35:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_36;
    goto LABEL_81;
  }
LABEL_80:
  self->_toIsTopDirectAddressesBasedOnSend = *((_BYTE *)v4 + 50);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_36:
    if ((v5 & 0x800000000) == 0)
      goto LABEL_37;
    goto LABEL_82;
  }
LABEL_81:
  self->_toIsTopDirectAddressesBasedOnView = *((_BYTE *)v4 + 51);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_37:
    if ((v5 & 0x1000000000) == 0)
      goto LABEL_38;
    goto LABEL_83;
  }
LABEL_82:
  self->_toIsTopIndirectAddressesBasedOnRespond = *((_BYTE *)v4 + 52);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_38:
    if ((v5 & 0x2000000000) == 0)
      goto LABEL_39;
    goto LABEL_84;
  }
LABEL_83:
  self->_toIsTopIndirectAddressesBasedOnScroll = *((_BYTE *)v4 + 53);
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x2000000000) == 0)
  {
LABEL_39:
    if ((v5 & 0x4000000000) == 0)
      goto LABEL_40;
    goto LABEL_85;
  }
LABEL_84:
  self->_toIsTopIndirectAddressesBasedOnSend = *((_BYTE *)v4 + 54);
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_40:
    if ((v5 & 0x8000000000) == 0)
      goto LABEL_41;
    goto LABEL_86;
  }
LABEL_85:
  self->_toIsTopIndirectAddressesBasedOnView = *((_BYTE *)v4 + 55);
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x8000000000) == 0)
  {
LABEL_41:
    if ((v5 & 0x10000000000) == 0)
      goto LABEL_42;
    goto LABEL_87;
  }
LABEL_86:
  self->_toIsVip = *((_BYTE *)v4 + 56);
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x10000000000) == 0)
  {
LABEL_42:
    if ((v5 & 0x20000000000) == 0)
      goto LABEL_43;
    goto LABEL_88;
  }
LABEL_87:
  self->_userIsBcc = *((_BYTE *)v4 + 57);
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x20000000000) == 0)
  {
LABEL_43:
    if ((v5 & 0x40000000000) == 0)
      goto LABEL_44;
LABEL_89:
    self->_userIsSender = *((_BYTE *)v4 + 59);
    *(_QWORD *)&self->_has |= 0x40000000000uLL;
    if ((*((_QWORD *)v4 + 8) & 0x80000000000) == 0)
      goto LABEL_46;
    goto LABEL_45;
  }
LABEL_88:
  self->_userIsCc = *((_BYTE *)v4 + 58);
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  v5 = *((_QWORD *)v4 + 8);
  if ((v5 & 0x40000000000) != 0)
    goto LABEL_89;
LABEL_44:
  if ((v5 & 0x80000000000) != 0)
  {
LABEL_45:
    self->_userIsTo = *((_BYTE *)v4 + 60);
    *(_QWORD *)&self->_has |= 0x80000000000uLL;
  }
LABEL_46:

}

- (unsigned)unknownFeatureCount
{
  return self->_unknownFeatureCount;
}

- (BOOL)ccContainsContact
{
  return self->_ccContainsContact;
}

- (BOOL)ccIsTopDirectAddressesBasedOnRespond
{
  return self->_ccIsTopDirectAddressesBasedOnRespond;
}

- (BOOL)ccIsTopDirectAddressesBasedOnScroll
{
  return self->_ccIsTopDirectAddressesBasedOnScroll;
}

- (BOOL)ccIsTopDirectAddressesBasedOnSend
{
  return self->_ccIsTopDirectAddressesBasedOnSend;
}

- (BOOL)ccIsTopDirectAddressesBasedOnView
{
  return self->_ccIsTopDirectAddressesBasedOnView;
}

- (BOOL)ccIsTopIndirectAddressesBasedOnRespond
{
  return self->_ccIsTopIndirectAddressesBasedOnRespond;
}

- (BOOL)ccIsTopIndirectAddressesBasedOnScroll
{
  return self->_ccIsTopIndirectAddressesBasedOnScroll;
}

- (BOOL)ccIsTopIndirectAddressesBasedOnSend
{
  return self->_ccIsTopIndirectAddressesBasedOnSend;
}

- (BOOL)ccIsTopIndirectAddressesBasedOnView
{
  return self->_ccIsTopIndirectAddressesBasedOnView;
}

- (BOOL)ccIsVip
{
  return self->_ccIsVip;
}

- (BOOL)fromListId
{
  return self->_fromListId;
}

- (BOOL)messageIsForward
{
  return self->_messageIsForward;
}

- (BOOL)messageIsReply
{
  return self->_messageIsReply;
}

- (unsigned)numRecipients
{
  return self->_numRecipients;
}

- (BOOL)senderIsContact
{
  return self->_senderIsContact;
}

- (BOOL)senderIsTopDirectAddressesBasedOnRespond
{
  return self->_senderIsTopDirectAddressesBasedOnRespond;
}

- (BOOL)senderIsTopDirectAddressesBasedOnScroll
{
  return self->_senderIsTopDirectAddressesBasedOnScroll;
}

- (BOOL)senderIsTopDirectAddressesBasedOnSend
{
  return self->_senderIsTopDirectAddressesBasedOnSend;
}

- (BOOL)senderIsTopDirectAddressesBasedOnView
{
  return self->_senderIsTopDirectAddressesBasedOnView;
}

- (BOOL)senderIsTopIndirectAddressesBasedOnRespond
{
  return self->_senderIsTopIndirectAddressesBasedOnRespond;
}

- (BOOL)senderIsTopIndirectAddressesBasedOnScroll
{
  return self->_senderIsTopIndirectAddressesBasedOnScroll;
}

- (BOOL)senderIsTopIndirectAddressesBasedOnSend
{
  return self->_senderIsTopIndirectAddressesBasedOnSend;
}

- (BOOL)senderIsTopIndirectAddressesBasedOnView
{
  return self->_senderIsTopIndirectAddressesBasedOnView;
}

- (BOOL)senderIsVip
{
  return self->_senderIsVip;
}

- (BOOL)subjectIsTopWordsBasedOnRespond
{
  return self->_subjectIsTopWordsBasedOnRespond;
}

- (BOOL)subjectIsTopWordsBasedOnScroll
{
  return self->_subjectIsTopWordsBasedOnScroll;
}

- (BOOL)subjectIsTopWordsBasedOnSend
{
  return self->_subjectIsTopWordsBasedOnSend;
}

- (BOOL)subjectIsTopWordsBasedOnView
{
  return self->_subjectIsTopWordsBasedOnView;
}

- (BOOL)toContainsContact
{
  return self->_toContainsContact;
}

- (BOOL)toIsTopDirectAddressesBasedOnRespond
{
  return self->_toIsTopDirectAddressesBasedOnRespond;
}

- (BOOL)toIsTopDirectAddressesBasedOnScroll
{
  return self->_toIsTopDirectAddressesBasedOnScroll;
}

- (BOOL)toIsTopDirectAddressesBasedOnSend
{
  return self->_toIsTopDirectAddressesBasedOnSend;
}

- (BOOL)toIsTopDirectAddressesBasedOnView
{
  return self->_toIsTopDirectAddressesBasedOnView;
}

- (BOOL)toIsTopIndirectAddressesBasedOnRespond
{
  return self->_toIsTopIndirectAddressesBasedOnRespond;
}

- (BOOL)toIsTopIndirectAddressesBasedOnScroll
{
  return self->_toIsTopIndirectAddressesBasedOnScroll;
}

- (BOOL)toIsTopIndirectAddressesBasedOnSend
{
  return self->_toIsTopIndirectAddressesBasedOnSend;
}

- (BOOL)toIsTopIndirectAddressesBasedOnView
{
  return self->_toIsTopIndirectAddressesBasedOnView;
}

- (BOOL)toIsVip
{
  return self->_toIsVip;
}

- (BOOL)userIsBcc
{
  return self->_userIsBcc;
}

- (BOOL)userIsCc
{
  return self->_userIsCc;
}

- (BOOL)userIsSender
{
  return self->_userIsSender;
}

- (BOOL)userIsTo
{
  return self->_userIsTo;
}

@end
