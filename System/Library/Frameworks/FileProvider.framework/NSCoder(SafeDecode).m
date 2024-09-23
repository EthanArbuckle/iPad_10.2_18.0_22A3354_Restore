@implementation NSCoder(SafeDecode)

- (id)fp_safeDecodeNSDictionaryForKey:()SafeDecode
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  v10[2] = objc_opt_class();
  v10[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v7, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
