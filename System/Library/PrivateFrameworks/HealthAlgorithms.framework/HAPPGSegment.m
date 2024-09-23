@implementation HAPPGSegment

- (HAPPGSegment)initWithBinaryRepresentation:(id)a3
{
  id v4;
  HAPPGSegment *v5;
  uint64_t v6;
  NSData *mimosaData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPPGSegment;
  v5 = -[HAPPGSegment init](&v9, sel_init);
  v6 = objc_msgSend(v4, "copy");
  mimosaData = v5->_mimosaData;
  v5->_mimosaData = (NSData *)v6;

  return v5;
}

- (HAPPGFrameEnumerator)frameEnumerator
{
  return -[HAPPGFrameEnumerator initWithBinaryRepresentation:]([HAPPGFrameEnumerator alloc], "initWithBinaryRepresentation:", self->_mimosaData);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mimosaData, 0);
}

@end
