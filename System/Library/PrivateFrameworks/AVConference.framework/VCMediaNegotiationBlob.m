@implementation VCMediaNegotiationBlob

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCMediaNegotiationBlob setAudioSettings:](self, "setAudioSettings:", 0);
  -[VCMediaNegotiationBlob setVideoSettings:](self, "setVideoSettings:", 0);
  -[VCMediaNegotiationBlob setScreenSettings:](self, "setScreenSettings:", 0);
  -[VCMediaNegotiationBlob setUserAgent:](self, "setUserAgent:", 0);
  -[VCMediaNegotiationBlob setBasebandCodec:](self, "setBasebandCodec:", 0);
  -[VCMediaNegotiationBlob setBandwidthSettings:](self, "setBandwidthSettings:", 0);
  -[VCMediaNegotiationBlob setCaptionsSettings:](self, "setCaptionsSettings:", 0);
  -[VCMediaNegotiationBlob setMultiwayAudioStreams:](self, "setMultiwayAudioStreams:", 0);
  -[VCMediaNegotiationBlob setMomentsSettings:](self, "setMomentsSettings:", 0);
  -[VCMediaNegotiationBlob setMultiwayVideoStreams:](self, "setMultiwayVideoStreams:", 0);
  -[VCMediaNegotiationBlob setFaceTimeSettings:](self, "setFaceTimeSettings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlob;
  -[VCMediaNegotiationBlob dealloc](&v3, sel_dealloc);
}

- (void)setAllowDynamicMaxBitrate:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_allowDynamicMaxBitrate = a3;
}

- (void)setHasAllowDynamicMaxBitrate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasAllowDynamicMaxBitrate
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setAllowsContentsChangeWithAspectPreservation:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_allowsContentsChangeWithAspectPreservation = a3;
}

- (void)setHasAllowsContentsChangeWithAspectPreservation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasAllowsContentsChangeWithAspectPreservation
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasAudioSettings
{
  return self->_audioSettings != 0;
}

- (BOOL)hasVideoSettings
{
  return self->_videoSettings != 0;
}

- (BOOL)hasScreenSettings
{
  return self->_screenSettings != 0;
}

- (BOOL)hasUserAgent
{
  return self->_userAgent != 0;
}

- (BOOL)hasBasebandCodec
{
  return self->_basebandCodec != 0;
}

- (void)setBasebandCodecSampleRate:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_basebandCodecSampleRate = a3;
}

- (void)setHasBasebandCodecSampleRate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasBasebandCodecSampleRate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)clearBandwidthSettings
{
  -[NSMutableArray removeAllObjects](self->_bandwidthSettings, "removeAllObjects");
}

- (void)addBandwidthSettings:(id)a3
{
  NSMutableArray *bandwidthSettings;

  bandwidthSettings = self->_bandwidthSettings;
  if (!bandwidthSettings)
  {
    bandwidthSettings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_bandwidthSettings = bandwidthSettings;
  }
  -[NSMutableArray addObject:](bandwidthSettings, "addObject:", a3);
}

- (unint64_t)bandwidthSettingsCount
{
  return -[NSMutableArray count](self->_bandwidthSettings, "count");
}

- (id)bandwidthSettingsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_bandwidthSettings, "objectAtIndex:", a3);
}

+ (Class)bandwidthSettingsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCaptionsSettings
{
  return self->_captionsSettings != 0;
}

- (void)clearMultiwayAudioStreams
{
  -[NSMutableArray removeAllObjects](self->_multiwayAudioStreams, "removeAllObjects");
}

- (void)addMultiwayAudioStreams:(id)a3
{
  NSMutableArray *multiwayAudioStreams;

  multiwayAudioStreams = self->_multiwayAudioStreams;
  if (!multiwayAudioStreams)
  {
    multiwayAudioStreams = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_multiwayAudioStreams = multiwayAudioStreams;
  }
  -[NSMutableArray addObject:](multiwayAudioStreams, "addObject:", a3);
}

- (unint64_t)multiwayAudioStreamsCount
{
  return -[NSMutableArray count](self->_multiwayAudioStreams, "count");
}

- (id)multiwayAudioStreamsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_multiwayAudioStreams, "objectAtIndex:", a3);
}

+ (Class)multiwayAudioStreamsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMomentsSettings
{
  return self->_momentsSettings != 0;
}

- (void)setNtpTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ntpTime = a3;
}

- (void)setHasNtpTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNtpTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setBlobVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_blobVersion = a3;
}

- (void)setHasBlobVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBlobVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)clearMultiwayVideoStreams
{
  -[NSMutableArray removeAllObjects](self->_multiwayVideoStreams, "removeAllObjects");
}

- (void)addMultiwayVideoStream:(id)a3
{
  NSMutableArray *multiwayVideoStreams;

  multiwayVideoStreams = self->_multiwayVideoStreams;
  if (!multiwayVideoStreams)
  {
    multiwayVideoStreams = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_multiwayVideoStreams = multiwayVideoStreams;
  }
  -[NSMutableArray addObject:](multiwayVideoStreams, "addObject:", a3);
}

- (unint64_t)multiwayVideoStreamsCount
{
  return -[NSMutableArray count](self->_multiwayVideoStreams, "count");
}

- (id)multiwayVideoStreamAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_multiwayVideoStreams, "objectAtIndex:", a3);
}

+ (Class)multiwayVideoStreamType
{
  return (Class)objc_opt_class();
}

- (unsigned)mediaControlInfoVersion
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_mediaControlInfoVersion;
  else
    return 1;
}

- (void)setMediaControlInfoVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_mediaControlInfoVersion = a3;
}

- (void)setHasMediaControlInfoVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMediaControlInfoVersion
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasFaceTimeSettings
{
  return self->_faceTimeSettings != 0;
}

- (unsigned)accessNetworkType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_accessNetworkType;
  else
    return 0;
}

- (void)setAccessNetworkType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_accessNetworkType = a3;
}

