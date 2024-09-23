@implementation OS_nw_nexus

- (void)dealloc
{
  objc_super v3;

  nw_nexus_close((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_nw_nexus;
  -[OS_nw_nexus dealloc](&v3, sel_dealloc);
}

@end
