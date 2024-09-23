@implementation DKNotificationWatchNearbyMonitor

uint64_t __42___DKNotificationWatchNearbyMonitor_start__block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t result;
  _BYTE v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1AFC8], "admissionCheckChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v5 = 138412290;
    *(_QWORD *)&v5[4] = CFSTR("com.apple.coreduetd.nearbydeviceschanged");
    _os_log_impl(&dword_219056000, v3, OS_LOG_TYPE_DEFAULT, "Notification handler called for %@", v5, 0xCu);
  }

  *(_QWORD *)v5 = 0;
  result = notify_get_state(a2, (uint64_t *)v5);
  if (!(_DWORD)result)
    return +[_DKNotificationWatchNearbyMonitor setIsWatchNearby:](_DKNotificationWatchNearbyMonitor, "setIsWatchNearby:", *(_QWORD *)v5 != 0);
  return result;
}

@end
