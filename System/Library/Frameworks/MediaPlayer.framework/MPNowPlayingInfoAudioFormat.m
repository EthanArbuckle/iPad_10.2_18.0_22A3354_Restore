@implementation MPNowPlayingInfoAudioFormat

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteAudioFormat, 0);
}

- (MPNowPlayingInfoAudioFormat)initWithMediaRemoteAudioFormat:(id)a3
{
  id v5;
  MPNowPlayingInfoAudioFormat *v6;
  MPNowPlayingInfoAudioFormat *v7;
  MPNowPlayingInfoAudioFormat *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)MPNowPlayingInfoAudioFormat;
    v6 = -[MPNowPlayingInfoAudioFormat init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_mediaRemoteAudioFormat, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (MPNowPlayingInfoAudioFormat)init
{
  MPNowPlayingInfoAudioFormat *v2;
  MRContentItemMetadataAudioFormat *v3;
  MRContentItemMetadataAudioFormat *mediaRemoteAudioFormat;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPNowPlayingInfoAudioFormat;
  v2 = -[MPNowPlayingInfoAudioFormat init](&v6, sel_init);
  if (v2)
  {
    v3 = (MRContentItemMetadataAudioFormat *)objc_alloc_init(MEMORY[0x1E0D4C538]);
    mediaRemoteAudioFormat = v2->_mediaRemoteAudioFormat;
    v2->_mediaRemoteAudioFormat = v3;

  }
  return v2;
}

- (int64_t)tier
{
  void *v2;
  uint64_t v3;
  int64_t v4;

  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tier");
  if ((unint64_t)(v3 - 1) >= 4)
    v4 = 0;
  else
    v4 = v3;

  return v4;
}

- (void)setTier:(int64_t)a3
{
  int64_t v3;
  id v4;

  if ((unint64_t)(a3 - 1) >= 4)
    v3 = 0;
  else
    v3 = a3;
  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTier:", v3);

}

- (int64_t)bitrate
{
  void *v2;
  int64_t v3;

  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bitrate");

  return v3;
}

- (void)setBitrate:(int64_t)a3
{
  id v4;

  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBitrate:", a3);

}

- (int64_t)sampleRate
{
  void *v2;
  int64_t v3;

  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sampleRate");

  return v3;
}

- (void)setSampleRate:(int64_t)a3
{
  id v4;

  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSampleRate:", a3);

}

- (int64_t)bitDepth
{
  void *v2;
  int64_t v3;

  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bitDepth");

  return v3;
}

- (void)setBitDepth:(int64_t)a3
{
  id v4;

  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBitDepth:", a3);

}

- (unsigned)codec
{
  void *v2;
  unsigned int v3;

  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "codec");

  return v3;
}

- (void)setCodec:(unsigned int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCodec:", v3);

}

- (NSString)groupID
{
  void *v2;
  void *v3;

  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setGroupID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGroupID:", v4);

}

- (NSString)stableVariantID
{
  void *v2;
  void *v3;

  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stableVariantID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setStableVariantID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStableVariantID:", v4);

}

- (BOOL)isSpatialized
{
  void *v2;
  char v3;

  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSpatialized");

  return v3;
}

- (void)setSpatialized:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpatialized:", v3);

}

- (BOOL)isMultiChannel
{
  void *v2;
  char v3;

  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMultiChannel");

  return v3;
}

- (void)setMultiChannel:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMultiChannel:", v3);

}

- (int64_t)renderingMode
{
  void *v2;
  uint64_t v3;
  int64_t v4;

  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "renderingMode");
  if ((unint64_t)(v3 - 1) >= 5)
    v4 = 0;
  else
    v4 = v3;

  return v4;
}

- (void)setRenderingMode:(int64_t)a3
{
  int64_t v3;
  id v4;

  if ((unint64_t)(a3 - 1) >= 5)
    v3 = 0;
  else
    v3 = a3;
  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRenderingMode:", v3);

}

- (unsigned)channelLayout
{
  void *v2;
  unsigned int v3;

  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "channelLayout");

  return v3;
}

- (void)setChannelLayout:(unsigned int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setChannelLayout:", v3);

}

- (NSString)audioChannelLayoutDescription
{
  void *v2;
  void *v3;

  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioChannelLayoutDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setAudioChannelLayoutDescription:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPNowPlayingInfoAudioFormat mediaRemoteAudioFormat](self, "mediaRemoteAudioFormat");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAudioChannelLayoutDescription:", v4);

}

