@implementation AEConcreteFileSystemPrimitives

- (BOOL)fileExistsAtURL:(id)a3
{
  id v3;
  const char *v4;

  objc_msgSend(a3, "path");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "cStringUsingEncoding:", 4);

  return access(v4, 0) == 0;
}

@end
