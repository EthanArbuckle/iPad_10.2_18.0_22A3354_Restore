@implementation DDS

uint64_t __DDS_IS_INTERNAL_INSTALL_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  DDS_IS_INTERNAL_INSTALL_is_internal_install = result;
  return result;
}

void __DDS_BUILD_VERSION_STRING_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswerWithError();
  v1 = (void *)DDS_BUILD_VERSION_STRING_build;
  DDS_BUILD_VERSION_STRING_build = v0;

}

uint64_t __DDS_STRING_FROM_DATE_block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)DDS_STRING_FROM_DATE_formatter;
  DDS_STRING_FROM_DATE_formatter = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)DDS_STRING_FROM_DATE_formatter, "setLocale:", v2);

  return objc_msgSend((id)DDS_STRING_FROM_DATE_formatter, "setDateFormat:", CFSTR("yyyy-MM-dd_HH:mm:ss"));
}

@end
