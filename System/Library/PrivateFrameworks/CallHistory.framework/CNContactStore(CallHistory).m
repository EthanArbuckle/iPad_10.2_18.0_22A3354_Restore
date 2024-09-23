@implementation CNContactStore(CallHistory)

- (id)contactsByContactHandleForContactHandles:()CallHistory keyDescriptors:error:
{
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE buf[24];
  void *v28;
  uint64_t *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v10 = (void *)getCNContactFetchRequestClass_softClass;
    v26 = getCNContactFetchRequestClass_softClass;
    if (!getCNContactFetchRequestClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getCNContactFetchRequestClass_block_invoke;
      v28 = &unk_1E6746700;
      v29 = &v23;
      __getCNContactFetchRequestClass_block_invoke((uint64_t)buf);
      v10 = (void *)v24[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v23, 8);
    v12 = [v11 alloc];
    v13 = (void *)objc_msgSend(v12, "initWithKeysToFetch:", v9, v23);
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v14 = (void *)getCNContactClass_softClass;
    v26 = getCNContactClass_softClass;
    if (!getCNContactClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getCNContactClass_block_invoke;
      v28 = &unk_1E6746700;
      v29 = &v23;
      __getCNContactClass_block_invoke((uint64_t)buf);
      v14 = (void *)v24[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v23, 8);
    objc_msgSend(v15, "predicateForContactsMatchingHandleStrings:", v8, v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPredicate:", v16);

    ch_framework_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = a1;
      _os_log_impl(&dword_1B3FA4000, v17, OS_LOG_TYPE_DEFAULT, "Executing contact fetch request %@ using contact store %@", buf, 0x16u);
    }

    objc_msgSend(a1, "executeFetchRequest:error:", v13, a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ch_framework_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v19, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v21;
      _os_log_impl(&dword_1B3FA4000, v20, OS_LOG_TYPE_DEFAULT, "Contact fetch request returned %lu results", buf, 0xCu);
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end
