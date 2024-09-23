@implementation NSFileManager(IntentsFoundation)

- (BOOL)if_setAuditToken:()IntentsFoundation forExtendedAttributeNamed:ofItemAtURL:
{
  id v7;
  id v8;
  const char *v9;
  id v10;
  const char *v11;

  v7 = objc_retainAutorelease(a5);
  v8 = a4;
  v9 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");
  v10 = objc_retainAutorelease(v8);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");

  return setxattr(v9, v11, a3, 0x20uLL, 0, 0) != -1;
}

- (ssize_t)if_auditTokenForExtendedAttributeNamed:()IntentsFoundation ofItemAtURL:
{
  id v5;
  id v6;
  const char *v7;
  id v8;
  const char *v9;

  v5 = objc_retainAutorelease(a1);
  v6 = a2;
  v7 = (const char *)objc_msgSend(v5, "fileSystemRepresentation");
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  *a3 = 0u;
  a3[1] = 0u;
  return getxattr(v7, v9, a3, 0x20uLL, 0, 0);
}

- (BOOL)if_setBool:()IntentsFoundation forExtendedAttributeNamed:ofItemAtURL:
{
  id v6;
  id v7;
  const char *v8;
  id v9;
  const char *v10;
  char value;

  value = a3;
  v6 = objc_retainAutorelease(a5);
  v7 = a4;
  v8 = (const char *)objc_msgSend(v6, "fileSystemRepresentation");
  v9 = objc_retainAutorelease(v7);
  v10 = (const char *)objc_msgSend(v9, "UTF8String");

  return setxattr(v8, v10, &value, 1uLL, 0, 0) != -1;
}

- (uint64_t)if_BOOLForExtendedAttributeName:()IntentsFoundation ofItemAtURL:
{
  id v5;
  id v6;
  const char *v7;
  id v8;
  const char *v9;
  unsigned __int8 value;

  v5 = objc_retainAutorelease(a4);
  v6 = a3;
  v7 = (const char *)objc_msgSend(v5, "fileSystemRepresentation");
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  value = 0;
  getxattr(v7, v9, &value, 1uLL, 0, 0);
  return value;
}

- (BOOL)if_removeExtendedAttributeName:()IntentsFoundation ofItemAtURL:
{
  id v5;
  id v6;
  const char *v7;
  id v8;
  const char *v9;

  v5 = objc_retainAutorelease(a4);
  v6 = a3;
  v7 = (const char *)objc_msgSend(v5, "fileSystemRepresentation");
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  return removexattr(v7, v9, 0) != -1;
}

@end
