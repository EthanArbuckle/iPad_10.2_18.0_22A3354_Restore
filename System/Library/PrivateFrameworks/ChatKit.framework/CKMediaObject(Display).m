@implementation CKMediaObject(Display)

- (IMSenderContext)senderContext
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  -[CKMediaObject messageContext](self, "messageContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isSenderUnknown");
  objc_msgSend(MEMORY[0x1E0D39A10], "contextWithKnownSender:serviceName:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMSenderContext *)v5;
}

@end
