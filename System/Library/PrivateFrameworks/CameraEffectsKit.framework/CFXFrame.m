@implementation CFXFrame

- (CFXFrame)initWithARFrame:(id)a3
{
  id v5;
  CFXFrame *v6;
  CFXFrame *v7;
  Float64 v8;
  uint64_t v9;
  CMTime v11;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CFXFrame;
  v6 = -[CFXFrame init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_arFrame, a3);
    v7->_pixelBuffer = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v5, "capturedImage"));
    objc_msgSend(v5, "timestamp");
    CMTimeMakeWithSeconds(&v11, v8, 1000000000);
    v7->_timestamp = ($95D729B680665BEAEFA1D6FCA8238556)v11;
    v9 = MEMORY[0x24BDC0D88];
    *(_OWORD *)&v7->_latency.value = *MEMORY[0x24BDC0D88];
    v7->_latency.epoch = *(_QWORD *)(v9 + 16);
  }

  return v7;
}

- (CFXFrame)initWithPixelBuffer:(__CVBuffer *)a3 timestamp:(id *)a4
{
  char *v6;
  int64_t var3;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CFXFrame;
  v6 = -[CFXFrame init](&v10, sel_init);
  if (v6)
  {
    *((_QWORD *)v6 + 1) = CVPixelBufferRetain(a3);
    var3 = a4->var3;
    *(_OWORD *)(v6 + 56) = *(_OWORD *)&a4->var0;
    *((_QWORD *)v6 + 9) = var3;
    v8 = MEMORY[0x24BDC0D88];
    *((_OWORD *)v6 + 2) = *MEMORY[0x24BDC0D88];
    *((_QWORD *)v6 + 6) = *(_QWORD *)(v8 + 16);
  }
  return (CFXFrame *)v6;
}

- (CFXFrame)initWithFrameSet:(id)a3
{
  id v5;
  CFXFrame *v6;
  CFXFrame *v7;
  void *v8;
  uint64_t v9;
  __int128 v11;
  int64_t v12;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CFXFrame;
  v6 = -[CFXFrame init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pvFrameSet, a3);
    objc_msgSend(v5, "colorImageBuffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_pixelBuffer = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v8, "cvPixelBuffer"));

    if (v5)
    {
      objc_msgSend(v5, "presentationTimeStamp");
    }
    else
    {
      v11 = 0uLL;
      v12 = 0;
    }
    *(_OWORD *)&v7->_timestamp.value = v11;
    v7->_timestamp.epoch = v12;
    v9 = MEMORY[0x24BDC0D88];
    *(_OWORD *)&v7->_latency.value = *MEMORY[0x24BDC0D88];
    v7->_latency.epoch = *(_QWORD *)(v9 + 16);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)CFXFrame;
  -[CFXFrame dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BYTE v5[24];

  v4 = a3;
  -[CFXFrame timestamp](self, "timestamp");
  objc_msgSend(v4, "encodeCMTime:forKey:", v5, CFSTR("timestamp"));

}

- (BOOL)isEqual:(id)a3
{
  CFXFrame *v4;
  BOOL v5;

  v4 = (CFXFrame *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CFXFrame isEqualToFrame:](self, "isEqualToFrame:", v4);
  }

  return v5;
}

- (BOOL)isEqualToFrame:(id)a3
{
  id v4;
  __CVBuffer *v5;
  BOOL v6;
  CMTime v8;
  CMTime time1;

  v4 = a3;
  v5 = -[CFXFrame pixelBuffer](self, "pixelBuffer");
  if (v5 == (__CVBuffer *)objc_msgSend(v4, "pixelBuffer"))
  {
    -[CFXFrame timestamp](self, "timestamp");
    if (v4)
      objc_msgSend(v4, "timestamp");
    else
      memset(&v8, 0, sizeof(v8));
    v6 = CMTimeCompare(&time1, &v8) == 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)latency
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setLatency:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_latency.epoch = a3->var3;
  *(_OWORD *)&self->_latency.value = v3;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  self->_pixelBuffer = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setTimestamp:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_timestamp.epoch = a3->var3;
  *(_OWORD *)&self->_timestamp.value = v3;
}

- (PVFrameSet)pvFrameSet
{
  return self->_pvFrameSet;
}

- (void)setPvFrameSet:(id)a3
{
  objc_storeStrong((id *)&self->_pvFrameSet, a3);
}

- (ARFrame)arFrame
{
  return self->_arFrame;
}

- (void)setArFrame:(id)a3
{
  objc_storeStrong((id *)&self->_arFrame, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)requestTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (void)setRequestTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_requestTime.epoch = a3->var3;
  *(_OWORD *)&self->_requestTime.value = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arFrame, 0);
  objc_storeStrong((id *)&self->_pvFrameSet, 0);
}

@end
