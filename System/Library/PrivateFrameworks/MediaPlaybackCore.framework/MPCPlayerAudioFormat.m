@implementation MPCPlayerAudioFormat

- (MPCPlayerAudioFormat)initWithJSONDictionaryRepresentation:(id)a3 stableVariantID:(id)a4
{
  id v6;
  id v7;
  MPCPlayerAudioFormat *v8;
  MPCPlayerAudioFormat *v9;
  void *v10;
  uint64_t v11;
  NSString *stableVariantID;
  void *v13;
  void *v14;
  id v15;
  char *v16;
  void *v17;
  uint64_t v18;
  NSString *groupID;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSString *audioChannelLayoutDescription;
  void *v30;
  uint64_t v31;
  char v32;
  objc_super v34;

  v6 = a3;
  v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)MPCPlayerAudioFormat;
  v8 = -[MPCPlayerAudioFormat init](&v34, sel_init);
  if (!v8)
    goto LABEL_18;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VERSION"));
  v9 = (MPCPlayerAudioFormat *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AUDIO-FORMAT-ID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = objc_msgSend(v7, "copy");
      stableVariantID = v8->_stableVariantID;
      v8->_stableVariantID = (NSString *)v11;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VERSION"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[MPCPlayerAudioFormat _isHLSVersion:greatherThanOrEqualTo:](v8, "_isHLSVersion:greatherThanOrEqualTo:", v13, &unk_24CB16EA8))
      {
LABEL_17:

LABEL_18:
        v9 = v8;
        goto LABEL_19;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AUDIO-FORMAT-ID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "length") == 4)
      {
        v15 = objc_retainAutorelease(v14);
        v16 = (char *)objc_msgSend(v15, "UTF8String");
        v8->_codec = v16[3] + (v16[2] << 8) + (v16[1] << 16) + (*v16 << 24);
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("GROUP-ID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "copy");
        groupID = v8->_groupID;
        v8->_groupID = (NSString *)v18;

        if (v8->_codec == 1634492771)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SAMPLE-RATE"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v8->_sampleRate = objc_msgSend(v20, "integerValue");

          v21 = CFSTR("BIT-DEPTH");
          v22 = 48;
        }
        else
        {
          v21 = CFSTR("BIT-RATE");
          v22 = 32;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(Class *)((char *)&v8->super.isa + v22) = (Class)objc_msgSend(v23, "integerValue");

        v8->_spatialized = -[MPCPlayerAudioFormat _isSpatialFormat:](v8, "_isSpatialFormat:", v6);
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CHANNEL-COUNT"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "integerValue");

        v8->_tier = -[MPCPlayerAudioFormat _computedTierFromHLSDataWithChannelCount:](v8, "_computedTierFromHLSDataWithChannelCount:", v25);
        v26 = -[MPCPlayerAudioFormat _computedChannelLayoutTagFromHLSData:channelCount:](v8, "_computedChannelLayoutTagFromHLSData:channelCount:", v6, v25);
        v8->_channelLayout = v26;
        -[MPCPlayerAudioFormat _descriptionForChannelLayoutTag:](v8, "_descriptionForChannelLayoutTag:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "copy");
        audioChannelLayoutDescription = v8->_audioChannelLayoutDescription;
        v8->_audioChannelLayoutDescription = (NSString *)v28;

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ORIGIN-CHANNEL-COUNT"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "integerValue");

        if (v31)
          v8->_originChannelLayout = -[MPCPlayerAudioFormat _computedChannelLayoutTagFromHLSData:channelCount:](v8, "_computedChannelLayoutTagFromHLSData:channelCount:", v6, v31);
        if (v8->_spatialized)
          v32 = 1;
        else
          v32 = -[MPCPlayerAudioFormat _isMultichannelFormat:](v8, "_isMultichannelFormat:", v6);
        v8->_multiChannel = v32;

        goto LABEL_17;
      }

    }
    v9 = 0;
  }
LABEL_19:

  return v9;
}

