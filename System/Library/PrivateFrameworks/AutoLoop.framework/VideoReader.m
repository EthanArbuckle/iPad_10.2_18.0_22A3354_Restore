@implementation VideoReader

- (VideoReader)initWithAsset:(id)a3
{
  id v5;
  AVAsset *asset;
  AVAssetTrack *videoTrack;
  AVAssetReader *assetReader;
  AVAssetReaderOutput *trackOutput;
  uint64_t v10;
  __int128 v11;
  int64_t v12;
  uint64_t v13;
  __int128 v14;
  int64_t v15;
  AVAsset *v16;
  void *v17;
  void *v18;
  AVAssetTrack *v19;
  AVAssetTrack *v20;
  AVAssetTrack *v21;
  __int128 v22;
  uint64_t v23;
  float Seconds;
  float v25;
  float v26;
  $95D729B680665BEAEFA1D6FCA8238556 *p_minFrameDuration;
  AVAssetTrack *v28;
  AVAssetTrack *v29;
  CGAffineTransform *p_preferredTransform;
  VideoReader *v31;
  __int128 v32;
  __int128 v33;
  NSArray *v34;
  NSArray *formatDescriptions;
  NSArray *v36;
  uint64_t v37;
  char v38;
  CFStringRef *v39;
  const opaqueCMFormatDescription *v40;
  double width;
  double height;
  const __CFBoolean *Extension;
  unsigned int v44;
  int v45;
  char v46;
  const __CFString *v47;
  unint64_t v48;
  char v49;
  const opaqueCMFormatDescription *v50;
  double v51;
  double v52;
  const __CFBoolean *v53;
  char v55;
  unsigned int v57;
  _BYTE time[32];
  __int128 v59;
  __int128 v60;
  _OWORD v61[2];
  CGRect CleanAperture;
  CGRect v63;

  v5 = a3;
  asset = self->asset;
  self->asset = 0;

  videoTrack = self->videoTrack;
  self->videoTrack = 0;

  assetReader = self->assetReader;
  self->assetReader = 0;

  trackOutput = self->trackOutput;
  self->trackOutput = 0;

  *(_QWORD *)&self->trackStart = 0;
  v10 = MEMORY[0x1E0CA2E68];
  v11 = *MEMORY[0x1E0CA2E68];
  *(_OWORD *)&self->trackStartT.value = *MEMORY[0x1E0CA2E68];
  v12 = *(_QWORD *)(v10 + 16);
  self->trackStartT.epoch = v12;
  v13 = MEMORY[0x1E0CA2E30];
  v14 = *MEMORY[0x1E0CA2E30];
  *(_OWORD *)&self->trackLengthT.value = *MEMORY[0x1E0CA2E30];
  v15 = *(_QWORD *)(v13 + 16);
  self->trackLengthT.epoch = v15;
  *(_QWORD *)&self->readStart = 0;
  *(_OWORD *)&self->readStartT.value = v11;
  self->readStartT.epoch = v12;
  *(_OWORD *)&self->readLengthT.value = v14;
  self->readLengthT.epoch = v15;
  self->fullRangeVideo = 0;
  self->_lastFrame = 0;
  self->_readaheadBuf = 0;
  -[VideoReader setPixelFormatOptions:](self, "setPixelFormatOptions:", 193);
  self->_readAheadEnable = 0;
  -[VideoReader setReadAheadEnable:](self, "setReadAheadEnable:", 1);
  objc_storeStrong((id *)&self->asset, a3);
  v16 = self->asset;
  if (v16)
  {
    -[AVAsset tracksWithMediaType:](v16, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17 || !objc_msgSend(v17, "count"))
    {
      NSLog(CFSTR("Asset has no video tracks\n"));
      goto LABEL_43;
    }
    if (objc_msgSend(v18, "count") != 1)
    {
      NSLog(CFSTR("Asset has multiple video tracks\n"));
      goto LABEL_43;
    }
    objc_msgSend(v18, "objectAtIndex:", 0);
    v19 = (AVAssetTrack *)objc_claimAutoreleasedReturnValue();
    v20 = self->videoTrack;
    self->videoTrack = v19;

    v21 = self->videoTrack;
    if (!v21)
    {
      NSLog(CFSTR("***Internal error accessing video track 0\n"));
      goto LABEL_43;
    }
    memset(v61, 0, sizeof(v61));
    v60 = 0u;
    -[AVAssetTrack timeRange](v21, "timeRange");
    *(_OWORD *)&self->trackStartT.value = v60;
    self->trackStartT.epoch = *(_QWORD *)&v61[0];
    v22 = *(_OWORD *)((char *)v61 + 8);
    *(_OWORD *)&self->trackLengthT.value = *(_OWORD *)((char *)v61 + 8);
    v23 = *((_QWORD *)&v61[1] + 1);
    self->trackLengthT.epoch = *((_QWORD *)&v61[1] + 1);
    *(_OWORD *)time = v22;
    *(_QWORD *)&time[16] = v23;
    Seconds = CMTimeGetSeconds((CMTime *)time);
    self->trackLength = Seconds;
    *(_OWORD *)time = *(_OWORD *)&self->trackStartT.value;
    *(_QWORD *)&time[16] = self->trackStartT.epoch;
    v25 = CMTimeGetSeconds((CMTime *)time);
    self->trackStart = v25;
    self->timeScale = -[AVAssetTrack naturalTimeScale](self->videoTrack, "naturalTimeScale");
    -[AVAssetTrack nominalFrameRate](self->videoTrack, "nominalFrameRate");
    self->fps = v26;
    p_minFrameDuration = &self->minFrameDuration;
    v28 = self->videoTrack;
    if (v28)
    {
      -[AVAssetTrack minFrameDuration](v28, "minFrameDuration");
      v29 = self->videoTrack;
      *(_OWORD *)&p_minFrameDuration->value = *(_OWORD *)time;
      self->minFrameDuration.epoch = *(_QWORD *)&time[16];
      p_preferredTransform = &self->preferredTransform;
      if (v29)
      {
        -[AVAssetTrack preferredTransform](v29, "preferredTransform");
        goto LABEL_15;
      }
    }
    else
    {
      p_minFrameDuration->value = 0;
      *(_QWORD *)&self->minFrameDuration.timescale = 0;
      p_preferredTransform = &self->preferredTransform;
      self->minFrameDuration.epoch = 0;
    }
    v59 = 0u;
    memset(time, 0, sizeof(time));
LABEL_15:
    v32 = *(_OWORD *)time;
    v33 = v59;
    *(_OWORD *)&p_preferredTransform->c = *(_OWORD *)&time[16];
    *(_OWORD *)&p_preferredTransform->tx = v33;
    *(_OWORD *)&p_preferredTransform->a = v32;
    -[AVAssetTrack formatDescriptions](self->videoTrack, "formatDescriptions");
    v34 = (NSArray *)objc_claimAutoreleasedReturnValue();
    formatDescriptions = self->formatDescriptions;
    self->formatDescriptions = v34;

    v36 = self->formatDescriptions;
    if (v36)
    {
      v37 = -[NSArray count](v36, "count");
      v38 = v37 != 0;
      v39 = (CFStringRef *)MEMORY[0x1E0CA21D0];
      if (v37)
      {
        v40 = -[NSArray objectAtIndex:](self->formatDescriptions, "objectAtIndex:", 0);
        CleanAperture = CMVideoFormatDescriptionGetCleanAperture(v40, 0);
        width = CleanAperture.size.width;
        height = CleanAperture.size.height;
        Extension = (const __CFBoolean *)CMFormatDescriptionGetExtension(v40, *v39);
        v57 = width;
        v44 = height;
        if (Extension)
        {
          v45 = CFBooleanGetValue(Extension) != 0;
          v46 = 1;
        }
        else
        {
          v46 = 0;
          v45 = 0;
        }
      }
      else
      {
        v46 = 0;
        v45 = 0;
        v44 = 0;
        v57 = 0;
      }
      if (-[NSArray count](self->formatDescriptions, "count") >= 2)
      {
        v47 = *v39;
        v48 = 1;
        do
        {
          v49 = v38;
          v50 = -[NSArray objectAtIndex:](self->formatDescriptions, "objectAtIndex:", v48);
          v63 = CMVideoFormatDescriptionGetCleanAperture(v50, 0);
          v51 = v63.size.width;
          v52 = v63.size.height;
          v53 = (const __CFBoolean *)CMFormatDescriptionGetExtension(v50, v47);
          v38 = 0;
          if ((v49 & 1) != 0 && v52 == (double)v44 && v51 == (double)v57)
          {
            v55 = v53 ? v46 ^ 1 : 1;
            v38 = v53 ? 0 : v46 ^ 1;
            if ((v55 & 1) == 0)
              v38 = CFBooleanGetValue(v53) == v45;
          }
          ++v48;
        }
        while (-[NSArray count](self->formatDescriptions, "count") > v48);
      }
      if ((v38 & 1) != 0)
      {
        self->imageWidth = v57;
        self->imageHeight = v44;
        if ((v46 & 1) != 0)
          self->fullRangeVideo = v45;
        else
          NSLog(CFSTR("Warning: No kCMFormatDescriptionExtension_FullRangeVideo found"));
        v31 = self;
        goto LABEL_44;
      }
      NSLog(&CFSTR("Unexpected formatDescriptions.count: expect 1; got %d. Empty formatDescriptions array or  formatDescription pro"
               "perties disagree\n").isa,
        -[NSArray count](self->formatDescriptions, "count"));
    }
    else
    {
      NSLog(CFSTR("***Error obtaining format descriptions\n"));
    }
LABEL_43:
    v31 = 0;
LABEL_44:

    goto LABEL_45;
  }
  NSLog(CFSTR("***Error: AVAsset is NULL"));
  v31 = 0;
LABEL_45:

  return v31;
}

