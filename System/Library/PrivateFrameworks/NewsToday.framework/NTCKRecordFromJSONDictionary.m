@implementation NTCKRecordFromJSONDictionary

void __NTCKRecordFromJSONDictionary_block_invoke(id *a1, void *a2, void *a3)
{
  id *v3;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a2;
  v7 = a3;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = v6;
  v11 = v10;

  v12 = objc_msgSend(a1[5], "containsObject:", v6);
  if ((v12 & 1) != 0)
    goto LABEL_6;
  v13 = a1[5];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __NTCKRecordFromJSONDictionary_block_invoke_2;
  v18[3] = &unk_24DB5FA48;
  v3 = &v19;
  v14 = v6;
  v19 = v14;
  if ((objc_msgSend(v13, "fc_containsObjectPassingTest:", v18) & 1) != 0)
  {
LABEL_6:
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v7, 0);
    objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v15, v11);

    if ((v12 & 1) != 0)
      goto LABEL_14;
  }
  else if (objc_msgSend(a1[7], "containsObject:", v14))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "fc_dateFromStringWithISO8601Format:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v16, v11);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (v17 != v7)
      objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v7, v11);
  }

LABEL_14:
}

uint64_t __NTCKRecordFromJSONDictionary_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", a2);
}

@end
