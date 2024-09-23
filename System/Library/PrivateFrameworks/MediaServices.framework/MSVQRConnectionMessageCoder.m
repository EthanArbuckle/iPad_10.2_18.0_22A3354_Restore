@implementation MSVQRConnectionMessageCoder

- (id)messageFromData:(id)a3
{
  return 0;
}

- (id)dataFromMessage:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data", a3);
}

- (id)traceIdentifierForMessage:(id)a3
{
  return 0;
}

@end
