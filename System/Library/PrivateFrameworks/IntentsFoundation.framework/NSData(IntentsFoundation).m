@implementation NSData(IntentsFoundation)

+ (id)if_dataWithAuditToken:()IntentsFoundation
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", a3, "{?=[8I]}");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "if_dataWithValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)if_dataWithValue:()IntentsFoundation
{
  id v3;
  void *v4;
  void *v5;
  NSUInteger sizep;

  if (!a3)
    return 0;
  sizep = 0;
  v3 = objc_retainAutorelease(a3);
  NSGetSizeAndAlignment((const char *)objc_msgSend(v3, "objCType"), &sizep, 0);
  v4 = malloc_type_malloc(sizep, 0xBBD9uLL);
  objc_msgSend(v3, "getValue:", v4);

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v4, sizep);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  free(v4);
  return v5;
}

- (void)if_auditToken
{
  id v3;

  objc_msgSend(a1, "if_valueOfType:", "{?=[8I]}");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *a2 = 0u;
  a2[1] = 0u;
  objc_msgSend(v3, "getValue:", a2);

}

- (id)if_valueOfType:()IntentsFoundation
{
  uint64_t v5;
  void *v6;
  NSUInteger sizep;

  v5 = objc_msgSend(a1, "length");
  sizep = 0;
  NSGetSizeAndAlignment(a3, &sizep, 0);
  v6 = 0;
  if (v5 == sizep)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", objc_msgSend(objc_retainAutorelease(a1), "bytes"), a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

@end
