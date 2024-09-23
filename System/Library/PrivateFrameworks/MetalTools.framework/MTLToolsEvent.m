@implementation MTLToolsEvent

- (MTLDevice)device
{
  return (MTLDevice *)self->super._parent;
}

- (NSString)label
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "label");
}

- (void)setLabel:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setLabel:", a3);
}

- (BOOL)enableBarrier
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "enableBarrier");
}

- (void)setEnableBarrier:(BOOL)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setEnableBarrier:", a3);
}

- (BOOL)supportsRollback
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRollback");
}

@end
