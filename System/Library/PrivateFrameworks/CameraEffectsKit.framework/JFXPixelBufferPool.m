@implementation JFXPixelBufferPool

- (JFXPixelBufferPool)initWithSize:(CGSize)a3 type:(unsigned int)a4
{
  uint64_t v4;
  double height;
  double width;
  JFXPixelBufferPool *v7;
  JFXPixelBufferPool *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  JFXPixelBufferPool *v15;
  objc_super v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v4 = *(_QWORD *)&a4;
  height = a3.height;
  width = a3.width;
  v19[4] = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)JFXPixelBufferPool;
  v7 = -[JFXPixelBufferPool init](&v17, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_5;
  v7->_size.width = (double)(unint64_t)width;
  v7->_size.height = (double)(unint64_t)height;
  v7->_type = v4;
  v18[0] = *MEMORY[0x24BDC56B8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDC5690];
  v19[0] = v9;
  v19[1] = MEMORY[0x24BDBD1C8];
  v11 = *MEMORY[0x24BDC5708];
  v18[1] = v10;
  v18[2] = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8->_size.width);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v12;
  v18[3] = *MEMORY[0x24BDC5650];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8->_size.height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, (CFDictionaryRef)v14, &v8->_pixelBufferPool))
  {

LABEL_5:
    v15 = v8;
    goto LABEL_6;
  }
  CVPixelBufferPoolRelease(v8->_pixelBufferPool);

  v15 = 0;
LABEL_6:

  return v15;
}

- (JFXPixelBufferPool)initWithSize:(CGSize)a3
{
  return -[JFXPixelBufferPool initWithSize:type:](self, "initWithSize:type:", 875704438, a3.width, a3.height);
}

- (void)dealloc
{
  __CVPixelBufferPool *pixelBufferPool;
  objc_super v4;

  pixelBufferPool = self->_pixelBufferPool;
  if (pixelBufferPool)
  {
    CVPixelBufferPoolFlush(pixelBufferPool, 1uLL);
    CVPixelBufferPoolRelease(self->_pixelBufferPool);
    self->_pixelBufferPool = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)JFXPixelBufferPool;
  -[JFXPixelBufferPool dealloc](&v4, sel_dealloc);
}

- (__CVBuffer)createPixelBuffer
{
  CVReturn v2;
  __CVBuffer *result;
  CVPixelBufferRef pixelBufferOut;

  pixelBufferOut = 0;
  v2 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], self->_pixelBufferPool, &pixelBufferOut);
  result = pixelBufferOut;
  if (v2)
  {
    CVPixelBufferRelease(pixelBufferOut);
    return 0;
  }
  return result;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unsigned)type
{
  return self->_type;
}

@end
