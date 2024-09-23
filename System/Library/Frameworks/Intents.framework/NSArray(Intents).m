@implementation NSArray(Intents)

- (id)descriptionAtIndent:()Intents
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_QWORD *, void *);
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("\n"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v6 = a3;
    do
    {
      objc_msgSend(v5, "appendString:", CFSTR("    "));
      --v6;
    }
    while (v6);
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("("));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __40__NSArray_Intents__descriptionAtIndent___block_invoke;
  v16 = &unk_1E228FF48;
  v8 = v7;
  v17 = v8;
  v18 = v5;
  v19 = a3;
  v9 = v5;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v13);
  objc_msgSend(v8, "appendFormat:", CFSTR("%@)"), v9, v13, v14, v15, v16);
  v10 = v18;
  v11 = v8;

  return v11;
}

- (id)_intents_indexingRepresentation
{
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__NSArray_Intents___intents_indexingRepresentation__block_invoke;
  v5[3] = &unk_1E228FF70;
  v3 = v2;
  v6 = v3;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v5);

  return v3;
}

@end