- (void)setHasAccessNetworkType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAccessNetworkType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlob;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationBlob description](&v3, sel_description), -[VCMediaNegotiationBlob dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  VCMediaNegotiationBlobAudioSettings *audioSettings;
  VCMediaNegotiationBlobVideoSettings *videoSettings;
  VCMediaNegotiationBlobVideoSettings *screenSettings;
  NSString *userAgent;
  NSString *basebandCodec;
  void *v10;
  NSMutableArray *bandwidthSettings;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  VCMediaNegotiationBlobCaptionsSettings *captionsSettings;
  void *v17;
  NSMutableArray *multiwayAudioStreams;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  VCMediaNegotiationBlobMomentsSettings *momentsSettings;
  char v24;
  void *v25;
  NSMutableArray *multiwayVideoStreams;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  VCMediaNegotiationFaceTimeSettings *faceTimeSettings;
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowDynamicMaxBitrate), CFSTR("allowDynamicMaxBitrate"));
    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowsContentsChangeWithAspectPreservation), CFSTR("allowsContentsChangeWithAspectPreservation"));
  audioSettings = self->_audioSettings;
  if (audioSettings)
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobAudioSettings dictionaryRepresentation](audioSettings, "dictionaryRepresentation"), CFSTR("audioSettings"));
  videoSettings = self->_videoSettings;
  if (videoSettings)
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobVideoSettings dictionaryRepresentation](videoSettings, "dictionaryRepresentation"), CFSTR("videoSettings"));
  screenSettings = self->_screenSettings;
  if (screenSettings)
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobVideoSettings dictionaryRepresentation](screenSettings, "dictionaryRepresentation"), CFSTR("screenSettings"));
  userAgent = self->_userAgent;
  if (userAgent)
    objc_msgSend(v3, "setObject:forKey:", userAgent, CFSTR("userAgent"));
  basebandCodec = self->_basebandCodec;
  if (basebandCodec)
    objc_msgSend(v3, "setObject:forKey:", basebandCodec, CFSTR("basebandCodec"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_basebandCodecSampleRate), CFSTR("basebandCodecSampleRate"));
  if (-[NSMutableArray count](self->_bandwidthSettings, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_bandwidthSettings, "count"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    bandwidthSettings = self->_bandwidthSettings;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bandwidthSettings, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v45 != v14)
            objc_enumerationMutation(bandwidthSettings);
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bandwidthSettings, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
      }
      while (v13);
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("bandwidthSettings"));

  }
  captionsSettings = self->_captionsSettings;
  if (captionsSettings)
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobCaptionsSettings dictionaryRepresentation](captionsSettings, "dictionaryRepresentation"), CFSTR("captionsSettings"));
  if (-[NSMutableArray count](self->_multiwayAudioStreams, "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_multiwayAudioStreams, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    multiwayAudioStreams = self->_multiwayAudioStreams;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](multiwayAudioStreams, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v40 != v21)
            objc_enumerationMutation(multiwayAudioStreams);
          objc_msgSend(v17, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](multiwayAudioStreams, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
      }
      while (v20);
    }
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("multiwayAudioStreams"));

  }
  momentsSettings = self->_momentsSettings;
  if (momentsSettings)
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobMomentsSettings dictionaryRepresentation](momentsSettings, "dictionaryRepresentation"), CFSTR("momentsSettings"));
  v24 = (char)self->_has;
  if ((v24 & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_ntpTime), CFSTR("ntpTime"));
    v24 = (char)self->_has;
  }
  if ((v24 & 8) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_blobVersion), CFSTR("blobVersion"));
  if (-[NSMutableArray count](self->_multiwayVideoStreams, "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_multiwayVideoStreams, "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    multiwayVideoStreams = self->_multiwayVideoStreams;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](multiwayVideoStreams, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v35;
      do
      {
        for (k = 0; k != v28; ++k)
        {
          if (*(_QWORD *)v35 != v29)
            objc_enumerationMutation(multiwayVideoStreams);
          objc_msgSend(v25, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * k), "dictionaryRepresentation"));
        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](multiwayVideoStreams, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
      }
      while (v28);
    }
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("multiwayVideoStream"));

  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_mediaControlInfoVersion), CFSTR("mediaControlInfoVersion"));
  faceTimeSettings = self->_faceTimeSettings;
  if (faceTimeSettings)
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationFaceTimeSettings dictionaryRepresentation](faceTimeSettings, "dictionaryRepresentation"), CFSTR("faceTimeSettings"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_accessNetworkType), CFSTR("accessNetworkType"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *bandwidthSettings;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *multiwayAudioStreams;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  char v15;
  NSMutableArray *multiwayVideoStreams;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_audioSettings)
    PBDataWriterWriteSubmessage();
  if (self->_videoSettings)
    PBDataWriterWriteSubmessage();
  if (self->_screenSettings)
    PBDataWriterWriteSubmessage();
  if (self->_userAgent)
    PBDataWriterWriteStringField();
  if (self->_basebandCodec)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint32Field();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  bandwidthSettings = self->_bandwidthSettings;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bandwidthSettings, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(bandwidthSettings);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bandwidthSettings, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
    }
    while (v7);
  }
  if (self->_captionsSettings)
    PBDataWriterWriteSubmessage();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  multiwayAudioStreams = self->_multiwayAudioStreams;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](multiwayAudioStreams, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(multiwayAudioStreams);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](multiwayAudioStreams, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
    }
    while (v12);
  }
  if (self->_momentsSettings)
    PBDataWriterWriteSubmessage();
  v15 = (char)self->_has;
  if ((v15 & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v15 = (char)self->_has;
  }
  if ((v15 & 8) != 0)
    PBDataWriterWriteUint32Field();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  multiwayVideoStreams = self->_multiwayVideoStreams;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](multiwayVideoStreams, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(multiwayVideoStreams);
        PBDataWriterWriteSubmessage();
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](multiwayVideoStreams, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
    }
    while (v18);
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_faceTimeSettings)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  char v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_BYTE *)a3 + 128) = self->_allowDynamicMaxBitrate;
    *((_BYTE *)a3 + 132) |= 0x20u;
    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    *((_BYTE *)a3 + 129) = self->_allowsContentsChangeWithAspectPreservation;
    *((_BYTE *)a3 + 132) |= 0x40u;
  }
  if (self->_audioSettings)
    objc_msgSend(a3, "setAudioSettings:");
  if (self->_videoSettings)
    objc_msgSend(a3, "setVideoSettings:");
  if (self->_screenSettings)
    objc_msgSend(a3, "setScreenSettings:");
  if (self->_userAgent)
    objc_msgSend(a3, "setUserAgent:");
  if (self->_basebandCodec)
    objc_msgSend(a3, "setBasebandCodec:");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_basebandCodecSampleRate;
    *((_BYTE *)a3 + 132) |= 4u;
  }
  if (-[VCMediaNegotiationBlob bandwidthSettingsCount](self, "bandwidthSettingsCount"))
  {
    objc_msgSend(a3, "clearBandwidthSettings");
    v6 = -[VCMediaNegotiationBlob bandwidthSettingsCount](self, "bandwidthSettingsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addBandwidthSettings:", -[VCMediaNegotiationBlob bandwidthSettingsAtIndex:](self, "bandwidthSettingsAtIndex:", i));
    }
  }
  if (self->_captionsSettings)
    objc_msgSend(a3, "setCaptionsSettings:");
  if (-[VCMediaNegotiationBlob multiwayAudioStreamsCount](self, "multiwayAudioStreamsCount"))
  {
    objc_msgSend(a3, "clearMultiwayAudioStreams");
    v9 = -[VCMediaNegotiationBlob multiwayAudioStreamsCount](self, "multiwayAudioStreamsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(a3, "addMultiwayAudioStreams:", -[VCMediaNegotiationBlob multiwayAudioStreamsAtIndex:](self, "multiwayAudioStreamsAtIndex:", j));
    }
  }
  if (self->_momentsSettings)
    objc_msgSend(a3, "setMomentsSettings:");
  v12 = (char)self->_has;
  if ((v12 & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_ntpTime;
    *((_BYTE *)a3 + 132) |= 1u;
    v12 = (char)self->_has;
  }
  if ((v12 & 8) != 0)
  {
    *((_DWORD *)a3 + 13) = self->_blobVersion;
    *((_BYTE *)a3 + 132) |= 8u;
  }
  if (-[VCMediaNegotiationBlob multiwayVideoStreamsCount](self, "multiwayVideoStreamsCount"))
  {
    objc_msgSend(a3, "clearMultiwayVideoStreams");
    v13 = -[VCMediaNegotiationBlob multiwayVideoStreamsCount](self, "multiwayVideoStreamsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
        objc_msgSend(a3, "addMultiwayVideoStream:", -[VCMediaNegotiationBlob multiwayVideoStreamAtIndex:](self, "multiwayVideoStreamAtIndex:", k));
    }
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 18) = self->_mediaControlInfoVersion;
    *((_BYTE *)a3 + 132) |= 0x10u;
  }
  if (self->_faceTimeSettings)
    objc_msgSend(a3, "setFaceTimeSettings:");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_accessNetworkType;
    *((_BYTE *)a3 + 132) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  NSMutableArray *bandwidthSettings;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *multiwayAudioStreams;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  char v20;
  NSMutableArray *multiwayVideoStreams;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 128) = self->_allowDynamicMaxBitrate;
    *(_BYTE *)(v5 + 132) |= 0x20u;
    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 129) = self->_allowsContentsChangeWithAspectPreservation;
    *(_BYTE *)(v5 + 132) |= 0x40u;
  }

  *(_QWORD *)(v6 + 24) = -[VCMediaNegotiationBlobAudioSettings copyWithZone:](self->_audioSettings, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 120) = -[VCMediaNegotiationBlobVideoSettings copyWithZone:](self->_videoSettings, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 104) = -[VCMediaNegotiationBlobVideoSettings copyWithZone:](self->_screenSettings, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 112) = -[NSString copyWithZone:](self->_userAgent, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_basebandCodec, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_basebandCodecSampleRate;
    *(_BYTE *)(v6 + 132) |= 4u;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  bandwidthSettings = self->_bandwidthSettings;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bandwidthSettings, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(bandwidthSettings);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addBandwidthSettings:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bandwidthSettings, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
    }
    while (v10);
  }

  *(_QWORD *)(v6 + 56) = -[VCMediaNegotiationBlobCaptionsSettings copyWithZone:](self->_captionsSettings, "copyWithZone:", a3);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  multiwayAudioStreams = self->_multiwayAudioStreams;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](multiwayAudioStreams, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(multiwayAudioStreams);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMultiwayAudioStreams:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](multiwayAudioStreams, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
    }
    while (v16);
  }

  *(_QWORD *)(v6 + 80) = -[VCMediaNegotiationBlobMomentsSettings copyWithZone:](self->_momentsSettings, "copyWithZone:", a3);
  v20 = (char)self->_has;
  if ((v20 & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_ntpTime;
    *(_BYTE *)(v6 + 132) |= 1u;
    v20 = (char)self->_has;
  }
  if ((v20 & 8) != 0)
  {
    *(_DWORD *)(v6 + 52) = self->_blobVersion;
    *(_BYTE *)(v6 + 132) |= 8u;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  multiwayVideoStreams = self->_multiwayVideoStreams;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](multiwayVideoStreams, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v30;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(multiwayVideoStreams);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMultiwayVideoStream:", v26);

      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](multiwayVideoStreams, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
    }
    while (v23);
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_mediaControlInfoVersion;
    *(_BYTE *)(v6 + 132) |= 0x10u;
  }

  *(_QWORD *)(v6 + 64) = -[VCMediaNegotiationFaceTimeSettings copyWithZone:](self->_faceTimeSettings, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_accessNetworkType;
    *(_BYTE *)(v6 + 132) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  VCMediaNegotiationBlobAudioSettings *audioSettings;
  VCMediaNegotiationBlobVideoSettings *videoSettings;
  VCMediaNegotiationBlobVideoSettings *screenSettings;
  NSString *userAgent;
  NSString *basebandCodec;
  NSMutableArray *bandwidthSettings;
  VCMediaNegotiationBlobCaptionsSettings *captionsSettings;
  NSMutableArray *multiwayAudioStreams;
  VCMediaNegotiationBlobMomentsSettings *momentsSettings;
  char has;
  NSMutableArray *multiwayVideoStreams;
  VCMediaNegotiationFaceTimeSettings *faceTimeSettings;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)a3 + 132) & 0x20) == 0)
      goto LABEL_14;
    if (self->_allowDynamicMaxBitrate)
    {
      if (!*((_BYTE *)a3 + 128))
        goto LABEL_14;
    }
    else if (*((_BYTE *)a3 + 128))
    {
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)a3 + 132) & 0x20) != 0)
  {
    goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)a3 + 132) & 0x40) == 0)
      goto LABEL_14;
    if (self->_allowsContentsChangeWithAspectPreservation)
    {
      if (!*((_BYTE *)a3 + 129))
        goto LABEL_14;
    }
    else if (*((_BYTE *)a3 + 129))
    {
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)a3 + 132) & 0x40) != 0)
  {
    goto LABEL_14;
  }
  audioSettings = self->_audioSettings;
  if ((unint64_t)audioSettings | *((_QWORD *)a3 + 3))
  {
    v5 = -[VCMediaNegotiationBlobAudioSettings isEqual:](audioSettings, "isEqual:");
    if (!v5)
      return v5;
  }
  videoSettings = self->_videoSettings;
  if ((unint64_t)videoSettings | *((_QWORD *)a3 + 15))
  {
    v5 = -[VCMediaNegotiationBlobVideoSettings isEqual:](videoSettings, "isEqual:");
    if (!v5)
      return v5;
  }
  screenSettings = self->_screenSettings;
  if ((unint64_t)screenSettings | *((_QWORD *)a3 + 13))
  {
    v5 = -[VCMediaNegotiationBlobVideoSettings isEqual:](screenSettings, "isEqual:");
    if (!v5)
      return v5;
  }
  userAgent = self->_userAgent;
  if ((unint64_t)userAgent | *((_QWORD *)a3 + 14))
  {
    v5 = -[NSString isEqual:](userAgent, "isEqual:");
    if (!v5)
      return v5;
  }
  basebandCodec = self->_basebandCodec;
  if ((unint64_t)basebandCodec | *((_QWORD *)a3 + 5))
  {
    v5 = -[NSString isEqual:](basebandCodec, "isEqual:");
    if (!v5)
      return v5;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 132) & 4) == 0 || self->_basebandCodecSampleRate != *((_DWORD *)a3 + 12))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)a3 + 132) & 4) != 0)
  {
    goto LABEL_14;
  }
  bandwidthSettings = self->_bandwidthSettings;
  if ((unint64_t)bandwidthSettings | *((_QWORD *)a3 + 4))
  {
    v5 = -[NSMutableArray isEqual:](bandwidthSettings, "isEqual:");
    if (!v5)
      return v5;
  }
  captionsSettings = self->_captionsSettings;
  if ((unint64_t)captionsSettings | *((_QWORD *)a3 + 7))
  {
    v5 = -[VCMediaNegotiationBlobCaptionsSettings isEqual:](captionsSettings, "isEqual:");
    if (!v5)
      return v5;
  }
  multiwayAudioStreams = self->_multiwayAudioStreams;
  if ((unint64_t)multiwayAudioStreams | *((_QWORD *)a3 + 11))
  {
    v5 = -[NSMutableArray isEqual:](multiwayAudioStreams, "isEqual:");
    if (!v5)
      return v5;
  }
  momentsSettings = self->_momentsSettings;
  if ((unint64_t)momentsSettings | *((_QWORD *)a3 + 10))
  {
    v5 = -[VCMediaNegotiationBlobMomentsSettings isEqual:](momentsSettings, "isEqual:");
    if (!v5)
      return v5;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 132) & 1) == 0 || self->_ntpTime != *((_QWORD *)a3 + 1))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)a3 + 132) & 1) != 0)
  {
    goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 132) & 8) == 0 || self->_blobVersion != *((_DWORD *)a3 + 13))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)a3 + 132) & 8) != 0)
  {
    goto LABEL_14;
  }
  multiwayVideoStreams = self->_multiwayVideoStreams;
  if ((unint64_t)multiwayVideoStreams | *((_QWORD *)a3 + 12))
  {
    v5 = -[NSMutableArray isEqual:](multiwayVideoStreams, "isEqual:");
    if (!v5)
      return v5;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)a3 + 132) & 0x10) == 0 || self->_mediaControlInfoVersion != *((_DWORD *)a3 + 18))
      goto LABEL_14;
    goto LABEL_61;
  }
  if ((*((_BYTE *)a3 + 132) & 0x10) != 0)
  {
LABEL_14:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_61:
  faceTimeSettings = self->_faceTimeSettings;
  if ((unint64_t)faceTimeSettings | *((_QWORD *)a3 + 8))
  {
    v5 = -[VCMediaNegotiationFaceTimeSettings isEqual:](faceTimeSettings, "isEqual:");
    if (!v5)
      return v5;
    has = (char)self->_has;
  }
  LOBYTE(v5) = (*((_BYTE *)a3 + 132) & 2) == 0;
  if ((has & 2) == 0)
    return v5;
  if ((*((_BYTE *)a3 + 132) & 2) == 0 || self->_accessNetworkType != *((_DWORD *)a3 + 4))
    goto LABEL_14;
  LOBYTE(v5) = 1;
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v21 = 2654435761 * self->_allowDynamicMaxBitrate;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_3;
  }
  else
  {
    v21 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
LABEL_3:
      v20 = 2654435761 * self->_allowsContentsChangeWithAspectPreservation;
      goto LABEL_6;
    }
  }
  v20 = 0;
