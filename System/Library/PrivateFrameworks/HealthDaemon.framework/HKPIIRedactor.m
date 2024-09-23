@implementation HKPIIRedactor

+ (void)_addName:(void *)a3 toArray:
{
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  v4 = a3;
  objc_opt_self();
  if (v6 && objc_msgSend(v6, "length"))
  {
    v5 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v4, "addObject:", v5);

  }
}

+ (void)_addNames:(void *)a3 toArray:
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        +[HKPIIRedactor _addName:toArray:](v6, *(void **)(*((_QWORD *)&v12 + 1) + 8 * v11++), v5);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

@end
