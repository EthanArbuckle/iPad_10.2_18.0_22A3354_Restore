@implementation NSString

- (id)stringByReplacingReservedURLCharactersUsingEncoding:(unint64_t)a3
{
  NSUInteger v4;
  _BYTE *v5;
  _BYTE *v6;
  _BYTE *v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  void *v12;

  v4 = -[NSString lengthOfBytesUsingEncoding:](self, "lengthOfBytesUsingEncoding:", 1);
  v5 = malloc_type_malloc(v4 + 1, 0x503CCAE0uLL);
  if (v5)
  {
    v6 = v5;
    -[NSString getCString:maxLength:encoding:](self, "getCString:maxLength:encoding:", v5, v4 + 1, 1);
    if (v4)
    {
      v7 = v6;
      do
      {
        v8 = *v7;
        if ((v8 - 45) >= 2 && v8 != 95 && v8 != 126)
        {
          v9 = v8 - 48;
          v10 = (v8 & 0xFFFFFFDF) - 65;
          if (v9 >= 0xA && v10 >= 0x1A)
            *v7 = 95;
        }
        ++v7;
        --v4;
      }
      while (v4);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v6, 1));
    free(v6);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

@end
