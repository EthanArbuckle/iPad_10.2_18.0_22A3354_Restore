@implementation NSValue(BSCoding)

- (BOOL)supportsBSXPCSecureCoding
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "classForCoder");
  return v1 == objc_opt_class();
}

+ (BOOL)supportsBSXPCSecureCoding
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "classForCoder");
  return v1 == objc_opt_class();
}

+ (id)bs_valueWithCGRect:()BSCoding
{
  _QWORD v5[4];

  *(double *)v5 = a1;
  *(double *)&v5[1] = a2;
  *(double *)&v5[2] = a3;
  *(double *)&v5[3] = a4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v5, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)encodeWithBSXPCCoder:()BSCoding
{
  id v4;
  id v5;
  const char *v6;
  const char *v7;
  size_t v8;
  void *v9;
  void *v10;
  NSUInteger sizep[2];

  sizep[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_retainAutorelease(a1);
  v6 = (const char *)objc_msgSend(v5, "objCType");
  sizep[0] = 0;
  v7 = NSGetSizeAndAlignment(v6, sizep, 0);
  v8 = sizep[0];
  if (sizep[0])
  {
    MEMORY[0x1E0C80A78](v7);
    bzero((char *)sizep - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
    if (objc_msgSend(v5, "bs_getValue:ofSize:", (char *)sizep - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v8))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", (char *)sizep - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("data"));

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v6, 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("type"));

    }
  }

}

- (BOOL)bs_getValue:()BSCoding ofSize:
{
  id v6;
  NSUInteger v7;
  NSUInteger sizep;

  sizep = 0;
  v6 = objc_retainAutorelease(a1);
  NSGetSizeAndAlignment((const char *)objc_msgSend(v6, "objCType"), &sizep, 0);
  v7 = sizep;
  if (a3 && sizep == a4)
    objc_msgSend(v6, "getValue:", a3);
  return v7 == a4;
}

- (id)initWithBSXPCCoder:()BSCoding
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSUInteger sizep;

  v4 = a3;
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("type"));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "UTF8String");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = 0;
  if (v7 && v6)
  {
    v10 = objc_msgSend(v7, "length");
    sizep = 0;
    NSGetSizeAndAlignment(v6, &sizep, 0);
    if (v10 == sizep)
    {
      a1 = (id)objc_msgSend(a1, "initWithBytes:objCType:", objc_msgSend(objc_retainAutorelease(v8), "bytes"), v6);
      v9 = a1;
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = objc_msgSend(v8, "length");
      sizep = 0;
      NSGetSizeAndAlignment(v6, &sizep, 0);
      objc_msgSend(v11, "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("Size of input data (%zu) does not match size of type '%s' (%zu)"), v12, v6, sizep);
      v9 = 0;
    }
  }

  return v9;
}

- (double)bs_CGRectValue
{
  __int128 v1;
  _OWORD v3[2];

  v1 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v3[0] = *MEMORY[0x1E0C9D628];
  v3[1] = v1;
  objc_msgSend(a1, "bs_getValue:ofSize:", v3, 32);
  return *(double *)v3;
}

+ (id)bs_valueWithCGSize:()BSCoding
{
  _QWORD v3[2];

  *(double *)v3 = a1;
  *(double *)&v3[1] = a2;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v3, "{CGSize=dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)bs_valueWithCGPoint:()BSCoding
{
  _QWORD v3[2];

  *(double *)v3 = a1;
  *(double *)&v3[1] = a2;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v3, "{CGPoint=dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)bs_valueWithCGAffineTransform:()BSCoding
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", a3, "{CGAffineTransform=dddddd}");
}

- (double)bs_CGSizeValue
{
  __int128 v2;

  v2 = *MEMORY[0x1E0C9D820];
  objc_msgSend(a1, "bs_getValue:ofSize:", &v2, 16);
  return *(double *)&v2;
}

- (double)bs_CGPointValue
{
  __int128 v2;

  v2 = *MEMORY[0x1E0C9D538];
  objc_msgSend(a1, "bs_getValue:ofSize:", &v2, 16);
  return *(double *)&v2;
}

- (uint64_t)bs_CGAffineTransformValue
{
  uint64_t v4;
  __int128 v5;

  v4 = MEMORY[0x1E0C9BAA8];
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *x8_0 = *MEMORY[0x1E0C9BAA8];
  x8_0[1] = v5;
  x8_0[2] = *(_OWORD *)(v4 + 32);
  return objc_msgSend(a1, "bs_getValue:ofSize:");
}

@end
