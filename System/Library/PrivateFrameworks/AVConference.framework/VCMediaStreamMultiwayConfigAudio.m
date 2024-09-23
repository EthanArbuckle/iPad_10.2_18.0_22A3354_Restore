@implementation VCMediaStreamMultiwayConfigAudio

- (VCMediaStreamMultiwayConfigAudio)init
{
  VCMediaStreamMultiwayConfigAudio *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCMediaStreamMultiwayConfigAudio;
  v2 = -[VCMediaStreamMultiwayConfig init](&v4, sel_init);
  if (v2)
    v2->_v2CodecConfigurations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  return v2;
}

- (void)addV2CodecConfiguration:(id)a3
{
  uint64_t v5;

  if (a3)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_v2CodecConfigurations, "setObject:forKeyedSubscript:", a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "codecType")));
    v5 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", objc_msgSend(a3, "codecType"));
    -[VCMediaStreamMultiwayConfig addRxPayloadType:networkPayload:](self, "addRxPayloadType:networkPayload:", v5, objc_msgSend(a3, "networkPayload"));
    -[VCMediaStreamMultiwayConfig addTxPayloadType:networkPayload:](self, "addTxPayloadType:networkPayload:", v5, objc_msgSend(a3, "networkPayload"));
  }
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamMultiwayConfigAudio;
  -[VCMediaStreamMultiwayConfig dealloc](&v3, sel_dealloc);
}

- (VCAudioRuleCollection)audioRules
{
  return self->_audioRules;
}

- (void)setAudioRules:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSDictionary)v2CodecConfigurations
{
  return &self->_v2CodecConfigurations->super;
}

- (unsigned)preferredMediaBitrate
{
  return self->_preferredMediaBitrate;
}

- (void)setPreferredMediaBitrate:(unsigned int)a3
{
  self->_preferredMediaBitrate = a3;
}

@end
