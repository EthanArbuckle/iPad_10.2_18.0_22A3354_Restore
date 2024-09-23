@implementation KCSharingLogObject

void __KCSharingLogObject_block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  os_log_t v8;
  uint64_t v9;
  void *v10;

  v2 = (void *)KCSharingLogObject_scopeMap;
  if (!KCSharingLogObject_scopeMap)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)KCSharingLogObject_scopeMap;
    KCSharingLogObject_scopeMap = v3;

    v2 = (void *)KCSharingLogObject_scopeMap;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v8 = os_log_create("com.apple.security.keychain.sharing", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "cStringUsingEncoding:", 4));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend((id)KCSharingLogObject_scopeMap, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
  }
}

void __KCSharingLogObject_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("kcsharing-logger", v2);
  v1 = (void *)KCSharingLogObject_logQueue;
  KCSharingLogObject_logQueue = (uint64_t)v0;

}

@end
