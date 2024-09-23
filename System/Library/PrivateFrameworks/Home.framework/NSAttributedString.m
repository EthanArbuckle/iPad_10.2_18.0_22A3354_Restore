@implementation NSAttributedString

uint64_t __84__NSAttributedString_HFAdditions__hf_attributedStringWithDefaultAttributes_inRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a2, a3, a4);
}

void __84__NSAttributedString_HFAdditions__hf_attributedStringWithDefaultAttributes_inRange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v15, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithConfiguration:", *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setImage:", v9);

    objc_msgSend(*(id *)(a1 + 40), "attributesAtIndex:effectiveRange:", a3, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    v12 = *MEMORY[0x1E0CEA0D0];
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA0D0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(v14, "setLineBreakMode:", 1);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, v12);
    objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v11, a3, a4);

  }
}

void __69__NSAttributedString_HFAdditions__hf_loadFromHTMLWithString_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CB3498];
  v5 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__NSAttributedString_HFAdditions__hf_loadFromHTMLWithString_options___block_invoke_2;
  v7[3] = &unk_1EA735900;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "loadFromHTMLWithString:options:completionHandler:", v5, MEMORY[0x1E0C9AA70], v7);

}

void __69__NSAttributedString_HFAdditions__hf_loadFromHTMLWithString_options___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  if (v7)
  {
    HFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "-[NSAttributedString loadFromHTMLWithString:options:completionHandler:]: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", v6, v7);

}

id __78__NSAttributedString_HFAdditions__hf_safeAttributedStringWithHTML_attributes___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, uint64_t, uint64_t);
  void *v24;
  id v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  v4 = objc_msgSend(v3, "length");
  objc_msgSend(v3, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeOfString:options:range:", CFSTR("\u2028"), 0, 0, v4);
  v8 = v7;

  while (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "replaceCharactersInRange:withString:", v6, v8, CFSTR("\n"));
    v9 = v6 + 1;
    if (v4 == v9)
      break;
    objc_msgSend(v3, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v10, "rangeOfString:options:range:", CFSTR("\u2028"), 0, v9, v4 - v9);
    v8 = v11;

  }
  v12 = objc_alloc(MEMORY[0x1E0C99E20]);
  v27[0] = *MEMORY[0x1E0CEA0D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithArray:", v13);

  v15 = objc_msgSend(v3, "length");
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __78__NSAttributedString_HFAdditions__hf_safeAttributedStringWithHTML_attributes___block_invoke_2;
  v24 = &unk_1EA735928;
  v16 = v3;
  v25 = v16;
  v17 = v14;
  v26 = v17;
  objc_msgSend(v16, "enumerateAttributesInRange:options:usingBlock:", 0, v15, 0, &v21);
  v18 = *(_QWORD *)(a1 + 32);
  if (v18)
    objc_msgSend(v16, "addAttributes:range:", v18, 0, objc_msgSend(v16, "length", v21, v22, v23, v24, v25));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v16, v21, v22, v23, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __78__NSAttributedString_HFAdditions__hf_safeAttributedStringWithHTML_attributes___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = *MEMORY[0x1E0CEA0C0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "isEqualToString:", v10))
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "host");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
            objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", v12, a3, a4);

        }
        else if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v12) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", v12, a3, a4);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

uint64_t __78__NSAttributedString_HFAdditions__hf_safeAttributedStringWithHTML_attributes___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", a2);
}

uint64_t __114__NSAttributedString_HFStringGeneratoreAdditions___synthesizeAttributedSubstringFromRange_usingDefaultAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a2, a3, a4);
}

@end
