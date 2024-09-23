@implementation ASDStreamFormat

- (ASDStreamFormat)initWithSampleRate:(double)a3 numChannels:(unsigned int)a4 commonPCMFormat:(unsigned int)a5 isInterleaved:(BOOL)a6
{
  _BOOL4 v6;
  ASDStreamFormat *result;
  signed int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  objc_super v15;

  v6 = a6;
  v15.receiver = self;
  v15.super_class = (Class)ASDStreamFormat;
  result = -[ASDStreamFormat init](&v15, sel_init);
  if (result)
  {
    result->_sampleRate = a3;
    result->_minimumSampleRate = a3;
    result->_maximumSampleRate = a3;
    *(_QWORD *)&result->_formatID = 0x86C70636DLL;
    result->_framesPerPacket = 1;
    result->_channelsPerFrame = a4;
    v11 = a5 - 1;
    if (a5 - 1 > 4)
    {
      v14 = 0;
      v13 = 40;
    }
    else
    {
      v12 = dword_219CC17A8[v11];
      v13 = dword_219CC17BC[v11];
      v14 = dword_219CC17D0[v11];
      result->_formatFlags = v12;
    }
    result->_bitsPerChannel = 8 * v14;
    if (v6)
      v14 *= a4;
    else
      result->_formatFlags = v13;
    result->_bytesPerPacket = v14;
    result->_bytesPerFrame = v14;
  }
  return result;
}

- (ASDStreamFormat)initWithAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3
{
  ASDStreamFormat *result;
  double mSampleRate;
  UInt32 mFramesPerPacket;
  UInt32 mBytesPerFrame;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASDStreamFormat;
  result = -[ASDStreamFormat init](&v8, sel_init);
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
    result->_sampleRate = mSampleRate;
    result->_minimumSampleRate = mSampleRate;
    result->_maximumSampleRate = mSampleRate;
    if (a3->mFormatID == 1819304813)
      result->_bytesPerPacket = mBytesPerFrame * mFramesPerPacket;
  }
  return result;
}

- (ASDStreamFormat)initWithAudioStreamRangedDescription:(AudioStreamRangedDescription *)a3
{
  ASDStreamFormat *result;
  UInt32 mFramesPerPacket;
  UInt32 mBytesPerFrame;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASDStreamFormat;
  result = -[ASDStreamFormat init](&v7, sel_init);
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
    result->_minimumSampleRate = a3->mSampleRateRange.mMinimum;
    result->_maximumSampleRate = a3->mSampleRateRange.mMaximum;
    if (a3->mFormat.mFormatID == 1819304813)
      result->_bytesPerPacket = mBytesPerFrame * mFramesPerPacket;
  }
  return result;
}

- (AudioStreamBasicDescription)audioStreamBasicDescription
{
  Float64 v5;
  AudioStreamBasicDescription *result;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  -[ASDStreamFormat sampleRate](self, "sampleRate");
  retstr->mSampleRate = v5;
  retstr->mFormatID = -[ASDStreamFormat formatID](self, "formatID");
  retstr->mFormatFlags = -[ASDStreamFormat formatFlags](self, "formatFlags");
  retstr->mBytesPerPacket = -[ASDStreamFormat bytesPerPacket](self, "bytesPerPacket");
  retstr->mFramesPerPacket = -[ASDStreamFormat framesPerPacket](self, "framesPerPacket");
  retstr->mBytesPerFrame = -[ASDStreamFormat bytesPerFrame](self, "bytesPerFrame");
  retstr->mChannelsPerFrame = -[ASDStreamFormat channelsPerFrame](self, "channelsPerFrame");
  result = (AudioStreamBasicDescription *)-[ASDStreamFormat bitsPerChannel](self, "bitsPerChannel");
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
  -[ASDStreamFormat audioStreamBasicDescription](self, "audioStreamBasicDescription");
  v5 = v10;
  *(_OWORD *)&retstr->mFormat.mSampleRate = v9;
  *(_OWORD *)&retstr->mFormat.mBytesPerPacket = v5;
  *(_QWORD *)&retstr->mFormat.mBitsPerChannel = v11;
  -[ASDStreamFormat minimumSampleRate](self, "minimumSampleRate");
  retstr->mSampleRateRange.mMinimum = v6;
  result = (AudioStreamRangedDescription *)-[ASDStreamFormat maximumSampleRate](self, "maximumSampleRate");
  retstr->mSampleRateRange.mMaximum = v8;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[ASDStreamFormat sampleRate](self, "sampleRate");
  objc_msgSend(v4, "setSampleRate:");
  objc_msgSend(v4, "setFormatID:", -[ASDStreamFormat formatID](self, "formatID"));
  objc_msgSend(v4, "setFormatFlags:", -[ASDStreamFormat formatFlags](self, "formatFlags"));
  objc_msgSend(v4, "setBytesPerPacket:", -[ASDStreamFormat bytesPerPacket](self, "bytesPerPacket"));
  objc_msgSend(v4, "setFramesPerPacket:", -[ASDStreamFormat framesPerPacket](self, "framesPerPacket"));
  objc_msgSend(v4, "setBytesPerFrame:", -[ASDStreamFormat bytesPerFrame](self, "bytesPerFrame"));
  objc_msgSend(v4, "setChannelsPerFrame:", -[ASDStreamFormat channelsPerFrame](self, "channelsPerFrame"));
  objc_msgSend(v4, "setBitsPerChannel:", -[ASDStreamFormat bitsPerChannel](self, "bitsPerChannel"));
  -[ASDStreamFormat minimumSampleRate](self, "minimumSampleRate");
  objc_msgSend(v4, "setMinimumSampleRate:");
  -[ASDStreamFormat maximumSampleRate](self, "maximumSampleRate");
  objc_msgSend(v4, "setMaximumSampleRate:");
  return v4;
}