- (id)initFromFile:(id)a3
{
  id v4;
  void *v5;
  VideoReader *v6;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[VideoReader initWithAsset:](self, "initWithAsset:", v5);
    v6 = self;
  }
  else
  {
    NSLog(CFSTR("***Error opening AVAsset at %s\n"), objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation"));
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[VideoReader readaheadLock](self, "readaheadLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  if (-[VideoReader readaheadBuf](self, "readaheadBuf"))
  {
    CFRelease(-[VideoReader readaheadBuf](self, "readaheadBuf"));
    -[VideoReader setReadaheadBuf:](self, "setReadaheadBuf:", 0);
  }
  -[VideoReader readaheadLock](self, "readaheadLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  if (-[VideoReader lastFrame](self, "lastFrame"))
  {
    CFRelease(-[VideoReader lastFrame](self, "lastFrame"));
    -[VideoReader setLastFrame:](self, "setLastFrame:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)VideoReader;
  -[VideoReader dealloc](&v5, sel_dealloc);
}

- (void)setReadStart:(float)a3
{
  CMTime v4;

  CMTimeMakeWithSeconds(&v4, a3, self->timeScale);
  self->readStartT = ($95D729B680665BEAEFA1D6FCA8238556)v4;
}

- (float)readStart
{
  return self->readStart;
}

- (int)buildAssetReader
{
  int v2;
  AVAsset *asset;
  AVAssetReader *v5;
  id v6;
  id v7;
  AVAssetReader *assetReader;
  CMTimeEpoch v9;
  CMTimeEpoch v10;
  float readStart;
  AVAssetReader *v12;
  CMTimeRange *v13;
  float readLength;
  void *v15;
  AVAssetReaderOutput *v16;
  AVAssetReaderOutput *trackOutput;
  void *v18;
  __int128 v20;
  __int128 v21;
  CMTimeRange v22;
  CMTimeRange v23;
  CMTime duration;
  CMTimeRange time1;
  CMTime time2;
  id v27;

  if (!self->assetReader)
  {
    asset = self->asset;
    v27 = 0;
    objc_msgSend(MEMORY[0x1E0C8AFD0], "assetReaderWithAsset:error:", asset, &v27);
    v5 = (AVAssetReader *)objc_claimAutoreleasedReturnValue();
    v6 = v27;
    v7 = v27;
    assetReader = self->assetReader;
    self->assetReader = v5;

    if (!self->assetReader)
    {
      objc_storeStrong((id *)&self->lastError, v6);
      NSLog(CFSTR("***Error creating AssetReader\n"));
      v2 = -1;
LABEL_27:

      return v2;
    }
    *(_OWORD *)&time1.start.value = *(_OWORD *)&self->readStartT.value;
    time1.start.epoch = self->readStartT.epoch;
    v21 = *MEMORY[0x1E0CA2E68];
    *(_OWORD *)&time2.value = *MEMORY[0x1E0CA2E68];
    v9 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    time2.epoch = v9;
    if (CMTimeCompare(&time1.start, &time2)
      && (*(_OWORD *)&time1.start.value = *(_OWORD *)&self->readLengthT.value,
          time1.start.epoch = self->readLengthT.epoch,
          v20 = *MEMORY[0x1E0CA2E30],
          *(_OWORD *)&time2.value = *MEMORY[0x1E0CA2E30],
          v10 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16),
          time2.epoch = v10,
          CMTimeCompare(&time1.start, &time2)))
    {
      readStart = self->readStart;
      if (readStart == 0.0 && self->readLength == 0.0)
      {
LABEL_18:
        sub_1D4C877D4(-[VideoReader pixelFormatOptions](self, "pixelFormatOptions"), 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", self->videoTrack, v15);
        v16 = (AVAssetReaderOutput *)objc_claimAutoreleasedReturnValue();
        trackOutput = self->trackOutput;
        self->trackOutput = v16;

        if ((-[VideoReader pixelFormatOptions](self, "pixelFormatOptions") & 0x400) != 0)
          -[AVAssetReaderOutput setAlwaysCopiesSampleData:](self->trackOutput, "setAlwaysCopiesSampleData:", 0);
        if (-[AVAssetReader canAddOutput:](self->assetReader, "canAddOutput:", self->trackOutput))
        {
          -[AVAssetReader addOutput:](self->assetReader, "addOutput:", self->trackOutput);
          if (-[AVAssetReader startReading](self->assetReader, "startReading"))
          {
            v2 = 0;
LABEL_26:

            goto LABEL_27;
          }
          NSLog(CFSTR("***startReading failed\n"));
          -[AVAssetReader error](self->assetReader, "error");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("AssetReader error: %@"), v18);

        }
        else
        {
          NSLog(CFSTR("***Can't add AVAssetReaderTrackOutput\n"));
        }
        v2 = -1;
        goto LABEL_26;
      }
      memset(&time1, 0, sizeof(time1));
      if (readStart == 0.0)
      {
        *(_OWORD *)&time1.start.value = v21;
        time1.start.epoch = v9;
      }
      else
      {
        CMTimeMakeWithSeconds(&time1.start, readStart, self->timeScale);
      }
      readLength = self->readLength;
      if (readLength == 0.0)
      {
        *(_OWORD *)&time1.duration.value = v20;
        time1.duration.epoch = v10;
      }
      else
      {
        CMTimeMakeWithSeconds(&time2, readLength, self->timeScale);
        time1.duration = time2;
      }
      v22 = time1;
      v12 = self->assetReader;
      v13 = &v22;
    }
    else
    {
      memset(&time1, 0, sizeof(time1));
      time2 = (CMTime)self->readStartT;
      duration = (CMTime)self->readLengthT;
      CMTimeRangeMake(&time1, &time2, &duration);
      v23 = time1;
      v12 = self->assetReader;
      v13 = &v23;
    }
    -[AVAssetReader setTimeRange:](v12, "setTimeRange:", v13);
    goto LABEL_18;
  }
  return 0;
}

- (int)getFrame:(CGImage *)a3
{
  NSError *lastError;
  int v7;
  opaqueCMSampleBuffer *v8;
  opaqueCMSampleBuffer *v9;
  CMItemCount NumSamples;
  __CVBuffer *ImageBuffer;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  size_t v16;
  size_t v17;
  size_t BytesPerRow;
  uint64_t PixelFormatType;
  double v20;
  double v21;
  double v22;
  double v23;
  uint32_t v24;
  NSError *v25;
  NSError *v26;
  AVAssetReader *assetReader;
  AVAssetReaderOutput *trackOutput;
  void *BaseAddress;
  CGColorSpace *DeviceRGB;
  CGContext *v31;
  CGContext *v32;
  CGImage *Image;
  CGImage *v34;
  CGImage *v35;
  CMTime v36;
  CGRect CleanRect;
  CGRect v38;

  if (-[VideoReader buildAssetReader](self, "buildAssetReader"))
    return 2;
  lastError = self->lastError;
  self->lastError = 0;

  v7 = 1000;
  while (1)
  {
    v8 = -[AVAssetReaderOutput copyNextSampleBuffer](self->trackOutput, "copyNextSampleBuffer");
    if (!v8)
      break;
    v9 = v8;
    NumSamples = CMSampleBufferGetNumSamples(v8);
    if (NumSamples)
    {
      if (NumSamples != 1)
      {
        NSLog(CFSTR("***getFrame: numSamples = %ld\n"), NumSamples);
        CFRelease(v9);
        return 2;
      }
      ImageBuffer = CMSampleBufferGetImageBuffer(v9);
      CleanRect = CVImageBufferGetCleanRect(ImageBuffer);
      if (ImageBuffer)
      {
        x = CleanRect.origin.x;
        y = CleanRect.origin.y;
        width = CleanRect.size.width;
        height = CleanRect.size.height;
        v16 = CVPixelBufferGetWidth(ImageBuffer);
        v17 = CVPixelBufferGetHeight(ImageBuffer);
        BytesPerRow = CVPixelBufferGetBytesPerRow(ImageBuffer);
        PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
        switch((_DWORD)PixelFormatType)
        {
          case 0x42475241:
            v24 = 8198;
            goto LABEL_21;
          case 0x20:
            v24 = 16386;
            goto LABEL_21;
          case 0x18:
            v24 = 16389;
LABEL_21:
            CVPixelBufferLockBaseAddress(ImageBuffer, 0);
            BaseAddress = CVPixelBufferGetBaseAddress(ImageBuffer);
            if (BaseAddress || (BaseAddress = CVPixelBufferGetBaseAddressOfPlane(ImageBuffer, 0)) != 0)
            {
              DeviceRGB = CGColorSpaceCreateDeviceRGB();
              v31 = CGBitmapContextCreate(BaseAddress, v16, v17, 8uLL, BytesPerRow, DeviceRGB, v24);
              v32 = v31;
              if (v31)
              {
                CGContextSetInterpolationQuality(v31, kCGInterpolationNone);
                CGContextSetShouldAntialias(v32, 0);
                Image = CGBitmapContextCreateImage(v32);
                if (Image)
                {
                  v34 = Image;
                  v38.origin.x = x;
                  v38.origin.y = y;
                  v38.size.width = width;
                  v38.size.height = height;
                  v35 = CGImageCreateWithImageInRect(Image, v38);
                  CGImageRelease(v34);
LABEL_31:
                  CVPixelBufferUnlockBaseAddress(ImageBuffer, 0);
                  CGColorSpaceRelease(DeviceRGB);
                  if (v32)
                    CFRelease(v32);
LABEL_33:
                  *a3 = v35;
                  CMSampleBufferGetPresentationTimeStamp(&v36, v9);
                  self->lastPresentationTime = ($95D729B680665BEAEFA1D6FCA8238556)v36;
                  CFRelease(v9);
                  return 2 * (*a3 == 0);
                }
                NSLog(CFSTR("***VideoReader: Error on CGBitmapContextCreateImage\n"));
              }
              else
              {
                NSLog(CFSTR("***VideoReader: Error on CGBitmapContextCreate\n"));
              }
              v35 = 0;
              goto LABEL_31;
            }
            CVPixelBufferUnlockBaseAddress(ImageBuffer, 0);
            puts("***VideoReader: NULL base address");
            break;
          default:
            NSLog(CFSTR("VideoReader: unknown pixel format (0x%x)\n"), v20, v21, v22, v23, PixelFormatType);
            break;
        }
      }
      else
      {
        NSLog(CFSTR("***VideoReader: no CVImageBufferRef available\n"), CleanRect.origin.x, CleanRect.origin.y, CleanRect.size.width, CleanRect.size.height);
      }
      v35 = 0;
      goto LABEL_33;
    }
    CFRelease(v9);
    if (!--v7)
    {
      NSLog(CFSTR("***getFrame: numSamples == 0\n"));
      return 2;
    }
  }
  if (-[AVAssetReader status](self->assetReader, "status") == AVAssetReaderStatusFailed)
  {
    NSLog(CFSTR("***getFrame: AVAssetReaderStatusFailed\n"));
    -[AVAssetReader error](self->assetReader, "error");
    v25 = (NSError *)objc_claimAutoreleasedReturnValue();
    v26 = self->lastError;
    self->lastError = v25;

    return 2;
  }
  -[AVAssetReader cancelReading](self->assetReader, "cancelReading");
  assetReader = self->assetReader;
  self->assetReader = 0;

  trackOutput = self->trackOutput;
  self->trackOutput = 0;

  return 1;
}

- (opaqueCMSampleBuffer)nextSampleBuf
{
  void *v3;
  int v4;
  void *v5;
  opaqueCMSampleBuffer *v7;
  void *v8;

  if (!self->_readAheadEnable)
    return -[AVAssetReaderOutput copyNextSampleBuffer](self->trackOutput, "copyNextSampleBuffer");
  -[VideoReader readaheadLock](self, "readaheadLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = -[VideoReader readaheadState](self, "readaheadState");
  if (v4)
  {
    while (v4 == 1)
    {
      -[VideoReader readaheadLock](self, "readaheadLock");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "wait");

      v4 = -[VideoReader readaheadState](self, "readaheadState");
    }
  }
  else
  {
    -[VideoReader setReadaheadBuf:](self, "setReadaheadBuf:", -[AVAssetReaderOutput copyNextSampleBuffer](self->trackOutput, "copyNextSampleBuffer"));
  }
  v7 = -[VideoReader readaheadBuf](self, "readaheadBuf");
  -[VideoReader setReadaheadBuf:](self, "setReadaheadBuf:", 0);
  if (v7)
    -[VideoReader fireReadahead](self, "fireReadahead");
  else
    -[VideoReader setReadaheadState:](self, "setReadaheadState:", 3);
  -[VideoReader readaheadLock](self, "readaheadLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

  return v7;
}

- (void)fireReadahead
{
  qos_class_t v3;
  NSObject *v4;
  _QWORD block[5];

  -[VideoReader setReadaheadState:](self, "setReadaheadState:", 1);
  v3 = qos_class_self();
  dispatch_get_global_queue(v3, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D4C87EA8;
  block[3] = &unk_1E9864340;
  block[4] = self;
  dispatch_async(v4, block);

}

- (int)getFrameAsSampleBuf:(opaqueCMSampleBuffer *)a3
{
  int result;
  NSError *lastError;
  int v7;
  opaqueCMSampleBuffer *v8;
  opaqueCMSampleBuffer *v9;
  CMItemCount NumSamples;
  AVAssetReaderStatus v11;
  AVAssetReader *assetReader;
  NSError *v13;
  NSError *v14;
  AVAssetReader *v15;
  AVAssetReaderOutput *trackOutput;
  CMTime v17;

  if (-[VideoReader buildAssetReader](self, "buildAssetReader"))
    return 2;
  lastError = self->lastError;
  self->lastError = 0;

  v7 = 1000;
  while (1)
  {
    v8 = -[VideoReader nextSampleBuf](self, "nextSampleBuf");
    if (!v8)
      break;
    v9 = v8;
    NumSamples = CMSampleBufferGetNumSamples(v8);
    if (NumSamples)
    {
      if (NumSamples == 1)
      {
        *a3 = v9;
        CMSampleBufferGetPresentationTimeStamp(&v17, v9);
        result = 0;
        self->lastPresentationTime = ($95D729B680665BEAEFA1D6FCA8238556)v17;
        return result;
      }
      NSLog(CFSTR("***getFrameAsSampleBuf: numSamples = %ld\n"), NumSamples);
      CFRelease(v9);
      return 2;
    }
    CFRelease(v9);
    if (!--v7)
    {
      NSLog(CFSTR("***getFrameAsSampleBuf: numSamples == 0\n"));
      return 2;
    }
  }
  v11 = -[AVAssetReader status](self->assetReader, "status");
  assetReader = self->assetReader;
  if (v11 == AVAssetReaderStatusFailed)
  {
    -[AVAssetReader error](assetReader, "error");
    v13 = (NSError *)objc_claimAutoreleasedReturnValue();
    v14 = self->lastError;
    self->lastError = v13;

    NSLog(CFSTR("***getFrameAsSampleBuf: AVAssetReaderStatusFailed; %@\n"), self->lastError);
    return 2;
  }
  -[AVAssetReader cancelReading](assetReader, "cancelReading");
  v15 = self->assetReader;
  self->assetReader = 0;

  trackOutput = self->trackOutput;
  self->trackOutput = 0;

  return 1;
}

- (int)getFrameAtTime:(id *)a3 exactTime:(BOOL)a4 frame:(opaqueCMSampleBuffer *)a5
{
  _BOOL4 v6;
  int32_t v9;
  int32_t v10;
  opaqueCMSampleBuffer *v11;
  int result;
  int32_t v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;
  CFTypeRef cf;
  CMTime time2;
  CMTime time1;

  v6 = a4;
  if (-[VideoReader lastFrame](self, "lastFrame"))
  {
    CMSampleBufferGetPresentationTimeStamp(&time1, -[VideoReader lastFrame](self, "lastFrame"));
    time2 = (CMTime)*a3;
    v9 = CMTimeCompare(&time1, &time2);
    if ((v9 & 0x80000000) == 0)
    {
      v10 = v9;
      v11 = -[VideoReader lastFrame](self, "lastFrame");
      if (v10 && v6)
      {
        if (v11)
        {
          CFRelease(-[VideoReader lastFrame](self, "lastFrame"));
          -[VideoReader setLastFrame:](self, "setLastFrame:", 0);
        }
        return 2;
      }
      *a5 = v11;
      goto LABEL_19;
    }
    if (-[VideoReader lastFrame](self, "lastFrame"))
    {
      CFRelease(-[VideoReader lastFrame](self, "lastFrame"));
      -[VideoReader setLastFrame:](self, "setLastFrame:", 0);
    }
  }
  cf = 0;
  result = -[VideoReader getFrameAsSampleBuf:](self, "getFrameAsSampleBuf:", &cf);
  if (result)
    return result;
  while (1)
  {
    time2 = (CMTime)self->lastPresentationTime;
    v14 = *a3;
    v13 = CMTimeCompare(&time2, (CMTime *)&v14);
    if ((v13 & 0x80000000) == 0)
      break;
    CFRelease(cf);
    cf = 0;
    result = -[VideoReader getFrameAsSampleBuf:](self, "getFrameAsSampleBuf:", &cf);
    if (result)
      return result;
  }
  if (v13 && v6)
  {
    CFRelease(cf);
    return 2;
  }
  *a5 = (opaqueCMSampleBuffer *)cf;
  -[VideoReader setLastFrame:](self, "setLastFrame:");
LABEL_19:
  CFRetain(-[VideoReader lastFrame](self, "lastFrame"));
  return 0;
}

- (void)setReadAheadEnable:(BOOL)a3
{
  id v4;

  self->_readAheadEnable = a3;
  if (a3)
  {
    -[VideoReader setReadaheadState:](self, "setReadaheadState:", 0);
    v4 = objc_alloc_init(MEMORY[0x1E0CB3530]);
    -[VideoReader setReadaheadLock:](self, "setReadaheadLock:", v4);

  }
}

- (BOOL)readAheadEnable
{
  return self->_readAheadEnable;
}

- (int)reset
{
  AVAssetReader *assetReader;
  AVAssetReaderOutput *trackOutput;

  assetReader = self->assetReader;
  if (assetReader)
  {
    self->assetReader = 0;

  }
  trackOutput = self->trackOutput;
  self->trackOutput = 0;

  return 0;
}

- (int)skipFrames:(unsigned int)a3
{
  unsigned int v3;
  int result;
  CFTypeRef cf;

  if (!a3)
    return 0;
  v3 = a3;
  while (1)
  {
    cf = 0;
    result = -[VideoReader getFrameAsSampleBuf:](self, "getFrameAsSampleBuf:", &cf);
    if (result)
      break;
    CFRelease(cf);
    if (!--v3)
      return 0;
  }
  return result;
}

- (float)trackStart
{
  return self->trackStart;
}

- (float)trackLength
{
  return self->trackLength;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trackStartT
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->trackStartT, 24, 1, 0);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trackLengthT
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->trackLengthT, 24, 1, 0);
  return result;
}

- (float)readLength
{
  return self->readLength;
}

- (void)setReadLength:(float)a3
{
  self->readLength = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)readStartT
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->readStartT, 24, 1, 0);
  return result;
}

- (void)setReadStartT:(id *)a3
{
  objc_copyStruct(&self->readStartT, a3, 24, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)readLengthT
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->readLengthT, 24, 1, 0);
  return result;
}

- (void)setReadLengthT:(id *)a3
{
  objc_copyStruct(&self->readLengthT, a3, 24, 1, 0);
}

- (int)timeScale
{
  return self->timeScale;
}

- (float)fps
{
  return self->fps;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minFrameDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->minFrameDuration, 24, 1, 0);
  return result;
}

