@implementation SCNJSImage

+ (id)imageWithURL:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "imageWithContentsOfFile:", a3);
}

+ (id)imageWithPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "imageWithContentsOfFile:", a3);
}

+ (id)SCNJSExportProtocol
{
  return &unk_1F040F560;
}

@end
