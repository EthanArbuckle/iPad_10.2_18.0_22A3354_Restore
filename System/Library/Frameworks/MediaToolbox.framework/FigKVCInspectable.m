@implementation FigKVCInspectable

- (id)valueForUndefinedKey:(id)a3
{
  return objc_alloc_init(FigUndefinedKeyValueSentry);
}

- (BOOL)validateValue:(id *)a3 forKey:(id)a4 error:(id *)a5
{
  objc_super v10;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)FigKVCInspectable;
  return -[FigKVCInspectable validateValue:forKey:error:](&v10, sel_validateValue_forKey_error_, a3, a4, a5);
}

- (BOOL)validateValue:(id *)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  BOOL result;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = *a3;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            return 0;
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        result = 1;
        if (v11)
          continue;
        break;
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)FigKVCInspectable;
    return -[FigKVCInspectable validateValue:forKeyPath:error:](&v15, sel_validateValue_forKeyPath_error_, a3, a4, a5);
  }
  return result;
}

@end
