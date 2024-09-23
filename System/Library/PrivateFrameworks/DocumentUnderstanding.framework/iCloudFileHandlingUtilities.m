@implementation iCloudFileHandlingUtilities

+ (unint64_t)isURLDatalessFault:(id)a3
{
  const __CFURL *v3;
  BOOL v4;
  NSObject *v5;
  unint64_t v6;
  CFTypeRef cf;
  CFBooleanRef propertyValueTypeRefPtr;

  cf = 0;
  propertyValueTypeRefPtr = 0;
  v3 = (const __CFURL *)a3;
  if (CFURLCopyResourcePropertyForKey(v3, (CFStringRef)*MEMORY[0x24BDBD228], &propertyValueTypeRefPtr, (CFErrorRef *)&cf))
  {
    v4 = propertyValueTypeRefPtr == 0;
  }
  else
  {
    v4 = 1;
  }
  if (v4)
  {
    du_file_notification_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[iCloudFileHandlingUtilities isURLDatalessFault:].cold.1((uint64_t *)&cf, v5);

    if (cf)
      CFRelease(cf);
    v6 = 2;
  }
  else
  {
    v6 = CFBooleanGetValue(propertyValueTypeRefPtr) != 0;
    CFRelease(propertyValueTypeRefPtr);
  }

  return v6;
}

+ (void)isURLDatalessFault:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_2282CC000, a2, OS_LOG_TYPE_ERROR, "Could not determine if the document is a dataless fault: %@", (uint8_t *)&v3, 0xCu);
}

@end
