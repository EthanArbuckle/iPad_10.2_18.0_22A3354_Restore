@implementation NSURL

- (NSURL)filePathURL
{
  __objc2_class **v3;
  const __CFAllocator *v4;
  CFURLRef v5;

  v3 = (__objc2_class **)-[NSURL _cfurl](self, "_cfurl");
  if (v3 == +[NSURL __unurl](NSURL, "__unurl"))
    -[NSURL filePathURL].cold.1();
  if (v3
    && (__CFURLBeginResourcePropertyCacheAccess(v3),
        v4 = CFGetAllocator(v3),
        v5 = CFURLCreateFilePathURL(v4, (CFURLRef)-[NSURL _cfurl](self, "_cfurl"), 0),
        __CFURLEndResourcePropertyCacheAccess(v3),
        v5))
  {
    return (NSURL *)v5;
  }
  else
  {
    return 0;
  }
}

- (BOOL)isFileReferenceURL
{
  const __CFURL *v2;

  v2 = (const __CFURL *)-[NSURL _cfurl](self, "_cfurl");
  if (v2 == +[NSURL __unurl](NSURL, "__unurl"))
    -[NSURL isFileReferenceURL].cold.1();
  return v2 && CFURLIsFileReferenceURL(v2) != 0;
}

+ (id)__unurl
{
  if (__unurl_static_init != -1)
    dispatch_once(&__unurl_static_init, &__block_literal_global_33);
  return (id)__unurl_immutablePlaceholderNSURL;
}

CFURLRef __16__NSURL___unurl__block_invoke()
{
  CFURLRef result;

  result = CFURLCreateWithString(0, CFSTR("__immutablePlaceholderNSURL"), 0);
  __unurl_immutablePlaceholderNSURL = (uint64_t)result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)removeAllCachedResourceValues
{
  objc_class *v0;
  uint64_t v1;

  v0 = __CFLookUpClass("NSURL");
  v1 = OUTLINED_FUNCTION_0_29(v0);
  OUTLINED_FUNCTION_1_19(v1, CFSTR("%@: object was not initialized"));
}

- (void)removeCachedResourceValueForKey:(NSURLResourceKey)key
{
  __objc2_class **v4;

  v4 = (__objc2_class **)-[NSURL _cfurl](self, "_cfurl");
  if (v4 == +[NSURL __unurl](NSURL, "__unurl"))
    -[NSURL removeCachedResourceValueForKey:].cold.1();
  if (v4)
  {
    __CFURLBeginResourcePropertyCacheAccess(v4);
    CFURLClearResourcePropertyCacheForKey((CFURLRef)v4, (CFStringRef)key);
    __CFURLEndResourcePropertyCacheAccess(v4);
  }
}

- (void)setTemporaryResourceValue:(id)value forKey:(NSURLResourceKey)key
{
  __objc2_class **v6;

  v6 = (__objc2_class **)-[NSURL _cfurl](self, "_cfurl");
  if (v6 == +[NSURL __unurl](NSURL, "__unurl"))
    -[NSURL setTemporaryResourceValue:forKey:].cold.1();
  if (v6)
  {
    __CFURLBeginResourcePropertyCacheAccess(v6);
    CFURLSetTemporaryResourcePropertyForKey((CFURLRef)v6, (CFStringRef)key, value);
    __CFURLEndResourcePropertyCacheAccess(v6);
  }
}

- (BOOL)setResourceValue:(id)value forKey:(NSURLResourceKey)key error:(NSError *)error
{
  __objc2_class **v8;
  int v9;
  BOOL v10;

  v8 = (__objc2_class **)-[NSURL _cfurl](self, "_cfurl");
  if (v8 == +[NSURL __unurl](NSURL, "__unurl"))
    -[NSURL setResourceValue:forKey:error:].cold.1();
  if (!v8)
    return 0;
  __CFURLBeginResourcePropertyCacheAccess(v8);
  v9 = CFURLSetResourcePropertyForKey((CFURLRef)v8, (CFStringRef)key, value, (CFErrorRef *)error);
  v10 = v9 != 0;
  __CFURLEndResourcePropertyCacheAccess(v8);
  if (error && !v9)
  {
    v10 = 0;
    *error = *error;
  }
  return v10;
}

- (BOOL)setResourceValues:(NSDictionary *)keyedValues error:(NSError *)error
{
  __objc2_class **v6;
  int v7;
  BOOL v8;

  v6 = (__objc2_class **)-[NSURL _cfurl](self, "_cfurl");
  if (v6 == +[NSURL __unurl](NSURL, "__unurl"))
    -[NSURL setResourceValues:error:].cold.1();
  if (!v6)
    return 0;
  __CFURLBeginResourcePropertyCacheAccess(v6);
  v7 = CFURLSetResourcePropertiesForKeys((CFURLRef)v6, (CFDictionaryRef)keyedValues, (CFErrorRef *)error);
  v8 = v7 != 0;
  __CFURLEndResourcePropertyCacheAccess(v6);
  if (error && !v7)
  {
    v8 = 0;
    *error = *error;
  }
  return v8;
}