LABEL_6:
  v19 = -[VCMediaNegotiationBlobAudioSettings hash](self->_audioSettings, "hash");
  v18 = -[VCMediaNegotiationBlobVideoSettings hash](self->_videoSettings, "hash");
  v17 = -[VCMediaNegotiationBlobVideoSettings hash](self->_screenSettings, "hash");
  v16 = -[NSString hash](self->_userAgent, "hash");
  v15 = -[NSString hash](self->_basebandCodec, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v14 = 2654435761 * self->_basebandCodecSampleRate;
  else
    v14 = 0;
  v13 = -[NSMutableArray hash](self->_bandwidthSettings, "hash");
  v3 = -[VCMediaNegotiationBlobCaptionsSettings hash](self->_captionsSettings, "hash");
  v4 = -[NSMutableArray hash](self->_multiwayAudioStreams, "hash");
  v5 = -[VCMediaNegotiationBlobMomentsSettings hash](self->_momentsSettings, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = 2654435761u * self->_ntpTime;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_11;
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_11:
      v7 = 2654435761 * self->_blobVersion;
      goto LABEL_14;
    }
  }
  v7 = 0;
LABEL_14:
  v8 = -[NSMutableArray hash](self->_multiwayVideoStreams, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v9 = 2654435761 * self->_mediaControlInfoVersion;
  else
    v9 = 0;
  v10 = -[VCMediaNegotiationFaceTimeSettings hash](self->_faceTimeSettings, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v11 = 2654435761 * self->_accessNetworkType;
  else
    v11 = 0;
  return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  char v5;
  VCMediaNegotiationBlobAudioSettings *audioSettings;
  uint64_t v7;
  VCMediaNegotiationBlobVideoSettings *videoSettings;
  uint64_t v9;
  VCMediaNegotiationBlobVideoSettings *screenSettings;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  VCMediaNegotiationBlobCaptionsSettings *captionsSettings;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  VCMediaNegotiationBlobMomentsSettings *momentsSettings;
  uint64_t v25;
  char v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  VCMediaNegotiationFaceTimeSettings *faceTimeSettings;
  uint64_t v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = *((_BYTE *)a3 + 132);
  if ((v5 & 0x20) != 0)
  {
    self->_allowDynamicMaxBitrate = *((_BYTE *)a3 + 128);
    *(_BYTE *)&self->_has |= 0x20u;
    v5 = *((_BYTE *)a3 + 132);
  }
  if ((v5 & 0x40) != 0)
  {
    self->_allowsContentsChangeWithAspectPreservation = *((_BYTE *)a3 + 129);
    *(_BYTE *)&self->_has |= 0x40u;
  }
  audioSettings = self->_audioSettings;
  v7 = *((_QWORD *)a3 + 3);
  if (audioSettings)
  {
    if (v7)
      -[VCMediaNegotiationBlobAudioSettings mergeFrom:](audioSettings, "mergeFrom:");
  }
  else if (v7)
  {
    -[VCMediaNegotiationBlob setAudioSettings:](self, "setAudioSettings:");
  }
  videoSettings = self->_videoSettings;
  v9 = *((_QWORD *)a3 + 15);
  if (videoSettings)
  {
    if (v9)
      -[VCMediaNegotiationBlobVideoSettings mergeFrom:](videoSettings, "mergeFrom:");
  }
  else if (v9)
  {
    -[VCMediaNegotiationBlob setVideoSettings:](self, "setVideoSettings:");
  }
  screenSettings = self->_screenSettings;
  v11 = *((_QWORD *)a3 + 13);
  if (screenSettings)
  {
    if (v11)
      -[VCMediaNegotiationBlobVideoSettings mergeFrom:](screenSettings, "mergeFrom:");
  }
  else if (v11)
  {
    -[VCMediaNegotiationBlob setScreenSettings:](self, "setScreenSettings:");
  }
  if (*((_QWORD *)a3 + 14))
    -[VCMediaNegotiationBlob setUserAgent:](self, "setUserAgent:");
  if (*((_QWORD *)a3 + 5))
    -[VCMediaNegotiationBlob setBasebandCodec:](self, "setBasebandCodec:");
  if ((*((_BYTE *)a3 + 132) & 4) != 0)
  {
    self->_basebandCodecSampleRate = *((_DWORD *)a3 + 12);
    *(_BYTE *)&self->_has |= 4u;
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v12 = (void *)*((_QWORD *)a3 + 4);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v46 != v15)
          objc_enumerationMutation(v12);
        -[VCMediaNegotiationBlob addBandwidthSettings:](self, "addBandwidthSettings:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
    }
    while (v14);
  }
  captionsSettings = self->_captionsSettings;
  v18 = *((_QWORD *)a3 + 7);
  if (captionsSettings)
  {
    if (v18)
      -[VCMediaNegotiationBlobCaptionsSettings mergeFrom:](captionsSettings, "mergeFrom:");
  }
  else if (v18)
  {
    -[VCMediaNegotiationBlob setCaptionsSettings:](self, "setCaptionsSettings:");
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v19 = (void *)*((_QWORD *)a3 + 11);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v39, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v41 != v22)
          objc_enumerationMutation(v19);
        -[VCMediaNegotiationBlob addMultiwayAudioStreams:](self, "addMultiwayAudioStreams:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v39, 16);
    }
    while (v21);
  }
  momentsSettings = self->_momentsSettings;
  v25 = *((_QWORD *)a3 + 10);
  if (momentsSettings)
  {
    if (v25)
      -[VCMediaNegotiationBlobMomentsSettings mergeFrom:](momentsSettings, "mergeFrom:");
  }
  else if (v25)
  {
    -[VCMediaNegotiationBlob setMomentsSettings:](self, "setMomentsSettings:");
  }
  v26 = *((_BYTE *)a3 + 132);
  if ((v26 & 1) != 0)
  {
    self->_ntpTime = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v26 = *((_BYTE *)a3 + 132);
  }
  if ((v26 & 8) != 0)
  {
    self->_blobVersion = *((_DWORD *)a3 + 13);
    *(_BYTE *)&self->_has |= 8u;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v27 = (void *)*((_QWORD *)a3 + 12);
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v36 != v30)
          objc_enumerationMutation(v27);
        -[VCMediaNegotiationBlob addMultiwayVideoStream:](self, "addMultiwayVideoStream:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * k));
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
    }
    while (v29);
  }
  if ((*((_BYTE *)a3 + 132) & 0x10) != 0)
  {
    self->_mediaControlInfoVersion = *((_DWORD *)a3 + 18);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  faceTimeSettings = self->_faceTimeSettings;
  v33 = *((_QWORD *)a3 + 8);
  if (faceTimeSettings)
  {
    if (v33)
      -[VCMediaNegotiationFaceTimeSettings mergeFrom:](faceTimeSettings, "mergeFrom:");
  }
  else if (v33)
  {
    -[VCMediaNegotiationBlob setFaceTimeSettings:](self, "setFaceTimeSettings:");
  }
  if ((*((_BYTE *)a3 + 132) & 2) != 0)
  {
    self->_accessNetworkType = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (BOOL)allowDynamicMaxBitrate
{
  return self->_allowDynamicMaxBitrate;
}

- (BOOL)allowsContentsChangeWithAspectPreservation
{
  return self->_allowsContentsChangeWithAspectPreservation;
}

- (VCMediaNegotiationBlobAudioSettings)audioSettings
{
  return self->_audioSettings;
}

- (void)setAudioSettings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (VCMediaNegotiationBlobVideoSettings)videoSettings
{
  return self->_videoSettings;
}

- (void)setVideoSettings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (VCMediaNegotiationBlobVideoSettings)screenSettings
{
  return self->_screenSettings;
}

- (void)setScreenSettings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSString)basebandCodec
{
  return self->_basebandCodec;
}

- (void)setBasebandCodec:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (unsigned)basebandCodecSampleRate
{
  return self->_basebandCodecSampleRate;
}

- (NSMutableArray)bandwidthSettings
{
  return self->_bandwidthSettings;
}

- (void)setBandwidthSettings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (VCMediaNegotiationBlobCaptionsSettings)captionsSettings
{
  return self->_captionsSettings;
}

- (void)setCaptionsSettings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSMutableArray)multiwayAudioStreams
{
  return self->_multiwayAudioStreams;
}

