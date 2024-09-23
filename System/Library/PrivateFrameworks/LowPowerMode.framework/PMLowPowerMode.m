@implementation PMLowPowerMode

void __33___PMLowPowerMode_sharedInstance__block_invoke()
{
  _PMLowPowerMode *v0;
  void *v1;

  v0 = objc_alloc_init(_PMLowPowerMode);
  v1 = (void *)sharedInstance_saver;
  sharedInstance_saver = (uint64_t)v0;

}

uint64_t __69___PMLowPowerMode_setPowerMode_fromSource_withParams_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54___PMLowPowerMode_setPowerMode_fromSource_withParams___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  NSLog(CFSTR("synchronous connection failed: %@\n"), a2);
}

void __54___PMLowPowerMode_setPowerMode_fromSource_withParams___block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    NSLog(CFSTR("setPowerMode failed: %@\n"), a3);
  }
}

@end
