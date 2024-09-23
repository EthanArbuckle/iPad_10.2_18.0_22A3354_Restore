@implementation VCMediaNegotiatorResultsVideo

- (VCMediaNegotiatorResultsVideo)init
{
  VCMediaNegotiatorResultsVideo *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCMediaNegotiatorResultsVideo;
  v2 = -[VCMediaNegotiatorResultsVideo init](&v4, sel_init);
  if (v2)
  {
    v2->_videoRuleCollections = objc_alloc_init(VCVideoRuleCollections);
    v2->_featureStrings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_parameterSets = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_pixelFormats = (NSMutableSet *)objc_opt_new();
    v2->_hdrModesNegotiated = (NSMutableSet *)objc_opt_new();
    v2->_cipherSuite = 3;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorResultsVideo;
  -[VCMediaNegotiatorResultsVideo dealloc](&v3, sel_dealloc);
}

- (void)addVideoRules:(id)a3 transportType:(unsigned __int8)a4 payload:(int)a5 encodingType:(unsigned __int8)a6
{
  -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self->_videoRuleCollections, "addVideoRules:transportType:payload:encodingType:", a3, a4, *(_QWORD *)&a5, a6);
}

- (void)addFeatureString:(id)a3 payload:(int)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_featureStrings, "setObject:forKeyedSubscript:", a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4));
}

- (void)addParameterSet:(id)a3 payload:(int)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parameterSets, "setObject:forKeyedSubscript:", a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4));
}

- (void)addPixelFormatSet:(id)a3
{
  -[NSMutableSet addObject:](self->_pixelFormats, "addObject:", a3);
}

- (void)addNegotiatedHDRMode:(id)a3
{
  -[NSMutableSet addObject:](self->_hdrModesNegotiated, "addObject:", a3);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && self->_isSupported == objc_msgSend(a3, "isSupported")
      && objc_msgSend(a3, "remoteSSRC") == self->_remoteSSRC
      && self->_isRTCPFBEnabled == objc_msgSend(a3, "isRTCPFBEnabled")
      && objc_msgSend(a3, "customVideoWidth") == self->_customVideoWidth
      && objc_msgSend(a3, "customVideoHeight") == self->_customVideoHeight
      && objc_msgSend(a3, "tilesPerFrame") == self->_tilesPerFrame
      && self->_ltrpEnabled == objc_msgSend(a3, "ltrpEnabled")
      && self->_fecEnabled == objc_msgSend(a3, "fecEnabled")
      && self->_rtxEnabled == objc_msgSend(a3, "rtxEnabled")
      && self->_blackFrameOnClearScreenEnabled == objc_msgSend(a3, "blackFrameOnClearScreenEnabled")
      && objc_msgSend(a3, "cipherSuite") == self->_cipherSuite
      && -[NSMutableDictionary isEqualToDictionary:](self->_featureStrings, "isEqualToDictionary:", objc_msgSend(a3, "featureStrings"))&& -[NSMutableDictionary isEqualToDictionary:](self->_parameterSets, "isEqualToDictionary:", objc_msgSend(a3, "parameterSets"))&& -[NSMutableSet isEqualToSet:](self->_pixelFormats, "isEqualToSet:", objc_msgSend(a3, "pixelFormats"))&& -[NSMutableSet isEqualToSet:](self->_hdrModesNegotiated, "isEqualToSet:", objc_msgSend(a3, "hdrModesNegotiated"))&& -[VCVideoRuleCollections isEqual:](self->_videoRuleCollections, "isEqual:", objc_msgSend(a3, "videoRuleCollections"));
}

- (unsigned)remoteSSRC
{
  return self->_remoteSSRC;
}

- (void)setRemoteSSRC:(unsigned int)a3
{
  self->_remoteSSRC = a3;
}

- (BOOL)isRTCPFBEnabled
{
  return self->_isRTCPFBEnabled;
}

- (void)setIsRTCPFBEnabled:(BOOL)a3
{
  self->_isRTCPFBEnabled = a3;
}

- (VCVideoRuleCollections)videoRuleCollections
{
  return self->_videoRuleCollections;
}

- (NSDictionary)featureStrings
{
  return &self->_featureStrings->super;
}

- (void)setFeatureStrings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (BOOL)isSupported
{
  return self->_isSupported;
}

- (void)setIsSupported:(BOOL)a3
{
  self->_isSupported = a3;
}

- (NSDictionary)parameterSets
{
  return &self->_parameterSets->super;
}

- (void)setParameterSets:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (unsigned)customVideoHeight
{
  return self->_customVideoHeight;
}

- (void)setCustomVideoHeight:(unsigned int)a3
{
  self->_customVideoHeight = a3;
}

- (unsigned)customVideoWidth
{
  return self->_customVideoWidth;
}

- (void)setCustomVideoWidth:(unsigned int)a3
{
  self->_customVideoWidth = a3;
}

- (NSSet)pixelFormats
{
  return &self->_pixelFormats->super;
}

- (NSSet)hdrModesNegotiated
{
  return &self->_hdrModesNegotiated->super;
}

- (BOOL)fecEnabled
{
  return self->_fecEnabled;
}

- (void)setFecEnabled:(BOOL)a3
{
  self->_fecEnabled = a3;
}

- (BOOL)rtxEnabled
{
  return self->_rtxEnabled;
}

- (void)setRtxEnabled:(BOOL)a3
{
  self->_rtxEnabled = a3;
}

- (int64_t)cipherSuite
{
  return self->_cipherSuite;
}

- (void)setCipherSuite:(int64_t)a3
{
  self->_cipherSuite = a3;
}

- (BOOL)blackFrameOnClearScreenEnabled
{
  return self->_blackFrameOnClearScreenEnabled;
}

- (void)setBlackFrameOnClearScreenEnabled:(BOOL)a3
{
  self->_blackFrameOnClearScreenEnabled = a3;
}

- (unsigned)tilesPerFrame
{
  return self->_tilesPerFrame;
}

- (void)setTilesPerFrame:(unsigned int)a3
{
  self->_tilesPerFrame = a3;
}

- (BOOL)ltrpEnabled
{
  return self->_ltrpEnabled;
}

- (void)setLtrpEnabled:(BOOL)a3
{
  self->_ltrpEnabled = a3;
}

@end
