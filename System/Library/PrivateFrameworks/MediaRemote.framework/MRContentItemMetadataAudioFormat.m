@implementation MRContentItemMetadataAudioFormat

- (MRContentItemMetadataAudioFormat)initWithProtobuf:(id)a3
{
  id v4;
  MRContentItemMetadataAudioFormat *v5;
  void *v6;
  uint64_t v7;
  NSString *audioChannelLayoutDescription;
  uint64_t v9;
  NSString *groupID;
  uint64_t v11;
  NSString *stableVariantID;
  MRContentItemMetadataAudioFormat *v13;
  objc_super v15;

  v4 = a3;
  if (v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)MRContentItemMetadataAudioFormat;
    v5 = -[MRContentItemMetadataAudioFormat init](&v15, sel_init);
    if (v5)
    {
      v5->_tier = (int)objc_msgSend(v4, "tier");
      v5->_hasTier = objc_msgSend(v4, "hasTier");
      v5->_bitrate = objc_msgSend(v4, "bitrate");
      v5->_hasBitrate = objc_msgSend(v4, "hasBitrate");
      v5->_sampleRate = objc_msgSend(v4, "sampleRate");
      v5->_hasSampleRate = objc_msgSend(v4, "hasSampleRate");
      v5->_bitDepth = objc_msgSend(v4, "bitDepth");
      v5->_hasBitDepth = objc_msgSend(v4, "hasBitDepth");
      v5->_codec = objc_msgSend(v4, "codec");
      v5->_hasCodec = objc_msgSend(v4, "hasCodec");
      v5->_spatialized = objc_msgSend(v4, "spatialized");
      v5->_hasSpatialized = objc_msgSend(v4, "hasSpatialized");
      v5->_multiChannel = objc_msgSend(v4, "multiChannel");
      v5->_hasMultiChannel = objc_msgSend(v4, "hasMultiChannel");
      v5->_renderingMode = (int)objc_msgSend(v4, "renderingMode");
      v5->_hasRenderingMode = objc_msgSend(v4, "hasRenderingMode");
      v5->_channelLayout = objc_msgSend(v4, "channelLayout");
      v5->_hasChannelLayout = objc_msgSend(v4, "hasChannelLayout");
      objc_msgSend(v4, "audioChannelLayoutDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      audioChannelLayoutDescription = v5->_audioChannelLayoutDescription;
      v5->_audioChannelLayoutDescription = (NSString *)v7;

      objc_msgSend(v4, "groupID");
      v9 = objc_claimAutoreleasedReturnValue();
      groupID = v5->_groupID;
      v5->_groupID = (NSString *)v9;

      objc_msgSend(v4, "stableVariantID");
      v11 = objc_claimAutoreleasedReturnValue();
      stableVariantID = v5->_stableVariantID;
      v5->_stableVariantID = (NSString *)v11;

    }
    self = v5;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (_MRAudioFormatProtobuf)protobuf
{
  _MRAudioFormatProtobuf *v3;
  __int16 v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *groupID;
  void *v17;
  uint64_t v18;
  NSString *stableVariantID;

  v3 = objc_alloc_init(_MRAudioFormatProtobuf);
  v3->_tier = -[MRContentItemMetadataAudioFormat tier](self, "tier");
  if (-[MRContentItemMetadataAudioFormat hasTier](self, "hasTier"))
    v4 = 64;
  else
    v4 = 0;
  *(_WORD *)&v3->_has = *(_WORD *)&v3->_has & 0xFFBF | v4;
  v3->_bitrate = -[MRContentItemMetadataAudioFormat bitrate](self, "bitrate");
  if (-[MRContentItemMetadataAudioFormat hasBitrate](self, "hasBitrate"))
    v5 = 2;
  else
    v5 = 0;
  *(_WORD *)&v3->_has = *(_WORD *)&v3->_has & 0xFFFD | v5;
  v3->_sampleRate = -[MRContentItemMetadataAudioFormat sampleRate](self, "sampleRate");
  if (-[MRContentItemMetadataAudioFormat hasSampleRate](self, "hasSampleRate"))
    v6 = 4;
  else
    v6 = 0;
  *(_WORD *)&v3->_has = *(_WORD *)&v3->_has & 0xFFFB | v6;
  v3->_bitDepth = -[MRContentItemMetadataAudioFormat bitDepth](self, "bitDepth");
  *(_WORD *)&v3->_has = *(_WORD *)&v3->_has & 0xFFFE | -[MRContentItemMetadataAudioFormat hasBitDepth](self, "hasBitDepth");
  v3->_codec = -[MRContentItemMetadataAudioFormat codec](self, "codec");
  if (-[MRContentItemMetadataAudioFormat hasCodec](self, "hasCodec"))
    v7 = 16;
  else
    v7 = 0;
  *(_WORD *)&v3->_has = *(_WORD *)&v3->_has & 0xFFEF | v7;
  v3->_spatialized = -[MRContentItemMetadataAudioFormat isSpatialized](self, "isSpatialized");
  if (-[MRContentItemMetadataAudioFormat hasSpatialized](self, "hasSpatialized"))
    v8 = 256;
  else
    v8 = 0;
  *(_WORD *)&v3->_has = *(_WORD *)&v3->_has & 0xFEFF | v8;
  v3->_multiChannel = -[MRContentItemMetadataAudioFormat isMultiChannel](self, "isMultiChannel");
  if (-[MRContentItemMetadataAudioFormat hasMultiChannel](self, "hasMultiChannel"))
    v9 = 128;
  else
    v9 = 0;
  *(_WORD *)&v3->_has = *(_WORD *)&v3->_has & 0xFF7F | v9;
  v3->_renderingMode = -[MRContentItemMetadataAudioFormat renderingMode](self, "renderingMode");
  if (-[MRContentItemMetadataAudioFormat hasRenderingMode](self, "hasRenderingMode"))
    v10 = 32;
  else
    v10 = 0;
  *(_WORD *)&v3->_has = *(_WORD *)&v3->_has & 0xFFDF | v10;
  v3->_channelLayout = -[MRContentItemMetadataAudioFormat channelLayout](self, "channelLayout");
  if (-[MRContentItemMetadataAudioFormat hasChannelLayout](self, "hasChannelLayout"))
    v11 = 8;
  else
    v11 = 0;
  *(_WORD *)&v3->_has = *(_WORD *)&v3->_has & 0xFFF7 | v11;
  -[MRContentItemMetadataAudioFormat audioChannelLayoutDescription](self, "audioChannelLayoutDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  -[_MRAudioFormatProtobuf setAudioChannelLayoutDescription:](v3, "setAudioChannelLayoutDescription:", v13);

  -[MRContentItemMetadataAudioFormat groupID](self, "groupID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "copy");
  groupID = v3->_groupID;
  v3->_groupID = (NSString *)v15;

  -[MRContentItemMetadataAudioFormat stableVariantID](self, "stableVariantID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "copy");
  stableVariantID = v3->_stableVariantID;
  v3->_stableVariantID = (NSString *)v18;

  return v3;
}

- (void)setTier:(int64_t)a3
{
  self->_tier = a3;
  self->_hasTier = 1;
}

- (void)setBitrate:(int64_t)a3
{
  self->_bitrate = a3;
  self->_hasBitrate = 1;
}

- (void)setSampleRate:(int64_t)a3
{
  self->_sampleRate = a3;
  self->_hasSampleRate = 1;
}

- (void)setBitDepth:(int64_t)a3
{
  self->_bitDepth = a3;
  self->_hasBitDepth = 1;
}

- (void)setCodec:(unsigned int)a3
{
  self->_codec = a3;
  self->_hasCodec = 1;
}

- (void)setSpatialized:(BOOL)a3
{
  self->_spatialized = a3;
  self->_hasSpatialized = 1;
}

- (void)setMultiChannel:(BOOL)a3
{
  self->_multiChannel = a3;
  self->_hasMultiChannel = 1;
}

- (void)setRenderingMode:(int64_t)a3
{
  self->_renderingMode = a3;
  self->_hasRenderingMode = 1;
}

- (void)setChannelLayout:(unsigned int)a3
{
  self->_channelLayout = a3;
  self->_hasChannelLayout = 1;
}

- (void)setGroupID:(id)a3
{
  NSString *v4;
  NSString *groupID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  groupID = self->_groupID;
  self->_groupID = v4;

}

- (void)setStableVariantID:(id)a3
{
  NSString *v4;
  NSString *stableVariantID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  stableVariantID = self->_stableVariantID;
  self->_stableVariantID = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = objc_alloc_init((Class)objc_opt_class());
  if (-[MRContentItemMetadataAudioFormat hasTier](self, "hasTier"))
    objc_msgSend(v5, "setTier:", -[MRContentItemMetadataAudioFormat tier](self, "tier"));
  if (-[MRContentItemMetadataAudioFormat hasBitrate](self, "hasBitrate"))
    objc_msgSend(v5, "setBitrate:", -[MRContentItemMetadataAudioFormat bitrate](self, "bitrate"));
  if (-[MRContentItemMetadataAudioFormat hasSampleRate](self, "hasSampleRate"))
    objc_msgSend(v5, "setSampleRate:", -[MRContentItemMetadataAudioFormat sampleRate](self, "sampleRate"));
  if (-[MRContentItemMetadataAudioFormat hasBitDepth](self, "hasBitDepth"))
    objc_msgSend(v5, "setBitDepth:", -[MRContentItemMetadataAudioFormat bitDepth](self, "bitDepth"));
  if (-[MRContentItemMetadataAudioFormat hasCodec](self, "hasCodec"))
    objc_msgSend(v5, "setCodec:", -[MRContentItemMetadataAudioFormat codec](self, "codec"));
  -[MRContentItemMetadataAudioFormat groupID](self, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setGroupID:", v7);

  -[MRContentItemMetadataAudioFormat stableVariantID](self, "stableVariantID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setStableVariantID:", v9);

  if (-[MRContentItemMetadataAudioFormat hasSpatialized](self, "hasSpatialized"))
    objc_msgSend(v5, "setSpatialized:", -[MRContentItemMetadataAudioFormat isSpatialized](self, "isSpatialized"));
  if (-[MRContentItemMetadataAudioFormat hasMultiChannel](self, "hasMultiChannel"))
    objc_msgSend(v5, "setMultiChannel:", -[MRContentItemMetadataAudioFormat isMultiChannel](self, "isMultiChannel"));
  if (-[MRContentItemMetadataAudioFormat hasRenderingMode](self, "hasRenderingMode"))
    objc_msgSend(v5, "setRenderingMode:", -[MRContentItemMetadataAudioFormat renderingMode](self, "renderingMode"));
  if (-[MRContentItemMetadataAudioFormat hasChannelLayout](self, "hasChannelLayout"))
    objc_msgSend(v5, "setChannelLayout:", -[MRContentItemMetadataAudioFormat channelLayout](self, "channelLayout"));
  -[MRContentItemMetadataAudioFormat audioChannelLayoutDescription](self, "audioChannelLayoutDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setAudioChannelLayoutDescription:", v11);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  MRContentItemMetadataAudioFormat *v4;
  _BOOL4 v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  _BOOL4 v13;
  unsigned int v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  _BOOL4 v19;
  uint64_t v20;
  _BOOL4 v21;
  unsigned int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  char v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;

  v4 = (MRContentItemMetadataAudioFormat *)a3;
  if (v4 == self)
  {
    v29 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_46;
    v5 = -[MRContentItemMetadataAudioFormat hasTier](v4, "hasTier");
    if (v5 != -[MRContentItemMetadataAudioFormat hasTier](self, "hasTier"))
      goto LABEL_46;
    if (-[MRContentItemMetadataAudioFormat hasTier](v4, "hasTier"))
    {
      if (-[MRContentItemMetadataAudioFormat hasTier](self, "hasTier"))
      {
        v6 = -[MRContentItemMetadataAudioFormat tier](v4, "tier");
        if (v6 != -[MRContentItemMetadataAudioFormat tier](self, "tier"))
          goto LABEL_46;
      }
    }
    v7 = -[MRContentItemMetadataAudioFormat hasBitrate](v4, "hasBitrate");
    if (v7 != -[MRContentItemMetadataAudioFormat hasBitrate](self, "hasBitrate"))
      goto LABEL_46;
    if (-[MRContentItemMetadataAudioFormat hasBitrate](v4, "hasBitrate"))
    {
      if (-[MRContentItemMetadataAudioFormat hasBitrate](self, "hasBitrate"))
      {
        v8 = -[MRContentItemMetadataAudioFormat bitrate](v4, "bitrate");
        if (v8 != -[MRContentItemMetadataAudioFormat bitrate](self, "bitrate"))
          goto LABEL_46;
      }
    }
    v9 = -[MRContentItemMetadataAudioFormat hasSampleRate](v4, "hasSampleRate");
    if (v9 != -[MRContentItemMetadataAudioFormat hasSampleRate](self, "hasSampleRate"))
      goto LABEL_46;
    if (-[MRContentItemMetadataAudioFormat hasSampleRate](v4, "hasSampleRate"))
    {
      if (-[MRContentItemMetadataAudioFormat hasSampleRate](self, "hasSampleRate"))
      {
        v10 = -[MRContentItemMetadataAudioFormat sampleRate](v4, "sampleRate");
        if (v10 != -[MRContentItemMetadataAudioFormat sampleRate](self, "sampleRate"))
          goto LABEL_46;
      }
    }
    v11 = -[MRContentItemMetadataAudioFormat hasBitDepth](v4, "hasBitDepth");
    if (v11 != -[MRContentItemMetadataAudioFormat hasBitDepth](self, "hasBitDepth"))
      goto LABEL_46;
    if (-[MRContentItemMetadataAudioFormat hasBitDepth](v4, "hasBitDepth"))
    {
      if (-[MRContentItemMetadataAudioFormat hasBitDepth](self, "hasBitDepth"))
      {
        v12 = -[MRContentItemMetadataAudioFormat bitDepth](v4, "bitDepth");
        if (v12 != -[MRContentItemMetadataAudioFormat bitDepth](self, "bitDepth"))
          goto LABEL_46;
      }
    }
    v13 = -[MRContentItemMetadataAudioFormat hasCodec](v4, "hasCodec");
    if (v13 != -[MRContentItemMetadataAudioFormat hasCodec](self, "hasCodec"))
      goto LABEL_46;
    if (-[MRContentItemMetadataAudioFormat hasCodec](v4, "hasCodec"))
    {
      if (-[MRContentItemMetadataAudioFormat hasCodec](self, "hasCodec"))
      {
        v14 = -[MRContentItemMetadataAudioFormat codec](v4, "codec");
        if (v14 != -[MRContentItemMetadataAudioFormat codec](self, "codec"))
          goto LABEL_46;
      }
    }
    v15 = -[MRContentItemMetadataAudioFormat hasSpatialized](v4, "hasSpatialized");
    if (v15 != -[MRContentItemMetadataAudioFormat hasSpatialized](self, "hasSpatialized"))
      goto LABEL_46;
    if (-[MRContentItemMetadataAudioFormat hasSpatialized](v4, "hasSpatialized"))
    {
      if (-[MRContentItemMetadataAudioFormat hasSpatialized](self, "hasSpatialized"))
      {
        v16 = -[MRContentItemMetadataAudioFormat isSpatialized](v4, "isSpatialized");
        if (v16 != -[MRContentItemMetadataAudioFormat isSpatialized](self, "isSpatialized"))
          goto LABEL_46;
      }
    }
    v17 = -[MRContentItemMetadataAudioFormat hasMultiChannel](v4, "hasMultiChannel");
    if (v17 != -[MRContentItemMetadataAudioFormat hasMultiChannel](self, "hasMultiChannel"))
      goto LABEL_46;
    if (-[MRContentItemMetadataAudioFormat hasMultiChannel](v4, "hasMultiChannel"))
    {
      if (-[MRContentItemMetadataAudioFormat hasMultiChannel](self, "hasMultiChannel"))
      {
        v18 = -[MRContentItemMetadataAudioFormat isMultiChannel](v4, "isMultiChannel");
        if (v18 != -[MRContentItemMetadataAudioFormat isMultiChannel](self, "isMultiChannel"))
          goto LABEL_46;
      }
    }
    v19 = -[MRContentItemMetadataAudioFormat hasRenderingMode](v4, "hasRenderingMode");
    if (v19 != -[MRContentItemMetadataAudioFormat hasRenderingMode](self, "hasRenderingMode"))
      goto LABEL_46;
    if (-[MRContentItemMetadataAudioFormat hasRenderingMode](v4, "hasRenderingMode"))
    {
      if (-[MRContentItemMetadataAudioFormat hasRenderingMode](self, "hasRenderingMode"))
      {
        v20 = -[MRContentItemMetadataAudioFormat renderingMode](v4, "renderingMode");
        if (v20 != -[MRContentItemMetadataAudioFormat renderingMode](self, "renderingMode"))
          goto LABEL_46;
      }
    }
    v21 = -[MRContentItemMetadataAudioFormat hasChannelLayout](v4, "hasChannelLayout");
    if (v21 != -[MRContentItemMetadataAudioFormat hasChannelLayout](self, "hasChannelLayout"))
      goto LABEL_46;
    if (-[MRContentItemMetadataAudioFormat hasChannelLayout](v4, "hasChannelLayout"))
    {
      if (-[MRContentItemMetadataAudioFormat hasChannelLayout](self, "hasChannelLayout"))
      {
        v22 = -[MRContentItemMetadataAudioFormat channelLayout](v4, "channelLayout");
        if (v22 != -[MRContentItemMetadataAudioFormat channelLayout](self, "channelLayout"))
          goto LABEL_46;
      }
    }
    -[MRContentItemMetadataAudioFormat audioChannelLayoutDescription](v4, "audioChannelLayoutDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadataAudioFormat audioChannelLayoutDescription](self, "audioChannelLayoutDescription");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v23 == (void *)v24)
    {

    }
    else
    {
      v25 = (void *)v24;
      -[MRContentItemMetadataAudioFormat audioChannelLayoutDescription](v4, "audioChannelLayoutDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadataAudioFormat audioChannelLayoutDescription](self, "audioChannelLayoutDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isEqualToString:", v27);

      if (!v28)
        goto LABEL_46;
    }
    -[MRContentItemMetadataAudioFormat groupID](v4, "groupID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadataAudioFormat groupID](self, "groupID");
    v31 = objc_claimAutoreleasedReturnValue();
    if (v30 == (void *)v31)
    {

    }
    else
    {
      v32 = (void *)v31;
      -[MRContentItemMetadataAudioFormat groupID](v4, "groupID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadataAudioFormat groupID](self, "groupID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v33, "isEqualToString:", v34);

      if (!v35)
      {
LABEL_46:
        v29 = 0;
        goto LABEL_47;
      }
    }
    -[MRContentItemMetadataAudioFormat stableVariantID](v4, "stableVariantID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadataAudioFormat stableVariantID](self, "stableVariantID");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {
      v29 = 1;
      v39 = v37;
    }
    else
    {
      v39 = (void *)v38;
      -[MRContentItemMetadataAudioFormat stableVariantID](v4, "stableVariantID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadataAudioFormat stableVariantID](self, "stableVariantID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v40, "isEqualToString:", v41);

    }
  }
LABEL_47:

  return v29;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[MRContentItemMetadataAudioFormat hasTier](self, "hasTier"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadataAudioFormat tier](self, "tier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("tier"));

  }
  if (-[MRContentItemMetadataAudioFormat hasBitrate](self, "hasBitrate"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadataAudioFormat bitrate](self, "bitrate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bitrate"));

  }
  if (-[MRContentItemMetadataAudioFormat hasSampleRate](self, "hasSampleRate"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadataAudioFormat sampleRate](self, "sampleRate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("sampleRate"));

  }
  if (-[MRContentItemMetadataAudioFormat hasBitDepth](self, "hasBitDepth"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadataAudioFormat bitDepth](self, "bitDepth"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("bitDepth"));

  }
  if (-[MRContentItemMetadataAudioFormat hasCodec](self, "hasCodec"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MRContentItemMetadataAudioFormat codec](self, "codec"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("codec"));

  }
  if (-[MRContentItemMetadataAudioFormat hasSpatialized](self, "hasSpatialized"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadataAudioFormat isSpatialized](self, "isSpatialized"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("spatialized"));

  }
  if (-[MRContentItemMetadataAudioFormat hasMultiChannel](self, "hasMultiChannel"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadataAudioFormat isMultiChannel](self, "isMultiChannel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("multiChannel"));

  }
  if (-[MRContentItemMetadataAudioFormat hasRenderingMode](self, "hasRenderingMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadataAudioFormat renderingMode](self, "renderingMode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("renderingMode"));

  }
  if (-[MRContentItemMetadataAudioFormat hasChannelLayout](self, "hasChannelLayout"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MRContentItemMetadataAudioFormat channelLayout](self, "channelLayout"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("channelLayout"));

  }
  -[MRContentItemMetadataAudioFormat audioChannelLayoutDescription](self, "audioChannelLayoutDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("audioChannelLayoutDescription"));

  -[MRContentItemMetadataAudioFormat groupID](self, "groupID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("groupID"));

  -[MRContentItemMetadataAudioFormat stableVariantID](self, "stableVariantID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("stableVariantID"));

  return (NSDictionary *)v3;
}

- (BOOL)hasTier
{
  return self->_hasTier;
}

- (int64_t)tier
{
  return self->_tier;
}

- (BOOL)hasBitrate
{
  return self->_hasBitrate;
}

- (int64_t)bitrate
{
  return self->_bitrate;
}

- (BOOL)hasSampleRate
{
  return self->_hasSampleRate;
}

- (int64_t)sampleRate
{
  return self->_sampleRate;
}

- (BOOL)hasBitDepth
{
  return self->_hasBitDepth;
}

- (int64_t)bitDepth
{
  return self->_bitDepth;
}

- (BOOL)hasCodec
{
  return self->_hasCodec;
}

- (unsigned)codec
{
  return self->_codec;
}

- (BOOL)hasSpatialized
{
  return self->_hasSpatialized;
}

- (BOOL)isSpatialized
{
  return self->_spatialized;
}

- (BOOL)hasMultiChannel
{
  return self->_hasMultiChannel;
}

- (BOOL)isMultiChannel
{
  return self->_multiChannel;
}

- (BOOL)hasRenderingMode
{
  return self->_hasRenderingMode;
}

- (int64_t)renderingMode
{
  return self->_renderingMode;
}

- (BOOL)hasChannelLayout
{
  return self->_hasChannelLayout;
}

- (unsigned)channelLayout
{
  return self->_channelLayout;
}

- (NSString)audioChannelLayoutDescription
{
  return self->_audioChannelLayoutDescription;
}

- (void)setAudioChannelLayoutDescription:(id)a3
{
  objc_storeStrong((id *)&self->_audioChannelLayoutDescription, a3);
}

- (NSString)groupID
{
  return self->_groupID;
}

- (NSString)stableVariantID
{
  return self->_stableVariantID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stableVariantID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_audioChannelLayoutDescription, 0);
}

@end
