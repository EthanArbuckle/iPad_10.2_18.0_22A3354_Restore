@implementation MTLCountersTraceBlitCommandEncoder

- (id)init:(BinaryBuffer *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLCountersTraceBlitCommandEncoder;
  return -[MTLCountersTraceCommandEncoder init:flags:](&v4, sel_init_flags_, a3, 1);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 toBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7
{
  AppendBuffer *stream;
  __int16 __src;
  char v9;
  id v10;
  char v11;
  unint64_t v12;
  char v13;
  id v14;
  char v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  stream = (AppendBuffer *)self->super._stream;
  v21[1] = v21;
  __src = 1;
  v9 = 109;
  v10 = a3;
  v11 = 100;
  v12 = a4;
  v13 = 109;
  v14 = a5;
  v15 = 100;
  v16 = a6;
  v17 = 100;
  v18 = a7;
  v19 = 16;
  v21[0] = &v20;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0x30uLL);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  id v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;

  v14 = a4;
  v15 = a3;
  v13 = a5;
  v11 = a8;
  v12 = a6;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long,unsigned long,unsigned long,MTLSize,objc_object  {objcproto10MTLTexture}*,unsigned long,unsigned long,MTLOrigin>((AppendBuffer *)self->super._stream, 1, (uint64_t *)&v15, (uint64_t *)&v14, (uint64_t *)&v13, (uint64_t *)&v12, (uint64_t *)a7, (uint64_t *)&v11, (uint64_t *)&a9, (uint64_t *)&a10, (uint64_t *)a11);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  id v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;

  v15 = a4;
  v16 = a3;
  v13 = a6;
  v14 = a5;
  v12 = a8;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long,unsigned long,unsigned long,MTLSize,objc_object  {objcproto10MTLTexture}*,unsigned long,unsigned long,MTLOrigin,unsigned long>((AppendBuffer *)self->super._stream, 2, (uint64_t *)&v16, (uint64_t *)&v15, (uint64_t *)&v14, (uint64_t *)&v13, (uint64_t *)a7, (uint64_t *)&v12, (uint64_t *)&a9, (uint64_t *)&a10, (uint64_t *)a11, (uint64_t *)&a12);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  id v11;
  unint64_t v12;
  unint64_t v13;
  id v14;

  v13 = a4;
  v14 = a3;
  v12 = a5;
  v11 = a8;
  BinaryBuffer::Append<objc_object  {objcproto10MTLTexture}*,unsigned long,unsigned long,MTLOrigin,MTLSize,objc_object  {objcproto10MTLTexture},unsigned long,unsigned long,objc_object  {objcproto10MTLTexture}*>((AppendBuffer *)self->super._stream, 5, (uint64_t *)&v14, (uint64_t *)&v13, (uint64_t *)&v12, (uint64_t *)a6, (uint64_t *)a7, (uint64_t *)&v11, (uint64_t *)&a9, (uint64_t *)&a10, (uint64_t *)a11);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  BinaryBuffer *stream;
  id v13;
  unint64_t v14;
  unint64_t v15;
  id v16;

  v15 = a4;
  v16 = a3;
  v14 = a5;
  stream = self->super._stream;
  v13 = a8;
  BinaryBuffer::Append<objc_object  {objcproto10MTLTexture}*,unsigned long,unsigned long,MTLOrigin,MTLSize,objc_object  {objcproto10MTLTexture},unsigned long,unsigned long,objc_object  {objcproto10MTLTexture}*,unsigned long>((AppendBuffer *)stream, 6, (uint64_t *)&v16, (uint64_t *)&v15, (uint64_t *)&v14, (uint64_t *)a6, (uint64_t *)a7, (uint64_t *)&v13, (uint64_t *)&a9, (uint64_t *)&a10, (uint64_t *)a11, (uint64_t *)&a12);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11
{
  id v11;
  unint64_t v12;
  unint64_t v13;
  id v14;

  v13 = a4;
  v14 = a3;
  v12 = a5;
  v11 = a8;
  BinaryBuffer::Append<objc_object  {objcproto10MTLTexture}*,unsigned long,unsigned long,MTLOrigin,MTLSize,objc_object  {objcproto9MTLBuffer}*,unsigned long,unsigned long,unsigned long>((AppendBuffer *)self->super._stream, 3, (uint64_t *)&v14, (uint64_t *)&v13, (uint64_t *)&v12, (uint64_t *)a6, (uint64_t *)a7, (uint64_t *)&v11, (uint64_t *)&a9, (uint64_t *)&a10, (uint64_t *)&a11);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12
{
  BinaryBuffer *stream;
  id v13;
  unint64_t v14;
  unint64_t v15;
  id v16;

  v15 = a4;
  v16 = a3;
  v14 = a5;
  stream = self->super._stream;
  v13 = a8;
  BinaryBuffer::Append<objc_object  {objcproto10MTLTexture}*,unsigned long,unsigned long,MTLOrigin,MTLSize,objc_object  {objcproto9MTLBuffer}*,unsigned long,unsigned long,unsigned long,unsigned long>((AppendBuffer *)stream, 4, (uint64_t *)&v16, (uint64_t *)&v15, (uint64_t *)&v14, (uint64_t *)a6, (uint64_t *)a7, (uint64_t *)&v13, (uint64_t *)&a9, (uint64_t *)&a10, (uint64_t *)&a11, (uint64_t *)&a12);
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 value:(unsigned __int8)a5
{
  unsigned __int8 v5;
  id v6;
  _NSRange v7;

  v7 = a4;
  v6 = a3;
  v5 = a5;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,_NSRange,unsigned char>((AppendBuffer *)self->super._stream, 7, (uint64_t *)&v6, (uint64_t *)&v7, (char *)&v5);
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5
{
  unsigned int v5;
  id v6;
  _NSRange v7;

  v7 = a4;
  v6 = a3;
  v5 = a5;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,_NSRange,unsigned int>((AppendBuffer *)self->super._stream, 8, (uint64_t *)&v6, (uint64_t *)&v7, (int *)&v5);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8
{
  unint64_t v8;
  const void *v9;
  unint64_t v10;
  unint64_t v11;
  id v12;

  v11 = a4;
  v12 = a3;
  v9 = a7;
  v10 = a5;
  v8 = a8;
  BinaryBuffer::Append<objc_object  {objcproto10MTLTexture}*,unsigned long,unsigned long,MTLRegion,void const*,unsigned long>((AppendBuffer *)self->super._stream, 9, (uint64_t *)&v12, (uint64_t *)&v11, (uint64_t *)&v10, (uint64_t *)a6, (uint64_t *)&v9, (uint64_t *)&v8);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7
{
  unint64_t v7;
  unint64_t v8;
  id v9;
  $01BB1521EC52D44A8E7628F5261DCEC8 v10;

  v10 = a7;
  v8 = a4;
  v9 = a3;
  v7 = a5;
  BinaryBuffer::Append<objc_object  {objcproto10MTLTexture}*,unsigned long,unsigned long,MTLRegion,MTLClearColor>((AppendBuffer *)self->super._stream, 10, (uint64_t *)&v9, (uint64_t *)&v8, (uint64_t *)&v7, (uint64_t *)a6, (uint64_t *)&v10);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7 pixelFormat:(unint64_t)a8
{
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  $01BB1521EC52D44A8E7628F5261DCEC8 v12;

  v12 = a7;
  v10 = a4;
  v11 = a3;
  v8 = a8;
  v9 = a5;
  BinaryBuffer::Append<objc_object  {objcproto10MTLTexture}*,unsigned long,unsigned long,MTLRegion,MTLClearColor,MTLPixelFormat>((AppendBuffer *)self->super._stream, 11, (uint64_t *)&v11, (uint64_t *)&v10, (uint64_t *)&v9, (uint64_t *)a6, (uint64_t *)&v12, (uint64_t *)&v8);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10
{
  BinaryBuffer *stream;
  unint64_t v11;
  unint64_t v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  id v16;

  v15 = a4;
  v16 = a3;
  v14 = a5;
  v12 = a7;
  v13 = a6;
  stream = self->super._stream;
  v11 = a8;
  BinaryBuffer::Append<objc_object  {objcproto10MTLTexture}*,unsigned long,unsigned long,objc_object  {objcproto10MTLTexture},unsigned long,unsigned long,unsigned long,unsigned long>((AppendBuffer *)stream, 12, (uint64_t *)&v16, (uint64_t *)&v15, (uint64_t *)&v14, (uint64_t *)&v13, (uint64_t *)&v12, (uint64_t *)&v11, (uint64_t *)&a9, (uint64_t *)&a10);
}

- (void)copyFromTexture:(id)a3 toTexture:(id)a4
{
  AppendBuffer *stream;
  __int16 __src;
  char v6;
  id v7;
  char v8;
  id v9;
  char v10;
  _BYTE v11[3];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  stream = (AppendBuffer *)self->super._stream;
  v12[1] = v12;
  __src = 3329;
  v6 = 109;
  v7 = a3;
  v8 = 109;
  v9 = a4;
  v10 = 16;
  v12[0] = v11;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0x15uLL);
}

- (void)generateMipmapsForTexture:(id)a3
{
  AppendBuffer *stream;
  __int16 __src;
  char v5;
  id v6;
  char v7;
  int v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  stream = (AppendBuffer *)self->super._stream;
  v9[1] = v9;
  __src = 3585;
  v5 = 109;
  v6 = a3;
  v7 = 16;
  v9[0] = &v8;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0xCuLL);
}

- (void)synchronizeResource:(id)a3
{
  AppendBuffer *stream;
  __int16 __src;
  char v5;
  id v6;
  char v7;
  int v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  stream = (AppendBuffer *)self->super._stream;
  v9[1] = v9;
  __src = 3841;
  v5 = 109;
  v6 = a3;
  v7 = 16;
  v9[0] = &v8;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0xCuLL);
}

- (void)synchronizeTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  AppendBuffer *stream;
  __int16 __src;
  char v7;
  id v8;
  char v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  char v13;
  __int16 v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  stream = (AppendBuffer *)self->super._stream;
  v15[1] = v15;
  __src = 4097;
  v7 = 109;
  v8 = a3;
  v9 = 100;
  v10 = a4;
  v11 = 100;
  v12 = a5;
  v13 = 16;
  v15[0] = &v14;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0x1EuLL);
}

- (void)updateFence:(id)a3
{
  AppendBuffer *stream;
  __int16 __src;
  char v5;
  id v6;
  char v7;
  int v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  stream = (AppendBuffer *)self->super._stream;
  v9[1] = v9;
  __src = 29697;
  v5 = 109;
  v6 = a3;
  v7 = 16;
  v9[0] = &v8;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0xCuLL);
}

- (void)waitForFence:(id)a3
{
  AppendBuffer *stream;
  __int16 __src;
  char v5;
  id v6;
  char v7;
  int v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  stream = (AppendBuffer *)self->super._stream;
  v9[1] = v9;
  __src = 32257;
  v5 = 109;
  v6 = a3;
  v7 = 16;
  v9[0] = &v8;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0xCuLL);
}

- (void)optimizeContentsForGPUAccess:(id)a3
{
  AppendBuffer *stream;
  __int16 __src;
  char v5;
  id v6;
  char v7;
  int v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  stream = (AppendBuffer *)self->super._stream;
  v9[1] = v9;
  __src = 4353;
  v5 = 109;
  v6 = a3;
  v7 = 16;
  v9[0] = &v8;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0xCuLL);
}

