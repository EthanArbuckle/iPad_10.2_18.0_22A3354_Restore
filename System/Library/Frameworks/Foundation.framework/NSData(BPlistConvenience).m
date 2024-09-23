@implementation NSData(BPlistConvenience)

- (uint64_t)_getBPlistMarker:()BPlistConvenience offset:trailer:
{
  objc_msgSend(a1, "bytes");
  objc_msgSend(a1, "length");
  return __CFBinaryPlistGetTopLevelInfo();
}

@end
