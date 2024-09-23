@implementation CTAudioCodecInfo

- (CTAudioCodecInfo)initWithCallId:(unint64_t)a3 codec:(int64_t)a4 amrMode:(unint64_t)a5 evsBandwidth:(int64_t)a6 evsBitrate:(int64_t)a7
{
  return -[CTAudioCodecInfo initWithCallId:codec:amrMode:evsBandwidth:evsBitrate:sampleRate:i2SClockRate:](self, "initWithCallId:codec:amrMode:evsBandwidth:evsBitrate:sampleRate:i2SClockRate:", a3, a4, a5, a6, a7, 0, 0);
}

- (CTAudioCodecInfo)initWithCallId:(unint64_t)a3 codec:(int64_t)a4 amrMode:(unint64_t)a5 evsBandwidth:(int64_t)a6 evsBitrate:(int64_t)a7 sampleRate:(unint64_t)a8 i2SClockRate:(unint64_t)a9
{
  CTAudioCodecInfo *result;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CTAudioCodecInfo;
  result = -[CTAudioCodecInfo init](&v16, sel_init);
  if (result)
  {
    result->_callId = a3;
    result->_codec = a4;
    result->_amrMode = a5;
    result->_evsBandwidth = a6;
    result->_evsBitrate = a7;
    result->_sampleRate = a8;
    result->_i2SClockRate = a9;
  }
  return result;
}

- (CTAudioCodecInfo)init
{
  return -[CTAudioCodecInfo initWithCallId:codec:amrMode:evsBandwidth:evsBitrate:sampleRate:i2SClockRate:](self, "initWithCallId:codec:amrMode:evsBandwidth:evsBitrate:sampleRate:i2SClockRate:", 0, 0, 0, 0, 0, 0, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  const char *v6;
  void *v7;
  int64_t v8;
  const char *v9;
  int64_t v10;
  const char *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTAudioCodecInfo callId](self, "callId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" callId=%@"), v4);

  v5 = -[CTAudioCodecInfo codec](self, "codec");
  if ((unint64_t)(v5 - 1) > 4)
    v6 = "kCTAudioCodecAMR_NB";
  else
    v6 = off_1E152F838[v5 - 1];
  objc_msgSend(v3, "appendFormat:", CFSTR(" codec=%s"), v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTAudioCodecInfo amrMode](self, "amrMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" amrMode=%@"), v7);

  v8 = -[CTAudioCodecInfo evsBandwidth](self, "evsBandwidth");
  if ((unint64_t)(v8 - 1) > 2)
    v9 = "kCTAudioCodecBandwidthEVS_NB";
  else
    v9 = off_1E152F860[v8 - 1];
  objc_msgSend(v3, "appendFormat:", CFSTR(" evsBandwidth=%s"), v9);
  v10 = -[CTAudioCodecInfo evsBitrate](self, "evsBitrate");
  if ((unint64_t)(v10 - 1) > 0xA)
    v11 = "kCTAudioCodecBitrateEVS_5900";
  else
    v11 = off_1E152F878[v10 - 1];
  objc_msgSend(v3, "appendFormat:", CFSTR(" evsBitrate=%s"), v11);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTAudioCodecInfo sampleRate](self, "sampleRate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" sampleRate=%@"), v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTAudioCodecInfo i2SClockRate](self, "i2SClockRate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" i2SClockRate=%@"), v13);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithCallId:codec:amrMode:evsBandwidth:evsBitrate:sampleRate:i2SClockRate:", -[CTAudioCodecInfo callId](self, "callId"), -[CTAudioCodecInfo codec](self, "codec"), -[CTAudioCodecInfo amrMode](self, "amrMode"), -[CTAudioCodecInfo evsBandwidth](self, "evsBandwidth"), -[CTAudioCodecInfo evsBitrate](self, "evsBitrate"), -[CTAudioCodecInfo sampleRate](self, "sampleRate"), -[CTAudioCodecInfo i2SClockRate](self, "i2SClockRate"));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTAudioCodecInfo callId](self, "callId"), CFSTR("callId"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTAudioCodecInfo codec](self, "codec"), CFSTR("codecType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTAudioCodecInfo amrMode](self, "amrMode"), CFSTR("amrMode"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTAudioCodecInfo evsBandwidth](self, "evsBandwidth"), CFSTR("evsBandwidth"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTAudioCodecInfo evsBitrate](self, "evsBitrate"), CFSTR("evsBitrate"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTAudioCodecInfo sampleRate](self, "sampleRate"), CFSTR("sampleRate"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTAudioCodecInfo i2SClockRate](self, "i2SClockRate"), CFSTR("i2SClockRate"));

}

- (CTAudioCodecInfo)initWithCoder:(id)a3
{
  id v4;
  CTAudioCodecInfo *v5;

  v4 = a3;
  v5 = -[CTAudioCodecInfo initWithCallId:codec:amrMode:evsBandwidth:evsBitrate:sampleRate:i2SClockRate:](self, "initWithCallId:codec:amrMode:evsBandwidth:evsBitrate:sampleRate:i2SClockRate:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("callId")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("codecType")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("amrMode")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("evsBandwidth")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("evsBitrate")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sampleRate")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("i2SClockRate")));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)callId
{
  return self->_callId;
}

- (void)setCallId:(unint64_t)a3
{
  self->_callId = a3;
}

- (int64_t)codec
{
  return self->_codec;
}

- (void)setCodec:(int64_t)a3
{
  self->_codec = a3;
}

- (unint64_t)amrMode
{
  return self->_amrMode;
}

- (void)setAmrMode:(unint64_t)a3
{
  self->_amrMode = a3;
}

- (int64_t)evsBandwidth
{
  return self->_evsBandwidth;
}

- (void)setEvsBandwidth:(int64_t)a3
{
  self->_evsBandwidth = a3;
}

- (int64_t)evsBitrate
{
  return self->_evsBitrate;
}

- (void)setEvsBitrate:(int64_t)a3
{
  self->_evsBitrate = a3;
}

- (unint64_t)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(unint64_t)a3
{
  self->_sampleRate = a3;
}

- (unint64_t)i2SClockRate
{
  return self->_i2SClockRate;
}

- (void)setI2SClockRate:(unint64_t)a3
{
  self->_i2SClockRate = a3;
}

@end
