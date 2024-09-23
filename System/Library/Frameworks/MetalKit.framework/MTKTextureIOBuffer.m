@implementation MTKTextureIOBuffer

- (MTKTextureIOBuffer)initWithLength:(unint64_t)a3 device:(id)a4
{
  id v6;
  MTKTextureIOBuffer *v7;
  uint64_t v8;
  MTLBuffer *buffer;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTKTextureIOBuffer;
  v7 = -[MTKTextureIOBuffer init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "newBufferWithLength:options:", a3, 0);
    buffer = v7->_buffer;
    v7->_buffer = (MTLBuffer *)v8;

  }
  return v7;
}

- (MTKTextureIOBuffer)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 deallocNotification:(id)a5 device:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  MTKTextureIOBuffer *v13;
  uint64_t v14;
  MTLBuffer *buffer;
  objc_super v17;

  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MTKTextureIOBuffer;
  v13 = -[MTKTextureIOBuffer init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v12, "newBufferWithBytesNoCopy:length:options:deallocator:", a3, a4, 0, v11);
    buffer = v13->_buffer;
    v13->_buffer = (MTLBuffer *)v14;

  }
  return v13;
}

- (id)map
{
  return -[MTKTextureIOBufferMap initWithContents:]([MTKTextureIOBufferMap alloc], "initWithContents:", -[MTLBuffer contents](self->_buffer, "contents"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTKTextureIOBuffer *v4;
  uint64_t v5;
  void *v6;
  id *v7;

  v4 = [MTKTextureIOBuffer alloc];
  v5 = -[MTLBuffer length](self->_buffer, "length");
  -[MTLBuffer device](self->_buffer, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MTKTextureIOBuffer initWithLength:device:](v4, "initWithLength:device:", v5, v6);

  memcpy((void *)objc_msgSend(v7[1], "contents"), (const void *)-[MTLBuffer contents](self->_buffer, "contents"), -[MTLBuffer length](self->_buffer, "length"));
  return v7;
}

- (MTLBuffer)buffer
{
  return self->_buffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
