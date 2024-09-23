@implementation NSData(HMFZeroing)

- (id)hmf_zeroingCopy
{
  void *v1;
  id v2;

  v1 = (void *)MEMORY[0x1E0C99D50];
  v2 = objc_retainAutorelease(a1);
  return (id)objc_msgSend(v1, "_newZeroingDataWithBytes:length:", objc_msgSend(v2, "bytes"), objc_msgSend(v2, "length"));
}

@end
