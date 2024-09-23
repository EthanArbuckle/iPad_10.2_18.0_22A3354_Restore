@implementation CalLazyCreateUtils

+ (void)addArray:(id)a3 toArray:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    v5 = *a4;
    if (!*a4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *a4;
      *a4 = v6;

      v5 = *a4;
    }
    objc_msgSend(v5, "addObjectsFromArray:", v8);
  }

}

+ (void)addObject:(id)a3 toArray:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v5 = a3;
  v6 = *a4;
  v9 = v5;
  if (!*a4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *a4;
    *a4 = v7;

    v5 = v9;
    v6 = *a4;
  }
  objc_msgSend(v6, "addObject:", v5);

}

+ (void)setValue:(id)a3 withKey:(id)a4 inDictionary:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v7 = a4;
  v8 = *a5;
  if (!*a5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *a5;
    *a5 = v9;

    v8 = *a5;
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, v7);

}

+ (void)addObject:(id)a3 toSet:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v5 = a3;
  v6 = *a4;
  v9 = v5;
  if (!*a4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *a4;
    *a4 = v7;

    v5 = v9;
    v6 = *a4;
  }
  objc_msgSend(v6, "addObject:", v5);

}

+ (void)addSet:(id)a3 toSet:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    v5 = *a4;
    if (!*a4)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *a4;
      *a4 = v6;

      v5 = *a4;
    }
    objc_msgSend(v5, "unionSet:", v8);
  }

}

+ (void)addArray:(id)a3 withKey:(id)a4 toDictionaryOfArrays:(id *)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (objc_msgSend(v9, "count"))
  {
    _acquireArrayFromDictionary(a5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v9);

  }
}

+ (void)addItem:(id)a3 withKey:(id)a4 toDictionaryOfArrays:(id *)a5
{
  id v7;
  id v8;

  v7 = a3;
  _acquireArrayFromDictionary(a5, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v7);

}

+ (void)addArray:(id)a3 withKey:(id)a4 toDictionaryOfSets:(id *)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (objc_msgSend(v9, "count"))
  {
    _acquireSetFromDictionary(a5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v9);

  }
}

+ (void)addItem:(id)a3 withKey:(id)a4 toDictionaryOfSets:(id *)a5
{
  id v7;
  id v8;

  v7 = a3;
  _acquireSetFromDictionary(a5, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v7);

}

+ (void)addSet:(id)a3 withKey:(id)a4 toDictionaryOfSets:(id *)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (objc_msgSend(v9, "count"))
  {
    _acquireSetFromDictionary(a5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unionSet:", v9);

  }
}

+ (void)addArray:(id)a3 withKey:(id)a4 toStrongTableOfArrays:(id *)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (objc_msgSend(v9, "count"))
  {
    _acquireArrayFromTable(a5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v9);

  }
}

+ (void)addItem:(id)a3 withKey:(id)a4 toStrongTableOfArrays:(id *)a5
{
  id v7;
  id v8;

  v7 = a3;
  _acquireArrayFromTable(a5, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v7);

}

@end
