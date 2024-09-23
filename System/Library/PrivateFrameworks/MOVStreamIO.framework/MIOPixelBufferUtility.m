@implementation MIOPixelBufferUtility

+ (id)sharedBytesPerPixelLookUp
{
  if (+[MIOPixelBufferUtility sharedBytesPerPixelLookUp]::onceToken != -1)
    dispatch_once(&+[MIOPixelBufferUtility sharedBytesPerPixelLookUp]::onceToken, &__block_literal_global_4);
  return (id)+[MIOPixelBufferUtility sharedBytesPerPixelLookUp]::lookup;
}

void __50__MIOPixelBufferUtility_sharedBytesPerPixelLookUp__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&unk_24CA5C0D8, "mutableCopy");
  v1 = (void *)+[MIOPixelBufferUtility sharedBytesPerPixelLookUp]::lookup;
  +[MIOPixelBufferUtility sharedBytesPerPixelLookUp]::lookup = v0;

}

+ (__CVBuffer)createRawPixelBufferWithWidth:(unsigned int)a3 height:(unsigned int)a4 extendedRows:(unsigned int)a5 extendedPixelsPerRow:(unsigned int)a6 pixelFormat:(int)a7 bytesPerRowAlignment:(unsigned int)a8 planeAlignment:(unsigned int)a9 bufferCacheMode:(unsigned int)a10
{
  __CFDictionary *v13;
  uint64_t v15;
  CVPixelBufferRef pixelBufferOut;

  pixelBufferOut = 0;
  LODWORD(v15) = a10;
  v13 = +[MIOPixelBufferUtility createPixelBufferAttributesWithWidth:height:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:](MIOPixelBufferUtility, "createPixelBufferAttributesWithWidth:height:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8, a9, v15);
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a3, a4, a7, v13, &pixelBufferOut);
  CFRelease(v13);
  return pixelBufferOut;
}

+ (__CVBuffer)createRawPixelBufferWithWidth:(unsigned int)a3 height:(unsigned int)a4 pixelFormat:(int)a5 bytesPerRow:(unsigned int)a6
{
  __CFDictionary *v9;
  CVPixelBufferRef pixelBufferOut;

  pixelBufferOut = 0;
  v9 = +[MIOPixelBufferUtility createPixelBufferAttributesWithWidth:height:pixelFormat:bytesPerRow:](MIOPixelBufferUtility, "createPixelBufferAttributesWithWidth:height:pixelFormat:bytesPerRow:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a3, a4, a5, v9, &pixelBufferOut);
  CFRelease(v9);
  return pixelBufferOut;
}

+ (__CFDictionary)createPixelBufferAttributesWithWidth:(unsigned int)a3 height:(unsigned int)a4 pixelFormat:(int)a5 bytesPerRows:(id)a6
{
  id v6;
  const __CFAllocator *v7;
  __CFDictionary *Mutable;
  CFNumberRef v9;
  void *v10;
  int v11;
  CFNumberRef v12;
  CFNumberRef v13;
  CFNumberRef v14;
  __CFDictionary *v15;
  CFNumberRef v16;
  int v18;
  int v19;
  unsigned int v20;
  unsigned int valuePtr;

  v20 = a4;
  valuePtr = a3;
  v19 = a5;
  v6 = a6;
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v9 = CFNumberCreate(v7, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC5708], v9);
  CFRelease(v9);
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    v18 = v11;
    v12 = CFNumberCreate(v7, kCFNumberIntType, &v18);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC5600], v12);
    CFRelease(v12);
  }
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC5600], v6);
  v13 = CFNumberCreate(v7, kCFNumberIntType, &v20);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC5650], v13);
  CFRelease(v13);
  v14 = CFNumberCreate(v7, kCFNumberIntType, &v19);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC56B8], v14);
  CFRelease(v14);
  v15 = CFDictionaryCreateMutable(v7, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v18 = 0;
  v16 = CFNumberCreate(v7, kCFNumberIntType, &v18);
  CFDictionarySetValue(v15, (const void *)*MEMORY[0x24BDD8E40], v16);
  CFRelease(v16);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC5668], v15);
  CFRelease(v15);

  return Mutable;
}

+ (__CFDictionary)createPixelBufferAttributesWithWidth:(unsigned int)a3 height:(unsigned int)a4 pixelFormat:(int)a5 bytesPerRow:(unsigned int)a6
{
  const __CFAllocator *v7;
  const CFDictionaryKeyCallBacks *v8;
  const CFDictionaryValueCallBacks *v9;
  __CFDictionary *Mutable;
  CFNumberRef v11;
  CFNumberRef v12;
  CFNumberRef v13;
  CFNumberRef v14;
  __CFDictionary *v15;
  CFNumberRef v16;
  int v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  unsigned int valuePtr;

  v21 = a4;
  valuePtr = a3;
  v20 = a5;
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v8 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v9 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v11 = CFNumberCreate(v7, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC5708], v11);
  CFRelease(v11);
  v19 = a6;
  v12 = CFNumberCreate(v7, kCFNumberIntType, &v19);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC5600], v12);
  CFRelease(v12);
  v13 = CFNumberCreate(v7, kCFNumberIntType, &v21);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC5650], v13);
  CFRelease(v13);
  v14 = CFNumberCreate(v7, kCFNumberIntType, &v20);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC56B8], v14);
  CFRelease(v14);
  v15 = CFDictionaryCreateMutable(v7, 0, v8, v9);
  v18 = 0;
  v16 = CFNumberCreate(v7, kCFNumberIntType, &v18);
  CFDictionarySetValue(v15, (const void *)*MEMORY[0x24BDD8E40], v16);
  CFRelease(v16);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC5668], v15);
  CFRelease(v15);
  return Mutable;
}

+ (__CFDictionary)createPixelBufferAttributesWithWidth:(unsigned int)a3 height:(unsigned int)a4 extendedPixelsPerRow:(unsigned int)a5 pixelFormat:(int)a6 bytesPerRowAlignment:(unsigned int)a7 planeAlignment:(unsigned int)a8
{
  const __CFAllocator *v11;
  __CFDictionary *Mutable;
  CFNumberRef v13;
  CFNumberRef v14;
  CFNumberRef v15;
  CFNumberRef v16;
  CFNumberRef v17;
  CFNumberRef v18;
  __CFDictionary *v19;
  CFNumberRef v20;
  int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int valuePtr;

  v27 = a4;
  valuePtr = a3;
  v25 = a6;
  v26 = a5;
  v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v13 = CFNumberCreate(v11, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC5708], v13);
  CFRelease(v13);
  v24 = a7;
  v14 = CFNumberCreate(v11, kCFNumberIntType, &v24);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC55D0], v14);
  CFRelease(v14);
  v15 = CFNumberCreate(v11, kCFNumberIntType, &v27);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC5650], v15);
  CFRelease(v15);
  if (a5)
  {
    v16 = CFNumberCreate(v11, kCFNumberIntType, &v26);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC5628], v16);
    CFRelease(v16);
  }
  v17 = CFNumberCreate(v11, kCFNumberIntType, &v25);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC56B8], v17);
  CFRelease(v17);
  v23 = a8;
  v18 = CFNumberCreate(v11, kCFNumberIntType, &v23);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC56C8], v18);
  CFRelease(v18);
  v19 = CFDictionaryCreateMutable(v11, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v22 = 0;
  v20 = CFNumberCreate(v11, kCFNumberIntType, &v22);
  CFDictionarySetValue(v19, (const void *)*MEMORY[0x24BDD8E40], v20);
  CFRelease(v20);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC5668], v19);
  CFRelease(v19);
  return Mutable;
}

+ (__CFDictionary)createPixelBufferAttributesWithWidth:(unsigned int)a3 height:(unsigned int)a4 extendedPixelsPerRow:(unsigned int)a5 pixelFormat:(int)a6 bytesPerRowAlignment:(unsigned int)a7 planeAlignment:(unsigned int)a8 bufferCacheMode:(int)a9
{
  int v9;
  __CFDictionary *v10;
  const __CFAllocator *v11;
  __CFDictionary *MutableCopy;
  __CFDictionary *Mutable;
  CFNumberRef v14;

  v9 = a9;
  v10 = +[MIOPixelBufferUtility createPixelBufferAttributesWithWidth:height:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:](MIOPixelBufferUtility, "createPixelBufferAttributesWithWidth:height:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, 1, 1);
  v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v10);
  CFRelease(v10);
  if (!v9)
    a9 = 0;
  Mutable = CFDictionaryCreateMutable(v11, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v14 = CFNumberCreate(v11, kCFNumberIntType, &a9);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDD8E40], v14);
  CFRelease(v14);
  CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x24BDC5668], Mutable);
  CFRelease(Mutable);
  return MutableCopy;
}

+ (__CVPixelBufferPool)createPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 extendedPixelsPerRow:(unint64_t)a6 minBufferCount:(unint64_t)a7 bufferCacheMode:(int)a8
{
  __CFDictionary *v9;
  void *v10;
  const __CFDictionary *v11;
  uint64_t v13;
  CVPixelBufferPoolRef poolOut;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  LODWORD(v13) = a8;
  v9 = +[MIOPixelBufferUtility createPixelBufferAttributesWithWidth:height:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:](MIOPixelBufferUtility, "createPixelBufferAttributesWithWidth:height:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:", a3, a4, a6, *(_QWORD *)&a5, 1, 1, v13);
  poolOut = 0;
  v15 = *MEMORY[0x24BDC56F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v11 = (const __CFDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v11, v9, &poolOut);

  CFRelease(v9);
  return poolOut;
}

+ (__CVBuffer)newPixelBufferRefCopy:(__CVBuffer *)a3
{
  __IOSurface *IOSurface;
  const __CFDictionary *v4;
  CVReturn v5;
  NSObject *v6;
  __CVBuffer *v7;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  CVReturn v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  pixelBufferOut = 0;
  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (IOSurfaceGetProhibitUseCount())
  {
    v12 = *MEMORY[0x24BDC55F8];
    v13[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x24BDBD240], IOSurface, v4, &pixelBufferOut);
  if (v5)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v11 = v5;
      _os_log_impl(&dword_210675000, v6, OS_LOG_TYPE_ERROR, "ERROR CREATING PIXELBUFFERREFCOPY %d", buf, 8u);
    }

    v7 = 0;
  }
  else
  {
    v7 = pixelBufferOut;
  }

  return v7;
}

