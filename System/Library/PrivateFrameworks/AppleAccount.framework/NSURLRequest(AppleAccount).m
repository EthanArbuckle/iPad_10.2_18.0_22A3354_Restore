@implementation NSURLRequest(AppleAccount)

- (id)aa_HTTPBody
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BYTE v10[1024];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "HTTPBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(a1, "HTTPBodyStream");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(a1, "valueForHTTPHeaderField:", CFSTR("Content-Length"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "integerValue");

      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v7);
      objc_msgSend(v5, "open");
      if (objc_msgSend(v5, "hasBytesAvailable"))
      {
        do
          objc_msgSend(v8, "appendBytes:length:", v10, objc_msgSend(v5, "read:maxLength:", v10, 1024));
        while ((objc_msgSend(v5, "hasBytesAvailable") & 1) != 0);
      }
      objc_msgSend(v5, "close");
      v4 = (id)objc_msgSend(v8, "copy");

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

@end
