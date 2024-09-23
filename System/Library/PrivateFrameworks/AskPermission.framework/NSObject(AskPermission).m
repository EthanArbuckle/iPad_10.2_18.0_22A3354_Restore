@implementation NSObject(AskPermission)

- (id)ap_generateDescriptionWithSubObjects:()AskPermission
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), a1);
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "appendString:", CFSTR(" {\n"));
    objc_msgSend(v4, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@,\n"), v13, v14, (_QWORD)v16);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    objc_msgSend(v5, "appendString:", CFSTR("}"));
  }

  return v5;
}

@end
