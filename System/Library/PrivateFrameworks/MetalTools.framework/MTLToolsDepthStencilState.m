@implementation MTLToolsDepthStencilState

- (MTLToolsDepthStencilState)initWithDepthStencilState:(id)a3 descriptor:(id)a4 device:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLToolsDepthStencilState;
  return -[MTLToolsObject initWithBaseObject:parent:](&v6, sel_initWithBaseObject_parent_, a3, a5);
}

- (void)dealloc
{
  objc_super v3;

  -[MTLToolsObjectCache removeKey:](self->super._device->depthStencilObjectCache, "removeKey:", self->super._baseObject);
  v3.receiver = self;
  v3.super_class = (Class)MTLToolsDepthStencilState;
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

- (BOOL)readsDepth
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "readsDepth");
}

- (BOOL)writesDepth
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "writesDepth");
}

- (BOOL)readsStencil
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "readsStencil");
}

- (BOOL)writesStencil
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "writesStencil");
}

@end
