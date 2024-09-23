@implementation VCAudioStreamCodecConfig

- (VCAudioStreamCodecConfig)initWithCodecType:(int64_t)a3
{
  VCAudioStreamCodecConfig *v4;
  VCAudioStreamCodecConfig *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCAudioStreamCodecConfig;
  v4 = -[VCAudioStreamCodecConfig init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_codecType = a3;
    v4->_supportedModes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5->_supportedBandwidths = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5->_networkPayload = 0xFFFF;
    v5->_pTime = 20;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCAudioStreamCodecConfig;
  -[VCAudioStreamCodecConfig dealloc](&v3, sel_dealloc);
}

- (unsigned)networkPayload
{
  if (self->_networkPayload == 0xFFFF)
    return +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", self->_codecType);
  else
    return self->_networkPayload;
}

- (BOOL)isComfortNoise
{
  return self->_codecType == 9;
}

- (void)setupModesWithClientModeMask:(unsigned int)a3
{
  int64_t codecType;

  codecType = self->_codecType;
  if (codecType <= 2)
  {
    if (codecType == 1)
    {
      -[VCAudioStreamCodecConfig setupAMRModesWithClientModeMask:](self, "setupAMRModesWithClientModeMask:", *(_QWORD *)&a3);
    }
    else if (codecType == 2)
    {
      -[VCAudioStreamCodecConfig setupAMRWBModesWithClientModeMask:](self, "setupAMRWBModesWithClientModeMask:", *(_QWORD *)&a3);
    }
  }
  else if ((unint64_t)(codecType - 3) < 2 || codecType == 17)
  {
    -[VCAudioStreamCodecConfig setupEVSModesWithClientModeMask:](self, "setupEVSModesWithClientModeMask:", *(_QWORD *)&a3);
  }
}

- (void)setupCodecBandwidthsWithClientBandwidthMask:(unsigned int)a3
{
  char v3;
  int64_t codecType;
  NSMutableArray *supportedBandwidths;
  uint64_t v7;
  void *v8;

  v3 = a3;
  codecType = self->_codecType;
  if (codecType == 4)
  {
    -[NSMutableArray removeAllObjects](self->_supportedBandwidths, "removeAllObjects");
    if ((v3 & 1) != 0)
    {
      -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedBandwidths, "setObject:atIndexedSubscript:", &unk_1E9EF3890, -[NSMutableArray count](self->_supportedBandwidths, "count"));
      if ((v3 & 2) == 0)
      {
LABEL_9:
        if ((v3 & 4) == 0)
          return;
        goto LABEL_13;
      }
    }
    else if ((v3 & 2) == 0)
    {
      goto LABEL_9;
    }
    -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedBandwidths, "setObject:atIndexedSubscript:", &unk_1E9EF38A8, -[NSMutableArray count](self->_supportedBandwidths, "count"));
    if ((v3 & 4) == 0)
      return;
LABEL_13:
    supportedBandwidths = self->_supportedBandwidths;
    v7 = -[NSMutableArray count](supportedBandwidths, "count");
    v8 = &unk_1E9EF38C0;
    goto LABEL_14;
  }
  if (codecType == 3)
  {
    -[NSMutableArray removeAllObjects](self->_supportedBandwidths, "removeAllObjects");
    if ((v3 & 1) != 0)
      -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedBandwidths, "setObject:atIndexedSubscript:", &unk_1E9EF3890, -[NSMutableArray count](self->_supportedBandwidths, "count"));
    if ((v3 & 2) != 0)
    {
      supportedBandwidths = self->_supportedBandwidths;
      v7 = -[NSMutableArray count](supportedBandwidths, "count");
      v8 = &unk_1E9EF38A8;
LABEL_14:
      -[NSMutableArray setObject:atIndexedSubscript:](supportedBandwidths, "setObject:atIndexedSubscript:", v8, v7);
    }
  }
}

- (void)setPreferredModeWithClientMode:(int)a3
{
  self->_preferredMode = a3;
}

- (void)setupAMRModesWithClientModeMask:(unsigned int)a3
{
  char v3;

  v3 = a3;
  -[NSMutableArray removeAllObjects](self->_supportedModes, "removeAllObjects");
  if ((v3 & 1) != 0)
  {
    -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF3890, -[NSMutableArray count](self->_supportedModes, "count"));
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF38A8, -[NSMutableArray count](self->_supportedModes, "count"));
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF38C0, -[NSMutableArray count](self->_supportedModes, "count"));
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF38D8, -[NSMutableArray count](self->_supportedModes, "count"));
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF38F0, -[NSMutableArray count](self->_supportedModes, "count"));
  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF3908, -[NSMutableArray count](self->_supportedModes, "count"));
  if ((v3 & 0x40) == 0)
  {
LABEL_8:
    if ((v3 & 0x80) == 0)
      return;
LABEL_17:
    -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF3938, -[NSMutableArray count](self->_supportedModes, "count"));
    return;
  }
LABEL_16:
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF3920, -[NSMutableArray count](self->_supportedModes, "count"));
  if (v3 < 0)
    goto LABEL_17;
}

