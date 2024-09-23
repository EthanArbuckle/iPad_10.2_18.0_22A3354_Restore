@implementation FigCPEExternalProtectionMonitorEndMonitoring

void __FigCPEExternalProtectionMonitorEndMonitoring_block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
  v2 = *(_DWORD *)(v1 + 32) - 1;
  *(_DWORD *)(v1 + 32) = v2;
  if (!v2)
    CFSetApplyFunction(*(CFSetRef *)(v1 + 24), (CFSetApplierFunction)EndMonitoringSetApplier, 0);
}

@end
