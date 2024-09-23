@implementation NSDictionary(MKAdditions)

- (uint64_t)_mapkit_writeBinaryPlist:()MKAdditions atomically:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;

  v6 = (void *)MEMORY[0x1E0CB38B0];
  v12 = 0;
  v7 = a3;
  objc_msgSend(v6, "dataWithPropertyList:format:options:error:", a1, 200, 0, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "writeToFile:atomically:", v7, a4);
  }
  else
  {
    NSLog(CFSTR("Failed to serialize %@ with error %@"), v7, v12);
    v10 = 0;
  }

  return v10;
}

@end
