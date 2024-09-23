@implementation TDImageStackAsset

- (id)imageStackDataWithDocument:(id)a3
{
  uint64_t v3;
  uint64_t v5;

  v3 = objc_msgSend(-[TDAsset fileURLWithDocument:](self, "fileURLWithDocument:", a3), "URLByAppendingPathComponent:isDirectory:", CFSTR("Contents.json"), 0);
  v5 = 0;
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v3, 2, &v5);
}

- (BOOL)hasCursorProduction
{
  return 0;
}

- (BOOL)hasProduction
{
  uint64_t v3;

  v3 = -[TDImageStackAsset renditions](self, "renditions");
  if (v3)
    LOBYTE(v3) = objc_msgSend((id)-[TDImageStackAsset renditions](self, "renditions"), "count") != 0;
  return v3;
}

@end
