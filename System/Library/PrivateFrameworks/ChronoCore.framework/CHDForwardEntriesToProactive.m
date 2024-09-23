@implementation CHDForwardEntriesToProactive

void __CHDForwardEntriesToProactive_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  os_signpost_id_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x1E0C81028];
  v5 = *(_QWORD *)(a1 + 32);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    v6 = 138412290;
    v7 = v3;
    _os_signpost_emit_with_name_impl(&dword_1D271A000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_END, v5, "ProactiveReporting", "Reporting Timeline finished. <error?>=%@", (uint8_t *)&v6, 0xCu);
  }

}

@end
