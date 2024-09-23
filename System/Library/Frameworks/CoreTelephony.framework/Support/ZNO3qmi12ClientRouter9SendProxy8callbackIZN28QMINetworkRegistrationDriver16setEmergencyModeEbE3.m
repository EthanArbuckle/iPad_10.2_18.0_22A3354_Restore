@implementation ZNO3qmi12ClientRouter9SendProxy8callbackIZN28QMINetworkRegistrationDriver16setEmergencyModeEbE3

os_log_t *___ZNO3qmi12ClientRouter9SendProxy8callbackIZN28QMINetworkRegistrationDriver16setEmergencyModeEbE3__1EEOS1_OT__block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *v3;
  uint64_t v4;
  os_log_t *result;
  int v6;
  NSObject *v7;
  unint64_t v8;
  _DWORD v9[2];
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *(unsigned __int8 **)(a1 + 32);
  v4 = *(_QWORD *)v3;
  result = (os_log_t *)(*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(*(_QWORD *)v3 + 88) + 16))(*(_QWORD *)(*(_QWORD *)v3 + 88), 1);
  v6 = *(_DWORD *)(a2 + 4);
  if (v6)
  {
    v7 = *result;
    if (os_log_type_enabled(*result, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109378;
      v9[1] = v6;
      v10 = 2080;
      v11 = qmi::asString();
      _os_log_impl(&dword_216897000, v7, OS_LOG_TYPE_DEFAULT, "#N Set emergency mode failed: Error in response with code %d (%s)", (uint8_t *)v9, 0x12u);
      v6 = *(_DWORD *)(a2 + 4);
    }
    if (v6 == 26)
      v8 = ((unint64_t)v3[8] << 8) | 1;
    else
      v8 = 0;
    return (os_log_t *)(*(uint64_t (**)(_QWORD, uint64_t, unint64_t))(**(_QWORD **)(v4 + 64) + 24))(*(_QWORD *)(v4 + 64), 1, v8);
  }
  return result;
}

@end
