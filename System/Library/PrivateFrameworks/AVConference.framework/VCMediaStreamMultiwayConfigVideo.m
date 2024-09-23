@implementation VCMediaStreamMultiwayConfigVideo

- (VCMediaStreamMultiwayConfigVideo)init
{
  VCMediaStreamMultiwayConfigVideo *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCMediaStreamMultiwayConfigVideo;
  v2 = -[VCMediaStreamMultiwayConfig init](&v4, sel_init);
  if (v2)
  {
    v2->_payloads = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v2->_subStreamConfigs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamMultiwayConfigVideo;
  -[VCMediaStreamMultiwayConfig dealloc](&v3, sel_dealloc);
}

- (void)addPayload:(int)a3
{
  -[NSMutableSet addObject:](self->_payloads, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3));
}

- (void)addSubStreamConfig:(id)a3
{
  -[NSMutableArray addObject:](self->_subStreamConfigs, "addObject:", a3);
}

- (id)streamIds
{
  void *v3;
  NSMutableArray *subStreamConfigs;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[VCMediaStreamMultiwayConfig idsStreamID](self, "idsStreamID")));
  if (-[VCMediaStreamMultiwayConfig hasRepairedStreamID](self, "hasRepairedStreamID"))
    objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[VCMediaStreamMultiwayConfig repairedStreamID](self, "repairedStreamID")));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  subStreamConfigs = self->_subStreamConfigs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](subStreamConfigs, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(subStreamConfigs);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "streamIds");
        if (v9)
          objc_msgSend(v3, "addObjectsFromArray:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](subStreamConfigs, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v6);
  }
  return v3;
}

- (int64_t)resolution
{
  return self->_resolution;
}

- (void)setResolution:(int64_t)a3
{
  self->_resolution = a3;
}

- (unsigned)framerate
{
  return self->_framerate;
}

- (void)setFramerate:(unsigned int)a3
{
  self->_framerate = a3;
}

- (NSSet)payloads
{
  return &self->_payloads->super;
}

- (unint64_t)keyFrameInterval
{
  return self->_keyFrameInterval;
}

- (void)setKeyFrameInterval:(unint64_t)a3
{
  self->_keyFrameInterval = a3;
}

- (NSArray)subStreamConfigs
{
  return &self->_subStreamConfigs->super;
}

- (BOOL)isTemporalStream
{
  return self->_isTemporalStream;
}

- (void)setIsTemporalStream:(BOOL)a3
{
  self->_isTemporalStream = a3;
}

- (BOOL)isSubStream
{
  return self->_isSubStream;
}

- (void)setIsSubStream:(BOOL)a3
{
  self->_isSubStream = a3;
}

- (unsigned)parentStreamID
{
  return self->_parentStreamID;
}

- (void)setParentStreamID:(unsigned __int16)a3
{
  self->_parentStreamID = a3;
}

@end
