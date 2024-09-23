@implementation MTKTextureIOBufferAllocator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

- (MTKTextureIOBufferAllocator)initWithDevice:(id)a3
{
  id v5;
  MTKTextureIOBufferAllocator *v6;
  MTKTextureIOBufferAllocator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTKTextureIOBufferAllocator;
  v6 = -[MTKTextureIOBufferAllocator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (id)newBufferWithLength:(unint64_t)a3
{
  return -[MTKTextureIOBuffer initWithLength:device:]([MTKTextureIOBuffer alloc], "initWithLength:device:", a3, self->_device);
}

- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 deallocNotification:(id)a5 error:(id *)a6
{
  id v10;
  MTKTextureIOBuffer *v11;

  v10 = a5;
  v11 = -[MTKTextureIOBuffer initWithBytesNoCopy:length:deallocNotification:device:error:]([MTKTextureIOBuffer alloc], "initWithBytesNoCopy:length:deallocNotification:device:error:", a3, a4, v10, self->_device, a6);

  return v11;
}

@end
