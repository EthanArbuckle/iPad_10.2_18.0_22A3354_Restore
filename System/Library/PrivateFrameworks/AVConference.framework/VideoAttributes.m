@implementation VideoAttributes

- (void)decodeFromNSDictionary:(id)a3
{
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  CMTime v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = (NSString *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ratio"));
    v6 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("orientation"));
    v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("camera"));
    v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("cameraSwitching"));
    v9 = (NSString *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("contentsRect"));
    v10 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isVideoSourceScreen"));
    v11 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("videoMirrored"));
    v14 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("framePresentationTimeValue"));
    v12 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("framePresentationTimeTimeScale"));
    v15 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("scaleFactor"));
    self->ratio = NSSizeFromString(v5);
    self->orientation = objc_msgSend(v6, "intValue");
    self->camera = objc_msgSend(v7, "intValue");
    self->cameraSwitching = objc_msgSend(v8, "intValue") != 0;
    self->contentsRect = NSRectFromString(v9);
    self->videoSourceScreen = objc_msgSend(v10, "intValue") != 0;
    self->videoMirrored = objc_msgSend(v11, "intValue") != 0;
    CMTimeMake(&v16, objc_msgSend(v14, "longLongValue"), objc_msgSend(v12, "intValue"));
    *(CMTime *)(&self->videoMirrored + 3) = v16;
    objc_msgSend(v15, "floatValue");
    HIDWORD(self->framePresentationTime.epoch) = v13;

  }
}

- (VideoAttributes)initWithEncodedDictionary:(id)a3
{
  VideoAttributes *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)VideoAttributes;
  v4 = -[VideoAttributes init](&v6, sel_init);
  -[VideoAttributes decodeFromNSDictionary:](v4, "decodeFromNSDictionary:", a3);
  return v4;
}

- (id)copyEncodedDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  NSString *v15;
  void *v16;

  v16 = (void *)MEMORY[0x1DF088A10](self, a2);
  v15 = NSStringFromSize(self->ratio);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->orientation);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->camera);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->cameraSwitching);
  v6 = NSStringFromRect(self->contentsRect);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->videoSourceScreen);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->videoMirrored);
  v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(&self->videoMirrored + 3));
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(self->framePresentationTime.value));
  LODWORD(v11) = HIDWORD(self->framePresentationTime.epoch);
  v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v15, CFSTR("ratio"), v3, CFSTR("orientation"), v4, CFSTR("camera"), v5, CFSTR("cameraSwitching"), v6, CFSTR("contentsRect"), v7, CFSTR("isVideoSourceScreen"), v8, CFSTR("videoMirrored"), v9, CFSTR("framePresentationTimeValue"), v10,
                  CFSTR("framePresentationTimeTimeScale"),
                  v12,
                  CFSTR("scaleFactor"),
                  0);
  objc_autoreleasePoolPop(v16);
  return v13;
}

- (id)description
{
  CGFloat width;
  CGFloat height;
  uint64_t orientation;
  const char *v5;
  const char *v6;
  int camera;
  const char *v8;
  const char *v9;
  CGFloat x;
  CGFloat y;
  const char *v12;
  const char *v13;
  CGSize size;
  CMTime time;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  width = self->ratio.width;
  height = self->ratio.height;
  orientation = self->orientation;
  v5 = "Invalid";
  if (orientation >= 3)
  {
    if ((_DWORD)orientation == 3)
      v6 = "LandscapeRight";
    else
      v6 = "Invalid";
  }
  else
  {
    v6 = off_1E9E56418[orientation];
  }
  camera = self->camera;
  if (camera == 1)
    v5 = "Back";
  if (camera)
    v8 = v5;
  else
    v8 = "Front";
  if (self->cameraSwitching)
    v9 = "YES";
  else
    v9 = "NO";
  x = self->contentsRect.origin.x;
  y = self->contentsRect.origin.y;
  if (self->videoSourceScreen)
    v12 = "YES";
  else
    v12 = "NO";
  if (self->videoMirrored)
    v13 = "YES";
  else
    v13 = "NO";
  size = self->contentsRect.size;
  *(_OWORD *)&time.value = *(_OWORD *)(&self->videoMirrored + 3);
  time.epoch = *(_QWORD *)&self->framePresentationTime.flags;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ratio:%.2fx%.2f orientation:%s camera:%s switching:%s contentsRect:%.3fx%.3f@(%.3f,%.3f) videoSourceScreen:%s videoMirrored:%s framePresentationTime:%f scaleFactor:%f]"), *(_QWORD *)&width, *(_QWORD *)&height, v6, v8, v9, size, *(_QWORD *)&x, *(_QWORD *)&y, v12, v13, CMTimeGetSeconds(&time), *((float *)&self->framePresentationTime.epoch + 1));
}

