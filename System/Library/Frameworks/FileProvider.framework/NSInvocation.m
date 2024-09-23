@implementation NSInvocation

id __46__NSInvocation_FPExtensions__fp_sanitizeError__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[FPXPCSanitizer permittedErrorDomains](FPXPCSanitizer, "permittedErrorDomains");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  if (v5)
  {
    v6 = v2;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB28A8];
    v11 = *MEMORY[0x1E0CB3388];
    v12[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 4101, v9);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

@end
