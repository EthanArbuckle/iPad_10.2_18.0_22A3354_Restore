@implementation LNLocalizedStringResourceDialog(CATSupport)

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
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNLocalizedStringResourceDialog+CATSupport.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

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
  v8 = (void *)getCATClass_softClass_5584;
  v22 = getCATClass_softClass_5584;
  v9 = MEMORY[0x1E0C809B0];
  if (!getCATClass_softClass_5584)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __getCATClass_block_invoke_5585;
    v18[3] = &unk_1E45DDB30;
    v18[4] = &v19;
    __getCATClass_block_invoke_5585((uint64_t)v18);
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
  v16[2] = __78__LNLocalizedStringResourceDialog_CATSupport__getResultWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E45DCC58;
  v17 = v5;
  v13 = v5;
  LODWORD(v15) = 0;
  objc_msgSend(v10, "execute:paramsXML:localeXML:parameters:globals:callback:options:completion:", 0, v11, v12, MEMORY[0x1E0C9AA70], v7, 0, v15, v16);

}

- (id)localeXML
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(a1, "fullString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForLocaleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ln_stringByEscapingForXML");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "supportingString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForLocaleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ln_stringByEscapingForXML");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<full>%@</full><supporting>%@</supporting>"), v5, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v5;
  }
  v11 = v10;
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "localeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<cat xmlns=\"urn:apple:names:siri:cat:1.0\" locale=\"%@\">\n<all>\n<dialog>%@</dialog>\n</all>\n</cat>\n"), v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (uint64_t)parametersXML
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<cat xmlns=\"urn:apple:names:siri:cat:1.0\">\n<parameters>\n</parameters>\n</cat>\n"));
}

@end
