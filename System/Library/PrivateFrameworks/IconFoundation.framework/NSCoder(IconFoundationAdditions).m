@implementation NSCoder(IconFoundationAdditions)

- (id)_IF_decodeObjectOfClass:()IconFoundationAdditions forKey:
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;

  v6 = a4;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
  }
  else
  {
    IFDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[NSCoder(IconFoundationAdditions) _IF_decodeObjectOfClass:forKey:].cold.1((uint64_t)v6, v9);

    v8 = 0;
  }

  return v8;
}

- (void)_IF_decodeObjectOfClass:()IconFoundationAdditions forKey:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1D4106000, a2, OS_LOG_TYPE_FAULT, "Decode error: Unexpected class for key '%@'", (uint8_t *)&v2, 0xCu);
}

@end
