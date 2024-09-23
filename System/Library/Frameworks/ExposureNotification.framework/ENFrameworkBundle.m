@implementation ENFrameworkBundle

void __ENFrameworkBundle_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.ExposureNotification"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ENFrameworkBundle_sBundle;
  ENFrameworkBundle_sBundle = v0;

  if (!ENFrameworkBundle_sBundle)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:isDirectory:", CFSTR("/System/Library/Frameworks/ExposureNotification.framework"), 1);
    if (v2)
    {
      v5 = v2;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v2);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)ENFrameworkBundle_sBundle;
      ENFrameworkBundle_sBundle = v3;

      v2 = v5;
    }

  }
}

@end