- (unint64_t)hash
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;

  v3 = -[ASDStreamFormat formatID](self, "formatID");
  v4 = -[ASDStreamFormat formatFlags](self, "formatFlags") | v3;
  v5 = -[ASDStreamFormat bytesPerPacket](self, "bytesPerPacket");
  v6 = v4 | v5 | -[ASDStreamFormat framesPerPacket](self, "framesPerPacket");
  v7 = -[ASDStreamFormat bytesPerFrame](self, "bytesPerFrame");
  v8 = v7 | -[ASDStreamFormat channelsPerFrame](self, "channelsPerFrame");
  return *(_QWORD *)&self->_sampleRate | v6 | v8 | -[ASDStreamFormat bitsPerChannel](self, "bitsPerChannel");
}

- (BOOL)isEqual:(id)a3
{
  ASDStreamFormat *v4;
  ASDStreamFormat *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;

  v4 = (ASDStreamFormat *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[ASDStreamFormat formatID](v5, "formatID");
      if (v6 == -[ASDStreamFormat formatID](self, "formatID")
        && (v7 = -[ASDStreamFormat formatFlags](v5, "formatFlags"),
            v7 == -[ASDStreamFormat formatFlags](self, "formatFlags"))
        && (v8 = -[ASDStreamFormat bytesPerPacket](v5, "bytesPerPacket"),
            v8 == -[ASDStreamFormat bytesPerPacket](self, "bytesPerPacket"))
        && (v9 = -[ASDStreamFormat framesPerPacket](v5, "framesPerPacket"),
            v9 == -[ASDStreamFormat framesPerPacket](self, "framesPerPacket"))
        && (v10 = -[ASDStreamFormat bytesPerFrame](v5, "bytesPerFrame"),
            v10 == -[ASDStreamFormat bytesPerFrame](self, "bytesPerFrame"))
        && (v11 = -[ASDStreamFormat channelsPerFrame](v5, "channelsPerFrame"),
            v11 == -[ASDStreamFormat channelsPerFrame](self, "channelsPerFrame"))
        && (v12 = -[ASDStreamFormat bitsPerChannel](v5, "bitsPerChannel"),
            v12 == -[ASDStreamFormat bitsPerChannel](self, "bitsPerChannel")))
      {
        -[ASDStreamFormat sampleRate](v5, "sampleRate");
        v14 = v13;
        -[ASDStreamFormat sampleRate](self, "sampleRate");
        v16 = vabdd_f64(v14, v15) < 0.001;
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (BOOL)isCompatible:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;

  v4 = a3;
  v5 = objc_msgSend(v4, "formatID");
  if (v5 != -[ASDStreamFormat formatID](self, "formatID"))
    goto LABEL_12;
  v6 = objc_msgSend(v4, "formatFlags");
  if (v6 != -[ASDStreamFormat formatFlags](self, "formatFlags"))
    goto LABEL_12;
  v7 = objc_msgSend(v4, "bytesPerPacket");
  if (v7 != -[ASDStreamFormat bytesPerPacket](self, "bytesPerPacket"))
    goto LABEL_12;
  v8 = objc_msgSend(v4, "framesPerPacket");
  if (v8 != -[ASDStreamFormat framesPerPacket](self, "framesPerPacket"))
    goto LABEL_12;
  v9 = objc_msgSend(v4, "bytesPerFrame");
  if (v9 != -[ASDStreamFormat bytesPerFrame](self, "bytesPerFrame"))
    goto LABEL_12;
  v10 = objc_msgSend(v4, "channelsPerFrame");
  if (v10 != -[ASDStreamFormat channelsPerFrame](self, "channelsPerFrame"))
    goto LABEL_12;
  v11 = objc_msgSend(v4, "bitsPerChannel");
  if (v11 != -[ASDStreamFormat bitsPerChannel](self, "bitsPerChannel"))
    goto LABEL_12;
  objc_msgSend(v4, "minimumSampleRate");
  v13 = v12;
  -[ASDStreamFormat sampleRate](self, "sampleRate");
  if (vabdd_f64(v13, v14) < 0.001)
    goto LABEL_14;
  objc_msgSend(v4, "maximumSampleRate");
  v16 = v15;
  -[ASDStreamFormat sampleRate](self, "sampleRate");
  if (vabdd_f64(v16, v17) < 0.001
    || (objc_msgSend(v4, "minimumSampleRate"), v19 = v18, -[ASDStreamFormat sampleRate](self, "sampleRate"), v19 <= v20)
    && (objc_msgSend(v4, "maximumSampleRate"), v22 = v21, -[ASDStreamFormat sampleRate](self, "sampleRate"), v22 >= v23))
  {
LABEL_14:
    v24 = 1;
  }
  else
  {
LABEL_12:
    v24 = 0;
  }

  return v24;
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
  -[ASDStreamFormat sampleRate](self, "sampleRate");
  v7 = v6;
  if ((int)-[ASDStreamFormat formatID](self, "formatID") < 0x20000000
    || (int)-[ASDStreamFormat formatID](self, "formatID") > 2130706431)
  {
    v8 = 32;
  }
  else
  {
    v8 = ((int)-[ASDStreamFormat formatID](self, "formatID") >> 24);
  }
  if ((int)(-[ASDStreamFormat formatID](self, "formatID") << 8) < 0x20000000
    || (int)(-[ASDStreamFormat formatID](self, "formatID") << 8) > 2130706431)
  {
    v9 = 32;
  }
  else
  {
    v9 = ((int)(-[ASDStreamFormat formatID](self, "formatID") << 8) >> 24);
  }
  v26 = (void *)v5;
  v24 = v3;
  v25 = v8;
  if ((int)(-[ASDStreamFormat formatID](self, "formatID") << 16) < 0x20000000
    || (int)(-[ASDStreamFormat formatID](self, "formatID") << 16) > 2130706431)
  {
    v10 = 32;
  }
  else
  {
    v10 = ((__int16)-[ASDStreamFormat formatID](self, "formatID") >> 8);
  }
  v11 = v9;
  if ((int)(-[ASDStreamFormat formatID](self, "formatID") << 24) < 520093697
    || -[ASDStreamFormat formatID](self, "formatID") == 127)
  {
    v12 = 32;
  }
  else
  {
    v12 = (char)-[ASDStreamFormat formatID](self, "formatID");
  }
  v13 = -[ASDStreamFormat formatFlags](self, "formatFlags");
  v14 = -[ASDStreamFormat bytesPerPacket](self, "bytesPerPacket");
  v15 = -[ASDStreamFormat framesPerPacket](self, "framesPerPacket");
  v16 = -[ASDStreamFormat bytesPerFrame](self, "bytesPerFrame");
  v17 = -[ASDStreamFormat channelsPerFrame](self, "channelsPerFrame");
  v18 = -[ASDStreamFormat bitsPerChannel](self, "bitsPerChannel");
  -[ASDStreamFormat minimumSampleRate](self, "minimumSampleRate");
  v20 = v19;
  -[ASDStreamFormat maximumSampleRate](self, "maximumSampleRate");
  objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@ sampleRate:%f formatID:%c%c%c%c formatFlags:0x%08x bytesPerPacket:%u framesPerPacket:%u bytesPerFrame:%u channelsPerFrame:%u bitsPerChannel:%u minimumSampleRate:%f maximumSampleRate:%f>"), v26, v7, v25, v11, v10, v12, v13, v14, v15, v16, v17, v18, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (unsigned)framesToBytes:(unsigned int)a3
{
  return -[ASDStreamFormat bytesPerFrame](self, "bytesPerFrame") * a3;
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

- (void)setChannelsPerFrame:(unsigned int)a3
{
  self->_channelsPerFrame = a3;
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
