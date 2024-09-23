@implementation NSCoder(CGRectKeyedCoding)

- (void)mr_encodeCGRect:()CGRectKeyedCoding forKey:
{
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v8 = (void *)MEMORY[0x1E0CB3B18];
  v9 = a7;
  objc_msgSend(v8, "value:withObjCType:", &v11, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v10, v9, *(_QWORD *)&v11, *(_QWORD *)&v12, *(_QWORD *)&v13, *(_QWORD *)&v14);

}

- (double)mr_decodeCGRectForKey:()CGRectKeyedCoding
{
  id v4;
  void *v5;
  id v6;
  __int128 v7;
  __int128 v9;
  __int128 v10;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (v6 = objc_retainAutorelease(v5),
        !strcmp((const char *)objc_msgSend(v6, "objCType"), "{CGRect={CGPoint=dd}{CGSize=dd}}")))
  {
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(v6, "getValue:", &v9);
  }
  else
  {
    v7 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *MEMORY[0x1E0C9D648];
    v10 = v7;
  }

  return *(double *)&v9;
}

@end
