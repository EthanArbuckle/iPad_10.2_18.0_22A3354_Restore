@implementation NSError(MTLCaptureError)

+ (id)errorWithMTLCaptureErrorCode:()MTLCaptureError
{
  void *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x186DAC640]();
  if ((unint64_t)(a3 - 1) > 2)
    v5 = 0;
  else
    v5 = off_1E0FE3C10[a3 - 1];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = v5;
  v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLCaptureError"), a3, v6);
  objc_autoreleasePoolPop(v4);
  return v7;
}

@end
