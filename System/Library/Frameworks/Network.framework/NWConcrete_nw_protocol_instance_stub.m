@implementation NWConcrete_nw_protocol_instance_stub

- (nw_protocol)getProtocolStructure
{
  return self->protocol;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_protocol_instance_stub;
  -[NWConcrete_nw_protocol_instance_stub dealloc](&v2, sel_dealloc);
}

@end
