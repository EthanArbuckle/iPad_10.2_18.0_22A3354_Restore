@implementation MTLDebugSamplerState

- (MTLDebugSamplerState)initWithSamplerState:(id)a3 descriptor:(id)a4 device:(id)a5
{
  MTLDebugSamplerState *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLDebugSamplerState;
  v6 = -[MTLToolsSamplerState initWithSamplerState:descriptor:device:](&v8, sel_initWithSamplerState_descriptor_device_, a3, a4, a5);
  if (v6)
    v6->_descriptor = (MTLSamplerDescriptor *)objc_msgSend(a4, "copy");
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[MTLToolsObject notifySamplerStateDeallocated:](self->super.super._parent, "notifySamplerStateDeallocated:", self);

  v3.receiver = self;
  v3.super_class = (Class)MTLDebugSamplerState;
  -[MTLToolsSamplerState dealloc](&v3, sel_dealloc);
}

- (id)formattedDescription:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLDebugSamplerState;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), -[MTLToolsObject description](&v4, sel_description), -[MTLSamplerDescriptor formattedDescription:](self->_descriptor, "formattedDescription:", a3));
}

- (id)description
{
  return -[MTLDebugSamplerState formattedDescription:](self, "formattedDescription:", 0);
}

- (MTLResourceID)gpuResourceID
{
  -[MTLToolsSamplerState device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (!-[MTLSamplerDescriptor supportArgumentBuffers](self->_descriptor, "supportArgumentBuffers"))
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  return (MTLResourceID)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "gpuResourceID");
}

- (MTLSamplerDescriptor)descriptor
{
  return self->_descriptor;
}

@end