- (void)optimizeContentsForGPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  AppendBuffer *stream;
  __int16 __src;
  char v7;
  id v8;
  char v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  char v13;
  __int16 v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  stream = (AppendBuffer *)self->super._stream;
  v15[1] = v15;
  __src = 4609;
  v7 = 109;
  v8 = a3;
  v9 = 100;
  v10 = a4;
  v11 = 100;
  v12 = a5;
  v13 = 16;
  v15[0] = &v14;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0x1EuLL);
}

- (void)optimizeContentsForCPUAccess:(id)a3
{
  AppendBuffer *stream;
  __int16 __src;
  char v5;
  id v6;
  char v7;
  int v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  stream = (AppendBuffer *)self->super._stream;
  v9[1] = v9;
  __src = 4865;
  v5 = 109;
  v6 = a3;
  v7 = 16;
  v9[0] = &v8;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0xCuLL);
}

- (void)optimizeContentsForCPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  AppendBuffer *stream;
  __int16 __src;
  char v7;
  id v8;
  char v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  char v13;
  __int16 v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  stream = (AppendBuffer *)self->super._stream;
  v15[1] = v15;
  __src = 5121;
  v7 = 109;
  v8 = a3;
  v9 = 100;
  v10 = a4;
  v11 = 100;
  v12 = a5;
  v13 = 16;
  v15[0] = &v14;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0x1EuLL);
}

- (void)getTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6 resetCounters:(BOOL)a7 countersBuffer:(id)a8 countersBufferOffset:(unint64_t)a9
{
  id v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;

  v12 = a5;
  v11 = a6;
  v10 = a7;
  v9 = a8;
  BinaryBuffer::Append<MTLRegion,unsigned long,unsigned long,BOOL,objc_object  {objcproto9MTLBuffer}*,unsigned long>((AppendBuffer *)self->super._stream, 21, (uint64_t *)a4, (uint64_t *)&v12, (uint64_t *)&v11, &v10, (uint64_t *)&v9, (uint64_t *)&a9);
}

- (void)resetTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6
{
  AppendBuffer *stream;
  __int16 __src;
  char v8;
  _BYTE v9[5];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  stream = (AppendBuffer *)self->super._stream;
  v10[1] = v10;
  __src = 5633;
  v8 = 16;
  v10[0] = v9;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 3uLL);
}

@end
