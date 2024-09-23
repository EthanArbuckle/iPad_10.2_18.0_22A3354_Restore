@implementation ISIcon(Workaround)

- (void)_prepareImageForImageDescriptor:()Workaround .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[ISIcon(Workaround) _prepareImageForImageDescriptor:]";
  _os_log_fault_impl(&dword_1AA928000, log, OS_LOG_TYPE_FAULT, "Unauthorized use of internal IS implementation: %s. Returning generic app icon data.", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
