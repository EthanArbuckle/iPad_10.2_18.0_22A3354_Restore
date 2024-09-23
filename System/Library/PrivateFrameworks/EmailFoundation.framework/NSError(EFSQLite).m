@implementation NSError(EFSQLite)

+ (id)ef_SQLiteErrorWithCode:()EFSQLite
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (_registerSQLiteErrorDomainUserInfoValueProvider_onceToken != -1)
    dispatch_once(&_registerSQLiteErrorDomainUserInfoValueProvider_onceToken, &__block_literal_global_145);
  if (a3 < 0x100)
  {
    v7 = 0;
  }
  else
  {
    v10 = CFSTR("EFSQLiteExtendedErrorCodeKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v6;
  }
  v8 = (void *)objc_msgSend([a1 alloc], "initWithDomain:code:userInfo:", CFSTR("EFSQLiteErrorDomain"), a3, v7);

  return v8;
}

@end
