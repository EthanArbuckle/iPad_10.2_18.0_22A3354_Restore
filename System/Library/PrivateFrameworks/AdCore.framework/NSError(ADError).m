@implementation NSError(ADError)

- (uint64_t)initWithAdCode:()ADError andDescription:
{
  __CFString *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
    v7 = v6;
  else
    v7 = &stru_1E82B34E8;
  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1, "initWithDomain:code:userInfo:", CFSTR("com.apple.ap.adcore"), a3, v8);

  return v9;
}

- (void)AD_Log:()ADError
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "localizedDescription");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(v5, v6, 0);

}

@end