- (void)setMultiwayAudioStreams:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (VCMediaNegotiationBlobMomentsSettings)momentsSettings
{
  return self->_momentsSettings;
}

- (void)setMomentsSettings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (unint64_t)ntpTime
{
  return self->_ntpTime;
}

- (unsigned)blobVersion
{
  return self->_blobVersion;
}

- (NSMutableArray)multiwayVideoStreams
{
  return self->_multiwayVideoStreams;
}

- (void)setMultiwayVideoStreams:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (VCMediaNegotiationFaceTimeSettings)faceTimeSettings
{
  return self->_faceTimeSettings;
}

- (void)setFaceTimeSettings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (void)formatBandwidthConfig:(int)a3 maxBanxwidth:(unsigned int)a4 bandwidthString:(id)a5
{
  uint64_t v6;
  __CFString *v7;
  void *v8;

  v6 = *(_QWORD *)&a4;
  if (a3 > 511)
  {
    if (a3 < 0x4000)
    {
      if (a3 <= 2047)
      {
        if (a3 == 512)
        {
          v7 = CFSTR("mode_FaceTime_2G");
          goto LABEL_45;
        }
        if (a3 == 1024)
        {
          v7 = CFSTR("mode_Screen_2G");
          goto LABEL_45;
        }
      }
      else
      {
        switch(a3)
        {
          case 0x800:
            v7 = CFSTR("mode_Default_2G");
            goto LABEL_45;
          case 0x1000:
            v7 = CFSTR("mode_iPadCompanion_AWDL");
            goto LABEL_45;
          case 0x2000:
            v7 = CFSTR("mode_iPadCompanion_USB");
            goto LABEL_45;
        }
      }
    }
    else if (a3 >= 0x20000)
    {
      switch(a3)
      {
        case 0x20000:
          v7 = CFSTR("mode_MultiwayScreen_Wifi");
          goto LABEL_45;
        case 0x40000:
          v7 = CFSTR("mode_LowLatencyScreen_Wired");
          goto LABEL_45;
        case 0x7FFFF:
          v7 = CFSTR("mode_SUPPORTED");
          goto LABEL_45;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x4000:
          v7 = CFSTR("mode_FaceTime_5G");
          goto LABEL_45;
        case 0x8000:
          v7 = CFSTR("mode_RemoteCamera_AWDL");
          goto LABEL_45;
        case 0x10000:
          v7 = CFSTR("mode_RemoteCamera_USB");
          goto LABEL_45;
      }
    }
LABEL_44:
    v7 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    goto LABEL_45;
  }
  if (a3 > 15)
  {
    if (a3 <= 63)
    {
      if (a3 == 16)
      {
        v7 = CFSTR("mode_Screen_Wifi");
        goto LABEL_45;
      }
      if (a3 == 32)
      {
        v7 = CFSTR("mode_Screen_LTE");
        goto LABEL_45;
      }
    }
    else
    {
      switch(a3)
      {
        case 64:
          v7 = CFSTR("mode_FaceTime_3G");
          goto LABEL_45;
        case 128:
          v7 = CFSTR("mode_Screen_3G");
          goto LABEL_45;
        case 256:
          v7 = CFSTR("mode_Default_3G");
          goto LABEL_45;
      }
    }
    goto LABEL_44;
  }
  v7 = CFSTR("mode_Invalid");
  switch(a3)
  {
    case 0:
      break;
    case 1:
      v7 = CFSTR("mode_Default_Wifi");
      break;
    case 2:
      v7 = CFSTR("mode_Default_LTE");
      break;
    case 4:
      v7 = CFSTR("mode_FaceTime_Wifi");
      break;
    case 8:
      v7 = CFSTR("mode_FaceTime_LTE");
      break;
    default:
      goto LABEL_44;
  }
LABEL_45:
  v8 = (void *)-[__CFString componentsSeparatedByString:](v7, "componentsSeparatedByString:", CFSTR("_"));
  if (objc_msgSend(v8, "count") == 3)
    objc_msgSend(a5, "appendFormat:", CFSTR(" %@(%@)=%u,"), objc_msgSend(v8, "objectAtIndex:", 1), objc_msgSend(v8, "objectAtIndex:", 2), v6);
}

