@implementation MBFileManager

+ (id)defaultManager
{
  id result;

  result = (id)_MBFileManager;
  if (!_MBFileManager)
  {
    result = objc_alloc_init(MBFileManager);
    _MBFileManager = (uint64_t)result;
  }
  return result;
}

- (BOOL)fileExistsAtPath:(id)a3
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", a3);
}

- (BOOL)removeFileAtPath:(id)a3
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", a3, 0);
}

- (BOOL)copyPath:(id)a3 toPath:(id)a4
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "copyItemAtPath:toPath:error:", a3, a4, 0);
}

- (BOOL)movePath:(id)a3 toPath:(id)a4
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "moveItemAtPath:toPath:error:", a3, a4, 0);
}

- (id)directoryContentsAtPath:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "contentsOfDirectoryAtPath:error:", a3, 0);
}

- (id)fileAttributesAtPath:(id)a3 traverseLink:(BOOL)a4
{
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", a3, a4), "attributesOfItemAtPath:error:", a3, 0);
}

- (BOOL)createDirectoryAtPath:(id)a3 attributes:(id)a4
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", a3, 1, a4, 0);
}

@end