- (unsigned)imageWidth
{
  return self->imageWidth;
}

- (unsigned)imageHeight
{
  return self->imageHeight;
}

- (NSError)lastError
{
  return (NSError *)objc_getProperty(self, a2, 56, 1);
}

- (CGAffineTransform)preferredTransform
{
  CGAffineTransform *result;

  objc_copyStruct(retstr, &self->preferredTransform, 48, 1, 0);
  return result;
}

- (NSArray)formatDescriptions
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)fullRangeVideo
{
  return self->fullRangeVideo;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastPresentationTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->lastPresentationTime, 24, 1, 0);
  return result;
}

- (AVAsset)asset
{
  return (AVAsset *)objc_getProperty(self, a2, 72, 1);
}

- (AVAssetTrack)videoTrack
{
  return (AVAssetTrack *)objc_getProperty(self, a2, 80, 1);
}

- (AVAssetReader)assetReader
{
  return (AVAssetReader *)objc_getProperty(self, a2, 88, 1);
}

- (AVAssetReaderOutput)trackOutput
{
  return (AVAssetReaderOutput *)objc_getProperty(self, a2, 96, 1);
}

- (unsigned)pixelFormatOptions
{
  return self->_pixelFormatOptions;
}

- (void)setPixelFormatOptions:(unsigned int)a3
{
  self->_pixelFormatOptions = a3;
}

- (opaqueCMSampleBuffer)readaheadBuf
{
  return self->_readaheadBuf;
}

- (void)setReadaheadBuf:(opaqueCMSampleBuffer *)a3
{
  self->_readaheadBuf = a3;
}

- (int)readaheadState
{
  return self->_readaheadState;
}

- (void)setReadaheadState:(int)a3
{
  self->_readaheadState = a3;
}

- (NSCondition)readaheadLock
{
  return (NSCondition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setReadaheadLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (opaqueCMSampleBuffer)lastFrame
{
  return self->_lastFrame;
}

- (void)setLastFrame:(opaqueCMSampleBuffer *)a3
{
  self->_lastFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readaheadLock, 0);
  objc_storeStrong((id *)&self->trackOutput, 0);
  objc_storeStrong((id *)&self->assetReader, 0);
  objc_storeStrong((id *)&self->videoTrack, 0);
  objc_storeStrong((id *)&self->asset, 0);
  objc_storeStrong((id *)&self->formatDescriptions, 0);
  objc_storeStrong((id *)&self->lastError, 0);
}

@end