- (void)printBandwidthSettingsWithLogFile:(void *)a3
{
  void *v4;
  NSMutableArray *bandwidthSettings;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  int v12;
  int v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  uint64_t v40;
  _BYTE v41[128];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Bandwidth Settings:"));
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  bandwidthSettings = self->_bandwidthSettings;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bandwidthSettings, "countByEnumeratingWithState:objects:count:", &v47, v46, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v48 != v8)
          objc_enumerationMutation(bandwidthSettings);
        v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "configuration");
        if (v11)
        {
          v12 = v11;
          v13 = 1;
          do
          {
            if ((v13 & v12) != 0)
              -[VCMediaNegotiationBlob formatBandwidthConfig:maxBanxwidth:bandwidthString:](self, "formatBandwidthConfig:maxBanxwidth:bandwidthString:", objc_msgSend(v10, "configuration"), objc_msgSend(v10, "maxBandwidth"), v4);
            v12 &= ~v13;
            v13 *= 2;
          }
          while (v12);
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bandwidthSettings, "countByEnumeratingWithState:objects:count:", &v47, v46, 16);
    }
    while (v7);
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v14 = self->_bandwidthSettings;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v42, v41, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v43 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
        v20 = objc_msgSend(v19, "configurationExtension");
        if (v20)
        {
          v21 = v20;
          v22 = 1;
          do
          {
            if ((v22 & v21) != 0)
              -[VCMediaNegotiationBlob formatBandwidthConfig:maxBanxwidth:bandwidthString:](self, "formatBandwidthConfig:maxBanxwidth:bandwidthString:", objc_msgSend(v19, "configurationExtension"), objc_msgSend(v19, "maxBandwidth"), v4);
            v21 &= ~v22;
            v22 *= 2;
          }
          while (v21);
        }
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v42, v41, 16);
    }
    while (v16);
  }
  v23 = objc_msgSend((id)objc_msgSend(v4, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(","))), "UTF8String");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v30 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v34 = v30;
      v35 = 2080;
      v36 = "-[VCMediaNegotiationBlob(Utils) printBandwidthSettingsWithLogFile:]";
      v37 = 1024;
      v38 = 65;
      v39 = 2080;
      v40 = v23;
      _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob - %s", buf, 0x26u);
    }
  }
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob - %s\n", v24, v25, v26, v27, v28, v29, v23);
}

