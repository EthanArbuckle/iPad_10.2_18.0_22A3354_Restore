@implementation VCCaptionsClientContext

- (VCCaptionsClientContext)initWithStreamToken:(int64_t)a3
{
  VCCaptionsClientContext *result;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCCaptionsClientContext;
  result = -[VCCaptionsClientContext init](&v5, sel_init);
  if (result)
    result->_streamToken = a3;
  return result;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

@end
