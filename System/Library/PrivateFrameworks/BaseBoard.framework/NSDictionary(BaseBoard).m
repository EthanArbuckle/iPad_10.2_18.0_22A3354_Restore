@implementation NSDictionary(BaseBoard)

- (id)bs_safeObjectForKey:()BaseBoard ofType:
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v1 = v2;
    else
      v1 = 0;
  }
  v3 = v1;

  return v3;
}

- (uint64_t)bs_safeStringForKey:()BaseBoard
{
  return objc_msgSend(a1, "bs_safeObjectForKey:ofType:", a3, objc_opt_class());
}

- (uint64_t)bs_BOOLForKey:()BaseBoard
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

- (uint64_t)bs_safeNumberForKey:()BaseBoard
{
  return objc_msgSend(a1, "bs_safeObjectForKey:ofType:", a3, objc_opt_class());
}

- (id)bs_dictionaryByAddingEntriesFromDictionary:()BaseBoard
{
  void *v5;
  id v6;

  if (objc_msgSend(a3, "count") || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = (void *)objc_msgSend(a1, "mutableCopy");
    v6 = v5;
    if (a3)
      objc_msgSend(v5, "addEntriesFromDictionary:", a3);
  }
  else
  {
    v6 = a1;
  }
  return v6;
}

- (uint64_t)bs_safeArrayForKey:()BaseBoard
{
  return objc_msgSend(a1, "bs_safeObjectForKey:ofType:", a3, objc_opt_class());
}

- (uint64_t)bs_safeDictionaryForKey:()BaseBoard
{
  return objc_msgSend(a1, "bs_safeObjectForKey:ofType:", a3, objc_opt_class());
}

- (id)bs_filter:()BaseBoard
{
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v6 = v5;
  if (a3)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __37__NSDictionary_BaseBoard__bs_filter___block_invoke;
    v8[3] = &unk_1E1EBE5A0;
    v10 = a3;
    v9 = v5;
    objc_msgSend(a1, "bs_each:", v8);

  }
  else
  {
    objc_msgSend(v5, "addEntriesFromDictionary:", a1);
  }
  return v6;
}

- (void)bs_each:()BaseBoard
{
  _QWORD v3[5];

  if (a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __35__NSDictionary_BaseBoard__bs_each___block_invoke;
    v3[3] = &unk_1E1EBEE28;
    v3[4] = a3;
    return (void *)objc_msgSend(result, "enumerateKeysAndObjectsUsingBlock:", v3);
  }
  return result;
}

- (uint64_t)bs_safeURLForKey:()BaseBoard
{
  return objc_msgSend(a1, "bs_safeObjectForKey:ofType:", a3, objc_opt_class());
}

@end
