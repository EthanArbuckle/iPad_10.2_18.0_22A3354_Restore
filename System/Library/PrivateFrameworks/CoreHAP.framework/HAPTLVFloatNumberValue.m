@implementation HAPTLVFloatNumberValue

- (id)_parseFromData:(const char *)a3 length:(unint64_t)a4 status:(int *)a5
{
  double v5;
  void *v6;

  if (a4 == 4)
  {
    LODWORD(v5) = *(_DWORD *)a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
    if (a5)
      *a5 = -6705;
  }
  return v6;
}

- (id)_serialize
{
  void *v2;
  int v3;
  int v5;

  -[HAPTLVNumberValueBase value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v5 = v3;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v5, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  void *v2;
  void *v3;
  float v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HAPTLVNumberValueBase value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HAPTLVFloatNumberValue value=%f>"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPTLVFloatNumberValue *v6;
  HAPTLVFloatNumberValue *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPTLVFloatNumberValue);
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
