@implementation TDThemeBitSource

- (id)name
{
  return (id)objc_msgSend((id)-[TDThemeBitSource path](self, "path"), "lastPathComponent");
}

- (id)fileURLWithDocument:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(a3, "rootPathForProductionData");
  v5 = (void *)-[TDThemeBitSource path](self, "path");
  if (v4)
    v5 = (void *)objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
  return (id)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", objc_msgSend(v5, "td_stringByStandardizingPath"), 0);
}

@end
