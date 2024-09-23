@implementation PHPhotoLibrary

void __86__PHPhotoLibrary_LimitedLibraryPicker__presentLimitedLibraryPickerFromViewController___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  PLPickerGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_20D1E2000, v3, OS_LOG_TYPE_DEBUG, "Limited library picker selected new assets with identifiers: %@", (uint8_t *)&v4, 0xCu);
  }

}

@end
