@implementation CSTokenScope

void __92___CSTokenScope_tokenScopesWithTitles_tokenTitles_scopeTypes_queryAttributesList_modifiers___block_invoke(id *a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _CSTokenScope *v9;
  void *v10;
  void *v11;
  id v12;

  CSGetLocalizedString(a2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CSGetLocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  v9 = -[_CSTokenScope initWithTitle:tokenTitle:scopeType:]([_CSTokenScope alloc], "initWithTitle:tokenTitle:scopeType:", v12, v6, v8);
  if (objc_msgSend(a1[6], "count") <= a3)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(a1[6], "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1[7], "objectAtIndexedSubscript:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CSTokenScope addQueryAttributes:modifier:](v9, "addQueryAttributes:modifier:", v11, v10);

  objc_msgSend(a1[8], "addObject:", v9);
}

@end
