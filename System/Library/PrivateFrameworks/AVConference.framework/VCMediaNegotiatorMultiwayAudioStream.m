@implementation VCMediaNegotiatorMultiwayAudioStream

- (VCMediaNegotiatorMultiwayAudioStream)init
{
  VCMediaNegotiatorMultiwayAudioStream *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCMediaNegotiatorMultiwayAudioStream;
  v2 = -[VCMediaNegotiatorMultiwayAudioStream init](&v4, sel_init);
  if (v2)
    v2->_supportedAudioPayloads = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorMultiwayAudioStream;
  -[VCMediaNegotiatorMultiwayAudioStream dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VCMediaNegotiatorMultiwayAudioStream;
  v5 = -[VCMediaNegotiatorMultiwayMediaStream copyWithZone:](&v8, sel_copyWithZone_);
  if (v5)
  {
    v6 = (void *)-[NSMutableSet copyWithZone:](self->_supportedAudioPayloads, "copyWithZone:", a3);
    objc_msgSend(v5, "setSupportedAudioPayloads:", v6);

  }
  return v5;
}

- (void)addPayload:(int)a3
{
  -[NSMutableSet addObject:](self->_supportedAudioPayloads, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3));
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_13;
  v13.receiver = self;
  v13.super_class = (Class)VCMediaNegotiatorMultiwayAudioStream;
  v5 = -[VCMediaNegotiatorMultiwayMediaStream isEqual:](&v13, sel_isEqual_, a3);
  if (!v5)
    return v5;
  v6 = objc_msgSend((id)objc_msgSend(a3, "supportedAudioPayloads"), "count");
  if (v6 != -[NSMutableSet count](self->_supportedAudioPayloads, "count"))
  {
LABEL_13:
    LOBYTE(v5) = 0;
    return v5;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_msgSend(a3, "supportedAudioPayloads");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
LABEL_6:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v10)
        objc_enumerationMutation(v7);
      v5 = -[NSMutableSet containsObject:](self->_supportedAudioPayloads, "containsObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11));
      if (!v5)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
        LOBYTE(v5) = 1;
        if (v9)
          goto LABEL_6;
        return v5;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (NSSet)supportedAudioPayloads
{
  return &self->_supportedAudioPayloads->super;
}

- (void)setSupportedAudioPayloads:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
