@implementation NSString(MFUtilities)

- (id)mf_substringTruncatedToIndex:()MFUtilities
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a1;
  if (objc_msgSend(v4, "length") > a3)
  {
    objc_msgSend(v4, "substringToIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("…"));
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  return v4;
}

- (id)mf_substringTruncatedInRange:()MFUtilities
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = a1;
  v7 = v6;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4)
  {
    objc_msgSend(v6, "substringToIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "substringFromIndex:", a3 + a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR("…"));
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }
  return v7;
}

@end
