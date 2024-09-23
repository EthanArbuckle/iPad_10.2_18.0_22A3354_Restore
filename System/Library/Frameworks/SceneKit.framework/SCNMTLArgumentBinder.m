@implementation SCNMTLArgumentBinder

- (SCNMTLArgumentBinder)initWithBlock:(id)a3 frequency:(int)a4 needsRenderResource:(BOOL)a5
{
  SCNMTLArgumentBinder *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCNMTLArgumentBinder;
  v8 = -[SCNMTLArgumentBinder init](&v10, sel_init);
  if (v8)
  {
    v8->_block = _Block_copy(a3);
    v8->_frequency = a4;
    v8->_needsRenderResource = a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  _Block_release(self->_block);
  v3.receiver = self;
  v3.super_class = (Class)SCNMTLArgumentBinder;
  -[SCNMTLArgumentBinder dealloc](&v3, sel_dealloc);
}

@end
