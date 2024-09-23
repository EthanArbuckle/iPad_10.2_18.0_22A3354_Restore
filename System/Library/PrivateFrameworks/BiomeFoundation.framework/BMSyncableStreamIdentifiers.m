@implementation BMSyncableStreamIdentifiers

void __BMSyncableStreamIdentifiers_block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v0 = (void *)objc_opt_new();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v1 = (void *)getBMStreamSyncPolicyClass_softClass;
  v14 = getBMStreamSyncPolicyClass_softClass;
  if (!getBMStreamSyncPolicyClass_softClass)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getBMStreamSyncPolicyClass_block_invoke;
    v10[3] = &unk_1E5E3C680;
    v10[4] = &v11;
    __getBMStreamSyncPolicyClass_block_invoke((uint64_t)v10);
    v1 = (void *)v12[3];
  }
  v2 = objc_retainAutorelease(v1);
  _Block_object_dispose(&v11, 8);
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("syncableStreamConfigurations.streamIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObjectsFromArray:", v3);

  +[BMAccessControlPolicy contextSyncMapping](BMAccessControlPolicy, "contextSyncMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObjectsFromArray:", v5);

  +[BMAccessControlPolicy contextSyncMapping](BMAccessControlPolicy, "contextSyncMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObjectsFromArray:", v7);

  objc_msgSend(v0, "addObject:", CFSTR("Location.Semantic"));
  v8 = objc_msgSend(v0, "copy");
  v9 = (void *)BMSyncableStreamIdentifiers_identifiers;
  BMSyncableStreamIdentifiers_identifiers = v8;

}

@end
