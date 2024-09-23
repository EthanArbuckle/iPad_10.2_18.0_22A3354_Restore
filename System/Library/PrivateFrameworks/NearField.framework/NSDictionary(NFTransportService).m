@implementation NSDictionary(NFTransportService)

- (id)transportLabel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)getDictionaryKeyTransportLabel
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
}

- (id)encodeToCBOR
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  v4 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__NSDictionary_NFTransportService__encodeToCBOR__block_invoke;
  v8[3] = &unk_1E3B51F60;
  v8[4] = a1;
  v10 = a2;
  v5 = v4;
  v9 = v5;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v8);
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(getCBORClass(), "cborWithDictionary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
