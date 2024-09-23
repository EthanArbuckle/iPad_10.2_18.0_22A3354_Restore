@implementation HKZipArchiveEntry

id __67___HKZipArchiveEntry__enumerateLinesInCurrentEntryWithError_block___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t data;
  void *v5;
  _BYTE v7[8192];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  data = archive_read_data();
  if (data < 0)
  {
    objc_msgSend((id)objc_opt_class(), "_assignReadError:archive:", a2, *(_QWORD *)(a1 + 40));
    return 0;
  }
  else
  {
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    return v5;
  }
}

@end
