@implementation MCMActionArgumentRelativeFile

- (id)fileURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  -[MCMActionArgumentBase string](self, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:relativeToURL:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
