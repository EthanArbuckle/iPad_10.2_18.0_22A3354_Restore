@implementation CGBufferProviderCreateWithCFData

void __CGBufferProviderCreateWithCFData_block_invoke_2(int a1, CFTypeRef cf)
{
  CFRelease(cf);
}

UInt8 *__CGBufferProviderCreateWithCFData_block_invoke(int a1, CFMutableDataRef theData)
{
  return CFDataGetMutableBytePtr(theData);
}

@end
