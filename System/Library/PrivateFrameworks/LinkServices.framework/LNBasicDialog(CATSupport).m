@implementation LNBasicDialog(CATSupport)

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
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNBasicDialog+CATSupport.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  v24 = CFSTR("locale");
  objc_msgSend(a1, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v8 = (void *)getCATClass_softClass;
  v23 = getCATClass_softClass;
  v9 = MEMORY[0x1E0C809B0];
  if (!getCATClass_softClass)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __getCATClass_block_invoke;
    v19[3] = &unk_1E45DDB30;
    v19[4] = &v20;
    __getCATClass_block_invoke((uint64_t)v19);
    v8 = (void *)v21[3];
  }
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v20, 8);
  objc_msgSend(a1, "parametersXML");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localeXML");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __60__LNBasicDialog_CATSupport__getResultWithCompletionHandler___block_invoke;
  v17[3] = &unk_1E45DCC58;
  v18 = v5;
  v14 = v5;
  LODWORD(v16) = 0;
  objc_msgSend(v10, "execute:paramsXML:localeXML:parameters:globals:callback:options:completion:", 0, v11, v12, v13, v7, 0, v16, v17);

}

- (id)localeXML
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "fullString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedKeyWithParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "supportingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedKeyWithParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<full>%@</full><supporting>%@</supporting>"), v3, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v3;
  }
  v7 = v6;
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "localeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<cat xmlns=\"urn:apple:names:siri:cat:1.0\" locale=\"%@\">\n<all>\n<dialog>%@</dialog>\n</all>\n</cat>\n"), v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)parametersXML
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "parameterDefinitions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR("\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("<cat xmlns=\"urn:apple:names:siri:cat:1.0\">\n<parameters>\n%@\n</parameters>\n</cat>\n"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)parameterDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a1, "fullString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parameterDefinitions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "supportingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameterDefinitions");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = v5;
  else
    v7 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)parameters
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a1, "fullString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parametersForCAT");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "supportingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parametersForCAT");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = v5;
  else
    v7 = MEMORY[0x1E0C9AA70];
  objc_msgSend(v3, "if_dictionaryByAddingEntriesFromDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
