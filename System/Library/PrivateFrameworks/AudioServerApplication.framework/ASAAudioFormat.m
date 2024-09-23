@implementation ASAAudioFormat

- (ASAAudioFormat)initWithAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3
{
  ASAAudioFormat *result;
  double mSampleRate;
  UInt32 mFramesPerPacket;
  UInt32 mBytesPerFrame;

  result = -[ASAAudioFormat init](self, "init");
  if (result)
  {
    mSampleRate = a3->mSampleRate;
    result->_formatID = a3->mFormatID;
    result->_formatFlags = a3->mFormatFlags;
    result->_bytesPerPacket = a3->mBytesPerPacket;
    mFramesPerPacket = a3->mFramesPerPacket;
    result->_framesPerPacket = mFramesPerPacket;
    result->_channelsPerFrame = a3->mChannelsPerFrame;
    mBytesPerFrame = a3->mBytesPerFrame;
    result->_bytesPerFrame = mBytesPerFrame;
    result->_bitsPerChannel = a3->mBitsPerChannel;
    result->_bytesPerPacket = mBytesPerFrame * mFramesPerPacket;
    result->_sampleRate = mSampleRate;
    result->_minimumSampleRate = mSampleRate;
    result->_maximumSampleRate = mSampleRate;
  }
  return result;
}

- (ASAAudioFormat)initWithAudioStreamRangedDescription:(AudioStreamRangedDescription *)a3
{
  ASAAudioFormat *result;
  UInt32 mFramesPerPacket;
  UInt32 mBytesPerFrame;

  result = -[ASAAudioFormat init](self, "init");
  if (result)
  {
    result->_sampleRate = a3->mFormat.mSampleRate;
    result->_formatID = a3->mFormat.mFormatID;
    result->_formatFlags = a3->mFormat.mFormatFlags;
    result->_bytesPerPacket = a3->mFormat.mBytesPerPacket;
    mFramesPerPacket = a3->mFormat.mFramesPerPacket;
    result->_framesPerPacket = mFramesPerPacket;
    result->_channelsPerFrame = a3->mFormat.mChannelsPerFrame;
    mBytesPerFrame = a3->mFormat.mBytesPerFrame;
    result->_bytesPerFrame = mBytesPerFrame;
    result->_bitsPerChannel = a3->mFormat.mBitsPerChannel;
    result->_bytesPerPacket = mBytesPerFrame * mFramesPerPacket;
    result->_minimumSampleRate = a3->mSampleRateRange.mMinimum;
    result->_maximumSampleRate = a3->mSampleRateRange.mMaximum;
  }
  return result;
}

- (void)setChannelsPerFrame:(unsigned int)a3
{
  self->_channelsPerFrame = a3;
  -[ASAAudioFormat setBytesPerFrame:](self, "setBytesPerFrame:", 4 * a3);
  -[ASAAudioFormat setBytesPerPacket:](self, "setBytesPerPacket:", -[ASAAudioFormat bytesPerFrame](self, "bytesPerFrame") * -[ASAAudioFormat framesPerPacket](self, "framesPerPacket"));
}

- (AudioStreamBasicDescription)audioStreamBasicDescription
{
  Float64 v5;
  AudioStreamBasicDescription *result;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  -[ASAAudioFormat sampleRate](self, "sampleRate");
  retstr->mSampleRate = v5;
  retstr->mFormatID = -[ASAAudioFormat formatID](self, "formatID");
  retstr->mFormatFlags = -[ASAAudioFormat formatFlags](self, "formatFlags");
  retstr->mBytesPerPacket = -[ASAAudioFormat bytesPerPacket](self, "bytesPerPacket");
  retstr->mFramesPerPacket = -[ASAAudioFormat framesPerPacket](self, "framesPerPacket");
  retstr->mBytesPerFrame = -[ASAAudioFormat bytesPerFrame](self, "bytesPerFrame");
  retstr->mChannelsPerFrame = -[ASAAudioFormat channelsPerFrame](self, "channelsPerFrame");
  result = (AudioStreamBasicDescription *)-[ASAAudioFormat bitsPerChannel](self, "bitsPerChannel");
  retstr->mBitsPerChannel = result;
  return result;
}

