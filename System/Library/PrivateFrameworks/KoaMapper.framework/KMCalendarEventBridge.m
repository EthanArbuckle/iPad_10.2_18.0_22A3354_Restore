@implementation KMCalendarEventBridge

- (KMCalendarEventBridge)init
{
  KMCalendarEventBridge *v2;
  uint64_t v3;
  id v4;
  KVItemMapper *itemMapper;
  EKEventStore *v6;
  EKEventStore *eventStore;
  KMCalendarEventBridge *v8;
  NSObject *v9;
  id v11;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)KMCalendarEventBridge;
  v2 = -[KMCalendarEventBridge init](&v12, sel_init);
  if (!v2)
    goto LABEL_4;
  v11 = 0;
  v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE5E8F0]), "initWithObjectClass:error:", objc_opt_class(), &v11);
  v4 = v11;
  itemMapper = v2->_itemMapper;
  v2->_itemMapper = (KVItemMapper *)v3;

  v6 = (EKEventStore *)objc_alloc_init(MEMORY[0x24BDC74E8]);
  eventStore = v2->_eventStore;
  v2->_eventStore = v6;

  if (v2->_itemMapper)
  {

LABEL_4:
    v8 = v2;
    goto LABEL_8;
  }
  v9 = KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[KMCalendarEventBridge init]";
    v15 = 2112;
    v16 = v4;
    _os_log_error_impl(&dword_218838000, v9, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

  v8 = 0;
LABEL_8:

  return v8;
}

- (unsigned)cascadeItemType
{
  return -11151;
}

- (id)originAppId
{
  return (id)*MEMORY[0x24BE5E870];
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  EKEventStore *eventStore;
  BOOL v14;
  NSObject *v15;
  void *v17;
  _QWORD v18[5];
  id v19;
  __int128 *p_buf;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  __int128 buf;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = v5;
  if (self->_eventStore)
  {
    v17 = v5;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v9, "setWeekOfYear:", -2);
    objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v9, v7, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWeekOfYear:", 0);
    objc_msgSend(v9, "setMonth:", 3);
    objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v9, v7, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__225;
    v29 = __Block_byref_object_dispose__226;
    v30 = 0;
    -[EKEventStore predicateForEventsWithStartDate:endDate:calendars:](self->_eventStore, "predicateForEventsWithStartDate:endDate:calendars:", v10, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    eventStore = self->_eventStore;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __60__KMCalendarEventBridge_enumerateItemsWithError_usingBlock___block_invoke;
    v18[3] = &unk_24D9612F0;
    v18[4] = self;
    p_buf = &buf;
    v21 = &v22;
    v19 = v17;
    -[EKEventStore enumerateEventsMatchingPredicate:usingBlock:](eventStore, "enumerateEventsMatchingPredicate:usingBlock:", v12, v18);
    v14 = *((_BYTE *)v23 + 24) == 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v22, 8);

    v6 = v17;
  }
  else
  {
    v15 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[KMCalendarEventBridge enumerateItemsWithError:usingBlock:]";
      _os_log_error_impl(&dword_218838000, v15, OS_LOG_TYPE_ERROR, "%s Unable to get an instance of EKEventStore.", (uint8_t *)&buf, 0xCu);
    }
    v14 = 0;
  }

  return v14;
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (void)setEventStore:(id)a3
{
  objc_storeStrong((id *)&self->_eventStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_itemMapper, 0);
}

void __60__KMCalendarEventBridge_enumerateItemsWithError_usingBlock___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id obj;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = *(void **)(a1[4] + 8);
  v7 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v6, "mapObject:error:", v5, &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)MEMORY[0x219A1AD04](v10);
          if (((*(uint64_t (**)(_QWORD))(a1[5] + 16))(a1[5]) & 1) == 0)
          {
            *a3 = 1;
            *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
            objc_autoreleasePoolPop(v14);
            goto LABEL_12;
          }
          objc_autoreleasePoolPop(v14);
          ++v13;
        }
        while (v11 != v13);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        v11 = v10;
        if (v10)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    *a3 = 1;
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }

}

@end
