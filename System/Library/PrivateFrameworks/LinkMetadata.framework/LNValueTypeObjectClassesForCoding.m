@implementation LNValueTypeObjectClassesForCoding

void __LNValueTypeObjectClassesForCoding_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  _QWORD v14[13];

  v14[12] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v14[2] = objc_opt_class();
  v14[3] = objc_opt_class();
  v14[4] = objc_opt_class();
  v14[5] = objc_opt_class();
  v14[6] = objc_opt_class();
  v14[7] = objc_opt_class();
  v14[8] = objc_opt_class();
  v14[9] = objc_opt_class();
  v14[10] = objc_opt_class();
  v14[11] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 12, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v5), "objectClassesForCoding");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "addObjectsFromArray:", v6);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }

  v7 = objc_msgSend(v0, "copy");
  v8 = (void *)LNValueTypeObjectClassesForCoding_objectClassesForCoding;
  LNValueTypeObjectClassesForCoding_objectClassesForCoding = v7;

}

@end
