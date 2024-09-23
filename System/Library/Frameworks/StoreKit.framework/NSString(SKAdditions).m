@implementation NSString(SKAdditions)

- (id)sk_SHA1Hash
{
  id v1;
  void *v2;
  void *v3;
  _QWORD v5[2];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v5[0] = 0;
  v5[1] = 0;
  LODWORD(v6) = 0;
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_SHA1((const void *)objc_msgSend(v1, "bytes", 0, 0, v6), objc_msgSend(v1, "length"), (unsigned __int8 *)v5);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v5, 20);
  objc_msgSend(v2, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
