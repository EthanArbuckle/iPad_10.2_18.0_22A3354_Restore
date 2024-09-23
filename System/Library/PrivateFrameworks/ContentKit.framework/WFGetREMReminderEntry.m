@implementation WFGetREMReminderEntry

id __WFGetREMReminderEntry_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  id *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE buf[24];
  void *v19;
  id *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WFGetWorkflowReminderStore();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.remreminder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v7 = (id)getREMObjectIDClass_softClass;
  v17 = getREMObjectIDClass_softClass;
  if (!getREMObjectIDClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getREMObjectIDClass_block_invoke;
    v19 = &unk_24C4E3118;
    v20 = &v14;
    __getREMObjectIDClass_block_invoke((uint64_t)buf);
    v7 = v15[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v8, "objectIDWithURL:", v6, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v3, "fetchReminderWithObjectID:error:", v9, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v14;
  if (!v10)
  {
    getWFContentGraphLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "WFGetREMReminderFromSerializedRepresentation";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      _os_log_impl(&dword_20BBAD000, v12, OS_LOG_TYPE_ERROR, "%s Failed to fetch reminder with error %@", buf, 0x16u);
    }

  }
  return v10;
}

id __WFGetREMReminderEntry_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  const __CFString *v12;
  const __CFString **v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v3 = (__CFString *)getREMReminderClass_softClass;
  v15 = getREMReminderClass_softClass;
  if (!getREMReminderClass_softClass)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __getREMReminderClass_block_invoke;
    v11[3] = &unk_24C4E3118;
    v11[4] = &v12;
    __getREMReminderClass_block_invoke((uint64_t)v11);
    v3 = (__CFString *)v13[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v12, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = CFSTR("link.contentkit.remreminder");
    v16 = CFSTR("objectID");
    objc_msgSend(v2, "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "urlRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
