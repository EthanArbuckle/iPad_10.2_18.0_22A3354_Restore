@implementation LTParagraphTranslationRequest

void __72___LTParagraphTranslationRequest__startTranslationWithTextService_done___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v6);

  }
}

void __72___LTParagraphTranslationRequest__startTranslationWithTextService_done___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = *((_QWORD *)WeakRetained + 16);
    if (v8)
      (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __54___LTParagraphTranslationRequest_translationParagraph__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _LTTranslationSpan *v9;
  void *v10;
  _LTTranslationSpan *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v3 = a2;
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v9 = [_LTTranslationSpan alloc];
    objc_msgSend(v3, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_LTTranslationSpan initWithIdentifier:range:](v9, "initWithIdentifier:range:", v10, v8, v7);

    -[_LTTranslationSpan setShouldTranslate:](v11, "setShouldTranslate:", objc_msgSend(v3, "shouldTranslate"));
    objc_msgSend(v3, "metaInfo");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      v14 = (void *)MEMORY[0x24BDD1608];
      objc_msgSend(v3, "metaInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = objc_msgSend(v14, "isValidJSONObject:", v15);

      if ((_DWORD)v14)
      {
        v16 = (void *)MEMORY[0x24BDD1608];
        objc_msgSend(v3, "metaInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        objc_msgSend(v16, "dataWithJSONObject:options:error:", v17, 0, &v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v22;

        if (!v19)
          -[_LTTranslationSpan setMetaInfoData:](v11, "setMetaInfoData:", v18);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
    v20 = *(void **)(a1 + 40);
    objc_msgSend(v3, "text");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "appendString:", v21);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v7;
  }

}

@end