+ (VideoAttributes)videoAttributesWithVideoAttributes:(id)a3
{
  VideoAttributes *v4;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = objc_alloc_init(VideoAttributes);
  objc_msgSend(a3, "ratio");
  -[VideoAttributes setRatio:](v4, "setRatio:");
  -[VideoAttributes setOrientation:](v4, "setOrientation:", objc_msgSend(a3, "orientation"));
  -[VideoAttributes setCamera:](v4, "setCamera:", objc_msgSend(a3, "camera"));
  -[VideoAttributes setCameraSwitching:](v4, "setCameraSwitching:", objc_msgSend(a3, "cameraSwitching"));
  objc_msgSend(a3, "contentsRect");
  -[VideoAttributes setContentsRect:](v4, "setContentsRect:");
  -[VideoAttributes setVideoSourceScreen:](v4, "setVideoSourceScreen:", objc_msgSend(a3, "videoSourceScreen"));
  -[VideoAttributes setVideoMirrored:](v4, "setVideoMirrored:", objc_msgSend(a3, "videoMirrored"));
  objc_msgSend(a3, "framePresentationTime");
  v6 = v8;
  v7 = v9;
  -[VideoAttributes setFramePresentationTime:](v4, "setFramePresentationTime:", &v6);
  objc_msgSend(a3, "scaleFactor");
  -[VideoAttributes setScaleFactor:](v4, "setScaleFactor:");
  return v4;
}

- (void)setCameraSwitching:(BOOL)a3
{
  self->cameraSwitching = a3;
}

- (void)setOrientation:(int)a3
{
  self->orientation = a3;
}

- (void)setCamera:(int)a3
{
  self->camera = a3;
}

- (int)camera
{
  return self->camera;
}

- (int)orientation
{
  return self->orientation;
}

- (BOOL)videoSourceScreen
{
  return self->videoSourceScreen;
}

- (BOOL)videoMirrored
{
  return self->videoMirrored;
}

- (BOOL)cameraSwitching
{
  return self->cameraSwitching;
}

- (void)setScaleFactor:(float)a3
{
  *((float *)&self->framePresentationTime.epoch + 1) = a3;
}

- (void)setRatio:(CGSize)a3
{
  self->ratio = a3;
}

- (VideoAttributes)init
{
  char *v2;
  char *v3;
  CMTime v10;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VideoAttributes;
  v2 = -[VideoAttributes init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = *MEMORY[0x1E0C9D820];
    *((_QWORD *)v2 + 3) = 0;
    *((_QWORD *)v2 + 5) = 0;
    *((_QWORD *)v2 + 6) = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v2 + 56) = _Q0;
    CMTimeMake(&v10, 0, 1);
    *(CMTime *)(v3 + 76) = v10;
    *((_DWORD *)v3 + 25) = 1065353216;
  }
  return (VideoAttributes *)v3;
}

- (CGRect)contentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->contentsRect.origin.x;
  y = self->contentsRect.origin.y;
  width = self->contentsRect.size.width;
  height = self->contentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVideoSourceScreen:(BOOL)a3
{
  self->videoSourceScreen = a3;
}

- (void)setVideoMirrored:(BOOL)a3
{
  self->videoMirrored = a3;
}

- (void)setFramePresentationTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->framePresentationTime.flags = a3->var3;
  *(_OWORD *)(&self->videoMirrored + 3) = v3;
}

- (void)setContentsRect:(CGRect)a3
{
  self->contentsRect = a3;
}

- (float)scaleFactor
{
  return *((float *)&self->framePresentationTime.epoch + 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)framePresentationTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[3].var0 + 4);
  retstr->var3 = *(int64_t *)((char *)&self[3].var3 + 4);
  return self;
}

- (CGSize)ratio
{
  double width;
  double height;
  CGSize result;

  width = self->ratio.width;
  height = self->ratio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (VideoAttributes)initWithCameraStatusBits:(unsigned __int8)a3 aspectRatio:(CGSize)a4 contentsRect:(CGRect)a5 scaleFactor:(float)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v11;
  CGFloat v12;
  unsigned int v13;
  VideoAttributes *v14;
  double v15;
  VideoAttributes *v16;
  CMTime v18;
  objc_super v19;
  uint64_t v20;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4.height;
  v12 = a4.width;
  v13 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)VideoAttributes;
  v14 = -[VideoAttributes init](&v19, sel_init);
  v16 = v14;
  if (v14)
  {
    v14->ratio.width = v12;
    v14->ratio.height = v11;
    v14->orientation = v13 & 3;
    v14->camera = (v13 >> 3) & 1;
    v14->cameraSwitching = (v13 & 0x40) != 0;
    v14->videoMirrored = (v13 & 4) != 0;
    v14->contentsRect.origin.x = x;
    v14->contentsRect.origin.y = y;
    v14->contentsRect.size.width = width;
    v14->contentsRect.size.height = height;
    *(float *)&v15 = a6;
    -[VideoAttributes setScaleFactor:](v14, "setScaleFactor:", v15);
    CMTimeMake(&v18, 0, 1);
    *(CMTime *)(&v16->videoMirrored + 3) = v18;
    v16->videoSourceScreen = (v13 & 0x30) == 16;
  }
  return v16;
}

