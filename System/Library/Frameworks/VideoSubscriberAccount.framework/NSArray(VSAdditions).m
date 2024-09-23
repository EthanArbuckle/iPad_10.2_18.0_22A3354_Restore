@implementation NSArray(VSAdditions)

- (id)vs_componentsJoinedByAttributedString:()VSAdditions
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  objc_class *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v6 = objc_msgSend(a1, "count");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v33;
    v28 = v6 - 1;
    v12 = *MEMORY[0x1E0C99778];
    v13 = 0x1E0CB3000uLL;
    do
    {
      v14 = 0;
      v29 = v10;
      v30 = v9;
      v31 = v28 - v10;
      v15 = 0x1E0C99000uLL;
      do
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(v7);
        v16 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v17 = v11;
            v18 = v12;
            v19 = v5;
            v20 = v7;
            v21 = v4;
            v22 = *(void **)(v15 + 3488);
            v23 = (objc_class *)objc_opt_class();
            NSStringFromClass(v23);
            v24 = v13;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v22;
            v4 = v21;
            v7 = v20;
            v5 = v19;
            v12 = v18;
            v11 = v17;
            v9 = v30;
            objc_msgSend(v26, "raise:format:", v12, CFSTR("Unexpectedly, object was %@, instead of NSAttributedString."), v25);

            v13 = v24;
            v15 = 0x1E0C99000;
          }
          objc_msgSend(v5, "appendAttributedString:", v16);
        }
        else
        {
          objc_msgSend(*(id *)(v15 + 3488), "raise:format:", v12, CFSTR("Array contains an object that is not at attributed string: %@"), v16);
        }
        if (v31 != v14)
          objc_msgSend(v5, "appendAttributedString:", v4);
        ++v14;
      }
      while (v9 != v14);
      v10 = v29 + v9;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v9);
  }

  return v5;
}

@end
