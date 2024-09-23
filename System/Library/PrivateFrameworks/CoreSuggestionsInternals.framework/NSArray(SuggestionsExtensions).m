@implementation NSArray(SuggestionsExtensions)

- (id)hv_firstHeaderForKey:()SuggestionsExtensions
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = objc_msgSend(a1, "count");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    while (1)
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGSimpleMailMessage.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[header isKindOfClass:[SGSimpleMailHeaderKeyValue class]]"));

      }
      objc_msgSend(v9, "key");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "caseInsensitiveCompare:", v5);

      if (!v11)
        break;

      if (v7 == ++v8)
        goto LABEL_7;
    }
    objc_msgSend(v9, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_7:
    v13 = 0;
  }

  return v13;
}

@end
