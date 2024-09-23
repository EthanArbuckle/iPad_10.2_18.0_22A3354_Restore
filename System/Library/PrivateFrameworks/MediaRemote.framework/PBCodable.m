@implementation PBCodable

id __61__PBCodable_MRAdditions__mr_valueForPotentiallyUndefinedKey___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  NSSelectorFromString(*(NSString **)(a1 + 40));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "valueForKey:", *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _MRLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "Encountered unknown protobuf key (%@) while converting to a dictionary; skipping.",
        (uint8_t *)&v6,
        0xCu);
    }

    v2 = 0;
  }
  return v2;
}

@end
