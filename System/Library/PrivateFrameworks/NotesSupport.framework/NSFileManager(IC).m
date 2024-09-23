@implementation NSFileManager(IC)

- (id)ic_temporaryDirectoryPathAppropriateForDestinationPath:()IC
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "ic_temporaryDirectoryAppropriateForDestination:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)ic_temporaryDirectoryAppropriateForDestination:()IC
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;

  v4 = a3;
  v9 = 0;
  objc_msgSend(a1, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v4, 1, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NSFileManager(IC) ic_temporaryDirectoryAppropriateForDestination:].cold.1((uint64_t)v4, v7);

  }
  return v5;
}

- (void)ic_temporaryDirectoryAppropriateForDestination:()IC .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DDAA5000, a2, OS_LOG_TYPE_ERROR, "Error creating temporary directory for destination: %@", (uint8_t *)&v2, 0xCu);
}

@end
