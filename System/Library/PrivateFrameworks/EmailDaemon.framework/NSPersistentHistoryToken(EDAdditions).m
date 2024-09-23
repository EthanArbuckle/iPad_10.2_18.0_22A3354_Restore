@implementation NSPersistentHistoryToken(EDAdditions)

+ (id)ed_unarchivedTokenWithData:()EDAdditions error:
{
  id v5;
  void *v6;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)ed_archiveTokenWithError:()EDAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, a3);
}

@end
