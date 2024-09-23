@implementation AVAudioFormat

- (AVAudioFormat)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AVAudioFormat *v8;
  AVAudioFormat *v9;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;

  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("mSampleRate"));
  v11 = v5;
  v12 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("mFormatID"));
  v13 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("mFormatFlags"));
  v14 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("mBytesPerPacket"));
  v15 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("mFramesPerPacket"));
  v16 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("mBytesPerFrame"));
  v17 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("mChannelsPerFrame"));
  v18 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("mBitsPerChannel"));
  v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_self(), CFSTR("channelLayout"));
  v7 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_self(), CFSTR("magicCookie"));
  v8 = -[AVAudioFormat initWithStreamDescription:channelLayout:](self, "initWithStreamDescription:channelLayout:", &v11, v6);
  v9 = v8;
  if (v7)
    -[AVAudioFormat setMagicCookie:](v8, "setMagicCookie:", v7);
  return v9;
}

- (AVAudioFormat)initWithSettings:(NSDictionary *)settings
{
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  double v10;
  uint64_t v11;
  id v12;
  void *v13;
  unsigned int v14;
  int v15;
  int v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  unsigned int v21;
  id v22;
  void *v23;
  unsigned int v25;
  id v26;
  void *v27;
  id v28;
  AVAudioChannelLayout *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;

  v31 = 0u;
  v32 = 0u;
  v5 = -[NSDictionary objectForKey:](settings, "objectForKey:", CFSTR("AVFormatIDKey"));
  if (v5)
  {
    v6 = v5;
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_30;
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
  }
  else
  {
    v7 = 1819304813;
  }
  LODWORD(v31) = v7;
  v8 = -[NSDictionary objectForKey:](settings, "objectForKey:", CFSTR("AVSampleRateKey"));
  if (v8)
  {
    v9 = v8;
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_30;
    objc_msgSend(v9, "doubleValue");
    v11 = 0x40BF400000000000;
    if (v10 >= 8000.0)
    {
      v11 = *(_QWORD *)&v10;
      if (v10 > 192000.0)
        v11 = 0x4107700000000000;
    }
  }
  else
  {
    v11 = qword_19B85A280[v7 == 1768710755];
  }
  v30 = v11;
  v12 = -[NSDictionary objectForKey:](settings, "objectForKey:", CFSTR("AVNumberOfChannelsKey"));
  if (!v12)
  {
    v15 = 1;
    goto LABEL_17;
  }
  v13 = v12;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_30:

    return 0;
  }
  v14 = objc_msgSend(v13, "unsignedIntegerValue");
  if (v14 <= 1)
    v15 = 1;
  else
    v15 = v14;
LABEL_17:
  DWORD1(v32) = v15;
  if (v7 == 1819304813)
  {
    v16 = 8;
    DWORD1(v31) = 8;
    v17 = -[NSDictionary objectForKey:](settings, "objectForKey:", CFSTR("AVLinearPCMIsBigEndianKey"));
    if (v17)
    {
      v18 = v17;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (objc_msgSend(v18, "unsignedIntegerValue"))
          v16 = 10;
        else
          v16 = 8;
      }
    }
    v19 = -[NSDictionary objectForKey:](settings, "objectForKey:", CFSTR("AVLinearPCMIsFloatKey"));
    if (v19)
    {
      v20 = v19;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (objc_msgSend(v20, "unsignedIntegerValue"))
        {
          v16 |= 1u;
          v21 = 32;
          DWORD2(v32) = 32;
          goto LABEL_34;
        }
      }
    }
    v22 = -[NSDictionary objectForKey:](settings, "objectForKey:", CFSTR("AVLinearPCMBitDepthKey"));
    if (v22)
    {
      v23 = v22;
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_30;
      v21 = (objc_msgSend(v23, "unsignedIntegerValue") + 7) & 0xFFFFFFF8;
      DWORD2(v32) = v21;
      if (v21 - 33 < 0xFFFFFFE0)
        goto LABEL_30;
      if (v21 == 8)
      {
LABEL_34:
        v25 = v21 >> 3;
        v26 = -[NSDictionary objectForKey:](settings, "objectForKey:", CFSTR("AVLinearPCMIsNonInterleaved"));
        if (v26
          && (v27 = v26, (objc_opt_respondsToSelector() & 1) != 0)
          && objc_msgSend(v27, "unsignedIntegerValue"))
        {
          DWORD1(v31) = v16 | 0x20;
        }
        else
        {
          DWORD1(v31) = v16;
          v25 *= v15;
        }
        *((_QWORD *)&v31 + 1) = v25 | 0x100000000;
        LODWORD(v32) = v25;
        goto LABEL_40;
      }
    }
    else
    {
      v21 = 16;
      DWORD2(v32) = 16;
    }
    v16 |= 4u;
    goto LABEL_34;
  }
