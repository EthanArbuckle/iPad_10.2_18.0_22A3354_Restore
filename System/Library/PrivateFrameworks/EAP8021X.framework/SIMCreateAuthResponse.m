@implementation SIMCreateAuthResponse

void ___SIMCreateAuthResponse_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    EAPLogGetLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_206440000, v6, v7, "CoreTelephonyClient.generateAuthenticationInfoUsingSim failed with error: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    objc_msgSend(a2, "data");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_claimAutoreleasedReturnValue();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

@end
