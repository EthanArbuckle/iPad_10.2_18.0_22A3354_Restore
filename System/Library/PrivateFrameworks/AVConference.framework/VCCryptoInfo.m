@implementation VCCryptoInfo

- (VCCryptoInfo)initWithSRTPInfo:(tagSRTPINFO *)a3
{
  VCCryptoInfo *v4;
  VCCryptoInfo *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCCryptoInfo;
  v4 = -[VCCryptoInfo init](&v7, sel_init);
  v5 = v4;
  if (v4)
    memcpy(&v4->_SRTPInfo, a3, sizeof(v4->_SRTPInfo));
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  SRTPCleanUp((uint64_t)&self->_SRTPInfo);
  v3.receiver = self;
  v3.super_class = (Class)VCCryptoInfo;
  -[VCCryptoInfo dealloc](&v3, sel_dealloc);
}

- (tagSRTPINFO)state
{
  return &self->_SRTPInfo;
}

@end
