@implementation ML3MigrationExecuteDirectives

void ___ML3MigrationExecuteDirectives_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "[Migration] Autogeneration of supported sizes completed (error=%{public}@)", (uint8_t *)&v4, 0xCu);
  }

}

@end
