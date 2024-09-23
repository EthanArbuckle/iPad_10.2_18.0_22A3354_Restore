@implementation ATCIOA2StreamFormat

+ (id)aeaStreamFormatWithDictionary:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIOAudio2Dictionary:", v3);

  return v4;
}

+ (id)aeaStreamFormatsWithRangedDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("min sample rate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("max sample rate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v7 = v6;
  objc_msgSend(v5, "doubleValue");
  if (v7 == v8)
  {
    v21 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIOAudio2Dictionary:", v3);
    if (v21)
      objc_msgSend(v23, "addObject:", v21);

  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = objc_msgSend(&unk_24DB6FC40, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(&unk_24DB6FC40);
          v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v13, "doubleValue");
          v15 = v14;
          objc_msgSend(v4, "doubleValue");
          if (v15 >= v16)
          {
            objc_msgSend(v13, "doubleValue");
            v18 = v17;
            objc_msgSend(v5, "doubleValue");
            if (v18 <= v19)
            {
              v20 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIOAudio2Dictionary:", v3);
              if (v20)
              {
                objc_msgSend(v13, "doubleValue");
                objc_msgSend(v20, "setSampleRate:");
                objc_msgSend(v23, "addObject:", v20);
              }

            }
          }
        }
        v10 = objc_msgSend(&unk_24DB6FC40, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v10);
    }
  }

  return v23;
}

