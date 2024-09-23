@implementation EAHandleCellBroadcastMessageReceivedNotification

void __EAHandleCellBroadcastMessageReceivedNotification_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = EALogDefault;
  if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_21A501000, v2, OS_LOG_TYPE_DEFAULT, "Received broadcast message notification %{public}@", (uint8_t *)&v4, 0xCu);
  }
  if (*(_QWORD *)(a1 + 32) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "_cellBroadcastMessageReceived:", *(_QWORD *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