- (NSDictionary)resourceValuesForKeys:(NSArray *)keys error:(NSError *)error
{
  __objc2_class **v6;
  CFDictionaryRef v7;

  v6 = (__objc2_class **)-[NSURL _cfurl](self, "_cfurl");
  if (v6 == +[NSURL __unurl](NSURL, "__unurl"))
    -[NSURL resourceValuesForKeys:error:].cold.1();
  if (v6)
  {
    __CFURLBeginResourcePropertyCacheAccess(v6);
    v7 = CFURLCopyResourcePropertiesForKeys((CFURLRef)v6, (CFArrayRef)keys, (CFErrorRef *)error);
    __CFURLEndResourcePropertyCacheAccess(v6);
    if (v7)
      return (NSDictionary *)v7;
    if (error)
      *error = *error;
  }
  return 0;
}

- (BOOL)getResourceValue:(id *)value forKey:(NSURLResourceKey)key error:(NSError *)error
{
  __objc2_class **v8;
  int v9;
  BOOL result;
  NSError *v11;

  v8 = (__objc2_class **)-[NSURL _cfurl](self, "_cfurl");
  if (v8 == +[NSURL __unurl](NSURL, "__unurl"))
    -[NSURL getResourceValue:forKey:error:].cold.1();
  if (!v8)
    return 0;
  __CFURLBeginResourcePropertyCacheAccess(v8);
  v9 = CFURLCopyResourcePropertyForKey((CFURLRef)v8, (CFStringRef)key, value, (CFErrorRef *)error);
  __CFURLEndResourcePropertyCacheAccess(v8);
  if (!v9)
  {
    if (error)
    {
      v11 = *error;
      result = 0;
      *error = v11;
      return result;
    }
    return 0;
  }
  if (*value)
    *value = *value;
  return 1;
}

- (BOOL)startAccessingSecurityScopedResource
{
  const __CFURL *v2;

  v2 = (const __CFURL *)-[NSURL _cfurl](self, "_cfurl");
  if (v2 == +[NSURL __unurl](NSURL, "__unurl"))
    -[NSURL startAccessingSecurityScopedResource].cold.1();
  return v2 && CFURLStartAccessingSecurityScopedResource(v2) != 0;
}

- (void)stopAccessingSecurityScopedResource
{
  objc_class *v0;
  uint64_t v1;

  v0 = __CFLookUpClass("NSURL");
  v1 = OUTLINED_FUNCTION_0_29(v0);
  OUTLINED_FUNCTION_1_19(v1, CFSTR("%@: object was not initialized"));
}

- (NSURL)fileReferenceURL
{
  __objc2_class **v3;
  const __CFAllocator *v4;
  CFURLRef v5;

  v3 = (__objc2_class **)-[NSURL _cfurl](self, "_cfurl");
  if (v3 == +[NSURL __unurl](NSURL, "__unurl"))
    -[NSURL fileReferenceURL].cold.1();
  if (v3
    && (__CFURLBeginResourcePropertyCacheAccess(v3),
        v4 = CFGetAllocator(v3),
        v5 = CFURLCreateFileReferenceURL(v4, (CFURLRef)-[NSURL _cfurl](self, "_cfurl"), 0),
        __CFURLEndResourcePropertyCacheAccess(v3),
        v5))
  {
    return (NSURL *)v5;
  }
  else
  {
    return 0;
  }
}

- (NSData)bookmarkDataWithOptions:(NSURLBookmarkCreationOptions)options includingResourceValuesForKeys:(NSArray *)keys relativeToURL:(NSURL *)relativeURL error:(NSError *)error
{
  __objc2_class **v10;
  const __CFAllocator *v11;
  CFDataRef v12;

  v10 = (__objc2_class **)-[NSURL _cfurl](self, "_cfurl");
  if (v10 == +[NSURL __unurl](NSURL, "__unurl"))
    -[NSURL bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:].cold.1();
  if (v10)
  {
    __CFURLBeginResourcePropertyCacheAccess(v10);
    v11 = CFGetAllocator(v10);
    v12 = CFURLCreateBookmarkData(v11, (CFURLRef)v10, options, (CFArrayRef)keys, (CFURLRef)-[NSURL _cfurl](relativeURL, "_cfurl"), (CFErrorRef *)error);
    __CFURLEndResourcePropertyCacheAccess(v10);
    if (v12)
      return (NSData *)v12;
    if (error)
    {
      if (*error)
        *error = *error;
    }
  }
  return 0;
}