- (ATCIOA2StreamFormat)initWithSampleRate:(double)a3 numChannels:(unsigned int)a4 commonPCMFormat:(unsigned int)a5 isInterleaved:(BOOL)a6
{
  _BOOL4 v6;
  ATCIOA2StreamFormat *result;
  signed int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  objc_super v15;

  v6 = a6;
  v15.receiver = self;
  v15.super_class = (Class)ATCIOA2StreamFormat;
  result = -[ATCIOA2StreamFormat init](&v15, sel_init);
  if (result)
  {
    result->_sampleRate = a3;
    *(_QWORD *)&result->_formatID = 0x86C70636DLL;
    result->_framesPerPacket = 1;
    result->_channelsPerFrame = a4;
    v11 = a5 - 1;
    if (a5 - 1 > 3)
    {
      v14 = 0;
      v13 = 40;
    }
    else
    {
      v12 = dword_2198477C0[v11];
      v13 = dword_2198477D0[v11];
      v14 = dword_2198477E0[v11];
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

- (ATCIOA2StreamFormat)initWithAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3
{
  ATCIOA2StreamFormat *result;
  UInt32 mFramesPerPacket;
  UInt32 mBytesPerFrame;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATCIOA2StreamFormat;
  result = -[ATCIOA2StreamFormat init](&v7, sel_init);
  if (result)
  {
    result->_sampleRate = a3->mSampleRate;
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
  }
  return result;
}

- (ATCIOA2StreamFormat)initWithIOAudio2Dictionary:(id)a3
{
  id v4;
  ATCIOA2StreamFormat *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATCIOA2StreamFormat;
  v5 = -[ATCIOA2StreamFormat init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sample rate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v7 = CFSTR("sample rate");
    else
      v7 = CFSTR("min sample rate");
    objc_msgSend(v4, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sampleRate = IOAudio2Fixed64ToFloat64(objc_msgSend(v8, "longLongValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("format ID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_formatID = objc_msgSend(v9, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("format flags"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_formatFlags = objc_msgSend(v10, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bytes per packet"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_bytesPerPacket = objc_msgSend(v11, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("frames per packet"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_framesPerPacket = objc_msgSend(v12, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("channels per frame"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_channelsPerFrame = objc_msgSend(v13, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bytes per frame"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_bytesPerFrame = objc_msgSend(v14, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bits per channel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_bitsPerChannel = objc_msgSend(v15, "unsignedIntValue");

  }
  return v5;
}

- (AudioStreamBasicDescription)audioStreamBasicDescription
{
  Float64 v5;
  AudioStreamBasicDescription *result;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  -[ATCIOA2StreamFormat sampleRate](self, "sampleRate");
  retstr->mSampleRate = v5;
  retstr->mFormatID = -[ATCIOA2StreamFormat formatID](self, "formatID");
  retstr->mFormatFlags = -[ATCIOA2StreamFormat formatFlags](self, "formatFlags");
  retstr->mBytesPerPacket = -[ATCIOA2StreamFormat bytesPerPacket](self, "bytesPerPacket");
  retstr->mFramesPerPacket = -[ATCIOA2StreamFormat framesPerPacket](self, "framesPerPacket");
  retstr->mBytesPerFrame = -[ATCIOA2StreamFormat bytesPerFrame](self, "bytesPerFrame");
  retstr->mChannelsPerFrame = -[ATCIOA2StreamFormat channelsPerFrame](self, "channelsPerFrame");
  result = (AudioStreamBasicDescription *)-[ATCIOA2StreamFormat bitsPerChannel](self, "bitsPerChannel");
  retstr->mBitsPerChannel = result;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[ATCIOA2StreamFormat sampleRate](self, "sampleRate");
  objc_msgSend(v4, "setSampleRate:");
  objc_msgSend(v4, "setFormatID:", -[ATCIOA2StreamFormat formatID](self, "formatID"));
  objc_msgSend(v4, "setFormatFlags:", -[ATCIOA2StreamFormat formatFlags](self, "formatFlags"));
  objc_msgSend(v4, "setBytesPerPacket:", -[ATCIOA2StreamFormat bytesPerPacket](self, "bytesPerPacket"));
  objc_msgSend(v4, "setFramesPerPacket:", -[ATCIOA2StreamFormat framesPerPacket](self, "framesPerPacket"));
  objc_msgSend(v4, "setBytesPerFrame:", -[ATCIOA2StreamFormat bytesPerFrame](self, "bytesPerFrame"));
  objc_msgSend(v4, "setChannelsPerFrame:", -[ATCIOA2StreamFormat channelsPerFrame](self, "channelsPerFrame"));
  objc_msgSend(v4, "setBitsPerChannel:", -[ATCIOA2StreamFormat bitsPerChannel](self, "bitsPerChannel"));
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

  v3 = -[ATCIOA2StreamFormat formatID](self, "formatID");
  v4 = -[ATCIOA2StreamFormat formatFlags](self, "formatFlags") | v3;
  v5 = -[ATCIOA2StreamFormat bytesPerPacket](self, "bytesPerPacket");
  v6 = v4 | v5 | -[ATCIOA2StreamFormat framesPerPacket](self, "framesPerPacket");
  v7 = -[ATCIOA2StreamFormat bytesPerFrame](self, "bytesPerFrame");
  v8 = v7 | -[ATCIOA2StreamFormat channelsPerFrame](self, "channelsPerFrame");
  return *(_QWORD *)&self->_sampleRate | v6 | v8 | -[ATCIOA2StreamFormat bitsPerChannel](self, "bitsPerChannel");
}

- (BOOL)isEqual:(id)a3
{
  ATCIOA2StreamFormat *v4;
  ATCIOA2StreamFormat *v5;
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

  v4 = (ATCIOA2StreamFormat *)a3;
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
      v6 = -[ATCIOA2StreamFormat formatID](v5, "formatID");
      if (v6 == -[ATCIOA2StreamFormat formatID](self, "formatID")
        && (v7 = -[ATCIOA2StreamFormat formatFlags](v5, "formatFlags"),
            v7 == -[ATCIOA2StreamFormat formatFlags](self, "formatFlags"))
        && (v8 = -[ATCIOA2StreamFormat bytesPerPacket](v5, "bytesPerPacket"),
            v8 == -[ATCIOA2StreamFormat bytesPerPacket](self, "bytesPerPacket"))
        && (v9 = -[ATCIOA2StreamFormat framesPerPacket](v5, "framesPerPacket"),
            v9 == -[ATCIOA2StreamFormat framesPerPacket](self, "framesPerPacket"))
        && (v10 = -[ATCIOA2StreamFormat bytesPerFrame](v5, "bytesPerFrame"),
            v10 == -[ATCIOA2StreamFormat bytesPerFrame](self, "bytesPerFrame"))
        && (v11 = -[ATCIOA2StreamFormat channelsPerFrame](v5, "channelsPerFrame"),
            v11 == -[ATCIOA2StreamFormat channelsPerFrame](self, "channelsPerFrame"))
        && (v12 = -[ATCIOA2StreamFormat bitsPerChannel](v5, "bitsPerChannel"),
            v12 == -[ATCIOA2StreamFormat bitsPerChannel](self, "bitsPerChannel")))
      {
        -[ATCIOA2StreamFormat sampleRate](v5, "sampleRate");
        v14 = v13;
        -[ATCIOA2StreamFormat sampleRate](self, "sampleRate");
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

- (id)description
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v8;

  v8 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATCIOA2StreamFormat sampleRate](self, "sampleRate");
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@ sampleRate:%f formatID:%c%c%c%c formatFlags:0x%08x bytesPerPacket:%u framesPerPacket:%u bytesPerFrame:%u channelsPerFrame:%u bitsPerChannel:%u>"), v4, v5, ((int)-[ATCIOA2StreamFormat formatID](self, "formatID") >> 24), ((int)(-[ATCIOA2StreamFormat formatID](self, "formatID") << 8) >> 24), ((__int16)-[ATCIOA2StreamFormat formatID](self, "formatID") >> 8), (char)-[ATCIOA2StreamFormat formatID](self, "formatID"), -[ATCIOA2StreamFormat formatFlags](self, "formatFlags"), -[ATCIOA2StreamFormat bytesPerPacket](self, "bytesPerPacket"), -[ATCIOA2StreamFormat framesPerPacket](self, "framesPerPacket"), -[ATCIOA2StreamFormat bytesPerFrame](self, "bytesPerFrame"), -[ATCIOA2StreamFormat channelsPerFrame](self, "channelsPerFrame"), -[ATCIOA2StreamFormat bitsPerChannel](self, "bitsPerChannel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)framesToBytes:(unsigned int)a3
{
  return -[ATCIOA2StreamFormat bytesPerFrame](self, "bytesPerFrame") * a3;
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

@end
