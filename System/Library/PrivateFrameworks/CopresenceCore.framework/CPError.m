@implementation CPError

+ (id)errorWithCode:(int64_t)a3
{
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 + 1) > 0x19)
    v4 = CFSTR("Unknown error");
  else
    v4 = (const __CFString *)*((_QWORD *)&off_1E5C81030 + a3 + 1);
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.copresence.CPServiceErrorDomain"), a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4 underlyingError:(id)a5
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = (unint64_t)a4;
  v8 = (unint64_t)a5;
  if (v7 | v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v10 = (void *)objc_msgSend((id)v7, "copy");
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CB2938]);

    }
    if (v8)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB3388]);
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.copresence.CPServiceErrorDomain"), a3, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)internalErrorWithDescription:(id)a3
{
  return (id)objc_msgSend(a1, "errorWithCode:description:underlyingError:", -1, a3, 0);
}

+ (id)internalErrorWithDescription:(id)a3 underlyingError:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:description:underlyingError:", -1, a3, a4);
}

@end
