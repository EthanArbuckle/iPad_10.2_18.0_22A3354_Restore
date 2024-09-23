@implementation KSUtilities

void __33___KSUtilities_keyboardDirectory__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  _homeDirectory();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyboardDirectory_dir;
  keyboardDirectory_dir = v0;

  objc_msgSend((id)keyboardDirectory_dir, "stringByAppendingPathComponent:", CFSTR("/Library/Keyboard"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)keyboardDirectory_dir;
  keyboardDirectory_dir = v2;

}

void __41___KSUtilities_keyboardServicesDirectory__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  char v11;

  _homeDirectory();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyboardServicesDirectory_dir;
  keyboardServicesDirectory_dir = v0;

  objc_msgSend((id)keyboardServicesDirectory_dir, "stringByAppendingPathComponent:", CFSTR("/Library/KeyboardServices"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)keyboardServicesDirectory_dir;
  keyboardServicesDirectory_dir = v2;

  v11 = 1;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", keyboardServicesDirectory_dir, &v11);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", keyboardServicesDirectory_dir, 0, 0, &v10);
    v7 = v10;

    if (v7)
    {
      v8 = keyboardServicesDirectory_dir;
      objc_msgSend(v7, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Could not create folder: %@, error: %@"), v8, v9);

    }
  }
}

@end
