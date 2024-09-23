@implementation NSData

+ (NSData)dataWithHexString:(id)a3
{
  void *v3;
  void *v4;
  NSMutableData *v5;
  int v6;
  uint64_t v7;
  int v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char __str[2];
  __int16 v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString sanitizedHexString:](NSString, "sanitizedHexString:", a3));
  if ((objc_msgSend(v3, "length") & 1) != 0)
  {
    v9 = sub_10000430C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_100016E1C((uint64_t)v3, v10, v11, v12, v13, v14, v15, v16);

    v5 = 0;
  }
  else
  {
    v19 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));

    v5 = objc_opt_new(NSMutableData);
    v6 = objc_msgSend(v4, "length");
    if (v6 >= 2)
    {
      v7 = 0;
      v8 = v6 - 1;
      do
      {
        __str[0] = objc_msgSend(v4, "characterAtIndex:", v7);
        __str[1] = objc_msgSend(v4, "characterAtIndex:", v7 + 1);
        HIBYTE(v19) = strtol(__str, 0, 16);
        -[NSMutableData appendBytes:length:](v5, "appendBytes:length:", (char *)&v19 + 1, 1);
        v7 += 2;
      }
      while (v8 > (int)v7);
    }
    v3 = v4;
  }

  return (NSData *)v5;
}

+ (NSData)dataWithMACAddressString:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString sanitizedHexString:](NSString, "sanitizedHexString:", a3));
  if (objc_msgSend(v3, "length") == (id)12)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithHexString:](NSData, "dataWithHexString:", v3));
  }
  else
  {
    v5 = sub_10000430C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      sub_100016E84((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

    v4 = 0;
  }

  return (NSData *)v4;
}

- (id)base64EncodedString
{
  return -[NSData base64EncodedStringWithOptions:](self, "base64EncodedStringWithOptions:", 0);
}

- (NSData)initWithBase64EncodedString:(id)a3
{
  return -[NSData initWithBase64EncodedString:options:](self, "initWithBase64EncodedString:options:", a3, 0);
}

- (id)hexString
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000DE88;
  v6[3] = &unk_1000254F0;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 2 * -[NSData length](self, "length")));
  v3 = v7;
  -[NSData enumerateByteRangesUsingBlock:](self, "enumerateByteRangesUsingBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v3));

  return v4;
}

@end
