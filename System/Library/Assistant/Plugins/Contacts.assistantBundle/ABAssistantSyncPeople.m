@implementation ABAssistantSyncPeople

- (ABAssistantSyncPeople)init
{
  ABAssistantSyncPeople *v2;
  ABAssistantSyncWorker *v3;
  const char *v4;
  void *v5;
  const char *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ABAssistantSyncPeople;
  v2 = -[ABAssistantSyncPeople init](&v8, sel_init);
  if (v2)
  {
    v3 = [ABAssistantSyncWorker alloc];
    v5 = (void *)objc_msgSend_initWithDelegate_(v3, v4, (uint64_t)v2);
    objc_msgSend_setSyncWorker_(v2, v6, (uint64_t)v5);

  }
  return v2;
}

- (id)expectedSyncKeyPrefix
{
  return CFSTR("com.apple.contact.people");
}

- (id)fullSyncSnapshotProperty
{
  uint64_t v2;
  void *v3;
  void *v4;
  const char *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_changeHistoryClientIdentifier(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("%@-fullSyncSequenceNumberSnapshot"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getLastClearedSyncAnchor
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  id v10;
  ABAssistantSyncAnchor *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  void *v17;
  id v19;

  objc_msgSend_contactStore(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_changeHistoryClientIdentifier(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend_latestConsumedChangeHistoryAnchorForClientIdentifier_error_(v4, v8, (uint64_t)v7, &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;

  if (v9)
  {
    v11 = [ABAssistantSyncAnchor alloc];
    v14 = objc_msgSend_sequenceNumber(v9, v12, v13);
    v16 = (void *)objc_msgSend_initWithSequenceNumber_contactLegacyIdentifier_(v11, v15, v14, 0xFFFFFFFFLL);
  }
  else
  {
    if (v10)
    {
      v17 = (void *)*MEMORY[0x24BE08FE8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_DEBUG))
        sub_216344970(v17, self);
    }
    v16 = 0;
  }

  return v16;
}

- (BOOL)verifyChangeHistory
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  char v9;

  objc_msgSend_contactStore(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_changeHistoryClientIdentifier(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_verifyChangeHistoryForClientIdentifier_error_(v4, v8, (uint64_t)v7, 0);

  return v9;
}

- (void)clearChangeHistoryToSyncAnchor:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDBAC80]);
  v8 = objc_msgSend_sequenceNumber(v4, v6, v7);
  v10 = (void *)objc_msgSend_initWithSequenceNumber_(v5, v9, v8);
  v11 = objc_alloc(MEMORY[0x24BDBAC88]);
  objc_msgSend_changeHistoryClientIdentifier(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend_initWithClientIdentifier_(v11, v15, (uint64_t)v14);

  objc_msgSend_setToChangeAnchor_(v16, v17, (uint64_t)v10);
  objc_msgSend_contactStore(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend_executeChangeHistoryClearRequest_error_(v20, v21, (uint64_t)v16, &v31);
  v22 = v31;

  if (v22)
  {
    v23 = (void *)*MEMORY[0x24BE08FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_DEBUG))
    {
      v24 = v23;
      objc_msgSend_changeHistoryClientIdentifier(self, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend_sequenceNumber(v4, v28, v29);
      *(_DWORD *)buf = 136315906;
      v33 = "-[ABAssistantSyncPeople clearChangeHistoryToSyncAnchor:]";
      v34 = 2112;
      v35 = v27;
      v36 = 2048;
      v37 = v30;
      v38 = 2112;
      v39 = v22;
      _os_log_debug_impl(&dword_21633D000, v24, OS_LOG_TYPE_DEBUG, "%s Failed to get clear change history for %@ to sequence number = %li, error = %@", buf, 0x2Au);

    }
  }

}

- (BOOL)hasContactsForFullSync
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  BOOL v8;

  objc_msgSend_contactStore(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_individualContactCountWithError_(v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_integerValue(v5, v6, v7) > 0;

  return v8;
}

- (id)contactsForFullSync
{
  id v3;
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  char Request_error_usingBlock;
  id v16;
  os_log_t *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  _QWORD v28[4];
  id v29;
  _QWORD *v30;
  id v31;
  _QWORD v32[3];
  int v33;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc(MEMORY[0x24BDBACB8]);
  objc_msgSend_descriptorsForRequiredKeysForConversionType_(MEMORY[0x24BE19118], v5, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend_initWithKeysToFetch_(v4, v7, (uint64_t)v6);

  objc_msgSend_setUnifyResults_(v8, v9, 0);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = -1;
  objc_msgSend_contactStore(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = sub_21633EC78;
  v28[3] = &unk_24D529060;
  v13 = v3;
  v29 = v13;
  v30 = v32;
  Request_error_usingBlock = objc_msgSend_enumerateContactsWithFetchRequest_error_usingBlock_(v12, v14, (uint64_t)v8, &v31, v28);
  v16 = v31;

  v17 = (os_log_t *)MEMORY[0x24BE08FE8];
  if ((Request_error_usingBlock & 1) == 0)
  {
    v18 = *MEMORY[0x24BE08FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_DEBUG))
      sub_216344A80(v18, v19, v20, v21, v22, v23, v24, v25);
  }

  if (v16 && os_log_type_enabled(*v17, OS_LOG_TYPE_DEBUG))
    sub_216344A14();
  v26 = v13;
  _Block_object_dispose(v32, 8);

  return v26;
}

- (id)copyChangeHistoryAfterSyncAnchor:(id)a3
{
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v17;

  v4 = (void *)objc_opt_new();
  objc_msgSend_setShouldUnifyResults_(v4, v5, 0);
  objc_msgSend_contactStore(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend_changeHistoryWithFetchRequest_error_(v8, v9, (uint64_t)v4, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;

  if (v11)
  {
    v14 = (void *)*MEMORY[0x24BE08FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_DEBUG))
      sub_216344B60(v14, self);
  }
  objc_msgSend_contactChanges(v10, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)newSADomainObjectFromCNContact:(id)a3
{
  objc_msgSend_createSAPersonFromCNContact_conversionType_(MEMORY[0x24BE19118], a2, (uint64_t)a3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newSADomainObjectFromCNContactWithIdentifier:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  char Request_error_usingBlock;
  id v22;
  const char *v23;
  os_log_t *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  _QWORD v29[5];
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_21633F064;
  v35 = sub_21633F074;
  v36 = 0;
  v5 = objc_alloc(MEMORY[0x24BDBACB8]);
  objc_msgSend_descriptorsForRequiredKeysForConversionType_(MEMORY[0x24BE19118], v6, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend_initWithKeysToFetch_(v5, v8, (uint64_t)v7);

  objc_msgSend_setUnifyResults_(v9, v10, 0);
  v11 = (void *)MEMORY[0x24BDBACA0];
  v37[0] = v4;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v12, (uint64_t)v37, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateForContactsWithIdentifiers_(v11, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPredicate_(v9, v16, (uint64_t)v15);

  objc_msgSend_contactStore(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = sub_21633F07C;
  v29[3] = &unk_24D529088;
  v29[4] = &v31;
  Request_error_usingBlock = objc_msgSend_enumerateContactsWithFetchRequest_error_usingBlock_(v19, v20, (uint64_t)v9, &v30, v29);
  v22 = v30;

  v24 = (os_log_t *)MEMORY[0x24BE08FE8];
  if ((Request_error_usingBlock & 1) == 0 && os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_DEBUG))
    sub_216344C90();
  if (v22)
  {
    v25 = *v24;
    if (os_log_type_enabled(*v24, OS_LOG_TYPE_DEBUG))
      sub_216344C04((uint64_t)v4, (uint64_t)v22, v25);
  }
  v26 = v32[5];
  if (v26)
    v27 = (void *)objc_msgSend_newSADomainObjectFromCNContact_(self, v23, v26);
  else
    v27 = 0;

  _Block_object_dispose(&v31, 8);
  return v27;
}

- (id)newSADomainObjectFromDeletedContactIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;

  v3 = (objc_class *)MEMORY[0x24BE814A8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend_assistantIDFromContactID_(MEMORY[0x24BE19120], v6, (uint64_t)v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setIdentifier_(v5, v8, (uint64_t)v7);
  return v5;
}

- (id)_currentSyncSnapshotProperty
{
  uint64_t v2;
  void *v3;
  void *v4;
  const char *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_changeHistoryClientIdentifier(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("%@-currentSyncAnchorSnapshot"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setCurrentSyncSnapshotAnchorString:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v4 = a3;
  objc_msgSend__currentSyncSnapshotProperty(self, v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_saveString_forKey_(ABAssistantSyncInfoPersistence, v7, (uint64_t)v4, v8);

}

- (void)resetCurrentSyncSnapshot
{
  MEMORY[0x24BEDD108](self, sel_setCurrentSyncSnapshotAnchorString_, &stru_24D529258);
}

- (id)currentSyncSnapshotAnchorString
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;

  objc_msgSend__currentSyncSnapshotProperty(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringForKey_(ABAssistantSyncInfoPersistence, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_contactStore(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_anchorWithString_forContactStore_(ABAssistantSyncAnchor, v10, (uint64_t)v6, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend_copyChangeHistoryAfterSyncAnchor_(self, v12, (uint64_t)v11);
  objc_msgSend_lastObject(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v16;
  if (v16)
  {
    objc_msgSend_changeAnchor(v16, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_sequenceNumber(v20, v21, v22);
    v26 = objc_msgSend_iOSLegacyIdentifier(v19, v24, v25);
    objc_msgSend_stringValueWithSequenceNumber_contactLegacyIdentifier_(ABAssistantSyncAnchor, v27, v23, v26);
    v28 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v28;
  }

  return v6;
}

- (int64_t)currentSyncSnapshotCount
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  int64_t v8;

  objc_msgSend_contactStore(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_individualContactCountWithError_(v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_integerValue(v5, v6, v7);

  return v8;
}

@end
