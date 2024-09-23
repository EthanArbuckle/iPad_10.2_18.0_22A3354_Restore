@implementation FigXPCPurgeObjectsForPIDWithReportingBlock

void __FigXPCPurgeObjectsForPIDWithReportingBlock_block_invoke(uint64_t a1)
{
  const __CFArray *v2;
  CFRange v3;

  v2 = (const __CFArray *)gServerRegistry_1;
  v3.length = CFArrayGetCount((CFArrayRef)gServerRegistry_1);
  v3.location = 0;
  CFArrayApplyFunction(v2, v3, (CFArrayApplierFunction)figXPC_PurgeObjectsForPIDArrayApplier, (void *)(a1 + 32));
}

@end
