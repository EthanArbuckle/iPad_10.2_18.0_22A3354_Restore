@implementation NSActivityAssertion

uint64_t __38___NSActivityAssertion__bundleVersion__block_invoke()
{
  NSDictionary *v0;
  NSString *v1;
  uint64_t v2;
  uint64_t result;

  v0 = -[NSBundle infoDictionary](+[NSBundle mainBundle](NSBundle, "mainBundle"), "infoDictionary");
  qword_1ECD09D10 = (uint64_t)-[NSDictionary objectForKey:](v0, "objectForKey:", *MEMORY[0x1E0C9AE90]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v1 = [NSString alloc];
    objc_msgSend((id)qword_1ECD09D10, "doubleValue");
    result = -[NSString initWithFormat:](v1, "initWithFormat:", CFSTR("%f"), v2);
  }
  else
  {
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
      return result;
    result = (uint64_t)CFSTR("unknown");
  }
  qword_1ECD09D10 = result;
  return result;
}

dispatch_queue_t __57___NSActivityAssertion__expiringAssertionManagementQueue__block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.expiringAssertionManagementQueue", 0);
  qword_1ECD09CD8 = (uint64_t)result;
  return result;
}

dispatch_queue_t __51___NSActivityAssertion__expiringTaskExecutionQueue__block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.expiringTaskExecutionQueue", MEMORY[0x1E0C80D50]);
  qword_1ECD09CE8 = (uint64_t)result;
  return result;
}

NSHashTable *__43___NSActivityAssertion__expiringActivities__block_invoke()
{
  NSHashTable *result;

  result = -[NSHashTable initWithOptions:capacity:]([NSHashTable alloc], "initWithOptions:capacity:", 0, 0);
  qword_1ECD09D08 = (uint64_t)result;
  return result;
}

uint64_t __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke()
{
  dispatch_queue_global_t global_queue;

  global_queue = dispatch_get_global_queue(21, 0);
  return softLinkBKSProcessAssertionSetExpirationHandler((uint64_t)global_queue, (uint64_t)&__block_literal_global_38);
}

uint64_t __70___NSActivityAssertion__performExpiringActivityWithReason_usingBlock___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_endFromDealloc:", 0);
}

uint64_t __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(+[_NSActivityAssertion _expiringActivities](_NSActivityAssertion, "_expiringActivities"), "addObject:", *(_QWORD *)(a1 + 32));
  v2 = objc_alloc(getBKSProcessAssertionClass());
  v3 = getpid();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke_4;
  v6[3] = &unk_1E0F4F260;
  v4 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  result = objc_msgSend(v2, "initWithPID:flags:reason:name:withHandler:", v3, 1, 4, v4, v6);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = result;
  return result;
}

void __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke_4(uint64_t a1, char a2)
{
  NSObject *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_fireExpirationHandler");
    v3 = +[_NSActivityAssertion _expiringAssertionManagementQueue](_NSActivityAssertion, "_expiringAssertionManagementQueue");
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke_5;
    v4[3] = &unk_1E0F4D2D8;
    v4[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v3, v4);
  }
}

dispatch_queue_t __56___NSActivityAssertion__expirationHandlerExecutionQueue__block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.expirationHandlerExecutionQueue", MEMORY[0x1E0C80D50]);
  qword_1ECD09CF8 = (uint64_t)result;
  return result;
}

uint64_t __48___NSActivityAssertion__dumpExpiringActivitives__block_invoke()
{
  id v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[128];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v0 = +[_NSActivityAssertion _expiringActivities](_NSActivityAssertion, "_expiringActivities");
  result = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v7, v6, 16);
  if (result)
  {
    v2 = result;
    v3 = 0;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v0);
        NSLog((NSString *)CFSTR("%lull: %@"), v3 + v5, objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5), "debugDescription"));
        ++v5;
      }
      while (v2 != v5);
      result = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v7, v6, 16);
      v2 = result;
      v3 += v5;
    }
    while (result);
  }
  return result;
}

void __42___NSActivityAssertion__expireAllActivies__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];
  _BYTE v7[128];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(+[_NSActivityAssertion _expiringActivities](_NSActivityAssertion, "_expiringActivities"), "allObjects");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v9;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v9 != v3)
          objc_enumerationMutation(v0);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v4++), "_fireExpirationHandler");
      }
      while (v2 != v4);
      v2 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
    }
    while (v2);
  }
  v5 = +[_NSActivityAssertion _expirationHandlerExecutionQueue](_NSActivityAssertion, "_expirationHandlerExecutionQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___NSActivityAssertion__expireAllActivies__block_invoke_2;
  block[3] = &unk_1E0F4D2D8;
  block[4] = v0;
  dispatch_barrier_async(v5, block);
}

void __42___NSActivityAssertion__expireAllActivies__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2 = +[_NSActivityAssertion _expiringAssertionManagementQueue](_NSActivityAssertion, "_expiringAssertionManagementQueue");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42___NSActivityAssertion__expireAllActivies__block_invoke_3;
  v3[3] = &unk_1E0F4D2D8;
  v3[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, v3);
}

uint64_t __42___NSActivityAssertion__expireAllActivies__block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[128];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(void **)(a1 + 32);
  result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v6, 16);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(+[_NSActivityAssertion _expiringActivities](_NSActivityAssertion, "_expiringActivities"), "removeObject:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5++));
      }
      while (v3 != v5);
      result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v6, 16);
      v3 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke_2()
{
  return +[_NSActivityAssertion _expireAllActivies](_NSActivityAssertion, "_expireAllActivies");
}

void __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke_5(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    objc_msgSend(+[_NSActivityAssertion _expiringActivities](_NSActivityAssertion, "_expiringActivities"), "removeObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "invalidate");

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  }
}

void __40___NSActivityAssertion__endFromDealloc___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    objc_msgSend(+[_NSActivityAssertion _expiringActivities](_NSActivityAssertion, "_expiringActivities"), "removeObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "invalidate");

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  }
}

void __46___NSActivityAssertion__fireExpirationHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 88));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 80);
  *(_QWORD *)(v2 + 80) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 88));
  v4 = +[_NSActivityAssertion _expirationHandlerExecutionQueue](_NSActivityAssertion, "_expirationHandlerExecutionQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46___NSActivityAssertion__fireExpirationHandler__block_invoke_2;
  block[3] = &unk_1E0F4E060;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = v3;
  dispatch_async(v4, block);
}

void __46___NSActivityAssertion__fireExpirationHandler__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(void **)(a1 + 40);
  }
  else
  {
    v3 = 0;
  }

  v4 = +[_NSActivityAssertion _expiringAssertionManagementQueue](_NSActivityAssertion, "_expiringAssertionManagementQueue");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46___NSActivityAssertion__fireExpirationHandler__block_invoke_3;
  v5[3] = &unk_1E0F4D2D8;
  v5[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v4, v5);
}

void __46___NSActivityAssertion__fireExpirationHandler__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "invalidate");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = 0;
}

uint64_t __70___NSActivityAssertion__performExpiringActivityWithReason_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
