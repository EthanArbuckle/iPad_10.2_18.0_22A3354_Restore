@implementation MADPNGAlphaSequenceWriter

- (MADPNGAlphaSequenceWriter)initWithFrameCount:(unint64_t)a3
{
  MADPNGAlphaSequenceWriter *v4;
  uint64_t v5;
  NSMutableData *data;
  __CFData *v7;
  __CFString *v8;
  CGImageDestination *value;
  void *v10;
  CGImageDestinationRef v12;
  objc_super v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)MADPNGAlphaSequenceWriter;
  v4 = -[MADPNGAlphaSequenceWriter init](&v13, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v5 = objc_claimAutoreleasedReturnValue();
    data = v4->_data;
    v4->_data = (NSMutableData *)v5;

    v7 = (__CFData *)v4->_data;
    objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12 = CGImageDestinationCreateWithData(v7, v8, a3, 0);
    CF<__CVBuffer *>::operator=((const void **)&v4->_destination.value_, (const void **)&v12);
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&v12);

    value = v4->_destination.value_;
    if (value)
    {
      v16[0] = *MEMORY[0x1E0CBD028];
      v14 = *MEMORY[0x1E0CBC818];
      v15 = &unk_1E6B749D8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = *MEMORY[0x1E0CBCEA0];
      v17[0] = v10;
      v17[1] = MEMORY[0x1E0C9AAB0];
      CGImageDestinationSetProperties(value, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2));

    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create PNG sequence destination", (uint8_t *)&v12, 2u);
      }
      v4->_status = -18;
    }
    v4->_remainingFrameCount = a3;
  }
  return v4;
}

- (int)addPixelBuffer:(__CVBuffer *)a3 withTime:(id *)a4
{
  MADPNGAlphaSequenceWriter *v4;
  __CVBuffer *value;
  CGImageRef *p_value;
  CGImage *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFDictionary *v15;
  int64_t var3;
  int64_t var0;
  int var1;
  CMTime time;
  CMTime rhs;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  CMTime lhs;
  uint64_t v27;

  v4 = self;
  v27 = *MEMORY[0x1E0C80C00];
  LODWORD(self) = self->_status;
  if ((_DWORD)self)
    return (int)self;
  if (v4->_remainingFrameCount)
  {
    value = v4->_lastPixelBuffer.value_;
    if (!value)
    {
LABEL_9:
      lhs.value = (CMTimeValue)CFRetain(a3);
      CF<__CVBuffer *>::operator=((const void **)&v4->_lastPixelBuffer.value_, (const void **)&lhs);
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&lhs);
      LODWORD(self) = 0;
      var3 = a4->var3;
      *(_OWORD *)&v4->_lastPTS.value = *(_OWORD *)&a4->var0;
      v4->_lastPTS.epoch = var3;
      return (int)self;
    }
    p_value = &v4->_lastImage.value_;
    v9 = v4->_lastImage.value_;
    if (v9)
    {
      CFRelease(v9);
      *p_value = 0;
    }
    LODWORD(self) = VTCreateCGImageFromCVPixelBuffer(value, 0, &v4->_lastImage.value_);
    v4->_status = (int)self;
    if (!(_DWORD)self)
    {
      v10 = (void *)MEMORY[0x1E0C99E08];
      v24 = *MEMORY[0x1E0CBD028];
      v22 = *MEMORY[0x1E0CBC820];
      v11 = (void *)MEMORY[0x1E0CB37E8];
      lhs = (CMTime)*a4;
      rhs = (CMTime)v4->_lastPTS;
      CMTimeSubtract(&time, &lhs, &rhs);
      objc_msgSend(v11, "numberWithDouble:", CMTimeGetSeconds(&time));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dictionaryWithDictionary:", v14);
      v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      CGImageDestinationAddImage(v4->_destination.value_, *p_value, v15);
      --v4->_remainingFrameCount;

      goto LABEL_9;
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      var0 = a4->var0;
      var1 = a4->var1;
      LODWORD(lhs.value) = 134218240;
      *(CMTimeValue *)((char *)&lhs.value + 4) = var0;
      LOWORD(lhs.flags) = 1024;
      *(CMTimeFlags *)((char *)&lhs.flags + 2) = var1;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PNG sequence full; dropping pixel buffer (%lld/%d)",
        (uint8_t *)&lhs,
        0x12u);
    }
    self = (MADPNGAlphaSequenceWriter *)v4->_lastImage.value_;
    if (self)
    {
      CFRelease(self);
      LODWORD(self) = 0;
      v4->_lastImage.value_ = 0;
    }
  }
  return (int)self;
}

