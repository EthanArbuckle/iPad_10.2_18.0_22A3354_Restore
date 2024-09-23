@implementation BRFieldXattrBlob(BRCStageAdditions)

+ (void)loadXattrsFromURL:()BRCStageAdditions structuralBlob:contentBlob:localBlob:withMaximumSize:error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  int v6;
  void *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = *__error();
  objc_msgSend(a1, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fp_prettyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = 67109634;
  v9[1] = v6;
  v10 = 2112;
  v11 = v8;
  v12 = 2112;
  v13 = a2;
  _os_log_error_impl(&dword_1CBD43000, a3, (os_log_type_t)0x90u, "[ERROR] Failed with %d opening file at: %@%@", (uint8_t *)v9, 0x1Cu);

}

+ (void)loadXattrsFromFD:()BRCStageAdditions structuralBlob:contentBlob:localBlob:withMaximumSize:error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: locBlobOut == NULL%@", (uint8_t *)&v2, 0xCu);
}

@end
