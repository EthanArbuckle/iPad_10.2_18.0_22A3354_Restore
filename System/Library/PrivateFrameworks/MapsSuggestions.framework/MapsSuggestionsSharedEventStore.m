@implementation MapsSuggestionsSharedEventStore

+ (id)sharedEventStore
{
  if (qword_1ED22F648 != -1)
    dispatch_once(&qword_1ED22F648, &__block_literal_global_40);
  return (id)_MergedGlobals_52;
}

void __51__MapsSuggestionsSharedEventStore_sharedEventStore__block_invoke()
{
  NSObject *v0;
  id v1;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  GEOFindOrCreateLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "EKEventStoreInit", ", buf, 2u);
  }

  v1 = objc_alloc_init(MEMORY[0x1E0CAA078]);
  v2 = (void *)_MergedGlobals_52;
  _MergedGlobals_52 = (uint64_t)v1;

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EKEventStoreInit", ", v4, 2u);
  }

}

@end
