@implementation NSData(Checksum)

- (id)SHA224Checksum
{
  unsigned __int8 *v2;
  id v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = (unsigned __int8 *)v5 - ((objc_msgSend(MEMORY[0x1E0C99D50], "SHA224ChecksumSize") + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = objc_retainAutorelease(a1);
  CC_SHA224((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), v2);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v2, objc_msgSend(MEMORY[0x1E0C99D50], "SHA224ChecksumSize"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)SHA224ChecksumSize
{
  return 28;
}

@end