- (MPCPlayerAudioFormat)initWithNowPlayingInfoAudioFormat:(id)a3
{
  id v4;
  MPCPlayerAudioFormat *v5;
  uint64_t v6;
  NSString *groupID;
  uint64_t v8;
  NSString *stableVariantID;
  uint64_t v10;
  NSString *audioChannelLayoutDescription;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPCPlayerAudioFormat;
  v5 = -[MPCPlayerAudioFormat init](&v13, sel_init);
  if (v5)
  {
    v5->_tier = objc_msgSend(v4, "tier");
    objc_msgSend(v4, "groupID");
    v6 = objc_claimAutoreleasedReturnValue();
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v6;

    v5->_bitrate = objc_msgSend(v4, "bitrate");
    v5->_sampleRate = objc_msgSend(v4, "sampleRate");
    v5->_bitDepth = objc_msgSend(v4, "bitDepth");
    v5->_codec = objc_msgSend(v4, "codec");
    v5->_channelLayout = objc_msgSend(v4, "channelLayout");
    objc_msgSend(v4, "stableVariantID");
    v8 = objc_claimAutoreleasedReturnValue();
    stableVariantID = v5->_stableVariantID;
    v5->_stableVariantID = (NSString *)v8;

    objc_msgSend(v4, "audioChannelLayoutDescription");
    v10 = objc_claimAutoreleasedReturnValue();
    audioChannelLayoutDescription = v5->_audioChannelLayoutDescription;
    v5->_audioChannelLayoutDescription = (NSString *)v10;

    v5->_spatialized = objc_msgSend(v4, "isSpatialized");
    v5->_multiChannel = objc_msgSend(v4, "isMultiChannel");
    v5->_renderingMode = objc_msgSend(v4, "renderingMode");
  }

  return v5;
}

- (MPNowPlayingInfoAudioFormat)nowPlayingAudioFormat
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDDCAB8]);
  objc_msgSend(v3, "setTier:", -[MPCPlayerAudioFormat tier](self, "tier"));
  objc_msgSend(v3, "setBitrate:", -[MPCPlayerAudioFormat bitrate](self, "bitrate"));
  objc_msgSend(v3, "setSampleRate:", -[MPCPlayerAudioFormat sampleRate](self, "sampleRate"));
  objc_msgSend(v3, "setBitDepth:", -[MPCPlayerAudioFormat bitDepth](self, "bitDepth"));
  objc_msgSend(v3, "setCodec:", -[MPCPlayerAudioFormat codec](self, "codec"));
  if (!-[MPCPlayerAudioFormat renderingMode](self, "renderingMode")
    || -[MPCPlayerAudioFormat renderingMode](self, "renderingMode") == 5)
  {
    objc_msgSend(v3, "setSpatialized:", -[MPCPlayerAudioFormat isSpatialized](self, "isSpatialized"));
  }
  objc_msgSend(v3, "setMultiChannel:", -[MPCPlayerAudioFormat isMultiChannel](self, "isMultiChannel"));
  objc_msgSend(v3, "setChannelLayout:", -[MPCPlayerAudioFormat channelLayout](self, "channelLayout"));
  -[MPCPlayerAudioFormat audioChannelLayoutDescription](self, "audioChannelLayoutDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAudioChannelLayoutDescription:", v4);

  -[MPCPlayerAudioFormat groupID](self, "groupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGroupID:", v5);

  -[MPCPlayerAudioFormat stableVariantID](self, "stableVariantID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStableVariantID:", v6);

  objc_msgSend(v3, "setRenderingMode:", -[MPCPlayerAudioFormat renderingMode](self, "renderingMode"));
  return (MPNowPlayingInfoAudioFormat *)v3;
}

