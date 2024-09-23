@implementation EFHTMLUtilities

+ (id)_cssSnippetFromDictionary:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SEL v11;
  id v12;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__EFHTMLUtilities__cssSnippetFromDictionary___block_invoke;
  v9[3] = &unk_1E62A6040;
  v11 = a2;
  v12 = a1;
  v7 = v6;
  v10 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

void __45__EFHTMLUtilities__cssSnippetFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), CFSTR("EFHTMLUtilities.m"), 17, CFSTR("values must be string types"));

  }
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@: %@;"), v7, v5);

}

+ (id)htmlSnippetWithTag:(id)a3 includeTrailingTag:(BOOL)a4 attributes:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  id v18;
  id v19;
  SEL v20;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __68__EFHTMLUtilities_htmlSnippetWithTag_includeTrailingTag_attributes___block_invoke;
  v17 = &unk_1E62A6068;
  v12 = v11;
  v18 = v12;
  v19 = a1;
  v20 = a2;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", &v14);
  if (v6)
    objc_msgSend(v12, "appendFormat:", CFSTR("></%@"), v9, v14, v15, v16, v17);
  objc_msgSend(v12, "appendString:", CFSTR(">"));

  return v12;
}

void __68__EFHTMLUtilities_htmlSnippetWithTag_includeTrailingTag_attributes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v5, "ef_stringByEscapingForXML");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" %@=\"%@\"), v10, v7);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(" %@=\"%@\"), v10, v5);
      goto LABEL_6;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "_cssSnippetFromDictionary:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendFormat:", CFSTR(" %@=\"%@\"), v10, v7);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = *(void **)(a1 + 32);
        objc_msgSend(v5, "absoluteString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appendFormat:", CFSTR(" %@=\"%@\"), v10, v7);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("EFHTMLUtilities.m"), 35, CFSTR("unexpected value in attributes dictionary at key %@: %@"), v10, v5);
      }
    }
  }

LABEL_6:
}

@end
