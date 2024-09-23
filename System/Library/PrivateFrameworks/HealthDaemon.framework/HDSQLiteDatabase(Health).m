@implementation HDSQLiteDatabase(Health)

+ (id)protectedDatabaseURLWithProfileDirectoryPath:()Health
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("healthdb_secure.sqlite"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:isDirectory:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)mainDatabaseURLWithProfileDirectoryPath:()Health
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("healthdb.sqlite"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:isDirectory:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)highFrequencyDatabaseURLWithProfileDirectoryPath:()Health
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("healthdb_secure.hfd"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:isDirectory:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
