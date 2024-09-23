@implementation Activate

void __endpoint_Activate_block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[9];
  int v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    *(_DWORD *)buf = 138412546;
    v16 = v5;
    v17 = 1024;
    v18 = a2;
    _os_log_impl(&dword_21B151000, v4, OS_LOG_TYPE_DEFAULT, "Activated %@ with result %d", buf, 0x12u);
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v6 + 72) + 1;
  *(_QWORD *)(v6 + 72) = v7;
  if (a2)
  {
    v8 = 0;
    *(_QWORD *)(v6 + 80) = 0;
  }
  else
  {
    v8 = *(_QWORD *)(v6 + 80);
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    v10 = *(NSObject **)v6;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __endpoint_Activate_block_invoke_54;
    v13[3] = &__block_descriptor_76_e5_v8__0l;
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 56);
    v13[4] = v9;
    v13[5] = v11;
    v13[6] = v8;
    v13[7] = v7;
    v14 = a2;
    v13[8] = v12;
    dispatch_async(v10, v13);
  }
  else
  {
    CFRelease(*(CFTypeRef *)(a1 + 48));
  }
}

void __endpoint_Activate_block_invoke_54(uint64_t a1)
{
  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 64));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
