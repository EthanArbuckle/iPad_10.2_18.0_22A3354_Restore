@implementation FigCPEExternalProtectionMonitorBeginMonitoring

void __FigCPEExternalProtectionMonitorBeginMonitoring_block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
  v2 = *(_DWORD *)(v1 + 32);
  *(_DWORD *)(v1 + 32) = v2 + 1;
  if (!v2)
    CFSetApplyFunction(*(CFSetRef *)(v1 + 24), (CFSetApplierFunction)BeginMonitoringSetApplier, 0);
}

@end