- (void)printCaptionsSettingsWithLogFile:(void *)a3
{
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[VCMediaNegotiationBlobCaptionsSettings canDisplayCaptions](self->_captionsSettings, "canDisplayCaptions");
      *(_DWORD *)buf = 136315906;
      v29 = v5;
      v30 = 2080;
      v31 = "-[VCMediaNegotiationBlob(Utils) printCaptionsSettingsWithLogFile:]";
      v32 = 1024;
      v33 = 70;
      v34 = 1024;
      LODWORD(v35) = v7;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob - Captions Settings: canDisplayCaptions=%d", buf, 0x22u);
    }
  }
  v8 = -[VCMediaNegotiationBlobCaptionsSettings canDisplayCaptions](self->_captionsSettings, "canDisplayCaptions");
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob - Captions Settings: canDisplayCaptions=%d\n", v9, v10, v11, v12, v13, v14, v8);
  if (-[VCMediaNegotiationBlobCaptionsSettings hasSenderLanguages](self->_captionsSettings, "hasSenderLanguages"))
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Sender languages:"));
    v16 = 1;
    do
    {
      v17 = v16;
      if ((-[VCMediaNegotiationBlobCaptionsSettings senderLanguages](self->_captionsSettings, "senderLanguages") & v16) != 0)
      {
        if ((v17 - 1) >= 3)
          v18 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v17);
        else
          v18 = off_1E9E57BE8[(int)v17 - 1];
        objc_msgSend(v15, "appendFormat:", CFSTR(" %@,"), v18);
      }
      v16 = (2 * v17);
    }
    while ((v17 & 1) != 0);
    v19 = objc_msgSend((id)objc_msgSend(v15, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(","))), "UTF8String");
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v29 = v26;
        v30 = 2080;
        v31 = "-[VCMediaNegotiationBlob(Utils) printCaptionsSettingsWithLogFile:]";
        v32 = 1024;
        v33 = 82;
        v34 = 2080;
        v35 = v19;
        _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     %s", buf, 0x26u);
      }
    }
    VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     %s\n", v20, v21, v22, v23, v24, v25, v19);
  }
}

