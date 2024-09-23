@implementation VCMediaNegotiatorMultiwayVideoStream

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("frameRate: %u, _keyFrameInterval: %u, payload: %d\n"), -[VCMediaNegotiatorMultiwayVideoStream frameRate](self, "frameRate"), -[VCMediaNegotiatorMultiwayVideoStream keyFrameInterval](self, "keyFrameInterval"), -[VCMediaNegotiatorMultiwayVideoStream payload](self, "payload"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaNegotiatorMultiwayVideoStream;
  v4 = -[VCMediaNegotiatorMultiwayMediaStream copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setSize:", self->_size.width, self->_size.height);
    objc_msgSend(v5, "setFrameRate:", self->_frameRate);
    objc_msgSend(v5, "setKeyFrameInterval:", self->_keyFrameInterval);
    objc_msgSend(v5, "setPayload:", self->_payload);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  double v6;
  double v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  v9.receiver = self;
  v9.super_class = (Class)VCMediaNegotiatorMultiwayVideoStream;
  v5 = -[VCMediaNegotiatorMultiwayMediaStream isEqual:](&v9, sel_isEqual_, a3);
  if (v5)
  {
    objc_msgSend(a3, "size");
    if (v6 == self->_size.width)
    {
      objc_msgSend(a3, "size");
      if (v7 == self->_size.height
        && objc_msgSend(a3, "frameRate") == self->_frameRate
        && objc_msgSend(a3, "keyFrameInterval") == self->_keyFrameInterval)
      {
        LOBYTE(v5) = objc_msgSend(a3, "payload") == self->_payload;
        return v5;
      }
    }
LABEL_8:
    LOBYTE(v5) = 0;
  }
  return v5;
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

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (unsigned)frameRate
{
  return self->_frameRate;
}

- (void)setFrameRate:(unsigned int)a3
{
  self->_frameRate = a3;
}

- (unsigned)keyFrameInterval
{
  return self->_keyFrameInterval;
}

- (void)setKeyFrameInterval:(unsigned int)a3
{
  self->_keyFrameInterval = a3;
}

- (int)payload
{
  return self->_payload;
}

- (void)setPayload:(int)a3
{
  self->_payload = a3;
}

@end
