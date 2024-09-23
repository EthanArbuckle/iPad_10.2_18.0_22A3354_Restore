@implementation CAMSampleBufferVideoFormatOutputCommand

- (CAMSampleBufferVideoFormatOutputCommand)initWithSampleBufferVideoFormat:(int64_t)a3
{
  CAMSampleBufferVideoFormatOutputCommand *v4;
  CAMSampleBufferVideoFormatOutputCommand *v5;
  CAMSampleBufferVideoFormatOutputCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMSampleBufferVideoFormatOutputCommand;
  v4 = -[CAMCaptureCommand init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__videoFormat = a3;
    v6 = v4;
  }

  return v5;
}

- (void)executeWithContext:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "currentEffectsPreviewOutput");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMSampleBufferVideoFormatOutputCommand _videoFormat](self, "_videoFormat");
  if (v4 == 1)
  {
    v5 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1111970369);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, *MEMORY[0x1E0CA9040], 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setVideoSettings:", v7);
    objc_msgSend(v8, "setAlwaysDiscardsLateVideoFrames:", 1);

  }
  else if (!v4)
  {
    objc_msgSend(v8, "setVideoSettings:", 0);
  }

}

- (int64_t)_videoFormat
{
  return self->__videoFormat;
}

- (CAMSampleBufferVideoFormatOutputCommand)initWithCoder:(id)a3
{
  id v4;
  CAMSampleBufferVideoFormatOutputCommand *v5;
  CAMSampleBufferVideoFormatOutputCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMSampleBufferVideoFormatOutputCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->__videoFormat = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CAMSampleBufferVideoFormat"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMSampleBufferVideoFormatOutputCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMSampleBufferVideoFormatOutputCommand _videoFormat](self, "_videoFormat", v5.receiver, v5.super_class), CFSTR("CAMSampleBufferVideoFormat"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMSampleBufferVideoFormatOutputCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[3] = -[CAMSampleBufferVideoFormatOutputCommand _videoFormat](self, "_videoFormat");
  return v4;
}

@end