- (MPCPlayerAudioFormat)initWithTier:(int64_t)a3 codec:(unsigned int)a4 spatialized:(BOOL)a5 multiChannel:(BOOL)a6 channelLayout:(unsigned int)a7 sampleRate:(int64_t)a8 stableVariantID:(id)a9
{
  uint64_t v10;
  id v16;
  MPCPlayerAudioFormat *v17;
  MPCPlayerAudioFormat *v18;
  void *v19;
  uint64_t v20;
  NSString *audioChannelLayoutDescription;
  objc_super v23;

  v10 = *(_QWORD *)&a7;
  v16 = a9;
  v23.receiver = self;
  v23.super_class = (Class)MPCPlayerAudioFormat;
  v17 = -[MPCPlayerAudioFormat init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_tier = a3;
    v17->_spatialized = a5;
    v17->_multiChannel = a6;
    v17->_codec = a4;
    v17->_channelLayout = v10;
    -[MPCPlayerAudioFormat _descriptionForChannelLayoutTag:](v17, "_descriptionForChannelLayoutTag:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    audioChannelLayoutDescription = v18->_audioChannelLayoutDescription;
    v18->_audioChannelLayoutDescription = (NSString *)v20;

    v18->_sampleRate = a8;
    objc_storeStrong((id *)&v18->_stableVariantID, a9);
    v18->_renderingMode = 0;
  }

  return v18;
}

- (MPCPlayerAudioFormat)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  MPCPlayerAudioFormat *v5;
  MPCPlayerAudioFormat *v6;
  void *v7;
  uint64_t v8;
  NSString *groupID;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *stableVariantID;
  uint64_t v18;
  NSString *audioChannelLayoutDescription;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MPCPlayerAudioFormat;
  v5 = -[MPCPlayerAudioFormat init](&v24, sel_init);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tier"));
  v6 = (MPCPlayerAudioFormat *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_tier = objc_msgSend(v7, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("grp"));
    v8 = objc_claimAutoreleasedReturnValue();
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("br"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_bitrate = objc_msgSend(v10, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sr"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sampleRate = objc_msgSend(v11, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bd"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_bitDepth = objc_msgSend(v12, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("codec"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_codec = objc_msgSend(v13, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("chlay"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_channelLayout = objc_msgSend(v14, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ochlay"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_originChannelLayout = objc_msgSend(v15, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("var"));
    v16 = objc_claimAutoreleasedReturnValue();
    stableVariantID = v5->_stableVariantID;
    v5->_stableVariantID = (NSString *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("chlayd"));
    v18 = objc_claimAutoreleasedReturnValue();
    audioChannelLayoutDescription = v5->_audioChannelLayoutDescription;
    v5->_audioChannelLayoutDescription = (NSString *)v18;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spz"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_spatialized = objc_msgSend(v20, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mul"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_multiChannel = objc_msgSend(v21, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rdm"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_renderingMode = objc_msgSend(v22, "integerValue");

LABEL_4:
    v6 = v5;
  }

  return v6;
}

- (MPCPlayerAudioFormat)audioFormatWithRenderingMode:(int64_t)a3
{
  MPCPlayerAudioFormat *v5;
  uint64_t v6;
  NSString *groupID;
  uint64_t v8;
  NSString *stableVariantID;
  uint64_t v10;
  NSString *audioChannelLayoutDescription;

  if (-[MPCPlayerAudioFormat renderingMode](self, "renderingMode") == a3)
  {
    v5 = self;
  }
  else
  {
    v5 = (MPCPlayerAudioFormat *)objc_opt_new();
    v5->_tier = -[MPCPlayerAudioFormat tier](self, "tier");
    -[MPCPlayerAudioFormat groupID](self, "groupID");
    v6 = objc_claimAutoreleasedReturnValue();
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v6;

    v5->_bitrate = -[MPCPlayerAudioFormat bitrate](self, "bitrate");
    v5->_sampleRate = -[MPCPlayerAudioFormat sampleRate](self, "sampleRate");
    v5->_bitDepth = -[MPCPlayerAudioFormat bitDepth](self, "bitDepth");
    v5->_codec = -[MPCPlayerAudioFormat codec](self, "codec");
    v5->_channelLayout = -[MPCPlayerAudioFormat channelLayout](self, "channelLayout");
    -[MPCPlayerAudioFormat stableVariantID](self, "stableVariantID");
    v8 = objc_claimAutoreleasedReturnValue();
    stableVariantID = v5->_stableVariantID;
    v5->_stableVariantID = (NSString *)v8;

    -[MPCPlayerAudioFormat audioChannelLayoutDescription](self, "audioChannelLayoutDescription");
    v10 = objc_claimAutoreleasedReturnValue();
    audioChannelLayoutDescription = v5->_audioChannelLayoutDescription;
    v5->_audioChannelLayoutDescription = (NSString *)v10;

    v5->_spatialized = -[MPCPlayerAudioFormat isSpatialized](self, "isSpatialized");
    v5->_multiChannel = -[MPCPlayerAudioFormat isMultiChannel](self, "isMultiChannel");
    v5->_renderingMode = a3;
  }
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *groupID;
  NSString *audioChannelLayoutDescription;
  const __CFString *stableVariantID;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[13];
  _QWORD v21[15];

  v21[13] = *MEMORY[0x24BDAC8D0];
  v20[0] = CFSTR("tier");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_tier);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v19;
  v20[1] = CFSTR("br");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_bitrate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v3;
  v20[2] = CFSTR("sr");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_sampleRate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v4;
  v20[3] = CFSTR("bd");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_bitDepth);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v5;
  v20[4] = CFSTR("codec");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_codec);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v6;
  v20[5] = CFSTR("chlay");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channelLayout);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v7;
  v20[6] = CFSTR("ochlay");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_originChannelLayout);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = &stru_24CABB5D0;
  audioChannelLayoutDescription = self->_audioChannelLayoutDescription;
  groupID = (const __CFString *)self->_groupID;
  if (!groupID)
    groupID = &stru_24CABB5D0;
  v21[6] = v8;
  v21[7] = groupID;
  v20[7] = CFSTR("grp");
  v20[8] = CFSTR("var");
  stableVariantID = (const __CFString *)self->_stableVariantID;
  if (!stableVariantID)
    stableVariantID = &stru_24CABB5D0;
  if (audioChannelLayoutDescription)
    v10 = (const __CFString *)audioChannelLayoutDescription;
  v21[8] = stableVariantID;
  v21[9] = v10;
  v20[9] = CFSTR("chlayd");
  v20[10] = CFSTR("spz");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_spatialized);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[10] = v14;
  v20[11] = CFSTR("mul");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_multiChannel);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[11] = v15;
  v20[12] = CFSTR("rdm");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_renderingMode);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[12] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v17;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[MPCPlayerAudioFormat humanDescription](self, "humanDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)humanDescription
{
  void *v3;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int channelLayout;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t renderingMode;
  const __CFString *v34;
  void *v35;
  void *v36;
  uint64_t v38;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[MPCPlayerAudioFormat debugTierDescription](self, "debugTierDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("tier: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  if (self->_bitrate)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    -[MPCPlayerAudioFormat debugBitRateDescription](self, "debugBitRateDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("bitrate: %@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  if (self->_groupID)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("groupID: %@"), self->_groupID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  if (self->_bitDepth)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    -[MPCPlayerAudioFormat debugBitDepthDescription](self, "debugBitDepthDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("bitDepth: %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  if (self->_sampleRate)
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    -[MPCPlayerAudioFormat debugSampleRateDescription](self, "debugSampleRateDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("sampleRate: %@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v16);

  }
  if (self->_codec)
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    -[MPCPlayerAudioFormat debugCodecDescription](self, "debugCodecDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("codec: %@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v19);

  }
  channelLayout = self->_channelLayout;
  if (channelLayout != -65536 && channelLayout)
  {
    v21 = (void *)MEMORY[0x24BDD17C8];
    -[MPCPlayerAudioFormat debugChannelCountDescription](self, "debugChannelCountDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("channels: %@"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v23);

  }
  if (self->_audioChannelLayoutDescription)
  {
    v24 = (void *)MEMORY[0x24BDD17C8];
    -[MPCPlayerAudioFormat debugChannelLayoutDescription](self, "debugChannelLayoutDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("layout: %@"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v26);

  }
  if (self->_originChannelLayout)
  {
    -[MPCPlayerAudioFormat debugOriginChannelLayoutDescription](self, "debugOriginChannelLayoutDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BDD17C8];
    -[MPCPlayerAudioFormat debugOriginChannelCountDescription](self, "debugOriginChannelCountDescription");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    if (v27)
      objc_msgSend(v28, "stringWithFormat:", CFSTR("origin channels: %@ [%@]"), v29, v27);
    else
      objc_msgSend(v28, "stringWithFormat:", CFSTR("origin channels: %@"), v29, v38);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v31);

  }
  if (self->_spatialized)
    objc_msgSend(v3, "addObject:", CFSTR("spatialized"));
  if (self->_multiChannel)
    objc_msgSend(v3, "addObject:", CFSTR("multichannel"));
  if (self->_stableVariantID)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("stableVariantID: %@"), self->_stableVariantID);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v32);

  }
  renderingMode = self->_renderingMode;
  if (renderingMode)
  {
    if (renderingMode > 5)
      v34 = CFSTR("Unknown");
    else
      v34 = off_24CAB8730[renderingMode - 1];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rendering: %@"), v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v35);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v36;
}

- (NSString)debugTierDescription
{
  return (NSString *)NSStringFromMPCPlayerAudioFormatTier(self->_tier);
}

- (NSString)debugBitRateDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ldkbps"), self->_bitrate / 1000);
}

- (NSString)debugBitDepthDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d-bit"), self->_bitDepth);
}

- (NSString)debugSampleRateDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ldkhz"), self->_sampleRate / 1000);
}

