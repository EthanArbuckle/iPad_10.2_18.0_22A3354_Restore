@implementation _OSLogChunkMemory

- (void)dealloc
{
  objc_super v3;

  (*((void (**)(void))self->_deallocator + 2))();
  v3.receiver = self;
  v3.super_class = (Class)_OSLogChunkMemory;
  -[_OSLogChunkMemory dealloc](&v3, sel_dealloc);
}

- (_OSLogChunkMemory)initWithBytes:(const void *)a3 size:(unint64_t)a4 deallocator:(id)a5
{
  id v8;
  _OSLogChunkMemory *v9;
  uint64_t v10;
  id deallocator;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_OSLogChunkMemory;
  v9 = -[_OSLogChunkStore initWithBytes:size:](&v13, sel_initWithBytes_size_, a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    deallocator = v9->_deallocator;
    v9->_deallocator = (id)v10;

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deallocator, 0);
}

@end
