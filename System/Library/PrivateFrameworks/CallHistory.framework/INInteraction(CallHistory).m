@implementation INInteraction(CallHistory)

+ (id)ch_interactionForIdentifier:()CallHistory error:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("source.itemID == %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v7 = (void *)get_DKEventQueryClass_softClass;
  v29 = get_DKEventQueryClass_softClass;
  if (!get_DKEventQueryClass_softClass)
  {
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __get_DKEventQueryClass_block_invoke;
    v24 = &unk_1E6746700;
    v25 = &v26;
    __get_DKEventQueryClass_block_invoke((uint64_t)&v21);
    v7 = (void *)v27[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v26, 8);
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v9 = (void *)get_DKSystemEventStreamsClass_softClass;
  v29 = get_DKSystemEventStreamsClass_softClass;
  if (!get_DKSystemEventStreamsClass_softClass)
  {
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __get_DKSystemEventStreamsClass_block_invoke;
    v24 = &unk_1E6746700;
    v25 = &v26;
    __get_DKSystemEventStreamsClass_block_invoke((uint64_t)&v21);
    v9 = (void *)v27[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v26, 8);
  objc_msgSend(v10, "appIntentsStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v6, v12, 0, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v14 = (void *)get_DKKnowledgeStoreClass_softClass;
  v29 = get_DKKnowledgeStoreClass_softClass;
  if (!get_DKKnowledgeStoreClass_softClass)
  {
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __get_DKKnowledgeStoreClass_block_invoke;
    v24 = &unk_1E6746700;
    v25 = &v26;
    __get_DKKnowledgeStoreClass_block_invoke((uint64_t)&v21);
    v14 = (void *)v27[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v26, 8);
  objc_msgSend(v15, "knowledgeStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "executeQuery:error:", v13, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "interaction");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

@end