- (NSString)debugCodecDescription
{
  unsigned int v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = bswap32(self->_codec);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c%c%c%c"), v2, BYTE1(v2), BYTE2(v2), HIBYTE(v2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)debugChannelCountDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), LOWORD(self->_channelLayout));
}

- (id)debugOriginChannelCountDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), LOWORD(self->_originChannelLayout));
}

- (NSString)debugChannelLayoutDescription
{
  return self->_audioChannelLayoutDescription;
}

- (id)debugOriginChannelLayoutDescription
{
  return -[MPCPlayerAudioFormat _descriptionForChannelLayoutTag:](self, "_descriptionForChannelLayoutTag:", self->_originChannelLayout);
}

- (BOOL)isEqual:(id)a3
{
  MPCPlayerAudioFormat *v4;
  MPCPlayerAudioFormat *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  _BOOL4 v11;
  _BOOL4 v12;
  unsigned int v13;
  uint64_t v14;
  BOOL v15;

  v4 = (MPCPlayerAudioFormat *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[MPCPlayerAudioFormat tier](v5, "tier");
      if (v6 == -[MPCPlayerAudioFormat tier](self, "tier")
        && (v7 = -[MPCPlayerAudioFormat bitrate](v5, "bitrate"), v7 == -[MPCPlayerAudioFormat bitrate](self, "bitrate"))
        && (v8 = -[MPCPlayerAudioFormat sampleRate](v5, "sampleRate"),
            v8 == -[MPCPlayerAudioFormat sampleRate](self, "sampleRate"))
        && (v9 = -[MPCPlayerAudioFormat bitDepth](v5, "bitDepth"),
            v9 == -[MPCPlayerAudioFormat bitDepth](self, "bitDepth"))
        && (v10 = -[MPCPlayerAudioFormat codec](v5, "codec"), v10 == -[MPCPlayerAudioFormat codec](self, "codec"))
        && (v11 = -[MPCPlayerAudioFormat isSpatialized](v5, "isSpatialized"),
            v11 == -[MPCPlayerAudioFormat isSpatialized](self, "isSpatialized"))
        && (v12 = -[MPCPlayerAudioFormat isMultiChannel](v5, "isMultiChannel"),
            v12 == -[MPCPlayerAudioFormat isMultiChannel](self, "isMultiChannel"))
        && (v13 = -[MPCPlayerAudioFormat channelLayout](v5, "channelLayout"),
            v13 == -[MPCPlayerAudioFormat channelLayout](self, "channelLayout")))
      {
        v14 = -[MPCPlayerAudioFormat renderingMode](v5, "renderingMode");
        v15 = v14 == -[MPCPlayerAudioFormat renderingMode](self, "renderingMode");
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (BOOL)_isSpatialFormat:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IS-ATMOS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  LOBYTE(self) = -[MPCPlayerAudioFormat _isDerivedFromSpatialFormat:](self, "_isDerivedFromSpatialFormat:", v4);
  return v6 | self;
}

- (BOOL)_isMultichannelFormat:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  BOOL v9;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CHANNEL-COUNT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ORIGIN-CHANNEL-COUNT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "integerValue");
  v8 = v5 == 2;
  if (v7 <= 2)
    v8 = 0;
  v9 = v5 > 2 || v8;

  return v9;
}

