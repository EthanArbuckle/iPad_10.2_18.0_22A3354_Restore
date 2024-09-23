@implementation VCMediaNegotiatorResults

- (VCMediaNegotiatorResults)init
{
  VCMediaNegotiatorResults *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCMediaNegotiatorResults;
  v2 = -[VCMediaNegotiatorResults init](&v4, sel_init);
  if (v2)
  {
    v2->_remoteUserAgent = (NSString *)CFSTR("Viceroy 1.7.0/GK");
    v2->_bandwidthConfigurations = (NSMutableSet *)objc_opt_new();
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorResults;
  -[VCMediaNegotiatorResults dealloc](&v3, sel_dealloc);
}

- (void)addBandwidthConfigurations:(id)a3
{
  -[NSMutableSet addObjectsFromArray:](self->_bandwidthConfigurations, "addObjectsFromArray:", objc_msgSend(a3, "allObjects"));
}

- (unsigned)maxBandwidthWithArbiterMode:(unsigned __int8)a3 connectionType:(int)a4
{
  int v5;
  NSMutableSet *bandwidthConfigurations;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v5 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  bandwidthConfigurations = self->_bandwidthConfigurations;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](bandwidthConfigurations, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v16;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v16 != v10)
        objc_enumerationMutation(bandwidthConfigurations);
      v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      if (objc_msgSend(v12, "connectionType") == a4)
      {
        if (objc_msgSend(v12, "mode") == v5)
          return objc_msgSend(v12, "maxBandwidth");
        if (objc_msgSend(v12, "isDefaultMode"))
          v9 = objc_msgSend(v12, "maxBandwidth");
      }
    }
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](bandwidthConfigurations, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    if (v8)
      continue;
    break;
  }
  return v9;
}

- (BOOL)supportsDynamicMaxBitrate
{
  return self->_supportsDynamicMaxBitrate;
}

- (void)setSupportsDynamicMaxBitrate:(BOOL)a3
{
  self->_supportsDynamicMaxBitrate = a3;
}

- (NSString)remoteUserAgent
{
  return self->_remoteUserAgent;
}

- (void)setRemoteUserAgent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)remoteBasebandCodec
{
  return self->_remoteBasebandCodec;
}

- (void)setRemoteBasebandCodec:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unsigned)remoteBasebandCodecSampleRate
{
  return self->_remoteBasebandCodecSampleRate;
}

- (void)setRemoteBasebandCodecSampleRate:(unsigned int)a3
{
  self->_remoteBasebandCodecSampleRate = a3;
}

- (NSSet)bandwidthConfigurations
{
  return &self->_bandwidthConfigurations->super;
}

- (unsigned)mediaControlInfoVersion
{
  return self->_mediaControlInfoVersion;
}

- (void)setMediaControlInfoVersion:(unsigned __int8)a3
{
  self->_mediaControlInfoVersion = a3;
}

- (unsigned)remoteBlobVersion
{
  return self->_remoteBlobVersion;
}

- (void)setRemoteBlobVersion:(unsigned int)a3
{
  self->_remoteBlobVersion = a3;
}

- (tagNTP)remoteBlobCreationTime
{
  return (tagNTP)self->_remoteBlobCreationTime.wide;
}

- (void)setRemoteBlobCreationTime:(tagNTP)a3
{
  self->_remoteBlobCreationTime = a3;
}

- (int)controlChannelVersion
{
  return self->_controlChannelVersion;
}

- (void)setControlChannelVersion:(int)a3
{
  self->_controlChannelVersion = a3;
}

- (int)accessNetworkType
{
  return self->_accessNetworkType;
}

- (void)setAccessNetworkType:(int)a3
{
  self->_accessNetworkType = a3;
}

@end
