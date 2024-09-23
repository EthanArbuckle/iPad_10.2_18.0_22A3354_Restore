@implementation NSPropertyListSerialization

+ (NSData)dataWithPropertyList:(id)plist format:(NSPropertyListFormat)format options:(NSPropertyListWriteOptions)opt error:(NSError *)error
{
  CFDataRef Data;
  CFDataRef v8;
  NSError *v9;

  Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], plist, (CFPropertyListFormat)format, opt, (CFErrorRef *)error);
  v8 = Data;
  if (error && !Data && *error)
    v9 = *error;
  return (NSData *)v8;
}

+ (id)propertyListWithData:(NSData *)data options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError *)error
{
  CFPropertyListRef v7;
  void *v8;
  NSError *v9;

  if (!data)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("data parameter is nil"), 0, error));
  v7 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E0C9AE30], (CFDataRef)data, opt, (CFPropertyListFormat *)format, (CFErrorRef *)error);
  v8 = (void *)v7;
  if (error && !v7 && *error)
    v9 = *error;
  return v8;
}

+ (BOOL)propertyList:(id)plist isValidForFormat:(NSPropertyListFormat)format
{
  return CFPropertyListIsValid(plist, (CFPropertyListFormat)format) != 0;
}

+ (NSData)dataFromPropertyList:(id)plist format:(NSPropertyListFormat)format errorDescription:(NSString *)errorString
{
  __CFWriteStream *v8;
  void *v9;

  v8 = CFWriteStreamCreateWithAllocatedBuffers((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  CFWriteStreamOpen(v8);
  if (CFPropertyListWriteToStream(plist, v8, (CFPropertyListFormat)format, (CFStringRef *)errorString) < 1)
    v9 = 0;
  else
    v9 = (void *)CFWriteStreamCopyProperty(v8, (CFStreamPropertyKey)*MEMORY[0x1E0C9B2A8]);
  CFWriteStreamClose(v8);
  CFRelease(v8);
  return (NSData *)v9;
}

+ (id)propertyListFromData:(NSData *)data mutabilityOption:(NSPropertyListMutabilityOptions)opt format:(NSPropertyListFormat *)format errorDescription:(NSString *)errorString
{
  if (data)
    return (id)_CFPropertyListCreateFromXMLData();
  if (errorString)
    *errorString = (NSString *)CFSTR("stream had too few bytes");
  return 0;
}

+ (NSPropertyListSerialization)allocWithZone:(_NSZone *)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Do not create instances of NSPropertyListSerialization in this release"), _NSMethodExceptionProem((objc_class *)a1, a2)), 0);
  objc_exception_throw(v3);
}

- (NSPropertyListSerialization)init
{
  NSString *v3;

  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Do not create instances of NSPropertyListSerialization in this release"), _NSMethodExceptionProem((objc_class *)self, a2));

  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v3, 0));
}

+ (NSInteger)writePropertyList:(id)plist toStream:(NSOutputStream *)stream format:(NSPropertyListFormat)format options:(NSPropertyListWriteOptions)opt error:(NSError *)error
{
  CFIndex v8;
  NSInteger v9;
  NSError *v10;
  void *v12;
  uint64_t v13;
  const __CFString *v14;

  if (!plist)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v14 = CFSTR("plist parameter is nil");
    goto LABEL_13;
  }
  if (!stream)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v14 = CFSTR("stream parameter is nil");
    goto LABEL_13;
  }
  if (format != NSPropertyListXMLFormat_v1_0 && format != NSPropertyListBinaryFormat_v1_0)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v14 = CFSTR("Invalid property list format");
LABEL_13:
    objc_exception_throw((id)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v14, 0, opt, error));
  }
  v8 = CFPropertyListWrite(plist, (CFWriteStreamRef)stream, (CFPropertyListFormat)format, opt, (CFErrorRef *)error);
  v9 = v8;
  if (error && !v8 && *error)
    v10 = *error;
  return v9;
}

+ (id)propertyListWithStream:(NSInputStream *)stream options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError *)error
{
  CFPropertyListRef v7;
  void *v8;
  NSError *v9;

  if (!stream)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("stream parameter is nil"), 0, error));
  v7 = CFPropertyListCreateWithStream((CFAllocatorRef)*MEMORY[0x1E0C9AE30], (CFReadStreamRef)stream, 0, opt, (CFPropertyListFormat *)format, (CFErrorRef *)error);
  v8 = (void *)v7;
  if (error && !v7 && *error)
    v9 = *error;
  return v8;
}

@end
