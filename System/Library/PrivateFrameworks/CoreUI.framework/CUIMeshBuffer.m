@implementation CUIMeshBuffer

- (CUIMeshBuffer)init
{
  CUIMeshBuffer *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CUIMeshBuffer;
  v2 = -[CUIMeshBuffer init](&v4, sel_init);
  if (v2)
    v2->_data = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
  return v2;
}

- (CUIMeshBuffer)initWithBytes:(void *)a3 andLength:(unint64_t)a4 ofType:(unint64_t)a5
{
  CUIMeshBuffer *v8;
  CUIMeshBuffer *v9;

  v8 = -[CUIMeshBuffer init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[NSMutableData appendBytes:length:](v8->_data, "appendBytes:length:", a3, a4);
    v9->_type = a5;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIMeshBuffer;
  -[CUIMeshBuffer dealloc](&v3, sel_dealloc);
}

- (unint64_t)length
{
  return -[NSMutableData length](self->_data, "length");
}

- (unint64_t)type
{
  return self->_type;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSMutableData *data;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5[2] = self->_type;
  data = self->_data;
  if (data)
    v5[1] = -[NSMutableData copyWithZone:](data, "copyWithZone:", a3);
  return v5;
}

- (void)fillData:(id)a3 offset:(unint64_t)a4
{
  -[NSMutableData appendBytes:length:](self->_data, "appendBytes:length:", (char *)objc_msgSend(a3, "bytes") + a4, (char *)objc_msgSend(a3, "length") - a4);
}

- (id)map
{
  return objc_msgSend(objc_alloc((Class)getMDLMeshBufferMapClass[0]()), "initWithBytes:deallocator:", -[NSMutableData bytes](self->_data, "bytes"), 0);
}

- (MDLMeshBufferAllocator)allocator
{
  return self->_allocator;
}

- (MDLMeshBufferZone)zone
{
  return self->_zone;
}

@end
