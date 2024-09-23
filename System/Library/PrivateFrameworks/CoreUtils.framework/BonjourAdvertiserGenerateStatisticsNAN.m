@implementation BonjourAdvertiserGenerateStatisticsNAN

uint64_t __BonjourAdvertiserGenerateStatisticsNAN_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v9;
  id v11;
  uint64_t v12;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
  if (v9)
    return objc_msgSend(v9, "generateStatisticsReportWithCompletionHandler:", v8);
  v11 = NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960591, (uint64_t)"No NAN publisher", a4, a5, a6, a7, a8, v12);
  return (*(uint64_t (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v11);
}

@end