- (id)finishWithEndTime:(id *)a3
{
  NSMutableData *v3;
  unint64_t remainingFrameCount;
  int v8;
  __CVBuffer *value;
  CF<CGImage *> *p_lastImage;
  CGImage *v11;
  NSObject *v12;
  const char *v13;
  int64_t v14;
  int timescale;
  double Seconds;
  unint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFDictionary *v25;
  CMTime time;
  CMTime time2;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  $3CC8671D27C23BF42ADDB32F2B5E48AE buf;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->_status)
    goto LABEL_2;
  remainingFrameCount = self->_remainingFrameCount;
  if (remainingFrameCount)
  {
    if (remainingFrameCount != 1
      && (int)MediaAnalysisLogLevel() >= 4
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v8 = LODWORD(self->_remainingFrameCount) - 1;
      LODWORD(buf.var0) = 67109120;
      HIDWORD(buf.var0) = v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PNG sequence expected %d more frames; repeating last",
        (uint8_t *)&buf,
        8u);
    }
    buf = *a3;
    time2 = (CMTime)self->_lastPTS;
    if (CMTimeCompare((CMTime *)&buf, &time2) < 0)
    {
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_2;
      LOWORD(buf.var0) = 0;
      v12 = MEMORY[0x1E0C81028];
      v13 = "Invalid PNG sequence end time specified";
      goto LABEL_30;
    }
    value = self->_lastPixelBuffer.value_;
    p_lastImage = &self->_lastImage;
    v11 = self->_lastImage.value_;
    if (v11)
    {
      CFRelease(v11);
      p_lastImage->value_ = 0;
    }
    if (VTCreateCGImageFromCVPixelBuffer(value, 0, &self->_lastImage.value_))
    {
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_2;
      LOWORD(buf.var0) = 0;
      v12 = MEMORY[0x1E0C81028];
      v13 = "Failed to convert CVPixelBuffer to CGImage";
      goto LABEL_30;
    }
    buf = *a3;
    time2 = (CMTime)self->_lastPTS;
    CMTimeSubtract(&time, (CMTime *)&buf, &time2);
    Seconds = CMTimeGetSeconds(&time);
    v17 = self->_remainingFrameCount;
    if (v17)
    {
      v18 = Seconds / (double)v17;
      v19 = *MEMORY[0x1E0CBD028];
      v20 = *MEMORY[0x1E0CBC820];
      do
      {
        v21 = (void *)MEMORY[0x1E0C99E08];
        v30 = v19;
        v28 = v20;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "dictionaryWithDictionary:", v24);
        v25 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

        CGImageDestinationAddImage(self->_destination.value_, p_lastImage->value_, v25);
        --self->_remainingFrameCount;

      }
      while (self->_remainingFrameCount);
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v14 = self->_lastPTS.value;
    timescale = self->_lastPTS.timescale;
    LODWORD(buf.var0) = 134218240;
    *(int64_t *)((char *)&buf.var0 + 4) = v14;
    LOWORD(buf.var2) = 1024;
    *(unsigned int *)((char *)&buf.var2 + 2) = timescale;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PNG sequence full; dropping pixel buffer (%lld/%d)",
      (uint8_t *)&buf,
      0x12u);
  }
  if (CGImageDestinationFinalize(self->_destination.value_))
  {
    v3 = self->_data;
    return v3;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf.var0) = 0;
    v12 = MEMORY[0x1E0C81028];
    v13 = "Failed to finalize output PNG sequence";
LABEL_30:
    _os_log_impl(&dword_1B6C4A000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&buf, 2u);
  }
LABEL_2:
  v3 = 0;
  return v3;
}

- (id)transcodeWithMaxDimension:(unint64_t)a3
{
  uint8_t v4[16];

  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Transcode not supported", v4, 2u);
  }
  return 0;
}

- (void).cxx_destruct
{
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_lastImage.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_lastPixelBuffer.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_destination.value_);
  objc_storeStrong((id *)&self->_data, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

@end
