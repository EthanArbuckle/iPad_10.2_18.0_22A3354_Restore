@implementation FigCPEExternalProtectionMonitorGetState

void __FigCPEExternalProtectionMonitorGetState_block_invoke(uint64_t a1)
{
  CFSetApplyFunction(*(CFSetRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 144) + 24), (CFSetApplierFunction)GetStateSetApplier, (void *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
}

@end
