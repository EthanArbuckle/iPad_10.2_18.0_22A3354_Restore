@implementation NUPixelBuffer

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t v2;
  int64_t v3;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v2 = -[NUBuffer size](self->_buffer, "size");
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NUPixelFormat)format
{
  return (NUPixelFormat *)-[NUBuffer format](self->_buffer, "format");
}

- (int64_t)rowBytes
{
  return -[NUBuffer rowBytes](self->_buffer, "rowBytes");
}

- (const)bytes
{
  return (const void *)-[NUBuffer bytes](self->_buffer, "bytes");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NUBufferStorage *storage;
  NUBuffer *buffer;
  objc_super v7;

  +[NUFactory sharedFactory](NUFactory, "sharedFactory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bufferFactory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "returnStorage:", self->_storage);

  storage = self->_storage;
  self->_storage = 0;

  buffer = self->_buffer;
  self->_buffer = 0;

  v7.receiver = self;
  v7.super_class = (Class)NUPixelBuffer;
  -[NUPixelBuffer dealloc](&v7, sel_dealloc);
}

- (const)bytesAtPoint:(id)a3
{
  return (const void *)-[NUBuffer bytesAtPoint:](self->_buffer, "bytesAtPoint:", a3.var0, a3.var1);
}

- (id)privateInit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUPixelBuffer;
  return -[NUPixelBuffer init](&v3, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  NUPixelBuffer *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NUBufferStorage *storage;
  uint64_t v16;
  void *v17;
  NUBufferAdapter *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[4];

  v4 = [NUPixelBuffer alloc];
  -[NUPixelBuffer privateInit](v4, "privateInit");
  v5 = objc_claimAutoreleasedReturnValue();

  +[NUFactory sharedFactory](NUFactory, "sharedFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bufferFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NUPixelBuffer size](self, "size");
  v10 = v9;
  -[NUPixelBuffer format](self, "format");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "newStorageWithSize:format:", v8, v10, v11);
  v13 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v12;

  v14 = *(void **)(v5 + 8);
  storage = self->_storage;
  v26[0] = 0;
  v26[1] = 0;
  v26[2] = -[NUPixelBuffer size](self, "size");
  v26[3] = v16;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "copyFromStorage:region:", storage, v17);

  v18 = [NUBufferAdapter alloc];
  v19 = -[NUPixelBuffer size](self, "size");
  v21 = v20;
  -[NUPixelBuffer format](self, "format");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[NUBufferAdapter initWithSize:format:rowBytes:bytes:](v18, "initWithSize:format:rowBytes:bytes:", v19, v21, v22, objc_msgSend(*(id *)(v5 + 8), "rowBytes"), objc_msgSend(*(id *)(v5 + 8), "bytes"));
  v24 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v23;

  return (id)v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NUMutablePixelBuffer *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NUMutablePixelBuffer *v9;
  NUBufferStorage *storage;
  NUBufferStorage *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[4];

  v4 = [NUMutablePixelBuffer alloc];
  v5 = -[NUPixelBuffer size](self, "size");
  v7 = v6;
  -[NUPixelBuffer format](self, "format");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NUMutablePixelBuffer initWithSize:format:](v4, "initWithSize:format:", v5, v7, v8);

  storage = v9->_storage;
  v11 = self->_storage;
  v15[0] = 0;
  v15[1] = 0;
  v15[2] = -[NUPixelBuffer size](self, "size");
  v15[3] = v12;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUAbstractBufferStorage copyFromStorage:region:](storage, "copyFromStorage:region:", v11, v13);

  return v9;
}

- (id)debugQuickLookObject
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[4];

  v3 = -[NUPixelBuffer size](self, "size");
  +[NUImageLayout contiguousLayoutForImageSize:](NUImageLayout, "contiguousLayoutForImageSize:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUPixelBuffer format](self, "format");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUColorSpace genericRGBLinearColorSpace](NUColorSpace, "genericRGBLinearColorSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUImageFactory bufferImageWithLayout:format:colorSpace:](NUImageFactory, "bufferImageWithLayout:format:colorSpace:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = 0;
  v12[1] = 0;
  v12[2] = -[NUPixelBuffer size](self, "size");
  v12[3] = v9;
  +[NUImageUtilities copyPixelsToImage:atPoint:fromBuffer:inRect:](NUImageUtilities, "copyPixelsToImage:atPoint:fromBuffer:inRect:", v8, 0, 0, self, v12);
  v10 = +[NUImageFactory newCIImageFromBufferImage:](NUImageFactory, "newCIImageFromBufferImage:", v8);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