- (AudioStreamRangedDescription)audioStreamRangedDescription
{
  __int128 v5;
  Float64 v6;
  AudioStreamRangedDescription *result;
  Float64 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  retstr->mSampleRateRange.mMaximum = 0.0;
  *(_OWORD *)&retstr->mFormat.mBytesPerPacket = 0u;
  *(_OWORD *)&retstr->mFormat.mBitsPerChannel = 0u;
  *(_OWORD *)&retstr->mFormat.mSampleRate = 0u;
  -[ASAAudioFormat audioStreamBasicDescription](self, "audioStreamBasicDescription");
  v5 = v10;
  *(_OWORD *)&retstr->mFormat.mSampleRate = v9;
  *(_OWORD *)&retstr->mFormat.mBytesPerPacket = v5;
  *(_QWORD *)&retstr->mFormat.mBitsPerChannel = v11;
  -[ASAAudioFormat minimumSampleRate](self, "minimumSampleRate");
  retstr->mSampleRateRange.mMinimum = v6;
  result = (AudioStreamRangedDescription *)-[ASAAudioFormat maximumSampleRate](self, "maximumSampleRate");
  retstr->mSampleRateRange.mMaximum = v8;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[ASAAudioFormat sampleRate](self, "sampleRate");
  objc_msgSend(v4, "setSampleRate:");
  objc_msgSend(v4, "setFormatID:", -[ASAAudioFormat formatID](self, "formatID"));
  objc_msgSend(v4, "setFormatFlags:", -[ASAAudioFormat formatFlags](self, "formatFlags"));
  objc_msgSend(v4, "setBytesPerPacket:", -[ASAAudioFormat bytesPerPacket](self, "bytesPerPacket"));
  objc_msgSend(v4, "setFramesPerPacket:", -[ASAAudioFormat framesPerPacket](self, "framesPerPacket"));
  objc_msgSend(v4, "setBytesPerFrame:", -[ASAAudioFormat bytesPerFrame](self, "bytesPerFrame"));
  objc_msgSend(v4, "setChannelsPerFrame:", -[ASAAudioFormat channelsPerFrame](self, "channelsPerFrame"));
  objc_msgSend(v4, "setBitsPerChannel:", -[ASAAudioFormat bitsPerChannel](self, "bitsPerChannel"));
  -[ASAAudioFormat minimumSampleRate](self, "minimumSampleRate");
  objc_msgSend(v4, "setMinimumSampleRate:");
  -[ASAAudioFormat maximumSampleRate](self, "maximumSampleRate");
  objc_msgSend(v4, "setMaximumSampleRate:");
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v24;
  uint64_t v25;
  void *v26;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  -[ASAAudioFormat sampleRate](self, "sampleRate");
  v7 = v6;
  if ((int)-[ASAAudioFormat formatID](self, "formatID") < 0x20000000
    || (int)-[ASAAudioFormat formatID](self, "formatID") > 2130706431)
  {
    v8 = 32;
  }
  else
  {
    v8 = ((int)-[ASAAudioFormat formatID](self, "formatID") >> 24);
  }
  if ((int)(-[ASAAudioFormat formatID](self, "formatID") << 8) < 0x20000000
    || (int)(-[ASAAudioFormat formatID](self, "formatID") << 8) > 2130706431)
  {
    v9 = 32;
  }
  else
  {
    v9 = ((int)(-[ASAAudioFormat formatID](self, "formatID") << 8) >> 24);
  }
  v26 = (void *)v5;
  v24 = v3;
  v25 = v8;
  if ((int)(-[ASAAudioFormat formatID](self, "formatID") << 16) < 0x20000000
    || (int)(-[ASAAudioFormat formatID](self, "formatID") << 16) > 2130706431)
  {
    v10 = 32;
  }
  else
  {
    v10 = ((__int16)-[ASAAudioFormat formatID](self, "formatID") >> 8);
  }
  v11 = v9;
  if ((int)(-[ASAAudioFormat formatID](self, "formatID") << 24) < 520093697
    || -[ASAAudioFormat formatID](self, "formatID") == 127)
  {
    v12 = 32;
  }
  else
  {
    v12 = (char)-[ASAAudioFormat formatID](self, "formatID");
  }
  v13 = -[ASAAudioFormat formatFlags](self, "formatFlags");
  v14 = -[ASAAudioFormat bytesPerPacket](self, "bytesPerPacket");
  v15 = -[ASAAudioFormat framesPerPacket](self, "framesPerPacket");
  v16 = -[ASAAudioFormat bytesPerFrame](self, "bytesPerFrame");
  v17 = -[ASAAudioFormat channelsPerFrame](self, "channelsPerFrame");
  v18 = -[ASAAudioFormat bitsPerChannel](self, "bitsPerChannel");
  -[ASAAudioFormat minimumSampleRate](self, "minimumSampleRate");
  v20 = v19;
  -[ASAAudioFormat maximumSampleRate](self, "maximumSampleRate");
  objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@ sampleRate:%f formatID:%c%c%c%c formatFlags:0x%08x bytesPerPacket:%u framesPerPacket:%u bytesPerFrame:%u channelsPerFrame:%u bitsPerChannel:%u minimumSampleRate:%f maximumSampleRate:%f>"), v26, v7, v25, v11, v10, v12, v13, v14, v15, v16, v17, v18, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(double)a3
{
  self->_sampleRate = a3;
}

- (unsigned)formatID
{
  return self->_formatID;
}

- (void)setFormatID:(unsigned int)a3
{
  self->_formatID = a3;
}

- (unsigned)formatFlags
{
  return self->_formatFlags;
}

- (void)setFormatFlags:(unsigned int)a3
{
  self->_formatFlags = a3;
}

- (unsigned)bytesPerPacket
{
  return self->_bytesPerPacket;
}

- (void)setBytesPerPacket:(unsigned int)a3
{
  self->_bytesPerPacket = a3;
}

- (unsigned)framesPerPacket
{
  return self->_framesPerPacket;
}

- (void)setFramesPerPacket:(unsigned int)a3
{
  self->_framesPerPacket = a3;
}

- (unsigned)bytesPerFrame
{
  return self->_bytesPerFrame;
}

- (void)setBytesPerFrame:(unsigned int)a3
{
  self->_bytesPerFrame = a3;
}

- (unsigned)channelsPerFrame
{
  return self->_channelsPerFrame;
}

- (unsigned)bitsPerChannel
{
  return self->_bitsPerChannel;
}

- (void)setBitsPerChannel:(unsigned int)a3
{
  self->_bitsPerChannel = a3;
}

- (double)minimumSampleRate
{
  return self->_minimumSampleRate;
}

- (void)setMinimumSampleRate:(double)a3
{
  self->_minimumSampleRate = a3;
}

- (double)maximumSampleRate
{
  return self->_maximumSampleRate;
}

- (void)setMaximumSampleRate:(double)a3
{
  self->_maximumSampleRate = a3;
}

@end
