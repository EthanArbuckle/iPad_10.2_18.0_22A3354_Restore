@implementation NSError(GEOError)

+ (uint64_t)GEOErrorWithCode:()GEOError userInfo:
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("GEOErrorDomain"), a3, a4);
}

+ (id)GEOErrorWithCode:()GEOError reason:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v11 = *MEMORY[0x1E0C9AFA8];
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("GEOErrorDomain"), a3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("GEOErrorDomain"), a3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)GEOErrorWithCode:()GEOError
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0C9AFA8];
  GEOStringForError(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("GEOErrorDomain"), a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)GEOErrorWithCode:()GEOError reason:underlyingError:
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = (void *)MEMORY[0x1E0C99E08];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "dictionaryWithCapacity:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0C9AFA8]);

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB3388]);
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("GEOErrorDomain"), a3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)GEOErrorWithCode:()GEOError reason:userInfo:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v8 = a5;
  if (a4)
  {
    v9 = a4;
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0C9AFA8]);
    v14 = objc_msgSend(v13, "copy");

    v8 = (id)v14;
  }
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("GEOErrorDomain"), a3, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)geo_insufficientFilesystemCapacityWithBytesNeeded:()GEOError bytesAvailable:
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("CapacityAvailable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("CapacityNeeded");
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "GEOErrorWithCode:userInfo:", -25, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (uint64_t)_geo_isNetworkError
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t result;
  unint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  unint64_t v16;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0C930A8]);

  if (v3)
  {
    v4 = objc_msgSend(a1, "code");
    result = 1;
    if (v4 > 0)
    {
      if (v4 != 1 && v4 != 302 && v4 != 310)
        goto LABEL_18;
    }
    else
    {
      v6 = v4 + 1020;
      if (v6 > 0x13 || ((1 << v6) & 0xBC807) == 0)
      {
LABEL_18:
        v10 = &GeoServicesConfig_ExtraNetworkErrorCodesDomainCFNetwork;
        goto LABEL_10;
      }
    }
  }
  else
  {
    objc_msgSend(a1, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", *MEMORY[0x1E0CB32E8]);

    if (v8)
    {
      v9 = objc_msgSend(a1, "code");
      if ((unint64_t)(v9 + 1020) >= 0x14 || ((0xBC807u >> (v9 - 4)) & 1) == 0)
      {
        v10 = &GeoServicesConfig_ExtraNetworkErrorCodesDomainNSURL;
LABEL_10:
        _getValue(*v10, v10[1], 1, 0, 0, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "code"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "containsObject:", v12);

        return v13;
      }
      return 1;
    }
    else
    {
      objc_msgSend(a1, "domain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqual:", CFSTR("GEOErrorDomain"));

      if (v15)
      {
        v16 = objc_msgSend(a1, "code");
        if (v16 <= 0xFFFFFFFFFFFFFFECLL)
          return 0;
        else
          return (0x40401u >> (v16 + 19)) & 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

@end
