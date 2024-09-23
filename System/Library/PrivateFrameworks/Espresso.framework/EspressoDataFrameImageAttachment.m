@implementation EspressoDataFrameImageAttachment

- (vImage_Buffer)copyAsImageGrayscaleOrBGRA
{
  vImage_Buffer *p_buffer;
  vImagePixelCount height;
  vImagePixelCount width;
  uint64_t nChannels;
  vImage_Buffer *result;
  uint64_t i;
  uint8_t permuteMap[4];

  p_buffer = &self->buffer;
  height = self->buffer.height;
  width = self->buffer.width;
  nChannels = self->_nChannels;
  switch((_DWORD)nChannels)
  {
    case 1:
      result = (vImage_Buffer *)vImageBuffer_Init(retstr, height, width, 8u, 0);
      if (height)
      {
        for (i = 0; i != height; ++i)
          result = (vImage_Buffer *)memcpy((char *)retstr->data + retstr->rowBytes * i, (char *)p_buffer->data + p_buffer->rowBytes * i, width);
      }
      break;
    case 4:
      vImageBuffer_Init(retstr, height, width, 0x20u, 0);
      *(_DWORD *)permuteMap = 50331906;
      return (vImage_Buffer *)vImagePermuteChannels_ARGB8888(p_buffer, retstr, permuteMap, 0);
    case 3:
      vImageBuffer_Init(retstr, height, width, 0x20u, 0);
      return (vImage_Buffer *)vImageConvert_RGB888toBGRA8888(p_buffer, 0, 0, retstr, 0, 0);
    default:
      Espresso::throw_exception_selector<Espresso::invalid_state_error,int &>("Unsupported number of channels: %d", nChannels);
  }
  return result;
}

- (void)loadFromDict:(id)a3 frameStorage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  vImage_Buffer *p_buffer;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EspressoDataFrameImageAttachment;
  -[EspressoDataFrameAttachment loadFromDict:frameStorage:](&v14, sel_loadFromDict_frameStorage_, v6, a4);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shape"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("row_bytes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");

  p_buffer = &self->buffer;
  self->buffer.data = -[EspressoDataFrameAttachment rawPointer](self, "rawPointer");
  objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_nChannels = objc_msgSend(v11, "intValue");

  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  p_buffer->width = (int)objc_msgSend(v12, "intValue");

  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  p_buffer->height = (int)objc_msgSend(v13, "intValue");

  p_buffer->rowBytes = v9;
}

- (int)nChannels
{
  return self->_nChannels;
}

- (void)setNChannels:(int)a3
{
  self->_nChannels = a3;
}

+ (__CVBuffer)createCVPixelBufferFromvImage:(vImage_Buffer *)a3 withPixelFormat:(unsigned int)a4
{
  const __CFAllocator *v7;
  vImagePixelCount width;
  size_t rowBytes;
  char *data;
  vImagePixelCount height;
  CVReturn v12;
  char *BaseAddress;
  size_t BytesPerRow;
  size_t v15;
  vImagePixelCount v16;
  char v17;
  __CVBuffer *result;
  CVPixelBufferRef pixelBuffer;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (a4 != 1278226488 && a4 != 1111970369)
    return 0;
  pixelBuffer = 0;
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  width = a3->width;
  rowBytes = a3->rowBytes;
  data = (char *)a3->data;
  height = a3->height;
  v20 = *MEMORY[0x1E0CA8FF0];
  v21[0] = MEMORY[0x1E0C9AA70];
  v12 = CVPixelBufferCreate(v7, width, height, a4, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1), &pixelBuffer);
  result = 0;
  if (!v12)
  {
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
    BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
    if (a3->height)
    {
      v15 = BytesPerRow;
      v16 = 0;
      v17 = 2 * (a4 != 1278226488);
      do
      {
        memcpy(BaseAddress, data, a3->width << v17);
        ++v16;
        data += rowBytes;
        BaseAddress += v15;
      }
      while (v16 < a3->height);
    }
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    return pixelBuffer;
  }
  return result;
}

@end