- (BOOL)_isDerivedFromSpatialFormat:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ORIGIN-IS-ATMOS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)_isBinauralFormat:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CHANNEL-USAGE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("BINAURAL"));

  return v4;
}

- (int64_t)_computedTierFromHLSDataWithChannelCount:(int64_t)a3
{
  if (self->_codec == 1634492771)
  {
    if (self->_sampleRate < 48001)
      return 2;
    else
      return 3;
  }
  else if (!self->_spatialized && a3 <= 2)
  {
    return self->_bitrate > 128000;
  }
  else
  {
    return 4;
  }
}

- (unsigned)_computedChannelLayoutTagFromHLSData:(id)a3 channelCount:(int64_t)a4
{
  id v6;
  BOOL v7;
  unsigned int v8;
  int64_t v9;

  v6 = a3;
  if (-[MPCPlayerAudioFormat _isSpatialFormat:](self, "_isSpatialFormat:", v6))
  {
    if (a4 < 3)
      goto LABEL_8;
LABEL_6:
    if ((unint64_t)(a4 - 3) >= 0xE)
LABEL_12:
      v8 = 6619138;
    else
      v8 = dword_210ED93E4[a4 - 3];
    goto LABEL_13;
  }
  v7 = -[MPCPlayerAudioFormat _isDerivedFromSpatialFormat:](self, "_isDerivedFromSpatialFormat:", v6);
  if (a4 >= 3 && v7)
    goto LABEL_6;
LABEL_8:
  v9 = a4 - 1;
  v8 = 6553601;
  switch(v9)
  {
    case 0:
      break;
    case 1:
      if (-[MPCPlayerAudioFormat _isBinauralFormat:](self, "_isBinauralFormat:", v6))
        v8 = 6946818;
      else
        v8 = 6619138;
      break;
    case 2:
      v8 = 7471107;
      break;
    case 3:
      v8 = 7602180;
      break;
    case 4:
      v8 = 7864325;
      break;
    case 5:
      v8 = 8126470;
      break;
    case 6:
      v8 = 9306119;
      break;
    case 7:
      v8 = 8323080;
      break;
    case 8:
      v8 = 11796489;
      break;
    default:
      goto LABEL_12;
  }
LABEL_13:

  return v8;
}