+ (__CVBuffer)newPixelBufferRefCopy:(__CVBuffer *)a3 attachmentKeysToCopy:(id)a4
{
  id v5;
  __IOSurface *IOSurface;
  const __CFDictionary *v7;
  CVReturn v8;
  NSObject *v9;
  __CVBuffer *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  CFTypeRef v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CVPixelBufferRef pixelBufferOut;
  uint8_t v23[128];
  uint8_t buf[4];
  CVReturn v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  IOSurface = CVPixelBufferGetIOSurface(a3);
  pixelBufferOut = 0;
  if (IOSurfaceGetProhibitUseCount())
  {
    v26 = *MEMORY[0x24BDC55F8];
    v27[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x24BDBD240], IOSurface, v7, &pixelBufferOut);
  if (v8)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v25 = v8;
      _os_log_impl(&dword_210675000, v9, OS_LOG_TYPE_ERROR, "ERROR CREATING PIXELBUFFERREFCOPY %d", buf, 8u);
    }

    v10 = 0;
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v11);
          v15 = *(const __CFString **)(*((_QWORD *)&v18 + 1) + 8 * v14);
          *(_DWORD *)buf = 0;
          v16 = CVBufferCopyAttachment(a3, v15, (CVAttachmentMode *)buf);
          if (v16)
          {
            CVBufferSetAttachment(pixelBufferOut, v15, v16, *(CVAttachmentMode *)buf);
            CFRelease(v16);
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v12);
    }

    v10 = pixelBufferOut;
  }

  return v10;
}

+ (BOOL)copyFromPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 andShiftBits:(int)a5
{
  BOOL v5;
  BOOL v6;
  int v10;
  unsigned __int16 *BaseAddressOfPlane;
  unsigned __int16 *v12;
  uint16x8_t *BaseAddress;
  uint16x8_t *v14;
  size_t HeightOfPlane;
  size_t v16;
  size_t BytesPerRowOfPlane;
  unint64_t v18;

  if (a3)
    v5 = a4 == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (!v5)
  {
    if (a5 >= 0)
      LOBYTE(v10) = a5;
    else
      v10 = -a5;
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVPixelBufferLockBaseAddress(a4, 0);
    if (CVPixelBufferIsPlanar(a3))
      BaseAddressOfPlane = (unsigned __int16 *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    else
      BaseAddressOfPlane = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a3);
    v12 = BaseAddressOfPlane;
    if (CVPixelBufferIsPlanar(a4))
      BaseAddress = (uint16x8_t *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
    else
      BaseAddress = (uint16x8_t *)CVPixelBufferGetBaseAddress(a4);
    v14 = BaseAddress;
    if (CVPixelBufferIsPlanar(a3))
      HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
    else
      HeightOfPlane = CVPixelBufferGetHeight(a3);
    v16 = HeightOfPlane;
    if (CVPixelBufferIsPlanar(a3))
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
    else
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(a3);
    v18 = BytesPerRowOfPlane * v16;
    if (a5)
    {
      if (a5 < 1)
        right_shift_uint16_buffer(v12, v14, v18, v10);
      else
        left_shift_uint16_buffer(v12, v14, v18, v10);
    }
    else
    {
      memcpy(v14, v12, v18);
    }
    CVPixelBufferUnlockBaseAddress(a4, 0);
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  }
  return v6;
}

+ (__CVPixelBufferPool)createNewL010PixelBufferPoolWithReferencePixelBuffer:(__CVBuffer *)a3 minimumBufferCount:(unint64_t)a4
{
  size_t Width;
  size_t Height;
  unint64_t v8;
  __CFDictionary *v9;
  void *v10;
  const __CFDictionary *v11;
  CVPixelBufferPoolRef v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v8 = +[MOVStreamIOUtility getPreferredBytesPerRowAlignmentSize](MOVStreamIOUtility, "getPreferredBytesPerRowAlignmentSize");
  v9 = +[MIOPixelBufferUtility createPixelBufferAttributesWithWidth:height:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:](MIOPixelBufferUtility, "createPixelBufferAttributesWithWidth:height:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:", Width, Height, (unint64_t)(int)(CVPixelBufferGetBytesPerRow(a3) % v8) >> 1, 1278226736, v8, +[MOVStreamIOUtility getPreferredPlaneAlignmentSize](MOVStreamIOUtility, "getPreferredPlaneAlignmentSize"));
  v13 = 0;
  v14 = *MEMORY[0x24BDC56F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v11 = (const __CFDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v11, v9, &v13);

  CFRelease(v9);
  return v13;
}

+ (__CVPixelBufferPool)createNewL008PixelBufferPoolWithReferencePixelBuffer:(__CVBuffer *)a3 minimumBufferCount:(unint64_t)a4
{
  size_t Width;
  size_t Height;
  unint64_t v8;
  __CFDictionary *v9;
  void *v10;
  const __CFDictionary *v11;
  CVPixelBufferPoolRef v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v8 = +[MOVStreamIOUtility getPreferredBytesPerRowAlignmentSize](MOVStreamIOUtility, "getPreferredBytesPerRowAlignmentSize");
  v9 = +[MIOPixelBufferUtility createPixelBufferAttributesWithWidth:height:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:](MIOPixelBufferUtility, "createPixelBufferAttributesWithWidth:height:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:", Width, Height, (CVPixelBufferGetBytesPerRow(a3) % v8), 1278226488, v8, +[MOVStreamIOUtility getPreferredPlaneAlignmentSize](MOVStreamIOUtility, "getPreferredPlaneAlignmentSize"));
  v13 = 0;
  v14 = *MEMORY[0x24BDC56F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v11 = (const __CFDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v11, v9, &v13);

  CFRelease(v9);
  return v13;
}

+ (__CVBuffer)newWarholBufferFromRawBayerPixelBuffer:(__CVBuffer *)a3 withPixelBufferPool:(__CVPixelBufferPool *)a4
{
  CVReturn v5;
  __CVBuffer *result;
  BOOL v7;
  CVPixelBufferRef pixelBufferOut;

  pixelBufferOut = 0;
  v5 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], a4, &pixelBufferOut);
  result = 0;
  if (v5)
    v7 = 1;
  else
    v7 = pixelBufferOut == 0;
  if (!v7)
  {
    +[MIOPixelBufferUtility splitBayerBuffer:intoWarholPixelBuffer:shiftBitsLeftBy:](MIOPixelBufferUtility, "splitBayerBuffer:intoWarholPixelBuffer:shiftBitsLeftBy:", a3);
    return pixelBufferOut;
  }
  return result;
}

+ (__CVBuffer)newYUVBufferFromRawBayerPixelBuffer:(__CVBuffer *)a3 withPixelBufferPool:(__CVPixelBufferPool *)a4
{
  CVReturn v5;
  __CVBuffer *result;
  BOOL v7;
  CVPixelBufferRef pixelBufferOut;

  pixelBufferOut = 0;
  v5 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], a4, &pixelBufferOut);
  result = 0;
  if (v5)
    v7 = 1;
  else
    v7 = pixelBufferOut == 0;
  if (!v7)
  {
    +[MIOPixelBufferUtility splitBayerBuffer:intoYUVPixelBuffer:shiftBitsLeftBy:](MIOPixelBufferUtility, "splitBayerBuffer:intoYUVPixelBuffer:shiftBitsLeftBy:", a3);
    return pixelBufferOut;
  }
  return result;
}

+ (__CVBuffer)newRawBayerBufferFromYUVPixelBuffer:(__CVBuffer *)a3 withPixelBufferPool:(__CVPixelBufferPool *)a4 msbReplication:(BOOL)a5
{
  CVReturn v6;
  __CVBuffer *result;
  BOOL v8;
  CVPixelBufferRef pixelBufferOut;

  pixelBufferOut = 0;
  v6 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], a4, &pixelBufferOut);
  result = 0;
  if (v6)
    v8 = 1;
  else
    v8 = pixelBufferOut == 0;
  if (!v8)
  {
    +[MIOPixelBufferUtility joinYUVBuffer:intoRawBayerPixelBuffer:shiftBitsLeftBy:msbReplication:](MIOPixelBufferUtility, "joinYUVBuffer:intoRawBayerPixelBuffer:shiftBitsLeftBy:msbReplication:", a3);
    return pixelBufferOut;
  }
  return result;
}

+ (__CVBuffer)newWarholBufferFromCompandedRawBayerPixelBuffer:(__CVBuffer *)a3 withPixelBufferPool:(__CVPixelBufferPool *)a4
{
  CVReturn v5;
  __CVBuffer *result;
  BOOL v7;
  CVPixelBufferRef pixelBufferOut;

  pixelBufferOut = 0;
  v5 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], a4, &pixelBufferOut);
  result = 0;
  if (v5)
    v7 = 1;
  else
    v7 = pixelBufferOut == 0;
  if (!v7)
  {
    +[MIOPixelBufferUtility splitCompandedBayerBuffer:intoCompandedWarholPixelBuffer:](MIOPixelBufferUtility, "splitCompandedBayerBuffer:intoCompandedWarholPixelBuffer:", a3);
    return pixelBufferOut;
  }
  return result;
}

+ (__CVBuffer)newWarholBufferFromRawBayerPixelBuffer:(__CVBuffer *)a3
{
  size_t Width;
  size_t Height;
  unint64_t v6;
  __CVBuffer *v7;

  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v6 = +[MOVStreamIOUtility getPreferredBytesPerRowAlignmentSize](MOVStreamIOUtility, "getPreferredBytesPerRowAlignmentSize");
  v7 = +[MIOPixelBufferUtility createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:](MIOPixelBufferUtility, "createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:", Width, Height, 0, (unint64_t)(int)(CVPixelBufferGetBytesPerRow(a3) % v6) >> 1, 1278226736, v6, +[MOVStreamIOUtility getPreferredPlaneAlignmentSize](MOVStreamIOUtility, "getPreferredPlaneAlignmentSize"));
  +[MIOPixelBufferUtility splitBayerBuffer:intoWarholPixelBuffer:shiftBitsLeftBy:](MIOPixelBufferUtility, "splitBayerBuffer:intoWarholPixelBuffer:shiftBitsLeftBy:", a3, v7, 2);
  return v7;
}

