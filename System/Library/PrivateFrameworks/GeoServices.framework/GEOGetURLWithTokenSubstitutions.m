@implementation GEOGetURLWithTokenSubstitutions

id __GEOGetURLWithTokenSubstitutions_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  unint64_t v5;
  __CFString *v6;
  int v8;
  __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E98], "_geo_URLWithString:tokenSubstitutions:", a2, *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    GEOGetUserDefaultsLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      if (v5 > 0x41)
        v6 = 0;
      else
        v6 = off_1E1C13090[v5];
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_ERROR, "URL value for type '%{public}@' is not a valid URL", (uint8_t *)&v8, 0xCu);
    }

  }
  return v3;
}

@end
