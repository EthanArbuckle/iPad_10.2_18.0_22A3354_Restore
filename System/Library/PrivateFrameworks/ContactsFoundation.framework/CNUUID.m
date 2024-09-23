@implementation CNUUID

+ (id)uuidFromContactIdentifier:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v3);
  if (!v4)
  {
    v5 = objc_msgSend(v3, "rangeOfString:", CFSTR(":"));
    if (v5 == 0x7FFFFFFFFFFFFFFFLL
      || (objc_msgSend(v3, "_cn_take:", v5),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6),
          v6,
          !v4))
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v4;
}

@end