+ (BOOL)fillPlaneOfPixelBuffer:(__CVBuffer *)a3 planeIndex:(int)a4 withValue:(unsigned __int16)a5
{
  BOOL result;
  void *BaseAddressOfPlane;
  size_t HeightOfPlane;
  size_t BytesPerRowOfPlane;
  _WORD __pattern4[2];

  result = 0;
  if (a3 && (a4 & 0x80000000) == 0)
  {
    if (CVPixelBufferGetPlaneCount(a3) <= a4)
    {
      return 0;
    }
    else
    {
      CVPixelBufferLockBaseAddress(a3, 0);
      BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, a4);
      HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, a4);
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, a4);
      __pattern4[0] = a5;
      __pattern4[1] = a5;
      memset_pattern4(BaseAddressOfPlane, __pattern4, BytesPerRowOfPlane * HeightOfPlane);
      CVPixelBufferUnlockBaseAddress(a3, 0);
      return 1;
    }
  }
  return result;
}

+ (BOOL)isPixelBufferRawBayer:(__CVBuffer *)a3
{
  return +[MIOPixelBufferUtility isPixelFormatRawBayer:](MIOPixelBufferUtility, "isPixelFormatRawBayer:", CVPixelBufferGetPixelFormatType(a3));
}

+ (BOOL)isPixelFormatRawBayer:(unsigned int)a3
{
  BOOL result;
  int v4;

  result = 1;
  if ((int)a3 > 1735549491)
  {
    if (a3 == 1735549492)
      return result;
    v4 = 1919379252;
  }
  else
  {
    if (a3 == 1650943796)
      return result;
    v4 = 1734505012;
  }
  if (a3 != v4)
    return 0;
  return result;
}

+ (BOOL)isPixelBufferCompandedRawBayer:(__CVBuffer *)a3
{
  return +[MIOPixelBufferUtility isPixelFormatCompandedRawBayer:](MIOPixelBufferUtility, "isPixelFormatCompandedRawBayer:", CVPixelBufferGetPixelFormatType(a3));
}

+ (BOOL)isPixelFormatCompandedRawBayer:(unsigned int)a3
{
  BOOL result;
  int v4;

  result = 1;
  if ((int)a3 > 1735549751)
  {
    if (a3 == 1735549752)
      return result;
    v4 = 1919378232;
  }
  else
  {
    if (a3 == 1650942776)
      return result;
    v4 = 1734501176;
  }
  if (a3 != v4)
    return 0;
  return result;
}

+ (void)writeBuffer:(const char *)a3 ofSize:(unint64_t)a4 toFile:(id)a5
{
  FILE *v7;
  FILE *v8;

  v7 = fopen((const char *)objc_msgSend(objc_retainAutorelease(a5), "cStringUsingEncoding:", 4), "wb");
  if (v7)
  {
    v8 = v7;
    fwrite(a3, a4, 1uLL, v7);
    fclose(v8);
  }
}

+ (BOOL)joinYUVBuffer:(__CVBuffer *)a3 intoRawBayerPixelBuffer:(__CVBuffer *)a4 shiftBitsLeftBy:(int)a5 msbReplication:(BOOL)a6
{
  BOOL v6;
  BOOL v7;
  _BOOL8 v8;
  uint64_t v9;
  void *v12;
  char v13;
  int v14;
  void *BaseAddressOfPlane;
  const unsigned __int16 *v16;
  size_t Height;
  size_t Width;
  size_t BytesPerRow;
  size_t BytesPerRowOfPlane;
  size_t v21;
  unsigned __int16 *BaseAddress;
  unsigned int v24;

  if (a3)
    v6 = a4 == 0;
  else
    v6 = 1;
  v7 = !v6;
  if (!v6)
  {
    v8 = a6;
    v9 = *(_QWORD *)&a5;
    +[MOVStreamMetalPixelBufferUtility sharedMetalPixelBufferUtility](MOVStreamMetalPixelBufferUtility, "sharedMetalPixelBufferUtility");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "joinYUVBuffer:intoRawBayerPixelBuffer:shiftBitsLeftBy:msbReplication:", a3, a4, v9, v8);

    if ((v13 & 1) == 0)
    {
      if ((int)v9 >= 0)
        v14 = v9;
      else
        v14 = -(int)v9;
      v24 = v14;
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a4);
      BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      v16 = (const unsigned __int16 *)CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
      Height = CVPixelBufferGetHeight(a4);
      Width = CVPixelBufferGetWidth(a4);
      BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      v21 = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
      join_bayer_buffer_yuv((uint64_t)BaseAddressOfPlane, v16, BaseAddress, Width, Height, BytesPerRow, BytesPerRowOfPlane, v21, v24, v8);
      CVPixelBufferUnlockBaseAddress(a4, 0);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    }
  }
  return v7;
}

+ (unint64_t)bytesPerWidthOfBuffer:(__CVBuffer *)a3
{
  NSObject *v4;
  uint64_t PixelFormatType;
  double BytesPerPixelOfPlaneForFormat;
  uint8_t v8[16];

  if (CVPixelBufferIsPlanar(a3))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_210675000, v4, OS_LOG_TYPE_ERROR, "bytesPerWidthOfBuffer requires non-planar buffer.", v8, 2u);
    }

    return 0;
  }
  else
  {
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    BytesPerPixelOfPlaneForFormat = MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(PixelFormatType, 0);
    return (unint64_t)(BytesPerPixelOfPlaneForFormat * (double)CVPixelBufferGetWidth(a3));
  }
}

+ (BOOL)bufferHasPadding:(__CVBuffer *)a3
{
  NSObject *v4;
  size_t v6;
  uint8_t v7[16];

  if (CVPixelBufferIsPlanar(a3))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_210675000, v4, OS_LOG_TYPE_ERROR, "bufferHasPadding requires non-planar buffer.", v7, 2u);
    }

    return 0;
  }
  else
  {
    v6 = +[MIOPixelBufferUtility bytesPerWidthOfBuffer:](MIOPixelBufferUtility, "bytesPerWidthOfBuffer:", a3);
    return v6 < CVPixelBufferGetBytesPerRow(a3);
  }
}

+ (__CVBuffer)stripBufferPadding:(__CVBuffer *)a3
{
  NSObject *v4;
  unint64_t v5;
  void *v6;
  const __CFAllocator *Default;
  size_t Width;
  size_t Height;
  OSType PixelFormatType;
  __CVBuffer *v11;
  CVBufferRef destinationBuffer;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  if (CVPixelBufferIsPlanar(a3))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(destinationBuffer) = 0;
      _os_log_impl(&dword_210675000, v4, OS_LOG_TYPE_ERROR, "stripBufferPadding requires non-planar buffer.", (uint8_t *)&destinationBuffer, 2u);
    }
    goto LABEL_7;
  }
  v5 = +[MIOPixelBufferUtility bytesPerWidthOfBuffer:](MIOPixelBufferUtility, "bytesPerWidthOfBuffer:", a3);
  v14[0] = *MEMORY[0x24BDC5600];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = *MEMORY[0x24BDC5668];
  v15[0] = v6;
  v15[1] = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v4 = objc_claimAutoreleasedReturnValue();

  destinationBuffer = 0;
  Default = CFAllocatorGetDefault();
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  CVPixelBufferCreate(Default, Width, Height, PixelFormatType, (CFDictionaryRef)v4, &destinationBuffer);
  if (!+[MIOPixelBufferUtility copyPixelBuffer:toPixelBuffer:](MIOPixelBufferUtility, "copyPixelBuffer:toPixelBuffer:", a3, destinationBuffer))
  {
    CVPixelBufferRelease(destinationBuffer);
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  CVBufferPropagateAttachments(a3, destinationBuffer);
  v11 = destinationBuffer;
LABEL_8:

  return v11;
}

+ (BOOL)splitBayerBuffer:(__CVBuffer *)a3 intoYUVPixelBuffer:(__CVBuffer *)a4 shiftBitsLeftBy:(int)a5
{
  BOOL v5;
  BOOL v6;
  uint64_t v7;
  void *v10;
  char v11;
  int v12;
  void *BaseAddress;
  unsigned __int16 *BaseAddressOfPlane;
  unsigned __int16 *v15;
  size_t Height;
  size_t Width;
  size_t BytesPerRow;
  size_t BytesPerRowOfPlane;
  size_t v20;
  double v21;
  double v22;
  int16x8_t v23;
  double v24;
  int16x8_t v25;
  double v26;
  double v27;
  int16x8_t v28;
  unsigned int v30;

  if (a3)
    v5 = a4 == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (!v5)
  {
    v7 = *(_QWORD *)&a5;
    +[MOVStreamMetalPixelBufferUtility sharedMetalPixelBufferUtility](MOVStreamMetalPixelBufferUtility, "sharedMetalPixelBufferUtility");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "splitBayerBuffer:intoYUVPixelBuffer:shiftBitsLeftBy:", a3, a4, v7);

    if ((v11 & 1) == 0)
    {
      if ((int)v7 >= 0)
        v12 = v7;
      else
        v12 = -(int)v7;
      v30 = v12;
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      BaseAddress = CVPixelBufferGetBaseAddress(a3);
      BaseAddressOfPlane = (unsigned __int16 *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
      v15 = (unsigned __int16 *)CVPixelBufferGetBaseAddressOfPlane(a4, 1uLL);
      Height = CVPixelBufferGetHeight(a3);
      Width = CVPixelBufferGetWidth(a3);
      BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
      v20 = CVPixelBufferGetBytesPerRowOfPlane(a4, 1uLL);
      split_bayer_buffer_yuv((unint64_t)BaseAddress, BaseAddressOfPlane, v15, Width, Height, BytesPerRow, BytesPerRowOfPlane, v20, v21, v22, v23, v24, v25, v26, v27, v28, v30);
      CVPixelBufferUnlockBaseAddress(a4, 0);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    }
  }
  return v6;
}

