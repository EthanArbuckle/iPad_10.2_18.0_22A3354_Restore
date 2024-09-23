@implementation MIOPixelBufferPool

+ (id)makeBufferConfigDict:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 bufferCacheMode:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, *MEMORY[0x24BDC5708]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v12, *MEMORY[0x24BDC5650]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v13, *MEMORY[0x24BDC56B8]);

  v14 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryWithObject:forKey:", v15, *MEMORY[0x24BDD8E40]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKey:", v16, *MEMORY[0x24BDC5668]);
  return v10;
}

- (MIOPixelBufferPool)initWithPixelBuffer:(__CVBuffer *)a3 bufferAttributes:(__CFDictionary *)a4 poolAttributes:(__CFDictionary *)a5 error:(id *)a6
{
  MIOPixelBufferPool *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  MIOPixelBufferPool *v21;
  uint64_t v22;
  size_t v23;
  void *v24;
  uint64_t v25;
  NSDictionary *poolAttributes;
  id v28;
  void *v29;
  void *v30;
  size_t extraRowsOnBottom;
  size_t extraRowsOnTop;
  size_t extraColumnsOnRight;
  objc_super v34;
  size_t extraColumnsOnLeft[4];

  extraColumnsOnLeft[3] = *MEMORY[0x24BDAC8D0];
  v34.receiver = self;
  v34.super_class = (Class)MIOPixelBufferPool;
  v10 = -[MIOPixelBufferPool init](&v34, sel_init);
  if (!v10)
    goto LABEL_17;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", CVPixelBufferGetHeight(a3));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, *MEMORY[0x24BDC5650]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", CVPixelBufferGetWidth(a3));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v13, *MEMORY[0x24BDC5708]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", CVPixelBufferGetPixelFormatType(a3));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v14, *MEMORY[0x24BDC56B8]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", CVPixelBufferGetBytesPerRow(a3));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v15, *MEMORY[0x24BDC55D0]);

    extraColumnsOnLeft[0] = 0;
    extraRowsOnTop = 0;
    extraColumnsOnRight = 0;
    extraRowsOnBottom = 0;
    CVPixelBufferGetExtendedPixels(a3, extraColumnsOnLeft, &extraColumnsOnRight, &extraRowsOnTop, &extraRowsOnBottom);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", extraColumnsOnLeft[0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v16, *MEMORY[0x24BDC5620]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", extraColumnsOnRight);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v17, *MEMORY[0x24BDC5628]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", extraRowsOnTop);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v18, *MEMORY[0x24BDC5638]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", extraRowsOnBottom);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v19, *MEMORY[0x24BDC5610]);

  }
  else if (a6)
  {
    v22 = 0;
    v23 = *MEMORY[0x24BDC5650];
    extraColumnsOnLeft[0] = *MEMORY[0x24BDC5708];
    extraColumnsOnLeft[1] = v23;
    extraColumnsOnLeft[2] = *MEMORY[0x24BDC56B8];
    while (1)
    {
      v24 = (void *)extraColumnsOnLeft[v22];
      if ((!a4 || !CFDictionaryContainsKey(a4, (const void *)extraColumnsOnLeft[v22]))
        && (!a5 || !CFDictionaryContainsKey(a5, v24)))
      {
        break;
      }
      if (++v22 == 3)
      {
        *a6 = 0;
        goto LABEL_4;
      }
    }
    v28 = v24;
    v29 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(CFSTR("Minimum PixelBufferPool attributes not satistfied, missing key: "), "stringByAppendingString:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "mioPixelBufferPoolErrorWithMessage:code:", v30, 1);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_4:
  if (a4)
    objc_msgSend(v11, "addEntriesFromDictionary:", a4);
  v20 = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a5, (CFDictionaryRef)v11, &v10->_pixelBufferPool);
  if (!(_DWORD)v20)
  {
    CVPixelBufferPoolGetAttributes(v10->_pixelBufferPool);
    v25 = objc_claimAutoreleasedReturnValue();
    poolAttributes = v10->_poolAttributes;
    v10->_poolAttributes = (NSDictionary *)v25;

LABEL_17:
    v21 = v10;
    goto LABEL_18;
  }
  NSLog(CFSTR("Error creating underlying pixel buffer pool: %d"), v20);

  v21 = 0;
LABEL_18:

  return v21;
}

