@implementation HAPTLVUnsignedNumberValue

- (id)_parseFromData:(const char *)a3 length:(unint64_t)a4 status:(int *)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", HAPTLVParseUInt64((unsigned __int8 *)a3, a4, a5));
}

- (id)_serialize
{
  void *v2;
  void *v3;

  -[HAPTLVNumberValueBase value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HAPTLVWriteUInt64(objc_msgSend(v2, "unsignedLongLongValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HAPTLVNumberValueBase value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HAPTLVUnsignedNumberValue value=%llu>"), objc_msgSend(v3, "unsignedLongLongValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPTLVUnsignedNumberValue *v6;
  HAPTLVUnsignedNumberValue *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPTLVUnsignedNumberValue);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPTLVNumberValueBase parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
    v8 = v10;
    if (v8)
    {

      v7 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v8);
    }

  }
  return v7;
}

@end
