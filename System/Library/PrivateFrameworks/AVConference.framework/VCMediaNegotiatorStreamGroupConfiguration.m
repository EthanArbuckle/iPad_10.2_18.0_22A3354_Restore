@implementation VCMediaNegotiatorStreamGroupConfiguration

- (VCMediaNegotiatorStreamGroupConfiguration)init
{
  VCMediaNegotiatorStreamGroupConfiguration *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCMediaNegotiatorStreamGroupConfiguration;
  v2 = -[VCMediaNegotiatorStreamGroupConfiguration init](&v4, sel_init);
  if (v2)
  {
    v2->_streamConfigs = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v2->_codecConfigs = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
  }
  return v2;
}

- (VCMediaNegotiatorStreamGroupConfiguration)initWithGroupID:(unsigned int)a3 mediaType:(unsigned int)a4 subtype:(unsigned int)a5 syncGroupID:(unsigned int)a6
{
  VCMediaNegotiatorStreamGroupConfiguration *result;

  result = -[VCMediaNegotiatorStreamGroupConfiguration init](self, "init");
  if (result)
  {
    result->_groupID = a3;
    result->_mediaType = a4;
    result->_mediaSubtype = a5;
    result->_syncGroupID = a6;
  }
  return result;
}

- (VCMediaNegotiatorStreamGroupConfiguration)initWithGroupID:(unsigned int)a3 mediaType:(unsigned int)a4 subtype:(unsigned int)a5 syncGroupID:(unsigned int)a6 cipherSuite:(unsigned int)a7
{
  VCMediaNegotiatorStreamGroupConfiguration *result;

  result = -[VCMediaNegotiatorStreamGroupConfiguration initWithGroupID:mediaType:subtype:syncGroupID:](self, "initWithGroupID:mediaType:subtype:syncGroupID:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
  if (result)
    result->_cipherSuite = a7;
  return result;
}

+ (id)streamGroupConfigWithGroupID:(unsigned int)a3 mediaType:(unsigned int)a4 subtype:(unsigned int)a5 syncGroupID:(unsigned int)a6 cipherSuite:(unsigned int)a7
{
  return -[VCMediaNegotiatorStreamGroupConfiguration initWithGroupID:mediaType:subtype:syncGroupID:cipherSuite:]([VCMediaNegotiatorStreamGroupConfiguration alloc], "initWithGroupID:mediaType:subtype:syncGroupID:cipherSuite:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorStreamGroupConfiguration;
  -[VCMediaNegotiatorStreamGroupConfiguration dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  char *v4;
  char *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = FourccToCStr(self->_groupID);
  v5 = FourccToCStr(self->_mediaType);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("_groupID=%s, _mediaType=%s, _syncGroupID=%s, _cipherSuite=%d streamConfigs=%@"), v4, v5, FourccToCStr(self->_syncGroupID), self->_cipherSuite, self->_streamConfigs);
}

- (void)addStreamConfig:(id)a3
{
  if (a3)
  {
    if ((-[NSMutableOrderedSet containsObject:](self->_streamConfigs, "containsObject:") & 1) == 0)
      -[NSMutableOrderedSet addObject:](self->_streamConfigs, "addObject:", a3);
  }
}

- (void)addCodecConfig:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = (void *)-[NSMutableOrderedSet array](self->_codecConfigs, "array");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(a3, "isEqual:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9)) & 1) != 0)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      -[NSMutableOrderedSet addObject:](self->_codecConfigs, "addObject:", a3);
    }
  }
}

