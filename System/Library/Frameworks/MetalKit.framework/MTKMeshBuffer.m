@implementation MTKMeshBuffer

- (id)_initWithLength:(unint64_t)a3 offset:(unint64_t)a4 zone:(id)a5 type:(unint64_t)a6
{
  return -[MTKMeshBuffer _initWithBytes:length:offset:allocator:zone:type:](self, "_initWithBytes:length:offset:allocator:zone:type:", 0, a3, a4, objc_msgSend(a5, "allocator"), a5, a6);
}

- (id)_initWithLength:(unint64_t)a3 allocator:(id)a4 type:(unint64_t)a5
{
  return -[MTKMeshBuffer _initWithBytes:length:offset:allocator:zone:type:](self, "_initWithBytes:length:offset:allocator:zone:type:", 0, a3, 0, a4, 0, a5);
}

- (id)_initWithData:(id)a3 allocator:(id)a4 type:(unint64_t)a5
{
  return -[MTKMeshBuffer _initWithBytes:length:offset:allocator:zone:type:](self, "_initWithBytes:length:offset:allocator:zone:type:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 0, a4, 0, a5);
}

- (id)_initWithBytes:(const void *)a3 length:(unint64_t)a4 offset:(unint64_t)a5 allocator:(id)a6 zone:(id)a7 type:(unint64_t)a8
{
  id result;
  _QWORD *v15;
  unint64_t v16;
  id v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MTKMeshBuffer;
  result = -[MTKMeshBuffer init](&v18, sel_init);
  if (result)
  {
    v15 = result;
    v16 = objc_msgSend((id)objc_msgSend(a6, "device"), "maxBufferLength");
    result = 0;
    if (a8 - 3 >= 0xFFFFFFFFFFFFFFFELL && a4 - 1 < v16)
    {
      v15[2] = a4;
      v15[3] = a6;
      v15[1] = a7;
      v15[5] = a5;
      v15[6] = a8;
      if (a7)
        v17 = (id)objc_msgSend(a7, "buffer");
      else
        v17 = (id)objc_msgSend((id)objc_msgSend(a6, "device"), "newBufferWithLength:options:", a4, 0);
      v15[4] = v17;
      if (a3)
        memcpy((void *)objc_msgSend(v17, "contents"), a3, a4);
      return v15;
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[MTKMeshBufferZone destroyBuffer:](self->_zone, "destroyBuffer:", self);

  v3.receiver = self;
  v3.super_class = (Class)MTKMeshBuffer;
  -[MTKMeshBuffer dealloc](&v3, sel_dealloc);
}

- (void)fillData:(id)a3 offset:(unint64_t)a4
{
  uint64_t v7;
  unint64_t length;
  unint64_t v9;

  if (self->_length >= a4)
  {
    v7 = objc_msgSend(a3, "length");
    length = self->_length;
    v9 = v7 + a4 - length;
    if (v7 + a4 < length)
      v9 = 0;
    memcpy((void *)(-[MTLBuffer contents](self->_buffer, "contents") + self->_offset + a4), (const void *)objc_msgSend(a3, "bytes"), v9 + v7);
  }
}

- (id)_newMap
{
  MTLBuffer *v3;
  id v4;
  unint64_t v5;
  _QWORD v7[5];

  v3 = self->_buffer;
  v4 = objc_alloc(getMDLMeshBufferMapClass());
  v5 = -[MTLBuffer contents](v3, "contents") + self->_offset;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __24__MTKMeshBuffer__newMap__block_invoke;
  v7[3] = &unk_24C3D4E10;
  v7[4] = v3;
  return (id)objc_msgSend(v4, "initWithBytes:deallocator:", v5, v7);
}

void __24__MTKMeshBuffer__newMap__block_invoke(uint64_t a1)
{

}

- (id)map
{
  return -[MTKMeshBuffer _newMap](self, "_newMap");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = -[MTKMeshBuffer _initWithLength:allocator:type:]([MTKMeshBuffer alloc], "_initWithLength:allocator:type:", self->_length, self->_allocator, self->_type);
  memcpy((void *)objc_msgSend(v4[4], "contents"), (const void *)-[MTLBuffer contents](self->_buffer, "contents"), self->_length);
  return v4;
}

- (NSString)name
{
  return (NSString *)-[MTLBuffer label](self->_buffer, "label");
}

- (void)setName:(id)a3
{
  -[MTLBuffer setLabel:](self->_buffer, "setLabel:", a3);
}

- (id)zone
{
  return self->_zone;
}

- (NSUInteger)length
{
  return self->_length;
}

- (MTKMeshBufferAllocator)allocator
{
  return self->_allocator;
}

- (id)buffer
{
  return self->_buffer;
}

- (NSUInteger)offset
{
  return self->_offset;
}

- (MDLMeshBufferType)type
{
  return self->_type;
}

@end
