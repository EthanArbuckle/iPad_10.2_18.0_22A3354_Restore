@implementation MTLToolsSamplerState

- (MTLToolsSamplerState)initWithSamplerState:(id)a3 descriptor:(id)a4 device:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLToolsSamplerState;
  return -[MTLToolsObject initWithBaseObject:parent:](&v6, sel_initWithBaseObject_parent_, a3, a5);
}

- (void)dealloc
{
  objc_super v3;

  -[MTLToolsObjectCache removeKey:](self->super._device->samplerObjectCache, "removeKey:", self->super._baseObject);
  v3.receiver = self;
  v3.super_class = (Class)MTLToolsSamplerState;
  -[MTLToolsObject dealloc](&v3, sel_dealloc);
}

- (NSString)label
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "label");
}

- (MTLDevice)device
{
  return (MTLDevice *)self->super._parent;
}

- (unint64_t)resourceIndex
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resourceIndex");
}

- (unint64_t)gpuAddress
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "gpuAddress");
}

- (unint64_t)uniqueIdentifier
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "uniqueIdentifier");
}

- (unint64_t)pixelFormat
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "pixelFormat");
}

- (unint64_t)gpuHandle
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "gpuHandle");
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "gpuResourceID");
}

@end
