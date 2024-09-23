@implementation NSData(AuthKit)

- (id)ak_SHA256Data
{
  id v1;
  void *v2;
  unsigned __int8 md[32];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  v2 = CC_SHA256((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 32);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

+ (id)ak_dataWithBase64UrlEncodedString:()AuthKit
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("+"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[NSData(AuthKit) ak_dataWithBase64UrlEncodedString:].cold.1((uint64_t)v4, v5);

  objc_msgSend(v4, "aaf_toBase64DecodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)ak_dataWithBase64UrlEncodedString:()AuthKit .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138477827;
  v3 = a1;
  _os_log_debug_impl(&dword_19202F000, a2, OS_LOG_TYPE_DEBUG, "Base64 encoded string after replacement: %{private}@", (uint8_t *)&v2, 0xCu);
}

@end
