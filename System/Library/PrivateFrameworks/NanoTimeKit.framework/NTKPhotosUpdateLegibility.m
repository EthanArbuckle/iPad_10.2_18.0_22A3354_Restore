@implementation NTKPhotosUpdateLegibility

void __NTKPhotosUpdateLegibility_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "analysisForAlignment:deviceSizeClass:", *(_QWORD *)(a1 + 56), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    _NTKLoggingObjectForDomain(17, (uint64_t)"NTKLoggingDomainMigration");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 56);
      v10 = 134218240;
      v11 = v6;
      v12 = 2048;
      v13 = a2;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "   * analysis done for align == %lu, size == %lu", (uint8_t *)&v10, 0x16u);
    }

    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKPhotoAnalysis analysisWithImage:alignment:deviceSizeClass:](NTKPhotoAnalysis, "analysisWithImage:alignment:deviceSizeClass:", v8, *(_QWORD *)(a1 + 56), a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAnalysis:alignment:deviceSizeClass:", v9, *(_QWORD *)(a1 + 56), a2);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

@end
