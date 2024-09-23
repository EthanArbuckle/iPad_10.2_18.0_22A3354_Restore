@implementation UpdateItems

void __UpdateItems_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.HomeSharing", "Library");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemUptime");
    v7 = v6 - *(double *)(a1 + 88);
    *(_DWORD *)buf = 134217984;
    v18 = v7;
    _os_log_impl(&dword_20AA9E000, v4, OS_LOG_TYPE_DEFAULT, "Update fetch took %g seconds", buf, 0xCu);

  }
  v8 = *(_QWORD *)(a1 + 56);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __UpdateItems_block_invoke_69;
  v9[3] = &unk_24C3651E8;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  v15 = *(id *)(a1 + 72);
  v16 = *(id *)(a1 + 80);
  (*(void (**)(uint64_t, id, _QWORD *))(v8 + 16))(v8, v3, v9);

}

void __UpdateItems_block_invoke_69(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  const __CFArray *Mutable;
  id v13;
  NSObject *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  NSObject *v21;
  void *v22;
  double v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  const __CFArray *v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1760];
  v4 = a2;
  objc_msgSend(v3, "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemUptime");
  v7 = v6;

  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v9 = *(void **)(a1 + 32);
  v10 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __UpdateItems_block_invoke_2;
  v31[3] = &unk_24C365030;
  v11 = v8;
  v32 = v11;
  objc_msgSend(v9, "databaseConnectionAllowingWrites:withBlock:", 0, v31);
  Mutable = CFArrayCreateMutable(0, 0, 0);
  v28[0] = v10;
  v28[1] = 3221225472;
  v28[2] = __UpdateItems_block_invoke_4;
  v28[3] = &unk_24C365170;
  v13 = v11;
  v29 = v13;
  v30 = Mutable;
  +[HSResponseDataParser enumerateItemsInResponseData:usingHandler:](HSResponseDataParser, "enumerateItemsInResponseData:usingHandler:", v4, v28);

  v14 = os_log_create("com.apple.amp.HomeSharing", "Library");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "systemUptime");
    *(_DWORD *)buf = 134217984;
    v34 = v16 - v7;
    _os_log_impl(&dword_20AA9E000, v14, OS_LOG_TYPE_DEFAULT, "Diff determination took %g seconds", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "systemUptime");
  v19 = v18;

  if (objc_msgSend(v13, "count"))
  {
    v20 = *(void **)(a1 + 32);
    v25[0] = v10;
    v25[1] = 3221225472;
    v25[2] = __UpdateItems_block_invoke_73;
    v25[3] = &unk_24C3651C0;
    v26 = v13;
    v27 = *(id *)(a1 + 32);
    objc_msgSend(v20, "databaseConnectionAllowingWrites:withBlock:", 1, v25);

  }
  v21 = os_log_create("com.apple.amp.HomeSharing", "Library");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "systemUptime");
    *(_DWORD *)buf = 134217984;
    v34 = v23 - v19;
    _os_log_impl(&dword_20AA9E000, v21, OS_LOG_TYPE_DEFAULT, "Deleting old items took %g seconds", buf, 0xCu);

  }
  if (CFArrayGetCount(Mutable))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    BuildItems(*(void **)(a1 + 48), *(void **)(a1 + 32), Mutable, *(void **)(a1 + 56), *(void **)(a1 + 64), *(void **)(a1 + 72));
  }
  else
  {
    (*(void (**)(float))(*(_QWORD *)(a1 + 64) + 16))(0.7);
    v24 = *(_QWORD *)(a1 + 72);
    if (v24)
      (*(void (**)(uint64_t, _QWORD))(v24 + 16))(v24, 0);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  if (Mutable)
    CFRelease(Mutable);

}

void __UpdateItems_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "executeQuery:", CFSTR("SELECT home_sharing_id, date_modified FROM item_extra JOIN item_store USING(item_pid)"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __UpdateItems_block_invoke_3;
  v4[3] = &unk_24C365008;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "enumerateRowsWithBlock:", v4);

}

void __UpdateItems_block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  int v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id v19;

  if (a3)
  {
    v4 = 0;
    v5 = 0;
    v6 = (_QWORD *)(a2 + 16);
    do
    {
      v7 = *((_DWORD *)v6 - 4);
      if (v7 == 1634952301)
      {
        v9 = -1;
        v10 = (unsigned int *)*(v6 - 1);
        switch(*v6)
        {
          case 1:
            v9 = *(unsigned __int8 *)v10;
            break;
          case 2:
            v9 = __rev16(*(unsigned __int16 *)v10);
            break;
          case 4:
            v12 = *v10;
            goto LABEL_16;
          case 8:
            v12 = v10[1];
LABEL_16:
            v9 = bswap32(v12);
            break;
          default:
            break;
        }
        v5 = v9 - 978307200;
      }
      else if (v7 == 1835624804)
      {
        v4 = 0xFFFFFFFFLL;
        v8 = (unsigned int *)*(v6 - 1);
        switch(*v6)
        {
          case 1:
            v4 = *(unsigned __int8 *)v8;
            break;
          case 2:
            v4 = __rev16(*(unsigned __int16 *)v8);
            break;
          case 4:
            v11 = *v8;
            goto LABEL_12;
          case 8:
            v11 = v8[1];
LABEL_12:
            v4 = bswap32(v11);
            break;
          default:
            break;
        }
      }
      v6 += 4;
      --a3;
    }
    while (a3);
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  v13 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v14);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (!v19
    || (objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v19, "isEqual:", v15),
        v15,
        (v16 & 1) == 0))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), (const void *)v4);
  }
  v17 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeObjectForKey:", v18);

}

void __UpdateItems_block_invoke_73(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __UpdateItems_block_invoke_2_74;
  v2[3] = &unk_24C365198;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v2);

}

void __UpdateItems_block_invoke_2_74(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE6B198], "predicateWithProperty:equalToInteger:", *MEMORY[0x24BE6B140], objc_msgSend(a2, "integerValue"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B1F8], "anyInLibrary:predicate:", *(_QWORD *)(a1 + 32), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteFromLibrary");

}

void __UpdateItems_block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "numberForColumnIndex:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberForColumnIndex:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v4)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v4, v5);

}

@end