- (BOOL)_isHLSVersion:(id)a3 greatherThanOrEqualTo:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "compare:", v6))
    v7 = objc_msgSend(v5, "compare:", v6) == 1;
  else
    v7 = 1;

  return v7;
}

- (id)_descriptionForChannelLayoutTag:(unsigned int)a3
{
  id result;
  signed int v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  BOOL v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  const __CFString *v12;

  result = CFSTR("unknown");
  if ((int)a3 > 8323079)
  {
    if ((int)a3 > 12648463)
    {
      v4 = 12779529;
      v12 = CFSTR("7.1.2");
      if (a3 != 12845066)
        v12 = CFSTR("unknown");
      if (a3 == 12779530)
        v6 = CFSTR("5.1.4");
      else
        v6 = v12;
      v7 = CFSTR("9.1.6");
      v8 = a3 == 12713992;
      v9 = CFSTR("5.1.2");
      v10 = 12648464;
    }
    else
    {
      v4 = 11796488;
      v5 = CFSTR("7.1.4");
      if (a3 != 12582924)
        v5 = CFSTR("unknown");
      if (a3 == 11796489)
        v6 = CFSTR("8.1");
      else
        v6 = v5;
      v7 = CFSTR("7.1");
      v8 = a3 == 9306119;
      v9 = CFSTR("6.1");
      v10 = 8323080;
    }
    goto LABEL_26;
  }
  if ((int)a3 > 7471106)
  {
    v4 = 7864324;
    v11 = CFSTR("5.1");
    if (a3 != 8126470)
      v11 = CFSTR("unknown");
    if (a3 == 7864325)
      v6 = CFSTR("5.0");
    else
      v6 = v11;
    v7 = CFSTR("3.0");
    v8 = a3 == 7602180;
    v9 = CFSTR("4.0");
    v10 = 7471107;
LABEL_26:
    if (!v8)
      v9 = CFSTR("unknown");
    if (a3 != v10)
      v7 = v9;
    if ((int)a3 <= v4)
      return (id)v7;
    else
      return (id)v6;
  }
  if ((int)a3 > 6684673)
  {
    if (a3 != 6684674)
    {
      if (a3 == 6946818)
        return CFSTR("Binaural");
      return result;
    }
    return CFSTR("Stereo");
  }
  if (a3 == 6553601)
    return CFSTR("Mono");
  if (a3 == 6619138)
    return CFSTR("Stereo");
  return result;
}

