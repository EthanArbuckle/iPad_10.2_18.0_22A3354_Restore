@implementation CAMPanoramaConfiguration

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance___sharedInstance;
}

void __42__CAMPanoramaConfiguration_sharedInstance__block_invoke()
{
  CAMPanoramaConfiguration *v0;
  void *v1;
  id v2;

  v2 = (id)ACT_CopyDefaultConfigurationForPanorama();
  v0 = -[CAMPanoramaConfiguration initWithACTConfiguration:]([CAMPanoramaConfiguration alloc], "initWithACTConfiguration:", v2);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

- (CAMPanoramaConfiguration)initWithACTConfiguration:(id)a3
{
  id v4;
  CAMPanoramaConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  int32_t v9;
  void *v10;
  int32_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDictionary *maxWidthPerDevice;
  CAMPanoramaConfiguration *v16;
  CMTime v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CAMPanoramaConfiguration;
  v5 = -[CAMPanoramaConfiguration init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CF1280]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sampleBufferWidth = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CF1278]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sampleBufferHeight = objc_msgSend(v7, "integerValue");

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CF12B0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");

    CMTimeMake(&v18, 1, v9);
    v5->_minimumFramerate = ($95D729B680665BEAEFA1D6FCA8238556)v18;
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CF1290]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    CMTimeMake(&v18, 1, v11);
    v5->_maximumFramerate = ($95D729B680665BEAEFA1D6FCA8238556)v18;
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CF1258]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_ringBufferSize = objc_msgSend(v12, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CF12A8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maxWidth = objc_msgSend(v13, "integerValue");

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CF12A0]);
    v14 = objc_claimAutoreleasedReturnValue();
    maxWidthPerDevice = v5->__maxWidthPerDevice;
    v5->__maxWidthPerDevice = (NSDictionary *)v14;

    v16 = v5;
  }

  return v5;
}

- (int64_t)maxWidthForDevice:(int64_t)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = -[CAMPanoramaConfiguration maxWidth](self, "maxWidth");
  +[CAMCaptureConversions AVCaptureDeviceTypeForCAMCaptureDevice:](CAMCaptureConversions, "AVCaptureDeviceTypeForCAMCaptureDevice:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPanoramaConfiguration _maxWidthPerDevice](self, "_maxWidthPerDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v6)
  {
    -[CAMPanoramaConfiguration _maxWidthPerDevice](self, "_maxWidthPerDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v5 = objc_msgSend(v9, "integerValue");

  }
  return v5;
}

- (CAMPanoramaConfiguration)initWithCoder:(id)a3
{
  id v4;
  CAMPanoramaConfiguration *v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  uint64_t v8;
  NSDictionary *maxWidthPerDevice;
  CAMPanoramaConfiguration *v10;
  CMTime v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CAMPanoramaConfiguration;
  v5 = -[CAMPanoramaConfiguration init](&v13, sel_init);
  if (v5)
  {
    v5->_ringBufferSize = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("CAMPanoramaConfigurationRingBufferSize"));
    v5->_sampleBufferWidth = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CAMPanoramaConfigurationSampleBufferWidth"));
    v5->_sampleBufferHeight = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CAMPanoramaConfigurationSampleBufferHeight"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CAMPanoramaConfigurationMinimumFramerate"));
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeFromDictionary(&v12, v6);
    v5->_minimumFramerate = ($95D729B680665BEAEFA1D6FCA8238556)v12;
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CAMPanoramaConfigurationMaximumFramerate"));
    v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeFromDictionary(&v12, v7);
    v5->_maximumFramerate = ($95D729B680665BEAEFA1D6FCA8238556)v12;
    v5->_maxWidth = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CAMPanoramaConfigurationMaxWidth"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CAMPanoramaConfigurationMaxWidthPerDevice"));
    v8 = objc_claimAutoreleasedReturnValue();
    maxWidthPerDevice = v5->__maxWidthPerDevice;
    v5->__maxWidthPerDevice = (NSDictionary *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t ringBufferSize;
  id v5;
  const __CFAllocator *v6;
  CFDictionaryRef v7;
  CFDictionaryRef v8;
  $95D729B680665BEAEFA1D6FCA8238556 minimumFramerate;

  ringBufferSize = self->_ringBufferSize;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", ringBufferSize, CFSTR("CAMPanoramaConfigurationRingBufferSize"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sampleBufferWidth, CFSTR("CAMPanoramaConfigurationSampleBufferWidth"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sampleBufferHeight, CFSTR("CAMPanoramaConfigurationSampleBufferHeight"));
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  minimumFramerate = self->_minimumFramerate;
  v7 = CMTimeCopyAsDictionary((CMTime *)&minimumFramerate, v6);
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("CAMPanoramaConfigurationMinimumFramerate"));
  minimumFramerate = self->_maximumFramerate;
  v8 = CMTimeCopyAsDictionary((CMTime *)&minimumFramerate, v6);
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("CAMPanoramaConfigurationMaximumFramerate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maxWidth, CFSTR("CAMPanoramaConfigurationMaxWidth"));
  objc_msgSend(v5, "encodeObject:forKey:", self->__maxWidthPerDevice, CFSTR("CAMPanoramaConfigurationMaxWidthPerDevice"));

}

- (int64_t)sampleBufferWidth
{
  return self->_sampleBufferWidth;
}

- (int64_t)sampleBufferHeight
{
  return self->_sampleBufferHeight;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumFramerate
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumFramerate
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[3];
  return self;
}

- (int)ringBufferSize
{
  return self->_ringBufferSize;
}

- (int64_t)maxWidth
{
  return self->_maxWidth;
}

- (NSDictionary)_maxWidthPerDevice
{
  return self->__maxWidthPerDevice;
}

- (void)set_maxWidthPerDevice:(id)a3
{
  objc_storeStrong((id *)&self->__maxWidthPerDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__maxWidthPerDevice, 0);
}

@end
