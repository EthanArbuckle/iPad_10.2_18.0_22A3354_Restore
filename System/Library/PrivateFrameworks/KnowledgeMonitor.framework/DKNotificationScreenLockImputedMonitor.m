@implementation DKNotificationScreenLockImputedMonitor

void __68___DKNotificationScreenLockImputedMonitor_receiveNotificationEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "instantState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kCurrentEvent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_219056000, v4, OS_LOG_TYPE_DEFAULT, "ScreenLockStateImputed: instantState[kCurrentEvent] was nil when we received an event notification, which means KnowledgeStore will drop this event. Imputing the missing value.", v5, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setCurrentEventInInstantStateUsingLastKnowledgeStoreEvent");
  }
}

@end
