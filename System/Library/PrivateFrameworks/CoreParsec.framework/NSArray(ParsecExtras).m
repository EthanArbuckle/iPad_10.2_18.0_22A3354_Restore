@implementation NSArray(ParsecExtras)

- (id)parsec_numberAtIndex:()ParsecExtras
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectAtIndex:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)parsec_filterObjectsUsingBlock:()ParsecExtras
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__NSArray_ParsecExtras__parsec_filterObjectsUsingBlock___block_invoke;
  v9[3] = &unk_1E39228C0;
  v10 = v4;
  v5 = v4;
  objc_msgSend(a1, "indexesOfObjectsPassingTest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectsAtIndexes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)parsec_mapAndFilterObjectsWithOptions:()ParsecExtras usingBlock:
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__NSArray_ParsecExtras__parsec_mapAndFilterObjectsWithOptions_usingBlock___block_invoke;
  v13[3] = &unk_1E39228E8;
  v15 = v6;
  v8 = v7;
  v14 = v8;
  v9 = v6;
  objc_msgSend(a1, "enumerateObjectsWithOptions:usingBlock:", a3, v13);
  v10 = v14;
  v11 = v8;

  return v11;
}

- (uint64_t)parsec_mapAndFilterObjectsUsingBlock:()ParsecExtras
{
  return objc_msgSend(a1, "parsec_mapAndFilterObjectsWithOptions:usingBlock:", 0, a3);
}

@end
