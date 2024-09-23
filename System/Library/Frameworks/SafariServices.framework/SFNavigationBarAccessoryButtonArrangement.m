@implementation SFNavigationBarAccessoryButtonArrangement

- (_QWORD)initWithLeadingButtonTypes:(void *)a3 trailingButtonTypes:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)SFNavigationBarAccessoryButtonArrangement;
    a1 = objc_msgSendSuper2(&v15, sel_init);
    if (a1)
    {
      v7 = objc_msgSend(v5, "copy");
      v8 = (void *)a1[3];
      a1[3] = v7;

      v9 = objc_msgSend(v6, "copy");
      v10 = (void *)a1[2];
      a1[2] = v9;

      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count") + objc_msgSend(v5, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObjectsFromArray:", v5);
      objc_msgSend(v11, "addObjectsFromArray:", v6);
      v12 = objc_msgSend(v11, "copy");
      v13 = (void *)a1[1];
      a1[1] = v12;

      a1 = a1;
    }
  }

  return a1;
}

- (uint64_t)containsButtonType:(uint64_t)result
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (result)
  {
    v2 = *(void **)(result + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "containsObject:", v3);

    return v4;
  }
  return result;
}

- (void)enumerateButtonTypesFromEdge:(uint64_t)a3 withLayoutDirection:(void *)a4 usingBlock:
{
  id v7;
  BOOL v8;
  int v9;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a4;
  if (a1)
  {
    v8 = a2 == 2 && a3 == 0;
    v9 = v8;
    if (a2 == 8 && a3 == 1)
      v9 = 1;
    v8 = v9 == 0;
    v11 = 16;
    if (!v8)
      v11 = 24;
    v12 = *(void **)(a1 + v11);
    v15[1] = 3221225472;
    v15[2] = __105__SFNavigationBarAccessoryButtonArrangement_enumerateButtonTypesFromEdge_withLayoutDirection_usingBlock___block_invoke;
    v15[3] = &unk_1E4AC1770;
    v14 = v7;
    v15[0] = MEMORY[0x1E0C809B0];
    v16 = v7;
    v13 = v12;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);

    v7 = v14;
  }

}

uint64_t __105__SFNavigationBarAccessoryButtonArrangement_enumerateButtonTypesFromEdge_withLayoutDirection_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "integerValue"), a4);
}

- (id)description
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const __CFString *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("("));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = self->_leadingButtonTypes;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v8), "integerValue");
        v10 = CFSTR("stop");
        if (v9 <= 3)
          v10 = off_1E4AC17D0[v9];
        objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendString:", CFSTR("..."));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSArray reverseObjectEnumerator](self->_trailingButtonTypes, "reverseObjectEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "integerValue");
        v17 = CFSTR("stop");
        if (v16 <= 3)
          v17 = off_1E4AC17D0[v16];
        objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v13);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingButtonTypes, 0);
  objc_storeStrong((id *)&self->_trailingButtonTypes, 0);
  objc_storeStrong((id *)&self->_allButtonTypes, 0);
}

@end