- (void)setupAMRWBModesWithClientModeMask:(unsigned int)a3
{
  __int16 v3;

  v3 = a3;
  -[NSMutableArray removeAllObjects](self->_supportedModes, "removeAllObjects");
  if ((v3 & 1) != 0)
  {
    -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF3890, -[NSMutableArray count](self->_supportedModes, "count"));
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF38A8, -[NSMutableArray count](self->_supportedModes, "count"));
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF38C0, -[NSMutableArray count](self->_supportedModes, "count"));
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF38D8, -[NSMutableArray count](self->_supportedModes, "count"));
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF38F0, -[NSMutableArray count](self->_supportedModes, "count"));
  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF3908, -[NSMutableArray count](self->_supportedModes, "count"));
  if ((v3 & 0x40) == 0)
  {
LABEL_8:
    if ((v3 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF3920, -[NSMutableArray count](self->_supportedModes, "count"));
  if ((v3 & 0x80) == 0)
  {
LABEL_9:
    if ((v3 & 0x100) == 0)
      return;
LABEL_19:
    -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF3950, -[NSMutableArray count](self->_supportedModes, "count"));
    return;
  }
LABEL_18:
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF3938, -[NSMutableArray count](self->_supportedModes, "count"));
  if ((v3 & 0x100) != 0)
    goto LABEL_19;
}

- (void)setupEVSModesWithClientModeMask:(unsigned int)a3
{
  -[VCAudioStreamCodecConfig setupAMRWBModesWithClientModeMask:](self, "setupAMRWBModesWithClientModeMask:");
  if ((a3 & 0x400) != 0)
  {
    -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF3968, -[NSMutableArray count](self->_supportedModes, "count"));
    if ((a3 & 0x800) == 0)
    {
LABEL_3:
      if ((a3 & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((a3 & 0x800) == 0)
  {
    goto LABEL_3;
  }
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF3980, -[NSMutableArray count](self->_supportedModes, "count"));
  if ((a3 & 0x1000) == 0)
  {
LABEL_4:
    if ((a3 & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF3998, -[NSMutableArray count](self->_supportedModes, "count"));
  if ((a3 & 0x2000) == 0)
  {
LABEL_5:
    if ((a3 & 0x4000) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF39B0, -[NSMutableArray count](self->_supportedModes, "count"));
  if ((a3 & 0x4000) == 0)
  {
LABEL_6:
    if ((a3 & 0x8000) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF39C8, -[NSMutableArray count](self->_supportedModes, "count"));
  if ((a3 & 0x8000) == 0)
  {
LABEL_7:
    if ((a3 & 0x10000) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF39E0, -[NSMutableArray count](self->_supportedModes, "count"));
  if ((a3 & 0x10000) == 0)
  {
LABEL_8:
    if ((a3 & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF39F8, -[NSMutableArray count](self->_supportedModes, "count"));
  if ((a3 & 0x20000) == 0)
  {
LABEL_9:
    if ((a3 & 0x40000) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF3A10, -[NSMutableArray count](self->_supportedModes, "count"));
  if ((a3 & 0x40000) == 0)
  {
LABEL_10:
    if ((a3 & 0x80000) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF3A28, -[NSMutableArray count](self->_supportedModes, "count"));
  if ((a3 & 0x80000) == 0)
  {
LABEL_11:
    if ((a3 & 0x100000) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF3A40, -[NSMutableArray count](self->_supportedModes, "count"));
  if ((a3 & 0x100000) == 0)
  {
LABEL_12:
    if ((a3 & 0x200000) == 0)
      return;
LABEL_25:
    -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF3A70, -[NSMutableArray count](self->_supportedModes, "count"));
    return;
  }
LABEL_24:
  -[NSMutableArray setObject:atIndexedSubscript:](self->_supportedModes, "setObject:atIndexedSubscript:", &unk_1E9EF3A58, -[NSMutableArray count](self->_supportedModes, "count"));
  if ((a3 & 0x200000) != 0)
    goto LABEL_25;
}

- (int64_t)codecType
{
  return self->_codecType;
}

- (BOOL)isDTXEnabled
{
  return self->_dtxEnabled;
}

- (void)setDtxEnabled:(BOOL)a3
{
  self->_dtxEnabled = a3;
}

- (int)preferredMode
{
  return self->_preferredMode;
}

- (void)setPreferredMode:(int)a3
{
  self->_preferredMode = a3;
}

- (NSArray)supportedModes
{
  return &self->_supportedModes->super;
}

- (void)setSupportedModes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSArray)supportedBandwidths
{
  return &self->_supportedBandwidths->super;
}

- (void)setSupportedBandwidths:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (BOOL)isOctetAligned
{
  return self->_octetAligned;
}

- (void)setOctetAligned:(BOOL)a3
{
  self->_octetAligned = a3;
}

- (BOOL)isDTMF
{
  return self->_dtmf;
}

- (void)setDtmf:(BOOL)a3
{
  self->_dtmf = a3;
}

- (void)setNetworkPayload:(unsigned int)a3
{
  self->_networkPayload = a3;
}

- (unsigned)evsChannelAwareOffset
{
  return self->_evsChannelAwareOffset;
}

- (void)setEvsChannelAwareOffset:(unsigned __int16)a3
{
  self->_evsChannelAwareOffset = a3;
}

- (BOOL)evsHeaderFullOnly
{
  return self->_evsHeaderFullOnly;
}

- (void)setEvsHeaderFullOnly:(BOOL)a3
{
  self->_evsHeaderFullOnly = a3;
}

- (unint64_t)pTime
{
  return self->_pTime;
}

- (void)setPTime:(unint64_t)a3
{
  self->_pTime = a3;
}

- (int)evsCMRMode
{
  return self->_evsCMRMode;
}

- (void)setEvsCMRMode:(int)a3
{
  self->_evsCMRMode = a3;
}

- (BOOL)isOpusInBandFecEnabled
{
  return self->_isOpusInBandFecEnabled;
}

- (void)setIsOpusInBandFecEnabled:(BOOL)a3
{
  self->_isOpusInBandFecEnabled = a3;
}

@end