LABEL_40:
  v28 = -[NSDictionary objectForKey:](settings, "objectForKey:", CFSTR("AVChannelLayoutKey"));
  if (v28)
    v29 = -[AVAudioChannelLayout initWithLayout:]([AVAudioChannelLayout alloc], "initWithLayout:", objc_msgSend(v28, "bytes"));
  else
    v29 = 0;
  return -[AVAudioFormat initWithStreamDescription:channelLayout:](self, "initWithStreamDescription:channelLayout:", &v30, v29);
}

- (AVAudioFormat)initWithStreamDescription:(const AudioStreamBasicDescription *)asbd channelLayout:(AVAudioChannelLayout *)layout
{
  char *v7;
  AVAudioFormat *v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  AVAudioChannelLayout *v12;
  int v14;
  _OWORD v15[2];
  uint64_t v16;
  objc_super v17;

  if (layout)
  {
    if (-[AVAudioChannelLayout channelCount](layout, "channelCount") == asbd->mChannelsPerFrame)
      goto LABEL_3;
LABEL_8:

    return 0;
  }
  if (asbd->mChannelsPerFrame > 2)
    goto LABEL_8;
LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)AVAudioFormat;
  v7 = -[AVAudioFormat init](&v17, sel_init);
  v8 = (AVAudioFormat *)v7;
  if (v7)
  {
    v9 = *(_OWORD *)&asbd->mBytesPerPacket;
    v15[0] = *(_OWORD *)&asbd->mSampleRate;
    v15[1] = v9;
    v16 = *(_QWORD *)&asbd->mBitsPerChannel;
    v10 = v16;
    *(_OWORD *)(v7 + 8) = v15[0];
    *((_QWORD *)v7 + 5) = v10;
    *(_OWORD *)(v7 + 24) = v9;
    v14 = 0;
    if (CAStreamBasicDescription::IdentifyCommonPCMFormat(v15, &v14) && (v14 - 1) <= 4)
      v11 = qword_19B85A578[v14 - 1];
    else
      v11 = 0;
    v8->_layout = layout;
    v8->_commonFormat = v11;
    v12 = layout;
    v8->_reserved = 0;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  const AudioStreamBasicDescription *v5;

  v5 = -[AVAudioFormat streamDescription](self, "streamDescription");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("mSampleRate"), v5->mSampleRate);
  objc_msgSend(a3, "encodeInteger:forKey:", v5->mFormatID, CFSTR("mFormatID"));
  objc_msgSend(a3, "encodeInteger:forKey:", v5->mFormatFlags, CFSTR("mFormatFlags"));
  objc_msgSend(a3, "encodeInteger:forKey:", v5->mBytesPerPacket, CFSTR("mBytesPerPacket"));
  objc_msgSend(a3, "encodeInteger:forKey:", v5->mFramesPerPacket, CFSTR("mFramesPerPacket"));
  objc_msgSend(a3, "encodeInteger:forKey:", v5->mBytesPerFrame, CFSTR("mBytesPerFrame"));
  objc_msgSend(a3, "encodeInteger:forKey:", v5->mChannelsPerFrame, CFSTR("mChannelsPerFrame"));
  objc_msgSend(a3, "encodeInteger:forKey:", v5->mBitsPerChannel, CFSTR("mBitsPerChannel"));
  objc_msgSend(a3, "encodeObject:forKey:", -[AVAudioFormat channelLayout](self, "channelLayout"), CFSTR("channelLayout"));
  objc_msgSend(a3, "encodeObject:forKey:", -[AVAudioFormat magicCookie](self, "magicCookie"), CFSTR("magicCookie"));
}

- (const)streamDescription
{
  return &self->_asbd;
}

- (NSData)magicCookie
{
  void *reserved;

  reserved = self->_reserved;
  if (reserved)
    return (NSData *)*((_QWORD *)reserved + 1);
  else
    return 0;
}

- (AVAudioChannelLayout)channelLayout
{
  return self->_layout;
}

