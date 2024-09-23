@implementation SYMultiSuspendableQueue

_DWORD *__64___SYMultiSuspendableQueue_initWithName_qosClass_serial_target___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  _DWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "stateForLogging");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = malloc_type_calloc(1uLL, objc_msgSend(v4, "length") + 200, 0x40CF3819uLL);
    *v5 = 2;
    __strlcpy_chk();
    __strlcpy_chk();
    v5[1] = objc_msgSend(v4, "length");
    __strlcpy_chk();
    objc_msgSend(v4, "getBytes:length:", v5 + 50, objc_msgSend(v4, "length"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
