@implementation NSFileManager(WFFileRepresentation)

- (BOOL)wf_removeExtendedAttributeName:()WFFileRepresentation ofItemAtURL:
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
