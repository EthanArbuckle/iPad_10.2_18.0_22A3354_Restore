@implementation BKSHIDTouchSensitiveButtonRequestScanMode

void __BKSHIDTouchSensitiveButtonRequestScanMode_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __BKSHIDTouchSensitiveButtonRequestScanMode_block_invoke_2;
  v3[3] = &__block_descriptor_40_e36_v16__0___BSCompoundAssertionState__8l;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D01718], "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("BKSHIDTouchSensitiveButtonStartScanning"), v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)BKSHIDTouchSensitiveButtonRequestScanMode_scanningAssertion;
  BKSHIDTouchSensitiveButtonRequestScanMode_scanningAssertion = v1;

}

uint64_t __BKSHIDTouchSensitiveButtonRequestScanMode_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  mach_port_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a2, "orderedContext", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "integerValue");
        if (v9 > v6)
          v6 = v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    LODWORD(v6) = 0;
  }

  v10 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDTouchSensitiveButtonSetScanMode(v10, *(_DWORD *)(a1 + 32), v6);
}

@end
