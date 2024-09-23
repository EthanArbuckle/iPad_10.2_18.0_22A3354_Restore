@implementation SYChange(Additions)

+ (void)changeWithObject:()Additions updateType:store:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_211704000, a2, OS_LOG_TYPE_FAULT, "SYObject %p does not provide the required syncId!", (uint8_t *)&v2, 0xCu);
}

- (void)objectForStore:()Additions .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_211704000, a1, a3, "Nil data for SYObject, cannot decode.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_1();
}

@end
