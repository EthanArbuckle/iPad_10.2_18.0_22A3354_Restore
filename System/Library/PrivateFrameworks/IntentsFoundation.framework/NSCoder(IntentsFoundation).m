@implementation NSCoder(IntentsFoundation)

- (void)if_encodeBytesNoCopy:()IntentsFoundation forKey:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if (a3)
  {
    v6 = objc_retainAutorelease(a3);
    v10 = a4;
    v7 = v6;
    v8 = objc_msgSend(v7, "bytes");
    v9 = objc_msgSend(v7, "length");

    objc_msgSend(a1, "encodeBytes:length:forKey:", v8, v9, v10);
  }
}

- (id)if_decodeBytesNoCopyForKey:()IntentsFoundation
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v7;

  v7 = 0;
  v3 = (void *)objc_msgSend(objc_retainAutorelease(a1), "decodeBytesForKey:returnedLength:", a3, &v7);
  if (v3)
  {
    v4 = v3;
    v5 = objc_alloc(MEMORY[0x1E0C99D50]);
    v3 = (void *)objc_msgSend(v5, "initWithBytesNoCopy:length:freeWhenDone:", v4, v7, 0);
  }
  return v3;
}

@end
