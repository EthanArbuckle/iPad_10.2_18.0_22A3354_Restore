@implementation SARDNativeFlowContextUpdate(ContextSnapshot)

- (uint64_t)serializedBackingStore
{
  return objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, 0);
}

- (id)initWithSerializedBackingStore:()ContextSnapshot
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    a1 = (id)objc_msgSend(a1, "initWithDictionary:", v6);

    v7 = a1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
