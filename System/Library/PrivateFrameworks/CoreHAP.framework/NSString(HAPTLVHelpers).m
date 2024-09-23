@implementation NSString(HAPTLVHelpers)

- (id)serializeWithError:()HAPTLVHelpers
{
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "dataUsingEncoding:allowLossyConversion:", 4, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (a3 && !v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:reason:underlyingError:", 3, CFSTR("TLV data cannot be UTF8 encoded"), 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)parsedFromData:()HAPTLVHelpers error:
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = [v5 alloc];
  v8 = objc_retainAutorelease(v6);
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");

  v11 = objc_msgSend(v7, "initWithBytes:length:encoding:", v9, v10, 4);
  v12 = (void *)v11;
  if (a4 && !v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:reason:underlyingError:", 3, CFSTR("TLV data is not UTF8 encoded"), 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

@end
