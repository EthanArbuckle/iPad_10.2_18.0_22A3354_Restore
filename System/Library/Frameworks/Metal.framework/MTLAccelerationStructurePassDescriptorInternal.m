@implementation MTLAccelerationStructurePassDescriptorInternal

- (MTLAccelerationStructurePassDescriptorInternal)init
{
  MTLAccelerationStructurePassDescriptorInternal *v2;
  MTLAccelerationStructurePassDescriptorInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLAccelerationStructurePassDescriptorInternal;
  v2 = -[MTLAccelerationStructurePassDescriptor init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MTLAccelerationStructurePassDescriptorInternal setEnableSubstreams:](v2, "setEnableSubstreams:", 1);
  return v3;
}

- (BOOL)enableSubstreams
{
  return self->_enableSubstreams;
}

- (void)setEnableSubstreams:(BOOL)a3
{
  self->_enableSubstreams = a3;
}

@end