+ (BOOL)splitBayerBuffer:(__CVBuffer *)a3 intoWarholPixelBuffer:(__CVBuffer *)a4 shiftBitsLeftBy:(int)a5
{
  BOOL v5;
  BOOL v6;
  uint64_t v7;
  void *v10;
  char v11;
  unsigned int v12;
  unsigned __int16 *BaseAddressOfPlane;
  unsigned __int16 *v14;
  unsigned __int16 *BaseAddress;
  unsigned __int16 *v16;
  size_t HeightOfPlane;
  size_t v18;
  size_t BytesPerRowOfPlane;
  unint64_t v20;
  unint64_t v21;
  size_t Height;
  size_t v23;
  size_t BytesPerRow;

  if (a3)
    v5 = a4 == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (!v5)
  {
    v7 = *(_QWORD *)&a5;
    +[MOVStreamMetalPixelBufferUtility sharedMetalPixelBufferUtility](MOVStreamMetalPixelBufferUtility, "sharedMetalPixelBufferUtility");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "splitBayerBuffer:intoWarholPixelBuffer:shiftBitsLeftBy:", a3, a4, v7);

    if ((v11 & 1) == 0)
    {
      if ((int)v7 >= 0)
        v12 = v7;
      else
        v12 = -(int)v7;
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      if (CVPixelBufferIsPlanar(a3))
        BaseAddressOfPlane = (unsigned __int16 *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      else
        BaseAddressOfPlane = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a3);
      v14 = BaseAddressOfPlane;
      if (CVPixelBufferIsPlanar(a4))
        BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
      else
        BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a4);
      v16 = BaseAddress;
      if (CVPixelBufferIsPlanar(a3))
        HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
      else
        HeightOfPlane = CVPixelBufferGetHeight(a3);
      v18 = HeightOfPlane;
      if (CVPixelBufferIsPlanar(a3))
        BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      else
        BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(a3);
      v20 = BytesPerRowOfPlane;
      v21 = BytesPerRowOfPlane * v18;
      if (CVPixelBufferIsPlanar(a4))
        Height = CVPixelBufferGetHeightOfPlane(a4, 0);
      else
        Height = CVPixelBufferGetHeight(a4);
      v23 = Height;
      if (CVPixelBufferIsPlanar(a4))
        BytesPerRow = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
      else
        BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
      split_bayer_buffer(v14, v16, (unsigned __int16 *)((char *)v16 + (v20 >> 1)), (unsigned __int16 *)((char *)v16 + BytesPerRow * (v23 >> 1)), (unsigned __int16 *)((char *)v16 + BytesPerRow * (v23 >> 1) + (v20 >> 1)), v21, v20, BytesPerRow, v12, 1);
      CVPixelBufferUnlockBaseAddress(a4, 0);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    }
  }
  return v6;
}

+ (BOOL)joinWarholBuffer:(__CVBuffer *)a3 intoBayerBuffer:(__CVBuffer *)a4 shiftBitsRightBy:(int)a5 msbReplication:(BOOL)a6
{
  BOOL v6;
  BOOL v7;
  _BOOL8 v8;
  uint64_t v9;
  void *v12;
  char v13;
  unsigned __int16 *BaseAddressOfPlane;
  unsigned __int16 *BaseAddress;
  unsigned __int16 *v16;
  size_t HeightOfPlane;
  size_t v18;
  size_t BytesPerRowOfPlane;
  size_t v20;
  size_t WidthOfPlane;
  size_t v22;
  size_t v23;
  size_t BytesPerRow;
  unsigned __int16 *v26;

  if (a3)
    v6 = a4 == 0;
  else
    v6 = 1;
  v7 = !v6;
  if (!v6)
  {
    v8 = a6;
    v9 = *(_QWORD *)&a5;
    +[MOVStreamMetalPixelBufferUtility sharedMetalPixelBufferUtility](MOVStreamMetalPixelBufferUtility, "sharedMetalPixelBufferUtility");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "joinWarholBuffer:intoBayerBuffer:shiftBitsRightBy:msbReplication:", a3, a4, v9, v8);

    if ((v13 & 1) == 0)
    {
      if ((int)v9 < 0)
        LODWORD(v9) = -(int)v9;
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      if (CVPixelBufferIsPlanar(a4))
        BaseAddressOfPlane = (unsigned __int16 *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
      else
        BaseAddressOfPlane = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a4);
      v26 = BaseAddressOfPlane;
      if (CVPixelBufferIsPlanar(a3))
        BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      else
        BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a3);
      v16 = BaseAddress;
      if (CVPixelBufferIsPlanar(a3))
        HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
      else
        HeightOfPlane = CVPixelBufferGetHeight(a3);
      v18 = HeightOfPlane;
      if (CVPixelBufferIsPlanar(a3))
        BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      else
        BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(a3);
      v20 = BytesPerRowOfPlane;
      if (CVPixelBufferIsPlanar(a3))
        WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
      else
        WidthOfPlane = CVPixelBufferGetWidth(a3);
      v22 = WidthOfPlane;
      v23 = v20 - 2 * WidthOfPlane;
      if (CVPixelBufferIsPlanar(a4))
        BytesPerRow = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
      else
        BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
      join_bayer_buffer(v16, (unsigned __int16 *)((char *)v16 + v22), (unsigned __int16 *)((char *)v16 + v20 * (v18 >> 1)), (unsigned __int16 *)((char *)v16 + v20 * (v18 >> 1) + v22), v26, (v20 * v18) >> 2, v20 >> 1, BytesPerRow, v23 >> 1, v9, 1, v8);
      CVPixelBufferUnlockBaseAddress(a4, 0);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    }
  }
  return v7;
}

+ (BOOL)splitCompandedBayerBuffer:(__CVBuffer *)a3 intoCompandedWarholPixelBuffer:(__CVBuffer *)a4
{
  BOOL v4;
  BOOL v5;
  void *v8;
  char v9;
  unsigned __int8 *BaseAddressOfPlane;
  unsigned __int8 *v11;
  unsigned __int8 *BaseAddress;
  unsigned __int8 *v13;
  size_t HeightOfPlane;
  size_t v15;
  size_t BytesPerRowOfPlane;
  unint64_t v17;
  unint64_t v18;
  size_t Width;
  size_t v20;
  size_t Height;
  size_t v22;
  size_t BytesPerRow;
  size_t extraRowsOnBottom;
  size_t extraRowsOnTop;
  size_t extraColumnsOnRight;
  size_t extraColumnsOnLeft;

  if (a3)
    v4 = a4 == 0;
  else
    v4 = 1;
  v5 = !v4;
  if (!v4)
  {
    +[MOVStreamMetalPixelBufferUtility sharedMetalPixelBufferUtility](MOVStreamMetalPixelBufferUtility, "sharedMetalPixelBufferUtility");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "splitCompandedBayerBuffer:intoCompandedWarholPixelBuffer:", a3, a4);

    if ((v9 & 1) == 0)
    {
      extraColumnsOnRight = 0;
      extraColumnsOnLeft = 0;
      extraRowsOnBottom = 0;
      extraRowsOnTop = 0;
      CVPixelBufferGetExtendedPixels(a4, &extraColumnsOnLeft, &extraColumnsOnRight, &extraRowsOnTop, &extraRowsOnBottom);
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      if (CVPixelBufferIsPlanar(a3))
        BaseAddressOfPlane = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      else
        BaseAddressOfPlane = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a3);
      v11 = BaseAddressOfPlane;
      if (CVPixelBufferIsPlanar(a4))
        BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
      else
        BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a4);
      v13 = BaseAddress;
      if (CVPixelBufferIsPlanar(a3))
        HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
      else
        HeightOfPlane = CVPixelBufferGetHeight(a3);
      v15 = HeightOfPlane;
      if (CVPixelBufferIsPlanar(a3))
        BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      else
        BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(a3);
      v17 = BytesPerRowOfPlane;
      v18 = BytesPerRowOfPlane * v15;
      Width = CVPixelBufferGetWidth(a3);
      v20 = CVPixelBufferGetWidth(a4);
      if (CVPixelBufferIsPlanar(a4))
        Height = CVPixelBufferGetHeightOfPlane(a4, 0);
      else
        Height = CVPixelBufferGetHeight(a4);
      v22 = Height;
      if (CVPixelBufferIsPlanar(a4))
        BytesPerRow = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
      else
        BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
      split_companded_bayer_buffer(v11, &v13[extraColumnsOnLeft + extraRowsOnTop * BytesPerRow], &v13[extraColumnsOnLeft + extraRowsOnTop * BytesPerRow + (Width >> 1)], &v13[extraColumnsOnLeft + extraRowsOnTop * BytesPerRow + BytesPerRow * (v22 >> 1)], &v13[extraColumnsOnLeft + extraRowsOnTop * BytesPerRow + BytesPerRow * (v22 >> 1) + (Width >> 1)], v18, v17, BytesPerRow, Width, v20);
      CVPixelBufferUnlockBaseAddress(a4, 0);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    }
  }
  return v5;
}

