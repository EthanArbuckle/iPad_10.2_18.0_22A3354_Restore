@implementation NSDictionary(MSVAdditions)

- (id)msv_compactDescription
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __52__NSDictionary_MSVAdditions__msv_compactDescription__block_invoke;
  v11 = &unk_1E43E9B80;
  v12 = v2;
  v3 = v2;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v8);
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "msv_compactDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("{ %@ }"), v5, v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)msv_enumerateKeysAndObjectsOrderedByKeyDescriptors:()MSVAdditions usingBlock:
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingDescriptors:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[NSDictionary _msv_enumerateKeysAndObjectsWithSortedKeys:usingBlock:](a1, v9, v6);
}

- (void)msv_enumerateKeysAndObjectsOrderedByKeySelector:()MSVAdditions usingBlock:
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a1, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[NSDictionary _msv_enumerateKeysAndObjectsWithSortedKeys:usingBlock:](a1, v8, v6);
}

- (void)msv_enumerateKeysAndObjectsOrderedByKeyComparator:()MSVAdditions usingBlock:
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayWithOptions:usingComparator:", 0, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[NSDictionary _msv_enumerateKeysAndObjectsWithSortedKeys:usingBlock:](a1, v9, v6);
}

+ (id)msv_dictionaryWithContentsOfBase64EncodedJSONString:()MSVAdditions error:
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0C99D50];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithBase64EncodedString:options:", v7, 0);

  objc_msgSend(a1, "msv_dictionaryWithContentsOfJSON:error:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)msv_dictionaryWithContentsOfJSON:()MSVAdditions error:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v5 && (_NSIsNSDictionary() & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2938];
    v13[0] = CFSTR("Unexpected non-dictionary object in JSON payload");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("MediaServices"), 400, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v9;
  }
  if (a4 && v6)
    *a4 = objc_retainAutorelease(v6);

  return v5;
}

@end