- (id)analyticsFormatInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPCPlayerAudioFormat bitrate](self, "bitrate"))
  {
    -[MPCPlayerAudioFormat debugBitRateDescription](self, "debugBitRateDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("bitrate"));

  }
  if (-[MPCPlayerAudioFormat codec](self, "codec"))
  {
    -[MPCPlayerAudioFormat debugCodecDescription](self, "debugCodecDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("codec"));

  }
  if (-[MPCPlayerAudioFormat bitDepth](self, "bitDepth"))
  {
    -[MPCPlayerAudioFormat debugBitDepthDescription](self, "debugBitDepthDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("bitDepth"));

  }
  if (-[MPCPlayerAudioFormat channelLayout](self, "channelLayout") != -1
    && -[MPCPlayerAudioFormat channelLayout](self, "channelLayout"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (unsigned __int16)-[MPCPlayerAudioFormat channelLayout](self, "channelLayout"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("channelCount"));

    -[MPCPlayerAudioFormat debugChannelLayoutDescription](self, "debugChannelLayoutDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("layout"));

  }
  if (-[MPCPlayerAudioFormat sampleRate](self, "sampleRate"))
  {
    -[MPCPlayerAudioFormat debugSampleRateDescription](self, "debugSampleRateDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("sampleRate"));

  }
  return v3;
}

- (int64_t)tier
{
  return self->_tier;
}

- (int64_t)bitrate
{
  return self->_bitrate;
}

- (int64_t)sampleRate
{
  return self->_sampleRate;
}

- (int64_t)bitDepth
{
  return self->_bitDepth;
}

- (unsigned)codec
{
  return self->_codec;
}

- (BOOL)isSpatialized
{
  return self->_spatialized;
}

- (BOOL)isMultiChannel
{
  return self->_multiChannel;
}

- (int64_t)renderingMode
{
  return self->_renderingMode;
}

- (unsigned)channelLayout
{
  return self->_channelLayout;
}

- (NSString)audioChannelLayoutDescription
{
  return self->_audioChannelLayoutDescription;
}

- (unsigned)originChannelLayout
{
  return self->_originChannelLayout;
}

- (void)setOriginChannelLayout:(unsigned int)a3
{
  self->_originChannelLayout = a3;
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

+ (id)lossyLowQualityStereoFormat
{
  MPCPlayerAudioFormat *v2;
  void *v3;
  MPCPlayerAudioFormat *v4;
  _QWORD v6[7];
  _QWORD v7[8];

  v7[7] = *MEMORY[0x24BDAC8D0];
  v2 = [MPCPlayerAudioFormat alloc];
  v6[0] = CFSTR("tier");
  v6[1] = CFSTR("chlay");
  v7[0] = &unk_24CB16EC0;
  v7[1] = &unk_24CB16ED8;
  v6[2] = CFSTR("chlayd");
  v6[3] = CFSTR("spz");
  v7[2] = CFSTR("Stereo");
  v7[3] = MEMORY[0x24BDBD1C0];
  v6[4] = CFSTR("mul");
  v6[5] = CFSTR("var");
  v7[4] = MEMORY[0x24BDBD1C0];
  v7[5] = CFSTR("LQ-Stereo");
  v6[6] = CFSTR("grp");
  v7[6] = CFSTR("Synthesized format");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MPCPlayerAudioFormat initWithDictionaryRepresentation:](v2, "initWithDictionaryRepresentation:", v3);

  return v4;
}

+ (id)lossyHighQualityStereoFormat
{
  MPCPlayerAudioFormat *v2;
  void *v3;
  MPCPlayerAudioFormat *v4;
  _QWORD v6[7];
  _QWORD v7[8];

  v7[7] = *MEMORY[0x24BDAC8D0];
  v2 = [MPCPlayerAudioFormat alloc];
  v6[0] = CFSTR("tier");
  v6[1] = CFSTR("chlay");
  v7[0] = &unk_24CB16EF0;
  v7[1] = &unk_24CB16ED8;
  v6[2] = CFSTR("chlayd");
  v6[3] = CFSTR("spz");
  v7[2] = CFSTR("Stereo");
  v7[3] = MEMORY[0x24BDBD1C0];
  v6[4] = CFSTR("mul");
  v6[5] = CFSTR("var");
  v7[4] = MEMORY[0x24BDBD1C0];
  v7[5] = CFSTR("HQ-Stereo");
  v6[6] = CFSTR("grp");
  v7[6] = CFSTR("Synthesized format");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MPCPlayerAudioFormat initWithDictionaryRepresentation:](v2, "initWithDictionaryRepresentation:", v3);

  return v4;
}

+ (id)payloadValueFromJSONValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionaryRepresentation:", v4);

  return v5;
}

@end
