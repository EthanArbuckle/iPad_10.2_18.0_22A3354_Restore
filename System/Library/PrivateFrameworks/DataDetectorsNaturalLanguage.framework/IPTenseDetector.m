@implementation IPTenseDetector

+ (int64_t)tenseOfString:(id)a3 languageID:(id)a4
{
  id v5;
  id v6;
  int64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t *v18;
  _QWORD v19[3];
  char v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "hasPrefix:", CFSTR("zh")))
  {
    if (objc_msgSend(v6, "hasPrefix:", CFSTR("ja")))
    {
      if ((objc_msgSend(v5, "containsString:", CFSTR("だった")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("でした")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("ました")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("あった")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("いた")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("した")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("おられた")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("くれた")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("された")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("されてた")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("されていた")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("した")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("ました")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("していた")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("してた")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("とった")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("なった")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("会った")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("入った")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("出た")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("出られた")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("思った")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("終えた")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("終わった")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("行った")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("見せた")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("見た")) & 1) == 0
        && (objc_msgSend(v5, "containsString:", CFSTR("かった")) & 1) == 0)
      {
        if ((objc_msgSend(v5, "containsString:", CFSTR("です")) & 1) != 0
          || (objc_msgSend(v5, "containsString:", CFSTR("にしてます")) & 1) != 0)
        {
          goto LABEL_8;
        }
        v12 = CFSTR("にしています");
        goto LABEL_44;
      }
LABEL_38:
      v7 = 0;
      goto LABEL_49;
    }
    if (tenseOfString_languageID__onceToken == -1)
    {
      if (!v5)
        goto LABEL_48;
    }
    else
    {
      dispatch_once(&tenseOfString_languageID__onceToken, &__block_literal_global_1);
      if (!v5)
        goto LABEL_48;
    }
    if (objc_msgSend(v5, "length"))
    {
      v8 = (id)tenseOfString_languageID__tagger;
      objc_sync_enter(v8);
      objc_msgSend((id)tenseOfString_languageID__tagger, "setString:", v5);
      v23 = 0;
      v24 = &v23;
      v25 = 0x2020000000;
      v26 = 3;
      v21[0] = 0;
      v21[1] = v21;
      v21[2] = 0x3032000000;
      v21[3] = __Block_byref_object_copy__0;
      v21[4] = __Block_byref_object_dispose__0;
      v22 = 0;
      v19[0] = 0;
      v19[1] = v19;
      v19[2] = 0x2020000000;
      v20 = 0;
      v9 = (void *)tenseOfString_languageID__tagger;
      v10 = objc_msgSend(v5, "length");
      v11 = *MEMORY[0x24BDD19E0];
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __44__IPTenseDetector_tenseOfString_languageID___block_invoke_121;
      v14[3] = &unk_24DAA51E0;
      v15 = v5;
      v16 = v21;
      v17 = v19;
      v18 = &v23;
      objc_msgSend(v9, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v10, v11, 6, v14);
      objc_msgSend((id)tenseOfString_languageID__tagger, "setString:", &stru_24DAA6418);
      v7 = v24[3];

      _Block_object_dispose(v19, 8);
      _Block_object_dispose(v21, 8);

      _Block_object_dispose(&v23, 8);
      objc_sync_exit(v8);

      goto LABEL_49;
    }
LABEL_48:
    v7 = 3;
    goto LABEL_49;
  }
  if ((objc_msgSend(v5, "containsString:", CFSTR("了")) & 1) != 0
    || (objc_msgSend(v5, "containsString:", CFSTR("过节")) & 1) == 0
    && (objc_msgSend(v5, "containsString:", CFSTR("过")) & 1) != 0
    || (objc_msgSend(v5, "containsString:", CFSTR("過節")) & 1) == 0
    && (objc_msgSend(v5, "containsString:", CFSTR("過")) & 1) != 0)
  {
    goto LABEL_38;
  }
  if ((objc_msgSend(v5, "containsString:", CFSTR("将")) & 1) != 0)
  {
LABEL_8:
    v7 = 2;
    goto LABEL_49;
  }
  v12 = CFSTR("要");
LABEL_44:
  if (objc_msgSend(v5, "containsString:", v12))
    v7 = 2;
  else
    v7 = 3;
LABEL_49:

  return v7;
}

void __44__IPTenseDetector_tenseOfString_languageID___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc(MEMORY[0x24BDD1638]);
  v4[0] = *MEMORY[0x24BDD19E0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithTagSchemes:options:", v1, 6);
  v3 = (void *)tenseOfString_languageID__tagger;
  tenseOfString_languageID__tagger = v2;

}

void __44__IPTenseDetector_tenseOfString_languageID___block_invoke_121(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  void *v12;
  void *v13;
  int v14;
  id v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  id v20;

  v20 = a2;
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isEqualToString:", CFSTR("CS"));
  v15 = v20;
  if (!v14 || (v16 = objc_msgSend(v20, "isEqualToString:", CFSTR("VBN")), v15 = v20, (v16 & 1) == 0))
  {
    if (!objc_msgSend(&unk_24DB09078, "containsObject:", v15))
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
        && ((objc_msgSend(v20, "isEqualToString:", CFSTR("VBP")) & 1) != 0
         || objc_msgSend(v20, "isEqualToString:", CFSTR("VBZ"))))
      {
        goto LABEL_12;
      }
      if (!objc_msgSend(&unk_24DB090A8, "containsObject:", v20))
      {
        if (!objc_msgSend(&unk_24DB090C0, "containsObject:", v20))
          goto LABEL_18;
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v18 = 2;
        goto LABEL_17;
      }
LABEL_14:
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v18 = 1;
LABEL_17:
      *(_QWORD *)(v17 + 24) = v18;
      goto LABEL_18;
    }
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isEqualToString:", CFSTR("RB"))&& objc_msgSend(v20, "isEqualToString:", CFSTR("VBZ"))&& !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    goto LABEL_14;
  }
  if ((objc_msgSend(&unk_24DB09090, "containsObject:", v13) & 1) == 0)
  {
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    *a7 = 1;
  }
LABEL_18:
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v19 = objc_msgSend(&unk_24DB090D8, "containsObject:", v13);
    if (!v19)
      goto LABEL_23;
    if ((objc_msgSend(v20, "isEqualToString:", CFSTR("VBP")) & 1) == 0)
    {
      LOBYTE(v19) = objc_msgSend(v20, "isEqualToString:", CFSTR("VBS"));
      goto LABEL_23;
    }
  }
  LOBYTE(v19) = 1;
LABEL_23:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v19;

}

@end
