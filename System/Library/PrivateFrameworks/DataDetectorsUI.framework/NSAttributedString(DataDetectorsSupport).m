@implementation NSAttributedString(DataDetectorsSupport)

+ (uint64_t)dd_isTransientAttribute:()DataDetectorsSupport
{
  id v3;
  void *v4;
  uint64_t v5;

  if (!a3)
    return 0;
  v3 = a3;
  dd_transientAttributesSet();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (id)dd_contextAtLocation:()DataDetectorsSupport
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", a1, CFSTR("TextStorage"));
  objc_msgSend(a1, "attribute:atIndex:effectiveRange:", CFSTR("DDContext"), a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "addEntriesFromDictionary:", v6);

  return v5;
}

- (uint64_t)dd_resultAtLocation:()DataDetectorsSupport
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D1CC00], a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "coreResult");

  return v4;
}

@end
