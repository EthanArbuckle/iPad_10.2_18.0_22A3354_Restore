@implementation CSUPixelBufferDescriptor

- (__CVBuffer)createNewBuffer:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int isIOSurfaceBacked;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFAllocator *v24;
  __CFDictionary *Mutable;
  CFMutableDictionaryRef v26;
  CFNumberRef v27;
  CVReturn v28;
  __CVBuffer *v29;
  std::runtime_error *exception;
  std::runtime_error *v32;
  std::string *v33;
  __int128 v34;
  size_t v35;
  size_t v36;
  OSType pixelFormatType;
  uint64_t v38;
  char v39;
  std::string v40;
  std::string v41;
  CVPixelBufferRef pixelBufferOut;

  v35 = objc_msgSend_width(self, a2, (uint64_t)a3, v3, v4);
  v10 = objc_msgSend_height(self, v6, v7, v8, v9);
  v36 = v10;
  pixelFormatType = objc_msgSend_pixelFormat(self, v11, v12, v13, v14);
  isIOSurfaceBacked = objc_msgSend_isIOSurfaceBacked(self, v15, v16, v17, v18);
  v38 = objc_msgSend_bytesPerRowAlignment(self, v20, v21, v22, v23);
  v39 = 1;
  if (!v35 || !v10)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Invalid dimensions requested for CVPixelBuffer creation.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  pixelBufferOut = 0;
  v24 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (isIOSurfaceBacked)
  {
    v26 = CFDictionaryCreateMutable(v24, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC5668], v26);
    if (v26)
      CFRelease(v26);
  }
  v27 = CFNumberCreate(v24, kCFNumberSInt64Type, &v38);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC55D0], v27);
  CFRelease(v27);
  v28 = CVPixelBufferCreate(v24, v35, v36, pixelFormatType, Mutable, &pixelBufferOut);
  if (v28)
  {
    v32 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v40, v28);
    v33 = std::string::insert(&v40, 0, "Failed to create CVPixelBuffer. Status = ", 0x29uLL);
    v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
    v41.__r_.__value_.__r.__words[2] = v33->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v41.__r_.__value_.__l.__data_ = v34;
    v33->__r_.__value_.__l.__size_ = 0;
    v33->__r_.__value_.__r.__words[2] = 0;
    v33->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(v32, &v41);
    __cxa_throw(v32, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  v29 = pixelBufferOut;
  if (Mutable)
    CFRelease(Mutable);
  return v29;
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (unint64_t)height
{
  return self->_height;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unsigned int)a3
{
  self->_pixelFormat = a3;
}

- (unint64_t)bytesPerRowAlignment
{
  return self->_bytesPerRowAlignment;
}

- (void)setBytesPerRowAlignment:(unint64_t)a3
{
  self->_bytesPerRowAlignment = a3;
}

- (BOOL)isIOSurfaceBacked
{
  return self->_isIOSurfaceBacked;
}

- (void)setIsIOSurfaceBacked:(BOOL)a3
{
  self->_isIOSurfaceBacked = a3;
}

@end
