@implementation CDLogging

void __40___CDLogging_CDUserContext__mdcsChannel__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.coreduet.context", "MDCS");
  v1 = (void *)mdcsChannel_mdcsChannel;
  mdcsChannel_mdcsChannel = (uint64_t)v0;

  if (!mdcsChannel_mdcsChannel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __40___CDLogging_CDUserContext__mdcsChannel__block_invoke_cold_1();
}

void __40___CDLogging_CDUserContext__mdcsChannel__block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_18DD73000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Couldn't create os_log_t mdcsChannel", v0, 2u);
}

@end