- (unint64_t)indexOfCodecConfig:(id)a3
{
  unint64_t v5;
  unint64_t v6;

  if (!-[NSMutableOrderedSet count](self->_codecConfigs, "count"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = 0;
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    if (objc_msgSend(a3, "isEqual:", -[NSMutableOrderedSet objectAtIndexedSubscript:](self->_codecConfigs, "objectAtIndexedSubscript:", v5)))v6 = v5;
    ++v5;
  }
  while (v5 < -[NSMutableOrderedSet count](self->_codecConfigs, "count"));
  return v6;
}

- (void)removeStreamConfigs:(_NSRange)a3
{
  -[NSMutableOrderedSet removeObjectsInRange:](self->_streamConfigs, "removeObjectsInRange:", a3.location, a3.length);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v9;
  unint64_t v10;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v11.receiver = self;
  v11.super_class = (Class)VCMediaNegotiatorStreamGroupConfiguration;
  if (!-[VCMediaNegotiatorStreamGroupConfiguration isEqual:](&v11, sel_isEqual_, a3))
    return 0;
  if (objc_msgSend(a3, "mediaType") != self->_mediaType)
    return 0;
  if (objc_msgSend(a3, "mediaSubtype") != self->_mediaSubtype)
    return 0;
  v5 = objc_msgSend((id)objc_msgSend(a3, "streamConfigs"), "count");
  if (v5 != -[NSMutableOrderedSet count](self->_streamConfigs, "count"))
    return 0;
  v6 = objc_msgSend((id)objc_msgSend(a3, "codecConfigs"), "count");
  if (v6 != -[NSMutableOrderedSet count](self->_codecConfigs, "count"))
    return 0;
  if (!objc_msgSend(a3, "u1Config"))
  {
    if (!self->_u1Config)
      goto LABEL_13;
    return 0;
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "u1Config"), "isEqual:", self->_u1Config) & 1) == 0)
    return 0;
LABEL_13:
  if (-[NSMutableOrderedSet count](self->_streamConfigs, "count"))
  {
    v9 = 0;
    while ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "streamConfigs"), "objectAtIndex:", v9), "isEqual:", -[NSMutableOrderedSet objectAtIndex:](self->_streamConfigs, "objectAtIndex:", v9)) & 1) != 0)
    {
      if (++v9 >= (unint64_t)-[NSMutableOrderedSet count](self->_streamConfigs, "count"))
        goto LABEL_17;
    }
    return 0;
  }
LABEL_17:
  if (!-[NSMutableOrderedSet count](self->_codecConfigs, "count"))
    return 1;
  v10 = 0;
  do
  {
    v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "codecConfigs"), "objectAtIndex:", v10), "isEqual:", -[NSMutableOrderedSet objectAtIndex:](self->_codecConfigs, "objectAtIndex:", v10));
    if ((v7 & 1) == 0)
      break;
    ++v10;
  }
  while (v10 < -[NSMutableOrderedSet count](self->_codecConfigs, "count"));
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSMutableOrderedSet *streamConfigs;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSMutableOrderedSet *codecConfigs;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
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
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithGroupID:mediaType:subtype:syncGroupID:", self->_groupID, self->_mediaType, self->_mediaSubtype, self->_syncGroupID);
  if (v5)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    streamConfigs = self->_streamConfigs;
    v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](streamConfigs, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(streamConfigs);
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "copyWithZone:", a3);
          if (v11)
          {
            v12 = (void *)v11;
            objc_msgSend(v5, "addStreamConfig:", v11);

          }
        }
        v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](streamConfigs, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
      }
      while (v8);
    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    codecConfigs = self->_codecConfigs;
    v14 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](codecConfigs, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(codecConfigs);
          v18 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "copyWithZone:", a3);
          if (v18)
          {
            v19 = (void *)v18;
            objc_msgSend(v5, "addCodecConfig:", v18);

          }
        }
        v15 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](codecConfigs, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
      }
      while (v15);
    }
  }
  return v5;
}

- (unsigned)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(unsigned int)a3
{
  self->_groupID = a3;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(unsigned int)a3
{
  self->_mediaType = a3;
}

- (unsigned)mediaSubtype
{
  return self->_mediaSubtype;
}

- (void)setMediaSubtype:(unsigned int)a3
{
  self->_mediaSubtype = a3;
}

- (NSOrderedSet)streamConfigs
{
  return &self->_streamConfigs->super;
}

- (NSOrderedSet)codecConfigs
{
  return &self->_codecConfigs->super;
}

- (unsigned)syncGroupID
{
  return self->_syncGroupID;
}

- (void)setSyncGroupID:(unsigned int)a3
{
  self->_syncGroupID = a3;
}

- (VCMediaNegotiatorStreamGroupU1Configuration)u1Config
{
  return self->_u1Config;
}

- (void)setU1Config:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
