@implementation NSData

- (id)convertToHexString
{
  NSData *v2;
  unsigned __int8 *v3;
  char *v4;
  id i;
  unsigned int v6;
  void *v7;

  v2 = objc_retainAutorelease(self);
  v3 = -[NSData bytes](v2, "bytes");
  v4 = -[NSData length](v2, "length");
  for (i = objc_alloc_init((Class)NSMutableString); v4; --v4)
  {
    v6 = *v3++;
    objc_msgSend(i, "appendFormat:", CFSTR("%02X"), v6);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", i));

  return v7;
}

+ (NSData)dataWithHexString:(id)a3
{
  NSMutableData *v3;
  NSMutableData *v4;
  NSObject *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  unsigned __int8 v10;
  uint64_t v12;
  char __str[2];
  __int16 v14;

  v3 = (NSMutableData *)a3;
  v4 = v3;
  v14 = 0;
  if (v3)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[NSMutableData lowercaseString](v3, "lowercaseString"));

    v4 = objc_opt_new(NSMutableData);
    v6 = -[NSObject length](v5, "length");
    if (v6 >= 2)
    {
      v7 = 0;
      v8 = v6 - 1;
      do
      {
        v9 = v7 + 1;
        v10 = -[NSObject characterAtIndex:](v5, "characterAtIndex:", v7);
        if ((char)v10 >= 48 && v10 <= 0x66u && v10 - 58 >= 0x27)
        {
          __str[0] = v10;
          __str[1] = -[NSObject characterAtIndex:](v5, "characterAtIndex:", v9);
          HIBYTE(v14) = strtol(__str, 0, 16);
          -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", (char *)&v14 + 1, 1);
          v9 = v7 + 2;
        }
        v7 = v9;
      }
      while (v9 < v8);
    }
  }
  else
  {
    v12 = handleForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      sub_10000F2A0(v5);
      v4 = 0;
    }
  }

  return (NSData *)v4;
}

@end