- (void)printMomentsSettingsWithLogFile:(void *)a3
{
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Moments Settings:"));
  v5 = 1;
  do
  {
    if ((-[VCMediaNegotiationBlobMomentsSettings capabilities](self->_momentsSettings, "capabilities") & v5) == 0)
      goto LABEL_14;
    if ((int)v5 > 3)
    {
      if ((_DWORD)v5 == 4)
      {
        v6 = CFSTR("history_video");
        goto LABEL_13;
      }
      if ((_DWORD)v5 != 119)
        goto LABEL_10;
      v6 = CFSTR("supported");
    }
    else
    {
      if ((_DWORD)v5 == 1)
      {
        v6 = CFSTR("no_history");
        goto LABEL_13;
      }
      if ((_DWORD)v5 != 2)
      {
LABEL_10:
        v6 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
        goto LABEL_13;
      }
      v6 = CFSTR("history_image");
    }
LABEL_13:
    objc_msgSend(v4, "appendFormat:", CFSTR(" %@,"), v6);
LABEL_14:
    v7 = (v5 & 0x3B) == 0;
    v5 = (2 * v5);
  }
  while (!v7);
  v8 = 1;
  do
  {
    v9 = v8;
    if ((-[VCMediaNegotiationBlobMomentsSettings supportedVideoCodecs](self->_momentsSettings, "supportedVideoCodecs") & v8) != 0)
    {
      if ((v9 - 1) >= 3)
        v10 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v9);
      else
        v10 = off_1E9E57C00[(int)v9 - 1];
      objc_msgSend(v4, "appendFormat:", CFSTR(" %@,"), v10);
    }
    v8 = (2 * v9);
  }
  while ((v9 & 1) != 0);
  v11 = 1;
  do
  {
    v12 = v11;
    if ((-[VCMediaNegotiationBlobMomentsSettings supportedImageTypes](self->_momentsSettings, "supportedImageTypes") & v11) != 0)
    {
      if ((v12 - 1) >= 3)
        v13 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
      else
        v13 = off_1E9E57C18[(int)v12 - 1];
      objc_msgSend(v4, "appendFormat:", CFSTR(" %@,"), v13);
    }
    v11 = (2 * v12);
  }
  while ((v12 & 1) != 0);
  v14 = objc_msgSend((id)objc_msgSend(v4, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(","))), "UTF8String");
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v25 = v21;
      v26 = 2080;
      v27 = "-[VCMediaNegotiationBlob(Utils) printMomentsSettingsWithLogFile:]";
      v28 = 1024;
      v29 = 106;
      v30 = 2080;
      v31 = v14;
      _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     %s", buf, 0x26u);
    }
  }
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     %s\n", v15, v16, v17, v18, v19, v20, v14);
}

