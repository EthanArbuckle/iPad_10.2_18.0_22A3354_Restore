@implementation NSStringFromBLSBacklightChangeEvents

void __NSStringFromBLSBacklightChangeEvents_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  const __CFString *v5;
  unint64_t v6;
  const __CFString *v7;
  unint64_t v8;
  const __CFString *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD v14[3];
  char v15;

  v3 = a2;
  objc_msgSend(v3, "appendFormat:", CFSTR("(%u){ "), *(_QWORD *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 56);
  if (v4 == *(_QWORD *)(a1 + 64))
  {
    v5 = CFSTR("<->");
  }
  else
  {
    v6 = v4 - 1;
    if (v6 > 2)
      v7 = CFSTR("Off");
    else
      v7 = off_1E621A5D0[v6];
    objc_msgSend(v3, "appendString:", v7);
    v5 = CFSTR("->");
  }
  objc_msgSend(v3, "appendString:", v5);
  v8 = *(_QWORD *)(a1 + 64) - 1;
  if (v8 > 2)
    v9 = CFSTR("Off");
  else
    v9 = off_1E621A5D0[v8];
  objc_msgSend(v3, "appendString:", v9);
  objc_msgSend(v3, "appendString:", CFSTR(": "));
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __NSStringFromBLSBacklightChangeEvents_block_invoke_2;
  v11[3] = &unk_1E621A510;
  v10 = *(void **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = v14;
  objc_msgSend(v10, "appendCustomFormatWithName:block:", 0, v11);
  objc_msgSend(v3, "appendString:", CFSTR(" } "));

  _Block_object_dispose(v14, 8);
}

void __NSStringFromBLSBacklightChangeEvents_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7), "changeRequest");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        if (*(_BYTE *)(v9 + 24))
          *(_BYTE *)(v9 + 24) = 0;
        else
          objc_msgSend(v3, "appendString:", CFSTR(", "));
        objc_msgSend(v3, "appendString:", CFSTR("\"));
        objc_msgSend(v8, "explanation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v10);

        objc_msgSend(v3, "appendString:", CFSTR("\"("));
        NSStringFromBLSBacklightChangeSourceEvent(objc_msgSend(v8, "sourceEvent"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v11);

        objc_msgSend(v3, "appendString:", CFSTR(")"));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

void __NSStringFromBLSBacklightChangeEvents_block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  objc_msgSend(v2, "nextObject");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v11[5])
  {
    v3 = MEMORY[0x1E0C809B0];
    do
    {
      v4 = *(void **)(a1 + 40);
      v6[0] = v3;
      v6[1] = 3221225472;
      v6[2] = __NSStringFromBLSBacklightChangeEvents_block_invoke_43;
      v6[3] = &unk_1E621A588;
      v9 = &v10;
      v5 = v4;
      v7 = v5;
      v8 = v2;
      objc_msgSend(v5, "appendCustomFormatWithName:block:", 0, v6);

    }
    while (v11[5]);
  }
  _Block_object_dispose(&v10, 8);

}

void __NSStringFromBLSBacklightChangeEvents_block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  __int128 v11;
  id v12;
  _QWORD v13[4];
  __int128 v14;
  uint64_t v15;

  v12 = a2;
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "previousState");
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "state");
  if (v3 == v4)
  {
    v5 = CFSTR("<->");
    v6 = v12;
  }
  else
  {
    if ((unint64_t)(v3 - 1) > 2)
      v7 = CFSTR("Off");
    else
      v7 = off_1E621A5D0[v3 - 1];
    objc_msgSend(v12, "appendString:", v7);
    v6 = v12;
    v5 = CFSTR("->");
  }
  objc_msgSend(v6, "appendString:", v5);
  if ((unint64_t)(v4 - 1) > 2)
    v8 = CFSTR("Off");
  else
    v8 = off_1E621A5D0[v4 - 1];
  objc_msgSend(v12, "appendString:", v8);
  objc_msgSend(v12, "appendString:", CFSTR(": "));
  v9 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __NSStringFromBLSBacklightChangeEvents_block_invoke_2_44;
  v13[3] = &unk_1E621A560;
  v11 = *(_OWORD *)(a1 + 40);
  v10 = (id)v11;
  v14 = v11;
  v15 = v4;
  objc_msgSend(v9, "appendCustomFormatWithName:block:", 0, v13);

}

void __NSStringFromBLSBacklightChangeEvents_block_invoke_2_44(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v3)
  {
    v4 = 1;
    while (1)
    {
      objc_msgSend(v3, "changeRequest");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v4 & 1) == 0)
        objc_msgSend(v12, "appendString:", CFSTR(", "));
      objc_msgSend(v12, "appendString:", CFSTR("\"));
      objc_msgSend(v5, "explanation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendString:", v6);

      objc_msgSend(v12, "appendString:", CFSTR("\"("));
      NSStringFromBLSBacklightChangeSourceEvent(objc_msgSend(v5, "sourceEvent"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendString:", v7);

      objc_msgSend(v12, "appendString:", CFSTR(")"));
      objc_msgSend(*(id *)(a1 + 32), "nextObject");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (!v11 || objc_msgSend(v11, "state") != *(_QWORD *)(a1 + 48))
        break;

      v4 = 0;
      v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (!v3)
        goto LABEL_10;
    }

  }
LABEL_10:

}

@end
