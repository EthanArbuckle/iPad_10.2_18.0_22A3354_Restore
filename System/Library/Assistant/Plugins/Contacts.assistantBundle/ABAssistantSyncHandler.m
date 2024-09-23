@implementation ABAssistantSyncHandler

- (CNContactStore)contactStore
{
  CNContactStore *contactStore;
  CNContactStore *v4;
  CNContactStore *v5;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = (CNContactStore *)objc_alloc_init(MEMORY[0x24BDBACF8]);
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (id)syncSnapshotForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v4 = a3;
  objc_msgSend_syncWorker(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_syncSnapshotForKey_(v7, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)syncVerificationKeyForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v4 = a3;
  objc_msgSend_syncWorker(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_syncVerificationKeyForKey_(v7, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend_syncWorker(self, v14, v15);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_beginSyncWithAnchor_validity_forKey_beginInfo_(v17, v16, (uint64_t)v13, v12, v11, v10);

}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend_syncWorker(self, v8, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getChangeAfterAnchor_changeInfo_(v11, v10, (uint64_t)v7, v6);

}

- (void)syncDidEnd
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_syncWorker(self, a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_syncDidEnd(v5, v3, v4);

}

- (ABAssistantSyncWorker)syncWorker
{
  return self->_syncWorker;
}

- (void)setSyncWorker:(id)a3
{
  objc_storeStrong((id *)&self->_syncWorker, a3);
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (NSString)changeHistoryClientIdentifier
{
  return self->_changeHistoryClientIdentifier;
}

- (void)setChangeHistoryClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_changeHistoryClientIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeHistoryClientIdentifier, 0);
  objc_storeStrong((id *)&self->_syncWorker, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