- (void)printMultiwayAudioStreamsWithLogFile:(void *)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *multiwayAudioStreams;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[NSMutableArray count](self->_multiwayAudioStreams, "count");
      *(_DWORD *)buf = 136315906;
      v26 = v5;
      v27 = 2080;
      v28 = "-[VCMediaNegotiationBlob(Utils) printMultiwayAudioStreamsWithLogFile:]";
      v29 = 1024;
      v30 = 111;
      v31 = 1024;
      v32 = v7;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob - Multiway Audio: count=%d", buf, 0x22u);
    }
  }
  v8 = -[NSMutableArray count](self->_multiwayAudioStreams, "count");
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob - Multiway Audio: count=%d\n", v9, v10, v11, v12, v13, v14, v8);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  multiwayAudioStreams = self->_multiwayAudioStreams;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](multiwayAudioStreams, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(multiwayAudioStreams);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v19++), "printWithLogFile:", a3);
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](multiwayAudioStreams, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
    }
    while (v17);
  }
}

- (void)printMultiwayVideoStreamsWithLogFile:(void *)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *multiwayVideoStreams;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[NSMutableArray count](self->_multiwayVideoStreams, "count");
      *(_DWORD *)buf = 136315906;
      v26 = v5;
      v27 = 2080;
      v28 = "-[VCMediaNegotiationBlob(Utils) printMultiwayVideoStreamsWithLogFile:]";
      v29 = 1024;
      v30 = 119;
      v31 = 1024;
      v32 = v7;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob - Multiway Video: count=%d", buf, 0x22u);
    }
  }
  v8 = -[NSMutableArray count](self->_multiwayVideoStreams, "count");
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob - Multiway Video: count=%d\n", v9, v10, v11, v12, v13, v14, v8);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  multiwayVideoStreams = self->_multiwayVideoStreams;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](multiwayVideoStreams, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(multiwayVideoStreams);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v19++), "printWithLogFile:", a3);
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](multiwayVideoStreams, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
    }
    while (v17);
  }
}

- (void)printWithTitle:(id)a3 blobSize:(unsigned int)a4 logFile:(void *)a5
{
  void *v7;
  uint64_t v8;
  NSObject *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@ (size=%u): UserAgent=%s"), a3, *(_QWORD *)&a4, -[NSString UTF8String](self->_userAgent, "UTF8String"));
  if (-[VCMediaNegotiationBlob hasBasebandCodec](self, "hasBasebandCodec"))
    objc_msgSend(v7, "appendFormat:", CFSTR(", basebandCodec=%@, basebandCodecSampleRate=%u"), self->_basebandCodec, self->_basebandCodecSampleRate);
  if (-[VCMediaNegotiationBlob hasAllowDynamicMaxBitrate](self, "hasAllowDynamicMaxBitrate"))
    objc_msgSend(v7, "appendFormat:", CFSTR(", allowDynamicMaxBitrate=%d"), self->_allowDynamicMaxBitrate);
  if (-[VCMediaNegotiationBlob hasAllowsContentsChangeWithAspectPreservation](self, "hasAllowsContentsChangeWithAspectPreservation"))
  {
    objc_msgSend(v7, "appendFormat:", CFSTR(", allowsContentsChangeWithAspectPreservation=%d"), self->_allowsContentsChangeWithAspectPreservation);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v18 = v8;
      v19 = 2080;
      v20 = "-[VCMediaNegotiationBlob(Utils) printWithTitle:blobSize:logFile:]";
      v21 = 1024;
      v22 = 137;
      v23 = 2080;
      v24 = objc_msgSend(v7, "UTF8String");
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob - %s", buf, 0x26u);
    }
  }
  v10 = objc_msgSend(v7, "UTF8String");
  VRLogfilePrintWithTimestamp((uint64_t)a5, "Media Blob - %s\n", v11, v12, v13, v14, v15, v16, v10);
  if (-[VCMediaNegotiationBlob hasAudioSettings](self, "hasAudioSettings"))
    -[VCMediaNegotiationBlobAudioSettings printWithLogFile:](self->_audioSettings, "printWithLogFile:", a5);
  if (-[VCMediaNegotiationBlob hasVideoSettings](self, "hasVideoSettings"))
    -[VCMediaNegotiationBlobVideoSettings printVideoWithLogFile:](self->_videoSettings, "printVideoWithLogFile:", a5);
  if (-[VCMediaNegotiationBlob hasScreenSettings](self, "hasScreenSettings"))
    -[VCMediaNegotiationBlobVideoSettings printScreenWithLogFile:](self->_screenSettings, "printScreenWithLogFile:", a5);
  if (-[NSMutableArray count](self->_bandwidthSettings, "count"))
    -[VCMediaNegotiationBlob printBandwidthSettingsWithLogFile:](self, "printBandwidthSettingsWithLogFile:", a5);
  if (-[VCMediaNegotiationBlob hasCaptionsSettings](self, "hasCaptionsSettings"))
    -[VCMediaNegotiationBlob printCaptionsSettingsWithLogFile:](self, "printCaptionsSettingsWithLogFile:", a5);
  if (-[VCMediaNegotiationBlob hasMomentsSettings](self, "hasMomentsSettings"))
    -[VCMediaNegotiationBlob printMomentsSettingsWithLogFile:](self, "printMomentsSettingsWithLogFile:", a5);
  if (-[NSMutableArray count](self->_multiwayAudioStreams, "count"))
    -[VCMediaNegotiationBlob printMultiwayAudioStreamsWithLogFile:](self, "printMultiwayAudioStreamsWithLogFile:", a5);
  if (-[NSMutableArray count](self->_multiwayVideoStreams, "count"))
    -[VCMediaNegotiationBlob printMultiwayVideoStreamsWithLogFile:](self, "printMultiwayVideoStreamsWithLogFile:", a5);

}

@end