+ (BOOL)joinCompandedWarholBuffer:(__CVBuffer *)a3 intoCompandedBayerBuffer:(__CVBuffer *)a4
{
  BOOL v4;
  BOOL v5;
  void *v8;
  char v9;
  int8x16_t *BaseAddressOfPlane;
  int8x16_t *v11;
  void *BaseAddress;
  uint64_t v13;
  size_t HeightOfPlane;
  size_t v15;
  size_t BytesPerRowOfPlane;
  size_t v17;
  size_t WidthOfPlane;
  size_t v19;
  unint64_t v20;
  size_t BytesPerRow;

  if (a3)
    v4 = a4 == 0;
  else
    v4 = 1;
  v5 = !v4;
  if (!v4)
  {
    +[MOVStreamMetalPixelBufferUtility sharedMetalPixelBufferUtility](MOVStreamMetalPixelBufferUtility, "sharedMetalPixelBufferUtility");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "joinCompandedWarholBuffer:intoCompandedBayerBuffer:", a3, a4);

    if ((v9 & 1) == 0)
    {
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      if (CVPixelBufferIsPlanar(a4))
        BaseAddressOfPlane = (int8x16_t *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
      else
        BaseAddressOfPlane = (int8x16_t *)CVPixelBufferGetBaseAddress(a4);
      v11 = BaseAddressOfPlane;
      if (CVPixelBufferIsPlanar(a3))
        BaseAddress = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      else
        BaseAddress = CVPixelBufferGetBaseAddress(a3);
      v13 = (uint64_t)BaseAddress;
      if (CVPixelBufferIsPlanar(a3))
        HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
      else
        HeightOfPlane = CVPixelBufferGetHeight(a3);
      v15 = HeightOfPlane;
      if (CVPixelBufferIsPlanar(a3))
        BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      else
        BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(a3);
      v17 = BytesPerRowOfPlane;
      if (CVPixelBufferIsPlanar(a3))
        WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
      else
        WidthOfPlane = CVPixelBufferGetWidth(a3);
      v19 = WidthOfPlane;
      v20 = v17 - WidthOfPlane;
      if (CVPixelBufferIsPlanar(a4))
        BytesPerRow = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
      else
        BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
      join_companded_bayer_buffer(v13, (const unsigned __int8 *)(v13 + (v19 >> 1)), (const unsigned __int8 *)(v13 + v17 * (v15 >> 1)), (const unsigned __int8 *)(v13 + v17 * (v15 >> 1) + (v19 >> 1)), v11, v15 >> 1, v19 >> 1, BytesPerRow, v20, 1);
      CVPixelBufferUnlockBaseAddress(a4, 0);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    }
  }
  return v5;
}

+ (BOOL)verticallySplitPixelBuffer:(__CVBuffer *)a3 intoTopPixelBuffer:(__CVBuffer *)a4 bottomPixelBuffer:(__CVBuffer *)a5
{
  BOOL v5;
  size_t Height;
  size_t v10;
  size_t BytesPerRow;
  size_t v12;
  char *BaseAddressOfPlane;
  void *v14;
  size_t v15;
  size_t v16;
  char *v17;
  void *v18;
  size_t v19;
  size_t v20;
  NSObject *v21;
  const char *v22;
  uint8_t *v23;
  __int16 v25;
  __int16 v26;

  v5 = 0;
  if (a3 && a4 && a5)
  {
    Height = CVPixelBufferGetHeight(a3);
    v10 = CVPixelBufferGetHeight(a4);
    if (Height == CVPixelBufferGetHeight(a5) + v10)
    {
      BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      if (BytesPerRow == CVPixelBufferGetBytesPerRow(a4))
      {
        v12 = CVPixelBufferGetBytesPerRow(a3);
        if (v12 == CVPixelBufferGetBytesPerRow(a5))
        {
          v5 = 1;
          CVPixelBufferLockBaseAddress(a3, 1uLL);
          CVPixelBufferLockBaseAddress(a4, 0);
          BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
          v14 = CVPixelBufferGetBaseAddressOfPlane(a4, 0);
          v15 = CVPixelBufferGetBytesPerRow(a4);
          v16 = CVPixelBufferGetHeight(a4) * v15;
          memcpy(v14, BaseAddressOfPlane, v16);
          CVPixelBufferUnlockBaseAddress(a4, 0);
          v17 = &BaseAddressOfPlane[v16];
          CVPixelBufferLockBaseAddress(a5, 0);
          v18 = CVPixelBufferGetBaseAddressOfPlane(a5, 0);
          v19 = CVPixelBufferGetBytesPerRow(a5);
          v20 = CVPixelBufferGetHeight(a5);
          memcpy(v18, v17, v20 * v19);
          CVPixelBufferUnlockBaseAddress(a3, 1uLL);
          CVPixelBufferUnlockBaseAddress(a5, 0);
          return v5;
        }
      }
      if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          v25 = 0;
          v22 = "Inconsistent bytes per row.";
          v23 = (uint8_t *)&v25;
          goto LABEL_14;
        }
        goto LABEL_15;
      }
    }
    else if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v26 = 0;
        v22 = "Inconsistent height.";
        v23 = (uint8_t *)&v26;
LABEL_14:
        _os_log_impl(&dword_210675000, v21, OS_LOG_TYPE_DEBUG, v22, v23, 2u);
      }
LABEL_15:

    }
    return 0;
  }
  return v5;
}

+ (BOOL)concatPixelBuffer:(__CVBuffer *)a3 withPixelBuffer:(__CVBuffer *)a4 targetPixelBuffer:(__CVBuffer *)a5
{
  BOOL v5;
  size_t Width;
  size_t Height;
  size_t v11;
  size_t BytesPerRow;
  size_t v13;
  size_t v14;
  void *BaseAddressOfPlane;
  char *v16;
  size_t v17;
  size_t v18;
  char *v19;
  void *v20;
  size_t v21;
  size_t v22;
  NSObject *v23;
  const char *v24;
  uint8_t *v25;
  __int16 v27;
  __int16 v28;
  uint8_t buf[2];

  v5 = 0;
  if (a3 && a4 && a5)
  {
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    v11 = CVPixelBufferGetHeight(a4);
    if (Width == CVPixelBufferGetWidth(a5) && Width == CVPixelBufferGetWidth(a4))
    {
      if (v11 + Height == CVPixelBufferGetHeight(a5))
      {
        BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
        v13 = CVPixelBufferGetBytesPerRow(a4);
        v14 = CVPixelBufferGetBytesPerRow(a5);
        if (v14 == BytesPerRow && v14 == v13)
        {
          v5 = 1;
          CVPixelBufferLockBaseAddress(a3, 1uLL);
          CVPixelBufferLockBaseAddress(a5, 0);
          BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
          v16 = (char *)CVPixelBufferGetBaseAddressOfPlane(a5, 0);
          v17 = CVPixelBufferGetBytesPerRow(a3);
          v18 = CVPixelBufferGetHeight(a3) * v17;
          memcpy(v16, BaseAddressOfPlane, v18);
          CVPixelBufferUnlockBaseAddress(a3, 1uLL);
          v19 = &v16[v18];
          CVPixelBufferLockBaseAddress(a4, 1uLL);
          v20 = CVPixelBufferGetBaseAddressOfPlane(a4, 0);
          v21 = CVPixelBufferGetBytesPerRow(a4);
          v22 = CVPixelBufferGetHeight(a4);
          memcpy(v19, v20, v22 * v21);
          CVPixelBufferUnlockBaseAddress(a4, 1uLL);
          CVPixelBufferUnlockBaseAddress(a5, 0);
          return v5;
        }
        if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
        {
          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v23 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            goto LABEL_14;
          v27 = 0;
          v24 = "Inconsistent bytes per row.";
          v25 = (uint8_t *)&v27;
          goto LABEL_13;
        }
        return 0;
      }
      if (!+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
        return 0;
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        goto LABEL_14;
      v28 = 0;
      v24 = "Inconsistent height.";
      v25 = (uint8_t *)&v28;
    }
    else
    {
      if (!+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
        return 0;
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
LABEL_14:

        return 0;
      }
      *(_WORD *)buf = 0;
      v24 = "Inconsistent width.";
      v25 = buf;
    }
LABEL_13:
    _os_log_impl(&dword_210675000, v23, OS_LOG_TYPE_DEBUG, v24, v25, 2u);
    goto LABEL_14;
  }
  return v5;
}

+ (unint64_t)extendedPixelsPerRowOfPixelBuffer:(__CVBuffer *)a3
{
  size_t extraColumnsOnRight;

  extraColumnsOnRight = 0;
  CVPixelBufferGetExtendedPixels(a3, 0, &extraColumnsOnRight, 0, 0);
  return extraColumnsOnRight;
}

+ (__CVPixelBufferPool)createPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 extendedPixelsPerRow:(unint64_t)a6 minBufferCount:(unint64_t)a7
{
  __CFDictionary *v8;
  void *v9;
  const __CFDictionary *v10;
  CVPixelBufferPoolRef v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v8 = +[MIOPixelBufferUtility createPixelBufferAttributesWithWidth:height:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:](MIOPixelBufferUtility, "createPixelBufferAttributesWithWidth:height:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:", a3, a4, a6, *(_QWORD *)&a5, 1, 1);
  v12 = 0;
  v13 = *MEMORY[0x24BDC56F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v10 = (const __CFDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v10, v8, &v12);

  CFRelease(v8);
  return v12;
}

+ (__CVPixelBufferPool)createPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 bytesPerRow:(unint64_t)a6 minBufferCount:(unint64_t)a7
{
  __CFDictionary *v8;
  void *v9;
  const __CFDictionary *v10;
  CVPixelBufferPoolRef v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v8 = +[MIOPixelBufferUtility createPixelBufferAttributesWithWidth:height:pixelFormat:bytesPerRow:](MIOPixelBufferUtility, "createPixelBufferAttributesWithWidth:height:pixelFormat:bytesPerRow:", a3, a4, *(_QWORD *)&a5, a6);
  v12 = 0;
  v13 = *MEMORY[0x24BDC56F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v10 = (const __CFDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v10, v8, &v12);

  CFRelease(v8);
  return v12;
}

+ (__CVPixelBufferPool)createPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 bytesPerRows:(id)a6 minBufferCount:(unint64_t)a7
{
  __CFDictionary *v8;
  void *v9;
  const __CFDictionary *v10;
  CVPixelBufferPoolRef v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v8 = +[MIOPixelBufferUtility createPixelBufferAttributesWithWidth:height:pixelFormat:bytesPerRows:](MIOPixelBufferUtility, "createPixelBufferAttributesWithWidth:height:pixelFormat:bytesPerRows:", a3, a4, *(_QWORD *)&a5, a6);
  v12 = 0;
  v13 = *MEMORY[0x24BDC56F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v10 = (const __CFDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v10, v8, &v12);

  CFRelease(v8);
  return v12;
}

+ (__CVBuffer)pixelBufferFromPool:(__CVPixelBufferPool *)a3
{
  CVReturn v3;
  __CVBuffer *result;
  BOOL v5;
  NSObject *v6;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  CVReturn v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  pixelBufferOut = 0;
  v3 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], a3, &pixelBufferOut);
  result = pixelBufferOut;
  if (v3)
    v5 = 1;
  else
    v5 = pixelBufferOut == 0;
  if (v5)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v9 = v3;
      _os_log_impl(&dword_210675000, v6, OS_LOG_TYPE_ERROR, "Error creating pixel buffer from pool (%d).", buf, 8u);
    }

    return 0;
  }
  return result;
}

