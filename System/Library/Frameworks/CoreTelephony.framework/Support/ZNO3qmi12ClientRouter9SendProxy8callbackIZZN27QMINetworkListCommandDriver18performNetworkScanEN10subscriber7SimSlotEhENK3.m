@implementation ZNO3qmi12ClientRouter9SendProxy8callbackIZZN27QMINetworkListCommandDriver18performNetworkScanEN10subscriber7SimSlotEhENK3

os_log_t *___ZNO3qmi12ClientRouter9SendProxy8callbackIZZN27QMINetworkListCommandDriver18performNetworkScanEN10subscriber7SimSlotEhENK3__0clEvEUlNS_16SubscriptionTypeERKN3nas29PerformIncrementalNetworkScan8ResponseEE_EEOS1_OT__block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  os_log_t *result;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v3 = *(_DWORD *)(a1 + 48);
  v4 = **(_QWORD **)(a1 + 32);
  if (v3 - 1 >= 3)
    v5 = 0;
  else
    v5 = v3;
  result = (os_log_t *)(*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(v4 + 88) + 16))(*(_QWORD *)(v4 + 88), v5);
  if (*(_DWORD *)(a2 + 4))
  {
    v7 = *result;
    if (os_log_type_enabled(*result, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v9[0]) = 136315138;
      *(_QWORD *)((char *)v9 + 4) = qmi::asString();
      _os_log_impl(&dword_216897000, v7, OS_LOG_TYPE_DEFAULT, "#N Incremental network scan failed: %s", (uint8_t *)v9, 0xCu);
    }
    v9[0] = 0;
    NetworkListCommandDriverResponseError::NetworkListCommandDriverResponseError();
    if (v3 - 1 >= 3)
      v8 = 0;
    else
      v8 = v3;
    return (os_log_t *)(*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(**(_QWORD **)(v4 + 48) + 24))(*(_QWORD *)(v4 + 48), v8, v9[0]);
  }
  return result;
}

@end