- (__CVBuffer)getPixelBuffer
{
  void *v3;
  const __CFAllocator *v4;
  __CVPixelBufferPool *pixelBufferPool;
  CVReturn v6;
  CVReturn v7;
  CVPixelBufferRef pixelBufferOut;

  CVPixelBufferPoolRetain(self->_pixelBufferPool);
  pixelBufferOut = 0;
  -[NSDictionary valueForKey:](self->_poolAttributes, "valueForKey:", CFSTR("BufferPoolAllocationThreshold"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  pixelBufferPool = self->_pixelBufferPool;
  if (v3)
    v6 = CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(v4, pixelBufferPool, (CFDictionaryRef)self->_poolAttributes, &pixelBufferOut);
  else
    v6 = CVPixelBufferPoolCreatePixelBuffer(v4, pixelBufferPool, &pixelBufferOut);
  v7 = v6;
  CVPixelBufferPoolRelease(self->_pixelBufferPool);
  if (v7)
    return 0;
  else
    return pixelBufferOut;
}

- (unint64_t)getMinimumBufferCount
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_poolAttributes, "objectForKeyedSubscript:", *MEMORY[0x24BDC56F0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongValue");

  return v3;
}

- (double)getMaximumBufferAge
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKeyedSubscript:](self->_poolAttributes, "objectForKeyedSubscript:", *MEMORY[0x24BDC56E0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (unint64_t)getAllocationThreshold
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_poolAttributes, "objectForKeyedSubscript:", *MEMORY[0x24BDC56D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongValue");

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferPoolFlush(self->_pixelBufferPool, 1uLL);
  CVPixelBufferPoolRelease(self->_pixelBufferPool);
  v3.receiver = self;
  v3.super_class = (Class)MIOPixelBufferPool;
  -[MIOPixelBufferPool dealloc](&v3, sel_dealloc);
}

- (void)flush
{
  __CVPixelBufferPool *pixelBufferPool;

  pixelBufferPool = self->_pixelBufferPool;
  if (pixelBufferPool)
    CVPixelBufferPoolFlush(pixelBufferPool, 1uLL);
}

+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5
{
  uint64_t v5;
  MIOPixelBufferPool *v8;
  void *v9;
  void *v10;
  MIOPixelBufferPool *v11;
  MIOPixelBufferPool *v12;

  v5 = *(_QWORD *)&a5;
  v8 = [MIOPixelBufferPool alloc];
  +[MIOPixelBufferPool makeBufferConfigDict:height:pixelFormat:bufferCacheMode:](MIOPixelBufferPool, "makeBufferConfigDict:height:pixelFormat:bufferCacheMode:", a3, a4, v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  v12 = -[MIOPixelBufferPool initWithPixelBuffer:bufferAttributes:poolAttributes:error:](v11, "initWithPixelBuffer:bufferAttributes:poolAttributes:error:", 0, v10, 0, 0);

  return v12;
}

+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 minBufferCount:(unint64_t)a6
{
  uint64_t v7;
  MIOPixelBufferPool *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MIOPixelBufferPool *v15;
  MIOPixelBufferPool *v16;
  uint64_t v18;
  _QWORD v19[2];

  v7 = *(_QWORD *)&a5;
  v19[1] = *MEMORY[0x24BDAC8D0];
  v10 = [MIOPixelBufferPool alloc];
  +[MIOPixelBufferPool makeBufferConfigDict:height:pixelFormat:bufferCacheMode:](MIOPixelBufferPool, "makeBufferConfigDict:height:pixelFormat:bufferCacheMode:", a3, a4, v7, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x24BDC56F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v10;
  v16 = -[MIOPixelBufferPool initWithPixelBuffer:bufferAttributes:poolAttributes:error:](v15, "initWithPixelBuffer:bufferAttributes:poolAttributes:error:", 0, v12, v14, 0);

  return v16;
}

+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 minBufferCount:(unint64_t)a6 bufferCacheMode:(int)a7
{
  uint64_t v7;
  uint64_t v9;
  MIOPixelBufferPool *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MIOPixelBufferPool *v17;
  MIOPixelBufferPool *v18;
  uint64_t v20;
  _QWORD v21[2];

  v7 = *(_QWORD *)&a7;
  v9 = *(_QWORD *)&a5;
  v21[1] = *MEMORY[0x24BDAC8D0];
  v12 = [MIOPixelBufferPool alloc];
  +[MIOPixelBufferPool makeBufferConfigDict:height:pixelFormat:bufferCacheMode:](MIOPixelBufferPool, "makeBufferConfigDict:height:pixelFormat:bufferCacheMode:", a3, a4, v9, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x24BDC56F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v12;
  v18 = -[MIOPixelBufferPool initWithPixelBuffer:bufferAttributes:poolAttributes:error:](v17, "initWithPixelBuffer:bufferAttributes:poolAttributes:error:", 0, v14, v16, 0);

  return v18;
}

+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 extendedPixelsPerRow:(unint64_t)a6 minBufferCount:(unint64_t)a7
{
  return (id)objc_msgSend(a1, "createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:bufferCacheMode:", a3, a4, *(_QWORD *)&a5, a6, a7, 0);
}

+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 extendedPixelsPerRow:(unint64_t)a6 minBufferCount:(unint64_t)a7 bufferCacheMode:(int)a8
{
  uint64_t v8;
  uint64_t v11;
  MIOPixelBufferPool *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MIOPixelBufferPool *v20;
  MIOPixelBufferPool *v21;
  uint64_t v23;
  _QWORD v24[2];

  v8 = *(_QWORD *)&a8;
  v11 = *(_QWORD *)&a5;
  v24[1] = *MEMORY[0x24BDAC8D0];
  v14 = [MIOPixelBufferPool alloc];
  +[MIOPixelBufferPool makeBufferConfigDict:height:pixelFormat:bufferCacheMode:](MIOPixelBufferPool, "makeBufferConfigDict:height:pixelFormat:bufferCacheMode:", a3, a4, v11, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v16, *MEMORY[0x24BDC5628]);

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x24BDC56F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v14;
  v21 = -[MIOPixelBufferPool initWithPixelBuffer:bufferAttributes:poolAttributes:error:](v20, "initWithPixelBuffer:bufferAttributes:poolAttributes:error:", 0, v17, v19, 0);

  return v21;
}

+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 minBufferCount:(unint64_t)a6 maxBufferCount:(unint64_t)a7 bufferCacheMode:(int)a8
{
  uint64_t v8;
  uint64_t v11;
  MIOPixelBufferPool *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MIOPixelBufferPool *v20;
  MIOPixelBufferPool *v21;
  _QWORD v23[2];
  _QWORD v24[3];

  v8 = *(_QWORD *)&a8;
  v11 = *(_QWORD *)&a5;
  v24[2] = *MEMORY[0x24BDAC8D0];
  v14 = [MIOPixelBufferPool alloc];
  +[MIOPixelBufferPool makeBufferConfigDict:height:pixelFormat:bufferCacheMode:](MIOPixelBufferPool, "makeBufferConfigDict:height:pixelFormat:bufferCacheMode:", a3, a4, v11, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = *MEMORY[0x24BDC56F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v17;
  v23[1] = *MEMORY[0x24BDC56D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v14;
  v21 = -[MIOPixelBufferPool initWithPixelBuffer:bufferAttributes:poolAttributes:error:](v20, "initWithPixelBuffer:bufferAttributes:poolAttributes:error:", 0, v16, v19, 0);

  return v21;
}

+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 exactBytesPerRow:(unint64_t)a6 minBufferCount:(unint64_t)a7
{
  return +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:height:pixelFormat:exactBytesPerRow:minBufferCount:bufferCacheMode:](MIOPixelBufferPool, "createMIOPixelBufferPoolWithWidth:height:pixelFormat:exactBytesPerRow:minBufferCount:bufferCacheMode:", a3, a4, *(_QWORD *)&a5, a6, a7, 0);
}

+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 exactBytesPerRow:(unint64_t)a6 minBufferCount:(unint64_t)a7 bufferCacheMode:(int)a8
{
  uint64_t v8;
  uint64_t v11;
  MIOPixelBufferPool *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MIOPixelBufferPool *v20;
  MIOPixelBufferPool *v21;
  uint64_t v23;
  _QWORD v24[2];

  v8 = *(_QWORD *)&a8;
  v11 = *(_QWORD *)&a5;
  v24[1] = *MEMORY[0x24BDAC8D0];
  v14 = [MIOPixelBufferPool alloc];
  +[MIOPixelBufferPool makeBufferConfigDict:height:pixelFormat:bufferCacheMode:](MIOPixelBufferPool, "makeBufferConfigDict:height:pixelFormat:bufferCacheMode:", a3, a4, v11, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v16, *MEMORY[0x24BDC5600]);

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x24BDC56F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v14;
  v21 = -[MIOPixelBufferPool initWithPixelBuffer:bufferAttributes:poolAttributes:error:](v20, "initWithPixelBuffer:bufferAttributes:poolAttributes:error:", 0, v17, v19, 0);

  return v21;
}

+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 exactBytesPerRows:(id)a6 minBufferCount:(unint64_t)a7
{
  objc_msgSend(a1, "createMIOPixelBufferPoolWithWidth:height:pixelFormat:exactBytesPerRows:minBufferCount:bufferCacheMode:", a3, a4, *(_QWORD *)&a5, a6, a7, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)createMIOPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 exactBytesPerRows:(id)a6 minBufferCount:(unint64_t)a7 bufferCacheMode:(int)a8
{
  uint64_t v9;
  id v12;
  MIOPixelBufferPool *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MIOPixelBufferPool *v18;
  MIOPixelBufferPool *v19;
  uint64_t v21;
  _QWORD v22[2];

  v9 = *(_QWORD *)&a5;
  v22[1] = *MEMORY[0x24BDAC8D0];
  v12 = a6;
  v13 = [MIOPixelBufferPool alloc];
  +[MIOPixelBufferPool makeBufferConfigDict:height:pixelFormat:bufferCacheMode:](MIOPixelBufferPool, "makeBufferConfigDict:height:pixelFormat:bufferCacheMode:", a3, a4, v9, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v12, *MEMORY[0x24BDC5600]);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x24BDC56F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v13;
  v19 = -[MIOPixelBufferPool initWithPixelBuffer:bufferAttributes:poolAttributes:error:](v18, "initWithPixelBuffer:bufferAttributes:poolAttributes:error:", 0, v15, v17, 0);

  return v19;
}

+ (id)createNewL010MIOPixelBufferPoolWithReferencePixelBuffer:(__CVBuffer *)a3 minBufferCount:(unint64_t)a4 bufferCacheMode:(int)a5
{
  uint64_t v5;
  MIOPixelBufferPool *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MIOPixelBufferPool *v16;
  MIOPixelBufferPool *v17;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v5 = *(_QWORD *)&a5;
  v24[2] = *MEMORY[0x24BDAC8D0];
  v8 = [MIOPixelBufferPool alloc];
  v9 = *MEMORY[0x24BDC56B8];
  v24[0] = &unk_24CA5BBE0;
  v10 = *MEMORY[0x24BDC5668];
  v23[0] = v9;
  v23[1] = v10;
  v21 = *MEMORY[0x24BDD8E40];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = *MEMORY[0x24BDC56F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v8;
  v17 = -[MIOPixelBufferPool initWithPixelBuffer:bufferAttributes:poolAttributes:error:](v16, "initWithPixelBuffer:bufferAttributes:poolAttributes:error:", a3, v13, v15, 0);

  return v17;
}

+ (id)createNewL008MIOPixelBufferPoolWithReferencePixelBuffer:(__CVBuffer *)a3 minBufferCount:(unint64_t)a4 bufferCacheMode:(int)a5
{
  uint64_t v5;
  MIOPixelBufferPool *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MIOPixelBufferPool *v16;
  MIOPixelBufferPool *v17;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v5 = *(_QWORD *)&a5;
  v24[2] = *MEMORY[0x24BDAC8D0];
  v8 = [MIOPixelBufferPool alloc];
  v9 = *MEMORY[0x24BDC56B8];
  v24[0] = &unk_24CA5BBF8;
  v10 = *MEMORY[0x24BDC5668];
  v23[0] = v9;
  v23[1] = v10;
  v21 = *MEMORY[0x24BDD8E40];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = *MEMORY[0x24BDC56F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v8;
  v17 = -[MIOPixelBufferPool initWithPixelBuffer:bufferAttributes:poolAttributes:error:](v16, "initWithPixelBuffer:bufferAttributes:poolAttributes:error:", a3, v13, v15, 0);

  return v17;
}

- (__CVPixelBufferPool)pixelBufferPool
{
  return self->_pixelBufferPool;
}

- (void)setPixelBufferPool:(__CVPixelBufferPool *)a3
{
  self->_pixelBufferPool = a3;
}

- (NSDictionary)poolAttributes
{
  return self->_poolAttributes;
}

- (void)setPoolAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_poolAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poolAttributes, 0);
}

@end
