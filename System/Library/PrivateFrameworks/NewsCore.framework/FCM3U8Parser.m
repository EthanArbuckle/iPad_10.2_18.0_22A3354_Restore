@implementation FCM3U8Parser

- (_QWORD)initWithData:(_QWORD *)a1
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)FCM3U8Parser;
    v5 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 3, a2);
      objc_msgSend(MEMORY[0x1E0C99DF0], "data");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)a1[4];
      a1[4] = v6;

    }
  }

  return a1;
}

- (BOOL)parseWithError:(uint64_t)a1
{
  void *v3;
  _BOOL8 v4;
  id v6;
  void *v7;
  _QWORD v9[5];

  if (!a1)
    return 0;
  v3 = *(void **)(a1 + 40);
  v4 = v3 == 0;
  if (v3)
  {
    v6 = v3;
    if (a2)
      *a2 = objc_retainAutorelease(v6);
  }
  else
  {
    v7 = *(void **)(a1 + 24);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __31__FCM3U8Parser_parseWithError___block_invoke;
    v9[3] = &unk_1E463ABE0;
    v9[4] = a1;
    objc_msgSend(v7, "enumerateByteRangesUsingBlock:", v9);
    if (objc_msgSend(*(id *)(a1 + 32), "length"))
      -[FCM3U8Parser processLine](a1);
  }

  return v4;
}

void __31__FCM3U8Parser_parseWithError___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  uint64_t v13;

  v4 = a3 + a4;
  if (a3 < a3 + a4)
  {
    v5 = a3;
    v8 = a4 + a3;
    do
    {
      v9 = *(_QWORD *)(a1 + 32);
      if (v9)
      {
        v10 = a2 + v5;
        if (v4 == v5)
        {
LABEL_9:
          objc_msgSend(*(id *)(v9 + 32), "appendBytes:length:", v10, v4 - v5);
          v11 = v4 - v5;
        }
        else
        {
          v11 = 0;
          while (1)
          {
            v12 = *(unsigned __int8 *)(v10 + v11);
            if (v12 == 10)
            {
              v13 = 1;
LABEL_11:
              objc_msgSend(*(id *)(v9 + 32), "appendBytes:length:");
              -[FCM3U8Parser processLine](v9);
              v11 += v13;
              goto LABEL_16;
            }
            if (v12 == 13)
              break;
            if (v8 - v5 == ++v11)
              goto LABEL_9;
          }
          if (v11 + 1 < v4 - v5 && *(_BYTE *)(v10 + v11 + 1) == 10)
          {
            v13 = 2;
            goto LABEL_11;
          }
          objc_msgSend(*(id *)(v9 + 32), "appendBytes:length:");
        }
      }
      else
      {
        v11 = 0;
      }
LABEL_16:
      v5 += v11;
    }
    while (v5 < v4);
  }
}

