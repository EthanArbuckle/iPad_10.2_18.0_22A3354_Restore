@implementation TDElementProduction

- (id)relativePath
{
  NSLog(CFSTR("-[TDElementProduction relativePath] WARNING: abstract method called, returning nil"), a2);
  return 0;
}

- (id)associatedFileURLWithDocument:(id)a3
{
  NSLog(CFSTR("-[TDElementProduction associatedFileURLWithDocument:] WARNING: abstract method called, returning nil"), a2, a3);
  return 0;
}

- (id)associatedFileModificationDateWithDocument:(id)a3
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  id result;
  int v8;

  v3 = objc_msgSend(-[TDElementProduction associatedFileURLWithDocument:](self, "associatedFileURLWithDocument:", a3), "path");
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);
  if (v5)
    v6 = (void *)objc_msgSend(v4, "attributesOfItemAtPath:error:", v3, 0);
  else
    v6 = 0;
  result = (id)objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDD0C98]);
  if (result)
    v8 = 0;
  else
    v8 = v5;
  if (v8 == 1)
  {
    NSLog(CFSTR("-[TDElementProduction associatedFileModificationDateWithDocument:] WARNING: %@ exists but has no modification date. Returning +[NSDate distantFuture]"), v3);
    return (id)objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  }
  return result;
}

@end
