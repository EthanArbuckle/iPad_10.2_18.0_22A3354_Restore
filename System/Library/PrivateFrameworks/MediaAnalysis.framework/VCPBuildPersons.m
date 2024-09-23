@implementation VCPBuildPersons

uint64_t __VCPBuildPersons_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;
  uint8_t v4[16];

  v2 = a1[4];
  if (v2 && (*(unsigned int (**)(void))(v2 + 16))())
  {
    *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = -128;
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "---> Canceling VCPBuildPersons", v4, 2u);
    }
    return 1;
  }
  else
  {
    result = a1[5];
    if (result)
    {
      (*(void (**)(void))(result + 16))();
      return 0;
    }
  }
  return result;
}

@end
