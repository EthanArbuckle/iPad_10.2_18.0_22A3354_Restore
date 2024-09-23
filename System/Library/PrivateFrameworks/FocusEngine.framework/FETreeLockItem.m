@implementation FETreeLockItem

uint64_t __58___FETreeLockItem_initWithEnvironment_finalUnlockHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  uint64_t v5;
  CFAbsoluteTime Current;
  uint64_t v7;
  double v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  double v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[8])
  {
    logger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      Current = CFAbsoluteTimeGetCurrent();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = Current - *(double *)(v7 + 72);
      v9 = 138412802;
      v10 = v5;
      v11 = 2048;
      v12 = v8;
      v13 = 2112;
      v14 = v7;
      _os_log_fault_impl(&dword_23C48C000, v3, OS_LOG_TYPE_FAULT, "Locked environment %@ was deallocated after being locked for %.2f seconds. This should never happen. Additional info:\n%@", (uint8_t *)&v9, 0x20u);
    }

    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "_cleanup:", 1);
}

@end
