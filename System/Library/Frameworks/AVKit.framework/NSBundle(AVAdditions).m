@implementation NSBundle(AVAdditions)

- (id)imageForResource:()AVAdditions size:
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0DC3870];
  v4 = (void *)MEMORY[0x1E0C99D50];
  v5 = a3;
  AVBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForResource:withExtension:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dataWithContentsOfURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithData:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)URLForMovieResource:()AVAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "pathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v5, "stringByDeletingPathExtension");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    objc_msgSend(a1, "URLForResource:withExtension:", v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      if (objc_msgSend(v6, "length"))
      {
        v8 = 0;
      }
      else
      {
        objc_msgSend(a1, "URLForResource:withExtension:", v5, CFSTR("mov"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v9 = 0;
    if (objc_msgSend(v8, "checkResourceIsReachableAndReturnError:", 0))
      v9 = v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
