@implementation LASecAccessControl

+ (id)constraintsFromACL:(__SecAccessControl *)a3
{
  const __CFDictionary *Constraints;

  Constraints = (const __CFDictionary *)SecAccessControlGetConstraints();
  return CFDictionaryCreateCopy(0, Constraints);
}

+ (id)serializeACL:(__SecAccessControl *)a3
{
  return (id)SecAccessControlCopyData();
}

+ (__SecAccessControl)deserializeACL:(id)a3
{
  id v3;
  uint64_t v4;
  __SecAccessControl *v5;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = a3;
  v4 = SecAccessControlCreateFromData();
  if (!v4)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could note deserialize ACL (%@)"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v10);
  }
  v5 = (__SecAccessControl *)v4;

  return v5;
}

+ (__SecAccessControl)denyAllACL
{
  uint64_t v2;
  __SecAccessControl *v3;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = SecAccessControlCreate();
  if (!v2)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not initialize trivial ACL (%@)"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v8);
  }
  v3 = (__SecAccessControl *)v2;
  v9 = CFSTR("dacl");
  v10[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  SecAccessControlSetConstraints();

  return v3;
}

+ (__SecAccessControl)allowAllACL
{
  SecAccessControlRef v2;
  __SecAccessControl *v3;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  CFErrorRef error;

  error = 0;
  v2 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x1E0CD68F0], 0, &error);
  if (!v2)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not initialize trivial ACL (%@)"), error);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v8);
  }
  v3 = v2;

  return v3;
}

@end
