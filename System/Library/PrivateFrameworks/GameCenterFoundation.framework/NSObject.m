@implementation NSObject

void __67__NSObject_GKBlockKVO___gkAddObserverForKeyPath_options_withBlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_getAssociatedObject(*(id *)(a1 + 32), CFSTR("com.apple.gamekit.blockObserverMap"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_setAssociatedObject(*(id *)(a1 + 32), CFSTR("com.apple.gamekit.blockObserverMap"), v8, (void *)0x301);
  }
  v2 = -[GKObserverTrampoline initObservingObject:keyPath:options:block:]([GKObserverTrampoline alloc], "initObservingObject:keyPath:options:block:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "token");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(v8, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
}

void __56__NSObject_GKBlockKVO___gkRemoveObserverWithBlockToken___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;

  v2 = (id *)(a1 + 32);
  objc_getAssociatedObject(*(id *)(a1 + 32), CFSTR("com.apple.gamekit.blockObserverMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v4 = (uint64_t *)(a1 + 40);
  objc_msgSend(v3, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "cancelObservation");
    objc_msgSend(v3, "removeObjectForKey:", *v4);
    if (!objc_msgSend(v3, "count"))
      objc_setAssociatedObject(*v2, CFSTR("com.apple.gamekit.blockObserverMap"), 0, (void *)0x301);
  }
  else
  {
    v8 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v9 = GKOSLoggers();
      v8 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __56__NSObject_GKBlockKVO___gkRemoveObserverWithBlockToken___block_invoke_cold_1((uint64_t *)v2, v4, v8);
  }

}

void __56__NSObject_GKBlockKVO___gkRemoveObserverWithBlockToken___block_invoke_cold_1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_debug_impl(&dword_1BCDE3000, log, OS_LOG_TYPE_DEBUG, "Ignoring attempt to remove non-existent observer on %@ for token %@.", (uint8_t *)&v5, 0x16u);
}

@end
