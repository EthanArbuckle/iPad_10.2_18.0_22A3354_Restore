@implementation NTKRequestFreeSpaceOnVolume

void __NTKRequestFreeSpaceOnVolume_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134283521;
    v9 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "NTKRequestFreeSpaceOnVolume: Recovered %{private}llu bytes of free space.", (uint8_t *)&v8, 0xCu);
  }

  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t, _QWORD))(v6 + 16))(v6, v7, 1, 0);

}

@end
