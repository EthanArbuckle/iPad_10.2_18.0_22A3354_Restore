@implementation SNNLogging

+ (id)framework
{
  if (framework_onceToken != -1)
    dispatch_once(&framework_onceToken, &__block_literal_global);
  return (id)framework_coreChannel;
}

void __23__SNNLogging_framework__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.neuralnetworks", "backend.milespresso");
  v1 = (void *)framework_coreChannel;
  framework_coreChannel = (uint64_t)v0;

  if (!framework_coreChannel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __23__SNNLogging_framework__block_invoke_cold_1();
}

void __23__SNNLogging_framework__block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_242A44000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Couldn't create os_log_t coreChannel", v0, 2u);
}

@end
