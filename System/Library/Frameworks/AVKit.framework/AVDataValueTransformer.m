@implementation AVDataValueTransformer

- (id)dataForMessage:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("missing implementation"));
  return 0;
}

- (id)reverseTransformerForMessageData:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("missing implementation"));
  return 0;
}

+ (id)messageTransformerWithClass:(Class)a3
{
  return -[AVAirMessageTransformer initWithMessageClass:]([AVAirMessageTransformer alloc], "initWithMessageClass:", a3);
}

@end
