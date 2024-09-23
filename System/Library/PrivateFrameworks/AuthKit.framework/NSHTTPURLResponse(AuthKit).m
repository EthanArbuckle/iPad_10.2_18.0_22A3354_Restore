@implementation NSHTTPURLResponse(AuthKit)

- (id)ak_stringForEncodedHeaderWithKey:()AuthKit
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_ak_dataForEncodedHeaderWithKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v1, 4);

  return v2;
}

- (id)ak_acceptedTermsInfo
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_ak_dataForEncodedHeaderWithKey:", CFSTR("X-Apple-I-Accepted-Terms"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF0EB8], "dictionaryFromObject:ofType:", v1, CFSTR("application/json"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_ak_dataForEncodedHeaderWithKey:()AuthKit
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "valueForHTTPHeaderField:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v1, 0);
  else
    v2 = 0;

  return v2;
}

@end
