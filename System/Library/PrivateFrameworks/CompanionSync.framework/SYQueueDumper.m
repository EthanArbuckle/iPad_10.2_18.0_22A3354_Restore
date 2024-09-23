@implementation SYQueueDumper

_DWORD *__31__SYQueueDumper_registerQueue___block_invoke_2()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _DWORD *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x212BE0D64]();
  objc_msgSend((id)queues, "compact");
  objc_msgSend((id)queues, "allObjects");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v3 = (void *)objc_msgSend(v2, "initWithCapacity:", objc_msgSend((id)queues, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v1;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "debugDescription", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = malloc_type_malloc(objc_msgSend(v10, "length") + 200, 0xB75F1D13uLL);
  *v11 = 1;
  v11[1] = objc_msgSend(v10, "length");
  __strlcpy_chk();
  objc_msgSend(v10, "getBytes:range:", v11 + 50, 0, objc_msgSend(v10, "length"));

  objc_autoreleasePoolPop(v0);
  return v11;
}

+ (void)registerQueue:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  if (registerQueue__onceToken != -1)
    dispatch_once(&registerQueue__onceToken, &__block_literal_global_18);
  v4 = dumperQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__SYQueueDumper_registerQueue___block_invoke_3;
  block[3] = &unk_24CC65418;
  v7 = v3;
  v5 = v3;
  dispatch_sync(v4, block);

}

uint64_t __31__SYQueueDumper_registerQueue___block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)queues;
  queues = v0;

  v2 = dispatch_queue_create("QueueDumper", 0);
  v3 = (void *)dumperQueue;
  dumperQueue = (uint64_t)v2;

  return os_state_add_handler();
}

uint64_t __31__SYQueueDumper_registerQueue___block_invoke_3(uint64_t a1)
{
  unint64_t i;
  uint64_t result;

  for (i = 0; i < objc_msgSend((id)queues, "count"); ++i)
  {
    if (objc_msgSend((id)queues, "pointerAtIndex:", i) == *(_QWORD *)(a1 + 32))
      break;
  }
  result = objc_msgSend((id)queues, "count");
  if (i == result)
    return objc_msgSend((id)queues, "addPointer:", *(_QWORD *)(a1 + 32));
  return result;
}

@end
