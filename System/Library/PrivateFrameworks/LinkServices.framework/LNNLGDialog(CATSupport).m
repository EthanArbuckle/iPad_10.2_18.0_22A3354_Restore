@implementation LNNLGDialog(CATSupport)

- (void)getResultWithCompletionHandler:()CATSupport
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNNLGDialog+CATSupport.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  v23 = CFSTR("locale");
  objc_msgSend(a1, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v8 = (void *)getCATClass_softClass_4525;
  v22 = getCATClass_softClass_4525;
  v9 = MEMORY[0x1E0C809B0];
  if (!getCATClass_softClass_4525)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __getCATClass_block_invoke_4526;
    v18[3] = &unk_1E45DDB30;
    v18[4] = &v19;
    __getCATClass_block_invoke_4526((uint64_t)v18);
    v8 = (void *)v20[3];
  }
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v19, 8);
  objc_msgSend(a1, "parametersXML");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localeXML");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __58__LNNLGDialog_CATSupport__getResultWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E45DCC58;
  v17 = v5;
  v13 = v5;
  LODWORD(v15) = 0;
  objc_msgSend(v10, "execute:paramsXML:localeXML:parameters:globals:callback:options:completion:", 0, v11, v12, MEMORY[0x1E0C9AA70], v7, 0, v15, v16);

}

- (id)localeXML
{
  void *v2;
  char isKindOfClass;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  id obj;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fallbackDialog");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(a1, "fallbackDialog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "fullString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "localeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForLocaleIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ln_stringByEscapingForXML");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(a1, "nlgParams");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v13, "type");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = a1;
        objc_msgSend(a1, "localeIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForLocaleIdentifier:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "ln_stringByEscapingForXML");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "format");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "value");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v13, "value");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type: %@, title: %@, value: %@, format: %@"), v14, v19, v22, v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addObject:", v23);

        a1 = v16;
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v10);
  }

  objc_msgSend(v32, "componentsJoinedByString:", CFSTR(","));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "ln_stringByEscapingForXML");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "localeIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<cat xmlns=\"urn:apple:names:siri:cat:1.0\" locale=\"%@\">\n<all>\n<dialog>nlgParams: %@</dialog>\n<dialog>fallback: %@</dialog>\n</all>\n</cat>\n"), v27, v25, v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (uint64_t)parametersXML
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<cat xmlns=\"urn:apple:names:siri:cat:1.0\">\n<parameters>\n</parameters>\n</cat>\n"));
}

@end
