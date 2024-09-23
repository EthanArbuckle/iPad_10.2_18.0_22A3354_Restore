@implementation AVCustomRoutingPartialIP

- (AVCustomRoutingPartialIP)initWithAddress:(NSData *)address mask:(NSData *)mask
{
  AVCustomRoutingPartialIP *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVCustomRoutingPartialIP;
  v6 = -[AVCustomRoutingPartialIP init](&v8, sel_init);
  if (v6)
  {
    v6->_address = address;
    v6->_mask = mask;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_address = 0;
  self->_mask = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVCustomRoutingPartialIP;
  -[AVCustomRoutingPartialIP dealloc](&v3, sel_dealloc);
}

- (NSData)address
{
  return self->_address;
}

- (NSData)mask
{
  return self->_mask;
}

@end
