@implementation NUMutablePixelBuffer

- (NUMutablePixelBuffer)initWithSize:(id)a3 format:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v7;
  void *v8;
  NUMutablePixelBuffer *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NUBufferStorage *storage;
  NUBufferStorage *v14;
  NUMutableBufferAdapter *v15;
  NUMutableBuffer *buffer;
  NSObject *v18;
  void *v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[4];
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  var1 = a3.var1;
  var0 = a3.var0;
  v40 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!v7)
  {
    NUAssertLogger_23626();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "format != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_23626();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v26 = (void *)MEMORY[0x1E0CB3978];
        v27 = v25;
        objc_msgSend(v26, "callStackSymbols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v25;
        v38 = 2114;
        v39 = v29;
        _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v24;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMutablePixelBuffer initWithSize:format:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPixelBuffer.m", 93, CFSTR("Invalid parameter not satisfying: %s"), v30, v31, v32, v33, (uint64_t)"format != nil");
  }
  v8 = v7;
  v35.receiver = self;
  v35.super_class = (Class)NUMutablePixelBuffer;
  v9 = -[NUMutablePixelBuffer init](&v35, sel_init);
  +[NUFactory sharedFactory](NUFactory, "sharedFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bufferFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "newStorageWithSize:format:", var0, var1, v8);
  storage = v9->_storage;
  v9->_storage = (NUBufferStorage *)v12;

  v14 = v9->_storage;
  v34[0] = 0;
  v34[1] = 0;
  v34[2] = var0;
  v34[3] = var1;
  -[_NUAbstractStorage validateRect:](v14, "validateRect:", v34);
  v15 = -[NUMutableBufferAdapter initWithSize:format:rowBytes:mutableBytes:]([NUMutableBufferAdapter alloc], "initWithSize:format:rowBytes:mutableBytes:", var0, var1, v8, -[NUBufferStorage rowBytes](v9->_storage, "rowBytes"), -[NUBufferStorage mutableBytes](v9->_storage, "mutableBytes"));
  buffer = v9->_buffer;
  v9->_buffer = (NUMutableBuffer *)v15;

  return v9;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t v2;
  int64_t v3;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v2 = -[NUMutableBuffer size](self->_buffer, "size");
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NUPixelFormat)format
{
  return (NUPixelFormat *)-[NUMutableBuffer format](self->_buffer, "format");
}

- (int64_t)rowBytes
{
  return -[NUMutableBuffer rowBytes](self->_buffer, "rowBytes");
}

- (const)bytes
{
  return (const void *)-[NUMutableBuffer bytes](self->_buffer, "bytes");
}

- (void)mutableBytes
{
  return (void *)-[NUMutableBuffer mutableBytes](self->_buffer, "mutableBytes");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NUBufferStorage *storage;
  NUMutableBuffer *buffer;
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
  v7.super_class = (Class)NUMutablePixelBuffer;
  -[NUMutablePixelBuffer dealloc](&v7, sel_dealloc);
}

- (const)bytesAtPoint:(id)a3
{
  return (const void *)-[NUMutableBuffer bytesAtPoint:](self->_buffer, "bytesAtPoint:", a3.var0, a3.var1);
}

- (void)mutableBytesAtPoint:(id)a3
{
  return (void *)-[NUMutableBuffer mutableBytesAtPoint:](self->_buffer, "mutableBytesAtPoint:", a3.var0, a3.var1);
}

- (id)privateInit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUMutablePixelBuffer;
  return -[NUMutablePixelBuffer init](&v3, sel_init);
}

- (id)newRenderDestination
{
  void *v2;

  v2 = (void *)-[NUMutableBuffer newRenderDestination](self->_buffer, "newRenderDestination");
  objc_msgSend(v2, "setLabel:", CFSTR("NUPixelBuffer-new"));
  return v2;
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
  v8 = -[NUMutablePixelBuffer size](self, "size");
  v10 = v9;
  -[NUMutablePixelBuffer format](self, "format");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "newStorageWithSize:format:", v8, v10, v11);
  v13 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v12;

  v14 = *(void **)(v5 + 8);
  storage = self->_storage;
  v26[0] = 0;
  v26[1] = 0;
  v26[2] = -[NUMutablePixelBuffer size](self, "size");
  v26[3] = v16;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "copyFromStorage:region:", storage, v17);

  v18 = [NUBufferAdapter alloc];
  v19 = -[NUMutablePixelBuffer size](self, "size");
  v21 = v20;
  -[NUMutablePixelBuffer format](self, "format");
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
  v5 = -[NUMutablePixelBuffer size](self, "size");
  v7 = v6;
  -[NUMutablePixelBuffer format](self, "format");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NUMutablePixelBuffer initWithSize:format:](v4, "initWithSize:format:", v5, v7, v8);

  storage = v9->_storage;
  v11 = self->_storage;
  v15[0] = 0;
  v15[1] = 0;
  v15[2] = -[NUMutablePixelBuffer size](self, "size");
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

  v3 = -[NUMutablePixelBuffer size](self, "size");
  +[NUImageLayout contiguousLayoutForImageSize:](NUImageLayout, "contiguousLayoutForImageSize:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUMutablePixelBuffer format](self, "format");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUColorSpace genericRGBLinearColorSpace](NUColorSpace, "genericRGBLinearColorSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUImageFactory bufferImageWithLayout:format:colorSpace:](NUImageFactory, "bufferImageWithLayout:format:colorSpace:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = 0;
  v12[1] = 0;
  v12[2] = -[NUMutablePixelBuffer size](self, "size");
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