+ (BOOL)transferq8q2PixelBuffer:(__CVBuffer *)a3 toL010PixelBuffer:(__CVBuffer *)a4
{
  BOOL v4;
  CVReturn v7;
  void *BaseAddress;
  int BytesPerRow;
  int16x8_t *v10;
  int v11;
  unsigned int Width;
  int Height;

  v4 = 0;
  if (a3 && a4)
  {
    if (CVPixelBufferLockBaseAddress(a3, 1uLL))
    {
      return 0;
    }
    else
    {
      v7 = CVPixelBufferLockBaseAddress(a4, 0);
      v4 = v7 == 0;
      if (!v7)
      {
        BaseAddress = CVPixelBufferGetBaseAddress(a3);
        BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
        v10 = (int16x8_t *)CVPixelBufferGetBaseAddress(a4);
        v11 = CVPixelBufferGetBytesPerRow(a4);
        Width = CVPixelBufferGetWidth(a3);
        Height = CVPixelBufferGetHeight(a3);
        conv_q8q2_to_L010((uint64_t)BaseAddress, BytesPerRow, v10, v11, Width, Height);
        CVPixelBufferUnlockBaseAddress(a4, 0);
      }
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    }
  }
  return v4;
}

+ (BOOL)transferL010PixelBuffer:(__CVBuffer *)a3 toq8q2PixelBuffer:(__CVBuffer *)a4
{
  BOOL v4;
  CVReturn v7;
  int16x8_t *BaseAddress;
  int BytesPerRow;
  unsigned __int8 *v10;
  int v11;
  unsigned int Width;
  int Height;

  v4 = 0;
  if (a3 && a4)
  {
    if (CVPixelBufferLockBaseAddress(a3, 1uLL))
    {
      return 0;
    }
    else
    {
      v7 = CVPixelBufferLockBaseAddress(a4, 0);
      v4 = v7 == 0;
      if (!v7)
      {
        BaseAddress = (int16x8_t *)CVPixelBufferGetBaseAddress(a3);
        BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
        v10 = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a4);
        v11 = CVPixelBufferGetBytesPerRow(a4);
        Width = CVPixelBufferGetWidth(a3);
        Height = CVPixelBufferGetHeight(a3);
        conv_L010_to_q8q2(BaseAddress, BytesPerRow, v10, v11, Width, Height);
        CVPixelBufferUnlockBaseAddress(a4, 0);
      }
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    }
  }
  return v4;
}

+ (BOOL)copyPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 bytesPerPixel:(double)a5
{
  size_t PlaneCount;
  unint64_t v9;
  size_t v10;
  unint64_t v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  size_t v15;
  size_t v16;
  char *BaseAddressOfPlane;
  char *v18;
  size_t v19;
  char *v20;
  size_t BytesPerRowOfPlane;
  BOOL v22;
  __int16 v24;
  __int16 v25;

  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(a4, 0);
  PlaneCount = CVPixelBufferGetPlaneCount(a3);
  if (PlaneCount <= 1)
    v9 = 1;
  else
    v9 = PlaneCount;
  v10 = CVPixelBufferGetPlaneCount(a4);
  if (v10 <= 1)
    v11 = 1;
  else
    v11 = v10;
  if (v11 >= v9)
  {
    v15 = 0;
    while (1)
    {
      v16 = (unint64_t)((double)CVPixelBufferGetWidthOfPlane(a3, v15) * a5);
      if (CVPixelBufferGetBytesPerRowOfPlane(a4, v15) < v16)
        break;
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, v15);
      v18 = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, v15);
      if (CVPixelBufferGetHeightOfPlane(a3, v15))
      {
        v19 = 0;
        do
        {
          v20 = &BaseAddressOfPlane[CVPixelBufferGetBytesPerRowOfPlane(a3, v15) * v19];
          BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, v15);
          memcpy(&v18[BytesPerRowOfPlane * v19++], v20, v16);
        }
        while (v19 < CVPixelBufferGetHeightOfPlane(a3, v15));
      }
      if (++v15 == v9)
      {
        CVPixelBufferUnlockBaseAddress(a4, 0);
        v22 = 1;
        CVPixelBufferUnlockBaseAddress(a3, 1uLL);
        return v22;
      }
    }
    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v24 = 0;
        v13 = "Cannot copyPixelBuffer, not matching bytes per row";
        v14 = (uint8_t *)&v24;
        goto LABEL_21;
      }
LABEL_22:

    }
  }
  else if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v25 = 0;
      v13 = "Cannot copyPixelBuffer, not matching plane count";
      v14 = (uint8_t *)&v25;
LABEL_21:
      _os_log_impl(&dword_210675000, v12, OS_LOG_TYPE_DEBUG, v13, v14, 2u);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  return 0;
}

+ (BOOL)copyPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4
{
  BOOL v4;
  BOOL result;
  size_t PlaneCount;
  unint64_t v9;
  size_t v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t PixelFormatType;
  double BytesPerPixelOfPlaneForFormat;
  uint64_t v16;
  double v17;
  unint64_t v18;
  double v19;
  size_t v20;
  size_t HeightOfPlane;
  size_t v22;
  size_t v23;
  char *BaseAddressOfPlane;
  char *v25;
  char *v26;
  uint64_t i;
  char *v28;
  size_t BytesPerRowOfPlane;
  BOOL v30;

  if (a3)
    v4 = a4 == 0;
  else
    v4 = 1;
  result = !v4;
  if (!v4)
  {
    v30 = result;
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVPixelBufferLockBaseAddress(a4, 0);
    PlaneCount = CVPixelBufferGetPlaneCount(a3);
    if (PlaneCount <= 1)
      v9 = 1;
    else
      v9 = PlaneCount;
    v10 = CVPixelBufferGetPlaneCount(a4);
    v11 = 0;
    if (v10 <= 1)
      v12 = 1;
    else
      v12 = v10;
    if (v9 >= v12)
      v13 = v12;
    else
      v13 = v9;
    do
    {
      PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
      BytesPerPixelOfPlaneForFormat = MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(PixelFormatType, v11);
      v16 = CVPixelBufferGetPixelFormatType(a4);
      v17 = MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(v16, v11);
      v18 = (unint64_t)(BytesPerPixelOfPlaneForFormat * (double)CVPixelBufferGetWidthOfPlane(a3, v11));
      v19 = v17 * (double)CVPixelBufferGetWidthOfPlane(a4, v11);
      if (v18 >= (unint64_t)v19)
        v20 = (unint64_t)v19;
      else
        v20 = v18;
      HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, v11);
      v22 = CVPixelBufferGetHeightOfPlane(a4, v11);
      if (HeightOfPlane >= v22)
        v23 = v22;
      else
        v23 = HeightOfPlane;
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, v11);
      v25 = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, v11);
      if (v23)
      {
        v26 = v25;
        for (i = 0; i != v23; ++i)
        {
          v28 = &BaseAddressOfPlane[CVPixelBufferGetBytesPerRowOfPlane(a3, v11) * i];
          BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, v11);
          memcpy(&v26[BytesPerRowOfPlane * i], v28, v20);
        }
      }
      ++v11;
    }
    while (v11 != v13);
    CVPixelBufferUnlockBaseAddress(a4, 0);
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    return v30;
  }
  return result;
}

+ (BOOL)copyData:(id)a3 toNonPlanarPixelBuffer:(__CVBuffer *)a4
{
  id v5;
  char v6;

  v5 = a3;
  v6 = 0;
  if (v5 && a4)
  {
    if (CVPixelBufferIsPlanar(a4))
      v6 = 0;
    else
      v6 = objc_msgSend((id)objc_opt_class(), "copyData:toPlanarPixelBuffer:toPlane:", v5, a4, 0);
  }

  return v6;
}

+ (BOOL)copyData:(id)a3 toPlanarPixelBuffer:(__CVBuffer *)a4 toPlane:(unint64_t)a5
{
  id v7;
  BOOL v8;
  BOOL v9;
  size_t HeightOfPlane;
  size_t WidthOfPlane;
  size_t BytesPerRowOfPlane;
  uint64_t PixelFormatType;
  double BytesPerPixelOfPlaneForFormat;
  char *v15;
  char *BaseAddressOfPlane;
  char *v17;
  size_t v18;

  v7 = a3;
  if (v7)
    v8 = a4 == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (!v8)
  {
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(a4, a5);
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(a4, a5);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, a5);
    PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
    BytesPerPixelOfPlaneForFormat = MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(PixelFormatType, a5);
    v15 = (char *)objc_msgSend(objc_retainAutorelease(v7), "bytes");
    CVPixelBufferLockBaseAddress(a4, 0);
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, a5);
    if (HeightOfPlane)
    {
      v17 = BaseAddressOfPlane;
      v18 = (unint64_t)(BytesPerPixelOfPlaneForFormat * (double)WidthOfPlane);
      do
      {
        memcpy(v17, v15, v18);
        v15 += v18;
        v17 += BytesPerRowOfPlane;
        --HeightOfPlane;
      }
      while (HeightOfPlane);
    }
    CVPixelBufferUnlockBaseAddress(a4, 0);
  }

  return v9;
}

+ (id)copyNonPlanarPixelBufferData:(__CVBuffer *)a3
{
  if (a3 && !CVPixelBufferIsPlanar(a3))
    return (id)objc_msgSend((id)objc_opt_class(), "copyPixelBufferData:ofPlane:", a3, 0);
  else
    return 0;
}

