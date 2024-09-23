@implementation CIGVGraphCreate

void __CIGVGraphCreate_block_invoke()
{
  CIGVGraphCreate_gvClass = (uint64_t)NSClassFromString(CFSTR("GVGraph"));
  if (!CIGVGraphCreate_gvClass)
    NSLog(CFSTR("GraphVisualizer is not available."));
}

@end