+ (NSDictionary)resourceValuesForKeys:(NSArray *)keys fromBookmarkData:(NSData *)bookmarkData
{
  NSDictionary *result;

  result = (NSDictionary *)CFURLCreateResourcePropertiesForKeysFromBookmarkData(0, (CFArrayRef)keys, (CFDataRef)bookmarkData);
  if (result)
    return result;
  return result;
}

+ (BOOL)writeBookmarkData:(NSData *)bookmarkData toURL:(NSURL *)bookmarkFileURL options:(NSURLBookmarkFileCreationOptions)options error:(NSError *)error
{
  int v7;
  int v8;

  v7 = CFURLWriteBookmarkDataToFile((CFDataRef)bookmarkData, (CFURLRef)bookmarkFileURL, options, (CFErrorRef *)error);
  v8 = v7;
  if (error && !v7 && *error)
    *error = *error;
  return v8 != 0;
}

+ (NSData)bookmarkDataWithContentsOfURL:(NSURL *)bookmarkFileURL error:(NSError *)error
{
  CFDataRef v5;

  v5 = CFURLCreateBookmarkDataFromFile(0, (CFURLRef)bookmarkFileURL, (CFErrorRef *)error);
  if (v5)
    return (NSData *)v5;
  if (error)
  {
    if (*error)
      *error = *error;
  }
  return 0;
}

- (void)getResourceValue:forKey:error:.cold.1()
{
  objc_class *v0;
  uint64_t v1;

  v0 = __CFLookUpClass("NSURL");
  v1 = OUTLINED_FUNCTION_0_29(v0);
  OUTLINED_FUNCTION_1_19(v1, CFSTR("%@: object was not initialized"));
}

- (void)resourceValuesForKeys:error:.cold.1()
{
  objc_class *v0;
  uint64_t v1;

  v0 = __CFLookUpClass("NSURL");
  v1 = OUTLINED_FUNCTION_0_29(v0);
  OUTLINED_FUNCTION_1_19(v1, CFSTR("%@: object was not initialized"));
}

- (void)setResourceValue:forKey:error:.cold.1()
{
  objc_class *v0;
  uint64_t v1;

  v0 = __CFLookUpClass("NSURL");
  v1 = OUTLINED_FUNCTION_0_29(v0);
  OUTLINED_FUNCTION_1_19(v1, CFSTR("%@: object was not initialized"));
}

- (void)setResourceValues:error:.cold.1()
{
  objc_class *v0;
  uint64_t v1;

  v0 = __CFLookUpClass("NSURL");
  v1 = OUTLINED_FUNCTION_0_29(v0);
  OUTLINED_FUNCTION_1_19(v1, CFSTR("%@: object was not initialized"));
}

- (void)removeCachedResourceValueForKey:.cold.1()
{
  objc_class *v0;
  uint64_t v1;

  v0 = __CFLookUpClass("NSURL");
  v1 = OUTLINED_FUNCTION_0_29(v0);
  OUTLINED_FUNCTION_1_19(v1, CFSTR("%@: object was not initialized"));
}

- (void)setTemporaryResourceValue:forKey:.cold.1()
{
  objc_class *v0;
  uint64_t v1;

  v0 = __CFLookUpClass("NSURL");
  v1 = OUTLINED_FUNCTION_0_29(v0);
  OUTLINED_FUNCTION_1_19(v1, CFSTR("%@: object was not initialized"));
}

- (void)isFileReferenceURL
{
  objc_class *v0;
  uint64_t v1;

  v0 = __CFLookUpClass("NSURL");
  v1 = OUTLINED_FUNCTION_0_29(v0);
  OUTLINED_FUNCTION_1_19(v1, CFSTR("%@: object was not initialized"));
}

- (void)fileReferenceURL
{
  objc_class *v0;
  uint64_t v1;

  v0 = __CFLookUpClass("NSURL");
  v1 = OUTLINED_FUNCTION_0_29(v0);
  OUTLINED_FUNCTION_1_19(v1, CFSTR("%@: object was not initialized"));
}

- (void)filePathURL
{
  objc_class *v0;
  uint64_t v1;

  v0 = __CFLookUpClass("NSURL");
  v1 = OUTLINED_FUNCTION_0_29(v0);
  OUTLINED_FUNCTION_1_19(v1, CFSTR("%@: object was not initialized"));
}

- (void)bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:.cold.1()
{
  objc_class *v0;
  uint64_t v1;

  v0 = __CFLookUpClass("NSURL");
  v1 = OUTLINED_FUNCTION_0_29(v0);
  OUTLINED_FUNCTION_1_19(v1, CFSTR("%@: object was not initialized"));
}

- (void)startAccessingSecurityScopedResource
{
  objc_class *v0;
  uint64_t v1;

  v0 = __CFLookUpClass("NSURL");
  v1 = OUTLINED_FUNCTION_0_29(v0);
  OUTLINED_FUNCTION_1_19(v1, CFSTR("%@: object was not initialized"));
}

@end
