@implementation NSData(NSDataUtils)

- (uint64_t)mf_rangeOfRFC822HeaderData
{
  _rangeOfBytes(a1, "\n\n", 2uLL, 0, 0, objc_msgSend(a1, "length"));
  return 0;
}

- (uint64_t)mf_subdataToIndex:()NSDataUtils
{
  return objc_msgSend(a1, "mf_subdataWithRange:", 0, a3);
}

- (uint64_t)mf_subdataFromIndex:()NSDataUtils
{
  return objc_msgSend(a1, "mf_subdataWithRange:", a3, objc_msgSend(a1, "length") - a3);
}

- (uint64_t)mf_rangeOfData:()NSDataUtils options:range:
{
  id v10;
  uint64_t v11;

  v10 = objc_retainAutorelease(a3);
  v11 = _rangeOfBytes(a1, (char *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), a4, a5, a6);

  return v11;
}

- (uint64_t)mf_rangeOfCString:()NSDataUtils
{
  size_t v5;

  v5 = strlen(__s);
  return _rangeOfBytes(a1, __s, v5, 0, 0, objc_msgSend(a1, "length"));
}

- (uint64_t)mf_rangeOfCString:()NSDataUtils options:
{
  size_t v7;

  v7 = strlen(__s);
  return _rangeOfBytes(a1, __s, v7, a4, 0, objc_msgSend(a1, "length"));
}

- (uint64_t)mf_rangeOfCString:()NSDataUtils options:range:
{
  size_t v11;

  v11 = strlen(__s);
  return _rangeOfBytes(a1, __s, v11, a4, a5, a6);
}

- (id)mf_locationsOfUnixNewlinesNeedingConversion
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  char *v8;
  char *v9;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v3 = objc_retainAutorelease(a1);
  v4 = objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  if (v5 >= 1)
  {
    v6 = v4 + v5;
    v7 = (char *)v4;
    do
    {
      v8 = (char *)memchr(v7, 10, v6 - (_QWORD)v7);
      if (!v8)
        break;
      v9 = v8;
      if (v7 >= v8 || *(v8 - 1) != 13)
        objc_msgSend(v2, "addIndex:", &v8[-v4]);
      v7 = v9 + 1;
    }
    while ((unint64_t)(v9 + 1) < v6);
  }
  return v2;
}

- (MFMutableData)mf_dataByConvertingUnixNewlinesToNetwork
{
  void *v2;
  MFMutableData *v3;
  uint64_t v4;
  MFMutableData *v5;
  char *v6;
  MFMutableData *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  MFMutableData *v13;
  MFMutableData *v14;

  -[NSData mf_locationsOfUnixNewlinesNeedingConversion](a1, "mf_locationsOfUnixNewlinesNeedingConversion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = -[MFMutableData initWithCapacity:]([MFMutableData alloc], "initWithCapacity:", objc_msgSend(v2, "count") + -[MFMutableData length](a1, "length"));
    v4 = objc_msgSend(v2, "firstIndex");
    v5 = objc_retainAutorelease(a1);
    v6 = -[MFMutableData bytes](v5, "bytes");
    v7 = objc_retainAutorelease(v3);
    v8 = -[MFMutableData mutableBytes](v7, "mutableBytes");
    v9 = 0;
    do
    {
      v10 = v9;
      v9 = v4;
      v11 = v4 - v10;
      memmove(v8, v6, v4 - v10);
      v12 = &v8[v11];
      *v12 = 13;
      v4 = objc_msgSend(v2, "indexGreaterThanIndex:", v4);
      v8 = v12 + 1;
      v6 += v11;
    }
    while (v4 != 0x7FFFFFFFFFFFFFFFLL);
    memmove(v8, v6, -[MFMutableData length](v5, "length") - v9);
    -[MFMutableData setLength:](v7, "setLength:", objc_msgSend(v2, "count") + -[MFMutableData length](v5, "length"));
  }
  else
  {
    v7 = 0;
  }
  if (v7)
    v13 = v7;
  else
    v13 = a1;
  v14 = v13;

  return v14;
}

@end
