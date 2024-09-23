@implementation CarPlayNotificationCallback

void __CarPlayNotificationCallback_block_invoke(uint64_t a1)
{
  NSObject *v2;
  int Value;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = CFBooleanGetValue(*(CFBooleanRef *)(a1 + 40)) != 0;
  MSNLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    Value = CFBooleanGetValue(*(CFBooleanRef *)(a1 + 40));
    v4[0] = 67109120;
    v4[1] = Value;
    _os_log_impl(&dword_1D416F000, v2, OS_LOG_TYPE_INFO, "Updated CarPlay status to: %{BOOL}d", (uint8_t *)v4, 8u);
  }

}

@end
