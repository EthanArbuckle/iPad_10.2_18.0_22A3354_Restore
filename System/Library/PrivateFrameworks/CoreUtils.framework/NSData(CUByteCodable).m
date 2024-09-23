@implementation NSData(CUByteCodable)

- (const)encodedBytesAndReturnLength:()CUByteCodable error:
{
  const char *result;

  *a3 = objc_msgSend(a1, "length");
  result = (const char *)objc_msgSend(objc_retainAutorelease(a1), "bytes");
  if (!result)
    return "";
  return result;
}

+ (id)createWithBytesNoCopy:()CUByteCodable length:error:
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, a4, 1);
}

@end
