@implementation ABAssistantSyncAnchor

- (ABAssistantSyncAnchor)initWithSequenceNumber:(int64_t)a3 contactLegacyIdentifier:(int)a4
{
  ABAssistantSyncAnchor *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ABAssistantSyncAnchor;
  result = -[ABAssistantSyncAnchor init](&v7, sel_init);
  if (result)
  {
    result->_sequenceNumber = a3;
    result->_contactLegacyIdentifier = a4;
  }
  return result;
}

- (ABAssistantSyncAnchor)init
{
  return (ABAssistantSyncAnchor *)objc_msgSend_initWithSequenceNumber_contactLegacyIdentifier_(self, a2, -1, 0xFFFFFFFFLL);
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (int)contactLegacyIdentifier
{
  return self->_contactLegacyIdentifier;
}

+ (id)stringValueWithSequenceNumber:(int64_t)a3 contactLegacyIdentifier:(int)a4
{
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%li %d"), a3, a4);
}

+ (id)stringValueForFullSyncWithContactLegacyIdentifier:(int)a3
{
  return (id)objc_msgSend_stringValueWithSequenceNumber_contactLegacyIdentifier_(ABAssistantSyncAnchor, a2, -1, *(_QWORD *)&a3);
}

- (NSString)stringValue
{
  return (NSString *)objc_msgSend_stringValueWithSequenceNumber_contactLegacyIdentifier_(ABAssistantSyncAnchor, a2, self->_sequenceNumber, self->_contactLegacyIdentifier);
}

- (id)description
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const __CFString *v13;
  const char *v14;
  uint64_t v15;
  const __CFString *v16;
  const char *v17;
  uint64_t v18;
  const __CFString *v19;
  const char *v20;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_msgSend_sequenceNumber(self, a2, v2);
  v8 = objc_msgSend_contactLegacyIdentifier(self, v6, v7);
  if (objc_msgSend_shouldResetSync(self, v9, v10))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (objc_msgSend_shouldClearChangeHistoryForPreviouslySyncedContacts(self, v11, v12))
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  if (objc_msgSend_shouldFullSync(self, v14, v15))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  if (objc_msgSend_shouldResumePreviousFullSync(self, v17, v18))
    return (id)objc_msgSend_stringWithFormat_(v4, v20, (uint64_t)CFSTR("sequenceNumber = %li, contactLegacyIdentifier = %d, shouldResetSync = %@, shouldDeleteSyncedContacts = %@, shouldFullSync = %@, shouldResumePreviousFullSync = %@"), v5, v8, v13, v16, v19, CFSTR("YES"));
  else
    return (id)objc_msgSend_stringWithFormat_(v4, v20, (uint64_t)CFSTR("sequenceNumber = %li, contactLegacyIdentifier = %d, shouldResetSync = %@, shouldDeleteSyncedContacts = %@, shouldFullSync = %@, shouldResumePreviousFullSync = %@"), v5, v8, v13, v16, v19, CFSTR("NO"));
}

- (id)shortDescription
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_msgSend_sequenceNumber(self, a2, v2);
  v8 = objc_msgSend_contactLegacyIdentifier(self, v6, v7);
  return (id)objc_msgSend_stringWithFormat_(v4, v9, (uint64_t)CFSTR("sequenceNumber = %li, contactLegacyIdentifier = %d"), v5, v8);
}

- (BOOL)shouldResetSync
{
  return self->_sequenceNumber == -1 && self->_contactLegacyIdentifier == -1;
}

- (BOOL)shouldFullSync
{
  return self->_sequenceNumber == -1;
}

- (BOOL)shouldResumePreviousFullSync
{
  return self->_sequenceNumber == -1 && self->_contactLegacyIdentifier > 0;
}

- (BOOL)shouldClearChangeHistoryForPreviouslySyncedContacts
{
  return self->_sequenceNumber > 0;
}

+ (id)anchorWithString:(id)a3 forContactStore:(id)a4
{
  id v5;
  const char *v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  int v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  ABAssistantSyncAnchor *v26;
  const char *v27;
  ABAssistantSyncAnchor *v28;
  uint64_t v30;

  v5 = a3;
  v7 = a4;
  if (!v5)
    goto LABEL_10;
  objc_msgSend_componentsSeparatedByString_(v5, v6, (uint64_t)CFSTR(" "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v8, v9, v10) != 2)
    goto LABEL_9;
  v30 = 0;
  v12 = (void *)MEMORY[0x24BDD17A8];
  objc_msgSend_objectAtIndex_(v8, v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scannerWithString_(v12, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_scanInteger_(v15, v16, (uint64_t)&v30);

  if (!v17
    || (v20 = v30, v30 < -1)
    || v20 > (int)objc_msgSend_saveSequenceCount(v7, v18, v19)
    || (objc_msgSend_objectAtIndexedSubscript_(v8, v21, 1),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = objc_msgSend_intValue(v22, v23, v24),
        v22,
        (_DWORD)v25 == -1))
  {
LABEL_9:

LABEL_10:
    v28 = objc_alloc_init(ABAssistantSyncAnchor);
    goto LABEL_11;
  }
  v26 = [ABAssistantSyncAnchor alloc];
  v28 = (ABAssistantSyncAnchor *)objc_msgSend_initWithSequenceNumber_contactLegacyIdentifier_(v26, v27, v30, v25);

  if (!v28)
    goto LABEL_10;
LABEL_11:

  return v28;
}

- (BOOL)isOlderThanAnchor:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;

  v6 = a3;
  if (!v6)
    goto LABEL_6;
  v7 = objc_msgSend_sequenceNumber(self, v4, v5);
  if (v7 >= objc_msgSend_sequenceNumber(v6, v8, v9))
  {
    v13 = objc_msgSend_sequenceNumber(self, v10, v11);
    if (v13 == objc_msgSend_sequenceNumber(v6, v14, v15))
    {
      v18 = objc_msgSend_contactLegacyIdentifier(self, v16, v17);
      v12 = v18 < (int)objc_msgSend_contactLegacyIdentifier(v6, v19, v20);
      goto LABEL_7;
    }
LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  v12 = 1;
LABEL_7:

  return v12;
}

- (void)resetSync
{
  self->_sequenceNumber = -1;
  self->_contactLegacyIdentifier = -1;
}

@end
