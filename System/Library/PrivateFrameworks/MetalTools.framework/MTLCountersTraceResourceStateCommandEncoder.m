@implementation MTLCountersTraceResourceStateCommandEncoder

- (id)init:(BinaryBuffer *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLCountersTraceResourceStateCommandEncoder;
  return -[MTLCountersTraceCommandEncoder init:flags:](&v4, sel_init_flags_, a3, 8);
}

- (void)updateTextureMappings:(id)a3 mode:(unint64_t)a4 regions:(id *)a5 mipLevels:(const unint64_t *)a6 slices:(const unint64_t *)a7 numRegions:(unint64_t)a8
{
  AppendBuffer *stream;
  __int16 __src;
  char v10;
  unint64_t v11;
  char v12;
  const $1A7EE345FBD7959593737C54B12A4BDF *v13;
  char v14;
  const unint64_t *v15;
  char v16;
  const unint64_t *v17;
  char v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  stream = (AppendBuffer *)self->super._stream;
  v22[1] = v22;
  __src = -32511;
  v10 = 100;
  v11 = a4;
  v12 = 109;
  v13 = a5;
  v14 = 109;
  v15 = a6;
  v16 = 109;
  v17 = a7;
  v18 = 100;
  v19 = a8;
  v20 = 16;
  v22[0] = &v21;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0x30uLL);
}

- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 region:(id *)a5 mipLevel:(unint64_t)a6 slice:(unint64_t)a7
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v9 = a4;
  v7 = a7;
  v8 = a6;
  BinaryBuffer::Append<MTLSparseTextureMappingMode,MTLRegion,unsigned long,unsigned long>((AppendBuffer *)self->super._stream, 128, (uint64_t *)&v9, (uint64_t *)a5, (uint64_t *)&v8, (uint64_t *)&v7);
}

- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 indirectBuffer:(id)a5 indirectBufferOffset:(unint64_t)a6
{
  AppendBuffer *stream;
  __int16 __src;
  char v8;
  unint64_t v9;
  char v10;
  id v11;
  char v12;
  unint64_t v13;
  char v14;
  __int16 v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  stream = (AppendBuffer *)self->super._stream;
  v16[1] = v16;
  __src = -32255;
  v8 = 100;
  v9 = a4;
  v10 = 109;
  v11 = a5;
  v12 = 100;
  v13 = a6;
  v14 = 16;
  v16[0] = &v15;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0x1EuLL);
}

- (void)copyMappingStateFromTexture:(id)a3 mipLevel:(unint64_t)a4 slice:(unint64_t)a5 toBuffer:(id)a6 offset:(unint64_t)a7 numTiles:(unint64_t)a8
{
  AppendBuffer *stream;
  __int16 __src;
  char v10;
  id v11;
  char v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  id v17;
  char v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  char v22;
  _BYTE v23[7];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  stream = (AppendBuffer *)self->super._stream;
  v24[1] = v24;
  __src = -31999;
  v10 = 109;
  v11 = a3;
  v12 = 100;
  v13 = a4;
  v14 = 100;
  v15 = a5;
  v16 = 109;
  v17 = a6;
  v18 = 100;
  v19 = a7;
  v20 = 100;
  v21 = a8;
  v22 = 16;
  v24[0] = v23;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 0x39uLL);
}

- (void)moveTextureMappingsFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  id v11;
  unint64_t v12;
  unint64_t v13;
  id v14;

  v13 = a4;
  v14 = a3;
  v12 = a5;
  v11 = a8;
  BinaryBuffer::Append<objc_object  {objcproto10MTLTexture}*,unsigned long,unsigned long,MTLOrigin,MTLSize,objc_object  {objcproto10MTLTexture},unsigned long,unsigned long,objc_object  {objcproto10MTLTexture}*>((AppendBuffer *)self->super._stream, 132, (uint64_t *)&v14, (uint64_t *)&v13, (uint64_t *)&v12, (uint64_t *)a6, (uint64_t *)a7, (uint64_t *)&v11, (uint64_t *)&a9, (uint64_t *)&a10, (uint64_t *)a11);
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

@end