- (unint64_t)hash
{
  return -[MRContentItemMetadataAudioFormat hash](self->_mediaRemoteAudioFormat, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[MRContentItemMetadataAudioFormat isEqual:](self->_mediaRemoteAudioFormat, "isEqual:", v4[1]);
  else
    v5 = 0;

  return v5;
}

- (int64_t)badging
{
  int64_t v3;
  int64_t result;
  unint64_t v5;
  int64_t v6;

  v3 = -[MPNowPlayingInfoAudioFormat renderingMode](self, "renderingMode") - 1;
  result = 1;
  switch(v3)
  {
    case 0:
      v5 = -[MPNowPlayingInfoAudioFormat tier](self, "tier");
      if (v5 >= 5)
        goto LABEL_4;
      result = qword_193F09970[v5];
      break;
    case 2:
      result = 5;
      break;
    case 3:
      result = 2;
      break;
    case 4:
      return result;
    default:
LABEL_4:
      v6 = -[MPNowPlayingInfoAudioFormat tier](self, "tier");
      switch(v6)
      {
        case 2:
          result = 3;
          break;
        case 3:
          result = 4;
          break;
        case 4:
          if (-[MPNowPlayingInfoAudioFormat isSpatialized](self, "isSpatialized"))
            result = 1;
          else
            result = 2;
          break;
        default:
          result = 0;
          break;
      }
      break;
  }
  return result;
}

- (MPNowPlayingInfoAudioFormat)initWithCoder:(id)a3
{
  id v4;
  MPNowPlayingInfoAudioFormat *v5;
  MRContentItemMetadataAudioFormat *v6;
  MRContentItemMetadataAudioFormat *mediaRemoteAudioFormat;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MPNowPlayingInfoAudioFormat;
  v5 = -[MPNowPlayingInfoAudioFormat init](&v18, sel_init);
  if (v5)
  {
    v6 = (MRContentItemMetadataAudioFormat *)objc_alloc_init(MEMORY[0x1E0D4C538]);
    mediaRemoteAudioFormat = v5->_mediaRemoteAudioFormat;
    v5->_mediaRemoteAudioFormat = v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nptier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPNowPlayingInfoAudioFormat setTier:](v5, "setTier:", objc_msgSend(v8, "integerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("npbr"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPNowPlayingInfoAudioFormat setBitrate:](v5, "setBitrate:", objc_msgSend(v9, "integerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("npsr"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPNowPlayingInfoAudioFormat setSampleRate:](v5, "setSampleRate:", objc_msgSend(v10, "integerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("npbd"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPNowPlayingInfoAudioFormat setBitDepth:](v5, "setBitDepth:", objc_msgSend(v11, "integerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("npcodec"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPNowPlayingInfoAudioFormat setCodec:](v5, "setCodec:", objc_msgSend(v12, "unsignedIntValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("npgrp"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPNowPlayingInfoAudioFormat setGroupID:](v5, "setGroupID:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("npvar"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPNowPlayingInfoAudioFormat setStableVariantID:](v5, "setStableVariantID:", v14);

    -[MPNowPlayingInfoAudioFormat setSpatialized:](v5, "setSpatialized:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("npspz")));
    -[MPNowPlayingInfoAudioFormat setMultiChannel:](v5, "setMultiChannel:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("npmul")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("npchlay"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPNowPlayingInfoAudioFormat setChannelLayout:](v5, "setChannelLayout:", objc_msgSend(v15, "unsignedIntValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("npchlayd"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPNowPlayingInfoAudioFormat setAudioChannelLayoutDescription:](v5, "setAudioChannelLayoutDescription:", v16);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", -[MPNowPlayingInfoAudioFormat tier](self, "tier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("nptier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MPNowPlayingInfoAudioFormat bitrate](self, "bitrate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("npbr"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MPNowPlayingInfoAudioFormat sampleRate](self, "sampleRate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("npsr"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MPNowPlayingInfoAudioFormat bitDepth](self, "bitDepth"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("npbd"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MPNowPlayingInfoAudioFormat codec](self, "codec"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("npcodec"));

  -[MPNowPlayingInfoAudioFormat groupID](self, "groupID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("npgrp"));

  -[MPNowPlayingInfoAudioFormat stableVariantID](self, "stableVariantID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("npvar"));

  objc_msgSend(v5, "encodeBool:forKey:", -[MPNowPlayingInfoAudioFormat isSpatialized](self, "isSpatialized"), CFSTR("npspz"));
  objc_msgSend(v5, "encodeBool:forKey:", -[MPNowPlayingInfoAudioFormat isMultiChannel](self, "isMultiChannel"), CFSTR("npmul"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MPNowPlayingInfoAudioFormat channelLayout](self, "channelLayout"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("npchlay"));

  -[MPNowPlayingInfoAudioFormat audioChannelLayoutDescription](self, "audioChannelLayoutDescription");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v14, CFSTR("npchlayd"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MPNowPlayingInfoAudioFormat humanDescription](self, "humanDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)humanDescription
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[MPNowPlayingInfoAudioFormat debugTierDescription](self, "debugTierDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("tier: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  if (-[MPNowPlayingInfoAudioFormat bitrate](self, "bitrate"))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[MPNowPlayingInfoAudioFormat debugBitRateDescription](self, "debugBitRateDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("bitrate: %@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  -[MPNowPlayingInfoAudioFormat groupID](self, "groupID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[MPNowPlayingInfoAudioFormat groupID](self, "groupID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("groupID: %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  if (-[MPNowPlayingInfoAudioFormat bitDepth](self, "bitDepth"))
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    -[MPNowPlayingInfoAudioFormat debugBitDepthDescription](self, "debugBitDepthDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("bitDepth: %@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v16);

  }
  if (-[MPNowPlayingInfoAudioFormat sampleRate](self, "sampleRate"))
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    -[MPNowPlayingInfoAudioFormat debugSampleRateDescription](self, "debugSampleRateDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("sampleRate: %@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v19);

  }
  if (-[MPNowPlayingInfoAudioFormat codec](self, "codec"))
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    -[MPNowPlayingInfoAudioFormat debugCodecDescription](self, "debugCodecDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("codec: %@"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v22);

  }
  if (-[MPNowPlayingInfoAudioFormat channelLayout](self, "channelLayout")
    && -[MPNowPlayingInfoAudioFormat channelLayout](self, "channelLayout") != -65536)
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    -[MPNowPlayingInfoAudioFormat debugChannelCountDescription](self, "debugChannelCountDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("channels: %@"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v25);

  }
  -[MPNowPlayingInfoAudioFormat audioChannelLayoutDescription](self, "audioChannelLayoutDescription");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    -[MPNowPlayingInfoAudioFormat debugChannelLayoutDescription](self, "debugChannelLayoutDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("layout: %@"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v29);

  }
  if (-[MPNowPlayingInfoAudioFormat isSpatialized](self, "isSpatialized"))
    objc_msgSend(v3, "addObject:", CFSTR("spatialized"));
  if (-[MPNowPlayingInfoAudioFormat isMultiChannel](self, "isMultiChannel"))
    objc_msgSend(v3, "addObject:", CFSTR("multichannel"));
  if (-[MPNowPlayingInfoAudioFormat renderingMode](self, "renderingMode"))
  {
    v30 = (void *)MEMORY[0x1E0CB3940];
    -[MPNowPlayingInfoAudioFormat debugRenderingModeDescription](self, "debugRenderingModeDescription");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("renderingMode: %@"), v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v32);

  }
  v33 = (void *)MEMORY[0x1E0CB3940];
  -[MPNowPlayingInfoAudioFormat debugBadgingDescription](self, "debugBadgingDescription");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringWithFormat:", CFSTR("badging: %@"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v35);

  -[MPNowPlayingInfoAudioFormat stableVariantID](self, "stableVariantID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v37 = (void *)MEMORY[0x1E0CB3940];
    -[MPNowPlayingInfoAudioFormat stableVariantID](self, "stableVariantID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringWithFormat:", CFSTR("stableVariantID: %@"), v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v39);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (id)debugTierDescription
{
  unint64_t v2;

  v2 = -[MPNowPlayingInfoAudioFormat tier](self, "tier");
  if (v2 < 5)
    return off_1E3153B10[v2];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown-%ld"), v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)debugBitRateDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ldkbps"), -[MPNowPlayingInfoAudioFormat bitrate](self, "bitrate") / 1000);
}

- (id)debugBitDepthDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d-bit"), -[MPNowPlayingInfoAudioFormat bitDepth](self, "bitDepth"));
}

- (id)debugSampleRateDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ldkhz"), -[MPNowPlayingInfoAudioFormat sampleRate](self, "sampleRate") / 1000);
}

- (id)debugCodecDescription
{
  unsigned int v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = bswap32(-[MPNowPlayingInfoAudioFormat codec](self, "codec"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c%c%c"), v2, BYTE1(v2), BYTE2(v2), HIBYTE(v2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)debugChannelCountDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), (unsigned __int16)-[MPNowPlayingInfoAudioFormat channelLayout](self, "channelLayout"));
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

- (id)debugRenderingModeDescription
{
  int64_t v2;

  v2 = -[MPNowPlayingInfoAudioFormat renderingMode](self, "renderingMode");
  if ((unint64_t)(v2 - 1) > 4)
    return CFSTR("Unknown");
  else
    return off_1E3153B38[v2 - 1];
}

- (id)debugBadgingDescription
{
  unint64_t v2;

  v2 = -[MPNowPlayingInfoAudioFormat badging](self, "badging");
  if (v2 > 5)
    return CFSTR("Unknown");
  else
    return off_1E3153B60[v2];
}

- (MRContentItemMetadataAudioFormat)mediaRemoteAudioFormat
{
  return self->_mediaRemoteAudioFormat;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