+ (int)videoAttributeCameraForCameraUID:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.avfoundation.avcapturedevice.built-in_video:0")) & 1) != 0)
    return 1;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.avfoundation.avcapturedevice.built-in_video:2")))return 2;
  return 0;
}

+ (id)cameraUIDForVideoAttributeCamera:(int)a3
{
  if (a3 > 2)
    return 0;
  else
    return (id)*((_QWORD *)&off_1E9E56400 + a3);
}

- (void)encodeWithCoder:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  double v9;

  x = self->contentsRect.origin.x;
  y = self->contentsRect.origin.y;
  width = self->contentsRect.size.width;
  height = self->contentsRect.size.height;
  objc_msgSend(a3, "encodeSize:forKey:", CFSTR("ratio"), self->ratio.width, self->ratio.height);
  objc_msgSend(a3, "encodeInt:forKey:", self->orientation, CFSTR("orientation"));
  objc_msgSend(a3, "encodeInt:forKey:", self->camera, CFSTR("camera"));
  objc_msgSend(a3, "encodeBool:forKey:", self->cameraSwitching, CFSTR("cameraSwitching"));
  objc_msgSend(a3, "encodeRect:forKey:", CFSTR("contentsRect"), x, y, width, height);
  objc_msgSend(a3, "encodeBool:forKey:", self->videoSourceScreen, CFSTR("isVideoSourceScreen"));
  objc_msgSend(a3, "encodeBool:forKey:", self->videoMirrored, CFSTR("videoMirrored"));
  objc_msgSend(a3, "encodeInt64:forKey:", *(_QWORD *)(&self->videoMirrored + 3), CFSTR("framePresentationTimeValue"));
  objc_msgSend(a3, "encodeInt32:forKey:", HIDWORD(self->framePresentationTime.value), CFSTR("framePresentationTimeTimeScale"));
  LODWORD(v9) = HIDWORD(self->framePresentationTime.epoch);
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("scaleFactor"), v9);
}

- (VideoAttributes)initWithCoder:(id)a3
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  int v11;
  CMTime v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "decodeSizeForKey:", CFSTR("ratio"));
  self->ratio.width = v5;
  self->ratio.height = v6;
  self->orientation = objc_msgSend(a3, "decodeIntForKey:", CFSTR("orientation"));
  self->camera = objc_msgSend(a3, "decodeIntForKey:", CFSTR("camera"));
  self->cameraSwitching = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("cameraSwitching"));
  objc_msgSend(a3, "decodeRectForKey:", CFSTR("contentsRect"));
  self->contentsRect.origin.x = v7;
  self->contentsRect.origin.y = v8;
  self->contentsRect.size.width = v9;
  self->contentsRect.size.height = v10;
  self->videoSourceScreen = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isVideoSourceScreen"));
  self->videoMirrored = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("videoMirrored"));
  CMTimeMake(&v13, objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("framePresentationTimeValue")), objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("framePresentationTimeTimeScale")));
  *(_OWORD *)(&self->videoMirrored + 3) = *(_OWORD *)&v13.value;
  *(_QWORD *)&self->framePresentationTime.flags = v13.epoch;
  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("scaleFactor"));
  HIDWORD(self->framePresentationTime.epoch) = v11;
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  CGPoint origin;
  __int128 v6;

  result = -[VideoAttributes init](+[VideoAttributes allocWithZone:](VideoAttributes, "allocWithZone:", a3), "init");
  if (result)
  {
    *(CGSize *)((char *)result + 8) = self->ratio;
    *((_DWORD *)result + 6) = self->orientation;
    *((_DWORD *)result + 7) = self->camera;
    *((_BYTE *)result + 32) = self->cameraSwitching;
    origin = self->contentsRect.origin;
    *(CGSize *)((char *)result + 56) = self->contentsRect.size;
    *(CGPoint *)((char *)result + 40) = origin;
    *((_BYTE *)result + 72) = self->videoSourceScreen;
    *((_BYTE *)result + 73) = self->videoMirrored;
    v6 = *(_OWORD *)(&self->videoMirrored + 3);
    *(_QWORD *)((char *)result + 92) = *(_QWORD *)&self->framePresentationTime.flags;
    *(_OWORD *)((char *)result + 76) = v6;
    *((_DWORD *)result + 25) = HIDWORD(self->framePresentationTime.epoch);
  }
  return result;
}

- (void)updateCameraStatusBits:(unsigned __int8)a3
{
  self->orientation = a3 & 3;
  self->camera = (a3 >> 3) & 1;
  self->cameraSwitching = (a3 & 0x40) != 0;
  self->videoMirrored = (a3 & 4) != 0;
  self->videoSourceScreen = (a3 & 0x30) == 16;
}

@end
