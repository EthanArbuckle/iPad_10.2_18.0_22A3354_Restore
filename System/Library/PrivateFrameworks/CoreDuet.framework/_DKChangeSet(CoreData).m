@implementation _DKChangeSet(CoreData)

- (void)initWithManagedObject:()CoreData .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, a1, a3, "Dropping change set due to previous error.", a5, a6, a7, a8, 0);
}

- (void)initWithManagedObject:()CoreData .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "version");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_ERROR, "Dropping change set, unknown version number: %@", (uint8_t *)&v4, 0xCu);

}

+ (void)dataFromCompressedChangeSet:()CoreData .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, a1, a3, "Unable to decode change set due to invalid data", a5, a6, a7, a8, 0);
}

+ (void)dataFromCompressedChangeSet:()CoreData .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_DKPRCompressedChangeSet uncompressedLength](a2));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_ERROR, "Change set uncompressed size %@ does not match uncompressed length %@", (uint8_t *)&v7, 0x16u);

}

@end
