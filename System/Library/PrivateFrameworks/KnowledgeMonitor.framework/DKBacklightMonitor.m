@implementation DKBacklightMonitor

void __41___DKBacklightMonitor_obtainCurrentValue__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t state64;

  objc_msgSend(*(id *)(a1 + 32), "currentEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    state64 = 0;
    notify_get_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 144), &state64);
    v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", state64);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKBacklightMonitor _eventWithState:](_DKBacklightMonitor, "_eventWithState:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCurrentEvent:inferHistoricalState:", v5, 1);

  }
}

void __28___DKBacklightMonitor_start__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t state64;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = (void *)os_transaction_create();
    v6 = (void *)MEMORY[0x219A29278]();
    state64 = 0;
    if (!notify_get_state(a2, &state64))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", state64);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKBacklightMonitor _eventWithState:](_DKBacklightMonitor, "_eventWithState:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "setCurrentEvent:inferHistoricalState:", v8, 1);
      v9 = objc_alloc(MEMORY[0x24BE0C318]);
      objc_msgSend(v8, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", state64);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v9, "initWithAbsoluteTimestamp:backlightLevel:", v10, v11);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "sendEvent:", v12);
    }
    objc_autoreleasePoolPop(v6);

  }
}

@end
