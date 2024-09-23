@implementation NSData(HAPTLVHelpers)

- (id)serializeWithError:()HAPTLVHelpers
{
  return (id)objc_msgSend(a1, "copy");
}

+ (id)parsedFromData:()HAPTLVHelpers error:
{
  return (id)objc_msgSend(a3, "copy");
}

@end
