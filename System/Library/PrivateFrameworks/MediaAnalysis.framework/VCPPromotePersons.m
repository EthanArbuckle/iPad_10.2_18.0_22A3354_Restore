@implementation VCPPromotePersons

void __VCPPromotePersons_block_invoke(_QWORD *a1, _BYTE *a2)
{
  uint64_t v3;
  uint64_t v5;
  uint8_t v6[16];

  v3 = a1[4];
  if (v3 && (*(unsigned int (**)(void))(v3 + 16))())
  {
    *a2 = 1;
    *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = -128;
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "---> Canceling VCPPromotePersons", v6, 2u);
    }
  }
  else
  {
    v5 = a1[5];
    if (v5)
      (*(void (**)(void))(v5 + 16))();
  }
}

@end
