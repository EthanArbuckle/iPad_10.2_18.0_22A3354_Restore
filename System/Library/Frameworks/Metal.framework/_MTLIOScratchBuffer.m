@implementation _MTLIOScratchBuffer

- (MTLBuffer)buffer
{
  return (MTLBuffer *)self->_priv->var1;
}

- (id)init:(MTLIOScratchBufferPrivate *)a3
{
  _MTLIOScratchBuffer *v4;
  _MTLIOScratchBuffer *v5;
  id v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_MTLIOScratchBuffer;
  v4 = -[_MTLIOScratchBuffer init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_priv = a3;
    v6 = a3->var1;
    v7 = v5->_priv->var2;
  }
  return v5;
}

- (void)dealloc
{
  MTLIOScratchBufferPrivate *priv;
  id var2;
  id var1;
  objc_super v6;

  priv = self->_priv;
  var1 = priv->var1;
  var2 = priv->var2;
  objc_msgSend(var2, "returnPriv:");

  v6.receiver = self;
  v6.super_class = (Class)_MTLIOScratchBuffer;
  -[_MTLIOScratchBuffer dealloc](&v6, sel_dealloc);
}

@end
