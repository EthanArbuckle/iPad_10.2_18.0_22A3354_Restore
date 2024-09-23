@implementation NSArray(PhotosUI)

- (id)ph_arrayDescriptionWithIndentation:()PhotosUI objectDescription:
{
  void (**v6)(id, _QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("("));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = a1;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11);
        objc_msgSend(&stru_24C62D0F8, "stringByPaddingToLength:withString:startingAtIndex:", a3, CFSTR("\t"), 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR("\n%@%@"), v13, v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  if (objc_msgSend(obj, "count"))
  {
    if (a3)
      v15 = a3 - 1;
    else
      v15 = 0;
    objc_msgSend(&stru_24C62D0F8, "stringByPaddingToLength:withString:startingAtIndex:", v15, CFSTR("\t"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("\n%@"), v16);

  }
  objc_msgSend(v7, "appendString:", CFSTR(")"));

  return v7;
}

- (uint64_t)ph_arrayDescriptionWithIndentation:()PhotosUI
{
  return objc_msgSend(a1, "ph_arrayDescriptionWithIndentation:objectDescription:", a3, &__block_literal_global_1031);
}

@end
