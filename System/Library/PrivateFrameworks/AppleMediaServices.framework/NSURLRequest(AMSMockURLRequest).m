@implementation NSURLRequest(AMSMockURLRequest)

- (id)body
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "HTTPBodyStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "HTTPBodyStream");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "open");
    v5 = malloc_type_malloc(0x1000uLL, 0x26AE97E4uLL);
    if (!v5)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Malloc Failure"), CFSTR("Could not allocate %zu bytes to read HTTPBodyStream"), 4096);
    if (objc_msgSend(v3, "hasBytesAvailable"))
    {
      do
      {
        v6 = objc_msgSend(v3, "read:maxLength:", v5, 4096);
        if (v6 < 1)
        {
          if ((v6 & 0x8000000000000000) == 0)
            break;
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("StreamReadError"), CFSTR("An error occurred while reading HTTPBodyStream (%ld)"), v6);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendData:", v7);

        }
      }
      while ((objc_msgSend(v3, "hasBytesAvailable") & 1) != 0);
    }
    free(v5);
    objc_msgSend(v3, "close");

  }
  else
  {
    objc_msgSend(a1, "HTTPBody");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

@end
