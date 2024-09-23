@implementation AGXPrincipalDevice

- (AGXPrincipalDevice)initWithAcceleratorPort:(unsigned int)a3
{
  uint8_t v4[16];
  uint8_t buf[16];

  fwrite("Attempting to load Metal bundle via AGXPrincipalDevice is not supported!\n", 0x49uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: Attempting to load Metal bundle via AGXPrincipalDevice is not supported!\n", buf, 2u);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGX: Attempting to load Metal bundle via AGXPrincipalDevice is not supported!\n", v4, 2u);
  }
  return 0;
}

@end
