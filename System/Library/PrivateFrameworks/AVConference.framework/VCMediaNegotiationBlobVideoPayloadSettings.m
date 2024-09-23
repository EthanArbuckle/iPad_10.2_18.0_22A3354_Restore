@implementation VCMediaNegotiationBlobVideoPayloadSettings

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCMediaNegotiationBlobVideoPayloadSettings setVideoRuleCollections:](self, "setVideoRuleCollections:", 0);
  -[VCMediaNegotiationBlobVideoPayloadSettings setFeatureString:](self, "setFeatureString:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobVideoPayloadSettings;
  -[VCMediaNegotiationBlobVideoPayloadSettings dealloc](&v3, sel_dealloc);
}

- (void)clearVideoRuleCollections
{
  -[NSMutableArray removeAllObjects](self->_videoRuleCollections, "removeAllObjects");
}

- (void)addVideoRuleCollections:(id)a3
{
  NSMutableArray *videoRuleCollections;

  videoRuleCollections = self->_videoRuleCollections;
  if (!videoRuleCollections)
  {
    videoRuleCollections = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_videoRuleCollections = videoRuleCollections;
  }
  -[NSMutableArray addObject:](videoRuleCollections, "addObject:", a3);
}

- (unint64_t)videoRuleCollectionsCount
{
  return -[NSMutableArray count](self->_videoRuleCollections, "count");
}

- (id)videoRuleCollectionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_videoRuleCollections, "objectAtIndex:", a3);
}

+ (Class)videoRuleCollectionsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobVideoPayloadSettings;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationBlobVideoPayloadSettings description](&v3, sel_description), -[VCMediaNegotiationBlobVideoPayloadSettings dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *videoRuleCollections;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSString *featureString;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_payload), CFSTR("payload"));
  if (-[NSMutableArray count](self->_videoRuleCollections, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_videoRuleCollections, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    videoRuleCollections = self->_videoRuleCollections;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoRuleCollections, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(videoRuleCollections);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoRuleCollections, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("videoRuleCollections"));

  }
  featureString = self->_featureString;
  if (featureString)
    objc_msgSend(v3, "setObject:forKey:", featureString, CFSTR("featureString"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_parameterSet), CFSTR("parameterSet"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobVideoPayloadSettingsReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *videoRuleCollections;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PBDataWriterWriteUint32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  videoRuleCollections = self->_videoRuleCollections;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoRuleCollections, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(videoRuleCollections);
        PBDataWriterWriteSubmessage();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoRuleCollections, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v6);
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;

  *((_DWORD *)a3 + 5) = self->_payload;
  if (-[VCMediaNegotiationBlobVideoPayloadSettings videoRuleCollectionsCount](self, "videoRuleCollectionsCount"))
  {
    objc_msgSend(a3, "clearVideoRuleCollections");
    v5 = -[VCMediaNegotiationBlobVideoPayloadSettings videoRuleCollectionsCount](self, "videoRuleCollectionsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addVideoRuleCollections:", -[VCMediaNegotiationBlobVideoPayloadSettings videoRuleCollectionsAtIndex:](self, "videoRuleCollectionsAtIndex:", i));
    }
  }
  objc_msgSend(a3, "setFeatureString:", self->_featureString);
  *((_DWORD *)a3 + 4) = self->_parameterSet;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *videoRuleCollections;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 20) = self->_payload;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  videoRuleCollections = self->_videoRuleCollections;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoRuleCollections, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(videoRuleCollections);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addVideoRuleCollections:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoRuleCollections, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v8);
  }

  *(_QWORD *)(v5 + 8) = -[NSString copyWithZone:](self->_featureString, "copyWithZone:", a3);
  *(_DWORD *)(v5 + 16) = self->_parameterSet;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *videoRuleCollections;
  NSString *featureString;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if (self->_payload == *((_DWORD *)a3 + 5))
    {
      videoRuleCollections = self->_videoRuleCollections;
      if (!((unint64_t)videoRuleCollections | *((_QWORD *)a3 + 3))
        || (v5 = -[NSMutableArray isEqual:](videoRuleCollections, "isEqual:")) != 0)
      {
        featureString = self->_featureString;
        if (!((unint64_t)featureString | *((_QWORD *)a3 + 1))
          || (v5 = -[NSString isEqual:](featureString, "isEqual:")) != 0)
        {
          LOBYTE(v5) = self->_parameterSet == *((_DWORD *)a3 + 4);
        }
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = 2654435761 * self->_payload;
  v4 = -[NSMutableArray hash](self->_videoRuleCollections, "hash");
  return v4 ^ -[NSString hash](self->_featureString, "hash") ^ v3 ^ (2654435761 * self->_parameterSet);
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->_payload = *((_DWORD *)a3 + 5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[VCMediaNegotiationBlobVideoPayloadSettings addVideoRuleCollections:](self, "addVideoRuleCollections:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v7);
  }
  if (*((_QWORD *)a3 + 1))
    -[VCMediaNegotiationBlobVideoPayloadSettings setFeatureString:](self, "setFeatureString:");
  self->_parameterSet = *((_DWORD *)a3 + 4);
}

- (unsigned)payload
{
  return self->_payload;
}

- (void)setPayload:(unsigned int)a3
{
  self->_payload = a3;
}

- (NSMutableArray)videoRuleCollections
{
  return self->_videoRuleCollections;
}

- (void)setVideoRuleCollections:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)featureString
{
  return self->_featureString;
}

- (void)setFeatureString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (unsigned)parameterSet
{
  return self->_parameterSet;
}

- (void)setParameterSet:(unsigned int)a3
{
  self->_parameterSet = a3;
}

@end
