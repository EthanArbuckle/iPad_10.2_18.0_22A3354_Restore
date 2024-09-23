@implementation UIWebDocumentView(AXPrivate)

- (uint64_t)_axPluginViews
{
  return *(_QWORD *)(a1 + (int)*MEMORY[0x24BDF71B0]);
}

@end
