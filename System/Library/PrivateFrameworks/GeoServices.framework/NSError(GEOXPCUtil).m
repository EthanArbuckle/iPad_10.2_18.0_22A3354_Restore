@implementation NSError(GEOXPCUtil)

+ (id)_geo_errorFromXPCData:()GEOXPCUtil
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = _CFXPCCreateCFObjectFromXPCObject();
  if (v0)
  {
    v1 = (void *)v0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      _geo_NSErrorFromDictionaryRepresentationCopy(v1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (id)_geo_errorFromXPCError:()GEOXPCUtil
{
  id v3;
  void *v4;
  const char *string;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  if (MEMORY[0x18D765A14]() == MEMORY[0x1E0C81310])
  {
    string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E0C81270]);
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    if (v3 == (id)MEMORY[0x1E0C81258])
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = -300;
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      if (v3 == (id)MEMORY[0x1E0C81260])
        v8 = -301;
      else
        v8 = -15;
    }
    objc_msgSend(v7, "GEOErrorWithCode:reason:", v8, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -15, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (uint64_t)_geo_isXPCInterruptedError
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (objc_msgSend(a1, "code") != -300)
    return 0;
  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  GEOErrorDomain();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (uint64_t)_geo_newXPCData
{
  void *v1;
  uint64_t v2;

  _geo_NSErrorDictionaryRepresentationCopy(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = _CFXPCCreateXPCObjectFromCFObject();

  return v2;
}

@end
