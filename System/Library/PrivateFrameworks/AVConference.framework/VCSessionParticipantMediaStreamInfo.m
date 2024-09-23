@implementation VCSessionParticipantMediaStreamInfo

- (VCSessionParticipantMediaStreamInfo)init
{
  VCSessionParticipantMediaStreamInfo *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCSessionParticipantMediaStreamInfo;
  v2 = -[VCSessionParticipantMediaStreamInfo init](&v4, sel_init);
  if (v2)
    v2->_streamConfigs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionParticipantMediaStreamInfo;
  -[VCSessionParticipantMediaStreamInfo dealloc](&v3, sel_dealloc);
}

- (void)addStreamConfig:(id)a3
{
  char v5;

  -[NSMutableArray addObject:](self->_streamConfigs, "addObject:");
  if (self->_isOneToOneSupported)
    v5 = 1;
  else
    v5 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "isOneToOne");
  self->_isOneToOneSupported = v5;
}

- (VCMediaStream)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSArray)streamConfigs
{
  return &self->_streamConfigs->super;
}

- (BOOL)isOneToOneSupported
{
  return self->_isOneToOneSupported;
}

@end