+ (id)copyPixelBufferData:(__CVBuffer *)a3 ofPlane:(unint64_t)a4
{
  size_t HeightOfPlane;
  size_t WidthOfPlane;
  size_t BytesPerRowOfPlane;
  uint64_t PixelFormatType;
  size_t v10;
  id v11;
  char *v12;
  char *BaseAddressOfPlane;
  char *v14;

  if (!a3)
    return 0;
  if (!CVPixelBufferIsPlanar(a3))
  {
    if (!a4)
      goto LABEL_4;
    return 0;
  }
  if (CVPixelBufferGetPlaneCount(a3) <= a4)
    return 0;
LABEL_4:
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, a4);
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, a4);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, a4);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v10 = (unint64_t)(MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(PixelFormatType, a4) * (double)WidthOfPlane);
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", HeightOfPlane * v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (char *)objc_msgSend(v11, "mutableBytes");
  CVPixelBufferLockBaseAddress(a3, 0);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, a4);
  if (HeightOfPlane)
  {
    v14 = BaseAddressOfPlane;
    do
    {
      memcpy(v12, v14, v10);
      v12 += v10;
      v14 += BytesPerRowOfPlane;
      --HeightOfPlane;
    }
    while (HeightOfPlane);
  }
  CVPixelBufferUnlockBaseAddress(a3, 0);
  return v11;
}

+ (__CVBuffer)readFrameFromFile:(id)a3 width:(unsigned int)a4 height:(unsigned int)a5 pixelFormat:(unsigned int)a6
{
  id v9;
  const __CFDictionary *v10;
  size_t PlaneCount;
  uint64_t v12;
  FILE *v13;
  size_t i;
  char *BaseAddressOfPlane;
  char *v16;
  size_t HeightOfPlane;
  size_t v18;
  size_t WidthOfPlane;
  unint64_t v20;
  size_t BytesPerRowOfPlane;
  size_t v22;
  uint64_t PixelFormatType;
  double BytesPerPixelOfPlaneForFormat;
  size_t v25;
  unint64_t v26;
  CVPixelBufferRef pixelBuffer;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  pixelBuffer = 0;
  v30 = *MEMORY[0x24BDC5668];
  v31[0] = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a4, a5, a6, v10, &pixelBuffer);
  if (pixelBuffer)
  {
    PlaneCount = CVPixelBufferGetPlaneCount(pixelBuffer);
    if (PlaneCount <= 1)
      v12 = 1;
    else
      v12 = PlaneCount;
    v13 = fopen((const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), "rb");
    if (v13)
    {
      CVPixelBufferLockBaseAddress(pixelBuffer, 0);
      for (i = 0; i != v12; ++i)
      {
        if (CVPixelBufferIsPlanar(pixelBuffer))
          BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, i);
        else
          BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
        v16 = BaseAddressOfPlane;
        if (CVPixelBufferIsPlanar(pixelBuffer))
          HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBuffer, i);
        else
          HeightOfPlane = CVPixelBufferGetHeight(pixelBuffer);
        v18 = HeightOfPlane;
        if (CVPixelBufferIsPlanar(pixelBuffer))
          WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, i);
        else
          WidthOfPlane = CVPixelBufferGetWidth(pixelBuffer);
        v20 = WidthOfPlane;
        if (CVPixelBufferIsPlanar(pixelBuffer))
          BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, i);
        else
          BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(pixelBuffer);
        v22 = BytesPerRowOfPlane;
        PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
        BytesPerPixelOfPlaneForFormat = MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(PixelFormatType, i);
        if (v18)
        {
          v25 = (unint64_t)(BytesPerPixelOfPlaneForFormat * (double)v20);
          v26 = 1;
          do
          {
            if (!fread(v16, 1uLL, v25, v13))
              break;
            v16 += v22;
          }
          while (v26++ < v18);
        }
      }
      fclose(v13);
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
      v13 = (FILE *)pixelBuffer;
    }
  }
  else
  {
    v13 = 0;
  }

  return (__CVBuffer *)v13;
}

+ (__CVBuffer)combineLeftBuffer:(__CVBuffer *)a3 rightBuffer:(__CVBuffer *)a4
{
  __CVBuffer *v5;
  size_t Width;
  size_t v7;
  size_t Height;
  OSType PixelFormatType;
  size_t PlaneCount;
  uint64_t v11;
  const __CFDictionary *v12;
  __CVBuffer *v13;
  size_t i;
  char *BaseAddressOfPlane;
  char *v16;
  char *v17;
  size_t BytesPerRowOfPlane;
  size_t v19;
  size_t v20;
  uint64_t v21;
  double BytesPerPixelOfPlaneForFormat;
  size_t WidthOfPlane;
  size_t v24;
  size_t HeightOfPlane;
  size_t v26;
  size_t v27;
  __CVBuffer *v28;
  const __CFDictionary *v30;
  __CVBuffer *pixelBuffer;
  uint64_t v32;
  __CVBuffer *v33;
  CVPixelBufferRef pixelBufferOut;
  uint64_t v35;
  _QWORD v36[2];

  v5 = a3;
  v36[1] = *MEMORY[0x24BDAC8D0];
  Width = CVPixelBufferGetWidth(a3);
  v33 = a4;
  v7 = CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight(v5);
  PixelFormatType = CVPixelBufferGetPixelFormatType(v5);
  PlaneCount = CVPixelBufferGetPlaneCount(v5);
  if (PlaneCount <= 1)
    v11 = 1;
  else
    v11 = PlaneCount;
  v32 = v11;
  pixelBufferOut = 0;
  v35 = *MEMORY[0x24BDC5668];
  v36[0] = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v7 + Width, Height, PixelFormatType, v12, &pixelBufferOut);
  v13 = v33;
  if (pixelBufferOut)
  {
    CVPixelBufferLockBaseAddress(v5, 1uLL);
    CVPixelBufferLockBaseAddress(v33, 1uLL);
    CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
    v30 = v12;
    pixelBuffer = v5;
    for (i = 0; i != v32; ++i)
    {
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(v5, i);
      v16 = (char *)CVPixelBufferGetBaseAddressOfPlane(v13, i);
      v17 = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBufferOut, i);
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v5, i);
      v19 = CVPixelBufferGetBytesPerRowOfPlane(v13, i);
      v20 = CVPixelBufferGetBytesPerRowOfPlane(pixelBufferOut, i);
      v21 = CVPixelBufferGetPixelFormatType(v5);
      BytesPerPixelOfPlaneForFormat = MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(v21, i);
      WidthOfPlane = CVPixelBufferGetWidthOfPlane(v5, i);
      v24 = CVPixelBufferGetWidthOfPlane(v13, i);
      HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBufferOut, i);
      if (HeightOfPlane)
      {
        v26 = (unint64_t)(BytesPerPixelOfPlaneForFormat * (double)WidthOfPlane);
        v27 = (unint64_t)(BytesPerPixelOfPlaneForFormat * (double)v24);
        do
        {
          memcpy(v17, BaseAddressOfPlane, v26);
          memcpy(&v17[v26], v16, v27);
          v17 += v20;
          v16 += v19;
          BaseAddressOfPlane += BytesPerRowOfPlane;
          --HeightOfPlane;
        }
        while (HeightOfPlane);
      }
      v13 = v33;
      v5 = pixelBuffer;
    }
    v12 = v30;
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
    CVPixelBufferUnlockBaseAddress(v33, 1uLL);
    CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
    v28 = pixelBufferOut;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

+ (BOOL)writeBuffer:(__CVBuffer *)a3 toFile:(id)a4
{
  id v5;
  FILE *v6;
  size_t PlaneCount;
  size_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  size_t v12;
  size_t v13;
  size_t v14;
  unint64_t v15;
  size_t v16;
  size_t v17;
  uint64_t PixelFormatType;
  double BytesPerPixelOfPlaneForFormat;
  size_t v20;
  BOOL v21;

  v5 = objc_retainAutorelease(a4);
  v6 = fopen((const char *)objc_msgSend(v5, "UTF8String"), "wb");
  if (v6)
  {
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    PlaneCount = CVPixelBufferGetPlaneCount(a3);
    v8 = 0;
    if (PlaneCount <= 1)
      v9 = 1;
    else
      v9 = PlaneCount;
    while (1)
    {
      v10 = (char *)(CVPixelBufferIsPlanar(a3)
                   ? CVPixelBufferGetBaseAddressOfPlane(a3, v8)
                   : CVPixelBufferGetBaseAddress(a3));
      v11 = v10;
      v12 = CVPixelBufferIsPlanar(a3) ? CVPixelBufferGetHeightOfPlane(a3, v8) : CVPixelBufferGetHeight(a3);
      v13 = v12;
      v14 = CVPixelBufferIsPlanar(a3) ? CVPixelBufferGetWidthOfPlane(a3, v8) : CVPixelBufferGetWidth(a3);
      v15 = v14;
      v16 = CVPixelBufferIsPlanar(a3) ? CVPixelBufferGetBytesPerRowOfPlane(a3, v8) : CVPixelBufferGetBytesPerRow(a3);
      v17 = v16;
      PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
      BytesPerPixelOfPlaneForFormat = MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(PixelFormatType, v8);
      if (v13)
        break;
LABEL_21:
      if (++v8 == v9)
      {
        CVPixelBufferUnlockBaseAddress(a3, 1uLL);
        fclose(v6);
        v21 = 1;
        goto LABEL_25;
      }
    }
    v20 = (unint64_t)(BytesPerPixelOfPlaneForFormat * (double)v15);
    while (fwrite(v11, v20, 1uLL, v6) == 1)
    {
      v11 += v17;
      if (!--v13)
        goto LABEL_21;
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  }
  v21 = 0;
LABEL_25:

  return v21;
}

+ (id)histogramOf8BitBuffer:(__CVBuffer *)a3
{
  size_t PlaneCount;
  uint64_t v5;
  size_t i;
  void *v7;
  int v8;
  size_t j;
  size_t BytesPerRowOfPlane;
  uint64_t PixelFormatType;
  double BytesPerPixelOfPlaneForFormat;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  id v21;
  char *BaseAddressOfPlane;

  PlaneCount = CVPixelBufferGetPlaneCount(a3);
  if (PlaneCount <= 1)
    v5 = 1;
  else
    v5 = PlaneCount;
  v20 = v5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  CVPixelBufferLockBaseAddress(a3, 0);
  for (i = 0; i != v20; ++i)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 256);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 256;
    do
    {
      objc_msgSend(v7, "addObject:", &unk_24CA5BA78);
      --v8;
    }
    while (v8);
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, i);
    for (j = 0; j < CVPixelBufferGetHeightOfPlane(a3, i); ++j)
    {
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, i);
      PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
      BytesPerPixelOfPlaneForFormat = MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(PixelFormatType, i);
      v13 = 0;
      v14 = &BaseAddressOfPlane[BytesPerRowOfPlane * j];
      while (BytesPerPixelOfPlaneForFormat * (double)CVPixelBufferGetWidthOfPlane(a3, i) > (double)v13)
      {
        v15 = v14[v13];
        v16 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v7, "objectAtIndex:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "numberWithInt:", objc_msgSend(v17, "intValue") + 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "replaceObjectAtIndex:withObject:", v15, v18);

        ++v13;
      }
    }
    objc_msgSend(v21, "addObject:", v7);

  }
  CVPixelBufferUnlockBaseAddress(a3, 0);
  return v21;
}

