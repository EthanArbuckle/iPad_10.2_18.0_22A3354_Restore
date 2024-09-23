@implementation IOPSCreatePowerSource

void __IOPSCreatePowerSource_block_invoke(uint64_t a1)
{
  int *v2;
  int *v3;
  int PowerSource;
  int **v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  _QWORD handler[5];

  if (!*(_QWORD *)(a1 + 40))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = -536870206;
LABEL_7:
    *(_DWORD *)(v6 + 24) = v7;
    return;
  }
  v2 = (int *)malloc_type_calloc(1uLL, 0x10uLL, 0x1060040C2E02434uLL);
  if (!v2)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = -536870200;
    goto LABEL_7;
  }
  v3 = v2;
  PowerSource = createPowerSource((uint64_t)v2);
  v5 = *(int ***)(a1 + 40);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = PowerSource;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    *v5 = 0;
    free(v3);
  }
  else
  {
    *v5 = v3;
    v8 = _getPSDispatchQueue_psQ;
    if (!_getPSDispatchQueue_psQ)
    {
      v8 = dispatch_queue_create("Power Management power source queue", 0);
      _getPSDispatchQueue_psQ = (uint64_t)v8;
    }
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 0x40000000;
    handler[2] = __IOPSCreatePowerSource_block_invoke_2;
    handler[3] = &__block_descriptor_tmp_4;
    handler[4] = v3;
    notify_register_dispatch("com.apple.system.powermanagement.assertionresync", v3 + 3, v8, handler);
  }
}

uint64_t __IOPSCreatePowerSource_block_invoke_2(uint64_t a1)
{
  int PowerSource;
  uint64_t result;

  PowerSource = createPowerSource(*(_QWORD *)(a1 + 32));
  if (PowerSource)
    asl_log(0, 0, 3, "createPowerSource returned 0x%x\n", PowerSource);
  result = setPowerSourceDetails(*(_QWORD *)(a1 + 32), **(const void ***)(a1 + 32));
  if ((_DWORD)result)
    return asl_log(0, 0, 3, "setPowerSourceDetails returned 0x%x\n", result);
  return result;
}

@end
