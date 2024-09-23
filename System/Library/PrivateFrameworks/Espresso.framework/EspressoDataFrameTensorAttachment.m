@implementation EspressoDataFrameTensorAttachment

- (void)loadFromDict:(id)a3 frameStorage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  $70B10377DC9035999D77C63B14D421A0 *p_buffer;
  std::vector<int>::size_type v10;
  char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t width;
  unint64_t height;
  unint64_t channels;
  unint64_t batch_number;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  objc_super v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)EspressoDataFrameTensorAttachment;
  -[EspressoDataFrameAttachment loadFromDict:frameStorage:](&v30, sel_loadFromDict_frameStorage_, v6, v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shape"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  p_buffer = &self->buffer;
  *(_OWORD *)&self->buffer.data = 0u;
  *(_OWORD *)self->buffer.dim = 0u;
  *(_OWORD *)&self->buffer.dim[2] = 0u;
  *(_OWORD *)self->buffer.stride = 0u;
  *(_OWORD *)&self->buffer.stride[2] = 0u;
  *(_OWORD *)&self->buffer.width = 0u;
  *(_OWORD *)&self->buffer.channels = 0u;
  *(_OWORD *)&self->buffer.sequence_length = 0u;
  *(_OWORD *)&self->buffer.stride_height = 0u;
  *(_OWORD *)&self->buffer.stride_batch_number = 0u;
  *(_QWORD *)&self->buffer.storage_type = 0;
  self->buffer.data = -[EspressoDataFrameAttachment rawPointer](self, "rawPointer");
  if ((unint64_t)objc_msgSend(v8, "count") > 3)
  {
    if (objc_msgSend(v8, "count") == 5)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      p_buffer->width = objc_msgSend(v14, "unsignedLongLongValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      p_buffer->height = objc_msgSend(v15, "unsignedLongLongValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      p_buffer->channels = objc_msgSend(v16, "unsignedLongLongValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      p_buffer->batch_number = objc_msgSend(v17, "unsignedLongLongValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      p_buffer->sequence_length = objc_msgSend(v18, "unsignedLongLongValue");

    }
    else
    {
      if (objc_msgSend(v8, "count") != 4)
        Espresso::throw_exception_selector<Espresso::io_error>("shape must have 1,2,3,4, or 5 entries.");
      objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      p_buffer->width = objc_msgSend(v19, "unsignedLongLongValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      p_buffer->height = objc_msgSend(v20, "unsignedLongLongValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      p_buffer->channels = objc_msgSend(v21, "unsignedLongLongValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      p_buffer->batch_number = objc_msgSend(v22, "unsignedLongLongValue");

      p_buffer->sequence_length = 1;
    }
  }
  else
  {
    v10 = objc_msgSend(v8, "count");
    v11 = (char *)&v29 - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v10)
    {
      v12 = 0;
      do
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v11[8 * v12] = objc_msgSend(v13, "unsignedLongLongValue");

        ++v12;
      }
      while (v10 != v12);
    }
    espresso_buffer_pack_tensor_shape((uint64_t)p_buffer, v10, (uint64_t)v11);
  }
  width = p_buffer->width;
  height = p_buffer->height;
  p_buffer->stride_width = 1;
  p_buffer->stride_height = width;
  channels = p_buffer->channels;
  batch_number = p_buffer->batch_number;
  v27 = channels * height * width;
  p_buffer->stride_channels = height * width;
  p_buffer->stride_batch_number = v27;
  v28 = batch_number * v27;
  p_buffer->stride_sequence_length = v28;
  p_buffer->dim[0] = width;
  p_buffer->dim[1] = height;
  p_buffer->dim[2] = channels;
  p_buffer->dim[3] = batch_number;
  p_buffer->stride[0] = 4;
  p_buffer->stride[1] = 4 * width;
  p_buffer->stride[2] = 4 * height * width;
  p_buffer->stride[3] = 4 * v28;
  p_buffer->storage_type = 65568;

}

- ($FD4688982923A924290ECB669CAF1EC2)copyAsEspressoBuffer
{
  $70B10377DC9035999D77C63B14D421A0 *p_buffer;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  size_t v10;
  void *v11;
  size_t size;

  p_buffer = &self->buffer;
  v5 = *(_OWORD *)&self->buffer.stride_batch_number;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self->buffer.stride_height;
  *(_OWORD *)&retstr->var12 = v5;
  *(_QWORD *)&retstr->var14 = *(_QWORD *)&self->buffer.storage_type;
  v6 = *(_OWORD *)&self->buffer.width;
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self->buffer.stride[2];
  *(_OWORD *)&retstr->var4 = v6;
  v7 = *(_OWORD *)&self->buffer.sequence_length;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self->buffer.channels;
  *(_OWORD *)&retstr->var8 = v7;
  v8 = *(_OWORD *)self->buffer.dim;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->buffer.data;
  *(_OWORD *)retstr->var2 = v8;
  v9 = *(_OWORD *)self->buffer.stride;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self->buffer.dim[2];
  *(_OWORD *)retstr->var3 = v9;
  size = 0;
  if (espresso_buffer_get_size((uint64_t)&self->buffer, (char *)&size))
    Espresso::throw_exception_selector<Espresso::generic_error>("Failed to obtain blob size, Blob copy terminated");
  v10 = size;
  v11 = malloc_type_malloc(size, 0x68B7180AuLL);
  retstr->var0 = v11;
  return ($FD4688982923A924290ECB669CAF1EC2 *)memcpy(v11, p_buffer->data, v10);
}

+ ($FD4688982923A924290ECB669CAF1EC2)copyFromCVPixelBuffer:(SEL)a3
{
  vImagePixelCount Width;
  size_t Height;
  char *BaseAddress;
  size_t BytesPerRow;
  size_t v10;
  char *v11;
  $FD4688982923A924290ECB669CAF1EC2 *result;
  int64x2_t v13;
  char *v14;
  unint64_t v15;
  vImage_Buffer dest;
  vImage_Buffer src;

  Width = CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight(a4);
  v14 = (char *)malloc_type_malloc(4 * Width * Height, 0x51F7E33BuLL);
  CVPixelBufferLockBaseAddress(a4, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a4);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
  v15 = Height;
  if (Height)
  {
    v10 = BytesPerRow;
    v11 = v14;
    do
    {
      src.data = BaseAddress;
      src.height = 1;
      src.width = Width;
      src.rowBytes = 2 * Width;
      dest.data = v11;
      dest.height = 1;
      dest.width = Width;
      dest.rowBytes = 4 * Width;
      vImageConvert_Planar16FtoPlanarF(&src, &dest, 0);
      v11 += 4 * Width;
      BaseAddress += v10;
      --Height;
    }
    while (Height);
  }
  result = ($FD4688982923A924290ECB669CAF1EC2 *)CVPixelBufferUnlockBaseAddress(a4, 0);
  retstr->var0 = v14;
  *(_OWORD *)&retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2[1] = 0u;
  *(_OWORD *)&retstr->var2[3] = 0u;
  *(_OWORD *)&retstr->var3[1] = 0u;
  retstr->var3[3] = 0;
  retstr->var4 = Width;
  retstr->var5 = v15;
  v13 = vdupq_n_s64(1uLL);
  *(int64x2_t *)&retstr->var6 = v13;
  *(int64x2_t *)&retstr->var8 = v13;
  retstr->var10 = Width;
  retstr->var11 = v15 * Width;
  retstr->var12 = v15 * Width;
  retstr->var13 = v15 * Width;
  retstr->var14 = 65568;
  return result;
}

@end
