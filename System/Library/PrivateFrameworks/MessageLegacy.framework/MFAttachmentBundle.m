@implementation MFAttachmentBundle

+ (BOOL)isFileBundleURL:(id)a3
{
  BOOL v4;

  v4 = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:isDirectory:", objc_msgSend(a3, "path"), &v4);
  return v4;
}

+ (id)_stripBundlePath:(id)a3 entryPath:(id)a4
{
  void *v5;

  v5 = (void *)objc_msgSend(a3, "path");
  return (id)objc_msgSend((id)objc_msgSend(a4, "path"), "substringFromIndex:", objc_msgSend(v5, "length") + (objc_msgSend(v5, "hasSuffix:", CFSTR("/")) ^ 1));
}

@end
