@implementation LSGetMainBundleURL

void ___LSGetMainBundleURL_block_invoke()
{
  __CFBundle *MainBundle;
  CFURLRef v1;
  void *v2;
  uint64_t v3;
  FSNode *v4;
  FSNode *v5;
  const __CFURL *v6;
  void *v7;
  CFURLRef v8;

  MainBundle = CFBundleGetMainBundle();
  if (MainBundle)
  {
    v1 = CFBundleCopyBundleURL(MainBundle);
    if (v1)
    {
      v8 = v1;
      -[__CFURL pathExtension](v1, "pathExtension");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "length");

      if (v3)
      {
        v4 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", v8, 34, 0);
        v5 = v4;
        if (v4)
        {
          -[FSNode URL](v4, "URL");
          v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v6 = v8;
        }
        v7 = (void *)_LSGetMainBundleURL::result;
        _LSGetMainBundleURL::result = (uint64_t)v6;

      }
      else
      {
        v5 = (FSNode *)_LSGetMainBundleURL::result;
        _LSGetMainBundleURL::result = 0;
      }

      v1 = v8;
    }

  }
}

@end
