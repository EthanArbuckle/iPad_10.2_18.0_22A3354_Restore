@implementation NSJSONSerialization

+ (NSData)dataWithJSONObject:(id)obj options:(NSJSONWritingOptions)opt error:(NSError *)error
{
  _NSJSONWriter *v10;
  uint64_t v11;
  NSData *v12;
  NSString *v14;

  if (!obj)
  {
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: value parameter is nil"), _NSMethodExceptionProem((objc_class *)a1, a2));
    goto LABEL_11;
  }
  if ((opt & 4) == 0 && (_NSIsNSArray() & 1) == 0 && (_NSIsNSDictionary() & 1) == 0)
  {
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Invalid top-level type in JSON write"), _NSMethodExceptionProem((objc_class *)a1, a2));
LABEL_11:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v14, 0));
  }
  v10 = objc_alloc_init(_NSJSONWriter);
  v11 = -[_NSJSONWriter dataWithRootObject:options:](v10, "dataWithRootObject:options:", obj, opt);
  v12 = (NSData *)v11;
  if (error && !v11)
    *error = -[_NSJSONWriter failure](v10, "failure");
  return v12;
}

+ (BOOL)isValidJSONObject:(id)obj
{
  return +[_NSJSONReader validForJSON:depth:allowFragments:](_NSJSONReader, "validForJSON:depth:allowFragments:", obj, 0, 0);
}

+ (id)JSONObjectWithData:(NSData *)data options:(NSJSONReadingOptions)opt error:(NSError *)error
{
  void *v6;
  uint64_t v7;
  const __CFString *v8;

  if (!data)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = CFSTR("data parameter is nil");
    goto LABEL_6;
  }
  if ((~(_BYTE)opt & 0x14) == 0)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = CFSTR("NSJSONReadingAssumeTopLevelDictionary and NSJSONReadingAllowFragments cannot be set at the same time");
LABEL_6:
    objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0));
  }
  return -[_NSJSONReader parseData:options:error:](objc_alloc_init(_NSJSONReader), "parseData:options:error:", data, opt, error);
}

+ (NSInteger)writeJSONObject:(id)obj toStream:(NSOutputStream *)stream options:(NSJSONWritingOptions)opt error:(NSError *)error
{
  _NSJSONWriter *v12;
  uint64_t v13;
  NSInteger v14;
  NSString *v16;

  if (!obj)
  {
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: value parameter is nil"), _NSMethodExceptionProem((objc_class *)a1, a2));
    goto LABEL_14;
  }
  if (!stream || !-[NSOutputStream streamStatus](stream, "streamStatus"))
  {
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: stream is not open for writing"), _NSMethodExceptionProem((objc_class *)a1, a2));
    goto LABEL_14;
  }
  if ((opt & 4) == 0 && (_NSIsNSArray() & 1) == 0 && (_NSIsNSDictionary() & 1) == 0)
  {
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Invalid top-level type in JSON write"), _NSMethodExceptionProem((objc_class *)a1, a2));
LABEL_14:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0));
  }
  v12 = objc_alloc_init(_NSJSONWriter);
  v13 = -[_NSJSONWriter writeRootObject:toStream:options:](v12, "writeRootObject:toStream:options:", obj, stream, opt);
  v14 = v13;
  if (error && v13 == -1)
    *error = -[_NSJSONWriter failure](v12, "failure");
  return v14;
}

+ (id)JSONObjectWithStream:(NSInputStream *)stream options:(NSJSONReadingOptions)opt error:(NSError *)error
{
  NSString *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;

  if (!stream)
  {
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: stream parameter is nil"), _NSMethodExceptionProem((objc_class *)a1, a2));
LABEL_7:
    v12 = (const __CFString *)v11;
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    goto LABEL_9;
  }
  if (!-[NSInputStream streamStatus](stream, "streamStatus"))
  {
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: stream is not open for reading"), _NSMethodExceptionProem((objc_class *)a1, a2));
    goto LABEL_7;
  }
  if ((~(_BYTE)opt & 0x14) == 0)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v12 = CFSTR("NSJSONReadingAssumeTopLevelDictionary and NSJSONReadingAllowFragments cannot be set at the same time");
LABEL_9:
    objc_exception_throw((id)objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, v12, 0));
  }
  return -[_NSJSONReader parseStream:options:error:](objc_alloc_init(_NSJSONReader), "parseStream:options:error:", stream, opt, error);
}

+ (NSJSONSerialization)allocWithZone:(_NSZone *)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Do not create instances of NSJSONSerialization in this release"), _NSMethodExceptionProem((objc_class *)a1, a2)), 0);
  objc_exception_throw(v3);
}

- (NSJSONSerialization)init
{
  NSString *v3;

  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Do not create instances of NSJSONSerialization in this release"), _NSMethodExceptionProem((objc_class *)self, a2));

  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v3, 0));
}

@end