+ (id)rangesOf8BitBuffer:(__CVBuffer *)a3
{
  size_t PlaneCount;
  uint64_t v5;
  void *v6;
  size_t i;
  char *BaseAddressOfPlane;
  unsigned __int8 v9;
  size_t v10;
  unsigned __int8 v11;
  size_t BytesPerRowOfPlane;
  uint64_t PixelFormatType;
  double BytesPerPixelOfPlaneForFormat;
  unint64_t v15;
  char *v16;
  unsigned int v17;
  void *v18;

  PlaneCount = CVPixelBufferGetPlaneCount(a3);
  if (PlaneCount <= 1)
    v5 = 1;
  else
    v5 = PlaneCount;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferLockBaseAddress(a3, 0);
  for (i = 0; i != v5; ++i)
  {
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, i);
    v9 = 0;
    v10 = 0;
    v11 = -1;
    while (v10 < CVPixelBufferGetHeightOfPlane(a3, i))
    {
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, i);
      PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
      BytesPerPixelOfPlaneForFormat = MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(PixelFormatType, i);
      v15 = 0;
      v16 = &BaseAddressOfPlane[BytesPerRowOfPlane * v10];
      while (BytesPerPixelOfPlaneForFormat * (double)CVPixelBufferGetWidthOfPlane(a3, i) > (double)v15)
      {
        v17 = v16[v15];
        if (v17 < v11)
          v11 = v16[v15];
        if (v17 > v9)
          v9 = v16[v15];
        ++v15;
      }
      ++v10;
    }
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v11, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v18);

  }
  CVPixelBufferUnlockBaseAddress(a3, 0);
  return v6;
}

+ (__CVBuffer)create4444AYpCbCr16PixelBufferFillAlphaWithData:(__CFData *)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  const __CFDictionary *v8;
  const UInt8 *BytePtr;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  char *v13;
  size_t v14;
  char *v15;
  __CVBuffer *v16;
  CVPixelBufferRef pixelBuffer;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  pixelBuffer = 0;
  v19 = *MEMORY[0x24BDC5668];
  v20[0] = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a4, a5, 0x79343136u, v8, &pixelBuffer);
  BytePtr = CFDataGetBytePtr(a3);
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = (char *)CVPixelBufferGetBaseAddress(pixelBuffer) + 4;
  while (v12 < CVPixelBufferGetHeight(pixelBuffer))
  {
    v14 = 0;
    v15 = &v13[v10 * (CVPixelBufferGetBytesPerRow(pixelBuffer) >> 1)];
    while (v14 < 4 * CVPixelBufferGetWidth(pixelBuffer))
    {
      *((_WORD *)v15 - 2) = *(_WORD *)&BytePtr[2 * v11];
      *(_DWORD *)(v15 - 2) = -2147450880;
      *((_WORD *)v15 + 1) = 0x8000;
      ++v11;
      v14 += 4;
      v15 += 8;
    }
    ++v12;
    v10 += 2;
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  v16 = pixelBuffer;

  return v16;
}

+ (BOOL)copyMonochromeBuffer:(__CVBuffer *)a3 toAlphaChannelOfBuffer:(__CVBuffer *)a4
{
  BOOL v4;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t v10;
  void *BaseAddress;
  unsigned __int16 *v12;

  v4 = 0;
  if (a3 && a4)
  {
    if (CVPixelBufferGetPixelFormatType(a4) == 2033463606)
    {
      v4 = 1;
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      Width = CVPixelBufferGetWidth(a3);
      Height = CVPixelBufferGetHeight(a3);
      BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      v10 = CVPixelBufferGetBytesPerRow(a4);
      BaseAddress = CVPixelBufferGetBaseAddress(a3);
      v12 = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a4);
      copy_monochrome_to_alpha_channel((uint64_t)BaseAddress, v12, Width, Height, BytesPerRow, v10);
      CVPixelBufferUnlockBaseAddress(a4, 0);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

+ (BOOL)copyuint16Data:(unsigned __int16 *)a3 toAlphaChannelOfBuffer:(__CVBuffer *)a4
{
  BOOL result;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  unsigned __int16 *BaseAddress;

  result = 0;
  if (a3 && a4)
  {
    if (CVPixelBufferGetPixelFormatType(a4) == 2033463606)
    {
      CVPixelBufferLockBaseAddress(a4, 0);
      Width = CVPixelBufferGetWidth(a4);
      Height = CVPixelBufferGetHeight(a4);
      BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
      BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a4);
      copy_monochrome_to_alpha_channel((uint64_t)a3, BaseAddress, Width, Height, 2 * Width, BytesPerRow);
      CVPixelBufferUnlockBaseAddress(a4, 0);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (BOOL)copyAlphaChannelOfBuffer:(__CVBuffer *)a3 touint16Data:(unsigned __int16 *)a4
{
  BOOL v4;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  void *BaseAddress;

  v4 = 0;
  if (a3 && a4)
  {
    if (CVPixelBufferGetPixelFormatType(a3) == 2033463606)
    {
      Width = CVPixelBufferGetWidth(a3);
      Height = CVPixelBufferGetHeight(a3);
      BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      v4 = 1;
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      BaseAddress = CVPixelBufferGetBaseAddress(a3);
      copy_alpha_channel_to_monochrome((uint64_t)BaseAddress, a4, Width, Height, 2 * Width, BytesPerRow);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

+ (BOOL)copyAlphaChannelOfBuffer:(__CVBuffer *)a3 toMonochromeBuffer:(__CVBuffer *)a4
{
  BOOL v4;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t v10;
  void *BaseAddress;
  unsigned __int16 *v12;

  v4 = 0;
  if (a3 && a4)
  {
    if (CVPixelBufferGetPixelFormatType(a3) == 2033463606)
    {
      Width = CVPixelBufferGetWidth(a4);
      Height = CVPixelBufferGetHeight(a4);
      BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
      v10 = CVPixelBufferGetBytesPerRow(a3);
      v4 = 1;
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      BaseAddress = CVPixelBufferGetBaseAddress(a3);
      v12 = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a4);
      copy_alpha_channel_to_monochrome((uint64_t)BaseAddress, v12, Width, Height, BytesPerRow, v10);
      CVPixelBufferUnlockBaseAddress(a4, 0);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

+ (int64_t)numberOfPlanesForPixelFormatType:(unsigned int)a3
{
  const __CFDictionary *v4;
  size_t PlaneCount;
  CVPixelBufferRef pixelBuffer;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  pixelBuffer = 0;
  v8 = *MEMORY[0x24BDC5668];
  v9[0] = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0x280uLL, 0x1E0uLL, a3, v4, &pixelBuffer);
  if (pixelBuffer)
  {
    PlaneCount = CVPixelBufferGetPlaneCount(pixelBuffer);
    CVPixelBufferRelease(pixelBuffer);
  }
  else
  {
    PlaneCount = -1;
  }

  return PlaneCount;
}

+ (unint64_t)pixelBufferSizeWithPadding:(__CVBuffer *)a3
{
  size_t PlaneCount;
  size_t v5;
  unint64_t v6;
  size_t i;
  size_t BytesPerRowOfPlane;
  size_t WidthOfPlane;
  unint64_t v10;
  size_t BytesPerRow;
  size_t Width;
  unint64_t v13;
  size_t v15;
  size_t extraRowsOnTop;
  size_t extraColumnsOnRight;
  size_t extraColumnsOnLeft;

  extraColumnsOnRight = 0;
  extraColumnsOnLeft = 0;
  v15 = 0;
  extraRowsOnTop = 0;
  CVPixelBufferGetExtendedPixels(a3, &extraColumnsOnLeft, &extraColumnsOnRight, &extraRowsOnTop, &v15);
  if (CVPixelBufferIsPlanar(a3))
  {
    PlaneCount = CVPixelBufferGetPlaneCount(a3);
    if (PlaneCount)
    {
      v5 = PlaneCount;
      v6 = 0;
      for (i = 0; i != v5; ++i)
      {
        BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, i);
        WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, i);
        v10 = (unint64_t)(double)(BytesPerRowOfPlane / (extraColumnsOnLeft + WidthOfPlane + extraColumnsOnRight));
        v6 += CVPixelBufferGetHeightOfPlane(a3, i) * WidthOfPlane * v10;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    Width = CVPixelBufferGetWidth(a3);
    v13 = (unint64_t)(double)(BytesPerRow / (extraColumnsOnLeft + Width + extraColumnsOnRight));
    return CVPixelBufferGetHeight(a3) * Width * v13;
  }
  return v6;
}

+ (void)transferAttachmentForKey:(__CFString *)a3 fromBuffer:(__CVBuffer *)a4 toBuffer:(__CVBuffer *)a5
{
  CFTypeRef v7;
  const void *v8;

  v7 = CVBufferCopyAttachment(a4, a3, 0);
  if (v7)
  {
    v8 = v7;
    CVBufferSetAttachment(a5, a3, v7, kCVAttachmentMode_ShouldPropagate);
    CFRelease(v8);
  }
  else
  {
    CVBufferRemoveAttachment(a5, a3);
  }
}

@end
