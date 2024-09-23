@implementation DDMessageCache

- (DDMessageCache)init
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  dispatch_source_t v10;
  void *v11;
  NSObject *v12;
  _QWORD handler[4];
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)DDMessageCache;
  v2 = -[DDMessageCache init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v3;

    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v5;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.DDMessageCaching", v7);
    v9 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v8;

    v10 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 2uLL, *((dispatch_queue_t *)v2 + 1));
    v11 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v10;

    v12 = *((_QWORD *)v2 + 2);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __22__DDMessageCache_init__block_invoke;
    handler[3] = &unk_1E3C95AC0;
    v15 = v2;
    dispatch_source_set_event_handler(v12, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 2));

  }
  return (DDMessageCache *)v2;
}

- (void)_pruneIgnoringFirst:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  DDMessageCache *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v27;
  void *v28;
  uint64_t v29;
  DDMessageCache *v30;
  uint64_t v31;
  uint64_t v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[NSMutableArray copy](self->_indexLRU, "copy");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -90000.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v7 = v5;
  v8 = self;
  obj = v7;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v35;
    v30 = v8;
    v31 = *(_QWORD *)v35;
    do
    {
      v13 = 0;
      v32 = v10;
      do
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(obj);
        if (a3)
        {
          ++v11;
        }
        else
        {
          v14 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v13);
          -[NSMutableDictionary objectForKeyedSubscript:](v8->_cache, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count");
          if (v11 > 0x14)
            goto LABEL_16;
          v17 = v16;
          if (!v16)
            goto LABEL_16;
          objc_msgSend(v15, "lastObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "date");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "compare:", v6);

          v12 = v31;
          v21 = v20 == -1;
          v10 = v32;
          if (v21)
          {
LABEL_16:
            -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_cache, "setObject:forKeyedSubscript:", 0, v14, v30);
            -[NSMutableArray removeObjectIdenticalTo:](v8->_indexLRU, "removeObjectIdenticalTo:", v14);
          }
          else
          {
            v22 = v17 - 2;
            if (v17 >= 2)
            {
              while (1)
              {
                objc_msgSend(v15, "objectAtIndexedSubscript:", v22, v30);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "date");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v24, "compare:", v6);

                if (v25 == -1)
                  break;
                if (v22-- <= 0)
                  goto LABEL_21;
              }
              objc_msgSend(v15, "subarrayWithRange:", v22 + 1, v17 - (v22 + 1));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = (void *)objc_msgSend(v27, "mutableCopy");
              -[NSMutableDictionary setObject:forKeyedSubscript:](v30->_cache, "setObject:forKeyedSubscript:", v28, v14);

LABEL_21:
              ++v11;
              v8 = v30;
              v12 = v31;
              v10 = v32;
            }
          }

        }
        a3 = 0;
        ++v13;
      }
      while (v13 != v10);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      v10 = v29;
      a3 = 0;
    }
    while (v29);
  }

}

- (void)removeConversation:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__DDMessageCache_removeConversation___block_invoke;
  block[3] = &unk_1E3C95AE8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (id)stringWithElement:(id)a3 conversationID:(id)a4 range:(_NSRange *)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSUInteger v15;
  void *v16;
  NSUInteger v17;
  id v18;
  _QWORD block[5];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v8 = a3;
  v9 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1904;
  v33 = __Block_byref_object_dispose__1905;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__DDMessageCache_stringWithElement_conversationID_range___block_invoke;
  block[3] = &unk_1E3C95B10;
  block[4] = self;
  v11 = v9;
  v21 = v11;
  v12 = v8;
  v22 = v12;
  v23 = &v29;
  v24 = &v25;
  dispatch_sync(queue, block);
  if (!v30[5])
  {
    objc_msgSend(v12, "text");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v30[5];
    v30[5] = v13;

  }
  v15 = v26[3];
  objc_msgSend(v12, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");
  a5->location = v15;
  a5->length = v17;

  v18 = (id)v30[5];
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexLRU, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_memoryWarningSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __57__DDMessageCache_stringWithElement_conversationID_range___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, "count");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -90000.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v7 = v4;
    do
    {
      v8 = v7 - 1;
      if (v7 - 1 < 0)
        break;
      objc_msgSend(v3, "objectAtIndexedSubscript:", v7 - 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "compare:", v5);

      if (v11 == -1)
        break;
      objc_msgSend(v3, "objectAtIndexedSubscript:", v7 - 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "text");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v6 += objc_msgSend(v13, "length");

      v7 = v8;
    }
    while (v6 < 0x97);
    objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectIdenticalTo:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "insertObject:atIndex:", *(_QWORD *)(a1 + 40), 0);
    if (v7 == 1 || v4 == 5)
    {
      objc_msgSend(v3, "removeObjectAtIndex:", 0);
    }
    else if (v7)
    {
      objc_msgSend(v3, "subarrayWithRange:", v7, v4 - v7 + 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "mutableCopy");

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v15, *(_QWORD *)(a1 + 40));
      v3 = (void *)v15;
    }
    objc_msgSend(v3, "valueForKey:", CFSTR("text"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n¶\n"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

    v24 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "length");
    objc_msgSend(*(id *)(a1 + 48), "text");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v24 - objc_msgSend(v25, "length");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", *(_QWORD *)(a1 + 48));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v16, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "insertObject:atIndex:", *(_QWORD *)(a1 + 40), 0);
    objc_msgSend(*(id *)(a1 + 48), "text");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "_pruneIgnoringFirst:", 1);
}

uint64_t __37__DDMessageCache_removeConversation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
}

uint64_t __22__DDMessageCache_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pruneIgnoringFirst:", 0);
}

@end
