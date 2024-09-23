@implementation ATXAssetsPaths

+ (id)decDirectory
{
  return (id)objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
}

+ (id)decDirectoryFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "decDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