- (void)dealloc
{
  id *reserved;
  objc_super v4;

  reserved = (id *)self->_reserved;
  if (reserved)
  {

    MEMORY[0x1A1AC5BD4](reserved, 0x80C40803F642BLL);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVAudioFormat;
  -[AVAudioFormat dealloc](&v4, sel_dealloc);
}

- (AVAudioFormat)initWithCommonFormat:(AVAudioCommonFormat)format sampleRate:(double)sampleRate channels:(AVAudioChannelCount)channels interleaved:(BOOL)interleaved
{
  char *v6;
  _BOOL4 v7;
  int v11;
  __int128 v12;
  uint64_t v13;
  _OWORD v15[2];
  uint64_t v16;
  objc_super v17;

  if (channels < 3)
  {
    v7 = interleaved;
    v17.receiver = self;
    v17.super_class = (Class)AVAudioFormat;
    v6 = -[AVAudioFormat init](&v17, sel_init);
    if (v6)
    {
      if (format - 1 > 3)
        v11 = 0;
      else
        v11 = dword_19B85A340[format - 1];
      CAStreamBasicDescription::CAStreamBasicDescription((uint64_t)v15, channels, v11, v7, sampleRate);
      v12 = v15[0];
      v13 = v16;
      *(_OWORD *)(v6 + 24) = v15[1];
      *(_OWORD *)(v6 + 8) = v12;
      *((_QWORD *)v6 + 5) = v13;
      *((_QWORD *)v6 + 6) = 0;
      *((_QWORD *)v6 + 7) = format;
      *((_QWORD *)v6 + 8) = 0;
    }
  }
  else
  {

    return 0;
  }
  return (AVAudioFormat *)v6;
}

- (AVAudioFormat)initWithStreamDescription:(const AudioStreamBasicDescription *)asbd
{
  return -[AVAudioFormat initWithStreamDescription:channelLayout:](self, "initWithStreamDescription:channelLayout:", asbd, 0);
}

- (AVAudioFormat)initStandardFormatWithSampleRate:(double)sampleRate channels:(AVAudioChannelCount)channels
{
  AVAudioFormat *result;
  objc_super v7;

  if (channels < 3)
  {
    v7.receiver = self;
    v7.super_class = (Class)AVAudioFormat;
    result = -[AVAudioFormat init](&v7, sel_init);
    if (result)
    {
      result->_asbd.mSampleRate = sampleRate;
      *(_OWORD *)&result->_asbd.mFormatID = xmmword_19B85A270;
      result->_asbd.mBytesPerFrame = 4;
      result->_asbd.mChannelsPerFrame = channels;
      *(_QWORD *)&result->_asbd.mBitsPerChannel = 32;
      result->_layout = 0;
      result->_commonFormat = 1;
      result->_reserved = 0;
    }
  }
  else
  {

    return 0;
  }
  return result;
}

- (AVAudioFormat)initStandardFormatWithSampleRate:(double)sampleRate channelLayout:(AVAudioChannelLayout *)layout
{
  AVAudioFormat *v6;
  AVAudioChannelCount v7;
  AVAudioChannelLayout *v8;
  objc_super v10;

  if (layout)
  {
    v10.receiver = self;
    v10.super_class = (Class)AVAudioFormat;
    v6 = -[AVAudioFormat init](&v10, sel_init);
    if (v6)
    {
      v7 = -[AVAudioChannelLayout channelCount](layout, "channelCount");
      v6->_asbd.mSampleRate = sampleRate;
      *(_OWORD *)&v6->_asbd.mFormatID = xmmword_19B85A270;
      v6->_asbd.mBytesPerFrame = 4;
      v6->_asbd.mChannelsPerFrame = v7;
      *(_QWORD *)&v6->_asbd.mBitsPerChannel = 32;
      v6->_layout = layout;
      v6->_commonFormat = 1;
      v8 = layout;
      v6->_reserved = 0;
    }
  }
  else
  {

    return 0;
  }
  return v6;
}

- (AVAudioFormat)initWithCommonFormat:(AVAudioCommonFormat)format sampleRate:(double)sampleRate interleaved:(BOOL)interleaved channelLayout:(AVAudioChannelLayout *)layout
{
  _BOOL4 v7;
  char *v10;
  int v11;
  int v12;
  __int128 v13;
  uint64_t v14;
  AVAudioChannelLayout *v15;
  _OWORD v17[2];
  uint64_t v18;
  objc_super v19;

  if (layout)
  {
    v7 = interleaved;
    v19.receiver = self;
    v19.super_class = (Class)AVAudioFormat;
    v10 = -[AVAudioFormat init](&v19, sel_init);
    if (v10)
    {
      v11 = -[AVAudioChannelLayout channelCount](layout, "channelCount");
      if (format - 1 > 3)
        v12 = 0;
      else
        v12 = dword_19B85A340[format - 1];
      CAStreamBasicDescription::CAStreamBasicDescription((uint64_t)v17, v11, v12, v7, sampleRate);
      v13 = v17[0];
      v14 = v18;
      *(_OWORD *)(v10 + 24) = v17[1];
      *(_OWORD *)(v10 + 8) = v13;
      *((_QWORD *)v10 + 6) = layout;
      *((_QWORD *)v10 + 7) = format;
      *((_QWORD *)v10 + 5) = v14;
      v15 = layout;
      *((_QWORD *)v10 + 8) = 0;
    }
  }
  else
  {

    return 0;
  }
  return (AVAudioFormat *)v10;
}

- (AVAudioFormat)initWithCMAudioFormatDescription:(CMAudioFormatDescriptionRef)formatDescription
{
  uint64_t (*v5)(CMAudioFormatDescriptionRef, SEL);
  uint64_t v6;
  uint64_t (*v7)(CMAudioFormatDescriptionRef, uint64_t *);
  uint64_t v8;
  __objc2_class_ro **p_info;
  __objc2_class_ro *v10;
  uint64_t v11;
  AVAudioFormat *v12;
  AVAudioFormat *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;

  if (!formatDescription)
  {

    return 0;
  }
  v17 = 0;
  v5 = (uint64_t (*)(CMAudioFormatDescriptionRef, SEL))sCMAudioFormatDescriptionGetStreamBasicDescription;
  if (sCMAudioFormatDescriptionGetStreamBasicDescription)
    goto LABEL_6;
  if (sLoadCoreMediaOnce != -1)
    dispatch_once(&sLoadCoreMediaOnce, &__block_literal_global_5403);
  v5 = (uint64_t (*)(CMAudioFormatDescriptionRef, SEL))sCMAudioFormatDescriptionGetStreamBasicDescription;
  if (sCMAudioFormatDescriptionGetStreamBasicDescription)
LABEL_6:
    v6 = v5(formatDescription, a2);
  else
    v6 = 0;
  v7 = (uint64_t (*)(CMAudioFormatDescriptionRef, uint64_t *))sCMAudioFormatDescriptionGetChannelLayout;
  if (sCMAudioFormatDescriptionGetChannelLayout)
    goto LABEL_11;
  if (sLoadCoreMediaOnce != -1)
    dispatch_once(&sLoadCoreMediaOnce, &__block_literal_global_5403);
  v7 = (uint64_t (*)(CMAudioFormatDescriptionRef, uint64_t *))sCMAudioFormatDescriptionGetChannelLayout;
  if (sCMAudioFormatDescriptionGetChannelLayout)
LABEL_11:
    v8 = v7(formatDescription, &v17);
  else
    v8 = 0;
  v16 = 0;
  p_info = &OBJC_METACLASS___AVSpeechUtterance.info;
  v10 = (__objc2_class_ro *)sCMAudioFormatDescriptionGetMagicCookie;
  if (sCMAudioFormatDescriptionGetMagicCookie)
    goto LABEL_16;
  if (sLoadCoreMediaOnce != -1)
  {
    dispatch_once(&sLoadCoreMediaOnce, &__block_literal_global_5403);
    p_info = (__objc2_class_ro **)(&OBJC_METACLASS___AVSpeechUtterance + 32);
  }
  v10 = p_info[505];
  if (v10)
  {
LABEL_16:
    v11 = ((uint64_t (*)(CMAudioFormatDescriptionRef, uint64_t *))v10)(formatDescription, &v16);
    if (v6)
      goto LABEL_17;
    return 0;
  }
  v11 = 0;
  if (!v6)
    return 0;
LABEL_17:
  if (v17 && v8)
    v12 = -[AVAudioFormat initWithStreamDescription:channelLayout:](self, "initWithStreamDescription:channelLayout:", v6, +[AVAudioChannelLayout layoutWithLayout:](AVAudioChannelLayout, "layoutWithLayout:", v8));
  else
    v12 = -[AVAudioFormat initWithStreamDescription:](self, "initWithStreamDescription:", v6, v16);
  v13 = v12;
  if (v11 && v16)
  {
    v14 = objc_alloc(MEMORY[0x1E0C99D50]);
    -[AVAudioFormat setMagicCookie:](v13, "setMagicCookie:", (id)objc_msgSend(v14, "initWithBytes:length:", v11, v16));
  }
  return v13;
}

- (CMAudioFormatDescriptionRef)formatDescription
{
  const AudioStreamBasicDescription *v3;
  const AudioChannelLayout *v4;
  NSData *v5;
  NSData *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  CMAudioFormatDescriptionRef result;
  CFTypeRef arg;

  arg = 0;
  v3 = -[AVAudioFormat streamDescription](self, "streamDescription");
  v4 = -[AVAudioChannelLayout layout](-[AVAudioFormat channelLayout](self, "channelLayout"), "layout");
  v5 = -[AVAudioFormat magicCookie](self, "magicCookie");
  v6 = v5;
  if (!v4)
  {
    v7 = 0;
    if (v5)
      goto LABEL_6;
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  if (!v4->mChannelLayoutTag)
  {
    v7 = 20 * v4->mNumberChannelDescriptions + 12;
    if (v5)
      goto LABEL_6;
    goto LABEL_8;
  }
  v7 = 12;
  if (!v5)
    goto LABEL_8;
LABEL_6:
  v8 = -[NSData length](v5, "length");
  v6 = -[NSData bytes](v6, "bytes");
LABEL_9:
  v9 = sCMAudioFormatDescriptionCreate;
  if (sCMAudioFormatDescriptionCreate)
    goto LABEL_13;
  if (sLoadCoreMediaOnce != -1)
    dispatch_once(&sLoadCoreMediaOnce, &__block_literal_global_5403);
  v9 = sCMAudioFormatDescriptionCreate;
  if (sCMAudioFormatDescriptionCreate)
  {
LABEL_13:
    v10 = ((uint64_t (*)(_QWORD, const AudioStreamBasicDescription *, uint64_t, const AudioChannelLayout *, uint64_t, NSData *, _QWORD, CFTypeRef *))v9)(*MEMORY[0x1E0C9AE00], v3, v7, v4, v8, v6, 0, &arg);
    if ((_DWORD)v10)
      NSLog(CFSTR("cannot convert to CMAudioFormatDescription %d"), v10);
  }
  result = (CMAudioFormatDescriptionRef)arg;
  if (arg)
    return (CMAudioFormatDescriptionRef)CFAutorelease(arg);
  return result;
}

- (BOOL)isEqual:(id)object
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v11;
  int v12;
  NSData *v13;
  NSData *v14;
  uint64_t v15;
  AVAudioChannelLayout *layout;
  AVAudioChannelLayout *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (object == self)
  {
    LOBYTE(v12) = 1;
    return v12;
  }
  v19 = v6;
  v20 = v5;
  v21 = v4;
  v22 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_asbd.mSampleRate != *((double *)object + 1)
    || self->_asbd.mFormatID != *((_DWORD *)object + 4)
    || self->_asbd.mBytesPerPacket != *((_DWORD *)object + 6)
    || self->_asbd.mFramesPerPacket != *((_DWORD *)object + 7)
    || self->_asbd.mChannelsPerFrame != *((_DWORD *)object + 9)
    || self->_asbd.mBitsPerChannel != *((_DWORD *)object + 10))
  {
    LOBYTE(v12) = 0;
    return v12;
  }
  v11 = CA::Implementation::EquivalentFormatFlags((CA::Implementation *)&self->_asbd, (const AudioStreamBasicDescription *)((char *)object + 8), 0, 0);
  LOBYTE(v12) = 0;
  if (v11)
  {
    v13 = (NSData *)objc_msgSend(object, "magicCookie");
    v14 = v13;
    if (-[AVAudioFormat magicCookie](self, "magicCookie"))
      v14 = -[AVAudioFormat magicCookie](self, "magicCookie");
    if (!-[AVAudioFormat magicCookie](self, "magicCookie", v19, v20, v21, v22, v7, v8))
      v13 = -[AVAudioFormat magicCookie](self, "magicCookie");
    if (!v14 || (v12 = -[NSData isEqual:](v14, "isEqual:", v13)) != 0)
    {
      v15 = objc_msgSend(object, "channelLayout");
      layout = self->_layout;
      if ((v15 != 0) != (layout != 0))
      {
        if (layout)
          v17 = self->_layout;
        else
          v17 = (AVAudioChannelLayout *)v15;
        if (-[AVAudioChannelLayout layoutTag](v17, "layoutTag") != 6553601)
        {
          LOBYTE(v12) = -[AVAudioChannelLayout layoutTag](v17, "layoutTag") == 6619138;
          return v12;
        }
LABEL_27:
        LOBYTE(v12) = 1;
        return v12;
      }
      if (!layout)
        goto LABEL_27;
      v12 = -[AVAudioChannelLayout isEqual:](layout, "isEqual:");
      if (v12)
        goto LABEL_27;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  AudioFormatID v2;
  UInt32 v3;
  UInt32 v4;
  UInt32 v5;

  v2 = self->_asbd.mFormatID - (int)self->_asbd.mSampleRate + 32 * (int)self->_asbd.mSampleRate;
  v3 = self->_asbd.mBytesPerFrame - v2 + 32 * v2;
  v4 = self->_asbd.mFramesPerPacket - v3 + 32 * v3;
  v5 = self->_asbd.mChannelsPerFrame - v4 + 32 * v4;
  return (int)(self->_asbd.mBitsPerChannel - v5 + 32 * v5 + 887503681);
}

- (BOOL)isStandard
{
  _BOOL4 v2;

  if (self->_commonFormat == 1)
    return (LOBYTE(self->_asbd.mFormatFlags) >> 5) & 1;
  else
    LOBYTE(v2) = 0;
  return v2;
}

- (AVAudioCommonFormat)commonFormat
{
  return self->_commonFormat;
}

- (AVAudioChannelCount)channelCount
{
  return self->_asbd.mChannelsPerFrame;
}

- (double)sampleRate
{
  return self->_asbd.mSampleRate;
}

- (BOOL)isInterleaved
{
  return (self->_asbd.mFormatFlags & 0x20) == 0;
}

- (NSDictionary)settings
{
  return (NSDictionary *)+[AVAudioFormat settingsFromASBD:channelLayout:](AVAudioFormat, "settingsFromASBD:channelLayout:", &self->_asbd, self->_layout);
}

- (void)setMagicCookie:(NSData *)magicCookie
{
  NSData *reserved;

  reserved = (NSData *)self->_reserved;
  if (!reserved)
  {
    if (!magicCookie)
      return;
    reserved = (NSData *)operator new();
    reserved->super.isa = (Class)self;
    reserved[1].super.isa = 0;
    self->_reserved = reserved;
  }
  AVAudioFormatImpl::setMagicCookie(reserved, magicCookie);
}

- (id)description
{
  int16x8_t v3;
  CAStreamBasicDescription v5;
  char v6[128];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *(int16x8_t *)&self->_asbd.mBytesPerPacket;
  *(_OWORD *)&v5.var0 = *(_OWORD *)&self->_asbd.mSampleRate;
  *(int16x8_t *)&v5.var3 = v3;
  *(_QWORD *)&v5.var7 = *(_QWORD *)&self->_asbd.mBitsPerChannel;
  CAStreamBasicDescription::AsString(&v5, v6, 0x80uLL, v5.var0, v3);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<AVAudioFormat %p: %s>"), self, v6);
}

+ (AVAudioFormat)formatWithInvalidSampleRateAndChannelCount
{
  return -[AVAudioFormat initStandardFormatWithSampleRate:channels:]([AVAudioFormat alloc], "initStandardFormatWithSampleRate:channels:", 0, 0.0);
}

+ (id)settingsFromASBD:(const AudioStreamBasicDescription *)a3 channelLayout:(id)a4
{
  id v6;
  uint64_t v7;

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3->mFormatID), CFSTR("AVFormatIDKey"));
  objc_msgSend(v6, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->mSampleRate), CFSTR("AVSampleRateKey"));
  objc_msgSend(v6, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3->mChannelsPerFrame), CFSTR("AVNumberOfChannelsKey"));
  v7 = objc_msgSend(a4, "layoutSize");
  if (v7)
    objc_msgSend(v6, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", objc_msgSend(a4, "layout"), v7), CFSTR("AVChannelLayoutKey"));
  if (a3->mFormatID == 1819304813)
  {
    objc_msgSend(v6, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3->mBitsPerChannel), CFSTR("AVLinearPCMBitDepthKey"));
    objc_msgSend(v6, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3->mFormatFlags & 1), CFSTR("AVLinearPCMIsFloatKey"));
    objc_msgSend(v6, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", ((unint64_t)a3->mFormatFlags >> 1) & 1), CFSTR("AVLinearPCMIsBigEndianKey"));
    objc_msgSend(v6, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", ((unint64_t)a3->mFormatFlags >> 5) & 1), CFSTR("AVLinearPCMIsNonInterleaved"));
  }
  return v6;
}

@end
