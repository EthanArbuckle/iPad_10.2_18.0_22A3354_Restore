@implementation LNValue(CATSupport)

- (uint64_t)cat_parameterName
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("parameter0x%lx"), a1);
}

- (id)cat_definitionXML
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "cat_parameterName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cat_dialogType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<parameter name=\"%@\" type=\"%@\"/>"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)cat_variableXML
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  objc_msgSend(a1, "valueType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(a1, "valueType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cat_keyPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "cat_parameterName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(CFSTR("."), "stringByAppendingString:", v3);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E45DFA60;
  }
  objc_msgSend(a1, "valueType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cat_keyPath");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_1E45DFA60;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<var name=\"%@%@\" itemformat=\"%@\" />"), v6, v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v12;
}

@end
