@implementation VCVideoRule

- (float)fRate
{
  return self->_frameRate;
}

- (int)iWidth
{
  return self->_width;
}

- (int)iHeight
{
  return self->_height;
}

- (VCVideoRule)initWithFrameWidth:(int)a3 frameHeight:(int)a4 frameRate:(float)a5 payload:(int)a6 priority:(float)a7
{
  VCVideoRule *result;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)VCVideoRule;
  result = -[VCVideoRule init](&v13, sel_init);
  if (result)
  {
    result->_width = a3;
    result->_height = a4;
    result->_frameRate = a5;
    result->_priority = a7;
    result->_payload = a6;
  }
  return result;
}

- (VCVideoRule)initWithFrameWidth:(int)a3 frameHeight:(int)a4 frameRate:(float)a5
{
  return -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:priority:](self, "initWithFrameWidth:frameHeight:frameRate:payload:priority:", *(_QWORD *)&a3, *(_QWORD *)&a4, 123);
}

- (VCVideoRule)initWithFrameWidth:(int)a3 frameHeight:(int)a4 frameRate:(float)a5 payload:(int)a6
{
  return -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:priority:](self, "initWithFrameWidth:frameHeight:frameRate:payload:priority:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a6);
}

- (int64_t)compare:(id)a3
{
  int v5;
  int v6;
  int v8;
  int v9;
  float frameRate;
  float v11;
  float v12;
  float v13;

  v5 = self->_height * self->_width;
  v6 = objc_msgSend(a3, "iWidth");
  if (v5 > (int)(objc_msgSend(a3, "iHeight") * v6))
    return 1;
  v8 = self->_height * self->_width;
  v9 = objc_msgSend(a3, "iWidth");
  if (v8 != objc_msgSend(a3, "iHeight") * v9)
    return -1;
  frameRate = self->_frameRate;
  objc_msgSend(a3, "fRate");
  if (frameRate > v11)
    return 1;
  v12 = self->_frameRate;
  objc_msgSend(a3, "fRate");
  if (v12 == v13)
    return 0;
  else
    return -1;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  int payload;
  int width;
  int height;
  float frameRate;
  float v10;
  float priority;
  float v12;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    payload = self->_payload;
    if (payload == objc_msgSend(a3, "iPayload")
      && (width = self->_width, width == objc_msgSend(a3, "iWidth"))
      && (height = self->_height, height == objc_msgSend(a3, "iHeight"))
      && (frameRate = self->_frameRate, objc_msgSend(a3, "fRate"), frameRate == v10))
    {
      priority = self->_priority;
      objc_msgSend(a3, "fPref");
      LOBYTE(v5) = priority == v12;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (int64_t)compareByPref:(id)a3
{
  float priority;
  float v6;
  float v8;
  float v9;

  priority = self->_priority;
  objc_msgSend(a3, "fPref");
  if (priority > v6)
    return 1;
  v8 = self->_priority;
  objc_msgSend(a3, "fPref");
  if (v8 == v9)
    return 0;
  else
    return -1;
}

- (NSString)description
{
  void *v3;
  double frameRate;
  uint64_t width;
  uint64_t height;
  float v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  frameRate = self->_frameRate;
  width = self->_width;
  height = self->_height;
  -[VCVideoRule fPref](self, "fPref");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("Video rule width %d height %d frame rate %.1f pref %.2f payload: %d"), width, height, *(_QWORD *)&frameRate, v7, self->_payload);
}

- (void)setToVideoRule:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a3, "iWidth");
  v6 = objc_msgSend(a3, "iHeight");
  objc_msgSend(a3, "fRate");
  -[VCVideoRule setFrameWidth:frameHeight:frameRate:](self, "setFrameWidth:frameHeight:frameRate:", v5, v6);

}

- (void)setFrameWidth:(int)a3 frameHeight:(int)a4 frameRate:(float)a5
{
  self->_width = a3;
  self->_height = a4;
  self->_frameRate = a5;
}

- (BOOL)isVideoFullHD
{
  return self->_width * self->_height > 2073599;
}

- (float)fPref
{
  return self->_priority;
}

- (void)setFPref:(float)a3
{
  self->_priority = a3;
}

- (int)iPayload
{
  return self->_payload;
}

@end
