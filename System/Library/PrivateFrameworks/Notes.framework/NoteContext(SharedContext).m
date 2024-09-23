@implementation NoteContext(SharedContext)

+ (void)mainContextObjectFromObject:()SharedContext .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ic_loggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1C88D8000, a2, OS_LOG_TYPE_ERROR, "Error getting main context object from object: %@", (uint8_t *)&v4, 0xCu);

}

@end
