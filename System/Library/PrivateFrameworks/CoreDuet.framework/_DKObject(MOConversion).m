@implementation _DKObject(MOConversion)

- (void)copyToManagedObject:()MOConversion .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  v8 = 2112;
  v9 = a2;
  v10 = 2112;
  v11 = a1;
  _os_log_fault_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_FAULT, "rdar://77234991 encountered event with non-matching dates (creationDate %@, now %@): %@", v7, 0x20u);

}

@end