- (void)processLine
{
  id v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  void *v6;
  id WeakRetained;
  id v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  int v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  int v30;
  id v31;
  void *v32;
  id v33;

  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "length"))
    {
      v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", *(_QWORD *)(a1 + 32), 4);
      if (!objc_msgSend(v33, "length"))
      {
LABEL_43:
        v31 = *(id *)(a1 + 32);
        objc_msgSend(v31, "replaceBytesInRange:withBytes:length:", 0, objc_msgSend(v31, "length"), 0, 0);

        return;
      }
      if (!objc_msgSend(v33, "hasPrefix:", CFSTR("#EXT")))
      {
        if (objc_msgSend(v33, "hasPrefix:", CFSTR("#")))
        {
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
          objc_msgSend(WeakRetained, "parser:lineIsComment:", a1, v33);

          if (*(_BYTE *)(a1 + 8))
          {
            v8 = objc_loadWeakRetained((id *)(a1 + 16));
            v9 = objc_msgSend(v8, "parserShouldCollectLine:", a1);

            if (v9)
              -[FCM3U8Parser saveLine:](a1, v33);
          }
        }
        else
        {
          if (*(_BYTE *)(a1 + 8))
          {
            v24 = objc_loadWeakRetained((id *)(a1 + 16));
            v25 = objc_msgSend(v24, "parserShouldCollectLine:", a1);

            if (v25)
              -[FCM3U8Parser saveLine:](a1, v33);
          }
          v26 = objc_loadWeakRetained((id *)(a1 + 16));
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v33);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "parser:lineIsURL:", a1, v27);

        }
        goto LABEL_43;
      }
      v2 = v33;
      v3 = objc_msgSend(v2, "rangeOfString:", CFSTR(":"));
      if (v3 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v4 = 0;
        v5 = &stru_1E464BC40;
        v6 = v2;
LABEL_39:
        v28 = objc_loadWeakRetained((id *)(a1 + 16));
        objc_msgSend(v28, "parser:lineIsTag:value:attributeList:", a1, v6, v5, v4);

        if (*(_BYTE *)(a1 + 8))
        {
          v29 = objc_loadWeakRetained((id *)(a1 + 16));
          v30 = objc_msgSend(v29, "parserShouldCollectLine:", a1);

          if (v30)
            -[FCM3U8Parser saveLine:](a1, v2);
        }

        goto LABEL_43;
      }
      v10 = v3;
      objc_msgSend(v2, "substringToIndex:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v2, "substringFromIndex:", v10 + 1);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!-[__CFString length](v5, "length"))
      {
        v4 = 0;
        goto LABEL_39;
      }
      v5 = v5;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[__CFString length](v5, "length"))
      {
LABEL_33:
        v4 = (void *)objc_msgSend(v32, "copy");

        goto LABEL_39;
      }
      v11 = 0;
      while (1)
      {
        v12 = -[__CFString rangeOfString:options:range:](v5, "rangeOfString:options:range:", CFSTR("="), 0, v11, -[__CFString length](v5, "length") - v11);
        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_33;
        v13 = v12;
        -[__CFString substringWithRange:](v5, "substringWithRange:", v11, v12 - v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v13 + 1;
        v16 = ~v13;
        v17 = -[__CFString length](v5, "length") + ~v13;
        v18 = -[__CFString rangeOfString:options:range:](v5, "rangeOfString:options:range:", CFSTR("\"), 0, v13 + 1, v17);
        v19 = -[__CFString rangeOfString:options:range:](v5, "rangeOfString:options:range:", CFSTR(","), 0, v15, v17);
        v20 = v19;
        if (v18 == 0x7FFFFFFFFFFFFFFFLL)
          break;
        if (v19 != 0x7FFFFFFFFFFFFFFFLL && v19 <= v18)
          goto LABEL_23;
        v22 = -[__CFString rangeOfString:options:range:](v5, "rangeOfString:options:range:", CFSTR("\"), 0, v18 + 1, -[__CFString length](v5, "length") - (v18 + 1));
        if (v22 == 0x7FFFFFFFFFFFFFFFLL)
        {
          -[__CFString substringFromIndex:](v5, "substringFromIndex:", v18 + 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = v22;
          -[__CFString substringWithRange:](v5, "substringWithRange:", v18 + 1, v22 + ~v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[__CFString rangeOfString:options:range:](v5, "rangeOfString:options:range:", CFSTR(","), 0, v23 + 1, -[__CFString length](v5, "length") - (v23 + 1));
        }
        if (v20 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_28;
LABEL_30:
        v11 = v20 + 1;
        if (v14)
          goto LABEL_31;
LABEL_32:

        if (v11 >= -[__CFString length](v5, "length"))
          goto LABEL_33;
      }
      if (v19 == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[__CFString substringFromIndex:](v5, "substringFromIndex:", v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:
        v11 = -[__CFString length](v5, "length");
        if (!v14)
          goto LABEL_32;
LABEL_31:
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v21, v14);
        goto LABEL_32;
      }
LABEL_23:
      -[__CFString substringWithRange:](v5, "substringWithRange:", v15, v19 + v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    if (*(_BYTE *)(a1 + 8))
      -[FCM3U8Parser saveLine:](a1, &stru_1E464BC40);
  }
}

- (uint64_t)saveLine:(uint64_t)a1
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  const char *v12;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v5;

  }
  v7 = *(void **)(a1 + 48);
  v8 = objc_retainAutorelease(v4);
  v9 = v7;
  v10 = objc_msgSend(v8, "UTF8String");
  v11 = objc_retainAutorelease(v8);
  v12 = (const char *)objc_msgSend(v11, "UTF8String");

  objc_msgSend(v9, "appendBytes:length:", v10, strlen(v12));
  return objc_msgSend(*(id *)(a1 + 48), "appendBytes:length:", "\n", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectedData, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_bytes, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
