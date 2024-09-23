@implementation NSCoder(FTUtils)

- (void)fusionTracker_encodeCMTime:()FTUtils forKey:
{
  const __CFAllocator *v5;
  id v6;
  CFDictionaryRef v7;
  CMTime v8;

  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v8 = *a3;
  v6 = a4;
  v7 = CMTimeCopyAsDictionary(&v8, v5);
  objc_msgSend(a1, "encodeObject:forKey:", v7, v6, *(_OWORD *)&v8.value, v8.epoch);

  CFRelease(v7);
}

- (void)fusionTracker_decodeCMTimeForKey:()FTUtils
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = a2;
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7, v10, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeObjectOfClasses:forKey:", v8, v6);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  CMTimeMakeFromDictionary(a3, v9);
}

- (void)fusionTracker_encodeCGRect:()FTUtils forKey:
{
  id v12;
  CFDictionaryRef DictionaryRepresentation;
  CGRect v14;

  v12 = a7;
  v14.origin.x = a2;
  v14.origin.y = a3;
  v14.size.width = a4;
  v14.size.height = a5;
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v14);
  objc_msgSend(a1, "encodeObject:forKey:", DictionaryRepresentation, v12);

  CFRelease(DictionaryRepresentation);
}

- (CGFloat)fusionTracker_decodeCGRectForKey:()FTUtils
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFDictionary *v8;
  CGRect v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  memset(&v10, 0, sizeof(v10));
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (const __CFDictionary *)objc_msgSend(a1, "decodeObjectOfClasses:forKey:", v7, v5);

  CGRectMakeWithDictionaryRepresentation(v8, &v10);
  return v10.origin.x;
}

@end
