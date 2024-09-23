@implementation PADFrame

- (PADFrame)init
{
  PADFrame *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PADFrame;
  result = -[PADFrame init](&v3, sel_init);
  if (result)
    ++_retainedFramesCount;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  --_retainedFramesCount;
  v2.receiver = self;
  v2.super_class = (Class)PADFrame;
  -[PADFrame dealloc](&v2, sel_dealloc);
}

- (__CVBuffer)buffer
{
  return (__CVBuffer *)self->_buffer;
}

- (void)setBuffer:(__CVBuffer *)a3
{
  objc_storeStrong(&self->_buffer, a3);
}

- (CGSize)size
{
  double Width;
  double Height;
  double v5;
  CGSize result;

  Width = (double)CVPixelBufferGetWidth(-[PADFrame buffer](self, "buffer"));
  Height = (double)CVPixelBufferGetHeight(-[PADFrame buffer](self, "buffer"));
  v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (double)timestamp
{
  return (double)self->_time.value;
}

+ (id)cvPixelBufferFromData:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  const __CFDictionary *v6;
  void *v7;
  const __CFAllocator *v8;
  double v9;
  size_t v10;
  double v11;
  CVReturn v12;
  __CVBuffer *v13;
  void *v14;
  CVPixelBufferRef v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDC55E0];
  v17[0] = *MEMORY[0x24BDC55E8];
  v17[1] = v3;
  v18[0] = MEMORY[0x24BDBD1C8];
  v18[1] = MEMORY[0x24BDBD1C8];
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBF660], "imageWithData:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  objc_msgSend(v7, "extent");
  v10 = (unint64_t)v9;
  objc_msgSend(v7, "extent");
  v12 = CVPixelBufferCreate(v8, v10, (unint64_t)v11, 0x42475241u, v6, &v16);
  v13 = 0;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBF648], "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "render:toCVPixelBuffer:", v7, v16);
    v13 = v16;

  }
  return v13;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (void)setTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- (NSArray)faces
{
  return self->_faces;
}

- (void)setFaces:(id)a3
{
  objc_storeStrong((id *)&self->_faces, a3);
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unsigned int)a3
{
  self->_orientation = a3;
}

- (NSNumber)gestureToDetect
{
  return self->_gestureToDetect;
}

- (void)setGestureToDetect:(id)a3
{
  objc_storeStrong((id *)&self->_gestureToDetect, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureToDetect, 0);
  objc_storeStrong((id *)&self->_faces, 0);
  objc_storeStrong(&self->_buffer, 0);
}

@end
