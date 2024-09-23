@implementation DKUserIsFirstBacklightOnAfterWakeupMonitor

void __91___DKUserIsFirstBacklightOnAfterWakeupMonitor_setInternalSettingsChangedNotficationHandler__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setUINotificationEligibility");

}

void __66___DKUserIsFirstBacklightOnAfterWakeupMonitor_showUINotification___block_invoke(uint64_t a1)
{
  void *v2;
  CFOptionFlags v3;

  v3 = 0;
  CFUserNotificationDisplayAlert(0.0, 0x40uLL, 0, 0, 0, (CFStringRef)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("alert_title")), (CFStringRef)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("alert_msg")), (CFStringRef)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("alert_option_one")), (CFStringRef)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("alert_option_two")), 0, &v3);
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("response_alert_title"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (v3)
      CFUserNotificationDisplayAlert(0.0, 0x40uLL, 0, 0, 0, (CFStringRef)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("response_alert_title")), (CFStringRef)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("response_alert_msg")), 0, 0, 0, 0);
  }
}

uint64_t __72___DKUserIsFirstBacklightOnAfterWakeupMonitor_receiveNotificationEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleScreenUnlockEvent");
}

void __76___DKUserIsFirstBacklightOnAfterWakeupMonitor_registerHandleBacklightEvents__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  uint64_t state64;

  objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __76___DKUserIsFirstBacklightOnAfterWakeupMonitor_registerHandleBacklightEvents__block_invoke_cold_2();

  v5 = (void *)os_transaction_create();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    state64 = 0;
    if (!notify_get_state(a2, &state64))
    {
      objc_msgSend(*(id *)(a1 + 32), "queue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __76___DKUserIsFirstBacklightOnAfterWakeupMonitor_registerHandleBacklightEvents__block_invoke_107;
      block[3] = &unk_24DA672C8;
      v10 = WeakRetained;
      v11 = state64;
      dispatch_sync(v7, block);

    }
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __76___DKUserIsFirstBacklightOnAfterWakeupMonitor_registerHandleBacklightEvents__block_invoke_cold_1();

  }
}

void __76___DKUserIsFirstBacklightOnAfterWakeupMonitor_registerHandleBacklightEvents__block_invoke_107(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x219A29278]();
  objc_msgSend(*(id *)(a1 + 32), "setupNotificationEligiblityPeriod");
  v3 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v3, "handleBacklightTurnedOnEvent");
  else
    objc_msgSend(v3, "handleBacklightTurnedOffEvent");
  objc_autoreleasePoolPop(v2);
}

void __76___DKUserIsFirstBacklightOnAfterWakeupMonitor_registerHandleBacklightEvents__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_2(&dword_219056000, v0, v1, "FirstBacklight?  Done handling display status change", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void __76___DKUserIsFirstBacklightOnAfterWakeupMonitor_registerHandleBacklightEvents__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_2(&dword_219056000, v0, v1, "FirstBacklight?  Begin handling display status change", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

@end
